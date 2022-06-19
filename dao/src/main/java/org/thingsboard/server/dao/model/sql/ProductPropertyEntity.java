package org.thingsboard.server.dao.model.sql;

import com.fasterxml.jackson.databind.JsonNode;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.hibernate.annotations.Type;
import org.hibernate.annotations.TypeDef;
import org.thingsboard.common.util.JacksonUtil;
import org.thingsboard.server.common.data.device.property.ProductProperty;
import org.thingsboard.server.common.data.id.*;
import org.thingsboard.server.dao.model.BaseEntity;
import org.thingsboard.server.dao.model.BaseSqlEntity;
import org.thingsboard.server.dao.util.mapping.JsonBinaryType;
import javax.persistence.*;
import java.util.UUID;
import static org.thingsboard.server.dao.model.ModelConstants.*;


/**
 * @author Houyong Yang
 * since 2022/6/19 16:43
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Entity
@TypeDef(name = "jsonb", typeClass = JsonBinaryType.class)
@Table(name = "product_property")
public class ProductPropertyEntity extends BaseSqlEntity<ProductProperty> implements BaseEntity<ProductProperty> {
    @Column(name = "tenant_id")
    private UUID tenantId;

    @Column(name = "name")
    private String name;

    @Column(name = "key")
    private String key;

    @Column(name = "read_mode")
    private String readMode;

    @Column(name = "img_url")
    private String imgUrl;

    @Column(name = "data_type")
    private String dataType;

    @Column(name = "property_group")
    private String group;

    @Column(name = "description")
    private String description;

    @Column(name = "collect_type")
    private String collectType;

    @Column(name = OTA_PACKAGE_DEVICE_PROFILE_ID_COLUMN)
    private UUID deviceProfileId;

    @Type(type = "jsonb")
    @Column(name = "data_profile", columnDefinition = "jsonb")
    private JsonNode dataProfile;

    @Type(type = "jsonb")
    @Column(name = "collect_profile", columnDefinition = "jsonb")
    private JsonNode collectProfile;

    public ProductPropertyEntity() {
    }

    public ProductPropertyEntity(ProductProperty productProperty) {
        if (productProperty.getId() != null) {
            this.setUuid(productProperty.getId().getId());
        }
        if (productProperty.getTenantId() != null) {
            this.tenantId = productProperty.getTenantId().getId();
        }

        if (productProperty.getDeviceProfileId() != null) {
            this.deviceProfileId = productProperty.getDeviceProfileId().getId();
        }
        this.setCreatedTime(productProperty.getCreatedTime());
        this.name = productProperty.getName();

        this.key = productProperty.getKey();
        this.readMode = productProperty.getReadMode();
        this.imgUrl = productProperty.getImgUrl();
        this.dataType = productProperty.getDataType();
        this.description = productProperty.getDescription();
        this.group = productProperty.getGroup();
        this.dataProfile = productProperty.getDataProfile();
        this.collectProfile = productProperty.getCollectProfile();
        this.collectType = productProperty.getCollectType();
    }


    @Override
    public ProductProperty toData() {
        ProductProperty productProperty = new ProductProperty(new PropertyId(this.getUuid()));
        productProperty.setCreatedTime(createdTime);
        if (tenantId != null) {
            productProperty.setTenantId(TenantId.fromUUID(tenantId));
        }
        if (deviceProfileId != null) {
            productProperty.setDeviceProfileId(new DeviceProfileId(deviceProfileId));
        }
        productProperty.setDataProfile(JacksonUtil.convertValue(dataProfile, JsonNode.class));
        productProperty.setCollectProfile(JacksonUtil.convertValue(collectProfile, JsonNode.class));
        productProperty.setName(this.name);
        productProperty.setKey(this.key);
        productProperty.setReadMode(this.readMode);
        productProperty.setImgUrl(this.imgUrl);
        productProperty.setDataType(this.dataType);
        productProperty.setGroup(this.group);
        productProperty.setDescription(this.description);

        return productProperty;
    }
}
