package org.thingsboard.server.dao.device;

import org.thingsboard.server.common.data.Device;
import org.thingsboard.server.common.data.device.property.ProductProperty;
import org.thingsboard.server.common.data.id.DeviceProfileId;
import org.thingsboard.server.dao.Dao;
import org.thingsboard.server.dao.TenantEntityDao;

import java.util.List;

/**
 * @author Houyong Yang
 * since 2022/6/19 13:12
 */
public interface ProductPropertyDao extends Dao<ProductProperty>, TenantEntityDao {
    List<ProductProperty> findAllByDeviceprofileId(DeviceProfileId deviceProfileId);
}
