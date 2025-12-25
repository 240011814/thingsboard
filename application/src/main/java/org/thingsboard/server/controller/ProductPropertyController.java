package org.thingsboard.server.controller;

import io.swagger.v3.oas.annotations.Parameter;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.thingsboard.server.common.data.device.property.ProductProperty;
import org.thingsboard.server.common.data.exception.ThingsboardException;
import org.thingsboard.server.common.data.id.DeviceProfileId;
import org.thingsboard.server.common.data.id.PropertyId;
import org.thingsboard.server.queue.util.TbCoreComponent;
import org.thingsboard.server.service.security.permission.Operation;

import java.util.List;

import static org.thingsboard.server.controller.ControllerConstants.*;

/**
 * @author Houyong Yang
 * since 2022/6/19 13:27
 */
@RestController
@TbCoreComponent
@RequestMapping("/api")
@RequiredArgsConstructor
@Slf4j
public class ProductPropertyController extends  BaseController {



    @PreAuthorize("hasAnyAuthority('TENANT_ADMIN','CUSTOMER_USER')")
    @RequestMapping(value = "/property/{propertyId}", method = RequestMethod.GET)
    @ResponseBody
    public ProductProperty getPropertyById(@Parameter(description = DEVICE_ID_PARAM_DESCRIPTION)
                                @PathVariable("propertyId") String propertyId) throws ThingsboardException {
        checkParameter("propertyId", propertyId);
        try {
            PropertyId property = new PropertyId(toUUID(propertyId));
            return checkPropertyId(property, Operation.READ);
        } catch (Exception e) {
            throw handleException(e);
        }
    }


    @PreAuthorize("hasAnyAuthority('TENANT_ADMIN')")
    @RequestMapping(value = "/property", method = RequestMethod.POST)
    @ResponseBody
    public ProductProperty saveProperty(@Parameter(description = "A JSON value representing the device.") @RequestBody ProductProperty productProperty) throws ThingsboardException {
        boolean created = productProperty.getId() == null;
        try {
            productProperty.setTenantId(getCurrentUser().getTenantId());

            ProductProperty oldProperty = null;
            if (!created) {
                oldProperty = checkPropertyId(productProperty.getId(), Operation.WRITE);
            } else {
            }
            ProductProperty savedProperty = checkNotNull(productPropertyService.save(getCurrentUser().getTenantId(), productProperty));
            return savedProperty;
        } catch (Exception e) {
            throw handleException(e);
        }
    }



    @PreAuthorize("hasAuthority('TENANT_ADMIN')")
    @RequestMapping(value = "/property/{propertyId}", method = RequestMethod.DELETE)
    @ResponseStatus(value = HttpStatus.OK)
    public void deleteDevice(@Parameter(description = DEVICE_ID_PARAM_DESCRIPTION)
                             @PathVariable("propertyId") String strDeviceId) throws ThingsboardException {
        checkParameter("propertyId", strDeviceId);
        try {
            PropertyId propertyId = new PropertyId(toUUID(strDeviceId));
            ProductProperty productProperty = checkPropertyId(propertyId, Operation.DELETE);

            productPropertyService.deleteProductProfile(getTenantId(), propertyId);

        } catch (Exception e) {
            throw handleException(e);
        }
    }


    @PreAuthorize("hasAnyAuthority('SYS_ADMIN', 'TENANT_ADMIN', 'CUSTOMER_USER')")
    @RequestMapping(value = "/property/list/{entityId}", method = RequestMethod.GET)
    @ResponseBody
    public List<ProductProperty> getPropertyList(
            @Parameter(description = ENTITY_ID_PARAM_DESCRIPTION, required = true)
            @PathVariable("entityId") String strEntityId
    ) throws ThingsboardException {
        checkParameter("EntityId", strEntityId);
        DeviceProfileId deviceProfileId = new DeviceProfileId(toUUID(strEntityId));
        try {
            return checkNotNull(productPropertyService.findAllByDeviceProfileId(deviceProfileId));
        } catch (Exception e) {
            throw handleException(e);
        }
    }
}
