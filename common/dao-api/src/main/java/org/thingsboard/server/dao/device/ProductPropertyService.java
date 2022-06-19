package org.thingsboard.server.dao.device;

import org.thingsboard.server.common.data.device.property.ProductProperty;
import org.thingsboard.server.common.data.id.DeviceProfileId;
import org.thingsboard.server.common.data.id.PropertyId;
import org.thingsboard.server.common.data.id.TenantId;

import java.util.List;

/**
 * @author Houyong Yang
 * since 2022/6/19 13:16
 */
public interface ProductPropertyService {
    ProductProperty save(TenantId tenantId ,ProductProperty productProperty);

    ProductProperty findByPropertyId(TenantId tenantId ,PropertyId propertyId );

    void deleteProductProfile(TenantId tenantId ,PropertyId propertyId);

    List<ProductProperty> findAllByDeviceProfileId(DeviceProfileId deviceProfileId);

}
