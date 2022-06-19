package org.thingsboard.server.dao.sql.device;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Component;
import org.thingsboard.server.common.data.device.property.ProductProperty;
import org.thingsboard.server.common.data.id.DeviceProfileId;
import org.thingsboard.server.common.data.id.TenantId;
import org.thingsboard.server.dao.DaoUtil;
import org.thingsboard.server.dao.device.ProductPropertyDao;
import org.thingsboard.server.dao.model.sql.ProductPropertyEntity;
import org.thingsboard.server.dao.sql.JpaAbstractDao;


import java.util.List;
import java.util.UUID;

/**
 * @author Houyong Yang
 * since 2022/6/19 17:11
 */
@Component
public class JpaProductPropertyDao extends JpaAbstractDao<ProductPropertyEntity, ProductProperty> implements ProductPropertyDao {

    @Autowired
    ProductPropertyRepository productPropertyRepository;

    @Override
    public Long countByTenantId(TenantId tenantId) {
        return 0L;
    }

    @Override
    protected Class<ProductPropertyEntity> getEntityClass() {
        return ProductPropertyEntity.class;
    }

    @Override
    protected CrudRepository<ProductPropertyEntity, UUID> getCrudRepository() {
        return productPropertyRepository;
    }

    @Override
    public List<ProductProperty> findAllByDeviceprofileId(DeviceProfileId deviceProfileId) {
        return DaoUtil.convertDataList(productPropertyRepository.findAllByDeviceProfileId(deviceProfileId.getId())) ;
    }
}
