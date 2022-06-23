package org.thingsboard.server.common.data.id;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonProperty;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import org.thingsboard.server.common.data.EntityType;

import java.util.UUID;

/**
 * @author Houyong Yang
 * since 2022/6/19 12:55
 */
@ApiModel
public class PropertyId extends UUIDBased implements EntityId{

    @JsonCreator
    public PropertyId(@JsonProperty("id") UUID id) {
        super(id);
    }

    @ApiModelProperty(position = 2, required = true, value = "string", example = "PRODUCT_PROPERTY", allowableValues = "PRODUCT_PROPERTY")
    @Override
    public EntityType getEntityType() {
        return EntityType.PRODUCT_PROPERTY;
    }
}
