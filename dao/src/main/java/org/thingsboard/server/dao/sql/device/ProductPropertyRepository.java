package org.thingsboard.server.dao.sql.device;

import org.springframework.data.domain.Example;
import org.springframework.data.jpa.repository.JpaRepository;
import org.thingsboard.server.common.data.device.property.ProductProperty;
import org.thingsboard.server.dao.model.sql.DeviceEntity;
import org.thingsboard.server.dao.model.sql.ProductPropertyEntity;

import java.util.List;
import java.util.UUID;

/**
 * @author Houyong Yang
 * since 2022/6/19 16:41
 */
public interface ProductPropertyRepository extends JpaRepository<ProductPropertyEntity, UUID> {
    List<ProductPropertyEntity> findAllByDeviceProfileId(UUID id);
}
