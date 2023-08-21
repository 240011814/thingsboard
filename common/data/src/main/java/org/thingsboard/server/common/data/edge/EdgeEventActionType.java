/**
 * Copyright © 2016-2023 The Thingsboard Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.thingsboard.server.common.data.edge;

import lombok.Getter;
import org.thingsboard.server.common.data.audit.ActionType;

@Getter
public enum EdgeEventActionType {
    ADDED(ActionType.ADDED),
    UPDATED(ActionType.UPDATED),
    DELETED(ActionType.DELETED),
    POST_ATTRIBUTES(null),
    ATTRIBUTES_UPDATED(null),
    ATTRIBUTES_DELETED(null),
    TIMESERIES_UPDATED(null),
    CREDENTIALS_UPDATED(ActionType.CREDENTIALS_UPDATED),
    ASSIGNED_TO_CUSTOMER(ActionType.ASSIGNED_TO_CUSTOMER),
    UNASSIGNED_FROM_CUSTOMER(ActionType.UNASSIGNED_FROM_CUSTOMER),
    RELATION_ADD_OR_UPDATE(ActionType.RELATION_ADD_OR_UPDATE),
    RELATION_DELETED(ActionType.RELATION_DELETED),
    RPC_CALL(null),
    ALARM_ACK(ActionType.ALARM_ACK),
    ALARM_CLEAR(ActionType.ALARM_CLEAR),
    ALARM_ASSIGNED(ActionType.ALARM_ASSIGNED),
    ALARM_UNASSIGNED(ActionType.ALARM_UNASSIGNED),
    ASSIGNED_TO_EDGE(ActionType.ASSIGNED_TO_EDGE),
    UNASSIGNED_FROM_EDGE(ActionType.UNASSIGNED_FROM_EDGE),
    CREDENTIALS_REQUEST(null),
    ENTITY_MERGE_REQUEST(null); // deprecated

    private final ActionType actionType;

    EdgeEventActionType(ActionType actionType) {
        this.actionType = actionType;
    }
}
