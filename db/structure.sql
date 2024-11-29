--
-- PostgreSQL database dump
--

-- Dumped from database version 14.13 (Homebrew)
-- Dumped by pg_dump version 14.13 (Homebrew)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: asset_identities; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.asset_identities (
    id bigint NOT NULL,
    uuid uuid,
    make character varying,
    model character varying,
    year integer,
    serial_number character varying,
    vin character varying,
    chassis_id character varying,
    unit_number character varying,
    created_by_user_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: asset_identities_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.asset_identities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: asset_identities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.asset_identities_id_seq OWNED BY public.asset_identities.id;


--
-- Name: assets; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.assets (
    id bigint NOT NULL,
    uuid uuid,
    asset_identity_id bigint,
    business_location_id bigint,
    created_by_user_id bigint,
    updated_by_user_id bigint,
    discarded_at timestamp(6) without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: assets_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.assets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: assets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.assets_id_seq OWNED BY public.assets.id;


--
-- Name: buisnesses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.buisnesses (
    id bigint NOT NULL,
    uuid uuid,
    category character varying,
    name character varying,
    description character varying,
    primary_location_id bigint,
    brand_identifier character varying,
    metadata json,
    created_by_user_id bigint,
    updated_by_user_id bigint,
    discarded_at timestamp(6) without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: buisnesses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.buisnesses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: buisnesses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.buisnesses_id_seq OWNED BY public.buisnesses.id;


--
-- Name: business_locations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.business_locations (
    id bigint NOT NULL,
    uuid uuid,
    business_id bigint,
    location_id bigint,
    created_by_user_id bigint,
    metadata json,
    discarded_at timestamp(6) without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    name character varying
);


--
-- Name: business_locations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.business_locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: business_locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.business_locations_id_seq OWNED BY public.business_locations.id;


--
-- Name: case_activities; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.case_activities (
    id bigint NOT NULL,
    uuid uuid,
    case_id bigint,
    title character varying,
    description character varying,
    category character varying,
    occurred_at timestamp(6) without time zone,
    actor_user_id bigint,
    target_user_id bigint,
    audience_category character varying,
    metadata json,
    created_by_user_id bigint,
    updated_by_user_id bigint,
    discarded_at timestamp(6) without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: case_activities_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.case_activities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: case_activities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.case_activities_id_seq OWNED BY public.case_activities.id;


--
-- Name: case_items; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.case_items (
    id bigint NOT NULL,
    uuid uuid,
    case_id bigint,
    item_order integer,
    title character varying,
    description character varying,
    metadata json,
    code character varying,
    source character varying,
    category character varying,
    quantity numeric(19,4),
    unit_of_measure character varying,
    unit_price numeric(19,4),
    created_by_user_id bigint,
    updated_by_user_id bigint,
    discarded_at timestamp(6) without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: case_items_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.case_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: case_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.case_items_id_seq OWNED BY public.case_items.id;


--
-- Name: case_totals; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.case_totals (
    id bigint NOT NULL,
    uuid uuid,
    case_id bigint,
    total_price numeric(19,4),
    tax_total numeric(19,4),
    labor_total numeric(19,4),
    materials_total numeric(19,4),
    metadata json,
    created_by_user_id bigint,
    updated_by_user_id bigint,
    discarded_at timestamp(6) without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: case_totals_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.case_totals_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: case_totals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.case_totals_id_seq OWNED BY public.case_totals.id;


--
-- Name: cases; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cases (
    id bigint NOT NULL,
    uuid uuid,
    reference_number character varying,
    complaint character varying,
    asset_id bigint,
    service_provider_business_location_id bigint,
    ship_to_customer_id bigint,
    bill_to_customer_id bigint,
    assigned_to_user_id bigint,
    source character varying,
    created_by_user_id bigint,
    updated_by_user_id bigint,
    estimated_complete_at timestamp(6) without time zone,
    actual_completed_at timestamp(6) without time zone,
    next_follow_up_at timestamp(6) without time zone,
    checked_in_at timestamp(6) without time zone,
    discarded_at timestamp(6) without time zone,
    metadata json,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: cases_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cases_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cases_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cases_id_seq OWNED BY public.cases.id;


--
-- Name: customers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.customers (
    id bigint NOT NULL,
    uuid uuid,
    business_location_id bigint,
    display_name character varying,
    description character varying,
    metadata json,
    created_by_user_id bigint,
    updated_by_user_id bigint,
    discarded_at timestamp(6) without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: customers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.customers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.customers_id_seq OWNED BY public.customers.id;


--
-- Name: group_role_assignments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.group_role_assignments (
    id bigint NOT NULL,
    uuid uuid,
    group_id bigint,
    security_role_id bigint,
    created_by_user_id bigint,
    discarded_at timestamp(6) without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: group_role_assignments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.group_role_assignments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: group_role_assignments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.group_role_assignments_id_seq OWNED BY public.group_role_assignments.id;


--
-- Name: groups; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.groups (
    id bigint NOT NULL,
    uuid uuid,
    name character varying,
    category character varying,
    created_by_user_id bigint,
    updated_by_user_id bigint,
    discarded_at timestamp(6) without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: groups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.groups_id_seq OWNED BY public.groups.id;


--
-- Name: locations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.locations (
    id bigint NOT NULL,
    uuid uuid,
    name character varying,
    description character varying,
    address_line_1 character varying,
    address_line_2 character varying,
    address_line_3 character varying,
    city character varying,
    geographical_region character varying,
    country_iso_code character varying,
    timezone character varying,
    culture character varying,
    metadata json,
    created_by_user_id bigint,
    updated_by_user_id character varying,
    discarded_at timestamp(6) without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: locations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.locations_id_seq OWNED BY public.locations.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
-- Name: security_permissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.security_permissions (
    id bigint NOT NULL,
    uuid uuid,
    name character varying,
    created_by_user_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: security_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.security_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: security_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.security_permissions_id_seq OWNED BY public.security_permissions.id;


--
-- Name: security_role_permissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.security_role_permissions (
    id bigint NOT NULL,
    uuid uuid,
    security_role_id bigint,
    security_permission_id bigint,
    created_by_user_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: security_role_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.security_role_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: security_role_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.security_role_permissions_id_seq OWNED BY public.security_role_permissions.id;


--
-- Name: security_roles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.security_roles (
    id bigint NOT NULL,
    uuid uuid,
    name character varying,
    category character varying,
    created_by_user_id bigint,
    updated_by_user_id bigint,
    discarded_at timestamp(6) without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: security_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.security_roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: security_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.security_roles_id_seq OWNED BY public.security_roles.id;


--
-- Name: user_group_memberships; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_group_memberships (
    id bigint NOT NULL,
    uuid uuid,
    user_id bigint,
    group_id bigint,
    created_by_user_id bigint,
    updated_by_user_id bigint,
    discarded_at timestamp(6) without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: user_group_memberships_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.user_group_memberships_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_group_memberships_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.user_group_memberships_id_seq OWNED BY public.user_group_memberships.id;


--
-- Name: user_role_assignments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_role_assignments (
    id bigint NOT NULL,
    uuid uuid,
    user_id bigint,
    security_role_id bigint,
    created_by_user_id bigint,
    discarded_at timestamp(6) without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: user_role_assignments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.user_role_assignments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_role_assignments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.user_role_assignments_id_seq OWNED BY public.user_role_assignments.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    uuid uuid,
    email character varying,
    encrypted_password character varying,
    reset_password_token character varying,
    reset_sent_at timestamp(6) without time zone,
    remember_created_at timestamp(6) without time zone,
    sign_in_count integer,
    current_sign_in_at timestamp(6) without time zone,
    last_sign_in_at timestamp(6) without time zone,
    current_sign_in_ip character varying,
    last_sign_in_ip character varying,
    confirmation_token character varying,
    confirmed_at timestamp(6) without time zone,
    confirmation_sent_at timestamp(6) without time zone,
    unconfirmed_email character varying,
    created_by_user_id bigint,
    updated_by_user_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: asset_identities id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.asset_identities ALTER COLUMN id SET DEFAULT nextval('public.asset_identities_id_seq'::regclass);


--
-- Name: assets id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.assets ALTER COLUMN id SET DEFAULT nextval('public.assets_id_seq'::regclass);


--
-- Name: buisnesses id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.buisnesses ALTER COLUMN id SET DEFAULT nextval('public.buisnesses_id_seq'::regclass);


--
-- Name: business_locations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.business_locations ALTER COLUMN id SET DEFAULT nextval('public.business_locations_id_seq'::regclass);


--
-- Name: case_activities id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.case_activities ALTER COLUMN id SET DEFAULT nextval('public.case_activities_id_seq'::regclass);


--
-- Name: case_items id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.case_items ALTER COLUMN id SET DEFAULT nextval('public.case_items_id_seq'::regclass);


--
-- Name: case_totals id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.case_totals ALTER COLUMN id SET DEFAULT nextval('public.case_totals_id_seq'::regclass);


--
-- Name: cases id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cases ALTER COLUMN id SET DEFAULT nextval('public.cases_id_seq'::regclass);


--
-- Name: customers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers ALTER COLUMN id SET DEFAULT nextval('public.customers_id_seq'::regclass);


--
-- Name: group_role_assignments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.group_role_assignments ALTER COLUMN id SET DEFAULT nextval('public.group_role_assignments_id_seq'::regclass);


--
-- Name: groups id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.groups ALTER COLUMN id SET DEFAULT nextval('public.groups_id_seq'::regclass);


--
-- Name: locations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.locations ALTER COLUMN id SET DEFAULT nextval('public.locations_id_seq'::regclass);


--
-- Name: security_permissions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.security_permissions ALTER COLUMN id SET DEFAULT nextval('public.security_permissions_id_seq'::regclass);


--
-- Name: security_role_permissions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.security_role_permissions ALTER COLUMN id SET DEFAULT nextval('public.security_role_permissions_id_seq'::regclass);


--
-- Name: security_roles id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.security_roles ALTER COLUMN id SET DEFAULT nextval('public.security_roles_id_seq'::regclass);


--
-- Name: user_group_memberships id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_group_memberships ALTER COLUMN id SET DEFAULT nextval('public.user_group_memberships_id_seq'::regclass);


--
-- Name: user_role_assignments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_role_assignments ALTER COLUMN id SET DEFAULT nextval('public.user_role_assignments_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: asset_identities asset_identities_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.asset_identities
    ADD CONSTRAINT asset_identities_pkey PRIMARY KEY (id);


--
-- Name: assets assets_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.assets
    ADD CONSTRAINT assets_pkey PRIMARY KEY (id);


--
-- Name: buisnesses buisnesses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.buisnesses
    ADD CONSTRAINT buisnesses_pkey PRIMARY KEY (id);


--
-- Name: business_locations business_locations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.business_locations
    ADD CONSTRAINT business_locations_pkey PRIMARY KEY (id);


--
-- Name: case_activities case_activities_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.case_activities
    ADD CONSTRAINT case_activities_pkey PRIMARY KEY (id);


--
-- Name: case_items case_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.case_items
    ADD CONSTRAINT case_items_pkey PRIMARY KEY (id);


--
-- Name: case_totals case_totals_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.case_totals
    ADD CONSTRAINT case_totals_pkey PRIMARY KEY (id);


--
-- Name: cases cases_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cases
    ADD CONSTRAINT cases_pkey PRIMARY KEY (id);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- Name: group_role_assignments group_role_assignments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.group_role_assignments
    ADD CONSTRAINT group_role_assignments_pkey PRIMARY KEY (id);


--
-- Name: groups groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);


--
-- Name: locations locations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: security_permissions security_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.security_permissions
    ADD CONSTRAINT security_permissions_pkey PRIMARY KEY (id);


--
-- Name: security_role_permissions security_role_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.security_role_permissions
    ADD CONSTRAINT security_role_permissions_pkey PRIMARY KEY (id);


--
-- Name: security_roles security_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.security_roles
    ADD CONSTRAINT security_roles_pkey PRIMARY KEY (id);


--
-- Name: user_group_memberships user_group_memberships_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_group_memberships
    ADD CONSTRAINT user_group_memberships_pkey PRIMARY KEY (id);


--
-- Name: user_role_assignments user_role_assignments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_role_assignments
    ADD CONSTRAINT user_role_assignments_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_asset_identities_on_created_by_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_asset_identities_on_created_by_user_id ON public.asset_identities USING btree (created_by_user_id);


--
-- Name: index_asset_identities_on_uuid; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_asset_identities_on_uuid ON public.asset_identities USING btree (uuid);


--
-- Name: index_assets_on_asset_identity_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_assets_on_asset_identity_id ON public.assets USING btree (asset_identity_id);


--
-- Name: index_assets_on_business_location_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_assets_on_business_location_id ON public.assets USING btree (business_location_id);


--
-- Name: index_assets_on_created_by_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_assets_on_created_by_user_id ON public.assets USING btree (created_by_user_id);


--
-- Name: index_assets_on_updated_by_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_assets_on_updated_by_user_id ON public.assets USING btree (updated_by_user_id);


--
-- Name: index_assets_on_uuid; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_assets_on_uuid ON public.assets USING btree (uuid);


--
-- Name: index_buisnesses_on_category; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_buisnesses_on_category ON public.buisnesses USING btree (category);


--
-- Name: index_buisnesses_on_created_by_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_buisnesses_on_created_by_user_id ON public.buisnesses USING btree (created_by_user_id);


--
-- Name: index_buisnesses_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_buisnesses_on_name ON public.buisnesses USING btree (name);


--
-- Name: index_buisnesses_on_updated_by_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_buisnesses_on_updated_by_user_id ON public.buisnesses USING btree (updated_by_user_id);


--
-- Name: index_buisnesses_on_uuid; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_buisnesses_on_uuid ON public.buisnesses USING btree (uuid);


--
-- Name: index_business_locations_on_business_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_business_locations_on_business_id ON public.business_locations USING btree (business_id);


--
-- Name: index_business_locations_on_created_by_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_business_locations_on_created_by_user_id ON public.business_locations USING btree (created_by_user_id);


--
-- Name: index_business_locations_on_location_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_business_locations_on_location_id ON public.business_locations USING btree (location_id);


--
-- Name: index_business_locations_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_business_locations_on_name ON public.business_locations USING btree (name);


--
-- Name: index_business_locations_on_uuid; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_business_locations_on_uuid ON public.business_locations USING btree (uuid);


--
-- Name: index_case_activities_on_actor_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_case_activities_on_actor_user_id ON public.case_activities USING btree (actor_user_id);


--
-- Name: index_case_activities_on_case_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_case_activities_on_case_id ON public.case_activities USING btree (case_id);


--
-- Name: index_case_activities_on_category; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_case_activities_on_category ON public.case_activities USING btree (category);


--
-- Name: index_case_activities_on_created_by_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_case_activities_on_created_by_user_id ON public.case_activities USING btree (created_by_user_id);


--
-- Name: index_case_activities_on_occurred_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_case_activities_on_occurred_at ON public.case_activities USING btree (occurred_at);


--
-- Name: index_case_activities_on_target_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_case_activities_on_target_user_id ON public.case_activities USING btree (target_user_id);


--
-- Name: index_case_activities_on_updated_by_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_case_activities_on_updated_by_user_id ON public.case_activities USING btree (updated_by_user_id);


--
-- Name: index_case_activities_on_uuid; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_case_activities_on_uuid ON public.case_activities USING btree (uuid);


--
-- Name: index_case_items_on_case_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_case_items_on_case_id ON public.case_items USING btree (case_id);


--
-- Name: index_case_items_on_created_by_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_case_items_on_created_by_user_id ON public.case_items USING btree (created_by_user_id);


--
-- Name: index_case_items_on_updated_by_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_case_items_on_updated_by_user_id ON public.case_items USING btree (updated_by_user_id);


--
-- Name: index_case_items_on_uuid; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_case_items_on_uuid ON public.case_items USING btree (uuid);


--
-- Name: index_case_totals_on_case_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_case_totals_on_case_id ON public.case_totals USING btree (case_id);


--
-- Name: index_case_totals_on_created_by_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_case_totals_on_created_by_user_id ON public.case_totals USING btree (created_by_user_id);


--
-- Name: index_case_totals_on_updated_by_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_case_totals_on_updated_by_user_id ON public.case_totals USING btree (updated_by_user_id);


--
-- Name: index_case_totals_on_uuid; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_case_totals_on_uuid ON public.case_totals USING btree (uuid);


--
-- Name: index_cases_on_asset_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_cases_on_asset_id ON public.cases USING btree (asset_id);


--
-- Name: index_cases_on_assigned_to_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_cases_on_assigned_to_user_id ON public.cases USING btree (assigned_to_user_id);


--
-- Name: index_cases_on_bill_to_customer_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_cases_on_bill_to_customer_id ON public.cases USING btree (bill_to_customer_id);


--
-- Name: index_cases_on_created_by_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_cases_on_created_by_user_id ON public.cases USING btree (created_by_user_id);


--
-- Name: index_cases_on_next_follow_up_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_cases_on_next_follow_up_at ON public.cases USING btree (next_follow_up_at);


--
-- Name: index_cases_on_reference_number; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_cases_on_reference_number ON public.cases USING btree (reference_number);


--
-- Name: index_cases_on_service_provider_business_location_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_cases_on_service_provider_business_location_id ON public.cases USING btree (service_provider_business_location_id);


--
-- Name: index_cases_on_ship_to_customer_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_cases_on_ship_to_customer_id ON public.cases USING btree (ship_to_customer_id);


--
-- Name: index_cases_on_source; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_cases_on_source ON public.cases USING btree (source);


--
-- Name: index_cases_on_updated_by_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_cases_on_updated_by_user_id ON public.cases USING btree (updated_by_user_id);


--
-- Name: index_cases_on_uuid; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_cases_on_uuid ON public.cases USING btree (uuid);


--
-- Name: index_customers_on_business_location_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_customers_on_business_location_id ON public.customers USING btree (business_location_id);


--
-- Name: index_customers_on_created_by_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_customers_on_created_by_user_id ON public.customers USING btree (created_by_user_id);


--
-- Name: index_customers_on_display_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_customers_on_display_name ON public.customers USING btree (display_name);


--
-- Name: index_customers_on_updated_by_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_customers_on_updated_by_user_id ON public.customers USING btree (updated_by_user_id);


--
-- Name: index_customers_on_uuid; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_customers_on_uuid ON public.customers USING btree (uuid);


--
-- Name: index_group_role_assignments_on_created_by_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_group_role_assignments_on_created_by_user_id ON public.group_role_assignments USING btree (created_by_user_id);


--
-- Name: index_group_role_assignments_on_group_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_group_role_assignments_on_group_id ON public.group_role_assignments USING btree (group_id);


--
-- Name: index_group_role_assignments_on_security_role_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_group_role_assignments_on_security_role_id ON public.group_role_assignments USING btree (security_role_id);


--
-- Name: index_group_role_assignments_on_uuid; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_group_role_assignments_on_uuid ON public.group_role_assignments USING btree (uuid);


--
-- Name: index_groups_on_category; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_groups_on_category ON public.groups USING btree (category);


--
-- Name: index_groups_on_created_by_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_groups_on_created_by_user_id ON public.groups USING btree (created_by_user_id);


--
-- Name: index_groups_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_groups_on_name ON public.groups USING btree (name);


--
-- Name: index_groups_on_updated_by_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_groups_on_updated_by_user_id ON public.groups USING btree (updated_by_user_id);


--
-- Name: index_groups_on_uuid; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_groups_on_uuid ON public.groups USING btree (uuid);


--
-- Name: index_locations_on_created_by_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_locations_on_created_by_user_id ON public.locations USING btree (created_by_user_id);


--
-- Name: index_locations_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_locations_on_name ON public.locations USING btree (name);


--
-- Name: index_locations_on_updated_by_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_locations_on_updated_by_user_id ON public.locations USING btree (updated_by_user_id);


--
-- Name: index_locations_on_uuid; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_locations_on_uuid ON public.locations USING btree (uuid);


--
-- Name: index_security_permissions_on_created_by_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_security_permissions_on_created_by_user_id ON public.security_permissions USING btree (created_by_user_id);


--
-- Name: index_security_permissions_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_security_permissions_on_name ON public.security_permissions USING btree (name);


--
-- Name: index_security_permissions_on_uuid; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_security_permissions_on_uuid ON public.security_permissions USING btree (uuid);


--
-- Name: index_security_role_permissions_on_created_by_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_security_role_permissions_on_created_by_user_id ON public.security_role_permissions USING btree (created_by_user_id);


--
-- Name: index_security_role_permissions_on_security_permission_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_security_role_permissions_on_security_permission_id ON public.security_role_permissions USING btree (security_permission_id);


--
-- Name: index_security_role_permissions_on_security_role_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_security_role_permissions_on_security_role_id ON public.security_role_permissions USING btree (security_role_id);


--
-- Name: index_security_role_permissions_on_uuid; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_security_role_permissions_on_uuid ON public.security_role_permissions USING btree (uuid);


--
-- Name: index_security_roles_on_category; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_security_roles_on_category ON public.security_roles USING btree (category);


--
-- Name: index_security_roles_on_created_by_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_security_roles_on_created_by_user_id ON public.security_roles USING btree (created_by_user_id);


--
-- Name: index_security_roles_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_security_roles_on_name ON public.security_roles USING btree (name);


--
-- Name: index_security_roles_on_updated_by_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_security_roles_on_updated_by_user_id ON public.security_roles USING btree (updated_by_user_id);


--
-- Name: index_security_roles_on_uuid; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_security_roles_on_uuid ON public.security_roles USING btree (uuid);


--
-- Name: index_user_group_memberships_on_created_by_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_user_group_memberships_on_created_by_user_id ON public.user_group_memberships USING btree (created_by_user_id);


--
-- Name: index_user_group_memberships_on_group_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_user_group_memberships_on_group_id ON public.user_group_memberships USING btree (group_id);


--
-- Name: index_user_group_memberships_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_user_group_memberships_on_user_id ON public.user_group_memberships USING btree (user_id);


--
-- Name: index_user_group_memberships_on_uuid; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_user_group_memberships_on_uuid ON public.user_group_memberships USING btree (uuid);


--
-- Name: index_user_role_assignments_on_created_by_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_user_role_assignments_on_created_by_user_id ON public.user_role_assignments USING btree (created_by_user_id);


--
-- Name: index_user_role_assignments_on_security_role_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_user_role_assignments_on_security_role_id ON public.user_role_assignments USING btree (security_role_id);


--
-- Name: index_user_role_assignments_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_user_role_assignments_on_user_id ON public.user_role_assignments USING btree (user_id);


--
-- Name: index_user_role_assignments_on_uuid; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_user_role_assignments_on_uuid ON public.user_role_assignments USING btree (uuid);


--
-- Name: index_users_on_created_by_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_users_on_created_by_user_id ON public.users USING btree (created_by_user_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_updated_by_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_users_on_updated_by_user_id ON public.users USING btree (updated_by_user_id);


--
-- Name: index_users_on_uuid; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_users_on_uuid ON public.users USING btree (uuid);


--
-- PostgreSQL database dump complete
--

