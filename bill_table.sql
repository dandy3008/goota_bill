CREATE TABLE public.billing_config (
	store_id int4 NOT NULL,
	outlet_id int4 NOT NULL,
	extend_days int4 NULL,
	created timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
	created_by int4 NULL,
	created_by_id varchar NULL,
	last_updated timestamp(0) NULL,
	last_updated_by int4 NULL,
	last_updated_by_id varchar NULL,
	CONSTRAINT billing_config_pk PRIMARY KEY (store_id, outlet_id)
);


CREATE TABLE public.order_detail (
	id bigserial NOT NULL,
	order_id int4 NOT NULL,
	feature_id int4 NOT NULL,
	price int4 NOT NULL,
	bc_days int4 NOT NULL,
	created timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
	created_by int4 NULL,
	created_by_id varchar NULL,
	deleted_at timestamp(0) NULL,
	deleted_by int4 NULL,
	deleted_by_id varchar NULL
);


CREATE TABLE public.order_head (
	id bigserial NOT NULL,
	store_id int4 NOT NULL,
	outlet_id int4 NOT NULL,
	order_number varchar NOT NULL,
	status varchar NOT NULL,
	total_amount int4 NOT NULL,
	created timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
	created_by int4 NULL,
	created_by_id varchar NULL,
	deleted_at timestamp(0) NULL,
	deleted_by int4 NULL,
	deleted_by_id varchar NULL,
	last_updated timestamp(0) NULL,
	last_updated_by int4 NULL,
	last_updated_by_id varchar NULL,
	payment_method varchar NULL
);
CREATE UNIQUE INDEX order_head_store_id_idx ON public.order_head USING btree (store_id, outlet_id, order_number);


CREATE TABLE public.payment (
	id bigserial NOT NULL,
	store_id int4 NOT NULL,
	outlet_id int4 NOT NULL,
	order_id int4 NOT NULL,
	payment_number varchar NOT NULL,
	vendor varchar NULL,
	amount int4 NOT NULL,
	created timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
	created_by int4 NULL,
	created_by_id varchar NULL
);



CREATE TABLE public.subscriber (
	id bigserial NOT NULL,
	store_id int4 NOT NULL,
	outlet_id int4 NOT NULL,
	feature_id int4 NOT NULL,
	bc_days int4 NOT NULL,
	start_date date NULL,
	end_date date NULL,
	extend_date date NULL,
	extend_days int4 NULL,
	status varchar NOT NULL,
	created timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
	created_by int4 NULL,
	created_by_id varchar NULL,
	last_payment_id int4 NULL,
	last_order_id int4 NULL
);