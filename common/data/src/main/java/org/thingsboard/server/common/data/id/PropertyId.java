package org.thingsboard.server.common.data.id;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonProperty;
import io.swagger.v3.oas.annotations.media.Schema;

import java.util.UUID;

/**
 * @author Houyong Yang
 * since 2022/6/19 12:55
 */
@Schema
public class PropertyId extends UUIDBased {

    @JsonCreator
    public PropertyId(@JsonProperty("id") UUID id) {
        super(id);
    }

}
