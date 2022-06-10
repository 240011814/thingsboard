CREATE SEQUENCE xxl_job_info_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE xxl_job_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE xxl_job_log_report_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

	
CREATE SEQUENCE xxl_job_logglue_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE xxl_job_registry_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
	

	
CREATE SEQUENCE xxl_job_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

	
CREATE SEQUENCE xxl_job_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


-- public.xxl_job_group definition

-- Drop table

-- DROP TABLE public.xxl_job_group;

CREATE TABLE public.xxl_job_group (
                                      app_name varchar(255) NOT NULL,
                                      title varchar(255) NOT NULL,
                                      address_type int8 NOT NULL DEFAULT 0,
                                      address_list text NULL,
                                      update_time timestamp NULL,
                                      id bigserial NOT NULL,
                                      CONSTRAINT xxl_job_group_pk PRIMARY KEY (id)
);


-- public.xxl_job_info definition

-- Drop table

-- DROP TABLE public.xxl_job_info;

CREATE TABLE public.xxl_job_info (
                                     job_group int8 NOT NULL,
                                     job_desc varchar(255) NOT NULL,
                                     add_time timestamp NULL,
                                     update_time timestamp NULL,
                                     author varchar(255) NULL,
                                     alarm_email varchar(255) NULL,
                                     schedule_type varchar(255) NOT NULL DEFAULT 'NONE'::character varying,
                                     schedule_conf varchar(128) NULL,
                                     misfire_strategy varchar(50) NOT NULL DEFAULT 'DO_NOTHING'::character varying,
                                     executor_route_strategy varchar(50) NULL,
                                     executor_handler varchar(255) NULL,
                                     executor_param varchar(5000) NULL,
                                     executor_block_strategy varchar(50) NULL,
                                     executor_timeout int8 NOT NULL DEFAULT 0,
                                     executor_fail_retry_count int8 NOT NULL DEFAULT 0,
                                     glue_type varchar(50) NOT NULL,
                                     glue_source text NULL,
                                     glue_remark varchar(255) NULL,
                                     glue_updatetime timestamp NULL,
                                     child_jobid varchar(255) NULL,
                                     trigger_status int4 NOT NULL DEFAULT 0,
                                     trigger_last_time int8 NOT NULL DEFAULT 0,
                                     trigger_next_time int8 NOT NULL DEFAULT 0,
                                     id bigserial NOT NULL,
                                     CONSTRAINT xxl_job_info_pk PRIMARY KEY (id)
);


-- public.xxl_job_lock definition

-- Drop table

-- DROP TABLE public.xxl_job_lock;

CREATE TABLE public.xxl_job_lock (
                                     lock_name varchar(50) NOT NULL,
                                     CONSTRAINT xxl_job_lock_pk PRIMARY KEY (lock_name)
);


-- public.xxl_job_log definition

-- Drop table

-- DROP TABLE public.xxl_job_log;

CREATE TABLE public.xxl_job_log (
                                    id bigserial NOT NULL,
                                    job_group int8 NOT NULL,
                                    job_id int8 NOT NULL,
                                    executor_address varchar(255) NULL,
                                    executor_handler varchar(255) NULL,
                                    executor_param varchar(5000) NULL,
                                    executor_sharding_param varchar(255) NULL,
                                    executor_fail_retry_count int8 NOT NULL DEFAULT 0,
                                    trigger_time timestamp NULL,
                                    trigger_code int8 NOT NULL,
                                    trigger_msg text NULL,
                                    handle_time timestamp NULL,
                                    handle_code int8 NOT NULL,
                                    handle_msg text NULL,
                                    alarm_status int4 NOT NULL DEFAULT 0,
                                    CONSTRAINT xxl_job_log_pk PRIMARY KEY (id)
);
CREATE INDEX xxl_job_log_handle_time_idx ON public.xxl_job_log USING btree (handle_time);
CREATE INDEX xxl_job_log_trigger_code_idx ON public.xxl_job_log USING btree (trigger_code);


-- public.xxl_job_log_report definition

-- Drop table

-- DROP TABLE public.xxl_job_log_report;

CREATE TABLE public.xxl_job_log_report (
                                           id bigserial NOT NULL,
                                           trigger_day timestamp NULL,
                                           running_count int8 NOT NULL DEFAULT 0,
                                           suc_count int8 NOT NULL DEFAULT 0,
                                           fail_count int8 NOT NULL DEFAULT 0,
                                           update_time timestamp NULL,
                                           CONSTRAINT xxl_job_log_report_pk PRIMARY KEY (id),
                                           CONSTRAINT xxl_job_log_report_un UNIQUE (trigger_day)
);


-- public.xxl_job_logglue definition

-- Drop table

-- DROP TABLE public.xxl_job_logglue;

CREATE TABLE public.xxl_job_logglue (
                                        id bigserial NOT NULL,
                                        job_id int8 NOT NULL,
                                        glue_type varchar(50) NULL,
                                        glue_source text NOT NULL,
                                        glue_remark varchar(255) NULL,
                                        add_time timestamp NULL,
                                        update_time timestamp NULL,
                                        CONSTRAINT xxl_job_logglue_pk PRIMARY KEY (id)
);


-- public.xxl_job_registry definition

-- Drop table

-- DROP TABLE public.xxl_job_registry;

CREATE TABLE public.xxl_job_registry (
                                         id bigserial NOT NULL,
                                         registry_group varchar(255) NOT NULL,
                                         registry_key varchar(255) NOT NULL,
                                         registry_value varchar(255) NOT NULL,
                                         update_time timestamp NULL,
                                         CONSTRAINT xxl_job_registry_pk PRIMARY KEY (id)
);
CREATE INDEX xxl_job_registry_registry_group_idx ON public.xxl_job_registry USING btree (registry_group, registry_key, registry_value);


-- public.xxl_job_user definition

-- Drop table

-- DROP TABLE public.xxl_job_user;

CREATE TABLE public.xxl_job_user (
                                     id bigserial NOT NULL,
                                     username varchar(255) NOT NULL,
                                     "password" varchar(255) NOT NULL,
                                     "role" int4 NOT NULL,
                                     "permission" varchar(255) NULL,
                                     CONSTRAINT xxl_job_user_pk PRIMARY KEY (id),
                                     CONSTRAINT xxl_job_user_un UNIQUE (username)
);

INSERT INTO "public"."xxl_job_group" ( app_name, title,  address_type, address_list) values ( 'xxl-job-executor-sample', '示例执行器', '0', null);
INSERT INTO "public"."xxl_job_user"( username, password, role, permission) VALUES ( 'admin', 'e10adc3949ba59abbe56e057f20f883e', 1, NULL);



commit;