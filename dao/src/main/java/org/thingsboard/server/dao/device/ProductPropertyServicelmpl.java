package org.thingsboard.server.dao.device;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.thingsboard.server.common.data.device.property.ProductProperty;
import org.thingsboard.server.common.data.id.DeviceProfileId;
import org.thingsboard.server.common.data.id.PropertyId;
import org.thingsboard.server.common.data.id.TenantId;
import org.thingsboard.server.dao.entity.AbstractEntityService;

import java.util.List;

/**
 * @author Houyong Yang
 * since 2022/6/19 13:20
 */
@Service
@Slf4j
public class ProductPropertyServicelmpl  implements ProductPropertyService {
    @Autowired
    ProductPropertyDao productPropertyDao;

    @Override
    public ProductProperty save(TenantId tenantId, ProductProperty productProperty) {
        return productPropertyDao.save(tenantId, productProperty);
    }


    @Override
    public ProductProperty findByPropertyId(TenantId tenantId, PropertyId propertyId) {
        return productPropertyDao.findById(tenantId, propertyId.getId());
    }

    @Override
    public void deleteProductProfile(TenantId tenantId, PropertyId propertyId) {
        productPropertyDao.removeById(tenantId, propertyId.getId());
    }


    @Override
    public List<ProductProperty> findAllByDeviceProfileId(DeviceProfileId deviceProfileId) {
        return productPropertyDao.findAllByDeviceprofileId(deviceProfileId);
    }
}
