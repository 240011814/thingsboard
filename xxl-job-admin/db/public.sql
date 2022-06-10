/*
 Navicat PostgreSQL Data Transfer

 Source Server         : localhost_5432
 Source Server Type    : PostgreSQL
 Source Server Version : 140002
 Source Host           : localhost:5432
 Source Catalog        : thingsboard
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 140002
 File Encoding         : 65001

 Date: 09/06/2022 18:01:57
*/


-- ----------------------------
-- Type structure for rxid
-- ----------------------------
DROP TYPE IF EXISTS "public"."rxid";
CREATE TYPE "public"."rxid" (
  INPUT = "_timescaledb_internal"."rxid_in",
  OUTPUT = "_timescaledb_internal"."rxid_out",
  INTERNALLENGTH = 16,
  CATEGORY = U,
  DELIMITER = ','
);
ALTER TYPE "public"."rxid" OWNER TO "postgres";

-- ----------------------------
-- Sequence structure for ts_kv_dictionary_key_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ts_kv_dictionary_key_id_seq";
CREATE SEQUENCE "public"."ts_kv_dictionary_key_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for xxl_job_group_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."xxl_job_group_id_seq";
CREATE SEQUENCE "public"."xxl_job_group_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for xxl_job_info_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."xxl_job_info_id_seq";
CREATE SEQUENCE "public"."xxl_job_info_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for xxl_job_log_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."xxl_job_log_id_seq";
CREATE SEQUENCE "public"."xxl_job_log_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for xxl_job_log_report_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."xxl_job_log_report_id_seq";
CREATE SEQUENCE "public"."xxl_job_log_report_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for xxl_job_logglue_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."xxl_job_logglue_id_seq";
CREATE SEQUENCE "public"."xxl_job_logglue_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for xxl_job_registry_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."xxl_job_registry_id_seq";
CREATE SEQUENCE "public"."xxl_job_registry_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for xxl_job_user_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."xxl_job_user_id_seq";
CREATE SEQUENCE "public"."xxl_job_user_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Table structure for admin_settings
-- ----------------------------
DROP TABLE IF EXISTS "public"."admin_settings";
CREATE TABLE "public"."admin_settings" (
  "id" uuid NOT NULL,
  "created_time" int8 NOT NULL,
  "json_value" varchar COLLATE "pg_catalog"."default",
  "key" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of admin_settings
-- ----------------------------
INSERT INTO "public"."admin_settings" VALUES ('6a2266e4-4612-11e7-a919-92ebcb67fe33', 1592576748000, '{
	"baseUrl": "http://localhost:8080"
}', 'general');
INSERT INTO "public"."admin_settings" VALUES ('6eaaefa6-4612-11e7-a919-92ebcb67fe33', 1592576748000, '{
	"mailFrom": "Thingsboard <sysadmin@localhost.localdomain>",
	"smtpProtocol": "smtp",
	"smtpHost": "localhost",
	"smtpPort": "25",
	"timeout": "10000",
	"enableTls": false,
	"tlsVersion": "TLSv1.2",
	"username": "",
	"password": ""
}', 'mail');

-- ----------------------------
-- Table structure for alarm
-- ----------------------------
DROP TABLE IF EXISTS "public"."alarm";
CREATE TABLE "public"."alarm" (
  "id" uuid NOT NULL,
  "created_time" int8 NOT NULL,
  "ack_ts" int8,
  "clear_ts" int8,
  "additional_info" varchar COLLATE "pg_catalog"."default",
  "end_ts" int8,
  "originator_id" uuid,
  "originator_type" int4,
  "propagate" bool,
  "severity" varchar(255) COLLATE "pg_catalog"."default",
  "start_ts" int8,
  "status" varchar(255) COLLATE "pg_catalog"."default",
  "tenant_id" uuid,
  "customer_id" uuid,
  "propagate_relation_types" varchar COLLATE "pg_catalog"."default",
  "type" varchar(255) COLLATE "pg_catalog"."default",
  "propagate_to_owner" bool,
  "propagate_to_tenant" bool
)
;

-- ----------------------------
-- Records of alarm
-- ----------------------------

-- ----------------------------
-- Table structure for api_usage_state
-- ----------------------------
DROP TABLE IF EXISTS "public"."api_usage_state";
CREATE TABLE "public"."api_usage_state" (
  "id" uuid NOT NULL,
  "created_time" int8 NOT NULL,
  "tenant_id" uuid,
  "entity_type" varchar(32) COLLATE "pg_catalog"."default",
  "entity_id" uuid,
  "transport" varchar(32) COLLATE "pg_catalog"."default",
  "db_storage" varchar(32) COLLATE "pg_catalog"."default",
  "re_exec" varchar(32) COLLATE "pg_catalog"."default",
  "js_exec" varchar(32) COLLATE "pg_catalog"."default",
  "email_exec" varchar(32) COLLATE "pg_catalog"."default",
  "sms_exec" varchar(32) COLLATE "pg_catalog"."default",
  "alarm_exec" varchar(32) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of api_usage_state
-- ----------------------------
INSERT INTO "public"."api_usage_state" VALUES ('18b33a40-d68b-11ec-aefb-d132b4563e73', 1652865344484, '188f3780-d68b-11ec-aefb-d132b4563e73', 'TENANT', '188f3780-d68b-11ec-aefb-d132b4563e73', 'ENABLED', 'ENABLED', 'ENABLED', 'ENABLED', 'ENABLED', 'ENABLED', 'ENABLED');
INSERT INTO "public"."api_usage_state" VALUES ('3da82270-d68b-11ec-aefb-d132b4563e73', 1652865406487, '13814000-1dd2-11b2-8080-808080808080', 'TENANT', '13814000-1dd2-11b2-8080-808080808080', 'ENABLED', 'ENABLED', 'ENABLED', 'ENABLED', 'ENABLED', 'ENABLED', 'ENABLED');

-- ----------------------------
-- Table structure for asset
-- ----------------------------
DROP TABLE IF EXISTS "public"."asset";
CREATE TABLE "public"."asset" (
  "id" uuid NOT NULL,
  "created_time" int8 NOT NULL,
  "additional_info" varchar COLLATE "pg_catalog"."default",
  "customer_id" uuid,
  "name" varchar(255) COLLATE "pg_catalog"."default",
  "label" varchar(255) COLLATE "pg_catalog"."default",
  "search_text" varchar(255) COLLATE "pg_catalog"."default",
  "tenant_id" uuid,
  "type" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of asset
-- ----------------------------
INSERT INTO "public"."asset" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 1652865419611, NULL, '13814000-1dd2-11b2-8080-808080808080', 'Main_SZCL21HOUYONG', NULL, 'main_szcl21houyong', '188f3780-d68b-11ec-aefb-d132b4563e73', 'TbServiceQueue');
INSERT INTO "public"."asset" VALUES ('b68372a0-db2a-11ec-97d4-5555813c4bbf', 1653373703882, '{"description":""}', '13814000-1dd2-11b2-8080-808080808080', '传感器', NULL, '传感器', '188f3780-d68b-11ec-aefb-d132b4563e73', 'TTT');

-- ----------------------------
-- Table structure for attribute_kv
-- ----------------------------
DROP TABLE IF EXISTS "public"."attribute_kv";
CREATE TABLE "public"."attribute_kv" (
  "entity_type" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "entity_id" uuid NOT NULL,
  "attribute_type" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "attribute_key" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "bool_v" bool,
  "str_v" varchar(10000000) COLLATE "pg_catalog"."default",
  "long_v" int8,
  "dbl_v" float8,
  "json_v" json,
  "last_update_ts" int8
)
;

-- ----------------------------
-- Records of attribute_kv
-- ----------------------------
INSERT INTO "public"."attribute_kv" VALUES ('DEVICE', '00e73d10-d68d-11ec-aefb-d132b4563e73', 'SERVER_SCOPE', 'lastDisconnectTime', NULL, NULL, 1652867218776, NULL, NULL, 1652867218776);
INSERT INTO "public"."attribute_kv" VALUES ('DEVICE', '559c7d40-d68b-11ec-aefb-d132b4563e73', 'SERVER_SCOPE', 'lastConnectTime', NULL, NULL, 1652865476608, NULL, NULL, 1652865476608);
INSERT INTO "public"."attribute_kv" VALUES ('DEVICE', '00e73d10-d68d-11ec-aefb-d132b4563e73', 'SERVER_SCOPE', 'lastActivityTime', NULL, NULL, 1652867218749, NULL, NULL, 1652867220360);
INSERT INTO "public"."attribute_kv" VALUES ('DEVICE', 'dd095840-d68e-11ec-aefb-d132b4563e73', 'SERVER_SCOPE', 'lastDisconnectTime', NULL, NULL, 1652867289362, NULL, NULL, 1652867289362);
INSERT INTO "public"."attribute_kv" VALUES ('DEVICE', '23dfd580-d68c-11ec-aefb-d132b4563e73', 'SERVER_SCOPE', 'active', 'f', NULL, NULL, NULL, NULL, 1652865792805);
INSERT INTO "public"."attribute_kv" VALUES ('DEVICE', '23eaaaf1-d68c-11ec-aefb-d132b4563e73', 'SERVER_SCOPE', 'lastConnectTime', NULL, NULL, 1652865792907, NULL, NULL, 1652865792907);
INSERT INTO "public"."attribute_kv" VALUES ('DEVICE', '23e44250-d68c-11ec-aefb-d132b4563e73', 'SERVER_SCOPE', 'active', 't', NULL, NULL, NULL, NULL, 1652865792862);
INSERT INTO "public"."attribute_kv" VALUES ('DEVICE', '23e44250-d68c-11ec-aefb-d132b4563e73', 'SERVER_SCOPE', 'lastConnectTime', NULL, NULL, 1652865792860, NULL, NULL, 1652865792860);
INSERT INTO "public"."attribute_kv" VALUES ('DEVICE', '23eaaaf1-d68c-11ec-aefb-d132b4563e73', 'SERVER_SCOPE', 'active', 't', NULL, NULL, NULL, NULL, 1652865792908);
INSERT INTO "public"."attribute_kv" VALUES ('DEVICE', 'dd095840-d68e-11ec-aefb-d132b4563e73', 'SERVER_SCOPE', 'active', 'f', NULL, NULL, NULL, NULL, 1652867608131);
INSERT INTO "public"."attribute_kv" VALUES ('DEVICE', 'dd095840-d68e-11ec-aefb-d132b4563e73', 'SERVER_SCOPE', 'inactivityAlarmTime', NULL, NULL, 1652867608131, NULL, NULL, 1652867608131);
INSERT INTO "public"."attribute_kv" VALUES ('DEVICE', '23eaaaf2-d68c-11ec-aefb-d132b4563e73', 'SERVER_SCOPE', 'lastConnectTime', NULL, NULL, 1652865792915, NULL, NULL, 1652865792915);
INSERT INTO "public"."attribute_kv" VALUES ('DEVICE', '23eaaaf2-d68c-11ec-aefb-d132b4563e73', 'SERVER_SCOPE', 'active', 't', NULL, NULL, NULL, NULL, 1652865792917);
INSERT INTO "public"."attribute_kv" VALUES ('DEVICE', '23e44250-d68c-11ec-aefb-d132b4563e73', 'SERVER_SCOPE', 'lastDisconnectTime', NULL, NULL, 1652865862960, NULL, NULL, 1652865862960);
INSERT INTO "public"."attribute_kv" VALUES ('DEVICE', '23eaaaf2-d68c-11ec-aefb-d132b4563e73', 'SERVER_SCOPE', 'lastDisconnectTime', NULL, NULL, 1652865862965, NULL, NULL, 1652865862965);
INSERT INTO "public"."attribute_kv" VALUES ('DEVICE', '23eaaaf1-d68c-11ec-aefb-d132b4563e73', 'SERVER_SCOPE', 'lastDisconnectTime', NULL, NULL, 1652865862971, NULL, NULL, 1652865862971);
INSERT INTO "public"."attribute_kv" VALUES ('DEVICE', '23e44250-d68c-11ec-aefb-d132b4563e73', 'SERVER_SCOPE', 'lastActivityTime', NULL, NULL, 1652865862935, NULL, NULL, 1652865864373);
INSERT INTO "public"."attribute_kv" VALUES ('DEVICE', '23eaaaf2-d68c-11ec-aefb-d132b4563e73', 'SERVER_SCOPE', 'lastActivityTime', NULL, NULL, 1652865862935, NULL, NULL, 1652865864373);
INSERT INTO "public"."attribute_kv" VALUES ('DEVICE', '23eaaaf1-d68c-11ec-aefb-d132b4563e73', 'SERVER_SCOPE', 'lastActivityTime', NULL, NULL, 1652865862935, NULL, NULL, 1652865864373);
INSERT INTO "public"."attribute_kv" VALUES ('DEVICE', '00e73d10-d68d-11ec-aefb-d132b4563e73', 'SERVER_SCOPE', 'active', 'f', NULL, NULL, NULL, NULL, 1652867848132);
INSERT INTO "public"."attribute_kv" VALUES ('DEVICE', '00e73d10-d68d-11ec-aefb-d132b4563e73', 'SERVER_SCOPE', 'inactivityAlarmTime', NULL, NULL, 1652867848132, NULL, NULL, 1652867848132);
INSERT INTO "public"."attribute_kv" VALUES ('DEVICE', '559c7d40-d68b-11ec-aefb-d132b4563e73', 'SERVER_SCOPE', 'lastActivityTime', NULL, NULL, 1652868206553, NULL, NULL, 1652868207368);
INSERT INTO "public"."attribute_kv" VALUES ('DEVICE', '559c7d40-d68b-11ec-aefb-d132b4563e73', 'SERVER_SCOPE', 'active', 'f', NULL, NULL, NULL, NULL, 1652939153042);
INSERT INTO "public"."attribute_kv" VALUES ('DEVICE', '559c7d40-d68b-11ec-aefb-d132b4563e73', 'SERVER_SCOPE', 'inactivityAlarmTime', NULL, NULL, 1652939153041, NULL, NULL, 1652939153054);
INSERT INTO "public"."attribute_kv" VALUES ('DEVICE', '00e73d10-d68d-11ec-aefb-d132b4563e73', 'CLIENT_SCOPE', 'speed', NULL, NULL, 20, NULL, NULL, 1652866251469);
INSERT INTO "public"."attribute_kv" VALUES ('DEVICE', '00e73d10-d68d-11ec-aefb-d132b4563e73', 'CLIENT_SCOPE', 'hight', NULL, NULL, 100, NULL, NULL, 1652866251469);
INSERT INTO "public"."attribute_kv" VALUES ('DEVICE', '00e73d10-d68d-11ec-aefb-d132b4563e73', 'CLIENT_SCOPE', 'attributes', NULL, NULL, NULL, NULL, '[{"height":"111"}]', 1652866251469);
INSERT INTO "public"."attribute_kv" VALUES ('DEVICE', '00e73d10-d68d-11ec-aefb-d132b4563e73', 'SERVER_SCOPE', 'lastConnectTime', NULL, NULL, 1652866918191, NULL, NULL, 1652866918191);
INSERT INTO "public"."attribute_kv" VALUES ('DEVICE', 'dd095840-d68e-11ec-aefb-d132b4563e73', 'SERVER_SCOPE', 'lastConnectTime', NULL, NULL, 1652866962429, NULL, NULL, 1652866962429);
INSERT INTO "public"."attribute_kv" VALUES ('DEVICE', 'dd095840-d68e-11ec-aefb-d132b4563e73', 'SERVER_SCOPE', 'lastActivityTime', NULL, NULL, 1652866988865, NULL, NULL, 1652866989383);

-- ----------------------------
-- Table structure for audit_log
-- ----------------------------
DROP TABLE IF EXISTS "public"."audit_log";
CREATE TABLE "public"."audit_log" (
  "id" uuid NOT NULL,
  "created_time" int8 NOT NULL,
  "tenant_id" uuid,
  "customer_id" uuid,
  "entity_id" uuid,
  "entity_type" varchar(255) COLLATE "pg_catalog"."default",
  "entity_name" varchar(255) COLLATE "pg_catalog"."default",
  "user_id" uuid,
  "user_name" varchar(255) COLLATE "pg_catalog"."default",
  "action_type" varchar(255) COLLATE "pg_catalog"."default",
  "action_data" varchar(1000000) COLLATE "pg_catalog"."default",
  "action_status" varchar(255) COLLATE "pg_catalog"."default",
  "action_failure_details" varchar(1000000) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of audit_log
-- ----------------------------
INSERT INTO "public"."audit_log" VALUES ('0b61f4d0-d68b-11ec-aefb-d132b4563e73', 1652865322141, '13814000-1dd2-11b2-8080-808080808080', '13814000-1dd2-11b2-8080-808080808080', '5a797660-4612-11e7-a919-92ebcb67fe33', 'USER', 'sysadmin@thingsboard.org', '5a797660-4612-11e7-a919-92ebcb67fe33', 'sysadmin@thingsboard.org', 'LOGIN', '{"clientAddress":"0:0:0:0:0:0:0:1","browser":"Chrome 101.0.4951","os":"Windows 10","device":"Other"}', 'SUCCESS', '');
INSERT INTO "public"."audit_log" VALUES ('38a7c500-d68b-11ec-aefb-d132b4563e73', 1652865398096, '13814000-1dd2-11b2-8080-808080808080', '13814000-1dd2-11b2-8080-808080808080', '3895eab0-d68b-11ec-aefb-d132b4563e73', 'USER', '240011814@qq.com', '5a797660-4612-11e7-a919-92ebcb67fe33', 'sysadmin@thingsboard.org', 'ADDED', '{"entity":{"id":{"entityType":"USER","id":"3895eab0-d68b-11ec-aefb-d132b4563e73"},"createdTime":1652865397979,"additionalInfo":{"description":"","defaultDashboardId":null,"defaultDashboardFullscreen":false,"homeDashboardId":null,"homeDashboardHideToolbar":true},"tenantId":{"entityType":"TENANT","id":"188f3780-d68b-11ec-aefb-d132b4563e73"},"customerId":{"entityType":"CUSTOMER","id":"13814000-1dd2-11b2-8080-808080808080"},"email":"240011814@qq.com","authority":"TENANT_ADMIN","firstName":"hy","lastName":"y","name":"240011814@qq.com"}}', 'SUCCESS', '');
INSERT INTO "public"."audit_log" VALUES ('55ae7ea0-d68b-11ec-aefb-d132b4563e73', 1652865446794, '188f3780-d68b-11ec-aefb-d132b4563e73', '13814000-1dd2-11b2-8080-808080808080', '559c7d40-d68b-11ec-aefb-d132b4563e73', 'DEVICE', 'gate', '3895eab0-d68b-11ec-aefb-d132b4563e73', '240011814@qq.com', 'ADDED', '{"entity":{"id":{"entityType":"DEVICE","id":"559c7d40-d68b-11ec-aefb-d132b4563e73"},"createdTime":1652865446676,"additionalInfo":{"gateway":true,"overwriteActivityTime":false,"description":""},"tenantId":{"entityType":"TENANT","id":"188f3780-d68b-11ec-aefb-d132b4563e73"},"customerId":{"entityType":"CUSTOMER","id":"13814000-1dd2-11b2-8080-808080808080"},"name":"gate","type":"default","label":"","deviceProfileId":{"entityType":"DEVICE_PROFILE","id":"18a44620-d68b-11ec-aefb-d132b4563e73"},"deviceData":{"configuration":{"type":"DEFAULT"},"transportConfiguration":{"type":"DEFAULT"}},"firmwareId":null,"softwareId":null}}', 'SUCCESS', '');
INSERT INTO "public"."audit_log" VALUES ('55cd7850-d68b-11ec-aefb-d132b4563e73', 1652865446997, '188f3780-d68b-11ec-aefb-d132b4563e73', '13814000-1dd2-11b2-8080-808080808080', '559c7d40-d68b-11ec-aefb-d132b4563e73', 'DEVICE', 'gate', '3895eab0-d68b-11ec-aefb-d132b4563e73', '240011814@qq.com', 'CREDENTIALS_UPDATED', '{"entityId":"559c7d40-d68b-11ec-aefb-d132b4563e73","credentials":{"id":{"id":"55a752b0-d68b-11ec-aefb-d132b4563e73"},"createdTime":1652865446747,"deviceId":{"entityType":"DEVICE","id":"559c7d40-d68b-11ec-aefb-d132b4563e73"},"credentialsType":"MQTT_BASIC","credentialsId":"f634542761f002651ebcd4362dfedbacc26e8237d3ff0d0e8c40f3af763c050b","credentialsValue":"{\"clientId\":\"123456789\",\"userName\":\"123456789\",\"password\":\"123456789\"}"}}', 'SUCCESS', '');
INSERT INTO "public"."audit_log" VALUES ('4db4c1e1-d68c-11ec-aefb-d132b4563e73', 1652865862910, '188f3780-d68b-11ec-aefb-d132b4563e73', '13814000-1dd2-11b2-8080-808080808080', '23eaaaf1-d68c-11ec-aefb-d132b4563e73', 'DEVICE', 'attributes', '3895eab0-d68b-11ec-aefb-d132b4563e73', '240011814@qq.com', 'DELETED', '{"entityId":"23eaaaf1-d68c-11ec-aefb-d132b4563e73"}', 'SUCCESS', '');
INSERT INTO "public"."audit_log" VALUES ('4db4c1e2-d68c-11ec-aefb-d132b4563e73', 1652865862910, '188f3780-d68b-11ec-aefb-d132b4563e73', '13814000-1dd2-11b2-8080-808080808080', '23e44250-d68c-11ec-aefb-d132b4563e73', 'DEVICE', 'deviceType', '3895eab0-d68b-11ec-aefb-d132b4563e73', '240011814@qq.com', 'DELETED', '{"entityId":"23e44250-d68c-11ec-aefb-d132b4563e73"}', 'SUCCESS', '');
INSERT INTO "public"."audit_log" VALUES ('4db4c1e0-d68c-11ec-aefb-d132b4563e73', 1652865862910, '188f3780-d68b-11ec-aefb-d132b4563e73', '13814000-1dd2-11b2-8080-808080808080', '23dfd580-d68c-11ec-aefb-d132b4563e73', 'DEVICE', 'deviceName', '3895eab0-d68b-11ec-aefb-d132b4563e73', '240011814@qq.com', 'DELETED', '{"entityId":"23dfd580-d68c-11ec-aefb-d132b4563e73"}', 'SUCCESS', '');
INSERT INTO "public"."audit_log" VALUES ('4db4c1e3-d68c-11ec-aefb-d132b4563e73', 1652865862910, '188f3780-d68b-11ec-aefb-d132b4563e73', '13814000-1dd2-11b2-8080-808080808080', '23eaaaf2-d68c-11ec-aefb-d132b4563e73', 'DEVICE', 'telemetry', '3895eab0-d68b-11ec-aefb-d132b4563e73', '240011814@qq.com', 'DELETED', '{"entityId":"23eaaaf2-d68c-11ec-aefb-d132b4563e73"}', 'SUCCESS', '');
INSERT INTO "public"."audit_log" VALUES ('1324ba70-d737-11ec-94a0-cd6fda244b19', 1652939208599, '188f3780-d68b-11ec-aefb-d132b4563e73', '13126af0-d737-11ec-94a0-cd6fda244b19', '13126af0-d737-11ec-94a0-cd6fda244b19', 'CUSTOMER', 'usera', '3895eab0-d68b-11ec-aefb-d132b4563e73', '240011814@qq.com', 'ADDED', '{"entity":{"id":{"entityType":"CUSTOMER","id":"13126af0-d737-11ec-94a0-cd6fda244b19"},"createdTime":1652939208479,"additionalInfo":{"description":"","homeDashboardId":null,"homeDashboardHideToolbar":true},"country":null,"state":null,"city":null,"address":null,"address2":null,"zip":null,"phone":null,"email":null,"title":"usera","tenantId":{"entityType":"TENANT","id":"188f3780-d68b-11ec-aefb-d132b4563e73"},"name":"usera"}}', 'SUCCESS', '');
INSERT INTO "public"."audit_log" VALUES ('403a04c0-d737-11ec-94a0-cd6fda244b19', 1652939284236, '188f3780-d68b-11ec-aefb-d132b4563e73', '13126af0-d737-11ec-94a0-cd6fda244b19', '402b37b0-d737-11ec-94a0-cd6fda244b19', 'USER', '1111111@qq.com', '3895eab0-d68b-11ec-aefb-d132b4563e73', '240011814@qq.com', 'ADDED', '{"entity":{"id":{"entityType":"USER","id":"402b37b0-d737-11ec-94a0-cd6fda244b19"},"createdTime":1652939284139,"additionalInfo":{"description":"","defaultDashboardId":null,"defaultDashboardFullscreen":false,"homeDashboardId":null,"homeDashboardHideToolbar":true},"tenantId":{"entityType":"TENANT","id":"188f3780-d68b-11ec-aefb-d132b4563e73"},"customerId":{"entityType":"CUSTOMER","id":"13126af0-d737-11ec-94a0-cd6fda244b19"},"email":"1111111@qq.com","authority":"CUSTOMER_USER","firstName":null,"lastName":null,"name":"1111111@qq.com"}}', 'SUCCESS', '');
INSERT INTO "public"."audit_log" VALUES ('5411ab60-d737-11ec-94a0-cd6fda244b19', 1652939317526, '188f3780-d68b-11ec-aefb-d132b4563e73', '13126af0-d737-11ec-94a0-cd6fda244b19', '559c7d40-d68b-11ec-aefb-d132b4563e73', 'DEVICE', 'gate', '3895eab0-d68b-11ec-aefb-d132b4563e73', '240011814@qq.com', 'ASSIGNED_TO_CUSTOMER', '{"entityId":"559c7d40-d68b-11ec-aefb-d132b4563e73","assignedCustomerId":"13126af0-d737-11ec-94a0-cd6fda244b19","assignedCustomerName":"usera"}', 'SUCCESS', '');
INSERT INTO "public"."audit_log" VALUES ('67e867a0-d737-11ec-94a0-cd6fda244b19', 1652939350810, '188f3780-d68b-11ec-aefb-d132b4563e73', '13814000-1dd2-11b2-8080-808080808080', '67e27430-d737-11ec-94a0-cd6fda244b19', 'DASHBOARD', 'demo', '3895eab0-d68b-11ec-aefb-d132b4563e73', '240011814@qq.com', 'ADDED', '{"entity":{"id":{"entityType":"DASHBOARD","id":"67e27430-d737-11ec-94a0-cd6fda244b19"},"createdTime":1652939350771,"tenantId":{"entityType":"TENANT","id":"188f3780-d68b-11ec-aefb-d132b4563e73"},"title":"demo","image":null,"assignedCustomers":null,"mobileHide":false,"mobileOrder":null,"configuration":"","name":"demo"}}', 'SUCCESS', '');
INSERT INTO "public"."audit_log" VALUES ('6c92b5d0-d737-11ec-94a0-cd6fda244b19', 1652939358637, '188f3780-d68b-11ec-aefb-d132b4563e73', '13126af0-d737-11ec-94a0-cd6fda244b19', '67e27430-d737-11ec-94a0-cd6fda244b19', 'DASHBOARD', 'demo', '3895eab0-d68b-11ec-aefb-d132b4563e73', '240011814@qq.com', 'ASSIGNED_TO_CUSTOMER', '{"entityId":"67e27430-d737-11ec-94a0-cd6fda244b19","assignedCustomerId":"13126af0-d737-11ec-94a0-cd6fda244b19","assignedCustomerName":"usera"}', 'SUCCESS', '');
INSERT INTO "public"."audit_log" VALUES ('8424f370-d737-11ec-94a0-cd6fda244b19', 1652939398183, '188f3780-d68b-11ec-aefb-d132b4563e73', '13814000-1dd2-11b2-8080-808080808080', '840b02d0-d737-11ec-94a0-cd6fda244b19', 'EDGE', 'aaa', '3895eab0-d68b-11ec-aefb-d132b4563e73', '240011814@qq.com', 'ADDED', '{"entity":{"id":{"entityType":"EDGE","id":"840b02d0-d737-11ec-94a0-cd6fda244b19"},"createdTime":1652939398013,"additionalInfo":{"description":""},"tenantId":{"entityType":"TENANT","id":"188f3780-d68b-11ec-aefb-d132b4563e73"},"customerId":{"entityType":"CUSTOMER","id":"13814000-1dd2-11b2-8080-808080808080"},"rootRuleChainId":{"entityType":"RULE_CHAIN","id":"191cd180-d68b-11ec-aefb-d132b4563e73"},"name":"aaa","type":"default","label":null,"routingKey":"15b06007-6eb5-cde1-c9ae-bb86543acabf","secret":"lndqnell7ex1bg7dols9"}}', 'SUCCESS', '');
INSERT INTO "public"."audit_log" VALUES ('a578e720-d737-11ec-94a0-cd6fda244b19', 1652939454098, '188f3780-d68b-11ec-aefb-d132b4563e73', '13814000-1dd2-11b2-8080-808080808080', '67e27430-d737-11ec-94a0-cd6fda244b19', 'DASHBOARD', 'demo', '3895eab0-d68b-11ec-aefb-d132b4563e73', '240011814@qq.com', 'ASSIGNED_TO_EDGE', '{"entityId":"67e27430-d737-11ec-94a0-cd6fda244b19","assignedEdgeId":"840b02d0-d737-11ec-94a0-cd6fda244b19","assignedEdgeName":"aaa"}', 'SUCCESS', '');
INSERT INTO "public"."audit_log" VALUES ('df064300-d739-11ec-94a0-cd6fda244b19', 1652940409648, '188f3780-d68b-11ec-aefb-d132b4563e73', '13126af0-d737-11ec-94a0-cd6fda244b19', '402b37b0-d737-11ec-94a0-cd6fda244b19', 'USER', '1111111@qq.com', '402b37b0-d737-11ec-94a0-cd6fda244b19', '1111111@qq.com', 'LOGOUT', '{"clientAddress":"0:0:0:0:0:0:0:1","browser":"Chrome 101.0.4951","os":"Windows 10","device":"Other"}', 'SUCCESS', '');
INSERT INTO "public"."audit_log" VALUES ('e329adf0-d739-11ec-94a0-cd6fda244b19', 1652940416591, '13814000-1dd2-11b2-8080-808080808080', '13814000-1dd2-11b2-8080-808080808080', '5a797660-4612-11e7-a919-92ebcb67fe33', 'USER', 'sysadmin@thingsboard.org', '5a797660-4612-11e7-a919-92ebcb67fe33', 'sysadmin@thingsboard.org', 'LOGIN', '{"clientAddress":"0:0:0:0:0:0:0:1","browser":"Chrome 101.0.4951","os":"Windows 10","device":"Other"}', 'SUCCESS', '');
INSERT INTO "public"."audit_log" VALUES ('a386cc60-d73d-11ec-94a0-cd6fda244b19', 1652942027814, '13814000-1dd2-11b2-8080-808080808080', '13814000-1dd2-11b2-8080-808080808080', '5a797660-4612-11e7-a919-92ebcb67fe33', 'USER', 'sysadmin@thingsboard.org', '5a797660-4612-11e7-a919-92ebcb67fe33', 'sysadmin@thingsboard.org', 'LOGOUT', '{"clientAddress":"0:0:0:0:0:0:0:1","browser":"Chrome 101.0.4951","os":"Windows 10","device":"Other"}', 'SUCCESS', '');
INSERT INTO "public"."audit_log" VALUES ('a61e1910-d73d-11ec-94a0-cd6fda244b19', 1652942032161, '188f3780-d68b-11ec-aefb-d132b4563e73', '13814000-1dd2-11b2-8080-808080808080', '3895eab0-d68b-11ec-aefb-d132b4563e73', 'USER', '240011814@qq.com', '3895eab0-d68b-11ec-aefb-d132b4563e73', '240011814@qq.com', 'LOGIN', '{"clientAddress":"0:0:0:0:0:0:0:1","browser":"Chrome 101.0.4951","os":"Windows 10","device":"Other"}', 'FAILURE', 'org.springframework.security.authentication.BadCredentialsException: Authentication Failed. Username or Password not valid.
	at org.thingsboard.server.service.security.system.DefaultSystemSecurityService.validateUserCredentials(DefaultSystemSecurityService.java:139)
	at org.thingsboard.server.service.security.system.DefaultSystemSecurityService$$FastClassBySpringCGLIB$$90d2a0e3.invoke(<generated>)
	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)
	at org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:688)
	at org.thingsboard.server.service.security.system.DefaultSystemSecurityService$$EnhancerBySpringCGLIB$$6c094bb7.validateUserCredentials(<generated>)
	at org.thingsboard.server.service.security.auth.rest.RestAuthenticationProvider.authenticateByUsernameAndPassword(RestAuthenticationProvider.java:104)
	at org.thingsboard.server.service.security.auth.rest.RestAuthenticationProvider.authenticate(RestAuthenticationProvider.java:83)
	at org.springframework.security.authentication.ProviderManager.authenticate(ProviderManager.java:182)
	at org.springframework.security.authentication.ProviderManager.authenticate(ProviderManager.java:201)
	at org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter$AuthenticationManagerDelegator.authenticate(WebSecurityConfigurerAdapter.java:524)
	at org.thingsboard.server.service.security.auth.rest.RestLoginProcessingFilter.attemptAuthentication(RestLoginProcessingFilter.java:84)
	at org.springframework.security.web.authentication.AbstractAuthenticationProcessingFilter.doFilter(AbstractAuthenticationProcessingFilter.java:212)
	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)
	at org.springframework.security.web.authentication.AbstractAuthenticationProcessingFilter.doFilter(AbstractAuthenticationProcessingFilter.java:200)
	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)
	at org.springframework.security.oauth2.client.web.OAuth2AuthorizationRequestRedirectFilter.doFilterInternal(OAuth2AuthorizationRequestRedirectFilter.java:178)
	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:119)
	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)
	at org.springframework.security.web.authentication.logout.LogoutFilter.doFilter(LogoutFilter.java:116)
	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)
	at org.springframework.web.filter.CorsFilter.doFilterInternal(CorsFilter.java:92)
	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:119)
	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)
	at org.springframework.security.web.header.HeaderWriterFilter.doHeadersAfter(HeaderWriterFilter.java:92)
	at org.springframework.security.web.header.HeaderWriterFilter.doFilterInternal(HeaderWriterFilter.java:77)
	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:119)
	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)
	at org.springframework.security.web.context.SecurityContextPersistenceFilter.doFilter(SecurityContextPersistenceFilter.java:105)
	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)
	at org.springframework.security.web.context.request.async.WebAsyncManagerIntegrationFilter.doFilterInternal(WebAsyncManagerIntegrationFilter.java:56)
	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:119)
	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)
	at org.springframework.security.web.FilterChainProxy.doFilterInternal(FilterChainProxy.java:215)
	at org.springframework.security.web.FilterChainProxy.doFilter(FilterChainProxy.java:178)
	at org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:358)
	at org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:271)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)
	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:100)
	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:119)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)
	at org.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:93)
	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:119)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)
	at org.springframework.boot.actuate.metrics.web.servlet.WebMvcMetricsFilter.doFilterInternal(WebMvcMetricsFilter.java:97)
	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:119)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)
	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:201)
	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:119)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)
	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:202)
	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:97)
	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:542)
	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:143)
	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:92)
	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:78)
	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:357)
	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:374)
	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:65)
	at org.apache.coyote.AbstractProtocol$ConnectionHandler.process(AbstractProtocol.java:893)
	at org.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1707)
	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)
	at java.base/java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1128)
	at java.base/java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:628)
	at org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)
	at java.base/java.lang.Thread.run(Thread.java:834)
');
INSERT INTO "public"."audit_log" VALUES ('a96c32a0-d73d-11ec-94a0-cd6fda244b19', 1652942037706, '188f3780-d68b-11ec-aefb-d132b4563e73', '13814000-1dd2-11b2-8080-808080808080', '3895eab0-d68b-11ec-aefb-d132b4563e73', 'USER', '240011814@qq.com', '3895eab0-d68b-11ec-aefb-d132b4563e73', '240011814@qq.com', 'LOGIN', '{"clientAddress":"0:0:0:0:0:0:0:1","browser":"Chrome 101.0.4951","os":"Windows 10","device":"Other"}', 'SUCCESS', '');
INSERT INTO "public"."audit_log" VALUES ('171463f0-d823-11ec-b78c-b77651e82ef4', 1653040576431, '188f3780-d68b-11ec-aefb-d132b4563e73', '13814000-1dd2-11b2-8080-808080808080', '16e16d10-d823-11ec-b78c-b77651e82ef4', 'RULE_CHAIN', 'demo', '3895eab0-d68b-11ec-aefb-d132b4563e73', '240011814@qq.com', 'ADDED', '{"entity":{"id":{"entityType":"RULE_CHAIN","id":"16e16d10-d823-11ec-b78c-b77651e82ef4"},"createdTime":1653040576097,"additionalInfo":{"description":""},"tenantId":{"entityType":"TENANT","id":"188f3780-d68b-11ec-aefb-d132b4563e73"},"name":"demo","type":"CORE","firstRuleNodeId":null,"root":false,"debugMode":false,"configuration":null}}', 'SUCCESS', '');
INSERT INTO "public"."audit_log" VALUES ('b69ee9e0-db2a-11ec-97d4-5555813c4bbf', 1653373704062, '188f3780-d68b-11ec-aefb-d132b4563e73', '13814000-1dd2-11b2-8080-808080808080', 'b68372a0-db2a-11ec-97d4-5555813c4bbf', 'ASSET', '传感器', '3895eab0-d68b-11ec-aefb-d132b4563e73', '240011814@qq.com', 'ADDED', '{"entity":{"id":{"entityType":"ASSET","id":"b68372a0-db2a-11ec-97d4-5555813c4bbf"},"createdTime":1653373703882,"additionalInfo":{"description":""},"tenantId":{"entityType":"TENANT","id":"188f3780-d68b-11ec-aefb-d132b4563e73"},"customerId":{"entityType":"CUSTOMER","id":"13814000-1dd2-11b2-8080-808080808080"},"name":"传感器","type":"TTT","label":null}}', 'SUCCESS', '');
INSERT INTO "public"."audit_log" VALUES ('54125970-db2e-11ec-97d4-5555813c4bbf', 1653375256711, '188f3780-d68b-11ec-aefb-d132b4563e73', '13814000-1dd2-11b2-8080-808080808080', '3895eab0-d68b-11ec-aefb-d132b4563e73', 'USER', '240011814@qq.com', '3895eab0-d68b-11ec-aefb-d132b4563e73', '240011814@qq.com', 'UPDATED', '{"entity":{"id":{"entityType":"USER","id":"3895eab0-d68b-11ec-aefb-d132b4563e73"},"createdTime":1652865397979,"additionalInfo":{"description":"","defaultDashboardId":null,"defaultDashboardFullscreen":false,"homeDashboardId":null,"homeDashboardHideToolbar":false,"userPasswordHistory":{"1652865412463":"$2a$10$EABBiI7oTD6I9oE6n7Rihez09iDVX.iOv/x00etGinn16RxYYMhgy","1652865412503":"$2a$10$EABBiI7oTD6I9oE6n7Rihez09iDVX.iOv/x00etGinn16RxYYMhgy"},"userCredentialsEnabled":true,"failedLoginAttempts":0,"lastLoginTs":1652942037678,"lang":"zh_CN"},"tenantId":{"entityType":"TENANT","id":"188f3780-d68b-11ec-aefb-d132b4563e73"},"customerId":{"entityType":"CUSTOMER","id":"13814000-1dd2-11b2-8080-808080808080"},"email":"240011814@qq.com","authority":"TENANT_ADMIN","firstName":"hy","lastName":"y","name":"240011814@qq.com"}}', 'SUCCESS', '');
INSERT INTO "public"."audit_log" VALUES ('7fdaff80-db2e-11ec-97d4-5555813c4bbf', 1653375330168, '188f3780-d68b-11ec-aefb-d132b4563e73', '13814000-1dd2-11b2-8080-808080808080', '7fcd6af0-db2e-11ec-97d4-5555813c4bbf', 'OTA_PACKAGE', '11', '3895eab0-d68b-11ec-aefb-d132b4563e73', '240011814@qq.com', 'ADDED', '{"entity":{"id":{"entityType":"OTA_PACKAGE","id":"7fcd6af0-db2e-11ec-97d4-5555813c4bbf"},"createdTime":1653375330079,"additionalInfo":{"description":""},"tenantId":{"entityType":"TENANT","id":"188f3780-d68b-11ec-aefb-d132b4563e73"},"deviceProfileId":{"entityType":"DEVICE_PROFILE","id":"18a44620-d68b-11ec-aefb-d132b4563e73"},"type":"FIRMWARE","title":"11","version":"11","tag":"11 11","url":null,"hasData":false,"fileName":null,"contentType":null,"checksumAlgorithm":null,"checksum":null,"dataSize":null}}', 'SUCCESS', '');
INSERT INTO "public"."audit_log" VALUES ('8009d7b0-db2e-11ec-97d4-5555813c4bbf', 1653375330475, '188f3780-d68b-11ec-aefb-d132b4563e73', '13814000-1dd2-11b2-8080-808080808080', '7fcd6af0-db2e-11ec-97d4-5555813c4bbf', 'OTA_PACKAGE', '11', '3895eab0-d68b-11ec-aefb-d132b4563e73', '240011814@qq.com', 'UPDATED', '{"entity":{"id":{"entityType":"OTA_PACKAGE","id":"7fcd6af0-db2e-11ec-97d4-5555813c4bbf"},"createdTime":1653375330079,"additionalInfo":{"description":""},"tenantId":{"entityType":"TENANT","id":"188f3780-d68b-11ec-aefb-d132b4563e73"},"deviceProfileId":{"entityType":"DEVICE_PROFILE","id":"18a44620-d68b-11ec-aefb-d132b4563e73"},"type":"FIRMWARE","title":"11","version":"11","tag":"11 11","url":null,"hasData":true,"fileName":"Untitled-1.json","contentType":"application/json","checksumAlgorithm":"SHA256","checksum":"2771348a787f6c7af0be7a449d1e3ba12a49a5a49f43edf3ddb1cec4a4da412f","dataSize":493,"data":"REVWIFwgVFNUIFwgVFNUMDIgXFRTVDAzIC1NQVAg5biQ5Y+3OiAg6LaF57qnQWRtaW4gICBqb2huNDkzQG1pY2hhZWxzLmNvbSAgICAgICBRcTEyMzQ1NgoKCgpERVYgXCBUU1QgXCBUU1QwMiBcVFNUMDMgLU1BUCDluJDlj7c6ICBBZG1pbi0xICAgICAgIHJvYmluNTQ3QG1pY2hhZWxzLmNvbSAgICAgIFFxMTIzNDU2CgoKCkRFViBcIFRTVCBcIFRTVDAyIFxUU1QwMyAtTUFQIOW4kOWPtzogIEFkbWluLTIgICAgICBqaW5yb25nQG1pY2hhZWxzLmNvbSAgICAgICAgICBRcTEyMzQ1NgoKCgpERVYgXCBUU1QgXCBUU1QwMiBcVFNUMDMgLU1BUCDluJDlj7c6ICAgQWRtaW4tMyAgYW5pdGVAbWljaGFlbHMuY29tICAgICAgICAgICAgICAgIFFxMTIzNDU2CgoKCkRFViBcIFRTVCBcIFRTVDAyIFxUU1QwMyAtTUFQIOW4kOWPtzogICBBZG1pbi00ICAgIHhpYW90YW9AbWljaGFlbHMuY29tICAgICAgICAgIFFxMTIzNDU2Cgp4dWppbjEyMzIwMjFAMTYzLmNvbQlXZWxjb21lOA=="}}', 'SUCCESS', '');
INSERT INTO "public"."audit_log" VALUES ('8d267fc0-dfe8-11ec-8ed5-7dcca2d50cf1', 1653895043516, '188f3780-d68b-11ec-aefb-d132b4563e73', '13814000-1dd2-11b2-8080-808080808080', '3895eab0-d68b-11ec-aefb-d132b4563e73', 'USER', '240011814@qq.com', '3895eab0-d68b-11ec-aefb-d132b4563e73', '240011814@qq.com', 'LOGIN', '{"clientAddress":"127.0.0.1","browser":"Chrome 101.0.4951","os":"Windows 10","device":"Other"}', 'SUCCESS', '');
INSERT INTO "public"."audit_log" VALUES ('ca1f2c10-dfe8-11ec-8ed5-7dcca2d50cf1', 1653895145809, '188f3780-d68b-11ec-aefb-d132b4563e73', '13814000-1dd2-11b2-8080-808080808080', '3895eab0-d68b-11ec-aefb-d132b4563e73', 'USER', '240011814@qq.com', '3895eab0-d68b-11ec-aefb-d132b4563e73', '240011814@qq.com', 'LOGIN', '{"clientAddress":"127.0.0.1","browser":"Chrome 101.0.4951","os":"Windows 10","device":"Other"}', 'SUCCESS', '');
INSERT INTO "public"."audit_log" VALUES ('a662ab50-e563-11ec-a8c7-4b21fe31dd59', 1654497669765, '188f3780-d68b-11ec-aefb-d132b4563e73', '13814000-1dd2-11b2-8080-808080808080', '3895eab0-d68b-11ec-aefb-d132b4563e73', 'USER', '240011814@qq.com', '3895eab0-d68b-11ec-aefb-d132b4563e73', '240011814@qq.com', 'LOGIN', '{"clientAddress":"0:0:0:0:0:0:0:1","browser":"Chrome 102.0.5005","os":"Windows 10","device":"Other"}', 'SUCCESS', '');
INSERT INTO "public"."audit_log" VALUES ('24c95f70-e564-11ec-a8c7-4b21fe31dd59', 1654497881831, '188f3780-d68b-11ec-aefb-d132b4563e73', '13814000-1dd2-11b2-8080-808080808080', '3895eab0-d68b-11ec-aefb-d132b4563e73', 'USER', '240011814@qq.com', '3895eab0-d68b-11ec-aefb-d132b4563e73', '240011814@qq.com', 'LOGIN', '{"clientAddress":"0:0:0:0:0:0:0:1","browser":"Chrome 102.0.5005","os":"Windows 10","device":"Other"}', 'SUCCESS', '');
INSERT INTO "public"."audit_log" VALUES ('4decaf10-e564-11ec-a8c7-4b21fe31dd59', 1654497950849, '188f3780-d68b-11ec-aefb-d132b4563e73', '13814000-1dd2-11b2-8080-808080808080', '18a44620-d68b-11ec-aefb-d132b4563e73', 'DEVICE_PROFILE', 'default', '3895eab0-d68b-11ec-aefb-d132b4563e73', '240011814@qq.com', 'UPDATED', '{"entity":{"id":{"entityType":"DEVICE_PROFILE","id":"18a44620-d68b-11ec-aefb-d132b4563e73"},"createdTime":1652865344386,"tenantId":{"entityType":"TENANT","id":"188f3780-d68b-11ec-aefb-d132b4563e73"},"name":"default","description":"Default device profile","image":"data:image/jpeg;base64,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","type":"DEFAULT","transportType":"DEFAULT","provisionType":"DISABLED","defaultRuleChainId":null,"defaultDashboardId":{"entityType":"DASHBOARD","id":"67e27430-d737-11ec-94a0-cd6fda244b19"},"defaultQueueName":null,"profileData":{"configuration":{"type":"DEFAULT"},"transportConfiguration":{"type":"DEFAULT"},"provisionConfiguration":{"type":"DISABLED","provisionDeviceSecret":null},"alarms":null},"provisionDeviceKey":null,"firmwareId":null,"softwareId":null,"default":true}}', 'SUCCESS', '');
INSERT INTO "public"."audit_log" VALUES ('7d74a710-e564-11ec-a8c7-4b21fe31dd59', 1654498030593, '188f3780-d68b-11ec-aefb-d132b4563e73', '13814000-1dd2-11b2-8080-808080808080', '18a44620-d68b-11ec-aefb-d132b4563e73', 'DEVICE_PROFILE', '传感器', '3895eab0-d68b-11ec-aefb-d132b4563e73', '240011814@qq.com', 'UPDATED', '{"entity":{"id":{"entityType":"DEVICE_PROFILE","id":"18a44620-d68b-11ec-aefb-d132b4563e73"},"createdTime":1652865344386,"tenantId":{"entityType":"TENANT","id":"188f3780-d68b-11ec-aefb-d132b4563e73"},"name":"传感器","description":"Default device profile","image":"data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAASABIAAD/7QBgUGhvdG9zaG9wIDMuMAA4QklNBAQAAAAAACccAVoAAxslRxwCAAACAAIcAjwABjAyMjkyMRwCNwAIMjAyMTAyMDgAOEJJTQQlAAAAAAAQLjTI1XUpO5iRhpgfxoer///hAIpFeGlmAABNTQAqAAAACAABh2kABAAAAAEAAAAaAAAAAAAFkAMAAgAAABQAAABckoYABwAAABIAAABwoAEAAwAAAAH//wAAoAIABAAAAAEAAAKhoAMABAAAAAEAAAKhAAAAADIwMjE6MDI6MDggMDI6Mjk6MjEAQVNDSUkAAABTY3JlZW5zaG90/+ICNElDQ19QUk9GSUxFAAEBAAACJGFwcGwEAAAAbW50clJHQiBYWVogB+EABwAHAA0AFgAgYWNzcEFQUEwAAAAAQVBQTAAAAAAAAAAAAAAAAAAAAAAAAPbWAAEAAAAA0y1hcHBsyhqVgiV/EE04mRPV0eoVggAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAKZGVzYwAAAPwAAABlY3BydAAAAWQAAAAjd3RwdAAAAYgAAAAUclhZWgAAAZwAAAAUZ1hZWgAAAbAAAAAUYlhZWgAAAcQAAAAUclRSQwAAAdgAAAAgY2hhZAAAAfgAAAAsYlRSQwAAAdgAAAAgZ1RSQwAAAdgAAAAgZGVzYwAAAAAAAAALRGlzcGxheSBQMwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAB0ZXh0AAAAAENvcHlyaWdodCBBcHBsZSBJbmMuLCAyMDE3AABYWVogAAAAAAAA81EAAQAAAAEWzFhZWiAAAAAAAACD3wAAPb////+7WFlaIAAAAAAAAEq/AACxNwAACrlYWVogAAAAAAAAKDgAABELAADIuXBhcmEAAAAAAAMAAAACZmYAAPKnAAANWQAAE9AAAApbc2YzMgAAAAAAAQxCAAAF3v//8yYAAAeTAAD9kP//+6L///2jAAAD3AAAwG7/2wBDAAYEBQYFBAYGBQYHBwYIChAKCgkJChQODwwQFxQYGBcUFhYaHSUfGhsjHBYWICwgIyYnKSopGR8tMC0oMCUoKSj/2wBDAQcHBwoIChMKChMoGhYaKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCj/wAARCAKhAqEDASIAAhEBAxEB/8QAHAAAAgMBAQEBAAAAAAAAAAAAAAECAwUEBgcI/8QAQxAAAQQABQIEAwYEBAUDBAMAAQACAxEEEiExQQVREyJhcTKBkRQjMzShsUJywfAGJFLRFUNi4fElU4IWNVSSBxdz/8QAGgEAAwEBAQEAAAAAAAAAAAAAAAECAwQFBv/EACgRAAICAgICAgICAwEBAAAAAAABAhEDMRIhBDIiQRMzUWEjQnFDFP/aAAwDAQACEQMRAD8A/O8LcFNAD5WPGhFrKl/EeLFXoQu2fCNZEJmSCiLykrhduV0ZpdJNGcUSe6mANb7kquJ2V/p2U81s1HzVKwsuiTjZtdvRyz7Q5svwubyuGlOI5HWf0VwnxlY5K0XyxiPEubE7QG2kK443ENPlkPqCFzh2bUaDuVGRw0y+x9VXNp2ieP8AJcyV0+Ja+Q04nUjhW4rGySNMdihuR/EuJp0rndWOhLYBISKOlXurjklToTijs6QWxyPkkcA0CgSd1rTdTwZghZFE7xm3neD8XZYOGw75yWsqubK2IMLFhYy99E1q4rt8Wc6paMskVfZ1RuzNujVbKS5MBivtDXWBY0pdS9DHJTVowaoB/ZRlPrXek6vjVPM6g3tsFYiOXyZrHagpMmfGx7WmmvFGxugvcY2sIGUEkUO658Q57Yz4YBdwCk3QLs58fjGwW1ozSEcLEcXPeS4kknldb8JiHuzOaSSdSSurB4EteHzVY2AXlZFkzyqujpjxgjLljdGaeCDuAUuFu42OJ0ZfK0UxYXehpuFz58P4nRcJ8gSGyZBG4NVevKG8hYVRdljnySRtzElo0o8KEbbkaCTROyQJaK4uwpEucPEy6A1au7FR6KDERYORr5I43saKyP2/v/ZZM2M8XGMLfhB3XBLI6R1ucT7ldeAwni0948uw9V2PPLL8IGXBR7ZrgggEVVXYWLj/AM6/3C2GtbEwAfCByVj9QP8AnX+4K28l/CmTi9jUwZ+7IvW9gquqa4R38wRgNpP5rS6p+Td7hUn/AIRNfMyNPn7LV6WwiJzzzoD7LK/uluYP8tH/ACrm8VXM0yPou/soQhemc4JgfTdJHP6I2AIQmQ5ppzSDWgITASEKxoj8Ekk+LegA0pFAVoAJugfWkx6pf3pygAQg6C03tymrB5sFAEU0u6EgGpCMuidJYppAonU2ooAs1fzKaAX7IP8AdIOlhNmXN5rr0QBWR97/APHUqeUkGgaG5Cjf3un+lTDiLq9d0kMimgeyEBYihNB/VAC/RTjDC12ckOAsUN1DcqyJrHCQyPyFrbaK+I9k0BTHu73U/wBtlFml+pVjHltHSuxCmIMRFHg+oRl8hdpvspMa0zMa95awnU0nOGRzSMhfnZdBxG6pIRXWxSKfA7dkkgGQK49kkceqaQyAP3jvbZSOjb/qogfeE+lKSEByYu24mE1S7LcWgE2Br7Llx7i6XD3WhXVwso+7KeiJTRyiloIxcT+Yk05pdnSvwnfzLim1e8/9RC7ul/gv/mXBi7ym0vU7e+mlVqjsPWkBGt2Dyu8wCqvffYp/JIkuNk6ne1Y+PKXBr2uA5B3TSAghIJ99EASJomxZO1cKCD/4VxMH2VgaJPtOY5iT5SOP6prsRTr6oUqPohHYGAXZnAa1sLUZQWuo71agXC9BomXXRJ17lfNttnaIc9uyYrsEhVWlaQxpceiEgdrGnKaAkx2mU7b32V0sLmFoI0OoIO6729KjkhbIyUhpbeoXCbjJDnBwGxB2W8sTgrZKknoRZtX1Qfho381Z4bxAJHDRxoKv4rFrNpxHsTHFptpI9irp8TK+MROeS0d+VzDQkHfsgHT1VRnJCqzR6I6p3N7hbV+ixujMPiuefhA3K1y9jRZcB3JK9fwpVj7ObKrZNDCW6jcHc8KmKdsziGXQ0vurOKvTldaaejKhk3ZSQj5apgBqh3UU0JaA4uqmsMfXRZmDw7sRINDkG5W1PC2YAPBq9gVJkYjj8rQG7aBcmXB+SfJ6NYzpUVT4aOSIMoCtAVmTYGVjwGeZvdbI+V+qiTQJ02uynk8eE0KM2jHxWGZBGwufbzwAuYuOTICaOtKWJkdPOTvrQAUXxmN5a74huAvKyJX8dHTHXZXlNrSwWMbGwRyWAOQuIaiuVGqI/VTjyPG+SHKNqjUx8ofhSWO3NaFZTyXSgkngWVMkXTbrm1A/Ha0yZnklbJjHibOCbUbnf6iodT/KO9woRYiODCsGhkNkgcKOPe52DbmFOcduy7ea/HRlXyM07eq3cIP8tHW2VYR2K3cL+Wi1/hWfiexeXRahX4Xw3NljfHnkc2mOzVl/3VGUtNO0rcEL0aOcEfPndCsczI3zghx1HsgCDqBIB07q7EYqXFyMdiXl7mMEbdOBsFQFJpykHfmimgOhmAxTsJJim4eQ4eMjO+tBeypZDJIyR8bS5jNXkcL2fU/8RxY//BcXTcP0wxBkg8TFNBrTYHjuvFBzmhzQSGu3AO60nFJ9ERk3doRaaBo0pQROmmbGwjM7kmqVuGfhwycYmOR5Mf3RY6sr+57jdUuDcrSLvmwoosi4USDuOxQgISAQTpFISAEhxaZHcG/VSkkc9jGuIpgoUNkwIfshCCgBNaXPJG4FAd09jR32o8JRuyT5m2CG6EcJkk6n3s8pDBCEIECSE0DJQsMjw1tWdrKgRRP0QmgQhz7pjb07qLOfdXvY6ONhNU8ZgAUo6GysA0HGiL1FpyFrnEsGUcC0xIfCdHpRN7KtUIaZaGta6wSTqAogJqfsYy3ytNjXgFR+SZ/VFGgaTAQrXTXvaEgfO4UmNUkByY3V8Xe12CqqiuPHCjH3vdddLKPsy3ouwkkUeIDp4jNHRBYHUqjuaGl7dkMcWnSr9Udj9Vq9EV2YUnxO/mK1Oj+D9hlvP43igf8ATlpZcnxO/mK7elfhP10tedgdZTea+JpTNbHIWseHjggKCeXyk+qOF6L7MBCkUpkCtN+VFGgLMIYWzg4oSOiogiM0brT+irO5q/YpWmmAI7bIQgCfhH/U36oUEICjzgbaZLRond8qt3qvmjuHaEm1rfZGvyQIEJFO0w0deGxskURizW0jYqrOC9vlzAG6UW5S2iNb0KcLgyQFwNbGjstObfTJqjvfiH4qER+GW5dQQFx5c58t3vQC24IXGFr8PKHNOtOC5xiRhsQWTYdrXHUlvK65YbSlJmalXSMl7XN1cCPUhLj1Xf1HGCduRrABe5XCx2Ui6I7Fc04pSpM0i+uwD3tbQcfYHddmCwkmINvtse9k7rpjk6exjX0MxGorZduEnE7S5jS2PYEhdmDCm+2ZTm/ota1sMdNoNAtNrg5uZpBB5CWOje3CvNEZmWCVldKxLhIIXHynULvnkWOSiYqPJWa97fVBUGyNdI6MHVupCkVsnZAIQqJcVFHu4ewUyko7GlZagk1VnvSWFfHPHI8PDco0BHxJoXatBoj8kntzMLb3FX2TUo2F7iBXuSlQHLFhYoqLWi+5XFiMO6TFvDa2vVaqiGjOXc91hkwRlGjSM2uzAIymjxoVLRzWhgJkJrRGIH3z/wCbhdMQGFxLXOHlcNCV5Sx/Kjovo55oXQOAfVnlUONP2Xf1GZswZkB05K4CfNrulkjGMqiEe12dmEZmxLM1ZWizafUpmyOIZq1o0pUPNbE7cKMhb4egN7e6qOT48Qruyu9F6Hpob4DXyRufGG0aPPC86t/AYlwwXgxyENeBnaOa2XT4bXPszy6LWOcxzXNJDhqCOE5Hvlkc97i57jZN7pFpABINHYlK16RgCCSTqSTtqUxWm18gpvFGiBfogCI0N/qnV39UAgOBIBo3RVuMmZPinyRwsga7aNh0H1/vVMDs6X1vH9MjfFhJyIXE3G4ZmWRV0eVna6mtL1ICSuglyhzXAOYRVFNdiGcNJH4L5mmOOVuZriNwqXHUgE+6m78Foc4udwCdghkjoJmSMoPYQ4Ei6IQwLcRFAGtOHle/7sF+dtU/kBcq6sfL9olE7phJLN95IA3LTiuZDGgXdgenSYvB4zEtkiZHhWhzs7gCbNaDlcFp/Feh9ULoDpx+Nm6hO2bEZM4Y1lMaGigKG3yXKmmxwa4OoEXdHlLYEUKTnBxJoDkAKPy12pFAIGpDVfDWyY/rSRB8TY7chTljdE8skaQ6rIKSGOaJ0MpjeRbeWm1BCECEikJoGCYCQq9e9WrpCQwMoU3XMB3TSA5o9jrypjRVx7HvmKs7aadypWgZYTF9noA+Ldkk6AJzSNe1oZGGU3Ug7qohNzS007dXbEPLYsH5IAbkOYnNwAFEf9k70Ioe/ZICPHqiztZrgJ8JKRkB+I75KSiPxX/JTG6SGcmP0bGfVdQOg+q5+o14bD66roafIPZZx92U9AmEIK0JMXEipnj/AKtF2dJ/Df8AzLlx7cuJd66rp6V8EnuvPxqsps/U0BqDW/A7pdwn8JsGjuCEr13K9EwAtLdDfcWi99Ei7Xn5qbGOkcGxtLnHgDdGwIndHdBBvUG7rVA2QA0k/lp2UnG3E5QB2CYEUJ0eyEAecGyWh90x7KJ3XzSO4dItRtFpiC9VY0DKDzWyrTaa4CBE2tDjvp3XY/p0jGB5ewjerXM2PMwm6PAKHOfVOJ7UStIUtoTt6Nbpk8UMOR8gBvlcPUsV4+IJaRlboCAuQmr0UVrLyG4KBKgrsmCCdT7qLtb10tKj8kLAsm2F7hYBpb/T54XQtYymlv8ACeF5+3UNT9dkwTd2b72ujBm/FKyZw5HqyWGN4lBc3IQADsV5iAuZK17d2q2HFzRnKH2DwVENy33Jta+R5Cy1REIcbO/pTzJiJnnnVdEGJ8XESxkim7FceAliw7Xve7U6UAuXxvDxUj4/hNgD3WkM/CC7E4Wztx+Ov7uLYaEgrmw+GkxBvXJeriuQ8khWjFStrK4gDgcLF5ucrmUo0ujeiYI2BraobIdIyOjKSG7WFw4LFzTPDXRjLW9Krqc4e7w27N3IXf8AnjGFox4NypmmaOo1HBQjCtjPT43+J96TWSth3tTYWU/PmuqbXC6Iu0mQ1RDY6/qlpZ7Kcji85nEbcKtDEY5iMuNc3jNuu3HQt+zOkdKGuZWVhHxK6OFrJHv5dzSJIhLI0v2AoBcawUn/AGbc+zE1vU6dlGT8T6LqkgP2kxjcm7K5p25Ji29Qd15zxyT7N07JuOvG1JPFxk6WDdJuFuA+Sc7SzM1wPcE8qUg0Ud/0W3go2tgYQNXC77rF4+S3MH+Wj/l2XZ4i+Znl0XlxIokkN0AJUoyxur25h2tKRzXPtrcorQWl27ei9NHOTxDmPmc+JgjY42Gg3SrPz+atYYvGaJM3g3rl3UY2GR4ZGwuc400DlMWiI0INcrowuIjhMxmw7JzJGWNLj8BP8Q9Qp4jA4vC4KKeeEsgmc5rCTuW7rjRoYx6lLhNtZhmur1AV0cUmLxMWHwrC90j8kbBuSf7CEgIxvibDK2SIvkcBkdmrJ8uVVuVZPBLh8RJh5mFksbixzTwQohrspdWg0tHbAj7oQhAAgae/dSLSIw/TKTW6j+/YoAEyBlu9eQlxum1xY8OAFg2AQgDd/wAGwdMn6q1nWZDFhqNuA5XB1sYeLqkv2J33Qd5TS4nOc57n6WTwFFji17XaEg3RC05/HiTxd2D3F0ll16XXbVIkmybJrclTxUxxGNklLGMLxeVooKH7LJdlndgW4TFzhmOnGDhZE6ntjLs7xsD791wlCEC0Nga5wDiGt2shI70NfVXwQskhmc4SZmi2ho0+aqcxzQ0uGjtiU3HoLIoHuUISGRgaXWADebhdbmwmCOKNsn2nOS4kjKRxX6qmKUDDtayMB4e4l4OpHZJ5zEHQHagnGqExOFO0+qlE9omY6UF7AdQDursSzDNEP2d732y3hw2cufKcmbSu6dUwJzuY+V7oWFrCbDSdlEsqIPsa8dk2SOZG5oqnb2FDMcoBPlvQIASaeoolp15I3UVFDCPLnfmu6B0SRHXiuLtRpopyFpe4sBDb2KSA5Mf+EPdXxnyNvsqccPuAfVXxNJY2ruuFEVcynonW/ZRO6ZBCQOvqtGiTL6mP8wD3arelfDJ7qPVR52H0Uulf8zvoVw6zG3+h3e6ZCSkQB8JO2q7jEjStw00uHmbLDIWSN0Dgdv71VVHspFrm6Ou6vVACJJcSdSdbPKaQ7J/v2TAEWhOt9RoLooEFn1QkhAHnfb6qJ2SDkXqvmzvBNjXSODWgknQAJLqwLvAxMT3gVeWzwrgrdMT6L8B09s2YyvykfwqWP6cIGeJE6wNaJWvJhopaLgRru0rk6l0upnjB4h8sF+UyCiR6r0peNxhSVnMsly2cM+Iifh42RMpwGppcbnXf9F2npszS0EjXQkFSx2AGHwgeHEvvUrllhyS7aNVOJnVfKCKNJjYKcdeMzOPLdFc9WyyNV9LV+AhbiMQY3diQQjHRiLEua264vlaHScIY6mkvMRoFvhwuWSiJSpWZEsbo3uY4HTSilm8tEfMcL0GJbhpyWyObm72sybp7hZie1491eXx3F/HsUMl7OQuIA0HurWuzNHfa1GUOjj8ORtO4PdKHQei5mqNLsniGNa8Br857hV16p87/ADpdDMOZC3I5paebTUXN9CujkK78LhhbZWkSegWhHg4WMy5QdNyuefCuh+8w96a0OV2x8Vw+TMnkvon9sb4cgy5HtGyyCS4nXU8nldGMkbMfFBp2zmrnacjrFaGxayzZHJ0VCNG9hR4eHa0gXVG1PhYJmkJsvN+66MLjXxnK+3N9eF1Y/Lj6szliezW+R9ggkZar5qzBYp8JM2HI8zS2y29CqC4AWSK72uzkqsyokKvXZTDmCF7Sy5C4U++FxvxkLCbcSfQK2GQSsDmg13KmOSLdJjaog+HPPG8Gi08BZGMaW414P+pbvPosbqH513uCFy+VBKNmuN9k8TFT4i2znGwC7OqtbJg3SkMa4FoDQFbCGvjjdQuqsqnqg/ybt6saoWJRg5CcraMZbmBcHYWOjxqsRanT7jphOjxnaVh4zqReRWjuFc2hHZSY3NdVp3K9NHORAJuruuAr2Qyti8djg3IQQQ7UeyqJMbjldvoSEgC7a6q6CpdADnPeRne52t0T3U3xuDWOoefYAojjjdDI50oa9tZGEfGnTfCzhwDwQMvJ9UxEJYzGadYcNCCF0YzCYjAfZnyFrXSxiZhY+yAdttiqommadoc8AuNF7ztfJUZm5JXtzNeGnLmbsUAORssTw+QnM8ZgSd/71VZJrnXcIJJqyduSrHy5oo2FrQGaWBqb7oAgwAvAcSByQNlOOJ0mfwxbWDMSeyrUvLk3OfkcUgZOaN0TWskaMzgHgg3oVY+STGYkPmILiACQK2/sLnynJdiu1q7DNbHNC/EBzYHGyW7lVF99iPUde/wjN0fonTeoyyQyRY1hc0MdZb7ryOUlwa0GydAOV2YjHyysEXiPdEy8ocdguRztbbYPccLTK4vREE1sibGmvYpJknX15KSwNCH/ADfktI4yCTpQw82HP2iM/dSMNWOc3fhZw/E/+KklF0NgrwMP4UZLn+JqXAjT0pUITTEdeAghxH2nxsazCiOMvaHgnxCP4RXJ/oqcM6Mzw/as5gDhnDTrXNJYcROmYMQXNh/iLRr/AHspQYd2Im8OAZnE00E7p7EGNOHOLmODD24bMfDDz5g3i1GFgkcG5gCeSVWdDRGu1IB0ri0vsZGMeU+5U3NLTRHv6Loyvw2DyyxRu8cWx5OrKP8AVc7cx0BOvFpUFgd9PZSLWiIHN5yfhrZdGKwbsLE10kjBKTXh3qPVclaX+pVVWxbBPTIdNb0KSL02UjG57nABxJDdACdlH3v5JnW/2CQ0II72kMQI8R9baVasDAYi/MLB27p4bI/F/e/CSLPZdnVW4aHEj7E8uZV6qox6sTfdGPjvwR77Lt6fiTAwOyg22qIXFjtYSaG6tg/Aj9llF1kLa6LXuLnKB3KLr6qQBdZHZW3ZBn9UGjNOVDpZ+8kHpau6p+FGfVc3TjWJHYjZcM+sxuvU2WTOZBJEAMryCSRroqwmdgkBqBp813GAcJ2TrZPGpSI1rdMHLmBAvaimOwA319UHdB2tA3BIB7g8oAm+KWNrHSRuYHjMwuHxDuFfh5YfAeyaIZyQRIDq0Dj9lTLNJLlEj3ODBlaCfhHYKs8J3QqJeXuUKFIRyEeaQhOl8yegJSLiRvomK0B90jWbQ2O6pCPRdOxkc0QYTlkaKoldwN1RFd1l9NwcM3Tw5wOcne1DDYwYUTQzEksOlcr2sWVxiuZySjbdGvQ11Hoq8TGJoHMPOxXIyV9HEYh2RgFtbe67Y3CRgeLpwvVbqUZqiKaPP4CL/PNjkA0OoI3Uup4Z0UznhvkPIC0pMJWNbPHX/UCuuSNsjC14BB3tckfF+LTNHlp2ZWHw78U+CZ9Fg0JrstevpwqMHD9njLLsXprsr104MXBf2ROVs5ZemxYqQ+YRuO5J0WVPg54c1AuYOQVvudpsBXI5WLj8Y6R5jisMG5HKx8qEIq2VjlJujhe5zm5XEntfCiNB6KbW5nhrdSTQAXfjOnlrA6PtqF5sccppyR0OSRnxvDXhzxmaNweV1uwhezxcK629r1XCdAR9QV0tl+zsBikNkWQBsnjkl1IJX9F8GOkhdknBI2sjZdwxkBZecfNYs0z5jch/RMQnwi9xDW8A8reHkzj0iHjX2WTZJJ3yN0Z2VHdA2Tba5JSt2aI78Nh4cREHCw7YgFVY3C+A1rmkluxJVDHyRHyOLb7HdXnFPd5ZAHt2ohdCnjlCmuyKdnUzFNjwADbrajwVmPke7dxrtakwAvANhl6+i7ZYcMIXFjhdXdocp5I/8ClE58DhvHkt3wNOvqteg3RujRsAsjBSmKYVs7cLXJA1J+q6vD48TPJdgVj9S16gdq01AWnJPHGzM5wr0Kysc4OxhcCCNKIT8qacaQYlTNHButrm8tOifU5HHp5j0yZg4CtlX08OIe9woO2vlPqf5R3uE4t/h7B+xjnYrVi0kwgsfhm6WVx6rTwB8SUHhjA0Gly4H8qNJ6NFpaA7M2yRoQVZhmMke5r82ZzaYG8u4v8AVVOrMcp071ul89e69VM5js6mzBsfCMDJK/7pplMjQKk5ArjZczZC1tCga1PdGf7vLQ00BrdVpgM8b7cjdCtfM6bL4zicjMraHZVIAVqcjWtdTHBw7gK/E4yTEYqKaZkbsjWtyhtAhvev71V/WcYOq9TxOOiwsGEjfR8GEU1mlaf3ymIz0FXtjZ9hfK5kufxA1rgPJ6367J/Zj9hOJ8WIfeZPDJ8+13XZFDs50ITDvI5uUWeSNkgEg2dLNdr2XRicHNh4MPNK0BmIaXxkOB0Br5cqueMROADw892p1YEIyGyAuBLeQCm/KXuMYIZdgEqeKw78NL4ctZsod5XXvqoyOiLIvCY5rw2pCT8RQBX3XRhPstT/AGwzD7s+F4YHx8X6bqo5BHVuz3djZQKQER8Z/lUlH/mn2UlIwQrIxEWSeK54fltgaOfVVpgClG7K4nXbcFRQjQAgCzt9EK/AtMuJjiaWtLzQc40Gp7YjmYSW63v3Uk3ta172sJLQ4izymIpHROkDD4bTTnVoCkugIklx1N8WVc+drsJHCIhna4uzg6lT6ZixgsfFiDDHMGH4JB5SqJX+JM+TIGhxzZWjQKvoX2RTJutuwpSe5j3EhuQVsFBS+ikCebQjTXckbKKsZE57XuaRTRZsoQFLT5n/AEUvmojd/up6f9lKBlOOFYUijmu7UsL+CyzpSjjnF0Djp8kYX8BntSz/APQr/Ut5P6FK6JT/AGSI1WpGzk6m0/Z2OsVmXHgSBjI72vUhdXU9YGa6Ztlx4XTERn1XBm/Ybx9T0TTA2GQOa4yEgscDoAqDukUl6DdowoZRfP6o4QkxjO9a+hKOB+6ZcXAAnQaD0STAQTQhINAhCExHmq2UxVfuo/NMr5o7voDv6KNppD0KaA3MB1KLB9Mezw2SSublGYfAb3WfgW/accPEO5uyuVoTY5zHFzSR6hdLzuVJ6RHCro1es1J1I4bDyiaNhAD2DQ/3/RbETcrGsHAWFgMTBh4nF1mQ7WFdL1QmINhaQ/Yk8Lsw5oRucnsylBvpHT0+cvlmjcdWu09l3FecwU5ixbXknU0SvRFwoEke9ro8bMpxM8kKYwEXqVzuxsDSRnGnZWQzMmZnjNhdCnFukyOLRVjGTSDLGQGncrPd0yXhwvlbB+StEbThvF8QZ82Xw61qt1nPx45HbGptGbg8C3DkOcQ59b0uxSLSHEEUexCitIY4wVITlfZx4rAsmaS0AP3BCxxh5C4ta03etBejtSGVrAAwA3eYDdc+XxI5HZccjRkYXp5rNNYPACjjMMIm5nSkm9AVrSea9T7hccmBa8297ne5Wc/GSjUUUsjvsySNOxpSgZ4jg0EAnYqzHR+HMW/w8KtrPuc44dRAXmuDUqZ0X0Rdd5TuNFdg4PHLhnDSNgRuqDo7bnlWysfC8PbYBFghEF3dCbJQQ5sT4Ul7UaUMRCYZC3UjuAp4WQvxcbnnXYkrUxBLGFzWB3pS6ceKM4MiUnFmNE/JI12jsrgaI3pXzzS47FUwAF5oMbsFHEPjkosZkPIVLSWm2kgjWwudtwfFPovfZLFQOgoPI12A4VB1ePdXzzOmDc/8OhPdUD4x7pSacviCTrs34vwmeyo6mP8AJONjcBDsVHGxodvWwXJjMV48Dmtact3ZXpTyxUONmKi7OFa/To8mHDiNXm1kcFb2CIGHiLhYqyDyufxY3MvJosTa0uJqzyaQdyQKF6BNrnMcS068kcr0znI+405VkcZmkcIgcoF2eygTfunq0aEgnSgU0BEcoUmuyXoKPBCC4nT+wgC3EuYY4RHViPzEd1BkTnxSPDmgMokE72nhMPNisQ2HDxuklds0cqsgtcQdCNCOyf8AbEGd/h+HmPh3my3panisRJiJQ+UguyhtgVoFX80JWMAhrS51CyTsAN0KTHFjg9pIcDYI4QBEggkEGxvfCP2Tc4ucXONuOtlJAABtQN8Acq7EQNiZEWzMeXtshv8AD6FVMdle05svqAp4lsbJ3iGQysB0eRVqloRCQtJGVtaVVqKEKRkR+If5VJRH4jvZSSQ2MGuPTXhIoQgBa9lY+J7ImSOAyv8Ah13Sa8tN6a72EnEE+UEN4BKaoQkBCK0vhIZPDmNj2mZpczkA7oMjsjmNc4Rl1lt6KsbfqmhPoGhItBUi8ljWUNNiBqgGJHbT2QUAnugASF900JBsBXblDhpdir27IA8pOYb7JvbTA6xZOw4QgOfFj/LuTwZrDNB37on1gd7JYQ/cN/RZP9hS0XuNnXgIrM4gILsxGYpchakFfVsM1vS45/FZmMuTw78w03WRAfvWH/qC0uqEfZWanNn0FbrMj+JvuuDyf2G+P1NwjT9Ugpsc1sjC9udoNlpO6JS1zyWNDWk2Gjhd67Rizq6b02XqDMU6F8Tfs8RlcHvDcwHa9yuMIPO+2tHdM76H5pgCEjsgJANCbmltE1r2KSYWCEIQB5u9EuUguvBYJ+KzFppreSvnYxcnSOxvqzmaxzjTQSewCNfntRXSGz4KbMWnymrI0UcRM2WQvazKTuArcKXexJlI7Ug38kXZJ+id6eqzsoANFON2QbA2N+yhmQRVag/0QAwddPkunE4uSYAE01uwBXLtykVcZuOiWrJjzOA76L0sEbIIQBQHJXmhsvSQVNhm66ObRXd4L7dmWZdF3G9qUcjmXlrXQghZ+BnEc5w2KcWtB0dS7bBBqq7heljyKRzuLRKRxe8ucSS7UklRQotka5xaCLHAV2JIlXOqSmxpcHAEDS9TuoIAEjVevqmke9fIpAZ/VogY2yjcaUqsHEZMHINNTpa7cbGZsO9oGu+ieFj8GFrfna5JYby2aqfxoycazJOR3ANBa0TQ6FgcARlrULkxmHM2LYBdEamloNa0GrNegU4cTU5DlLo4zgw3ECRlAA2RS6ZHBkZca0115Utu6J8PHLhA4yHPmrIBx3W6hxT4kcr2Yb3maXRoBPACi9pY/K4Ee60nxxYUZhGXdiFwzzGZ9kAa6UF5mXFxVvZ0Rl/BU4DWiqXfGrneVwBBHoVVJ+JfC5l0aHSIHyyAC9RuQunGwtgwTmN7iyrMJOxwEdAPH6qvqzvumt53K7o44xxuVmLb5UZnutzB/lYvZYfBW5hPysX8qPE9gyaLkIQvRMAI0tBJc6yUdr+iOUwG9paacK0tJB9z80wacDQNHYhAAxzmPDo3FrhyCpNyeG7MD4m4IKliJvGndKWsYXH4WCglK5rgzK2qFE3uqQis99aQrGPBMbJSfBDrIbuByjE+F9ok+zZ/BzeUPOteqKGRIAANg2NhwlVuoJFG3KQBvaDwgXdbJnQZSBod0ARQQjYhSI8l2O1IAihTmdG5w8JpaKqieVAIfQHT0rBP6j1OPCRyRsdLoHSOoBVYiIwYiSJxDixxaS02NFUx2V76GtCjasfDK2Fszo3iN5pryNDXqhaAgOOUH6eivlma7CQxiBjXMJ+8G777/wB8qgoaoLsEIQkAJ3QIIs8E8JJvcX1Z14oJDJYbwix/jF/wnJl7/wB2oJMNsb/RNNaAtwkbJsTHHLKImOOryNk45DhMa2SItk8N/lJGjqVH7oHCdiosxEnjTvkyhuc5iAFAI9h6n0Q3ca+5pIYIUnNAeWtNjgocxzKzAg70QihFbefddGFjheJfGeWU22kDcrnZZNAa3op3lYQd+5SgDKcQPuX9q3UcCaiYRVg8hWPdUL9vhO4VOA/B9LWb90WvU7B99P5i1hcdSRooOGVxGh1q73QCAb0PoUr02WpOjk6n+CP5lmx/EDxa0ep/gD3WdH8Q/mC87yPdG8PU3Dr6Lq6dPBh5nPxOGGJjLHNDC6qJ2OnZc7q4KS749GAd+17ISF36qVEOp2/ZMBJpmtK7a2d0humAK3C4eXFTCKBhfIdQBzSU8ToH5JKzb2CoMc5jg5pLXcEFP77E/wCiXgv7IUbPdCfxF2YH2Vxw7ZQ4a6UrMFipcIXAatuyCo4J7vGY1lX2ct9uHjkH30bc5GwXi4Mbn3HpnVOVdMzMT1Hx8O5mSiebSfBA7ptxPHiM1JKniemuL/uG031K5J8HPC23tOXkgqp/kTfNWJV9M5Qj3TsWm45gBpptS4ma0R0tForukkMLTSQhCJWtXD9QZDhY2AEuA+iymiypDelrjyvG7QpRUtnZjcQzEZH0RIDqO6lgcQW4pmZxyHSiVwpj314V/nly5C4KqNvH4wQDI2i4+uyj0pjvDdI/d/dZDnGRxe82ebK6349wiYyHygDel1R8lOXKRm8fVI1myh0jmCyQN1Ys7AvMODfLJZJN2V2wyNlja9p0I+i7seXkjGUaLEdr2TboboGtwVAuGpcQB6lbaIR14LFuwjMR4bIneNGYqkbmoHkeq5WgZqcdL1KA6qOiSLAHgNe6tdd0NIslwvsLRV3r6gKKQw5RZy1achBPlFabWopDFvpXySMTc3wi+NNlLRSNg3fzScU9hZkdSjyyh1aEUuA/EvQTRiWMtcBrpZWHNGY8QWHcHfuvM8nDxlyOjHK1Qy8xzNc3hOaR0gcXfIdlNsebFNYQaO66epxRsgYWaG6IA/v1WUYScW/optWZuwXoOnNL8K0NrRl2TsvPnb5Lcwf5WL2XR4fuTl0XmNwjEhHlJoapfJCF6JzgRqhCCDeo19UUAKyGMyPDdAHGgXFRjyU7PeavLSWtHVPQDLSL0sA7jZJjQ51EgablTZNIyCSFryGPrM2uyrTdAHdWQGISAztLmVVNNf3wlCIy4+MSG0TbRzwoA0fneqQDaQ1wLhYuyLQazX/De1qU0niyFxAHFAKH7JgWz5PFLomuaw/CHFVtaXWQRQFmypSSGQNBOjdAFH0B/VD2ISRTISKkYIQmCWkEfqgCsfiO9gF1SYueTCRYV8r3YeMlzIydATvS5h+I/wCSkhDZJoe/RoJrYAbKBFE6elFet/wF1npfScVM7q+CGLY+MtDSdlhddmwuI6nPL09pZA821rv4fRauK42Ryd0cCAC40LvgBCPr8lkijqjw0b8LNL9oYx8YBDHHV99lz5rirILGuYDZQUg9zWuDSQHaEBOwIM+BvtSm1uZwHKg3RgXdDFE5rpIpQ3w2BxEh1J9EQXIGwxnT58Lh4ppY3tjm1Y4jR1dlyDZa3U8disR0/CQ4iV7oYwfCYToAVkDstc0Yp/EmLddko8ucZ7y8gJPAzHLeXi0EFrqKk2KR8TpGsJjZ8TgNAsv6KFC7JIHaGjdVutTr/V3dXxLJXQxRZWBmWNtXSym76g7a0rI2ujlbbw01mBJTUnVCaWznZ/FvYNKe+/8A5U2ujdCQGHxs5JdfCRhIhEmlE1VqEiiqT8N9bVsqMD+CfddMjfui4VVbWubp/wCEfdZS6milo6E1JrTI8BrSSdKASIIGt32pa0ybOPqX5cfzLNZ8Q9wtLqP5b/5LOj0cw1pY07rg8j3RvDRucD2U3vztYMoAaMtgb+6i4hziQABwBwhd60Ygm0BxJJ43KiEBPoQc7IN9k+yEgAkuqyb2soQjv2T2CBCVoQB5xltOZpojajstro8eNxUsbmvYc3luR1D6rFY0uc1o3Jql6fC1Dkw7aORtkheR4kbkdGV9FzM9kSNALdCQbtRxEYlw72EgAjcqT5Gxi3uAHFlZ+PxTX4RxhOhNX3Xp5JxjFps54pt9GK+PK94sGjVg7qsGiFcAS0nVVEbrwns7EBclauw8InmZHdZjuV24npTooXPa/MW7ilUcMpq0DmlszFINNpEFu4U2vGx34WdD2Ta3KEvkmTmA/dMR/dlwcL7FCVi0QBTr904yMwzXlvWlfimRsaHRPBadaJ2VKLasLOcaml14bBvnNmmt7k7riB15VrJZGVkcR7FVjaT+Qnf0bGMYGYBzBw3cri6XM6OcRn4COeFCbGvlg8NwG9E3uuUXrS6cmdclKBnGHVM15+oMYaj8xVEPjYyUOdpGDrS44cmceJZb2C2sLI2WMZG5QDVLbFklml8mTKKiujoa5zY3RgjK4ixXZR/X0KCitl6KMCJ/RCnq12oG3KgkAuUFHKCgATvSr0SaavbbQFTmEYc3wnF4yiyRWvKdAQB1BNd6KxupUce4gDggBbCx+oCsc699Fy+V6I1x7NGGFoIk5rfsq+qAfZD3sarqj/CaufqgrB8akHQ7KnFLE6EvYxjsfZbeD/KxeywzsVuYL8rFpwuXxPY1y6Lk2NLnBrfiOgHdNjc7qsA1uSkGlzqbZK9GjnB7Sxxa74huOy6Mc+CR8TsOZr8MB5kr4vSuNlQQK3N82o/JOxbG2uTogHKbbuDYtSJjDG5bzV5iTooIYyUj3SyOkfWZxs0ErtuWhe4KSB+qLAtnkbJ4eWNsZa0NJB3PdVKTSM2u3ZMZDJrYZ6BPYaEzJkdmvN/CQVEKxkZc0vA8rTrqoXRsb8IAVGtjW1oynTQ1tZUi52XLem9BThdmaYnSFkR81VygCtwo1YPqFFH92VbDA6WKaQOYBEASC6ib7d0gKkIQkBEfiO9grHEHYHdVgXI/5KQ90kNgVJ7w5jG5AC3dw5USdf6pKrFQxv8A0QdSmx2SRrxWZpuiN05XmSRz3VbjdAJUH2RSOx9kx2+ikQ1rX5yc1aAIGVs+AfRWPaWkWQfUHZVs+BqlYque6IvoCchJYy3l3AB4UBof90IQ3YicjcrqzA82CmyeaOGSFsjhG825oOhpVA663XopOFcgjewnf2A4gHSAPflbyaSdWY19e6jwUD2pKwCAltua6iDv2TJGU6HNe9qDNnfzKRSWh0J3wu9lzdP+B3uup3wnXhcuA+GT3tZS90UtHfhp5MPOySFxZI34XBBme1krbFP1JIVYHlzaVe1qN6LZNk0c3Ufy2/KzYRckY4LhotLqH5Y6chZ2H1njH/UvPz+5tj9Tb7o+aBqd0Bdy+jIOU0kwCXUASdgE9iDtohB0u9+yVpgNO2m6se53SQgBV6fqhNCAMDCzHDzCQMDqGgPC0em45gM75j94dardZY2QG0b9F4GPK8ejrlFSOnF4p2IlzOJrYBD6bhGa+ZziaBXO3ffnVSJs7+gHZDyNttgom10/CxR4Z78QQHPFAFZ3UME6B2eMF0Z1BA2Rh/FxU8UZJIG+uwW6XR/hOI2qjyu7HCGaFaMZNxZ5aJxZI1zbsGxS3JsfE7DnW3OFVSeM6XE4ZsO+nEXS4enMdFjzFM0HTSxspjDJgfH+Rtxn2cj/AIdfoVXlAruu/q0VYtrYwLfVALmxUboZAx1WBa5J43GTNYysgdqC0cBA3EYCRtDO06ELOyuyB/8ACdLV2GxD8O8lvwuFEFGJqEvloUla6K82Ulj2g1uqz8/mrJi1zy5pOvdVrOT7KQXWqYdpqNOFFCkB3ZvVTboOVHY76JgpgWNGYgNHmJoABbmHYIYWtNWAsSKTw3B7KzA8rrmxolwpbVPJ1rldni5IwtvZnkTZoRztke5rbJbyrWnUA3XICzcI9uHwZe6sztQCV1Qzh2HErqHfVejizKS7MJQLpZYvtJZGXVVgFB5WOyYvx4eNi7bstgcp4sv5LCUeIJfspxO8N4cANDeoSccznOIFnegtSBOIJ0aBpXukB9OUkwR2/VAAQR9FjdQ/PH5LYOv7LH6h+dd7gLm8r1NcezWZ+E1c3UvybtOQuqMXG3tVrl6mSMI73BVy/WxL2Mcrcwf5aP2WGtbpryYix123UX2XH4rqZrkXRpQPhayYSxGRzm1GQ6sh7+vP1SZRzODgwt1APKqReuy9NM5xk2SfnQUbT/ZKkgLDGRk1Hm1oFQOh9UwdDp872TYxzyQ2rAvUp7Aima0r9UtwVdJiHSRxMLGDIMoLW7+6EAMgc5rnEhrQ3MCeVV8vmnncG5bNVsSopsQ7PBNdrSRwg7pDLImh2UGQNs0b/dJ4ja14BLnh1Bw2IUEIsKBL911RYGeXDGdrD4Y0ut1ykUf0TcWgTBBHlu+UI4UgQb+I/wBgpgEg0DVakBRH4jvkuvCxYh0E8kLCYmtqQgcIgrBnLSEJnU8dtEAI7pqUeXMPEBrkAqJ302QMDrzwpFobCHlwJN+VIbg1Y7HlJ+tkChWgRoRGM/dt9t1I81soR/A1Whw8MtoXd2haGRUgWmwQb2BHCirj4DzAGgx6U9xN2U0IrccuZootvcBRUqAceW3VpPrMcuyAIlGo3762n8vmm5xcSSdeSpGVwmgdt/qpHzG6ob0EYdpdmoXV87J6VzdpRXQMC2t+y48Bs/ta752NY4ZH5xls0Fw4HeQeqjJ7IqOjqpABuwLTDS7QXfYJsprwHXlO5C0ok5OofljfdcGD1xMfutHqgb4D/DvJehI3WfgPzTVxZ/2I2h6mxwhozOrTU7nhTidGGPEjHF9eUgq7BnDmKSOeNxkfQY9rvh+XPC7krMGyowPa17wM0bTlLhsqx3v6Lt6lgMT05whxTJIZCA/w3tIsHYriVSVCQjabm1Wo11IBQhSUCEIG4/ZAAhTzj/SEIF2eZaLKll7FDwGvcAdjV90r/ZfN6Z27C+D9U8ygVOFniyNZYaXck7J7A2ehtYWPeCM5NG+Fd1eL/K+JVObsQq8Fh2YN9mYGxVWp9VkrBkWDZqrXrQajgaZzPudnBg8c+J4bIS5hNa8LUnia8xzMrM3W+4Xnjt89CumXGSPibGDTQKNLmw+TUWpGkod2juxGIhOJjMYD5boEo61A10RlrzjS1z9Kw5fN4rh5G7E913dUaXYNwF96XRC8mOUmQ/i0kcEUf/o7nEa5rVWBax04EoGXY2VrQwhuBbERrl1BCx8LD4s/hk16jhYZcfHiXGV2T6hh2QPBicC13AOy4zwrpGmN7muJsHQlQeBV0uTJ7aNI6K0rUmguO2ndSewN2NqBkfVRB1Ug273qlJkZfeXWtaQkBJjo3sLXW11aOCiurD4WCegHlj/9JUcVhzh5A0kEHlbSxy48iVJWUWXACz81fJMTh2w6ADsqmtLzTQSd6ChepFGwpjKSHVnd0uHNJ4hGjR9VqlYjcVJkDIvK2qoLoghlPnmkLWjgld/j5VFcYoxnFvtmkU7GUCvNeptc+GmExcGA5W6WSr13RlatGLQkIQqAFj4/88e2i11kY/8AOn3C5vJ9TTHs2sNIInxSZGvDTZa4aOXL1dtYQuNeY3QOyuZ8DfZc3U/ybvcLSf62SvYxytTDmpMLXMdaLMWlg/PNDX8Ea8/B7G89HehB3QQvVo5htFmia9SknlNXRy96TynIXWO1J0A4ntY5pLA6jdEoMn3pe1obrdDhQCthnMUU0YZGRKA0lzbLa7dkWBAtc4F+U1dWBouibDxR9Pw+Ibio5JpS4OgAOaMDYn3VJmkMDYc58JpzBvqq/wB07Ad+U9+6KvRDjdUAO6R4/okBYIicO6XMwU7LlJ8x+SqKkWkNBN0drSQAKUWTxGmWzHeoadUPblrUGxYoqKAO+LquJiwBwTZD9mzl7WHuuB42Onm1FHZJCqUm+hUMULv/AMJIQpGQH4jvYK5k0jGPYx5DH6OAPxJMhzQzTZmeVzW5SfNqEmAFzQTQO5PCUehsSE3ABxAN8WEkCBTcymMdYt3AKgOw/RBq9Aa9Uw2B0NJO0a72TGp/RD25S4WL7hIZGP4G+ymGuoEc8qDfhFK6V7XBvhsyACjR3KI6Eyvk99kD30TYQHDNZHICR3OmnqgBnfagjYAab3oguJAF7bKyJscjBGWkSuOjidKT2BBj6LbAIGtHlDwc10KdwFEDKTYsc0m51mho0bBICuP4Xe6kTp+6Ixp7k6JqUNi4/ouXBEZ5t74AXWB5hoa3IXJhNMRN2vlRPaKiaWDxT8LLnjALqrUXuoAtObM0uc7RoHBSdC9sTZS0hjtAe6THFpBbYcNiCt7emQcnUbbhnB2hB1BC4en/AJptdlodTcZMPI97i55Nkk7rg6cP803vS4M37UbQ9TVv+wpMdlcCPexwrYoPEhe/MBl4J3VBGui7aoxNDq/Vsb1eds3UMRJiJWtDGuedmjYLnwb4mueJojLmYQ0A1ld3VHZTieWWW3mvcJp9hXRF4yvIsV6JLrw8cbYsQ/FQyuOS4yDWUnkrjCGgTGg76DTsr8FhJsZiGw4eN0krtA1oXd1/oWO6Fim4bqeHfh5nNDw13IKKdWHJXRlIS17ISoDJiw8bZcmJcWHW7C5ZAA8hptt6FXYvFOxRZmaBlG4VD2lrq+YIXz2Rx1E7Ff2RKKQUXp6qEMmDQ1JPuUw8uoEnvRKrUmDXZPkwokdttVOObwzeRrjXISrbXTZJzeUJ0BpYOTFvlaC0BnoNlq6O8pqwNl5uF8rXeV7mjmiuqLFPjxHiBxNiiCV3YfKUFTMZ47NDqGKGHZlFeIdh2WLFO6GXxBRPNomkfPM6SQlxPdduCw8D2B8zhmOwJUzySzz+JSioLs5J5nyyZ5GkabAKku7LU6w9rYGMFb3pwuBuHc7DGYfCDqFnlxNSrY4y6KmuI225SJ1/omxwaQSLHbutaGDBYmNromFrgPM0u5UY8Tm6Q5So5WyYd+G8N1tcNjSYwsrMksBzc2CtE9PhlayOOMNkJoOve1kzibCTvw7nEGNxaQD2XTkg8dc0RF8tHTicO58bZmjJINwCuCR73EZyXHYWV0RPfiJGseTtVgrnmYY5C0g6d1jkfJWioqhNkcyy1xBqrCiO9+pSO6Wvr2FLCyy+Nrz54wbadxwpYjEySta1527cpwxTV5nZANaJVb9dCR7hapuK6J2aPTZoY4g0uGYnW1qtws7sH9rbE/7MH5PEA8t9rXnPscuhaLB2IK2MDJi4cIcNJM/wCc4jzeW16PjZJerRhkj9osQhC7DMSyMfpjne4WwFj9Q1x7jXbZc3leppj2bIlLsNDHlFM2IGptc3UY3OwMjw05GuFkDa/wCyr47MbBptuqOoyPb0+SMPIY9wLmg70tJfr7JXsYq0+lNysc8jfQX6LLK28EAMJGB2XD4sbmbZNF/Nq7C4h+GxDJo8uduwc2x9FW8AEAJb8D5L09HOWPnfIMsjjlOtAcqDHBocKBsVrwoFWB7RE5pjGYm85KaYED7Lpnwj8JiDDjWuiflDq73qFzJucXG3OJO2pQAj+iEJcoAkQMl2buqpRTQkBOCKTETMhhaXveaa0HclKSN0bntkaWljsrge4SDzmBBII1BBQ42TqauzZTAXdSc5pjaA2nAam1FSa7QXVDbRACpuQanNfKThRIsEdwgnU6C+wUiW+FWXzXeZMCCsd4P2ZtZ/GzagjTKniI4myhuHkMrcoOYtrXkKo+g1S0BAfiO+Smo3mkedNhspKUMEIqwgeunqmAAlpBG/BQUHntwUIAB+iDsVNoaWkZjm7HlVu0aUADfhGnqnZ2/RAuhppXHCuaHQsjljkaXOsUBqERVgylTjZmc0WBelkpyQyRtBewgHUEjdDCJHRskcGNui4DYKqrYrIOAaSLBrkLrkjwo6fG9srjic1FhCMdHhWTStwkxkiYaY5zaLlVhpWQYmOR8Qe0Gy13KaVMV2UI7JvILnECgTt2SGlG9d7UMZFlgHvexTBsDb3UWGxZ73at8ng8+LfbSkojZBcuGH+ZkXUFz4PL9vk8QkDuAs5+yKidrC9wEZcco1AJ0UScpOyiTqTevdGXlakHN1E1hDppYXF07TFN11orr6o+8KG3zouTp/5pmulUuLN+1G0fU1r33pLhX4nDvw5YJAPM3MCDehVJOoGna121Rki2Z7XwQhoAc0UQqRuUUrpoHRRRufYc8WBXCexaIsfme0TOfk2NHYKBDdcpNcXyj5ad6VrJIxA5joxnJsPB29KQgJ4DGTYHENmw8hZI3Yg7Lu/wAQ4/qPUcUyfqskssz4xldIbJbwslXQxSYnMA+3tADWuOp9Aqi2+iWknZVRQtj/AOnOq/8A40n0Qn+KQvyRPBqTiCG0NebUEL5Y9EZ1Poo8J2hGwADVTzEApNHonls0PokANJPKkDRGygBR1BtTFdkw2W3uVWXH5WpB2lV/2TJGXi0CIHXYn1CVbVfyUvkujCYoYZxc2FjyeXBaQq+xPorZBLPKGUdtSeFuRRNjgbGAMoFEELgg6h5vPH8wu2SdrcO6QbDgr0/HjBJyswm5HBi+nWc0HvltVYaKbC4phe0hp0JXb0yZ00T3O/1fRW4yF08eVrso3ut0/wAMZf5IBza6YpMXDGaLhfYLNxzopnh8TvNyKVz8DFEM00p+q4jTZLis0bshY58k2uMkVCK2iMUhieHt3B27qzGTNmeHgUa1CqJzOJI9SAuoNw80RawFko1FnRcsbacUzR/ycj43NY15BynYq5mHJwvjxu1abIHCcrnNw7YZBRB5XPHI5gc0OIBGoCKUX2HbHJK+R2Z7iXHkq98Uf2djmPBfyCVytaXE5QdtaQElJrY6NzBSN8BrS4ZhpVrov1XnGnUVd9wumFmIkIDC73JXbi8ppVRlLH92bbXC+D6Wgev0XNhMP4Qt7i5/JJ2XQu6DclbRixLHx3553yWysfHfnj7gLHyvUvHs2GjLGwA2C3Sly9UH+TOvI+S7TDIzCQzOrJIKaQey4OqOrDV3K0ydYyY+xkFbmD/Kxeyw1uYP8rH/ACrj8T2Ncmi5CEL0TAk1pcyQ0KbrqVEb1yjlCAA6f9kIQgAQOBztuhMiq2244QAjpeiBvqa9UH3RpXNpoCcjWtdTHEjg0ouGgOnsOFEJigdRY3IvdAAhM6k1oLugkgA/ZMuOQN030NKJOidaA3twgAZo4XeXkjhSkyWMmb5pZiAWg+UnWwoIAQ+N/wAlJRb8b77hWFwMbW5ACN3BShivSvqkpMaHE+YN9TykRXIv0TEJCEIAEnfCbUtK5tTY6FuGnEkZMpH3bgdG+6KAjFK5jTlqnNykEKUBayVrnDRpulCLL5c15a4XZg3YVssn2yKQtyHK1jqp3BVQEzc/xP17A9UweGiwuEELo2Brj3K85CzxnhlhtCySVPBMw7sQBi3uZDR1YLPp/RVHK1wdu29Gkq5yc+2TGKj0iLWjOLutwQuiRxe4CcU2twNSqY3hkocANNaK1f8AEfWP+LzxS+BDBkjDMsbaBrlJVQ3sxjua2vS0cIaQDZ9yDygnzWNrulmUQjPl1HO6so6ZrqtFVH8PzVhNnyg9qKURsWy5I/z0i7HfFtXFLjYP8+8Xqs8n0VE7DWX/ALpXZCHCiND3Fo4WhNHH1QVFH7rk6f8Am2fuurqn4cf8y5cB+Zb7WuHL+02j6mwdRufYoSHbhO13bMRHZMuc4NzEmu52SQUAWsmeyB8QrI42QQoEHQ5T3vukpGRzg0EmhoPRUIircNM/DTxysrOw5hoqkikug2e0/wD7A6l2j+iF4ukLX80zP8MDztpJj9Ul8qekCAaQhAFjpMzWggachKwXCifdQQEAXGne/wC6hsVEcboJNlAFrSANtfVBPsq2u1Vm4QABB5UNfmgH3TQjYdPDB4QDQRl1AC4sdOXuc1rj4ZNgALma42bTfbuPkt5ZnJcUQonZgMSzDwODgSSdhwumPqxjJysGoo2suWOSOs4IvUWog+9rSOfJBUg4RfZ0OM2MmJa0n+i62Yf7LhpZH6vIqhwuPDYh0D7B8vIWvI0YjDEWacLBC2wxWS29kTbXX0YI2XaOnufGx7H6O7hcjm5SR25XoYJGnAwMawZm6lwO/wDeqjxsSnJqRWSVLowcWJWuEcpBLdlUI3mMvDSWA0SAurHAyY0tHegtGCIQYM5h5f4tELDzm19A5UinCOwkcIykB5FOJ5Vcs2EMlOaK7gLPnLHSOMYpt7FShwskxto0vcp/lfokHH7Zp4YYZ7vumChqTS6XObGASQBdBcsDo8LJ4LgRf8RXPipjNi2Rt+EGtOV1RmoR72ZuLbNRSYA51OIaOSQlwEl1J9GQu/usfHH/AD59wtkLDxJvGOvfMubyn8TXHs2o7MTBrVbLh6odAOK/qtCHMyKNwBAOxpZ/VgQdbstoA+6rN+oUPYzCtzB/lYv5Vh8Lcwf5WLvlXN4nsXl0XITIOp9Ul6JgWRSNjEgdG15c3KC7j1CHODoQKAcDWnKrQmmAB1AjvuUfshHzSACnYy1Xm73skhACpNA3F7JkDKKPO1bJgJHyQj5oAFOJzWuJcwO4o8qHZCEAuSikBSFd/mjYERv+6lk8jngigaonUq3DsiMn+ZMjY6Jto54/ooGIfZ2yteHWSC0DUe6dBZS0+d6kot+J/dTLS2swINXqN1CGwLTtuewSUo3Oa4Fhp1bhJ2gGp9lSQhtLcurb9QUNbmaTmAoaA8qKCkAzbSNAoP8AhKkdVF/wOpDHolES3I4VYIOoXV1PHS9RxZxEwa15AFMbQFLmaBk1OvACNqIP/ZNPoTXYtUySaQ4k1e1aKbWZwcoN8ikbDRAtLTqPVOJoe6i4NHcpEnY37HhL5IAK1TDTRNH1PZJMnXmuQCkM7Gswv/B43D8yXOsg8Lh5UsLl8niEiO/MQOFKcMEjvBJLL0Lt6VXcUxaIWcwJ172uS/8A1Fx29F1tcWuBFexXG831AnuFhl+i4nZ8W5S7oHKY01WhJwdW+GMetrmwB/zTV0dX1MRPqufA/mmLgy/tN4+prhFWgcpk7LvRgyUkbo6zDUix6puGgeGEM2spOkLgA6yG8FOUFtMzhwqwGna1QgkIc4EAAenCgd/ThMnSr/RIfokAw0vssYaGpoK57sO7BxNbHIMSHEveXeUjjT6pYaOaQS+BflbmfR4TcWTlt1HTdwN1SXQmV5z2CFXl9UIA87SF3Yzp8mFjD3OaWuOhC4w3fdfOzxuDpnapXojSDwpta51BoJPYBJzS0kOsd7Cji9jIphpN19FJmS6dYFbhL4XeU8pUMQ9d0VqpEtNd1EjcpUAISO6EABKYKuwuHEzwC8Adyr8TgjCyw8Fu9grSONtWiXJHKPdAck7Q/wBUR696UDOvE4nxsNE1zBnYfivdd+Gjw5gjNMsjW1iuPCYJ21r0XRjzcXclZLhapG6cDC8Zso9wVaxrWNyt+EbLIwcWIk1a8tj5NrSZK2OYQal1XZK9HDki+6owlFro5uoYQuJkiHuAurCWMPGDd1RB4VhkY3dw9iUmSMeSGEHvS0jCKnyQnJ1RUzDtGIfKaLjsCpYouGFlbZqr3VqjK3PGW666WFfCk6JvsxcG0OlJdWUA78KIdJhX00mt/daeJhhwELGlzJjI0Opp29FlyZnsLqOQHRebOH41X2dEXyL/ABTixkeAHgW0qGFErXl0TASDRvhVsjkczMxpochdGBxDYTIJAQTyUoPk05A110dsT3RROfiCLu67KWFxAna4gEUaorJlkfiJdSbJoBbGHjEULWgcb912YcjnKlozlGl2WBY2MaG401tYW5GzM9oc4NaTWYrG6m0M6lI1pDgDo4cp+UviLFs2YJcuHyOYHAtppJ+H2XD1cB0AdrYO5VuFkEuHYfkVV1L8o75BaSlyxCSqRjrcwf5WL+VYi28H+Ui9lyeJ7GmTRdfF6dkIQvRMAQhHuEAB2GnshTfTnHIDlHB4Q1ocxx08vcooCCK/soCAgA559whA1IaK1PJV80Rw8skUoBlb/pdYTAoQiqA1Fo/8o0A8poOIOUnchIqRe8sawuOUagEqKAJl9xhtCwbvuoNPmF7XqEJFFhRsY/Fwu6fDCyOMP3zAarKDqjLQ46nUA7qCkxrSx5c+iNhW6uU+TElRAAeZ2Yb1XZTdmcMzrI2snZVs+J/6q1jHyBwbZA1OuyzRRbgWtfM3PeQauI4C0f8AEQ6aMb/6UZXYbKNXjW+VkMaTmIcG0L1O6WYka/IraORKNEOPdi/ZH7cJgA3aYaCxxcdeAOVlVlC29+6rk+B3spkaXRA2tRf8BSYxjYfsmRVXY00sJDYeyk5xdWYk0OUIBubWTUEnYArqw2KbAwN8MXepK5Gjc9krvhUpUJosc7xC9xoVsFAOIaQNjuCnJlLvLppVWiSPIaBDvUJMERFnjVBFIF8b7aJ6g6jX1UjEx5dC1pqhdaKWrzxoLKrj+EJ7+yFoB/Rcb/z4002XXS5JPz7PZZZdFQOwbIQx2R4OldikTr89lr9EnH1QXE0jgrkwP5pi0OotzYZ1BZ2C/MxrhzL/ACI2hpmwE+PRAB13010QDoR9V3LRiwc7MboXtQCSYFC+eyiTSYiQVsrGsjYWmy4WQeFVevomdh+yE6GOINvzuLW7EgcLr6uzAN6g9vS5JpMHQp0zacTz/Vckbsp4rYjuiXKXkxghl6BxVX0TXY/uuzkKOncIRYzFxE8k77kcSNwFVvz9VrYLpxMZfNuRoFmSRlj3NduNCvDy45r5S+zqjJaRqdNw5wznyT1o2wQqOp4mCeOmMJduHVstPCFs2DjzAG20b5XH1mFrMKwxtAa12oA2XbLHWH46MlL59mLVAWtODDYVzWPEgrZwJVnT2Yc4MHEZM17nhZ+MjjZMfs7iW8ei41D8ceT7NeXJ0LGRsZM4RkOZehCIWuoljS4Aa0FUHuy5SPWyFbBiXwMe1oFO78LC05dlV0c7iCT2R+yVJsoHzBZjE12U2L9lcHF7SbOnBKbYWOjLg7zcBUhpZep+XKavQDcVbGXMYDl8p5IVJ4Wl0qRjg6KWsnF8KsceToTdI4wC4kgDuUHalo4vDMbG5+HI01IBWaAdD+irJjeN0xRlZpsxLMNhmBpDj2BXHi8QJJxJFYNVqqHD1SLSCDWi0eeTXEFBbOrCx/aH0549SStaKNsTQ1le6xTDUIlY8b0QDsr8Ni3Rgh9u9CV0YMix+xE43o1kKEErZG2NeSOykvSTUlaOfRyvwYkkL5HEjsOFHHRBuDyxjQG6C7UnDM0g86EFZywxadFKTRndNfkglO+XYLixEhlkLiAD2HC0mYYxwSNB8ztgFXBgat0pB7ALjnim4qJqpK7M+OR0bw9tWO4XZFjpnkNawE1Vhcdeah7Uu3p7/Dd940CImi+vhWOFyUqTLno1I8pwvnJ8W9ABoB/dLE6h+dPy0Wri5oohI6J/iRjRrgN1iTSGSYvO5XV5WRcVEyxr7NXpzcuFFkeYk0l1L8o73CtwcRbhweNqvZVdS/KO7aLVdYRbkY/C3MH+Vi9lh8LcwRBwkdf6aK5vF9y8mi5CEL0TAEJkEHUH5pIAsjmfGx7WOIa8U4DkKABOgBvsAl22+fC6J4zhMQWtkjkNfEw2NUwKDlytq8/NpIPqiq4QAuyfc8ptFmv1Te10b8rg5p4Dh/fogCCYQe+m6CgAQmTdbfJJIAH/AGQRrWnujXskmAIQhIZBnxO7WpgkbXR3AO6gw+d/uppIYlPN5ct+tAKCuwohOIj+0l4hvzFg1ATRJXz+qnNKZZC8ta01VNFBQdl8R2QnLelpIv6AYst30GtEqD/gcpcb0k7UEJMY60CONjfdIe6aEH2IFNCExAVayPMwOBoDdUlSa45SAT3pNAG231SJJJJ33spAppDRBnwjVMFTAaA2if8AZRAUrQDAsgfKyuXEtDcfHqD7LoO43XNiPzcZWeXRUNmvhsGHYuGDFSDDh9EveNGg86LmxDGslc1jw5oNBwHxKJc57tSSdrJSvvut21XRHZVidcNIP+lZWC/NR91rT/gP9qWTg/zUWvNWTsuLP7o2hpm5bms8rj5tCFHsrcQWh2WMDLVXW6pXYZF07o3BoiaW6UbO5VThW9fJB0bdj27JVfGnNIbsQ6FA3re1bI4ReyP2SAKv27pnkfqpOe3JlaD3JKrtMAQhCANSNzWut7Q4VVWszH4AYgl7PLJ+67Y52SyCFhBfdBo3U3Nc1xDgQRoQVUoxyLiyE3F2cHS45Io3xyg6HQldc0DZ8PIx/wAPNKd0o/VKGNRjxG5W7MzqTooImxMY3ORVkbLGe47Xa78bDisRiHv8I0uWTBzxNLpGEN915HkKUpdLo68dJFCXCsjjfK8NjBcdhQQ+MxyFjwMwOtLkcXs0sqQVYIy4EgGu55UWtzE7qQItcW/DfstiFuHPTczgDpbiN1kujylGVwBAca7ArTHPg7FKNiIFEi/murBRxyNOeUMIOoXITVgpN3CmMqdsdGtiIYI4yWzG9wL3XE6gAbB9lVqfZSiifKcrNeaVyl+R9IlLjsjm1vjsrCCW3wRou+Hp7X4QZrEne9kpsM5mBadMzN1r/wDNNKxKaOXBtD5mtcaG5JV7cO2aSQQkU3uuI97+i7cMyaPD+LCRR1IARiqXTQS6O/BwuhYQ6id7CvrWuexWbD1FwI8VoruFotkEozNNg62F6eGcGuMTnkmtjIokfJRUikQtiAGp/wB0jumQMo3TYLcBztXdOrHZmvwuXHNLR5Dr7K52Iw+sbiAL1BG66juuLHxxNjc9zRmOxC5Z4/xpyiWpXszpwWPLLtoN1apPxDv6KzKXNc6iQNCVA6PB5XlttuzoXR1tnmhfQuuxC6MXJ4uAc6iNhRXThyJmN0GYabKvqbS3CvBrfVehGDUG76Mr+RjLU6a5zWiN38QzNWWtNmkeDI9rXPg6lZc9Hcn2990FWmYmARUKBuwNV6qo5iDnOlfbtXHTQKNVod+QU46zts0LokBN9B7g12Zt6EhMALi5oB+ForZDDQoAd9QkHFoIBNb0EWTrfqaQBOeTxJC4gD0AUXOsAUAe6igp2AXR/dTle6R5e5xc7uSqz7ppBsSY9kISAXzTS/vVSZTSCQCBqQeUwIlCbvM4mgATsOEkABQPRCDWbS69UgIM+J/upqLfjf7qSSGCEdl0R/Z2YbENmY985yiJwdo3vapCZQCMpFa3dpfv6JKbC6N4e3QjYkJbAik7ZNziXEnc6k91B58p7JMaLY2sLjncW6WCAkBbdPi5N7qO4Vs0Tococ4eYZtCmtCK+P3VhaBCHaZrq7VaRPuhATjbmsGhzaif+yV/VO/RAbLIcPLNfhtLqFmhsoEFpII5o3wtXofWpekicRxxv8VpaQ8XVrPYBiJSJJBG0kuzOGitxjXQk3f8ARSCBXbsujA4duIxAY+VkTSCczjpoqIozJoyrqzZSa4gFtb8qI9VY7sbwA817Clx4r8xCV2FxyZNKu7pceL/Fh05WebtFQOq+2iOEyNtvkiirS6EVzfhP/lWNCcsjHXqDa2Zfwn/yrE5C4/J6aNsfZviiBrp3SO/9VGLWJp9FIDVdcXaMWO9tPf1Tad6NDsUhV6jTspRsMkmVoGvBKpCG8scBlFa6kqJGvp3TcA0aHXskPNev1QwFsUCgfNtyByhCAJWz/S76oSzFCAMbFYjPivGiBYbuwdluYHGePhTJK7zN+Irzbn25xrQmwArYp3MikjGz9/ReTi8hwk2zpljtHdL1B82KY2MlrM1acrbd8B1ANbnheZ6eWMxAfIfKzzV3K6sTjZJ6bmLGk1QO63w+VSbkZzx9pI08HiRO1wNB7TRAO6eMg+0Q+Hmr1WZjIjg543xXqNT3WkzENOEExoCrpdGPLyThMiUa7RLDwMw8TWtGoGpKyesYfJOJW/C/kcFWY7HnEZWwMMbcuV2u/qu90LcRg/DzN2vMfRZycMyeOH0Uri+TMWFr5AGMBJ7DhSxmHdhomZhRduQVvtwowzGCm2Wg207rG69KS9kQ2GvuuefiLHj5S2XHLylSM0uJ3Ptqg2N/dJg1snRWOYSCarTlcFWbERvsCDp7KGWjWqlqBugXdk6ooCbAMhLmEgchaWExWFblAZkceSFDpzqiLZm/dPNAkLmxmGdBNTbyuOhHK64J41ziZv5Ombwo7ajuFVigDh5L2pZUIxkJpjX9wCFoZpHYF5mGV1HRd8M3ONNGLjTMeCMylzW1dWB3Wp0o5oHMINtNUuLpX5wbVR3WuyARSF7QRm4pc/iY7fJF5JfRF+HiJJdGPXRSjY1jSGaeitOtEnU8KB9vmvQ4JO0Y2x1YPb1URt62mf0SO39E6EC68JjPs+ExUH2eGQzgASPHmjo8Lk4tHbRGgaFa5sdGZYQG7g6DuuoVfp2Q5pDQ6jlOxUzjyVDTo5IMPkwzmO3dv6LLnj8LEZL10srd7LI6k7Njia10FBcfkY4xgqNoSbY4sQYJSBq07hTxmLbNh3Ma08alObD5cN4hvNuuJ+jCuWU541xLpPsrWnF5jg29hmWZ31/RaPTQ5zy83la3KCeE8D+VBPRooQgr1TmCrv6oVr8NPHh48Q+N7YJCQx5Gjq3pRlcxz7jaWiq1KqgIJg7jSuT2QN9fnSnkLmFwAAGlkpICD2hpIBDh3HKGOyPDgBbdardLb3SG6YE3EykkAbbAKKLIvU9tErSYaGhNozOAsDXclI82dtNEwJueZGta+qYKFDdQPv6IQfmjsBtdlJ0Go2I2UUzqb59kkAA3/dNwrnTbVK9vdBNnfXdICDPif2tTon27qEfxP/mXRLG6OGFziC14sAFKK6Gyrg680FJj3MzURqK1CihMRdg5hhsQ2V0UcwANseNDY/v6KomyTsDwEkEGv2PdAAoSfA5SUZPw3JMaLAabWlHuEvnqgf0QmBOFoe4ijdXQUBV6j9UzbTyNO6SLEOgSSDQ7JJBCBki4vdbu1bKLrA12r6oTcSRr7D0SYEWfAK37hWRkNJDtjpdKtnwBTIGUG0RfQEXUCct1xoo9XwwgfhHNcXNkbmBIq1a01pQPFnhcvUC64QXktboATspy+rCOzrirNbtr1A5Wh1zE4LEzsd0/CnDRCNrSwuzW4DUrMo7i65PZC0jKkKuyuX8J/ssP+7W9MKid7WsHj0XB5e0bYzbw/wCBH/KrDuqoPwI+9K2tV1Y/VGb2M/omCRZG/CQHlvT2KtxOKfiDF4gaDGwNGVtaBaIkrrLlcao6gWg0dtuw4S7fS0NNG+UWMEwCQTwNz2TbmkIY0ZnO4Ciy2Oo1fY8J0INeyF0+Gf8A3YvqhPiKzzERym69NRuh1an9EzIXNaNKbpogVyNN6K+bs7ghyncgKdl7xW/ACroWSK9lbGyZtSxsJo7gKo9sTOzF4p0sTYpYyHNN2uYyOMLY78gNgKMr5ZHl0u/sqiCFpPJJsUYlodWvOy6sHKDUcz8sQ1AHK4AD3+SuhyPsOcWnjTdLHNxlaCStG4zFwEgNkHssfrNuxrjZy/wrowUEcpcyRjg4chcuNYI8QYw4uA0BPC7M+Sc8fZlBJS6OYfEr553YgMbQ8ooABdrOnxSNDo5Na2K7YMLFCAQ0ZuSeVGLxZy/4VLIkUM6fEYxYOct11WVicO/DvyuGh2I5XpTWlX7rh6kI8Q0xtdUjeDyurP40OHRnDI7KsDNEcM2GSgTuCuHGPdHiMhcSGHyG12jB5sCBJTXNFghZLrc4j9VyZpSjBI0grZqQdQfHIBOK5sBWY/FRnDuDSHFw0AWM1zrp16d0wdT2ULypqND/ABpuy2CTwHl4Avi12s6iGxgOJc/14XEyCSZpcxtgdil4Eg/gPuRuljyZIL4jkovZ1O6hK4igGjjROPHy5hYB7ilRFhZZCBlIHcha2FwMcUReXAv7EaldOJZsj2Zy4ItDi5jTRTqxWl8J5XZDp5b1KKLaJvuCvSr+TAiBqRr2SVjj5aNe4UQxxYXhpyjSwEUFkUifXTgJkWL+iKGW71uqSAshhErZCZA3KLondYPUPzx+Wq2R76LExkvi41z6AFgUB2XN5TXA0x7NWRmfCloAtzaF8LPxWE8HD5y7tYpabPw2GtKXN1L8m73CnLiUo8mOMu6Mc+2q7ocT4MDGMbZqySuH5K4fC32XnRk49o3as6hi5SdGgnsAu3DvkePvGAdiFyYSdjaa5oHZwG60AdKB0Oq9Dx25d2Yz6JvkeWNjc8ljNWtJ0bfZVgJoXWZAj5n2QhFgSZlc6pHEN4ICTc1EgGhuaSpTjt1tz5Wu3sprsCyS8VI90UTWBrbLWnalz0g70NtrHKfCGCEE70H6lJFJaAZ47Ivy1enZCRKYAhSa0ODjYBGwPKigB3pVD3RldlDqNHYkJJlzsgaScoN0TskBXHvJ/MpqDN3/AMymktDYKTI3Pa5zdm6k3soo766JiDn0UnngEkDuouBbVjcIQAFQl+AqahN+E7XXskxkhr7p7Ea/LskNh7JoBjNnU9t0My5hnvLeoBS4Rx6piA1Zr6FLZSLda59EjYNVryEDF+6eUlhPokVIW5tC9tkUIgyvDZR427JlSbG6NjC9pFgEAjdW4rwjJcDCxnAcbKEugsoGq5cdsz3oLsGxsX2XLjrEbDR32I3WeVfFlR2dINAb7bIcrY4JXwiRrC5tWaGyQ+K6BFbErRLoRTLrG72WD3+i9BLWR1dtV5+lxeVtG2I28MPuI/5VZ81CEfcxiuFZXlJv5Lqh6oylsP2Q4UdwfUJWnXNaeqskXz+SD6HVFUTqPcKTWlxoBAwDi05mkgjUEFK71J+ZTc2jqkOdEWLY9UJWhFgYA9KpO/VJoIaTrl7qfgvfh3StBLWmiey+cSb0dpNkLn4d8raLWmiAu7oxkyytZRHAPCt6Nh/8s9xcC2QVQXR0vDHDsfmFOce/C9HB47uMkYTntHPLhJZHGTEvDWAXQGyynuGYhpOW9CVvdaly9ObGGjMXWXDcrCgZ4kzGdyp8vHGM+MR422rZFp4rW1fhoZJZR4QGYa6rTxHTw6Vr4yGnkEbrqiw8cbg5rAHVRICrH4UuXehPMqKZZXYfDZpa8TgAbrAkLs7i+7O9r00kLJHAvbdbArH6lC52NcGjcXpwtvKxPj0Til32cTDKCSxxsa6FaPTcZK6QRzWQdLIXN02QsxDT/CdHAhboYwEkNHuAs/FxyfyTKySWiS4seyF2UySZHcEFdM8jYoi9xoDVeblkfPMXOsknYLp8rMoLiZ4427LnySNc5glLm7Egqg7aLodhXsw/iuBHcFUjfX9F5OTl9nVGisk0QRr3Sbd+vKtNXptwo5aPyWQyUM0kR+7cQN6XY3qUtAODT30XEAm1mZ4BIAJqytYZZx6TJcUzTh6mAQHsA4sLpGJhds8X2tcM3SsRC9rXgDMA4XyCrcP04CjI4k70F6OKebTRjJQO+7Ao+XcUUwdr17ApxtDRlA4qhwokV6HYru7+zEkLqzWUG6JQQ5zsrAddgCq1Nj3scC2wRqCE0xEXWNDxpRUUzZJJ3PKRUsYGvmsPFRmPGEWKzWKW2sjH646tNwuXylcTXHs1WHyNXL1Q1hSK1JAXoep9CxXTMBgsTiQAzExiRhB4XnOq/Awd1plTjj7JhJSl0Za7MGwSSMDgCMutriK2MDGGxMeLst5Xm4YcpnRJ0gb0188rWYYEvcdGgbq6FksQMUwIew1R4XbhGStDp4niN0fmBJr6Lne5z3uc9xc46kk7r1FgjD5I5+bfQkFSYwyEgUKFkkpVxzV6K6JFrvrvoVIscGZ602BQXuLAwnyjYJO9z7J9ALdFmq4QEJIBBMjUfXZIqySR0lF5stFAVsEwIBClHlzjPeXmkPy+Icl5OLQBFL5KxvkOemkHgqBOnr37oASZHlB0snUJEGro+4QgBvGU1YOuhBUSmnldkzUcu1pAVM+J/wDMrFBnxP8A5l3YXGNgwWKgdhopHTUGyOHmZXZEQkzkHr80c7aKcLGveA94Y3eyFDv+iKADrSEcIQAKEurHfRTTDo2xyiRhJIGUg/CbSfYyIQgoCAY0ISTEHz1tTzAHQcUbKj2Q4Ac8IAnFIGZgWB1ihfCi12TNpxoopO0a5DYzT6p1WTqTcMZmRtMMLYmhjasBcGriP2UYGtdlDnBorchdT5ofscUbYamBJdLm+IcClS7VsnXR1RYSBvSnYo4hhmzZBDWoHdYfUw5rG5t7vQrpJPrXC58dXgtv/UozP4FQXZoYGWcBseFc9r5m+GQDvfCqxUMmGnfDM3LIw0QlG9wYwRk0BYrhQe4vc5znFzidyU0/iJ7BzHOje5rSWgUSBssDuvQiR8cMkbXuDJB5gDuvPH+q4/L+jbF9m5AaiaK/hCne+3uoRfht/lClXqV0w0ZvYE5jakNWb7a13XZ0bpsnVOoxYSFzWvkdQLjoujr3SHdIn8GZ4c8Eg5eFsoNrkZuSujL+I8DXldUGGMrCIiC9upJPZcik15aCATrvXKmLX2UL0I+aQPFD5oR2SAKQi0IAx48NO/Dl7Rce+vK7ugvY5s8EmoOoB5VvTpGjpT9bLQQQsjDSmHENkaTobocryEo4eM0dF8rR3PMnS8US0ZoHcFdsHUmPIEjSwHY0qJsdBiYZBKD2aFn4XEmHyOAfFd0Vt+f8cvi+iVDku0aXW5A6GPKQRm3BXJ0pgOI8R7g1rO5XLJIZCRZyg2ATso8b+4WGTPyycy4wqNHphPEdpG+wKsjPiODYyHE9ivMwQumka1p1JrVbOGwRw7w4SH1B5XoYPJlk+jGcFH7O57Sx7mOAtpogFRc1riDQzVVlc/2wOxIijBceSCukbjuutOM9GVNGHBE6DqQjIBB2scLaKi+JrpWyV5gNCpn/ALUssWL8dlSlZy4zDuxDQ3PlZ2ARhcDDh/MG5j3JXTwhW8UW+TFydUPEwjWORoFjUWvPY7DnDy1/C7UFegJvXlZ/UMNJiJYwygwbklYeViU49LsvHKmZDWlwdQJoWaSsOpbIwrcPhJdbcWmysWJji1zqOUFeXlwPHVnRGdl7cO90XigVHeWz3ShiMs3htIu90mPc2Ix5jkOtWujpkYdiCSac02B3U44KUkhyfRq4Zr2xtEzi4gUTfCte4ZneHYbtRS767cEJSyAkudTfmveiuMaOPZNujcwcMw2CgbdeuvKLvUEUpEAtND3IKexED8IFe5VkMphdnAB4ohQBoa6pcA60gYNdT8xaCLuimGOmlyxNJcTsOVEFEb3RyNfGS17TYIKAIkEGiCCNCCNlj4/THH5Lbme+WR8kjsznHUk7rEx/5700XL5XqaY9m9LjZ8RhoYppHPZG3K0E7BZPVQcjDxdLshcHRsIOmy5+pi8I48g6J5XyxhFVIxzstzB64WP+VYZ2W5g/ysX8q5PF9jTJouOo3O90hCeU5c3F7r0bMBLpwMz45iYwLc0tNtugVzfupxyOj1jJa+twdk4umDDKKJBFA7KU0kb4YWMhDHsBDng/Gqige6GxUCEaUdPYpJUMaSOFcYZIoo5ZIyI5AchI3pNICoc6IHurGOdG11D4hRsKtDVASaG5XWSDwAFFCSALoZ3QxysaARIKJI2VNoTNU3SjXKbYCTs0BZrcBJCkBRluSSwS/NobTUWHVw/6lJJaGGmU663QCE2nKQaBI4PKcr/EkLqDSeANkxEUIQgAUJPh+amoSajdJ6H9kuNkK2d8b2xiOMMLW6kH4lWnQXYIRv8A7odoaBsd0CBBOiHCiK7bhWYYQnExjFF7YL85YLNeiBlST/gd7KycM8aTwXExZjlLhqRx/RVu+E+yTBDaPI3RNIbKTa5QgZa/EPlihjfWSMU2hta4seD9nJ0rMuolvifCWxk7Arm6gGmJxjJy5tAUsvcWEdlsALo42giyKslNwymtNDrRSwsZfhw4EU1t6ndARH1QPYnbHXhYR3IW+9oA0PpSwT8Z91y+V9GuM24vw2+ykEmaMaPkpBdUNGbLIZZIJGyREtcNiOFbisbNjDeIdmPcqhznOAs6cBWf5f7Hf3n2nN/8cq1Unoho5xvXCuMeVpcdW7bqr/ypOcXklxJPcqU0MQQgamr+ZTo5qGp4SAWvqhT8N/ZCdMLMBkkkTXNjccrhqO6rGisaddVC/Ma2XzdvR20CYGa6vbhJbXSIYXQF2jnk0QVphx/llxJlLirOHAMhlkLJiQSKaQU+oYM4YhzXEsOlnhR6lh/s2I8l5XaiuFUMQ8+WS3su6JWzSgnjkuybb7QYeQxytcLsHhduPxxljDI7A7rkxDGxNblPxi6vZUCUteHUDR27qY5JY7imNpPs2+k4cxxmR48ztgRsFo15QdL2pYLOqygiwK7BbuExbJcO90bWEPbVkahet4uTG1xic2SL2xOQ3+ym3U6/qlS6jMD7ptbmuiNBrruoqTB5XOzAFvB5QHZEj/bRBrL/AFVkcnlMclmMmzQ1VRRQFOLBdhpAORVLnGF/9PMYADq19V3PDcjaJvkEbKmVshYfCcA7tSxyY03bLUqMyXAvbEHNHFkLl8YxvYW6Fp0IXXL9uotNkdwN1w+G/OQQcw4rZeTlXF3FHTB3s2zjofsgdR8Qm91ntdLjJQ0k1ewXKrYJnRElh519VT8lzaUtC/HWjbY0NYGjYaaqWl63VbhcLMe0tAcwg8kcq5uKicPiPsQvShmg10zBwZ0taXOyMrzaC1B1jQ78hJj2vNsJ90yFsnZIggpg62EjzqkAEeUG9e3ZY2P/AD7vktgLHx5rGnTsuXyvQ1xbOzpx+6eOztE+p/k3+4T6cysOXEfEbFpdT/Jv+SI/pB+xjHYrcwn5WL+VYh2K3MLX2OEg2cuoXN4nsXk0dL4XtiZI6sryQCD2VZ2ri0IXomAqT0yoQgACAhSY4NcCWgnsUwIlShf4cgdlDvRw3UsRGYpS1xaTvbToohg8IvzgOusp3KddgDA0up5LW9wFITPeI45JHOjjNNaTo1Va/JSjaHPANDiyU06Eelxb+in/AAzhmwMmHVg8mV5PkLeK/vuvOiPNHI8EeXcXuujpc2Fhx7D1CN82GF2xrqvt/RcsoyyODbAvQE7LWeRSRMY0wjY6R7WMBLjsAokEEgjbf0Ta4tJrfgqNrAsF1TiCV0X2ZpblYPED3buXKm00QSL11CaYA6i7QAegSaCTQ3UnkOkJa3K29AFEaUbPuEmBBm79P4qKmos3f7qSlDYDU1+6sieYJw4AOc3WiLBVdXsNUVR1v1VCAm3E0LOtAIQdya04Ta0u2Gw5SASidR81JI7JPQycbmte0ubmaOLVuJnE2WomsyivKN1QUKk6VBQiik0c3XySCwqq7oKnPIZXh2UDigFBAhFLh3ZNJx7dkmBYQAwHnsok7aDTakDUBLlMY9z5r2S6m+N2Fb4cWQACze5UnOs2qMZ5sMd67HhTJ/FgtoeG/AZ9FbR2pU4X8BnsumGN8jqjaXHs0Ix9xQ5dMq1F66rDP4nzW89pomjpzWywh+KNOVzeUqovGbY2FbK5jWui0BD7sknSlVdtaK1rVTaRlc06HgrqgZsflEI0Oe97Vakxwa1wLQSRoSdkjWlX802JBwd/dCWvfRNADAF/spQyGKZr8odl4cFApnf19E0B0/bD/wC1F/8Aqhc2qE+cieJgh2XcKrN5r+auZG+Q0wFxrYKbsJKG25hAHJXzag3o7rKWtL6DQcx4HKuwzpcPiQNWu5BSij8jnh4a9ptotGImfMWvc7zDkK4/HsNmr1bFRyYWOGSIslb5g+vitYrTqrsTipJ2MEoHlFWBuucEK8+T8krFCPFFjj6muLUTttr7IB2/orcNM2Cdr3MDwNwQso9sd0Rw5iEoE15TyOF6DAxwxR1A6wdd1zvweHxY8WOmWNA0LlxOFxXR8YGTeV2hoHcFejiTwfJq0YyfPo2pHtY0ue4BvJKy8R1F8zxBBo1xsmt1xY3FvxDtSQzgAq/pkbI/v5XAVsCVpLyXklxjolY6Vs2QKaNdVMR3EX5m6GqJ1KqieJIg9t0e6m2swzHT0XoxqjERBB52Rl8t2PZDnDORZ0GxSQAaZebQDrsitAkgA/8AK4uoSeC3MxozOOpK7a0J+VrL6wfPGLNVsufyXWNsuC+RwtGd4HJU5IzFKWP3G4C6un4QuLZXVQ2BG6lj8O8zOka0ltXovMXjvhzo3590ThwcT2ZmuJvUFXR4WOOj8XFlcnTpwwmN5oHYlaVjuF3YI45RujKbaYNa1o0oHegE25bBcDV8KI/ThMLqRnsied6SVlhz257I5A7IkDDK7wrEd6Bx1ARsLK1jY/8AOn5BbSxsf+ePyXL5Pqa4tmtHQjaBtWi5up/k3fJdhe1zWljQ0ZdgVydS/Jv0G43Vy/WSvYxVsdOlzwNZywarHGy04Pu/sr27vGUjuuDx21KzafaNJxblFAg97SjYZHhorfclJHtfyXqHOBFEjm60SQmwgOsgHuDygCKd7aajsjn07Kcxjz3ECGVs4phZAuJNk+tkI7pJoASYSTQAKTo3BjXkHKdATyo7EGtbV0s75pQ54FdmjZNAVOaWmjV+hUVOTLmOQnLvRUCkwBCuOFm+yDFeGfAL/Dz8ZuypQBKKR0bszazeoURuL3tCdVyNuEg0QZz/ADKSgzn3Kkkhjq6/cIGxuya0Uy0tY1w1B0NJPaG5acDYsgcKqEAd93loVuCogEuoeyEfNIDqbDh/+HPkdMRi2vy+HW7e9rjdx9FJRfx70iT6BIkhFG6F3wByjb04IKABSaWi8zbNUNVFM1lbV3zaEAkI4/ZCAD5KL/gPalIE0e3ZRefIfbRIZJm3FUn/AAjbt7pHjhA5QAA+3ZVYoH7K81orFXitcO8apS9WNbDC/l2nilr9H6piOk4kYjCOYJMpaczQdD7rIwdfY2nN5r1FbK4GtR7IxOkmKStkpJzb3EDzWSByvPA28GubpbjwTHIQNGtJPosFu491y+W7aNcSo3uNlKkhWi2en9KixXScZi3YuKKTDgERuOr77Lsxxcl0ZSdbMdJSy+aiQPUpO0Nb+qGgsEBuY6fIKTcmQ2Dn4IKiNKrfuEAIijX1CZJOtDtoEr3T9dKvYoEWZWf6/wBELq/4iP8A8XD/AP6oVdCtnlY5XRvzRktPcK2SabFPa1xJJ2AWw7pbHYBge5rJALsLEfG6KRxhJeGH4gNl4ksU8aX8M61JSJS4WaJhc9hDdiVTdr0sAGM6cDJYzCrI5XnsTh5IHU9pq96Tz+PwSlHQoTvplbtRXCqcOArD7qHxLjNCUTg14JFgakd13S4qCVjg3D+YjQhcbA1wrnsmCTsK9CtITcUJqxh8sWgJHNAq7FY2TFNY2bdnJVBvkm/VV13TWSVV9BSJDW1dhmCXERxk0HGt1SPZBJa4FvxA2CERlTBnqWMEcYa3ZuwQe2l+6ysJ1ZzQWziwd3AKXUMQ64p8O4EAVYK9peTDhaOX8bsujxb8R1N4cbDWZBQ7f2VbisXHAPM4ZuACsBsz2OLmEgnQkIja+eQCyXHck7Lkj5jqls0/EbPT55Z3Pe8UzgUu1VwMEcTWNrQcKxehiTUe32Yy2Hz07Kp8LHva5wBLdBatSO6tpPZK6ACttuwCXBUg6tqvuhot1WPcp0qoDgxGGja/O5vkdvR2V0MDYxo4kb6lXvjDoyHVW1FckMjo3GKarAtp7hc/GMJWXbZ0vcGtt1ItcJk8SVrpCfDB2C645oXPp8mUVYJCcc0W6BxJjc6oPP7qDZYzs4eynmsabHlaqSeiSIGu+qx8f+fPuFshY2P/ADx+S5fJ9TXHs1o/gaufqh/yb/kuiP4Grn6nrg3acjQLSf6yV7GKtNnmbg2/NZq0cB95LGf4Y2UvOwe1G89GgpM33obXWytxGEmw8cEkzMrJmZ4ze4VI/SuF6qOYJKDiA4EXuAkkmmAKRjfkzZTXchRG/cdl9A6j1/8Aw9J//H+H6fh8Fl6s2sz629bVRSezPJJxqkfPlIVrfypADnEBoJ5oJD5+wU6NLLIY2vbJnlDC1tgEb+irTYx0j2sY23uNABdXUHS+IyHEQshfC3IQ1tfVOug+zkQhCQAgoS3CAGHOLMmYkXeW0tk2nKbG6XJQAIKEfJIZBnPuppMIy1WuY2U0kDGHGqs1vSimDTgTtey62YmJuDnhOGY6SQgtkJ1ZXZWlYjmacrjYB0qjwooQpAbKvzXVcKD/AOH3UlF/Huk9DRY0ljg5p1GthRJLjZJJPKChMAHqE2OyPuge4SGpo0B3KZADqu+LHKF/IuhHUkgCuAEd1MxkRh9Cid73UAa+lIGIpSfAVJoL3U3U9lF+jD3SYD4COyBsPbVHZAEmvy3oNdNQqcR+DJzpauL3GNrNMo1Gipm/BffZKfqC2LAsP2PxMwrNVWrifVc+C0w3rmKv3CnH6octlWLeWYaWiRYo1ysVv/da3UPyzvellVqFx+S/kjXHo3W7BWNcQKs+w5VbNh7KbmuYac0tO9ELvhaRiyUjml+gOXbUqLy0uOW69VJ7i5rAQNBVgbqCpsS6Emg1SdgsAy+a7JtKrGRCdeqONgmxpe4NbudkUBFCn4bv7KEUxGLHipshjc55YTZAOy68DjIMOwsc0+bc0tIMwuFYc2VvoVyS/YJwTbWuurC85YZY3bl2bck/ovOMYYR9nI01y2s3HdQdiG+EGBo3s8qyTpZrNh3h3zWfIx0byHghw4KjPkypUxwjGyt9tJBUWmk32XWRr3S7aLgNiYLbFE33Q53msHX0UQ0nZuitlwz4WMc+qfqK4VKLYCz5tSBdUke/6FR2QT9OykDsw+DlmjL6yitL5UI2xFsjXg+JwVq9KllxEZzgCNmgAG6yupN8PGvLa3vThds8UY41NGSk3KmEEbPBMj9crtQVRK4FzvDDms7Eqx0vikA0xvIA3VnUYWQuj8M6Fu97rLcei1vs4wfUqTCRsSPZShb4g8MAXuD3Tw8nhyBzgCBuCN1EUOyyOeSN1h5vfdbWDxbZ46cQ2QbglckuAZPlkw5Aa7WldF09sbg4SGx6L0MEMsX1oxm4tHcgo4GqCPZekc4uf60rMkJwpJe7xs1ZQNKVZVGIxLIWnzAu2ASclFWwqzmxYfEMwlNcAlcb5HvAzOJra+FcGy4uS8vFX2VT25Xubd0vJzSbdrR0xqiIkI0JXbFAyQB3iWK2HC4nD990Aua62kj2KzhJJ9obVmrFh42G8oOlEkq4OOTJpkBuqXNgcQyUObKSJAPLQ3XVJG9kbHOaQ1/wkjdeti4uNxMJXfZALGx/576LYWPjx/n/AKLDyfUrHs2IW5mtFgGqslcvUxWEeL5Gy6Yz90AubqX5N3uFpP8AWJexjLX6bHkwwdy7UlY63MGP8pD7Lh8VXM2yPovJJAsmgNr2SQhekcwIQpPLSfI0gdiUxkVdNBJE1jpGFrZBmYe4VKkXuc2nEkN0AJQmgYg4tILbB2BBVkM74X5o6B1Fkd1UEIsBtcWuDmmiNQQdlOV7pS6SVxfI42SSq0J2AgmBuhCkARuEFCYCUnty1RvTjhONrDmzuINWABunhxG7ERtmeWRFwD3AXQ9kwK1c9sP2eIsc/wAazmBGnpSljIoY5XfZ5fFjLjlJFEj1CoIOl3XBpFULZXHz77q1rWmNxLqcNhSqi2PuuhrIzh3PMh8UOoMrjvf0UwKZWwgPBeLF6gFDqzEjQXYHZaT+kyf8Bb1XxsP4Jm8ERiT7y6u67LMTfQh0d653QQAdK9wlr307IS2AVoTXooP/AIfdT1rY168qLq090PQ0SQrIWFzi4UQ0ZiCd10Y77O+Vj8N8JYC9gHwFUo9WTZx0j5Lu6dNhYpZHY2AzsMZa1odlpx2PyXI+jsOK0RVIdikLTl8OwK1spMbncBp7lJXRHwJGP0PIsJLsGRlhfCfMxwNbEKl9ZPXleg/xX/iGb/EOLjxE8MMLmRNiqJuUGuV59/w+iJpLQo29j4FJpDYIBtSUBUZPwnj0UvnqlKQYSABtulLTGijA6w//ACXQVzYD8J3uurhRi9UOWzk6if8ALgD/AFBZr/LKR67LS6jpA0UNXDVZs/4r/dcfke5rj0bbPhabV+ImfiJA6SQvdlAs8UqIxcbe9KRoaUduV6EH8TB7BHCQ2/3TQAqV0cngnNHWYijYVNpppgw3JQEDS0IALQhCAMbG4h2Inc42Owtc+p0F/JWAAk2ONFZhJBBO1zgC29QQvn+TnK5HXVLo0sNim4XCeG8HxWjQHm1nSskkD55GkAncq3qMjX4oSwkEUNK2XdjZY5elh2moGg7rsb/InG9GXr3RjAkCgNOaCbcpcA0DsCV2dGjEmJOYAgNNgrpxXSszy6F2XuCsoePKceSLc0nTM6WGYNBcwht6EcqMvjeVkt1/CHLWw+HxWFcBYkj3o8KvH4ObEzGRlaCg0laPx2l0T+Ts48V0+bDxNe8AtPAKphj8SdkcdZnGtSrsViMTRhndtpQK5WXm0NHewsMnBPpFxtrs2GYtuEw5hoeKzgclY0shkkLnHzHUpkE2XEk9yd1AA9k8mZzSj9BGNdk2AEgOJAJ1JSlouoEkDYkpG9AduEqWVlF2Cc1mLjc/RoOpWhLg4sS5z8O8X2HKzcPF40rWFwGY0CVvYbCw4U01wc4aEg7rt8WPNNNdGWR12cnThLhpjFMDkOuy1FIkOBsA6chEZ8NwNB1cHlenix/jVHPKXLsinuUONm9O9DhJakiKi+NjtSwE9yFI7pgGiaOmpIGyTVgADWu8o0ralk46PLijX8WoC1P91VJC2SRryNWlY5sfONIuMqZn4uLw4o+/JRgYmSmQPu+NV19QbcF9tVV0xll7uNrXI8SWVI0UviVyYV0Ts8ZJrjstCJ7pY4xZPYE7JoaMoBHHbhdkMSg+jNysMuUkHTXYrFx/54+4Wzv376rGx3589tFh5XqVj2azPw2rn6mP8k8+oFd10t+Bq4+qmoGt7lXkf+MS9jIW5g/ykWumVYa3MF+Vj9lyeL7GuTRe5padQRpyElJ73PIzEuoVZOyc0ZiflcRtuCvRowIIQhIAQpMeWEEAE+oUSjQAhMVrpr37JJgCEIQAfNCEIAFa4R+C0g+e9R2VSSE6Ak9wcbAAFVQUQhAQAFNxJrU1xaQNHbW7opk2boV2CQEY/KCTrqdCpsflzUB5tNQoR/BvrdBTcG0MpJO50RHQ2Ba7ICfhPqop/wANVr3tR5QxDUoy1pJcCW1sClppQ19VdjcScVL4jo42U0NpjaGiaAs6lj3498TpI42GNgjAjbVgLif/AA+6undG94MLCxtAEE3r/dql/wDD7pTHEkE9jvzqEkIsR0YPCyY3EOjgDc1F9OdWgXP3RdG7TccxsAAbUE3VAJNwo7g86FII/ZICcLWvfTnhg7kKqT4SplvkzaV27qtw8hQ30NExsplgEbXBwN7gFRa3N/EO+pU8OYxPH44f4OYZg061zSaQEGOLXWK2rUKEjswJrjhX4rwfHkOGziG/IHnUD1TGKcMA7C5WZC7NmLfNt3Sf8CRn4D4H+66SuXAfA/3XUssXqXLZydS/Ab/OFnYj8V/8y0ep/gx9s6zpx98/3XH5Hsa49G3Cfu268Wm5xc6z9UojUbNtkxou+PqYPZINNe2tFdGNwcuDMYmq3sD25TehXNZ/pqguJq77CyrTQhfPRSdlvy3XcqP7ISGBTa6iNjrsUigIEWeJ/wBLfohQQgDCBqtdEFQa43qDXqFIjkb7r5s7SThlbr9FDNpV6dkjbiSTr6pN1doeLTQF4bLhxHLRbZsHuvRYScYiBr9LqiAdl52TFSSRNjkIIbtY2V2BxX2WXMSSwiiAu3x86xS/oynDkjV6riHQwAxvDXXoO64XYjE4bDMkLmuEmuu64sVM7ES+I8D0AU2OdjMTHG8mvhAA2V5PI5zfEUcfFdiwkbsXigHnU6knlRxmHdhpi1176Ecru6hh3dPlw8sV0RuSu5zIuoYVrv1HBRHx+VwfsDyV39GLBh3zxPe0WGDYKjXsvR9JwzcM1zJycpO4G6yeqQeDiiGDyPNiuVOXxuEFIqOS3Rw8rpwuDfiWEsc3TgndUSRuicBI0g9itGHBTsDJcPINRtayw43KVNFSlSM+aGTDvDXgg9+6nBNLG+2Elx7havVoXPwbXurOw60uLAtf4JkjAcWmiKW0sLhk4ohTtWdED8dJs0Nb3I2WhExzG+Zxc7eyuLF9Ra2ICE/eHQ2Nlxf8RnseYfRdSzQxPt2Z8HI3ULPwnUA8VMADehA3WgDYsbLsx5FkVoylFx2BCkyR7Y3tbeV3xABRKbXOaDlvXSu6sRE7evdJNIpARcwSDI46OG54SjiELcrTdHdTAJ0F32S/dKlsdi7qUbwx4Lmh4B1a4pFR5KAA7mhp2HCyMeC3H+YEbUCFrD9FkdQcX4+ySaoWVy+V6mmPZrD8Nvsof4hw0cOEwU0c7ZTM0lzBuwjupt+ALj6q28OHdjRKrJ+pij7GSVt4P8pH/KsQrbwf5SP+Vcni+xtl0dLC0NfmBOlCjsoFNJejZzghCEgBCFLL5M1itqtPYaIoUnNLTrV76FRQArTTDqaRpXdJAAhHCEAM1Qo68hJIeu3ZSa0udQ3PCAIo2U3Ny8i7ojsoFADo1eva6QWkODTYN6gq2PEOaxsbhmiDs5ae6ibllBzG3GrJToCtsbmwiQjyOcQDfZDjsdPkpOhkhyiRpF2QL9UibrYKV0gIg/VSDfLmNVtQKXITcC0kaX6FMBEUhCEgEk7+H3U2Nc91NBJ7BSlw8rIIp3MIhkcWtceSEmuhov6bh4sVjGxYjENw7CDcjhouZ7Q1zgCHAHQjlDqNUANKscpKvoVFgw8pwzpw0+C12Uu7FVlSYHuGRpPmN5bRGNSDXuTsigXRGtN/YJIpP+ykAbkfSlF4oHTXainrd3zaMzQc0gLm3qAUnoZJrS7YWd03MNWAe1lSlcwzvdC0sjJtoJ2C75eoiTpUODEEbXMcXeIB5irilRLbM0DMQNO92onn24QU2eVwLmki9jypfZSOPA6eIPVdS5cERmkHGbRaMTJcZNHFCzNIRlAaFlhXQ5bM3qX4Lf5ws+f8Z/va0+qMc2EA2CH0R2WZiPx5Ned1yeSqkbY+0bcQHhMPNbI5UYvwmeysDXOBIBIGpIC7oeqMWJCZO5AHsrsXA3DuYGSslDmh1t/hvhVRNlC6HRxMhge2YPkdedlfB2VLmljgHDi6RqMpI31BTXQPs1OoQYBvT8G/CzPfingmZjm0G9qWVVKRdY5ASaRevsnJpgkR17oToIUgcuLhid0uN7KzMqyOe6ywh2YDLmNdrUX2a9NNF8/kmp10dcVQigb2PqjUbg1tZCWUgXlPoaUpNlFscMsrvKwk9wE3tOrS3KW8LXwk0vh+HHCGUy7JWQ8vtz3gguJskLoyYlGKaIjK2Vj4a/XsuvpskcMwkk+QA2XMwAuon0BC7D0ycO8pBbwbUYoyu4jlX2dvWqfhY3+u65+l4xmFw+JEgLi5v3Y7O/u1x4o4hh8OYk0bAJVFkjf5LfLnf5OaIjBcaOl+LxE1Nzk66ALTwuCeAx2JJL2mwDwsbDuyTxusAA3rwvRCYhmeZ4II0IO618RqbbmTk+Ojn6vhnTxtfGPM3SgF04NpZhYmvGoG3Zck/VY22I2lx7quLqM2IkDY4hfpwur8mKOTkn2Z8ZNUauNaJoJMjaBbsTusnoQLRMDdgjRasRdlGageQOFCKGOJ0r23nedqW84c5KRKdJow+qQmPEk15Ha2FTh3sjcDLHnadF6DFQCeJzHN31BrZcLMC52EETyAQ7Na48vjS53E1jk6pl+BGHliDmRga7EbLrcKOn1WZhon4PFhh1ifoCtJdeD1prsznsCkdt0zsNEFbECQhSyO8ISGst1dooAjkdESWEairIVakKo2NeKS3QGzUn6PJD0yLGOcMkototZKuOImdEI3PJYNgTsqibAFDTnunJr6FG/sisPEG8a/+Zbv9gLFxrcuPcOcwNdlxeX6m+N9ms34Grn6l+Tf7hdmGax5aJHZBl3rb+9FR1mQSYQ0xrQ0AEjlayX+NshexgLcwX5WL2WIVt4I3hY+1Va4PF9jfLouQr8Vhn4Z0bZHMOdoeMrr0KoXpNUc4ITNcaaUUkgBCEJgHzQhCABCEIAFLMPDLcozXv2UVdgsNJjMXDhoK8WV2VoJoWUIGV5czSWgeXU2d0FxIaBoRoCAp4uCTC4mTDzACSNxa4NN6hX9MxsuAmfLC2N7nMcyntzCiqoX1aOWQMa1ha8uJHmFbKCbgQ4g1fNJAHse+iljRJmW/NeX0UmPa1jmloN7EnZVoCLATLdGSXE6kAEpjbdQiHl+ampWhgpyRlgaSR5hYoqCABepKYg53od1KmgHUl16UooHKLAvfG4YePEmSPzuLcjXeYV3CpxMmZ0YGYMDtGk7KcWHlljkkjjLmR6ucBsjC4V+NxmHw8RaHvdQLjQ2Td0CKzvpshSlYY5HMcRma6iQVCwkwGPS77hABNkDbdHHK1v8LvwLOrwnqgP2XN5gAqiuToJOlZknRIL1H+Pj0Z3Vr6Df2fKNxsV5uOIyOqw0gXqU5xp0TCXJWQSnrw7aDlvc8p91GZ7vs5Zeg2HZZvRZMNBbmLh7Ia4hpAqjpqEECidO1JA+21apgIrZ6v1v/iXSen4H7Hh4Tg2lviRtp0l91kNaZHtZG0ucdAANym+N8Ur2SMLXt0II2TTaJpPZw4PSSQVyu2N7o3B0bi141BB2XFhfzEvfddSwxaNJdlHUAXYV5s97JWTIczifZbc4zQubWpBWH377Lm8rZpjNyAExNrtZVrJHtY4NcQHbgHdQhcHQxU3KMovVTky5neHeXgkLtx+qMXsQ90E+iQ2UnNpoNjXgKgBpH8Vk8G0nEmr9gOyBt690A0QfmgQIUi7NZIFnsoBADQhCQGC3U/NScdDW/ZNjdbN9xpuovBLiRva+cO0vw07fDdFMwOaeQNQu3D4lkb2YfEMaG15XELHa5zHhwGoPPK0+oRnFRxzxU6m+YDhdmCTq19GckrO3qhdGxk8JHl0NLPxuKixGEja0ZZAbIAXO/GSHDNhJGXeyua9d1WbyOT6FCFbLGAucGtuzoAF6B+Gmdh4mtlLXNGqwI5HMILKBG2ivZj8Qx5Ocm+Cp8fJHHfIqcW9CxYk8TLI4ucDVquaB8BAkBBOtqyFr8TOGs+MmySt3FYQYmAMd8Y2cArx4HnuSJlPhSPMnnRWPle6NjHONN2C6MfgjhAyzZIuwuQgiieRosJRljdMtNSBgvn0srfwMcWHhDg4EnUuJWBW1A+6lmdlqzXa1eDKsbtoUo8ujbm6lA15AJd6gKkdUzPpsZLeKKzIAwyN8S8t6kcL0EEETGAxgVvdbrvw5cmZ9OjGUVAsjeXsDnAtPYqSkVBehVGBdHGMREY3vjY1nnBcNz2VCl89EuyAEhCBt3SGSflIaMpa7myoOGWgKI3sKUjnPOZ3tdKBTESBLDfcWLCi3VwBoDazwgk6WSe18JV6fOkhjkAa8hpDhsCAoppfMqQR04B7IcQ2WUuaWedgDbsjYf32WH1zEOxXWJsRIGte9wcQ0UAtTMXVmJoCgsXqIvHEa8Uufy38KNcS+Rqs+Fq5upflH+4V0Di6FhIPY2qupH/KP+Sb/AFiXsY3G61OmPIZ4bvdtrLWnF5WYM1rsSvPwdSs3no7kIKk9obVEHTWuF6q7ObQRBrnAPNCt62UTvX0KEIsDq6YMIcW0Y/xPBLSLYdb4/oueRoZI5ocHUdwURM8SRrba0HSydlsN6d03/wCmJscepD/ibMQIm4MN+Jn+q1X0J7MVCEKRghCDwgB6UdTfZIEggiwRyCjspNLQ1wLbPBvZCAjmJsnUnUklNr3MsNPxaEIcbddADagkUADjt+p7Lqx0mFdJGcC2RjfDAeHnd3PyXMHEBwAGo7bKTQ10eX+O9CeE0xFZQm4ZSRYJGlhSYxrmuLnBpbqARukMqj+H5qQ30OqlCWHDFgjJlzkhwPHso8lJLoZOTLTSDrWuighSIyhpDgTuQBsmIipZz4eShV3dJDV3m0F6mkuwH6pASZK9jHtY8hr9HAHdVPJa6Miwc24Kse0sdldVjeiq37x+6TfQ0XiPMWG8xJ1A3RLkZiHeG05Rw5VglpBBN7gg7IOps2TuSeVViomZHeEGUMt5tAoISSsB8jX6pnNubqt0hum+wACdOAOEwIlXDCulwWInDmBsWUEE6mzwqUpDUZHBNUl19jJEa7/NRaC40N+y7cFhhIQ7EPMMDrHilpIscft9VyuFEEXXdPj1YrsQLonhzSWuabBB2Vjp5C+R7nFz5PiJOqqJ12TFVre2nqlYHJhvzEi6Vywfm5RwuvuscemWwWJiGZJntHfRbax8d+Zkv5eiy8r1Kx7NXD0MPHsfKPkrAa51VWFF4dldlZsSL1W8PVES2Djom06Hb3QKrUG/RDWlwOXgKySTAC1xsaCyCUjRAI3UR7GuVPKPCL8w0NZTuUwIEpg3pXogf+EV6oAs8OT/AEIUc3ohHQGKw5mcX27JFpLtFVDZfQ9irHPq9vcL5ymdo2w5yTI8NrkqeFnki8VsLQ9ta2iPDTSMzBpynkldOFwjG4eVz5QHlpFA7roxQl9ENozYojNIGgizrqUpoXwPySAg+yY8pBF2DYIW71PDnEYKORgt7RmJ7qseH8kX/KCUuLRhRNc45Wgu9gu6CKKPDzDFNLX/AMNhU9Om8HFAmsp0NrR6xLHJhwGOB82oCrFjjxcnsUpO6ObpGIbDNkkAp+zl6bDeEWSNlD3PI8gaOV4rbve4pemweLEWHhmc8NIF2V2eBmr4syzwvtFPWoc+EuneKx2oI2Cw5Gn7PC7va3I8acfipRVtOpcQufGYQt6e0NHmjN6I8jGsrc4BCXHplXT8M3FYJ4duHUCOFwmAjEiFx1zVa1+iCsITW7rCnicHnxUcza01IU//ADc8UZLY+dSaMXEwOw8hY4H0PdbHSpQ7DhoOreCr8Zh24iLLQzcFZGH8TCYtoeCNcpCaxvx8l/Qcuao3ib1S0Qf0SXpbOcft9VFNJACQUzukgASIpNL90DA/NBcS1rT8I29EJEV3UgI/qg1QooJrhIHQjT37IABz7LGx/wCf+i2mnKeNqohY3UPz/wBFy+V6GuLZowfA4aaO2VXUvyjvkpYT4pv5lHqX5R3uEf8AkH+xjUtRmV0eCYLzalZZ2Wn0uN0maUg5WCgVw4PajaejuQjn1Wh0rEw9N6lDiMVhYsZE0W6GQ+V1/wB/ovWSOZnARXPG6k9oa1pDgS7WhwiZwklc9rAxriSGg6NUEACEKcpj8vh3eXzWdylQEE2mr2101SQEACbQHOAJA9SkgWbAvvQQBMluQACiNze6gnsASNPTldeMbg/tf+VfKcNlBJc3XNWqaVis5G0HAkAjte6lKWukcY25WnWr2UP3Qj+hjNixSimbBNjnYqRY7K1xBDTsSEkAmMMkga2rPcrrZhT9kM+IeGwhzmAtILi4Dt2XG05T/si704TToNkcO9zAHMJB1FgpgE6Aa+ihH8A99lbHIYyS2rIrUKI6GyPCEWcoGm9oTEB11KEIAJGg21JrZGwHlLcrnA5SdDajNlMrSwECzQJVkRYZI/GLjGDqAVXNl8YeHeSzQKHoFsaEISAlEGukaJHFrSdSApZLdIY3AtZrZ7KtHdUugG7vdk66Jci9RzSWx1u+QU2tLjpd70EgA1mOW8vYqEnwH3VuR3h59Mt1dqt4selhKWho6GYhwh8GRz3Rg2xubQHuqnOJAFHvSid/6oTttCobTlcHCtDyE3OzWSBZOtKISbuUvoDliFY2T2XWFyN/Pu04XUFlj+y2MDXdY+O/NSc6rY+ax8d+akWflepWPZpYMg4dl7V3V+UZQb17Ll6d5sMB61outzQGNNi9iFtidxREumDWk60a7gbJD3O1aIa4tsAnXhNppwNA+h5WghbDS/lyl+qZ9Ey0ADcHkEbIEIEA2dR27o+KyAe+ikQzw9Ac98rowrcL9jxRnllZiKAia1vld3tNILOVClkQigsx8FM3D5nFge87EjZUu8xJ0FnYK0RsEQc6TU8AJxQuka8t/gbmIXz/AMmlE61uyLppTEIy85BwCo4ZrXTsExLY+4UT7/JanSZmyf5eZod/pJC0wrnJJsU+lZz9Qwscc0Rw7gWvO17LRGLOFIjxDTQHlIG6MT0triHRPLDvS5MS3FsblnYJWA/EN13/AI5YW5JGPJSVHDiMkmJc6Npaw6hVEa1z3Vk72Z/umFo7EqouJXnTfyOiOhjZMuc4BpJoCgCdlEbBdOEMTH55rOXZoCUF3VgzX6Vh/Bw4Lh5n6rsc0OY5pGhCyX9Wdsxgr1KnB1VpNTNr1C9jFnxRXBM5ZQk3Z34SEQRNYKoaq12pO1XsFTFiYpjUbrO9K1dcONfEyd/YGrVc0TJW08D37Kx3Gg7I3GyppS2JdEGNyMDbJA0BKOSpHfdHy90JDIITPKPkgQjug/opOjcG5iDWxtR4QMSSaSTAAOdUOdep3RZqv0UUhhzskTqps0IJbY7FQcKJB+hQMmHNyAFozDWwFidQN9Q+Y2WwVjdQ/PGh2K5fLfxNMWzRwwFPcP4nKvqX5N/uFZgwfsrSeTaj1Rrm4M5mkWRVjdFf4g/2MVbXThlwjWtJo6kBYpXoOkTDDjCy5A8MILmHZwvZcnidzNMr+JJjix4c2tOSEnOzOLjqTytD/EGMi6h1WfE4bBx4KKQ22Bh0auCLL4jTIDkvUA7r0n/Bz77I9lJjWnNmcRppQRI4OdoDlGwKikPYJJoSAO6k4g1QrgpNAJNmuQrYIPGjld4sbCwAhrjq+zwqS+kBSmDW3tYUpozFK5jqtuhI5UAloNj3oD21KvxDZMPK6GTLmAy6KGElEGKilcwSBjg4scNDS1f8TdSg631J2Mgw8WDDqb4LBpoN1a0Q2+VGRC5scoc5geAfhKZDaa8aW7YcKbfAMMoLZPEoFhB09bVNgNO99kihzV4hogjewpsc6WMRuc8hvwsHdVispBAvupQ2JmU8R+b4zwhPsCzH4l2LxHiPjjiOUNyxtyjTRUubly+YGxehU8Q0MxEkbZBKA6g9o+JVlrmPIc0hw3BCTBEzA6LDwPNVKCQA69iq9kmfBm29OyakobWlxpo9aSQP7pCBDByuB0NcHldOCMEuMrGPfFA+7MY2XKm12XXnYaKkw2DqznKSRwSN1B3xt07hTc7NQAAAFCgk4/A0AXqSVMgRIN2Lry7AhONjXZszw2hYtQrTf5IQAcVp7oGhBHdAq9bruEUb576IQE5nOe/M8guIs0oA1saO2iBQN/okhgP9uyi8Gh2sa9lfFCHwySZ2NyV5SdXX2VLjTCLOpB0Q9AgOl90h2Vgjc8nK0mheigyh690IB9kgNL4XTjZIX4gvw0RijoAMLrrv/X6rmJJv60h9Ajjb/wDcD7LrXKf/ALgPZaEED53O8Nj3Na3M4tF5R3WOLttFyKSfosjHD/MyLZIFnelj47809Z+V6lY9nV0s/cv9HaVwu5tDUg/NcXSAC2YE63otTCwPxeIggzxxl5oOe6gPcrTx+4ImfTKSNAaoHlLSjYPopvzRPLMwOQ1YNgpFwcLcBfoFtRBBX4eKTFzCNlF5FizWyo7ftStcSMpc3LY0rlNAyAcWgj60pOBYLcB5trUG6H07Kb5XObk0yXYFJgyGb1QrM7P/AGm/VCQWYQvKBwr8OySiYpACdKJ3VUbXeHn1y7ErTZ0pkkTHxyHUbrxsGGU30jpnNLZwzYGaOIyUCO4Kpwsnh4mNw/hct7BYJ0DjnkLmkVRXJ1Dp2RzX4dp31AXTLxJJc0jNZU+ma73BrS51ADkrC6h1J0hLILDO/dbOX7Rhw2VpBI1C5h0zD2DlNXdWu7NDJkjUDKDjF9nn2MfIfI0uN8BOaB0Tw2QC96B2XqckeHhLmtAa0bALzUhM8r3BpLnG6C83P4yxJXs3hk5FeXT02BQB5q09Cu3HYU4fAwuN5idQVyws8aRrG/E7nsueWNxdM0Ur7HFBJK8Na0770tOHpLAPvXE+gVcOKlwbvCmYDlGhHK5JcdO+RxDy3sAV1QWLF3PtmT5S0bkOHjgFRtA9VbsvPxdQxDP4i4diFr4KeTENLnsDR2Xfhzwn1FGM4NbOhCZ0SXUZhWu2iSZ4PolfogBOSG983oUykgAc5ziS4k66kpJlL5JDBwFCifmoppFIASITSKQwGpq69yiVpbIQaJ2sHdRN0DWndAKQDeGtPlcTzZCxeoaY499Fsg0b0+axsf8AntuQuXy/U1xbNWC24WNpGlKvrGJlmwTWSvLgwBrAeB/drqmlMoiuMMLYw2mjtyszqp+6aOLtXkfHGJdyMxbmAIGEbYBJFAnhYa2sD+Vi9lxeJ7muTRe4k1ZN9ykFNzy4AHYbABETsrw7TvRG69E5yCvwz4WYuJ88Zkha4FzAazD3VUgOazVnUAKKBk5nMdM8wtLIySWtJvKFCubQunC4ObFRYiSFoLYW5n26tCaQuw0cx29V19Qnwsk8L+nwPga2NuYOdmt43cuVwLXEHjSkk06DZKV7pHue8246knlRQilLAZDcoom+R2UvEd4Ph+XLea61SZlzDNdc0olOw2WsYx0LznIe3ZtbqMUb5ZAyJpe8mg0DVELxG9r8oJBunDQoZK+OYSxuLJAczS07FV0IeJhlw074cQx0crDTmuFEKuwuvEk4qF+NxGKEmLfJTmOvM7T4rUMK3DOhxBxEr2StZ901rbzOvnsigT67KGOcyRrmEte02COCrMVJNiJZJ8Q4vkebc4jf+9FSpCRzSOw4PKkZCNpMQrbsEzWnft2SY41m2s3Q4TSWhi7JoAJIAFngIP6oEN7gXWG1psmzJldnLr4rlR9t1fhnjC4uCZ8UczWHMY3bH0KpARxGHlgyeK3LnaHt14Kqa4skaaHI1CnO4vlc/KGNcbDRsB6KH97KZdaBCOydEDZNoF+b5apcHe9qKABNji0ktPFKKLQA0cnT6o+fz7IcNase6EAUTwou497VrmPjeGuBF60TuoVbqNfNKS6GgtxOhPyKjSZsHQ/NLnfRADomzWn7J/w8e6O+vuEuAmByHTqA0WlFipYfE8F7o/EbkeGmrb2/ZcAyDqcXi34fOXddTqzeW6vS1ni6bHIR1F36UsfHfmXey1yD2WTj/wAyfZZeT6l49nR0oHLLS0xh5XYc4jKfCa7LZPKy+k3Um/AWgCctWct3V7q/H9CZ7AXsBruApQua2VrpBmaDq3uj+Ly2PcqzFYd2FlMcwGar0N7rdfyQSxjo8RPJJh4xHGdQwHZc5Og1N9jwrjMZMNFA2NnkJOdrfMb7qqsxAHtQTbsSFzaCpBricrWk86BIULsXpQ9FNDI690IQgdnHghJ9kmj8EvY/W62XR0zGfZg6HEWANRYW01rWgAAVwAFlf4ghDWRTAAE+WxysZePLBHmnoFNTdMtPVcPvqe4AVsHUYMQ4NBLXHYELzga51loJF7gbLW6KyJ5IMY8Vguys8PlZMk0ipY4xRsAX/wB0vkFJIr1TlODqRke0QQg53auI4CMH077LlfJZeW3qu4DmhfdWyyvla0OIOUUKGyyeCMpcpGnNpUjG68P8oz+ZZvSo3PxsZAJa02St3qUHj4V7KNjUWubosBjw7nOFFxvVcebA550zSE6gw6ng34hwdHVgVRWOG+BiQ2Zux1B5XqexWb1XBmapIx5xuO6ryfFv5x2GPJ9M64sLC1oLI21Vg0rKrbb0VeDv7LHmvMBrasK68cVx0ZyfYE6EV81FSLTQNGq0NJty5HXZfwQVdE2QQaN0NOyk9mR2UkEjWwd1E8pARO39Eapu3027JJMYEVukeEWfW0HYJANzswG3vSrKlXogny1Wl9khjLmeEG5Tn3LrVSlR1oHukgei44mT7J9mseEH+IPLrdVuqdO4vsrIYfFbIc7GZG5qcd/QKk90mAFY3UB/nvotnY6+6xMabxzvcLk8r1NcezeZFJJFnALw1vmI4WX1X4Gnjuu+GRzIiGuIDhTgDuubqoBwti9Dyryq8Qo+xjcLew7WNwkBjeXkst1iqPZYAOi3sE8/YY2UKrtuuPw/ZmuXRbYLQK9yopjf50pOaQ/KaB5sr0DAh80VaZFGrHuEkAWxubGJGvjDy5vlJOyqBI2JHsU2gHcgDuUac36VyiwFfeyeSUwBW/sElMRP8Hxcp8O8t+qF2BBHdCe9CteCkgEUFTkc66e0eUUBSgnQAmGk6Ab6aIr27UrsNM2IuD2l7HVYBq6Ka7Aoc0tJDtxpR4VuFdCyQnERmRuU0A6qPBUcS5j55HRNLIy6w0m6Cr7I0w2CSkK/iJHqE3tLKsjXailsCtnwBSUY/gapKVobGLGo/RAAJ17blMDMfKPkFHlVoQz5ToR7goDiARe+9jdJCAJPkc/LmJoCgDwocj2tTtuQgg3vok9uoLTba3SYxlrQCc3rQ5Ub3H6psy5vPeXsEPrN5by+qb0IC0BgIdbidRWyiRtvXHqgq2aeSZsbZCCI25WgDYIArQ0ZiBpZ5JSUnHNQoaaWAkBZiI/BnMbpBIQKDmmwqtOSRrWiQGiJDmogAa1QRIESdQdTbIvcqJ20/RBOqL1SGA9f1QgoQFHJN+dj9tV1g6rjxGmMiXaFnj9mU9E5ZM1ACmjYLH6iKxRBu6GhC1R3G6zOrPdLjS95txaNaUeT3AeP2J9K/wCaOLBWgKo2D8uFn9K/5nuF3lPx/QJ7HzsUFxPJ7bqbXgMIA1I1PdEUb5XtZG0ueTQDRqVuZhA57ZAGE27ygN9VuGXpEP8Ah04d2HmHWmYi8xPlDOywXNLX0QQRpXZdefDfYdRKcaX6uJ8uX/daRdEyjZyiRzXOc1xbYo0Ui0hoOmqkx2VriKOYUQQoa7KCtCQnRQkOzTgk8WFjwKzCwFwdea+RkTWNJF2aC0II/DhYyxoNwrK30+oW8oPJj4syT4yswYw7psLHvFmT4mld2AkgxDjJE0NeNwFy/wCIrqA61qCuDp0j4MXGdQHnVefy/Bl4fRvXONnqAkUIXrbOUZaWjUG91EGjd/JSOo57KJ1+qWhlj5PGkzvA9mhUjsBp6JgUitz9UAKkFB/VCQWRRSmdSTp7AKI3KKGDpHOY1pJyt2CiAT2UhQe0kW3sp4t8ck7nwR+FGTo27pAFJSKZCC3S+OyWwRAo+SFbhhH47DMCYg7zAHWkhlVc0fU0kb02v05XXPMzx548EC3DyGg1+9LlcMpqv1Q1QLsVnLl43pN0jjEyMgZWk1Q11S02P1UdK/b0UjHnd3oVRpIBhY8uJDx8IA3SSKQwNKLt1IVpd+qRbevZIBcizpeqxMaKx7+2awtxrHPc1rGlzjsAN1jdSaW9QcDYcK0I2XJ5S+Jrj2ajPw2+yOpysPR/C8ECQPvxCdT6IiIdG0hUdSJOCeNSBsOytv8Axv8A4KvkY3C3MCWjBsBFmtCDssMrawX5WP2XF4nua5dHRoSOG7WAvUdO/wAP4fEf4f8A+IR46F2KMjmDDE06gPiK8yxzQwtI8x2NpZ3BtBxrsCvUjJR2csk3pkToT39EX5a+dpIUFjHHvupFjfDLg8WDQaRuol1gDTQcJIQDBIa4CqOhRZy1Zy3taSk9jmVdai9CmgIqTnAkFoAocIZG+TNkaXZRZIGwSb8vYpLoAc4uJLrJ5JO6AknW/wCgQAnV/XRHCFoYwdN/4Xg/sYxH23Xxy/4PSv0TSsTdGdypizFoNuVCiQTRruAgbb+lJDBdfTcRBhsQZMVhW4lmVzQxxrUjQ/JciBV63VcITAjH8I034C6DhJg2yw1kz2TuFzR/APZWZnf6j2q0otV2DOjp2MkwGOixUDYzJGbAe3MPoVRLIZJHPdQLiXEAbWoirF3XNIO/Kd9BSXY3ODg3QChqQEjzWyYq9QarhJIAUT+IPZSHsou1kaf0CTGhp0pROaxxzMD7FAHhRTEGyYaTZF6CyeyQ9lMFnh859iQdCEB2QTaaN0DrdHlBBbVg6890GqFXfatkaAnPKZpS8ta2xs0UAqHbN99lNQfXl90pDRY9+YjygUKNBRdvensEBP025tMQva0BCEhnJivzMRXWuTF6TxFdZWUPZlvQLL6oKxIoj4QaWosrqX5jfhR5PoGPZ09HflEooa1ZIXadD6d1n9L+CTtYWrPiHzMiY+vum5W0Ffj/AKxT2VFtAaaHUUr+n42fAYuPE4SQxTxm2OHCqjAc9ocTV6kDZSmEbZXCFxfHw4ilvrtEEZZXyyvfI4uc45iT3UTtf1CSY9vYpWAyDrW1dtkNq9duSkHEXWxH1QNwDWu57JgTsdz9EKeRn/ufohOg6MpuIxUhOWSR3eitPpZxjZKna7wyLtx2Wf03HDCOIe0FhOvdbrMfh3MB8QdqJXJ4lS+Updl5L1RDHYYYlsbSNA6yoTYJj2xZaDozoV1skY+srwedCmF6Lxwm7Ofk4iGyE9ymW+XMtqJsikVIjbb5IurFCuUAJrS5wDQbvQBI2LF63RCYJBsX7oBN3yl0BAo9VJ1WaGm+qiAUhh8/VIITFHn/ALoGJRIrsrfDc5wawF5Iumi1Xvv+yAIqXhv8MvHwg1dqNKThTbB05FqQI0CNz9EiK5R/vVJz5M58K8lVTjskBCyNkj/ZtNI/0SGOmhrs15uAFBOrvVIpDEkU0ipGJBQrhhpfsn2mh4WfJZPKAKWOdG8PYS142IOyxuoku6jbiSTVk8rYOnar3Cxuofnr9jsuTyvQ1xbNLpz43Slkt+E11OLd6/u0usCPwpvBJMd+UuGtWqunguzyZaadATypdS/JvQn/AIQa+RirX6bIH4fLy3QjusgbLSwtRfZ3t/5gpwXF48qlZrNWjvQgoXqHOCslY1jI3NeHFwsgfwqIIymz7BdmB6ecVBipXYiGHwIvEAkdRk1rK3uf9k0KzhR+6EBSMR0TvRM6m9UVqAmANe5thhIsUQDujcgAWTsByh3lcQfY0p4ed+HnZNCcsjNQaTAJYTFbZLbID8JVd04Ee6k9zpHue8kucbJPK6cHiYYcLi45sIyaSZobHI46xEHcI6sXdHJ3JUmhzi1jQS4mgAFFSY5zCHMJDhqCDskhlrnYjCtnwrwYy6hIxw10VLmloBdXm10Oyc0r55XSTPL5Hauc46lQ/vVNsSAC9B8gkVNrXEFwBpu5CgeVJSCEhrWW29NimoRfhtUwPLem9JLQMB7KTmuAzFpAOtkJwkCRpcCWg6he9/xL13/D2M/wfg8Jg8CI+pR6OlC1jBNGcpNV0eANj6IFUbHseyds8NwLTmvQg7JAWDqNroqNFg9jmGngtPYhQP4gPopucXGyTdaklJ2UloAN1qSd0mAEkmzumBmI2r14Te0NNAhw30UUP+w6GCWlwsHi6S+qkwhpsgGtgQpPLnW6x7BMCUmHxDMNDPJG8QSWGPI0Nb0qFY6WR0bI3PcWM+FpOjbUOUMEK1E6uZZ0zKZ1Ow22Crfuz3USGi/MGte1oBBO5GoUgGCIOA81UQTuotjLoi/Sgaq0SxSQvyTMex29OFbqxCiZ4krWB4bZq3HRRcA0uFg0dwd0HYb0mAMhLr20obpAcWO+OI+q6yuTHf8AK96XVwsY+zL+kNZfUvxx/KtNZvUvx2/yqPI9CobLul/hP05XaCQVy9O/K/NdSvAqghT2TZmokFRvftyhp9T8kLYzA+yEHdJADO3G16I49Uc7fJCNgJCaEgOYdNkliZLEQ5rhZHZUz4OWBoMrSG3qQNlr9CeXYOjfldQXf1AwxQuzkPZl1BCzh4cJY+Y3lalxMiARYbCGaJ2d9jUlKXrQa6mREjgkrNeczy1oIHa91AsMUo8Rh03BG65n5M49QNPxp7NnD9UfIdIT7haUTzIwEtLTyCoYF0U8TDGA3gild3XrYFLjcnZzTrVC/wDCZGl39UEf90hrp+63MwI0SIOmiDxamzzOOYigOUqGV9k2gakmvSt0kOqzWo7oAid/6hMsrcjXXQo4SPzUjRKGeSCXxIHljxoCD3UKzX35pA1/3KkxzmOcWnWtwgKIfxenKRGZ1Nu7oAIO6GPcx4cwkOabBCQxyxvhkMczXMcN2uGoVZ2XTjsVPjcU+fFSF8rgLcRv/ei5dON0mC/sZbQab1OldlHhSv009VGjV1ptakY9Mu5tXYrBzYXwzO0NEjPEZR3C5035tMxJ4FlAEd3abfsnFk8QCUnL3aFECyNR81LMGxuZkBJPxKRkDvzXBI3SN0RZrerUy4uABOg0AUNNdOKSGJY3UPzvrotlY3UNcadey5PL9DXHs1YhUTfalz9S/KO+S6YxbGi/mVDruHdhYpInOa4gjVpsK5KsTEn8jAWkzWLBj1tZvC0MATJLHppGz9152H2o2no0jykpxtD3taXBoOlldL8NF/w8TxzZ5sxDow0+Vv8Aqv6r1lHo5mzjTs16DhIcn6BCQwU2Rl5r4QRoSVBO+CTV6+iEBNueRojBFN1USBlFE3sRStxjIY53NwsplioU4tq1LDPhaHiZhcSKbR2KtLumI6cJDgA7Ay4uV5gdJWIYz4wPRc3UW4UY+cYB0hwmc+GXjzZeLUMQ2Nsn3DnPbV2QqUSddCS+y/7tzWZbD71BGlKk7/PhJWPdG6KMNYWvaKcSd0tjKrTr1Qa4B25QNTVqRgwAuAJAHcor/wA9114fCkQfbJQ1+GjlDHsD6cfb9VRinRPxMjsPGY4S62MJuh7qmqQrIOc516/IIY7I/NQPFEKKZcXbnbZQUQj/AA2+2wUkoQXNYG2SdAAE3AtcWuBBB1BGyS0DGHEWBdEajukP0QhMQITc0tqwaIuyE9CDdXuPVACJ8oHztVn8RvsrCdK0A791UPxvTLaGNFzslEtJ9iFEGqse4UjTWgtNk7itlCtSmxEn0SSBWugSQfmhIAQhCBiKg74me6nVqDx5me6mQ0T2IIu/RXYvFT4ybxsVK+WWg3M460NlU8C6a6xWppNhyvs0eNVX9CAvc5oaTo3YdkiTlq+bq0uUgEgObG/DGfVddLkx48rKJq71XV/FYNjfRZR92U9IbgL8pPuQsvqmkzf5VpV9aWd1Qfes9lPk+g8ezo6d+WHuV0rm6b+W/wDkuo+6rD6IU9gOEITWqJAlL5Jo0vW0xDa6nB1Cu1JHU3XrQQCRf0VkEb5ZGxxNLnk0ABuU9gV0hdn2XFf+wfohVwZPJHXFEyJuWNoAvUAbqnGYcz+G2/Ldu9V1oXU4JriZKXdnmOoRjD9Q0bTbBAC9BPh4sQWukYDpdkKrGYNuKkic4jyG11VQA9FzYvHUJyvTNJTtIrihZEKjAaDwFfHCZGyEEDI3Nqd1Dj50gUTRNDuV1xSiZN2WH7t5EzT8NAA7KkC/dNw1PI7pfJNgArsb4KipAkbdtVFSMRQgoutaHzQAnbJK5kL5Q9za8tWL3Vb25XEWDWlhJoZGzsDoVHvr9FIa8ozaEACtj6pDK0xVG7+Sb60oG+5Rk+7Lsw3qr1S0A3uD6LnHMqiNSpV70h7s4aCAK0sBJgQU3SDwy1o33JKi8ZXUCCO4SdWXY33S0MbAdSBYBulEjM47D34Q12Wxeh0IBVjcjWOdmOcaNBGiQFTcof5rLb1rlINDnafIBI/3Suw+JdBFMxrYyJRRLm2W+3ZIZVK0NeWtcHD0UTzRRybtRKkaHmIqq011G6xeo/nnHkkWtl1ZQAKrc3usbqH536Fcnleprj2a0f4bfZUdTDfsLzmOawKV8f4QXP1Rpbg3EjQ1SuX62L/YxQtnpkOXC5idXHTRY628Cf8AKR77UuHxUnM1yaLwNL004VuHxc2HinjieWxzNyyNHIVCmxwBBr6r0znolH4TWtc4ZzdFhG6g3dx0rskd9h30QG5gddeyGwJgZ6OXKwUHOrQKTWMEr2yZywA0Wj6f0XXg+r4zB9KxvT4XsGFxZHigsBOnY7hcAcddT2OqAHFGZM1EDKLIJ3SLSASdtqRE4scHA7HdSYx0z3BpHJ1NJ9UBcYmM6a2ZuKjMr5Cx2HAOZoHK5VY1ro2iRzTTvhJVd/VJgugVkjGtaHMJLTvY5UAL0FfNKqNX6JDHvorHQ0G0bed2gKL43MYH2Mp2oq3xYvsjs0cn2rNpKH6Bvak0v5EUkOdHm4BUFNxGQAEk7kVsnLHkLQa1aDYKKAGQmRriyvK3M4E7Juw0zcIzEujcIXkta8jQkb/0UXhuW2nXahyh8jjE2PM8sGoaToD7IaGiGHe6Pw3scQ5uoIU53+JKXkkl2pJ7qqP8Nq6HNidDD4Qk8XUyF3w+lJR7VA9lJQr8M3DuhmM75BKADE1o0J9VUwBx2JA3pFBYPe5wAcScugB4UUftxallAJDiAavTlAED/RQ/5/pl44Vrazan5hQIHiCj/DSl9DL8SIWTuGGe58XBcKP97qpAq9b9aR9fmqYgOu+6EISASaEuyBoPmoP+OPgWrXgAjK6/lsq5NXs7JPQImki09Mo/dH0DET/ZSCZrsmHaAaIQjm6m0tYwEje9CrmHyj91RjvwgeL5V7ATFGa4Wa92X/qTNmuyzOqfis/lWlY0tZ3VfxWVtlUeR6Dx7OjpTXOwznBthrtT2XSSP/K5ukkeCQ4nKXUQF1ltGqI91eH0Qp7EhImrQtCRoKBV63XouzCx4OXEyjETSQwhhcwhtku4CaVibo5o2hxpzg0ck8JNcWOtrjYNggqFfVNO6DZd47u5/wD2Qqsp7IT5MVI20BABJoDX3Qu6jnEf7sIO6bQXGgDaSADv9Ujt6p0bpN2UPFAll7HlAyP8JSdVCie1FWTPa+VzmMDGnUNB2VRQAKKldCq+aikAFSbkoFzXVWlHlICzVjerPCZe7IGE+VpsAI0MTS4ZnNJrawd1Aa1rpfKZ2rjekGsuhF8jspYEDufokmaU2xudHI4VTRrqkMrynLdabWo7KWuo1rsolIYEnvpzXKjlNXWm1ppGyEmAeiVaA6Vz6I49U9KoA+4SGKvb3TLqYWgm/RN4a1zg0Fw2BIS8SswDRqEg2QcMtDQnewVEnuneo0Sve/nakaEUCheYHbhJSynJm4ugVIzp6a3AudOOpPmY3wz4fhi7fxfovNdQ/On5LZWP1DTHH5Lm8p/A0xexqx/htXP1L8m7Xtur2fhsXL1N3+Xy9zqnN1jYL2MhbeB/KRdqWKdivTYHDQt6bg5Xz2HtcHNDdWEHT+i5PDVzNMr6KjRPpugph2W6A7ahRXoaMbHX70pMZmcQXAci1PDyMjkBkiEraIyk91WS0NI9dDaYHS3HTNwsWG8hiikMjWlo3Pcrld30u9gpMLMpDg697BUD6IYg7KYIG9EVooaVVC1YIyYy4E6bgBCGyBJNWSR2KSZGgOv0SSBAhSeQ5wIAbpVDlRSYB2UnPd4YjNZQbqlFBN68phRZE4NjfoLIGhCjI7O+9AdqAUQdf6pIsKC0z6dkkuEgFEC5rQBrVq0SFsYa0ne6Cqi+BvsrpJGvjiYI2MLBRcBq73REbK2mjY+qASCav1o7q04eXJG/wzUnwEc0q7oURqn2IcjXB3nFGrpdmKYw9Kwc3iRZ7cwsaPMAOSuGzZ3v1U8w8MtyizraaYmieH8DLN9oMl5fuw0fxev6qivPforIZPDkDtCexCg/8Q0QdNwlLtDQu1DW0yCDR0O1FSflzAssDsSon1PzKQAkhA0OosdiUATLHeHnI8pNWotBJAAJJ0qkH9N67JxuLXgg690DFRzFpu72KJY3Nla0jzDgFBJJJN3uSVFx8zaJvk2lKqBDISCZri9tigICwDq7WkAma5UhoL03QByY7SD5rpwzS6AHTQDdVY7z4Z7iRYIoVutXpn2o/wCHMQ6OGN2FDmB8hAzNPFKIRvIDdRM86WFndV/EZ7WtL9rWf1nIMS0RkluXelHkejLx7LulOP2Z7ABRfYJC6wCXamze5K4el/gH3XaGl11dDWwE8HohT2InT58JLq6fh4ZsZHHipxh4XfFIW3S53ANe5rTmaDQIG62r7IvugQm7YbAjstubqvTnf4Sh6c3pjW9QZNndiw7Vze1fT6JqIpOjEBrsdbIKHEE2AB6DhJosj+qHDXRAxaoRRQkBu8+qbWkk1V+qSk1zmm20CDYNL0TmI6g82rGRZonyEgNbpqeVCV7pJHPebcTZ03S9OO3dGgLYXRBsomY5zy37sg/Cf7tVOOw102tNtNcC6++nCAMxNAk1eiAKyg/op+XJuc3ZbnSukwYrps+IknYx7Bo0n4kRjYOVHnikrJWgSOA4NacqClqhhG3O8D1SeA1xAOl1ZU4nBjrc3NpteyI8pLy5wBy2LCEBWTooqSiR9FI12R5UiarX3RQ/7JyMyFoBDrF2EhhECCX5SY2mnGtrVbhuVN7XNBBJ11IvdQrn6oYCTLW+GDfmvakXodBtVnhQ76qRgAToAb9FOFzxPGYR95mGWhz/AHSTXZWGrzdwVPCTSYSeLEwkB8Tg9tjkJDZcxzJcfH9ue5sZm++IGo11/qrOvN6ezq2Jj6S50mDz/dPcKsf3a5cZO7FTumkp80ri55ArUqjKbIqjtRKGxJCLeOdgokEaG+xHZafV+kYjpeJhhxL4S58bZGlj7AB9e6zXBzg52pF0SVLVFJp6E0AtJJ1Gtd1Htqa7WmK5v0pThhfLIxjQPO7KC40ApGQDqdm0veisbqJzY/3qyt2WF0M74nUXsOUlpsaLC6mC3HkWLBGoXL5fqaY32a/hhkMZzh18BcHVQA1lXdGwtGJ0krIo2gOcPhAC5uvB0kEcz8l/DlaKqtNU8qvEEfYwltYL8nH7LFW504NdhYReU7E9lx+Ivma5NFxaRV+9KKk7QkXYGljlW4cQNc77UJC0xnIIz/FxfovRowKEHb17oAv6Kx8Y8QNif4gIFEBCQWQadRz6LrwGDmxQxLooHyshjzyFv8De65NQa5vldOFIz0x5ZYpzS6g/0TSEcwIa6wLHqF0YWGXFvlET2M8tuzOoAKiXWR3lDRegB2S7kX2NJ6YUXYlghfJC6QSFhprm7FUKT2uY4h+9bApBpcQGgk3QA5SbGMN8hd8lG1KsryH2D2RKGteQ0gjuEqCyJSQmEtAK0I5QmAI4KE2mibAIqqKQEI/wwrY2Odmc2qYLNnZUx/A1TB9SiIMtYXyvprjY1AJUWxucxz6Ja3dwGy6Mfh44JnfZZjiMPoBMG5QTWoo/P6KsYh8UEkMUhEcteI0HQ1stP+i/4VHLlGW77nlR/dJNZ2UiUhYcuRpGmtncqsfif/FNIfiH2SkCJIRWiExCV+D+z/aG/a/E8Hnw9/72UZZPE1cBmArQKtPTDYGsxy3XFpcpoSBAoOFOYpqDvjZ81L0NdEmktIOneim53iPLiBrwBskivRMAOp9FY7DzNwzJ3RnwXuLWuOxIVaZkeY2xl5MbdQ0nQJ9CZz4v8u7RTwrnNwzWhxykagHdQxX5dylhfwGeyx/3LrovDso0G4o2Fk9SP+Y9mhaiyMe7/NP9BSjyX8B49nZ0tp+zvOuXNVrrBIuia20K4ul34LhZ+LZdqrB6IU9hryptc1rCC3znUOvZRSK3RNE43lr7G/chd+O6XJhYMLK+SJwxDc7Q1117rOA0JCm5zw1ucHUaXyqi1XZLIjRxut+FdJIx7WNDQ0jchVMYXDygk76DZIIuhl3hRf8Auj6IVVFCLQqN17mlxyAhvAJ2UCpZTViyBoSgVyNOy7zn0RpHKkQW167apsYcwBIF7EoAg469+5SBo6XtVhTLQWk5hYOwUCEaDYEAVVfLhWF0kdxtfYIumlVd9UbIToGB21BvglROvHyUnuc4jMbrQeiikxiG6HAgC9jsU3EcADTuon5+ikBJKRaRV1R1UUhkCmm4C+O+iieNEhgST7+qipBpPf6KJG3ukMAdCNFHbdSIrkf7oa0vcGtq99SkwDNq05RW1UoNaXGgCewCm9wLGtaTVbEKItozCxrQIQxkTp6H0Q1uZrjnAIOxO6HH9kAAg2eLGigZZE5rcVEcUXPja4ZgDuEp5iZJhFbIXuzZAduyiG5oy6xY4KraMztwONUWwotnMHhReFn8SvPZ3PoqNdr+XZWRPdDOyRtZ2ODgHCwaTxEzsRiZZ5QA57sxDRQHySbDQhGWta4kUeAsPqf541totoud3FDYdlidRJOONjgLk8t/E1x7PRxSiGLD4nDxeEWsDMwddvH8SzOquLsK5ztzratjJ8Jgs96VHU3E4NwJ0FClc3/ioSVSMVbmBaTg4y0E0NSBssNb/SnQjBETeJZjpmQ7O9fTdcPie5tk0SvfdTaw+GX6UDVE90oo3yvbHGwve40GtFkq1sgbhnwPiHiZ8wfXmHp/fZekjnbKXeU1YPqENc5rg5ujgNwludUhvvrsCkMmXHQECwbJIUefmtXo8GAd1hkfW8RIzBg1K+AZnfL9FxY50fj5sPXg5iGGqOUbEjvsqoV/Rz5XONAG9gAE2UHDMDXIRmeSXa77hTcIvAaQ5/jWcwI0A4/qkMg92YAUNOQN1FpqtTe9hTmifC4NkADquge6gBd/XVJgB3Js97JQhSY3Pn8wblF6ndAC8vh3ZzXVKO4UwWeE4Fhz3YcDpSjSAEgoQBfCABI7FM6WCm9tR3Y14CQEI/wx7KSiz4B7KQq9dkLQDzOy5cxy9rQDRF7dlMxFsQfY1OgtV/T5J9gM8n9ElOPw7qUuquBuVBDAPkoX9472VgJG3aioMaXTENBJI2A3UsaJIQb7fJCYAhCECBCOU7y3sbGxCAIpNa580bGNLnG9AN1JtC7HsgnI+J0bznokkcIoBbGqojhCsc9pDRl+ZO6rsafqgYFJMD3RehopMRTivy71fgoQ/p/i+I0FtANJ1cqcTrh3eyWCP3DNVn/6F/6l5Ff0Kxcbf2uTTlbP9hY+N/Nye6y8r1Kx7OvpZ+7f7rtFkba9guHpZ+7f3tdw9N+6vx+4Imew790clBJRa2JGuvH4mLER4ZsUJjMceRxLrznv6cLkH6qbXMDacy/UFVF/Qmi7A42fBPc7DvLHPYYzQ3B3VT43NjbIayOOhBVbiC41dXsUXsjl9MAQi0JAb1+/qAtDq/T4sB9m8HFw4kSxNkd4Z+An+ErPOhIsdrSXonNQw0lwFjU1ZOyczfClLC4OA0BB0UUigZcZI2sjMbTnoiTNsVWXAgCvoopIsQHf15SP9UcpEpDApd/qmUkABLf9J2o2VAD/AHUv7pFjMCRp2vdSAmtc7Rtk1ZoKJ/u1Mu1OXQcAnZJ8jn1mI8ooUEMaKyDrv7pfL3UszsuWzl7JfVSUBJ7naghjQQczq7KJ2/opPbkDTYOYXQKNhoRcAxzcgJPJUCOw+imXZiK+gUbLSRt3BUsEQ17GuTStlD3xiXJUd5bA5UA9zWuaCadoQFIsLYGuc8FriRkDtb9kD+yn5IDbDiKodyndXQ+qG+ZwbYAPJUARGhBv10QR5tAaPBV+IprvAMjHsjJAe0bqoSEAAAWNikPZXuolSJ1vlJxzG6A9AkMAKaDWmwCxuo/nfotgnQ9lj9R/Oj5Lk8r1NcezVYPumH6Fc/UvyT/cLpizOjY0fTuubqQIwkgI1Vy/WJexjLZ6ebwjPosYrR6c5zGhjryv1aT/AH/dLg8Z1M2no1sFipsHiosThnmOaN2ZrhwU34uZzJ2FwcJneI8kak/3f1Q2FzsE+bxIsrHhpYXec2NwO3+6obeYEbjVepZzUhd979UwMxoVteqbfM+3a8kq0uikkcSzwxl0DTyirGU+l+9Lr6cwzznDMEOacZA+Y0Get8f91RAxkkhD5RE3KTbhuRx81VzogRN7fCkexxBo1bTpoom96NcGkgBrd3xS6ZMbJPh4IJ3XFA0tjDQBVm9e6BlWGiOInZE17GF+gc91NHuVAinEaW01YKj+ybdwSLF6jukAIGp03Qd9Bp2HCEAJSsmgf2Uso0NitzSlh/DMrhJeWjRB54TQFR22NcGt1NsUhjdI1pygWSV1Y/DxMcz7LihihlF00tyk7jXtr9EsZisZ9ngwGJe7wcNmMcZHwZtT/RNqhHPFH4ubzhpAs2VWR8QBv17oYAXDf2CnioxFIWteH6WCEnoZBhAiDS0X3vZWMbHnLZHkAjQgWqohmDQXAXyeEzyNNDuOUloDs6kyCPFPiwU5xGHAAEhbV/L6/RcWyebyBoAHNjldDsDiY+nxY50Z+yySGNr73cNSE27Euihha19yMLhyAVFSka5pGcUTqopf0MEo3OjmzscQRyCmoj8Rw9LUsY7ve77lNCExApxM8SQNG5UFKNxY8OFWDpaaAi4FpII1GhSHvqpSEucSd7vRRSYxndQd8bfZT00191E+aRorjYJMBlAUmtLn5bA9SVHvrr6JgBQB5ea7obxYNeibnWKF5eAUgKp/wZPZQwf4A15U5h9y/ThVYKzB81lL3Ra0dKxsb+bk+q2QOb+SxsaP81IsvK9R49nV0nVj/daLCGvDiAQDqDys7pW0nyWkMvhHU5r2A3WnjeiJybLcbMzEYmSWOFkLSdGNOgVBSBtH0W7dkof92mXeWqHvSQQT9UAwq63+SWwVsUzow8NrzCjYVfvaKF2K0J6IQBvv+JyihC9FnMgQUIQMQSOyEIEJJCEhoRQhCAEd1EoQkAilz8kISGIoKEKCiKXdCE0A2fit91LE/jO90ISAp5S5KEKRiO6iUIUjAI7oQp+wREp8IQgZHgrH6j+dHyQhcflehpj2bGG/5a5up/lZEIWr/WL/AGMQrSi/DwfzQhebh2by0dp+JXs/BPuhC9Y5yobpO4QhIGB4VjvhCEJgVlIIQkAK/D/AP5kIQgK5vxX+6ihCAGNz7JDdCFQFn8as6l+el+X7BCES0CKmbsUH7O9kIRLQlsgz4Wq0fChCiOimVhdA/wDtkX/+p/ZCE0JkcR/B/KqW/CUIT+wGoD8V3shChjRNCEJgCAhCEIHbhIoQiQ0NSh/Ms9ihCQA/4ne6hwhCYAE0ISBkJvwnexVOA/APuhCxl7or6OgLHxv5uRCFn5Xqisezo6V/zfktMfChCvxvRE5NlaEIW5KGg7oQmAwhCECBCEIA/9k=","type":"DEFAULT","transportType":"DEFAULT","provisionType":"DISABLED","defaultRuleChainId":null,"defaultDashboardId":{"entityType":"DASHBOARD","id":"67e27430-d737-11ec-94a0-cd6fda244b19"},"defaultQueueName":null,"profileData":{"configuration":{"type":"DEFAULT"},"transportConfiguration":{"type":"DEFAULT"},"provisionConfiguration":{"type":"DISABLED","provisionDeviceSecret":null},"alarms":null},"provisionDeviceKey":null,"firmwareId":null,"softwareId":null,"default":true}}', 'SUCCESS', '');
INSERT INTO "public"."audit_log" VALUES ('b9c4a030-e578-11ec-a8c7-4b21fe31dd59', 1654506721715, '188f3780-d68b-11ec-aefb-d132b4563e73', '13814000-1dd2-11b2-8080-808080808080', '3895eab0-d68b-11ec-aefb-d132b4563e73', 'USER', '240011814@qq.com', '3895eab0-d68b-11ec-aefb-d132b4563e73', '240011814@qq.com', 'LOGOUT', '{"clientAddress":"0:0:0:0:0:0:0:1","browser":"Chrome 102.0.5005","os":"Windows 10","device":"Other"}', 'SUCCESS', '');
INSERT INTO "public"."audit_log" VALUES ('bc0a2360-e578-11ec-a8c7-4b21fe31dd59', 1654506725526, '188f3780-d68b-11ec-aefb-d132b4563e73', '13126af0-d737-11ec-94a0-cd6fda244b19', '402b37b0-d737-11ec-94a0-cd6fda244b19', 'USER', '1111111@qq.com', '402b37b0-d737-11ec-94a0-cd6fda244b19', '1111111@qq.com', 'LOGIN', '{"clientAddress":"0:0:0:0:0:0:0:1","browser":"Chrome 102.0.5005","os":"Windows 10","device":"Other"}', 'FAILURE', 'org.springframework.security.authentication.BadCredentialsException: Authentication Failed. Username or Password not valid.
	at org.thingsboard.server.service.security.system.DefaultSystemSecurityService.validateUserCredentials(DefaultSystemSecurityService.java:139)
	at org.thingsboard.server.service.security.system.DefaultSystemSecurityService$$FastClassBySpringCGLIB$$90d2a0e3.invoke(<generated>)
	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)
	at org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:688)
	at org.thingsboard.server.service.security.system.DefaultSystemSecurityService$$EnhancerBySpringCGLIB$$5db6d473.validateUserCredentials(<generated>)
	at org.thingsboard.server.service.security.auth.rest.RestAuthenticationProvider.authenticateByUsernameAndPassword(RestAuthenticationProvider.java:104)
	at org.thingsboard.server.service.security.auth.rest.RestAuthenticationProvider.authenticate(RestAuthenticationProvider.java:83)
	at org.springframework.security.authentication.ProviderManager.authenticate(ProviderManager.java:182)
	at org.springframework.security.authentication.ProviderManager.authenticate(ProviderManager.java:201)
	at org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter$AuthenticationManagerDelegator.authenticate(WebSecurityConfigurerAdapter.java:524)
	at org.thingsboard.server.service.security.auth.rest.RestLoginProcessingFilter.attemptAuthentication(RestLoginProcessingFilter.java:84)
	at org.springframework.security.web.authentication.AbstractAuthenticationProcessingFilter.doFilter(AbstractAuthenticationProcessingFilter.java:212)
	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)
	at org.springframework.security.web.authentication.AbstractAuthenticationProcessingFilter.doFilter(AbstractAuthenticationProcessingFilter.java:200)
	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)
	at org.springframework.security.oauth2.client.web.OAuth2AuthorizationRequestRedirectFilter.doFilterInternal(OAuth2AuthorizationRequestRedirectFilter.java:178)
	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:119)
	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)
	at org.springframework.security.web.authentication.logout.LogoutFilter.doFilter(LogoutFilter.java:116)
	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)
	at org.springframework.web.filter.CorsFilter.doFilterInternal(CorsFilter.java:92)
	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:119)
	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)
	at org.springframework.security.web.header.HeaderWriterFilter.doHeadersAfter(HeaderWriterFilter.java:92)
	at org.springframework.security.web.header.HeaderWriterFilter.doFilterInternal(HeaderWriterFilter.java:77)
	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:119)
	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)
	at org.springframework.security.web.context.SecurityContextPersistenceFilter.doFilter(SecurityContextPersistenceFilter.java:105)
	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)
	at org.springframework.security.web.context.request.async.WebAsyncManagerIntegrationFilter.doFilterInternal(WebAsyncManagerIntegrationFilter.java:56)
	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:119)
	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)
	at org.springframework.security.web.FilterChainProxy.doFilterInternal(FilterChainProxy.java:215)
	at org.springframework.security.web.FilterChainProxy.doFilter(FilterChainProxy.java:178)
	at org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:358)
	at org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:271)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)
	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:100)
	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:119)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)
	at org.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:93)
	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:119)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)
	at org.springframework.boot.actuate.metrics.web.servlet.WebMvcMetricsFilter.doFilterInternal(WebMvcMetricsFilter.java:97)
	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:119)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)
	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:201)
	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:119)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)
	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:202)
	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:97)
	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:542)
	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:143)
	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:92)
	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:78)
	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:357)
	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:374)
	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:65)
	at org.apache.coyote.AbstractProtocol$ConnectionHandler.process(AbstractProtocol.java:893)
	at org.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1707)
	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)
	at java.base/java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1128)
	at java.base/java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:628)
	at org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)
	at java.base/java.lang.Thread.run(Thread.java:834)
');
INSERT INTO "public"."audit_log" VALUES ('bde6ab90-e578-11ec-a8c7-4b21fe31dd59', 1654506728649, '188f3780-d68b-11ec-aefb-d132b4563e73', '13126af0-d737-11ec-94a0-cd6fda244b19', '402b37b0-d737-11ec-94a0-cd6fda244b19', 'USER', '1111111@qq.com', '402b37b0-d737-11ec-94a0-cd6fda244b19', '1111111@qq.com', 'LOGIN', '{"clientAddress":"0:0:0:0:0:0:0:1","browser":"Chrome 102.0.5005","os":"Windows 10","device":"Other"}', 'FAILURE', 'org.springframework.security.authentication.BadCredentialsException: Authentication Failed. Username or Password not valid.
	at org.thingsboard.server.service.security.system.DefaultSystemSecurityService.validateUserCredentials(DefaultSystemSecurityService.java:139)
	at org.thingsboard.server.service.security.system.DefaultSystemSecurityService$$FastClassBySpringCGLIB$$90d2a0e3.invoke(<generated>)
	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)
	at org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:688)
	at org.thingsboard.server.service.security.system.DefaultSystemSecurityService$$EnhancerBySpringCGLIB$$5db6d473.validateUserCredentials(<generated>)
	at org.thingsboard.server.service.security.auth.rest.RestAuthenticationProvider.authenticateByUsernameAndPassword(RestAuthenticationProvider.java:104)
	at org.thingsboard.server.service.security.auth.rest.RestAuthenticationProvider.authenticate(RestAuthenticationProvider.java:83)
	at org.springframework.security.authentication.ProviderManager.authenticate(ProviderManager.java:182)
	at org.springframework.security.authentication.ProviderManager.authenticate(ProviderManager.java:201)
	at org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter$AuthenticationManagerDelegator.authenticate(WebSecurityConfigurerAdapter.java:524)
	at org.thingsboard.server.service.security.auth.rest.RestLoginProcessingFilter.attemptAuthentication(RestLoginProcessingFilter.java:84)
	at org.springframework.security.web.authentication.AbstractAuthenticationProcessingFilter.doFilter(AbstractAuthenticationProcessingFilter.java:212)
	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)
	at org.springframework.security.web.authentication.AbstractAuthenticationProcessingFilter.doFilter(AbstractAuthenticationProcessingFilter.java:200)
	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)
	at org.springframework.security.oauth2.client.web.OAuth2AuthorizationRequestRedirectFilter.doFilterInternal(OAuth2AuthorizationRequestRedirectFilter.java:178)
	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:119)
	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)
	at org.springframework.security.web.authentication.logout.LogoutFilter.doFilter(LogoutFilter.java:116)
	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)
	at org.springframework.web.filter.CorsFilter.doFilterInternal(CorsFilter.java:92)
	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:119)
	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)
	at org.springframework.security.web.header.HeaderWriterFilter.doHeadersAfter(HeaderWriterFilter.java:92)
	at org.springframework.security.web.header.HeaderWriterFilter.doFilterInternal(HeaderWriterFilter.java:77)
	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:119)
	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)
	at org.springframework.security.web.context.SecurityContextPersistenceFilter.doFilter(SecurityContextPersistenceFilter.java:105)
	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)
	at org.springframework.security.web.context.request.async.WebAsyncManagerIntegrationFilter.doFilterInternal(WebAsyncManagerIntegrationFilter.java:56)
	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:119)
	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)
	at org.springframework.security.web.FilterChainProxy.doFilterInternal(FilterChainProxy.java:215)
	at org.springframework.security.web.FilterChainProxy.doFilter(FilterChainProxy.java:178)
	at org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:358)
	at org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:271)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)
	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:100)
	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:119)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)
	at org.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:93)
	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:119)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)
	at org.springframework.boot.actuate.metrics.web.servlet.WebMvcMetricsFilter.doFilterInternal(WebMvcMetricsFilter.java:97)
	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:119)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)
	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:201)
	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:119)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)
	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:202)
	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:97)
	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:542)
	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:143)
	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:92)
	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:78)
	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:357)
	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:374)
	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:65)
	at org.apache.coyote.AbstractProtocol$ConnectionHandler.process(AbstractProtocol.java:893)
	at org.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1707)
	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)
	at java.base/java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1128)
	at java.base/java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:628)
	at org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)
	at java.base/java.lang.Thread.run(Thread.java:834)
');
INSERT INTO "public"."audit_log" VALUES ('c0a22210-e578-11ec-a8c7-4b21fe31dd59', 1654506733233, '188f3780-d68b-11ec-aefb-d132b4563e73', '13814000-1dd2-11b2-8080-808080808080', '3895eab0-d68b-11ec-aefb-d132b4563e73', 'USER', '240011814@qq.com', '3895eab0-d68b-11ec-aefb-d132b4563e73', '240011814@qq.com', 'LOGIN', '{"clientAddress":"0:0:0:0:0:0:0:1","browser":"Chrome 102.0.5005","os":"Windows 10","device":"Other"}', 'SUCCESS', '');
INSERT INTO "public"."audit_log" VALUES ('c998bff0-e578-11ec-a8c7-4b21fe31dd59', 1654506748271, '188f3780-d68b-11ec-aefb-d132b4563e73', '13126af0-d737-11ec-94a0-cd6fda244b19', '402b37b0-d737-11ec-94a0-cd6fda244b19', 'USER', '1111111@qq.com', '3895eab0-d68b-11ec-aefb-d132b4563e73', '240011814@qq.com', 'DELETED', '{"entityId":"402b37b0-d737-11ec-94a0-cd6fda244b19"}', 'SUCCESS', '');
INSERT INTO "public"."audit_log" VALUES ('cfff1600-e578-11ec-a8c7-4b21fe31dd59', 1654506759008, '188f3780-d68b-11ec-aefb-d132b4563e73', '13126af0-d737-11ec-94a0-cd6fda244b19', 'cffa5b10-e578-11ec-a8c7-4b21fe31dd59', 'USER', '11111111@qq.com', '3895eab0-d68b-11ec-aefb-d132b4563e73', '240011814@qq.com', 'ADDED', '{"entity":{"id":{"entityType":"USER","id":"cffa5b10-e578-11ec-a8c7-4b21fe31dd59"},"createdTime":1654506758977,"additionalInfo":{"description":"","defaultDashboardId":null,"defaultDashboardFullscreen":false,"homeDashboardId":null,"homeDashboardHideToolbar":true},"tenantId":{"entityType":"TENANT","id":"188f3780-d68b-11ec-aefb-d132b4563e73"},"customerId":{"entityType":"CUSTOMER","id":"13126af0-d737-11ec-94a0-cd6fda244b19"},"email":"11111111@qq.com","authority":"CUSTOMER_USER","firstName":null,"lastName":null,"name":"11111111@qq.com"}}', 'SUCCESS', '');
INSERT INTO "public"."audit_log" VALUES ('e3808650-e578-11ec-a8c7-4b21fe31dd59', 1654506791733, '188f3780-d68b-11ec-aefb-d132b4563e73', '13126af0-d737-11ec-94a0-cd6fda244b19', 'cffa5b10-e578-11ec-a8c7-4b21fe31dd59', 'USER', '11111111@qq.com', 'cffa5b10-e578-11ec-a8c7-4b21fe31dd59', '11111111@qq.com', 'LOGOUT', '{"clientAddress":"0:0:0:0:0:0:0:1","browser":"Chrome 102.0.5005","os":"Windows 10","device":"Other"}', 'SUCCESS', '');
INSERT INTO "public"."audit_log" VALUES ('e58aae30-e578-11ec-a8c7-4b21fe31dd59', 1654506795155, '188f3780-d68b-11ec-aefb-d132b4563e73', '13814000-1dd2-11b2-8080-808080808080', '3895eab0-d68b-11ec-aefb-d132b4563e73', 'USER', '240011814@qq.com', '3895eab0-d68b-11ec-aefb-d132b4563e73', '240011814@qq.com', 'LOGIN', '{"clientAddress":"0:0:0:0:0:0:0:1","browser":"Chrome 102.0.5005","os":"Windows 10","device":"Other"}', 'SUCCESS', '');
INSERT INTO "public"."audit_log" VALUES ('f7610690-e578-11ec-a8c7-4b21fe31dd59', 1654506825081, '188f3780-d68b-11ec-aefb-d132b4563e73', '13814000-1dd2-11b2-8080-808080808080', 'f7526090-e578-11ec-a8c7-4b21fe31dd59', 'ENTITY_VIEW', '111', '3895eab0-d68b-11ec-aefb-d132b4563e73', '240011814@qq.com', 'ADDED', '{"entity":{"entityId":{"entityType":"DEVICE","id":"00e73d10-d68d-11ec-aefb-d132b4563e73"},"tenantId":{"entityType":"TENANT","id":"188f3780-d68b-11ec-aefb-d132b4563e73"},"customerId":{"entityType":"CUSTOMER","id":"13814000-1dd2-11b2-8080-808080808080"},"name":"111","type":"11","keys":{"timeseries":null,"attributes":{"cs":null,"ss":null,"sh":null}},"startTimeMs":0,"endTimeMs":0,"id":{"entityType":"ENTITY_VIEW","id":"f7526090-e578-11ec-a8c7-4b21fe31dd59"},"createdTime":1654506824985,"additionalInfo":{"description":""}}}', 'SUCCESS', '');

-- ----------------------------
-- Table structure for component_descriptor
-- ----------------------------
DROP TABLE IF EXISTS "public"."component_descriptor";
CREATE TABLE "public"."component_descriptor" (
  "id" uuid NOT NULL,
  "created_time" int8 NOT NULL,
  "actions" varchar(255) COLLATE "pg_catalog"."default",
  "clazz" varchar COLLATE "pg_catalog"."default",
  "configuration_descriptor" varchar COLLATE "pg_catalog"."default",
  "name" varchar(255) COLLATE "pg_catalog"."default",
  "scope" varchar(255) COLLATE "pg_catalog"."default",
  "search_text" varchar(255) COLLATE "pg_catalog"."default",
  "type" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of component_descriptor
-- ----------------------------
INSERT INTO "public"."component_descriptor" VALUES ('ee478c20-d68a-11ec-aefb-d132b4563e73', 1652865273314, NULL, 'org.thingsboard.rule.engine.action.TbCreateAlarmNode', '{"nodeDefinition":{"details":"Details - JS function that creates JSON object based on incoming message. This object will be added into Alarm.details field.\nNode output:\nIf alarm was not created, original message is returned. Otherwise new Message returned with type ''ALARM'', Alarm object in ''msg'' property and ''metadata'' will contains one of those properties ''isNewAlarm/isExistingAlarm''. Message payload can be accessed via <code>msg</code> property. For example <code>''temperature = '' + msg.temperature ;</code>. Message metadata can be accessed via <code>metadata</code> property. For example <code>''name = '' + metadata.customerName;</code>.","description":"Create or Update Alarm","inEnabled":true,"outEnabled":true,"relationTypes":["Created","Updated","False","Failure"],"customRelations":false,"ruleChainNode":false,"defaultConfiguration":{"alarmType":"General Alarm","alarmDetailsBuildJs":"var details = {};\nif (metadata.prevAlarmDetails) {\n    details = JSON.parse(metadata.prevAlarmDetails);\n    //remove prevAlarmDetails from metadata\n    delete metadata.prevAlarmDetails;\n    //now metadata is the same as it comes IN this rule node\n}\n\n\nreturn details;","severity":"CRITICAL","propagate":false,"propagateToOwner":false,"propagateToTenant":false,"useMessageAlarmData":false,"overwriteAlarmDetails":false,"dynamicSeverity":false,"relationTypes":[]},"uiResources":["static/rulenode/rulenode-core-config.js"],"configDirective":"tbActionNodeCreateAlarmConfig","icon":"notifications_active","iconUrl":"","docUrl":""}}', 'create alarm', 'TENANT', 'create alarm', 'ACTION');
INSERT INTO "public"."component_descriptor" VALUES ('eed15590-d68a-11ec-aefb-d132b4563e73', 1652865274217, NULL, 'org.thingsboard.rule.engine.transform.TbChangeOriginatorNode', '{"nodeDefinition":{"details":"Related Entity found using configured relation direction and Relation Type. If multiple Related Entities are found, only first Entity is used as new Originator, other entities are discarded.<br/>Alarm Originator found only in case original Originator is <code>Alarm</code> entity.","description":"Change Message Originator To Tenant/Customer/Related Entity/Alarm Originator","inEnabled":true,"outEnabled":true,"relationTypes":["Success","Failure"],"customRelations":false,"ruleChainNode":false,"defaultConfiguration":{"originatorSource":"CUSTOMER","relationsQuery":{"direction":"FROM","maxLevel":1,"filters":[{"relationType":"Contains","entityTypes":[]}],"fetchLastLevelOnly":false}},"uiResources":["static/rulenode/rulenode-core-config.js"],"configDirective":"tbTransformationNodeChangeOriginatorConfig","icon":"find_replace","iconUrl":"","docUrl":""}}', 'change originator', 'TENANT', 'change originator', 'TRANSFORMATION');
INSERT INTO "public"."component_descriptor" VALUES ('eed52620-d68a-11ec-aefb-d132b4563e73', 1652865274242, NULL, 'org.thingsboard.rule.engine.edge.TbMsgPushToEdgeNode', '{"nodeDefinition":{"details":"Push messages from cloud to edge. Message originator must be assigned to particular edge or message originator is <b>EDGE</b> entity itself. This node used only on cloud instances to push messages from cloud to edge. Once message arrived into this node it’s going to be converted into edge event and saved to the database. Node doesn''t push messages directly to edge, but stores event(s) in the edge queue. <br>Supports next originator types:<br><code>DEVICE</code><br><code>ASSET</code><br><code>ENTITY_VIEW</code><br><code>DASHBOARD</code><br><code>TENANT</code><br><code>CUSTOMER</code><br><code>EDGE</code><br><br>As well node supports next message types:<br><code>POST_TELEMETRY_REQUEST</code><br><code>POST_ATTRIBUTES_REQUEST</code><br><code>ATTRIBUTES_UPDATED</code><br><code>ATTRIBUTES_DELETED</code><br><code>ALARM</code><br><br>Message will be routed via <b>Failure</b> route if node was not able to save edge event to database or unsupported originator type/message type arrived. In case successful storage edge event to database message will be routed via <b>Success</b> route.","description":"Push messages from cloud to edge","inEnabled":true,"outEnabled":true,"relationTypes":["Success","Failure"],"customRelations":false,"ruleChainNode":false,"defaultConfiguration":{"scope":"SERVER_SCOPE"},"uiResources":["static/rulenode/rulenode-core-config.js"],"configDirective":"tbActionNodePushToEdgeConfig","icon":"cloud_download","iconUrl":"","docUrl":""}}', 'push to edge', 'TENANT', 'push to edge', 'ACTION');
INSERT INTO "public"."component_descriptor" VALUES ('eeda0820-d68a-11ec-aefb-d132b4563e73', 1652865274274, NULL, 'org.thingsboard.rule.engine.metadata.TbGetCustomerAttributeNode', '{"nodeDefinition":{"details":"If Attributes enrichment configured, server scope attributes are added into Message metadata. If Latest Telemetry enrichment configured, latest telemetry added into metadata. To access those attributes in other nodes this template can be used <code>metadata.temperature</code>.","description":"Add Originators Customer Attributes or Latest Telemetry into Message Metadata","inEnabled":true,"outEnabled":true,"relationTypes":["Success","Failure"],"customRelations":false,"ruleChainNode":false,"defaultConfiguration":{"attrMapping":{"temperature":"tempo"},"telemetry":false},"uiResources":["static/rulenode/rulenode-core-config.js"],"configDirective":"tbEnrichmentNodeCustomerAttributesConfig","icon":"","iconUrl":"","docUrl":""}}', 'customer attributes', 'TENANT', 'customer attributes', 'ENRICHMENT');
INSERT INTO "public"."component_descriptor" VALUES ('eedd3c70-d68a-11ec-aefb-d132b4563e73', 1652865274295, NULL, 'org.thingsboard.rule.engine.debug.TbMsgGeneratorNode', '{"nodeDefinition":{"details":"Generates messages with configurable period. Javascript function used for message generation.","description":"Periodically generates messages","inEnabled":false,"outEnabled":true,"relationTypes":["Success","Failure"],"customRelations":false,"ruleChainNode":false,"defaultConfiguration":{"msgCount":0,"periodInSeconds":1,"originatorId":null,"originatorType":null,"jsScript":"var msg = { temp: 42, humidity: 77 };\nvar metadata = { data: 40 };\nvar msgType = \"POST_TELEMETRY_REQUEST\";\n\nreturn { msg: msg, metadata: metadata, msgType: msgType };"},"uiResources":["static/rulenode/rulenode-core-config.js"],"configDirective":"tbActionNodeGeneratorConfig","icon":"repeat","iconUrl":"","docUrl":""}}', 'generator', 'TENANT', 'generator', 'ACTION');
INSERT INTO "public"."component_descriptor" VALUES ('eee10d00-d68a-11ec-aefb-d132b4563e73', 1652865274320, NULL, 'org.thingsboard.rule.engine.metadata.TbGetTelemetryNode', '{"nodeDefinition":{"details":"The node allows you to select fetch mode: <b>FIRST/LAST/ALL</b> to fetch telemetry of certain time range that are added into Message metadata without any prefix. If selected fetch mode <b>ALL</b> Telemetry will be added like array into Message Metadata where <b>key</b> is Timestamp and <b>value</b> is value of Telemetry.</br>If selected fetch mode <b>FIRST</b> or <b>LAST</b> Telemetry will be added like string without Timestamp.</br>Also, the rule node allows you to select telemetry sampling order: <b>ASC</b> or <b>DESC</b>. </br>Aggregation feature allows you to fetch aggregated telemetry as a single value by <b>AVG, COUNT, SUM, MIN, MAX, NONE</b>. </br><b>Note</b>: The maximum size of the fetched array is 1000 records.\n ","description":"Add Message Originator Telemetry for selected time range into Message Metadata\n","inEnabled":true,"outEnabled":true,"relationTypes":["Success","Failure"],"customRelations":false,"ruleChainNode":false,"defaultConfiguration":{"startInterval":2,"endInterval":1,"startIntervalPattern":"","endIntervalPattern":"","useMetadataIntervalPatterns":false,"startIntervalTimeUnit":"MINUTES","endIntervalTimeUnit":"MINUTES","fetchMode":"FIRST","orderBy":"ASC","aggregation":"NONE","limit":1000,"latestTsKeyNames":[]},"uiResources":["static/rulenode/rulenode-core-config.js"],"configDirective":"tbEnrichmentNodeGetTelemetryFromDatabase","icon":"","iconUrl":"","docUrl":""}}', 'originator telemetry', 'TENANT', 'originator telemetry', 'ENRICHMENT');
INSERT INTO "public"."component_descriptor" VALUES ('ef9eb7b0-d68a-11ec-aefb-d132b4563e73', 1652865275563, NULL, 'org.thingsboard.rule.engine.aws.sqs.TbSqsNode', '{"nodeDefinition":{"details":"Will publish message payload and metadata attributes to the AWS SQS queue. Outbound message will contain response fields (<code>messageId</code>, <code>requestId</code>, <code>messageBodyMd5</code>, <code>messageAttributesMd5</code>, <code>sequenceNumber</code>) in the Message Metadata from the AWS SQS. For example <b>requestId</b> field can be accessed with <code>metadata.requestId</code>.","description":"Publish messages to the AWS SQS","inEnabled":true,"outEnabled":true,"relationTypes":["Success","Failure"],"customRelations":false,"ruleChainNode":false,"defaultConfiguration":{"queueType":"STANDARD","queueUrlPattern":"https://sqs.us-east-1.amazonaws.com/123456789012/my-queue-name","delaySeconds":0,"messageAttributes":{},"accessKeyId":null,"secretAccessKey":null,"region":"us-east-1"},"uiResources":["static/rulenode/rulenode-core-config.js"],"configDirective":"tbActionNodeSqsConfig","icon":"","iconUrl":"data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAyNCAyNCIgd2lkdGg9IjQ4IiBoZWlnaHQ9IjQ4Ij48cGF0aCBkPSJNMTMuMjMgMTAuNTZWMTBjLTEuOTQgMC0zLjk5LjM5LTMuOTkgMi42NyAwIDEuMTYuNjEgMS45NSAxLjYzIDEuOTUuNzYgMCAxLjQzLS40NyAxLjg2LTEuMjIuNTItLjkzLjUtMS44LjUtMi44NG0yLjcgNi41M2MtLjE4LjE2LS40My4xNy0uNjMuMDYtLjg5LS43NC0xLjA1LTEuMDgtMS41NC0xLjc5LTEuNDcgMS41LTIuNTEgMS45NS00LjQyIDEuOTUtMi4yNSAwLTQuMDEtMS4zOS00LjAxLTQuMTcgMC0yLjE4IDEuMTctMy42NCAyLjg2LTQuMzggMS40Ni0uNjQgMy40OS0uNzYgNS4wNC0uOTNWNy41YzAtLjY2LjA1LTEuNDEtLjMzLTEuOTYtLjMyLS40OS0uOTUtLjctMS41LS43LTEuMDIgMC0xLjkzLjUzLTIuMTUgMS42MS0uMDUuMjQtLjI1LjQ4LS40Ny40OWwtMi42LS4yOGMtLjIyLS4wNS0uNDYtLjIyLS40LS41Ni42LTMuMTUgMy40NS00LjEgNi00LjEgMS4zIDAgMyAuMzUgNC4wMyAxLjMzQzE3LjExIDQuNTUgMTcgNi4xOCAxNyA3Ljk1djQuMTdjMCAxLjI1LjUgMS44MSAxIDIuNDguMTcuMjUuMjEuNTQgMCAuNzFsLTIuMDYgMS43OGgtLjAxIj48L3BhdGg+PHBhdGggZD0iTTIwLjE2IDE5LjU0QzE4IDIxLjE0IDE0LjgyIDIyIDEyLjEgMjJjLTMuODEgMC03LjI1LTEuNDEtOS44NS0zLjc2LS4yLS4xOC0uMDItLjQzLjI1LS4yOSAyLjc4IDEuNjMgNi4yNSAyLjYxIDkuODMgMi42MSAyLjQxIDAgNS4wNy0uNSA3LjUxLTEuNTMuMzctLjE2LjY2LjI0LjMyLjUxIj48L3BhdGg+PHBhdGggZD0iTTIxLjA3IDE4LjVjLS4yOC0uMzYtMS44NS0uMTctMi41Ny0uMDgtLjE5LjAyLS4yMi0uMTYtLjAzLS4zIDEuMjQtLjg4IDMuMjktLjYyIDMuNTMtLjMzLjI0LjMtLjA3IDIuMzUtMS4yNCAzLjMyLS4xOC4xNi0uMzUuMDctLjI2LS4xMS4yNi0uNjcuODUtMi4xNC41Ny0yLjV6Ij48L3BhdGg+PC9zdmc+","docUrl":""}}', 'aws sqs', 'TENANT', 'aws sqs', 'EXTERNAL');
INSERT INTO "public"."component_descriptor" VALUES ('eee41a40-d68a-11ec-aefb-d132b4563e73', 1652865274340, NULL, 'org.thingsboard.rule.engine.filter.TbJsFilterNode', '{"nodeDefinition":{"details":"Evaluate incoming Message with configured JS condition. If <b>True</b> - send Message via <b>True</b> chain, otherwise <b>False</b> chain is used.Message payload can be accessed via <code>msg</code> property. For example <code>msg.temperature < 10;</code><br/>Message metadata can be accessed via <code>metadata</code> property. For example <code>metadata.customerName === ''John'';</code><br/>Message type can be accessed via <code>msgType</code> property.","description":"Filter incoming messages using JS script","inEnabled":true,"outEnabled":true,"relationTypes":["True","False","Failure"],"customRelations":false,"ruleChainNode":false,"defaultConfiguration":{"jsScript":"return msg.temperature > 20;"},"uiResources":["static/rulenode/rulenode-core-config.js"],"configDirective":"tbFilterNodeScriptConfig","icon":"","iconUrl":"","docUrl":""}}', 'script', 'TENANT', 'script', 'FILTER');
INSERT INTO "public"."component_descriptor" VALUES ('eeee2c60-d68a-11ec-aefb-d132b4563e73', 1652865274406, NULL, 'org.thingsboard.rule.engine.mqtt.TbMqttNode', '{"nodeDefinition":{"details":"Will publish message payload to the MQTT broker with QoS <b>AT_LEAST_ONCE</b>.","description":"Publish messages to the MQTT broker","inEnabled":true,"outEnabled":true,"relationTypes":["Success","Failure"],"customRelations":false,"ruleChainNode":false,"defaultConfiguration":{"topicPattern":"my-topic","host":null,"port":1883,"connectTimeoutSec":10,"clientId":null,"appendClientIdSuffix":false,"cleanSession":true,"ssl":false,"credentials":{"type":"anonymous"}},"uiResources":["static/rulenode/rulenode-core-config.js"],"configDirective":"tbActionNodeMqttConfig","icon":"call_split","iconUrl":"","docUrl":""}}', 'mqtt', 'TENANT', 'mqtt', 'EXTERNAL');
INSERT INTO "public"."component_descriptor" VALUES ('eefc0f10-d68a-11ec-aefb-d132b4563e73', 1652865274497, NULL, 'org.thingsboard.rule.engine.gcp.pubsub.TbPubSubNode', '{"nodeDefinition":{"details":"Will publish message payload to the Google Cloud Platform PubSub topic. Outbound message will contain response fields (<code>messageId</code> in the Message Metadata from the GCP PubSub. <b>messageId</b> field can be accessed with <code>metadata.messageId</code>.","description":"Publish message to the Google Cloud PubSub","inEnabled":true,"outEnabled":true,"relationTypes":["Success","Failure"],"customRelations":false,"ruleChainNode":false,"defaultConfiguration":{"projectId":"my-google-cloud-project-id","topicName":"my-pubsub-topic-name","messageAttributes":{},"serviceAccountKey":null,"serviceAccountKeyFileName":null},"uiResources":["static/rulenode/rulenode-core-config.js"],"configDirective":"tbActionNodePubSubConfig","icon":"","iconUrl":"data:image/svg+xml;base64,PHN2ZyBpZD0iTGF5ZXJfMSIgZGF0YS1uYW1lPSJMYXllciAxIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMjgiIGhlaWdodD0iMTI4IiB2aWV3Qm94PSIwIDAgMTI4IDEyOCI+Cjx0aXRsZT5DbG91ZCBQdWJTdWI8L3RpdGxlPgo8Zz4KPHBhdGggZD0iTTEyNi40Nyw1OC4xMmwtMjYuMy00NS43NEExMS41NiwxMS41NiwwLDAsMCw5MC4zMSw2LjVIMzcuN2ExMS41NSwxMS41NSwwLDAsMC05Ljg2LDUuODhMMS41Myw1OGExMS40OCwxMS40OCwwLDAsMCwwLDExLjQ0bDI2LjMsNDZhMTEuNzcsMTEuNzcsMCwwLDAsOS44Niw2LjA5SDkwLjNhMTEuNzMsMTEuNzMsMCwwLDAsOS44Ny02LjA2bDI2LjMtNDUuNzRBMTEuNzMsMTEuNzMsMCwwLDAsMTI2LjQ3LDU4LjEyWiIgc3R5bGU9ImZpbGw6ICM3MzViMmYiLz4KPHBhdGggZD0iTTg5LjIyLDQ3Ljc0LDgzLjM2LDQ5bC0xNC42LTE0LjZMNjQuMDksNDMuMSw2MS41NSw1My4ybDQuMjksNC4yOUw1Ny42LDU5LjE4LDQ2LjMsNDcuODhsLTcuNjcsNy4zOEw1Mi43Niw2OS4zN2wtMTUsMTEuOUw3OCwxMjEuNUg5MC4zYTExLjczLDExLjczLDAsMCwwLDkuODctNi4wNmwyMC43Mi0zNloiIHN0eWxlPSJvcGFjaXR5OiAwLjA3MDAwMDAwMDI5ODAyMztpc29sYXRpb246IGlzb2xhdGUiLz4KPHBhdGggZD0iTTgyLjg2LDQ3YTUuMzIsNS4zMiwwLDEsMS0xLjk1LDcuMjdBNS4zMiw1LjMyLDAsMCwxLDgyLjg2LDQ3IiBzdHlsZT0iZmlsbDogI2ZmZiIvPgo8cGF0aCBkPSJNMzkuODIsNTYuMThhNS4zMiw1LjMyLDAsMSwxLDcuMjctMS45NSw1LjMyLDUuMzIsMCwwLDEtNy4yNywxLjk1IiBzdHlsZT0iZmlsbDogI2ZmZiIvPgo8cGF0aCBkPSJNNjkuMzIsODguODVBNS4zMiw1LjMyLDAsMSwxLDY0LDgzLjUyYTUuMzIsNS4zMiwwLDAsMSw1LjMyLDUuMzIiIHN0eWxlPSJmaWxsOiAjZmZmIi8+CjxnPgo8cGF0aCBkPSJNNjQsNTIuOTRhMTEuMDYsMTEuMDYsMCwwLDEsMi40Ni4yOFYzOS4xNUg2MS41NFY1My4yMkExMS4wNiwxMS4wNiwwLDAsMSw2NCw1Mi45NFoiIHN0eWxlPSJmaWxsOiAjZmZmIi8+CjxwYXRoIGQ9Ik03NC41Nyw2Ny4yNmExMSwxMSwwLDAsMS0yLjQ3LDQuMjVsMTIuMTksNywyLjQ2LTQuMjZaIiBzdHlsZT0iZmlsbDogI2ZmZiIvPgo8cGF0aCBkPSJNNTMuNDMsNjcuMjZsLTEyLjE4LDcsMi40Niw0LjI2LDEyLjE5LTdBMTEsMTEsMCwwLDEsNTMuNDMsNjcuMjZaIiBzdHlsZT0iZmlsbDogI2ZmZiIvPgo8L2c+CjxwYXRoIGQ9Ik03Mi42LDY0QTguNiw4LjYsMCwxLDEsNjQsNTUuNCw4LjYsOC42LDAsMCwxLDcyLjYsNjQiIHN0eWxlPSJmaWxsOiAjZmZmIi8+CjxwYXRoIGQ9Ik0zOS4xLDcwLjU3YTYuNzYsNi43NiwwLDEsMS0yLjQ3LDkuMjMsNi43Niw2Ljc2LDAsMCwxLDIuNDctOS4yMyIgc3R5bGU9ImZpbGw6ICNmZmYiLz4KPHBhdGggZD0iTTgyLjE0LDgyLjI3YTYuNzYsNi43NiwwLDEsMSw5LjIzLTIuNDcsNi43NSw2Ljc1LDAsMCwxLTkuMjMsMi40NyIgc3R5bGU9ImZpbGw6ICNmZmYiLz4KPHBhdGggZD0iTTcwLjc2LDM5LjE1QTYuNzYsNi43NiwwLDEsMSw2NCwzMi4zOWE2Ljc2LDYuNzYsMCwwLDEsNi43Niw2Ljc2IiBzdHlsZT0iZmlsbDogI2ZmZiIvPgo8L2c+Cjwvc3ZnPgo=","docUrl":""}}', 'gcp pubsub', 'TENANT', 'gcp pubsub', 'EXTERNAL');
INSERT INTO "public"."component_descriptor" VALUES ('ef0277b0-d68a-11ec-aefb-d132b4563e73', 1652865274539, NULL, 'org.thingsboard.rule.engine.transform.TbTransformMsgNode', '{"nodeDefinition":{"details":"JavaScript function receive 3 input parameters <br/> <code>metadata</code> - is a Message metadata.<br/><code>msg</code> - is a Message payload.<br/><code>msgType</code> - is a Message type.<br/>Should return the following structure:<br/><code>{ msg: <i style=\"color: #666;\">new payload</i>,<br/>&nbsp&nbsp&nbspmetadata: <i style=\"color: #666;\">new metadata</i>,<br/>&nbsp&nbsp&nbspmsgType: <i style=\"color: #666;\">new msgType</i> }</code><br/>All fields in resulting object are optional and will be taken from original message if not specified.","description":"Change Message payload, Metadata or Message type using JavaScript","inEnabled":true,"outEnabled":true,"relationTypes":["Success","Failure"],"customRelations":false,"ruleChainNode":false,"defaultConfiguration":{"jsScript":"return {msg: msg, metadata: metadata, msgType: msgType};"},"uiResources":["static/rulenode/rulenode-core-config.js"],"configDirective":"tbTransformationNodeScriptConfig","icon":"","iconUrl":"","docUrl":""}}', 'script', 'TENANT', 'script', 'TRANSFORMATION');
INSERT INTO "public"."component_descriptor" VALUES ('ef0584f0-d68a-11ec-aefb-d132b4563e73', 1652865274559, NULL, 'org.thingsboard.rule.engine.filter.TbCheckMessageNode', '{"nodeDefinition":{"details":"If selected checkbox ''Check that all selected keys are present''\" and all keys in message data and metadata are exist - send Message via <b>True</b> chain, otherwise <b>False</b> chain is used.\nElse if the checkbox is not selected, and at least one of the keys from data or metadata of the message exists - send Message via <b>True</b> chain, otherwise, <b>False</b> chain is used. ","description":"Checks the existence of the selected keys from message data and metadata.","inEnabled":true,"outEnabled":true,"relationTypes":["True","False","Failure"],"customRelations":false,"ruleChainNode":false,"defaultConfiguration":{"messageNames":[],"metadataNames":[],"checkAllKeys":true},"uiResources":["static/rulenode/rulenode-core-config.js"],"configDirective":"tbFilterNodeCheckMessageConfig","icon":"","iconUrl":"","docUrl":""}}', 'check existence fields', 'TENANT', 'check existence fields', 'FILTER');
INSERT INTO "public"."component_descriptor" VALUES ('ef089230-d68a-11ec-aefb-d132b4563e73', 1652865274579, NULL, 'org.thingsboard.rule.engine.filter.TbOriginatorTypeSwitchNode', '{"nodeDefinition":{"details":"Routes messages to chain according to the originator type (''Device'', ''Asset'', etc.).","description":"Route incoming messages by Message Originator Type","inEnabled":true,"outEnabled":true,"relationTypes":["Device","Asset","Alarm","Entity View","Tenant","Customer","User","Dashboard","Rule chain","Rule node","Failure"],"customRelations":false,"ruleChainNode":false,"defaultConfiguration":{"version":0},"uiResources":["static/rulenode/rulenode-core-config.js"],"configDirective":"tbNodeEmptyConfig","icon":"","iconUrl":"","docUrl":""}}', 'originator type switch', 'TENANT', 'originator type switch', 'FILTER');
INSERT INTO "public"."component_descriptor" VALUES ('ef0d2610-d68a-11ec-aefb-d132b4563e73', 1652865274609, NULL, 'org.thingsboard.rule.engine.geo.TbGpsGeofencingActionNode', '{"nodeDefinition":{"details":"Extracts latitude and longitude parameters from incoming message and returns different events based on configuration parameters","description":"Produces incoming messages using GPS based geofencing","inEnabled":true,"outEnabled":true,"relationTypes":["Success","Entered","Left","Inside","Outside","Failure"],"customRelations":false,"ruleChainNode":false,"defaultConfiguration":{"latitudeKeyName":"latitude","longitudeKeyName":"longitude","perimeterType":"POLYGON","fetchPerimeterInfoFromMessageMetadata":true,"perimeterKeyName":"ss_perimeter","polygonsDefinition":null,"centerLatitude":null,"centerLongitude":null,"range":null,"rangeUnit":null,"minInsideDuration":1,"minOutsideDuration":1,"minInsideDurationTimeUnit":"MINUTES","minOutsideDurationTimeUnit":"MINUTES"},"uiResources":["static/rulenode/rulenode-core-config.js"],"configDirective":"tbActionNodeGpsGeofencingConfig","icon":"","iconUrl":"","docUrl":""}}', 'gps geofencing events', 'TENANT', 'gps geofencing events', 'ACTION');
INSERT INTO "public"."component_descriptor" VALUES ('ef10a880-d68a-11ec-aefb-d132b4563e73', 1652865274632, NULL, 'org.thingsboard.rule.engine.sms.TbSendSmsNode', '{"nodeDefinition":{"details":"Will send SMS message by populating target phone numbers and sms message fields using values derived from message metadata.","description":"Sends SMS message via SMS provider.","inEnabled":true,"outEnabled":true,"relationTypes":["Success","Failure"],"customRelations":false,"ruleChainNode":false,"defaultConfiguration":{"numbersToTemplate":"${userPhone}","smsMessageTemplate":"Device ${deviceName} has high temperature ${temp}","useSystemSmsSettings":true,"smsProviderConfiguration":null},"uiResources":["static/rulenode/rulenode-core-config.js"],"configDirective":"tbActionNodeSendSmsConfig","icon":"sms","iconUrl":"","docUrl":""}}', 'send sms', 'TENANT', 'send sms', 'EXTERNAL');
INSERT INTO "public"."component_descriptor" VALUES ('ef134090-d68a-11ec-aefb-d132b4563e73', 1652865274649, NULL, 'org.thingsboard.rule.engine.metadata.TbGetOriginatorFieldsNode', '{"nodeDefinition":{"details":"Will fetch fields values specified in mapping. If specified field is not part of originator fields it will be ignored.","description":"Add Message Originator fields values into Message Metadata","inEnabled":true,"outEnabled":true,"relationTypes":["Success","Failure"],"customRelations":false,"ruleChainNode":false,"defaultConfiguration":{"fieldsMapping":{"name":"originatorName","type":"originatorType"}},"uiResources":["static/rulenode/rulenode-core-config.js"],"configDirective":"tbEnrichmentNodeOriginatorFieldsConfig","icon":"","iconUrl":"","docUrl":""}}', 'originator fields', 'TENANT', 'originator fields', 'ENRICHMENT');
INSERT INTO "public"."component_descriptor" VALUES ('ef169bf0-d68a-11ec-aefb-d132b4563e73', 1652865274671, NULL, 'org.thingsboard.rule.engine.edge.TbMsgPushToCloudNode', '{"nodeDefinition":{"details":"Push messages from edge to cloud. This node used only on edge to push messages from edge to cloud. Once message arrived into this node it’s going to be converted into cloud event and saved to the local database. Node doesn''t push messages directly to cloud, but stores event(s) in the cloud queue. <br>Supports next originator types:<br><code>DEVICE</code><br><code>ASSET</code><br><code>ENTITY_VIEW</code><br><code>DASHBOARD</code><br><code>TENANT</code><br><code>CUSTOMER</code><br><code>EDGE</code><br><br>As well node supports next message types:<br><code>POST_TELEMETRY_REQUEST</code><br><code>POST_ATTRIBUTES_REQUEST</code><br><code>ATTRIBUTES_UPDATED</code><br><code>ATTRIBUTES_DELETED</code><br><code>ALARM</code><br><br>Message will be routed via <b>Failure</b> route if node was not able to save cloud event to database or unsupported originator type/message type arrived. In case successful storage cloud event to database message will be routed via <b>Success</b> route.","description":"Pushes messages from edge to cloud","inEnabled":true,"outEnabled":true,"relationTypes":["Success","Failure"],"customRelations":false,"ruleChainNode":false,"defaultConfiguration":{"scope":"SERVER_SCOPE"},"uiResources":["static/rulenode/rulenode-core-config.js"],"configDirective":"tbActionNodePushToCloudConfig","icon":"cloud_upload","iconUrl":"","docUrl":""}}', 'push to cloud', 'TENANT', 'push to cloud', 'ACTION');
INSERT INTO "public"."component_descriptor" VALUES ('ef1a4570-d68a-11ec-aefb-d132b4563e73', 1652865274695, NULL, 'org.thingsboard.rule.engine.metadata.CalculateDeltaNode', '{"nodeDefinition":{"details":"Calculates delta and period based on the previous time-series reading and current data. Delta calculation is done in scope of the message originator, e.g. device, asset or customer. If there is input key, the output relation will be ''Success'' unless delta is negative and corresponding configuration parameter is set. If there is no input value key in the incoming message, the output relation will be ''Other''.","description":"Calculates and adds ''delta'' value into message based on the incoming and previous value","inEnabled":true,"outEnabled":true,"relationTypes":["Success","Failure","Other"],"customRelations":false,"ruleChainNode":false,"defaultConfiguration":{"inputValueKey":"pulseCounter","outputValueKey":"delta","useCache":true,"addPeriodBetweenMsgs":false,"periodValueKey":"periodInMs","round":null,"tellFailureIfDeltaIsNegative":true},"uiResources":["static/rulenode/rulenode-core-config.js"],"configDirective":"tbEnrichmentNodeCalculateDeltaConfig","icon":"","iconUrl":"","docUrl":""}}', 'calculate delta', 'TENANT', 'calculate delta', 'ENRICHMENT');
INSERT INTO "public"."component_descriptor" VALUES ('ef1e1600-d68a-11ec-aefb-d132b4563e73', 1652865274720, NULL, 'org.thingsboard.rule.engine.profile.TbDeviceProfileNode', '{"nodeDefinition":{"details":"Create and clear alarms based on alarm rules defined in device profile. The output relation type is either ''Alarm Created'', ''Alarm Updated'', ''Alarm Severity Updated'' and ''Alarm Cleared'' or simply ''Success'' if no alarms were affected.","description":"Process device messages based on device profile settings","inEnabled":true,"outEnabled":true,"relationTypes":["Alarm Created","Alarm Updated","Alarm Severity Updated","Alarm Cleared","Success","Failure"],"customRelations":true,"ruleChainNode":false,"defaultConfiguration":{"persistAlarmRulesState":false,"fetchAlarmRulesStateOnStart":false},"uiResources":["static/rulenode/rulenode-core-config.js"],"configDirective":"tbDeviceProfileConfig","icon":"","iconUrl":"","docUrl":""}}', 'device profile', 'TENANT', 'device profile', 'ACTION');
INSERT INTO "public"."component_descriptor" VALUES ('ef214a50-d68a-11ec-aefb-d132b4563e73', 1652865274741, NULL, 'org.thingsboard.rule.engine.rpc.TbSendRPCReplyNode', '{"nodeDefinition":{"details":"Expects messages with any message type. Will forward message body to the device.","description":"Sends reply to RPC call from device","inEnabled":true,"outEnabled":true,"relationTypes":["Success","Failure"],"customRelations":false,"ruleChainNode":false,"defaultConfiguration":{"serviceIdMetaDataAttribute":"serviceId","sessionIdMetaDataAttribute":"sessionId","requestIdMetaDataAttribute":"requestId"},"uiResources":["static/rulenode/rulenode-core-config.js"],"configDirective":"tbActionNodeRpcReplyConfig","icon":"call_merge","iconUrl":"","docUrl":""}}', 'rpc call reply', 'TENANT', 'rpc call reply', 'ACTION');
INSERT INTO "public"."component_descriptor" VALUES ('ef24f3d0-d68a-11ec-aefb-d132b4563e73', 1652865274765, NULL, 'org.thingsboard.rule.engine.filter.TbCheckRelationNode', '{"nodeDefinition":{"details":"If at least one relation exists - send Message via <b>True</b> chain, otherwise <b>False</b> chain is used.","description":"Checks the relation from the selected entity to the originator of the message by type and direction if ''Check for single entity'' is set to true, otherwise rule node will check if exist any relation to the originator of the message by type and direction.","inEnabled":true,"outEnabled":true,"relationTypes":["True","False","Failure"],"customRelations":false,"ruleChainNode":false,"defaultConfiguration":{"direction":"FROM","entityId":null,"entityType":null,"relationType":"Contains","checkForSingleEntity":true},"uiResources":["static/rulenode/rulenode-core-config.js"],"configDirective":"tbFilterNodeCheckRelationConfig","icon":"","iconUrl":"","docUrl":""}}', 'check relation', 'TENANT', 'check relation', 'FILTER');
INSERT INTO "public"."component_descriptor" VALUES ('ef282820-d68a-11ec-aefb-d132b4563e73', 1652865274786, NULL, 'org.thingsboard.rule.engine.filter.TbMsgTypeFilterNode', '{"nodeDefinition":{"details":"If incoming MessageType is expected - send Message via <b>True</b> chain, otherwise <b>False</b> chain is used.","description":"Filter incoming messages by Message Type","inEnabled":true,"outEnabled":true,"relationTypes":["True","False","Failure"],"customRelations":false,"ruleChainNode":false,"defaultConfiguration":{"messageTypes":["POST_ATTRIBUTES_REQUEST","POST_TELEMETRY_REQUEST","TO_SERVER_RPC_REQUEST"]},"uiResources":["static/rulenode/rulenode-core-config.js"],"configDirective":"tbFilterNodeMessageTypeConfig","icon":"","iconUrl":"","docUrl":""}}', 'message type', 'TENANT', 'message type', 'FILTER');
INSERT INTO "public"."component_descriptor" VALUES ('ef43c670-d68a-11ec-aefb-d132b4563e73', 1652865274967, NULL, 'org.thingsboard.rule.engine.mqtt.azure.TbAzureIotHubNode', '{"nodeDefinition":{"details":"Will publish message payload to the Azure IoT Hub with QoS <b>AT_LEAST_ONCE</b>.","description":"Publish messages to the Azure IoT Hub","inEnabled":true,"outEnabled":true,"relationTypes":["Success","Failure"],"customRelations":false,"ruleChainNode":false,"defaultConfiguration":{"topicPattern":"devices/<device_id>/messages/events/","host":"<iot-hub-name>.azure-devices.net","port":8883,"connectTimeoutSec":10,"clientId":null,"appendClientIdSuffix":false,"cleanSession":true,"ssl":true,"credentials":{"type":"sas","caCert":null,"cert":null,"privateKey":null,"password":null,"sasKey":null}},"uiResources":["static/rulenode/rulenode-core-config.js"],"configDirective":"tbActionNodeAzureIotHubConfig","icon":"","iconUrl":"","docUrl":""}}', 'azure iot hub', 'TENANT', 'azure iot hub', 'EXTERNAL');
INSERT INTO "public"."component_descriptor" VALUES ('ef480c30-d68a-11ec-aefb-d132b4563e73', 1652865274995, NULL, 'org.thingsboard.rule.engine.action.TbCopyAttributesToEntityViewNode', '{"nodeDefinition":{"details":"Copy attributes from asset/device to related entity view according to entity view configuration. \n Copy will be done only for attributes that are between start and end dates and according to attribute keys configuration. \nChanges message originator to related entity view and produces new messages according to count of updated entity views","description":"Copy attributes from asset/device to entity view and changes message originator to related entity view","inEnabled":true,"outEnabled":true,"relationTypes":["Success","Failure"],"customRelations":false,"ruleChainNode":false,"defaultConfiguration":{"version":0},"uiResources":["static/rulenode/rulenode-core-config.js"],"configDirective":"tbNodeEmptyConfig","icon":"content_copy","iconUrl":"","docUrl":""}}', 'copy to view', 'TENANT', 'copy to view', 'ACTION');
INSERT INTO "public"."component_descriptor" VALUES ('ef4bb5b0-d68a-11ec-aefb-d132b4563e73', 1652865275019, NULL, 'org.thingsboard.rule.engine.metadata.TbGetTenantAttributeNode', '{"nodeDefinition":{"details":"If Attributes enrichment configured, server scope attributes are added into Message metadata. If Latest Telemetry enrichment configured, latest telemetry added into metadata. To access those attributes in other nodes this template can be used <code>metadata.temperature</code>.","description":"Add Originators Tenant Attributes or Latest Telemetry into Message Metadata","inEnabled":true,"outEnabled":true,"relationTypes":["Success","Failure"],"customRelations":false,"ruleChainNode":false,"defaultConfiguration":{"attrMapping":{"temperature":"tempo"},"telemetry":false},"uiResources":["static/rulenode/rulenode-core-config.js"],"configDirective":"tbEnrichmentNodeTenantAttributesConfig","icon":"","iconUrl":"","docUrl":""}}', 'tenant attributes', 'TENANT', 'tenant attributes', 'ENRICHMENT');
INSERT INTO "public"."component_descriptor" VALUES ('ef510ce0-d68a-11ec-aefb-d132b4563e73', 1652865275054, NULL, 'org.thingsboard.rule.engine.metadata.TbGetDeviceAttrNode', '{"nodeDefinition":{"details":"If Attributes enrichment configured, <b>CLIENT/SHARED/SERVER</b> attributes are added into Message metadata with specific prefix: <i>cs/shared/ss</i>. Latest telemetry value added into metadata without prefix. To access those attributes in other nodes this template can be used <code>metadata.cs_temperature</code> or <code>metadata.shared_limit</code> ","description":"Add Originators Related Device Attributes and Latest Telemetry value into Message Metadata","inEnabled":true,"outEnabled":true,"relationTypes":["Success","Failure"],"customRelations":false,"ruleChainNode":false,"defaultConfiguration":{"clientAttributeNames":[],"sharedAttributeNames":[],"serverAttributeNames":[],"latestTsKeyNames":[],"tellFailureIfAbsent":true,"getLatestValueWithTs":false,"deviceRelationsQuery":{"direction":"FROM","maxLevel":1,"relationType":"Contains","deviceTypes":["default"],"fetchLastLevelOnly":false}},"uiResources":["static/rulenode/rulenode-core-config.js"],"configDirective":"tbEnrichmentNodeDeviceAttributesConfig","icon":"","iconUrl":"","docUrl":""}}', 'related device attributes', 'TENANT', 'related device attributes', 'ENRICHMENT');
INSERT INTO "public"."component_descriptor" VALUES ('ef5579b0-d68a-11ec-aefb-d132b4563e73', 1652865275083, NULL, 'org.thingsboard.rule.engine.action.TbLogNode', '{"nodeDefinition":{"details":"Transform incoming Message with configured JS function to String and log final value into Thingsboard log file. Message payload can be accessed via <code>msg</code> property. For example <code>''temperature = '' + msg.temperature ;</code>. Message metadata can be accessed via <code>metadata</code> property. For example <code>''name = '' + metadata.customerName;</code>.","description":"Log incoming messages using JS script for transformation Message into String","inEnabled":true,"outEnabled":true,"relationTypes":["Success","Failure"],"customRelations":false,"ruleChainNode":false,"defaultConfiguration":{"jsScript":"return ''Incoming message:\\n'' + JSON.stringify(msg) + ''\\nIncoming metadata:\\n'' + JSON.stringify(metadata);"},"uiResources":["static/rulenode/rulenode-core-config.js"],"configDirective":"tbActionNodeLogConfig","icon":"menu","iconUrl":"","docUrl":""}}', 'log', 'TENANT', 'log', 'ACTION');
INSERT INTO "public"."component_descriptor" VALUES ('ef58ae00-d68a-11ec-aefb-d132b4563e73', 1652865275104, NULL, 'org.thingsboard.rule.engine.rest.TbRestApiCallNode', '{"nodeDefinition":{"details":"Will invoke REST API call <code>GET | POST | PUT | DELETE</code> to external REST server. Message payload added into Request body. Configured attributes can be added into Headers from Message Metadata. Outbound message will contain response fields (<code>status</code>, <code>statusCode</code>, <code>statusReason</code> and response <code>headers</code>) in the Message Metadata. Response body saved in outbound Message payload. For example <b>statusCode</b> field can be accessed with <code>metadata.statusCode</code>.<br/><b>Note-</b> if you use system proxy properties, the next system proxy properties should be added: \"http.proxyHost\" and \"http.proxyPort\" or  \"https.proxyHost\" and \"https.proxyPort\" or \"socksProxyHost\" and \"socksProxyPort\",and if your proxy with auth, the next ones  should be added: \"tb.proxy.user\" and \"tb.proxy.password\" to the thingsboard.conf file.","description":"Invoke REST API calls to external REST server","inEnabled":true,"outEnabled":true,"relationTypes":["Success","Failure"],"customRelations":false,"ruleChainNode":false,"defaultConfiguration":{"restEndpointUrlPattern":"http://localhost/api","requestMethod":"POST","headers":{"Content-Type":"application/json"},"useSimpleClientHttpFactory":false,"readTimeoutMs":0,"maxParallelRequestsCount":0,"useRedisQueueForMsgPersistence":false,"trimQueue":false,"maxQueueSize":0,"enableProxy":false,"useSystemProxyProperties":false,"proxyHost":null,"proxyPort":0,"proxyUser":null,"proxyPassword":null,"proxyScheme":null,"credentials":{"type":"anonymous"},"ignoreRequestBody":false},"uiResources":["static/rulenode/rulenode-core-config.js"],"configDirective":"tbActionNodeRestApiCallConfig","icon":"","iconUrl":"data:image/svg+xml;base64,PHN2ZyBzdHlsZT0iZW5hYmxlLWJhY2tncm91bmQ6bmV3IDAgMCA1MTIgNTEyIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbDpzcGFjZT0icHJlc2VydmUiIHZpZXdCb3g9IjAgMCA1MTIgNTEyIiB2ZXJzaW9uPSIxLjEiIHk9IjBweCIgeD0iMHB4Ij48ZyB0cmFuc2Zvcm09Im1hdHJpeCguOTQ5NzUgMCAwIC45NDk3NSAxNy4xMiAyNi40OTIpIj48cGF0aCBkPSJtMTY5LjExIDEwOC41NGMtOS45MDY2IDAuMDczNC0xOS4wMTQgNi41NzI0LTIyLjAxNCAxNi40NjlsLTY5Ljk5MyAyMzEuMDhjLTMuNjkwNCAxMi4xODEgMy4yODkyIDI1LjIyIDE1LjQ2OSAyOC45MSAyLjIyNTkgMC42NzQ4MSA0LjQ5NjkgMSA2LjcyODUgMSA5Ljk3MjEgMCAxOS4xNjUtNi41MTUzIDIyLjE4Mi0xNi40NjdhNi41MjI0IDYuNTIyNCAwIDAgMCAwLjAwMiAtMC4wMDJsNjkuOTktMjMxLjA3YTYuNTIyNCA2LjUyMjQgMCAwIDAgMCAtMC4wMDJjMy42ODU1LTEyLjE4MS0zLjI4Ny0yNS4yMjUtMTUuNDcxLTI4LjkxMi0yLjI4MjUtMC42OTE0NS00LjYxMTYtMS4wMTY5LTYuODk4NC0xem04NC45ODggMGMtOS45MDQ4IDAuMDczNC0xOS4wMTggNi41Njc1LTIyLjAxOCAxNi40NjlsLTY5Ljk4NiAyMzEuMDhjLTMuNjg5OCAxMi4xNzkgMy4yODUzIDI1LjIxNyAxNS40NjUgMjguOTA4IDIuMjI5NyAwLjY3NjQ3IDQuNTAwOCAxLjAwMiA2LjczMjQgMS4wMDIgOS45NzIxIDAgMTkuMTY1LTYuNTE1MyAyMi4xODItMTYuNDY3YTYuNTIyNCA2LjUyMjQgMCAwIDAgMC4wMDIgLTAuMDAybDY5Ljk4OC0yMzEuMDdjMy42OTA4LTEyLjE4MS0zLjI4NTItMjUuMjIzLTE1LjQ2Ny0yOC45MTItMi4yODE0LTAuNjkyMzEtNC42MTA4LTEuMDE4OS02Ljg5ODQtMS4wMDJ6bS0yMTcuMjkgNDIuMjNjLTEyLjcyOS0wLjAwMDg3LTIzLjE4OCAxMC40NTYtMjMuMTg4IDIzLjE4NiAwLjAwMSAxMi43MjggMTAuNDU5IDIzLjE4NiAyMy4xODggMjMuMTg2IDEyLjcyNy0wLjAwMSAyMy4xODMtMTAuNDU5IDIzLjE4NC0yMy4xODYgMC4wMDA4NzYtMTIuNzI4LTEwLjQ1Ni0yMy4xODUtMjMuMTg0LTIzLjE4NnptMCAxNDYuNjRjLTEyLjcyNy0wLjAwMDg3LTIzLjE4NiAxMC40NTUtMjMuMTg4IDIzLjE4NC0wLjAwMDg3MyAxMi43MjkgMTAuNDU4IDIzLjE4OCAyMy4xODggMjMuMTg4IDEyLjcyOC0wLjAwMSAyMy4xODQtMTAuNDYgMjMuMTg0LTIzLjE4OC0wLjAwMS0xMi43MjYtMTAuNDU3LTIzLjE4My0yMy4xODQtMjMuMTg0em0yNzAuNzkgNDIuMjExYy0xMi43MjcgMC0yMy4xODQgMTAuNDU3LTIzLjE4NCAyMy4xODRzMTAuNDU1IDIzLjE4OCAyMy4xODQgMjMuMTg4aDE1NC45OGMxMi43MjkgMCAyMy4xODYtMTAuNDYgMjMuMTg2LTIzLjE4OCAwLjAwMS0xMi43MjgtMTAuNDU4LTIzLjE4NC0yMy4xODYtMjMuMTg0eiIgdHJhbnNmb3JtPSJtYXRyaXgoMS4wMzc2IDAgMCAxLjAzNzYgLTcuNTY3NiAtMTQuOTI1KSIgc3Ryb2tlLXdpZHRoPSIxLjI2OTMiLz48L2c+PC9zdmc+","docUrl":""}}', 'rest api call', 'TENANT', 'rest api call', 'EXTERNAL');
INSERT INTO "public"."component_descriptor" VALUES ('ef5c7e90-d68a-11ec-aefb-d132b4563e73', 1652865275129, NULL, 'org.thingsboard.rule.engine.filter.TbOriginatorTypeFilterNode', '{"nodeDefinition":{"details":"If Originator Type of incoming message is expected - send Message via <b>True</b> chain, otherwise <b>False</b> chain is used.","description":"Filter incoming messages by message Originator Type","inEnabled":true,"outEnabled":true,"relationTypes":["True","False","Failure"],"customRelations":false,"ruleChainNode":false,"defaultConfiguration":{"originatorTypes":["DEVICE"]},"uiResources":["static/rulenode/rulenode-core-config.js"],"configDirective":"tbFilterNodeOriginatorTypeConfig","icon":"","iconUrl":"","docUrl":""}}', 'originator type', 'TENANT', 'originator type', 'FILTER');
INSERT INTO "public"."component_descriptor" VALUES ('ef611270-d68a-11ec-aefb-d132b4563e73', 1652865275159, NULL, 'org.thingsboard.rule.engine.action.TbSaveToCustomCassandraTableNode', '{"nodeDefinition":{"details":"Administrator should set the custom table name without prefix: <b>cs_tb_</b>. <br>Administrator can configure the mapping between the Message field names and Table columns name.<br><b>Note:</b>If the mapping key is <b>$entity_id</b>, that is identified by the Message Originator, then to the appropriate column name(mapping value) will be write the message originator id.<br><br>If specified message field does not exist or is not a JSON Primitive, the outbound message will be routed via <b>failure</b> chain, otherwise, the message will be routed via <b>success</b> chain.","description":"Node stores data from incoming Message payload to the Cassandra database into the predefined custom table that should have <b>cs_tb_</b> prefix, to avoid the data insertion to the common TB tables.<br><b>Note:</b> rule node can be used only for Cassandra DB.","inEnabled":true,"outEnabled":true,"relationTypes":["Success","Failure"],"customRelations":false,"ruleChainNode":false,"defaultConfiguration":{"tableName":"","fieldsMapping":{"":""}},"uiResources":["static/rulenode/rulenode-core-config.js"],"configDirective":"tbActionNodeCustomTableConfig","icon":"file_upload","iconUrl":"","docUrl":""}}', 'save to custom table', 'TENANT', 'save to custom table', 'ACTION');
INSERT INTO "public"."component_descriptor" VALUES ('ef63f8a0-d68a-11ec-aefb-d132b4563e73', 1652865275178, NULL, 'org.thingsboard.rule.engine.metadata.TbGetRelatedAttributeNode', '{"nodeDefinition":{"details":"Related Entity found using configured relation direction and Relation Type. If multiple Related Entities are found, only first Entity is used for attributes enrichment, other entities are discarded. If Attributes enrichment configured, server scope attributes are added into Message metadata. If Latest Telemetry enrichment configured, latest telemetry added into metadata. To access those attributes in other nodes this template can be used <code>metadata.temperature</code>.","description":"Add Originators Related Entity Attributes or Latest Telemetry into Message Metadata","inEnabled":true,"outEnabled":true,"relationTypes":["Success","Failure"],"customRelations":false,"ruleChainNode":false,"defaultConfiguration":{"attrMapping":{"temperature":"tempo"},"relationsQuery":{"direction":"FROM","maxLevel":1,"filters":[{"relationType":"Contains","entityTypes":[]}],"fetchLastLevelOnly":false},"telemetry":false},"uiResources":["static/rulenode/rulenode-core-config.js"],"configDirective":"tbEnrichmentNodeRelatedAttributesConfig","icon":"","iconUrl":"","docUrl":""}}', 'related attributes', 'TENANT', 'related attributes', 'ENRICHMENT');
INSERT INTO "public"."component_descriptor" VALUES ('ef6705e0-d68a-11ec-aefb-d132b4563e73', 1652865275198, NULL, 'org.thingsboard.rule.engine.filter.TbMsgTypeSwitchNode', '{"nodeDefinition":{"details":"Sends messages with message types <b>\"Post attributes\", \"Post telemetry\", \"RPC Request\"</b> etc. via corresponding chain, otherwise <b>Other</b> chain is used.","description":"Route incoming messages by Message Type","inEnabled":true,"outEnabled":true,"relationTypes":["Post attributes","Post telemetry","RPC Request from Device","RPC Request to Device","RPC Queued","RPC Sent","RPC Delivered","RPC Successful","RPC Timeout","RPC Expired","RPC Failed","RPC Deleted","Activity Event","Inactivity Event","Connect Event","Disconnect Event","Entity Created","Entity Updated","Entity Deleted","Entity Assigned","Entity Unassigned","Attributes Updated","Attributes Deleted","Alarm Acknowledged","Alarm Cleared","Other","Entity Assigned From Tenant","Entity Assigned To Tenant","Timeseries Updated","Timeseries Deleted","Failure"],"customRelations":false,"ruleChainNode":false,"defaultConfiguration":{"version":0},"uiResources":["static/rulenode/rulenode-core-config.js"],"configDirective":"tbNodeEmptyConfig","icon":"","iconUrl":"","docUrl":""}}', 'message type switch', 'TENANT', 'message type switch', 'FILTER');
INSERT INTO "public"."component_descriptor" VALUES ('ef6aaf60-d68a-11ec-aefb-d132b4563e73', 1652865275222, NULL, 'org.thingsboard.rule.engine.action.TbClearAlarmNode', '{"nodeDefinition":{"details":"Details - JS function that creates JSON object based on incoming message. This object will be added into Alarm.details field.\nNode output:\nIf alarm was not cleared, original message is returned. Otherwise new Message returned with type ''ALARM'', Alarm object in ''msg'' property and ''metadata'' will contains ''isClearedAlarm'' property. Message payload can be accessed via <code>msg</code> property. For example <code>''temperature = '' + msg.temperature ;</code>. Message metadata can be accessed via <code>metadata</code> property. For example <code>''name = '' + metadata.customerName;</code>.","description":"Clear Alarm","inEnabled":true,"outEnabled":true,"relationTypes":["Cleared","False","Failure"],"customRelations":false,"ruleChainNode":false,"defaultConfiguration":{"alarmType":"General Alarm","alarmDetailsBuildJs":"var details = {};\nif (metadata.prevAlarmDetails) {\n    details = JSON.parse(metadata.prevAlarmDetails);\n    //remove prevAlarmDetails from metadata\n    delete metadata.prevAlarmDetails;\n    //now metadata is the same as it comes IN this rule node\n}\n\n\nreturn details;"},"uiResources":["static/rulenode/rulenode-core-config.js"],"configDirective":"tbActionNodeClearAlarmConfig","icon":"notifications_off","iconUrl":"","docUrl":""}}', 'clear alarm', 'TENANT', 'clear alarm', 'ACTION');
INSERT INTO "public"."component_descriptor" VALUES ('ef75abe0-d68a-11ec-aefb-d132b4563e73', 1652865275294, NULL, 'org.thingsboard.rule.engine.kafka.TbKafkaNode', '{"nodeDefinition":{"details":"Will send record via Kafka producer to Kafka server. Outbound message will contain response fields (<code>offset</code>, <code>partition</code>, <code>topic</code>) from the Kafka in the Message Metadata. For example <b>partition</b> field can be accessed with <code>metadata.partition</code>.","description":"Publish messages to Kafka server","inEnabled":true,"outEnabled":true,"relationTypes":["Success","Failure"],"customRelations":false,"ruleChainNode":false,"defaultConfiguration":{"topicPattern":"my-topic","bootstrapServers":"localhost:9092","retries":0,"batchSize":16384,"linger":0,"bufferMemory":33554432,"acks":"-1","keySerializer":"org.apache.kafka.common.serialization.StringSerializer","valueSerializer":"org.apache.kafka.common.serialization.StringSerializer","otherProperties":{},"addMetadataKeyValuesAsKafkaHeaders":false,"kafkaHeadersCharset":"UTF-8"},"uiResources":["static/rulenode/rulenode-core-config.js"],"configDirective":"tbActionNodeKafkaConfig","icon":"","iconUrl":"data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTUzOCIgaGVpZ2h0PSIyNTAwIiB2aWV3Qm94PSIwIDAgMjU2IDQxNiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiBwcmVzZXJ2ZUFzcGVjdFJhdGlvPSJ4TWlkWU1pZCI+PHBhdGggZD0iTTIwMS44MTYgMjMwLjIxNmMtMTYuMTg2IDAtMzAuNjk3IDcuMTcxLTQwLjYzNCAxOC40NjFsLTI1LjQ2My0xOC4wMjZjMi43MDMtNy40NDIgNC4yNTUtMTUuNDMzIDQuMjU1LTIzLjc5NyAwLTguMjE5LTEuNDk4LTE2LjA3Ni00LjExMi0yMy40MDhsMjUuNDA2LTE3LjgzNWM5LjkzNiAxMS4yMzMgMjQuNDA5IDE4LjM2NSA0MC41NDggMTguMzY1IDI5Ljg3NSAwIDU0LjE4NC0yNC4zMDUgNTQuMTg0LTU0LjE4NCAwLTI5Ljg3OS0yNC4zMDktNTQuMTg0LTU0LjE4NC01NC4xODQtMjkuODc1IDAtNTQuMTg0IDI0LjMwNS01NC4xODQgNTQuMTg0IDAgNS4zNDguODA4IDEwLjUwNSAyLjI1OCAxNS4zODlsLTI1LjQyMyAxNy44NDRjLTEwLjYyLTEzLjE3NS0yNS45MTEtMjIuMzc0LTQzLjMzMy0yNS4xODJ2LTMwLjY0YzI0LjU0NC01LjE1NSA0My4wMzctMjYuOTYyIDQzLjAzNy01My4wMTlDMTI0LjE3MSAyNC4zMDUgOTkuODYyIDAgNjkuOTg3IDAgNDAuMTEyIDAgMTUuODAzIDI0LjMwNSAxNS44MDMgNTQuMTg0YzAgMjUuNzA4IDE4LjAxNCA0Ny4yNDYgNDIuMDY3IDUyLjc2OXYzMS4wMzhDMjUuMDQ0IDE0My43NTMgMCAxNzIuNDAxIDAgMjA2Ljg1NGMwIDM0LjYyMSAyNS4yOTIgNjMuMzc0IDU4LjM1NSA2OC45NHYzMi43NzRjLTI0LjI5OSA1LjM0MS00Mi41NTIgMjcuMDExLTQyLjU1MiA1Mi44OTQgMCAyOS44NzkgMjQuMzA5IDU0LjE4NCA1NC4xODQgNTQuMTg0IDI5Ljg3NSAwIDU0LjE4NC0yNC4zMDUgNTQuMTg0LTU0LjE4NCAwLTI1Ljg4My0xOC4yNTMtNDcuNTUzLTQyLjU1Mi01Mi44OTR2LTMyLjc3NWE2OS45NjUgNjkuOTY1IDAgMCAwIDQyLjYtMjQuNzc2bDI1LjYzMyAxOC4xNDNjLTEuNDIzIDQuODQtMi4yMiA5Ljk0Ni0yLjIyIDE1LjI0IDAgMjkuODc5IDI0LjMwOSA1NC4xODQgNTQuMTg0IDU0LjE4NCAyOS44NzUgMCA1NC4xODQtMjQuMzA1IDU0LjE4NC01NC4xODQgMC0yOS44NzktMjQuMzA5LTU0LjE4NC01NC4xODQtNTQuMTg0em0wLTEyNi42OTVjMTQuNDg3IDAgMjYuMjcgMTEuNzg4IDI2LjI3IDI2LjI3MXMtMTEuNzgzIDI2LjI3LTI2LjI3IDI2LjI3LTI2LjI3LTExLjc4Ny0yNi4yNy0yNi4yN2MwLTE0LjQ4MyAxMS43ODMtMjYuMjcxIDI2LjI3LTI2LjI3MXptLTE1OC4xLTQ5LjMzN2MwLTE0LjQ4MyAxMS43ODQtMjYuMjcgMjYuMjcxLTI2LjI3czI2LjI3IDExLjc4NyAyNi4yNyAyNi4yN2MwIDE0LjQ4My0xMS43ODMgMjYuMjctMjYuMjcgMjYuMjdzLTI2LjI3MS0xMS43ODctMjYuMjcxLTI2LjI3em01Mi41NDEgMzA3LjI3OGMwIDE0LjQ4My0xMS43ODMgMjYuMjctMjYuMjcgMjYuMjdzLTI2LjI3MS0xMS43ODctMjYuMjcxLTI2LjI3YzAtMTQuNDgzIDExLjc4NC0yNi4yNyAyNi4yNzEtMjYuMjdzMjYuMjcgMTEuNzg3IDI2LjI3IDI2LjI3em0tMjYuMjcyLTExNy45N2MtMjAuMjA1IDAtMzYuNjQyLTE2LjQzNC0zNi42NDItMzYuNjM4IDAtMjAuMjA1IDE2LjQzNy0zNi42NDIgMzYuNjQyLTM2LjY0MiAyMC4yMDQgMCAzNi42NDEgMTYuNDM3IDM2LjY0MSAzNi42NDIgMCAyMC4yMDQtMTYuNDM3IDM2LjYzOC0zNi42NDEgMzYuNjM4em0xMzEuODMxIDY3LjE3OWMtMTQuNDg3IDAtMjYuMjctMTEuNzg4LTI2LjI3LTI2LjI3MXMxMS43ODMtMjYuMjcgMjYuMjctMjYuMjcgMjYuMjcgMTEuNzg3IDI2LjI3IDI2LjI3YzAgMTQuNDgzLTExLjc4MyAyNi4yNzEtMjYuMjcgMjYuMjcxeiIvPjwvc3ZnPg==","docUrl":""}}', 'kafka', 'TENANT', 'kafka', 'EXTERNAL');
INSERT INTO "public"."component_descriptor" VALUES ('ef7a8de0-d68a-11ec-aefb-d132b4563e73', 1652865275326, NULL, 'org.thingsboard.rule.engine.aws.sns.TbSnsNode', '{"nodeDefinition":{"details":"Will publish message payload to the AWS SNS topic. Outbound message will contain response fields (<code>messageId</code>, <code>requestId</code>) in the Message Metadata from the AWS SNS. For example <b>requestId</b> field can be accessed with <code>metadata.requestId</code>.","description":"Publish message to the AWS SNS","inEnabled":true,"outEnabled":true,"relationTypes":["Success","Failure"],"customRelations":false,"ruleChainNode":false,"defaultConfiguration":{"topicArnPattern":"arn:aws:sns:us-east-1:123456789012:MyNewTopic","accessKeyId":null,"secretAccessKey":null,"region":"us-east-1"},"uiResources":["static/rulenode/rulenode-core-config.js"],"configDirective":"tbActionNodeSnsConfig","icon":"","iconUrl":"data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAyNCAyNCIgd2lkdGg9IjQ4IiBoZWlnaHQ9IjQ4Ij48cGF0aCBkPSJNMTMuMjMgMTAuNTZWMTBjLTEuOTQgMC0zLjk5LjM5LTMuOTkgMi42NyAwIDEuMTYuNjEgMS45NSAxLjYzIDEuOTUuNzYgMCAxLjQzLS40NyAxLjg2LTEuMjIuNTItLjkzLjUtMS44LjUtMi44NG0yLjcgNi41M2MtLjE4LjE2LS40My4xNy0uNjMuMDYtLjg5LS43NC0xLjA1LTEuMDgtMS41NC0xLjc5LTEuNDcgMS41LTIuNTEgMS45NS00LjQyIDEuOTUtMi4yNSAwLTQuMDEtMS4zOS00LjAxLTQuMTcgMC0yLjE4IDEuMTctMy42NCAyLjg2LTQuMzggMS40Ni0uNjQgMy40OS0uNzYgNS4wNC0uOTNWNy41YzAtLjY2LjA1LTEuNDEtLjMzLTEuOTYtLjMyLS40OS0uOTUtLjctMS41LS43LTEuMDIgMC0xLjkzLjUzLTIuMTUgMS42MS0uMDUuMjQtLjI1LjQ4LS40Ny40OWwtMi42LS4yOGMtLjIyLS4wNS0uNDYtLjIyLS40LS41Ni42LTMuMTUgMy40NS00LjEgNi00LjEgMS4zIDAgMyAuMzUgNC4wMyAxLjMzQzE3LjExIDQuNTUgMTcgNi4xOCAxNyA3Ljk1djQuMTdjMCAxLjI1LjUgMS44MSAxIDIuNDguMTcuMjUuMjEuNTQgMCAuNzFsLTIuMDYgMS43OGgtLjAxIj48L3BhdGg+PHBhdGggZD0iTTIwLjE2IDE5LjU0QzE4IDIxLjE0IDE0LjgyIDIyIDEyLjEgMjJjLTMuODEgMC03LjI1LTEuNDEtOS44NS0zLjc2LS4yLS4xOC0uMDItLjQzLjI1LS4yOSAyLjc4IDEuNjMgNi4yNSAyLjYxIDkuODMgMi42MSAyLjQxIDAgNS4wNy0uNSA3LjUxLTEuNTMuMzctLjE2LjY2LjI0LjMyLjUxIj48L3BhdGg+PHBhdGggZD0iTTIxLjA3IDE4LjVjLS4yOC0uMzYtMS44NS0uMTctMi41Ny0uMDgtLjE5LjAyLS4yMi0uMTYtLjAzLS4zIDEuMjQtLjg4IDMuMjktLjYyIDMuNTMtLjMzLjI0LjMtLjA3IDIuMzUtMS4yNCAzLjMyLS4xOC4xNi0uMzUuMDctLjI2LS4xMS4yNi0uNjcuODUtMi4xNC41Ny0yLjV6Ij48L3BhdGg+PC9zdmc+","docUrl":""}}', 'aws sns', 'TENANT', 'aws sns', 'EXTERNAL');
INSERT INTO "public"."component_descriptor" VALUES ('ef7d9b20-d68a-11ec-aefb-d132b4563e73', 1652865275346, NULL, 'org.thingsboard.rule.engine.mail.TbSendEmailNode', '{"nodeDefinition":{"details":"Expects messages with <b>SEND_EMAIL</b> type. Node works only with messages that  where created using <code>to Email</code> transformation Node, please connect this Node with <code>to Email</code> Node using <code>Successful</code> chain.","description":"Sends email message via SMTP server.","inEnabled":true,"outEnabled":true,"relationTypes":["Success","Failure"],"customRelations":false,"ruleChainNode":false,"defaultConfiguration":{"useSystemSmtpSettings":true,"smtpHost":"localhost","smtpPort":25,"username":null,"password":null,"smtpProtocol":"smtp","timeout":10000,"enableTls":false,"tlsVersion":"TLSv1.2","enableProxy":false,"proxyHost":null,"proxyPort":null,"proxyUser":null,"proxyPassword":null},"uiResources":["static/rulenode/rulenode-core-config.js"],"configDirective":"tbActionNodeSendEmailConfig","icon":"send","iconUrl":"","docUrl":""}}', 'send email', 'TENANT', 'send email', 'EXTERNAL');
INSERT INTO "public"."component_descriptor" VALUES ('ef80a860-d68a-11ec-aefb-d132b4563e73', 1652865275366, NULL, 'org.thingsboard.rule.engine.mail.TbMsgToEmailNode', '{"nodeDefinition":{"details":"Transforms message to email message by populating email fields using values derived from message metadata. Set ''SEND_EMAIL'' output message type.","description":"Transforms message to email message","inEnabled":true,"outEnabled":true,"relationTypes":["Success","Failure"],"customRelations":false,"ruleChainNode":false,"defaultConfiguration":{"fromTemplate":"info@testmail.org","toTemplate":"${userEmail}","ccTemplate":null,"bccTemplate":null,"subjectTemplate":"Device ${deviceType} temperature high","bodyTemplate":"Device ${deviceName} has high temperature ${temp}","isHtmlTemplate":null,"mailBodyType":"false"},"uiResources":["static/rulenode/rulenode-core-config.js"],"configDirective":"tbTransformationNodeToEmailConfig","icon":"email","iconUrl":"","docUrl":""}}', 'to email', 'TENANT', 'to email', 'TRANSFORMATION');
INSERT INTO "public"."component_descriptor" VALUES ('ef831960-d68a-11ec-aefb-d132b4563e73', 1652865275382, NULL, 'org.thingsboard.rule.engine.flow.TbAckNode', '{"nodeDefinition":{"details":"After acknowledgement, the message is pushed to related rule nodes. Useful if you don''t care what happens to this message next.","description":"Acknowledges the incoming message","inEnabled":true,"outEnabled":true,"relationTypes":["Success","Failure"],"customRelations":false,"ruleChainNode":false,"defaultConfiguration":{"version":0},"uiResources":["static/rulenode/rulenode-core-config.js"],"configDirective":"tbNodeEmptyConfig","icon":"","iconUrl":"","docUrl":""}}', 'acknowledge', 'TENANT', 'acknowledge', 'FLOW');
INSERT INTO "public"."component_descriptor" VALUES ('ef8626a0-d68a-11ec-aefb-d132b4563e73', 1652865275402, NULL, 'org.thingsboard.rule.engine.flow.TbCheckpointNode', '{"nodeDefinition":{"details":"After successful transfer incoming message is automatically acknowledged. Queue name is configurable.","description":"transfers the message to another queue","inEnabled":true,"outEnabled":true,"relationTypes":["Success","Failure"],"customRelations":false,"ruleChainNode":false,"defaultConfiguration":{"queueName":"HighPriority"},"uiResources":["static/rulenode/rulenode-core-config.js"],"configDirective":"tbActionNodeCheckPointConfig","icon":"","iconUrl":"","docUrl":""}}', 'checkpoint', 'TENANT', 'checkpoint', 'FLOW');
INSERT INTO "public"."component_descriptor" VALUES ('ef8a1e40-d68a-11ec-aefb-d132b4563e73', 1652865275428, NULL, 'org.thingsboard.rule.engine.rabbitmq.TbRabbitMqNode', '{"nodeDefinition":{"details":"Will publish message payload to RabbitMQ queue.","description":"Publish messages to the RabbitMQ","inEnabled":true,"outEnabled":true,"relationTypes":["Success","Failure"],"customRelations":false,"ruleChainNode":false,"defaultConfiguration":{"exchangeNamePattern":"","routingKeyPattern":"","messageProperties":null,"host":"localhost","port":5672,"virtualHost":"/","username":"guest","password":"guest","automaticRecoveryEnabled":false,"connectionTimeout":60000,"handshakeTimeout":10000,"clientProperties":{}},"uiResources":["static/rulenode/rulenode-core-config.js"],"configDirective":"tbActionNodeRabbitMqConfig","icon":"","iconUrl":"data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbDpzcGFjZT0icHJlc2VydmUiIHZlcnNpb249IjEuMSIgeT0iMHB4IiB4PSIwcHgiIHZpZXdCb3g9IjAgMCAxMDAwIDEwMDAiPjxwYXRoIHN0cm9rZS13aWR0aD0iLjg0OTU2IiBkPSJtODYwLjQ3IDQxNi4zMmgtMjYyLjAxYy0xMi45MTMgMC0yMy42MTgtMTAuNzA0LTIzLjYxOC0yMy42MTh2LTI3Mi43MWMwLTIwLjMwNS0xNi4yMjctMzYuMjc2LTM2LjI3Ni0zNi4yNzZoLTkzLjc5MmMtMjAuMzA1IDAtMzYuMjc2IDE2LjIyNy0zNi4yNzYgMzYuMjc2djI3MC44NGMtMC4yNTQ4NyAxNC4xMDMtMTEuNDY5IDI1LjU3Mi0yNS43NDIgMjUuNTcybC04NS42MzYgMC42Nzk2NWMtMTQuMTAzIDAtMjUuNTcyLTExLjQ2OS0yNS41NzItMjUuNTcybDAuNjc5NjUtMjcxLjUyYzAtMjAuMzA1LTE2LjIyNy0zNi4yNzYtMzYuMjc2LTM2LjI3NmgtOTMuNTM3Yy0yMC4zMDUgMC0zNi4yNzYgMTYuMjI3LTM2LjI3NiAzNi4yNzZ2NzYzLjg0YzAgMTguMDk2IDE0Ljc4MiAzMi40NTMgMzIuNDUzIDMyLjQ1M2g3MjIuODFjMTguMDk2IDAgMzIuNDUzLTE0Ljc4MiAzMi40NTMtMzIuNDUzdi00MzUuMzFjLTEuMTg5NC0xOC4xODEtMTUuMjkyLTMyLjE5OC0zMy4zODgtMzIuMTk4em0tMTIyLjY4IDI4Ny4wN2MwIDIzLjYxOC0xOC44NiA0Mi40NzgtNDIuNDc4IDQyLjQ3OGgtNzMuOTk3Yy0yMy42MTggMC00Mi40NzgtMTguODYtNDIuNDc4LTQyLjQ3OHYtNzQuMjUyYzAtMjMuNjE4IDE4Ljg2LTQyLjQ3OCA0Mi40NzgtNDIuNDc4aDczLjk5N2MyMy42MTggMCA0Mi40NzggMTguODYgNDIuNDc4IDQyLjQ3OHoiLz48L3N2Zz4=","docUrl":""}}', 'rabbitmq', 'TENANT', 'rabbitmq', 'EXTERNAL');
INSERT INTO "public"."component_descriptor" VALUES ('ef91bf60-d68a-11ec-aefb-d132b4563e73', 1652865275478, NULL, 'org.thingsboard.rule.engine.filter.TbJsSwitchNode', '{"nodeDefinition":{"details":"Node executes configured JS script. Script should return array of next Chain names where Message should be routed. If Array is empty - message not routed to next Node. Message payload can be accessed via <code>msg</code> property. For example <code>msg.temperature < 10;</code><br/>Message metadata can be accessed via <code>metadata</code> property. For example <code>metadata.customerName === ''John'';</code><br/>Message type can be accessed via <code>msgType</code> property.","description":"Route incoming Message to one or multiple output chains","inEnabled":true,"outEnabled":true,"relationTypes":["Failure"],"customRelations":true,"ruleChainNode":false,"defaultConfiguration":{"jsScript":"function nextRelation(metadata, msg) {\n    return [''one'',''nine''];\n}\nif(msgType === ''POST_TELEMETRY_REQUEST'') {\n    return [''two''];\n}\nreturn nextRelation(metadata, msg);"},"uiResources":["static/rulenode/rulenode-core-config.js"],"configDirective":"tbFilterNodeSwitchConfig","icon":"","iconUrl":"","docUrl":""}}', 'switch', 'TENANT', 'switch', 'FILTER');
INSERT INTO "public"."component_descriptor" VALUES ('ef94cca0-d68a-11ec-aefb-d132b4563e73', 1652865275498, NULL, 'org.thingsboard.rule.engine.delay.TbMsgDelayNode', '{"nodeDefinition":{"details":"Delays messages for a configurable period. Please note, this node acknowledges the message from the current queue (message will be removed from queue). Deprecated because the acknowledged message still stays in memory (to be delayed) and this does not guarantee that message will be processed even if the \"retry failures and timeouts\" processing strategy will be chosen.","description":"Delays incoming message (deprecated)","inEnabled":true,"outEnabled":true,"relationTypes":["Success","Failure"],"customRelations":false,"ruleChainNode":false,"defaultConfiguration":{"periodInSeconds":60,"maxPendingMsgs":1000,"periodInSecondsPattern":null,"useMetadataPeriodInSecondsPatterns":false},"uiResources":["static/rulenode/rulenode-core-config.js"],"configDirective":"tbActionNodeMsgDelayConfig","icon":"pause","iconUrl":"","docUrl":""}}', 'delay (deprecated)', 'TENANT', 'delay (deprecated)', 'ACTION');
INSERT INTO "public"."component_descriptor" VALUES ('ef9800f0-d68a-11ec-aefb-d132b4563e73', 1652865275519, NULL, 'org.thingsboard.rule.engine.action.TbMsgCountNode', '{"nodeDefinition":{"details":"Count incoming messages for specified interval and produces POST_TELEMETRY_REQUEST msg with messages count","description":"Count incoming messages","inEnabled":true,"outEnabled":true,"relationTypes":["Success","Failure"],"customRelations":false,"ruleChainNode":false,"defaultConfiguration":{"telemetryPrefix":"messageCount","interval":1},"uiResources":["static/rulenode/rulenode-core-config.js"],"configDirective":"tbActionNodeMsgCountConfig","icon":"functions","iconUrl":"","docUrl":""}}', 'message count', 'TENANT', 'message count', 'ACTION');
INSERT INTO "public"."component_descriptor" VALUES ('ef9b5c50-d68a-11ec-aefb-d132b4563e73', 1652865275541, NULL, 'org.thingsboard.rule.engine.flow.TbRuleChainInputNode', '{"nodeDefinition":{"details":"Allows to nest the rule chain similar to single rule node. The incoming message is forwarded to the input node of the specified target rule chain. The target rule chain may produce multiple labeled outputs. You may use the outputs to forward the results of processing to other rule nodes.","description":"transfers the message to another rule chain","inEnabled":true,"outEnabled":true,"relationTypes":["Failure"],"customRelations":true,"ruleChainNode":true,"defaultConfiguration":{"ruleChainId":null},"uiResources":["static/rulenode/rulenode-core-config.js"],"configDirective":"tbFlowNodeRuleChainInputConfig","icon":"","iconUrl":"","docUrl":""}}', 'rule chain', 'TENANT', 'rule chain', 'FLOW');
INSERT INTO "public"."component_descriptor" VALUES ('efa176d0-d68a-11ec-aefb-d132b4563e73', 1652865275581, NULL, 'org.thingsboard.rule.engine.geo.TbGpsGeofencingFilterNode', '{"nodeDefinition":{"details":"Extracts latitude and longitude parameters from incoming message and returns ''True'' if they are inside configured perimeters, ''False'' otherwise.","description":"Filter incoming messages by GPS based geofencing","inEnabled":true,"outEnabled":true,"relationTypes":["True","False","Failure"],"customRelations":false,"ruleChainNode":false,"defaultConfiguration":{"latitudeKeyName":"latitude","longitudeKeyName":"longitude","perimeterType":"POLYGON","fetchPerimeterInfoFromMessageMetadata":true,"perimeterKeyName":"ss_perimeter","polygonsDefinition":null,"centerLatitude":null,"centerLongitude":null,"range":null,"rangeUnit":null},"uiResources":["static/rulenode/rulenode-core-config.js"],"configDirective":"tbFilterNodeGpsGeofencingConfig","icon":"","iconUrl":"","docUrl":""}}', 'gps geofencing filter', 'TENANT', 'gps geofencing filter', 'FILTER');
INSERT INTO "public"."component_descriptor" VALUES ('efa658d0-d68a-11ec-aefb-d132b4563e73', 1652865275613, NULL, 'org.thingsboard.rule.engine.metadata.TbGetTenantDetailsNode', '{"nodeDefinition":{"details":"If checkbox: <b>Add selected details to the message metadata</b> is selected, existing fields will be added to the message metadata instead of message data.<br><br><b>Note:</b> only Device, Asset, and Entity View type are allowed.<br><br>If the originator of the message is not assigned to Tenant, or originator type is not supported - Message will be forwarded to <b>Failure</b> chain, otherwise, <b>Success</b> chain will be used.","description":"Adds fields from Tenant details to the message body or metadata","inEnabled":true,"outEnabled":true,"relationTypes":["Success","Failure"],"customRelations":false,"ruleChainNode":false,"defaultConfiguration":{"detailsList":[],"addToMetadata":false},"uiResources":["static/rulenode/rulenode-core-config.js"],"configDirective":"tbEnrichmentNodeEntityDetailsConfig","icon":"","iconUrl":"","docUrl":""}}', 'tenant details', 'TENANT', 'tenant details', 'ENRICHMENT');
INSERT INTO "public"."component_descriptor" VALUES ('efa93f00-d68a-11ec-aefb-d132b4563e73', 1652865275632, NULL, 'org.thingsboard.rule.engine.flow.TbRuleChainOutputNode', '{"nodeDefinition":{"details":"Produces output of the rule chain processing. The output is forwarded to the caller rule chain, as an output of the corresponding \"input\" rule node. The output rule node name corresponds to the relation type of the output message, and it is used to forward messages to other rule nodes in the caller rule chain. ","description":"transfers the message to the caller rule chain","inEnabled":true,"outEnabled":false,"relationTypes":["Success","Failure"],"customRelations":false,"ruleChainNode":false,"defaultConfiguration":{"version":0},"uiResources":["static/rulenode/rulenode-core-config.js"],"configDirective":"tbFlowNodeRuleChainOutputConfig","icon":"","iconUrl":"","docUrl":""}}', 'output', 'TENANT', 'output', 'FLOW');
INSERT INTO "public"."component_descriptor" VALUES ('efac4c40-d68a-11ec-aefb-d132b4563e73', 1652865275652, NULL, 'org.thingsboard.rule.engine.rpc.TbSendRPCRequestNode', '{"nodeDefinition":{"details":"Expects messages with \"method\" and \"params\". Will forward response from device to next nodes.If the RPC call request is originated by REST API call from user, will forward the response to user immediately.","description":"Sends RPC call to device","inEnabled":true,"outEnabled":true,"relationTypes":["Success","Failure"],"customRelations":false,"ruleChainNode":false,"defaultConfiguration":{"timeoutInSeconds":60},"uiResources":["static/rulenode/rulenode-core-config.js"],"configDirective":"tbActionNodeRpcRequestConfig","icon":"call_made","iconUrl":"","docUrl":""}}', 'rpc call request', 'TENANT', 'rpc call request', 'ACTION');
INSERT INTO "public"."component_descriptor" VALUES ('efaf5980-d68a-11ec-aefb-d132b4563e73', 1652865275672, NULL, 'org.thingsboard.rule.engine.filter.TbCheckAlarmStatusNode', '{"nodeDefinition":{"details":"If the alarm status matches the specified one - msg is success if does not match - msg is failure.","description":"Checks alarm status.","inEnabled":true,"outEnabled":true,"relationTypes":["True","False","Failure"],"customRelations":false,"ruleChainNode":false,"defaultConfiguration":{"alarmStatusList":["ACTIVE_ACK","ACTIVE_UNACK"]},"uiResources":["static/rulenode/rulenode-core-config.js"],"configDirective":"tbFilterNodeCheckAlarmStatusConfig","icon":"","iconUrl":"","docUrl":""}}', 'check alarm status', 'TENANT', 'check alarm status', 'FILTER');
INSERT INTO "public"."component_descriptor" VALUES ('efb1ca80-d68a-11ec-aefb-d132b4563e73', 1652865275688, NULL, 'org.thingsboard.rule.engine.transaction.TbSynchronizationBeginNode', '{"nodeDefinition":{"details":"This node should be used together with \"synchronization end\" node. \n This node will put messages into queue based on message originator id. \nSubsequent messages will not be processed until the previous message processing is completed or timeout event occurs.\nSize of the queue per originator and timeout values are configurable on a system level","description":"This Node is now deprecated. Use \"Checkpoint\" instead.","inEnabled":true,"outEnabled":true,"relationTypes":["Success","Failure"],"customRelations":false,"ruleChainNode":false,"defaultConfiguration":{"version":0},"uiResources":["static/rulenode/rulenode-core-config.js"],"configDirective":"tbNodeEmptyConfig","icon":"","iconUrl":"","docUrl":""}}', 'synchronization start', 'TENANT', 'synchronization start', 'ACTION');
INSERT INTO "public"."component_descriptor" VALUES ('efb43b80-d68a-11ec-aefb-d132b4563e73', 1652865275704, NULL, 'org.thingsboard.rule.engine.transaction.TbSynchronizationEndNode', '{"nodeDefinition":{"details":"","description":"This Node is now deprecated. Use \"Checkpoint\" instead.","inEnabled":true,"outEnabled":true,"relationTypes":["Success","Failure"],"customRelations":false,"ruleChainNode":false,"defaultConfiguration":{"version":0},"uiResources":["static/rulenode/rulenode-core-config.js"],"configDirective":"tbNodeEmptyConfig","icon":"","iconUrl":"","docUrl":""}}', 'synchronization end', 'TENANT', 'synchronization end', 'ACTION');
INSERT INTO "public"."component_descriptor" VALUES ('efb6faa0-d68a-11ec-aefb-d132b4563e73', 1652865275722, NULL, 'org.thingsboard.rule.engine.telemetry.TbMsgAttributesNode', '{"nodeDefinition":{"details":"Saves entity attributes based on configurable scope parameter. Expects messages with ''POST_ATTRIBUTES_REQUEST'' message type","description":"Saves attributes data","inEnabled":true,"outEnabled":true,"relationTypes":["Success","Failure"],"customRelations":false,"ruleChainNode":false,"defaultConfiguration":{"scope":"SERVER_SCOPE","notifyDevice":false},"uiResources":["static/rulenode/rulenode-core-config.js"],"configDirective":"tbActionNodeAttributesConfig","icon":"file_upload","iconUrl":"","docUrl":""}}', 'save attributes', 'TENANT', 'save attributes', 'ACTION');
INSERT INTO "public"."component_descriptor" VALUES ('efbc9ff0-d68a-11ec-aefb-d132b4563e73', 1652865275759, NULL, 'org.thingsboard.rule.engine.metadata.TbGetAttributesNode', '{"nodeDefinition":{"details":"If Attributes enrichment configured, <b>CLIENT/SHARED/SERVER</b> attributes are added into Message metadata with specific prefix: <i>cs/shared/ss</i>. Latest telemetry value added into metadata without prefix. To access those attributes in other nodes this template can be used <code>metadata.cs_temperature</code> or <code>metadata.shared_limit</code> ","description":"Add Message Originator Attributes or Latest Telemetry into Message Metadata","inEnabled":true,"outEnabled":true,"relationTypes":["Success","Failure"],"customRelations":false,"ruleChainNode":false,"defaultConfiguration":{"clientAttributeNames":[],"sharedAttributeNames":[],"serverAttributeNames":[],"latestTsKeyNames":[],"tellFailureIfAbsent":true,"getLatestValueWithTs":false},"uiResources":["static/rulenode/rulenode-core-config.js"],"configDirective":"tbEnrichmentNodeOriginatorAttributesConfig","icon":"","iconUrl":"","docUrl":""}}', 'originator attributes', 'TENANT', 'originator attributes', 'ENRICHMENT');
INSERT INTO "public"."component_descriptor" VALUES ('efbf8620-d68a-11ec-aefb-d132b4563e73', 1652865275778, NULL, 'org.thingsboard.rule.engine.metadata.TbGetCustomerDetailsNode', '{"nodeDefinition":{"details":"If checkbox: <b>Add selected details to the message metadata</b> is selected, existing fields will be added to the message metadata instead of message data.<br><br><b>Note:</b> only Device, Asset, and Entity View type are allowed.<br><br>If the originator of the message is not assigned to Customer, or originator type is not supported - Message will be forwarded to <b>Failure</b> chain, otherwise, <b>Success</b> chain will be used.","description":"Adds fields from Customer details to the message body or metadata","inEnabled":true,"outEnabled":true,"relationTypes":["Success","Failure"],"customRelations":false,"ruleChainNode":false,"defaultConfiguration":{"detailsList":[],"addToMetadata":false},"uiResources":["static/rulenode/rulenode-core-config.js"],"configDirective":"tbEnrichmentNodeEntityDetailsConfig","icon":"","iconUrl":"","docUrl":""}}', 'customer details', 'TENANT', 'customer details', 'ENRICHMENT');
INSERT INTO "public"."component_descriptor" VALUES ('eef38390-d68a-11ec-aefb-d132b4563e73', 0, NULL, 'org.thingsboard.rule.engine.action.TbAssignToCustomerNode', '{"nodeDefinition":{"details":"Finds target Customer by customer name pattern and then assign Originator Entity to this customer. Will create new Customer if it doesn''t exists and ''Create new Customer if not exists'' is set to true.","description":"Assign Message Originator Entity to Customer","inEnabled":true,"outEnabled":true,"relationTypes":["Success","Failure"],"customRelations":false,"ruleChainNode":false,"defaultConfiguration":{"customerNamePattern":"","customerCacheExpiration":300,"createCustomerIfNotExists":false},"uiResources":["static/rulenode/rulenode-core-config.js"],"configDirective":"tbActionNodeAssignToCustomerConfig","icon":"add_circle","iconUrl":"","docUrl":""}}', 'assign to customer', 'TENANT', 'assign to customer', 'ACTION');
INSERT INTO "public"."component_descriptor" VALUES ('eef6b7e0-d68a-11ec-aefb-d132b4563e73', 0, NULL, 'org.thingsboard.rule.engine.action.TbUnassignFromCustomerNode', '{"nodeDefinition":{"details":"Finds target Entity Customer by Customer name pattern and then unassign Originator Entity from this customer.","description":"Unassign Message Originator Entity from Customer","inEnabled":true,"outEnabled":true,"relationTypes":["Success","Failure"],"customRelations":false,"ruleChainNode":false,"defaultConfiguration":{"customerNamePattern":"","customerCacheExpiration":300},"uiResources":["static/rulenode/rulenode-core-config.js"],"configDirective":"tbActionNodeUnAssignToCustomerConfig","icon":"remove_circle","iconUrl":"","docUrl":""}}', 'unassign from customer', 'TENANT', 'unassign from customer', 'ACTION');
INSERT INTO "public"."component_descriptor" VALUES ('eeff6a70-d68a-11ec-aefb-d132b4563e73', 0, NULL, 'org.thingsboard.rule.engine.telemetry.TbMsgTimeseriesNode', '{"nodeDefinition":{"details":"Saves timeseries telemetry data based on configurable TTL parameter. Expects messages with ''POST_TELEMETRY_REQUEST'' message type. Timestamp in milliseconds will be taken from metadata.ts, otherwise ''now'' message timestamp will be applied. Allows stopping updating values for incoming keys in the latest ts_kv table if ''skipLatestPersistence'' is set to true.\n <br/>Enable ''useServerTs'' param to use the timestamp of the message processing instead of the timestamp from the message. Useful for all sorts of sequential processing if you merge messages from multiple sources (devices, assets, etc).\n<br/>In the case of sequential processing, the platform guarantees that the messages are processed in the order of their submission to the queue. However, the timestamp of the messages originated by multiple devices/servers may be unsynchronized long before they are pushed to the queue. The DB layer has certain optimizations to ignore the updates of the \"attributes\" and \"latest values\" tables if the new record has a timestamp that is older than the previous record. So, to make sure that all the messages will be processed correctly, one should enable this parameter for sequential message processing scenarios.","description":"Saves timeseries data","inEnabled":true,"outEnabled":true,"relationTypes":["Success","Failure"],"customRelations":false,"ruleChainNode":false,"defaultConfiguration":{"defaultTTL":0,"skipLatestPersistence":false,"useServerTs":false},"uiResources":["static/rulenode/rulenode-core-config.js"],"configDirective":"tbActionNodeTimeseriesConfig","icon":"file_upload","iconUrl":"","docUrl":""}}', 'save timeseries', 'TENANT', 'save timeseries', 'ACTION');
INSERT INTO "public"."component_descriptor" VALUES ('ef8e6400-d68a-11ec-aefb-d132b4563e73', 0, NULL, 'org.thingsboard.rule.engine.action.TbDeleteRelationNode', '{"nodeDefinition":{"details":"If the relation(s) successfully deleted -  Message send via <b>Success</b> chain, otherwise <b>Failure</b> chain will be used.","description":"Finds target Entity by entity name pattern and then delete a relation to Originator Entity by type and direction if ''Delete single entity'' is set to true, otherwise rule node will delete all relations to the originator of the message by type and direction.","inEnabled":true,"outEnabled":true,"relationTypes":["Success","Failure"],"customRelations":false,"ruleChainNode":false,"defaultConfiguration":{"direction":"FROM","relationType":"Contains","entityType":null,"entityNamePattern":"","entityTypePattern":null,"entityCacheExpiration":300,"deleteForSingleEntity":true},"uiResources":["static/rulenode/rulenode-core-config.js"],"configDirective":"tbActionNodeDeleteRelationConfig","icon":"remove_circle","iconUrl":"","docUrl":""}}', 'delete relation', 'TENANT', 'delete relation', 'ACTION');
INSERT INTO "public"."component_descriptor" VALUES ('efb9e0d0-d68a-11ec-aefb-d132b4563e73', 0, NULL, 'org.thingsboard.rule.engine.action.TbCreateRelationNode', '{"nodeDefinition":{"details":"If the relation already exists or successfully created -  Message send via <b>Success</b> chain, otherwise <b>Failure</b> chain will be used.","description":"Finds target Entity by entity name pattern and (entity type pattern for Asset, Device) and then create a relation to Originator Entity by type and direction. If Selected entity type: Asset, Device or Customer will create new Entity if it doesn''t exist and selected checkbox ''Create new entity if not exists''.<br> In case that relation from the message originator to the selected entity not exist and  If selected checkbox ''Remove current relations'', before creating the new relation all existed relations to message originator by type and direction will be removed.<br> If relation from the message originator to the selected entity created and If selected checkbox ''Change originator to related entity'', outbound message will be processed as a message from this entity.","inEnabled":true,"outEnabled":true,"relationTypes":["Success","Failure"],"customRelations":false,"ruleChainNode":false,"defaultConfiguration":{"direction":"FROM","relationType":"Contains","entityType":null,"entityNamePattern":"","entityTypePattern":null,"entityCacheExpiration":300,"createEntityIfNotExists":false,"changeOriginatorToRelatedEntity":false,"removeCurrentRelations":false},"uiResources":["static/rulenode/rulenode-core-config.js"],"configDirective":"tbActionNodeCreateRelationConfig","icon":"add_circle","iconUrl":"","docUrl":""}}', 'create relation', 'TENANT', 'create relation', 'ACTION');

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS "public"."customer";
CREATE TABLE "public"."customer" (
  "id" uuid NOT NULL,
  "created_time" int8 NOT NULL,
  "additional_info" varchar COLLATE "pg_catalog"."default",
  "address" varchar COLLATE "pg_catalog"."default",
  "address2" varchar COLLATE "pg_catalog"."default",
  "city" varchar(255) COLLATE "pg_catalog"."default",
  "country" varchar(255) COLLATE "pg_catalog"."default",
  "email" varchar(255) COLLATE "pg_catalog"."default",
  "phone" varchar(255) COLLATE "pg_catalog"."default",
  "search_text" varchar(255) COLLATE "pg_catalog"."default",
  "state" varchar(255) COLLATE "pg_catalog"."default",
  "tenant_id" uuid,
  "title" varchar(255) COLLATE "pg_catalog"."default",
  "zip" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO "public"."customer" VALUES ('13126af0-d737-11ec-94a0-cd6fda244b19', 1652939208479, '{"description":"","homeDashboardId":null,"homeDashboardHideToolbar":true}', NULL, NULL, NULL, NULL, NULL, NULL, 'usera', NULL, '188f3780-d68b-11ec-aefb-d132b4563e73', 'usera', NULL);

-- ----------------------------
-- Table structure for dashboard
-- ----------------------------
DROP TABLE IF EXISTS "public"."dashboard";
CREATE TABLE "public"."dashboard" (
  "id" uuid NOT NULL,
  "created_time" int8 NOT NULL,
  "configuration" varchar COLLATE "pg_catalog"."default",
  "assigned_customers" varchar(1000000) COLLATE "pg_catalog"."default",
  "search_text" varchar(255) COLLATE "pg_catalog"."default",
  "tenant_id" uuid,
  "title" varchar(255) COLLATE "pg_catalog"."default",
  "mobile_hide" bool DEFAULT false,
  "mobile_order" int4,
  "image" varchar(1000000) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of dashboard
-- ----------------------------
INSERT INTO "public"."dashboard" VALUES ('67e27430-d737-11ec-94a0-cd6fda244b19', 1652939350771, '{"description":""}', '[{"customerId":{"entityType":"CUSTOMER","id":"13126af0-d737-11ec-94a0-cd6fda244b19"},"title":"usera","public":false}]', 'demo', '188f3780-d68b-11ec-aefb-d132b4563e73', 'demo', 'f', NULL, NULL);

-- ----------------------------
-- Table structure for device
-- ----------------------------
DROP TABLE IF EXISTS "public"."device";
CREATE TABLE "public"."device" (
  "id" uuid NOT NULL,
  "created_time" int8 NOT NULL,
  "additional_info" varchar COLLATE "pg_catalog"."default",
  "customer_id" uuid,
  "device_profile_id" uuid NOT NULL,
  "device_data" jsonb,
  "type" varchar(255) COLLATE "pg_catalog"."default",
  "name" varchar(255) COLLATE "pg_catalog"."default",
  "label" varchar(255) COLLATE "pg_catalog"."default",
  "search_text" varchar(255) COLLATE "pg_catalog"."default",
  "tenant_id" uuid,
  "firmware_id" uuid,
  "software_id" uuid
)
;

-- ----------------------------
-- Records of device
-- ----------------------------
INSERT INTO "public"."device" VALUES ('00e73d10-d68d-11ec-aefb-d132b4563e73', 1652866163553, '{"lastConnectedGateway":"559c7d40-d68b-11ec-aefb-d132b4563e73"}', '13814000-1dd2-11b2-8080-808080808080', '18a44620-d68b-11ec-aefb-d132b4563e73', '{"configuration": {"type": "DEFAULT"}, "transportConfiguration": {"type": "DEFAULT"}}', '传感器', 'deviceName', NULL, 'devicename', '188f3780-d68b-11ec-aefb-d132b4563e73', NULL, NULL);
INSERT INTO "public"."device" VALUES ('559c7d40-d68b-11ec-aefb-d132b4563e73', 1652865446676, '{"gateway":true,"overwriteActivityTime":false,"description":""}', '13126af0-d737-11ec-94a0-cd6fda244b19', '18a44620-d68b-11ec-aefb-d132b4563e73', '{"configuration": {"type": "DEFAULT"}, "transportConfiguration": {"type": "DEFAULT"}}', '传感器', 'gate', '', 'gate', '188f3780-d68b-11ec-aefb-d132b4563e73', NULL, NULL);
INSERT INTO "public"."device" VALUES ('dd095840-d68e-11ec-aefb-d132b4563e73', 1652866962372, '{"lastConnectedGateway":"559c7d40-d68b-11ec-aefb-d132b4563e73"}', '13814000-1dd2-11b2-8080-808080808080', '18a44620-d68b-11ec-aefb-d132b4563e73', '{"configuration": {"type": "DEFAULT"}, "transportConfiguration": {"type": "DEFAULT"}}', '传感器', 'rtu', NULL, 'rtu', '188f3780-d68b-11ec-aefb-d132b4563e73', NULL, NULL);

-- ----------------------------
-- Table structure for device_credentials
-- ----------------------------
DROP TABLE IF EXISTS "public"."device_credentials";
CREATE TABLE "public"."device_credentials" (
  "id" uuid NOT NULL,
  "created_time" int8 NOT NULL,
  "credentials_id" varchar COLLATE "pg_catalog"."default",
  "credentials_type" varchar(255) COLLATE "pg_catalog"."default",
  "credentials_value" varchar COLLATE "pg_catalog"."default",
  "device_id" uuid
)
;

-- ----------------------------
-- Records of device_credentials
-- ----------------------------
INSERT INTO "public"."device_credentials" VALUES ('55a752b0-d68b-11ec-aefb-d132b4563e73', 1652865446747, 'f634542761f002651ebcd4362dfedbacc26e8237d3ff0d0e8c40f3af763c050b', 'MQTT_BASIC', '{"clientId":"123456789","userName":"123456789","password":"123456789"}', '559c7d40-d68b-11ec-aefb-d132b4563e73');
INSERT INTO "public"."device_credentials" VALUES ('00eae690-d68d-11ec-aefb-d132b4563e73', 1652866163577, 'vppn0MF3ZmGWRV9PyTKL', 'ACCESS_TOKEN', NULL, '00e73d10-d68d-11ec-aefb-d132b4563e73');
INSERT INTO "public"."device_credentials" VALUES ('dd0b5410-d68e-11ec-aefb-d132b4563e73', 1652866962385, '6SOFS7vf5GsDXQeEN1Wj', 'ACCESS_TOKEN', NULL, 'dd095840-d68e-11ec-aefb-d132b4563e73');

-- ----------------------------
-- Table structure for device_profile
-- ----------------------------
DROP TABLE IF EXISTS "public"."device_profile";
CREATE TABLE "public"."device_profile" (
  "id" uuid NOT NULL,
  "created_time" int8 NOT NULL,
  "name" varchar(255) COLLATE "pg_catalog"."default",
  "type" varchar(255) COLLATE "pg_catalog"."default",
  "image" varchar(1000000) COLLATE "pg_catalog"."default",
  "transport_type" varchar(255) COLLATE "pg_catalog"."default",
  "provision_type" varchar(255) COLLATE "pg_catalog"."default",
  "profile_data" jsonb,
  "description" varchar COLLATE "pg_catalog"."default",
  "search_text" varchar(255) COLLATE "pg_catalog"."default",
  "is_default" bool,
  "tenant_id" uuid,
  "firmware_id" uuid,
  "software_id" uuid,
  "default_rule_chain_id" uuid,
  "default_dashboard_id" uuid,
  "default_queue_name" varchar(255) COLLATE "pg_catalog"."default",
  "provision_device_key" varchar COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of device_profile
-- ----------------------------
INSERT INTO "public"."device_profile" VALUES ('18a44620-d68b-11ec-aefb-d132b4563e73', 1652865344386, '传感器', 'DEFAULT', 'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAASABIAAD/7QBgUGhvdG9zaG9wIDMuMAA4QklNBAQAAAAAACccAVoAAxslRxwCAAACAAIcAjwABjAyMjkyMRwCNwAIMjAyMTAyMDgAOEJJTQQlAAAAAAAQLjTI1XUpO5iRhpgfxoer///hAIpFeGlmAABNTQAqAAAACAABh2kABAAAAAEAAAAaAAAAAAAFkAMAAgAAABQAAABckoYABwAAABIAAABwoAEAAwAAAAH//wAAoAIABAAAAAEAAAKhoAMABAAAAAEAAAKhAAAAADIwMjE6MDI6MDggMDI6Mjk6MjEAQVNDSUkAAABTY3JlZW5zaG90/+ICNElDQ19QUk9GSUxFAAEBAAACJGFwcGwEAAAAbW50clJHQiBYWVogB+EABwAHAA0AFgAgYWNzcEFQUEwAAAAAQVBQTAAAAAAAAAAAAAAAAAAAAAAAAPbWAAEAAAAA0y1hcHBsyhqVgiV/EE04mRPV0eoVggAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAKZGVzYwAAAPwAAABlY3BydAAAAWQAAAAjd3RwdAAAAYgAAAAUclhZWgAAAZwAAAAUZ1hZWgAAAbAAAAAUYlhZWgAAAcQAAAAUclRSQwAAAdgAAAAgY2hhZAAAAfgAAAAsYlRSQwAAAdgAAAAgZ1RSQwAAAdgAAAAgZGVzYwAAAAAAAAALRGlzcGxheSBQMwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAB0ZXh0AAAAAENvcHlyaWdodCBBcHBsZSBJbmMuLCAyMDE3AABYWVogAAAAAAAA81EAAQAAAAEWzFhZWiAAAAAAAACD3wAAPb////+7WFlaIAAAAAAAAEq/AACxNwAACrlYWVogAAAAAAAAKDgAABELAADIuXBhcmEAAAAAAAMAAAACZmYAAPKnAAANWQAAE9AAAApbc2YzMgAAAAAAAQxCAAAF3v//8yYAAAeTAAD9kP//+6L///2jAAAD3AAAwG7/2wBDAAYEBQYFBAYGBQYHBwYIChAKCgkJChQODwwQFxQYGBcUFhYaHSUfGhsjHBYWICwgIyYnKSopGR8tMC0oMCUoKSj/2wBDAQcHBwoIChMKChMoGhYaKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCj/wAARCAKhAqEDASIAAhEBAxEB/8QAHAAAAgMBAQEBAAAAAAAAAAAAAAECAwUEBgcI/8QAQxAAAQQABQIEAwYEBAUDBAMAAQACAxEEEiExQQVREyJhcTKBkRQjMzShsUJywfAGJFLRFUNi4fElU4IWNVSSBxdz/8QAGgEAAwEBAQEAAAAAAAAAAAAAAAECAwQFBv/EACgRAAICAgICAgICAwEBAAAAAAABAhEDMRIhBDIiQRMzUWEjQnFDFP/aAAwDAQACEQMRAD8A/O8LcFNAD5WPGhFrKl/EeLFXoQu2fCNZEJmSCiLykrhduV0ZpdJNGcUSe6mANb7kquJ2V/p2U81s1HzVKwsuiTjZtdvRyz7Q5svwubyuGlOI5HWf0VwnxlY5K0XyxiPEubE7QG2kK443ENPlkPqCFzh2bUaDuVGRw0y+x9VXNp2ieP8AJcyV0+Ja+Q04nUjhW4rGySNMdihuR/EuJp0rndWOhLYBISKOlXurjklToTijs6QWxyPkkcA0CgSd1rTdTwZghZFE7xm3neD8XZYOGw75yWsqubK2IMLFhYy99E1q4rt8Wc6paMskVfZ1RuzNujVbKS5MBivtDXWBY0pdS9DHJTVowaoB/ZRlPrXek6vjVPM6g3tsFYiOXyZrHagpMmfGx7WmmvFGxugvcY2sIGUEkUO658Q57Yz4YBdwCk3QLs58fjGwW1ozSEcLEcXPeS4kknldb8JiHuzOaSSdSSurB4EteHzVY2AXlZFkzyqujpjxgjLljdGaeCDuAUuFu42OJ0ZfK0UxYXehpuFz58P4nRcJ8gSGyZBG4NVevKG8hYVRdljnySRtzElo0o8KEbbkaCTROyQJaK4uwpEucPEy6A1au7FR6KDERYORr5I43saKyP2/v/ZZM2M8XGMLfhB3XBLI6R1ucT7ldeAwni0948uw9V2PPLL8IGXBR7ZrgggEVVXYWLj/AM6/3C2GtbEwAfCByVj9QP8AnX+4K28l/CmTi9jUwZ+7IvW9gquqa4R38wRgNpP5rS6p+Td7hUn/AIRNfMyNPn7LV6WwiJzzzoD7LK/uluYP8tH/ACrm8VXM0yPou/soQhemc4JgfTdJHP6I2AIQmQ5ppzSDWgITASEKxoj8Ekk+LegA0pFAVoAJugfWkx6pf3pygAQg6C03tymrB5sFAEU0u6EgGpCMuidJYppAonU2ooAs1fzKaAX7IP8AdIOlhNmXN5rr0QBWR97/APHUqeUkGgaG5Cjf3un+lTDiLq9d0kMimgeyEBYihNB/VAC/RTjDC12ckOAsUN1DcqyJrHCQyPyFrbaK+I9k0BTHu73U/wBtlFml+pVjHltHSuxCmIMRFHg+oRl8hdpvspMa0zMa95awnU0nOGRzSMhfnZdBxG6pIRXWxSKfA7dkkgGQK49kkceqaQyAP3jvbZSOjb/qogfeE+lKSEByYu24mE1S7LcWgE2Br7Llx7i6XD3WhXVwso+7KeiJTRyiloIxcT+Yk05pdnSvwnfzLim1e8/9RC7ul/gv/mXBi7ym0vU7e+mlVqjsPWkBGt2Dyu8wCqvffYp/JIkuNk6ne1Y+PKXBr2uA5B3TSAghIJ99EASJomxZO1cKCD/4VxMH2VgaJPtOY5iT5SOP6prsRTr6oUqPohHYGAXZnAa1sLUZQWuo71agXC9BomXXRJ17lfNttnaIc9uyYrsEhVWlaQxpceiEgdrGnKaAkx2mU7b32V0sLmFoI0OoIO6729KjkhbIyUhpbeoXCbjJDnBwGxB2W8sTgrZKknoRZtX1Qfho381Z4bxAJHDRxoKv4rFrNpxHsTHFptpI9irp8TK+MROeS0d+VzDQkHfsgHT1VRnJCqzR6I6p3N7hbV+ixujMPiuefhA3K1y9jRZcB3JK9fwpVj7ObKrZNDCW6jcHc8KmKdsziGXQ0vurOKvTldaaejKhk3ZSQj5apgBqh3UU0JaA4uqmsMfXRZmDw7sRINDkG5W1PC2YAPBq9gVJkYjj8rQG7aBcmXB+SfJ6NYzpUVT4aOSIMoCtAVmTYGVjwGeZvdbI+V+qiTQJ02uynk8eE0KM2jHxWGZBGwufbzwAuYuOTICaOtKWJkdPOTvrQAUXxmN5a74huAvKyJX8dHTHXZXlNrSwWMbGwRyWAOQuIaiuVGqI/VTjyPG+SHKNqjUx8ofhSWO3NaFZTyXSgkngWVMkXTbrm1A/Ha0yZnklbJjHibOCbUbnf6iodT/KO9woRYiODCsGhkNkgcKOPe52DbmFOcduy7ea/HRlXyM07eq3cIP8tHW2VYR2K3cL+Wi1/hWfiexeXRahX4Xw3NljfHnkc2mOzVl/3VGUtNO0rcEL0aOcEfPndCsczI3zghx1HsgCDqBIB07q7EYqXFyMdiXl7mMEbdOBsFQFJpykHfmimgOhmAxTsJJim4eQ4eMjO+tBeypZDJIyR8bS5jNXkcL2fU/8RxY//BcXTcP0wxBkg8TFNBrTYHjuvFBzmhzQSGu3AO60nFJ9ERk3doRaaBo0pQROmmbGwjM7kmqVuGfhwycYmOR5Mf3RY6sr+57jdUuDcrSLvmwoosi4USDuOxQgISAQTpFISAEhxaZHcG/VSkkc9jGuIpgoUNkwIfshCCgBNaXPJG4FAd09jR32o8JRuyT5m2CG6EcJkk6n3s8pDBCEIECSE0DJQsMjw1tWdrKgRRP0QmgQhz7pjb07qLOfdXvY6ONhNU8ZgAUo6GysA0HGiL1FpyFrnEsGUcC0xIfCdHpRN7KtUIaZaGta6wSTqAogJqfsYy3ytNjXgFR+SZ/VFGgaTAQrXTXvaEgfO4UmNUkByY3V8Xe12CqqiuPHCjH3vdddLKPsy3ouwkkUeIDp4jNHRBYHUqjuaGl7dkMcWnSr9Udj9Vq9EV2YUnxO/mK1Oj+D9hlvP43igf8ATlpZcnxO/mK7elfhP10tedgdZTea+JpTNbHIWseHjggKCeXyk+qOF6L7MBCkUpkCtN+VFGgLMIYWzg4oSOiogiM0brT+irO5q/YpWmmAI7bIQgCfhH/U36oUEICjzgbaZLRond8qt3qvmjuHaEm1rfZGvyQIEJFO0w0deGxskURizW0jYqrOC9vlzAG6UW5S2iNb0KcLgyQFwNbGjstObfTJqjvfiH4qER+GW5dQQFx5c58t3vQC24IXGFr8PKHNOtOC5xiRhsQWTYdrXHUlvK65YbSlJmalXSMl7XN1cCPUhLj1Xf1HGCduRrABe5XCx2Ui6I7Fc04pSpM0i+uwD3tbQcfYHddmCwkmINvtse9k7rpjk6exjX0MxGorZduEnE7S5jS2PYEhdmDCm+2ZTm/ota1sMdNoNAtNrg5uZpBB5CWOje3CvNEZmWCVldKxLhIIXHynULvnkWOSiYqPJWa97fVBUGyNdI6MHVupCkVsnZAIQqJcVFHu4ewUyko7GlZagk1VnvSWFfHPHI8PDco0BHxJoXatBoj8kntzMLb3FX2TUo2F7iBXuSlQHLFhYoqLWi+5XFiMO6TFvDa2vVaqiGjOXc91hkwRlGjSM2uzAIymjxoVLRzWhgJkJrRGIH3z/wCbhdMQGFxLXOHlcNCV5Sx/Kjovo55oXQOAfVnlUONP2Xf1GZswZkB05K4CfNrulkjGMqiEe12dmEZmxLM1ZWizafUpmyOIZq1o0pUPNbE7cKMhb4egN7e6qOT48Qruyu9F6Hpob4DXyRufGG0aPPC86t/AYlwwXgxyENeBnaOa2XT4bXPszy6LWOcxzXNJDhqCOE5Hvlkc97i57jZN7pFpABINHYlK16RgCCSTqSTtqUxWm18gpvFGiBfogCI0N/qnV39UAgOBIBo3RVuMmZPinyRwsga7aNh0H1/vVMDs6X1vH9MjfFhJyIXE3G4ZmWRV0eVna6mtL1ICSuglyhzXAOYRVFNdiGcNJH4L5mmOOVuZriNwqXHUgE+6m78Foc4udwCdghkjoJmSMoPYQ4Ei6IQwLcRFAGtOHle/7sF+dtU/kBcq6sfL9olE7phJLN95IA3LTiuZDGgXdgenSYvB4zEtkiZHhWhzs7gCbNaDlcFp/Feh9ULoDpx+Nm6hO2bEZM4Y1lMaGigKG3yXKmmxwa4OoEXdHlLYEUKTnBxJoDkAKPy12pFAIGpDVfDWyY/rSRB8TY7chTljdE8skaQ6rIKSGOaJ0MpjeRbeWm1BCECEikJoGCYCQq9e9WrpCQwMoU3XMB3TSA5o9jrypjRVx7HvmKs7aadypWgZYTF9noA+Ldkk6AJzSNe1oZGGU3Ug7qohNzS007dXbEPLYsH5IAbkOYnNwAFEf9k70Ioe/ZICPHqiztZrgJ8JKRkB+I75KSiPxX/JTG6SGcmP0bGfVdQOg+q5+o14bD66roafIPZZx92U9AmEIK0JMXEipnj/AKtF2dJ/Df8AzLlx7cuJd66rp6V8EnuvPxqsps/U0BqDW/A7pdwn8JsGjuCEr13K9EwAtLdDfcWi99Ei7Xn5qbGOkcGxtLnHgDdGwIndHdBBvUG7rVA2QA0k/lp2UnG3E5QB2CYEUJ0eyEAecGyWh90x7KJ3XzSO4dItRtFpiC9VY0DKDzWyrTaa4CBE2tDjvp3XY/p0jGB5ewjerXM2PMwm6PAKHOfVOJ7UStIUtoTt6Nbpk8UMOR8gBvlcPUsV4+IJaRlboCAuQmr0UVrLyG4KBKgrsmCCdT7qLtb10tKj8kLAsm2F7hYBpb/T54XQtYymlv8ACeF5+3UNT9dkwTd2b72ujBm/FKyZw5HqyWGN4lBc3IQADsV5iAuZK17d2q2HFzRnKH2DwVENy33Jta+R5Cy1REIcbO/pTzJiJnnnVdEGJ8XESxkim7FceAliw7Xve7U6UAuXxvDxUj4/hNgD3WkM/CC7E4Wztx+Ov7uLYaEgrmw+GkxBvXJeriuQ8khWjFStrK4gDgcLF5ucrmUo0ujeiYI2BraobIdIyOjKSG7WFw4LFzTPDXRjLW9Krqc4e7w27N3IXf8AnjGFox4NypmmaOo1HBQjCtjPT43+J96TWSth3tTYWU/PmuqbXC6Iu0mQ1RDY6/qlpZ7Kcji85nEbcKtDEY5iMuNc3jNuu3HQt+zOkdKGuZWVhHxK6OFrJHv5dzSJIhLI0v2AoBcawUn/AGbc+zE1vU6dlGT8T6LqkgP2kxjcm7K5p25Ji29Qd15zxyT7N07JuOvG1JPFxk6WDdJuFuA+Sc7SzM1wPcE8qUg0Ud/0W3go2tgYQNXC77rF4+S3MH+Wj/l2XZ4i+Znl0XlxIokkN0AJUoyxur25h2tKRzXPtrcorQWl27ei9NHOTxDmPmc+JgjY42Gg3SrPz+atYYvGaJM3g3rl3UY2GR4ZGwuc400DlMWiI0INcrowuIjhMxmw7JzJGWNLj8BP8Q9Qp4jA4vC4KKeeEsgmc5rCTuW7rjRoYx6lLhNtZhmur1AV0cUmLxMWHwrC90j8kbBuSf7CEgIxvibDK2SIvkcBkdmrJ8uVVuVZPBLh8RJh5mFksbixzTwQohrspdWg0tHbAj7oQhAAgae/dSLSIw/TKTW6j+/YoAEyBlu9eQlxum1xY8OAFg2AQgDd/wAGwdMn6q1nWZDFhqNuA5XB1sYeLqkv2J33Qd5TS4nOc57n6WTwFFji17XaEg3RC05/HiTxd2D3F0ll16XXbVIkmybJrclTxUxxGNklLGMLxeVooKH7LJdlndgW4TFzhmOnGDhZE6ntjLs7xsD791wlCEC0Nga5wDiGt2shI70NfVXwQskhmc4SZmi2ho0+aqcxzQ0uGjtiU3HoLIoHuUISGRgaXWADebhdbmwmCOKNsn2nOS4kjKRxX6qmKUDDtayMB4e4l4OpHZJ5zEHQHagnGqExOFO0+qlE9omY6UF7AdQDursSzDNEP2d732y3hw2cufKcmbSu6dUwJzuY+V7oWFrCbDSdlEsqIPsa8dk2SOZG5oqnb2FDMcoBPlvQIASaeoolp15I3UVFDCPLnfmu6B0SRHXiuLtRpopyFpe4sBDb2KSA5Mf+EPdXxnyNvsqccPuAfVXxNJY2ruuFEVcynonW/ZRO6ZBCQOvqtGiTL6mP8wD3arelfDJ7qPVR52H0Uulf8zvoVw6zG3+h3e6ZCSkQB8JO2q7jEjStw00uHmbLDIWSN0Dgdv71VVHspFrm6Ou6vVACJJcSdSdbPKaQ7J/v2TAEWhOt9RoLooEFn1QkhAHnfb6qJ2SDkXqvmzvBNjXSODWgknQAJLqwLvAxMT3gVeWzwrgrdMT6L8B09s2YyvykfwqWP6cIGeJE6wNaJWvJhopaLgRru0rk6l0upnjB4h8sF+UyCiR6r0peNxhSVnMsly2cM+Iifh42RMpwGppcbnXf9F2npszS0EjXQkFSx2AGHwgeHEvvUrllhyS7aNVOJnVfKCKNJjYKcdeMzOPLdFc9WyyNV9LV+AhbiMQY3diQQjHRiLEua264vlaHScIY6mkvMRoFvhwuWSiJSpWZEsbo3uY4HTSilm8tEfMcL0GJbhpyWyObm72sybp7hZie1491eXx3F/HsUMl7OQuIA0HurWuzNHfa1GUOjj8ORtO4PdKHQei5mqNLsniGNa8Br857hV16p87/ADpdDMOZC3I5paebTUXN9CujkK78LhhbZWkSegWhHg4WMy5QdNyuefCuh+8w96a0OV2x8Vw+TMnkvon9sb4cgy5HtGyyCS4nXU8nldGMkbMfFBp2zmrnacjrFaGxayzZHJ0VCNG9hR4eHa0gXVG1PhYJmkJsvN+66MLjXxnK+3N9eF1Y/Lj6szliezW+R9ggkZar5qzBYp8JM2HI8zS2y29CqC4AWSK72uzkqsyokKvXZTDmCF7Sy5C4U++FxvxkLCbcSfQK2GQSsDmg13KmOSLdJjaog+HPPG8Gi08BZGMaW414P+pbvPosbqH513uCFy+VBKNmuN9k8TFT4i2znGwC7OqtbJg3SkMa4FoDQFbCGvjjdQuqsqnqg/ybt6saoWJRg5CcraMZbmBcHYWOjxqsRanT7jphOjxnaVh4zqReRWjuFc2hHZSY3NdVp3K9NHORAJuruuAr2Qyti8djg3IQQQ7UeyqJMbjldvoSEgC7a6q6CpdADnPeRne52t0T3U3xuDWOoefYAojjjdDI50oa9tZGEfGnTfCzhwDwQMvJ9UxEJYzGadYcNCCF0YzCYjAfZnyFrXSxiZhY+yAdttiqommadoc8AuNF7ztfJUZm5JXtzNeGnLmbsUAORssTw+QnM8ZgSd/71VZJrnXcIJJqyduSrHy5oo2FrQGaWBqb7oAgwAvAcSByQNlOOJ0mfwxbWDMSeyrUvLk3OfkcUgZOaN0TWskaMzgHgg3oVY+STGYkPmILiACQK2/sLnynJdiu1q7DNbHNC/EBzYHGyW7lVF99iPUde/wjN0fonTeoyyQyRY1hc0MdZb7ryOUlwa0GydAOV2YjHyysEXiPdEy8ocdguRztbbYPccLTK4vREE1sibGmvYpJknX15KSwNCH/ADfktI4yCTpQw82HP2iM/dSMNWOc3fhZw/E/+KklF0NgrwMP4UZLn+JqXAjT0pUITTEdeAghxH2nxsazCiOMvaHgnxCP4RXJ/oqcM6Mzw/as5gDhnDTrXNJYcROmYMQXNh/iLRr/AHspQYd2Im8OAZnE00E7p7EGNOHOLmODD24bMfDDz5g3i1GFgkcG5gCeSVWdDRGu1IB0ri0vsZGMeU+5U3NLTRHv6Loyvw2DyyxRu8cWx5OrKP8AVc7cx0BOvFpUFgd9PZSLWiIHN5yfhrZdGKwbsLE10kjBKTXh3qPVclaX+pVVWxbBPTIdNb0KSL02UjG57nABxJDdACdlH3v5JnW/2CQ0II72kMQI8R9baVasDAYi/MLB27p4bI/F/e/CSLPZdnVW4aHEj7E8uZV6qox6sTfdGPjvwR77Lt6fiTAwOyg22qIXFjtYSaG6tg/Aj9llF1kLa6LXuLnKB3KLr6qQBdZHZW3ZBn9UGjNOVDpZ+8kHpau6p+FGfVc3TjWJHYjZcM+sxuvU2WTOZBJEAMryCSRroqwmdgkBqBp813GAcJ2TrZPGpSI1rdMHLmBAvaimOwA319UHdB2tA3BIB7g8oAm+KWNrHSRuYHjMwuHxDuFfh5YfAeyaIZyQRIDq0Dj9lTLNJLlEj3ODBlaCfhHYKs8J3QqJeXuUKFIRyEeaQhOl8yegJSLiRvomK0B90jWbQ2O6pCPRdOxkc0QYTlkaKoldwN1RFd1l9NwcM3Tw5wOcne1DDYwYUTQzEksOlcr2sWVxiuZySjbdGvQ11Hoq8TGJoHMPOxXIyV9HEYh2RgFtbe67Y3CRgeLpwvVbqUZqiKaPP4CL/PNjkA0OoI3Uup4Z0UznhvkPIC0pMJWNbPHX/UCuuSNsjC14BB3tckfF+LTNHlp2ZWHw78U+CZ9Fg0JrstevpwqMHD9njLLsXprsr104MXBf2ROVs5ZemxYqQ+YRuO5J0WVPg54c1AuYOQVvudpsBXI5WLj8Y6R5jisMG5HKx8qEIq2VjlJujhe5zm5XEntfCiNB6KbW5nhrdSTQAXfjOnlrA6PtqF5sccppyR0OSRnxvDXhzxmaNweV1uwhezxcK629r1XCdAR9QV0tl+zsBikNkWQBsnjkl1IJX9F8GOkhdknBI2sjZdwxkBZecfNYs0z5jch/RMQnwi9xDW8A8reHkzj0iHjX2WTZJJ3yN0Z2VHdA2Tba5JSt2aI78Nh4cREHCw7YgFVY3C+A1rmkluxJVDHyRHyOLb7HdXnFPd5ZAHt2ohdCnjlCmuyKdnUzFNjwADbrajwVmPke7dxrtakwAvANhl6+i7ZYcMIXFjhdXdocp5I/8ClE58DhvHkt3wNOvqteg3RujRsAsjBSmKYVs7cLXJA1J+q6vD48TPJdgVj9S16gdq01AWnJPHGzM5wr0Kysc4OxhcCCNKIT8qacaQYlTNHButrm8tOifU5HHp5j0yZg4CtlX08OIe9woO2vlPqf5R3uE4t/h7B+xjnYrVi0kwgsfhm6WVx6rTwB8SUHhjA0Gly4H8qNJ6NFpaA7M2yRoQVZhmMke5r82ZzaYG8u4v8AVVOrMcp071ul89e69VM5js6mzBsfCMDJK/7pplMjQKk5ArjZczZC1tCga1PdGf7vLQ00BrdVpgM8b7cjdCtfM6bL4zicjMraHZVIAVqcjWtdTHBw7gK/E4yTEYqKaZkbsjWtyhtAhvev71V/WcYOq9TxOOiwsGEjfR8GEU1mlaf3ymIz0FXtjZ9hfK5kufxA1rgPJ6367J/Zj9hOJ8WIfeZPDJ8+13XZFDs50ITDvI5uUWeSNkgEg2dLNdr2XRicHNh4MPNK0BmIaXxkOB0Br5cqueMROADw892p1YEIyGyAuBLeQCm/KXuMYIZdgEqeKw78NL4ctZsod5XXvqoyOiLIvCY5rw2pCT8RQBX3XRhPstT/AGwzD7s+F4YHx8X6bqo5BHVuz3djZQKQER8Z/lUlH/mn2UlIwQrIxEWSeK54fltgaOfVVpgClG7K4nXbcFRQjQAgCzt9EK/AtMuJjiaWtLzQc40Gp7YjmYSW63v3Uk3ta172sJLQ4izymIpHROkDD4bTTnVoCkugIklx1N8WVc+drsJHCIhna4uzg6lT6ZixgsfFiDDHMGH4JB5SqJX+JM+TIGhxzZWjQKvoX2RTJutuwpSe5j3EhuQVsFBS+ikCebQjTXckbKKsZE57XuaRTRZsoQFLT5n/AEUvmojd/up6f9lKBlOOFYUijmu7UsL+CyzpSjjnF0Djp8kYX8BntSz/APQr/Ut5P6FK6JT/AGSI1WpGzk6m0/Z2OsVmXHgSBjI72vUhdXU9YGa6Ztlx4XTERn1XBm/Ybx9T0TTA2GQOa4yEgscDoAqDukUl6DdowoZRfP6o4QkxjO9a+hKOB+6ZcXAAnQaD0STAQTQhINAhCExHmq2UxVfuo/NMr5o7voDv6KNppD0KaA3MB1KLB9Mezw2SSublGYfAb3WfgW/accPEO5uyuVoTY5zHFzSR6hdLzuVJ6RHCro1es1J1I4bDyiaNhAD2DQ/3/RbETcrGsHAWFgMTBh4nF1mQ7WFdL1QmINhaQ/Yk8Lsw5oRucnsylBvpHT0+cvlmjcdWu09l3FecwU5ixbXknU0SvRFwoEke9ro8bMpxM8kKYwEXqVzuxsDSRnGnZWQzMmZnjNhdCnFukyOLRVjGTSDLGQGncrPd0yXhwvlbB+StEbThvF8QZ82Xw61qt1nPx45HbGptGbg8C3DkOcQ59b0uxSLSHEEUexCitIY4wVITlfZx4rAsmaS0AP3BCxxh5C4ta03etBejtSGVrAAwA3eYDdc+XxI5HZccjRkYXp5rNNYPACjjMMIm5nSkm9AVrSea9T7hccmBa8297ne5Wc/GSjUUUsjvsySNOxpSgZ4jg0EAnYqzHR+HMW/w8KtrPuc44dRAXmuDUqZ0X0Rdd5TuNFdg4PHLhnDSNgRuqDo7bnlWysfC8PbYBFghEF3dCbJQQ5sT4Ul7UaUMRCYZC3UjuAp4WQvxcbnnXYkrUxBLGFzWB3pS6ceKM4MiUnFmNE/JI12jsrgaI3pXzzS47FUwAF5oMbsFHEPjkosZkPIVLSWm2kgjWwudtwfFPovfZLFQOgoPI12A4VB1ePdXzzOmDc/8OhPdUD4x7pSacviCTrs34vwmeyo6mP8AJONjcBDsVHGxodvWwXJjMV48Dmtact3ZXpTyxUONmKi7OFa/To8mHDiNXm1kcFb2CIGHiLhYqyDyufxY3MvJosTa0uJqzyaQdyQKF6BNrnMcS068kcr0znI+405VkcZmkcIgcoF2eygTfunq0aEgnSgU0BEcoUmuyXoKPBCC4nT+wgC3EuYY4RHViPzEd1BkTnxSPDmgMokE72nhMPNisQ2HDxuklds0cqsgtcQdCNCOyf8AbEGd/h+HmPh3my3panisRJiJQ+UguyhtgVoFX80JWMAhrS51CyTsAN0KTHFjg9pIcDYI4QBEggkEGxvfCP2Tc4ucXONuOtlJAABtQN8Acq7EQNiZEWzMeXtshv8AD6FVMdle05svqAp4lsbJ3iGQysB0eRVqloRCQtJGVtaVVqKEKRkR+If5VJRH4jvZSSQ2MGuPTXhIoQgBa9lY+J7ImSOAyv8Ah13Sa8tN6a72EnEE+UEN4BKaoQkBCK0vhIZPDmNj2mZpczkA7oMjsjmNc4Rl1lt6KsbfqmhPoGhItBUi8ljWUNNiBqgGJHbT2QUAnugASF900JBsBXblDhpdir27IA8pOYb7JvbTA6xZOw4QgOfFj/LuTwZrDNB37on1gd7JYQ/cN/RZP9hS0XuNnXgIrM4gILsxGYpchakFfVsM1vS45/FZmMuTw78w03WRAfvWH/qC0uqEfZWanNn0FbrMj+JvuuDyf2G+P1NwjT9Ugpsc1sjC9udoNlpO6JS1zyWNDWk2Gjhd67Rizq6b02XqDMU6F8Tfs8RlcHvDcwHa9yuMIPO+2tHdM76H5pgCEjsgJANCbmltE1r2KSYWCEIQB5u9EuUguvBYJ+KzFppreSvnYxcnSOxvqzmaxzjTQSewCNfntRXSGz4KbMWnymrI0UcRM2WQvazKTuArcKXexJlI7Ug38kXZJ+id6eqzsoANFON2QbA2N+yhmQRVag/0QAwddPkunE4uSYAE01uwBXLtykVcZuOiWrJjzOA76L0sEbIIQBQHJXmhsvSQVNhm66ObRXd4L7dmWZdF3G9qUcjmXlrXQghZ+BnEc5w2KcWtB0dS7bBBqq7heljyKRzuLRKRxe8ucSS7UklRQotka5xaCLHAV2JIlXOqSmxpcHAEDS9TuoIAEjVevqmke9fIpAZ/VogY2yjcaUqsHEZMHINNTpa7cbGZsO9oGu+ieFj8GFrfna5JYby2aqfxoycazJOR3ANBa0TQ6FgcARlrULkxmHM2LYBdEamloNa0GrNegU4cTU5DlLo4zgw3ECRlAA2RS6ZHBkZca0115Utu6J8PHLhA4yHPmrIBx3W6hxT4kcr2Yb3maXRoBPACi9pY/K4Ee60nxxYUZhGXdiFwzzGZ9kAa6UF5mXFxVvZ0Rl/BU4DWiqXfGrneVwBBHoVVJ+JfC5l0aHSIHyyAC9RuQunGwtgwTmN7iyrMJOxwEdAPH6qvqzvumt53K7o44xxuVmLb5UZnutzB/lYvZYfBW5hPysX8qPE9gyaLkIQvRMAI0tBJc6yUdr+iOUwG9paacK0tJB9z80wacDQNHYhAAxzmPDo3FrhyCpNyeG7MD4m4IKliJvGndKWsYXH4WCglK5rgzK2qFE3uqQis99aQrGPBMbJSfBDrIbuByjE+F9ok+zZ/BzeUPOteqKGRIAANg2NhwlVuoJFG3KQBvaDwgXdbJnQZSBod0ARQQjYhSI8l2O1IAihTmdG5w8JpaKqieVAIfQHT0rBP6j1OPCRyRsdLoHSOoBVYiIwYiSJxDixxaS02NFUx2V76GtCjasfDK2Fszo3iN5pryNDXqhaAgOOUH6eivlma7CQxiBjXMJ+8G777/wB8qgoaoLsEIQkAJ3QIIs8E8JJvcX1Z14oJDJYbwix/jF/wnJl7/wB2oJMNsb/RNNaAtwkbJsTHHLKImOOryNk45DhMa2SItk8N/lJGjqVH7oHCdiosxEnjTvkyhuc5iAFAI9h6n0Q3ca+5pIYIUnNAeWtNjgocxzKzAg70QihFbefddGFjheJfGeWU22kDcrnZZNAa3op3lYQd+5SgDKcQPuX9q3UcCaiYRVg8hWPdUL9vhO4VOA/B9LWb90WvU7B99P5i1hcdSRooOGVxGh1q73QCAb0PoUr02WpOjk6n+CP5lmx/EDxa0ep/gD3WdH8Q/mC87yPdG8PU3Dr6Lq6dPBh5nPxOGGJjLHNDC6qJ2OnZc7q4KS749GAd+17ISF36qVEOp2/ZMBJpmtK7a2d0humAK3C4eXFTCKBhfIdQBzSU8ToH5JKzb2CoMc5jg5pLXcEFP77E/wCiXgv7IUbPdCfxF2YH2Vxw7ZQ4a6UrMFipcIXAatuyCo4J7vGY1lX2ct9uHjkH30bc5GwXi4Mbn3HpnVOVdMzMT1Hx8O5mSiebSfBA7ptxPHiM1JKniemuL/uG031K5J8HPC23tOXkgqp/kTfNWJV9M5Qj3TsWm45gBpptS4ma0R0tForukkMLTSQhCJWtXD9QZDhY2AEuA+iymiypDelrjyvG7QpRUtnZjcQzEZH0RIDqO6lgcQW4pmZxyHSiVwpj314V/nly5C4KqNvH4wQDI2i4+uyj0pjvDdI/d/dZDnGRxe82ebK6349wiYyHygDel1R8lOXKRm8fVI1myh0jmCyQN1Ys7AvMODfLJZJN2V2wyNlja9p0I+i7seXkjGUaLEdr2TboboGtwVAuGpcQB6lbaIR14LFuwjMR4bIneNGYqkbmoHkeq5WgZqcdL1KA6qOiSLAHgNe6tdd0NIslwvsLRV3r6gKKQw5RZy1achBPlFabWopDFvpXySMTc3wi+NNlLRSNg3fzScU9hZkdSjyyh1aEUuA/EvQTRiWMtcBrpZWHNGY8QWHcHfuvM8nDxlyOjHK1Qy8xzNc3hOaR0gcXfIdlNsebFNYQaO66epxRsgYWaG6IA/v1WUYScW/optWZuwXoOnNL8K0NrRl2TsvPnb5Lcwf5WL2XR4fuTl0XmNwjEhHlJoapfJCF6JzgRqhCCDeo19UUAKyGMyPDdAHGgXFRjyU7PeavLSWtHVPQDLSL0sA7jZJjQ51EgablTZNIyCSFryGPrM2uyrTdAHdWQGISAztLmVVNNf3wlCIy4+MSG0TbRzwoA0fneqQDaQ1wLhYuyLQazX/De1qU0niyFxAHFAKH7JgWz5PFLomuaw/CHFVtaXWQRQFmypSSGQNBOjdAFH0B/VD2ISRTISKkYIQmCWkEfqgCsfiO9gF1SYueTCRYV8r3YeMlzIydATvS5h+I/wCSkhDZJoe/RoJrYAbKBFE6elFet/wF1npfScVM7q+CGLY+MtDSdlhddmwuI6nPL09pZA821rv4fRauK42Ryd0cCAC40LvgBCPr8lkijqjw0b8LNL9oYx8YBDHHV99lz5rirILGuYDZQUg9zWuDSQHaEBOwIM+BvtSm1uZwHKg3RgXdDFE5rpIpQ3w2BxEh1J9EQXIGwxnT58Lh4ppY3tjm1Y4jR1dlyDZa3U8disR0/CQ4iV7oYwfCYToAVkDstc0Yp/EmLddko8ucZ7y8gJPAzHLeXi0EFrqKk2KR8TpGsJjZ8TgNAsv6KFC7JIHaGjdVutTr/V3dXxLJXQxRZWBmWNtXSym76g7a0rI2ujlbbw01mBJTUnVCaWznZ/FvYNKe+/8A5U2ujdCQGHxs5JdfCRhIhEmlE1VqEiiqT8N9bVsqMD+CfddMjfui4VVbWubp/wCEfdZS6milo6E1JrTI8BrSSdKASIIGt32pa0ybOPqX5cfzLNZ8Q9wtLqP5b/5LOj0cw1pY07rg8j3RvDRucD2U3vztYMoAaMtgb+6i4hziQABwBwhd60Ygm0BxJJ43KiEBPoQc7IN9k+yEgAkuqyb2soQjv2T2CBCVoQB5xltOZpojajstro8eNxUsbmvYc3luR1D6rFY0uc1o3Jql6fC1Dkw7aORtkheR4kbkdGV9FzM9kSNALdCQbtRxEYlw72EgAjcqT5Gxi3uAHFlZ+PxTX4RxhOhNX3Xp5JxjFps54pt9GK+PK94sGjVg7qsGiFcAS0nVVEbrwns7EBclauw8InmZHdZjuV24npTooXPa/MW7ilUcMpq0DmlszFINNpEFu4U2vGx34WdD2Ta3KEvkmTmA/dMR/dlwcL7FCVi0QBTr904yMwzXlvWlfimRsaHRPBadaJ2VKLasLOcaml14bBvnNmmt7k7riB15VrJZGVkcR7FVjaT+Qnf0bGMYGYBzBw3cri6XM6OcRn4COeFCbGvlg8NwG9E3uuUXrS6cmdclKBnGHVM15+oMYaj8xVEPjYyUOdpGDrS44cmceJZb2C2sLI2WMZG5QDVLbFklml8mTKKiujoa5zY3RgjK4ixXZR/X0KCitl6KMCJ/RCnq12oG3KgkAuUFHKCgATvSr0SaavbbQFTmEYc3wnF4yiyRWvKdAQB1BNd6KxupUce4gDggBbCx+oCsc699Fy+V6I1x7NGGFoIk5rfsq+qAfZD3sarqj/CaufqgrB8akHQ7KnFLE6EvYxjsfZbeD/KxeywzsVuYL8rFpwuXxPY1y6Lk2NLnBrfiOgHdNjc7qsA1uSkGlzqbZK9GjnB7Sxxa74huOy6Mc+CR8TsOZr8MB5kr4vSuNlQQK3N82o/JOxbG2uTogHKbbuDYtSJjDG5bzV5iTooIYyUj3SyOkfWZxs0ErtuWhe4KSB+qLAtnkbJ4eWNsZa0NJB3PdVKTSM2u3ZMZDJrYZ6BPYaEzJkdmvN/CQVEKxkZc0vA8rTrqoXRsb8IAVGtjW1oynTQ1tZUi52XLem9BThdmaYnSFkR81VygCtwo1YPqFFH92VbDA6WKaQOYBEASC6ib7d0gKkIQkBEfiO9grHEHYHdVgXI/5KQ90kNgVJ7w5jG5AC3dw5USdf6pKrFQxv8A0QdSmx2SRrxWZpuiN05XmSRz3VbjdAJUH2RSOx9kx2+ikQ1rX5yc1aAIGVs+AfRWPaWkWQfUHZVs+BqlYque6IvoCchJYy3l3AB4UBof90IQ3YicjcrqzA82CmyeaOGSFsjhG825oOhpVA663XopOFcgjewnf2A4gHSAPflbyaSdWY19e6jwUD2pKwCAltua6iDv2TJGU6HNe9qDNnfzKRSWh0J3wu9lzdP+B3uup3wnXhcuA+GT3tZS90UtHfhp5MPOySFxZI34XBBme1krbFP1JIVYHlzaVe1qN6LZNk0c3Ufy2/KzYRckY4LhotLqH5Y6chZ2H1njH/UvPz+5tj9Tb7o+aBqd0Bdy+jIOU0kwCXUASdgE9iDtohB0u9+yVpgNO2m6se53SQgBV6fqhNCAMDCzHDzCQMDqGgPC0em45gM75j94dardZY2QG0b9F4GPK8ejrlFSOnF4p2IlzOJrYBD6bhGa+ZziaBXO3ffnVSJs7+gHZDyNttgom10/CxR4Z78QQHPFAFZ3UME6B2eMF0Z1BA2Rh/FxU8UZJIG+uwW6XR/hOI2qjyu7HCGaFaMZNxZ5aJxZI1zbsGxS3JsfE7DnW3OFVSeM6XE4ZsO+nEXS4enMdFjzFM0HTSxspjDJgfH+Rtxn2cj/AIdfoVXlAruu/q0VYtrYwLfVALmxUboZAx1WBa5J43GTNYysgdqC0cBA3EYCRtDO06ELOyuyB/8ACdLV2GxD8O8lvwuFEFGJqEvloUla6K82Ulj2g1uqz8/mrJi1zy5pOvdVrOT7KQXWqYdpqNOFFCkB3ZvVTboOVHY76JgpgWNGYgNHmJoABbmHYIYWtNWAsSKTw3B7KzA8rrmxolwpbVPJ1rldni5IwtvZnkTZoRztke5rbJbyrWnUA3XICzcI9uHwZe6sztQCV1Qzh2HErqHfVejizKS7MJQLpZYvtJZGXVVgFB5WOyYvx4eNi7bstgcp4sv5LCUeIJfspxO8N4cANDeoSccznOIFnegtSBOIJ0aBpXukB9OUkwR2/VAAQR9FjdQ/PH5LYOv7LH6h+dd7gLm8r1NcezWZ+E1c3UvybtOQuqMXG3tVrl6mSMI73BVy/WxL2Mcrcwf5aP2WGtbpryYix123UX2XH4rqZrkXRpQPhayYSxGRzm1GQ6sh7+vP1SZRzODgwt1APKqReuy9NM5xk2SfnQUbT/ZKkgLDGRk1Hm1oFQOh9UwdDp872TYxzyQ2rAvUp7Aima0r9UtwVdJiHSRxMLGDIMoLW7+6EAMgc5rnEhrQ3MCeVV8vmnncG5bNVsSopsQ7PBNdrSRwg7pDLImh2UGQNs0b/dJ4ja14BLnh1Bw2IUEIsKBL911RYGeXDGdrD4Y0ut1ykUf0TcWgTBBHlu+UI4UgQb+I/wBgpgEg0DVakBRH4jvkuvCxYh0E8kLCYmtqQgcIgrBnLSEJnU8dtEAI7pqUeXMPEBrkAqJ302QMDrzwpFobCHlwJN+VIbg1Y7HlJ+tkChWgRoRGM/dt9t1I81soR/A1Whw8MtoXd2haGRUgWmwQb2BHCirj4DzAGgx6U9xN2U0IrccuZootvcBRUqAceW3VpPrMcuyAIlGo3762n8vmm5xcSSdeSpGVwmgdt/qpHzG6ob0EYdpdmoXV87J6VzdpRXQMC2t+y48Bs/ta752NY4ZH5xls0Fw4HeQeqjJ7IqOjqpABuwLTDS7QXfYJsprwHXlO5C0ok5OofljfdcGD1xMfutHqgb4D/DvJehI3WfgPzTVxZ/2I2h6mxwhozOrTU7nhTidGGPEjHF9eUgq7BnDmKSOeNxkfQY9rvh+XPC7krMGyowPa17wM0bTlLhsqx3v6Lt6lgMT05whxTJIZCA/w3tIsHYriVSVCQjabm1Wo11IBQhSUCEIG4/ZAAhTzj/SEIF2eZaLKll7FDwGvcAdjV90r/ZfN6Z27C+D9U8ygVOFniyNZYaXck7J7A2ehtYWPeCM5NG+Fd1eL/K+JVObsQq8Fh2YN9mYGxVWp9VkrBkWDZqrXrQajgaZzPudnBg8c+J4bIS5hNa8LUnia8xzMrM3W+4Xnjt89CumXGSPibGDTQKNLmw+TUWpGkod2juxGIhOJjMYD5boEo61A10RlrzjS1z9Kw5fN4rh5G7E913dUaXYNwF96XRC8mOUmQ/i0kcEUf/o7nEa5rVWBax04EoGXY2VrQwhuBbERrl1BCx8LD4s/hk16jhYZcfHiXGV2T6hh2QPBicC13AOy4zwrpGmN7muJsHQlQeBV0uTJ7aNI6K0rUmguO2ndSewN2NqBkfVRB1Ug273qlJkZfeXWtaQkBJjo3sLXW11aOCiurD4WCegHlj/9JUcVhzh5A0kEHlbSxy48iVJWUWXACz81fJMTh2w6ADsqmtLzTQSd6ChepFGwpjKSHVnd0uHNJ4hGjR9VqlYjcVJkDIvK2qoLoghlPnmkLWjgld/j5VFcYoxnFvtmkU7GUCvNeptc+GmExcGA5W6WSr13RlatGLQkIQqAFj4/88e2i11kY/8AOn3C5vJ9TTHs2sNIInxSZGvDTZa4aOXL1dtYQuNeY3QOyuZ8DfZc3U/ybvcLSf62SvYxytTDmpMLXMdaLMWlg/PNDX8Ea8/B7G89HehB3QQvVo5htFmia9SknlNXRy96TynIXWO1J0A4ntY5pLA6jdEoMn3pe1obrdDhQCthnMUU0YZGRKA0lzbLa7dkWBAtc4F+U1dWBouibDxR9Pw+Ibio5JpS4OgAOaMDYn3VJmkMDYc58JpzBvqq/wB07Ad+U9+6KvRDjdUAO6R4/okBYIicO6XMwU7LlJ8x+SqKkWkNBN0drSQAKUWTxGmWzHeoadUPblrUGxYoqKAO+LquJiwBwTZD9mzl7WHuuB42Onm1FHZJCqUm+hUMULv/AMJIQpGQH4jvYK5k0jGPYx5DH6OAPxJMhzQzTZmeVzW5SfNqEmAFzQTQO5PCUehsSE3ABxAN8WEkCBTcymMdYt3AKgOw/RBq9Aa9Uw2B0NJO0a72TGp/RD25S4WL7hIZGP4G+ymGuoEc8qDfhFK6V7XBvhsyACjR3KI6Eyvk99kD30TYQHDNZHICR3OmnqgBnfagjYAab3oguJAF7bKyJscjBGWkSuOjidKT2BBj6LbAIGtHlDwc10KdwFEDKTYsc0m51mho0bBICuP4Xe6kTp+6Ixp7k6JqUNi4/ouXBEZ5t74AXWB5hoa3IXJhNMRN2vlRPaKiaWDxT8LLnjALqrUXuoAtObM0uc7RoHBSdC9sTZS0hjtAe6THFpBbYcNiCt7emQcnUbbhnB2hB1BC4en/AJptdlodTcZMPI97i55Nkk7rg6cP803vS4M37UbQ9TVv+wpMdlcCPexwrYoPEhe/MBl4J3VBGui7aoxNDq/Vsb1eds3UMRJiJWtDGuedmjYLnwb4mueJojLmYQ0A1ld3VHZTieWWW3mvcJp9hXRF4yvIsV6JLrw8cbYsQ/FQyuOS4yDWUnkrjCGgTGg76DTsr8FhJsZiGw4eN0krtA1oXd1/oWO6Fim4bqeHfh5nNDw13IKKdWHJXRlIS17ISoDJiw8bZcmJcWHW7C5ZAA8hptt6FXYvFOxRZmaBlG4VD2lrq+YIXz2Rx1E7Ff2RKKQUXp6qEMmDQ1JPuUw8uoEnvRKrUmDXZPkwokdttVOObwzeRrjXISrbXTZJzeUJ0BpYOTFvlaC0BnoNlq6O8pqwNl5uF8rXeV7mjmiuqLFPjxHiBxNiiCV3YfKUFTMZ47NDqGKGHZlFeIdh2WLFO6GXxBRPNomkfPM6SQlxPdduCw8D2B8zhmOwJUzySzz+JSioLs5J5nyyZ5GkabAKku7LU6w9rYGMFb3pwuBuHc7DGYfCDqFnlxNSrY4y6KmuI225SJ1/omxwaQSLHbutaGDBYmNromFrgPM0u5UY8Tm6Q5So5WyYd+G8N1tcNjSYwsrMksBzc2CtE9PhlayOOMNkJoOve1kzibCTvw7nEGNxaQD2XTkg8dc0RF8tHTicO58bZmjJINwCuCR73EZyXHYWV0RPfiJGseTtVgrnmYY5C0g6d1jkfJWioqhNkcyy1xBqrCiO9+pSO6Wvr2FLCyy+Nrz54wbadxwpYjEySta1527cpwxTV5nZANaJVb9dCR7hapuK6J2aPTZoY4g0uGYnW1qtws7sH9rbE/7MH5PEA8t9rXnPscuhaLB2IK2MDJi4cIcNJM/wCc4jzeW16PjZJerRhkj9osQhC7DMSyMfpjne4WwFj9Q1x7jXbZc3leppj2bIlLsNDHlFM2IGptc3UY3OwMjw05GuFkDa/wCyr47MbBptuqOoyPb0+SMPIY9wLmg70tJfr7JXsYq0+lNysc8jfQX6LLK28EAMJGB2XD4sbmbZNF/Nq7C4h+GxDJo8uduwc2x9FW8AEAJb8D5L09HOWPnfIMsjjlOtAcqDHBocKBsVrwoFWB7RE5pjGYm85KaYED7Lpnwj8JiDDjWuiflDq73qFzJucXG3OJO2pQAj+iEJcoAkQMl2buqpRTQkBOCKTETMhhaXveaa0HclKSN0bntkaWljsrge4SDzmBBII1BBQ42TqauzZTAXdSc5pjaA2nAam1FSa7QXVDbRACpuQanNfKThRIsEdwgnU6C+wUiW+FWXzXeZMCCsd4P2ZtZ/GzagjTKniI4myhuHkMrcoOYtrXkKo+g1S0BAfiO+Smo3mkedNhspKUMEIqwgeunqmAAlpBG/BQUHntwUIAB+iDsVNoaWkZjm7HlVu0aUADfhGnqnZ2/RAuhppXHCuaHQsjljkaXOsUBqERVgylTjZmc0WBelkpyQyRtBewgHUEjdDCJHRskcGNui4DYKqrYrIOAaSLBrkLrkjwo6fG9srjic1FhCMdHhWTStwkxkiYaY5zaLlVhpWQYmOR8Qe0Gy13KaVMV2UI7JvILnECgTt2SGlG9d7UMZFlgHvexTBsDb3UWGxZ73at8ng8+LfbSkojZBcuGH+ZkXUFz4PL9vk8QkDuAs5+yKidrC9wEZcco1AJ0UScpOyiTqTevdGXlakHN1E1hDppYXF07TFN11orr6o+8KG3zouTp/5pmulUuLN+1G0fU1r33pLhX4nDvw5YJAPM3MCDehVJOoGna121Rki2Z7XwQhoAc0UQqRuUUrpoHRRRufYc8WBXCexaIsfme0TOfk2NHYKBDdcpNcXyj5ad6VrJIxA5joxnJsPB29KQgJ4DGTYHENmw8hZI3Yg7Lu/wAQ4/qPUcUyfqskssz4xldIbJbwslXQxSYnMA+3tADWuOp9Aqi2+iWknZVRQtj/AOnOq/8A40n0Qn+KQvyRPBqTiCG0NebUEL5Y9EZ1Poo8J2hGwADVTzEApNHonls0PokANJPKkDRGygBR1BtTFdkw2W3uVWXH5WpB2lV/2TJGXi0CIHXYn1CVbVfyUvkujCYoYZxc2FjyeXBaQq+xPorZBLPKGUdtSeFuRRNjgbGAMoFEELgg6h5vPH8wu2SdrcO6QbDgr0/HjBJyswm5HBi+nWc0HvltVYaKbC4phe0hp0JXb0yZ00T3O/1fRW4yF08eVrso3ut0/wAMZf5IBza6YpMXDGaLhfYLNxzopnh8TvNyKVz8DFEM00p+q4jTZLis0bshY58k2uMkVCK2iMUhieHt3B27qzGTNmeHgUa1CqJzOJI9SAuoNw80RawFko1FnRcsbacUzR/ycj43NY15BynYq5mHJwvjxu1abIHCcrnNw7YZBRB5XPHI5gc0OIBGoCKUX2HbHJK+R2Z7iXHkq98Uf2djmPBfyCVytaXE5QdtaQElJrY6NzBSN8BrS4ZhpVrov1XnGnUVd9wumFmIkIDC73JXbi8ppVRlLH92bbXC+D6Wgev0XNhMP4Qt7i5/JJ2XQu6DclbRixLHx3553yWysfHfnj7gLHyvUvHs2GjLGwA2C3Sly9UH+TOvI+S7TDIzCQzOrJIKaQey4OqOrDV3K0ydYyY+xkFbmD/Kxeyw1uYP8rH/ACrj8T2Ncmi5CEL0TAk1pcyQ0KbrqVEb1yjlCAA6f9kIQgAQOBztuhMiq2244QAjpeiBvqa9UH3RpXNpoCcjWtdTHEjg0ouGgOnsOFEJigdRY3IvdAAhM6k1oLugkgA/ZMuOQN030NKJOidaA3twgAZo4XeXkjhSkyWMmb5pZiAWg+UnWwoIAQ+N/wAlJRb8b77hWFwMbW5ACN3BShivSvqkpMaHE+YN9TykRXIv0TEJCEIAEnfCbUtK5tTY6FuGnEkZMpH3bgdG+6KAjFK5jTlqnNykEKUBayVrnDRpulCLL5c15a4XZg3YVssn2yKQtyHK1jqp3BVQEzc/xP17A9UweGiwuEELo2Brj3K85CzxnhlhtCySVPBMw7sQBi3uZDR1YLPp/RVHK1wdu29Gkq5yc+2TGKj0iLWjOLutwQuiRxe4CcU2twNSqY3hkocANNaK1f8AEfWP+LzxS+BDBkjDMsbaBrlJVQ3sxjua2vS0cIaQDZ9yDygnzWNrulmUQjPl1HO6so6ZrqtFVH8PzVhNnyg9qKURsWy5I/z0i7HfFtXFLjYP8+8Xqs8n0VE7DWX/ALpXZCHCiND3Fo4WhNHH1QVFH7rk6f8Am2fuurqn4cf8y5cB+Zb7WuHL+02j6mwdRufYoSHbhO13bMRHZMuc4NzEmu52SQUAWsmeyB8QrI42QQoEHQ5T3vukpGRzg0EmhoPRUIircNM/DTxysrOw5hoqkikug2e0/wD7A6l2j+iF4ukLX80zP8MDztpJj9Ul8qekCAaQhAFjpMzWggachKwXCifdQQEAXGne/wC6hsVEcboJNlAFrSANtfVBPsq2u1Vm4QABB5UNfmgH3TQjYdPDB4QDQRl1AC4sdOXuc1rj4ZNgALma42bTfbuPkt5ZnJcUQonZgMSzDwODgSSdhwumPqxjJysGoo2suWOSOs4IvUWog+9rSOfJBUg4RfZ0OM2MmJa0n+i62Yf7LhpZH6vIqhwuPDYh0D7B8vIWvI0YjDEWacLBC2wxWS29kTbXX0YI2XaOnufGx7H6O7hcjm5SR25XoYJGnAwMawZm6lwO/wDeqjxsSnJqRWSVLowcWJWuEcpBLdlUI3mMvDSWA0SAurHAyY0tHegtGCIQYM5h5f4tELDzm19A5UinCOwkcIykB5FOJ5Vcs2EMlOaK7gLPnLHSOMYpt7FShwskxto0vcp/lfokHH7Zp4YYZ7vumChqTS6XObGASQBdBcsDo8LJ4LgRf8RXPipjNi2Rt+EGtOV1RmoR72ZuLbNRSYA51OIaOSQlwEl1J9GQu/usfHH/AD59wtkLDxJvGOvfMubyn8TXHs2o7MTBrVbLh6odAOK/qtCHMyKNwBAOxpZ/VgQdbstoA+6rN+oUPYzCtzB/lYv5Vh8Lcwf5WLvlXN4nsXl0XITIOp9Ul6JgWRSNjEgdG15c3KC7j1CHODoQKAcDWnKrQmmAB1AjvuUfshHzSACnYy1Xm73skhACpNA3F7JkDKKPO1bJgJHyQj5oAFOJzWuJcwO4o8qHZCEAuSikBSFd/mjYERv+6lk8jngigaonUq3DsiMn+ZMjY6Jto54/ooGIfZ2yteHWSC0DUe6dBZS0+d6kot+J/dTLS2swINXqN1CGwLTtuewSUo3Oa4Fhp1bhJ2gGp9lSQhtLcurb9QUNbmaTmAoaA8qKCkAzbSNAoP8AhKkdVF/wOpDHolES3I4VYIOoXV1PHS9RxZxEwa15AFMbQFLmaBk1OvACNqIP/ZNPoTXYtUySaQ4k1e1aKbWZwcoN8ikbDRAtLTqPVOJoe6i4NHcpEnY37HhL5IAK1TDTRNH1PZJMnXmuQCkM7Gswv/B43D8yXOsg8Lh5UsLl8niEiO/MQOFKcMEjvBJLL0Lt6VXcUxaIWcwJ172uS/8A1Fx29F1tcWuBFexXG831AnuFhl+i4nZ8W5S7oHKY01WhJwdW+GMetrmwB/zTV0dX1MRPqufA/mmLgy/tN4+prhFWgcpk7LvRgyUkbo6zDUix6puGgeGEM2spOkLgA6yG8FOUFtMzhwqwGna1QgkIc4EAAenCgd/ThMnSr/RIfokAw0vssYaGpoK57sO7BxNbHIMSHEveXeUjjT6pYaOaQS+BflbmfR4TcWTlt1HTdwN1SXQmV5z2CFXl9UIA87SF3Yzp8mFjD3OaWuOhC4w3fdfOzxuDpnapXojSDwpta51BoJPYBJzS0kOsd7Cji9jIphpN19FJmS6dYFbhL4XeU8pUMQ9d0VqpEtNd1EjcpUAISO6EABKYKuwuHEzwC8Adyr8TgjCyw8Fu9grSONtWiXJHKPdAck7Q/wBUR696UDOvE4nxsNE1zBnYfivdd+Gjw5gjNMsjW1iuPCYJ21r0XRjzcXclZLhapG6cDC8Zso9wVaxrWNyt+EbLIwcWIk1a8tj5NrSZK2OYQal1XZK9HDki+6owlFro5uoYQuJkiHuAurCWMPGDd1RB4VhkY3dw9iUmSMeSGEHvS0jCKnyQnJ1RUzDtGIfKaLjsCpYouGFlbZqr3VqjK3PGW666WFfCk6JvsxcG0OlJdWUA78KIdJhX00mt/daeJhhwELGlzJjI0Opp29FlyZnsLqOQHRebOH41X2dEXyL/ABTixkeAHgW0qGFErXl0TASDRvhVsjkczMxpochdGBxDYTIJAQTyUoPk05A110dsT3RROfiCLu67KWFxAna4gEUaorJlkfiJdSbJoBbGHjEULWgcb912YcjnKlozlGl2WBY2MaG401tYW5GzM9oc4NaTWYrG6m0M6lI1pDgDo4cp+UviLFs2YJcuHyOYHAtppJ+H2XD1cB0AdrYO5VuFkEuHYfkVV1L8o75BaSlyxCSqRjrcwf5WL+VYi28H+Ui9lyeJ7GmTRdfF6dkIQvRMAQhHuEAB2GnshTfTnHIDlHB4Q1ocxx08vcooCCK/soCAgA559whA1IaK1PJV80Rw8skUoBlb/pdYTAoQiqA1Fo/8o0A8poOIOUnchIqRe8sawuOUagEqKAJl9xhtCwbvuoNPmF7XqEJFFhRsY/Fwu6fDCyOMP3zAarKDqjLQ46nUA7qCkxrSx5c+iNhW6uU+TElRAAeZ2Yb1XZTdmcMzrI2snZVs+J/6q1jHyBwbZA1OuyzRRbgWtfM3PeQauI4C0f8AEQ6aMb/6UZXYbKNXjW+VkMaTmIcG0L1O6WYka/IraORKNEOPdi/ZH7cJgA3aYaCxxcdeAOVlVlC29+6rk+B3spkaXRA2tRf8BSYxjYfsmRVXY00sJDYeyk5xdWYk0OUIBubWTUEnYArqw2KbAwN8MXepK5Gjc9krvhUpUJosc7xC9xoVsFAOIaQNjuCnJlLvLppVWiSPIaBDvUJMERFnjVBFIF8b7aJ6g6jX1UjEx5dC1pqhdaKWrzxoLKrj+EJ7+yFoB/Rcb/z4002XXS5JPz7PZZZdFQOwbIQx2R4OldikTr89lr9EnH1QXE0jgrkwP5pi0OotzYZ1BZ2C/MxrhzL/ACI2hpmwE+PRAB13010QDoR9V3LRiwc7MboXtQCSYFC+eyiTSYiQVsrGsjYWmy4WQeFVevomdh+yE6GOINvzuLW7EgcLr6uzAN6g9vS5JpMHQp0zacTz/Vckbsp4rYjuiXKXkxghl6BxVX0TXY/uuzkKOncIRYzFxE8k77kcSNwFVvz9VrYLpxMZfNuRoFmSRlj3NduNCvDy45r5S+zqjJaRqdNw5wznyT1o2wQqOp4mCeOmMJduHVstPCFs2DjzAG20b5XH1mFrMKwxtAa12oA2XbLHWH46MlL59mLVAWtODDYVzWPEgrZwJVnT2Yc4MHEZM17nhZ+MjjZMfs7iW8ei41D8ceT7NeXJ0LGRsZM4RkOZehCIWuoljS4Aa0FUHuy5SPWyFbBiXwMe1oFO78LC05dlV0c7iCT2R+yVJsoHzBZjE12U2L9lcHF7SbOnBKbYWOjLg7zcBUhpZep+XKavQDcVbGXMYDl8p5IVJ4Wl0qRjg6KWsnF8KsceToTdI4wC4kgDuUHalo4vDMbG5+HI01IBWaAdD+irJjeN0xRlZpsxLMNhmBpDj2BXHi8QJJxJFYNVqqHD1SLSCDWi0eeTXEFBbOrCx/aH0549SStaKNsTQ1le6xTDUIlY8b0QDsr8Ni3Rgh9u9CV0YMix+xE43o1kKEErZG2NeSOykvSTUlaOfRyvwYkkL5HEjsOFHHRBuDyxjQG6C7UnDM0g86EFZywxadFKTRndNfkglO+XYLixEhlkLiAD2HC0mYYxwSNB8ztgFXBgat0pB7ALjnim4qJqpK7M+OR0bw9tWO4XZFjpnkNawE1Vhcdeah7Uu3p7/Dd940CImi+vhWOFyUqTLno1I8pwvnJ8W9ABoB/dLE6h+dPy0Wri5oohI6J/iRjRrgN1iTSGSYvO5XV5WRcVEyxr7NXpzcuFFkeYk0l1L8o73CtwcRbhweNqvZVdS/KO7aLVdYRbkY/C3MH+Vi9lh8LcwRBwkdf6aK5vF9y8mi5CEL0TAEJkEHUH5pIAsjmfGx7WOIa8U4DkKABOgBvsAl22+fC6J4zhMQWtkjkNfEw2NUwKDlytq8/NpIPqiq4QAuyfc8ptFmv1Te10b8rg5p4Dh/fogCCYQe+m6CgAQmTdbfJJIAH/AGQRrWnujXskmAIQhIZBnxO7WpgkbXR3AO6gw+d/uppIYlPN5ct+tAKCuwohOIj+0l4hvzFg1ATRJXz+qnNKZZC8ta01VNFBQdl8R2QnLelpIv6AYst30GtEqD/gcpcb0k7UEJMY60CONjfdIe6aEH2IFNCExAVayPMwOBoDdUlSa45SAT3pNAG231SJJJJ33spAppDRBnwjVMFTAaA2if8AZRAUrQDAsgfKyuXEtDcfHqD7LoO43XNiPzcZWeXRUNmvhsGHYuGDFSDDh9EveNGg86LmxDGslc1jw5oNBwHxKJc57tSSdrJSvvut21XRHZVidcNIP+lZWC/NR91rT/gP9qWTg/zUWvNWTsuLP7o2hpm5bms8rj5tCFHsrcQWh2WMDLVXW6pXYZF07o3BoiaW6UbO5VThW9fJB0bdj27JVfGnNIbsQ6FA3re1bI4ReyP2SAKv27pnkfqpOe3JlaD3JKrtMAQhCANSNzWut7Q4VVWszH4AYgl7PLJ+67Y52SyCFhBfdBo3U3Nc1xDgQRoQVUoxyLiyE3F2cHS45Io3xyg6HQldc0DZ8PIx/wAPNKd0o/VKGNRjxG5W7MzqTooImxMY3ORVkbLGe47Xa78bDisRiHv8I0uWTBzxNLpGEN915HkKUpdLo68dJFCXCsjjfK8NjBcdhQQ+MxyFjwMwOtLkcXs0sqQVYIy4EgGu55UWtzE7qQItcW/DfstiFuHPTczgDpbiN1kujylGVwBAca7ArTHPg7FKNiIFEi/murBRxyNOeUMIOoXITVgpN3CmMqdsdGtiIYI4yWzG9wL3XE6gAbB9lVqfZSiifKcrNeaVyl+R9IlLjsjm1vjsrCCW3wRou+Hp7X4QZrEne9kpsM5mBadMzN1r/wDNNKxKaOXBtD5mtcaG5JV7cO2aSQQkU3uuI97+i7cMyaPD+LCRR1IARiqXTQS6O/BwuhYQ6id7CvrWuexWbD1FwI8VoruFotkEozNNg62F6eGcGuMTnkmtjIokfJRUikQtiAGp/wB0jumQMo3TYLcBztXdOrHZmvwuXHNLR5Dr7K52Iw+sbiAL1BG66juuLHxxNjc9zRmOxC5Z4/xpyiWpXszpwWPLLtoN1apPxDv6KzKXNc6iQNCVA6PB5XlttuzoXR1tnmhfQuuxC6MXJ4uAc6iNhRXThyJmN0GYabKvqbS3CvBrfVehGDUG76Mr+RjLU6a5zWiN38QzNWWtNmkeDI9rXPg6lZc9Hcn2990FWmYmARUKBuwNV6qo5iDnOlfbtXHTQKNVod+QU46zts0LokBN9B7g12Zt6EhMALi5oB+ForZDDQoAd9QkHFoIBNb0EWTrfqaQBOeTxJC4gD0AUXOsAUAe6igp2AXR/dTle6R5e5xc7uSqz7ppBsSY9kISAXzTS/vVSZTSCQCBqQeUwIlCbvM4mgATsOEkABQPRCDWbS69UgIM+J/upqLfjf7qSSGCEdl0R/Z2YbENmY985yiJwdo3vapCZQCMpFa3dpfv6JKbC6N4e3QjYkJbAik7ZNziXEnc6k91B58p7JMaLY2sLjncW6WCAkBbdPi5N7qO4Vs0Tococ4eYZtCmtCK+P3VhaBCHaZrq7VaRPuhATjbmsGhzaif+yV/VO/RAbLIcPLNfhtLqFmhsoEFpII5o3wtXofWpekicRxxv8VpaQ8XVrPYBiJSJJBG0kuzOGitxjXQk3f8ARSCBXbsujA4duIxAY+VkTSCczjpoqIozJoyrqzZSa4gFtb8qI9VY7sbwA817Clx4r8xCV2FxyZNKu7pceL/Fh05WebtFQOq+2iOEyNtvkiirS6EVzfhP/lWNCcsjHXqDa2Zfwn/yrE5C4/J6aNsfZviiBrp3SO/9VGLWJp9FIDVdcXaMWO9tPf1Tad6NDsUhV6jTspRsMkmVoGvBKpCG8scBlFa6kqJGvp3TcA0aHXskPNev1QwFsUCgfNtyByhCAJWz/S76oSzFCAMbFYjPivGiBYbuwdluYHGePhTJK7zN+Irzbn25xrQmwArYp3MikjGz9/ReTi8hwk2zpljtHdL1B82KY2MlrM1acrbd8B1ANbnheZ6eWMxAfIfKzzV3K6sTjZJ6bmLGk1QO63w+VSbkZzx9pI08HiRO1wNB7TRAO6eMg+0Q+Hmr1WZjIjg543xXqNT3WkzENOEExoCrpdGPLyThMiUa7RLDwMw8TWtGoGpKyesYfJOJW/C/kcFWY7HnEZWwMMbcuV2u/qu90LcRg/DzN2vMfRZycMyeOH0Uri+TMWFr5AGMBJ7DhSxmHdhomZhRduQVvtwowzGCm2Wg207rG69KS9kQ2GvuuefiLHj5S2XHLylSM0uJ3Ptqg2N/dJg1snRWOYSCarTlcFWbERvsCDp7KGWjWqlqBugXdk6ooCbAMhLmEgchaWExWFblAZkceSFDpzqiLZm/dPNAkLmxmGdBNTbyuOhHK64J41ziZv5Ombwo7ajuFVigDh5L2pZUIxkJpjX9wCFoZpHYF5mGV1HRd8M3ONNGLjTMeCMylzW1dWB3Wp0o5oHMINtNUuLpX5wbVR3WuyARSF7QRm4pc/iY7fJF5JfRF+HiJJdGPXRSjY1jSGaeitOtEnU8KB9vmvQ4JO0Y2x1YPb1URt62mf0SO39E6EC68JjPs+ExUH2eGQzgASPHmjo8Lk4tHbRGgaFa5sdGZYQG7g6DuuoVfp2Q5pDQ6jlOxUzjyVDTo5IMPkwzmO3dv6LLnj8LEZL10srd7LI6k7Njia10FBcfkY4xgqNoSbY4sQYJSBq07hTxmLbNh3Ma08alObD5cN4hvNuuJ+jCuWU541xLpPsrWnF5jg29hmWZ31/RaPTQ5zy83la3KCeE8D+VBPRooQgr1TmCrv6oVr8NPHh48Q+N7YJCQx5Gjq3pRlcxz7jaWiq1KqgIJg7jSuT2QN9fnSnkLmFwAAGlkpICD2hpIBDh3HKGOyPDgBbdardLb3SG6YE3EykkAbbAKKLIvU9tErSYaGhNozOAsDXclI82dtNEwJueZGta+qYKFDdQPv6IQfmjsBtdlJ0Go2I2UUzqb59kkAA3/dNwrnTbVK9vdBNnfXdICDPif2tTon27qEfxP/mXRLG6OGFziC14sAFKK6Gyrg680FJj3MzURqK1CihMRdg5hhsQ2V0UcwANseNDY/v6KomyTsDwEkEGv2PdAAoSfA5SUZPw3JMaLAabWlHuEvnqgf0QmBOFoe4ijdXQUBV6j9UzbTyNO6SLEOgSSDQ7JJBCBki4vdbu1bKLrA12r6oTcSRr7D0SYEWfAK37hWRkNJDtjpdKtnwBTIGUG0RfQEXUCct1xoo9XwwgfhHNcXNkbmBIq1a01pQPFnhcvUC64QXktboATspy+rCOzrirNbtr1A5Wh1zE4LEzsd0/CnDRCNrSwuzW4DUrMo7i65PZC0jKkKuyuX8J/ssP+7W9MKid7WsHj0XB5e0bYzbw/wCBH/KrDuqoPwI+9K2tV1Y/VGb2M/omCRZG/CQHlvT2KtxOKfiDF4gaDGwNGVtaBaIkrrLlcao6gWg0dtuw4S7fS0NNG+UWMEwCQTwNz2TbmkIY0ZnO4Ciy2Oo1fY8J0INeyF0+Gf8A3YvqhPiKzzERym69NRuh1an9EzIXNaNKbpogVyNN6K+bs7ghyncgKdl7xW/ACroWSK9lbGyZtSxsJo7gKo9sTOzF4p0sTYpYyHNN2uYyOMLY78gNgKMr5ZHl0u/sqiCFpPJJsUYlodWvOy6sHKDUcz8sQ1AHK4AD3+SuhyPsOcWnjTdLHNxlaCStG4zFwEgNkHssfrNuxrjZy/wrowUEcpcyRjg4chcuNYI8QYw4uA0BPC7M+Sc8fZlBJS6OYfEr553YgMbQ8ooABdrOnxSNDo5Na2K7YMLFCAQ0ZuSeVGLxZy/4VLIkUM6fEYxYOct11WVicO/DvyuGh2I5XpTWlX7rh6kI8Q0xtdUjeDyurP40OHRnDI7KsDNEcM2GSgTuCuHGPdHiMhcSGHyG12jB5sCBJTXNFghZLrc4j9VyZpSjBI0grZqQdQfHIBOK5sBWY/FRnDuDSHFw0AWM1zrp16d0wdT2ULypqND/ABpuy2CTwHl4Avi12s6iGxgOJc/14XEyCSZpcxtgdil4Eg/gPuRuljyZIL4jkovZ1O6hK4igGjjROPHy5hYB7ilRFhZZCBlIHcha2FwMcUReXAv7EaldOJZsj2Zy4ItDi5jTRTqxWl8J5XZDp5b1KKLaJvuCvSr+TAiBqRr2SVjj5aNe4UQxxYXhpyjSwEUFkUifXTgJkWL+iKGW71uqSAshhErZCZA3KLondYPUPzx+Wq2R76LExkvi41z6AFgUB2XN5TXA0x7NWRmfCloAtzaF8LPxWE8HD5y7tYpabPw2GtKXN1L8m73CnLiUo8mOMu6Mc+2q7ocT4MDGMbZqySuH5K4fC32XnRk49o3as6hi5SdGgnsAu3DvkePvGAdiFyYSdjaa5oHZwG60AdKB0Oq9Dx25d2Yz6JvkeWNjc8ljNWtJ0bfZVgJoXWZAj5n2QhFgSZlc6pHEN4ICTc1EgGhuaSpTjt1tz5Wu3sprsCyS8VI90UTWBrbLWnalz0g70NtrHKfCGCEE70H6lJFJaAZ47Ivy1enZCRKYAhSa0ODjYBGwPKigB3pVD3RldlDqNHYkJJlzsgaScoN0TskBXHvJ/MpqDN3/AMymktDYKTI3Pa5zdm6k3soo766JiDn0UnngEkDuouBbVjcIQAFQl+AqahN+E7XXskxkhr7p7Ea/LskNh7JoBjNnU9t0My5hnvLeoBS4Rx6piA1Zr6FLZSLda59EjYNVryEDF+6eUlhPokVIW5tC9tkUIgyvDZR427JlSbG6NjC9pFgEAjdW4rwjJcDCxnAcbKEugsoGq5cdsz3oLsGxsX2XLjrEbDR32I3WeVfFlR2dINAb7bIcrY4JXwiRrC5tWaGyQ+K6BFbErRLoRTLrG72WD3+i9BLWR1dtV5+lxeVtG2I28MPuI/5VZ81CEfcxiuFZXlJv5Lqh6oylsP2Q4UdwfUJWnXNaeqskXz+SD6HVFUTqPcKTWlxoBAwDi05mkgjUEFK71J+ZTc2jqkOdEWLY9UJWhFgYA9KpO/VJoIaTrl7qfgvfh3StBLWmiey+cSb0dpNkLn4d8raLWmiAu7oxkyytZRHAPCt6Nh/8s9xcC2QVQXR0vDHDsfmFOce/C9HB47uMkYTntHPLhJZHGTEvDWAXQGyynuGYhpOW9CVvdaly9ObGGjMXWXDcrCgZ4kzGdyp8vHGM+MR422rZFp4rW1fhoZJZR4QGYa6rTxHTw6Vr4yGnkEbrqiw8cbg5rAHVRICrH4UuXehPMqKZZXYfDZpa8TgAbrAkLs7i+7O9r00kLJHAvbdbArH6lC52NcGjcXpwtvKxPj0Til32cTDKCSxxsa6FaPTcZK6QRzWQdLIXN02QsxDT/CdHAhboYwEkNHuAs/FxyfyTKySWiS4seyF2UySZHcEFdM8jYoi9xoDVeblkfPMXOsknYLp8rMoLiZ4427LnySNc5glLm7Egqg7aLodhXsw/iuBHcFUjfX9F5OTl9nVGisk0QRr3Sbd+vKtNXptwo5aPyWQyUM0kR+7cQN6XY3qUtAODT30XEAm1mZ4BIAJqytYZZx6TJcUzTh6mAQHsA4sLpGJhds8X2tcM3SsRC9rXgDMA4XyCrcP04CjI4k70F6OKebTRjJQO+7Ao+XcUUwdr17ApxtDRlA4qhwokV6HYru7+zEkLqzWUG6JQQ5zsrAddgCq1Nj3scC2wRqCE0xEXWNDxpRUUzZJJ3PKRUsYGvmsPFRmPGEWKzWKW2sjH646tNwuXylcTXHs1WHyNXL1Q1hSK1JAXoep9CxXTMBgsTiQAzExiRhB4XnOq/Awd1plTjj7JhJSl0Za7MGwSSMDgCMutriK2MDGGxMeLst5Xm4YcpnRJ0gb0188rWYYEvcdGgbq6FksQMUwIew1R4XbhGStDp4niN0fmBJr6Lne5z3uc9xc46kk7r1FgjD5I5+bfQkFSYwyEgUKFkkpVxzV6K6JFrvrvoVIscGZ602BQXuLAwnyjYJO9z7J9ALdFmq4QEJIBBMjUfXZIqySR0lF5stFAVsEwIBClHlzjPeXmkPy+Icl5OLQBFL5KxvkOemkHgqBOnr37oASZHlB0snUJEGro+4QgBvGU1YOuhBUSmnldkzUcu1pAVM+J/wDMrFBnxP8A5l3YXGNgwWKgdhopHTUGyOHmZXZEQkzkHr80c7aKcLGveA94Y3eyFDv+iKADrSEcIQAKEurHfRTTDo2xyiRhJIGUg/CbSfYyIQgoCAY0ISTEHz1tTzAHQcUbKj2Q4Ac8IAnFIGZgWB1ihfCi12TNpxoopO0a5DYzT6p1WTqTcMZmRtMMLYmhjasBcGriP2UYGtdlDnBorchdT5ofscUbYamBJdLm+IcClS7VsnXR1RYSBvSnYo4hhmzZBDWoHdYfUw5rG5t7vQrpJPrXC58dXgtv/UozP4FQXZoYGWcBseFc9r5m+GQDvfCqxUMmGnfDM3LIw0QlG9wYwRk0BYrhQe4vc5znFzidyU0/iJ7BzHOje5rSWgUSBssDuvQiR8cMkbXuDJB5gDuvPH+q4/L+jbF9m5AaiaK/hCne+3uoRfht/lClXqV0w0ZvYE5jakNWb7a13XZ0bpsnVOoxYSFzWvkdQLjoujr3SHdIn8GZ4c8Eg5eFsoNrkZuSujL+I8DXldUGGMrCIiC9upJPZcik15aCATrvXKmLX2UL0I+aQPFD5oR2SAKQi0IAx48NO/Dl7Rce+vK7ugvY5s8EmoOoB5VvTpGjpT9bLQQQsjDSmHENkaTobocryEo4eM0dF8rR3PMnS8US0ZoHcFdsHUmPIEjSwHY0qJsdBiYZBKD2aFn4XEmHyOAfFd0Vt+f8cvi+iVDku0aXW5A6GPKQRm3BXJ0pgOI8R7g1rO5XLJIZCRZyg2ATso8b+4WGTPyycy4wqNHphPEdpG+wKsjPiODYyHE9ivMwQumka1p1JrVbOGwRw7w4SH1B5XoYPJlk+jGcFH7O57Sx7mOAtpogFRc1riDQzVVlc/2wOxIijBceSCukbjuutOM9GVNGHBE6DqQjIBB2scLaKi+JrpWyV5gNCpn/ALUssWL8dlSlZy4zDuxDQ3PlZ2ARhcDDh/MG5j3JXTwhW8UW+TFydUPEwjWORoFjUWvPY7DnDy1/C7UFegJvXlZ/UMNJiJYwygwbklYeViU49LsvHKmZDWlwdQJoWaSsOpbIwrcPhJdbcWmysWJji1zqOUFeXlwPHVnRGdl7cO90XigVHeWz3ShiMs3htIu90mPc2Ix5jkOtWujpkYdiCSac02B3U44KUkhyfRq4Zr2xtEzi4gUTfCte4ZneHYbtRS767cEJSyAkudTfmveiuMaOPZNujcwcMw2CgbdeuvKLvUEUpEAtND3IKexED8IFe5VkMphdnAB4ohQBoa6pcA60gYNdT8xaCLuimGOmlyxNJcTsOVEFEb3RyNfGS17TYIKAIkEGiCCNCCNlj4/THH5Lbme+WR8kjsznHUk7rEx/5700XL5XqaY9m9LjZ8RhoYppHPZG3K0E7BZPVQcjDxdLshcHRsIOmy5+pi8I48g6J5XyxhFVIxzstzB64WP+VYZ2W5g/ysX8q5PF9jTJouOo3O90hCeU5c3F7r0bMBLpwMz45iYwLc0tNtugVzfupxyOj1jJa+twdk4umDDKKJBFA7KU0kb4YWMhDHsBDng/Gqige6GxUCEaUdPYpJUMaSOFcYZIoo5ZIyI5AchI3pNICoc6IHurGOdG11D4hRsKtDVASaG5XWSDwAFFCSALoZ3QxysaARIKJI2VNoTNU3SjXKbYCTs0BZrcBJCkBRluSSwS/NobTUWHVw/6lJJaGGmU663QCE2nKQaBI4PKcr/EkLqDSeANkxEUIQgAUJPh+amoSajdJ6H9kuNkK2d8b2xiOMMLW6kH4lWnQXYIRv8A7odoaBsd0CBBOiHCiK7bhWYYQnExjFF7YL85YLNeiBlST/gd7KycM8aTwXExZjlLhqRx/RVu+E+yTBDaPI3RNIbKTa5QgZa/EPlihjfWSMU2hta4seD9nJ0rMuolvifCWxk7Arm6gGmJxjJy5tAUsvcWEdlsALo42giyKslNwymtNDrRSwsZfhw4EU1t6ndARH1QPYnbHXhYR3IW+9oA0PpSwT8Z91y+V9GuM24vw2+ykEmaMaPkpBdUNGbLIZZIJGyREtcNiOFbisbNjDeIdmPcqhznOAs6cBWf5f7Hf3n2nN/8cq1Unoho5xvXCuMeVpcdW7bqr/ypOcXklxJPcqU0MQQgamr+ZTo5qGp4SAWvqhT8N/ZCdMLMBkkkTXNjccrhqO6rGisaddVC/Ma2XzdvR20CYGa6vbhJbXSIYXQF2jnk0QVphx/llxJlLirOHAMhlkLJiQSKaQU+oYM4YhzXEsOlnhR6lh/s2I8l5XaiuFUMQ8+WS3su6JWzSgnjkuybb7QYeQxytcLsHhduPxxljDI7A7rkxDGxNblPxi6vZUCUteHUDR27qY5JY7imNpPs2+k4cxxmR48ztgRsFo15QdL2pYLOqygiwK7BbuExbJcO90bWEPbVkahet4uTG1xic2SL2xOQ3+ym3U6/qlS6jMD7ptbmuiNBrruoqTB5XOzAFvB5QHZEj/bRBrL/AFVkcnlMclmMmzQ1VRRQFOLBdhpAORVLnGF/9PMYADq19V3PDcjaJvkEbKmVshYfCcA7tSxyY03bLUqMyXAvbEHNHFkLl8YxvYW6Fp0IXXL9uotNkdwN1w+G/OQQcw4rZeTlXF3FHTB3s2zjofsgdR8Qm91ntdLjJQ0k1ewXKrYJnRElh519VT8lzaUtC/HWjbY0NYGjYaaqWl63VbhcLMe0tAcwg8kcq5uKicPiPsQvShmg10zBwZ0taXOyMrzaC1B1jQ78hJj2vNsJ90yFsnZIggpg62EjzqkAEeUG9e3ZY2P/AD7vktgLHx5rGnTsuXyvQ1xbOzpx+6eOztE+p/k3+4T6cysOXEfEbFpdT/Jv+SI/pB+xjHYrcwn5WL+VYh2K3MLX2OEg2cuoXN4nsXk0dL4XtiZI6sryQCD2VZ2ri0IXomAqT0yoQgACAhSY4NcCWgnsUwIlShf4cgdlDvRw3UsRGYpS1xaTvbToohg8IvzgOusp3KddgDA0up5LW9wFITPeI45JHOjjNNaTo1Va/JSjaHPANDiyU06Eelxb+in/AAzhmwMmHVg8mV5PkLeK/vuvOiPNHI8EeXcXuujpc2Fhx7D1CN82GF2xrqvt/RcsoyyODbAvQE7LWeRSRMY0wjY6R7WMBLjsAokEEgjbf0Ta4tJrfgqNrAsF1TiCV0X2ZpblYPED3buXKm00QSL11CaYA6i7QAegSaCTQ3UnkOkJa3K29AFEaUbPuEmBBm79P4qKmos3f7qSlDYDU1+6sieYJw4AOc3WiLBVdXsNUVR1v1VCAm3E0LOtAIQdya04Ta0u2Gw5SASidR81JI7JPQycbmte0ubmaOLVuJnE2WomsyivKN1QUKk6VBQiik0c3XySCwqq7oKnPIZXh2UDigFBAhFLh3ZNJx7dkmBYQAwHnsok7aDTakDUBLlMY9z5r2S6m+N2Fb4cWQACze5UnOs2qMZ5sMd67HhTJ/FgtoeG/AZ9FbR2pU4X8BnsumGN8jqjaXHs0Ix9xQ5dMq1F66rDP4nzW89pomjpzWywh+KNOVzeUqovGbY2FbK5jWui0BD7sknSlVdtaK1rVTaRlc06HgrqgZsflEI0Oe97Vakxwa1wLQSRoSdkjWlX802JBwd/dCWvfRNADAF/spQyGKZr8odl4cFApnf19E0B0/bD/wC1F/8Aqhc2qE+cieJgh2XcKrN5r+auZG+Q0wFxrYKbsJKG25hAHJXzag3o7rKWtL6DQcx4HKuwzpcPiQNWu5BSij8jnh4a9ptotGImfMWvc7zDkK4/HsNmr1bFRyYWOGSIslb5g+vitYrTqrsTipJ2MEoHlFWBuucEK8+T8krFCPFFjj6muLUTttr7IB2/orcNM2Cdr3MDwNwQso9sd0Rw5iEoE15TyOF6DAxwxR1A6wdd1zvweHxY8WOmWNA0LlxOFxXR8YGTeV2hoHcFejiTwfJq0YyfPo2pHtY0ue4BvJKy8R1F8zxBBo1xsmt1xY3FvxDtSQzgAq/pkbI/v5XAVsCVpLyXklxjolY6Vs2QKaNdVMR3EX5m6GqJ1KqieJIg9t0e6m2swzHT0XoxqjERBB52Rl8t2PZDnDORZ0GxSQAaZebQDrsitAkgA/8AK4uoSeC3MxozOOpK7a0J+VrL6wfPGLNVsufyXWNsuC+RwtGd4HJU5IzFKWP3G4C6un4QuLZXVQ2BG6lj8O8zOka0ltXovMXjvhzo3590ThwcT2ZmuJvUFXR4WOOj8XFlcnTpwwmN5oHYlaVjuF3YI45RujKbaYNa1o0oHegE25bBcDV8KI/ThMLqRnsied6SVlhz257I5A7IkDDK7wrEd6Bx1ARsLK1jY/8AOn5BbSxsf+ePyXL5Pqa4tmtHQjaBtWi5up/k3fJdhe1zWljQ0ZdgVydS/Jv0G43Vy/WSvYxVsdOlzwNZywarHGy04Pu/sr27vGUjuuDx21KzafaNJxblFAg97SjYZHhorfclJHtfyXqHOBFEjm60SQmwgOsgHuDygCKd7aajsjn07Kcxjz3ECGVs4phZAuJNk+tkI7pJoASYSTQAKTo3BjXkHKdATyo7EGtbV0s75pQ54FdmjZNAVOaWmjV+hUVOTLmOQnLvRUCkwBCuOFm+yDFeGfAL/Dz8ZuypQBKKR0bszazeoURuL3tCdVyNuEg0QZz/ADKSgzn3Kkkhjq6/cIGxuya0Uy0tY1w1B0NJPaG5acDYsgcKqEAd93loVuCogEuoeyEfNIDqbDh/+HPkdMRi2vy+HW7e9rjdx9FJRfx70iT6BIkhFG6F3wByjb04IKABSaWi8zbNUNVFM1lbV3zaEAkI4/ZCAD5KL/gPalIE0e3ZRefIfbRIZJm3FUn/AAjbt7pHjhA5QAA+3ZVYoH7K81orFXitcO8apS9WNbDC/l2nilr9H6piOk4kYjCOYJMpaczQdD7rIwdfY2nN5r1FbK4GtR7IxOkmKStkpJzb3EDzWSByvPA28GubpbjwTHIQNGtJPosFu491y+W7aNcSo3uNlKkhWi2en9KixXScZi3YuKKTDgERuOr77Lsxxcl0ZSdbMdJSy+aiQPUpO0Nb+qGgsEBuY6fIKTcmQ2Dn4IKiNKrfuEAIijX1CZJOtDtoEr3T9dKvYoEWZWf6/wBELq/4iP8A8XD/AP6oVdCtnlY5XRvzRktPcK2SabFPa1xJJ2AWw7pbHYBge5rJALsLEfG6KRxhJeGH4gNl4ksU8aX8M61JSJS4WaJhc9hDdiVTdr0sAGM6cDJYzCrI5XnsTh5IHU9pq96Tz+PwSlHQoTvplbtRXCqcOArD7qHxLjNCUTg14JFgakd13S4qCVjg3D+YjQhcbA1wrnsmCTsK9CtITcUJqxh8sWgJHNAq7FY2TFNY2bdnJVBvkm/VV13TWSVV9BSJDW1dhmCXERxk0HGt1SPZBJa4FvxA2CERlTBnqWMEcYa3ZuwQe2l+6ysJ1ZzQWziwd3AKXUMQ64p8O4EAVYK9peTDhaOX8bsujxb8R1N4cbDWZBQ7f2VbisXHAPM4ZuACsBsz2OLmEgnQkIja+eQCyXHck7Lkj5jqls0/EbPT55Z3Pe8UzgUu1VwMEcTWNrQcKxehiTUe32Yy2Hz07Kp8LHva5wBLdBatSO6tpPZK6ACttuwCXBUg6tqvuhot1WPcp0qoDgxGGja/O5vkdvR2V0MDYxo4kb6lXvjDoyHVW1FckMjo3GKarAtp7hc/GMJWXbZ0vcGtt1ItcJk8SVrpCfDB2C645oXPp8mUVYJCcc0W6BxJjc6oPP7qDZYzs4eynmsabHlaqSeiSIGu+qx8f+fPuFshY2P/ADx+S5fJ9TXHs1o/gaufqh/yb/kuiP4Grn6nrg3acjQLSf6yV7GKtNnmbg2/NZq0cB95LGf4Y2UvOwe1G89GgpM33obXWytxGEmw8cEkzMrJmZ4ze4VI/SuF6qOYJKDiA4EXuAkkmmAKRjfkzZTXchRG/cdl9A6j1/8Aw9J//H+H6fh8Fl6s2sz629bVRSezPJJxqkfPlIVrfypADnEBoJ5oJD5+wU6NLLIY2vbJnlDC1tgEb+irTYx0j2sY23uNABdXUHS+IyHEQshfC3IQ1tfVOug+zkQhCQAgoS3CAGHOLMmYkXeW0tk2nKbG6XJQAIKEfJIZBnPuppMIy1WuY2U0kDGHGqs1vSimDTgTtey62YmJuDnhOGY6SQgtkJ1ZXZWlYjmacrjYB0qjwooQpAbKvzXVcKD/AOH3UlF/Huk9DRY0ljg5p1GthRJLjZJJPKChMAHqE2OyPuge4SGpo0B3KZADqu+LHKF/IuhHUkgCuAEd1MxkRh9Cid73UAa+lIGIpSfAVJoL3U3U9lF+jD3SYD4COyBsPbVHZAEmvy3oNdNQqcR+DJzpauL3GNrNMo1Gipm/BffZKfqC2LAsP2PxMwrNVWrifVc+C0w3rmKv3CnH6octlWLeWYaWiRYo1ysVv/da3UPyzvellVqFx+S/kjXHo3W7BWNcQKs+w5VbNh7KbmuYac0tO9ELvhaRiyUjml+gOXbUqLy0uOW69VJ7i5rAQNBVgbqCpsS6Emg1SdgsAy+a7JtKrGRCdeqONgmxpe4NbudkUBFCn4bv7KEUxGLHipshjc55YTZAOy68DjIMOwsc0+bc0tIMwuFYc2VvoVyS/YJwTbWuurC85YZY3bl2bck/ovOMYYR9nI01y2s3HdQdiG+EGBo3s8qyTpZrNh3h3zWfIx0byHghw4KjPkypUxwjGyt9tJBUWmk32XWRr3S7aLgNiYLbFE33Q53msHX0UQ0nZuitlwz4WMc+qfqK4VKLYCz5tSBdUke/6FR2QT9OykDsw+DlmjL6yitL5UI2xFsjXg+JwVq9KllxEZzgCNmgAG6yupN8PGvLa3vThds8UY41NGSk3KmEEbPBMj9crtQVRK4FzvDDms7Eqx0vikA0xvIA3VnUYWQuj8M6Fu97rLcei1vs4wfUqTCRsSPZShb4g8MAXuD3Tw8nhyBzgCBuCN1EUOyyOeSN1h5vfdbWDxbZ46cQ2QbglckuAZPlkw5Aa7WldF09sbg4SGx6L0MEMsX1oxm4tHcgo4GqCPZekc4uf60rMkJwpJe7xs1ZQNKVZVGIxLIWnzAu2ASclFWwqzmxYfEMwlNcAlcb5HvAzOJra+FcGy4uS8vFX2VT25Xubd0vJzSbdrR0xqiIkI0JXbFAyQB3iWK2HC4nD990Aua62kj2KzhJJ9obVmrFh42G8oOlEkq4OOTJpkBuqXNgcQyUObKSJAPLQ3XVJG9kbHOaQ1/wkjdeti4uNxMJXfZALGx/576LYWPjx/n/AKLDyfUrHs2IW5mtFgGqslcvUxWEeL5Gy6Yz90AubqX5N3uFpP8AWJexjLX6bHkwwdy7UlY63MGP8pD7Lh8VXM2yPovJJAsmgNr2SQhekcwIQpPLSfI0gdiUxkVdNBJE1jpGFrZBmYe4VKkXuc2nEkN0AJQmgYg4tILbB2BBVkM74X5o6B1Fkd1UEIsBtcWuDmmiNQQdlOV7pS6SVxfI42SSq0J2AgmBuhCkARuEFCYCUnty1RvTjhONrDmzuINWABunhxG7ERtmeWRFwD3AXQ9kwK1c9sP2eIsc/wAazmBGnpSljIoY5XfZ5fFjLjlJFEj1CoIOl3XBpFULZXHz77q1rWmNxLqcNhSqi2PuuhrIzh3PMh8UOoMrjvf0UwKZWwgPBeLF6gFDqzEjQXYHZaT+kyf8Bb1XxsP4Jm8ERiT7y6u67LMTfQh0d653QQAdK9wlr307IS2AVoTXooP/AIfdT1rY168qLq090PQ0SQrIWFzi4UQ0ZiCd10Y77O+Vj8N8JYC9gHwFUo9WTZx0j5Lu6dNhYpZHY2AzsMZa1odlpx2PyXI+jsOK0RVIdikLTl8OwK1spMbncBp7lJXRHwJGP0PIsJLsGRlhfCfMxwNbEKl9ZPXleg/xX/iGb/EOLjxE8MMLmRNiqJuUGuV59/w+iJpLQo29j4FJpDYIBtSUBUZPwnj0UvnqlKQYSABtulLTGijA6w//ACXQVzYD8J3uurhRi9UOWzk6if8ALgD/AFBZr/LKR67LS6jpA0UNXDVZs/4r/dcfke5rj0bbPhabV+ImfiJA6SQvdlAs8UqIxcbe9KRoaUduV6EH8TB7BHCQ2/3TQAqV0cngnNHWYijYVNpppgw3JQEDS0IALQhCAMbG4h2Inc42Owtc+p0F/JWAAk2ONFZhJBBO1zgC29QQvn+TnK5HXVLo0sNim4XCeG8HxWjQHm1nSskkD55GkAncq3qMjX4oSwkEUNK2XdjZY5elh2moGg7rsb/InG9GXr3RjAkCgNOaCbcpcA0DsCV2dGjEmJOYAgNNgrpxXSszy6F2XuCsoePKceSLc0nTM6WGYNBcwht6EcqMvjeVkt1/CHLWw+HxWFcBYkj3o8KvH4ObEzGRlaCg0laPx2l0T+Ts48V0+bDxNe8AtPAKphj8SdkcdZnGtSrsViMTRhndtpQK5WXm0NHewsMnBPpFxtrs2GYtuEw5hoeKzgclY0shkkLnHzHUpkE2XEk9yd1AA9k8mZzSj9BGNdk2AEgOJAJ1JSlouoEkDYkpG9AduEqWVlF2Cc1mLjc/RoOpWhLg4sS5z8O8X2HKzcPF40rWFwGY0CVvYbCw4U01wc4aEg7rt8WPNNNdGWR12cnThLhpjFMDkOuy1FIkOBsA6chEZ8NwNB1cHlenix/jVHPKXLsinuUONm9O9DhJakiKi+NjtSwE9yFI7pgGiaOmpIGyTVgADWu8o0ralk46PLijX8WoC1P91VJC2SRryNWlY5sfONIuMqZn4uLw4o+/JRgYmSmQPu+NV19QbcF9tVV0xll7uNrXI8SWVI0UviVyYV0Ts8ZJrjstCJ7pY4xZPYE7JoaMoBHHbhdkMSg+jNysMuUkHTXYrFx/54+4Wzv376rGx3589tFh5XqVj2azPw2rn6mP8k8+oFd10t+Bq4+qmoGt7lXkf+MS9jIW5g/ykWumVYa3MF+Vj9lyeL7GuTRe5padQRpyElJ73PIzEuoVZOyc0ZiflcRtuCvRowIIQhIAQpMeWEEAE+oUSjQAhMVrpr37JJgCEIQAfNCEIAFa4R+C0g+e9R2VSSE6Ak9wcbAAFVQUQhAQAFNxJrU1xaQNHbW7opk2boV2CQEY/KCTrqdCpsflzUB5tNQoR/BvrdBTcG0MpJO50RHQ2Ba7ICfhPqop/wANVr3tR5QxDUoy1pJcCW1sClppQ19VdjcScVL4jo42U0NpjaGiaAs6lj3498TpI42GNgjAjbVgLif/AA+6undG94MLCxtAEE3r/dql/wDD7pTHEkE9jvzqEkIsR0YPCyY3EOjgDc1F9OdWgXP3RdG7TccxsAAbUE3VAJNwo7g86FII/ZICcLWvfTnhg7kKqT4SplvkzaV27qtw8hQ30NExsplgEbXBwN7gFRa3N/EO+pU8OYxPH44f4OYZg061zSaQEGOLXWK2rUKEjswJrjhX4rwfHkOGziG/IHnUD1TGKcMA7C5WZC7NmLfNt3Sf8CRn4D4H+66SuXAfA/3XUssXqXLZydS/Ab/OFnYj8V/8y0ep/gx9s6zpx98/3XH5Hsa49G3Cfu268Wm5xc6z9UojUbNtkxou+PqYPZINNe2tFdGNwcuDMYmq3sD25TehXNZ/pqguJq77CyrTQhfPRSdlvy3XcqP7ISGBTa6iNjrsUigIEWeJ/wBLfohQQgDCBqtdEFQa43qDXqFIjkb7r5s7SThlbr9FDNpV6dkjbiSTr6pN1doeLTQF4bLhxHLRbZsHuvRYScYiBr9LqiAdl52TFSSRNjkIIbtY2V2BxX2WXMSSwiiAu3x86xS/oynDkjV6riHQwAxvDXXoO64XYjE4bDMkLmuEmuu64sVM7ES+I8D0AU2OdjMTHG8mvhAA2V5PI5zfEUcfFdiwkbsXigHnU6knlRxmHdhpi1176Ecru6hh3dPlw8sV0RuSu5zIuoYVrv1HBRHx+VwfsDyV39GLBh3zxPe0WGDYKjXsvR9JwzcM1zJycpO4G6yeqQeDiiGDyPNiuVOXxuEFIqOS3Rw8rpwuDfiWEsc3TgndUSRuicBI0g9itGHBTsDJcPINRtayw43KVNFSlSM+aGTDvDXgg9+6nBNLG+2Elx7havVoXPwbXurOw60uLAtf4JkjAcWmiKW0sLhk4ohTtWdED8dJs0Nb3I2WhExzG+Zxc7eyuLF9Ra2ICE/eHQ2Nlxf8RnseYfRdSzQxPt2Z8HI3ULPwnUA8VMADehA3WgDYsbLsx5FkVoylFx2BCkyR7Y3tbeV3xABRKbXOaDlvXSu6sRE7evdJNIpARcwSDI46OG54SjiELcrTdHdTAJ0F32S/dKlsdi7qUbwx4Lmh4B1a4pFR5KAA7mhp2HCyMeC3H+YEbUCFrD9FkdQcX4+ySaoWVy+V6mmPZrD8Nvsof4hw0cOEwU0c7ZTM0lzBuwjupt+ALj6q28OHdjRKrJ+pij7GSVt4P8pH/KsQrbwf5SP+Vcni+xtl0dLC0NfmBOlCjsoFNJejZzghCEgBCFLL5M1itqtPYaIoUnNLTrV76FRQArTTDqaRpXdJAAhHCEAM1Qo68hJIeu3ZSa0udQ3PCAIo2U3Ny8i7ojsoFADo1eva6QWkODTYN6gq2PEOaxsbhmiDs5ae6ibllBzG3GrJToCtsbmwiQjyOcQDfZDjsdPkpOhkhyiRpF2QL9UibrYKV0gIg/VSDfLmNVtQKXITcC0kaX6FMBEUhCEgEk7+H3U2Nc91NBJ7BSlw8rIIp3MIhkcWtceSEmuhov6bh4sVjGxYjENw7CDcjhouZ7Q1zgCHAHQjlDqNUANKscpKvoVFgw8pwzpw0+C12Uu7FVlSYHuGRpPmN5bRGNSDXuTsigXRGtN/YJIpP+ykAbkfSlF4oHTXainrd3zaMzQc0gLm3qAUnoZJrS7YWd03MNWAe1lSlcwzvdC0sjJtoJ2C75eoiTpUODEEbXMcXeIB5irilRLbM0DMQNO92onn24QU2eVwLmki9jypfZSOPA6eIPVdS5cERmkHGbRaMTJcZNHFCzNIRlAaFlhXQ5bM3qX4Lf5ws+f8Z/va0+qMc2EA2CH0R2WZiPx5Ned1yeSqkbY+0bcQHhMPNbI5UYvwmeysDXOBIBIGpIC7oeqMWJCZO5AHsrsXA3DuYGSslDmh1t/hvhVRNlC6HRxMhge2YPkdedlfB2VLmljgHDi6RqMpI31BTXQPs1OoQYBvT8G/CzPfingmZjm0G9qWVVKRdY5ASaRevsnJpgkR17oToIUgcuLhid0uN7KzMqyOe6ywh2YDLmNdrUX2a9NNF8/kmp10dcVQigb2PqjUbg1tZCWUgXlPoaUpNlFscMsrvKwk9wE3tOrS3KW8LXwk0vh+HHCGUy7JWQ8vtz3gguJskLoyYlGKaIjK2Vj4a/XsuvpskcMwkk+QA2XMwAuon0BC7D0ycO8pBbwbUYoyu4jlX2dvWqfhY3+u65+l4xmFw+JEgLi5v3Y7O/u1x4o4hh8OYk0bAJVFkjf5LfLnf5OaIjBcaOl+LxE1Nzk66ALTwuCeAx2JJL2mwDwsbDuyTxusAA3rwvRCYhmeZ4II0IO618RqbbmTk+Ojn6vhnTxtfGPM3SgF04NpZhYmvGoG3Zck/VY22I2lx7quLqM2IkDY4hfpwur8mKOTkn2Z8ZNUauNaJoJMjaBbsTusnoQLRMDdgjRasRdlGageQOFCKGOJ0r23nedqW84c5KRKdJow+qQmPEk15Ha2FTh3sjcDLHnadF6DFQCeJzHN31BrZcLMC52EETyAQ7Na48vjS53E1jk6pl+BGHliDmRga7EbLrcKOn1WZhon4PFhh1ifoCtJdeD1prsznsCkdt0zsNEFbECQhSyO8ISGst1dooAjkdESWEairIVakKo2NeKS3QGzUn6PJD0yLGOcMkototZKuOImdEI3PJYNgTsqibAFDTnunJr6FG/sisPEG8a/+Zbv9gLFxrcuPcOcwNdlxeX6m+N9ms34Grn6l+Tf7hdmGax5aJHZBl3rb+9FR1mQSYQ0xrQ0AEjlayX+NshexgLcwX5WL2WIVt4I3hY+1Va4PF9jfLouQr8Vhn4Z0bZHMOdoeMrr0KoXpNUc4ITNcaaUUkgBCEJgHzQhCABCEIAFLMPDLcozXv2UVdgsNJjMXDhoK8WV2VoJoWUIGV5czSWgeXU2d0FxIaBoRoCAp4uCTC4mTDzACSNxa4NN6hX9MxsuAmfLC2N7nMcyntzCiqoX1aOWQMa1ha8uJHmFbKCbgQ4g1fNJAHse+iljRJmW/NeX0UmPa1jmloN7EnZVoCLATLdGSXE6kAEpjbdQiHl+ampWhgpyRlgaSR5hYoqCABepKYg53od1KmgHUl16UooHKLAvfG4YePEmSPzuLcjXeYV3CpxMmZ0YGYMDtGk7KcWHlljkkjjLmR6ucBsjC4V+NxmHw8RaHvdQLjQ2Td0CKzvpshSlYY5HMcRma6iQVCwkwGPS77hABNkDbdHHK1v8LvwLOrwnqgP2XN5gAqiuToJOlZknRIL1H+Pj0Z3Vr6Df2fKNxsV5uOIyOqw0gXqU5xp0TCXJWQSnrw7aDlvc8p91GZ7vs5Zeg2HZZvRZMNBbmLh7Ia4hpAqjpqEECidO1JA+21apgIrZ6v1v/iXSen4H7Hh4Tg2lviRtp0l91kNaZHtZG0ucdAANym+N8Ur2SMLXt0II2TTaJpPZw4PSSQVyu2N7o3B0bi141BB2XFhfzEvfddSwxaNJdlHUAXYV5s97JWTIczifZbc4zQubWpBWH377Lm8rZpjNyAExNrtZVrJHtY4NcQHbgHdQhcHQxU3KMovVTky5neHeXgkLtx+qMXsQ90E+iQ2UnNpoNjXgKgBpH8Vk8G0nEmr9gOyBt690A0QfmgQIUi7NZIFnsoBADQhCQGC3U/NScdDW/ZNjdbN9xpuovBLiRva+cO0vw07fDdFMwOaeQNQu3D4lkb2YfEMaG15XELHa5zHhwGoPPK0+oRnFRxzxU6m+YDhdmCTq19GckrO3qhdGxk8JHl0NLPxuKixGEja0ZZAbIAXO/GSHDNhJGXeyua9d1WbyOT6FCFbLGAucGtuzoAF6B+Gmdh4mtlLXNGqwI5HMILKBG2ivZj8Qx5Ocm+Cp8fJHHfIqcW9CxYk8TLI4ucDVquaB8BAkBBOtqyFr8TOGs+MmySt3FYQYmAMd8Y2cArx4HnuSJlPhSPMnnRWPle6NjHONN2C6MfgjhAyzZIuwuQgiieRosJRljdMtNSBgvn0srfwMcWHhDg4EnUuJWBW1A+6lmdlqzXa1eDKsbtoUo8ujbm6lA15AJd6gKkdUzPpsZLeKKzIAwyN8S8t6kcL0EEETGAxgVvdbrvw5cmZ9OjGUVAsjeXsDnAtPYqSkVBehVGBdHGMREY3vjY1nnBcNz2VCl89EuyAEhCBt3SGSflIaMpa7myoOGWgKI3sKUjnPOZ3tdKBTESBLDfcWLCi3VwBoDazwgk6WSe18JV6fOkhjkAa8hpDhsCAoppfMqQR04B7IcQ2WUuaWedgDbsjYf32WH1zEOxXWJsRIGte9wcQ0UAtTMXVmJoCgsXqIvHEa8Uufy38KNcS+Rqs+Fq5upflH+4V0Di6FhIPY2qupH/KP+Sb/AFiXsY3G61OmPIZ4bvdtrLWnF5WYM1rsSvPwdSs3no7kIKk9obVEHTWuF6q7ObQRBrnAPNCt62UTvX0KEIsDq6YMIcW0Y/xPBLSLYdb4/oueRoZI5ocHUdwURM8SRrba0HSydlsN6d03/wCmJscepD/ibMQIm4MN+Jn+q1X0J7MVCEKRghCDwgB6UdTfZIEggiwRyCjspNLQ1wLbPBvZCAjmJsnUnUklNr3MsNPxaEIcbddADagkUADjt+p7Lqx0mFdJGcC2RjfDAeHnd3PyXMHEBwAGo7bKTQ10eX+O9CeE0xFZQm4ZSRYJGlhSYxrmuLnBpbqARukMqj+H5qQ30OqlCWHDFgjJlzkhwPHso8lJLoZOTLTSDrWuighSIyhpDgTuQBsmIipZz4eShV3dJDV3m0F6mkuwH6pASZK9jHtY8hr9HAHdVPJa6Miwc24Kse0sdldVjeiq37x+6TfQ0XiPMWG8xJ1A3RLkZiHeG05Rw5VglpBBN7gg7IOps2TuSeVViomZHeEGUMt5tAoISSsB8jX6pnNubqt0hum+wACdOAOEwIlXDCulwWInDmBsWUEE6mzwqUpDUZHBNUl19jJEa7/NRaC40N+y7cFhhIQ7EPMMDrHilpIscft9VyuFEEXXdPj1YrsQLonhzSWuabBB2Vjp5C+R7nFz5PiJOqqJ12TFVre2nqlYHJhvzEi6Vywfm5RwuvuscemWwWJiGZJntHfRbax8d+Zkv5eiy8r1Kx7NXD0MPHsfKPkrAa51VWFF4dldlZsSL1W8PVES2Djom06Hb3QKrUG/RDWlwOXgKySTAC1xsaCyCUjRAI3UR7GuVPKPCL8w0NZTuUwIEpg3pXogf+EV6oAs8OT/AEIUc3ohHQGKw5mcX27JFpLtFVDZfQ9irHPq9vcL5ymdo2w5yTI8NrkqeFnki8VsLQ9ta2iPDTSMzBpynkldOFwjG4eVz5QHlpFA7roxQl9ENozYojNIGgizrqUpoXwPySAg+yY8pBF2DYIW71PDnEYKORgt7RmJ7qseH8kX/KCUuLRhRNc45Wgu9gu6CKKPDzDFNLX/AMNhU9Om8HFAmsp0NrR6xLHJhwGOB82oCrFjjxcnsUpO6ObpGIbDNkkAp+zl6bDeEWSNlD3PI8gaOV4rbve4pemweLEWHhmc8NIF2V2eBmr4syzwvtFPWoc+EuneKx2oI2Cw5Gn7PC7va3I8acfipRVtOpcQufGYQt6e0NHmjN6I8jGsrc4BCXHplXT8M3FYJ4duHUCOFwmAjEiFx1zVa1+iCsITW7rCnicHnxUcza01IU//ADc8UZLY+dSaMXEwOw8hY4H0PdbHSpQ7DhoOreCr8Zh24iLLQzcFZGH8TCYtoeCNcpCaxvx8l/Qcuao3ib1S0Qf0SXpbOcft9VFNJACQUzukgASIpNL90DA/NBcS1rT8I29EJEV3UgI/qg1QooJrhIHQjT37IABz7LGx/wCf+i2mnKeNqohY3UPz/wBFy+V6GuLZowfA4aaO2VXUvyjvkpYT4pv5lHqX5R3uEf8AkH+xjUtRmV0eCYLzalZZ2Wn0uN0maUg5WCgVw4PajaejuQjn1Wh0rEw9N6lDiMVhYsZE0W6GQ+V1/wB/ovWSOZnARXPG6k9oa1pDgS7WhwiZwklc9rAxriSGg6NUEACEKcpj8vh3eXzWdylQEE2mr2101SQEACbQHOAJA9SkgWbAvvQQBMluQACiNze6gnsASNPTldeMbg/tf+VfKcNlBJc3XNWqaVis5G0HAkAjte6lKWukcY25WnWr2UP3Qj+hjNixSimbBNjnYqRY7K1xBDTsSEkAmMMkga2rPcrrZhT9kM+IeGwhzmAtILi4Dt2XG05T/si704TToNkcO9zAHMJB1FgpgE6Aa+ihH8A99lbHIYyS2rIrUKI6GyPCEWcoGm9oTEB11KEIAJGg21JrZGwHlLcrnA5SdDajNlMrSwECzQJVkRYZI/GLjGDqAVXNl8YeHeSzQKHoFsaEISAlEGukaJHFrSdSApZLdIY3AtZrZ7KtHdUugG7vdk66Jci9RzSWx1u+QU2tLjpd70EgA1mOW8vYqEnwH3VuR3h59Mt1dqt4selhKWho6GYhwh8GRz3Rg2xubQHuqnOJAFHvSid/6oTttCobTlcHCtDyE3OzWSBZOtKISbuUvoDliFY2T2XWFyN/Pu04XUFlj+y2MDXdY+O/NSc6rY+ax8d+akWflepWPZpYMg4dl7V3V+UZQb17Ll6d5sMB61outzQGNNi9iFtidxREumDWk60a7gbJD3O1aIa4tsAnXhNppwNA+h5WghbDS/lyl+qZ9Ey0ADcHkEbIEIEA2dR27o+KyAe+ikQzw9Ac98rowrcL9jxRnllZiKAia1vld3tNILOVClkQigsx8FM3D5nFge87EjZUu8xJ0FnYK0RsEQc6TU8AJxQuka8t/gbmIXz/AMmlE61uyLppTEIy85BwCo4ZrXTsExLY+4UT7/JanSZmyf5eZod/pJC0wrnJJsU+lZz9Qwscc0Rw7gWvO17LRGLOFIjxDTQHlIG6MT0triHRPLDvS5MS3FsblnYJWA/EN13/AI5YW5JGPJSVHDiMkmJc6Npaw6hVEa1z3Vk72Z/umFo7EqouJXnTfyOiOhjZMuc4BpJoCgCdlEbBdOEMTH55rOXZoCUF3VgzX6Vh/Bw4Lh5n6rsc0OY5pGhCyX9Wdsxgr1KnB1VpNTNr1C9jFnxRXBM5ZQk3Z34SEQRNYKoaq12pO1XsFTFiYpjUbrO9K1dcONfEyd/YGrVc0TJW08D37Kx3Gg7I3GyppS2JdEGNyMDbJA0BKOSpHfdHy90JDIITPKPkgQjug/opOjcG5iDWxtR4QMSSaSTAAOdUOdep3RZqv0UUhhzskTqps0IJbY7FQcKJB+hQMmHNyAFozDWwFidQN9Q+Y2WwVjdQ/PGh2K5fLfxNMWzRwwFPcP4nKvqX5N/uFZgwfsrSeTaj1Rrm4M5mkWRVjdFf4g/2MVbXThlwjWtJo6kBYpXoOkTDDjCy5A8MILmHZwvZcnidzNMr+JJjix4c2tOSEnOzOLjqTytD/EGMi6h1WfE4bBx4KKQ22Bh0auCLL4jTIDkvUA7r0n/Bz77I9lJjWnNmcRppQRI4OdoDlGwKikPYJJoSAO6k4g1QrgpNAJNmuQrYIPGjld4sbCwAhrjq+zwqS+kBSmDW3tYUpozFK5jqtuhI5UAloNj3oD21KvxDZMPK6GTLmAy6KGElEGKilcwSBjg4scNDS1f8TdSg631J2Mgw8WDDqb4LBpoN1a0Q2+VGRC5scoc5geAfhKZDaa8aW7YcKbfAMMoLZPEoFhB09bVNgNO99kihzV4hogjewpsc6WMRuc8hvwsHdVispBAvupQ2JmU8R+b4zwhPsCzH4l2LxHiPjjiOUNyxtyjTRUubly+YGxehU8Q0MxEkbZBKA6g9o+JVlrmPIc0hw3BCTBEzA6LDwPNVKCQA69iq9kmfBm29OyakobWlxpo9aSQP7pCBDByuB0NcHldOCMEuMrGPfFA+7MY2XKm12XXnYaKkw2DqznKSRwSN1B3xt07hTc7NQAAAFCgk4/A0AXqSVMgRIN2Lry7AhONjXZszw2hYtQrTf5IQAcVp7oGhBHdAq9bruEUb576IQE5nOe/M8guIs0oA1saO2iBQN/okhgP9uyi8Gh2sa9lfFCHwySZ2NyV5SdXX2VLjTCLOpB0Q9AgOl90h2Vgjc8nK0mheigyh690IB9kgNL4XTjZIX4gvw0RijoAMLrrv/X6rmJJv60h9Ajjb/wDcD7LrXKf/ALgPZaEED53O8Nj3Na3M4tF5R3WOLttFyKSfosjHD/MyLZIFnelj47809Z+V6lY9nV0s/cv9HaVwu5tDUg/NcXSAC2YE63otTCwPxeIggzxxl5oOe6gPcrTx+4ImfTKSNAaoHlLSjYPopvzRPLMwOQ1YNgpFwcLcBfoFtRBBX4eKTFzCNlF5FizWyo7ftStcSMpc3LY0rlNAyAcWgj60pOBYLcB5trUG6H07Kb5XObk0yXYFJgyGb1QrM7P/AGm/VCQWYQvKBwr8OySiYpACdKJ3VUbXeHn1y7ErTZ0pkkTHxyHUbrxsGGU30jpnNLZwzYGaOIyUCO4Kpwsnh4mNw/hct7BYJ0DjnkLmkVRXJ1Dp2RzX4dp31AXTLxJJc0jNZU+ma73BrS51ADkrC6h1J0hLILDO/dbOX7Rhw2VpBI1C5h0zD2DlNXdWu7NDJkjUDKDjF9nn2MfIfI0uN8BOaB0Tw2QC96B2XqckeHhLmtAa0bALzUhM8r3BpLnG6C83P4yxJXs3hk5FeXT02BQB5q09Cu3HYU4fAwuN5idQVyws8aRrG/E7nsueWNxdM0Ur7HFBJK8Na0770tOHpLAPvXE+gVcOKlwbvCmYDlGhHK5JcdO+RxDy3sAV1QWLF3PtmT5S0bkOHjgFRtA9VbsvPxdQxDP4i4diFr4KeTENLnsDR2Xfhzwn1FGM4NbOhCZ0SXUZhWu2iSZ4PolfogBOSG983oUykgAc5ziS4k66kpJlL5JDBwFCifmoppFIASITSKQwGpq69yiVpbIQaJ2sHdRN0DWndAKQDeGtPlcTzZCxeoaY499Fsg0b0+axsf8AntuQuXy/U1xbNWC24WNpGlKvrGJlmwTWSvLgwBrAeB/drqmlMoiuMMLYw2mjtyszqp+6aOLtXkfHGJdyMxbmAIGEbYBJFAnhYa2sD+Vi9lxeJ7muTRe4k1ZN9ykFNzy4AHYbABETsrw7TvRG69E5yCvwz4WYuJ88Zkha4FzAazD3VUgOazVnUAKKBk5nMdM8wtLIySWtJvKFCubQunC4ObFRYiSFoLYW5n26tCaQuw0cx29V19Qnwsk8L+nwPga2NuYOdmt43cuVwLXEHjSkk06DZKV7pHue8246knlRQilLAZDcoom+R2UvEd4Ph+XLea61SZlzDNdc0olOw2WsYx0LznIe3ZtbqMUb5ZAyJpe8mg0DVELxG9r8oJBunDQoZK+OYSxuLJAczS07FV0IeJhlw074cQx0crDTmuFEKuwuvEk4qF+NxGKEmLfJTmOvM7T4rUMK3DOhxBxEr2StZ901rbzOvnsigT67KGOcyRrmEte02COCrMVJNiJZJ8Q4vkebc4jf+9FSpCRzSOw4PKkZCNpMQrbsEzWnft2SY41m2s3Q4TSWhi7JoAJIAFngIP6oEN7gXWG1psmzJldnLr4rlR9t1fhnjC4uCZ8UczWHMY3bH0KpARxGHlgyeK3LnaHt14Kqa4skaaHI1CnO4vlc/KGNcbDRsB6KH97KZdaBCOydEDZNoF+b5apcHe9qKABNji0ktPFKKLQA0cnT6o+fz7IcNase6EAUTwou497VrmPjeGuBF60TuoVbqNfNKS6GgtxOhPyKjSZsHQ/NLnfRADomzWn7J/w8e6O+vuEuAmByHTqA0WlFipYfE8F7o/EbkeGmrb2/ZcAyDqcXi34fOXddTqzeW6vS1ni6bHIR1F36UsfHfmXey1yD2WTj/wAyfZZeT6l49nR0oHLLS0xh5XYc4jKfCa7LZPKy+k3Um/AWgCctWct3V7q/H9CZ7AXsBruApQua2VrpBmaDq3uj+Ly2PcqzFYd2FlMcwGar0N7rdfyQSxjo8RPJJh4xHGdQwHZc5Og1N9jwrjMZMNFA2NnkJOdrfMb7qqsxAHtQTbsSFzaCpBricrWk86BIULsXpQ9FNDI690IQgdnHghJ9kmj8EvY/W62XR0zGfZg6HEWANRYW01rWgAAVwAFlf4ghDWRTAAE+WxysZePLBHmnoFNTdMtPVcPvqe4AVsHUYMQ4NBLXHYELzga51loJF7gbLW6KyJ5IMY8Vguys8PlZMk0ipY4xRsAX/wB0vkFJIr1TlODqRke0QQg53auI4CMH077LlfJZeW3qu4DmhfdWyyvla0OIOUUKGyyeCMpcpGnNpUjG68P8oz+ZZvSo3PxsZAJa02St3qUHj4V7KNjUWubosBjw7nOFFxvVcebA550zSE6gw6ng34hwdHVgVRWOG+BiQ2Zux1B5XqexWb1XBmapIx5xuO6ryfFv5x2GPJ9M64sLC1oLI21Vg0rKrbb0VeDv7LHmvMBrasK68cVx0ZyfYE6EV81FSLTQNGq0NJty5HXZfwQVdE2QQaN0NOyk9mR2UkEjWwd1E8pARO39Eapu3027JJMYEVukeEWfW0HYJANzswG3vSrKlXogny1Wl9khjLmeEG5Tn3LrVSlR1oHukgei44mT7J9mseEH+IPLrdVuqdO4vsrIYfFbIc7GZG5qcd/QKk90mAFY3UB/nvotnY6+6xMabxzvcLk8r1NcezeZFJJFnALw1vmI4WX1X4Gnjuu+GRzIiGuIDhTgDuubqoBwti9Dyryq8Qo+xjcLew7WNwkBjeXkst1iqPZYAOi3sE8/YY2UKrtuuPw/ZmuXRbYLQK9yopjf50pOaQ/KaB5sr0DAh80VaZFGrHuEkAWxubGJGvjDy5vlJOyqBI2JHsU2gHcgDuUac36VyiwFfeyeSUwBW/sElMRP8Hxcp8O8t+qF2BBHdCe9CteCkgEUFTkc66e0eUUBSgnQAmGk6Ab6aIr27UrsNM2IuD2l7HVYBq6Ka7Aoc0tJDtxpR4VuFdCyQnERmRuU0A6qPBUcS5j55HRNLIy6w0m6Cr7I0w2CSkK/iJHqE3tLKsjXailsCtnwBSUY/gapKVobGLGo/RAAJ17blMDMfKPkFHlVoQz5ToR7goDiARe+9jdJCAJPkc/LmJoCgDwocj2tTtuQgg3vok9uoLTba3SYxlrQCc3rQ5Ub3H6psy5vPeXsEPrN5by+qb0IC0BgIdbidRWyiRtvXHqgq2aeSZsbZCCI25WgDYIArQ0ZiBpZ5JSUnHNQoaaWAkBZiI/BnMbpBIQKDmmwqtOSRrWiQGiJDmogAa1QRIESdQdTbIvcqJ20/RBOqL1SGA9f1QgoQFHJN+dj9tV1g6rjxGmMiXaFnj9mU9E5ZM1ACmjYLH6iKxRBu6GhC1R3G6zOrPdLjS95txaNaUeT3AeP2J9K/wCaOLBWgKo2D8uFn9K/5nuF3lPx/QJ7HzsUFxPJ7bqbXgMIA1I1PdEUb5XtZG0ueTQDRqVuZhA57ZAGE27ygN9VuGXpEP8Ah04d2HmHWmYi8xPlDOywXNLX0QQRpXZdefDfYdRKcaX6uJ8uX/daRdEyjZyiRzXOc1xbYo0Ui0hoOmqkx2VriKOYUQQoa7KCtCQnRQkOzTgk8WFjwKzCwFwdea+RkTWNJF2aC0II/DhYyxoNwrK30+oW8oPJj4syT4yswYw7psLHvFmT4mld2AkgxDjJE0NeNwFy/wCIrqA61qCuDp0j4MXGdQHnVefy/Bl4fRvXONnqAkUIXrbOUZaWjUG91EGjd/JSOo57KJ1+qWhlj5PGkzvA9mhUjsBp6JgUitz9UAKkFB/VCQWRRSmdSTp7AKI3KKGDpHOY1pJyt2CiAT2UhQe0kW3sp4t8ck7nwR+FGTo27pAFJSKZCC3S+OyWwRAo+SFbhhH47DMCYg7zAHWkhlVc0fU0kb02v05XXPMzx548EC3DyGg1+9LlcMpqv1Q1QLsVnLl43pN0jjEyMgZWk1Q11S02P1UdK/b0UjHnd3oVRpIBhY8uJDx8IA3SSKQwNKLt1IVpd+qRbevZIBcizpeqxMaKx7+2awtxrHPc1rGlzjsAN1jdSaW9QcDYcK0I2XJ5S+Jrj2ajPw2+yOpysPR/C8ECQPvxCdT6IiIdG0hUdSJOCeNSBsOytv8Axv8A4KvkY3C3MCWjBsBFmtCDssMrawX5WP2XF4nua5dHRoSOG7WAvUdO/wAP4fEf4f8A+IR46F2KMjmDDE06gPiK8yxzQwtI8x2NpZ3BtBxrsCvUjJR2csk3pkToT39EX5a+dpIUFjHHvupFjfDLg8WDQaRuol1gDTQcJIQDBIa4CqOhRZy1Zy3taSk9jmVdai9CmgIqTnAkFoAocIZG+TNkaXZRZIGwSb8vYpLoAc4uJLrJ5JO6AknW/wCgQAnV/XRHCFoYwdN/4Xg/sYxH23Xxy/4PSv0TSsTdGdypizFoNuVCiQTRruAgbb+lJDBdfTcRBhsQZMVhW4lmVzQxxrUjQ/JciBV63VcITAjH8I034C6DhJg2yw1kz2TuFzR/APZWZnf6j2q0otV2DOjp2MkwGOixUDYzJGbAe3MPoVRLIZJHPdQLiXEAbWoirF3XNIO/Kd9BSXY3ODg3QChqQEjzWyYq9QarhJIAUT+IPZSHsou1kaf0CTGhp0pROaxxzMD7FAHhRTEGyYaTZF6CyeyQ9lMFnh859iQdCEB2QTaaN0DrdHlBBbVg6890GqFXfatkaAnPKZpS8ta2xs0UAqHbN99lNQfXl90pDRY9+YjygUKNBRdvensEBP025tMQva0BCEhnJivzMRXWuTF6TxFdZWUPZlvQLL6oKxIoj4QaWosrqX5jfhR5PoGPZ09HflEooa1ZIXadD6d1n9L+CTtYWrPiHzMiY+vum5W0Ffj/AKxT2VFtAaaHUUr+n42fAYuPE4SQxTxm2OHCqjAc9ocTV6kDZSmEbZXCFxfHw4ilvrtEEZZXyyvfI4uc45iT3UTtf1CSY9vYpWAyDrW1dtkNq9duSkHEXWxH1QNwDWu57JgTsdz9EKeRn/ufohOg6MpuIxUhOWSR3eitPpZxjZKna7wyLtx2Wf03HDCOIe0FhOvdbrMfh3MB8QdqJXJ4lS+Updl5L1RDHYYYlsbSNA6yoTYJj2xZaDozoV1skY+srwedCmF6Lxwm7Ofk4iGyE9ymW+XMtqJsikVIjbb5IurFCuUAJrS5wDQbvQBI2LF63RCYJBsX7oBN3yl0BAo9VJ1WaGm+qiAUhh8/VIITFHn/ALoGJRIrsrfDc5wawF5Iumi1Xvv+yAIqXhv8MvHwg1dqNKThTbB05FqQI0CNz9EiK5R/vVJz5M58K8lVTjskBCyNkj/ZtNI/0SGOmhrs15uAFBOrvVIpDEkU0ipGJBQrhhpfsn2mh4WfJZPKAKWOdG8PYS142IOyxuoku6jbiSTVk8rYOnar3Cxuofnr9jsuTyvQ1xbNLpz43Slkt+E11OLd6/u0usCPwpvBJMd+UuGtWqunguzyZaadATypdS/JvQn/AIQa+RirX6bIH4fLy3QjusgbLSwtRfZ3t/5gpwXF48qlZrNWjvQgoXqHOCslY1jI3NeHFwsgfwqIIymz7BdmB6ecVBipXYiGHwIvEAkdRk1rK3uf9k0KzhR+6EBSMR0TvRM6m9UVqAmANe5thhIsUQDujcgAWTsByh3lcQfY0p4ed+HnZNCcsjNQaTAJYTFbZLbID8JVd04Ee6k9zpHue8kucbJPK6cHiYYcLi45sIyaSZobHI46xEHcI6sXdHJ3JUmhzi1jQS4mgAFFSY5zCHMJDhqCDskhlrnYjCtnwrwYy6hIxw10VLmloBdXm10Oyc0r55XSTPL5Hauc46lQ/vVNsSAC9B8gkVNrXEFwBpu5CgeVJSCEhrWW29NimoRfhtUwPLem9JLQMB7KTmuAzFpAOtkJwkCRpcCWg6he9/xL13/D2M/wfg8Jg8CI+pR6OlC1jBNGcpNV0eANj6IFUbHseyds8NwLTmvQg7JAWDqNroqNFg9jmGngtPYhQP4gPopucXGyTdaklJ2UloAN1qSd0mAEkmzumBmI2r14Te0NNAhw30UUP+w6GCWlwsHi6S+qkwhpsgGtgQpPLnW6x7BMCUmHxDMNDPJG8QSWGPI0Nb0qFY6WR0bI3PcWM+FpOjbUOUMEK1E6uZZ0zKZ1Ow22Crfuz3USGi/MGte1oBBO5GoUgGCIOA81UQTuotjLoi/Sgaq0SxSQvyTMex29OFbqxCiZ4krWB4bZq3HRRcA0uFg0dwd0HYb0mAMhLr20obpAcWO+OI+q6yuTHf8AK96XVwsY+zL+kNZfUvxx/KtNZvUvx2/yqPI9CobLul/hP05XaCQVy9O/K/NdSvAqghT2TZmokFRvftyhp9T8kLYzA+yEHdJADO3G16I49Uc7fJCNgJCaEgOYdNkliZLEQ5rhZHZUz4OWBoMrSG3qQNlr9CeXYOjfldQXf1AwxQuzkPZl1BCzh4cJY+Y3lalxMiARYbCGaJ2d9jUlKXrQa6mREjgkrNeczy1oIHa91AsMUo8Rh03BG65n5M49QNPxp7NnD9UfIdIT7haUTzIwEtLTyCoYF0U8TDGA3gild3XrYFLjcnZzTrVC/wDCZGl39UEf90hrp+63MwI0SIOmiDxamzzOOYigOUqGV9k2gakmvSt0kOqzWo7oAid/6hMsrcjXXQo4SPzUjRKGeSCXxIHljxoCD3UKzX35pA1/3KkxzmOcWnWtwgKIfxenKRGZ1Nu7oAIO6GPcx4cwkOabBCQxyxvhkMczXMcN2uGoVZ2XTjsVPjcU+fFSF8rgLcRv/ei5dON0mC/sZbQab1OldlHhSv009VGjV1ptakY9Mu5tXYrBzYXwzO0NEjPEZR3C5035tMxJ4FlAEd3abfsnFk8QCUnL3aFECyNR81LMGxuZkBJPxKRkDvzXBI3SN0RZrerUy4uABOg0AUNNdOKSGJY3UPzvrotlY3UNcadey5PL9DXHs1YhUTfalz9S/KO+S6YxbGi/mVDruHdhYpInOa4gjVpsK5KsTEn8jAWkzWLBj1tZvC0MATJLHppGz9152H2o2no0jykpxtD3taXBoOlldL8NF/w8TxzZ5sxDow0+Vv8Aqv6r1lHo5mzjTs16DhIcn6BCQwU2Rl5r4QRoSVBO+CTV6+iEBNueRojBFN1USBlFE3sRStxjIY53NwsplioU4tq1LDPhaHiZhcSKbR2KtLumI6cJDgA7Ay4uV5gdJWIYz4wPRc3UW4UY+cYB0hwmc+GXjzZeLUMQ2Nsn3DnPbV2QqUSddCS+y/7tzWZbD71BGlKk7/PhJWPdG6KMNYWvaKcSd0tjKrTr1Qa4B25QNTVqRgwAuAJAHcor/wA9114fCkQfbJQ1+GjlDHsD6cfb9VRinRPxMjsPGY4S62MJuh7qmqQrIOc516/IIY7I/NQPFEKKZcXbnbZQUQj/AA2+2wUkoQXNYG2SdAAE3AtcWuBBB1BGyS0DGHEWBdEajukP0QhMQITc0tqwaIuyE9CDdXuPVACJ8oHztVn8RvsrCdK0A791UPxvTLaGNFzslEtJ9iFEGqse4UjTWgtNk7itlCtSmxEn0SSBWugSQfmhIAQhCBiKg74me6nVqDx5me6mQ0T2IIu/RXYvFT4ybxsVK+WWg3M460NlU8C6a6xWppNhyvs0eNVX9CAvc5oaTo3YdkiTlq+bq0uUgEgObG/DGfVddLkx48rKJq71XV/FYNjfRZR92U9IbgL8pPuQsvqmkzf5VpV9aWd1Qfes9lPk+g8ezo6d+WHuV0rm6b+W/wDkuo+6rD6IU9gOEITWqJAlL5Jo0vW0xDa6nB1Cu1JHU3XrQQCRf0VkEb5ZGxxNLnk0ABuU9gV0hdn2XFf+wfohVwZPJHXFEyJuWNoAvUAbqnGYcz+G2/Ldu9V1oXU4JriZKXdnmOoRjD9Q0bTbBAC9BPh4sQWukYDpdkKrGYNuKkic4jyG11VQA9FzYvHUJyvTNJTtIrihZEKjAaDwFfHCZGyEEDI3Nqd1Dj50gUTRNDuV1xSiZN2WH7t5EzT8NAA7KkC/dNw1PI7pfJNgArsb4KipAkbdtVFSMRQgoutaHzQAnbJK5kL5Q9za8tWL3Vb25XEWDWlhJoZGzsDoVHvr9FIa8ozaEACtj6pDK0xVG7+Sb60oG+5Rk+7Lsw3qr1S0A3uD6LnHMqiNSpV70h7s4aCAK0sBJgQU3SDwy1o33JKi8ZXUCCO4SdWXY33S0MbAdSBYBulEjM47D34Q12Wxeh0IBVjcjWOdmOcaNBGiQFTcof5rLb1rlINDnafIBI/3Suw+JdBFMxrYyJRRLm2W+3ZIZVK0NeWtcHD0UTzRRybtRKkaHmIqq011G6xeo/nnHkkWtl1ZQAKrc3usbqH536Fcnleprj2a0f4bfZUdTDfsLzmOawKV8f4QXP1Rpbg3EjQ1SuX62L/YxQtnpkOXC5idXHTRY628Cf8AKR77UuHxUnM1yaLwNL004VuHxc2HinjieWxzNyyNHIVCmxwBBr6r0znolH4TWtc4ZzdFhG6g3dx0rskd9h30QG5gddeyGwJgZ6OXKwUHOrQKTWMEr2yZywA0Wj6f0XXg+r4zB9KxvT4XsGFxZHigsBOnY7hcAcddT2OqAHFGZM1EDKLIJ3SLSASdtqRE4scHA7HdSYx0z3BpHJ1NJ9UBcYmM6a2ZuKjMr5Cx2HAOZoHK5VY1ro2iRzTTvhJVd/VJgugVkjGtaHMJLTvY5UAL0FfNKqNX6JDHvorHQ0G0bed2gKL43MYH2Mp2oq3xYvsjs0cn2rNpKH6Bvak0v5EUkOdHm4BUFNxGQAEk7kVsnLHkLQa1aDYKKAGQmRriyvK3M4E7Juw0zcIzEujcIXkta8jQkb/0UXhuW2nXahyh8jjE2PM8sGoaToD7IaGiGHe6Pw3scQ5uoIU53+JKXkkl2pJ7qqP8Nq6HNidDD4Qk8XUyF3w+lJR7VA9lJQr8M3DuhmM75BKADE1o0J9VUwBx2JA3pFBYPe5wAcScugB4UUftxallAJDiAavTlAED/RQ/5/pl44Vrazan5hQIHiCj/DSl9DL8SIWTuGGe58XBcKP97qpAq9b9aR9fmqYgOu+6EISASaEuyBoPmoP+OPgWrXgAjK6/lsq5NXs7JPQImki09Mo/dH0DET/ZSCZrsmHaAaIQjm6m0tYwEje9CrmHyj91RjvwgeL5V7ATFGa4Wa92X/qTNmuyzOqfis/lWlY0tZ3VfxWVtlUeR6Dx7OjpTXOwznBthrtT2XSSP/K5ukkeCQ4nKXUQF1ltGqI91eH0Qp7EhImrQtCRoKBV63XouzCx4OXEyjETSQwhhcwhtku4CaVibo5o2hxpzg0ck8JNcWOtrjYNggqFfVNO6DZd47u5/wD2Qqsp7IT5MVI20BABJoDX3Qu6jnEf7sIO6bQXGgDaSADv9Ujt6p0bpN2UPFAll7HlAyP8JSdVCie1FWTPa+VzmMDGnUNB2VRQAKKldCq+aikAFSbkoFzXVWlHlICzVjerPCZe7IGE+VpsAI0MTS4ZnNJrawd1Aa1rpfKZ2rjekGsuhF8jspYEDufokmaU2xudHI4VTRrqkMrynLdabWo7KWuo1rsolIYEnvpzXKjlNXWm1ppGyEmAeiVaA6Vz6I49U9KoA+4SGKvb3TLqYWgm/RN4a1zg0Fw2BIS8SswDRqEg2QcMtDQnewVEnuneo0Sve/nakaEUCheYHbhJSynJm4ugVIzp6a3AudOOpPmY3wz4fhi7fxfovNdQ/On5LZWP1DTHH5Lm8p/A0xexqx/htXP1L8m7Xtur2fhsXL1N3+Xy9zqnN1jYL2MhbeB/KRdqWKdivTYHDQt6bg5Xz2HtcHNDdWEHT+i5PDVzNMr6KjRPpugph2W6A7ahRXoaMbHX70pMZmcQXAci1PDyMjkBkiEraIyk91WS0NI9dDaYHS3HTNwsWG8hiikMjWlo3Pcrld30u9gpMLMpDg697BUD6IYg7KYIG9EVooaVVC1YIyYy4E6bgBCGyBJNWSR2KSZGgOv0SSBAhSeQ5wIAbpVDlRSYB2UnPd4YjNZQbqlFBN68phRZE4NjfoLIGhCjI7O+9AdqAUQdf6pIsKC0z6dkkuEgFEC5rQBrVq0SFsYa0ne6Cqi+BvsrpJGvjiYI2MLBRcBq73REbK2mjY+qASCav1o7q04eXJG/wzUnwEc0q7oURqn2IcjXB3nFGrpdmKYw9Kwc3iRZ7cwsaPMAOSuGzZ3v1U8w8MtyizraaYmieH8DLN9oMl5fuw0fxev6qivPforIZPDkDtCexCg/8Q0QdNwlLtDQu1DW0yCDR0O1FSflzAssDsSon1PzKQAkhA0OosdiUATLHeHnI8pNWotBJAAJJ0qkH9N67JxuLXgg690DFRzFpu72KJY3Nla0jzDgFBJJJN3uSVFx8zaJvk2lKqBDISCZri9tigICwDq7WkAma5UhoL03QByY7SD5rpwzS6AHTQDdVY7z4Z7iRYIoVutXpn2o/wCHMQ6OGN2FDmB8hAzNPFKIRvIDdRM86WFndV/EZ7WtL9rWf1nIMS0RkluXelHkejLx7LulOP2Z7ABRfYJC6wCXamze5K4el/gH3XaGl11dDWwE8HohT2InT58JLq6fh4ZsZHHipxh4XfFIW3S53ANe5rTmaDQIG62r7IvugQm7YbAjstubqvTnf4Sh6c3pjW9QZNndiw7Vze1fT6JqIpOjEBrsdbIKHEE2AB6DhJosj+qHDXRAxaoRRQkBu8+qbWkk1V+qSk1zmm20CDYNL0TmI6g82rGRZonyEgNbpqeVCV7pJHPebcTZ03S9OO3dGgLYXRBsomY5zy37sg/Cf7tVOOw102tNtNcC6++nCAMxNAk1eiAKyg/op+XJuc3ZbnSukwYrps+IknYx7Bo0n4kRjYOVHnikrJWgSOA4NacqClqhhG3O8D1SeA1xAOl1ZU4nBjrc3NpteyI8pLy5wBy2LCEBWTooqSiR9FI12R5UiarX3RQ/7JyMyFoBDrF2EhhECCX5SY2mnGtrVbhuVN7XNBBJ11IvdQrn6oYCTLW+GDfmvakXodBtVnhQ76qRgAToAb9FOFzxPGYR95mGWhz/AHSTXZWGrzdwVPCTSYSeLEwkB8Tg9tjkJDZcxzJcfH9ue5sZm++IGo11/qrOvN6ezq2Jj6S50mDz/dPcKsf3a5cZO7FTumkp80ri55ArUqjKbIqjtRKGxJCLeOdgokEaG+xHZafV+kYjpeJhhxL4S58bZGlj7AB9e6zXBzg52pF0SVLVFJp6E0AtJJ1Gtd1Htqa7WmK5v0pThhfLIxjQPO7KC40ApGQDqdm0veisbqJzY/3qyt2WF0M74nUXsOUlpsaLC6mC3HkWLBGoXL5fqaY32a/hhkMZzh18BcHVQA1lXdGwtGJ0krIo2gOcPhAC5uvB0kEcz8l/DlaKqtNU8qvEEfYwltYL8nH7LFW504NdhYReU7E9lx+Ivma5NFxaRV+9KKk7QkXYGljlW4cQNc77UJC0xnIIz/FxfovRowKEHb17oAv6Kx8Y8QNif4gIFEBCQWQadRz6LrwGDmxQxLooHyshjzyFv8De65NQa5vldOFIz0x5ZYpzS6g/0TSEcwIa6wLHqF0YWGXFvlET2M8tuzOoAKiXWR3lDRegB2S7kX2NJ6YUXYlghfJC6QSFhprm7FUKT2uY4h+9bApBpcQGgk3QA5SbGMN8hd8lG1KsryH2D2RKGteQ0gjuEqCyJSQmEtAK0I5QmAI4KE2mibAIqqKQEI/wwrY2Odmc2qYLNnZUx/A1TB9SiIMtYXyvprjY1AJUWxucxz6Ja3dwGy6Mfh44JnfZZjiMPoBMG5QTWoo/P6KsYh8UEkMUhEcteI0HQ1stP+i/4VHLlGW77nlR/dJNZ2UiUhYcuRpGmtncqsfif/FNIfiH2SkCJIRWiExCV+D+z/aG/a/E8Hnw9/72UZZPE1cBmArQKtPTDYGsxy3XFpcpoSBAoOFOYpqDvjZ81L0NdEmktIOneim53iPLiBrwBskivRMAOp9FY7DzNwzJ3RnwXuLWuOxIVaZkeY2xl5MbdQ0nQJ9CZz4v8u7RTwrnNwzWhxykagHdQxX5dylhfwGeyx/3LrovDso0G4o2Fk9SP+Y9mhaiyMe7/NP9BSjyX8B49nZ0tp+zvOuXNVrrBIuia20K4ul34LhZ+LZdqrB6IU9hryptc1rCC3znUOvZRSK3RNE43lr7G/chd+O6XJhYMLK+SJwxDc7Q1117rOA0JCm5zw1ucHUaXyqi1XZLIjRxut+FdJIx7WNDQ0jchVMYXDygk76DZIIuhl3hRf8Auj6IVVFCLQqN17mlxyAhvAJ2UCpZTViyBoSgVyNOy7zn0RpHKkQW167apsYcwBIF7EoAg469+5SBo6XtVhTLQWk5hYOwUCEaDYEAVVfLhWF0kdxtfYIumlVd9UbIToGB21BvglROvHyUnuc4jMbrQeiikxiG6HAgC9jsU3EcADTuon5+ikBJKRaRV1R1UUhkCmm4C+O+iieNEhgST7+qipBpPf6KJG3ukMAdCNFHbdSIrkf7oa0vcGtq99SkwDNq05RW1UoNaXGgCewCm9wLGtaTVbEKItozCxrQIQxkTp6H0Q1uZrjnAIOxO6HH9kAAg2eLGigZZE5rcVEcUXPja4ZgDuEp5iZJhFbIXuzZAduyiG5oy6xY4KraMztwONUWwotnMHhReFn8SvPZ3PoqNdr+XZWRPdDOyRtZ2ODgHCwaTxEzsRiZZ5QA57sxDRQHySbDQhGWta4kUeAsPqf541totoud3FDYdlidRJOONjgLk8t/E1x7PRxSiGLD4nDxeEWsDMwddvH8SzOquLsK5ztzratjJ8Jgs96VHU3E4NwJ0FClc3/ioSVSMVbmBaTg4y0E0NSBssNb/SnQjBETeJZjpmQ7O9fTdcPie5tk0SvfdTaw+GX6UDVE90oo3yvbHGwve40GtFkq1sgbhnwPiHiZ8wfXmHp/fZekjnbKXeU1YPqENc5rg5ujgNwludUhvvrsCkMmXHQECwbJIUefmtXo8GAd1hkfW8RIzBg1K+AZnfL9FxY50fj5sPXg5iGGqOUbEjvsqoV/Rz5XONAG9gAE2UHDMDXIRmeSXa77hTcIvAaQ5/jWcwI0A4/qkMg92YAUNOQN1FpqtTe9hTmifC4NkADquge6gBd/XVJgB3Js97JQhSY3Pn8wblF6ndAC8vh3ZzXVKO4UwWeE4Fhz3YcDpSjSAEgoQBfCABI7FM6WCm9tR3Y14CQEI/wx7KSiz4B7KQq9dkLQDzOy5cxy9rQDRF7dlMxFsQfY1OgtV/T5J9gM8n9ElOPw7qUuquBuVBDAPkoX9472VgJG3aioMaXTENBJI2A3UsaJIQb7fJCYAhCECBCOU7y3sbGxCAIpNa580bGNLnG9AN1JtC7HsgnI+J0bznokkcIoBbGqojhCsc9pDRl+ZO6rsafqgYFJMD3RehopMRTivy71fgoQ/p/i+I0FtANJ1cqcTrh3eyWCP3DNVn/6F/6l5Ff0Kxcbf2uTTlbP9hY+N/Nye6y8r1Kx7OvpZ+7f7rtFkba9guHpZ+7f3tdw9N+6vx+4Imew790clBJRa2JGuvH4mLER4ZsUJjMceRxLrznv6cLkH6qbXMDacy/UFVF/Qmi7A42fBPc7DvLHPYYzQ3B3VT43NjbIayOOhBVbiC41dXsUXsjl9MAQi0JAb1+/qAtDq/T4sB9m8HFw4kSxNkd4Z+An+ErPOhIsdrSXonNQw0lwFjU1ZOyczfClLC4OA0BB0UUigZcZI2sjMbTnoiTNsVWXAgCvoopIsQHf15SP9UcpEpDApd/qmUkABLf9J2o2VAD/AHUv7pFjMCRp2vdSAmtc7Rtk1ZoKJ/u1Mu1OXQcAnZJ8jn1mI8ooUEMaKyDrv7pfL3UszsuWzl7JfVSUBJ7naghjQQczq7KJ2/opPbkDTYOYXQKNhoRcAxzcgJPJUCOw+imXZiK+gUbLSRt3BUsEQ17GuTStlD3xiXJUd5bA5UA9zWuaCadoQFIsLYGuc8FriRkDtb9kD+yn5IDbDiKodyndXQ+qG+ZwbYAPJUARGhBv10QR5tAaPBV+IprvAMjHsjJAe0bqoSEAAAWNikPZXuolSJ1vlJxzG6A9AkMAKaDWmwCxuo/nfotgnQ9lj9R/Oj5Lk8r1NcezVYPumH6Fc/UvyT/cLpizOjY0fTuubqQIwkgI1Vy/WJexjLZ6ebwjPosYrR6c5zGhjryv1aT/AH/dLg8Z1M2no1sFipsHiosThnmOaN2ZrhwU34uZzJ2FwcJneI8kak/3f1Q2FzsE+bxIsrHhpYXec2NwO3+6obeYEbjVepZzUhd979UwMxoVteqbfM+3a8kq0uikkcSzwxl0DTyirGU+l+9Lr6cwzznDMEOacZA+Y0Get8f91RAxkkhD5RE3KTbhuRx81VzogRN7fCkexxBo1bTpoom96NcGkgBrd3xS6ZMbJPh4IJ3XFA0tjDQBVm9e6BlWGiOInZE17GF+gc91NHuVAinEaW01YKj+ybdwSLF6jukAIGp03Qd9Bp2HCEAJSsmgf2Uso0NitzSlh/DMrhJeWjRB54TQFR22NcGt1NsUhjdI1pygWSV1Y/DxMcz7LihihlF00tyk7jXtr9EsZisZ9ngwGJe7wcNmMcZHwZtT/RNqhHPFH4ubzhpAs2VWR8QBv17oYAXDf2CnioxFIWteH6WCEnoZBhAiDS0X3vZWMbHnLZHkAjQgWqohmDQXAXyeEzyNNDuOUloDs6kyCPFPiwU5xGHAAEhbV/L6/RcWyebyBoAHNjldDsDiY+nxY50Z+yySGNr73cNSE27Euihha19yMLhyAVFSka5pGcUTqopf0MEo3OjmzscQRyCmoj8Rw9LUsY7ve77lNCExApxM8SQNG5UFKNxY8OFWDpaaAi4FpII1GhSHvqpSEucSd7vRRSYxndQd8bfZT00191E+aRorjYJMBlAUmtLn5bA9SVHvrr6JgBQB5ea7obxYNeibnWKF5eAUgKp/wZPZQwf4A15U5h9y/ThVYKzB81lL3Ra0dKxsb+bk+q2QOb+SxsaP81IsvK9R49nV0nVj/daLCGvDiAQDqDys7pW0nyWkMvhHU5r2A3WnjeiJybLcbMzEYmSWOFkLSdGNOgVBSBtH0W7dkof92mXeWqHvSQQT9UAwq63+SWwVsUzow8NrzCjYVfvaKF2K0J6IQBvv+JyihC9FnMgQUIQMQSOyEIEJJCEhoRQhCAEd1EoQkAilz8kISGIoKEKCiKXdCE0A2fit91LE/jO90ISAp5S5KEKRiO6iUIUjAI7oQp+wREp8IQgZHgrH6j+dHyQhcflehpj2bGG/5a5up/lZEIWr/WL/AGMQrSi/DwfzQhebh2by0dp+JXs/BPuhC9Y5yobpO4QhIGB4VjvhCEJgVlIIQkAK/D/AP5kIQgK5vxX+6ihCAGNz7JDdCFQFn8as6l+el+X7BCES0CKmbsUH7O9kIRLQlsgz4Wq0fChCiOimVhdA/wDtkX/+p/ZCE0JkcR/B/KqW/CUIT+wGoD8V3shChjRNCEJgCAhCEIHbhIoQiQ0NSh/Ms9ihCQA/4ne6hwhCYAE0ISBkJvwnexVOA/APuhCxl7or6OgLHxv5uRCFn5Xqisezo6V/zfktMfChCvxvRE5NlaEIW5KGg7oQmAwhCECBCEIA/9k=', 'DEFAULT', 'DISABLED', '{"alarms": null, "configuration": {"type": "DEFAULT"}, "provisionConfiguration": {"type": "DISABLED", "provisionDeviceSecret": null}, "transportConfiguration": {"type": "DEFAULT"}}', 'Default device profile', '传感器', 't', '188f3780-d68b-11ec-aefb-d132b4563e73', NULL, NULL, NULL, '67e27430-d737-11ec-94a0-cd6fda244b19', NULL, NULL);

-- ----------------------------
-- Table structure for edge
-- ----------------------------
DROP TABLE IF EXISTS "public"."edge";
CREATE TABLE "public"."edge" (
  "id" uuid NOT NULL,
  "created_time" int8 NOT NULL,
  "additional_info" varchar COLLATE "pg_catalog"."default",
  "customer_id" uuid,
  "root_rule_chain_id" uuid,
  "type" varchar(255) COLLATE "pg_catalog"."default",
  "name" varchar(255) COLLATE "pg_catalog"."default",
  "label" varchar(255) COLLATE "pg_catalog"."default",
  "routing_key" varchar(255) COLLATE "pg_catalog"."default",
  "secret" varchar(255) COLLATE "pg_catalog"."default",
  "search_text" varchar(255) COLLATE "pg_catalog"."default",
  "tenant_id" uuid
)
;

-- ----------------------------
-- Records of edge
-- ----------------------------
INSERT INTO "public"."edge" VALUES ('840b02d0-d737-11ec-94a0-cd6fda244b19', 1652939398013, '{"description":""}', '13814000-1dd2-11b2-8080-808080808080', '191cd180-d68b-11ec-aefb-d132b4563e73', 'default', 'aaa', NULL, '15b06007-6eb5-cde1-c9ae-bb86543acabf', 'lndqnell7ex1bg7dols9', 'aaa', '188f3780-d68b-11ec-aefb-d132b4563e73');

-- ----------------------------
-- Table structure for edge_event
-- ----------------------------
DROP TABLE IF EXISTS "public"."edge_event";
CREATE TABLE "public"."edge_event" (
  "id" uuid NOT NULL,
  "created_time" int8 NOT NULL,
  "edge_id" uuid,
  "edge_event_type" varchar(255) COLLATE "pg_catalog"."default",
  "edge_event_uid" varchar(255) COLLATE "pg_catalog"."default",
  "entity_id" uuid,
  "edge_event_action" varchar(255) COLLATE "pg_catalog"."default",
  "body" varchar(10000000) COLLATE "pg_catalog"."default",
  "tenant_id" uuid,
  "ts" int8 NOT NULL
)
;

-- ----------------------------
-- Records of edge_event
-- ----------------------------
INSERT INTO "public"."edge_event" VALUES ('8419a8d0-d737-11ec-94a0-cd6fda244b19', 1652939398109, '840b02d0-d737-11ec-94a0-cd6fda244b19', 'RULE_CHAIN', '8419a8d0-d737-11ec-94a0-cd6fda244b19', '191cd180-d68b-11ec-aefb-d132b4563e73', 'UPDATED', NULL, '188f3780-d68b-11ec-aefb-d132b4563e73', 1652939398109);
INSERT INTO "public"."edge_event" VALUES ('a57ba640-d737-11ec-94a0-cd6fda244b19', 1652939454116, '840b02d0-d737-11ec-94a0-cd6fda244b19', 'DASHBOARD', 'a57ba640-d737-11ec-94a0-cd6fda244b19', '67e27430-d737-11ec-94a0-cd6fda244b19', 'ASSIGNED_TO_EDGE', NULL, '188f3780-d68b-11ec-aefb-d132b4563e73', 1652939454116);
INSERT INTO "public"."edge_event" VALUES ('54184ce0-db2e-11ec-97d4-5555813c4bbf', 1653375256750, '840b02d0-d737-11ec-94a0-cd6fda244b19', 'USER', '54184ce0-db2e-11ec-97d4-5555813c4bbf', '3895eab0-d68b-11ec-aefb-d132b4563e73', 'UPDATED', NULL, '188f3780-d68b-11ec-aefb-d132b4563e73', 1653375256750);
INSERT INTO "public"."edge_event" VALUES ('4df7ab90-e564-11ec-a8c7-4b21fe31dd59', 1654497950921, '840b02d0-d737-11ec-94a0-cd6fda244b19', 'DEVICE_PROFILE', '4df7ab90-e564-11ec-a8c7-4b21fe31dd59', '18a44620-d68b-11ec-aefb-d132b4563e73', 'UPDATED', NULL, '188f3780-d68b-11ec-aefb-d132b4563e73', 1654497950921);
INSERT INTO "public"."edge_event" VALUES ('7d7606a0-e564-11ec-a8c7-4b21fe31dd59', 1654498030602, '840b02d0-d737-11ec-94a0-cd6fda244b19', 'DEVICE_PROFILE', '7d7606a0-e564-11ec-a8c7-4b21fe31dd59', '18a44620-d68b-11ec-aefb-d132b4563e73', 'UPDATED', NULL, '188f3780-d68b-11ec-aefb-d132b4563e73', 1654498030602);

-- ----------------------------
-- Table structure for entity_alarm
-- ----------------------------
DROP TABLE IF EXISTS "public"."entity_alarm";
CREATE TABLE "public"."entity_alarm" (
  "tenant_id" uuid NOT NULL,
  "entity_type" varchar(32) COLLATE "pg_catalog"."default",
  "entity_id" uuid NOT NULL,
  "created_time" int8 NOT NULL,
  "alarm_type" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "customer_id" uuid,
  "alarm_id" uuid NOT NULL
)
;

-- ----------------------------
-- Records of entity_alarm
-- ----------------------------

-- ----------------------------
-- Table structure for entity_view
-- ----------------------------
DROP TABLE IF EXISTS "public"."entity_view";
CREATE TABLE "public"."entity_view" (
  "id" uuid NOT NULL,
  "created_time" int8 NOT NULL,
  "entity_id" uuid,
  "entity_type" varchar(255) COLLATE "pg_catalog"."default",
  "tenant_id" uuid,
  "customer_id" uuid,
  "type" varchar(255) COLLATE "pg_catalog"."default",
  "name" varchar(255) COLLATE "pg_catalog"."default",
  "keys" varchar(10000000) COLLATE "pg_catalog"."default",
  "start_ts" int8,
  "end_ts" int8,
  "search_text" varchar(255) COLLATE "pg_catalog"."default",
  "additional_info" varchar COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of entity_view
-- ----------------------------
INSERT INTO "public"."entity_view" VALUES ('f7526090-e578-11ec-a8c7-4b21fe31dd59', 1654506824985, '00e73d10-d68d-11ec-aefb-d132b4563e73', 'DEVICE', '188f3780-d68b-11ec-aefb-d132b4563e73', '13814000-1dd2-11b2-8080-808080808080', '11', '111', '{"timeseries":null,"attributes":{"cs":null,"ss":null,"sh":null}}', 0, 0, '111', '{"description":""}');

-- ----------------------------
-- Table structure for event
-- ----------------------------
DROP TABLE IF EXISTS "public"."event";
CREATE TABLE "public"."event" (
  "id" uuid NOT NULL,
  "created_time" int8 NOT NULL,
  "body" varchar(10000000) COLLATE "pg_catalog"."default",
  "entity_id" uuid,
  "entity_type" varchar(255) COLLATE "pg_catalog"."default",
  "event_type" varchar(255) COLLATE "pg_catalog"."default",
  "event_uid" varchar(255) COLLATE "pg_catalog"."default",
  "tenant_id" uuid,
  "ts" int8 NOT NULL
)
;

-- ----------------------------
-- Records of event
-- ----------------------------
INSERT INTO "public"."event" VALUES ('1965e872-d68b-11ec-aefb-d132b4563e73', 1652865345655, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '190a5af0-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', '1965e872-d68b-11ec-aefb-d132b4563e73', '188f3780-d68b-11ec-aefb-d132b4563e73', 1652865345655);
INSERT INTO "public"."event" VALUES ('1965e870-d68b-11ec-aefb-d132b4563e73', 1652865345655, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '1908ad40-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', '1965e870-d68b-11ec-aefb-d132b4563e73', '188f3780-d68b-11ec-aefb-d132b4563e73', 1652865345655);
INSERT INTO "public"."event" VALUES ('1965e871-d68b-11ec-aefb-d132b4563e73', 1652865345655, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '1901cf70-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', '1965e871-d68b-11ec-aefb-d132b4563e73', '188f3780-d68b-11ec-aefb-d132b4563e73', 1652865345655);
INSERT INTO "public"."event" VALUES ('19680b50-d68b-11ec-aefb-d132b4563e73', 1652865345669, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '190fb220-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', '19680b50-d68b-11ec-aefb-d132b4563e73', '188f3780-d68b-11ec-aefb-d132b4563e73', 1652865345669);
INSERT INTO "public"."event" VALUES ('1970e4f0-d68b-11ec-aefb-d132b4563e73', 1652865345727, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '1911adf0-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', '1970e4f0-d68b-11ec-aefb-d132b4563e73', '188f3780-d68b-11ec-aefb-d132b4563e73', 1652865345727);
INSERT INTO "public"."event" VALUES ('197292a0-d68b-11ec-aefb-d132b4563e73', 1652865345738, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '18f3c5b0-d68b-11ec-aefb-d132b4563e73', 'RULE_CHAIN', 'LC_EVENT', '197292a0-d68b-11ec-aefb-d132b4563e73', '188f3780-d68b-11ec-aefb-d132b4563e73', 1652865345738);
INSERT INTO "public"."event" VALUES ('1c542ec0-d68b-11ec-aefb-d132b4563e73', 1652865350572, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '190e0470-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', '1c542ec0-d68b-11ec-aefb-d132b4563e73', '188f3780-d68b-11ec-aefb-d132b4563e73', 1652865350572);
INSERT INTO "public"."event" VALUES ('1c6d0df0-d68b-11ec-aefb-d132b4563e73', 1652865350735, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '190c08a0-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', '1c6d0df0-d68b-11ec-aefb-d132b4563e73', '188f3780-d68b-11ec-aefb-d132b4563e73', 1652865350735);
INSERT INTO "public"."event" VALUES ('e58d20c2-d736-11ec-0000-000000000000', 1652939132108, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '1908ad40-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', 'e58d20c2-d736-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1652939132108);
INSERT INTO "public"."event" VALUES ('e5984450-d736-11ec-0000-000000000000', 1652939132181, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '18f3c5b0-d68b-11ec-aefb-d132b4563e73', 'RULE_CHAIN', 'LC_EVENT', 'e5984450-d736-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1652939132181);
INSERT INTO "public"."event" VALUES ('e58d20c0-d736-11ec-94a0-cd6fda244b19', 1652939132108, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '190a5af0-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', 'e58d20c0-d736-11ec-94a0-cd6fda244b19', '188f3780-d68b-11ec-aefb-d132b4563e73', 1652939132108);
INSERT INTO "public"."event" VALUES ('e58d20c1-d736-11ec-94a0-cd6fda244b19', 1652939132108, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '1901cf70-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', 'e58d20c1-d736-11ec-94a0-cd6fda244b19', '188f3780-d68b-11ec-aefb-d132b4563e73', 1652939132108);
INSERT INTO "public"."event" VALUES ('e6655850-d736-11ec-94a0-cd6fda244b19', 1652939133525, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '1911adf0-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', 'e6655850-d736-11ec-94a0-cd6fda244b19', '188f3780-d68b-11ec-aefb-d132b4563e73', 1652939133525);
INSERT INTO "public"."event" VALUES ('e665a670-d736-11ec-94a0-cd6fda244b19', 1652939133527, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '190fb220-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', 'e665a670-d736-11ec-94a0-cd6fda244b19', '188f3780-d68b-11ec-aefb-d132b4563e73', 1652939133527);
INSERT INTO "public"."event" VALUES ('e9439910-d736-11ec-94a0-cd6fda244b19', 1652939138337, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '190c08a0-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', 'e9439910-d736-11ec-94a0-cd6fda244b19', '188f3780-d68b-11ec-aefb-d132b4563e73', 1652939138337);
INSERT INTO "public"."event" VALUES ('e9626bb0-d736-11ec-94a0-cd6fda244b19', 1652939138539, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '190e0470-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', 'e9626bb0-d736-11ec-94a0-cd6fda244b19', '188f3780-d68b-11ec-aefb-d132b4563e73', 1652939138539);
INSERT INTO "public"."event" VALUES ('48250560-d73f-11ec-94a0-cd6fda244b19', 1652942733494, '{"server":"SZCL21HOUYONG","messagesProcessed":8,"errorsOccurred":0}', '190a5af0-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'STATS', '48250560-d73f-11ec-94a0-cd6fda244b19', '188f3780-d68b-11ec-aefb-d132b4563e73', 1652942733494);
INSERT INTO "public"."event" VALUES ('4829e760-d73f-11ec-94a0-cd6fda244b19', 1652942733526, '{"server":"SZCL21HOUYONG","messagesProcessed":67,"errorsOccurred":0}', '1911adf0-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'STATS', '4829e760-d73f-11ec-94a0-cd6fda244b19', '188f3780-d68b-11ec-aefb-d132b4563e73', 1652942733526);
INSERT INTO "public"."event" VALUES ('4b2721d0-d73f-11ec-94a0-cd6fda244b19', 1652942738541, '{"server":"SZCL21HOUYONG","messagesProcessed":1,"errorsOccurred":0}', '190e0470-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'STATS', '4b2721d0-d73f-11ec-94a0-cd6fda244b19', '188f3780-d68b-11ec-aefb-d132b4563e73', 1652942738541);
INSERT INTO "public"."event" VALUES ('3cc8c870-d75b-11ec-0000-000000000000', 1652954740343, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '1901cf70-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', '3cc8c870-d75b-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1652954740343);
INSERT INTO "public"."event" VALUES ('3ce0e450-d75b-11ec-0000-000000000000', 1652954740501, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '18f3c5b0-d68b-11ec-aefb-d132b4563e73', 'RULE_CHAIN', 'LC_EVENT', '3ce0e450-d75b-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1652954740501);
INSERT INTO "public"."event" VALUES ('3cc80521-d75b-11ec-bbb2-75d848708cb6', 1652954740338, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '1908ad40-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', '3cc80521-d75b-11ec-bbb2-75d848708cb6', '188f3780-d68b-11ec-aefb-d132b4563e73', 1652954740338);
INSERT INTO "public"."event" VALUES ('3cc80520-d75b-11ec-bbb2-75d848708cb6', 1652954740338, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '190a5af0-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', '3cc80520-d75b-11ec-bbb2-75d848708cb6', '188f3780-d68b-11ec-aefb-d132b4563e73', 1652954740338);
INSERT INTO "public"."event" VALUES ('3daee2b0-d75b-11ec-bbb2-75d848708cb6', 1652954741851, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '190fb220-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', '3daee2b0-d75b-11ec-bbb2-75d848708cb6', '188f3780-d68b-11ec-aefb-d132b4563e73', 1652954741851);
INSERT INTO "public"."event" VALUES ('3db0b770-d75b-11ec-bbb2-75d848708cb6', 1652954741863, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '1911adf0-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', '3db0b770-d75b-11ec-bbb2-75d848708cb6', '188f3780-d68b-11ec-aefb-d132b4563e73', 1652954741863);
INSERT INTO "public"."event" VALUES ('405b16f0-d75b-11ec-bbb2-75d848708cb6', 1652954746335, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '190c08a0-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', '405b16f0-d75b-11ec-bbb2-75d848708cb6', '188f3780-d68b-11ec-aefb-d132b4563e73', 1652954746335);
INSERT INTO "public"."event" VALUES ('4075a3d0-d75b-11ec-bbb2-75d848708cb6', 1652954746509, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '190e0470-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', '4075a3d0-d75b-11ec-bbb2-75d848708cb6', '188f3780-d68b-11ec-aefb-d132b4563e73', 1652954746509);
INSERT INTO "public"."event" VALUES ('f9d77f20-d822-11ec-0000-000000000000', 1653040527378, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '190a5af0-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', 'f9d77f20-d822-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1653040527378);
INSERT INTO "public"."event" VALUES ('f9f31d70-d822-11ec-0000-000000000000', 1653040527559, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '1901cf70-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', 'f9f31d70-d822-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1653040527559);
INSERT INTO "public"."event" VALUES ('fa281020-d822-11ec-0000-000000000000', 1653040527906, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '18f3c5b0-d68b-11ec-aefb-d132b4563e73', 'RULE_CHAIN', 'LC_EVENT', 'fa281020-d822-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1653040527906);
INSERT INTO "public"."event" VALUES ('fa2ccb10-d822-11ec-0000-000000000000', 1653040527937, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '190fb220-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', 'fa2ccb10-d822-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1653040527937);
INSERT INTO "public"."event" VALUES ('fa357da0-d822-11ec-0000-000000000000', 1653040527994, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '1911adf0-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', 'fa357da0-d822-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1653040527994);
INSERT INTO "public"."event" VALUES ('f9d66db0-d822-11ec-b78c-b77651e82ef4', 1653040527371, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '1908ad40-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', 'f9d66db0-d822-11ec-b78c-b77651e82ef4', '188f3780-d68b-11ec-aefb-d132b4563e73', 1653040527371);
INSERT INTO "public"."event" VALUES ('ff4655d0-d822-11ec-b78c-b77651e82ef4', 1653040536493, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '190c08a0-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', 'ff4655d0-d822-11ec-b78c-b77651e82ef4', '188f3780-d68b-11ec-aefb-d132b4563e73', 1653040536493);
INSERT INTO "public"."event" VALUES ('ff70e840-d822-11ec-b78c-b77651e82ef4', 1653040536772, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '190e0470-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', 'ff70e840-d822-11ec-b78c-b77651e82ef4', '188f3780-d68b-11ec-aefb-d132b4563e73', 1653040536772);
INSERT INTO "public"."event" VALUES ('170b6340-d823-11ec-b78c-b77651e82ef4', 1653040576372, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '16e16d10-d823-11ec-b78c-b77651e82ef4', 'RULE_CHAIN', 'LC_EVENT', '170b6340-d823-11ec-b78c-b77651e82ef4', '188f3780-d68b-11ec-aefb-d132b4563e73', 1653040576372);
INSERT INTO "public"."event" VALUES ('170d8620-d823-11ec-b78c-b77651e82ef4', 1653040576386, '{"server":"SZCL21HOUYONG","event":"CREATED","success":true}', '16e16d10-d823-11ec-b78c-b77651e82ef4', 'RULE_CHAIN', 'LC_EVENT', '170d8620-d823-11ec-b78c-b77651e82ef4', '188f3780-d68b-11ec-aefb-d132b4563e73', 1653040576386);
INSERT INTO "public"."event" VALUES ('6f3f6de0-db2a-11ec-0000-000000000000', 1653373584318, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '190a5af0-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', '6f3f6de0-db2a-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1653373584318);
INSERT INTO "public"."event" VALUES ('6f3ada00-db2a-11ec-0000-000000000000', 1653373584288, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '1908ad40-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', '6f3ada00-db2a-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1653373584288);
INSERT INTO "public"."event" VALUES ('6f3e0e50-db2a-11ec-0000-000000000000', 1653373584309, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '1901cf70-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', '6f3e0e50-db2a-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1653373584309);
INSERT INTO "public"."event" VALUES ('6f54f1b0-db2a-11ec-0000-000000000000', 1653373584459, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '18f3c5b0-d68b-11ec-aefb-d132b4563e73', 'RULE_CHAIN', 'LC_EVENT', '6f54f1b0-db2a-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1653373584459);
INSERT INTO "public"."event" VALUES ('6f573ba0-db2a-11ec-0000-000000000000', 1653373584474, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '190fb220-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', '6f573ba0-db2a-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1653373584474);
INSERT INTO "public"."event" VALUES ('6f5b5a50-db2a-11ec-0000-000000000000', 1653373584501, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '1911adf0-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', '6f5b5a50-db2a-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1653373584501);
INSERT INTO "public"."event" VALUES ('6f29ea10-db2a-11ec-97d4-5555813c4bbf', 1653373584177, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '16e16d10-d823-11ec-b78c-b77651e82ef4', 'RULE_CHAIN', 'LC_EVENT', '6f29ea10-db2a-11ec-97d4-5555813c4bbf', '188f3780-d68b-11ec-aefb-d132b4563e73', 1653373584177);
INSERT INTO "public"."event" VALUES ('7302de80-db2a-11ec-97d4-5555813c4bbf', 1653373590632, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '190c08a0-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', '7302de80-db2a-11ec-97d4-5555813c4bbf', '188f3780-d68b-11ec-aefb-d132b4563e73', 1653373590632);
INSERT INTO "public"."event" VALUES ('73202a80-db2a-11ec-97d4-5555813c4bbf', 1653373590824, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '190e0470-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', '73202a80-db2a-11ec-97d4-5555813c4bbf', '188f3780-d68b-11ec-aefb-d132b4563e73', 1653373590824);
INSERT INTO "public"."event" VALUES ('d1044b10-db32-11ec-97d4-5555813c4bbf', 1653377184321, '{"server":"SZCL21HOUYONG","messagesProcessed":4,"errorsOccurred":0}', '190a5af0-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'STATS', 'd1044b10-db32-11ec-97d4-5555813c4bbf', '188f3780-d68b-11ec-aefb-d132b4563e73', 1653377184321);
INSERT INTO "public"."event" VALUES ('d1201070-db32-11ec-97d4-5555813c4bbf', 1653377184503, '{"server":"SZCL21HOUYONG","messagesProcessed":63,"errorsOccurred":0}', '1911adf0-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'STATS', 'd1201070-db32-11ec-97d4-5555813c4bbf', '188f3780-d68b-11ec-aefb-d132b4563e73', 1653377184503);
INSERT INTO "public"."event" VALUES ('f97539a0-db3d-11ec-97d4-5555813c4bbf', 1653381976634, '{"server":"SZCL21HOUYONG","messagesProcessed":19,"errorsOccurred":0}', '1911adf0-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'STATS', 'f97539a0-db3d-11ec-97d4-5555813c4bbf', '188f3780-d68b-11ec-aefb-d132b4563e73', 1653381976634);
INSERT INTO "public"."event" VALUES ('231a84f0-dfe8-11ec-0000-000000000000', 1653894865599, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '190a5af0-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', '231a84f0-dfe8-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1653894865599);
INSERT INTO "public"."event" VALUES ('231777b0-dfe8-11ec-0000-000000000000', 1653894865579, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '1908ad40-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', '231777b0-dfe8-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1653894865579);
INSERT INTO "public"."event" VALUES ('23197380-dfe8-11ec-0000-000000000000', 1653894865592, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '1901cf70-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', '23197380-dfe8-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1653894865592);
INSERT INTO "public"."event" VALUES ('2325a880-dfe8-11ec-0000-000000000000', 1653894865672, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '18f3c5b0-d68b-11ec-aefb-d132b4563e73', 'RULE_CHAIN', 'LC_EVENT', '2325a880-dfe8-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1653894865672);
INSERT INTO "public"."event" VALUES ('2326e100-dfe8-11ec-0000-000000000000', 1653894865680, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '190fb220-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', '2326e100-dfe8-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1653894865680);
INSERT INTO "public"."event" VALUES ('232ad8a0-dfe8-11ec-0000-000000000000', 1653894865706, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '1911adf0-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', '232ad8a0-dfe8-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1653894865706);
INSERT INTO "public"."event" VALUES ('23072400-dfe8-11ec-8ed5-7dcca2d50cf1', 1653894865472, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '16e16d10-d823-11ec-b78c-b77651e82ef4', 'RULE_CHAIN', 'LC_EVENT', '23072400-dfe8-11ec-8ed5-7dcca2d50cf1', '188f3780-d68b-11ec-aefb-d132b4563e73', 1653894865472);
INSERT INTO "public"."event" VALUES ('28382e60-dfe8-11ec-8ed5-7dcca2d50cf1', 1653894874182, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '190c08a0-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', '28382e60-dfe8-11ec-8ed5-7dcca2d50cf1', '188f3780-d68b-11ec-aefb-d132b4563e73', 1653894874182);
INSERT INTO "public"."event" VALUES ('285d90b0-dfe8-11ec-8ed5-7dcca2d50cf1', 1653894874427, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '190e0470-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', '285d90b0-dfe8-11ec-8ed5-7dcca2d50cf1', '188f3780-d68b-11ec-aefb-d132b4563e73', 1653894874427);
INSERT INTO "public"."event" VALUES ('63919110-e563-11ec-0000-000000000000', 1654497557665, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '1908ad40-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', '63919110-e563-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654497557665);
INSERT INTO "public"."event" VALUES ('63951380-e563-11ec-0000-000000000000', 1654497557688, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '190a5af0-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', '63951380-e563-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654497557688);
INSERT INTO "public"."event" VALUES ('6394ec70-e563-11ec-0000-000000000000', 1654497557687, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '1901cf70-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', '6394ec70-e563-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654497557687);
INSERT INTO "public"."event" VALUES ('63cc5020-e563-11ec-0000-000000000000', 1654497558050, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '18f3c5b0-d68b-11ec-aefb-d132b4563e73', 'RULE_CHAIN', 'LC_EVENT', '63cc5020-e563-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654497558050);
INSERT INTO "public"."event" VALUES ('63d79ac0-e563-11ec-0000-000000000000', 1654497558124, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '190fb220-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', '63d79ac0-e563-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654497558124);
INSERT INTO "public"."event" VALUES ('63e49310-e563-11ec-0000-000000000000', 1654497558209, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '1911adf0-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', '63e49310-e563-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654497558209);
INSERT INTO "public"."event" VALUES ('6381b290-e563-11ec-a8c7-4b21fe31dd59', 1654497557561, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '16e16d10-d823-11ec-b78c-b77651e82ef4', 'RULE_CHAIN', 'LC_EVENT', '6381b290-e563-11ec-a8c7-4b21fe31dd59', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654497557561);
INSERT INTO "public"."event" VALUES ('684973d0-e563-11ec-a8c7-4b21fe31dd59', 1654497565581, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '190e0470-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', '684973d0-e563-11ec-a8c7-4b21fe31dd59', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654497565581);
INSERT INTO "public"."event" VALUES ('687df150-e563-11ec-a8c7-4b21fe31dd59', 1654497565925, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '190c08a0-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', '687df150-e563-11ec-a8c7-4b21fe31dd59', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654497565925);
INSERT INTO "public"."event" VALUES ('c559c9a0-e56b-11ec-a8c7-4b21fe31dd59', 1654501157690, '{"server":"SZCL21HOUYONG","messagesProcessed":2,"errorsOccurred":0}', '190a5af0-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'STATS', 'c559c9a0-e56b-11ec-a8c7-4b21fe31dd59', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654501157690);
INSERT INTO "public"."event" VALUES ('c5a92220-e56b-11ec-a8c7-4b21fe31dd59', 1654501158210, '{"server":"SZCL21HOUYONG","messagesProcessed":63,"errorsOccurred":0}', '1911adf0-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'STATS', 'c5a92220-e56b-11ec-a8c7-4b21fe31dd59', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654501158210);
INSERT INTO "public"."event" VALUES ('276db130-e574-11ec-a8c7-4b21fe31dd59', 1654504758211, '{"server":"SZCL21HOUYONG","messagesProcessed":60,"errorsOccurred":0}', '1911adf0-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'STATS', '276db130-e574-11ec-a8c7-4b21fe31dd59', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654504758211);
INSERT INTO "public"."event" VALUES ('88e299a0-e57c-11ec-a8c7-4b21fe31dd59', 1654508357690, '{"server":"SZCL21HOUYONG","messagesProcessed":3,"errorsOccurred":0}', '190a5af0-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'STATS', '88e299a0-e57c-11ec-a8c7-4b21fe31dd59', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654508357690);
INSERT INTO "public"."event" VALUES ('89321930-e57c-11ec-a8c7-4b21fe31dd59', 1654508358211, '{"server":"SZCL21HOUYONG","messagesProcessed":63,"errorsOccurred":0}', '1911adf0-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'STATS', '89321930-e57c-11ec-a8c7-4b21fe31dd59', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654508358211);
INSERT INTO "public"."event" VALUES ('f4f70a30-e622-11ec-0000-000000000000', 1654579835475, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '190a5af0-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', 'f4f70a30-e622-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654579835475);
INSERT INTO "public"."event" VALUES ('f4f02c60-e622-11ec-0000-000000000000', 1654579835430, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '1908ad40-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', 'f4f02c60-e622-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654579835430);
INSERT INTO "public"."event" VALUES ('f4f55c80-e622-11ec-0000-000000000000', 1654579835464, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '1901cf70-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', 'f4f55c80-e622-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654579835464);
INSERT INTO "public"."event" VALUES ('f509f5f0-e622-11ec-0000-000000000000', 1654579835599, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '18f3c5b0-d68b-11ec-aefb-d132b4563e73', 'RULE_CHAIN', 'LC_EVENT', 'f509f5f0-e622-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654579835599);
INSERT INTO "public"."event" VALUES ('f50bcab0-e622-11ec-0000-000000000000', 1654579835611, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '190fb220-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', 'f50bcab0-e622-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654579835611);
INSERT INTO "public"."event" VALUES ('f50f9b40-e622-11ec-0000-000000000000', 1654579835636, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '1911adf0-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', 'f50f9b40-e622-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654579835636);
INSERT INTO "public"."event" VALUES ('f4ba7660-e622-11ec-b35c-31363bed489b', 1654579835078, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '16e16d10-d823-11ec-b78c-b77651e82ef4', 'RULE_CHAIN', 'LC_EVENT', 'f4ba7660-e622-11ec-b35c-31363bed489b', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654579835078);
INSERT INTO "public"."event" VALUES ('f8def2c0-e622-11ec-b35c-31363bed489b', 1654579842028, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '190c08a0-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', 'f8def2c0-e622-11ec-b35c-31363bed489b', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654579842028);
INSERT INTO "public"."event" VALUES ('f8fd9e50-e622-11ec-b35c-31363bed489b', 1654579842229, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '190e0470-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', 'f8fd9e50-e622-11ec-b35c-31363bed489b', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654579842229);
INSERT INTO "public"."event" VALUES ('a6473b60-e624-11ec-0000-000000000000', 1654580562454, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '1908ad40-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', 'a6473b60-e624-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654580562454);
INSERT INTO "public"."event" VALUES ('a64c1d60-e624-11ec-0000-000000000000', 1654580562486, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '190a5af0-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', 'a64c1d60-e624-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654580562486);
INSERT INTO "public"."event" VALUES ('ab2bfa80-e624-11ec-871b-f7fe22c5fccb', 1654580570664, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '190c08a0-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', 'ab2bfa80-e624-11ec-871b-f7fe22c5fccb', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654580570664);
INSERT INTO "public"."event" VALUES ('ab5af9c0-e624-11ec-871b-f7fe22c5fccb', 1654580570972, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '190e0470-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', 'ab5af9c0-e624-11ec-871b-f7fe22c5fccb', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654580570972);
INSERT INTO "public"."event" VALUES ('a64bf650-e624-11ec-0000-000000000000', 1654580562485, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '1901cf70-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', 'a64bf650-e624-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654580562485);
INSERT INTO "public"."event" VALUES ('a66bb350-e624-11ec-0000-000000000000', 1654580562693, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '18f3c5b0-d68b-11ec-aefb-d132b4563e73', 'RULE_CHAIN', 'LC_EVENT', 'a66bb350-e624-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654580562693);
INSERT INTO "public"."event" VALUES ('a670bc60-e624-11ec-0000-000000000000', 1654580562726, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '190fb220-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', 'a670bc60-e624-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654580562726);
INSERT INTO "public"."event" VALUES ('a6755040-e624-11ec-0000-000000000000', 1654580562756, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '1911adf0-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', 'a6755040-e624-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654580562756);
INSERT INTO "public"."event" VALUES ('a631b790-e624-11ec-871b-f7fe22c5fccb', 1654580562313, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '16e16d10-d823-11ec-b78c-b77651e82ef4', 'RULE_CHAIN', 'LC_EVENT', 'a631b790-e624-11ec-871b-f7fe22c5fccb', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654580562313);
INSERT INTO "public"."event" VALUES ('54786330-e62f-11ec-0000-000000000000', 1654585149667, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '1908ad40-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', '54786330-e62f-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654585149667);
INSERT INTO "public"."event" VALUES ('547afb40-e62f-11ec-0000-000000000000', 1654585149684, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '190a5af0-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', '547afb40-e62f-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654585149684);
INSERT INTO "public"."event" VALUES ('547ad430-e62f-11ec-0000-000000000000', 1654585149683, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '1901cf70-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', '547ad430-e62f-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654585149683);
INSERT INTO "public"."event" VALUES ('54905800-e62f-11ec-0000-000000000000', 1654585149824, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '18f3c5b0-d68b-11ec-aefb-d132b4563e73', 'RULE_CHAIN', 'LC_EVENT', '54905800-e62f-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654585149824);
INSERT INTO "public"."event" VALUES ('549958b0-e62f-11ec-0000-000000000000', 1654585149883, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '190fb220-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', '549958b0-e62f-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654585149883);
INSERT INTO "public"."event" VALUES ('549dc580-e62f-11ec-0000-000000000000', 1654585149912, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '1911adf0-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', '549dc580-e62f-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654585149912);
INSERT INTO "public"."event" VALUES ('5463a2b0-e62f-11ec-988f-4dde5f7f53fd', 1654585149531, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '16e16d10-d823-11ec-b78c-b77651e82ef4', 'RULE_CHAIN', 'LC_EVENT', '5463a2b0-e62f-11ec-988f-4dde5f7f53fd', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654585149531);
INSERT INTO "public"."event" VALUES ('58572400-e62f-11ec-988f-4dde5f7f53fd', 1654585156160, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '190c08a0-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', '58572400-e62f-11ec-988f-4dde5f7f53fd', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654585156160);
INSERT INTO "public"."event" VALUES ('58755a60-e62f-11ec-988f-4dde5f7f53fd', 1654585156358, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '190e0470-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', '58755a60-e62f-11ec-988f-4dde5f7f53fd', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654585156358);
INSERT INTO "public"."event" VALUES ('72b8e540-e643-11ec-0000-000000000000', 1654593790356, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '190a5af0-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', '72b8e540-e643-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654593790356);
INSERT INTO "public"."event" VALUES ('72b62620-e643-11ec-0000-000000000000', 1654593790338, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '1908ad40-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', '72b62620-e643-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654593790338);
INSERT INTO "public"."event" VALUES ('72b785b0-e643-11ec-0000-000000000000', 1654593790347, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '1901cf70-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', '72b785b0-e643-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654593790347);
INSERT INTO "public"."event" VALUES ('72e99230-e643-11ec-0000-000000000000', 1654593790675, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '18f3c5b0-d68b-11ec-aefb-d132b4563e73', 'RULE_CHAIN', 'LC_EVENT', '72e99230-e643-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654593790675);
INSERT INTO "public"."event" VALUES ('72f7c300-e643-11ec-0000-000000000000', 1654593790768, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '190fb220-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', '72f7c300-e643-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654593790768);
INSERT INTO "public"."event" VALUES ('7312ec20-e643-11ec-0000-000000000000', 1654593790946, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '1911adf0-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', '7312ec20-e643-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654593790946);
INSERT INTO "public"."event" VALUES ('729cf8d0-e643-11ec-832a-b9b04de1ad3c', 1654593790173, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '16e16d10-d823-11ec-b78c-b77651e82ef4', 'RULE_CHAIN', 'LC_EVENT', '729cf8d0-e643-11ec-832a-b9b04de1ad3c', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654593790173);
INSERT INTO "public"."event" VALUES ('7792a7e0-e643-11ec-832a-b9b04de1ad3c', 1654593798494, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '190e0470-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', '7792a7e0-e643-11ec-832a-b9b04de1ad3c', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654593798494);
INSERT INTO "public"."event" VALUES ('77b439a0-e643-11ec-832a-b9b04de1ad3c', 1654593798714, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '190c08a0-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', '77b439a0-e643-11ec-832a-b9b04de1ad3c', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654593798714);
INSERT INTO "public"."event" VALUES ('af909c10-e643-11ec-0000-000000000000', 1654593892433, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '1908ad40-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', 'af909c10-e643-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654593892433);
INSERT INTO "public"."event" VALUES ('af97c800-e643-11ec-0000-000000000000', 1654593892480, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '190a5af0-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', 'af97c800-e643-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654593892480);
INSERT INTO "public"."event" VALUES ('af941e80-e643-11ec-0000-000000000000', 1654593892456, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '1901cf70-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', 'af941e80-e643-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654593892456);
INSERT INTO "public"."event" VALUES ('afa90610-e643-11ec-0000-000000000000', 1654593892593, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '18f3c5b0-d68b-11ec-aefb-d132b4563e73', 'RULE_CHAIN', 'LC_EVENT', 'afa90610-e643-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654593892593);
INSERT INTO "public"."event" VALUES ('afab5000-e643-11ec-0000-000000000000', 1654593892608, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '190fb220-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', 'afab5000-e643-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654593892608);
INSERT INTO "public"."event" VALUES ('afaeab60-e643-11ec-0000-000000000000', 1654593892630, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '1911adf0-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', 'afaeab60-e643-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654593892630);
INSERT INTO "public"."event" VALUES ('af6f3160-e643-11ec-816a-29d7b971000d', 1654593892214, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '16e16d10-d823-11ec-b78c-b77651e82ef4', 'RULE_CHAIN', 'LC_EVENT', 'af6f3160-e643-11ec-816a-29d7b971000d', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654593892214);
INSERT INTO "public"."event" VALUES ('b359b200-e643-11ec-816a-29d7b971000d', 1654593898784, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '190c08a0-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', 'b359b200-e643-11ec-816a-29d7b971000d', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654593898784);
INSERT INTO "public"."event" VALUES ('b378f9d0-e643-11ec-816a-29d7b971000d', 1654593898989, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '190e0470-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', 'b378f9d0-e643-11ec-816a-29d7b971000d', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654593898989);
INSERT INTO "public"."event" VALUES ('ec4c22e0-e644-11ec-0000-000000000000', 1654594423822, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '1908ad40-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', 'ec4c22e0-e644-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654594423822);
INSERT INTO "public"."event" VALUES ('ec4fa550-e644-11ec-0000-000000000000', 1654594423845, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '190a5af0-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', 'ec4fa550-e644-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654594423845);
INSERT INTO "public"."event" VALUES ('ec4e45c0-e644-11ec-0000-000000000000', 1654594423836, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '1901cf70-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', 'ec4e45c0-e644-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654594423836);
INSERT INTO "public"."event" VALUES ('ec64b3f0-e644-11ec-0000-000000000000', 1654594423983, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '18f3c5b0-d68b-11ec-aefb-d132b4563e73', 'RULE_CHAIN', 'LC_EVENT', 'ec64b3f0-e644-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654594423983);
INSERT INTO "public"."event" VALUES ('ec66fde0-e644-11ec-0000-000000000000', 1654594423998, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '190fb220-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', 'ec66fde0-e644-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654594423998);
INSERT INTO "public"."event" VALUES ('ec6b6ab0-e644-11ec-0000-000000000000', 1654594424027, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '1911adf0-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', 'ec6b6ab0-e644-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654594424027);
INSERT INTO "public"."event" VALUES ('ec2d5040-e644-11ec-bd1f-4b7366e66aa1', 1654594423620, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '16e16d10-d823-11ec-b78c-b77651e82ef4', 'RULE_CHAIN', 'LC_EVENT', 'ec2d5040-e644-11ec-bd1f-4b7366e66aa1', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654594423620);
INSERT INTO "public"."event" VALUES ('f07692b0-e644-11ec-bd1f-4b7366e66aa1', 1654594430811, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '190e0470-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', 'f07692b0-e644-11ec-bd1f-4b7366e66aa1', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654594430811);
INSERT INTO "public"."event" VALUES ('f0995cf0-e644-11ec-bd1f-4b7366e66aa1', 1654594431039, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '190c08a0-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', 'f0995cf0-e644-11ec-bd1f-4b7366e66aa1', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654594431039);
INSERT INTO "public"."event" VALUES ('37dfd2b0-e645-11ec-0000-000000000000', 1654594550619, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '1908ad40-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', '37dfd2b0-e645-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654594550619);
INSERT INTO "public"."event" VALUES ('37e26ac0-e645-11ec-0000-000000000000', 1654594550636, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '190a5af0-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', '37e26ac0-e645-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654594550636);
INSERT INTO "public"."event" VALUES ('37e243b0-e645-11ec-0000-000000000000', 1654594550635, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '1901cf70-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', '37e243b0-e645-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654594550635);
INSERT INTO "public"."event" VALUES ('38013d60-e645-11ec-0000-000000000000', 1654594550838, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '18f3c5b0-d68b-11ec-aefb-d132b4563e73', 'RULE_CHAIN', 'LC_EVENT', '38013d60-e645-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654594550838);
INSERT INTO "public"."event" VALUES ('3803ae60-e645-11ec-0000-000000000000', 1654594550854, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '190fb220-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', '3803ae60-e645-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654594550854);
INSERT INTO "public"."event" VALUES ('380730d0-e645-11ec-0000-000000000000', 1654594550877, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '1911adf0-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', '380730d0-e645-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654594550877);
INSERT INTO "public"."event" VALUES ('37cdd150-e645-11ec-9036-a740e0e4fa2b', 1654594550501, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '16e16d10-d823-11ec-b78c-b77651e82ef4', 'RULE_CHAIN', 'LC_EVENT', '37cdd150-e645-11ec-9036-a740e0e4fa2b', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654594550501);
INSERT INTO "public"."event" VALUES ('3bb12600-e645-11ec-9036-a740e0e4fa2b', 1654594557024, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '190c08a0-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', '3bb12600-e645-11ec-9036-a740e0e4fa2b', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654594557024);
INSERT INTO "public"."event" VALUES ('3bd4b390-e645-11ec-9036-a740e0e4fa2b', 1654594557257, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '190e0470-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', '3bd4b390-e645-11ec-9036-a740e0e4fa2b', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654594557257);
INSERT INTO "public"."event" VALUES ('638c96e0-e646-11ec-0000-000000000000', 1654595053390, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '1908ad40-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', '638c96e0-e646-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654595053390);
INSERT INTO "public"."event" VALUES ('6392ff80-e646-11ec-0000-000000000000', 1654595053432, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '190a5af0-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', '6392ff80-e646-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654595053432);
INSERT INTO "public"."event" VALUES ('638ee0d0-e646-11ec-0000-000000000000', 1654595053405, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '1901cf70-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', '638ee0d0-e646-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654595053405);
INSERT INTO "public"."event" VALUES ('63aaf450-e646-11ec-0000-000000000000', 1654595053589, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '18f3c5b0-d68b-11ec-aefb-d132b4563e73', 'RULE_CHAIN', 'LC_EVENT', '63aaf450-e646-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654595053589);
INSERT INTO "public"."event" VALUES ('63acf020-e646-11ec-0000-000000000000', 1654595053602, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '190fb220-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', '63acf020-e646-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654595053602);
INSERT INTO "public"."event" VALUES ('63b07290-e646-11ec-0000-000000000000', 1654595053625, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '1911adf0-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', '63b07290-e646-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654595053625);
INSERT INTO "public"."event" VALUES ('63720a00-e646-11ec-8776-1b723730740b', 1654595053216, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '16e16d10-d823-11ec-b78c-b77651e82ef4', 'RULE_CHAIN', 'LC_EVENT', '63720a00-e646-11ec-8776-1b723730740b', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654595053216);
INSERT INTO "public"."event" VALUES ('6799bab0-e646-11ec-8776-1b723730740b', 1654595060187, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '190c08a0-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', '6799bab0-e646-11ec-8776-1b723730740b', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654595060187);
INSERT INTO "public"."event" VALUES ('67b706b0-e646-11ec-8776-1b723730740b', 1654595060379, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '190e0470-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', '67b706b0-e646-11ec-8776-1b723730740b', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654595060379);
INSERT INTO "public"."event" VALUES ('a5a388e1-e646-11ec-0000-000000000000', 1654595164270, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '190a5af0-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', 'a5a388e1-e646-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654595164270);
INSERT INTO "public"."event" VALUES ('a5a05490-e646-11ec-0000-000000000000', 1654595164249, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '1908ad40-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', 'a5a05490-e646-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654595164249);
INSERT INTO "public"."event" VALUES ('a5a388e0-e646-11ec-0000-000000000000', 1654595164270, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '1901cf70-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', 'a5a388e0-e646-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654595164270);
INSERT INTO "public"."event" VALUES ('a5bb0880-e646-11ec-0000-000000000000', 1654595164424, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '18f3c5b0-d68b-11ec-aefb-d132b4563e73', 'RULE_CHAIN', 'LC_EVENT', 'a5bb0880-e646-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654595164424);
INSERT INTO "public"."event" VALUES ('a5bfc370-e646-11ec-0000-000000000000', 1654595164455, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '190fb220-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', 'a5bfc370-e646-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654595164455);
INSERT INTO "public"."event" VALUES ('a5c3e220-e646-11ec-0000-000000000000', 1654595164482, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '1911adf0-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', 'a5c3e220-e646-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654595164482);
INSERT INTO "public"."event" VALUES ('a560b380-e646-11ec-83d6-e7afab002761', 1654595163832, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '16e16d10-d823-11ec-b78c-b77651e82ef4', 'RULE_CHAIN', 'LC_EVENT', 'a560b380-e646-11ec-83d6-e7afab002761', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654595163832);
INSERT INTO "public"."event" VALUES ('a9a53b00-e646-11ec-83d6-e7afab002761', 1654595170992, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '190e0470-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', 'a9a53b00-e646-11ec-83d6-e7afab002761', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654595170992);
INSERT INTO "public"."event" VALUES ('a9c434b0-e646-11ec-83d6-e7afab002761', 1654595171195, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '190c08a0-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', 'a9c434b0-e646-11ec-83d6-e7afab002761', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654595171195);
INSERT INTO "public"."event" VALUES ('068308c0-e647-11ec-0000-000000000000', 1654595326796, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '1908ad40-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', '068308c0-e647-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654595326796);
INSERT INTO "public"."event" VALUES ('06861600-e647-11ec-0000-000000000000', 1654595326816, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '190a5af0-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', '06861600-e647-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654595326816);
INSERT INTO "public"."event" VALUES ('068579c0-e647-11ec-0000-000000000000', 1654595326812, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '1901cf70-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', '068579c0-e647-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654595326812);
INSERT INTO "public"."event" VALUES ('06c60530-e647-11ec-0000-000000000000', 1654595327235, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '18f3c5b0-d68b-11ec-aefb-d132b4563e73', 'RULE_CHAIN', 'LC_EVENT', '06c60530-e647-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654595327235);
INSERT INTO "public"."event" VALUES ('06c9d5c0-e647-11ec-0000-000000000000', 1654595327260, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '190fb220-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', '06c9d5c0-e647-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654595327260);
INSERT INTO "public"."event" VALUES ('06cdf470-e647-11ec-0000-000000000000', 1654595327287, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '1911adf0-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', '06cdf470-e647-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654595327287);
INSERT INTO "public"."event" VALUES ('066a50a0-e647-11ec-8507-fd8720977a22', 1654595326634, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '16e16d10-d823-11ec-b78c-b77651e82ef4', 'RULE_CHAIN', 'LC_EVENT', '066a50a0-e647-11ec-8507-fd8720977a22', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654595326634);
INSERT INTO "public"."event" VALUES ('0b884830-e647-11ec-8507-fd8720977a22', 1654595335219, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '190e0470-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', '0b884830-e647-11ec-8507-fd8720977a22', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654595335219);
INSERT INTO "public"."event" VALUES ('0bb41320-e647-11ec-8507-fd8720977a22', 1654595335506, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '190c08a0-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', '0bb41320-e647-11ec-8507-fd8720977a22', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654595335506);
INSERT INTO "public"."event" VALUES ('601efc80-e648-11ec-0000-000000000000', 1654595906632, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '1908ad40-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', '601efc80-e648-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654595906632);
INSERT INTO "public"."event" VALUES ('60219490-e648-11ec-0000-000000000000', 1654595906649, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '1901cf70-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', '60219490-e648-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654595906649);
INSERT INTO "public"."event" VALUES ('60317310-e648-11ec-0000-000000000000', 1654595906753, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '18f3c5b0-d68b-11ec-aefb-d132b4563e73', 'RULE_CHAIN', 'LC_EVENT', '60317310-e648-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654595906753);
INSERT INTO "public"."event" VALUES ('60336ee0-e648-11ec-0000-000000000000', 1654595906766, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '190fb220-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', '60336ee0-e648-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654595906766);
INSERT INTO "public"."event" VALUES ('603877f0-e648-11ec-0000-000000000000', 1654595906799, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '1911adf0-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', '603877f0-e648-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654595906799);
INSERT INTO "public"."event" VALUES ('60092a90-e648-11ec-b13a-b59abbf8e7df', 1654595906489, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '16e16d10-d823-11ec-b78c-b77651e82ef4', 'RULE_CHAIN', 'LC_EVENT', '60092a90-e648-11ec-b13a-b59abbf8e7df', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654595906489);
INSERT INTO "public"."event" VALUES ('44665141-e649-11ec-0000-000000000000', 1654596289620, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '190a5af0-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', '44665141-e649-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654596289620);
INSERT INTO "public"."event" VALUES ('48361df0-e649-11ec-a923-8f85748e76aa', 1654596296015, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '190c08a0-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', '48361df0-e649-11ec-a923-8f85748e76aa', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654596296015);
INSERT INTO "public"."event" VALUES ('48569e40-e649-11ec-a923-8f85748e76aa', 1654596296228, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '190e0470-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', '48569e40-e649-11ec-a923-8f85748e76aa', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654596296228);
INSERT INTO "public"."event" VALUES ('1cf75750-e7c8-11ec-0000-000000000000', 1654760720709, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '1908ad40-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', '1cf75750-e7c8-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654760720709);
INSERT INTO "public"."event" VALUES ('1cf9c850-e7c8-11ec-0000-000000000000', 1654760720725, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '1901cf70-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', '1cf9c850-e7c8-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654760720725);
INSERT INTO "public"."event" VALUES ('1d0adf50-e7c8-11ec-0000-000000000000', 1654760720837, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '18f3c5b0-d68b-11ec-aefb-d132b4563e73', 'RULE_CHAIN', 'LC_EVENT', '1d0adf50-e7c8-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654760720837);
INSERT INTO "public"."event" VALUES ('1d0dec90-e7c8-11ec-0000-000000000000', 1654760720857, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '190fb220-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', '1d0dec90-e7c8-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654760720857);
INSERT INTO "public"."event" VALUES ('1d158db0-e7c8-11ec-0000-000000000000', 1654760720907, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '1911adf0-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', '1d158db0-e7c8-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654760720907);
INSERT INTO "public"."event" VALUES ('b2f63b80-e7d3-11ec-0000-000000000000', 1654765696824, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '1908ad40-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', 'b2f63b80-e7d3-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654765696824);
INSERT INTO "public"."event" VALUES ('b2f88570-e7d3-11ec-0000-000000000000', 1654765696839, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '1901cf70-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', 'b2f88570-e7d3-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654765696839);
INSERT INTO "public"."event" VALUES ('b3236600-e7d3-11ec-0000-000000000000', 1654765697120, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '18f3c5b0-d68b-11ec-aefb-d132b4563e73', 'RULE_CHAIN', 'LC_EVENT', 'b3236600-e7d3-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654765697120);
INSERT INTO "public"."event" VALUES ('b32a43d0-e7d3-11ec-0000-000000000000', 1654765697165, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '190fb220-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', 'b32a43d0-e7d3-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654765697165);
INSERT INTO "public"."event" VALUES ('b32fc210-e7d3-11ec-0000-000000000000', 1654765697201, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '1911adf0-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', 'b32fc210-e7d3-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654765697201);
INSERT INTO "public"."event" VALUES ('44640750-e649-11ec-0000-000000000000', 1654596289605, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '1908ad40-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', '44640750-e649-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654596289605);
INSERT INTO "public"."event" VALUES ('44665140-e649-11ec-0000-000000000000', 1654596289620, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '1901cf70-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', '44665140-e649-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654596289620);
INSERT INTO "public"."event" VALUES ('4481ef90-e649-11ec-0000-000000000000', 1654596289801, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '18f3c5b0-d68b-11ec-aefb-d132b4563e73', 'RULE_CHAIN', 'LC_EVENT', '4481ef90-e649-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654596289801);
INSERT INTO "public"."event" VALUES ('448487a0-e649-11ec-0000-000000000000', 1654596289818, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '190fb220-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', '448487a0-e649-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654596289818);
INSERT INTO "public"."event" VALUES ('448b8c80-e649-11ec-0000-000000000000', 1654596289864, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '1911adf0-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', '448b8c80-e649-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654596289864);
INSERT INTO "public"."event" VALUES ('1cf9c851-e7c8-11ec-0000-000000000000', 1654760720725, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '190a5af0-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', '1cf9c851-e7c8-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654760720725);
INSERT INTO "public"."event" VALUES ('20a962d0-e7c8-11ec-b0f5-d3295ad9fe38', 1654760726909, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '190c08a0-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', '20a962d0-e7c8-11ec-b0f5-d3295ad9fe38', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654760726909);
INSERT INTO "public"."event" VALUES ('20c4b300-e7c8-11ec-b0f5-d3295ad9fe38', 1654760727088, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '190e0470-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', '20c4b300-e7c8-11ec-b0f5-d3295ad9fe38', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654760727088);
INSERT INTO "public"."event" VALUES ('b2fa0c10-e7d3-11ec-0000-000000000000', 1654765696849, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '190a5af0-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', 'b2fa0c10-e7d3-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654765696849);
INSERT INTO "public"."event" VALUES ('b80fc640-e7d3-11ec-9c29-6b5efb618356', 1654765705380, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '190e0470-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', 'b80fc640-e7d3-11ec-9c29-6b5efb618356', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654765705380);
INSERT INTO "public"."event" VALUES ('b8354fa0-e7d3-11ec-9c29-6b5efb618356', 1654765705626, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '190c08a0-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', 'b8354fa0-e7d3-11ec-9c29-6b5efb618356', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654765705626);
INSERT INTO "public"."event" VALUES ('444dc030-e649-11ec-a923-8f85748e76aa', 1654596289459, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '16e16d10-d823-11ec-b78c-b77651e82ef4', 'RULE_CHAIN', 'LC_EVENT', '444dc030-e649-11ec-a923-8f85748e76aa', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654596289459);
INSERT INTO "public"."event" VALUES ('1ce13740-e7c8-11ec-b0f5-d3295ad9fe38', 1654760720564, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '16e16d10-d823-11ec-b78c-b77651e82ef4', 'RULE_CHAIN', 'LC_EVENT', '1ce13740-e7c8-11ec-b0f5-d3295ad9fe38', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654760720564);
INSERT INTO "public"."event" VALUES ('b2e46130-e7d3-11ec-9c29-6b5efb618356', 1654765696707, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '16e16d10-d823-11ec-b78c-b77651e82ef4', 'RULE_CHAIN', 'LC_EVENT', 'b2e46130-e7d3-11ec-9c29-6b5efb618356', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654765696707);
INSERT INTO "public"."event" VALUES ('7ed9f5b0-e7d0-11ec-b0f5-d3295ad9fe38', 1654764320907, '{"server":"SZCL21HOUYONG","messagesProcessed":59,"errorsOccurred":0}', '1911adf0-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'STATS', '7ed9f5b0-e7d0-11ec-b0f5-d3295ad9fe38', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654764320907);
INSERT INTO "public"."event" VALUES ('6021e2b0-e648-11ec-0000-000000000000', 1654595906651, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '190a5af0-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', '6021e2b0-e648-11ec-0000-000000000000', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654595906651);
INSERT INTO "public"."event" VALUES ('63c54830-e648-11ec-b13a-b59abbf8e7df', 1654595912755, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '190e0470-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', '63c54830-e648-11ec-b13a-b59abbf8e7df', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654595912755);
INSERT INTO "public"."event" VALUES ('63e1d0e0-e648-11ec-b13a-b59abbf8e7df', 1654595912942, '{"server":"SZCL21HOUYONG","event":"STARTED","success":true}', '190c08a0-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'LC_EVENT', '63e1d0e0-e648-11ec-b13a-b59abbf8e7df', '188f3780-d68b-11ec-aefb-d132b4563e73', 1654595912942);

-- ----------------------------
-- Table structure for oauth2_client_registration
-- ----------------------------
DROP TABLE IF EXISTS "public"."oauth2_client_registration";
CREATE TABLE "public"."oauth2_client_registration" (
  "id" uuid NOT NULL,
  "created_time" int8 NOT NULL,
  "domain_name" varchar(255) COLLATE "pg_catalog"."default",
  "domain_scheme" varchar(31) COLLATE "pg_catalog"."default",
  "client_registration_info_id" uuid
)
;

-- ----------------------------
-- Records of oauth2_client_registration
-- ----------------------------

-- ----------------------------
-- Table structure for oauth2_client_registration_info
-- ----------------------------
DROP TABLE IF EXISTS "public"."oauth2_client_registration_info";
CREATE TABLE "public"."oauth2_client_registration_info" (
  "id" uuid NOT NULL,
  "enabled" bool,
  "created_time" int8 NOT NULL,
  "additional_info" varchar COLLATE "pg_catalog"."default",
  "client_id" varchar(255) COLLATE "pg_catalog"."default",
  "client_secret" varchar(255) COLLATE "pg_catalog"."default",
  "authorization_uri" varchar(255) COLLATE "pg_catalog"."default",
  "token_uri" varchar(255) COLLATE "pg_catalog"."default",
  "scope" varchar(255) COLLATE "pg_catalog"."default",
  "user_info_uri" varchar(255) COLLATE "pg_catalog"."default",
  "user_name_attribute_name" varchar(255) COLLATE "pg_catalog"."default",
  "jwk_set_uri" varchar(255) COLLATE "pg_catalog"."default",
  "client_authentication_method" varchar(255) COLLATE "pg_catalog"."default",
  "login_button_label" varchar(255) COLLATE "pg_catalog"."default",
  "login_button_icon" varchar(255) COLLATE "pg_catalog"."default",
  "allow_user_creation" bool,
  "activate_user" bool,
  "type" varchar(31) COLLATE "pg_catalog"."default",
  "basic_email_attribute_key" varchar(31) COLLATE "pg_catalog"."default",
  "basic_first_name_attribute_key" varchar(31) COLLATE "pg_catalog"."default",
  "basic_last_name_attribute_key" varchar(31) COLLATE "pg_catalog"."default",
  "basic_tenant_name_strategy" varchar(31) COLLATE "pg_catalog"."default",
  "basic_tenant_name_pattern" varchar(255) COLLATE "pg_catalog"."default",
  "basic_customer_name_pattern" varchar(255) COLLATE "pg_catalog"."default",
  "basic_default_dashboard_name" varchar(255) COLLATE "pg_catalog"."default",
  "basic_always_full_screen" bool,
  "custom_url" varchar(255) COLLATE "pg_catalog"."default",
  "custom_username" varchar(255) COLLATE "pg_catalog"."default",
  "custom_password" varchar(255) COLLATE "pg_catalog"."default",
  "custom_send_token" bool
)
;

-- ----------------------------
-- Records of oauth2_client_registration_info
-- ----------------------------

-- ----------------------------
-- Table structure for oauth2_client_registration_template
-- ----------------------------
DROP TABLE IF EXISTS "public"."oauth2_client_registration_template";
CREATE TABLE "public"."oauth2_client_registration_template" (
  "id" uuid NOT NULL,
  "created_time" int8 NOT NULL,
  "additional_info" varchar COLLATE "pg_catalog"."default",
  "provider_id" varchar(255) COLLATE "pg_catalog"."default",
  "authorization_uri" varchar(255) COLLATE "pg_catalog"."default",
  "token_uri" varchar(255) COLLATE "pg_catalog"."default",
  "scope" varchar(255) COLLATE "pg_catalog"."default",
  "user_info_uri" varchar(255) COLLATE "pg_catalog"."default",
  "user_name_attribute_name" varchar(255) COLLATE "pg_catalog"."default",
  "jwk_set_uri" varchar(255) COLLATE "pg_catalog"."default",
  "client_authentication_method" varchar(255) COLLATE "pg_catalog"."default",
  "type" varchar(31) COLLATE "pg_catalog"."default",
  "basic_email_attribute_key" varchar(31) COLLATE "pg_catalog"."default",
  "basic_first_name_attribute_key" varchar(31) COLLATE "pg_catalog"."default",
  "basic_last_name_attribute_key" varchar(31) COLLATE "pg_catalog"."default",
  "basic_tenant_name_strategy" varchar(31) COLLATE "pg_catalog"."default",
  "basic_tenant_name_pattern" varchar(255) COLLATE "pg_catalog"."default",
  "basic_customer_name_pattern" varchar(255) COLLATE "pg_catalog"."default",
  "basic_default_dashboard_name" varchar(255) COLLATE "pg_catalog"."default",
  "basic_always_full_screen" bool,
  "comment" varchar COLLATE "pg_catalog"."default",
  "login_button_icon" varchar(255) COLLATE "pg_catalog"."default",
  "login_button_label" varchar(255) COLLATE "pg_catalog"."default",
  "help_link" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of oauth2_client_registration_template
-- ----------------------------

-- ----------------------------
-- Table structure for oauth2_domain
-- ----------------------------
DROP TABLE IF EXISTS "public"."oauth2_domain";
CREATE TABLE "public"."oauth2_domain" (
  "id" uuid NOT NULL,
  "oauth2_params_id" uuid NOT NULL,
  "created_time" int8 NOT NULL,
  "domain_name" varchar(255) COLLATE "pg_catalog"."default",
  "domain_scheme" varchar(31) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of oauth2_domain
-- ----------------------------

-- ----------------------------
-- Table structure for oauth2_mobile
-- ----------------------------
DROP TABLE IF EXISTS "public"."oauth2_mobile";
CREATE TABLE "public"."oauth2_mobile" (
  "id" uuid NOT NULL,
  "oauth2_params_id" uuid NOT NULL,
  "created_time" int8 NOT NULL,
  "pkg_name" varchar(255) COLLATE "pg_catalog"."default",
  "app_secret" varchar(2048) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of oauth2_mobile
-- ----------------------------

-- ----------------------------
-- Table structure for oauth2_params
-- ----------------------------
DROP TABLE IF EXISTS "public"."oauth2_params";
CREATE TABLE "public"."oauth2_params" (
  "id" uuid NOT NULL,
  "enabled" bool,
  "tenant_id" uuid,
  "created_time" int8 NOT NULL
)
;

-- ----------------------------
-- Records of oauth2_params
-- ----------------------------

-- ----------------------------
-- Table structure for oauth2_registration
-- ----------------------------
DROP TABLE IF EXISTS "public"."oauth2_registration";
CREATE TABLE "public"."oauth2_registration" (
  "id" uuid NOT NULL,
  "oauth2_params_id" uuid NOT NULL,
  "created_time" int8 NOT NULL,
  "additional_info" varchar COLLATE "pg_catalog"."default",
  "client_id" varchar(255) COLLATE "pg_catalog"."default",
  "client_secret" varchar(2048) COLLATE "pg_catalog"."default",
  "authorization_uri" varchar(255) COLLATE "pg_catalog"."default",
  "token_uri" varchar(255) COLLATE "pg_catalog"."default",
  "scope" varchar(255) COLLATE "pg_catalog"."default",
  "platforms" varchar(255) COLLATE "pg_catalog"."default",
  "user_info_uri" varchar(255) COLLATE "pg_catalog"."default",
  "user_name_attribute_name" varchar(255) COLLATE "pg_catalog"."default",
  "jwk_set_uri" varchar(255) COLLATE "pg_catalog"."default",
  "client_authentication_method" varchar(255) COLLATE "pg_catalog"."default",
  "login_button_label" varchar(255) COLLATE "pg_catalog"."default",
  "login_button_icon" varchar(255) COLLATE "pg_catalog"."default",
  "allow_user_creation" bool,
  "activate_user" bool,
  "type" varchar(31) COLLATE "pg_catalog"."default",
  "basic_email_attribute_key" varchar(31) COLLATE "pg_catalog"."default",
  "basic_first_name_attribute_key" varchar(31) COLLATE "pg_catalog"."default",
  "basic_last_name_attribute_key" varchar(31) COLLATE "pg_catalog"."default",
  "basic_tenant_name_strategy" varchar(31) COLLATE "pg_catalog"."default",
  "basic_tenant_name_pattern" varchar(255) COLLATE "pg_catalog"."default",
  "basic_customer_name_pattern" varchar(255) COLLATE "pg_catalog"."default",
  "basic_default_dashboard_name" varchar(255) COLLATE "pg_catalog"."default",
  "basic_always_full_screen" bool,
  "custom_url" varchar(255) COLLATE "pg_catalog"."default",
  "custom_username" varchar(255) COLLATE "pg_catalog"."default",
  "custom_password" varchar(255) COLLATE "pg_catalog"."default",
  "custom_send_token" bool
)
;

-- ----------------------------
-- Records of oauth2_registration
-- ----------------------------

-- ----------------------------
-- Table structure for ota_package
-- ----------------------------
DROP TABLE IF EXISTS "public"."ota_package";
CREATE TABLE "public"."ota_package" (
  "id" uuid NOT NULL,
  "created_time" int8 NOT NULL,
  "tenant_id" uuid NOT NULL,
  "device_profile_id" uuid,
  "type" varchar(32) COLLATE "pg_catalog"."default" NOT NULL,
  "title" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "version" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "tag" varchar(255) COLLATE "pg_catalog"."default",
  "url" varchar(255) COLLATE "pg_catalog"."default",
  "file_name" varchar(255) COLLATE "pg_catalog"."default",
  "content_type" varchar(255) COLLATE "pg_catalog"."default",
  "checksum_algorithm" varchar(32) COLLATE "pg_catalog"."default",
  "checksum" varchar(1020) COLLATE "pg_catalog"."default",
  "data" oid,
  "data_size" int8,
  "additional_info" varchar COLLATE "pg_catalog"."default",
  "search_text" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of ota_package
-- ----------------------------
INSERT INTO "public"."ota_package" VALUES ('7fcd6af0-db2e-11ec-97d4-5555813c4bbf', 1653375330079, '188f3780-d68b-11ec-aefb-d132b4563e73', '18a44620-d68b-11ec-aefb-d132b4563e73', 'FIRMWARE', '11', '11', '11 11', NULL, 'Untitled-1.json', 'application/json', 'SHA256', '2771348a787f6c7af0be7a449d1e3ba12a49a5a49f43edf3ddb1cec4a4da412f', 25756, 493, '{"description":""}', '11');

-- ----------------------------
-- Table structure for relation
-- ----------------------------
DROP TABLE IF EXISTS "public"."relation";
CREATE TABLE "public"."relation" (
  "from_id" uuid NOT NULL,
  "from_type" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "to_id" uuid NOT NULL,
  "to_type" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "relation_type_group" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "relation_type" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "additional_info" varchar COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of relation
-- ----------------------------
INSERT INTO "public"."relation" VALUES ('18f3c5b0-d68b-11ec-aefb-d132b4563e73', 'RULE_CHAIN', '1901cf70-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'RULE_CHAIN', 'Contains', NULL);
INSERT INTO "public"."relation" VALUES ('18f3c5b0-d68b-11ec-aefb-d132b4563e73', 'RULE_CHAIN', '1908ad40-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'RULE_CHAIN', 'Contains', NULL);
INSERT INTO "public"."relation" VALUES ('18f3c5b0-d68b-11ec-aefb-d132b4563e73', 'RULE_CHAIN', '190a5af0-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'RULE_CHAIN', 'Contains', NULL);
INSERT INTO "public"."relation" VALUES ('18f3c5b0-d68b-11ec-aefb-d132b4563e73', 'RULE_CHAIN', '190c08a0-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'RULE_CHAIN', 'Contains', NULL);
INSERT INTO "public"."relation" VALUES ('18f3c5b0-d68b-11ec-aefb-d132b4563e73', 'RULE_CHAIN', '190e0470-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'RULE_CHAIN', 'Contains', NULL);
INSERT INTO "public"."relation" VALUES ('18f3c5b0-d68b-11ec-aefb-d132b4563e73', 'RULE_CHAIN', '190fb220-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'RULE_CHAIN', 'Contains', NULL);
INSERT INTO "public"."relation" VALUES ('18f3c5b0-d68b-11ec-aefb-d132b4563e73', 'RULE_CHAIN', '1911adf0-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'RULE_CHAIN', 'Contains', NULL);
INSERT INTO "public"."relation" VALUES ('1911adf0-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', '190a5af0-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'RULE_NODE', 'Success', NULL);
INSERT INTO "public"."relation" VALUES ('190a5af0-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', '190e0470-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'RULE_NODE', 'Other', NULL);
INSERT INTO "public"."relation" VALUES ('190a5af0-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', '1908ad40-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'RULE_NODE', 'Post attributes', NULL);
INSERT INTO "public"."relation" VALUES ('190a5af0-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', '1901cf70-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'RULE_NODE', 'Post telemetry', NULL);
INSERT INTO "public"."relation" VALUES ('190a5af0-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', '190c08a0-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'RULE_NODE', 'RPC Request from Device', NULL);
INSERT INTO "public"."relation" VALUES ('190a5af0-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', '190fb220-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'RULE_NODE', 'RPC Request to Device', NULL);
INSERT INTO "public"."relation" VALUES ('191cd180-d68b-11ec-aefb-d132b4563e73', 'RULE_CHAIN', '191f4280-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'RULE_CHAIN', 'Contains', NULL);
INSERT INTO "public"."relation" VALUES ('191cd180-d68b-11ec-aefb-d132b4563e73', 'RULE_CHAIN', '1920a210-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'RULE_CHAIN', 'Contains', NULL);
INSERT INTO "public"."relation" VALUES ('191cd180-d68b-11ec-aefb-d132b4563e73', 'RULE_CHAIN', '192201a0-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'RULE_CHAIN', 'Contains', NULL);
INSERT INTO "public"."relation" VALUES ('191cd180-d68b-11ec-aefb-d132b4563e73', 'RULE_CHAIN', '19238840-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'RULE_CHAIN', 'Contains', NULL);
INSERT INTO "public"."relation" VALUES ('191cd180-d68b-11ec-aefb-d132b4563e73', 'RULE_CHAIN', '1924e7d0-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'RULE_CHAIN', 'Contains', NULL);
INSERT INTO "public"."relation" VALUES ('191cd180-d68b-11ec-aefb-d132b4563e73', 'RULE_CHAIN', '19266e70-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'RULE_CHAIN', 'Contains', NULL);
INSERT INTO "public"."relation" VALUES ('191cd180-d68b-11ec-aefb-d132b4563e73', 'RULE_CHAIN', '1927ce00-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'RULE_CHAIN', 'Contains', NULL);
INSERT INTO "public"."relation" VALUES ('191cd180-d68b-11ec-aefb-d132b4563e73', 'RULE_CHAIN', '19292d90-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'RULE_CHAIN', 'Contains', NULL);
INSERT INTO "public"."relation" VALUES ('191f4280-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', '19238840-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'RULE_NODE', 'Success', NULL);
INSERT INTO "public"."relation" VALUES ('1920a210-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', '19292d90-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'RULE_NODE', 'Success', NULL);
INSERT INTO "public"."relation" VALUES ('192201a0-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', '19292d90-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'RULE_NODE', 'Success', NULL);
INSERT INTO "public"."relation" VALUES ('19238840-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', '1927ce00-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'RULE_NODE', 'RPC Request to Device', NULL);
INSERT INTO "public"."relation" VALUES ('19238840-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', '19266e70-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'RULE_NODE', 'Other', NULL);
INSERT INTO "public"."relation" VALUES ('19238840-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', '192201a0-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'RULE_NODE', 'Post attributes', NULL);
INSERT INTO "public"."relation" VALUES ('19238840-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', '1920a210-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'RULE_NODE', 'Post telemetry', NULL);
INSERT INTO "public"."relation" VALUES ('19238840-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', '1924e7d0-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'RULE_NODE', 'RPC Request from Device', NULL);
INSERT INTO "public"."relation" VALUES ('19238840-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', '19292d90-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'RULE_NODE', 'Attributes Updated', NULL);
INSERT INTO "public"."relation" VALUES ('1924e7d0-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', '19292d90-d68b-11ec-aefb-d132b4563e73', 'RULE_NODE', 'RULE_NODE', 'Success', NULL);
INSERT INTO "public"."relation" VALUES ('559c7d40-d68b-11ec-aefb-d132b4563e73', 'DEVICE', '00e73d10-d68d-11ec-aefb-d132b4563e73', 'DEVICE', 'COMMON', 'Created', NULL);
INSERT INTO "public"."relation" VALUES ('559c7d40-d68b-11ec-aefb-d132b4563e73', 'DEVICE', 'dd095840-d68e-11ec-aefb-d132b4563e73', 'DEVICE', 'COMMON', 'Created', NULL);
INSERT INTO "public"."relation" VALUES ('13126af0-d737-11ec-94a0-cd6fda244b19', 'CUSTOMER', '67e27430-d737-11ec-94a0-cd6fda244b19', 'DASHBOARD', 'DASHBOARD', 'Contains', NULL);
INSERT INTO "public"."relation" VALUES ('840b02d0-d737-11ec-94a0-cd6fda244b19', 'EDGE', '191cd180-d68b-11ec-aefb-d132b4563e73', 'RULE_CHAIN', 'EDGE', 'Contains', NULL);
INSERT INTO "public"."relation" VALUES ('840b02d0-d737-11ec-94a0-cd6fda244b19', 'EDGE', '67e27430-d737-11ec-94a0-cd6fda244b19', 'DASHBOARD', 'EDGE', 'Contains', NULL);

-- ----------------------------
-- Table structure for resource
-- ----------------------------
DROP TABLE IF EXISTS "public"."resource";
CREATE TABLE "public"."resource" (
  "id" uuid NOT NULL,
  "created_time" int8 NOT NULL,
  "tenant_id" uuid NOT NULL,
  "title" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "resource_type" varchar(32) COLLATE "pg_catalog"."default" NOT NULL,
  "resource_key" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "search_text" varchar(255) COLLATE "pg_catalog"."default",
  "file_name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "data" varchar COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of resource
-- ----------------------------

-- ----------------------------
-- Table structure for rpc
-- ----------------------------
DROP TABLE IF EXISTS "public"."rpc";
CREATE TABLE "public"."rpc" (
  "id" uuid NOT NULL,
  "created_time" int8 NOT NULL,
  "tenant_id" uuid NOT NULL,
  "device_id" uuid NOT NULL,
  "expiration_time" int8 NOT NULL,
  "request" varchar(10000000) COLLATE "pg_catalog"."default" NOT NULL,
  "response" varchar(10000000) COLLATE "pg_catalog"."default",
  "additional_info" varchar(10000000) COLLATE "pg_catalog"."default",
  "status" varchar(255) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of rpc
-- ----------------------------
INSERT INTO "public"."rpc" VALUES ('dfc48a79-758a-4605-9774-fbb96101ff5f', 1652865862929, '188f3780-d68b-11ec-aefb-d132b4563e73', '559c7d40-d68b-11ec-aefb-d132b4563e73', 1652952262901, '{"id":"dfc48a79-758a-4605-9774-fbb96101ff5f","tenantId":{"entityType":"TENANT","id":"188f3780-d68b-11ec-aefb-d132b4563e73"},"deviceId":{"entityType":"DEVICE","id":"559c7d40-d68b-11ec-aefb-d132b4563e73"},"oneway":true,"expirationTime":1652952262901,"body":{"method":"gateway_device_deleted","params":"\"deviceName\""},"persisted":true,"retries":3}', NULL, 'null', 'QUEUED');
INSERT INTO "public"."rpc" VALUES ('34eca9e2-80b7-4c1f-93cb-c8ad3a39ae53', 1652865863007, '188f3780-d68b-11ec-aefb-d132b4563e73', '559c7d40-d68b-11ec-aefb-d132b4563e73', 1652952262900, '{"id":"34eca9e2-80b7-4c1f-93cb-c8ad3a39ae53","tenantId":{"entityType":"TENANT","id":"188f3780-d68b-11ec-aefb-d132b4563e73"},"deviceId":{"entityType":"DEVICE","id":"559c7d40-d68b-11ec-aefb-d132b4563e73"},"oneway":true,"expirationTime":1652952262900,"body":{"method":"gateway_device_deleted","params":"\"attributes\""},"persisted":true,"retries":3}', NULL, 'null', 'QUEUED');
INSERT INTO "public"."rpc" VALUES ('d4e9f6c7-dabd-47ca-8e95-a1cc599ed403', 1652865863021, '188f3780-d68b-11ec-aefb-d132b4563e73', '559c7d40-d68b-11ec-aefb-d132b4563e73', 1652952262900, '{"id":"d4e9f6c7-dabd-47ca-8e95-a1cc599ed403","tenantId":{"entityType":"TENANT","id":"188f3780-d68b-11ec-aefb-d132b4563e73"},"deviceId":{"entityType":"DEVICE","id":"559c7d40-d68b-11ec-aefb-d132b4563e73"},"oneway":true,"expirationTime":1652952262900,"body":{"method":"gateway_device_deleted","params":"\"deviceType\""},"persisted":true,"retries":3}', NULL, 'null', 'QUEUED');
INSERT INTO "public"."rpc" VALUES ('cac246b1-a6dd-40fb-9120-dea96165346f', 1652865863034, '188f3780-d68b-11ec-aefb-d132b4563e73', '559c7d40-d68b-11ec-aefb-d132b4563e73', 1652952262900, '{"id":"cac246b1-a6dd-40fb-9120-dea96165346f","tenantId":{"entityType":"TENANT","id":"188f3780-d68b-11ec-aefb-d132b4563e73"},"deviceId":{"entityType":"DEVICE","id":"559c7d40-d68b-11ec-aefb-d132b4563e73"},"oneway":true,"expirationTime":1652952262900,"body":{"method":"gateway_device_deleted","params":"\"telemetry\""},"persisted":true,"retries":3}', NULL, 'null', 'QUEUED');

-- ----------------------------
-- Table structure for rule_chain
-- ----------------------------
DROP TABLE IF EXISTS "public"."rule_chain";
CREATE TABLE "public"."rule_chain" (
  "id" uuid NOT NULL,
  "created_time" int8 NOT NULL,
  "additional_info" varchar COLLATE "pg_catalog"."default",
  "configuration" varchar(10000000) COLLATE "pg_catalog"."default",
  "name" varchar(255) COLLATE "pg_catalog"."default",
  "type" varchar(255) COLLATE "pg_catalog"."default",
  "first_rule_node_id" uuid,
  "root" bool,
  "debug_mode" bool,
  "search_text" varchar(255) COLLATE "pg_catalog"."default",
  "tenant_id" uuid
)
;

-- ----------------------------
-- Records of rule_chain
-- ----------------------------
INSERT INTO "public"."rule_chain" VALUES ('18f3c5b0-d68b-11ec-aefb-d132b4563e73', 1652865344907, 'null', 'null', 'Root Rule Chain', 'CORE', '1911adf0-d68b-11ec-aefb-d132b4563e73', 't', 'f', 'root rule chain', '188f3780-d68b-11ec-aefb-d132b4563e73');
INSERT INTO "public"."rule_chain" VALUES ('191cd180-d68b-11ec-aefb-d132b4563e73', 1652865345176, 'null', 'null', 'Edge Root Rule Chain', 'EDGE', '191f4280-d68b-11ec-aefb-d132b4563e73', 't', 'f', 'edge root rule chain', '188f3780-d68b-11ec-aefb-d132b4563e73');
INSERT INTO "public"."rule_chain" VALUES ('16e16d10-d823-11ec-b78c-b77651e82ef4', 1653040576097, '{"description":""}', NULL, 'demo', 'CORE', NULL, 'f', 'f', 'demo', '188f3780-d68b-11ec-aefb-d132b4563e73');

-- ----------------------------
-- Table structure for rule_node
-- ----------------------------
DROP TABLE IF EXISTS "public"."rule_node";
CREATE TABLE "public"."rule_node" (
  "id" uuid NOT NULL,
  "created_time" int8 NOT NULL,
  "rule_chain_id" uuid,
  "additional_info" varchar COLLATE "pg_catalog"."default",
  "configuration" varchar(10000000) COLLATE "pg_catalog"."default",
  "type" varchar(255) COLLATE "pg_catalog"."default",
  "name" varchar(255) COLLATE "pg_catalog"."default",
  "debug_mode" bool,
  "search_text" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of rule_node
-- ----------------------------
INSERT INTO "public"."rule_node" VALUES ('1901cf70-d68b-11ec-aefb-d132b4563e73', 1652865344999, '18f3c5b0-d68b-11ec-aefb-d132b4563e73', '{"layoutX":824,"layoutY":156}', '{"defaultTTL":0}', 'org.thingsboard.rule.engine.telemetry.TbMsgTimeseriesNode', 'Save Timeseries', 'f', 'save timeseries');
INSERT INTO "public"."rule_node" VALUES ('1908ad40-d68b-11ec-aefb-d132b4563e73', 1652865345044, '18f3c5b0-d68b-11ec-aefb-d132b4563e73', '{"layoutX":825,"layoutY":52}', '{"scope":"CLIENT_SCOPE","notifyDevice":"false"}', 'org.thingsboard.rule.engine.telemetry.TbMsgAttributesNode', 'Save Client Attributes', 'f', 'save client attributes');
INSERT INTO "public"."rule_node" VALUES ('190a5af0-d68b-11ec-aefb-d132b4563e73', 1652865345055, '18f3c5b0-d68b-11ec-aefb-d132b4563e73', '{"layoutX":347,"layoutY":149}', '{"version":0}', 'org.thingsboard.rule.engine.filter.TbMsgTypeSwitchNode', 'Message Type Switch', 'f', 'message type switch');
INSERT INTO "public"."rule_node" VALUES ('190c08a0-d68b-11ec-aefb-d132b4563e73', 1652865345066, '18f3c5b0-d68b-11ec-aefb-d132b4563e73', '{"layoutX":825,"layoutY":266}', '{"jsScript":"return ''\\nIncoming message:\\n'' + JSON.stringify(msg) + ''\\nIncoming metadata:\\n'' + JSON.stringify(metadata);"}', 'org.thingsboard.rule.engine.action.TbLogNode', 'Log RPC from Device', 'f', 'log rpc from device');
INSERT INTO "public"."rule_node" VALUES ('190e0470-d68b-11ec-aefb-d132b4563e73', 1652865345079, '18f3c5b0-d68b-11ec-aefb-d132b4563e73', '{"layoutX":825,"layoutY":379}', '{"jsScript":"return ''\\nIncoming message:\\n'' + JSON.stringify(msg) + ''\\nIncoming metadata:\\n'' + JSON.stringify(metadata);"}', 'org.thingsboard.rule.engine.action.TbLogNode', 'Log Other', 'f', 'log other');
INSERT INTO "public"."rule_node" VALUES ('190fb220-d68b-11ec-aefb-d132b4563e73', 1652865345090, '18f3c5b0-d68b-11ec-aefb-d132b4563e73', '{"layoutX":825,"layoutY":468}', '{"timeoutInSeconds":60}', 'org.thingsboard.rule.engine.rpc.TbSendRPCRequestNode', 'RPC Call Request', 'f', 'rpc call request');
INSERT INTO "public"."rule_node" VALUES ('1911adf0-d68b-11ec-aefb-d132b4563e73', 1652865345103, '18f3c5b0-d68b-11ec-aefb-d132b4563e73', '{"description":"Process incoming messages from devices with the alarm rules defined in the device profile. Dispatch all incoming messages with \"Success\" relation type.","layoutX":204,"layoutY":240}', '{"persistAlarmRulesState":false,"fetchAlarmRulesStateOnStart":false}', 'org.thingsboard.rule.engine.profile.TbDeviceProfileNode', 'Device Profile Node', 'f', 'device profile node');
INSERT INTO "public"."rule_node" VALUES ('191f4280-d68b-11ec-aefb-d132b4563e73', 1652865345192, '191cd180-d68b-11ec-aefb-d132b4563e73', '{"description":"Process incoming messages from devices with the alarm rules defined in the device profile. Dispatch all incoming messages with \"Success\" relation type.","layoutX":187,"layoutY":468}', '{"persistAlarmRulesState":false,"fetchAlarmRulesStateOnStart":false}', 'org.thingsboard.rule.engine.profile.TbDeviceProfileNode', 'Device Profile Node', 'f', 'device profile node');
INSERT INTO "public"."rule_node" VALUES ('1920a210-d68b-11ec-aefb-d132b4563e73', 1652865345201, '191cd180-d68b-11ec-aefb-d132b4563e73', '{"layoutX":823,"layoutY":157}', '{"defaultTTL":0}', 'org.thingsboard.rule.engine.telemetry.TbMsgTimeseriesNode', 'Save Timeseries', 'f', 'save timeseries');
INSERT INTO "public"."rule_node" VALUES ('192201a0-d68b-11ec-aefb-d132b4563e73', 1652865345210, '191cd180-d68b-11ec-aefb-d132b4563e73', '{"layoutX":824,"layoutY":52}', '{"scope":"CLIENT_SCOPE"}', 'org.thingsboard.rule.engine.telemetry.TbMsgAttributesNode', 'Save Client Attributes', 'f', 'save client attributes');
INSERT INTO "public"."rule_node" VALUES ('19238840-d68b-11ec-aefb-d132b4563e73', 1652865345220, '191cd180-d68b-11ec-aefb-d132b4563e73', '{"layoutX":347,"layoutY":149}', '{"version":0}', 'org.thingsboard.rule.engine.filter.TbMsgTypeSwitchNode', 'Message Type Switch', 'f', 'message type switch');
INSERT INTO "public"."rule_node" VALUES ('1924e7d0-d68b-11ec-aefb-d132b4563e73', 1652865345229, '191cd180-d68b-11ec-aefb-d132b4563e73', '{"layoutX":825,"layoutY":266}', '{"jsScript":"return ''\\nIncoming message:\\n'' + JSON.stringify(msg) + ''\\nIncoming metadata:\\n'' + JSON.stringify(metadata);"}', 'org.thingsboard.rule.engine.action.TbLogNode', 'Log RPC from Device', 'f', 'log rpc from device');
INSERT INTO "public"."rule_node" VALUES ('19266e70-d68b-11ec-aefb-d132b4563e73', 1652865345239, '191cd180-d68b-11ec-aefb-d132b4563e73', '{"layoutX":824,"layoutY":378}', '{"jsScript":"return ''\\nIncoming message:\\n'' + JSON.stringify(msg) + ''\\nIncoming metadata:\\n'' + JSON.stringify(metadata);"}', 'org.thingsboard.rule.engine.action.TbLogNode', 'Log Other', 'f', 'log other');
INSERT INTO "public"."rule_node" VALUES ('1927ce00-d68b-11ec-aefb-d132b4563e73', 1652865345248, '191cd180-d68b-11ec-aefb-d132b4563e73', '{"layoutX":824,"layoutY":466}', '{"timeoutInSeconds":60}', 'org.thingsboard.rule.engine.rpc.TbSendRPCRequestNode', 'RPC Call Request', 'f', 'rpc call request');
INSERT INTO "public"."rule_node" VALUES ('19292d90-d68b-11ec-aefb-d132b4563e73', 1652865345257, '191cd180-d68b-11ec-aefb-d132b4563e73', '{"layoutX":1129,"layoutY":52}', '{"scope":"SERVER_SCOPE"}', 'org.thingsboard.rule.engine.edge.TbMsgPushToCloudNode', 'Push to cloud', 'f', 'push to cloud');

-- ----------------------------
-- Table structure for rule_node_state
-- ----------------------------
DROP TABLE IF EXISTS "public"."rule_node_state";
CREATE TABLE "public"."rule_node_state" (
  "id" uuid NOT NULL,
  "created_time" int8 NOT NULL,
  "rule_node_id" uuid NOT NULL,
  "entity_type" varchar(32) COLLATE "pg_catalog"."default" NOT NULL,
  "entity_id" uuid NOT NULL,
  "state_data" varchar(16384) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of rule_node_state
-- ----------------------------

-- ----------------------------
-- Table structure for tb_schema_settings
-- ----------------------------
DROP TABLE IF EXISTS "public"."tb_schema_settings";
CREATE TABLE "public"."tb_schema_settings" (
  "schema_version" int8 NOT NULL
)
;

-- ----------------------------
-- Records of tb_schema_settings
-- ----------------------------
INSERT INTO "public"."tb_schema_settings" VALUES (3003000);

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS "public"."tb_user";
CREATE TABLE "public"."tb_user" (
  "id" uuid NOT NULL,
  "created_time" int8 NOT NULL,
  "additional_info" varchar COLLATE "pg_catalog"."default",
  "authority" varchar(255) COLLATE "pg_catalog"."default",
  "customer_id" uuid,
  "email" varchar(255) COLLATE "pg_catalog"."default",
  "first_name" varchar(255) COLLATE "pg_catalog"."default",
  "last_name" varchar(255) COLLATE "pg_catalog"."default",
  "search_text" varchar(255) COLLATE "pg_catalog"."default",
  "tenant_id" uuid
)
;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO "public"."tb_user" VALUES ('cffa5b10-e578-11ec-a8c7-4b21fe31dd59', 1654506758977, '{"description":"","defaultDashboardId":null,"defaultDashboardFullscreen":false,"homeDashboardId":null,"homeDashboardHideToolbar":true,"userPasswordHistory":{"1654506770124":"$2a$10$pgPYQOiCDxWzF4c2gIfe9OlccrFRl88Bp.RzL0BS5xk03fjdu7La6","1654506770178":"$2a$10$pgPYQOiCDxWzF4c2gIfe9OlccrFRl88Bp.RzL0BS5xk03fjdu7La6"},"userCredentialsEnabled":true,"failedLoginAttempts":0}', 'CUSTOMER_USER', '13126af0-d737-11ec-94a0-cd6fda244b19', '11111111@qq.com', NULL, NULL, '11111111@qq.com', '188f3780-d68b-11ec-aefb-d132b4563e73');
INSERT INTO "public"."tb_user" VALUES ('5a797660-4612-11e7-a919-92ebcb67fe33', 1592576748000, '{"lastLoginTs":1652940416564,"failedLoginAttempts":0}', 'SYS_ADMIN', '13814000-1dd2-11b2-8080-808080808080', 'sysadmin@thingsboard.org', NULL, NULL, 'sysadmin@thingsboard.org', '13814000-1dd2-11b2-8080-808080808080');
INSERT INTO "public"."tb_user" VALUES ('3895eab0-d68b-11ec-aefb-d132b4563e73', 1652865397979, '{"description":"","defaultDashboardId":null,"defaultDashboardFullscreen":false,"homeDashboardId":null,"homeDashboardHideToolbar":false,"userPasswordHistory":{"1652865412463":"$2a$10$EABBiI7oTD6I9oE6n7Rihez09iDVX.iOv/x00etGinn16RxYYMhgy","1652865412503":"$2a$10$EABBiI7oTD6I9oE6n7Rihez09iDVX.iOv/x00etGinn16RxYYMhgy"},"userCredentialsEnabled":true,"failedLoginAttempts":0,"lastLoginTs":1654506795131,"lang":"zh_CN"}', 'TENANT_ADMIN', '13814000-1dd2-11b2-8080-808080808080', '240011814@qq.com', 'hy', 'y', '240011814@qq.com', '188f3780-d68b-11ec-aefb-d132b4563e73');

-- ----------------------------
-- Table structure for tenant
-- ----------------------------
DROP TABLE IF EXISTS "public"."tenant";
CREATE TABLE "public"."tenant" (
  "id" uuid NOT NULL,
  "created_time" int8 NOT NULL,
  "additional_info" varchar COLLATE "pg_catalog"."default",
  "tenant_profile_id" uuid NOT NULL,
  "address" varchar COLLATE "pg_catalog"."default",
  "address2" varchar COLLATE "pg_catalog"."default",
  "city" varchar(255) COLLATE "pg_catalog"."default",
  "country" varchar(255) COLLATE "pg_catalog"."default",
  "email" varchar(255) COLLATE "pg_catalog"."default",
  "phone" varchar(255) COLLATE "pg_catalog"."default",
  "region" varchar(255) COLLATE "pg_catalog"."default",
  "search_text" varchar(255) COLLATE "pg_catalog"."default",
  "state" varchar(255) COLLATE "pg_catalog"."default",
  "title" varchar(255) COLLATE "pg_catalog"."default",
  "zip" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of tenant
-- ----------------------------
INSERT INTO "public"."tenant" VALUES ('188f3780-d68b-11ec-aefb-d132b4563e73', 1652865344248, '{"description":"","homeDashboardId":null,"homeDashboardHideToolbar":true}', '1198fd80-d68b-11ec-aefb-d132b4563e73', NULL, NULL, NULL, NULL, NULL, NULL, 'Global', '测试', NULL, '测试', NULL);

-- ----------------------------
-- Table structure for tenant_profile
-- ----------------------------
DROP TABLE IF EXISTS "public"."tenant_profile";
CREATE TABLE "public"."tenant_profile" (
  "id" uuid NOT NULL,
  "created_time" int8 NOT NULL,
  "name" varchar(255) COLLATE "pg_catalog"."default",
  "profile_data" jsonb,
  "description" varchar COLLATE "pg_catalog"."default",
  "search_text" varchar(255) COLLATE "pg_catalog"."default",
  "is_default" bool,
  "isolated_tb_core" bool,
  "isolated_tb_rule_engine" bool
)
;

-- ----------------------------
-- Records of tenant_profile
-- ----------------------------
INSERT INTO "public"."tenant_profile" VALUES ('1198fd80-d68b-11ec-aefb-d132b4563e73', 1652865332568, 'default', '{"configuration": {"type": "DEFAULT", "maxSms": 0, "maxUsers": 0, "maxAssets": 0, "maxEmails": 0, "maxDevices": 0, "rpcTtlDays": 0, "maxCustomers": 0, "alarmsTtlDays": 0, "maxDashboards": 0, "maxRuleChains": 0, "warnThreshold": 0.0, "maxJSExecutions": 0, "maxREExecutions": 0, "maxCreatedAlarms": 0, "maxDPStorageDays": 0, "maxResourcesInBytes": 0, "maxTransportMessages": 0, "defaultStorageTtlDays": 0, "maxOtaPackagesInBytes": 0, "maxTransportDataPoints": 0, "transportDeviceMsgRateLimit": null, "transportTenantMsgRateLimit": null, "maxRuleNodeExecutionsPerMessage": 0, "transportDeviceTelemetryMsgRateLimit": null, "transportTenantTelemetryMsgRateLimit": null, "transportDeviceTelemetryDataPointsRateLimit": null, "transportTenantTelemetryDataPointsRateLimit": null}}', NULL, 'default', 'f', 'f', 'f');

-- ----------------------------
-- Table structure for ts_kv
-- ----------------------------
DROP TABLE IF EXISTS "public"."ts_kv";
CREATE TABLE "public"."ts_kv" (
  "entity_id" uuid NOT NULL,
  "key" int4 NOT NULL,
  "ts" int8 NOT NULL,
  "bool_v" bool,
  "str_v" varchar(10000000) COLLATE "pg_catalog"."default",
  "long_v" int8,
  "dbl_v" float8,
  "json_v" json
)
;

-- ----------------------------
-- Records of ts_kv
-- ----------------------------
INSERT INTO "public"."ts_kv" VALUES ('18b33a40-d68b-11ec-aefb-d132b4563e73', 1, 1652865344484, NULL, 'ENABLED', NULL, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('18b33a40-d68b-11ec-aefb-d132b4563e73', 2, 1652865344484, NULL, 'ENABLED', NULL, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('18b33a40-d68b-11ec-aefb-d132b4563e73', 3, 1652865344484, NULL, 'ENABLED', NULL, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('18b33a40-d68b-11ec-aefb-d132b4563e73', 4, 1652865344484, NULL, 'ENABLED', NULL, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('18b33a40-d68b-11ec-aefb-d132b4563e73', 5, 1652865344484, NULL, 'ENABLED', NULL, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('18b33a40-d68b-11ec-aefb-d132b4563e73', 6, 1652865344484, NULL, 'ENABLED', NULL, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('18b33a40-d68b-11ec-aefb-d132b4563e73', 7, 1652865344484, NULL, 'ENABLED', NULL, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('18b33a40-d68b-11ec-aefb-d132b4563e73', 8, 1652865344484, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('18b33a40-d68b-11ec-aefb-d132b4563e73', 9, 1652865344484, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('18b33a40-d68b-11ec-aefb-d132b4563e73', 10, 1652865344484, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('18b33a40-d68b-11ec-aefb-d132b4563e73', 11, 1652865344484, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('18b33a40-d68b-11ec-aefb-d132b4563e73', 12, 1652865344484, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('18b33a40-d68b-11ec-aefb-d132b4563e73', 13, 1652865344484, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('18b33a40-d68b-11ec-aefb-d132b4563e73', 14, 1652865344484, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('18b33a40-d68b-11ec-aefb-d132b4563e73', 15, 1652865344484, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('3da82270-d68b-11ec-aefb-d132b4563e73', 1, 1652865406487, NULL, 'ENABLED', NULL, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('3da82270-d68b-11ec-aefb-d132b4563e73', 2, 1652865406487, NULL, 'ENABLED', NULL, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('3da82270-d68b-11ec-aefb-d132b4563e73', 3, 1652865406487, NULL, 'ENABLED', NULL, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('3da82270-d68b-11ec-aefb-d132b4563e73', 4, 1652865406487, NULL, 'ENABLED', NULL, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('3da82270-d68b-11ec-aefb-d132b4563e73', 5, 1652865406487, NULL, 'ENABLED', NULL, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('3da82270-d68b-11ec-aefb-d132b4563e73', 6, 1652865406487, NULL, 'ENABLED', NULL, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('3da82270-d68b-11ec-aefb-d132b4563e73', 7, 1652865406487, NULL, 'ENABLED', NULL, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 18, 1652865419581, NULL, NULL, 1, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 19, 1652865419581, NULL, NULL, 1, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 20, 1652865419581, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 21, 1652865419581, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 22, 1652865419581, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 23, 1652865419581, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('18b33a40-d68b-11ec-aefb-d132b4563e73', 16, 1651363200000, NULL, NULL, 404, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('3da82270-d68b-11ec-aefb-d132b4563e73', 17, 1652864400000, NULL, NULL, 172, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('00e73d10-d68d-11ec-aefb-d132b4563e73', 28, 1652866541788, NULL, NULL, 111, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('00e73d10-d68d-11ec-aefb-d132b4563e73', 29, 1652866541788, NULL, NULL, 123, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('3da82270-d68b-11ec-aefb-d132b4563e73', 16, 1651363200000, NULL, NULL, 404, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 18, 1652865479754, NULL, NULL, 3, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 19, 1652865479754, NULL, NULL, 3, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 20, 1652865479754, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 21, 1652865479754, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 22, 1652865479754, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 23, 1652865479754, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('18b33a40-d68b-11ec-aefb-d132b4563e73', 17, 1652864400000, NULL, NULL, 172, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 18, 1654506778697, NULL, NULL, 2, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 18, 1652866936046, NULL, NULL, 5, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 19, 1652866936046, NULL, NULL, 5, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 19, 1654506778697, NULL, NULL, 2, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 18, 1652866212713, NULL, NULL, 4, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 19, 1652866212713, NULL, NULL, 4, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 20, 1652866212713, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 21, 1652866212713, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 22, 1652866212713, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 23, 1652866212713, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('3da82270-d68b-11ec-aefb-d132b4563e73', 17, 1654495200000, NULL, NULL, 26, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 20, 1652866936046, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 21, 1652866936046, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 22, 1652866936046, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 23, 1652866936046, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('3da82270-d68b-11ec-aefb-d132b4563e73', 24, 1651363200000, NULL, NULL, 8, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('dd095840-d68e-11ec-aefb-d132b4563e73', 28, 1652866962411, NULL, NULL, 1, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 18, 1652866876044, NULL, NULL, 2, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 19, 1652866876044, NULL, NULL, 2, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 20, 1652866876044, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('3da82270-d68b-11ec-aefb-d132b4563e73', 25, 1652864400000, NULL, NULL, 8, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 18, 1652866272716, NULL, NULL, 1, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 18, 1652865852708, NULL, NULL, 10, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 19, 1652865852708, NULL, NULL, 10, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 20, 1652865852708, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 21, 1652865852708, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 22, 1652865852708, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 23, 1652865852708, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 19, 1652866272716, NULL, NULL, 1, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 20, 1652866272716, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 21, 1652866272716, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 22, 1652866272716, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 23, 1652866272716, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 21, 1652866876044, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 22, 1652866876044, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 18, 1652865912710, NULL, NULL, 19, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 19, 1652865912710, NULL, NULL, 19, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 20, 1652865912710, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 21, 1652865912710, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 22, 1652865912710, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 23, 1652865912710, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 18, 1652866574671, NULL, NULL, 2, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 19, 1652866574671, NULL, NULL, 2, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 20, 1652866574671, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 21, 1652866574671, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 22, 1652866574671, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 23, 1652866876044, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('3da82270-d68b-11ec-aefb-d132b4563e73', 26, 1651363200000, NULL, NULL, 17, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 23, 1652866574671, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('3da82270-d68b-11ec-aefb-d132b4563e73', 27, 1652864400000, NULL, NULL, 17, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('3da82270-d68b-11ec-aefb-d132b4563e73', 30, 1651363200000, NULL, NULL, 12, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('3da82270-d68b-11ec-aefb-d132b4563e73', 31, 1652864400000, NULL, NULL, 12, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('00e73d10-d68d-11ec-aefb-d132b4563e73', 28, 1652866824627, NULL, NULL, 111, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('00e73d10-d68d-11ec-aefb-d132b4563e73', 29, 1652866824627, NULL, NULL, 123, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('dd095840-d68e-11ec-aefb-d132b4563e73', 29, 1652866962411, NULL, NULL, 2, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('18b33a40-d68b-11ec-aefb-d132b4563e73', 24, 1651363200000, NULL, NULL, 8, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('18b33a40-d68b-11ec-aefb-d132b4563e73', 25, 1652864400000, NULL, NULL, 8, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('18b33a40-d68b-11ec-aefb-d132b4563e73', 26, 1651363200000, NULL, NULL, 17, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('00e73d10-d68d-11ec-aefb-d132b4563e73', 28, 1652866918166, NULL, NULL, 1, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('00e73d10-d68d-11ec-aefb-d132b4563e73', 29, 1652866918166, NULL, NULL, 2, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 18, 1654497958268, NULL, NULL, 1, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('18b33a40-d68b-11ec-aefb-d132b4563e73', 27, 1652864400000, NULL, NULL, 17, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('18b33a40-d68b-11ec-aefb-d132b4563e73', 30, 1651363200000, NULL, NULL, 12, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 19, 1654497958268, NULL, NULL, 1, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('18b33a40-d68b-11ec-aefb-d132b4563e73', 31, 1652864400000, NULL, NULL, 12, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 20, 1654497958268, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 21, 1654497958268, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 18, 1654498078385, NULL, NULL, 1, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('dd095840-d68e-11ec-aefb-d132b4563e73', 28, 1652866975477, NULL, NULL, 1, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('dd095840-d68e-11ec-aefb-d132b4563e73', 29, 1652866975477, NULL, NULL, 2, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 22, 1654497958268, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 23, 1654497958268, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 19, 1654498078385, NULL, NULL, 1, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 20, 1654498078385, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('dd095840-d68e-11ec-aefb-d132b4563e73', 28, 1652866988865, NULL, NULL, 1, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 21, 1654498078385, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 22, 1654498078385, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 23, 1654498078385, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('dd095840-d68e-11ec-aefb-d132b4563e73', 29, 1652866988865, NULL, NULL, 2, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 18, 1652866996047, NULL, NULL, 9, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 19, 1652866996047, NULL, NULL, 9, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 20, 1652866996047, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 21, 1652866996047, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 22, 1652866996047, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 23, 1652866996047, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 18, 1652867236052, NULL, NULL, 1, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 19, 1652867236052, NULL, NULL, 1, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 20, 1652867236052, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 21, 1652867236052, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 22, 1652867236052, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 23, 1652867236052, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 18, 1652867296053, NULL, NULL, 2, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 19, 1652867296053, NULL, NULL, 2, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 20, 1652867296053, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 21, 1652867296053, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 22, 1652867296053, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 23, 1652867296053, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 18, 1652867656059, NULL, NULL, 1, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 19, 1652867656059, NULL, NULL, 1, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 20, 1652867656059, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 21, 1652867656059, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 22, 1652867656059, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 23, 1652867656059, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 18, 1652867896064, NULL, NULL, 1, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 19, 1652867896064, NULL, NULL, 1, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 20, 1652867896064, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 21, 1652867896064, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 22, 1652867896064, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 23, 1652867896064, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('3da82270-d68b-11ec-aefb-d132b4563e73', 17, 1653379200000, NULL, NULL, 5, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('3da82270-d68b-11ec-aefb-d132b4563e73', 17, 1653375600000, NULL, NULL, 40, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('18b33a40-d68b-11ec-aefb-d132b4563e73', 17, 1653379200000, NULL, NULL, 5, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('18b33a40-d68b-11ec-aefb-d132b4563e73', 17, 1653372000000, NULL, NULL, 41, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('18b33a40-d68b-11ec-aefb-d132b4563e73', 17, 1652868000000, NULL, NULL, 4, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('3da82270-d68b-11ec-aefb-d132b4563e73', 17, 1652868000000, NULL, NULL, 4, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('3da82270-d68b-11ec-aefb-d132b4563e73', 17, 1652936400000, NULL, NULL, 31, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('18b33a40-d68b-11ec-aefb-d132b4563e73', 17, 1652936400000, NULL, NULL, 31, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 18, 1652939212240, NULL, NULL, 2, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 19, 1652939212240, NULL, NULL, 2, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 20, 1652939212240, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 21, 1652939212240, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 22, 1652939212240, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 23, 1652939212240, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 18, 1653375344188, NULL, NULL, 2, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 19, 1653375344188, NULL, NULL, 2, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 20, 1653375344188, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('18b33a40-d68b-11ec-aefb-d132b4563e73', 17, 1652943600000, NULL, NULL, 33, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('3da82270-d68b-11ec-aefb-d132b4563e73', 17, 1652943600000, NULL, NULL, 33, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 18, 1652939332325, NULL, NULL, 2, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 19, 1652939332325, NULL, NULL, 2, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 20, 1652939332325, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 21, 1652939332325, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 22, 1652939332325, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 23, 1652939332325, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('3da82270-d68b-11ec-aefb-d132b4563e73', 17, 1652940000000, NULL, NULL, 60, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('18b33a40-d68b-11ec-aefb-d132b4563e73', 17, 1652940000000, NULL, NULL, 60, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 21, 1653375344188, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 18, 1652939392326, NULL, NULL, 2, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 19, 1652939392326, NULL, NULL, 2, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 20, 1652939392326, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 21, 1652939392326, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 22, 1652939392326, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 23, 1652939392326, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 22, 1653375344188, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 18, 1653040625981, NULL, NULL, 1, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 19, 1653040625981, NULL, NULL, 1, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 20, 1653040625981, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 18, 1652939452329, NULL, NULL, 1, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 19, 1652939452329, NULL, NULL, 1, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 20, 1652939452329, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 21, 1652939452329, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 22, 1652939452329, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 23, 1652939452329, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 21, 1653040625981, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('3da82270-d68b-11ec-aefb-d132b4563e73', 32, 1651363200000, NULL, NULL, 1, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('3da82270-d68b-11ec-aefb-d132b4563e73', 33, 1652936400000, NULL, NULL, 1, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 22, 1653040625981, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('18b33a40-d68b-11ec-aefb-d132b4563e73', 32, 1651363200000, NULL, NULL, 1, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('18b33a40-d68b-11ec-aefb-d132b4563e73', 33, 1652936400000, NULL, NULL, 1, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 23, 1653040625981, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 23, 1653375344188, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 18, 1652939512332, NULL, NULL, 1, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 19, 1652939512332, NULL, NULL, 1, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 20, 1652939512332, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 21, 1652939512332, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 22, 1652939512332, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 23, 1652939512332, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('3da82270-d68b-11ec-aefb-d132b4563e73', 17, 1653372000000, NULL, NULL, 41, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 20, 1654506778697, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('18b33a40-d68b-11ec-aefb-d132b4563e73', 17, 1653037200000, NULL, NULL, 6, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('3da82270-d68b-11ec-aefb-d132b4563e73', 17, 1653037200000, NULL, NULL, 6, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 18, 1653373724026, NULL, NULL, 1, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 19, 1653373724026, NULL, NULL, 1, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 20, 1653373724026, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('18b33a40-d68b-11ec-aefb-d132b4563e73', 17, 1653375600000, NULL, NULL, 40, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 21, 1653373724026, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 22, 1653373724026, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 23, 1653373724026, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 21, 1654506778697, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 18, 1653375284185, NULL, NULL, 1, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 19, 1653375284185, NULL, NULL, 1, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 20, 1653375284185, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 21, 1653375284185, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 22, 1653375284185, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 23, 1653375284185, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('18b33a40-d68b-11ec-aefb-d132b4563e73', 17, 1653894000000, NULL, NULL, 12, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('3da82270-d68b-11ec-aefb-d132b4563e73', 17, 1653894000000, NULL, NULL, 12, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('18b33a40-d68b-11ec-aefb-d132b4563e73', 24, 1654041600000, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('18b33a40-d68b-11ec-aefb-d132b4563e73', 26, 1654041600000, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('18b33a40-d68b-11ec-aefb-d132b4563e73', 30, 1654041600000, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 22, 1654506778697, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('18b33a40-d68b-11ec-aefb-d132b4563e73', 32, 1654041600000, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('3da82270-d68b-11ec-aefb-d132b4563e73', 24, 1654041600000, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('3da82270-d68b-11ec-aefb-d132b4563e73', 26, 1654041600000, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('3da82270-d68b-11ec-aefb-d132b4563e73', 30, 1654041600000, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 23, 1654506778697, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('3da82270-d68b-11ec-aefb-d132b4563e73', 32, 1654041600000, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('18b33a40-d68b-11ec-aefb-d132b4563e73', 17, 1654765200000, NULL, NULL, 51, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('3da82270-d68b-11ec-aefb-d132b4563e73', 16, 1654041600000, NULL, NULL, 371, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('3da82270-d68b-11ec-aefb-d132b4563e73', 17, 1654768800000, NULL, NULL, 2, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('18b33a40-d68b-11ec-aefb-d132b4563e73', 16, 1654041600000, NULL, NULL, 371, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('18b33a40-d68b-11ec-aefb-d132b4563e73', 17, 1654768800000, NULL, NULL, 2, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('18b33a40-d68b-11ec-aefb-d132b4563e73', 17, 1654495200000, NULL, NULL, 26, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('18b33a40-d68b-11ec-aefb-d132b4563e73', 17, 1654506000000, NULL, NULL, 63, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('3da82270-d68b-11ec-aefb-d132b4563e73', 17, 1654506000000, NULL, NULL, 63, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 18, 1654506838699, NULL, NULL, 1, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 19, 1654506838699, NULL, NULL, 1, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 20, 1654506838699, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 21, 1654506838699, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 22, 1654506838699, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 23, 1654506838699, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('3da82270-d68b-11ec-aefb-d132b4563e73', 17, 1654761600000, NULL, NULL, 60, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('18b33a40-d68b-11ec-aefb-d132b4563e73', 17, 1654758000000, NULL, NULL, 14, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('18b33a40-d68b-11ec-aefb-d132b4563e73', 17, 1654761600000, NULL, NULL, 60, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('3da82270-d68b-11ec-aefb-d132b4563e73', 17, 1654758000000, NULL, NULL, 14, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('18b33a40-d68b-11ec-aefb-d132b4563e73', 17, 1654502400000, NULL, NULL, 60, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('3da82270-d68b-11ec-aefb-d132b4563e73', 17, 1654502400000, NULL, NULL, 60, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('18b33a40-d68b-11ec-aefb-d132b4563e73', 17, 1654585200000, NULL, NULL, 18, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('3da82270-d68b-11ec-aefb-d132b4563e73', 17, 1654585200000, NULL, NULL, 18, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('18b33a40-d68b-11ec-aefb-d132b4563e73', 17, 1654592400000, NULL, NULL, 1, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('3da82270-d68b-11ec-aefb-d132b4563e73', 17, 1654592400000, NULL, NULL, 1, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('3da82270-d68b-11ec-aefb-d132b4563e73', 17, 1654498800000, NULL, NULL, 60, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('18b33a40-d68b-11ec-aefb-d132b4563e73', 17, 1654498800000, NULL, NULL, 60, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('18b33a40-d68b-11ec-aefb-d132b4563e73', 17, 1654596000000, NULL, NULL, 2, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('3da82270-d68b-11ec-aefb-d132b4563e73', 17, 1654596000000, NULL, NULL, 2, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('18b33a40-d68b-11ec-aefb-d132b4563e73', 17, 1654578000000, NULL, NULL, 14, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('3da82270-d68b-11ec-aefb-d132b4563e73', 17, 1654578000000, NULL, NULL, 14, NULL, NULL);
INSERT INTO "public"."ts_kv" VALUES ('3da82270-d68b-11ec-aefb-d132b4563e73', 17, 1654765200000, NULL, NULL, 51, NULL, NULL);

-- ----------------------------
-- Table structure for ts_kv_dictionary
-- ----------------------------
DROP TABLE IF EXISTS "public"."ts_kv_dictionary";
CREATE TABLE "public"."ts_kv_dictionary" (
  "key" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "key_id" int4 NOT NULL DEFAULT nextval('ts_kv_dictionary_key_id_seq'::regclass)
)
;

-- ----------------------------
-- Records of ts_kv_dictionary
-- ----------------------------
INSERT INTO "public"."ts_kv_dictionary" VALUES ('transportApiState', 1);
INSERT INTO "public"."ts_kv_dictionary" VALUES ('dbApiState', 2);
INSERT INTO "public"."ts_kv_dictionary" VALUES ('ruleEngineApiState', 3);
INSERT INTO "public"."ts_kv_dictionary" VALUES ('jsExecutionApiState', 4);
INSERT INTO "public"."ts_kv_dictionary" VALUES ('emailApiState', 5);
INSERT INTO "public"."ts_kv_dictionary" VALUES ('smsApiState', 6);
INSERT INTO "public"."ts_kv_dictionary" VALUES ('alarmApiState', 7);
INSERT INTO "public"."ts_kv_dictionary" VALUES ('transportMsgLimit', 8);
INSERT INTO "public"."ts_kv_dictionary" VALUES ('transportDataPointsLimit', 9);
INSERT INTO "public"."ts_kv_dictionary" VALUES ('storageDataPointsLimit', 10);
INSERT INTO "public"."ts_kv_dictionary" VALUES ('ruleEngineExecutionLimit', 11);
INSERT INTO "public"."ts_kv_dictionary" VALUES ('jsExecutionLimit', 12);
INSERT INTO "public"."ts_kv_dictionary" VALUES ('emailLimit', 13);
INSERT INTO "public"."ts_kv_dictionary" VALUES ('smsLimit', 14);
INSERT INTO "public"."ts_kv_dictionary" VALUES ('createdAlarmsLimit', 15);
INSERT INTO "public"."ts_kv_dictionary" VALUES ('ruleEngineExecutionCount', 16);
INSERT INTO "public"."ts_kv_dictionary" VALUES ('ruleEngineExecutionCountHourly', 17);
INSERT INTO "public"."ts_kv_dictionary" VALUES ('totalMsgs', 18);
INSERT INTO "public"."ts_kv_dictionary" VALUES ('successfulMsgs', 19);
INSERT INTO "public"."ts_kv_dictionary" VALUES ('failedMsgs', 20);
INSERT INTO "public"."ts_kv_dictionary" VALUES ('tmpFailed', 21);
INSERT INTO "public"."ts_kv_dictionary" VALUES ('tmpTimeout', 22);
INSERT INTO "public"."ts_kv_dictionary" VALUES ('timeoutMsgs', 23);
INSERT INTO "public"."ts_kv_dictionary" VALUES ('transportMsgCount', 24);
INSERT INTO "public"."ts_kv_dictionary" VALUES ('transportMsgCountHourly', 25);
INSERT INTO "public"."ts_kv_dictionary" VALUES ('transportDataPointsCount', 26);
INSERT INTO "public"."ts_kv_dictionary" VALUES ('transportDataPointsCountHourly', 27);
INSERT INTO "public"."ts_kv_dictionary" VALUES ('height', 28);
INSERT INTO "public"."ts_kv_dictionary" VALUES ('weight', 29);
INSERT INTO "public"."ts_kv_dictionary" VALUES ('storageDataPointsCount', 30);
INSERT INTO "public"."ts_kv_dictionary" VALUES ('storageDataPointsCountHourly', 31);
INSERT INTO "public"."ts_kv_dictionary" VALUES ('jsExecutionCount', 32);
INSERT INTO "public"."ts_kv_dictionary" VALUES ('jsExecutionCountHourly', 33);
INSERT INTO "public"."ts_kv_dictionary" VALUES ('emailCountHourly', 34);
INSERT INTO "public"."ts_kv_dictionary" VALUES ('smsCountHourly', 35);
INSERT INTO "public"."ts_kv_dictionary" VALUES ('createdAlarmsCountHourly', 36);
INSERT INTO "public"."ts_kv_dictionary" VALUES ('createdAlarmsCount', 37);
INSERT INTO "public"."ts_kv_dictionary" VALUES ('smsCount', 38);
INSERT INTO "public"."ts_kv_dictionary" VALUES ('emailCount', 39);

-- ----------------------------
-- Table structure for ts_kv_latest
-- ----------------------------
DROP TABLE IF EXISTS "public"."ts_kv_latest";
CREATE TABLE "public"."ts_kv_latest" (
  "entity_id" uuid NOT NULL,
  "key" int4 NOT NULL,
  "ts" int8 NOT NULL,
  "bool_v" bool,
  "str_v" varchar(10000000) COLLATE "pg_catalog"."default",
  "long_v" int8,
  "dbl_v" float8,
  "json_v" json
)
;

-- ----------------------------
-- Records of ts_kv_latest
-- ----------------------------
INSERT INTO "public"."ts_kv_latest" VALUES ('18b33a40-d68b-11ec-aefb-d132b4563e73', 1, 1652865344484, NULL, 'ENABLED', NULL, NULL, NULL);
INSERT INTO "public"."ts_kv_latest" VALUES ('18b33a40-d68b-11ec-aefb-d132b4563e73', 3, 1652865344484, NULL, 'ENABLED', NULL, NULL, NULL);
INSERT INTO "public"."ts_kv_latest" VALUES ('18b33a40-d68b-11ec-aefb-d132b4563e73', 2, 1652865344484, NULL, 'ENABLED', NULL, NULL, NULL);
INSERT INTO "public"."ts_kv_latest" VALUES ('18b33a40-d68b-11ec-aefb-d132b4563e73', 7, 1652865344484, NULL, 'ENABLED', NULL, NULL, NULL);
INSERT INTO "public"."ts_kv_latest" VALUES ('18b33a40-d68b-11ec-aefb-d132b4563e73', 4, 1652865344484, NULL, 'ENABLED', NULL, NULL, NULL);
INSERT INTO "public"."ts_kv_latest" VALUES ('18b33a40-d68b-11ec-aefb-d132b4563e73', 5, 1652865344484, NULL, 'ENABLED', NULL, NULL, NULL);
INSERT INTO "public"."ts_kv_latest" VALUES ('18b33a40-d68b-11ec-aefb-d132b4563e73', 6, 1652865344484, NULL, 'ENABLED', NULL, NULL, NULL);
INSERT INTO "public"."ts_kv_latest" VALUES ('18b33a40-d68b-11ec-aefb-d132b4563e73', 13, 1652865344484, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv_latest" VALUES ('18b33a40-d68b-11ec-aefb-d132b4563e73', 10, 1652865344484, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv_latest" VALUES ('18b33a40-d68b-11ec-aefb-d132b4563e73', 11, 1652865344484, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv_latest" VALUES ('18b33a40-d68b-11ec-aefb-d132b4563e73', 8, 1652865344484, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv_latest" VALUES ('18b33a40-d68b-11ec-aefb-d132b4563e73', 9, 1652865344484, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv_latest" VALUES ('18b33a40-d68b-11ec-aefb-d132b4563e73', 12, 1652865344484, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv_latest" VALUES ('18b33a40-d68b-11ec-aefb-d132b4563e73', 14, 1652865344484, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv_latest" VALUES ('18b33a40-d68b-11ec-aefb-d132b4563e73', 15, 1652865344484, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv_latest" VALUES ('3da82270-d68b-11ec-aefb-d132b4563e73', 2, 1652865406487, NULL, 'ENABLED', NULL, NULL, NULL);
INSERT INTO "public"."ts_kv_latest" VALUES ('3da82270-d68b-11ec-aefb-d132b4563e73', 5, 1652865406487, NULL, 'ENABLED', NULL, NULL, NULL);
INSERT INTO "public"."ts_kv_latest" VALUES ('3da82270-d68b-11ec-aefb-d132b4563e73', 6, 1652865406487, NULL, 'ENABLED', NULL, NULL, NULL);
INSERT INTO "public"."ts_kv_latest" VALUES ('3da82270-d68b-11ec-aefb-d132b4563e73', 3, 1652865406487, NULL, 'ENABLED', NULL, NULL, NULL);
INSERT INTO "public"."ts_kv_latest" VALUES ('3da82270-d68b-11ec-aefb-d132b4563e73', 4, 1652865406487, NULL, 'ENABLED', NULL, NULL, NULL);
INSERT INTO "public"."ts_kv_latest" VALUES ('3da82270-d68b-11ec-aefb-d132b4563e73', 7, 1652865406487, NULL, 'ENABLED', NULL, NULL, NULL);
INSERT INTO "public"."ts_kv_latest" VALUES ('3da82270-d68b-11ec-aefb-d132b4563e73', 1, 1652865406487, NULL, 'ENABLED', NULL, NULL, NULL);
INSERT INTO "public"."ts_kv_latest" VALUES ('dd095840-d68e-11ec-aefb-d132b4563e73', 28, 1652866988865, NULL, NULL, 1, NULL, NULL);
INSERT INTO "public"."ts_kv_latest" VALUES ('dd095840-d68e-11ec-aefb-d132b4563e73', 29, 1652866988865, NULL, NULL, 2, NULL, NULL);
INSERT INTO "public"."ts_kv_latest" VALUES ('3da82270-d68b-11ec-aefb-d132b4563e73', 25, 1652864400000, NULL, NULL, 8, NULL, NULL);
INSERT INTO "public"."ts_kv_latest" VALUES ('3da82270-d68b-11ec-aefb-d132b4563e73', 27, 1652864400000, NULL, NULL, 17, NULL, NULL);
INSERT INTO "public"."ts_kv_latest" VALUES ('3da82270-d68b-11ec-aefb-d132b4563e73', 16, 1654041600000, NULL, NULL, 371, NULL, NULL);
INSERT INTO "public"."ts_kv_latest" VALUES ('3da82270-d68b-11ec-aefb-d132b4563e73', 17, 1654768800000, NULL, NULL, 2, NULL, NULL);
INSERT INTO "public"."ts_kv_latest" VALUES ('00e73d10-d68d-11ec-aefb-d132b4563e73', 28, 1652866918166, NULL, NULL, 1, NULL, NULL);
INSERT INTO "public"."ts_kv_latest" VALUES ('00e73d10-d68d-11ec-aefb-d132b4563e73', 29, 1652866918166, NULL, NULL, 2, NULL, NULL);
INSERT INTO "public"."ts_kv_latest" VALUES ('18b33a40-d68b-11ec-aefb-d132b4563e73', 27, 1652864400000, NULL, NULL, 17, NULL, NULL);
INSERT INTO "public"."ts_kv_latest" VALUES ('18b33a40-d68b-11ec-aefb-d132b4563e73', 16, 1654041600000, NULL, NULL, 371, NULL, NULL);
INSERT INTO "public"."ts_kv_latest" VALUES ('18b33a40-d68b-11ec-aefb-d132b4563e73', 17, 1654768800000, NULL, NULL, 2, NULL, NULL);
INSERT INTO "public"."ts_kv_latest" VALUES ('3da82270-d68b-11ec-aefb-d132b4563e73', 31, 1652864400000, NULL, NULL, 12, NULL, NULL);
INSERT INTO "public"."ts_kv_latest" VALUES ('18b33a40-d68b-11ec-aefb-d132b4563e73', 25, 1652864400000, NULL, NULL, 8, NULL, NULL);
INSERT INTO "public"."ts_kv_latest" VALUES ('18b33a40-d68b-11ec-aefb-d132b4563e73', 31, 1652864400000, NULL, NULL, 12, NULL, NULL);
INSERT INTO "public"."ts_kv_latest" VALUES ('18b33a40-d68b-11ec-aefb-d132b4563e73', 24, 1654041600000, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv_latest" VALUES ('18b33a40-d68b-11ec-aefb-d132b4563e73', 26, 1654041600000, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv_latest" VALUES ('18b33a40-d68b-11ec-aefb-d132b4563e73', 30, 1654041600000, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv_latest" VALUES ('18b33a40-d68b-11ec-aefb-d132b4563e73', 32, 1654041600000, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv_latest" VALUES ('3da82270-d68b-11ec-aefb-d132b4563e73', 24, 1654041600000, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv_latest" VALUES ('3da82270-d68b-11ec-aefb-d132b4563e73', 32, 1654041600000, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv_latest" VALUES ('3da82270-d68b-11ec-aefb-d132b4563e73', 26, 1654041600000, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv_latest" VALUES ('3da82270-d68b-11ec-aefb-d132b4563e73', 30, 1654041600000, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv_latest" VALUES ('f7526090-e578-11ec-a8c7-4b21fe31dd59', 28, 1652866918166, NULL, NULL, 1, NULL, NULL);
INSERT INTO "public"."ts_kv_latest" VALUES ('f7526090-e578-11ec-a8c7-4b21fe31dd59', 29, 1652866918166, NULL, NULL, 2, NULL, NULL);
INSERT INTO "public"."ts_kv_latest" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 18, 1654506838699, NULL, NULL, 1, NULL, NULL);
INSERT INTO "public"."ts_kv_latest" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 21, 1654506838699, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv_latest" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 22, 1654506838699, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv_latest" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 19, 1654506838699, NULL, NULL, 1, NULL, NULL);
INSERT INTO "public"."ts_kv_latest" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 20, 1654506838699, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv_latest" VALUES ('457ab2b0-d68b-11ec-aefb-d132b4563e73', 23, 1654506838699, NULL, NULL, 0, NULL, NULL);
INSERT INTO "public"."ts_kv_latest" VALUES ('18b33a40-d68b-11ec-aefb-d132b4563e73', 33, 1652936400000, NULL, NULL, 1, NULL, NULL);
INSERT INTO "public"."ts_kv_latest" VALUES ('3da82270-d68b-11ec-aefb-d132b4563e73', 33, 1652936400000, NULL, NULL, 1, NULL, NULL);

-- ----------------------------
-- Table structure for user_credentials
-- ----------------------------
DROP TABLE IF EXISTS "public"."user_credentials";
CREATE TABLE "public"."user_credentials" (
  "id" uuid NOT NULL,
  "created_time" int8 NOT NULL,
  "activate_token" varchar(255) COLLATE "pg_catalog"."default",
  "enabled" bool,
  "password" varchar(255) COLLATE "pg_catalog"."default",
  "reset_token" varchar(255) COLLATE "pg_catalog"."default",
  "user_id" uuid
)
;

-- ----------------------------
-- Records of user_credentials
-- ----------------------------
INSERT INTO "public"."user_credentials" VALUES ('61441950-4612-11e7-a919-92ebcb67fe33', 1592576748000, NULL, 't', '$2a$10$5JTB8/hxWc9WAy62nCGSxeefl3KWmipA9nFpVdDa0/xfIseeBB4Bu', NULL, '5a797660-4612-11e7-a919-92ebcb67fe33');
INSERT INTO "public"."user_credentials" VALUES ('389882c0-d68b-11ec-aefb-d132b4563e73', 1652865397996, NULL, 't', '$2a$10$EABBiI7oTD6I9oE6n7Rihez09iDVX.iOv/x00etGinn16RxYYMhgy', NULL, '3895eab0-d68b-11ec-aefb-d132b4563e73');
INSERT INTO "public"."user_credentials" VALUES ('cffccc10-e578-11ec-a8c7-4b21fe31dd59', 1654506758993, NULL, 't', '$2a$10$pgPYQOiCDxWzF4c2gIfe9OlccrFRl88Bp.RzL0BS5xk03fjdu7La6', NULL, 'cffa5b10-e578-11ec-a8c7-4b21fe31dd59');

-- ----------------------------
-- Table structure for widget_type
-- ----------------------------
DROP TABLE IF EXISTS "public"."widget_type";
CREATE TABLE "public"."widget_type" (
  "id" uuid NOT NULL,
  "created_time" int8 NOT NULL,
  "alias" varchar(255) COLLATE "pg_catalog"."default",
  "bundle_alias" varchar(255) COLLATE "pg_catalog"."default",
  "descriptor" varchar(1000000) COLLATE "pg_catalog"."default",
  "name" varchar(255) COLLATE "pg_catalog"."default",
  "tenant_id" uuid,
  "image" varchar(1000000) COLLATE "pg_catalog"."default",
  "description" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of widget_type
-- ----------------------------

-- ----------------------------
-- Table structure for widgets_bundle
-- ----------------------------
DROP TABLE IF EXISTS "public"."widgets_bundle";
CREATE TABLE "public"."widgets_bundle" (
  "id" uuid NOT NULL,
  "created_time" int8 NOT NULL,
  "alias" varchar(255) COLLATE "pg_catalog"."default",
  "search_text" varchar(255) COLLATE "pg_catalog"."default",
  "tenant_id" uuid,
  "title" varchar(255) COLLATE "pg_catalog"."default",
  "image" varchar(1000000) COLLATE "pg_catalog"."default",
  "description" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of widgets_bundle
-- ----------------------------

-- ----------------------------
-- Table structure for xxl_job_group
-- ----------------------------
DROP TABLE IF EXISTS "public"."xxl_job_group";
CREATE TABLE "public"."xxl_job_group" (
  "app_name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "title" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "address_type" int8 NOT NULL DEFAULT 0,
  "address_list" text COLLATE "pg_catalog"."default",
  "update_time" timestamp(6),
  "id" int8 NOT NULL DEFAULT nextval('xxl_job_group_id_seq'::regclass)
)
;
COMMENT ON COLUMN "public"."xxl_job_group"."app_name" IS '执行器AppName';
COMMENT ON COLUMN "public"."xxl_job_group"."title" IS '执行器名称';
COMMENT ON COLUMN "public"."xxl_job_group"."address_type" IS '执行器地址类型：0=自动注册、1=手动录入';
COMMENT ON COLUMN "public"."xxl_job_group"."address_list" IS '执行器地址列表，多地址逗号分隔';

-- ----------------------------
-- Records of xxl_job_group
-- ----------------------------
INSERT INTO "public"."xxl_job_group" VALUES ('things', 'things', 0, 'http://192.168.201.31:9999/', '2022-06-09 18:01:51.326', 17);
INSERT INTO "public"."xxl_job_group" VALUES ('xxl-job-executor-sample', '示例执行器', 0, NULL, '2022-06-09 18:01:51.338', 1);

-- ----------------------------
-- Table structure for xxl_job_info
-- ----------------------------
DROP TABLE IF EXISTS "public"."xxl_job_info";
CREATE TABLE "public"."xxl_job_info" (
  "job_group" int8 NOT NULL,
  "job_desc" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "add_time" timestamp(6),
  "update_time" timestamp(6),
  "author" varchar(255) COLLATE "pg_catalog"."default",
  "alarm_email" varchar(255) COLLATE "pg_catalog"."default",
  "schedule_type" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'NONE'::character varying,
  "schedule_conf" varchar(128) COLLATE "pg_catalog"."default",
  "misfire_strategy" varchar(50) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'DO_NOTHING'::character varying,
  "executor_route_strategy" varchar(50) COLLATE "pg_catalog"."default",
  "executor_handler" varchar(255) COLLATE "pg_catalog"."default",
  "executor_param" varchar(5000) COLLATE "pg_catalog"."default",
  "executor_block_strategy" varchar(50) COLLATE "pg_catalog"."default",
  "executor_timeout" int8 NOT NULL DEFAULT 0,
  "executor_fail_retry_count" int8 NOT NULL DEFAULT 0,
  "glue_type" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "glue_source" text COLLATE "pg_catalog"."default",
  "glue_remark" varchar(255) COLLATE "pg_catalog"."default",
  "glue_updatetime" timestamp(6),
  "child_jobid" varchar(255) COLLATE "pg_catalog"."default",
  "trigger_status" int4 NOT NULL DEFAULT 0,
  "trigger_last_time" int8 NOT NULL DEFAULT 0,
  "trigger_next_time" int8 NOT NULL DEFAULT 0,
  "id" int8 NOT NULL DEFAULT nextval('xxl_job_info_id_seq'::regclass)
)
;
COMMENT ON COLUMN "public"."xxl_job_info"."author" IS '作者';

-- ----------------------------
-- Records of xxl_job_info
-- ----------------------------
INSERT INTO "public"."xxl_job_info" VALUES (1, '123', '2022-06-08 17:49:42.754', '2022-06-08 17:49:42.754', 'Houyong Yang', '', 'CRON', '* * * * * ?', 'DO_NOTHING', 'FIRST', '111111', '', 'SERIAL_EXECUTION', 0, 0, 'BEAN', '', 'GLUE代码初始化', '2022-06-08 17:49:42.754', '', 0, 0, 0, 1);
INSERT INTO "public"."xxl_job_info" VALUES (17, 'demoJobHandler', '2022-06-09 15:46:17.743', '2022-06-09 15:48:16.344', 'Houyong Yang', '', 'CRON', '0 * * * * ?', 'DO_NOTHING', 'LAST', 'demoJobHandler', '', 'DISCARD_LATER', 0, 0, 'BEAN', '', 'GLUE代码初始化', '2022-06-09 15:46:17.743', '', 1, 1654768920000, 1654768980000, 2);

-- ----------------------------
-- Table structure for xxl_job_lock
-- ----------------------------
DROP TABLE IF EXISTS "public"."xxl_job_lock";
CREATE TABLE "public"."xxl_job_lock" (
  "lock_name" varchar(50) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of xxl_job_lock
-- ----------------------------

-- ----------------------------
-- Table structure for xxl_job_log
-- ----------------------------
DROP TABLE IF EXISTS "public"."xxl_job_log";
CREATE TABLE "public"."xxl_job_log" (
  "id" int8 NOT NULL DEFAULT nextval('xxl_job_log_id_seq'::regclass),
  "job_group" int8 NOT NULL,
  "job_id" int8 NOT NULL,
  "executor_address" varchar(255) COLLATE "pg_catalog"."default",
  "executor_handler" varchar(255) COLLATE "pg_catalog"."default",
  "executor_param" varchar(5000) COLLATE "pg_catalog"."default",
  "executor_sharding_param" varchar(255) COLLATE "pg_catalog"."default",
  "executor_fail_retry_count" int8 NOT NULL DEFAULT 0,
  "trigger_time" timestamp(6),
  "trigger_code" int8 NOT NULL,
  "trigger_msg" text COLLATE "pg_catalog"."default",
  "handle_time" timestamp(6),
  "handle_code" int8 NOT NULL,
  "handle_msg" text COLLATE "pg_catalog"."default",
  "alarm_status" int4 NOT NULL DEFAULT 0
)
;

-- ----------------------------
-- Records of xxl_job_log
-- ----------------------------
INSERT INTO "public"."xxl_job_log" VALUES (8, 17, 2, NULL, 'demoJobHandler', '', NULL, 0, '2022-06-09 15:53:00.008', 500, '任务触发类型：Cron触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>', NULL, 0, NULL, 2);
INSERT INTO "public"."xxl_job_log" VALUES (9, 17, 2, NULL, 'demoJobHandler', '', NULL, 0, '2022-06-09 15:54:00.006', 500, '任务触发类型：Cron触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>', NULL, 0, NULL, 2);
INSERT INTO "public"."xxl_job_log" VALUES (10, 17, 2, NULL, 'demoJobHandler', '', NULL, 0, '2022-06-09 15:55:00.007', 500, '任务触发类型：Cron触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>', NULL, 0, NULL, 2);
INSERT INTO "public"."xxl_job_log" VALUES (15, 17, 2, NULL, 'demoJobHandler', '', NULL, 0, '2022-06-09 16:04:00.016', 500, '任务触发类型：Cron触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>', NULL, 0, NULL, 2);
INSERT INTO "public"."xxl_job_log" VALUES (13, 17, 2, NULL, 'demoJobHandler', '', NULL, 0, '2022-06-09 15:58:00.492', 500, '任务触发类型：Cron触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>', NULL, 0, NULL, 2);
INSERT INTO "public"."xxl_job_log" VALUES (11, 17, 2, NULL, 'demoJobHandler', '', NULL, 0, '2022-06-09 15:56:00.004', 500, '任务触发类型：Cron触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>', NULL, 0, NULL, 2);
INSERT INTO "public"."xxl_job_log" VALUES (12, 17, 2, NULL, 'demoJobHandler', '', NULL, 0, '2022-06-09 15:57:00.005', 500, '任务触发类型：Cron触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>', NULL, 0, NULL, 2);
INSERT INTO "public"."xxl_job_log" VALUES (14, 17, 2, NULL, 'demoJobHandler', '', NULL, 0, '2022-06-09 15:59:00.004', 500, '任务触发类型：Cron触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>', NULL, 0, NULL, 2);
INSERT INTO "public"."xxl_job_log" VALUES (17, 17, 2, NULL, 'demoJobHandler', '', NULL, 0, '2022-06-09 16:06:00.021', 500, '任务触发类型：Cron触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>', NULL, 0, NULL, 2);
INSERT INTO "public"."xxl_job_log" VALUES (16, 17, 2, NULL, 'demoJobHandler', '', NULL, 0, '2022-06-09 16:05:00.012', 500, '任务触发类型：Cron触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>', NULL, 0, NULL, 2);
INSERT INTO "public"."xxl_job_log" VALUES (19, 17, 2, NULL, 'demoJobHandler', '', NULL, 0, '2022-06-09 16:08:00.01', 500, '任务触发类型：Cron触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>', NULL, 0, NULL, 2);
INSERT INTO "public"."xxl_job_log" VALUES (18, 17, 2, NULL, 'demoJobHandler', '', NULL, 0, '2022-06-09 16:07:02.67', 500, '任务触发类型：Cron触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>', NULL, 0, NULL, 2);
INSERT INTO "public"."xxl_job_log" VALUES (20, 17, 2, NULL, 'demoJobHandler', '', NULL, 0, '2022-06-09 16:10:00.006', 500, '任务触发类型：Cron触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>', NULL, 0, NULL, 2);
INSERT INTO "public"."xxl_job_log" VALUES (21, 17, 2, NULL, 'demoJobHandler', '', NULL, 0, '2022-06-09 16:11:01.041', 500, '任务触发类型：Cron触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>', NULL, 0, NULL, 2);
INSERT INTO "public"."xxl_job_log" VALUES (22, 17, 2, NULL, 'demoJobHandler', '', NULL, 0, '2022-06-09 16:12:00.008', 500, '任务触发类型：Cron触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>', NULL, 0, NULL, 2);
INSERT INTO "public"."xxl_job_log" VALUES (23, 17, 2, NULL, 'demoJobHandler', '', NULL, 0, '2022-06-09 16:14:00.018', 500, '任务触发类型：Cron触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>', NULL, 0, NULL, 2);
INSERT INTO "public"."xxl_job_log" VALUES (24, 17, 2, NULL, 'demoJobHandler', '', NULL, 0, '2022-06-09 16:15:00.014', 500, '任务触发类型：Cron触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>', NULL, 0, NULL, 2);
INSERT INTO "public"."xxl_job_log" VALUES (25, 17, 2, NULL, 'demoJobHandler', '', NULL, 0, '2022-06-09 16:16:00.007', 500, '任务触发类型：Cron触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>', NULL, 0, NULL, 2);
INSERT INTO "public"."xxl_job_log" VALUES (27, 17, 2, NULL, 'demoJobHandler', '', NULL, 0, '2022-06-09 16:19:00.008', 500, '任务触发类型：Cron触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>', NULL, 0, NULL, 2);
INSERT INTO "public"."xxl_job_log" VALUES (26, 17, 2, NULL, 'demoJobHandler', '', NULL, 0, '2022-06-09 16:17:04.036', 500, '任务触发类型：Cron触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>', NULL, 0, NULL, 2);
INSERT INTO "public"."xxl_job_log" VALUES (28, 17, 2, NULL, 'demoJobHandler', '', NULL, 0, '2022-06-09 16:20:00.007', 500, '任务触发类型：Cron触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>', NULL, 0, NULL, 2);
INSERT INTO "public"."xxl_job_log" VALUES (29, 17, 2, NULL, 'demoJobHandler', '', NULL, 0, '2022-06-09 16:21:00.012', 500, '任务触发类型：Cron触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>', NULL, 0, NULL, 2);
INSERT INTO "public"."xxl_job_log" VALUES (30, 17, 2, NULL, 'demoJobHandler', '', NULL, 0, '2022-06-09 16:22:00.007', 500, '任务触发类型：Cron触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>', NULL, 0, NULL, 2);
INSERT INTO "public"."xxl_job_log" VALUES (31, 17, 2, NULL, 'demoJobHandler', '', NULL, 0, '2022-06-09 16:23:00.007', 500, '任务触发类型：Cron触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>', NULL, 0, NULL, 2);
INSERT INTO "public"."xxl_job_log" VALUES (32, 17, 2, NULL, 'demoJobHandler', '', NULL, 0, '2022-06-09 16:24:00.007', 500, '任务触发类型：Cron触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>', NULL, 0, NULL, 2);
INSERT INTO "public"."xxl_job_log" VALUES (33, 17, 2, NULL, 'demoJobHandler', '', NULL, 0, '2022-06-09 16:25:00.007', 500, '任务触发类型：Cron触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>', NULL, 0, NULL, 2);
INSERT INTO "public"."xxl_job_log" VALUES (34, 17, 2, NULL, 'demoJobHandler', '', NULL, 0, '2022-06-09 16:26:00.01', 500, '任务触发类型：Cron触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>', NULL, 0, NULL, 2);
INSERT INTO "public"."xxl_job_log" VALUES (35, 17, 2, NULL, 'demoJobHandler', '', NULL, 0, '2022-06-09 16:27:00.018', 500, '任务触发类型：Cron触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>', NULL, 0, NULL, 2);
INSERT INTO "public"."xxl_job_log" VALUES (36, 17, 2, NULL, 'demoJobHandler', '', NULL, 0, '2022-06-09 16:28:00.005', 500, '任务触发类型：Cron触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>', NULL, 0, NULL, 2);
INSERT INTO "public"."xxl_job_log" VALUES (41, 17, 2, NULL, 'demoJobHandler', '', NULL, 0, '2022-06-09 16:33:00.007', 500, '任务触发类型：Cron触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>', NULL, 0, NULL, 2);
INSERT INTO "public"."xxl_job_log" VALUES (37, 17, 2, NULL, 'demoJobHandler', '', NULL, 0, '2022-06-09 16:29:00.018', 500, '任务触发类型：Cron触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>', NULL, 0, NULL, 2);
INSERT INTO "public"."xxl_job_log" VALUES (42, 17, 2, NULL, 'demoJobHandler', '', NULL, 0, '2022-06-09 16:34:00.409', 500, '任务触发类型：Cron触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>', NULL, 0, NULL, 2);
INSERT INTO "public"."xxl_job_log" VALUES (38, 17, 2, NULL, 'demoJobHandler', '', NULL, 0, '2022-06-09 16:30:00.032', 500, '任务触发类型：Cron触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>', NULL, 0, NULL, 2);
INSERT INTO "public"."xxl_job_log" VALUES (43, 17, 2, NULL, 'demoJobHandler', '', NULL, 0, '2022-06-09 16:35:00.017', 500, '任务触发类型：Cron触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>', NULL, 0, NULL, 2);
INSERT INTO "public"."xxl_job_log" VALUES (111, 17, 2, NULL, 'demoJobHandler', '', NULL, 0, '2022-06-09 17:27:01.048', 500, '任务触发类型：Cron触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>', NULL, 0, NULL, 2);
INSERT INTO "public"."xxl_job_log" VALUES (39, 17, 2, NULL, 'demoJobHandler', '', NULL, 0, '2022-06-09 16:31:00.014', 500, '任务触发类型：Cron触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>', NULL, 0, NULL, 2);
INSERT INTO "public"."xxl_job_log" VALUES (46, 17, 2, NULL, 'demoJobHandler', '', NULL, 0, '2022-06-09 16:38:00.008', 500, '任务触发类型：Cron触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>', NULL, 0, NULL, 2);
INSERT INTO "public"."xxl_job_log" VALUES (40, 17, 2, NULL, 'demoJobHandler', '', NULL, 0, '2022-06-09 16:32:00.006', 500, '任务触发类型：Cron触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>', NULL, 0, NULL, 2);
INSERT INTO "public"."xxl_job_log" VALUES (44, 17, 2, NULL, 'demoJobHandler', '', NULL, 0, '2022-06-09 16:36:00.007', 500, '任务触发类型：Cron触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>', NULL, 0, NULL, 2);
INSERT INTO "public"."xxl_job_log" VALUES (45, 17, 2, NULL, 'demoJobHandler', '', NULL, 0, '2022-06-09 16:37:00.012', 500, '任务触发类型：Cron触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>', NULL, 0, NULL, 2);
INSERT INTO "public"."xxl_job_log" VALUES (47, 17, 2, NULL, 'demoJobHandler', '', NULL, 0, '2022-06-09 16:39:00.018', 500, '任务触发类型：Cron触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>', NULL, 0, NULL, 2);
INSERT INTO "public"."xxl_job_log" VALUES (48, 17, 2, NULL, 'demoJobHandler', '', NULL, 0, '2022-06-09 16:40:00.008', 500, '任务触发类型：Cron触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>', NULL, 0, NULL, 2);
INSERT INTO "public"."xxl_job_log" VALUES (49, 17, 2, NULL, 'demoJobHandler', '', NULL, 0, '2022-06-09 16:41:00.024', 500, '任务触发类型：Cron触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>', NULL, 0, NULL, 2);
INSERT INTO "public"."xxl_job_log" VALUES (50, 17, 2, NULL, 'demoJobHandler', '', NULL, 0, '2022-06-09 16:42:00.016', 500, '任务触发类型：Cron触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>', NULL, 0, NULL, 2);
INSERT INTO "public"."xxl_job_log" VALUES (127, 17, 2, 'http://192.168.201.31:9999/', 'demoJobHandler', '', NULL, 0, '2022-06-09 17:43:00.006', 200, '任务触发类型：Cron触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://192.168.201.31:9999/]<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.201.31:9999/<br>code：200<br>msg：null', '2022-06-09 17:43:10.052', 200, '', 2);
INSERT INTO "public"."xxl_job_log" VALUES (51, 17, 2, NULL, 'demoJobHandler', '', NULL, 0, '2022-06-09 16:43:00.007', 500, '任务触发类型：Cron触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>', NULL, 0, NULL, 2);
INSERT INTO "public"."xxl_job_log" VALUES (112, 17, 2, NULL, 'demoJobHandler', '', NULL, 0, '2022-06-09 17:28:00.006', 500, '任务触发类型：Cron触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>', NULL, 0, NULL, 2);
INSERT INTO "public"."xxl_job_log" VALUES (141, 17, 2, 'http://192.168.201.31:9999/', 'demoJobHandler', '', NULL, 0, '2022-06-09 18:00:00.007', 200, '任务触发类型：Cron触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://192.168.201.31:9999/]<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.201.31:9999/<br>code：200<br>msg：null', '2022-06-09 18:00:10.051', 200, '', 2);
INSERT INTO "public"."xxl_job_log" VALUES (124, 17, 2, 'http://192.168.201.31:9999/', 'demoJobHandler', '', NULL, 0, '2022-06-09 17:40:00.035', 200, '任务触发类型：Cron触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://192.168.201.31:9999/]<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.201.31:9999/<br>code：200<br>msg：null', '2022-06-09 17:40:10.423', 200, '', 2);
INSERT INTO "public"."xxl_job_log" VALUES (125, 17, 2, 'http://192.168.201.31:9999/', 'demoJobHandler', '', NULL, 0, '2022-06-09 17:41:00.007', 200, '任务触发类型：Cron触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://192.168.201.31:9999/]<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.201.31:9999/<br>code：200<br>msg：null', '2022-06-09 17:41:10.048', 200, '', 2);
INSERT INTO "public"."xxl_job_log" VALUES (142, 17, 2, 'http://192.168.201.31:9999/', 'demoJobHandler', '', NULL, 0, '2022-06-09 18:01:00.005', 200, '任务触发类型：Cron触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://192.168.201.31:9999/]<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.201.31:9999/<br>code：200<br>msg：null', '2022-06-09 18:01:10.044', 200, '', 2);
INSERT INTO "public"."xxl_job_log" VALUES (143, 17, 2, 'http://192.168.201.31:9999/', 'demoJobHandler', '', NULL, 0, '2022-06-09 18:02:00.008', 200, '任务触发类型：Cron触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://192.168.201.31:9999/]<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.201.31:9999/<br>code：200<br>msg：null', '2022-06-09 18:02:10.044', 200, '', 2);
INSERT INTO "public"."xxl_job_log" VALUES (128, 17, 2, 'http://192.168.201.31:9999/', 'demoJobHandler', '', NULL, 0, '2022-06-09 17:44:00.006', 200, '任务触发类型：Cron触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://192.168.201.31:9999/]<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.201.31:9999/<br>code：200<br>msg：null', '2022-06-09 17:44:10.046', 200, '', 2);
INSERT INTO "public"."xxl_job_log" VALUES (139, 17, 2, 'http://192.168.201.31:9999/', 'demoJobHandler', '', NULL, 0, '2022-06-09 17:58:00.006', 200, '任务触发类型：Cron触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://192.168.201.31:9999/]<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.201.31:9999/<br>code：200<br>msg：null', '2022-06-09 17:58:10.055', 200, '', 2);
INSERT INTO "public"."xxl_job_log" VALUES (140, 17, 2, 'http://192.168.201.31:9999/', 'demoJobHandler', '', NULL, 0, '2022-06-09 17:59:00.018', 200, '任务触发类型：Cron触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://192.168.201.31:9999/]<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.201.31:9999/<br>code：200<br>msg：null', '2022-06-09 17:59:10.065', 200, '', 2);
INSERT INTO "public"."xxl_job_log" VALUES (52, 17, 2, NULL, 'demoJobHandler', '', NULL, 0, '2022-06-09 16:44:00.011', 500, '任务触发类型：Cron触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>', NULL, 0, NULL, 2);
INSERT INTO "public"."xxl_job_log" VALUES (53, 17, 2, NULL, 'demoJobHandler', '', NULL, 0, '2022-06-09 16:45:00.008', 500, '任务触发类型：Cron触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>', NULL, 0, NULL, 2);
INSERT INTO "public"."xxl_job_log" VALUES (115, 17, 2, 'http://192.168.201.31:9999/', 'demoJobHandler', '', NULL, 0, '2022-06-09 17:32:00.008', 200, '任务触发类型：Cron触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://192.168.201.31:9999/]<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.201.31:9999/<br>code：200<br>msg：null', '2022-06-09 17:32:23.145', 200, '', 2);
INSERT INTO "public"."xxl_job_log" VALUES (54, 17, 2, NULL, 'demoJobHandler', '', NULL, 0, '2022-06-09 16:46:00.007', 500, '任务触发类型：Cron触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>', NULL, 0, NULL, 2);
INSERT INTO "public"."xxl_job_log" VALUES (113, 17, 2, 'http://192.168.201.31:9999/', 'demoJobHandler', '', NULL, 0, '2022-06-09 17:30:00.018', 500, '任务触发类型：Cron触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://192.168.201.31:9999/]<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.201.31:9999/<br>code：500<br>msg：xxl-job remoting error(Read timed out), for url : http://192.168.201.31:9999/run', '2022-06-09 17:30:13.731', 200, '', 2);
INSERT INTO "public"."xxl_job_log" VALUES (114, 17, 2, 'http://192.168.201.31:9999/', 'demoJobHandler', '', NULL, 0, '2022-06-09 17:31:00.012', 200, '任务触发类型：Cron触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://192.168.201.31:9999/]<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.201.31:9999/<br>code：200<br>msg：null', '2022-06-09 17:31:13.452', 200, '', 2);
INSERT INTO "public"."xxl_job_log" VALUES (118, 17, 2, 'http://192.168.201.31:9999/', 'demoJobHandler', '', NULL, 0, '2022-06-09 17:35:00.005', 200, '任务触发类型：Cron触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://192.168.201.31:9999/]<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.201.31:9999/<br>code：200<br>msg：null', '2022-06-09 17:35:10.042', 200, '', 2);
INSERT INTO "public"."xxl_job_log" VALUES (117, 17, 2, 'http://192.168.201.31:9999/', 'demoJobHandler', '', NULL, 0, '2022-06-09 17:34:00.009', 200, '任务触发类型：Cron触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://192.168.201.31:9999/]<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.201.31:9999/<br>code：200<br>msg：null', '2022-06-09 17:34:10.062', 200, '', 2);
INSERT INTO "public"."xxl_job_log" VALUES (116, 17, 2, 'http://192.168.201.31:9999/', 'demoJobHandler', '', NULL, 0, '2022-06-09 17:33:00.011', 200, '任务触发类型：Cron触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://192.168.201.31:9999/]<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.201.31:9999/<br>code：200<br>msg：null', '2022-06-09 17:33:10.056', 200, '', 2);
INSERT INTO "public"."xxl_job_log" VALUES (119, 17, 2, 'http://192.168.201.31:9999/', 'demoJobHandler', '', NULL, 0, '2022-06-09 17:35:36.898', 200, '任务触发类型：手动触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://192.168.201.31:9999/]<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.201.31:9999/<br>code：200<br>msg：null', '2022-06-09 17:35:46.934', 200, '', 2);
INSERT INTO "public"."xxl_job_log" VALUES (120, 17, 2, 'http://192.168.201.31:9999/', 'demoJobHandler', '', NULL, 0, '2022-06-09 17:36:00.029', 200, '任务触发类型：Cron触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://192.168.201.31:9999/]<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.201.31:9999/<br>code：200<br>msg：null', '2022-06-09 17:36:10.119', 200, '', 2);
INSERT INTO "public"."xxl_job_log" VALUES (121, 17, 2, 'http://192.168.201.31:9999/', 'demoJobHandler', '', NULL, 0, '2022-06-09 17:37:00.009', 200, '任务触发类型：Cron触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://192.168.201.31:9999/]<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.201.31:9999/<br>code：200<br>msg：null', '2022-06-09 17:37:10.053', 200, '', 2);
INSERT INTO "public"."xxl_job_log" VALUES (55, 17, 2, NULL, 'demoJobHandler', '', NULL, 0, '2022-06-09 16:47:00.014', 500, '任务触发类型：Cron触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>', NULL, 0, NULL, 2);
INSERT INTO "public"."xxl_job_log" VALUES (56, 17, 2, NULL, 'demoJobHandler', '', NULL, 0, '2022-06-09 16:48:00.014', 500, '任务触发类型：Cron触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>', NULL, 0, NULL, 2);
INSERT INTO "public"."xxl_job_log" VALUES (57, 17, 2, NULL, 'demoJobHandler', '', NULL, 0, '2022-06-09 16:50:00.008', 500, '任务触发类型：Cron触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>', NULL, 0, NULL, 2);
INSERT INTO "public"."xxl_job_log" VALUES (58, 17, 2, NULL, 'demoJobHandler', '', NULL, 0, '2022-06-09 16:51:00.009', 500, '任务触发类型：Cron触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>', NULL, 0, NULL, 2);
INSERT INTO "public"."xxl_job_log" VALUES (60, 17, 2, NULL, 'demoJobHandler', '', NULL, 0, '2022-06-09 16:53:00.013', 500, '任务触发类型：Cron触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>', NULL, 0, NULL, 2);
INSERT INTO "public"."xxl_job_log" VALUES (59, 17, 2, NULL, 'demoJobHandler', '', NULL, 0, '2022-06-09 16:52:00.009', 500, '任务触发类型：Cron触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>', NULL, 0, NULL, 2);
INSERT INTO "public"."xxl_job_log" VALUES (61, 17, 2, NULL, 'demoJobHandler', '', NULL, 0, '2022-06-09 16:54:00.017', 500, '任务触发类型：Cron触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>', NULL, 0, NULL, 2);
INSERT INTO "public"."xxl_job_log" VALUES (63, 17, 2, NULL, 'demoJobHandler', '', NULL, 0, '2022-06-09 16:56:00.008', 500, '任务触发类型：Cron触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>', NULL, 0, NULL, 2);
INSERT INTO "public"."xxl_job_log" VALUES (62, 17, 2, NULL, 'demoJobHandler', '', NULL, 0, '2022-06-09 16:55:00.036', 500, '任务触发类型：Cron触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>', NULL, 0, NULL, 2);
INSERT INTO "public"."xxl_job_log" VALUES (64, 17, 2, NULL, 'demoJobHandler', '', NULL, 0, '2022-06-09 16:57:00.032', 500, '任务触发类型：Cron触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>', NULL, 0, NULL, 2);
INSERT INTO "public"."xxl_job_log" VALUES (66, 17, 2, NULL, 'demoJobHandler', '', NULL, 0, '2022-06-09 16:59:00.01', 500, '任务触发类型：Cron触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>', NULL, 0, NULL, 2);
INSERT INTO "public"."xxl_job_log" VALUES (65, 17, 2, NULL, 'demoJobHandler', '', NULL, 0, '2022-06-09 16:58:00.009', 500, '任务触发类型：Cron触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>', NULL, 0, NULL, 2);
INSERT INTO "public"."xxl_job_log" VALUES (97, 17, 2, NULL, 'demoJobHandler', '', NULL, 0, '2022-06-09 17:10:00.041', 500, '任务触发类型：Cron触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>', NULL, 0, NULL, 2);
INSERT INTO "public"."xxl_job_log" VALUES (99, 17, 2, NULL, 'demoJobHandler', '', NULL, 0, '2022-06-09 17:13:00.018', 500, '任务触发类型：Cron触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>', NULL, 0, NULL, 2);
INSERT INTO "public"."xxl_job_log" VALUES (98, 17, 2, NULL, 'demoJobHandler', '', NULL, 0, '2022-06-09 17:11:00.013', 500, '任务触发类型：Cron触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>', NULL, 0, NULL, 2);
INSERT INTO "public"."xxl_job_log" VALUES (100, 17, 2, NULL, 'demoJobHandler', '', NULL, 0, '2022-06-09 17:15:00.018', 500, '任务触发类型：Cron触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>', NULL, 0, NULL, 2);
INSERT INTO "public"."xxl_job_log" VALUES (130, 17, 2, 'http://192.168.201.31:9999/', 'demoJobHandler', '', NULL, 0, '2022-06-09 17:49:00.008', 200, '任务触发类型：Cron触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://192.168.201.31:9999/]<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.201.31:9999/<br>code：200<br>msg：null', '2022-06-09 17:49:10.05', 200, '', 2);
INSERT INTO "public"."xxl_job_log" VALUES (106, 17, 2, NULL, 'demoJobHandler', '', NULL, 0, '2022-06-09 17:21:00.007', 500, '任务触发类型：Cron触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>', NULL, 0, NULL, 2);
INSERT INTO "public"."xxl_job_log" VALUES (122, 17, 2, 'http://192.168.201.31:9999/', 'demoJobHandler', '', NULL, 0, '2022-06-09 17:38:00.005', 200, '任务触发类型：Cron触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://192.168.201.31:9999/]<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.201.31:9999/<br>code：200<br>msg：null', '2022-06-09 17:38:10.051', 200, '', 2);
INSERT INTO "public"."xxl_job_log" VALUES (107, 17, 2, NULL, 'demoJobHandler', '', NULL, 0, '2022-06-09 17:23:00.006', 500, '任务触发类型：Cron触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>', NULL, 0, NULL, 2);
INSERT INTO "public"."xxl_job_log" VALUES (129, 17, 2, 'http://192.168.201.31:9999/', 'demoJobHandler', '', NULL, 0, '2022-06-09 17:48:00.01', 200, '任务触发类型：Cron触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://192.168.201.31:9999/]<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.201.31:9999/<br>code：200<br>msg：null', '2022-06-09 17:48:10.059', 200, '', 2);
INSERT INTO "public"."xxl_job_log" VALUES (110, 17, 2, NULL, 'demoJobHandler', '', NULL, 0, '2022-06-09 17:26:00.005', 500, '任务触发类型：Cron触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>', NULL, 0, NULL, 2);
INSERT INTO "public"."xxl_job_log" VALUES (132, 17, 2, 'http://192.168.201.31:9999/', 'demoJobHandler', '', NULL, 0, '2022-06-09 17:51:00.013', 200, '任务触发类型：Cron触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://192.168.201.31:9999/]<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.201.31:9999/<br>code：200<br>msg：null', '2022-06-09 17:51:10.053', 200, '', 2);
INSERT INTO "public"."xxl_job_log" VALUES (131, 17, 2, 'http://192.168.201.31:9999/', 'demoJobHandler', '', NULL, 0, '2022-06-09 17:50:00.036', 200, '任务触发类型：Cron触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://192.168.201.31:9999/]<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.201.31:9999/<br>code：200<br>msg：null', '2022-06-09 17:50:10.103', 200, '', 2);
INSERT INTO "public"."xxl_job_log" VALUES (133, 17, 2, 'http://192.168.201.31:9999/', 'demoJobHandler', '', NULL, 0, '2022-06-09 17:52:00.007', 200, '任务触发类型：Cron触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://192.168.201.31:9999/]<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.201.31:9999/<br>code：200<br>msg：null', '2022-06-09 17:52:10.058', 200, '', 2);
INSERT INTO "public"."xxl_job_log" VALUES (134, 17, 2, 'http://192.168.201.31:9999/', 'demoJobHandler', '', NULL, 0, '2022-06-09 17:53:00.006', 200, '任务触发类型：Cron触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://192.168.201.31:9999/]<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.201.31:9999/<br>code：200<br>msg：null', '2022-06-09 17:53:10.069', 200, '', 2);
INSERT INTO "public"."xxl_job_log" VALUES (105, 17, 2, NULL, 'demoJobHandler', '', NULL, 0, '2022-06-09 17:20:00.021', 500, '任务触发类型：Cron触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>', NULL, 0, NULL, 2);
INSERT INTO "public"."xxl_job_log" VALUES (101, 17, 2, NULL, 'demoJobHandler', '', NULL, 0, '2022-06-09 17:16:00.008', 500, '任务触发类型：Cron触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>', NULL, 0, NULL, 2);
INSERT INTO "public"."xxl_job_log" VALUES (102, 17, 2, NULL, 'demoJobHandler', '', NULL, 0, '2022-06-09 17:17:00.017', 500, '任务触发类型：Cron触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>', NULL, 0, NULL, 2);
INSERT INTO "public"."xxl_job_log" VALUES (103, 17, 2, NULL, 'demoJobHandler', '', NULL, 0, '2022-06-09 17:18:00.008', 500, '任务触发类型：Cron触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>', NULL, 0, NULL, 2);
INSERT INTO "public"."xxl_job_log" VALUES (123, 17, 2, 'http://192.168.201.31:9999/', 'demoJobHandler', '', NULL, 0, '2022-06-09 17:39:02.277', 200, '任务触发类型：Cron触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://192.168.201.31:9999/]<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.201.31:9999/<br>code：200<br>msg：null', '2022-06-09 17:39:14.646', 200, '', 2);
INSERT INTO "public"."xxl_job_log" VALUES (104, 17, 2, NULL, 'demoJobHandler', '', NULL, 0, '2022-06-09 17:19:00.029', 500, '任务触发类型：Cron触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>', NULL, 0, NULL, 2);
INSERT INTO "public"."xxl_job_log" VALUES (108, 17, 2, NULL, 'demoJobHandler', '', NULL, 0, '2022-06-09 17:24:00.015', 500, '任务触发类型：Cron触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>', NULL, 0, NULL, 2);
INSERT INTO "public"."xxl_job_log" VALUES (126, 17, 2, 'http://192.168.201.31:9999/', 'demoJobHandler', '', NULL, 0, '2022-06-09 17:42:11.005', 200, '任务触发类型：Cron触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://192.168.201.31:9999/]<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.201.31:9999/<br>code：200<br>msg：null', '2022-06-09 17:42:32.528', 200, '', 2);
INSERT INTO "public"."xxl_job_log" VALUES (109, 17, 2, NULL, 'demoJobHandler', '', NULL, 0, '2022-06-09 17:25:00.013', 500, '任务触发类型：Cron触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>', NULL, 0, NULL, 2);
INSERT INTO "public"."xxl_job_log" VALUES (135, 17, 2, 'http://192.168.201.31:9999/', 'demoJobHandler', '', NULL, 0, '2022-06-09 17:54:00.044', 200, '任务触发类型：Cron触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://192.168.201.31:9999/]<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.201.31:9999/<br>code：200<br>msg：null', '2022-06-09 17:54:10.103', 200, '', 2);
INSERT INTO "public"."xxl_job_log" VALUES (136, 17, 2, 'http://192.168.201.31:9999/', 'demoJobHandler', '', NULL, 0, '2022-06-09 17:55:00.038', 200, '任务触发类型：Cron触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://192.168.201.31:9999/]<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.201.31:9999/<br>code：200<br>msg：null', '2022-06-09 17:55:10.106', 200, '', 2);
INSERT INTO "public"."xxl_job_log" VALUES (137, 17, 2, 'http://192.168.201.31:9999/', 'demoJobHandler', '', NULL, 0, '2022-06-09 17:56:00.037', 200, '任务触发类型：Cron触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://192.168.201.31:9999/]<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.201.31:9999/<br>code：200<br>msg：null', '2022-06-09 17:56:10.108', 200, '', 2);
INSERT INTO "public"."xxl_job_log" VALUES (138, 17, 2, 'http://192.168.201.31:9999/', 'demoJobHandler', '', NULL, 0, '2022-06-09 17:57:00.006', 200, '任务触发类型：Cron触发<br>调度机器：192.168.201.31<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://192.168.201.31:9999/]<br>路由策略：最后一个<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.201.31:9999/<br>code：200<br>msg：null', '2022-06-09 17:57:10.066', 200, '', 2);

-- ----------------------------
-- Table structure for xxl_job_log_report
-- ----------------------------
DROP TABLE IF EXISTS "public"."xxl_job_log_report";
CREATE TABLE "public"."xxl_job_log_report" (
  "id" int8 NOT NULL DEFAULT nextval('xxl_job_log_report_id_seq'::regclass),
  "trigger_day" timestamp(6),
  "running_count" int8 NOT NULL DEFAULT 0,
  "suc_count" int8 NOT NULL DEFAULT 0,
  "fail_count" int8 NOT NULL DEFAULT 0,
  "update_time" timestamp(6)
)
;

-- ----------------------------
-- Records of xxl_job_log_report
-- ----------------------------
INSERT INTO "public"."xxl_job_log_report" VALUES (3, '2022-06-06 00:00:00', 0, 0, 0, NULL);
INSERT INTO "public"."xxl_job_log_report" VALUES (4, '2022-06-09 00:00:00', 0, 30, 75, NULL);
INSERT INTO "public"."xxl_job_log_report" VALUES (1, '2022-06-08 00:00:00', 0, 0, 0, NULL);
INSERT INTO "public"."xxl_job_log_report" VALUES (2, '2022-06-07 00:00:00', 0, 0, 0, NULL);

-- ----------------------------
-- Table structure for xxl_job_logglue
-- ----------------------------
DROP TABLE IF EXISTS "public"."xxl_job_logglue";
CREATE TABLE "public"."xxl_job_logglue" (
  "id" int8 NOT NULL DEFAULT nextval('xxl_job_logglue_id_seq'::regclass),
  "job_id" int8 NOT NULL,
  "glue_type" varchar(50) COLLATE "pg_catalog"."default",
  "glue_source" text COLLATE "pg_catalog"."default" NOT NULL,
  "glue_remark" varchar(255) COLLATE "pg_catalog"."default",
  "add_time" timestamp(6),
  "update_time" timestamp(6)
)
;

-- ----------------------------
-- Records of xxl_job_logglue
-- ----------------------------

-- ----------------------------
-- Table structure for xxl_job_registry
-- ----------------------------
DROP TABLE IF EXISTS "public"."xxl_job_registry";
CREATE TABLE "public"."xxl_job_registry" (
  "id" int8 NOT NULL DEFAULT nextval('xxl_job_registry_id_seq'::regclass),
  "registry_group" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "registry_key" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "registry_value" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "update_time" timestamp(6)
)
;

-- ----------------------------
-- Records of xxl_job_registry
-- ----------------------------
INSERT INTO "public"."xxl_job_registry" VALUES (142, 'EXECUTOR', 'things', 'http://192.168.201.31:9999/', '2022-06-09 18:02:15.643');

-- ----------------------------
-- Table structure for xxl_job_user
-- ----------------------------
DROP TABLE IF EXISTS "public"."xxl_job_user";
CREATE TABLE "public"."xxl_job_user" (
  "id" int8 NOT NULL DEFAULT nextval('xxl_job_user_id_seq'::regclass),
  "username" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "password" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "role" int4 NOT NULL,
  "permission" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of xxl_job_user
-- ----------------------------
INSERT INTO "public"."xxl_job_user" VALUES (1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', 1, NULL);

-- ----------------------------
-- Function structure for add_compression_policy
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."add_compression_policy"("hypertable" regclass, "compress_after" any, "if_not_exists" bool);
CREATE OR REPLACE FUNCTION "public"."add_compression_policy"("hypertable" regclass, "compress_after" any, "if_not_exists" bool=false)
  RETURNS "pg_catalog"."int4" AS '$libdir/timescaledb-2.6.1', 'ts_policy_compression_add'
  LANGUAGE c VOLATILE STRICT
  COST 1;

-- ----------------------------
-- Function structure for add_continuous_aggregate_policy
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."add_continuous_aggregate_policy"("continuous_aggregate" regclass, "start_offset" any, "end_offset" any, "schedule_interval" interval, "if_not_exists" bool);
CREATE OR REPLACE FUNCTION "public"."add_continuous_aggregate_policy"("continuous_aggregate" regclass, "start_offset" any, "end_offset" any, "schedule_interval" interval, "if_not_exists" bool=false)
  RETURNS "pg_catalog"."int4" AS '$libdir/timescaledb-2.6.1', 'ts_policy_refresh_cagg_add'
  LANGUAGE c VOLATILE
  COST 1;

-- ----------------------------
-- Function structure for add_data_node
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."add_data_node"("node_name" name, "host" text, "database" name, "port" int4, "if_not_exists" bool, "bootstrap" bool, "password" text);
CREATE OR REPLACE FUNCTION "public"."add_data_node"("node_name" name, "host" text, "database" name=NULL::name, "port" int4=NULL::integer, "if_not_exists" bool=false, "bootstrap" bool=true, "password" text=NULL::text)
  RETURNS TABLE("node_name" name, "host" text, "port" int4, "database" name, "node_created" bool, "database_created" bool, "extension_created" bool) AS '$libdir/timescaledb-2.6.1', 'ts_data_node_add'
  LANGUAGE c VOLATILE
  COST 1
  ROWS 1000;

-- ----------------------------
-- Function structure for add_dimension
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."add_dimension"("hypertable" regclass, "column_name" name, "number_partitions" int4, "chunk_time_interval" anyelement, "partitioning_func" regproc, "if_not_exists" bool);
CREATE OR REPLACE FUNCTION "public"."add_dimension"("hypertable" regclass, "column_name" name, "number_partitions" int4=NULL::integer, "chunk_time_interval" anyelement=NULL::bigint, "partitioning_func" regproc=NULL::regproc, "if_not_exists" bool=false)
  RETURNS TABLE("dimension_id" int4, "schema_name" name, "table_name" name, "column_name" name, "created" bool) AS '$libdir/timescaledb-2.6.1', 'ts_dimension_add'
  LANGUAGE c VOLATILE
  COST 1
  ROWS 1000;

-- ----------------------------
-- Function structure for add_job
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."add_job"("proc" regproc, "schedule_interval" interval, "config" jsonb, "initial_start" timestamptz, "scheduled" bool);
CREATE OR REPLACE FUNCTION "public"."add_job"("proc" regproc, "schedule_interval" interval, "config" jsonb=NULL::jsonb, "initial_start" timestamptz=NULL::timestamp with time zone, "scheduled" bool=true)
  RETURNS "pg_catalog"."int4" AS '$libdir/timescaledb-2.6.1', 'ts_job_add'
  LANGUAGE c VOLATILE
  COST 1;

-- ----------------------------
-- Function structure for add_reorder_policy
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."add_reorder_policy"("hypertable" regclass, "index_name" name, "if_not_exists" bool);
CREATE OR REPLACE FUNCTION "public"."add_reorder_policy"("hypertable" regclass, "index_name" name, "if_not_exists" bool=false)
  RETURNS "pg_catalog"."int4" AS '$libdir/timescaledb-2.6.1', 'ts_policy_reorder_add'
  LANGUAGE c VOLATILE STRICT
  COST 1;

-- ----------------------------
-- Function structure for add_retention_policy
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."add_retention_policy"("relation" regclass, "drop_after" any, "if_not_exists" bool);
CREATE OR REPLACE FUNCTION "public"."add_retention_policy"("relation" regclass, "drop_after" any, "if_not_exists" bool=false)
  RETURNS "pg_catalog"."int4" AS '$libdir/timescaledb-2.6.1', 'ts_policy_retention_add'
  LANGUAGE c VOLATILE STRICT
  COST 1;

-- ----------------------------
-- Function structure for alter_job
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."alter_job"("job_id" int4, "schedule_interval" interval, "max_runtime" interval, "max_retries" int4, "retry_period" interval, "scheduled" bool, "config" jsonb, "next_start" timestamptz, "if_exists" bool);
CREATE OR REPLACE FUNCTION "public"."alter_job"("job_id" int4, "schedule_interval" interval=NULL::interval, "max_runtime" interval=NULL::interval, "max_retries" int4=NULL::integer, "retry_period" interval=NULL::interval, "scheduled" bool=NULL::boolean, "config" jsonb=NULL::jsonb, "next_start" timestamptz=NULL::timestamp with time zone, "if_exists" bool=false)
  RETURNS TABLE("job_id" int4, "schedule_interval" interval, "max_runtime" interval, "max_retries" int4, "retry_period" interval, "scheduled" bool, "config" jsonb, "next_start" timestamptz) AS '$libdir/timescaledb-2.6.1', 'ts_job_alter'
  LANGUAGE c VOLATILE
  COST 1
  ROWS 1000;

-- ----------------------------
-- Function structure for approximate_row_count
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."approximate_row_count"("relation" regclass);
CREATE OR REPLACE FUNCTION "public"."approximate_row_count"("relation" regclass)
  RETURNS "pg_catalog"."int8" AS $BODY$
  WITH RECURSIVE inherited_id(oid) AS
  (
    SELECT relation
    UNION ALL
    SELECT i.inhrelid
    FROM pg_inherits i
    JOIN inherited_id b ON i.inhparent = b.oid
  )
  -- reltuples for partitioned tables is the sum of it's children in pg14 so we need to filter those out
  SELECT COALESCE((SUM(reltuples) FILTER (WHERE reltuples > 0 AND relkind <> 'p')), 0)::BIGINT
  FROM inherited_id
  JOIN pg_class USING (oid);
$BODY$
  LANGUAGE sql VOLATILE STRICT
  COST 100
  SET "search_path"="pg_catalog";

-- ----------------------------
-- Function structure for attach_data_node
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."attach_data_node"("node_name" name, "hypertable" regclass, "if_not_attached" bool, "repartition" bool);
CREATE OR REPLACE FUNCTION "public"."attach_data_node"("node_name" name, "hypertable" regclass, "if_not_attached" bool=false, "repartition" bool=true)
  RETURNS TABLE("hypertable_id" int4, "node_hypertable_id" int4, "node_name" name) AS '$libdir/timescaledb-2.6.1', 'ts_data_node_attach'
  LANGUAGE c VOLATILE
  COST 1
  ROWS 1000;

-- ----------------------------
-- Function structure for attach_tablespace
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."attach_tablespace"("tablespace" name, "hypertable" regclass, "if_not_attached" bool);
CREATE OR REPLACE FUNCTION "public"."attach_tablespace"("tablespace" name, "hypertable" regclass, "if_not_attached" bool=false)
  RETURNS "pg_catalog"."void" AS '$libdir/timescaledb-2.6.1', 'ts_tablespace_attach'
  LANGUAGE c VOLATILE
  COST 1;

-- ----------------------------
-- Function structure for chunk_compression_stats
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."chunk_compression_stats"("hypertable" regclass);
CREATE OR REPLACE FUNCTION "public"."chunk_compression_stats"("hypertable" regclass)
  RETURNS TABLE("chunk_schema" name, "chunk_name" name, "compression_status" text, "before_compression_table_bytes" int8, "before_compression_index_bytes" int8, "before_compression_toast_bytes" int8, "before_compression_total_bytes" int8, "after_compression_table_bytes" int8, "after_compression_index_bytes" int8, "after_compression_toast_bytes" int8, "after_compression_total_bytes" int8, "node_name" name) AS $BODY$
DECLARE
    table_name name;
    schema_name name;
    is_distributed bool;
BEGIN
    SELECT
        relname,
        nspname,
        replication_factor > 0
    INTO
	    table_name,
        schema_name,
        is_distributed
    FROM
        pg_class c
        INNER JOIN pg_namespace n ON (n.OID = c.relnamespace)
        INNER JOIN _timescaledb_catalog.hypertable ht ON (ht.schema_name = n.nspname
                AND ht.table_name = c.relname)
    WHERE
        c.OID = hypertable;

    IF table_name IS NULL THEN
	    RETURN;
	END IF;

    CASE WHEN is_distributed THEN
        RETURN QUERY
        SELECT
            *
        FROM
            _timescaledb_internal.compressed_chunk_remote_stats (schema_name, table_name);
    ELSE
        RETURN QUERY
        SELECT
            *,
            NULL::name
        FROM
            _timescaledb_internal.compressed_chunk_local_stats (schema_name, table_name);
    END CASE;
END;
$BODY$
  LANGUAGE plpgsql STABLE STRICT
  COST 100
  ROWS 1000
  SET "search_path"="pg_catalog";

-- ----------------------------
-- Function structure for chunks_detailed_size
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."chunks_detailed_size"("hypertable" regclass);
CREATE OR REPLACE FUNCTION "public"."chunks_detailed_size"("hypertable" regclass)
  RETURNS TABLE("chunk_schema" name, "chunk_name" name, "table_bytes" int8, "index_bytes" int8, "toast_bytes" int8, "total_bytes" int8, "node_name" name) AS $BODY$
DECLARE
        table_name       NAME;
        schema_name      NAME;
        is_distributed   BOOL;
BEGIN
        SELECT relname, nspname, replication_factor > 0
        INTO table_name, schema_name, is_distributed
        FROM pg_class c
        INNER JOIN pg_namespace n ON (n.OID = c.relnamespace)
        INNER JOIN _timescaledb_catalog.hypertable ht ON (ht.schema_name = n.nspname AND ht.table_name = c.relname)
        WHERE c.OID = hypertable;

		IF table_name IS NULL THEN
		    RETURN;
		END IF;

        CASE WHEN is_distributed THEN
            RETURN QUERY SELECT ch.chunk_schema, ch.chunk_name, ch.table_bytes, ch.index_bytes, 
                        ch.toast_bytes, ch.total_bytes, ch.node_name   
            FROM _timescaledb_internal.chunks_remote_size(schema_name, table_name) ch;
        ELSE
            RETURN QUERY SELECT chl.chunk_schema, chl.chunk_name, chl.table_bytes, chl.index_bytes, 
                        chl.toast_bytes, chl.total_bytes, NULL::NAME   
            FROM _timescaledb_internal.chunks_local_size(schema_name, table_name) chl;
        END CASE;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE STRICT
  COST 100
  ROWS 1000
  SET "search_path"="pg_catalog";

-- ----------------------------
-- Procedure structure for cleanup_edge_events_by_ttl
-- ----------------------------
DROP PROCEDURE IF EXISTS "public"."cleanup_edge_events_by_ttl"("ttl" int8, INOUT "deleted" int8);
CREATE OR REPLACE PROCEDURE "public"."cleanup_edge_events_by_ttl"(IN "ttl" int8, INOUT "deleted" int8)
 AS $BODY$
DECLARE
    ttl_ts bigint;
    ttl_deleted_count bigint DEFAULT 0;
BEGIN
    IF ttl > 0 THEN
        ttl_ts := (EXTRACT(EPOCH FROM current_timestamp) * 1000 - ttl::bigint * 1000)::bigint;
        EXECUTE format(
                'WITH deleted AS (DELETE FROM edge_event WHERE ts < %L::bigint RETURNING *) SELECT count(*) FROM deleted', ttl_ts) into ttl_deleted_count;
    END IF;
    RAISE NOTICE 'Edge events removed by ttl: %', ttl_deleted_count;
    deleted := ttl_deleted_count;
END
$BODY$
  LANGUAGE plpgsql;

-- ----------------------------
-- Procedure structure for cleanup_events_by_ttl
-- ----------------------------
DROP PROCEDURE IF EXISTS "public"."cleanup_events_by_ttl"("regular_events_start_ts" int8, "regular_events_end_ts" int8, "debug_events_start_ts" int8, "debug_events_end_ts" int8, INOUT "deleted" int8);
CREATE OR REPLACE PROCEDURE "public"."cleanup_events_by_ttl"(IN "regular_events_start_ts" int8, IN "regular_events_end_ts" int8, IN "debug_events_start_ts" int8, IN "debug_events_end_ts" int8, INOUT "deleted" int8)
 AS $BODY$
DECLARE
    ttl_deleted_count bigint DEFAULT 0;
    debug_ttl_deleted_count bigint DEFAULT 0;
BEGIN
    IF regular_events_start_ts > 0 AND regular_events_end_ts > 0 THEN
        EXECUTE format(
                'WITH deleted AS (DELETE FROM event WHERE id in (SELECT id from event WHERE ts > %L::bigint AND ts < %L::bigint AND ' ||
                '(event_type != %L::varchar AND event_type != %L::varchar)) RETURNING *) ' ||
                'SELECT count(*) FROM deleted', regular_events_start_ts, regular_events_end_ts,
                'DEBUG_RULE_NODE', 'DEBUG_RULE_CHAIN') into ttl_deleted_count;
    END IF;
    IF debug_events_start_ts > 0 AND debug_events_end_ts > 0 THEN
        EXECUTE format(
                'WITH deleted AS (DELETE FROM event WHERE id in (SELECT id from event WHERE ts > %L::bigint AND ts < %L::bigint AND ' ||
                '(event_type = %L::varchar OR event_type = %L::varchar)) RETURNING *) ' ||
                'SELECT count(*) FROM deleted', debug_events_start_ts, debug_events_end_ts,
                'DEBUG_RULE_NODE', 'DEBUG_RULE_CHAIN') into debug_ttl_deleted_count;
    END IF;
    RAISE NOTICE 'Events removed by ttl: %', ttl_deleted_count;
    RAISE NOTICE 'Debug Events removed by ttl: %', debug_ttl_deleted_count;
    deleted := ttl_deleted_count + debug_ttl_deleted_count;
END
$BODY$
  LANGUAGE plpgsql;

-- ----------------------------
-- Procedure structure for cleanup_timeseries_by_ttl
-- ----------------------------
DROP PROCEDURE IF EXISTS "public"."cleanup_timeseries_by_ttl"("null_uuid" uuid, "system_ttl" int8, INOUT "deleted" int8);
CREATE OR REPLACE PROCEDURE "public"."cleanup_timeseries_by_ttl"(IN "null_uuid" uuid, IN "system_ttl" int8, INOUT "deleted" int8)
 AS $BODY$
DECLARE
    tenant_cursor CURSOR FOR select tenant.id as tenant_id
                             from tenant;
    tenant_id_record     uuid;
    customer_id_record   uuid;
    tenant_ttl           bigint;
    customer_ttl         bigint;
    deleted_for_entities bigint;
    tenant_ttl_ts        bigint;
    customer_ttl_ts      bigint;
BEGIN
    OPEN tenant_cursor;
    FETCH tenant_cursor INTO tenant_id_record;
    WHILE FOUND
        LOOP
            EXECUTE format(
                    'select attribute_kv.long_v from attribute_kv where attribute_kv.entity_id = %L and attribute_kv.attribute_key = %L',
                    tenant_id_record, 'TTL') INTO tenant_ttl;
            if tenant_ttl IS NULL THEN
                tenant_ttl := system_ttl;
            END IF;
            IF tenant_ttl > 0 THEN
                tenant_ttl_ts := (EXTRACT(EPOCH FROM current_timestamp) * 1000 - tenant_ttl::bigint * 1000)::bigint;
                deleted_for_entities := delete_device_records_from_ts_kv(tenant_id_record, null_uuid, tenant_ttl_ts);
                deleted := deleted + deleted_for_entities;
                RAISE NOTICE '% telemetry removed for devices where tenant_id = %', deleted_for_entities, tenant_id_record;
                deleted_for_entities := delete_asset_records_from_ts_kv(tenant_id_record, null_uuid, tenant_ttl_ts);
                deleted := deleted + deleted_for_entities;
                RAISE NOTICE '% telemetry removed for assets where tenant_id = %', deleted_for_entities, tenant_id_record;
            END IF;
            FOR customer_id_record IN
                SELECT customer.id AS customer_id FROM customer WHERE customer.tenant_id = tenant_id_record
                LOOP
                    EXECUTE format(
                            'select attribute_kv.long_v from attribute_kv where attribute_kv.entity_id = %L and attribute_kv.attribute_key = %L',
                            customer_id_record, 'TTL') INTO customer_ttl;
                    IF customer_ttl IS NULL THEN
                        customer_ttl_ts := tenant_ttl_ts;
                    ELSE
                        IF customer_ttl > 0 THEN
                            customer_ttl_ts :=
                                    (EXTRACT(EPOCH FROM current_timestamp) * 1000 -
                                     customer_ttl::bigint * 1000)::bigint;
                        END IF;
                    END IF;
                    IF customer_ttl_ts IS NOT NULL AND customer_ttl_ts > 0 THEN
                        deleted_for_entities :=
                                delete_customer_records_from_ts_kv(tenant_id_record, customer_id_record,
                                                                   customer_ttl_ts);
                        deleted := deleted + deleted_for_entities;
                        RAISE NOTICE '% telemetry removed for customer with id = % where tenant_id = %', deleted_for_entities, customer_id_record, tenant_id_record;
                        deleted_for_entities :=
                                delete_device_records_from_ts_kv(tenant_id_record, customer_id_record,
                                                                 customer_ttl_ts);
                        deleted := deleted + deleted_for_entities;
                        RAISE NOTICE '% telemetry removed for devices where tenant_id = % and customer_id = %', deleted_for_entities, tenant_id_record, customer_id_record;
                        deleted_for_entities := delete_asset_records_from_ts_kv(tenant_id_record,
                                                                                customer_id_record,
                                                                                customer_ttl_ts);
                        deleted := deleted + deleted_for_entities;
                        RAISE NOTICE '% telemetry removed for assets where tenant_id = % and customer_id = %', deleted_for_entities, tenant_id_record, customer_id_record;
                    END IF;
                END LOOP;
            FETCH tenant_cursor INTO tenant_id_record;
        END LOOP;
END
$BODY$
  LANGUAGE plpgsql;

-- ----------------------------
-- Function structure for compress_chunk
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."compress_chunk"("uncompressed_chunk" regclass, "if_not_compressed" bool);
CREATE OR REPLACE FUNCTION "public"."compress_chunk"("uncompressed_chunk" regclass, "if_not_compressed" bool=false)
  RETURNS "pg_catalog"."regclass" AS '$libdir/timescaledb-2.6.1', 'ts_compress_chunk'
  LANGUAGE c VOLATILE STRICT
  COST 1;

-- ----------------------------
-- Function structure for create_distributed_hypertable
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."create_distributed_hypertable"("relation" regclass, "time_column_name" name, "partitioning_column" name, "number_partitions" int4, "associated_schema_name" name, "associated_table_prefix" name, "chunk_time_interval" anyelement, "create_default_indexes" bool, "if_not_exists" bool, "partitioning_func" regproc, "migrate_data" bool, "chunk_target_size" text, "chunk_sizing_func" regproc, "time_partitioning_func" regproc, "replication_factor" int4, "data_nodes" _name);
CREATE OR REPLACE FUNCTION "public"."create_distributed_hypertable"("relation" regclass, "time_column_name" name, "partitioning_column" name=NULL::name, "number_partitions" int4=NULL::integer, "associated_schema_name" name=NULL::name, "associated_table_prefix" name=NULL::name, "chunk_time_interval" anyelement=NULL::bigint, "create_default_indexes" bool=true, "if_not_exists" bool=false, "partitioning_func" regproc=NULL::regproc, "migrate_data" bool=false, "chunk_target_size" text=NULL::text, "chunk_sizing_func" regproc='_timescaledb_internal.calculate_chunk_interval'::regproc, "time_partitioning_func" regproc=NULL::regproc, "replication_factor" int4=1, "data_nodes" _name=NULL::name[])
  RETURNS TABLE("hypertable_id" int4, "schema_name" name, "table_name" name, "created" bool) AS '$libdir/timescaledb-2.6.1', 'ts_hypertable_distributed_create'
  LANGUAGE c VOLATILE
  COST 1
  ROWS 1000;

-- ----------------------------
-- Function structure for create_distributed_restore_point
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."create_distributed_restore_point"("name" text);
CREATE OR REPLACE FUNCTION "public"."create_distributed_restore_point"("name" text)
  RETURNS TABLE("node_name" name, "node_type" text, "restore_point" pg_lsn) AS '$libdir/timescaledb-2.6.1', 'ts_create_distributed_restore_point'
  LANGUAGE c VOLATILE STRICT
  COST 1
  ROWS 1000;

-- ----------------------------
-- Function structure for create_hypertable
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."create_hypertable"("relation" regclass, "time_column_name" name, "partitioning_column" name, "number_partitions" int4, "associated_schema_name" name, "associated_table_prefix" name, "chunk_time_interval" anyelement, "create_default_indexes" bool, "if_not_exists" bool, "partitioning_func" regproc, "migrate_data" bool, "chunk_target_size" text, "chunk_sizing_func" regproc, "time_partitioning_func" regproc, "replication_factor" int4, "data_nodes" _name);
CREATE OR REPLACE FUNCTION "public"."create_hypertable"("relation" regclass, "time_column_name" name, "partitioning_column" name=NULL::name, "number_partitions" int4=NULL::integer, "associated_schema_name" name=NULL::name, "associated_table_prefix" name=NULL::name, "chunk_time_interval" anyelement=NULL::bigint, "create_default_indexes" bool=true, "if_not_exists" bool=false, "partitioning_func" regproc=NULL::regproc, "migrate_data" bool=false, "chunk_target_size" text=NULL::text, "chunk_sizing_func" regproc='_timescaledb_internal.calculate_chunk_interval'::regproc, "time_partitioning_func" regproc=NULL::regproc, "replication_factor" int4=NULL::integer, "data_nodes" _name=NULL::name[])
  RETURNS TABLE("hypertable_id" int4, "schema_name" name, "table_name" name, "created" bool) AS '$libdir/timescaledb-2.6.1', 'ts_hypertable_create'
  LANGUAGE c VOLATILE
  COST 1
  ROWS 1000;

-- ----------------------------
-- Function structure for decompress_chunk
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."decompress_chunk"("uncompressed_chunk" regclass, "if_compressed" bool);
CREATE OR REPLACE FUNCTION "public"."decompress_chunk"("uncompressed_chunk" regclass, "if_compressed" bool=false)
  RETURNS "pg_catalog"."regclass" AS '$libdir/timescaledb-2.6.1', 'ts_decompress_chunk'
  LANGUAGE c VOLATILE STRICT
  COST 1;

-- ----------------------------
-- Function structure for delete_asset_records_from_ts_kv
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."delete_asset_records_from_ts_kv"("tenant_id" uuid, "customer_id" uuid, "ttl" int8, OUT "deleted" int8);
CREATE OR REPLACE FUNCTION "public"."delete_asset_records_from_ts_kv"(IN "tenant_id" uuid, IN "customer_id" uuid, IN "ttl" int8, OUT "deleted" int8)
  RETURNS "pg_catalog"."int8" AS $BODY$
BEGIN
    EXECUTE format(
            'WITH deleted AS (DELETE FROM ts_kv WHERE entity_id IN (SELECT asset.id as entity_id FROM asset WHERE tenant_id = %L and customer_id = %L) AND ts < %L::bigint RETURNING *) SELECT count(*) FROM deleted',
            tenant_id, customer_id, ttl) into deleted;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- ----------------------------
-- Function structure for delete_customer_records_from_ts_kv
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."delete_customer_records_from_ts_kv"("tenant_id" uuid, "customer_id" uuid, "ttl" int8, OUT "deleted" int8);
CREATE OR REPLACE FUNCTION "public"."delete_customer_records_from_ts_kv"(IN "tenant_id" uuid, IN "customer_id" uuid, IN "ttl" int8, OUT "deleted" int8)
  RETURNS "pg_catalog"."int8" AS $BODY$
BEGIN
    EXECUTE format(
            'WITH deleted AS (DELETE FROM ts_kv WHERE entity_id IN (SELECT customer.id as entity_id FROM customer WHERE tenant_id = %L and id = %L) AND ts < %L::bigint RETURNING *) SELECT count(*) FROM deleted',
            tenant_id, customer_id, ttl) into deleted;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- ----------------------------
-- Function structure for delete_data_node
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."delete_data_node"("node_name" name, "if_exists" bool, "force" bool, "repartition" bool, "drop_database" bool);
CREATE OR REPLACE FUNCTION "public"."delete_data_node"("node_name" name, "if_exists" bool=false, "force" bool=false, "repartition" bool=true, "drop_database" bool=false)
  RETURNS "pg_catalog"."bool" AS '$libdir/timescaledb-2.6.1', 'ts_data_node_delete'
  LANGUAGE c VOLATILE
  COST 1;

-- ----------------------------
-- Function structure for delete_device_records_from_ts_kv
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."delete_device_records_from_ts_kv"("tenant_id" uuid, "customer_id" uuid, "ttl" int8, OUT "deleted" int8);
CREATE OR REPLACE FUNCTION "public"."delete_device_records_from_ts_kv"(IN "tenant_id" uuid, IN "customer_id" uuid, IN "ttl" int8, OUT "deleted" int8)
  RETURNS "pg_catalog"."int8" AS $BODY$
BEGIN
    EXECUTE format(
            'WITH deleted AS (DELETE FROM ts_kv WHERE entity_id IN (SELECT device.id as entity_id FROM device WHERE tenant_id = %L and customer_id = %L) AND ts < %L::bigint RETURNING *) SELECT count(*) FROM deleted',
            tenant_id, customer_id, ttl) into deleted;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- ----------------------------
-- Function structure for delete_job
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."delete_job"("job_id" int4);
CREATE OR REPLACE FUNCTION "public"."delete_job"("job_id" int4)
  RETURNS "pg_catalog"."void" AS '$libdir/timescaledb-2.6.1', 'ts_job_delete'
  LANGUAGE c VOLATILE STRICT
  COST 1;

-- ----------------------------
-- Function structure for detach_data_node
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."detach_data_node"("node_name" name, "hypertable" regclass, "if_attached" bool, "force" bool, "repartition" bool);
CREATE OR REPLACE FUNCTION "public"."detach_data_node"("node_name" name, "hypertable" regclass=NULL::regclass, "if_attached" bool=false, "force" bool=false, "repartition" bool=true)
  RETURNS "pg_catalog"."int4" AS '$libdir/timescaledb-2.6.1', 'ts_data_node_detach'
  LANGUAGE c VOLATILE
  COST 1;

-- ----------------------------
-- Function structure for detach_tablespace
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."detach_tablespace"("tablespace" name, "hypertable" regclass, "if_attached" bool);
CREATE OR REPLACE FUNCTION "public"."detach_tablespace"("tablespace" name, "hypertable" regclass=NULL::regclass, "if_attached" bool=false)
  RETURNS "pg_catalog"."int4" AS '$libdir/timescaledb-2.6.1', 'ts_tablespace_detach'
  LANGUAGE c VOLATILE
  COST 1;

-- ----------------------------
-- Function structure for detach_tablespaces
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."detach_tablespaces"("hypertable" regclass);
CREATE OR REPLACE FUNCTION "public"."detach_tablespaces"("hypertable" regclass)
  RETURNS "pg_catalog"."int4" AS '$libdir/timescaledb-2.6.1', 'ts_tablespace_detach_all_from_hypertable'
  LANGUAGE c VOLATILE
  COST 1;

-- ----------------------------
-- Procedure structure for distributed_exec
-- ----------------------------
DROP PROCEDURE IF EXISTS "public"."distributed_exec"("query" text, "node_list" _name, "transactional" bool);
CREATE OR REPLACE PROCEDURE "public"."distributed_exec"("query" text, "node_list" _name=NULL::name[], "transactional" bool=true)
 AS '$libdir/timescaledb-2.6.1', 'ts_distributed_exec'
  LANGUAGE c;

-- ----------------------------
-- Function structure for drop_chunks
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."drop_chunks"("relation" regclass, "older_than" any, "newer_than" any, "verbose" bool);
CREATE OR REPLACE FUNCTION "public"."drop_chunks"("relation" regclass, "older_than" any=NULL::unknown, "newer_than" any=NULL::unknown, "verbose" bool=false)
  RETURNS SETOF "pg_catalog"."text" AS '$libdir/timescaledb-2.6.1', 'ts_chunk_drop_chunks'
  LANGUAGE c VOLATILE
  COST 1
  ROWS 1000;

-- ----------------------------
-- Procedure structure for drop_partitions_by_max_ttl
-- ----------------------------
DROP PROCEDURE IF EXISTS "public"."drop_partitions_by_max_ttl"("partition_type" varchar, "system_ttl" int8, INOUT "deleted" int8);
CREATE OR REPLACE PROCEDURE "public"."drop_partitions_by_max_ttl"(IN "partition_type" varchar, IN "system_ttl" int8, INOUT "deleted" int8)
 AS $BODY$
DECLARE
    max_tenant_ttl             bigint;
    max_customer_ttl           bigint;
    max_ttl                    bigint;
    date                       timestamp;
    partition_by_max_ttl_date  varchar;
    partition_by_max_ttl_month varchar;
    partition_by_max_ttl_day   varchar;
    partition_by_max_ttl_year  varchar;
    partition                  varchar;
    partition_year             integer;
    partition_month            integer;
    partition_day              integer;

BEGIN
    SELECT max(attribute_kv.long_v)
    FROM tenant
             INNER JOIN attribute_kv ON tenant.id = attribute_kv.entity_id
    WHERE attribute_kv.attribute_key = 'TTL'
    into max_tenant_ttl;
    SELECT max(attribute_kv.long_v)
    FROM customer
             INNER JOIN attribute_kv ON customer.id = attribute_kv.entity_id
    WHERE attribute_kv.attribute_key = 'TTL'
    into max_customer_ttl;
    max_ttl := GREATEST(system_ttl, max_customer_ttl, max_tenant_ttl);
    if max_ttl IS NOT NULL AND max_ttl > 0 THEN
        date := to_timestamp(EXTRACT(EPOCH FROM current_timestamp) - max_ttl);
        partition_by_max_ttl_date := get_partition_by_max_ttl_date(partition_type, date);
        RAISE NOTICE 'Date by max ttl: %', date;
        RAISE NOTICE 'Partition by max ttl: %', partition_by_max_ttl_date;
        IF partition_by_max_ttl_date IS NOT NULL THEN
            CASE
                WHEN partition_type = 'DAYS' THEN
                    partition_by_max_ttl_year := SPLIT_PART(partition_by_max_ttl_date, '_', 3);
                    partition_by_max_ttl_month := SPLIT_PART(partition_by_max_ttl_date, '_', 4);
                    partition_by_max_ttl_day := SPLIT_PART(partition_by_max_ttl_date, '_', 5);
                WHEN partition_type = 'MONTHS' THEN
                    partition_by_max_ttl_year := SPLIT_PART(partition_by_max_ttl_date, '_', 3);
                    partition_by_max_ttl_month := SPLIT_PART(partition_by_max_ttl_date, '_', 4);
                ELSE
                    partition_by_max_ttl_year := SPLIT_PART(partition_by_max_ttl_date, '_', 3);
                END CASE;
            IF partition_by_max_ttl_year IS NULL THEN
                RAISE NOTICE 'Failed to remove partitions by max ttl date due to partition_by_max_ttl_year is null!';
            ELSE
                IF partition_type = 'YEARS' THEN
                    FOR partition IN SELECT tablename
                                     FROM pg_tables
                                     WHERE schemaname = 'public'
                                       AND tablename like 'ts_kv_' || '%'
                                       AND tablename != 'ts_kv_latest'
                                       AND tablename != 'ts_kv_dictionary'
                                       AND tablename != 'ts_kv_indefinite'
                                       AND tablename != partition_by_max_ttl_date
                        LOOP
                            partition_year := SPLIT_PART(partition, '_', 3)::integer;
                            IF partition_year < partition_by_max_ttl_year::integer THEN
                                RAISE NOTICE 'Partition to delete by max ttl: %', partition;
                                EXECUTE format('DROP TABLE IF EXISTS %I', partition);
                                deleted := deleted + 1;
                            END IF;
                        END LOOP;
                ELSE
                    IF partition_type = 'MONTHS' THEN
                        IF partition_by_max_ttl_month IS NULL THEN
                            RAISE NOTICE 'Failed to remove months partitions by max ttl date due to partition_by_max_ttl_month is null!';
                        ELSE
                            FOR partition IN SELECT tablename
                                             FROM pg_tables
                                             WHERE schemaname = 'public'
                                               AND tablename like 'ts_kv_' || '%'
                                               AND tablename != 'ts_kv_latest'
                                               AND tablename != 'ts_kv_dictionary'
                                               AND tablename != 'ts_kv_indefinite'
                                               AND tablename != partition_by_max_ttl_date
                                LOOP
                                    partition_year := SPLIT_PART(partition, '_', 3)::integer;
                                    IF partition_year > partition_by_max_ttl_year::integer THEN
                                        RAISE NOTICE 'Skip iteration! Partition: % is valid!', partition;
                                        CONTINUE;
                                    ELSE
                                        IF partition_year < partition_by_max_ttl_year::integer THEN
                                            RAISE NOTICE 'Partition to delete by max ttl: %', partition;
                                            EXECUTE format('DROP TABLE IF EXISTS %I', partition);
                                            deleted := deleted + 1;
                                        ELSE
                                            partition_month := SPLIT_PART(partition, '_', 4)::integer;
                                            IF partition_year = partition_by_max_ttl_year::integer THEN
                                               IF  partition_month >= partition_by_max_ttl_month::integer THEN
                                                   RAISE NOTICE 'Skip iteration! Partition: % is valid!', partition;
                                                   CONTINUE;
                                               ELSE
                                                   RAISE NOTICE 'Partition to delete by max ttl: %', partition;
                                                   EXECUTE format('DROP TABLE IF EXISTS %I', partition);
                                                   deleted := deleted + 1;
                                               END IF;
                                            END IF;
                                        END IF;
                                    END IF;
                                END LOOP;
                        END IF;
                    ELSE
                        IF partition_type = 'DAYS' THEN
                            IF partition_by_max_ttl_month IS NULL THEN
                                RAISE NOTICE 'Failed to remove days partitions by max ttl date due to partition_by_max_ttl_month is null!';
                            ELSE
                                IF partition_by_max_ttl_day IS NULL THEN
                                    RAISE NOTICE 'Failed to remove days partitions by max ttl date due to partition_by_max_ttl_day is null!';
                                ELSE
                                    FOR partition IN SELECT tablename
                                                     FROM pg_tables
                                                     WHERE schemaname = 'public'
                                                       AND tablename like 'ts_kv_' || '%'
                                                       AND tablename != 'ts_kv_latest'
                                                       AND tablename != 'ts_kv_dictionary'
                                                       AND tablename != 'ts_kv_indefinite'
                                                       AND tablename != partition_by_max_ttl_date
                                        LOOP
                                            partition_year := SPLIT_PART(partition, '_', 3)::integer;
                                            IF partition_year > partition_by_max_ttl_year::integer THEN
                                                RAISE NOTICE 'Skip iteration! Partition: % is valid!', partition;
                                                CONTINUE;
                                            ELSE
                                                IF partition_year < partition_by_max_ttl_year::integer THEN
                                                    RAISE NOTICE 'Partition to delete by max ttl: %', partition;
                                                    EXECUTE format('DROP TABLE IF EXISTS %I', partition);
                                                    deleted := deleted + 1;
                                                ELSE
                                                    partition_month := SPLIT_PART(partition, '_', 4)::integer;
                                                    IF partition_month > partition_by_max_ttl_month::integer THEN
                                                        RAISE NOTICE 'Skip iteration! Partition: % is valid!', partition;
                                                        CONTINUE;
                                                    ELSE
                                                        IF partition_month < partition_by_max_ttl_month::integer THEN
                                                            RAISE NOTICE 'Partition to delete by max ttl: %', partition;
                                                            EXECUTE format('DROP TABLE IF EXISTS %I', partition);
                                                            deleted := deleted + 1;
                                                        ELSE
                                                            partition_day := SPLIT_PART(partition, '_', 5)::integer;
                                                            IF partition_day >= partition_by_max_ttl_day::integer THEN
                                                                RAISE NOTICE 'Skip iteration! Partition: % is valid!', partition;
                                                                CONTINUE;
                                                            ELSE
                                                                IF partition_day < partition_by_max_ttl_day::integer THEN
                                                                    RAISE NOTICE 'Partition to delete by max ttl: %', partition;
                                                                    EXECUTE format('DROP TABLE IF EXISTS %I', partition);
                                                                    deleted := deleted + 1;
                                                                END IF;
                                                            END IF;
                                                        END IF;
                                                    END IF;
                                                END IF;
                                            END IF;
                                        END LOOP;
                                END IF;
                            END IF;
                        END IF;
                    END IF;
                END IF;
            END IF;
        END IF;
    END IF;
END
$BODY$
  LANGUAGE plpgsql;

-- ----------------------------
-- Function structure for get_partition_by_max_ttl_date
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."get_partition_by_max_ttl_date"("partition_type" varchar, "date" timestamp, OUT "partition" varchar);
CREATE OR REPLACE FUNCTION "public"."get_partition_by_max_ttl_date"(IN "partition_type" varchar, IN "date" timestamp, OUT "partition" varchar)
  RETURNS "pg_catalog"."varchar" AS $BODY$
BEGIN
    CASE
        WHEN partition_type = 'DAYS' THEN
            partition := 'ts_kv_' || to_char(date, 'yyyy') || '_' || to_char(date, 'MM') || '_' || to_char(date, 'dd');
        WHEN partition_type = 'MONTHS' THEN
            partition := 'ts_kv_' || to_char(date, 'yyyy') || '_' || to_char(date, 'MM');
        WHEN partition_type = 'YEARS' THEN
            partition := 'ts_kv_' || to_char(date, 'yyyy');
        ELSE
            partition := NULL;
        END CASE;
    IF partition IS NOT NULL THEN
        IF NOT EXISTS(SELECT
                      FROM pg_tables
                      WHERE schemaname = 'public'
                        AND tablename = partition) THEN
            partition := NULL;
            RAISE NOTICE 'Failed to found partition by ttl';
        END IF;
    END IF;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- ----------------------------
-- Function structure for get_telemetry_report
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."get_telemetry_report"();
CREATE OR REPLACE FUNCTION "public"."get_telemetry_report"()
  RETURNS "pg_catalog"."jsonb" AS '$libdir/timescaledb-2.6.1', 'ts_telemetry_get_report_jsonb'
  LANGUAGE c STABLE
  COST 1;

-- ----------------------------
-- Function structure for hypertable_compression_stats
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."hypertable_compression_stats"("hypertable" regclass);
CREATE OR REPLACE FUNCTION "public"."hypertable_compression_stats"("hypertable" regclass)
  RETURNS TABLE("total_chunks" int8, "number_compressed_chunks" int8, "before_compression_table_bytes" int8, "before_compression_index_bytes" int8, "before_compression_toast_bytes" int8, "before_compression_total_bytes" int8, "after_compression_table_bytes" int8, "after_compression_index_bytes" int8, "after_compression_toast_bytes" int8, "after_compression_total_bytes" int8, "node_name" name) AS $BODY$
	SELECT
        count(*)::bigint AS total_chunks,
        (count(*) FILTER (WHERE ch.compression_status = 'Compressed'))::bigint AS number_compressed_chunks,
        sum(ch.before_compression_table_bytes)::bigint AS before_compression_table_bytes,
        sum(ch.before_compression_index_bytes)::bigint AS before_compression_index_bytes,
        sum(ch.before_compression_toast_bytes)::bigint AS before_compression_toast_bytes,
        sum(ch.before_compression_total_bytes)::bigint AS before_compression_total_bytes,
        sum(ch.after_compression_table_bytes)::bigint AS after_compression_table_bytes,
        sum(ch.after_compression_index_bytes)::bigint AS after_compression_index_bytes,
        sum(ch.after_compression_toast_bytes)::bigint AS after_compression_toast_bytes,
        sum(ch.after_compression_total_bytes)::bigint AS after_compression_total_bytes,
        ch.node_name
    FROM
	    public.chunk_compression_stats(hypertable) ch
    GROUP BY
        ch.node_name;
$BODY$
  LANGUAGE sql STABLE STRICT
  COST 100
  ROWS 1000
  SET "search_path"="pg_catalog";

-- ----------------------------
-- Function structure for hypertable_detailed_size
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."hypertable_detailed_size"("hypertable" regclass);
CREATE OR REPLACE FUNCTION "public"."hypertable_detailed_size"("hypertable" regclass)
  RETURNS TABLE("table_bytes" int8, "index_bytes" int8, "toast_bytes" int8, "total_bytes" int8, "node_name" name) AS $BODY$
DECLARE
        table_name       NAME = NULL;
        schema_name      NAME = NULL;
        is_distributed   BOOL = FALSE;
BEGIN
        SELECT relname, nspname, replication_factor > 0
        INTO table_name, schema_name, is_distributed
        FROM pg_class c
        INNER JOIN pg_namespace n ON (n.OID = c.relnamespace)
        INNER JOIN _timescaledb_catalog.hypertable ht ON (ht.schema_name = n.nspname AND ht.table_name = c.relname)
        WHERE c.OID = hypertable;

		IF table_name IS NULL THEN
		    RETURN;
		END IF;

        CASE WHEN is_distributed THEN
			RETURN QUERY
			SELECT *, NULL::name
			FROM _timescaledb_internal.hypertable_local_size(schema_name, table_name)
			UNION
			SELECT *
			FROM _timescaledb_internal.hypertable_remote_size(schema_name, table_name);
        ELSE
			RETURN QUERY
			SELECT *, NULL::name
			FROM _timescaledb_internal.hypertable_local_size(schema_name, table_name);
        END CASE;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE STRICT
  COST 100
  ROWS 1000
  SET "search_path"="pg_catalog";

-- ----------------------------
-- Function structure for hypertable_index_size
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."hypertable_index_size"("index_name" regclass);
CREATE OR REPLACE FUNCTION "public"."hypertable_index_size"("index_name" regclass)
  RETURNS "pg_catalog"."int8" AS $BODY$
DECLARE
        ht_index_name       NAME;
        ht_schema_name      NAME;
        ht_name      NAME;
        is_distributed   BOOL;
        ht_id INTEGER;
        index_bytes BIGINT;
BEGIN
   SELECT c.relname, cl.relname, nsp.nspname, ht.replication_factor > 0
   INTO ht_index_name, ht_name, ht_schema_name, is_distributed
   FROM pg_class c, pg_index cind, pg_class cl,
        pg_namespace nsp, _timescaledb_catalog.hypertable ht
   WHERE c.oid = cind.indexrelid AND cind.indrelid = cl.oid
         AND cl.relnamespace = nsp.oid AND c.oid = index_name
		 AND ht.schema_name = nsp.nspname ANd ht.table_name = cl.relname;

   IF ht_index_name IS NULL THEN
       RETURN NULL;
   END IF;

   -- get the local size or size of access node indexes
   SELECT il.total_bytes
   INTO index_bytes
   FROM _timescaledb_internal.indexes_local_size(ht_schema_name, ht_index_name) il;

   IF index_bytes IS NULL THEN
       index_bytes = 0;
   END IF;

   -- Add size from data nodes
   IF is_distributed THEN
       index_bytes = index_bytes + _timescaledb_internal.indexes_remote_size(ht_schema_name, ht_name, ht_index_name);
   END IF;

   RETURN index_bytes;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE STRICT
  COST 100
  SET "search_path"="pg_catalog";

-- ----------------------------
-- Function structure for hypertable_size
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."hypertable_size"("hypertable" regclass);
CREATE OR REPLACE FUNCTION "public"."hypertable_size"("hypertable" regclass)
  RETURNS "pg_catalog"."int8" AS $BODY$
   -- One row per data node is returned (in case of a distributed
   -- hypertable), so sum them up:
   SELECT sum(total_bytes)::bigint
   FROM public.hypertable_detailed_size(hypertable);
$BODY$
  LANGUAGE sql VOLATILE STRICT
  COST 100
  SET "search_path"="pg_catalog";

-- ----------------------------
-- Procedure structure for insert_tb_schema_settings
-- ----------------------------
DROP PROCEDURE IF EXISTS "public"."insert_tb_schema_settings"();
CREATE OR REPLACE PROCEDURE "public"."insert_tb_schema_settings"()
 AS $BODY$
BEGIN
    IF (SELECT COUNT(*) FROM tb_schema_settings) = 0 THEN
        INSERT INTO tb_schema_settings (schema_version) VALUES (3003000);
    END IF;
END;
$BODY$
  LANGUAGE plpgsql;

-- ----------------------------
-- Function structure for interpolate
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."interpolate"("value" float8, "prev" record, "next" record);
CREATE OR REPLACE FUNCTION "public"."interpolate"("value" float8, "prev" record=NULL::record, "next" record=NULL::record)
  RETURNS "pg_catalog"."float8" AS '$libdir/timescaledb-2.6.1', 'ts_gapfill_marker'
  LANGUAGE c VOLATILE
  COST 1;

-- ----------------------------
-- Function structure for interpolate
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."interpolate"("value" int4, "prev" record, "next" record);
CREATE OR REPLACE FUNCTION "public"."interpolate"("value" int4, "prev" record=NULL::record, "next" record=NULL::record)
  RETURNS "pg_catalog"."int4" AS '$libdir/timescaledb-2.6.1', 'ts_gapfill_marker'
  LANGUAGE c VOLATILE
  COST 1;

-- ----------------------------
-- Function structure for interpolate
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."interpolate"("value" int2, "prev" record, "next" record);
CREATE OR REPLACE FUNCTION "public"."interpolate"("value" int2, "prev" record=NULL::record, "next" record=NULL::record)
  RETURNS "pg_catalog"."int2" AS '$libdir/timescaledb-2.6.1', 'ts_gapfill_marker'
  LANGUAGE c VOLATILE
  COST 1;

-- ----------------------------
-- Function structure for interpolate
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."interpolate"("value" float4, "prev" record, "next" record);
CREATE OR REPLACE FUNCTION "public"."interpolate"("value" float4, "prev" record=NULL::record, "next" record=NULL::record)
  RETURNS "pg_catalog"."float4" AS '$libdir/timescaledb-2.6.1', 'ts_gapfill_marker'
  LANGUAGE c VOLATILE
  COST 1;

-- ----------------------------
-- Function structure for interpolate
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."interpolate"("value" int8, "prev" record, "next" record);
CREATE OR REPLACE FUNCTION "public"."interpolate"("value" int8, "prev" record=NULL::record, "next" record=NULL::record)
  RETURNS "pg_catalog"."int8" AS '$libdir/timescaledb-2.6.1', 'ts_gapfill_marker'
  LANGUAGE c VOLATILE
  COST 1;

-- ----------------------------
-- Function structure for locf
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."locf"("value" anyelement, "prev" anyelement, "treat_null_as_missing" bool);
CREATE OR REPLACE FUNCTION "public"."locf"("value" anyelement, "prev" anyelement=NULL::unknown, "treat_null_as_missing" bool=false)
  RETURNS "pg_catalog"."anyelement" AS '$libdir/timescaledb-2.6.1', 'ts_gapfill_marker'
  LANGUAGE c VOLATILE
  COST 1;

-- ----------------------------
-- Function structure for move_chunk
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."move_chunk"("chunk" regclass, "destination_tablespace" name, "index_destination_tablespace" name, "reorder_index" regclass, "verbose" bool);
CREATE OR REPLACE FUNCTION "public"."move_chunk"("chunk" regclass, "destination_tablespace" name, "index_destination_tablespace" name=NULL::name, "reorder_index" regclass=NULL::regclass, "verbose" bool=false)
  RETURNS "pg_catalog"."void" AS '$libdir/timescaledb-2.6.1', 'ts_move_chunk'
  LANGUAGE c VOLATILE
  COST 1;

-- ----------------------------
-- Procedure structure for recompress_chunk
-- ----------------------------
DROP PROCEDURE IF EXISTS "public"."recompress_chunk"("chunk" regclass, "if_not_compressed" bool);
CREATE OR REPLACE PROCEDURE "public"."recompress_chunk"("chunk" regclass, "if_not_compressed" bool=false)
 AS $BODY$
DECLARE
  status INT;
  chunk_name TEXT[];
BEGIN

    -- procedures with SET clause cannot execute transaction
    -- control so we adjust search_path in procedure body
    SET LOCAL search_path TO pg_catalog;

    status := _timescaledb_internal.chunk_status(chunk);

    -- Chunk names are in the internal catalog, but we only care about
    -- the chunk name here.
    chunk_name := parse_ident(chunk::text);
    CASE status
    WHEN 0 THEN
        RAISE EXCEPTION 'call compress_chunk instead of recompress_chunk';
    WHEN 1 THEN
        IF if_not_compressed THEN
            RAISE NOTICE 'nothing to recompress in chunk "%"', chunk_name[array_upper(chunk_name,1)];
            RETURN;
        ELSE
            RAISE EXCEPTION 'nothing to recompress in chunk "%"', chunk_name[array_upper(chunk_name,1)];
        END IF;
    WHEN 3 THEN
        PERFORM public.decompress_chunk(chunk);
        COMMIT;
        -- SET LOCAL is only active until end of transaction.
        -- While we could use SET at the start of the function we do not
        -- want to bleed out search_path to caller, so we do SET LOCAL
        -- again after COMMIT
        SET LOCAL search_path TO pg_catalog;
    END CASE;
    PERFORM public.compress_chunk(chunk, if_not_compressed);
END
$BODY$
  LANGUAGE plpgsql;

-- ----------------------------
-- Procedure structure for refresh_continuous_aggregate
-- ----------------------------
DROP PROCEDURE IF EXISTS "public"."refresh_continuous_aggregate"("continuous_aggregate" regclass, "window_start" any, "window_end" any);
CREATE OR REPLACE PROCEDURE "public"."refresh_continuous_aggregate"("continuous_aggregate" regclass, "window_start" any, "window_end" any)
 AS '$libdir/timescaledb-2.6.1', 'ts_continuous_agg_refresh'
  LANGUAGE c;

-- ----------------------------
-- Function structure for remove_compression_policy
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."remove_compression_policy"("hypertable" regclass, "if_exists" bool);
CREATE OR REPLACE FUNCTION "public"."remove_compression_policy"("hypertable" regclass, "if_exists" bool=false)
  RETURNS "pg_catalog"."bool" AS '$libdir/timescaledb-2.6.1', 'ts_policy_compression_remove'
  LANGUAGE c VOLATILE STRICT
  COST 1;

-- ----------------------------
-- Function structure for remove_continuous_aggregate_policy
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."remove_continuous_aggregate_policy"("continuous_aggregate" regclass, "if_not_exists" bool);
CREATE OR REPLACE FUNCTION "public"."remove_continuous_aggregate_policy"("continuous_aggregate" regclass, "if_not_exists" bool=false)
  RETURNS "pg_catalog"."void" AS '$libdir/timescaledb-2.6.1', 'ts_policy_refresh_cagg_remove'
  LANGUAGE c VOLATILE STRICT
  COST 1;

-- ----------------------------
-- Function structure for remove_reorder_policy
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."remove_reorder_policy"("hypertable" regclass, "if_exists" bool);
CREATE OR REPLACE FUNCTION "public"."remove_reorder_policy"("hypertable" regclass, "if_exists" bool=false)
  RETURNS "pg_catalog"."void" AS '$libdir/timescaledb-2.6.1', 'ts_policy_reorder_remove'
  LANGUAGE c VOLATILE STRICT
  COST 1;

-- ----------------------------
-- Function structure for remove_retention_policy
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."remove_retention_policy"("relation" regclass, "if_exists" bool);
CREATE OR REPLACE FUNCTION "public"."remove_retention_policy"("relation" regclass, "if_exists" bool=false)
  RETURNS "pg_catalog"."void" AS '$libdir/timescaledb-2.6.1', 'ts_policy_retention_remove'
  LANGUAGE c VOLATILE STRICT
  COST 1;

-- ----------------------------
-- Function structure for reorder_chunk
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."reorder_chunk"("chunk" regclass, "index" regclass, "verbose" bool);
CREATE OR REPLACE FUNCTION "public"."reorder_chunk"("chunk" regclass, "index" regclass=NULL::regclass, "verbose" bool=false)
  RETURNS "pg_catalog"."void" AS '$libdir/timescaledb-2.6.1', 'ts_reorder_chunk'
  LANGUAGE c VOLATILE
  COST 1;

-- ----------------------------
-- Procedure structure for run_job
-- ----------------------------
DROP PROCEDURE IF EXISTS "public"."run_job"("job_id" int4);
CREATE OR REPLACE PROCEDURE "public"."run_job"("job_id" int4)
 AS '$libdir/timescaledb-2.6.1', 'ts_job_run'
  LANGUAGE c;

-- ----------------------------
-- Function structure for set_adaptive_chunking
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."set_adaptive_chunking"("hypertable" regclass, "chunk_target_size" text, INOUT "chunk_sizing_func" regproc, OUT "chunk_target_size" int8);
CREATE OR REPLACE FUNCTION "public"."set_adaptive_chunking"(IN "hypertable" regclass, IN "chunk_target_size" text, INOUT "chunk_sizing_func" regproc='_timescaledb_internal.calculate_chunk_interval'::regproc, OUT "chunk_target_size" int8)
  RETURNS "pg_catalog"."record" AS '$libdir/timescaledb-2.6.1', 'ts_chunk_adaptive_set'
  LANGUAGE c VOLATILE
  COST 1;

-- ----------------------------
-- Function structure for set_chunk_time_interval
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."set_chunk_time_interval"("hypertable" regclass, "chunk_time_interval" anyelement, "dimension_name" name);
CREATE OR REPLACE FUNCTION "public"."set_chunk_time_interval"("hypertable" regclass, "chunk_time_interval" anyelement, "dimension_name" name=NULL::name)
  RETURNS "pg_catalog"."void" AS '$libdir/timescaledb-2.6.1', 'ts_dimension_set_interval'
  LANGUAGE c VOLATILE
  COST 1;

-- ----------------------------
-- Function structure for set_integer_now_func
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."set_integer_now_func"("hypertable" regclass, "integer_now_func" regproc, "replace_if_exists" bool);
CREATE OR REPLACE FUNCTION "public"."set_integer_now_func"("hypertable" regclass, "integer_now_func" regproc, "replace_if_exists" bool=false)
  RETURNS "pg_catalog"."void" AS '$libdir/timescaledb-2.6.1', 'ts_hypertable_set_integer_now_func'
  LANGUAGE c VOLATILE STRICT
  COST 1;

-- ----------------------------
-- Function structure for set_number_partitions
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."set_number_partitions"("hypertable" regclass, "number_partitions" int4, "dimension_name" name);
CREATE OR REPLACE FUNCTION "public"."set_number_partitions"("hypertable" regclass, "number_partitions" int4, "dimension_name" name=NULL::name)
  RETURNS "pg_catalog"."void" AS '$libdir/timescaledb-2.6.1', 'ts_dimension_set_num_slices'
  LANGUAGE c VOLATILE
  COST 1;

-- ----------------------------
-- Function structure for set_replication_factor
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."set_replication_factor"("hypertable" regclass, "replication_factor" int4);
CREATE OR REPLACE FUNCTION "public"."set_replication_factor"("hypertable" regclass, "replication_factor" int4)
  RETURNS "pg_catalog"."void" AS '$libdir/timescaledb-2.6.1', 'ts_hypertable_distributed_set_replication_factor'
  LANGUAGE c VOLATILE
  COST 1;

-- ----------------------------
-- Function structure for show_chunks
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."show_chunks"("relation" regclass, "older_than" any, "newer_than" any);
CREATE OR REPLACE FUNCTION "public"."show_chunks"("relation" regclass, "older_than" any=NULL::unknown, "newer_than" any=NULL::unknown)
  RETURNS SETOF "pg_catalog"."regclass" AS '$libdir/timescaledb-2.6.1', 'ts_chunk_show_chunks'
  LANGUAGE c STABLE
  COST 1
  ROWS 1000;

-- ----------------------------
-- Function structure for show_tablespaces
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."show_tablespaces"("hypertable" regclass);
CREATE OR REPLACE FUNCTION "public"."show_tablespaces"("hypertable" regclass)
  RETURNS SETOF "pg_catalog"."name" AS '$libdir/timescaledb-2.6.1', 'ts_tablespace_show'
  LANGUAGE c VOLATILE STRICT
  COST 1
  ROWS 1000;

-- ----------------------------
-- Function structure for time_bucket
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."time_bucket"("bucket_width" interval, "ts" date);
CREATE OR REPLACE FUNCTION "public"."time_bucket"("bucket_width" interval, "ts" date)
  RETURNS "pg_catalog"."date" AS '$libdir/timescaledb-2.6.1', 'ts_date_bucket'
  LANGUAGE c IMMUTABLE STRICT
  COST 1;

-- ----------------------------
-- Function structure for time_bucket
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."time_bucket"("bucket_width" interval, "ts" timestamp, "offset" interval);
CREATE OR REPLACE FUNCTION "public"."time_bucket"("bucket_width" interval, "ts" timestamp, "offset" interval)
  RETURNS "pg_catalog"."timestamp" AS $BODY$
    SELECT public.time_bucket(bucket_width, ts OPERATOR(pg_catalog.-) "offset") OPERATOR(pg_catalog.+) "offset";
$BODY$
  LANGUAGE sql IMMUTABLE STRICT
  COST 100;

-- ----------------------------
-- Function structure for time_bucket
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."time_bucket"("bucket_width" interval, "ts" timestamptz, "offset" interval);
CREATE OR REPLACE FUNCTION "public"."time_bucket"("bucket_width" interval, "ts" timestamptz, "offset" interval)
  RETURNS "pg_catalog"."timestamptz" AS $BODY$
    SELECT public.time_bucket(bucket_width, ts OPERATOR(pg_catalog.-) "offset") OPERATOR(pg_catalog.+) "offset";
$BODY$
  LANGUAGE sql IMMUTABLE STRICT
  COST 100;

-- ----------------------------
-- Function structure for time_bucket
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."time_bucket"("bucket_width" interval, "ts" date, "offset" interval);
CREATE OR REPLACE FUNCTION "public"."time_bucket"("bucket_width" interval, "ts" date, "offset" interval)
  RETURNS "pg_catalog"."date" AS $BODY$
    SELECT (public.time_bucket(bucket_width, ts OPERATOR(pg_catalog.-) "offset") OPERATOR(pg_catalog.+) "offset")::date;
$BODY$
  LANGUAGE sql IMMUTABLE STRICT
  COST 100;

-- ----------------------------
-- Function structure for time_bucket
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."time_bucket"("bucket_width" int4, "ts" int4, "offset" int4);
CREATE OR REPLACE FUNCTION "public"."time_bucket"("bucket_width" int4, "ts" int4, "offset" int4)
  RETURNS "pg_catalog"."int4" AS '$libdir/timescaledb-2.6.1', 'ts_int32_bucket'
  LANGUAGE c IMMUTABLE STRICT
  COST 1;

-- ----------------------------
-- Function structure for time_bucket
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."time_bucket"("bucket_width" int2, "ts" int2, "offset" int2);
CREATE OR REPLACE FUNCTION "public"."time_bucket"("bucket_width" int2, "ts" int2, "offset" int2)
  RETURNS "pg_catalog"."int2" AS '$libdir/timescaledb-2.6.1', 'ts_int16_bucket'
  LANGUAGE c IMMUTABLE STRICT
  COST 1;

-- ----------------------------
-- Function structure for time_bucket
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."time_bucket"("bucket_width" int8, "ts" int8);
CREATE OR REPLACE FUNCTION "public"."time_bucket"("bucket_width" int8, "ts" int8)
  RETURNS "pg_catalog"."int8" AS '$libdir/timescaledb-2.6.1', 'ts_int64_bucket'
  LANGUAGE c IMMUTABLE STRICT
  COST 1;

-- ----------------------------
-- Function structure for time_bucket
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."time_bucket"("bucket_width" int4, "ts" int4);
CREATE OR REPLACE FUNCTION "public"."time_bucket"("bucket_width" int4, "ts" int4)
  RETURNS "pg_catalog"."int4" AS '$libdir/timescaledb-2.6.1', 'ts_int32_bucket'
  LANGUAGE c IMMUTABLE STRICT
  COST 1;

-- ----------------------------
-- Function structure for time_bucket
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."time_bucket"("bucket_width" int2, "ts" int2);
CREATE OR REPLACE FUNCTION "public"."time_bucket"("bucket_width" int2, "ts" int2)
  RETURNS "pg_catalog"."int2" AS '$libdir/timescaledb-2.6.1', 'ts_int16_bucket'
  LANGUAGE c IMMUTABLE STRICT
  COST 1;

-- ----------------------------
-- Function structure for time_bucket
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."time_bucket"("bucket_width" interval, "ts" date, "origin" date);
CREATE OR REPLACE FUNCTION "public"."time_bucket"("bucket_width" interval, "ts" date, "origin" date)
  RETURNS "pg_catalog"."date" AS '$libdir/timescaledb-2.6.1', 'ts_date_bucket'
  LANGUAGE c IMMUTABLE STRICT
  COST 1;

-- ----------------------------
-- Function structure for time_bucket
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."time_bucket"("bucket_width" interval, "ts" timestamptz, "origin" timestamptz);
CREATE OR REPLACE FUNCTION "public"."time_bucket"("bucket_width" interval, "ts" timestamptz, "origin" timestamptz)
  RETURNS "pg_catalog"."timestamptz" AS '$libdir/timescaledb-2.6.1', 'ts_timestamptz_bucket'
  LANGUAGE c IMMUTABLE STRICT
  COST 1;

-- ----------------------------
-- Function structure for time_bucket
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."time_bucket"("bucket_width" int8, "ts" int8, "offset" int8);
CREATE OR REPLACE FUNCTION "public"."time_bucket"("bucket_width" int8, "ts" int8, "offset" int8)
  RETURNS "pg_catalog"."int8" AS '$libdir/timescaledb-2.6.1', 'ts_int64_bucket'
  LANGUAGE c IMMUTABLE STRICT
  COST 1;

-- ----------------------------
-- Function structure for time_bucket
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."time_bucket"("bucket_width" interval, "ts" timestamptz);
CREATE OR REPLACE FUNCTION "public"."time_bucket"("bucket_width" interval, "ts" timestamptz)
  RETURNS "pg_catalog"."timestamptz" AS '$libdir/timescaledb-2.6.1', 'ts_timestamptz_bucket'
  LANGUAGE c IMMUTABLE STRICT
  COST 1;

-- ----------------------------
-- Function structure for time_bucket
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."time_bucket"("bucket_width" interval, "ts" timestamp);
CREATE OR REPLACE FUNCTION "public"."time_bucket"("bucket_width" interval, "ts" timestamp)
  RETURNS "pg_catalog"."timestamp" AS '$libdir/timescaledb-2.6.1', 'ts_timestamp_bucket'
  LANGUAGE c IMMUTABLE STRICT
  COST 1;

-- ----------------------------
-- Function structure for time_bucket
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."time_bucket"("bucket_width" interval, "ts" timestamp, "origin" timestamp);
CREATE OR REPLACE FUNCTION "public"."time_bucket"("bucket_width" interval, "ts" timestamp, "origin" timestamp)
  RETURNS "pg_catalog"."timestamp" AS '$libdir/timescaledb-2.6.1', 'ts_timestamp_bucket'
  LANGUAGE c IMMUTABLE STRICT
  COST 1;

-- ----------------------------
-- Function structure for time_bucket_gapfill
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."time_bucket_gapfill"("bucket_width" int2, "ts" int2, "start" int2, "finish" int2);
CREATE OR REPLACE FUNCTION "public"."time_bucket_gapfill"("bucket_width" int2, "ts" int2, "start" int2=NULL::smallint, "finish" int2=NULL::smallint)
  RETURNS "pg_catalog"."int2" AS '$libdir/timescaledb-2.6.1', 'ts_gapfill_int16_bucket'
  LANGUAGE c VOLATILE
  COST 1;

-- ----------------------------
-- Function structure for time_bucket_gapfill
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."time_bucket_gapfill"("bucket_width" interval, "ts" date, "start" date, "finish" date);
CREATE OR REPLACE FUNCTION "public"."time_bucket_gapfill"("bucket_width" interval, "ts" date, "start" date=NULL::date, "finish" date=NULL::date)
  RETURNS "pg_catalog"."date" AS '$libdir/timescaledb-2.6.1', 'ts_gapfill_date_bucket'
  LANGUAGE c VOLATILE
  COST 1;

-- ----------------------------
-- Function structure for time_bucket_gapfill
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."time_bucket_gapfill"("bucket_width" int8, "ts" int8, "start" int8, "finish" int8);
CREATE OR REPLACE FUNCTION "public"."time_bucket_gapfill"("bucket_width" int8, "ts" int8, "start" int8=NULL::bigint, "finish" int8=NULL::bigint)
  RETURNS "pg_catalog"."int8" AS '$libdir/timescaledb-2.6.1', 'ts_gapfill_int64_bucket'
  LANGUAGE c VOLATILE
  COST 1;

-- ----------------------------
-- Function structure for time_bucket_gapfill
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."time_bucket_gapfill"("bucket_width" interval, "ts" timestamp, "start" timestamp, "finish" timestamp);
CREATE OR REPLACE FUNCTION "public"."time_bucket_gapfill"("bucket_width" interval, "ts" timestamp, "start" timestamp=NULL::timestamp without time zone, "finish" timestamp=NULL::timestamp without time zone)
  RETURNS "pg_catalog"."timestamp" AS '$libdir/timescaledb-2.6.1', 'ts_gapfill_timestamp_bucket'
  LANGUAGE c VOLATILE
  COST 1;

-- ----------------------------
-- Function structure for time_bucket_gapfill
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."time_bucket_gapfill"("bucket_width" int4, "ts" int4, "start" int4, "finish" int4);
CREATE OR REPLACE FUNCTION "public"."time_bucket_gapfill"("bucket_width" int4, "ts" int4, "start" int4=NULL::integer, "finish" int4=NULL::integer)
  RETURNS "pg_catalog"."int4" AS '$libdir/timescaledb-2.6.1', 'ts_gapfill_int32_bucket'
  LANGUAGE c VOLATILE
  COST 1;

-- ----------------------------
-- Function structure for time_bucket_gapfill
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."time_bucket_gapfill"("bucket_width" interval, "ts" timestamptz, "start" timestamptz, "finish" timestamptz);
CREATE OR REPLACE FUNCTION "public"."time_bucket_gapfill"("bucket_width" interval, "ts" timestamptz, "start" timestamptz=NULL::timestamp with time zone, "finish" timestamptz=NULL::timestamp with time zone)
  RETURNS "pg_catalog"."timestamptz" AS '$libdir/timescaledb-2.6.1', 'ts_gapfill_timestamptz_bucket'
  LANGUAGE c VOLATILE
  COST 1;

-- ----------------------------
-- Function structure for timescaledb_fdw_handler
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."timescaledb_fdw_handler"();
CREATE OR REPLACE FUNCTION "public"."timescaledb_fdw_handler"()
  RETURNS "pg_catalog"."fdw_handler" AS '$libdir/timescaledb-2.6.1', 'ts_timescaledb_fdw_handler'
  LANGUAGE c VOLATILE STRICT
  COST 1;

-- ----------------------------
-- Function structure for timescaledb_fdw_validator
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."timescaledb_fdw_validator"(_text, oid);
CREATE OR REPLACE FUNCTION "public"."timescaledb_fdw_validator"(_text, oid)
  RETURNS "pg_catalog"."void" AS '$libdir/timescaledb-2.6.1', 'ts_timescaledb_fdw_validator'
  LANGUAGE c VOLATILE STRICT
  COST 1;

-- ----------------------------
-- Function structure for timescaledb_post_restore
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."timescaledb_post_restore"();
CREATE OR REPLACE FUNCTION "public"."timescaledb_post_restore"()
  RETURNS "pg_catalog"."bool" AS $BODY$
DECLARE
    db text;
BEGIN
    SELECT current_database() INTO db;
    EXECUTE format($$ALTER DATABASE %I RESET timescaledb.restoring $$, db);
    RESET timescaledb.restoring;
    PERFORM _timescaledb_internal.restart_background_workers();

    --try to restore the backed up uuid, if the restore did not set one
    INSERT INTO _timescaledb_catalog.metadata
       SELECT 'exported_uuid', value, include_in_telemetry FROM _timescaledb_catalog.metadata WHERE key='exported_uuid_bak'
       ON CONFLICT DO NOTHING;
    DELETE FROM _timescaledb_catalog.metadata WHERE key='exported_uuid_bak';

    RETURN true;
END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100
  SET "search_path"="pg_catalog";

-- ----------------------------
-- Function structure for timescaledb_pre_restore
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."timescaledb_pre_restore"();
CREATE OR REPLACE FUNCTION "public"."timescaledb_pre_restore"()
  RETURNS "pg_catalog"."bool" AS $BODY$
DECLARE
    db text;
BEGIN
    SELECT current_database() INTO db;
    EXECUTE format($$ALTER DATABASE %I SET timescaledb.restoring ='on'$$, db);
    SET SESSION timescaledb.restoring = 'on';
    PERFORM _timescaledb_internal.stop_background_workers();
    --exported uuid may be included in the dump so backup the version
    UPDATE _timescaledb_catalog.metadata SET key='exported_uuid_bak' WHERE key='exported_uuid';
    RETURN true;
END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100
  SET "search_path"="pg_catalog";

-- ----------------------------
-- Function structure for to_uuid
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."to_uuid"("entity_id" varchar, OUT "uuid_id" uuid);
CREATE OR REPLACE FUNCTION "public"."to_uuid"(IN "entity_id" varchar, OUT "uuid_id" uuid)
  RETURNS "pg_catalog"."uuid" AS $BODY$
BEGIN
    uuid_id := substring(entity_id, 8, 8) || '-' || substring(entity_id, 4, 4) || '-1' || substring(entity_id, 1, 3) ||
               '-' || substring(entity_id, 16, 4) || '-' || substring(entity_id, 20, 12);
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ts_kv_dictionary_key_id_seq"
OWNED BY "public"."ts_kv_dictionary"."key_id";
SELECT setval('"public"."ts_kv_dictionary_key_id_seq"', 39, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."xxl_job_group_id_seq"', 17, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."xxl_job_info_id_seq"', 3, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."xxl_job_log_id_seq"', 142, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."xxl_job_log_report_id_seq"', 4, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."xxl_job_logglue_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."xxl_job_registry_id_seq"', 142, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."xxl_job_user_id_seq"', 3, true);

-- ----------------------------
-- Primary Key structure for table admin_settings
-- ----------------------------
ALTER TABLE "public"."admin_settings" ADD CONSTRAINT "admin_settings_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table alarm
-- ----------------------------
CREATE INDEX "idx_alarm_originator_alarm_type" ON "public"."alarm" USING btree (
  "originator_id" "pg_catalog"."uuid_ops" ASC NULLS LAST,
  "type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "start_ts" "pg_catalog"."int8_ops" DESC NULLS FIRST
);
CREATE INDEX "idx_alarm_originator_created_time" ON "public"."alarm" USING btree (
  "originator_id" "pg_catalog"."uuid_ops" ASC NULLS LAST,
  "created_time" "pg_catalog"."int8_ops" DESC NULLS FIRST
);
CREATE INDEX "idx_alarm_tenant_alarm_type_created_time" ON "public"."alarm" USING btree (
  "tenant_id" "pg_catalog"."uuid_ops" ASC NULLS LAST,
  "type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "created_time" "pg_catalog"."int8_ops" DESC NULLS FIRST
);
CREATE INDEX "idx_alarm_tenant_created_time" ON "public"."alarm" USING btree (
  "tenant_id" "pg_catalog"."uuid_ops" ASC NULLS LAST,
  "created_time" "pg_catalog"."int8_ops" DESC NULLS FIRST
);
CREATE INDEX "idx_alarm_tenant_status_created_time" ON "public"."alarm" USING btree (
  "tenant_id" "pg_catalog"."uuid_ops" ASC NULLS LAST,
  "status" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "created_time" "pg_catalog"."int8_ops" DESC NULLS FIRST
);

-- ----------------------------
-- Primary Key structure for table alarm
-- ----------------------------
ALTER TABLE "public"."alarm" ADD CONSTRAINT "alarm_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Uniques structure for table api_usage_state
-- ----------------------------
ALTER TABLE "public"."api_usage_state" ADD CONSTRAINT "api_usage_state_unq_key" UNIQUE ("tenant_id", "entity_id");

-- ----------------------------
-- Primary Key structure for table api_usage_state
-- ----------------------------
ALTER TABLE "public"."api_usage_state" ADD CONSTRAINT "usage_record_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table asset
-- ----------------------------
CREATE INDEX "idx_asset_customer_id" ON "public"."asset" USING btree (
  "tenant_id" "pg_catalog"."uuid_ops" ASC NULLS LAST,
  "customer_id" "pg_catalog"."uuid_ops" ASC NULLS LAST
);
CREATE INDEX "idx_asset_customer_id_and_type" ON "public"."asset" USING btree (
  "tenant_id" "pg_catalog"."uuid_ops" ASC NULLS LAST,
  "customer_id" "pg_catalog"."uuid_ops" ASC NULLS LAST,
  "type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_asset_type" ON "public"."asset" USING btree (
  "tenant_id" "pg_catalog"."uuid_ops" ASC NULLS LAST,
  "type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Uniques structure for table asset
-- ----------------------------
ALTER TABLE "public"."asset" ADD CONSTRAINT "asset_name_unq_key" UNIQUE ("tenant_id", "name");

-- ----------------------------
-- Primary Key structure for table asset
-- ----------------------------
ALTER TABLE "public"."asset" ADD CONSTRAINT "asset_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table attribute_kv
-- ----------------------------
CREATE INDEX "idx_attribute_kv_by_key_and_last_update_ts" ON "public"."attribute_kv" USING btree (
  "entity_id" "pg_catalog"."uuid_ops" ASC NULLS LAST,
  "attribute_key" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "last_update_ts" "pg_catalog"."int8_ops" DESC NULLS FIRST
);

-- ----------------------------
-- Primary Key structure for table attribute_kv
-- ----------------------------
ALTER TABLE "public"."attribute_kv" ADD CONSTRAINT "attribute_kv_pkey" PRIMARY KEY ("entity_type", "entity_id", "attribute_type", "attribute_key");

-- ----------------------------
-- Indexes structure for table audit_log
-- ----------------------------
CREATE INDEX "idx_audit_log_tenant_id_and_created_time" ON "public"."audit_log" USING btree (
  "tenant_id" "pg_catalog"."uuid_ops" ASC NULLS LAST,
  "created_time" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table audit_log
-- ----------------------------
ALTER TABLE "public"."audit_log" ADD CONSTRAINT "audit_log_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Uniques structure for table component_descriptor
-- ----------------------------
ALTER TABLE "public"."component_descriptor" ADD CONSTRAINT "component_descriptor_clazz_key" UNIQUE ("clazz");

-- ----------------------------
-- Primary Key structure for table component_descriptor
-- ----------------------------
ALTER TABLE "public"."component_descriptor" ADD CONSTRAINT "component_descriptor_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table customer
-- ----------------------------
ALTER TABLE "public"."customer" ADD CONSTRAINT "customer_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table dashboard
-- ----------------------------
ALTER TABLE "public"."dashboard" ADD CONSTRAINT "dashboard_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table device
-- ----------------------------
CREATE INDEX "idx_device_customer_id" ON "public"."device" USING btree (
  "tenant_id" "pg_catalog"."uuid_ops" ASC NULLS LAST,
  "customer_id" "pg_catalog"."uuid_ops" ASC NULLS LAST
);
CREATE INDEX "idx_device_customer_id_and_type" ON "public"."device" USING btree (
  "tenant_id" "pg_catalog"."uuid_ops" ASC NULLS LAST,
  "customer_id" "pg_catalog"."uuid_ops" ASC NULLS LAST,
  "type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_device_device_profile_id" ON "public"."device" USING btree (
  "tenant_id" "pg_catalog"."uuid_ops" ASC NULLS LAST,
  "device_profile_id" "pg_catalog"."uuid_ops" ASC NULLS LAST
);
CREATE INDEX "idx_device_type" ON "public"."device" USING btree (
  "tenant_id" "pg_catalog"."uuid_ops" ASC NULLS LAST,
  "type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Uniques structure for table device
-- ----------------------------
ALTER TABLE "public"."device" ADD CONSTRAINT "device_name_unq_key" UNIQUE ("tenant_id", "name");

-- ----------------------------
-- Primary Key structure for table device
-- ----------------------------
ALTER TABLE "public"."device" ADD CONSTRAINT "device_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Uniques structure for table device_credentials
-- ----------------------------
ALTER TABLE "public"."device_credentials" ADD CONSTRAINT "device_credentials_id_unq_key" UNIQUE ("credentials_id");
ALTER TABLE "public"."device_credentials" ADD CONSTRAINT "device_credentials_device_id_unq_key" UNIQUE ("device_id");

-- ----------------------------
-- Primary Key structure for table device_credentials
-- ----------------------------
ALTER TABLE "public"."device_credentials" ADD CONSTRAINT "device_credentials_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Uniques structure for table device_profile
-- ----------------------------
ALTER TABLE "public"."device_profile" ADD CONSTRAINT "device_profile_name_unq_key" UNIQUE ("tenant_id", "name");
ALTER TABLE "public"."device_profile" ADD CONSTRAINT "device_provision_key_unq_key" UNIQUE ("provision_device_key");

-- ----------------------------
-- Primary Key structure for table device_profile
-- ----------------------------
ALTER TABLE "public"."device_profile" ADD CONSTRAINT "device_profile_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Uniques structure for table edge
-- ----------------------------
ALTER TABLE "public"."edge" ADD CONSTRAINT "edge_name_unq_key" UNIQUE ("tenant_id", "name");
ALTER TABLE "public"."edge" ADD CONSTRAINT "edge_routing_key_unq_key" UNIQUE ("routing_key");

-- ----------------------------
-- Primary Key structure for table edge
-- ----------------------------
ALTER TABLE "public"."edge" ADD CONSTRAINT "edge_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table edge_event
-- ----------------------------
ALTER TABLE "public"."edge_event" ADD CONSTRAINT "edge_event_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table entity_alarm
-- ----------------------------
CREATE INDEX "idx_entity_alarm_alarm_id" ON "public"."entity_alarm" USING btree (
  "alarm_id" "pg_catalog"."uuid_ops" ASC NULLS LAST
);
CREATE INDEX "idx_entity_alarm_created_time" ON "public"."entity_alarm" USING btree (
  "tenant_id" "pg_catalog"."uuid_ops" ASC NULLS LAST,
  "entity_id" "pg_catalog"."uuid_ops" ASC NULLS LAST,
  "created_time" "pg_catalog"."int8_ops" DESC NULLS FIRST
);

-- ----------------------------
-- Primary Key structure for table entity_alarm
-- ----------------------------
ALTER TABLE "public"."entity_alarm" ADD CONSTRAINT "entity_alarm_pkey" PRIMARY KEY ("entity_id", "alarm_id");

-- ----------------------------
-- Primary Key structure for table entity_view
-- ----------------------------
ALTER TABLE "public"."entity_view" ADD CONSTRAINT "entity_view_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table event
-- ----------------------------
CREATE INDEX "idx_event_tenant_entity_type_entity_event_type_created_time_des" ON "public"."event" USING btree (
  "tenant_id" "pg_catalog"."uuid_ops" ASC NULLS LAST,
  "entity_type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "entity_id" "pg_catalog"."uuid_ops" ASC NULLS LAST,
  "event_type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "created_time" "pg_catalog"."int8_ops" DESC NULLS LAST
) WITH (FILLFACTOR = 95);
COMMENT ON INDEX "public"."idx_event_tenant_entity_type_entity_event_type_created_time_des" IS 'This index helps to open latest events on UI fast';
CREATE INDEX "idx_event_ts" ON "public"."event" USING btree (
  "ts" "pg_catalog"."int8_ops" DESC NULLS LAST
) WITH (FILLFACTOR = 95);
COMMENT ON INDEX "public"."idx_event_ts" IS 'This index helps to delete events by TTL using timestamp';

-- ----------------------------
-- Uniques structure for table event
-- ----------------------------
ALTER TABLE "public"."event" ADD CONSTRAINT "event_unq_key" UNIQUE ("tenant_id", "entity_type", "entity_id", "event_type", "event_uid");

-- ----------------------------
-- Primary Key structure for table event
-- ----------------------------
ALTER TABLE "public"."event" ADD CONSTRAINT "event_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table oauth2_client_registration
-- ----------------------------
ALTER TABLE "public"."oauth2_client_registration" ADD CONSTRAINT "oauth2_client_registration_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table oauth2_client_registration_info
-- ----------------------------
ALTER TABLE "public"."oauth2_client_registration_info" ADD CONSTRAINT "oauth2_client_registration_info_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Uniques structure for table oauth2_client_registration_template
-- ----------------------------
ALTER TABLE "public"."oauth2_client_registration_template" ADD CONSTRAINT "oauth2_template_provider_id_unq_key" UNIQUE ("provider_id");

-- ----------------------------
-- Primary Key structure for table oauth2_client_registration_template
-- ----------------------------
ALTER TABLE "public"."oauth2_client_registration_template" ADD CONSTRAINT "oauth2_client_registration_template_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Uniques structure for table oauth2_domain
-- ----------------------------
ALTER TABLE "public"."oauth2_domain" ADD CONSTRAINT "oauth2_domain_unq_key" UNIQUE ("oauth2_params_id", "domain_name", "domain_scheme");

-- ----------------------------
-- Primary Key structure for table oauth2_domain
-- ----------------------------
ALTER TABLE "public"."oauth2_domain" ADD CONSTRAINT "oauth2_domain_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Uniques structure for table oauth2_mobile
-- ----------------------------
ALTER TABLE "public"."oauth2_mobile" ADD CONSTRAINT "oauth2_mobile_unq_key" UNIQUE ("oauth2_params_id", "pkg_name");

-- ----------------------------
-- Primary Key structure for table oauth2_mobile
-- ----------------------------
ALTER TABLE "public"."oauth2_mobile" ADD CONSTRAINT "oauth2_mobile_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table oauth2_params
-- ----------------------------
ALTER TABLE "public"."oauth2_params" ADD CONSTRAINT "oauth2_params_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table oauth2_registration
-- ----------------------------
ALTER TABLE "public"."oauth2_registration" ADD CONSTRAINT "oauth2_registration_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Uniques structure for table ota_package
-- ----------------------------
ALTER TABLE "public"."ota_package" ADD CONSTRAINT "ota_package_tenant_title_version_unq_key" UNIQUE ("tenant_id", "title", "version");

-- ----------------------------
-- Primary Key structure for table ota_package
-- ----------------------------
ALTER TABLE "public"."ota_package" ADD CONSTRAINT "ota_package_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table relation
-- ----------------------------
CREATE INDEX "idx_relation_from_id" ON "public"."relation" USING btree (
  "relation_type_group" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "from_type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "from_id" "pg_catalog"."uuid_ops" ASC NULLS LAST
);
CREATE INDEX "idx_relation_to_id" ON "public"."relation" USING btree (
  "relation_type_group" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "to_type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "to_id" "pg_catalog"."uuid_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table relation
-- ----------------------------
ALTER TABLE "public"."relation" ADD CONSTRAINT "relation_pkey" PRIMARY KEY ("from_id", "from_type", "relation_type_group", "relation_type", "to_id", "to_type");

-- ----------------------------
-- Uniques structure for table resource
-- ----------------------------
ALTER TABLE "public"."resource" ADD CONSTRAINT "resource_unq_key" UNIQUE ("tenant_id", "resource_type", "resource_key");

-- ----------------------------
-- Primary Key structure for table resource
-- ----------------------------
ALTER TABLE "public"."resource" ADD CONSTRAINT "resource_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table rpc
-- ----------------------------
CREATE INDEX "idx_rpc_tenant_id_device_id" ON "public"."rpc" USING btree (
  "tenant_id" "pg_catalog"."uuid_ops" ASC NULLS LAST,
  "device_id" "pg_catalog"."uuid_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table rpc
-- ----------------------------
ALTER TABLE "public"."rpc" ADD CONSTRAINT "rpc_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table rule_chain
-- ----------------------------
ALTER TABLE "public"."rule_chain" ADD CONSTRAINT "rule_chain_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table rule_node
-- ----------------------------
ALTER TABLE "public"."rule_node" ADD CONSTRAINT "rule_node_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Uniques structure for table rule_node_state
-- ----------------------------
ALTER TABLE "public"."rule_node_state" ADD CONSTRAINT "rule_node_state_unq_key" UNIQUE ("rule_node_id", "entity_id");

-- ----------------------------
-- Primary Key structure for table rule_node_state
-- ----------------------------
ALTER TABLE "public"."rule_node_state" ADD CONSTRAINT "rule_node_state_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table tb_schema_settings
-- ----------------------------
ALTER TABLE "public"."tb_schema_settings" ADD CONSTRAINT "tb_schema_settings_pkey" PRIMARY KEY ("schema_version");

-- ----------------------------
-- Uniques structure for table tb_user
-- ----------------------------
ALTER TABLE "public"."tb_user" ADD CONSTRAINT "tb_user_email_key" UNIQUE ("email");

-- ----------------------------
-- Primary Key structure for table tb_user
-- ----------------------------
ALTER TABLE "public"."tb_user" ADD CONSTRAINT "tb_user_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table tenant
-- ----------------------------
ALTER TABLE "public"."tenant" ADD CONSTRAINT "tenant_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Uniques structure for table tenant_profile
-- ----------------------------
ALTER TABLE "public"."tenant_profile" ADD CONSTRAINT "tenant_profile_name_unq_key" UNIQUE ("name");

-- ----------------------------
-- Primary Key structure for table tenant_profile
-- ----------------------------
ALTER TABLE "public"."tenant_profile" ADD CONSTRAINT "tenant_profile_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table ts_kv
-- ----------------------------
ALTER TABLE "public"."ts_kv" ADD CONSTRAINT "ts_kv_pkey" PRIMARY KEY ("entity_id", "key", "ts");

-- ----------------------------
-- Uniques structure for table ts_kv_dictionary
-- ----------------------------
ALTER TABLE "public"."ts_kv_dictionary" ADD CONSTRAINT "ts_kv_dictionary_key_id_key" UNIQUE ("key_id");

-- ----------------------------
-- Primary Key structure for table ts_kv_dictionary
-- ----------------------------
ALTER TABLE "public"."ts_kv_dictionary" ADD CONSTRAINT "ts_key_id_pkey" PRIMARY KEY ("key");

-- ----------------------------
-- Primary Key structure for table ts_kv_latest
-- ----------------------------
ALTER TABLE "public"."ts_kv_latest" ADD CONSTRAINT "ts_kv_latest_pkey" PRIMARY KEY ("entity_id", "key");

-- ----------------------------
-- Uniques structure for table user_credentials
-- ----------------------------
ALTER TABLE "public"."user_credentials" ADD CONSTRAINT "user_credentials_activate_token_key" UNIQUE ("activate_token");
ALTER TABLE "public"."user_credentials" ADD CONSTRAINT "user_credentials_reset_token_key" UNIQUE ("reset_token");
ALTER TABLE "public"."user_credentials" ADD CONSTRAINT "user_credentials_user_id_key" UNIQUE ("user_id");

-- ----------------------------
-- Primary Key structure for table user_credentials
-- ----------------------------
ALTER TABLE "public"."user_credentials" ADD CONSTRAINT "user_credentials_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table widget_type
-- ----------------------------
ALTER TABLE "public"."widget_type" ADD CONSTRAINT "widget_type_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table widgets_bundle
-- ----------------------------
ALTER TABLE "public"."widgets_bundle" ADD CONSTRAINT "widgets_bundle_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table xxl_job_group
-- ----------------------------
ALTER TABLE "public"."xxl_job_group" ADD CONSTRAINT "xxl_job_group_pk" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table xxl_job_info
-- ----------------------------
ALTER TABLE "public"."xxl_job_info" ADD CONSTRAINT "xxl_job_info_pk" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table xxl_job_lock
-- ----------------------------
ALTER TABLE "public"."xxl_job_lock" ADD CONSTRAINT "xxl_job_lock_pk" PRIMARY KEY ("lock_name");

-- ----------------------------
-- Indexes structure for table xxl_job_log
-- ----------------------------
CREATE INDEX "xxl_job_log_handle_time_idx" ON "public"."xxl_job_log" USING btree (
  "handle_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "xxl_job_log_trigger_code_idx" ON "public"."xxl_job_log" USING btree (
  "trigger_code" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table xxl_job_log
-- ----------------------------
ALTER TABLE "public"."xxl_job_log" ADD CONSTRAINT "xxl_job_log_pk" PRIMARY KEY ("id");

-- ----------------------------
-- Uniques structure for table xxl_job_log_report
-- ----------------------------
ALTER TABLE "public"."xxl_job_log_report" ADD CONSTRAINT "xxl_job_log_report_un" UNIQUE ("trigger_day");

-- ----------------------------
-- Primary Key structure for table xxl_job_log_report
-- ----------------------------
ALTER TABLE "public"."xxl_job_log_report" ADD CONSTRAINT "xxl_job_log_report_pk" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table xxl_job_logglue
-- ----------------------------
ALTER TABLE "public"."xxl_job_logglue" ADD CONSTRAINT "xxl_job_logglue_pk" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table xxl_job_registry
-- ----------------------------
CREATE INDEX "xxl_job_registry_registry_group_idx" ON "public"."xxl_job_registry" USING btree (
  "registry_group" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "registry_key" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "registry_value" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table xxl_job_registry
-- ----------------------------
ALTER TABLE "public"."xxl_job_registry" ADD CONSTRAINT "xxl_job_registry_pk" PRIMARY KEY ("id");

-- ----------------------------
-- Uniques structure for table xxl_job_user
-- ----------------------------
ALTER TABLE "public"."xxl_job_user" ADD CONSTRAINT "xxl_job_user_un" UNIQUE ("username");

-- ----------------------------
-- Primary Key structure for table xxl_job_user
-- ----------------------------
ALTER TABLE "public"."xxl_job_user" ADD CONSTRAINT "xxl_job_user_pk" PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Keys structure for table device
-- ----------------------------
ALTER TABLE "public"."device" ADD CONSTRAINT "fk_device_profile" FOREIGN KEY ("device_profile_id") REFERENCES "public"."device_profile" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."device" ADD CONSTRAINT "fk_firmware_device" FOREIGN KEY ("firmware_id") REFERENCES "public"."ota_package" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."device" ADD CONSTRAINT "fk_software_device" FOREIGN KEY ("software_id") REFERENCES "public"."ota_package" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table device_profile
-- ----------------------------
ALTER TABLE "public"."device_profile" ADD CONSTRAINT "fk_default_dashboard_device_profile" FOREIGN KEY ("default_dashboard_id") REFERENCES "public"."dashboard" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."device_profile" ADD CONSTRAINT "fk_default_rule_chain_device_profile" FOREIGN KEY ("default_rule_chain_id") REFERENCES "public"."rule_chain" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."device_profile" ADD CONSTRAINT "fk_firmware_device_profile" FOREIGN KEY ("firmware_id") REFERENCES "public"."ota_package" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."device_profile" ADD CONSTRAINT "fk_software_device_profile" FOREIGN KEY ("software_id") REFERENCES "public"."ota_package" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table entity_alarm
-- ----------------------------
ALTER TABLE "public"."entity_alarm" ADD CONSTRAINT "fk_entity_alarm_id" FOREIGN KEY ("alarm_id") REFERENCES "public"."alarm" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table oauth2_domain
-- ----------------------------
ALTER TABLE "public"."oauth2_domain" ADD CONSTRAINT "fk_domain_oauth2_params" FOREIGN KEY ("oauth2_params_id") REFERENCES "public"."oauth2_params" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table oauth2_mobile
-- ----------------------------
ALTER TABLE "public"."oauth2_mobile" ADD CONSTRAINT "fk_mobile_oauth2_params" FOREIGN KEY ("oauth2_params_id") REFERENCES "public"."oauth2_params" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table oauth2_registration
-- ----------------------------
ALTER TABLE "public"."oauth2_registration" ADD CONSTRAINT "fk_registration_oauth2_params" FOREIGN KEY ("oauth2_params_id") REFERENCES "public"."oauth2_params" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ota_package
-- ----------------------------
ALTER TABLE "public"."ota_package" ADD CONSTRAINT "fk_device_profile_ota_package" FOREIGN KEY ("device_profile_id") REFERENCES "public"."device_profile" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table rule_node_state
-- ----------------------------
ALTER TABLE "public"."rule_node_state" ADD CONSTRAINT "fk_rule_node_state_node_id" FOREIGN KEY ("rule_node_id") REFERENCES "public"."rule_node" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table tenant
-- ----------------------------
ALTER TABLE "public"."tenant" ADD CONSTRAINT "fk_tenant_profile" FOREIGN KEY ("tenant_profile_id") REFERENCES "public"."tenant_profile" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
