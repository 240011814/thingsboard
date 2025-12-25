package org.thingsboard.server.common.data.device.property;

import com.fasterxml.jackson.databind.JsonNode;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.thingsboard.server.common.data.BaseData;
import org.thingsboard.server.common.data.HasName;
import org.thingsboard.server.common.data.HasTenantId;
import org.thingsboard.server.common.data.id.*;

/**
 * @author Houyong Yang
 * since 2022/6/19 12:55
 */
@Schema
@Data
@EqualsAndHashCode(callSuper = true)
public class ProductProperty extends BaseData<PropertyId> implements HasTenantId, HasName {

    @Schema( description = "JSON object with Tenant Id.", readOnly = true)
    private TenantId tenantId;
    @Schema(description = "JSON object with Device Id.", readOnly = true)
    private DeviceProfileId deviceProfileId;
    @Schema( description = "Expiration time of the request.", readOnly = true)
    private String name;
    private String key;
    private String readMode;
    private String imgUrl;
    private String dataType;
    private  Integer order;
    private String description;
    private String group;
    private String collectType;
    @Schema( description = "The request body that will be used to send message to device.", readOnly = true)
    private JsonNode dataProfile;
    @Schema( description = "The response from the device.", readOnly = true)
    private JsonNode collectProfile;

    public ProductProperty(PropertyId id) {
        super(id);
    }

    public ProductProperty() {
        super();
    }


    public ProductProperty(ProductProperty productProperty) {
        super(productProperty);
        this.tenantId = productProperty.getTenantId();
        this.name = productProperty.getName();

    }


    @Schema( description = "JSON object with the rpc Id. Referencing non-existing rpc Id will cause error.")
    @Override
    public PropertyId getId() {
        return super.getId();
    }

    @Schema( description = "Timestamp of the rpc creation, in milliseconds", example = "1609459200000", readOnly = true)
    @Override
    public long getCreatedTime() {
        return super.getCreatedTime();
    }
}
