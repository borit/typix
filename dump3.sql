--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: spree_activators; Type: TABLE; Schema: public; Owner: alain; Tablespace: 
--

CREATE TABLE spree_activators (
    id integer NOT NULL,
    description character varying(255),
    expires_at timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    starts_at timestamp without time zone,
    name character varying(255),
    event_name character varying(255),
    type character varying(255),
    usage_limit integer,
    match_policy character varying(255) DEFAULT 'all'::character varying,
    code character varying(255),
    advertise boolean DEFAULT false,
    path character varying(255)
);


ALTER TABLE public.spree_activators OWNER TO alain;

--
-- Name: activators_id_seq; Type: SEQUENCE; Schema: public; Owner: alain
--

CREATE SEQUENCE activators_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.activators_id_seq OWNER TO alain;

--
-- Name: activators_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alain
--

ALTER SEQUENCE activators_id_seq OWNED BY spree_activators.id;


--
-- Name: spree_addresses; Type: TABLE; Schema: public; Owner: alain; Tablespace: 
--

CREATE TABLE spree_addresses (
    id integer NOT NULL,
    firstname character varying(255),
    lastname character varying(255),
    address1 character varying(255),
    address2 character varying(255),
    city character varying(255),
    zipcode character varying(255),
    phone character varying(255),
    state_name character varying(255),
    alternative_phone character varying(255),
    state_id integer,
    country_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    company character varying(255)
);


ALTER TABLE public.spree_addresses OWNER TO alain;

--
-- Name: addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: alain
--

CREATE SEQUENCE addresses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.addresses_id_seq OWNER TO alain;

--
-- Name: addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alain
--

ALTER SEQUENCE addresses_id_seq OWNED BY spree_addresses.id;


--
-- Name: spree_adjustments; Type: TABLE; Schema: public; Owner: alain; Tablespace: 
--

CREATE TABLE spree_adjustments (
    id integer NOT NULL,
    source_id integer,
    amount numeric(8,2) DEFAULT NULL::numeric,
    label character varying(255),
    source_type character varying(255),
    adjustable_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    mandatory boolean,
    locked boolean,
    originator_id integer,
    originator_type character varying(255),
    eligible boolean DEFAULT true,
    adjustable_type character varying(255)
);


ALTER TABLE public.spree_adjustments OWNER TO alain;

--
-- Name: adjustments_id_seq; Type: SEQUENCE; Schema: public; Owner: alain
--

CREATE SEQUENCE adjustments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.adjustments_id_seq OWNER TO alain;

--
-- Name: adjustments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alain
--

ALTER SEQUENCE adjustments_id_seq OWNED BY spree_adjustments.id;


--
-- Name: spree_assets; Type: TABLE; Schema: public; Owner: alain; Tablespace: 
--

CREATE TABLE spree_assets (
    id integer NOT NULL,
    viewable_id integer,
    attachment_width integer,
    attachment_height integer,
    attachment_file_size integer,
    "position" integer,
    viewable_type character varying(50),
    attachment_content_type character varying(255),
    attachment_file_name character varying(255),
    type character varying(75),
    attachment_updated_at timestamp without time zone,
    alt text
);


ALTER TABLE public.spree_assets OWNER TO alain;

--
-- Name: assets_id_seq; Type: SEQUENCE; Schema: public; Owner: alain
--

CREATE SEQUENCE assets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.assets_id_seq OWNER TO alain;

--
-- Name: assets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alain
--

ALTER SEQUENCE assets_id_seq OWNED BY spree_assets.id;


--
-- Name: spree_calculators; Type: TABLE; Schema: public; Owner: alain; Tablespace: 
--

CREATE TABLE spree_calculators (
    id integer NOT NULL,
    type character varying(255),
    calculable_id integer NOT NULL,
    calculable_type character varying(255) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.spree_calculators OWNER TO alain;

--
-- Name: calculators_id_seq; Type: SEQUENCE; Schema: public; Owner: alain
--

CREATE SEQUENCE calculators_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.calculators_id_seq OWNER TO alain;

--
-- Name: calculators_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alain
--

ALTER SEQUENCE calculators_id_seq OWNED BY spree_calculators.id;


--
-- Name: spree_configurations; Type: TABLE; Schema: public; Owner: alain; Tablespace: 
--

CREATE TABLE spree_configurations (
    id integer NOT NULL,
    name character varying(255),
    type character varying(50),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.spree_configurations OWNER TO alain;

--
-- Name: configurations_id_seq; Type: SEQUENCE; Schema: public; Owner: alain
--

CREATE SEQUENCE configurations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.configurations_id_seq OWNER TO alain;

--
-- Name: configurations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alain
--

ALTER SEQUENCE configurations_id_seq OWNED BY spree_configurations.id;


--
-- Name: spree_countries; Type: TABLE; Schema: public; Owner: alain; Tablespace: 
--

CREATE TABLE spree_countries (
    id integer NOT NULL,
    iso_name character varying(255),
    iso character varying(255),
    iso3 character varying(255),
    name character varying(255),
    numcode integer
);


ALTER TABLE public.spree_countries OWNER TO alain;

--
-- Name: countries_id_seq; Type: SEQUENCE; Schema: public; Owner: alain
--

CREATE SEQUENCE countries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.countries_id_seq OWNER TO alain;

--
-- Name: countries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alain
--

ALTER SEQUENCE countries_id_seq OWNED BY spree_countries.id;


--
-- Name: spree_credit_cards; Type: TABLE; Schema: public; Owner: alain; Tablespace: 
--

CREATE TABLE spree_credit_cards (
    id integer NOT NULL,
    month character varying(255),
    year character varying(255),
    cc_type character varying(255),
    last_digits character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    start_month character varying(255),
    start_year character varying(255),
    issue_number character varying(255),
    address_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    gateway_customer_profile_id character varying(255),
    gateway_payment_profile_id character varying(255)
);


ALTER TABLE public.spree_credit_cards OWNER TO alain;

--
-- Name: creditcards_id_seq; Type: SEQUENCE; Schema: public; Owner: alain
--

CREATE SEQUENCE creditcards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.creditcards_id_seq OWNER TO alain;

--
-- Name: creditcards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alain
--

ALTER SEQUENCE creditcards_id_seq OWNED BY spree_credit_cards.id;


--
-- Name: spree_gateways; Type: TABLE; Schema: public; Owner: alain; Tablespace: 
--

CREATE TABLE spree_gateways (
    id integer NOT NULL,
    type character varying(255),
    name character varying(255),
    description text,
    active boolean DEFAULT true,
    environment character varying(255) DEFAULT 'development'::character varying,
    server character varying(255) DEFAULT 'test'::character varying,
    test_mode boolean DEFAULT true,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.spree_gateways OWNER TO alain;

--
-- Name: gateways_id_seq; Type: SEQUENCE; Schema: public; Owner: alain
--

CREATE SEQUENCE gateways_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gateways_id_seq OWNER TO alain;

--
-- Name: gateways_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alain
--

ALTER SEQUENCE gateways_id_seq OWNED BY spree_gateways.id;


--
-- Name: spree_inventory_units; Type: TABLE; Schema: public; Owner: alain; Tablespace: 
--

CREATE TABLE spree_inventory_units (
    id integer NOT NULL,
    lock_version integer DEFAULT 0,
    state character varying(255),
    variant_id integer,
    order_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    shipment_id integer,
    return_authorization_id integer
);


ALTER TABLE public.spree_inventory_units OWNER TO alain;

--
-- Name: inventory_units_id_seq; Type: SEQUENCE; Schema: public; Owner: alain
--

CREATE SEQUENCE inventory_units_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.inventory_units_id_seq OWNER TO alain;

--
-- Name: inventory_units_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alain
--

ALTER SEQUENCE inventory_units_id_seq OWNED BY spree_inventory_units.id;


--
-- Name: spree_line_items; Type: TABLE; Schema: public; Owner: alain; Tablespace: 
--

CREATE TABLE spree_line_items (
    id integer NOT NULL,
    order_id integer,
    variant_id integer,
    quantity integer NOT NULL,
    price numeric(8,2) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.spree_line_items OWNER TO alain;

--
-- Name: line_items_id_seq; Type: SEQUENCE; Schema: public; Owner: alain
--

CREATE SEQUENCE line_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.line_items_id_seq OWNER TO alain;

--
-- Name: line_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alain
--

ALTER SEQUENCE line_items_id_seq OWNED BY spree_line_items.id;


--
-- Name: spree_log_entries; Type: TABLE; Schema: public; Owner: alain; Tablespace: 
--

CREATE TABLE spree_log_entries (
    id integer NOT NULL,
    source_id integer,
    source_type character varying(255),
    details text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.spree_log_entries OWNER TO alain;

--
-- Name: log_entries_id_seq; Type: SEQUENCE; Schema: public; Owner: alain
--

CREATE SEQUENCE log_entries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.log_entries_id_seq OWNER TO alain;

--
-- Name: log_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alain
--

ALTER SEQUENCE log_entries_id_seq OWNED BY spree_log_entries.id;


--
-- Name: spree_mail_methods; Type: TABLE; Schema: public; Owner: alain; Tablespace: 
--

CREATE TABLE spree_mail_methods (
    id integer NOT NULL,
    environment character varying(255),
    active boolean DEFAULT true,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.spree_mail_methods OWNER TO alain;

--
-- Name: mail_methods_id_seq; Type: SEQUENCE; Schema: public; Owner: alain
--

CREATE SEQUENCE mail_methods_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mail_methods_id_seq OWNER TO alain;

--
-- Name: mail_methods_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alain
--

ALTER SEQUENCE mail_methods_id_seq OWNED BY spree_mail_methods.id;


--
-- Name: spree_option_types; Type: TABLE; Schema: public; Owner: alain; Tablespace: 
--

CREATE TABLE spree_option_types (
    id integer NOT NULL,
    name character varying(100),
    presentation character varying(100),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    "position" integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.spree_option_types OWNER TO alain;

--
-- Name: option_types_id_seq; Type: SEQUENCE; Schema: public; Owner: alain
--

CREATE SEQUENCE option_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.option_types_id_seq OWNER TO alain;

--
-- Name: option_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alain
--

ALTER SEQUENCE option_types_id_seq OWNED BY spree_option_types.id;


--
-- Name: spree_option_values; Type: TABLE; Schema: public; Owner: alain; Tablespace: 
--

CREATE TABLE spree_option_values (
    id integer NOT NULL,
    "position" integer,
    name character varying(255),
    presentation character varying(255),
    option_type_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.spree_option_values OWNER TO alain;

--
-- Name: option_values_id_seq; Type: SEQUENCE; Schema: public; Owner: alain
--

CREATE SEQUENCE option_values_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.option_values_id_seq OWNER TO alain;

--
-- Name: option_values_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alain
--

ALTER SEQUENCE option_values_id_seq OWNED BY spree_option_values.id;


--
-- Name: spree_orders; Type: TABLE; Schema: public; Owner: alain; Tablespace: 
--

CREATE TABLE spree_orders (
    id integer NOT NULL,
    number character varying(15),
    item_total numeric(8,2) DEFAULT 0.0 NOT NULL,
    total numeric(8,2) DEFAULT 0.0 NOT NULL,
    state character varying(255),
    adjustment_total numeric(8,2) DEFAULT 0.0 NOT NULL,
    user_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    completed_at timestamp without time zone,
    bill_address_id integer,
    ship_address_id integer,
    payment_total numeric(8,2) DEFAULT 0.0,
    shipping_method_id integer,
    shipment_state character varying(255),
    payment_state character varying(255),
    email character varying(255),
    special_instructions text
);


ALTER TABLE public.spree_orders OWNER TO alain;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: alain
--

CREATE SEQUENCE orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO alain;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alain
--

ALTER SEQUENCE orders_id_seq OWNED BY spree_orders.id;


--
-- Name: spree_payment_methods; Type: TABLE; Schema: public; Owner: alain; Tablespace: 
--

CREATE TABLE spree_payment_methods (
    id integer NOT NULL,
    type character varying(255),
    name character varying(255),
    description text,
    active boolean DEFAULT true,
    environment character varying(255) DEFAULT 'development'::character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    deleted_at timestamp without time zone,
    display_on character varying(255) DEFAULT NULL::character varying
);


ALTER TABLE public.spree_payment_methods OWNER TO alain;

--
-- Name: payment_methods_id_seq; Type: SEQUENCE; Schema: public; Owner: alain
--

CREATE SEQUENCE payment_methods_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payment_methods_id_seq OWNER TO alain;

--
-- Name: payment_methods_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alain
--

ALTER SEQUENCE payment_methods_id_seq OWNED BY spree_payment_methods.id;


--
-- Name: spree_payments; Type: TABLE; Schema: public; Owner: alain; Tablespace: 
--

CREATE TABLE spree_payments (
    id integer NOT NULL,
    amount numeric(8,2) DEFAULT 0.0 NOT NULL,
    order_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    source_id integer,
    source_type character varying(255),
    payment_method_id integer,
    state character varying(255),
    response_code character varying(255),
    avs_response character varying(255)
);


ALTER TABLE public.spree_payments OWNER TO alain;

--
-- Name: payments_id_seq; Type: SEQUENCE; Schema: public; Owner: alain
--

CREATE SEQUENCE payments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payments_id_seq OWNER TO alain;

--
-- Name: payments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alain
--

ALTER SEQUENCE payments_id_seq OWNED BY spree_payments.id;


--
-- Name: spree_preferences; Type: TABLE; Schema: public; Owner: alain; Tablespace: 
--

CREATE TABLE spree_preferences (
    id integer NOT NULL,
    name character varying(255),
    owner_id integer,
    owner_type character varying(255),
    value text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    key character varying(255),
    value_type character varying(255)
);


ALTER TABLE public.spree_preferences OWNER TO alain;

--
-- Name: preferences_id_seq; Type: SEQUENCE; Schema: public; Owner: alain
--

CREATE SEQUENCE preferences_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.preferences_id_seq OWNER TO alain;

--
-- Name: preferences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alain
--

ALTER SEQUENCE preferences_id_seq OWNED BY spree_preferences.id;


--
-- Name: spree_product_option_types; Type: TABLE; Schema: public; Owner: alain; Tablespace: 
--

CREATE TABLE spree_product_option_types (
    id integer NOT NULL,
    "position" integer,
    product_id integer,
    option_type_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.spree_product_option_types OWNER TO alain;

--
-- Name: product_option_types_id_seq; Type: SEQUENCE; Schema: public; Owner: alain
--

CREATE SEQUENCE product_option_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_option_types_id_seq OWNER TO alain;

--
-- Name: product_option_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alain
--

ALTER SEQUENCE product_option_types_id_seq OWNED BY spree_product_option_types.id;


--
-- Name: spree_product_properties; Type: TABLE; Schema: public; Owner: alain; Tablespace: 
--

CREATE TABLE spree_product_properties (
    id integer NOT NULL,
    value character varying(255),
    product_id integer,
    property_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.spree_product_properties OWNER TO alain;

--
-- Name: product_properties_id_seq; Type: SEQUENCE; Schema: public; Owner: alain
--

CREATE SEQUENCE product_properties_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_properties_id_seq OWNER TO alain;

--
-- Name: product_properties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alain
--

ALTER SEQUENCE product_properties_id_seq OWNED BY spree_product_properties.id;


--
-- Name: spree_products; Type: TABLE; Schema: public; Owner: alain; Tablespace: 
--

CREATE TABLE spree_products (
    id integer NOT NULL,
    name character varying(255) DEFAULT ''::character varying NOT NULL,
    description text,
    available_on timestamp without time zone,
    deleted_at timestamp without time zone,
    permalink character varying(255),
    meta_description character varying(255),
    meta_keywords character varying(255),
    tax_category_id integer,
    shipping_category_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    count_on_hand integer DEFAULT 0 NOT NULL,
    is_discovery boolean
);


ALTER TABLE public.spree_products OWNER TO alain;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: alain
--

CREATE SEQUENCE products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_id_seq OWNER TO alain;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alain
--

ALTER SEQUENCE products_id_seq OWNED BY spree_products.id;


--
-- Name: spree_promotion_action_line_items; Type: TABLE; Schema: public; Owner: alain; Tablespace: 
--

CREATE TABLE spree_promotion_action_line_items (
    id integer NOT NULL,
    promotion_action_id integer,
    variant_id integer,
    quantity integer DEFAULT 1
);


ALTER TABLE public.spree_promotion_action_line_items OWNER TO alain;

--
-- Name: promotion_action_line_items_id_seq; Type: SEQUENCE; Schema: public; Owner: alain
--

CREATE SEQUENCE promotion_action_line_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.promotion_action_line_items_id_seq OWNER TO alain;

--
-- Name: promotion_action_line_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alain
--

ALTER SEQUENCE promotion_action_line_items_id_seq OWNED BY spree_promotion_action_line_items.id;


--
-- Name: spree_promotion_actions; Type: TABLE; Schema: public; Owner: alain; Tablespace: 
--

CREATE TABLE spree_promotion_actions (
    id integer NOT NULL,
    activator_id integer,
    "position" integer,
    type character varying(255)
);


ALTER TABLE public.spree_promotion_actions OWNER TO alain;

--
-- Name: promotion_actions_id_seq; Type: SEQUENCE; Schema: public; Owner: alain
--

CREATE SEQUENCE promotion_actions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.promotion_actions_id_seq OWNER TO alain;

--
-- Name: promotion_actions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alain
--

ALTER SEQUENCE promotion_actions_id_seq OWNED BY spree_promotion_actions.id;


--
-- Name: spree_promotion_rules; Type: TABLE; Schema: public; Owner: alain; Tablespace: 
--

CREATE TABLE spree_promotion_rules (
    id integer NOT NULL,
    activator_id integer,
    user_id integer,
    product_group_id integer,
    type character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.spree_promotion_rules OWNER TO alain;

--
-- Name: promotion_rules_id_seq; Type: SEQUENCE; Schema: public; Owner: alain
--

CREATE SEQUENCE promotion_rules_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.promotion_rules_id_seq OWNER TO alain;

--
-- Name: promotion_rules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alain
--

ALTER SEQUENCE promotion_rules_id_seq OWNED BY spree_promotion_rules.id;


--
-- Name: spree_properties; Type: TABLE; Schema: public; Owner: alain; Tablespace: 
--

CREATE TABLE spree_properties (
    id integer NOT NULL,
    name character varying(255),
    presentation character varying(255) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    value_type character varying(255)
);


ALTER TABLE public.spree_properties OWNER TO alain;

--
-- Name: properties_id_seq; Type: SEQUENCE; Schema: public; Owner: alain
--

CREATE SEQUENCE properties_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.properties_id_seq OWNER TO alain;

--
-- Name: properties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alain
--

ALTER SEQUENCE properties_id_seq OWNED BY spree_properties.id;


--
-- Name: spree_prototypes; Type: TABLE; Schema: public; Owner: alain; Tablespace: 
--

CREATE TABLE spree_prototypes (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    taxon_id integer
);


ALTER TABLE public.spree_prototypes OWNER TO alain;

--
-- Name: prototypes_id_seq; Type: SEQUENCE; Schema: public; Owner: alain
--

CREATE SEQUENCE prototypes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.prototypes_id_seq OWNER TO alain;

--
-- Name: prototypes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alain
--

ALTER SEQUENCE prototypes_id_seq OWNED BY spree_prototypes.id;


--
-- Name: spree_return_authorizations; Type: TABLE; Schema: public; Owner: alain; Tablespace: 
--

CREATE TABLE spree_return_authorizations (
    id integer NOT NULL,
    number character varying(255),
    state character varying(255),
    amount numeric(8,2) DEFAULT 0.0 NOT NULL,
    order_id integer,
    reason text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.spree_return_authorizations OWNER TO alain;

--
-- Name: return_authorizations_id_seq; Type: SEQUENCE; Schema: public; Owner: alain
--

CREATE SEQUENCE return_authorizations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.return_authorizations_id_seq OWNER TO alain;

--
-- Name: return_authorizations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alain
--

ALTER SEQUENCE return_authorizations_id_seq OWNED BY spree_return_authorizations.id;


--
-- Name: spree_roles; Type: TABLE; Schema: public; Owner: alain; Tablespace: 
--

CREATE TABLE spree_roles (
    id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE public.spree_roles OWNER TO alain;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: alain
--

CREATE SEQUENCE roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_id_seq OWNER TO alain;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alain
--

ALTER SEQUENCE roles_id_seq OWNED BY spree_roles.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: alain; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO alain;

--
-- Name: spree_shipments; Type: TABLE; Schema: public; Owner: alain; Tablespace: 
--

CREATE TABLE spree_shipments (
    id integer NOT NULL,
    tracking character varying(255),
    number character varying(255),
    cost numeric(8,2),
    shipped_at timestamp without time zone,
    order_id integer,
    shipping_method_id integer,
    address_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    state character varying(255)
);


ALTER TABLE public.spree_shipments OWNER TO alain;

--
-- Name: shipments_id_seq; Type: SEQUENCE; Schema: public; Owner: alain
--

CREATE SEQUENCE shipments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shipments_id_seq OWNER TO alain;

--
-- Name: shipments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alain
--

ALTER SEQUENCE shipments_id_seq OWNED BY spree_shipments.id;


--
-- Name: spree_shipping_categories; Type: TABLE; Schema: public; Owner: alain; Tablespace: 
--

CREATE TABLE spree_shipping_categories (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.spree_shipping_categories OWNER TO alain;

--
-- Name: shipping_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: alain
--

CREATE SEQUENCE shipping_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shipping_categories_id_seq OWNER TO alain;

--
-- Name: shipping_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alain
--

ALTER SEQUENCE shipping_categories_id_seq OWNED BY spree_shipping_categories.id;


--
-- Name: spree_shipping_methods; Type: TABLE; Schema: public; Owner: alain; Tablespace: 
--

CREATE TABLE spree_shipping_methods (
    id integer NOT NULL,
    name character varying(255),
    zone_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    display_on character varying(255) DEFAULT NULL::character varying,
    shipping_category_id integer,
    match_none boolean,
    match_all boolean,
    match_one boolean,
    deleted_at timestamp without time zone
);


ALTER TABLE public.spree_shipping_methods OWNER TO alain;

--
-- Name: shipping_methods_id_seq; Type: SEQUENCE; Schema: public; Owner: alain
--

CREATE SEQUENCE shipping_methods_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shipping_methods_id_seq OWNER TO alain;

--
-- Name: shipping_methods_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alain
--

ALTER SEQUENCE shipping_methods_id_seq OWNED BY spree_shipping_methods.id;


--
-- Name: spree_option_types_prototypes; Type: TABLE; Schema: public; Owner: alain; Tablespace: 
--

CREATE TABLE spree_option_types_prototypes (
    prototype_id integer,
    option_type_id integer
);


ALTER TABLE public.spree_option_types_prototypes OWNER TO alain;

--
-- Name: spree_option_values_variants; Type: TABLE; Schema: public; Owner: alain; Tablespace: 
--

CREATE TABLE spree_option_values_variants (
    variant_id integer,
    option_value_id integer
);


ALTER TABLE public.spree_option_values_variants OWNER TO alain;

--
-- Name: spree_pending_promotions; Type: TABLE; Schema: public; Owner: alain; Tablespace: 
--

CREATE TABLE spree_pending_promotions (
    id integer NOT NULL,
    user_id integer,
    promotion_id integer
);


ALTER TABLE public.spree_pending_promotions OWNER TO alain;

--
-- Name: spree_pending_promotions_id_seq; Type: SEQUENCE; Schema: public; Owner: alain
--

CREATE SEQUENCE spree_pending_promotions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_pending_promotions_id_seq OWNER TO alain;

--
-- Name: spree_pending_promotions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alain
--

ALTER SEQUENCE spree_pending_promotions_id_seq OWNED BY spree_pending_promotions.id;


--
-- Name: spree_products_promotion_rules; Type: TABLE; Schema: public; Owner: alain; Tablespace: 
--

CREATE TABLE spree_products_promotion_rules (
    product_id integer,
    promotion_rule_id integer
);


ALTER TABLE public.spree_products_promotion_rules OWNER TO alain;

--
-- Name: spree_products_taxons; Type: TABLE; Schema: public; Owner: alain; Tablespace: 
--

CREATE TABLE spree_products_taxons (
    product_id integer,
    taxon_id integer
);


ALTER TABLE public.spree_products_taxons OWNER TO alain;

--
-- Name: spree_promotion_rules_users; Type: TABLE; Schema: public; Owner: alain; Tablespace: 
--

CREATE TABLE spree_promotion_rules_users (
    user_id integer,
    promotion_rule_id integer
);


ALTER TABLE public.spree_promotion_rules_users OWNER TO alain;

--
-- Name: spree_properties_prototypes; Type: TABLE; Schema: public; Owner: alain; Tablespace: 
--

CREATE TABLE spree_properties_prototypes (
    prototype_id integer,
    property_id integer
);


ALTER TABLE public.spree_properties_prototypes OWNER TO alain;

--
-- Name: spree_relation_types; Type: TABLE; Schema: public; Owner: alain; Tablespace: 
--

CREATE TABLE spree_relation_types (
    id integer NOT NULL,
    name character varying(255),
    description text,
    applies_to character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.spree_relation_types OWNER TO alain;

--
-- Name: spree_relation_types_id_seq; Type: SEQUENCE; Schema: public; Owner: alain
--

CREATE SEQUENCE spree_relation_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_relation_types_id_seq OWNER TO alain;

--
-- Name: spree_relation_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alain
--

ALTER SEQUENCE spree_relation_types_id_seq OWNED BY spree_relation_types.id;


--
-- Name: spree_relations; Type: TABLE; Schema: public; Owner: alain; Tablespace: 
--

CREATE TABLE spree_relations (
    id integer NOT NULL,
    relation_type_id integer,
    relatable_id integer,
    relatable_type character varying(255),
    related_to_id integer,
    related_to_type character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    discount_amount numeric(8,2) DEFAULT 0.0
);


ALTER TABLE public.spree_relations OWNER TO alain;

--
-- Name: spree_relations_id_seq; Type: SEQUENCE; Schema: public; Owner: alain
--

CREATE SEQUENCE spree_relations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_relations_id_seq OWNER TO alain;

--
-- Name: spree_relations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alain
--

ALTER SEQUENCE spree_relations_id_seq OWNED BY spree_relations.id;


--
-- Name: spree_roles_users; Type: TABLE; Schema: public; Owner: alain; Tablespace: 
--

CREATE TABLE spree_roles_users (
    role_id integer,
    user_id integer
);


ALTER TABLE public.spree_roles_users OWNER TO alain;

--
-- Name: spree_skrill_transactions; Type: TABLE; Schema: public; Owner: alain; Tablespace: 
--

CREATE TABLE spree_skrill_transactions (
    id integer NOT NULL,
    email character varying(255),
    amount double precision,
    currency character varying(255),
    transaction_id integer,
    customer_id integer,
    payment_type character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.spree_skrill_transactions OWNER TO alain;

--
-- Name: spree_skrill_transactions_id_seq; Type: SEQUENCE; Schema: public; Owner: alain
--

CREATE SEQUENCE spree_skrill_transactions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_skrill_transactions_id_seq OWNER TO alain;

--
-- Name: spree_skrill_transactions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alain
--

ALTER SEQUENCE spree_skrill_transactions_id_seq OWNED BY spree_skrill_transactions.id;


--
-- Name: spree_state_changes; Type: TABLE; Schema: public; Owner: alain; Tablespace: 
--

CREATE TABLE spree_state_changes (
    id integer NOT NULL,
    name character varying(255),
    previous_state character varying(255),
    stateful_id integer,
    user_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    stateful_type character varying(255),
    next_state character varying(255)
);


ALTER TABLE public.spree_state_changes OWNER TO alain;

--
-- Name: spree_states; Type: TABLE; Schema: public; Owner: alain; Tablespace: 
--

CREATE TABLE spree_states (
    id integer NOT NULL,
    name character varying(255),
    abbr character varying(255),
    country_id integer
);


ALTER TABLE public.spree_states OWNER TO alain;

--
-- Name: spree_tax_categories; Type: TABLE; Schema: public; Owner: alain; Tablespace: 
--

CREATE TABLE spree_tax_categories (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    is_default boolean DEFAULT false,
    deleted_at timestamp without time zone
);


ALTER TABLE public.spree_tax_categories OWNER TO alain;

--
-- Name: spree_tax_rates; Type: TABLE; Schema: public; Owner: alain; Tablespace: 
--

CREATE TABLE spree_tax_rates (
    id integer NOT NULL,
    amount numeric(8,5),
    zone_id integer,
    tax_category_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    included_in_price boolean DEFAULT false
);


ALTER TABLE public.spree_tax_rates OWNER TO alain;

--
-- Name: spree_taxonomies; Type: TABLE; Schema: public; Owner: alain; Tablespace: 
--

CREATE TABLE spree_taxonomies (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.spree_taxonomies OWNER TO alain;

--
-- Name: spree_taxons; Type: TABLE; Schema: public; Owner: alain; Tablespace: 
--

CREATE TABLE spree_taxons (
    id integer NOT NULL,
    parent_id integer,
    "position" integer DEFAULT 0,
    name character varying(255) NOT NULL,
    permalink character varying(255),
    taxonomy_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    lft integer,
    rgt integer,
    icon_file_name character varying(255),
    icon_content_type character varying(255),
    icon_file_size integer,
    icon_updated_at timestamp without time zone,
    description text
);


ALTER TABLE public.spree_taxons OWNER TO alain;

--
-- Name: spree_tokenized_permissions; Type: TABLE; Schema: public; Owner: alain; Tablespace: 
--

CREATE TABLE spree_tokenized_permissions (
    id integer NOT NULL,
    permissable_id integer,
    permissable_type character varying(255),
    token character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.spree_tokenized_permissions OWNER TO alain;

--
-- Name: spree_trackers; Type: TABLE; Schema: public; Owner: alain; Tablespace: 
--

CREATE TABLE spree_trackers (
    id integer NOT NULL,
    environment character varying(255),
    analytics_id character varying(255),
    active boolean DEFAULT true,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.spree_trackers OWNER TO alain;

--
-- Name: spree_users; Type: TABLE; Schema: public; Owner: alain; Tablespace: 
--

CREATE TABLE spree_users (
    id integer NOT NULL,
    encrypted_password character varying(255) DEFAULT NULL::character varying,
    password_salt character varying(255) DEFAULT NULL::character varying,
    email character varying(255),
    remember_token character varying(255),
    persistence_token character varying(255),
    reset_password_token character varying(255),
    perishable_token character varying(255),
    sign_in_count integer DEFAULT 0 NOT NULL,
    failed_attempts integer DEFAULT 0 NOT NULL,
    last_request_at timestamp without time zone,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying(255),
    last_sign_in_ip character varying(255),
    login character varying(255) DEFAULT NULL::character varying,
    ship_address_id integer,
    bill_address_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    authentication_token character varying(255),
    unlock_token character varying(255),
    locked_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    reset_password_sent_at timestamp without time zone,
    api_key character varying(48)
);


ALTER TABLE public.spree_users OWNER TO alain;

--
-- Name: spree_variants; Type: TABLE; Schema: public; Owner: alain; Tablespace: 
--

CREATE TABLE spree_variants (
    id integer NOT NULL,
    sku character varying(255) DEFAULT ''::character varying NOT NULL,
    price numeric(8,2) NOT NULL,
    weight numeric(8,2),
    height numeric(8,2),
    width numeric(8,2),
    depth numeric(8,2),
    deleted_at timestamp without time zone,
    is_master boolean DEFAULT false,
    product_id integer,
    count_on_hand integer DEFAULT 0 NOT NULL,
    cost_price numeric(8,2) DEFAULT NULL::numeric,
    "position" integer,
    reduction integer
);


ALTER TABLE public.spree_variants OWNER TO alain;

--
-- Name: spree_zone_members; Type: TABLE; Schema: public; Owner: alain; Tablespace: 
--

CREATE TABLE spree_zone_members (
    id integer NOT NULL,
    zoneable_id integer,
    zoneable_type character varying(255),
    zone_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.spree_zone_members OWNER TO alain;

--
-- Name: spree_zones; Type: TABLE; Schema: public; Owner: alain; Tablespace: 
--

CREATE TABLE spree_zones (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    default_tax boolean DEFAULT false,
    zone_members_count integer DEFAULT 0
);


ALTER TABLE public.spree_zones OWNER TO alain;

--
-- Name: state_events_id_seq; Type: SEQUENCE; Schema: public; Owner: alain
--

CREATE SEQUENCE state_events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.state_events_id_seq OWNER TO alain;

--
-- Name: state_events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alain
--

ALTER SEQUENCE state_events_id_seq OWNED BY spree_state_changes.id;


--
-- Name: states_id_seq; Type: SEQUENCE; Schema: public; Owner: alain
--

CREATE SEQUENCE states_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.states_id_seq OWNER TO alain;

--
-- Name: states_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alain
--

ALTER SEQUENCE states_id_seq OWNED BY spree_states.id;


--
-- Name: tax_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: alain
--

CREATE SEQUENCE tax_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tax_categories_id_seq OWNER TO alain;

--
-- Name: tax_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alain
--

ALTER SEQUENCE tax_categories_id_seq OWNED BY spree_tax_categories.id;


--
-- Name: tax_rates_id_seq; Type: SEQUENCE; Schema: public; Owner: alain
--

CREATE SEQUENCE tax_rates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tax_rates_id_seq OWNER TO alain;

--
-- Name: tax_rates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alain
--

ALTER SEQUENCE tax_rates_id_seq OWNED BY spree_tax_rates.id;


--
-- Name: taxonomies_id_seq; Type: SEQUENCE; Schema: public; Owner: alain
--

CREATE SEQUENCE taxonomies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.taxonomies_id_seq OWNER TO alain;

--
-- Name: taxonomies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alain
--

ALTER SEQUENCE taxonomies_id_seq OWNED BY spree_taxonomies.id;


--
-- Name: taxons_id_seq; Type: SEQUENCE; Schema: public; Owner: alain
--

CREATE SEQUENCE taxons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.taxons_id_seq OWNER TO alain;

--
-- Name: taxons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alain
--

ALTER SEQUENCE taxons_id_seq OWNED BY spree_taxons.id;


--
-- Name: tokenized_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: alain
--

CREATE SEQUENCE tokenized_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tokenized_permissions_id_seq OWNER TO alain;

--
-- Name: tokenized_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alain
--

ALTER SEQUENCE tokenized_permissions_id_seq OWNED BY spree_tokenized_permissions.id;


--
-- Name: trackers_id_seq; Type: SEQUENCE; Schema: public; Owner: alain
--

CREATE SEQUENCE trackers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.trackers_id_seq OWNER TO alain;

--
-- Name: trackers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alain
--

ALTER SEQUENCE trackers_id_seq OWNED BY spree_trackers.id;


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: alain
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO alain;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alain
--

ALTER SEQUENCE users_id_seq OWNED BY spree_users.id;


--
-- Name: variants_id_seq; Type: SEQUENCE; Schema: public; Owner: alain
--

CREATE SEQUENCE variants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.variants_id_seq OWNER TO alain;

--
-- Name: variants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alain
--

ALTER SEQUENCE variants_id_seq OWNED BY spree_variants.id;


--
-- Name: zone_members_id_seq; Type: SEQUENCE; Schema: public; Owner: alain
--

CREATE SEQUENCE zone_members_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.zone_members_id_seq OWNER TO alain;

--
-- Name: zone_members_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alain
--

ALTER SEQUENCE zone_members_id_seq OWNED BY spree_zone_members.id;


--
-- Name: zones_id_seq; Type: SEQUENCE; Schema: public; Owner: alain
--

CREATE SEQUENCE zones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.zones_id_seq OWNER TO alain;

--
-- Name: zones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alain
--

ALTER SEQUENCE zones_id_seq OWNED BY spree_zones.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: alain
--

ALTER TABLE ONLY spree_activators ALTER COLUMN id SET DEFAULT nextval('activators_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: alain
--

ALTER TABLE ONLY spree_addresses ALTER COLUMN id SET DEFAULT nextval('addresses_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: alain
--

ALTER TABLE ONLY spree_adjustments ALTER COLUMN id SET DEFAULT nextval('adjustments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: alain
--

ALTER TABLE ONLY spree_assets ALTER COLUMN id SET DEFAULT nextval('assets_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: alain
--

ALTER TABLE ONLY spree_calculators ALTER COLUMN id SET DEFAULT nextval('calculators_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: alain
--

ALTER TABLE ONLY spree_configurations ALTER COLUMN id SET DEFAULT nextval('configurations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: alain
--

ALTER TABLE ONLY spree_countries ALTER COLUMN id SET DEFAULT nextval('countries_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: alain
--

ALTER TABLE ONLY spree_credit_cards ALTER COLUMN id SET DEFAULT nextval('creditcards_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: alain
--

ALTER TABLE ONLY spree_gateways ALTER COLUMN id SET DEFAULT nextval('gateways_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: alain
--

ALTER TABLE ONLY spree_inventory_units ALTER COLUMN id SET DEFAULT nextval('inventory_units_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: alain
--

ALTER TABLE ONLY spree_line_items ALTER COLUMN id SET DEFAULT nextval('line_items_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: alain
--

ALTER TABLE ONLY spree_log_entries ALTER COLUMN id SET DEFAULT nextval('log_entries_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: alain
--

ALTER TABLE ONLY spree_mail_methods ALTER COLUMN id SET DEFAULT nextval('mail_methods_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: alain
--

ALTER TABLE ONLY spree_option_types ALTER COLUMN id SET DEFAULT nextval('option_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: alain
--

ALTER TABLE ONLY spree_option_values ALTER COLUMN id SET DEFAULT nextval('option_values_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: alain
--

ALTER TABLE ONLY spree_orders ALTER COLUMN id SET DEFAULT nextval('orders_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: alain
--

ALTER TABLE ONLY spree_payment_methods ALTER COLUMN id SET DEFAULT nextval('payment_methods_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: alain
--

ALTER TABLE ONLY spree_payments ALTER COLUMN id SET DEFAULT nextval('payments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: alain
--

ALTER TABLE ONLY spree_pending_promotions ALTER COLUMN id SET DEFAULT nextval('spree_pending_promotions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: alain
--

ALTER TABLE ONLY spree_preferences ALTER COLUMN id SET DEFAULT nextval('preferences_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: alain
--

ALTER TABLE ONLY spree_product_option_types ALTER COLUMN id SET DEFAULT nextval('product_option_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: alain
--

ALTER TABLE ONLY spree_product_properties ALTER COLUMN id SET DEFAULT nextval('product_properties_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: alain
--

ALTER TABLE ONLY spree_products ALTER COLUMN id SET DEFAULT nextval('products_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: alain
--

ALTER TABLE ONLY spree_promotion_action_line_items ALTER COLUMN id SET DEFAULT nextval('promotion_action_line_items_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: alain
--

ALTER TABLE ONLY spree_promotion_actions ALTER COLUMN id SET DEFAULT nextval('promotion_actions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: alain
--

ALTER TABLE ONLY spree_promotion_rules ALTER COLUMN id SET DEFAULT nextval('promotion_rules_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: alain
--

ALTER TABLE ONLY spree_properties ALTER COLUMN id SET DEFAULT nextval('properties_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: alain
--

ALTER TABLE ONLY spree_prototypes ALTER COLUMN id SET DEFAULT nextval('prototypes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: alain
--

ALTER TABLE ONLY spree_relation_types ALTER COLUMN id SET DEFAULT nextval('spree_relation_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: alain
--

ALTER TABLE ONLY spree_relations ALTER COLUMN id SET DEFAULT nextval('spree_relations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: alain
--

ALTER TABLE ONLY spree_return_authorizations ALTER COLUMN id SET DEFAULT nextval('return_authorizations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: alain
--

ALTER TABLE ONLY spree_roles ALTER COLUMN id SET DEFAULT nextval('roles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: alain
--

ALTER TABLE ONLY spree_shipments ALTER COLUMN id SET DEFAULT nextval('shipments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: alain
--

ALTER TABLE ONLY spree_shipping_categories ALTER COLUMN id SET DEFAULT nextval('shipping_categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: alain
--

ALTER TABLE ONLY spree_shipping_methods ALTER COLUMN id SET DEFAULT nextval('shipping_methods_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: alain
--

ALTER TABLE ONLY spree_skrill_transactions ALTER COLUMN id SET DEFAULT nextval('spree_skrill_transactions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: alain
--

ALTER TABLE ONLY spree_state_changes ALTER COLUMN id SET DEFAULT nextval('state_events_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: alain
--

ALTER TABLE ONLY spree_states ALTER COLUMN id SET DEFAULT nextval('states_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: alain
--

ALTER TABLE ONLY spree_tax_categories ALTER COLUMN id SET DEFAULT nextval('tax_categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: alain
--

ALTER TABLE ONLY spree_tax_rates ALTER COLUMN id SET DEFAULT nextval('tax_rates_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: alain
--

ALTER TABLE ONLY spree_taxonomies ALTER COLUMN id SET DEFAULT nextval('taxonomies_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: alain
--

ALTER TABLE ONLY spree_taxons ALTER COLUMN id SET DEFAULT nextval('taxons_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: alain
--

ALTER TABLE ONLY spree_tokenized_permissions ALTER COLUMN id SET DEFAULT nextval('tokenized_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: alain
--

ALTER TABLE ONLY spree_trackers ALTER COLUMN id SET DEFAULT nextval('trackers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: alain
--

ALTER TABLE ONLY spree_users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: alain
--

ALTER TABLE ONLY spree_variants ALTER COLUMN id SET DEFAULT nextval('variants_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: alain
--

ALTER TABLE ONLY spree_zone_members ALTER COLUMN id SET DEFAULT nextval('zone_members_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: alain
--

ALTER TABLE ONLY spree_zones ALTER COLUMN id SET DEFAULT nextval('zones_id_seq'::regclass);


--
-- Name: activators_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alain
--

SELECT pg_catalog.setval('activators_id_seq', 3, true);


--
-- Name: addresses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alain
--

SELECT pg_catalog.setval('addresses_id_seq', 1072978403, true);


--
-- Name: adjustments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alain
--

SELECT pg_catalog.setval('adjustments_id_seq', 1073043780, true);


--
-- Name: assets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alain
--

SELECT pg_catalog.setval('assets_id_seq', 1061, true);


--
-- Name: calculators_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alain
--

SELECT pg_catalog.setval('calculators_id_seq', 574015649, true);


--
-- Name: configurations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alain
--

SELECT pg_catalog.setval('configurations_id_seq', 1, false);


--
-- Name: countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alain
--

SELECT pg_catalog.setval('countries_id_seq', 227, false);


--
-- Name: creditcards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alain
--

SELECT pg_catalog.setval('creditcards_id_seq', 3, true);


--
-- Name: gateways_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alain
--

SELECT pg_catalog.setval('gateways_id_seq', 1, false);


--
-- Name: inventory_units_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alain
--

SELECT pg_catalog.setval('inventory_units_id_seq', 460, true);


--
-- Name: line_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alain
--

SELECT pg_catalog.setval('line_items_id_seq', 1070870233, true);


--
-- Name: log_entries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alain
--

SELECT pg_catalog.setval('log_entries_id_seq', 7, true);


--
-- Name: mail_methods_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alain
--

SELECT pg_catalog.setval('mail_methods_id_seq', 1, false);


--
-- Name: option_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alain
--

SELECT pg_catalog.setval('option_types_id_seq', 935339120, true);


--
-- Name: option_values_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alain
--

SELECT pg_catalog.setval('option_values_id_seq', 979460027, true);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alain
--

SELECT pg_catalog.setval('orders_id_seq', 1069267041, true);


--
-- Name: payment_methods_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alain
--

SELECT pg_catalog.setval('payment_methods_id_seq', 931422121, false);


--
-- Name: payments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alain
--

SELECT pg_catalog.setval('payments_id_seq', 107, true);


--
-- Name: preferences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alain
--

SELECT pg_catalog.setval('preferences_id_seq', 22, true);


--
-- Name: product_option_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alain
--

SELECT pg_catalog.setval('product_option_types_id_seq', 856797720, true);


--
-- Name: product_properties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alain
--

SELECT pg_catalog.setval('product_properties_id_seq', 1073273584, true);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alain
--

SELECT pg_catalog.setval('products_id_seq', 1060500665, true);


--
-- Name: promotion_action_line_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alain
--

SELECT pg_catalog.setval('promotion_action_line_items_id_seq', 1, true);


--
-- Name: promotion_actions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alain
--

SELECT pg_catalog.setval('promotion_actions_id_seq', 7, true);


--
-- Name: promotion_rules_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alain
--

SELECT pg_catalog.setval('promotion_rules_id_seq', 7, true);


--
-- Name: properties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alain
--

SELECT pg_catalog.setval('properties_id_seq', 905834922, true);


--
-- Name: prototypes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alain
--

SELECT pg_catalog.setval('prototypes_id_seq', 571598469, true);


--
-- Name: return_authorizations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alain
--

SELECT pg_catalog.setval('return_authorizations_id_seq', 1, false);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alain
--

SELECT pg_catalog.setval('roles_id_seq', 930089100, false);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: alain
--

COPY schema_migrations (version) FROM stdin;
20120522141128
20120522141129
20120522141130
20120522141131
20120522141132
20120522141133
20120522141134
20120522141135
20120522141136
20120522141137
20120522141138
20120522141139
20120522141140
20120522141141
20120522141142
20120522141143
20120522141144
20120522141145
20120522141146
20120522141147
20120522141148
20120522141149
20120522141150
20120522141151
20120522141152
20120522141153
20120522141154
20120522141155
20120522141156
20120522141157
20120522141158
20120522141159
20120522141160
20120522141161
20120522141162
20120522141163
20120522141164
20120522141165
20120522141166
20120522141167
20120522141168
20120522141169
20120522141170
20120522141171
20120522141172
20120522141173
20120522141174
20120522141175
20120522141176
20120522141177
20120522141178
20120522141179
20120522141180
20120522141181
20120522141182
20120522141183
20120522141184
20120522141185
20120522141186
20120522141187
20120522141188
20120522141189
20120522141190
20120522141191
20120522141192
20120522141193
20120522141194
20120522141195
20120522141196
20120522141197
20120522141198
20120522141199
20120522141200
20120522141201
20120522141202
20120522141203
20120522141204
20120522141205
20120522141206
20120522141207
20120522141208
20120522141209
20120522141210
20120522141211
20120522141212
20120522141213
20120522141214
20120522141215
20120522141216
20120522141217
20120522141218
20120522141219
20120522141220
20120522141221
20120522141222
20120522141223
20120522141224
20120522141225
20120522141226
20120522141227
20120522141228
20120522141229
20120522141230
20120522141231
20120522141232
20120522141233
20120522141234
20120522141235
20120522141236
20120522141237
20120522141238
20120522141239
20120522141240
20120522141241
20120522141242
20120522141243
20120522141244
20120522141245
20120919
20120926
20120522141246
20120919151246
20120926111246
20120927100043
20120927100044
20120927100045
20120927100046
20120927100047
20120927100048
20121029184542
20130319160456
20130319160457
20130319160458
20130319160459
20130319160460
20130319160461
20130319160462
20130319160463
20130422191042
\.


--
-- Name: shipments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alain
--

SELECT pg_catalog.setval('shipments_id_seq', 1053930495, true);


--
-- Name: shipping_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alain
--

SELECT pg_catalog.setval('shipping_categories_id_seq', 727197547, false);


--
-- Name: shipping_methods_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alain
--

SELECT pg_catalog.setval('shipping_methods_id_seq', 574015645, false);


--
-- Data for Name: spree_activators; Type: TABLE DATA; Schema: public; Owner: alain
--

COPY spree_activators (id, description, expires_at, created_at, updated_at, starts_at, name, event_name, type, usage_limit, match_policy, code, advertise, path) FROM stdin;
3	Typical promotion	\N	2013-04-22 11:58:13.933528	2013-04-22 11:58:13.933528	\N	product promotion	spree.cart.add	Spree::Promotion	\N	all		f	
\.


--
-- Data for Name: spree_addresses; Type: TABLE DATA; Schema: public; Owner: alain
--

COPY spree_addresses (id, firstname, lastname, address1, address2, city, zipcode, phone, state_name, alternative_phone, state_id, country_id, created_at, updated_at, company) FROM stdin;
607887544	Brandon	Daugherty	575 Lauriane Station	Apt. 832	Lake Maybell	16804	(490)851-5469 x33037	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
1026748676	Keaton	Paucek	83184 Violette Views	Apt. 673	Lake Noemi	16804	1-054-356-3241 x435	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
171295127	Jayme	Lockman	11276 Blaise Walk	Apt. 230	New Magdalen	16804	(269)518-6109 x2282	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
340874296	Fannie	Parisian	4652 Crist Corners	Apt. 327	McClurebury	16804	1-806-047-8436 x690	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
592864417	Misty	Halvorson	68359 Cummings Meadows	Apt. 356	Federicotown	16804	385-161-5689 x042	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
979318045	Pat	Keebler	347 Nitzsche Groves	Apt. 153	East Geoffrey	16804	383.954.9849 x616	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
223872400	Geoffrey	Rohan	557 Damion Courts	Suite 724	Maritzahaven	16804	1-680-921-9404	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
501684253	Carol	Schumm	190 Grady Extensions	Apt. 343	Nestorfurt	16804	1-468-985-1109	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
719333514	Rubye	Kub	30782 Hoppe Ranch	Suite 915	Mayraburgh	16804	998.577.9379 x286	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
826662719	Mollie	Corwin	0527 Reichert Streets	Suite 083	Adonisland	16804	1-135-908-3174 x43729	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
105050026	Kiana	Oberbrunner	23500 O'Conner Orchard	Apt. 662	Maximusstad	16804	1-131-056-9674 x70643	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
525057558	Kaylee	Larkin	95252 Bashirian Ports	Apt. 017	Haneside	16804	312-225-8034	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
676105863	Willa	Beahan	900 Kulas Mount	Suite 279	Lake Filibertostad	16804	420.274.5269 x535	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
908598054	Katrina	Ritchie	69854 Velva Square	Apt. 951	North Leslieton	16804	(309)375-3387 x3789	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
19868593	Dixie	Pagac	22194 Dietrich Squares	Suite 912	Bobbieton	16804	621.420.1135	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
405174797	Armani	McLaughlin	186 Stokes Heights	Suite 193	Bartonbury	16804	027.585.6616	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
790710942	Brian	McClure	47465 Leslie Coves	Apt. 098	Delfinachester	16804	121.061.5806 x453	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
1067341581	Ida	Schulist	52650 Beer Land	Apt. 814	West Monaport	16804	(060)246-1620	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
144271260	Kiarra	Sanford	5150 Vergie Passage	Suite 182	East Chadrick	16804	553-910-2801	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
443059452	Elisha	Oga	76965 Gideon Road	Suite 575	Farrellport	16804	818-454-2178	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
762297451	Allan	Kertzmann	2962 Vandervort Harbor	Suite 833	New Rhiannonside	16804	742-946-3593	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
879160787	Florence	Larkin	140 Ethelyn Walks	Apt. 258	Port Josie	16804	286.904.7107	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
56745288	Cole	Purdy	7032 Jovany Glens	Apt. 431	Leilanibury	16804	(123)401-9512 x59648	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
486885605	Glen	Krajcik	9650 Corbin Ramp	Suite 072	Gutkowskiland	16804	1-784-453-9993	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
704804980	Alize	Kulas	211 Abbott Parks	Suite 370	East Christ	16804	(192)111-2137	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
856369612	Bailee	Greenfelder	1791 Turner Lake	Suite 941	Quitzonside	16804	1-155-019-7347	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
67901793	Charles	Hessel	9434 Maxine Groves	Apt. 701	Littleton	16804	712.507.0631	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
347276494	Orlo	Kunde	537 Winifred Ferry	Apt. 117	Beahanmouth	16804	790-557-7775	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
599012441	Maymie	McDermott	4167 Frankie Motorway	Apt. 022	Belleburgh	16804	066-878-7216	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
57916861	Lambert	Bailey	339 Katherine Plains	Suite 880	North Savion	16804	129.276.1059 x49050	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
880053548	Toby	Watsica	211 Adrien Walk	Apt. 101	East Columbus	16804	496-949-1468 x815	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
763223188	Skylar	Jaskolski	12890 Christy Shores	Suite 279	East Kiley	16804	925-832-6910 x86708	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
444263433	Kathryne	Funk	90693 Florencio Centers	Suite 193	New Karaview	16804	(364)653-3587 x983	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
69106084	Lori	Schamberger	19859 Larkin Glen	Apt. 590	VonRuedenmouth	16804	182.082.7939 x348	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
857295155	Tyreek	Lebsack	401 Harber Vista	Suite 737	Macejkovicfurt	16804	(338)819-9815 x90682	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
705697931	Jordyn	Roob	759 Gleason Parks	Suite 692	New Nikita	16804	(837)192-3718	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
488056864	Luz	DuBuque	51737 Cormier Turnpike	Apt. 373	Bauchport	16804	(394)604-8241	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
229127567	Alyce	Koch	935 Kris Forest	Suite 065	Hermannbury	16804	(077)448-2399 x9266	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
984548634	Fausto	Schimmel	9860 Anissa Alley	Apt. 948	Beattyville	16804	1-476-078-6907 x17421	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
204614523	Donald	Ondricka	759 Streich Road	Apt. 695	South Krystalside	16804	050-535-5050	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
993336300	Darlene	Powlowski	1173 Schroeder Underpass	Suite 466	West Cloydfort	16804	428-357-2564 x7712	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
574376536	Minerva	Gibson	02654 Kevin Brooks	Apt. 407	Hartmannhaven	16804	913.611.4211 x4149	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
356219587	Ilene	Beier	9636 Cruickshank Ford	Apt. 887	North Adeliafort	16804	1-621-196-0528	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
190836580	Ransom	Mraz	4162 Pacocha Manors	Apt. 910	Merlmouth	16804	531.297.1021 x117	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
1012457461	Judge	Corkery	224 Joshuah Creek	Suite 493	Beerton	16804	614-651-9435 x818	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
626101841	Consuelo	Bogisich	61144 Kreiger Pine	Suite 472	New Joe	16804	(253)934-1150 x297	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
307674844	Annabell	Rippin	27357 Jarret Burg	Apt. 388	West Percyfurt	16804	005.861.8617	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
48866121	Citlalli	Prosacco	7879 Kassulke Track	Apt. 261	Marioville	16804	1-054-301-4083 x2606	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
904827870	Orion	Marvin	9372 Heller Trafficway	Suite 475	Carolynmouth	16804	216-108-9787	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
355015228	Zack	Sanford	72934 Bryce Route	Suite 451	Bodestad	16804	1-589-352-9092 x668	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
573450925	Candice	Nitzsche	03040 Heaney Rest	Suite 474	Nolanchester	16804	1-218-655-4915 x543	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
992443161	Mona	Tillman	38067 Mills Fall	Apt. 994	South Christine	16804	(795)681-7269 x097	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
203443076	Shayna	Carroll	7381 Cruickshank Coves	Suite 123	Melvinahaven	16804	(583)486-9716	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
306503203	Jedediah	Effertz	276 Weston Run	Apt. 422	Joeystad	16804	(523)646-4648 x82309	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
625209012	Maye	Goyette	1266 Willms Land	Suite 129	Gulgowskiland	16804	160.151.7880 x7598	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
1011531536	Trystan	Mayert	538 Kihn Flat	Apt. 250	Rocioville	16804	946.589.0886 x8587	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
189632411	Dewitt	Rice	0646 Genesis Orchard	Suite 367	New Chad	16804	446-189-7322 x071	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
468881930	Kaela	Roberts	46964 Dickens Forges	Apt. 042	New Billy	16804	(765)194-3460 x781	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
754295455	Myron	Bogisich	98604 Hamill Groves	Suite 932	Davionhaven	16804	(452)702-8668	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
1040468473	Delfina	Murazik	49581 Octavia Gardens	Suite 543	East Odessa	16804	(651)270-1743 x984	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
151222638	Laurianne	Hamill	649 Kovacek Manors	Apt. 970	West Braden	16804	(441)838-7720	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
269101270	Emma	Lynch	38448 Botsford Course	Apt. 134	Bednarshire	16804	(763)286-1675	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
655169605	Meghan	Jewess	97827 Wisozk Trace	Apt. 681	Torphyfort	16804	729.751.7305 x01861	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
963218914	Coleman	Jacobi	638 Bernhard Parks	Apt. 622	Reichertside	16804	847.394.6095 x728	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
242138487	Ruth	Hayes	7933 Raoul Key	Suite 143	South Arnulfo	16804	754.512.2376 x4821	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
392686799	Mossie	Legros	03673 Maude Corner	Suite 696	Adriennebury	16804	798-187-4081	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
543218782	Teresa	Brekke	498 Lynch Mall	Suite 764	Port Madisyntown	16804	(536)500-0974 x73733	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
819970507	Ayla	Koelpin	93269 Jacobi Gardens	Apt. 138	New Alexander	16804	027-331-3248	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
131658076	Johan	Jones	996 Alessia Isle	Suite 751	Murrayburgh	16804	1-294-166-8973 x526	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
656373946	Ariel	Mitchell	86696 Treutel Point	Suite 082	Port Bernie	16804	387-509-5085	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
270026799	Orland	Stokes	967 Emerald Mews	Suite 762	Mayside	16804	033.381.2695 x004	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
152115607	Wyatt	Goldner	9024 Floyd Court	Suite 224	Jarredton	16804	1-655-600-3389	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
1041639686	Ida	Cruickshank	730 Carey Tunnel	Apt. 964	Halvorsonside	16804	(861)796-6412	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
544390305	Guido	Price	328 Zoie Knoll	Apt. 601	Ciceroland	16804	311.351.9170 x18780	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
393579574	Krystina	Hegmann	16577 Walker Island	Suite 520	Millsstad	16804	716.134.9713 x3583	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
243064206	Florida	Frami	56448 Bauch Spur	Apt. 969	Cristbury	16804	(404)233-6686 x1187	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
964422941	Kaley	Johns	50767 Carroll View	Apt. 200	Franciscoview	16804	(448)001-5268 x96511	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
700772492	Madie	Tillman	7737 Reynolds Throughway	Suite 984	O'Connellburgh	16804	1-999-853-8559	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
516145181	Adah	Jakubowski	4039 Keely Street	Suite 417	Boyerbury	16804	(390)817-4895 x288	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
545743993	Brown	Schamberger	81893 Bernier Club	Apt. 326	North Sasha	16804	083-481-3447 x969	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
394286306	Diego	Lindgren	300 Moriah Streets	Suite 241	West Danniemouth	16804	1-209-395-5063 x02044	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
243860826	Nigel	Heller	3832 Adams Trace	Suite 054	New Elvis	16804	(652)133-3630 x0043	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
965621197	Mckayla	Hahn	868 O'Connell Fords	Apt. 774	Lake Lexibury	16804	1-693-093-7817	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
669687922	Arne	Ullrich	46819 Roscoe Stravenue	Apt. 055	Candicechester	16804	1-985-481-9701 x66276	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
284004603	Kacey	Kiehn	54469 Delphine Fort	Apt. 869	West Rene	16804	129-870-5613 x436	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
165986627	Cornelius	Lynch	838 Rice Canyon	Apt. 446	New Agustinamouth	16804	1-751-266-0882 x5556	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
1055125974	Immanuel	Jerde	0191 Gulgowski Corner	Suite 624	West Helmerfort	16804	094.628.2749	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
777841735	Horace	Volkman	7083 Brakus Passage	Suite 619	Osborneport	16804	(901)691-0709	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
425450708	Dewayne	Heathcote	5468 Breitenberg Highway	Apt. 815	Weissnatmouth	16804	(124)342-9252 x6034	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
966546746	Deon	Powlowski	2472 Beatty River	Suite 870	New Desmond	16804	(744)535-5415	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
245065123	Claudia	Rowe	6516 Samson Gateway	Suite 700	Jarredfort	16804	239-101-7572 x15231	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
395457563	Sabrina	Swaniawski	0072 Steuber Plain	Apt. 638	Leuschkeberg	16804	1-048-371-2759 x40044	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
546636942	Wilfredo	Gislason	5446 Alda Grove	Suite 369	Lake Alivia	16804	(792)802-0589	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
1056018737	Joyce	Simonis	88898 Wolf Mountain	Apt. 107	Homenickbury	16804	912-602-2564	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
167158202	Nelle	Emmerich	354 Cristobal Shoals	Suite 917	Lehnerhaven	16804	956.901.2644 x37563	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
285208578	Westley	Wilderman	4322 Isac Oval	Suite 374	Joanyberg	16804	(538)896-0920	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
670613653	Devin	Lubowitz	2392 Rempel Well	Suite 241	Lake Lambert	16804	482.039.2277 x2638	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
927456520	Natalie	Daugherty	54037 Harris Avenue	Apt. 425	Avaport	16804	(840)586-9818	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
4255125	Alisa	Nitzsche	7928 Jaida Shoal	Suite 211	North Kenyafort	16804	809.504.3266	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
42776516	Verda	Leuschke	690 Kuhlman Circles	Suite 223	North Larry	16804	161.565.5346	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
1046447419	Bartholome	Krajcik	089 Nicholaus River	Apt. 407	North Leonardton	16804	577.784.0866 x345	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
660001923	Mack	Runolfsson	89645 Corene Inlet	Apt. 316	Monroeview	16804	1-554-888-6887 x77399	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
273802266	Carolyn	Brown	1411 Cormier Mills	Apt. 910	New Maddison	16804	1-407-691-3358 x00752	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
238383541	Florine	Kovacek	8149 Buddy Ford	Suite 533	North Emilyfurt	16804	408.916.3464 x610	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
959594786	Garnett	Beier	8618 Mueller Spur	Suite 595	East Idellshire	16804	(189)570-7374 x712	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
540741786	Gianni	Corwin	4770 Okuneva Pines	Suite 541	Port Deja	16804	339-619-2168	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
389816337	Jamey	Graham	625 Auer Courts	Apt. 170	Turcotteberg	16804	1-910-116-7557	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
126041504	Landen	Witting	323 Von Union	Apt. 059	Lueilwitzstad	16804	1-244-733-3061	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
813960457	Cassie	Schoen	00275 Moen Knolls	Apt. 572	Lake Shanyville	16804	892-284-2769	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
99510657	Kaley	Legros	028 Krajcik Camp	Apt. 835	Mrazview	16804	(363)078-4844 x99151	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
854153494	Bethany	Connelly	1907 Jast Key	Suite 656	Port Georgiana	16804	901-665-4205 x577	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
736102574	Gladys	Reichel	7557 Kennith Fork	Apt. 816	West Donny	16804	(171)726-5119	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
484915261	Madilyn	Langosh	62985 Marcelo Lake	Suite 539	Heidenreichstad	16804	(837)150-4122 x7171	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
42184090	Devonte	Marks	33032 Conrad Crest	Suite 546	Malikaview	16804	847-854-9647 x5556	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
897883407	Arlie	Labadie	08371 Kunze Mountain	Suite 521	West Ulicesshire	16804	(335)945-1462 x40406	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
747490487	Sammy	Koch	958 Dessie Corners	Suite 247	West Devin	16804	767.847.5503 x0577	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
462093350	Samantha	Swift	274 Karlee Creek	Suite 891	Gislasonfurt	16804	(992)654-1100 x5775	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
188080563	Mattie	Becker	00571 Bailey Trafficway	Suite 397	Baileyborough	16804	1-775-851-3387 x91594	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
1009963300	Therese	Barrows	3702 Jacobi Station	Apt. 989	Lynchland	16804	1-162-985-5692 x36788	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
784546372	Jalon	Ledner	4218 Corene Haven	Apt. 910	North Jarenview	16804	1-014-717-9480 x0826	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
432278229	Madalyn	Tremblay	3855 Morissette Path	Suite 796	South Shanny	16804	1-708-009-9618	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
13458289	Jerald	Gorczany	25908 Annamarie Gardens	Apt. 018	Eladioland	16804	(729)304-4192	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
936012796	Robb	Mueller	4654 Delphia Street	Apt. 889	Wilsonmouth	16804	861.025.0990	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
699334235	Stephon	Jaskolski	9347 Reyna Ridge	Suite 697	Mikaylatown	16804	365.050.6319	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
514445004	Peyton	Funk	12770 Dario Motorway	Suite 697	Shayleeside	16804	(203)033-6853	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
127967096	Vilma	Spencer	77215 Kaleb Loop	Suite 356	West Kiraborough	16804	(777)706-1094 x3214	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
816295907	Rosalyn	Funk	9024 Sandy Burgs	Suite 952	Gerholdburgh	16804	171-096-6295	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
538489458	Johnson	Lesch	682 Daugherty Canyon	Apt. 649	North Irvingstad	16804	(069)582-9867	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
387941095	Lenora	Grimes	7260 Vandervort Landing	Apt. 027	Juniorfurt	16804	(020)409-4698	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
936905475	Lauretta	Hauck	5011 Kertzmann Roads	Apt. 956	West Marleneberg	16804	1-312-187-4756	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
14629780	Flo	Ryan	116 Assunta Passage	Suite 646	North Rachel	16804	(327)195-3249	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
433482288	Isabella	Leannon	634 Auer Inlet	Suite 414	Hazelton	16804	1-156-461-2947 x8986	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
785472187	Cassie	Corwin	171 Wuckert Brook	Apt. 662	Rempelland	16804	119-732-4499 x7838	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
817221404	Rosalinda	Willms	106 Baumbach Pass	Suite 607	West Audiebury	16804	697.880.6870 x9184	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
129171341	Polly	Johnson	895 Candice Flat	Suite 192	Trantowport	16804	319.508.7847	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
515616313	Alexys	Pagac	6300 Bartholome Trafficway	Apt. 276	Gulgowskiland	16804	1-740-680-0383	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
700227236	Mario	Grady	4417 Moen Route	Apt. 376	Lake Creola	16804	(515)771-5280	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
956531505	Ewald	Sanford	014 Daniel Gardens	Suite 002	North Valentin	16804	368-207-1321 x7534	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
235189158	Letha	Kirlin	99198 Santino View	Apt. 933	Lake Jayborough	16804	201.685.7834 x3145	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
949591493	Casandra	Renner	57542 Samara Lane	Suite 772	Jacobichester	16804	203-270-4795 x25957	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
262057300	Tomasa	Larson	638 Leanna Trafficway	Suite 658	Bartellhaven	16804	697-086-5177	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
379059436	Emilio	Kiehn	0645 Beaulah Corner	Apt. 705	Collierhaven	16804	308.539.0958 x3350	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
563137665	Ruthe	Ortiz	7425 Labadie Row	Suite 740	South Katrine	16804	1-851-163-7804 x4079	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
1072978396	Stefan	Hettinger	726 Greenholt Ways	Apt. 110	Mariemouth	16804	425-700-4496 x2087	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
150169931	Edwina	Bashirian	67548 Jake Springs	Suite 496	South Velma	16804	798-638-1301	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
301611251	Alek	Ankunding	689 Blanda Groves	Suite 642	Matildemouth	16804	292-668-4815	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
654116968	Ahmed	Strosin	55837 Bergstrom Forge	Suite 907	West Jennifer	16804	(554)702-6420 x35533	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
910300663	Orlando	Kulas	887 Wava Run	Suite 970	Lucytown	16804	(029)771-7881 x25946	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
21308770	Brandt	Morar	0313 Shanel Fort	Suite 728	New Saul	16804	1-947-125-2888 x386	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
562211972	Cindy	Lockman	8009 Littel Crossroad	Suite 403	Ambrosehaven	16804	1-803-962-1727 x78507	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
377854995	Shaylee	Heathcote	608 Kshlerin Trafficway	Apt. 972	New Douglasborough	16804	230-677-8148	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
260885931	Gene	Schaefer	827 Corene Garden	Apt. 612	Glovershire	16804	272.634.5174	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
948698432	Meda	Collins	094 Gonzalo Prairie	Suite 077	Margarettton	16804	(391)644-2853 x054	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
653224093	Ila	Hilll	440 Vena Ridges	Apt. 713	Krystalstad	16804	(196)690-1741 x533	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
300439564	Olaf	DuBuque	9740 Marco Mills	Apt. 738	Lessiehaven	16804	(057)198-5079 x4995	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
148965812	Aron	Gerlach	76642 Haag Expressway	Suite 109	Walkerfurt	16804	1-826-204-8327 x6330	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
1072052521	Brady	Monahan	683 Stroman Views	Suite 246	Bradyhaven	16804	(402)946-4526	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
794371254	Adrien	Douglas	909 Lonzo Glens	Suite 080	Roxannemouth	16804	(949)109-4752 x973	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
408818721	Alicia	Blick	9000 Osbaldo View	Apt. 370	New Watson	16804	838.592.2510	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
179306311	Nia	McCullough	2089 Howell Mountain	Suite 874	East Hayden	16804	059-695-9918 x5667	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
1034473426	Crystal	O'Connell	530 Hoeger Valleys	Apt. 401	Blakebury	16804	971.952.4773	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
614571630	Duane	Pfannerstill	85308 Roslyn Keys	Suite 258	Port Renee	16804	690-182-6758	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
329690879	Ewald	Stracke	3620 Meredith Walks	Apt. 519	Rodriguezborough	16804	1-482-231-5882 x614	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
230832990	Kaylah	Dach	21432 Morissette Skyway	Suite 986	Port Alvera	16804	1-790-377-8376	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
985992137	Leonard	Koch	644 Parisian Common	Suite 867	Lake Patricia	16804	508-659-1187	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
600595061	Cathryn	Hilpert	423 Claudine Pass	Apt. 770	Lake Fernefurt	16804	027.399.6200	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
348875494	Cathrine	Rosenbaum	4082 Linda Courts	Suite 498	Abelardomouth	16804	309-147-8551 x4545	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
74741621	Nolan	Hauck	02842 Zieme Terrace	Suite 246	West Dell	16804	1-638-826-7770 x132	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
863193060	Broderick	Dickens	89367 Kreiger Divide	Suite 797	Janessabury	16804	1-991-671-6321 x212	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
330616326	Jillian	Yost	4369 Danielle River	Apt. 506	West Deondre	16804	231.442.2009	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
615775889	Sean	Marquardt	980 Larson Fork	Apt. 693	Roobchester	16804	(066)931-9959	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
1035644717	Dominique	Robel	560 Fidel Harbors	Suite 687	Port Euna	16804	(158)133-6938 x451	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
180199358	Danielle	Miller	1244 Vern Courts	Suite 109	New Alexanechester	16804	1-185-408-6054 x9414	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
349768223	Lonie	Hilll	3971 Schamberger Springs	Apt. 106	Lake Everettetown	16804	1-727-283-6900	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
601766538	Mathias	Gottlieb	6332 Ramona Street	Apt. 644	Leonoramouth	16804	287-393-8740	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
987196214	Earlene	Daniel	0465 Monroe Greens	Apt. 880	Lake Guadalupe	16804	718.868.4352	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
231758759	Vilma	Treutel	83057 Altenwerth Court	Apt. 489	Port Carroll	16804	465-690-4269 x707	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
493831732	Belle	Heathcote	5915 Dayne Via	Suite 420	West Enriqueberg	16804	505.877.7551	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
711489187	Frederik	Cronin	7658 Eloy River	Apt. 000	Lake Helene	16804	412.536.8969	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
338481867	Sebastian	Little	092 Veronica Estates	Apt. 479	East Sadyefurt	16804	1-365-188-2307 x48907	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
590078562	Mariela	Hyatt	967 Darrel Burg	Suite 645	Lake Maynard	16804	937.831.3177 x17721	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
975352806	Clifton	Aufderhar	974 Alexie Knolls	Suite 810	Mertzhaven	16804	(488)316-7825 x864	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
220562291	Demarcus	Heidenreich	57458 Giovanna Brooks	Apt. 097	North Stantonfort	16804	044-448-6493 x37019	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
323032786	Agnes	Bergnaum	81965 Dickens Loaf	Apt. 052	North Ivah	16804	1-961-037-8931 x8077	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
608577097	Michaela	Spencer	041 Benjamin Land	Apt. 720	Schaefertown	16804	(908)414-7283 x50263	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
1028618237	Mavis	Anderson	71650 Hauck Branch	Suite 288	North Karson	16804	1-178-943-1150 x93768	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
172509034	Dylan	Conn	309 Schaden Circle	Suite 530	Kenyaland	16804	1-355-641-4749	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
452418301	Rhett	Schiller	7551 Griffin Garden	Apt. 461	Lake Keenanmouth	16804	(153)541-6112	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
770730608	Kyla	Lakin	6691 Douglas Greens	Apt. 322	North Rachellemouth	16804	485-286-0931	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
221766538	Claudie	Wintheiser	51529 Rosalinda Groves	Apt. 401	Nicolasmouth	16804	274.061.7163 x2885	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
976278305	Maud	Ernser	69446 Millie Prairie	Apt. 791	West Celestinotown	16804	683-879-2135	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
590971557	Linnie	Hermiston	36554 Berniece Lights	Suite 297	South Cullenfurt	16804	(823)581-2942 x673	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
339653170	Jerad	Hyatt	066 Autumn Lights	Suite 519	Lake Norbert	16804	060-676-7451 x65919	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
173680531	Katelyn	Medhurst	304 Tad Island	Apt. 414	South Roscoeside	16804	(600)692-8075 x781	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
1029510922	Unique	Price	5637 Nikolaus Circle	Suite 914	Port Graysonview	16804	311-752-6634 x66911	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
609502910	Otho	Leannon	1687 Sierra Glen	Apt. 464	Rennerburgh	16804	170.480.1419	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
324236843	Oran	Herzog	860 Labadie Ramp	Apt. 877	West Mustafaview	16804	1-708-052-4433 x5676	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
65825724	Gage	Kuphal	18456 Lesch Plain	Suite 171	East Erwin	16804	1-689-532-9749	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
887839535	Ruthie	Deckow	628 Maude Shoal	Apt. 989	Kelsiborough	16804	(099)712-2822	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
421966440	Hilma	Strosin	338 Damien Parkways	Suite 148	West Ariane	16804	880-875-7477	\N	\N	889445952	214	2012-05-22 14:13:02	2012-05-22 14:13:02	\N
1072978397	Gaston	Lagaffe	rue de la gaffe	12	Bruxelles	7500	340404040	\N	\N	276110813	214	2012-09-13 12:48:09.767961	2012-09-13 12:48:09.767961	\N
1072978398	Gaston	Lagaffe	rue de la gaffe	12	Bruxelles	7500	340404040	\N	\N	276110813	214	2012-09-13 12:48:09.836662	2012-09-13 12:48:09.836662	\N
1072978399	p	p	psdfq		pdfqs	3444	2342423	\N	\N	403740659	214	2013-03-18 21:13:11.702955	2013-03-18 21:13:11.702955	\N
1072978401	p	p	psdfq		pdfqs	3444	2342423	\N	\N	536031023	214	2013-03-18 21:14:22.661242	2013-03-19 16:03:21.941424	\N
1072978400	p	p	psdfq		pdfqs	3444	2342423	\N	\N	536031023	214	2013-03-18 21:13:11.71853	2013-03-19 16:03:21.94385	\N
1072978402	alain	truc	rue du lard		tournai	7500	0404040404	\N	\N	948208802	214	2013-03-30 15:47:05.885239	2013-03-30 15:47:05.885239	\N
1072978403	alain	truc	rue du lard		tournai	7500	0404040404	\N	\N	948208802	214	2013-03-30 15:47:05.937564	2013-03-30 15:47:05.937564	\N
\.


--
-- Data for Name: spree_adjustments; Type: TABLE DATA; Schema: public; Owner: alain
--

COPY spree_adjustments (id, source_id, amount, label, source_type, adjustable_id, created_at, updated_at, mandatory, locked, originator_id, originator_type, eligible, adjustable_type) FROM stdin;
301676563	330565047	3.90	Tax	Spree::Order	330565047	2012-05-22 14:13:02	2012-05-22 14:13:02	t	f	967941380	Spree::TaxRate	t	Spree::Order
262122930	231772182	4.70	Tax	Spree::Order	231772182	2012-05-22 14:13:02	2012-05-22 14:13:02	t	f	967941380	Spree::TaxRate	t	Spree::Order
949525797	987209861	3.10	Tax	Spree::Order	987209861	2012-05-22 14:13:02	2012-05-22 14:13:02	t	f	967941380	Spree::TaxRate	t	Spree::Order
563203233	601813305	1.95	Tax	Spree::Order	601813305	2012-05-22 14:13:02	2012-05-22 14:13:02	t	f	967941380	Spree::TaxRate	t	Spree::Order
378993674	349815214	4.35	Tax	Spree::Order	349815214	2012-05-22 14:13:02	2012-05-22 14:13:02	t	f	967941380	Spree::TaxRate	t	Spree::Order
103408025	73849921	2.75	Tax	Spree::Order	73849921	2012-05-22 14:13:02	2012-05-22 14:13:02	t	f	967941380	Spree::TaxRate	t	Spree::Order
825151760	862055596	2.75	Tax	Spree::Order	862055596	2012-05-22 14:13:02	2012-05-22 14:13:02	t	f	967941380	Spree::TaxRate	t	Spree::Order
466310914	620502818	3.80	Tax	Spree::Order	620502818	2012-05-22 14:13:02	2012-05-22 14:13:02	t	f	967941380	Spree::TaxRate	t	Spree::Order
46270278	1039486630	3.40	Tax	Spree::Order	1039486630	2012-05-22 14:13:02	2012-05-22 14:13:02	t	f	967941380	Spree::TaxRate	t	Spree::Order
902117331	183664179	2.80	Tax	Spree::Order	183664179	2012-05-22 14:13:02	2012-05-22 14:13:02	t	f	967941380	Spree::TaxRate	t	Spree::Order
732013170	345435026	4.60	Tax	Spree::Order	345435026	2012-05-22 14:13:02	2012-05-22 14:13:02	t	f	967941380	Spree::TaxRate	t	Spree::Order
480678633	596761353	3.60	Tax	Spree::Order	596761353	2012-05-22 14:13:02	2012-05-22 14:13:02	t	f	967941380	Spree::TaxRate	t	Spree::Order
95404893	983075517	4.20	Tax	Spree::Order	983075517	2012-05-22 14:13:02	2012-05-22 14:13:02	t	f	967941380	Spree::TaxRate	t	Spree::Order
849933258	228571690	6.20	Tax	Spree::Order	228571690	2012-05-22 14:13:02	2012-05-22 14:13:02	t	f	967941380	Spree::TaxRate	t	Spree::Order
571993693	488679357	5.40	Tax	Spree::Order	488679357	2012-05-22 14:13:02	2012-05-22 14:13:02	t	f	967941380	Spree::TaxRate	t	Spree::Order
353427152	707237680	6.20	Tax	Spree::Order	707237680	2012-05-22 14:13:02	2012-05-22 14:13:02	t	f	967941380	Spree::TaxRate	t	Spree::Order
132199852	953580620	5.40	Tax	Spree::Order	953580620	2012-05-22 14:13:02	2012-05-22 14:13:02	t	f	967941380	Spree::TaxRate	t	Spree::Order
703550599	383262055	0.80	Tax	Spree::Order	383262055	2012-05-22 14:13:02	2012-05-22 14:13:02	t	f	967941380	Spree::TaxRate	t	Spree::Order
518546448	568274416	2.40	Tax	Spree::Order	568274416	2012-05-22 14:13:02	2012-05-22 14:13:02	t	f	967941380	Spree::TaxRate	t	Spree::Order
9236917	1069267029	3.20	Tax	Spree::Order	1069267029	2012-05-22 14:13:02	2012-05-22 14:13:02	t	f	967941380	Spree::TaxRate	t	Spree::Order
931905832	146573512	1.60	Tax	Spree::Order	146573512	2012-05-22 14:13:02	2012-05-22 14:13:02	t	f	967941380	Spree::TaxRate	t	Spree::Order
780308640	297130368	1.60	Tax	Spree::Order	297130368	2012-05-22 14:13:02	2012-05-22 14:13:02	t	f	967941380	Spree::TaxRate	t	Spree::Order
428187657	649259497	2.40	Tax	Spree::Order	649259497	2012-05-22 14:13:02	2012-05-22 14:13:02	t	f	967941380	Spree::TaxRate	t	Spree::Order
154844570	906884218	3.20	Tax	Spree::Order	906884218	2012-05-22 14:13:02	2012-05-22 14:13:02	t	f	967941380	Spree::TaxRate	t	Spree::Order
1044221201	17482993	0.80	Tax	Spree::Order	17482993	2012-05-22 14:13:02	2012-05-22 14:13:02	t	f	967941380	Spree::TaxRate	t	Spree::Order
519701741	567102733	3.20	Tax	Spree::Order	567102733	2012-05-22 14:13:02	2012-05-22 14:13:02	t	f	967941380	Spree::TaxRate	t	Spree::Order
704459904	382369184	0.80	Tax	Spree::Order	382369184	2012-05-22 14:13:02	2012-05-22 14:13:02	t	f	967941380	Spree::TaxRate	t	Spree::Order
133387601	952376497	0.80	Tax	Spree::Order	952376497	2012-05-22 14:13:02	2012-05-22 14:13:02	t	f	967941380	Spree::TaxRate	t	Spree::Order
429375732	648055060	0.80	Tax	Spree::Order	648055060	2012-05-22 14:13:02	2012-05-22 14:13:02	t	f	967941380	Spree::TaxRate	t	Spree::Order
781250663	296204679	3.20	Tax	Spree::Order	296204679	2012-05-22 14:13:02	2012-05-22 14:13:02	t	f	967941380	Spree::TaxRate	t	Spree::Order
932815327	145680447	1.60	Tax	Spree::Order	145680447	2012-05-22 14:13:02	2012-05-22 14:13:02	t	f	967941380	Spree::TaxRate	t	Spree::Order
10391880	1068095656	1.60	Tax	Spree::Order	1068095656	2012-05-22 14:13:02	2012-05-22 14:13:02	t	f	967941380	Spree::TaxRate	t	Spree::Order
270634203	790021435	1.60	Tax	Spree::Order	790021435	2012-05-22 14:13:02	2012-05-22 14:13:02	t	f	967941380	Spree::TaxRate	t	Spree::Order
656850002	403830194	2.40	Tax	Spree::Order	403830194	2012-05-22 14:13:02	2012-05-22 14:13:02	t	f	967941380	Spree::TaxRate	t	Spree::Order
297505327	780983247	2.40	Tax	Spree::Order	780983247	2012-05-22 14:13:02	2012-05-22 14:13:02	t	f	967941380	Spree::TaxRate	t	Spree::Order
649896636	428600156	2.40	Tax	Spree::Order	428600156	2012-05-22 14:13:02	2012-05-22 14:13:02	t	f	967941380	Spree::TaxRate	t	Spree::Order
1068888832	8567520	2.40	Tax	Spree::Order	8567520	2012-05-22 14:13:02	2012-05-22 14:13:02	t	f	967941380	Spree::TaxRate	t	Spree::Order
383145528	702619608	1.60	Tax	Spree::Order	702619608	2012-05-22 14:13:02	2012-05-22 14:13:02	t	f	967941380	Spree::TaxRate	t	Spree::Order
567371429	518401861	3.20	Tax	Spree::Order	518401861	2012-05-22 14:13:02	2012-05-22 14:13:02	t	f	967941380	Spree::TaxRate	t	Spree::Order
953693977	133136121	0.80	Tax	Spree::Order	133136121	2012-05-22 14:13:02	2012-05-22 14:13:02	t	f	967941380	Spree::TaxRate	t	Spree::Order
266274704	820530800	2.40	Tax	Spree::Order	820530800	2012-05-22 14:13:02	2012-05-22 14:13:02	t	f	967941380	Spree::TaxRate	t	Spree::Order
526391841	542594049	1.60	Tax	Spree::Order	542594049	2012-05-22 14:13:02	2012-05-22 14:13:02	t	f	967941380	Spree::TaxRate	t	Spree::Order
677849738	391144298	2.40	Tax	Spree::Order	391144298	2012-05-22 14:13:02	2012-05-22 14:13:02	t	f	967941380	Spree::TaxRate	t	Spree::Order
144745328	932702864	3.20	Tax	Spree::Order	932702864	2012-05-22 14:13:02	2012-05-22 14:13:02	t	f	967941380	Spree::TaxRate	t	Spree::Order
1067947005	9493021	1.60	Tax	Spree::Order	9493021	2012-05-22 14:13:02	2012-05-22 14:13:02	t	f	967941380	Spree::TaxRate	t	Spree::Order
648987201	429493153	1.60	Tax	Spree::Order	429493153	2012-05-22 14:13:02	2012-05-22 14:13:02	t	f	967941380	Spree::TaxRate	t	Spree::Order
296350424	782154552	2.40	Tax	Spree::Order	782154552	2012-05-22 14:13:02	2012-05-22 14:13:02	t	f	967941380	Spree::TaxRate	t	Spree::Order
952784868	134028804	1.60	Tax	Spree::Order	134028804	2012-05-22 14:13:02	2012-05-22 14:13:02	t	f	967941380	Spree::TaxRate	t	Spree::Order
566429272	519327672	1.60	Tax	Spree::Order	519327672	2012-05-22 14:13:02	2012-05-22 14:13:02	t	f	967941380	Spree::TaxRate	t	Spree::Order
381957839	703823663	3.20	Tax	Spree::Order	703823663	2012-05-22 14:13:02	2012-05-22 14:13:02	t	f	967941380	Spree::TaxRate	t	Spree::Order
108735330	961307330	1.60	Tax	Spree::Order	961307330	2012-05-22 14:13:02	2012-05-22 14:13:02	t	f	967941380	Spree::TaxRate	t	Spree::Order
830217163	239817259	1.60	Tax	Spree::Order	239817259	2012-05-22 14:13:02	2012-05-22 14:13:02	t	f	967941380	Spree::TaxRate	t	Spree::Order
596504753	481999185	2.40	Tax	Spree::Order	481999185	2012-05-22 14:13:02	2012-05-22 14:13:02	t	f	967941380	Spree::TaxRate	t	Spree::Order
344637498	733841882	3.20	Tax	Spree::Order	733841882	2012-05-22 14:13:02	2012-05-22 14:13:02	t	f	967941380	Spree::TaxRate	t	Spree::Order
226726274	850712674	3.20	Tax	Spree::Order	850712674	2012-05-22 14:13:02	2012-05-22 14:13:02	t	f	967941380	Spree::TaxRate	t	Spree::Order
981770517	95676661	2.40	Tax	Spree::Order	95676661	2012-05-22 14:13:02	2012-05-22 14:13:02	t	f	967941380	Spree::TaxRate	t	Spree::Order
618673338	467107162	2.40	Tax	Spree::Order	467107162	2012-05-22 14:13:02	2012-05-22 14:13:02	t	f	967941380	Spree::TaxRate	t	Spree::Order
722760507	1002961742	5.00	Shipping	Spree::Shipment	0	2012-05-22 14:13:02	2012-05-22 14:13:02	t	t	574015644	Spree::ShippingMethod	t	Spree::Order
840770179	583969526	5.00	Shipping	Spree::Shipment	0	2012-05-22 14:13:02	2012-05-22 14:13:02	t	t	574015644	Spree::ShippingMethod	t	Spree::Order
85594644	365533797	5.00	Shipping	Spree::Shipment	0	2012-05-22 14:13:02	2012-05-22 14:13:02	t	t	574015644	Spree::ShippingMethod	t	Spree::Order
461277113	195891138	5.00	Shipping	Spree::Shipment	0	2012-05-22 14:13:02	2012-05-22 14:13:02	t	t	574015644	Spree::ShippingMethod	t	Spree::Order
746174244	1017790295	5.00	Shipping	Spree::Shipment	0	2012-05-22 14:13:02	2012-05-22 14:13:02	t	t	574015644	Spree::ShippingMethod	t	Spree::Order
896591516	631467759	5.00	Shipping	Spree::Shipment	0	2012-05-22 14:13:02	2012-05-22 14:13:02	t	t	574015644	Spree::ShippingMethod	t	Spree::Order
41408013	312761982	5.00	Shipping	Spree::Shipment	0	2012-05-22 14:13:02	2012-05-22 14:13:02	t	t	574015644	Spree::ShippingMethod	t	Spree::Order
315149214	35341291	5.00	Shipping	Spree::Shipment	0	2012-05-22 14:13:02	2012-05-22 14:13:02	t	t	574015644	Spree::ShippingMethod	t	Spree::Order
634387213	891057020	5.00	Shipping	Spree::Shipment	0	2012-05-22 14:13:02	2012-05-22 14:13:02	t	t	574015644	Spree::ShippingMethod	t	Spree::Order
473068495	629437518	5.00	Shipping	Spree::Shipment	0	2012-05-22 14:13:02	2012-05-22 14:13:02	t	t	574015644	Spree::ShippingMethod	t	Spree::Order
724910940	310592731	5.00	Shipping	Spree::Shipment	0	2012-05-22 14:13:02	2012-05-22 14:13:02	t	t	574015644	Spree::ShippingMethod	t	Spree::Order
842797792	193598819	5.00	Shipping	Spree::Shipment	0	2012-05-22 14:13:02	2012-05-22 14:13:02	t	t	574015644	Spree::ShippingMethod	t	Spree::Order
87761527	1015883258	5.00	Shipping	Spree::Shipment	0	2012-05-22 14:13:02	2012-05-22 14:13:02	t	t	574015644	Spree::ShippingMethod	t	Spree::Order
459257816	585740373	5.00	Shipping	Spree::Shipment	0	2012-05-22 14:13:02	2012-05-22 14:13:02	t	t	574015644	Spree::ShippingMethod	t	Spree::Order
743999301	367952066	5.00	Shipping	Spree::Shipment	0	2012-05-22 14:13:02	2012-05-22 14:13:02	t	t	574015644	Spree::ShippingMethod	t	Spree::Order
894555897	216519034	5.00	Shipping	Spree::Shipment	0	2012-05-22 14:13:02	2012-05-22 14:13:02	t	t	574015644	Spree::ShippingMethod	t	Spree::Order
39249520	1004593649	5.00	Shipping	Spree::Shipment	0	2012-05-22 14:13:02	2012-05-22 14:13:02	t	t	574015644	Spree::ShippingMethod	t	Spree::Order
317324289	727710848	5.00	Shipping	Spree::Shipment	0	2012-05-22 14:13:02	2012-05-22 14:13:02	t	t	574015644	Spree::ShippingMethod	t	Spree::Order
636406634	475581673	5.00	Shipping	Spree::Shipment	0	2012-05-22 14:13:02	2012-05-22 14:13:02	t	t	574015644	Spree::ShippingMethod	t	Spree::Order
924786706	245966735	5.00	Shipping	Spree::Shipment	0	2012-05-22 14:13:02	2012-05-22 14:13:02	t	t	574015644	Spree::ShippingMethod	t	Spree::Order
1577115	967710488	5.00	Shipping	Spree::Shipment	0	2012-05-22 14:13:02	2012-05-22 14:13:02	t	t	574015644	Spree::ShippingMethod	t	Spree::Order
420561187	547833508	5.00	Shipping	Spree::Shipment	0	2012-05-22 14:13:02	2012-05-22 14:13:02	t	t	574015644	Spree::ShippingMethod	t	Spree::Order
773222838	396391991	5.00	Shipping	Spree::Shipment	0	2012-05-22 14:13:02	2012-05-22 14:13:02	t	t	574015644	Spree::ShippingMethod	t	Spree::Order
812835865	163898264	5.00	Shipping	Spree::Shipment	0	2012-05-22 14:13:02	2012-05-22 14:13:02	t	t	574015644	Spree::ShippingMethod	t	Spree::Order
125162626	1053020929	5.00	Shipping	Spree::Shipment	0	2012-05-22 14:13:02	2012-05-22 14:13:02	t	t	574015644	Spree::ShippingMethod	t	Spree::Order
760641695	308359551	3.20	Tax	Spree::Order	308359551	2012-05-22 14:13:02	2012-05-22 14:13:02	t	f	967941380	Spree::TaxRate	t	Spree::Order
441534476	627442156	3.20	Tax	Spree::Order	627442156	2012-05-22 14:13:02	2012-05-22 14:13:02	t	f	967941380	Spree::TaxRate	t	Spree::Order
982958578	94472210	3.20	Tax	Spree::Order	94472210	2012-05-22 14:13:02	2012-05-22 14:13:02	t	f	967941380	Spree::TaxRate	t	Spree::Order
227668347	849787035	0.80	Tax	Spree::Order	849787035	2012-05-22 14:13:02	2012-05-22 14:13:02	t	f	967941380	Spree::TaxRate	t	Spree::Order
345546947	732948771	2.40	Tax	Spree::Order	732948771	2012-05-22 14:13:02	2012-05-22 14:13:02	t	f	967941380	Spree::TaxRate	t	Spree::Order
597659734	480827830	3.20	Tax	Spree::Order	480827830	2012-05-22 14:13:02	2012-05-22 14:13:02	t	f	967941380	Spree::TaxRate	t	Spree::Order
1039861241	46943257	2.40	Tax	Spree::Order	46943257	2012-05-22 14:13:02	2012-05-22 14:13:02	t	f	967941380	Spree::TaxRate	t	Spree::Order
184300898	902528130	0.80	Tax	Spree::Order	902528130	2012-05-22 14:13:02	2012-05-22 14:13:02	t	f	967941380	Spree::TaxRate	t	Spree::Order
619861069	465903021	3.20	Tax	Spree::Order	465903021	2012-05-22 14:13:02	2012-05-22 14:13:02	t	f	967941380	Spree::TaxRate	t	Spree::Order
877480416	192544832	0.80	Tax	Spree::Order	192544832	2012-05-22 14:13:02	2012-05-22 14:13:02	t	f	967941380	Spree::TaxRate	t	Spree::Order
55212365	1014837421	1.60	Tax	Spree::Order	1014837421	2012-05-22 14:13:02	2012-05-22 14:13:02	t	f	967941380	Spree::TaxRate	t	Spree::Order
1024384289	37328065	2.40	Tax	Spree::Order	37328065	2012-05-22 14:13:02	2012-05-22 14:13:02	t	f	967941380	Spree::TaxRate	t	Spree::Order
168422838	893297750	3.20	Tax	Spree::Order	893297750	2012-05-22 14:13:02	2012-05-22 14:13:02	t	f	967941380	Spree::TaxRate	t	Spree::Order
318815246	741864942	0.80	Tax	Spree::Order	741864942	2012-05-22 14:13:02	2012-05-22 14:13:02	t	f	967941380	Spree::TaxRate	t	Spree::Order
604474525	456181117	2.40	Tax	Spree::Order	456181117	2012-05-22 14:13:02	2012-05-22 14:13:02	t	f	967941380	Spree::TaxRate	t	Spree::Order
979573050	89411802	1.60	Tax	Spree::Order	89411802	2012-05-22 14:13:02	2012-05-22 14:13:02	t	f	967941380	Spree::TaxRate	t	Spree::Order
224668079	844324943	0.80	Tax	Spree::Order	844324943	2012-05-22 14:13:02	2012-05-22 14:13:02	t	f	967941380	Spree::TaxRate	t	Spree::Order
342718487	727331319	3.20	Tax	Spree::Order	727331319	2012-05-22 14:13:02	2012-05-22 14:13:02	t	f	967941380	Spree::TaxRate	t	Spree::Order
869618963	216145139	2.40	Tax	Spree::Order	216145139	2012-05-22 14:13:02	2012-05-22 14:13:02	t	f	967941380	Spree::TaxRate	t	Spree::Order
80897412	1004874852	3.20	Tax	Spree::Order	1004874852	2012-05-22 14:13:02	2012-05-22 14:13:02	t	f	967941380	Spree::TaxRate	t	Spree::Order
605416546	455255426	3.20	Tax	Spree::Order	455255426	2012-05-22 14:13:02	2012-05-22 14:13:02	t	f	967941380	Spree::TaxRate	t	Spree::Order
320003319	740660503	3.20	Tax	Spree::Order	740660503	2012-05-22 14:13:02	2012-05-22 14:13:02	t	f	967941380	Spree::TaxRate	t	Spree::Order
169577807	892126383	0.80	Tax	Spree::Order	892126383	2012-05-22 14:13:02	2012-05-22 14:13:02	t	f	967941380	Spree::TaxRate	t	Spree::Order
1025293790	36435006	3.20	Tax	Spree::Order	36435006	2012-05-22 14:13:02	2012-05-22 14:13:02	t	f	967941380	Spree::TaxRate	t	Spree::Order
595077241	474964377	2.40	Tax	Spree::Order	474964377	2012-05-22 14:13:02	2012-05-22 14:13:02	t	f	967941380	Spree::TaxRate	t	Spree::Order
343873774	726159630	3.20	Tax	Spree::Order	726159630	2012-05-22 14:13:02	2012-05-22 14:13:02	t	f	967941380	Spree::TaxRate	t	Spree::Order
225855830	843120822	0.80	Tax	Spree::Order	843120822	2012-05-22 14:13:02	2012-05-22 14:13:02	t	f	967941380	Spree::TaxRate	t	Spree::Order
980515269	88485925	0.80	Tax	Spree::Order	88485925	2012-05-22 14:13:02	2012-05-22 14:13:02	t	f	967941380	Spree::TaxRate	t	Spree::Order
499733701	587078949	2.40	Tax	Spree::Order	587078949	2012-05-22 14:13:02	2012-05-22 14:13:02	t	f	967941380	Spree::TaxRate	t	Spree::Order
1690302	539762571	1.60	Tax	Spree::Order	539762571	2012-05-22 14:13:02	2012-05-22 14:13:02	t	f	967941380	Spree::TaxRate	t	Spree::Order
511477050	667583165	5.00	Shipping	Spree::Shipment	0	2012-05-22 14:13:02	2012-05-22 14:13:02	t	t	574015644	Spree::ShippingMethod	t	Spree::Order
695973293	281915952	5.00	Shipping	Spree::Shipment	0	2012-05-22 14:13:02	2012-05-22 14:13:02	t	t	574015644	Spree::ShippingMethod	t	Spree::Order
969189440	7516093	5.00	Shipping	Spree::Shipment	0	2012-05-22 14:13:02	2012-05-22 14:13:02	t	t	574015644	Spree::ShippingMethod	t	Spree::Order
247699629	930455338	5.00	Shipping	Spree::Shipment	0	2012-05-22 14:13:02	2012-05-22 14:13:02	t	t	574015644	Spree::ShippingMethod	t	Spree::Order
772018513	397547216	5.00	Shipping	Spree::Shipment	0	2012-05-22 14:13:02	2012-05-22 14:13:02	t	t	574015644	Spree::ShippingMethod	t	Spree::Order
419635674	548742745	5.00	Shipping	Spree::Shipment	0	2012-05-22 14:13:02	2012-05-22 14:13:02	t	t	574015644	Spree::ShippingMethod	t	Spree::Order
684130	968652773	5.00	Shipping	Spree::Shipment	0	2012-05-22 14:13:02	2012-05-22 14:13:02	t	t	574015644	Spree::ShippingMethod	t	Spree::Order
923615477	247154552	5.00	Shipping	Spree::Shipment	0	2012-05-22 14:13:02	2012-05-22 14:13:02	t	t	574015644	Spree::ShippingMethod	t	Spree::Order
694801754	283103959	5.00	Shipping	Spree::Shipment	0	2012-05-22 14:13:02	2012-05-22 14:13:02	t	t	574015644	Spree::ShippingMethod	t	Spree::Order
510584259	668525120	5.00	Shipping	Spree::Shipment	0	2012-05-22 14:13:02	2012-05-22 14:13:02	t	t	574015644	Spree::ShippingMethod	t	Spree::Order
124236923	1053930492	5.00	Shipping	Spree::Shipment	0	2012-05-22 14:13:02	2012-05-22 14:13:02	t	t	574015644	Spree::ShippingMethod	t	Spree::Order
811631854	165053295	5.00	Shipping	Spree::Shipment	0	2012-05-22 14:13:02	2012-05-22 14:13:02	t	t	574015644	Spree::ShippingMethod	t	Spree::Order
551524735	426352382	5.00	Shipping	Spree::Shipment	0	2012-05-22 14:13:02	2012-05-22 14:13:02	t	t	574015644	Spree::ShippingMethod	t	Spree::Order
400075244	779005547	5.00	Shipping	Spree::Shipment	0	2012-05-22 14:13:02	2012-05-22 14:13:02	t	t	574015644	Spree::ShippingMethod	t	Spree::Order
558204811	418611208	5.00	Shipping	Spree::Shipment	0	2012-05-22 14:13:02	2012-05-22 14:13:02	t	t	574015644	Spree::ShippingMethod	t	Spree::Order
373471010	804565151	5.00	Shipping	Spree::Shipment	0	2012-05-22 14:13:02	2012-05-22 14:13:02	t	t	574015644	Spree::ShippingMethod	t	Spree::Order
256632486	922607911	5.00	Shipping	Spree::Shipment	0	2012-05-22 14:13:02	2012-05-22 14:13:02	t	t	574015644	Spree::ShippingMethod	t	Spree::Order
944559667	33214900	5.00	Shipping	Spree::Shipment	0	2012-05-22 14:13:02	2012-05-22 14:13:02	t	t	574015644	Spree::ShippingMethod	t	Spree::Order
640172946	530465809	5.00	Shipping	Spree::Shipment	0	2012-05-22 14:13:02	2012-05-22 14:13:02	t	t	574015644	Spree::ShippingMethod	t	Spree::Order
288322313	681145480	5.00	Shipping	Spree::Shipment	0	2012-05-22 14:13:02	2012-05-22 14:13:02	t	t	574015644	Spree::ShippingMethod	t	Spree::Order
136716989	831530304	5.00	Shipping	Spree::Shipment	0	2012-05-22 14:13:02	2012-05-22 14:13:02	t	t	574015644	Spree::ShippingMethod	t	Spree::Order
1059131946	110564781	5.00	Shipping	Spree::Shipment	0	2012-05-22 14:13:02	2012-05-22 14:13:02	t	t	574015644	Spree::ShippingMethod	t	Spree::Order
798887869	371722298	5.00	Shipping	Spree::Shipment	0	2012-05-22 14:13:02	2012-05-22 14:13:02	t	t	574015644	Spree::ShippingMethod	t	Spree::Order
412696368	556742829	5.00	Shipping	Spree::Shipment	0	2012-05-22 14:13:02	2012-05-22 14:13:02	t	t	574015644	Spree::ShippingMethod	t	Spree::Order
945731274	32026953	5.00	Shipping	Spree::Shipment	0	2012-05-22 14:13:02	2012-05-22 14:13:02	t	t	574015644	Spree::ShippingMethod	t	Spree::Order
257525345	921666016	5.00	Shipping	Spree::Shipment	0	2012-05-22 14:13:02	2012-05-22 14:13:02	t	t	574015644	Spree::ShippingMethod	t	Spree::Order
374396901	803655784	5.00	Shipping	Spree::Shipment	0	2012-05-22 14:13:02	2012-05-22 14:13:02	t	t	574015644	Spree::ShippingMethod	t	Spree::Order
559409010	417456373	5.00	Shipping	Spree::Shipment	0	2012-05-22 14:13:02	2012-05-22 14:13:02	t	t	574015644	Spree::ShippingMethod	t	Spree::Order
1060336339	109409616	5.00	Shipping	Spree::Shipment	0	2012-05-22 14:13:02	2012-05-22 14:13:02	t	t	574015644	Spree::ShippingMethod	t	Spree::Order
137642570	830621127	5.00	Shipping	Spree::Shipment	0	2012-05-22 14:13:02	2012-05-22 14:13:02	t	t	574015644	Spree::ShippingMethod	t	Spree::Order
289215486	680203391	5.00	Shipping	Spree::Shipment	0	2012-05-22 14:13:02	2012-05-22 14:13:02	t	t	574015644	Spree::ShippingMethod	t	Spree::Order
641344363	529278188	5.00	Shipping	Spree::Shipment	0	2012-05-22 14:13:02	2012-05-22 14:13:02	t	t	574015644	Spree::ShippingMethod	t	Spree::Order
914702076	255015291	5.00	Shipping	Spree::Shipment	0	2012-05-22 14:13:02	2012-05-22 14:13:02	t	t	574015644	Spree::ShippingMethod	t	Spree::Order
25300591	942934510	5.00	Shipping	Spree::Shipment	0	2012-05-22 14:13:02	2012-05-22 14:13:02	t	t	574015644	Spree::ShippingMethod	t	Spree::Order
326362381	717611658	5.00	Shipping	Spree::Shipment	0	2012-05-22 14:13:02	2012-05-22 14:13:02	t	t	574015644	Spree::ShippingMethod	t	Spree::Order
611636640	499307037	5.00	Shipping	Spree::Shipment	0	2012-05-22 14:13:02	2012-05-22 14:13:02	t	t	574015644	Spree::ShippingMethod	t	Spree::Order
1031636008	80446377	5.00	Shipping	Spree::Shipment	0	2012-05-22 14:13:02	2012-05-22 14:13:02	t	t	574015644	Spree::ShippingMethod	t	Spree::Order
175813809	869053234	5.00	Shipping	Spree::Shipment	0	2012-05-22 14:13:02	2012-05-22 14:13:02	t	t	574015644	Spree::ShippingMethod	t	Spree::Order
337518868	765994643	5.00	Shipping	Spree::Shipment	0	2012-05-22 14:13:02	2012-05-22 14:13:02	t	t	574015644	Spree::ShippingMethod	t	Spree::Order
588845447	447682054	5.00	Shipping	Spree::Shipment	0	2012-05-22 14:13:02	2012-05-22 14:13:02	t	t	574015644	Spree::ShippingMethod	t	Spree::Order
974143551	61228994	5.00	Shipping	Spree::Shipment	0	2012-05-22 14:13:02	2012-05-22 14:13:02	t	t	574015644	Spree::ShippingMethod	t	Spree::Order
219639976	882997035	5.00	Shipping	Spree::Shipment	0	2012-05-22 14:13:02	2012-05-22 14:13:02	t	t	574015644	Spree::ShippingMethod	t	Spree::Order
497577275	605973176	5.00	Shipping	Spree::Shipment	0	2012-05-22 14:13:02	2012-05-22 14:13:02	t	t	574015644	Spree::ShippingMethod	t	Spree::Order
716135858	320428591	5.00	Shipping	Spree::Shipment	0	2012-05-22 14:13:02	2012-05-22 14:13:02	t	t	574015644	Spree::ShippingMethod	t	Spree::Order
174642252	870241227	5.00	Shipping	Spree::Shipment	0	2012-05-22 14:13:02	2012-05-22 14:13:02	t	t	574015644	Spree::ShippingMethod	t	Spree::Order
1030743263	81388382	5.00	Shipping	Spree::Shipment	0	2012-05-22 14:13:02	2012-05-22 14:13:02	t	t	574015644	Spree::ShippingMethod	t	Spree::Order
610710887	500216554	5.00	Shipping	Spree::Shipment	0	2012-05-22 14:13:02	2012-05-22 14:13:02	t	t	574015644	Spree::ShippingMethod	t	Spree::Order
325158384	718766707	5.00	Shipping	Spree::Shipment	0	2012-05-22 14:13:02	2012-05-22 14:13:02	t	t	574015644	Spree::ShippingMethod	t	Spree::Order
218435669	884152274	5.00	Shipping	Spree::Shipment	0	2012-05-22 14:13:02	2012-05-22 14:13:02	t	t	574015644	Spree::ShippingMethod	t	Spree::Order
973217992	62138181	5.00	Shipping	Spree::Shipment	0	2012-05-22 14:13:02	2012-05-22 14:13:02	t	t	574015644	Spree::ShippingMethod	t	Spree::Order
587952512	448624385	5.00	Shipping	Spree::Shipment	0	2012-05-22 14:13:02	2012-05-22 14:13:02	t	t	574015644	Spree::ShippingMethod	t	Spree::Order
336347625	767182442	5.00	Shipping	Spree::Shipment	0	2012-05-22 14:13:02	2012-05-22 14:13:02	t	t	574015644	Spree::ShippingMethod	t	Spree::Order
78863482	1023761401	5.00	Shipping	Spree::Shipment	0	2012-05-22 14:13:02	2012-05-22 14:13:02	t	t	574015644	Spree::ShippingMethod	t	Spree::Order
867462385	167930736	5.00	Shipping	Spree::Shipment	0	2012-05-22 14:13:02	2012-05-22 14:13:02	t	t	574015644	Spree::ShippingMethod	t	Spree::Order
233883781	877055750	5.00	Shipping	Spree::Shipment	0	2012-05-22 14:13:02	2012-05-22 14:13:02	t	t	574015644	Spree::ShippingMethod	t	Spree::Order
989329428	54656917	5.00	Shipping	Spree::Shipment	0	2012-05-22 14:13:02	2012-05-22 14:13:02	t	t	574015644	Spree::ShippingMethod	t	Spree::Order
603892140	440970793	5.00	Shipping	Spree::Shipment	0	2012-05-22 14:13:02	2012-05-22 14:13:02	t	t	574015644	Spree::ShippingMethod	t	Spree::Order
351902017	760192702	5.00	Shipping	Spree::Shipment	0	2012-05-22 14:13:02	2012-05-22 14:13:02	t	t	574015644	Spree::ShippingMethod	t	Spree::Order
178064540	858458911	5.00	Shipping	Spree::Shipment	0	2012-05-22 14:13:02	2012-05-22 14:13:02	t	t	574015644	Spree::ShippingMethod	t	Spree::Order
1033518091	70007694	5.00	Shipping	Spree::Shipment	0	2012-05-22 14:13:02	2012-05-22 14:13:02	t	t	574015644	Spree::ShippingMethod	t	Spree::Order
613641651	488991282	5.00	Shipping	Spree::Shipment	0	2012-05-22 14:13:02	2012-05-22 14:13:02	t	t	574015644	Spree::ShippingMethod	t	Spree::Order
328490280	706894503	5.00	Shipping	Spree::Shipment	0	2012-05-22 14:13:02	2012-05-22 14:13:02	t	t	574015644	Spree::ShippingMethod	t	Spree::Order
53166263	983385912	5.00	Shipping	Spree::Shipment	0	2012-05-22 14:13:02	2012-05-22 14:13:02	t	t	574015644	Spree::ShippingMethod	t	Spree::Order
875327522	228226979	5.00	Shipping	Spree::Shipment	0	2012-05-22 14:13:02	2012-05-22 14:13:02	t	t	574015644	Spree::ShippingMethod	t	Spree::Order
351009220	761134663	5.00	Shipping	Spree::Shipment	0	2012-05-22 14:13:02	2012-05-22 14:13:02	t	t	574015644	Spree::ShippingMethod	t	Spree::Order
602720595	442158806	5.00	Shipping	Spree::Shipment	0	2012-05-22 14:13:02	2012-05-22 14:13:02	t	t	574015644	Spree::ShippingMethod	t	Spree::Order
988125419	55811946	5.00	Shipping	Spree::Shipment	0	2012-05-22 14:13:02	2012-05-22 14:13:02	t	t	574015644	Spree::ShippingMethod	t	Spree::Order
232958080	877965311	5.00	Shipping	Spree::Shipment	0	2012-05-22 14:13:02	2012-05-22 14:13:02	t	t	574015644	Spree::ShippingMethod	t	Spree::Order
327564765	707803742	5.00	Shipping	Spree::Shipment	0	2012-05-22 14:13:02	2012-05-22 14:13:02	t	t	574015644	Spree::ShippingMethod	t	Spree::Order
612437324	490146509	5.00	Shipping	Spree::Shipment	0	2012-05-22 14:13:02	2012-05-22 14:13:02	t	t	574015644	Spree::ShippingMethod	t	Spree::Order
1032346868	71195505	5.00	Shipping	Spree::Shipment	0	2012-05-22 14:13:02	2012-05-22 14:13:02	t	t	574015644	Spree::ShippingMethod	t	Spree::Order
177171561	859401190	5.00	Shipping	Spree::Shipment	0	2012-05-22 14:13:02	2012-05-22 14:13:02	t	t	574015644	Spree::ShippingMethod	t	Spree::Order
439382518	596014713	5.00	Shipping	Spree::Shipment	0	2012-05-22 14:13:02	2012-05-22 14:13:02	t	t	574015644	Spree::ShippingMethod	t	Spree::Order
758595937	344016612	5.00	Shipping	Spree::Shipment	0	2012-05-22 14:13:02	2012-05-22 14:13:02	t	t	574015644	Spree::ShippingMethod	t	Spree::Order
651518922	1020487291	5.00	Shipping	Spree::Shipment	0	2012-05-22 14:13:02	2012-05-22 14:13:02	t	t	574015644	Spree::ShippingMethod	t	Spree::Order
654051466	615724322	3.10	Tax	Spree::Order	615724322	2012-05-22 14:13:02	2012-05-22 14:13:02	t	f	967941380	Spree::TaxRate	t	Spree::Order
751593067	335228811	3.75	Tax	Spree::Order	335228811	2012-05-22 14:13:02	2012-05-22 14:13:02	t	f	967941380	Spree::TaxRate	t	Spree::Order
820380991	265374943	0.80	Tax	Spree::Order	265374943	2012-05-22 14:13:02	2012-05-22 14:13:02	t	f	967941380	Spree::TaxRate	t	Spree::Order
821323208	264449064	0.80	Tax	Spree::Order	264449064	2012-05-22 14:13:02	2012-05-22 14:13:02	t	f	967941380	Spree::TaxRate	t	Spree::Order
145933207	931498615	3.20	Tax	Spree::Order	931498615	2012-05-22 14:13:02	2012-05-22 14:13:02	t	f	967941380	Spree::TaxRate	t	Spree::Order
265119607	821702295	3.20	Tax	Spree::Order	821702295	2012-05-22 14:13:02	2012-05-22 14:13:02	t	f	967941380	Spree::TaxRate	t	Spree::Order
333906979	751848899	2.40	Tax	Spree::Order	751848899	2012-05-22 14:13:02	2012-05-22 14:13:02	t	f	967941380	Spree::TaxRate	t	Spree::Order
183391643	903421051	3.20	Tax	Spree::Order	903421051	2012-05-22 14:13:02	2012-05-22 14:13:02	t	f	967941380	Spree::TaxRate	t	Spree::Order
1038705934	48114926	0.80	Tax	Spree::Order	48114926	2012-05-22 14:13:02	2012-05-22 14:13:02	t	f	967941380	Spree::TaxRate	t	Spree::Order
334849242	750923066	3.20	Tax	Spree::Order	750923066	2012-05-22 14:13:02	2012-05-22 14:13:02	t	f	967941380	Spree::TaxRate	t	Spree::Order
594167942	475857254	2.40	Tax	Spree::Order	475857254	2012-05-22 14:13:02	2012-05-22 14:13:02	t	f	967941380	Spree::TaxRate	t	Spree::Order
718169172	368651700	0.80	Tax	Spree::Order	368651700	2012-05-22 14:13:02	2012-05-22 14:13:02	t	f	967941380	Spree::TaxRate	t	Spree::Order
1073043777	1069267038	615.00	Clothing 5.0%	Spree::Order	1069267038	2012-09-13 12:48:10.023701	2012-09-13 12:49:44.785584	f	t	967941380	Spree::TaxRate	t	Spree::Order
1073043778	1053930493	5.00	Shipping	Spree::Shipment	1069267038	2012-09-13 12:48:17.634329	2012-09-13 12:48:17.634329	t	\N	574015644	Spree::ShippingMethod	t	Spree::Order
1073043774	1035625630	2.75	Tax	Spree::Order	1035625630	2012-05-22 14:13:02	2012-05-22 14:13:02	t	f	967941380	Spree::TaxRate	t	Spree::Order
1073043780	1053930495	5.00	Shipping	Spree::Shipment	1069267040	2013-03-30 15:47:16.003702	2013-03-30 15:47:16.003702	t	\N	574015644	Spree::ShippingMethod	t	Spree::Order
1073043779	1053930494	5.00	Shipping	Spree::Shipment	1069267030	2013-03-19 16:06:42.291576	2013-03-19 16:06:42.291576	t	\N	574015644	Spree::ShippingMethod	t	Spree::Order
\.


--
-- Data for Name: spree_assets; Type: TABLE DATA; Schema: public; Owner: alain
--

COPY spree_assets (id, viewable_id, attachment_width, attachment_height, attachment_file_size, "position", viewable_type, attachment_content_type, attachment_file_name, type, attachment_updated_at, alt) FROM stdin;
1061	1013589553	200	171	4251	1	Spree::Variant	image/jpeg	00C800B404085660-photo-televiseur-tv-sony-bravia-kdl-22ex320.jpg	Spree::Image	2013-03-26 19:40:05.533846	\N
1048	1013589503	500	474	24560	1	Spree::Variant	image/jpeg	sonytv.jpg	Spree::Image	2012-10-29 13:38:17.906768	\N
1045	1013589497	355	250	71405	1	Spree::Variant	image/jpeg	KDL55HX850_NL.jpg	Spree::Image	2012-10-29 13:10:38.110389	\N
1049	1013589506	500	350	9325	1	Spree::Variant	image/jpeg	11159878-cheap-sony-bdp-s370-blu-ray-disc-player-for-sales.jpg	Spree::Image	2012-11-02 14:30:03.325567	\N
1050	1013589511	500	375	9264	1	Spree::Variant	image/jpeg	Sony_Bravia.jpg	Spree::Image	2012-11-02 14:59:32.893634	\N
1051	1013589514	800	533	57425	1	Spree::Variant	image/jpeg	Ayşegül-Aldemir-Yazıları-6.jpg	Spree::Image	2013-02-26 15:49:08.378559	\N
1052	1013589518	800	533	57425	1	Spree::Variant	image/jpeg	Ayşegül-Aldemir-Yazıları-6.jpg	Spree::Image	2013-02-26 15:50:19.784662	\N
1056	1013589533	800	533	57425	1	Spree::Variant	image/jpeg	Ayşegül-Aldemir-Yazıları-6.jpg	Spree::Image	2013-02-26 16:53:23.410891	\N
1057	1013589536	800	533	57425	1	Spree::Variant	image/jpeg	Ayşegül-Aldemir-Yazıları-6.jpg	Spree::Image	2013-02-26 16:57:40.442248	\N
1059	1013589542	800	533	57425	1	Spree::Variant	image/jpeg	Ayşegül-Aldemir-Yazıları-6.jpg	Spree::Image	2013-02-26 17:17:38.139905	\N
1060	1013589546	1200	840	313705	1	Spree::Variant	image/jpeg	tele-lcd-947.jpg	Spree::Image	2013-03-12 11:25:48.977867	\N
\.


--
-- Data for Name: spree_calculators; Type: TABLE DATA; Schema: public; Owner: alain
--

COPY spree_calculators (id, type, calculable_id, calculable_type, created_at, updated_at) FROM stdin;
574015644	Spree::Calculator::FlatRate	574015644	Spree::ShippingMethod	2012-05-22 14:13:03	2012-05-22 14:13:03
192811543	Spree::Calculator::FlatRate	192811543	Spree::ShippingMethod	2012-05-22 14:13:03	2012-05-22 14:13:03
13537749	Spree::Calculator::FlatRate	13537749	Spree::ShippingMethod	2012-05-22 14:13:03	2012-05-22 14:13:03
491052212	Spree::Calculator::FlatRate	713097208	Spree::Promotion	2012-05-22 14:13:03	2012-05-22 14:13:03
505539722	Spree::Calculator::DefaultTax	967941380	Spree::TaxRate	2012-05-22 14:13:03	2012-05-22 14:13:03
\.


--
-- Data for Name: spree_configurations; Type: TABLE DATA; Schema: public; Owner: alain
--

COPY spree_configurations (id, name, type, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: spree_countries; Type: TABLE DATA; Schema: public; Owner: alain
--

COPY spree_countries (id, iso_name, iso, iso3, name, numcode) FROM stdin;
39	CHAD	TD	TCD	Chad	148
65	FAROE ISLANDS	FO	FRO	Faroe Islands	234
92	INDIA	IN	IND	India	356
146	NICARAGUA	NI	NIC	Nicaragua	558
172	SAINT LUCIA	LC	LCA	Saint Lucia	662
66	FIJI	FJ	FJI	Fiji	242
93	INDONESIA	ID	IDN	Indonesia	360
147	NIGER	NE	NER	Niger	562
173	SAINT PIERRE AND MIQUELON	PM	SPM	Saint Pierre and Miquelon	666
67	FINLAND	FI	FIN	Finland	246
148	NIGERIA	NG	NGA	Nigeria	566
174	SAINT VINCENT AND THE GRENADINES	VC	VCT	Saint Vincent and the Grenadines	670
68	FRANCE	FR	FRA	France	250
94	IRAN, ISLAMIC REPUBLIC OF	IR	IRN	Iran, Islamic Republic of	364
149	NIUE	NU	NIU	Niue	570
175	SAMOA	WS	WSM	Samoa	882
69	FRENCH GUIANA	GF	GUF	French Guiana	254
95	IRAQ	IQ	IRQ	Iraq	368
176	SAN MARINO	SM	SMR	San Marino	674
96	IRELAND	IE	IRL	Ireland	372
177	SAO TOME AND PRINCIPE	ST	STP	Sao Tome and Principe	678
97	ISRAEL	IL	ISR	Israel	376
178	SAUDI ARABIA	SA	SAU	Saudi Arabia	682
98	ITALY	IT	ITA	Italy	380
179	SENEGAL	SN	SEN	Senegal	686
99	JAMAICA	JM	JAM	Jamaica	388
100	JAPAN	JP	JPN	Japan	392
101	JORDAN	JO	JOR	Jordan	400
20	BELGIUM	BE	BEL	Belgium	56
21	BELIZE	BZ	BLZ	Belize	84
102	KAZAKHSTAN	KZ	KAZ	Kazakhstan	398
210	UGANDA	UG	UGA	Uganda	800
22	BENIN	BJ	BEN	Benin	204
103	KENYA	KE	KEN	Kenya	404
211	UKRAINE	UA	UKR	Ukraine	804
23	BERMUDA	BM	BMU	Bermuda	60
104	KIRIBATI	KI	KIR	Kiribati	296
130	MEXICO	MX	MEX	Mexico	484
212	UNITED ARAB EMIRATES	AE	ARE	United Arab Emirates	784
24	BHUTAN	BT	BTN	Bhutan	64
50	CUBA	CU	CUB	Cuba	192
105	KOREA, DEMOCRATIC PEOPLE'S REPUBLIC OF	KP	PRK	North Korea	408
131	MICRONESIA, FEDERATED STATES OF	FM	FSM	Micronesia, Federated States of	583
213	UNITED KINGDOM	GB	GBR	United Kingdom	826
25	BOLIVIA	BO	BOL	Bolivia	68
51	CYPRUS	CY	CYP	Cyprus	196
106	KOREA, REPUBLIC OF	KR	KOR	South Korea	410
132	MOLDOVA, REPUBLIC OF	MD	MDA	Moldova, Republic of	498
214	UNITED STATES	US	USA	United States	840
26	BOSNIA AND HERZEGOVINA	BA	BIH	Bosnia and Herzegovina	70
52	CZECH REPUBLIC	CZ	CZE	Czech Republic	203
107	KUWAIT	KW	KWT	Kuwait	414
133	MONACO	MC	MCO	Monaco	492
215	URUGUAY	UY	URY	Uruguay	858
27	BOTSWANA	BW	BWA	Botswana	72
53	DENMARK	DK	DNK	Denmark	208
80	GUADELOUPE	GP	GLP	Guadeloupe	312
108	KYRGYZSTAN	KG	KGZ	Kyrgyzstan	417
134	MONGOLIA	MN	MNG	Mongolia	496
160	PHILIPPINES	PH	PHL	Philippines	608
28	BRAZIL	BR	BRA	Brazil	76
54	DJIBOUTI	DJ	DJI	Djibouti	262
81	GUAM	GU	GUM	Guam	316
109	LAO PEOPLE'S DEMOCRATIC REPUBLIC	LA	LAO	Lao People's Democratic Republic	418
135	MONTSERRAT	MS	MSR	Montserrat	500
161	PITCAIRN	PN	PCN	Pitcairn	612
216	UZBEKISTAN	UZ	UZB	Uzbekistan	860
29	BRUNEI DARUSSALAM	BN	BRN	Brunei Darussalam	96
55	DOMINICA	DM	DMA	Dominica	212
82	GUATEMALA	GT	GTM	Guatemala	320
136	MOROCCO	MA	MAR	Morocco	504
162	POLAND	PL	POL	Poland	616
217	VANUATU	VU	VUT	Vanuatu	548
56	DOMINICAN REPUBLIC	DO	DOM	Dominican Republic	214
137	MOZAMBIQUE	MZ	MOZ	Mozambique	508
163	PORTUGAL	PT	PRT	Portugal	620
190	SUDAN	SD	SDN	Sudan	736
218	VENEZUELA	VE	VEN	Venezuela	862
57	ECUADOR	EC	ECU	Ecuador	218
83	GUINEA	GN	GIN	Guinea	324
138	MYANMAR	MM	MMR	Myanmar	104
164	PUERTO RICO	PR	PRI	Puerto Rico	630
191	SURINAME	SR	SUR	Suriname	740
219	VIET NAM	VN	VNM	Viet Nam	704
58	EGYPT	EG	EGY	Egypt	818
84	GUINEA-BISSAU	GW	GNB	Guinea-Bissau	624
139	NAMIBIA	NA	NAM	Namibia	516
165	QATAR	QA	QAT	Qatar	634
192	SVALBARD AND JAN MAYEN	SJ	SJM	Svalbard and Jan Mayen	744
59	EL SALVADOR	SV	SLV	El Salvador	222
85	GUYANA	GY	GUY	Guyana	328
166	REUNION	RE	REU	Reunion	638
86	HAITI	HT	HTI	Haiti	332
167	ROMANIA	RO	ROM	Romania	642
193	SWAZILAND	SZ	SWZ	Swaziland	748
87	HOLY SEE (VATICAN CITY STATE)	VA	VAT	Holy See (Vatican City State)	336
168	RUSSIAN FEDERATION	RU	RUS	Russian Federation	643
194	SWEDEN	SE	SWE	Sweden	752
88	HONDURAS	HN	HND	Honduras	340
169	RWANDA	RW	RWA	Rwanda	646
195	SWITZERLAND	CH	CHE	Switzerland	756
89	HONG KONG	HK	HKG	Hong Kong	344
196	SYRIAN ARAB REPUBLIC	SY	SYR	Syrian Arab Republic	760
197	TAIWAN, PROVINCE OF CHINA	TW	TWN	Taiwan	158
198	TAJIKISTAN	TJ	TJK	Tajikistan	762
199	TANZANIA, UNITED REPUBLIC OF	TZ	TZA	Tanzania, United Republic of	834
10	ARMENIA	AM	ARM	Armenia	51
11	ARUBA	AW	ABW	Aruba	533
12	AUSTRALIA	AU	AUS	Australia	36
200	THAILAND	TH	THA	Thailand	764
13	AUSTRIA	AT	AUT	Austria	40
120	MADAGASCAR	MG	MDG	Madagascar	450
201	TOGO	TG	TGO	Togo	768
14	AZERBAIJAN	AZ	AZE	Azerbaijan	31
40	CHILE	CL	CHL	Chile	152
121	MALAWI	MW	MWI	Malawi	454
202	TOKELAU	TK	TKL	Tokelau	772
15	BAHAMAS	BS	BHS	Bahamas	44
41	CHINA	CN	CHN	China	156
122	MALAYSIA	MY	MYS	Malaysia	458
203	TONGA	TO	TON	Tonga	776
16	BAHRAIN	BH	BHR	Bahrain	48
42	COLOMBIA	CO	COL	Colombia	170
123	MALDIVES	MV	MDV	Maldives	462
204	TRINIDAD AND TOBAGO	TT	TTO	Trinidad and Tobago	780
17	BANGLADESH	BD	BGD	Bangladesh	50
43	COMOROS	KM	COM	Comoros	174
70	FRENCH POLYNESIA	PF	PYF	French Polynesia	258
124	MALI	ML	MLI	Mali	466
150	NORFOLK ISLAND	NF	NFK	Norfolk Island	574
205	TUNISIA	TN	TUN	Tunisia	788
18	BARBADOS	BB	BRB	Barbados	52
44	CONGO	CG	COG	Congo	178
71	GABON	GA	GAB	Gabon	266
125	MALTA	MT	MLT	Malta	470
151	NORTHERN MARIANA ISLANDS	MP	MNP	Northern Mariana Islands	580
206	TURKEY	TR	TUR	Turkey	792
45	CONGO, THE DEMOCRATIC REPUBLIC OF THE	CD	COD	Congo, the Democratic Republic of the	180
126	MARSHALL ISLANDS	MH	MHL	Marshall Islands	584
152	NORWAY	NO	NOR	Norway	578
207	TURKMENISTAN	TM	TKM	Turkmenistan	795
19	BELARUS	BY	BLR	Belarus	112
46	COOK ISLANDS	CK	COK	Cook Islands	184
72	GAMBIA	GM	GMB	Gambia	270
127	MARTINIQUE	MQ	MTQ	Martinique	474
153	OMAN	OM	OMN	Oman	512
180	SEYCHELLES	SC	SYC	Seychelles	690
208	TURKS AND CAICOS ISLANDS	TC	TCA	Turks and Caicos Islands	796
73	GEORGIA	GE	GEO	Georgia	268
128	MAURITANIA	MR	MRT	Mauritania	478
154	PAKISTAN	PK	PAK	Pakistan	586
181	SIERRA LEONE	SL	SLE	Sierra Leone	694
209	TUVALU	TV	TUV	Tuvalu	798
47	COSTA RICA	CR	CRI	Costa Rica	188
74	GERMANY	DE	DEU	Germany	276
129	MAURITIUS	MU	MUS	Mauritius	480
155	PALAU	PW	PLW	Palau	585
48	COTE D'IVOIRE	CI	CIV	Cote D'Ivoire	384
156	PANAMA	PA	PAN	Panama	591
182	SINGAPORE	SG	SGP	Singapore	702
49	CROATIA	HR	HRV	Croatia	191
75	GHANA	GH	GHA	Ghana	288
157	PAPUA NEW GUINEA	PG	PNG	Papua New Guinea	598
183	SLOVAKIA	SK	SVK	Slovakia	703
76	GIBRALTAR	GI	GIB	Gibraltar	292
158	PARAGUAY	PY	PRY	Paraguay	600
184	SLOVENIA	SI	SVN	Slovenia	705
77	GREECE	GR	GRC	Greece	300
159	PERU	PE	PER	Peru	604
185	SOLOMON ISLANDS	SB	SLB	Solomon Islands	90
78	GREENLAND	GL	GRL	Greenland	304
186	SOMALIA	SO	SOM	Somalia	706
79	GRENADA	GD	GRD	Grenada	308
187	SOUTH AFRICA	ZA	ZAF	South Africa	710
188	SPAIN	ES	ESP	Spain	724
189	SRI LANKA	LK	LKA	Sri Lanka	144
1	AFGHANISTAN	AF	AFG	Afghanistan	4
2	ALBANIA	AL	ALB	Albania	8
3	ALGERIA	DZ	DZA	Algeria	12
110	LATVIA	LV	LVA	Latvia	428
4	AMERICAN SAMOA	AS	ASM	American Samoa	16
30	BULGARIA	BG	BGR	Bulgaria	100
111	LEBANON	LB	LBN	Lebanon	422
5	ANDORRA	AD	AND	Andorra	20
31	BURKINA FASO	BF	BFA	Burkina Faso	854
112	LESOTHO	LS	LSO	Lesotho	426
6	ANGOLA	AO	AGO	Angola	24
32	BURUNDI	BI	BDI	Burundi	108
113	LIBERIA	LR	LBR	Liberia	430
220	VIRGIN ISLANDS, BRITISH	VG	VGB	Virgin Islands, British	92
7	ANGUILLA	AI	AIA	Anguilla	660
33	CAMBODIA	KH	KHM	Cambodia	116
60	EQUATORIAL GUINEA	GQ	GNQ	Equatorial Guinea	226
114	LIBYAN ARAB JAMAHIRIYA	LY	LBY	Libyan Arab Jamahiriya	434
140	NAURU	NR	NRU	Nauru	520
221	VIRGIN ISLANDS, U.S.	VI	VIR	Virgin Islands, U.S.	850
8	ANTIGUA AND BARBUDA	AG	ATG	Antigua and Barbuda	28
34	CAMEROON	CM	CMR	Cameroon	120
115	LIECHTENSTEIN	LI	LIE	Liechtenstein	438
141	NEPAL	NP	NPL	Nepal	524
222	WALLIS AND FUTUNA	WF	WLF	Wallis and Futuna	876
223	WESTERN SAHARA	EH	ESH	Western Sahara	732
9	ARGENTINA	AR	ARG	Argentina	32
35	CANADA	CA	CAN	Canada	124
61	ERITREA	ER	ERI	Eritrea	232
116	LITHUANIA	LT	LTU	Lithuania	440
142	NETHERLANDS	NL	NLD	Netherlands	528
224	YEMEN	YE	YEM	Yemen	887
36	CAPE VERDE	CV	CPV	Cape Verde	132
62	ESTONIA	EE	EST	Estonia	233
117	LUXEMBOURG	LU	LUX	Luxembourg	442
143	NETHERLANDS ANTILLES	AN	ANT	Netherlands Antilles	530
170	SAINT HELENA	SH	SHN	Saint Helena	654
225	ZAMBIA	ZM	ZMB	Zambia	894
37	CAYMAN ISLANDS	KY	CYM	Cayman Islands	136
63	ETHIOPIA	ET	ETH	Ethiopia	231
90	HUNGARY	HU	HUN	Hungary	348
118	MACAO	MO	MAC	Macao	446
144	NEW CALEDONIA	NC	NCL	New Caledonia	540
226	ZIMBABWE	ZW	ZWE	Zimbabwe	716
38	CENTRAL AFRICAN REPUBLIC	CF	CAF	Central African Republic	140
64	FALKLAND ISLANDS (MALVINAS)	FK	FLK	Falkland Islands (Malvinas)	238
91	ICELAND	IS	ISL	Iceland	352
119	MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF	MK	MKD	Macedonia	807
145	NEW ZEALAND	NZ	NZL	New Zealand	554
171	SAINT KITTS AND NEVIS	KN	KNA	Saint Kitts and Nevis	659
\.


--
-- Data for Name: spree_credit_cards; Type: TABLE DATA; Schema: public; Owner: alain
--

COPY spree_credit_cards (id, month, year, cc_type, last_digits, first_name, last_name, start_month, start_year, issue_number, address_id, created_at, updated_at, gateway_customer_profile_id, gateway_payment_profile_id) FROM stdin;
1	12	2014	visa	1111	Sean	Schofield	\N	\N	\N	\N	2012-05-22 14:13:08.105374	2012-05-22 14:13:08.105374	BGS-1234	\N
2	9	2012	\N	3444	Gaston	Lagaffe	\N	\N	\N	\N	2012-09-13 12:48:46.778302	2012-09-13 12:48:46.833246	FAIL-525302	\N
3	9	2012	\N	6666	Gaston	Lagaffe	\N	\N	\N	\N	2012-09-13 12:49:00.20871	2012-09-13 12:49:00.212968	FAIL-221402	\N
\.


--
-- Data for Name: spree_gateways; Type: TABLE DATA; Schema: public; Owner: alain
--

COPY spree_gateways (id, type, name, description, active, environment, server, test_mode, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: spree_inventory_units; Type: TABLE DATA; Schema: public; Owner: alain
--

COPY spree_inventory_units (id, lock_version, state, variant_id, order_id, created_at, updated_at, shipment_id, return_authorization_id) FROM stdin;
1	0	sold	215054540	1035625630	2012-05-22 14:13:05.563042	2012-05-22 14:13:05.563042	1002961742	\N
2	0	sold	215054540	1035625630	2012-05-22 14:13:05.571487	2012-05-22 14:13:05.571487	1002961742	\N
3	0	sold	215054540	615724322	2012-05-22 14:13:05.578926	2012-05-22 14:13:05.578926	583969526	\N
4	0	sold	215054540	330565047	2012-05-22 14:13:05.586046	2012-05-22 14:13:05.586046	365533797	\N
5	0	sold	215054540	330565047	2012-05-22 14:13:05.589225	2012-05-22 14:13:05.589225	365533797	\N
6	0	sold	215054540	231772182	2012-05-22 14:13:05.595689	2012-05-22 14:13:05.595689	195891138	\N
7	0	sold	215054540	231772182	2012-05-22 14:13:05.598841	2012-05-22 14:13:05.598841	195891138	\N
8	0	sold	215054540	231772182	2012-05-22 14:13:05.601879	2012-05-22 14:13:05.601879	195891138	\N
9	0	sold	215054540	987209861	2012-05-22 14:13:05.607949	2012-05-22 14:13:05.607949	1017790295	\N
10	0	sold	215054540	601813305	2012-05-22 14:13:05.614241	2012-05-22 14:13:05.614241	631467759	\N
11	0	sold	215054540	349815214	2012-05-22 14:13:05.620401	2012-05-22 14:13:05.620401	312761982	\N
12	0	sold	215054540	349815214	2012-05-22 14:13:05.623678	2012-05-22 14:13:05.623678	312761982	\N
13	0	sold	215054540	349815214	2012-05-22 14:13:05.626667	2012-05-22 14:13:05.626667	312761982	\N
14	0	sold	215054540	349815214	2012-05-22 14:13:05.629551	2012-05-22 14:13:05.629551	312761982	\N
15	0	sold	215054540	73849921	2012-05-22 14:13:05.635648	2012-05-22 14:13:05.635648	35341291	\N
16	0	sold	215054540	73849921	2012-05-22 14:13:05.638794	2012-05-22 14:13:05.638794	35341291	\N
17	0	sold	215054540	862055596	2012-05-22 14:13:05.645035	2012-05-22 14:13:05.645035	891057020	\N
18	0	sold	215054540	862055596	2012-05-22 14:13:05.648309	2012-05-22 14:13:05.648309	891057020	\N
19	0	sold	215054540	335228811	2012-05-22 14:13:05.657523	2012-05-22 14:13:05.657523	629437518	\N
20	0	sold	215054540	335228811	2012-05-22 14:13:05.661883	2012-05-22 14:13:05.661883	629437518	\N
21	0	sold	215054540	620502818	2012-05-22 14:13:05.669532	2012-05-22 14:13:05.669532	310592731	\N
22	0	sold	215054540	1039486630	2012-05-22 14:13:05.675934	2012-05-22 14:13:05.675934	193598819	\N
23	0	sold	215054540	1039486630	2012-05-22 14:13:05.679052	2012-05-22 14:13:05.679052	193598819	\N
24	0	sold	215054540	1039486630	2012-05-22 14:13:05.681942	2012-05-22 14:13:05.681942	193598819	\N
25	0	sold	215054540	183664179	2012-05-22 14:13:05.688021	2012-05-22 14:13:05.688021	1015883258	\N
26	0	sold	215054540	345435026	2012-05-22 14:13:05.694202	2012-05-22 14:13:05.694202	585740373	\N
27	0	sold	215054540	345435026	2012-05-22 14:13:05.697251	2012-05-22 14:13:05.697251	585740373	\N
28	0	sold	215054540	596761353	2012-05-22 14:13:05.703354	2012-05-22 14:13:05.703354	367952066	\N
29	0	sold	215054540	596761353	2012-05-22 14:13:05.706474	2012-05-22 14:13:05.706474	367952066	\N
30	0	sold	215054540	983075517	2012-05-22 14:13:05.712543	2012-05-22 14:13:05.712543	216519034	\N
31	0	sold	215054540	983075517	2012-05-22 14:13:05.715618	2012-05-22 14:13:05.715618	216519034	\N
32	0	sold	215054540	983075517	2012-05-22 14:13:05.718589	2012-05-22 14:13:05.718589	216519034	\N
33	0	sold	215054540	983075517	2012-05-22 14:13:05.721494	2012-05-22 14:13:05.721494	216519034	\N
34	0	sold	215054540	228571690	2012-05-22 14:13:05.727769	2012-05-22 14:13:05.727769	1004593649	\N
35	0	sold	215054540	228571690	2012-05-22 14:13:05.730943	2012-05-22 14:13:05.730943	1004593649	\N
36	0	sold	215054540	228571690	2012-05-22 14:13:05.733861	2012-05-22 14:13:05.733861	1004593649	\N
37	0	sold	215054540	228571690	2012-05-22 14:13:05.736779	2012-05-22 14:13:05.736779	1004593649	\N
38	0	sold	215054540	488679357	2012-05-22 14:13:05.742789	2012-05-22 14:13:05.742789	727710848	\N
39	0	sold	215054540	488679357	2012-05-22 14:13:05.74593	2012-05-22 14:13:05.74593	727710848	\N
40	0	sold	215054540	488679357	2012-05-22 14:13:05.748956	2012-05-22 14:13:05.748956	727710848	\N
41	0	sold	215054540	707237680	2012-05-22 14:13:05.755111	2012-05-22 14:13:05.755111	475581673	\N
42	0	sold	215054540	707237680	2012-05-22 14:13:05.758254	2012-05-22 14:13:05.758254	475581673	\N
43	0	sold	215054540	707237680	2012-05-22 14:13:05.761217	2012-05-22 14:13:05.761217	475581673	\N
44	0	sold	215054540	707237680	2012-05-22 14:13:05.764175	2012-05-22 14:13:05.764175	475581673	\N
45	0	sold	215054540	953580620	2012-05-22 14:13:05.77038	2012-05-22 14:13:05.77038	245966735	\N
46	0	sold	215054540	953580620	2012-05-22 14:13:05.773551	2012-05-22 14:13:05.773551	245966735	\N
47	0	sold	215054540	953580620	2012-05-22 14:13:05.776424	2012-05-22 14:13:05.776424	245966735	\N
48	0	sold	215054540	265374943	2012-05-22 14:13:05.782643	2012-05-22 14:13:05.782643	967710488	\N
49	0	sold	215054540	383262055	2012-05-22 14:13:05.788925	2012-05-22 14:13:05.788925	547833508	\N
50	0	sold	215054540	568274416	2012-05-22 14:13:05.795693	2012-05-22 14:13:05.795693	396391991	\N
51	0	sold	215054540	568274416	2012-05-22 14:13:05.799166	2012-05-22 14:13:05.799166	396391991	\N
52	0	sold	215054540	568274416	2012-05-22 14:13:05.802281	2012-05-22 14:13:05.802281	396391991	\N
53	0	sold	215054540	1069267029	2012-05-22 14:13:05.808535	2012-05-22 14:13:05.808535	163898264	\N
54	0	sold	215054540	1069267029	2012-05-22 14:13:05.811671	2012-05-22 14:13:05.811671	163898264	\N
55	0	sold	215054540	1069267029	2012-05-22 14:13:05.814907	2012-05-22 14:13:05.814907	163898264	\N
56	0	sold	215054540	1069267029	2012-05-22 14:13:05.817981	2012-05-22 14:13:05.817981	163898264	\N
57	0	sold	215054540	146573512	2012-05-22 14:13:05.824257	2012-05-22 14:13:05.824257	1053020929	\N
58	0	sold	215054540	146573512	2012-05-22 14:13:05.827414	2012-05-22 14:13:05.827414	1053020929	\N
59	0	sold	215054540	297130368	2012-05-22 14:13:05.833719	2012-05-22 14:13:05.833719	667583165	\N
60	0	sold	215054540	297130368	2012-05-22 14:13:05.836849	2012-05-22 14:13:05.836849	667583165	\N
61	0	sold	215054540	649259497	2012-05-22 14:13:05.84304	2012-05-22 14:13:05.84304	281915952	\N
62	0	sold	215054540	649259497	2012-05-22 14:13:05.846299	2012-05-22 14:13:05.846299	281915952	\N
63	0	sold	215054540	649259497	2012-05-22 14:13:05.849327	2012-05-22 14:13:05.849327	281915952	\N
64	0	sold	215054540	906884218	2012-05-22 14:13:05.855601	2012-05-22 14:13:05.855601	7516093	\N
65	0	sold	215054540	906884218	2012-05-22 14:13:05.858786	2012-05-22 14:13:05.858786	7516093	\N
66	0	sold	215054540	906884218	2012-05-22 14:13:05.86171	2012-05-22 14:13:05.86171	7516093	\N
67	0	sold	215054540	906884218	2012-05-22 14:13:05.864647	2012-05-22 14:13:05.864647	7516093	\N
68	0	sold	215054540	17482993	2012-05-22 14:13:05.87083	2012-05-22 14:13:05.87083	930455338	\N
69	0	sold	215054540	567102733	2012-05-22 14:13:05.877132	2012-05-22 14:13:05.877132	397547216	\N
70	0	sold	215054540	567102733	2012-05-22 14:13:05.880351	2012-05-22 14:13:05.880351	397547216	\N
71	0	sold	215054540	567102733	2012-05-22 14:13:05.883241	2012-05-22 14:13:05.883241	397547216	\N
72	0	sold	215054540	567102733	2012-05-22 14:13:05.886115	2012-05-22 14:13:05.886115	397547216	\N
73	0	sold	215054540	382369184	2012-05-22 14:13:05.89223	2012-05-22 14:13:05.89223	548742745	\N
74	0	sold	215054540	264449064	2012-05-22 14:13:05.898522	2012-05-22 14:13:05.898522	968652773	\N
75	0	sold	215054540	952376497	2012-05-22 14:13:05.904814	2012-05-22 14:13:05.904814	247154552	\N
76	0	sold	215054540	648055060	2012-05-22 14:13:05.993081	2012-05-22 14:13:05.993081	283103959	\N
77	0	sold	215054540	296204679	2012-05-22 14:13:06.001895	2012-05-22 14:13:06.001895	668525120	\N
78	0	sold	215054540	296204679	2012-05-22 14:13:06.006071	2012-05-22 14:13:06.006071	668525120	\N
79	0	sold	215054540	296204679	2012-05-22 14:13:06.009802	2012-05-22 14:13:06.009802	668525120	\N
80	0	sold	215054540	296204679	2012-05-22 14:13:06.013859	2012-05-22 14:13:06.013859	668525120	\N
81	0	sold	215054540	145680447	2012-05-22 14:13:06.022299	2012-05-22 14:13:06.022299	1053930492	\N
82	0	sold	215054540	145680447	2012-05-22 14:13:06.026361	2012-05-22 14:13:06.026361	1053930492	\N
83	0	sold	215054540	1068095656	2012-05-22 14:13:06.034554	2012-05-22 14:13:06.034554	165053295	\N
84	0	sold	215054540	1068095656	2012-05-22 14:13:06.038632	2012-05-22 14:13:06.038632	165053295	\N
85	0	sold	215054540	790021435	2012-05-22 14:13:06.047189	2012-05-22 14:13:06.047189	426352382	\N
86	0	sold	215054540	790021435	2012-05-22 14:13:06.051021	2012-05-22 14:13:06.051021	426352382	\N
87	0	sold	215054540	403830194	2012-05-22 14:13:06.060227	2012-05-22 14:13:06.060227	779005547	\N
88	0	sold	215054540	403830194	2012-05-22 14:13:06.06363	2012-05-22 14:13:06.06363	779005547	\N
89	0	sold	215054540	403830194	2012-05-22 14:13:06.066971	2012-05-22 14:13:06.066971	779005547	\N
90	0	sold	215054540	780983247	2012-05-22 14:13:06.073825	2012-05-22 14:13:06.073825	418611208	\N
91	0	sold	215054540	780983247	2012-05-22 14:13:06.077006	2012-05-22 14:13:06.077006	418611208	\N
92	0	sold	215054540	780983247	2012-05-22 14:13:06.080039	2012-05-22 14:13:06.080039	418611208	\N
93	0	sold	215054540	428600156	2012-05-22 14:13:06.086313	2012-05-22 14:13:06.086313	804565151	\N
94	0	sold	215054540	428600156	2012-05-22 14:13:06.089424	2012-05-22 14:13:06.089424	804565151	\N
95	0	sold	215054540	428600156	2012-05-22 14:13:06.092471	2012-05-22 14:13:06.092471	804565151	\N
96	0	sold	215054540	8567520	2012-05-22 14:13:06.098731	2012-05-22 14:13:06.098731	922607911	\N
97	0	sold	215054540	8567520	2012-05-22 14:13:06.101622	2012-05-22 14:13:06.101622	922607911	\N
98	0	sold	215054540	8567520	2012-05-22 14:13:06.104698	2012-05-22 14:13:06.104698	922607911	\N
99	0	sold	215054540	931498615	2012-05-22 14:13:06.111399	2012-05-22 14:13:06.111399	33214900	\N
100	0	sold	215054540	931498615	2012-05-22 14:13:06.114621	2012-05-22 14:13:06.114621	33214900	\N
101	0	sold	215054540	931498615	2012-05-22 14:13:06.117661	2012-05-22 14:13:06.117661	33214900	\N
102	0	sold	215054540	931498615	2012-05-22 14:13:06.120709	2012-05-22 14:13:06.120709	33214900	\N
103	0	sold	215054540	702619608	2012-05-22 14:13:06.126932	2012-05-22 14:13:06.126932	530465809	\N
104	0	sold	215054540	702619608	2012-05-22 14:13:06.130053	2012-05-22 14:13:06.130053	530465809	\N
105	0	sold	215054540	518401861	2012-05-22 14:13:06.136179	2012-05-22 14:13:06.136179	681145480	\N
106	0	sold	215054540	518401861	2012-05-22 14:13:06.139294	2012-05-22 14:13:06.139294	681145480	\N
107	0	sold	215054540	518401861	2012-05-22 14:13:06.142314	2012-05-22 14:13:06.142314	681145480	\N
108	0	sold	215054540	518401861	2012-05-22 14:13:06.145209	2012-05-22 14:13:06.145209	681145480	\N
109	0	sold	215054540	133136121	2012-05-22 14:13:06.151472	2012-05-22 14:13:06.151472	831530304	\N
110	0	sold	215054540	820530800	2012-05-22 14:13:06.157674	2012-05-22 14:13:06.157674	110564781	\N
111	0	sold	215054540	820530800	2012-05-22 14:13:06.160848	2012-05-22 14:13:06.160848	110564781	\N
112	0	sold	215054540	820530800	2012-05-22 14:13:06.163707	2012-05-22 14:13:06.163707	110564781	\N
113	0	sold	215054540	542594049	2012-05-22 14:13:06.170069	2012-05-22 14:13:06.170069	371722298	\N
114	0	sold	215054540	542594049	2012-05-22 14:13:06.173073	2012-05-22 14:13:06.173073	371722298	\N
115	0	sold	215054540	391144298	2012-05-22 14:13:06.179242	2012-05-22 14:13:06.179242	556742829	\N
116	0	sold	215054540	391144298	2012-05-22 14:13:06.182356	2012-05-22 14:13:06.182356	556742829	\N
117	0	sold	215054540	391144298	2012-05-22 14:13:06.185241	2012-05-22 14:13:06.185241	556742829	\N
118	0	sold	215054540	932702864	2012-05-22 14:13:06.191321	2012-05-22 14:13:06.191321	32026953	\N
119	0	sold	215054540	932702864	2012-05-22 14:13:06.194481	2012-05-22 14:13:06.194481	32026953	\N
120	0	sold	215054540	932702864	2012-05-22 14:13:06.197279	2012-05-22 14:13:06.197279	32026953	\N
121	0	sold	215054540	932702864	2012-05-22 14:13:06.200195	2012-05-22 14:13:06.200195	32026953	\N
122	0	sold	215054540	9493021	2012-05-22 14:13:06.206561	2012-05-22 14:13:06.206561	921666016	\N
123	0	sold	215054540	9493021	2012-05-22 14:13:06.209585	2012-05-22 14:13:06.209585	921666016	\N
124	0	sold	215054540	429493153	2012-05-22 14:13:06.215719	2012-05-22 14:13:06.215719	803655784	\N
125	0	sold	215054540	429493153	2012-05-22 14:13:06.218864	2012-05-22 14:13:06.218864	803655784	\N
126	0	sold	215054540	782154552	2012-05-22 14:13:06.225146	2012-05-22 14:13:06.225146	417456373	\N
127	0	sold	215054540	782154552	2012-05-22 14:13:06.228392	2012-05-22 14:13:06.228392	417456373	\N
128	0	sold	215054540	782154552	2012-05-22 14:13:06.231247	2012-05-22 14:13:06.231247	417456373	\N
129	0	sold	215054540	821702295	2012-05-22 14:13:06.237424	2012-05-22 14:13:06.237424	109409616	\N
130	0	sold	215054540	821702295	2012-05-22 14:13:06.240419	2012-05-22 14:13:06.240419	109409616	\N
131	0	sold	215054540	821702295	2012-05-22 14:13:06.243482	2012-05-22 14:13:06.243482	109409616	\N
132	0	sold	215054540	821702295	2012-05-22 14:13:06.246435	2012-05-22 14:13:06.246435	109409616	\N
133	0	sold	215054540	134028804	2012-05-22 14:13:06.252748	2012-05-22 14:13:06.252748	830621127	\N
134	0	sold	215054540	134028804	2012-05-22 14:13:06.256052	2012-05-22 14:13:06.256052	830621127	\N
135	0	sold	215054540	519327672	2012-05-22 14:13:06.262525	2012-05-22 14:13:06.262525	680203391	\N
136	0	sold	215054540	519327672	2012-05-22 14:13:06.265545	2012-05-22 14:13:06.265545	680203391	\N
137	0	sold	215054540	703823663	2012-05-22 14:13:06.271707	2012-05-22 14:13:06.271707	529278188	\N
138	0	sold	215054540	703823663	2012-05-22 14:13:06.274859	2012-05-22 14:13:06.274859	529278188	\N
139	0	sold	215054540	703823663	2012-05-22 14:13:06.277879	2012-05-22 14:13:06.277879	529278188	\N
140	0	sold	215054540	703823663	2012-05-22 14:13:06.280884	2012-05-22 14:13:06.280884	529278188	\N
141	0	sold	215054540	961307330	2012-05-22 14:13:06.286911	2012-05-22 14:13:06.286911	255015291	\N
142	0	sold	215054540	961307330	2012-05-22 14:13:06.289898	2012-05-22 14:13:06.289898	255015291	\N
143	0	sold	215054540	239817259	2012-05-22 14:13:06.296134	2012-05-22 14:13:06.296134	942934510	\N
144	0	sold	215054540	239817259	2012-05-22 14:13:06.299286	2012-05-22 14:13:06.299286	942934510	\N
145	0	sold	215054540	481999185	2012-05-22 14:13:06.305589	2012-05-22 14:13:06.305589	717611658	\N
146	0	sold	215054540	481999185	2012-05-22 14:13:06.308715	2012-05-22 14:13:06.308715	717611658	\N
147	0	sold	215054540	481999185	2012-05-22 14:13:06.311648	2012-05-22 14:13:06.311648	717611658	\N
148	0	sold	215054540	733841882	2012-05-22 14:13:06.3178	2012-05-22 14:13:06.3178	499307037	\N
149	0	sold	215054540	733841882	2012-05-22 14:13:06.320836	2012-05-22 14:13:06.320836	499307037	\N
150	0	sold	215054540	733841882	2012-05-22 14:13:06.323744	2012-05-22 14:13:06.323744	499307037	\N
151	0	sold	215054540	733841882	2012-05-22 14:13:06.326733	2012-05-22 14:13:06.326733	499307037	\N
152	0	sold	215054540	850712674	2012-05-22 14:13:06.332775	2012-05-22 14:13:06.332775	80446377	\N
153	0	sold	215054540	850712674	2012-05-22 14:13:06.335722	2012-05-22 14:13:06.335722	80446377	\N
154	0	sold	215054540	850712674	2012-05-22 14:13:06.338619	2012-05-22 14:13:06.338619	80446377	\N
155	0	sold	215054540	850712674	2012-05-22 14:13:06.341656	2012-05-22 14:13:06.341656	80446377	\N
156	0	sold	215054540	95676661	2012-05-22 14:13:06.34787	2012-05-22 14:13:06.34787	869053234	\N
157	0	sold	215054540	95676661	2012-05-22 14:13:06.351014	2012-05-22 14:13:06.351014	869053234	\N
158	0	sold	215054540	95676661	2012-05-22 14:13:06.353946	2012-05-22 14:13:06.353946	869053234	\N
159	0	sold	215054540	467107162	2012-05-22 14:13:06.360083	2012-05-22 14:13:06.360083	765994643	\N
160	0	sold	215054540	467107162	2012-05-22 14:13:06.363134	2012-05-22 14:13:06.363134	765994643	\N
161	0	sold	215054540	467107162	2012-05-22 14:13:06.366079	2012-05-22 14:13:06.366079	765994643	\N
162	0	sold	215054540	751848899	2012-05-22 14:13:06.37214	2012-05-22 14:13:06.37214	447682054	\N
163	0	sold	215054540	751848899	2012-05-22 14:13:06.375264	2012-05-22 14:13:06.375264	447682054	\N
164	0	sold	215054540	751848899	2012-05-22 14:13:06.378139	2012-05-22 14:13:06.378139	447682054	\N
165	0	sold	215054540	903421051	2012-05-22 14:13:06.384298	2012-05-22 14:13:06.384298	61228994	\N
166	0	sold	215054540	903421051	2012-05-22 14:13:06.387417	2012-05-22 14:13:06.387417	61228994	\N
167	0	sold	215054540	903421051	2012-05-22 14:13:06.390456	2012-05-22 14:13:06.390456	61228994	\N
168	0	sold	215054540	903421051	2012-05-22 14:13:06.393459	2012-05-22 14:13:06.393459	61228994	\N
169	0	sold	215054540	48114926	2012-05-22 14:13:06.399646	2012-05-22 14:13:06.399646	882997035	\N
170	0	sold	215054540	308359551	2012-05-22 14:13:06.405955	2012-05-22 14:13:06.405955	605973176	\N
171	0	sold	215054540	308359551	2012-05-22 14:13:06.409093	2012-05-22 14:13:06.409093	605973176	\N
172	0	sold	215054540	308359551	2012-05-22 14:13:06.412093	2012-05-22 14:13:06.412093	605973176	\N
173	0	sold	215054540	308359551	2012-05-22 14:13:06.415073	2012-05-22 14:13:06.415073	605973176	\N
174	0	sold	215054540	627442156	2012-05-22 14:13:06.42143	2012-05-22 14:13:06.42143	320428591	\N
175	0	sold	215054540	627442156	2012-05-22 14:13:06.424477	2012-05-22 14:13:06.424477	320428591	\N
176	0	sold	215054540	627442156	2012-05-22 14:13:06.427547	2012-05-22 14:13:06.427547	320428591	\N
177	0	sold	215054540	627442156	2012-05-22 14:13:06.430468	2012-05-22 14:13:06.430468	320428591	\N
178	0	sold	215054540	94472210	2012-05-22 14:13:06.436749	2012-05-22 14:13:06.436749	870241227	\N
179	0	sold	215054540	94472210	2012-05-22 14:13:06.439785	2012-05-22 14:13:06.439785	870241227	\N
180	0	sold	215054540	94472210	2012-05-22 14:13:06.442726	2012-05-22 14:13:06.442726	870241227	\N
181	0	sold	215054540	94472210	2012-05-22 14:13:06.446126	2012-05-22 14:13:06.446126	870241227	\N
182	0	sold	215054540	849787035	2012-05-22 14:13:06.452648	2012-05-22 14:13:06.452648	81388382	\N
183	0	sold	215054540	732948771	2012-05-22 14:13:06.459001	2012-05-22 14:13:06.459001	500216554	\N
184	0	sold	215054540	732948771	2012-05-22 14:13:06.462306	2012-05-22 14:13:06.462306	500216554	\N
185	0	sold	215054540	732948771	2012-05-22 14:13:06.465383	2012-05-22 14:13:06.465383	500216554	\N
186	0	sold	215054540	480827830	2012-05-22 14:13:06.47147	2012-05-22 14:13:06.47147	718766707	\N
187	0	sold	215054540	480827830	2012-05-22 14:13:06.474649	2012-05-22 14:13:06.474649	718766707	\N
188	0	sold	215054540	480827830	2012-05-22 14:13:06.477557	2012-05-22 14:13:06.477557	718766707	\N
189	0	sold	215054540	480827830	2012-05-22 14:13:06.480508	2012-05-22 14:13:06.480508	718766707	\N
190	0	sold	215054540	46943257	2012-05-22 14:13:06.48675	2012-05-22 14:13:06.48675	884152274	\N
191	0	sold	215054540	46943257	2012-05-22 14:13:06.489844	2012-05-22 14:13:06.489844	884152274	\N
192	0	sold	215054540	46943257	2012-05-22 14:13:06.493968	2012-05-22 14:13:06.493968	884152274	\N
193	0	sold	215054540	902528130	2012-05-22 14:13:06.500466	2012-05-22 14:13:06.500466	62138181	\N
194	0	sold	215054540	750923066	2012-05-22 14:13:06.506914	2012-05-22 14:13:06.506914	448624385	\N
195	0	sold	215054540	750923066	2012-05-22 14:13:06.509952	2012-05-22 14:13:06.509952	448624385	\N
196	0	sold	215054540	750923066	2012-05-22 14:13:06.513003	2012-05-22 14:13:06.513003	448624385	\N
197	0	sold	215054540	750923066	2012-05-22 14:13:06.516082	2012-05-22 14:13:06.516082	448624385	\N
198	0	sold	215054540	465903021	2012-05-22 14:13:06.522312	2012-05-22 14:13:06.522312	767182442	\N
199	0	sold	215054540	465903021	2012-05-22 14:13:06.525393	2012-05-22 14:13:06.525393	767182442	\N
200	0	sold	215054540	465903021	2012-05-22 14:13:06.528354	2012-05-22 14:13:06.528354	767182442	\N
201	0	sold	215054540	465903021	2012-05-22 14:13:06.531356	2012-05-22 14:13:06.531356	767182442	\N
202	0	sold	215054540	192544832	2012-05-22 14:13:06.537499	2012-05-22 14:13:06.537499	1023761401	\N
203	0	sold	215054540	1014837421	2012-05-22 14:13:06.543789	2012-05-22 14:13:06.543789	167930736	\N
204	0	sold	215054540	1014837421	2012-05-22 14:13:06.547038	2012-05-22 14:13:06.547038	167930736	\N
205	0	sold	215054540	37328065	2012-05-22 14:13:06.553454	2012-05-22 14:13:06.553454	877055750	\N
206	0	sold	215054540	37328065	2012-05-22 14:13:06.556616	2012-05-22 14:13:06.556616	877055750	\N
207	0	sold	215054540	37328065	2012-05-22 14:13:06.617134	2012-05-22 14:13:06.617134	877055750	\N
208	0	sold	215054540	893297750	2012-05-22 14:13:06.625659	2012-05-22 14:13:06.625659	54656917	\N
209	0	sold	215054540	893297750	2012-05-22 14:13:06.629928	2012-05-22 14:13:06.629928	54656917	\N
210	0	sold	215054540	893297750	2012-05-22 14:13:06.633874	2012-05-22 14:13:06.633874	54656917	\N
211	0	sold	215054540	893297750	2012-05-22 14:13:06.637776	2012-05-22 14:13:06.637776	54656917	\N
212	0	sold	215054540	741864942	2012-05-22 14:13:06.64554	2012-05-22 14:13:06.64554	440970793	\N
213	0	sold	215054540	456181117	2012-05-22 14:13:06.653483	2012-05-22 14:13:06.653483	760192702	\N
214	0	sold	215054540	456181117	2012-05-22 14:13:06.657345	2012-05-22 14:13:06.657345	760192702	\N
215	0	sold	215054540	456181117	2012-05-22 14:13:06.660683	2012-05-22 14:13:06.660683	760192702	\N
216	0	sold	215054540	89411802	2012-05-22 14:13:06.667543	2012-05-22 14:13:06.667543	858458911	\N
217	0	sold	215054540	89411802	2012-05-22 14:13:06.670911	2012-05-22 14:13:06.670911	858458911	\N
218	0	sold	215054540	844324943	2012-05-22 14:13:06.771045	2012-05-22 14:13:06.771045	70007694	\N
219	0	sold	215054540	727331319	2012-05-22 14:13:06.780277	2012-05-22 14:13:06.780277	488991282	\N
220	0	sold	215054540	727331319	2012-05-22 14:13:06.78443	2012-05-22 14:13:06.78443	488991282	\N
221	0	sold	215054540	727331319	2012-05-22 14:13:06.788448	2012-05-22 14:13:06.788448	488991282	\N
222	0	sold	215054540	727331319	2012-05-22 14:13:06.793763	2012-05-22 14:13:06.793763	488991282	\N
223	0	sold	215054540	475857254	2012-05-22 14:13:06.801758	2012-05-22 14:13:06.801758	706894503	\N
224	0	sold	215054540	475857254	2012-05-22 14:13:06.80526	2012-05-22 14:13:06.80526	706894503	\N
225	0	sold	215054540	475857254	2012-05-22 14:13:06.808473	2012-05-22 14:13:06.808473	706894503	\N
226	0	sold	215054540	216145139	2012-05-22 14:13:06.815486	2012-05-22 14:13:06.815486	983385912	\N
227	0	sold	215054540	216145139	2012-05-22 14:13:06.818958	2012-05-22 14:13:06.818958	983385912	\N
228	0	sold	215054540	216145139	2012-05-22 14:13:06.822182	2012-05-22 14:13:06.822182	983385912	\N
229	0	sold	215054540	1004874852	2012-05-22 14:13:06.829021	2012-05-22 14:13:06.829021	228226979	\N
230	0	sold	215054540	1004874852	2012-05-22 14:13:06.832379	2012-05-22 14:13:06.832379	228226979	\N
231	0	sold	215054540	1004874852	2012-05-22 14:13:06.835599	2012-05-22 14:13:06.835599	228226979	\N
232	0	sold	215054540	1004874852	2012-05-22 14:13:06.838826	2012-05-22 14:13:06.838826	228226979	\N
233	0	sold	215054540	455255426	2012-05-22 14:13:06.845071	2012-05-22 14:13:06.845071	761134663	\N
234	0	sold	215054540	455255426	2012-05-22 14:13:06.848151	2012-05-22 14:13:06.848151	761134663	\N
235	0	sold	215054540	455255426	2012-05-22 14:13:06.851126	2012-05-22 14:13:06.851126	761134663	\N
236	0	sold	215054540	455255426	2012-05-22 14:13:06.854195	2012-05-22 14:13:06.854195	761134663	\N
237	0	sold	215054540	740660503	2012-05-22 14:13:06.860525	2012-05-22 14:13:06.860525	442158806	\N
238	0	sold	215054540	740660503	2012-05-22 14:13:06.863618	2012-05-22 14:13:06.863618	442158806	\N
239	0	sold	215054540	740660503	2012-05-22 14:13:06.866646	2012-05-22 14:13:06.866646	442158806	\N
240	0	sold	215054540	740660503	2012-05-22 14:13:06.869717	2012-05-22 14:13:06.869717	442158806	\N
241	0	sold	215054540	892126383	2012-05-22 14:13:06.876032	2012-05-22 14:13:06.876032	55811946	\N
242	0	sold	215054540	36435006	2012-05-22 14:13:06.884178	2012-05-22 14:13:06.884178	877965311	\N
243	0	sold	215054540	36435006	2012-05-22 14:13:06.887583	2012-05-22 14:13:06.887583	877965311	\N
244	0	sold	215054540	36435006	2012-05-22 14:13:06.891348	2012-05-22 14:13:06.891348	877965311	\N
245	0	sold	215054540	36435006	2012-05-22 14:13:06.894516	2012-05-22 14:13:06.894516	877965311	\N
246	0	sold	215054540	474964377	2012-05-22 14:13:06.900833	2012-05-22 14:13:06.900833	707803742	\N
247	0	sold	215054540	474964377	2012-05-22 14:13:06.903951	2012-05-22 14:13:06.903951	707803742	\N
248	0	sold	215054540	474964377	2012-05-22 14:13:06.906952	2012-05-22 14:13:06.906952	707803742	\N
249	0	sold	215054540	726159630	2012-05-22 14:13:06.913192	2012-05-22 14:13:06.913192	490146509	\N
250	0	sold	215054540	726159630	2012-05-22 14:13:06.916377	2012-05-22 14:13:06.916377	490146509	\N
251	0	sold	215054540	726159630	2012-05-22 14:13:06.91933	2012-05-22 14:13:06.91933	490146509	\N
252	0	sold	215054540	726159630	2012-05-22 14:13:06.922346	2012-05-22 14:13:06.922346	490146509	\N
253	0	sold	215054540	843120822	2012-05-22 14:13:06.928944	2012-05-22 14:13:06.928944	71195505	\N
254	0	sold	215054540	88485925	2012-05-22 14:13:06.935347	2012-05-22 14:13:06.935347	859401190	\N
255	0	sold	215054540	368651700	2012-05-22 14:13:06.941639	2012-05-22 14:13:06.941639	596014713	\N
256	0	sold	215054540	587078949	2012-05-22 14:13:06.947879	2012-05-22 14:13:06.947879	344016612	\N
257	0	sold	215054540	587078949	2012-05-22 14:13:06.951008	2012-05-22 14:13:06.951008	344016612	\N
258	0	sold	215054540	587078949	2012-05-22 14:13:06.95397	2012-05-22 14:13:06.95397	344016612	\N
259	0	sold	215054540	539762571	2012-05-22 14:13:06.960012	2012-05-22 14:13:06.960012	1020487291	\N
260	0	sold	215054540	539762571	2012-05-22 14:13:06.963122	2012-05-22 14:13:06.963122	1020487291	\N
261	0	sold	504220342	1035625630	2012-05-22 14:13:06.96931	2012-05-22 14:13:06.96931	1002961742	\N
262	0	sold	504220342	615724322	2012-05-22 14:13:06.975585	2012-05-22 14:13:06.975585	583969526	\N
263	0	sold	504220342	615724322	2012-05-22 14:13:06.978606	2012-05-22 14:13:06.978606	583969526	\N
264	0	sold	504220342	330565047	2012-05-22 14:13:06.984657	2012-05-22 14:13:06.984657	365533797	\N
265	0	sold	504220342	330565047	2012-05-22 14:13:06.987743	2012-05-22 14:13:06.987743	365533797	\N
266	0	sold	504220342	231772182	2012-05-22 14:13:06.993836	2012-05-22 14:13:06.993836	195891138	\N
267	0	sold	504220342	231772182	2012-05-22 14:13:06.996894	2012-05-22 14:13:06.996894	195891138	\N
268	0	sold	504220342	987209861	2012-05-22 14:13:07.002917	2012-05-22 14:13:07.002917	1017790295	\N
269	0	sold	504220342	987209861	2012-05-22 14:13:07.005991	2012-05-22 14:13:07.005991	1017790295	\N
270	0	sold	504220342	601813305	2012-05-22 14:13:07.01203	2012-05-22 14:13:07.01203	631467759	\N
271	0	sold	504220342	349815214	2012-05-22 14:13:07.018182	2012-05-22 14:13:07.018182	312761982	\N
272	0	sold	504220342	73849921	2012-05-22 14:13:07.024466	2012-05-22 14:13:07.024466	35341291	\N
273	0	sold	504220342	862055596	2012-05-22 14:13:07.03052	2012-05-22 14:13:07.03052	891057020	\N
274	0	sold	504220342	335228811	2012-05-22 14:13:07.037223	2012-05-22 14:13:07.037223	629437518	\N
275	0	sold	405540681	335228811	2012-05-22 14:13:07.043765	2012-05-22 14:13:07.043765	629437518	\N
276	0	sold	405540681	620502818	2012-05-22 14:13:07.049939	2012-05-22 14:13:07.049939	310592731	\N
277	0	sold	405540681	620502818	2012-05-22 14:13:07.053076	2012-05-22 14:13:07.053076	310592731	\N
278	0	sold	405540681	620502818	2012-05-22 14:13:07.056174	2012-05-22 14:13:07.056174	310592731	\N
279	0	sold	405540681	1039486630	2012-05-22 14:13:07.062193	2012-05-22 14:13:07.062193	193598819	\N
280	0	sold	405540681	183664179	2012-05-22 14:13:07.068476	2012-05-22 14:13:07.068476	1015883258	\N
281	0	sold	405540681	183664179	2012-05-22 14:13:07.071551	2012-05-22 14:13:07.071551	1015883258	\N
282	0	sold	405540681	345435026	2012-05-22 14:13:07.078101	2012-05-22 14:13:07.078101	585740373	\N
283	0	sold	405540681	345435026	2012-05-22 14:13:07.081257	2012-05-22 14:13:07.081257	585740373	\N
284	0	sold	405540681	345435026	2012-05-22 14:13:07.084534	2012-05-22 14:13:07.084534	585740373	\N
285	0	sold	405540681	596761353	2012-05-22 14:13:07.091378	2012-05-22 14:13:07.091378	367952066	\N
286	0	sold	405540681	596761353	2012-05-22 14:13:07.094636	2012-05-22 14:13:07.094636	367952066	\N
287	0	sold	405540681	983075517	2012-05-22 14:13:07.101575	2012-05-22 14:13:07.101575	216519034	\N
288	0	sold	405540681	228571690	2012-05-22 14:13:07.108264	2012-05-22 14:13:07.108264	1004593649	\N
289	0	sold	405540681	228571690	2012-05-22 14:13:07.111433	2012-05-22 14:13:07.111433	1004593649	\N
290	0	sold	405540681	228571690	2012-05-22 14:13:07.114618	2012-05-22 14:13:07.114618	1004593649	\N
291	0	sold	405540681	488679357	2012-05-22 14:13:07.121617	2012-05-22 14:13:07.121617	727710848	\N
292	0	sold	405540681	488679357	2012-05-22 14:13:07.124844	2012-05-22 14:13:07.124844	727710848	\N
293	0	sold	405540681	488679357	2012-05-22 14:13:07.12803	2012-05-22 14:13:07.12803	727710848	\N
294	0	sold	405540681	707237680	2012-05-22 14:13:07.137142	2012-05-22 14:13:07.137142	475581673	\N
295	0	sold	405540681	707237680	2012-05-22 14:13:07.140439	2012-05-22 14:13:07.140439	475581673	\N
296	0	sold	405540681	707237680	2012-05-22 14:13:07.143695	2012-05-22 14:13:07.143695	475581673	\N
297	0	sold	405540681	953580620	2012-05-22 14:13:07.150559	2012-05-22 14:13:07.150559	245966735	\N
298	0	sold	405540681	953580620	2012-05-22 14:13:07.153901	2012-05-22 14:13:07.153901	245966735	\N
299	0	sold	405540681	953580620	2012-05-22 14:13:07.157082	2012-05-22 14:13:07.157082	245966735	\N
300	0	sold	599112055	335228811	2012-05-22 14:13:07.164015	2012-05-22 14:13:07.164015	629437518	\N
301	0	sold	599112055	335228811	2012-05-22 14:13:07.167637	2012-05-22 14:13:07.167637	629437518	\N
302	0	sold	599112055	335228811	2012-05-22 14:13:07.171548	2012-05-22 14:13:07.171548	629437518	\N
303	0	sold	599112055	620502818	2012-05-22 14:13:07.179342	2012-05-22 14:13:07.179342	310592731	\N
304	0	sold	599112055	620502818	2012-05-22 14:13:07.182504	2012-05-22 14:13:07.182504	310592731	\N
305	0	sold	599112055	620502818	2012-05-22 14:13:07.185487	2012-05-22 14:13:07.185487	310592731	\N
306	0	sold	599112055	1039486630	2012-05-22 14:13:07.191556	2012-05-22 14:13:07.191556	193598819	\N
307	0	sold	599112055	1039486630	2012-05-22 14:13:07.194631	2012-05-22 14:13:07.194631	193598819	\N
308	0	sold	599112055	183664179	2012-05-22 14:13:07.200702	2012-05-22 14:13:07.200702	1015883258	\N
309	0	sold	599112055	183664179	2012-05-22 14:13:07.203754	2012-05-22 14:13:07.203754	1015883258	\N
310	0	sold	599112055	183664179	2012-05-22 14:13:07.206678	2012-05-22 14:13:07.206678	1015883258	\N
311	0	sold	599112055	345435026	2012-05-22 14:13:07.212696	2012-05-22 14:13:07.212696	585740373	\N
312	0	sold	599112055	345435026	2012-05-22 14:13:07.215858	2012-05-22 14:13:07.215858	585740373	\N
313	0	sold	599112055	596761353	2012-05-22 14:13:07.222122	2012-05-22 14:13:07.222122	367952066	\N
314	0	sold	599112055	983075517	2012-05-22 14:13:07.228422	2012-05-22 14:13:07.228422	216519034	\N
315	0	sold	599112055	228571690	2012-05-22 14:13:07.234623	2012-05-22 14:13:07.234623	1004593649	\N
316	0	sold	599112055	228571690	2012-05-22 14:13:07.237711	2012-05-22 14:13:07.237711	1004593649	\N
317	0	sold	599112055	488679357	2012-05-22 14:13:07.244018	2012-05-22 14:13:07.244018	727710848	\N
318	0	sold	599112055	488679357	2012-05-22 14:13:07.247152	2012-05-22 14:13:07.247152	727710848	\N
319	0	sold	599112055	707237680	2012-05-22 14:13:07.253374	2012-05-22 14:13:07.253374	475581673	\N
320	0	sold	599112055	707237680	2012-05-22 14:13:07.256364	2012-05-22 14:13:07.256364	475581673	\N
321	0	sold	599112055	707237680	2012-05-22 14:13:07.259205	2012-05-22 14:13:07.259205	475581673	\N
322	0	sold	599112055	953580620	2012-05-22 14:13:07.265256	2012-05-22 14:13:07.265256	245966735	\N
323	0	sold	599112055	265374943	2012-05-22 14:13:07.271411	2012-05-22 14:13:07.271411	967710488	\N
324	0	sold	599112055	383262055	2012-05-22 14:13:07.277666	2012-05-22 14:13:07.277666	547833508	\N
325	0	sold	599112055	383262055	2012-05-22 14:13:07.280655	2012-05-22 14:13:07.280655	547833508	\N
326	0	sold	599112055	568274416	2012-05-22 14:13:07.286719	2012-05-22 14:13:07.286719	396391991	\N
327	0	sold	599112055	1069267029	2012-05-22 14:13:07.293091	2012-05-22 14:13:07.293091	163898264	\N
328	0	sold	599112055	1069267029	2012-05-22 14:13:07.296356	2012-05-22 14:13:07.296356	163898264	\N
329	0	sold	599112055	146573512	2012-05-22 14:13:07.363239	2012-05-22 14:13:07.363239	1053020929	\N
330	0	sold	599112055	146573512	2012-05-22 14:13:07.366882	2012-05-22 14:13:07.366882	1053020929	\N
331	0	sold	599112055	146573512	2012-05-22 14:13:07.371077	2012-05-22 14:13:07.371077	1053020929	\N
332	0	sold	599112055	297130368	2012-05-22 14:13:07.377887	2012-05-22 14:13:07.377887	667583165	\N
333	0	sold	599112055	649259497	2012-05-22 14:13:07.384316	2012-05-22 14:13:07.384316	281915952	\N
334	0	sold	599112055	649259497	2012-05-22 14:13:07.387575	2012-05-22 14:13:07.387575	281915952	\N
335	0	sold	599112055	906884218	2012-05-22 14:13:07.393989	2012-05-22 14:13:07.393989	7516093	\N
336	0	sold	599112055	906884218	2012-05-22 14:13:07.397176	2012-05-22 14:13:07.397176	7516093	\N
337	0	sold	599112055	17482993	2012-05-22 14:13:07.403394	2012-05-22 14:13:07.403394	930455338	\N
338	0	sold	599112055	17482993	2012-05-22 14:13:07.406605	2012-05-22 14:13:07.406605	930455338	\N
339	0	sold	599112055	17482993	2012-05-22 14:13:07.409538	2012-05-22 14:13:07.409538	930455338	\N
340	0	sold	599112055	567102733	2012-05-22 14:13:07.415877	2012-05-22 14:13:07.415877	397547216	\N
341	0	sold	52862384	567102733	2012-05-22 14:13:07.422299	2012-05-22 14:13:07.422299	397547216	\N
342	0	sold	52862384	567102733	2012-05-22 14:13:07.425391	2012-05-22 14:13:07.425391	397547216	\N
343	0	sold	52862384	567102733	2012-05-22 14:13:07.428343	2012-05-22 14:13:07.428343	397547216	\N
344	0	sold	52862384	567102733	2012-05-22 14:13:07.431281	2012-05-22 14:13:07.431281	397547216	\N
345	0	sold	52862384	382369184	2012-05-22 14:13:07.437648	2012-05-22 14:13:07.437648	548742745	\N
346	0	sold	52862384	382369184	2012-05-22 14:13:07.44085	2012-05-22 14:13:07.44085	548742745	\N
347	0	sold	52862384	382369184	2012-05-22 14:13:07.443854	2012-05-22 14:13:07.443854	548742745	\N
348	0	sold	52862384	382369184	2012-05-22 14:13:07.447138	2012-05-22 14:13:07.447138	548742745	\N
349	0	sold	52862384	382369184	2012-05-22 14:13:07.450079	2012-05-22 14:13:07.450079	548742745	\N
350	0	sold	52862384	382369184	2012-05-22 14:13:07.453353	2012-05-22 14:13:07.453353	548742745	\N
351	0	sold	52862384	382369184	2012-05-22 14:13:07.456261	2012-05-22 14:13:07.456261	548742745	\N
352	0	sold	52862384	264449064	2012-05-22 14:13:07.557261	2012-05-22 14:13:07.557261	968652773	\N
353	0	sold	52862384	264449064	2012-05-22 14:13:07.560906	2012-05-22 14:13:07.560906	968652773	\N
354	0	sold	52862384	264449064	2012-05-22 14:13:07.564277	2012-05-22 14:13:07.564277	968652773	\N
355	0	sold	52862384	264449064	2012-05-22 14:13:07.567584	2012-05-22 14:13:07.567584	968652773	\N
356	0	sold	52862384	264449064	2012-05-22 14:13:07.570833	2012-05-22 14:13:07.570833	968652773	\N
357	0	sold	52862384	264449064	2012-05-22 14:13:07.574079	2012-05-22 14:13:07.574079	968652773	\N
358	0	sold	52862384	952376497	2012-05-22 14:13:07.581005	2012-05-22 14:13:07.581005	247154552	\N
359	0	sold	52862384	952376497	2012-05-22 14:13:07.584424	2012-05-22 14:13:07.584424	247154552	\N
360	0	sold	52862384	952376497	2012-05-22 14:13:07.587625	2012-05-22 14:13:07.587625	247154552	\N
361	0	sold	52862384	952376497	2012-05-22 14:13:07.590809	2012-05-22 14:13:07.590809	247154552	\N
362	0	sold	52862384	952376497	2012-05-22 14:13:07.593932	2012-05-22 14:13:07.593932	247154552	\N
363	0	sold	52862384	952376497	2012-05-22 14:13:07.59683	2012-05-22 14:13:07.59683	247154552	\N
364	0	sold	52862384	648055060	2012-05-22 14:13:07.603254	2012-05-22 14:13:07.603254	283103959	\N
365	0	sold	52862384	648055060	2012-05-22 14:13:07.606464	2012-05-22 14:13:07.606464	283103959	\N
366	0	sold	52862384	648055060	2012-05-22 14:13:07.609564	2012-05-22 14:13:07.609564	283103959	\N
367	0	sold	52862384	648055060	2012-05-22 14:13:07.612635	2012-05-22 14:13:07.612635	283103959	\N
368	0	sold	52862384	648055060	2012-05-22 14:13:07.615654	2012-05-22 14:13:07.615654	283103959	\N
369	0	sold	52862384	648055060	2012-05-22 14:13:07.618678	2012-05-22 14:13:07.618678	283103959	\N
370	0	sold	52862384	648055060	2012-05-22 14:13:07.621643	2012-05-22 14:13:07.621643	283103959	\N
371	0	sold	52862384	648055060	2012-05-22 14:13:07.624623	2012-05-22 14:13:07.624623	283103959	\N
372	0	sold	52862384	648055060	2012-05-22 14:13:07.627597	2012-05-22 14:13:07.627597	283103959	\N
373	0	sold	52862384	296204679	2012-05-22 14:13:07.63404	2012-05-22 14:13:07.63404	668525120	\N
374	0	sold	52862384	296204679	2012-05-22 14:13:07.637145	2012-05-22 14:13:07.637145	668525120	\N
375	0	sold	52862384	296204679	2012-05-22 14:13:07.64007	2012-05-22 14:13:07.64007	668525120	\N
376	0	sold	52862384	296204679	2012-05-22 14:13:07.643019	2012-05-22 14:13:07.643019	668525120	\N
377	0	sold	52862384	296204679	2012-05-22 14:13:07.64605	2012-05-22 14:13:07.64605	668525120	\N
378	0	sold	52862384	296204679	2012-05-22 14:13:07.648891	2012-05-22 14:13:07.648891	668525120	\N
379	0	sold	52862384	296204679	2012-05-22 14:13:07.651997	2012-05-22 14:13:07.651997	668525120	\N
380	0	sold	52862384	145680447	2012-05-22 14:13:07.658426	2012-05-22 14:13:07.658426	1053930492	\N
381	0	sold	52862384	145680447	2012-05-22 14:13:07.661632	2012-05-22 14:13:07.661632	1053930492	\N
382	0	sold	52862384	145680447	2012-05-22 14:13:07.664647	2012-05-22 14:13:07.664647	1053930492	\N
383	0	sold	52862384	145680447	2012-05-22 14:13:07.667744	2012-05-22 14:13:07.667744	1053930492	\N
384	0	sold	52862384	145680447	2012-05-22 14:13:07.670657	2012-05-22 14:13:07.670657	1053930492	\N
385	0	sold	52862384	145680447	2012-05-22 14:13:07.673737	2012-05-22 14:13:07.673737	1053930492	\N
386	0	sold	52862384	145680447	2012-05-22 14:13:07.676736	2012-05-22 14:13:07.676736	1053930492	\N
387	0	sold	52862384	145680447	2012-05-22 14:13:07.679689	2012-05-22 14:13:07.679689	1053930492	\N
388	0	sold	52862384	145680447	2012-05-22 14:13:07.682615	2012-05-22 14:13:07.682615	1053930492	\N
389	0	sold	52862384	145680447	2012-05-22 14:13:07.685613	2012-05-22 14:13:07.685613	1053930492	\N
390	0	sold	52862384	1068095656	2012-05-22 14:13:07.691871	2012-05-22 14:13:07.691871	165053295	\N
391	0	sold	52862384	1068095656	2012-05-22 14:13:07.694989	2012-05-22 14:13:07.694989	165053295	\N
392	0	sold	52862384	1068095656	2012-05-22 14:13:07.697944	2012-05-22 14:13:07.697944	165053295	\N
393	0	sold	52862384	1068095656	2012-05-22 14:13:07.700804	2012-05-22 14:13:07.700804	165053295	\N
394	0	sold	52862384	790021435	2012-05-22 14:13:07.707107	2012-05-22 14:13:07.707107	426352382	\N
395	0	sold	52862384	790021435	2012-05-22 14:13:07.710266	2012-05-22 14:13:07.710266	426352382	\N
396	0	sold	52862384	790021435	2012-05-22 14:13:07.713121	2012-05-22 14:13:07.713121	426352382	\N
397	0	sold	52862384	790021435	2012-05-22 14:13:07.716116	2012-05-22 14:13:07.716116	426352382	\N
398	0	sold	52862384	403830194	2012-05-22 14:13:07.722443	2012-05-22 14:13:07.722443	779005547	\N
399	0	sold	52862384	403830194	2012-05-22 14:13:07.725631	2012-05-22 14:13:07.725631	779005547	\N
400	0	sold	52862384	780983247	2012-05-22 14:13:07.731901	2012-05-22 14:13:07.731901	418611208	\N
401	0	sold	52862384	780983247	2012-05-22 14:13:07.735085	2012-05-22 14:13:07.735085	418611208	\N
402	0	sold	52862384	780983247	2012-05-22 14:13:07.738032	2012-05-22 14:13:07.738032	418611208	\N
403	0	sold	52862384	780983247	2012-05-22 14:13:07.740961	2012-05-22 14:13:07.740961	418611208	\N
404	0	sold	52862384	428600156	2012-05-22 14:13:07.747259	2012-05-22 14:13:07.747259	804565151	\N
405	0	sold	52862384	428600156	2012-05-22 14:13:07.750249	2012-05-22 14:13:07.750249	804565151	\N
406	0	sold	52862384	428600156	2012-05-22 14:13:07.753152	2012-05-22 14:13:07.753152	804565151	\N
407	0	sold	52862384	428600156	2012-05-22 14:13:07.755961	2012-05-22 14:13:07.755961	804565151	\N
408	0	sold	52862384	428600156	2012-05-22 14:13:07.758823	2012-05-22 14:13:07.758823	804565151	\N
409	0	sold	52862384	428600156	2012-05-22 14:13:07.763137	2012-05-22 14:13:07.763137	804565151	\N
410	0	sold	52862384	428600156	2012-05-22 14:13:07.766283	2012-05-22 14:13:07.766283	804565151	\N
411	0	sold	52862384	428600156	2012-05-22 14:13:07.769438	2012-05-22 14:13:07.769438	804565151	\N
412	0	sold	52862384	428600156	2012-05-22 14:13:07.772456	2012-05-22 14:13:07.772456	804565151	\N
413	0	sold	52862384	8567520	2012-05-22 14:13:07.77885	2012-05-22 14:13:07.77885	922607911	\N
414	0	sold	52862384	8567520	2012-05-22 14:13:07.78201	2012-05-22 14:13:07.78201	922607911	\N
415	0	sold	52862384	8567520	2012-05-22 14:13:07.784899	2012-05-22 14:13:07.784899	922607911	\N
416	0	sold	52862384	8567520	2012-05-22 14:13:07.787797	2012-05-22 14:13:07.787797	922607911	\N
417	0	sold	52862384	8567520	2012-05-22 14:13:07.790829	2012-05-22 14:13:07.790829	922607911	\N
418	0	sold	52862384	8567520	2012-05-22 14:13:07.793679	2012-05-22 14:13:07.793679	922607911	\N
419	0	sold	52862384	8567520	2012-05-22 14:13:07.796472	2012-05-22 14:13:07.796472	922607911	\N
420	0	sold	52862384	8567520	2012-05-22 14:13:07.799441	2012-05-22 14:13:07.799441	922607911	\N
421	0	sold	52862384	931498615	2012-05-22 14:13:07.805973	2012-05-22 14:13:07.805973	33214900	\N
422	0	sold	52862384	702619608	2012-05-22 14:13:07.812243	2012-05-22 14:13:07.812243	530465809	\N
423	0	sold	52862384	518401861	2012-05-22 14:13:07.81843	2012-05-22 14:13:07.81843	681145480	\N
424	0	sold	52862384	518401861	2012-05-22 14:13:07.821561	2012-05-22 14:13:07.821561	681145480	\N
425	0	sold	52862384	518401861	2012-05-22 14:13:07.824558	2012-05-22 14:13:07.824558	681145480	\N
426	0	sold	52862384	518401861	2012-05-22 14:13:07.827438	2012-05-22 14:13:07.827438	681145480	\N
427	0	sold	52862384	518401861	2012-05-22 14:13:07.830438	2012-05-22 14:13:07.830438	681145480	\N
428	0	sold	52862384	133136121	2012-05-22 14:13:07.836528	2012-05-22 14:13:07.836528	831530304	\N
429	0	sold	52862384	133136121	2012-05-22 14:13:07.839883	2012-05-22 14:13:07.839883	831530304	\N
430	0	sold	52862384	133136121	2012-05-22 14:13:07.843024	2012-05-22 14:13:07.843024	831530304	\N
431	0	sold	52862384	133136121	2012-05-22 14:13:07.846018	2012-05-22 14:13:07.846018	831530304	\N
432	0	sold	52862384	133136121	2012-05-22 14:13:07.848986	2012-05-22 14:13:07.848986	831530304	\N
433	0	sold	52862384	820530800	2012-05-22 14:13:07.855293	2012-05-22 14:13:07.855293	110564781	\N
434	0	sold	52862384	820530800	2012-05-22 14:13:07.858461	2012-05-22 14:13:07.858461	110564781	\N
435	0	sold	52862384	820530800	2012-05-22 14:13:07.861618	2012-05-22 14:13:07.861618	110564781	\N
436	0	sold	52862384	820530800	2012-05-22 14:13:07.864638	2012-05-22 14:13:07.864638	110564781	\N
437	0	sold	52862384	820530800	2012-05-22 14:13:07.867473	2012-05-22 14:13:07.867473	110564781	\N
438	0	sold	52862384	542594049	2012-05-22 14:13:07.873655	2012-05-22 14:13:07.873655	371722298	\N
439	0	sold	52862384	542594049	2012-05-22 14:13:07.876745	2012-05-22 14:13:07.876745	371722298	\N
440	0	sold	52862384	542594049	2012-05-22 14:13:07.87969	2012-05-22 14:13:07.87969	371722298	\N
441	0	sold	52862384	542594049	2012-05-22 14:13:07.88259	2012-05-22 14:13:07.88259	371722298	\N
442	0	sold	52862384	542594049	2012-05-22 14:13:07.885583	2012-05-22 14:13:07.885583	371722298	\N
443	0	sold	52862384	542594049	2012-05-22 14:13:07.888502	2012-05-22 14:13:07.888502	371722298	\N
444	0	sold	52862384	542594049	2012-05-22 14:13:07.891429	2012-05-22 14:13:07.891429	371722298	\N
445	0	sold	52862384	542594049	2012-05-22 14:13:07.894349	2012-05-22 14:13:07.894349	371722298	\N
446	0	sold	52862384	391144298	2012-05-22 14:13:07.900636	2012-05-22 14:13:07.900636	556742829	\N
447	0	sold	52862384	391144298	2012-05-22 14:13:07.903706	2012-05-22 14:13:07.903706	556742829	\N
448	0	sold	52862384	391144298	2012-05-22 14:13:07.90665	2012-05-22 14:13:07.90665	556742829	\N
449	0	sold	52862384	932702864	2012-05-22 14:13:07.912817	2012-05-22 14:13:07.912817	32026953	\N
450	0	sold	52862384	932702864	2012-05-22 14:13:07.91629	2012-05-22 14:13:07.91629	32026953	\N
451	0	sold	52862384	932702864	2012-05-22 14:13:07.919314	2012-05-22 14:13:07.919314	32026953	\N
452	0	sold	52862384	932702864	2012-05-22 14:13:07.922224	2012-05-22 14:13:07.922224	32026953	\N
453	0	sold	52862384	932702864	2012-05-22 14:13:07.925245	2012-05-22 14:13:07.925245	32026953	\N
454	0	sold	52862384	932702864	2012-05-22 14:13:07.928222	2012-05-22 14:13:07.928222	32026953	\N
455	0	sold	52862384	932702864	2012-05-22 14:13:07.931239	2012-05-22 14:13:07.931239	32026953	\N
456	0	sold	52862384	932702864	2012-05-22 14:13:07.934159	2012-05-22 14:13:07.934159	32026953	\N
457	0	sold	52862384	932702864	2012-05-22 14:13:07.937099	2012-05-22 14:13:07.937099	32026953	\N
458	0	backordered	1013589418	1069267038	2012-09-13 12:49:44.733105	2012-09-13 12:49:44.733105	1053930493	\N
459	0	backordered	1013589501	1069267030	2013-03-19 16:06:48.094557	2013-03-19 16:06:48.094557	1053930494	\N
460	0	backordered	1013589550	1069267040	2013-03-30 15:48:13.071407	2013-03-30 15:48:13.071407	1053930495	\N
\.


--
-- Data for Name: spree_line_items; Type: TABLE DATA; Schema: public; Owner: alain
--

COPY spree_line_items (id, order_id, variant_id, quantity, price, created_at, updated_at) FROM stdin;
995042986	1035625630	215054540	2	15.99	2012-05-22 14:13:03	2012-05-22 14:13:03
575043350	615724322	215054540	1	15.99	2012-05-22 14:13:03	2012-05-22 14:13:03
356599687	330565047	215054540	2	15.99	2012-05-22 14:13:03	2012-05-22 14:13:03
187028006	231772182	215054540	3	15.99	2012-05-22 14:13:03	2012-05-22 14:13:03
1008919217	987209861	215054540	1	15.99	2012-05-22 14:13:03	2012-05-22 14:13:03
623620877	601813305	215054540	1	15.99	2012-05-22 14:13:03	2012-05-22 14:13:03
304907166	349815214	215054540	4	15.99	2012-05-22 14:13:03	2012-05-22 14:13:03
43228685	73849921	215054540	2	15.99	2012-05-22 14:13:03	2012-05-22 14:13:03
898936476	862055596	215054540	2	15.99	2012-05-22 14:13:03	2012-05-22 14:13:03
464161612	335228811	215054540	2	15.99	2012-05-22 14:13:03	2012-05-22 14:13:03
749583325	620502818	215054540	1	15.99	2012-05-22 14:13:03	2012-05-22 14:13:03
900000361	1039486630	215054540	3	15.99	2012-05-22 14:13:03	2012-05-22 14:13:03
44292852	183664179	215054540	1	15.99	2012-05-22 14:13:03	2012-05-22 14:13:03
482824019	345435026	215054540	2	15.99	2012-05-22 14:13:03	2012-05-22 14:13:03
734035908	596761353	215054540	2	15.99	2012-05-22 14:13:03	2012-05-22 14:13:03
852045440	983075517	215054540	4	15.99	2012-05-22 14:13:03	2012-05-22 14:13:03
97394411	228571690	215054540	4	15.99	2012-05-22 14:13:03	2012-05-22 14:13:03
359727994	488679357	215054540	3	15.99	2012-05-22 14:13:03	2012-05-22 14:13:03
578171887	707237680	215054540	4	15.99	2012-05-22 14:13:03	2012-05-22 14:13:03
814209161	953580620	215054540	3	15.99	2012-05-22 14:13:03	2012-05-22 14:13:03
125888542	265374943	215054540	1	15.99	2012-05-22 14:13:03	2012-05-22 14:13:03
512342438	383262055	215054540	1	15.99	2012-05-22 14:13:03	2012-05-22 14:13:03
697207093	568274416	215054540	3	15.99	2012-05-22 14:13:03	2012-05-22 14:13:03
938089618	1069267029	215054540	4	15.99	2012-05-22 14:13:03	2012-05-22 14:13:03
15543303	146573512	215054540	2	15.99	2012-05-22 14:13:03	2012-05-22 14:13:03
434404799	297130368	215054540	2	15.99	2012-05-22 14:13:03	2012-05-22 14:13:03
786648366	649259497	215054540	3	15.99	2012-05-22 14:13:03	2012-05-22 14:13:03
1046237371	906884218	215054540	4	15.99	2012-05-22 14:13:03	2012-05-22 14:13:03
156983340	17482993	215054540	1	15.99	2012-05-22 14:13:03	2012-05-22 14:13:03
698149322	567102733	215054540	4	15.99	2012-05-22 14:13:03	2012-05-22 14:13:03
513530207	382369184	215054540	1	15.99	2012-05-22 14:13:03	2012-05-22 14:13:03
127043815	264449064	215054540	1	15.99	2012-05-22 14:13:03	2012-05-22 14:13:03
815118454	952376497	215054540	1	15.99	2012-05-22 14:13:03	2012-05-22 14:13:03
787557841	648055060	215054540	1	15.99	2012-05-22 14:13:03	2012-05-22 14:13:03
435559750	296204679	215054540	4	15.99	2012-05-22 14:13:03	2012-05-22 14:13:03
16731390	145680447	215054540	2	15.99	2012-05-22 14:13:03	2012-05-22 14:13:03
939031661	1068095656	215054540	2	15.99	2012-05-22 14:13:03	2012-05-22 14:13:03
658989564	790021435	215054540	2	15.99	2012-05-22 14:13:03	2012-05-22 14:13:03
272650605	403830194	215054540	3	15.99	2012-05-22 14:13:03	2012-05-22 14:13:03
652050190	780983247	215054540	3	15.99	2012-05-22 14:13:03	2012-05-22 14:13:03
299519897	428600156	215054540	3	15.99	2012-05-22 14:13:03	2012-05-22 14:13:03
148053541	8567520	215054540	3	15.99	2012-05-22 14:13:03	2012-05-22 14:13:03
1070870198	931498615	215054540	4	15.99	2012-05-22 14:13:03	2012-05-22 14:13:03
565230359	702619608	215054540	2	15.99	2012-05-22 14:13:03	2012-05-22 14:13:03
381127554	518401861	215054540	4	15.99	2012-05-22 14:13:03	2012-05-22 14:13:03
264165950	133136121	215054540	1	15.99	2012-05-22 14:13:03	2012-05-22 14:13:03
951708335	820530800	215054540	3	15.99	2012-05-22 14:13:03	2012-05-22 14:13:03
671545148	542594049	215054540	2	15.99	2012-05-22 14:13:03	2012-05-22 14:13:03
520210347	391144298	215054540	3	15.99	2012-05-22 14:13:03	2012-05-22 14:13:03
1069960783	932702864	215054540	4	15.99	2012-05-22 14:13:03	2012-05-22 14:13:03
146898650	9493021	215054540	2	15.99	2012-05-22 14:13:03	2012-05-22 14:13:03
298332006	429493153	215054540	2	15.99	2012-05-22 14:13:03	2012-05-22 14:13:03
651108343	782154552	215054540	3	15.99	2012-05-22 14:13:03	2012-05-22 14:13:03
950766166	821702295	215054540	4	15.99	2012-05-22 14:13:03	2012-05-22 14:13:03
262978241	134028804	215054540	2	15.99	2012-05-22 14:13:03	2012-05-22 14:13:03
379972477	519327672	215054540	2	15.99	2012-05-22 14:13:03	2012-05-22 14:13:03
564321262	703823663	215054540	4	15.99	2012-05-22 14:13:03	2012-05-22 14:13:03
824034941	961307330	215054540	2	15.99	2012-05-22 14:13:03	2012-05-22 14:13:03
102430444	239817259	215054540	2	15.99	2012-05-22 14:13:03	2012-05-22 14:13:03
350952844	481999185	215054540	3	15.99	2012-05-22 14:13:03	2012-05-22 14:13:03
602680603	733841882	215054540	4	15.99	2012-05-22 14:13:03	2012-05-22 14:13:03
988118179	850712674	215054540	4	15.99	2012-05-22 14:13:03	2012-05-22 14:13:03
232934456	95676661	215054540	3	15.99	2012-05-22 14:13:03	2012-05-22 14:13:03
327604629	467107162	215054540	3	15.99	2012-05-22 14:13:03	2012-05-22 14:13:03
612493572	751848899	215054540	3	15.99	2012-05-22 14:13:03	2012-05-22 14:13:03
1032370364	903421051	215054540	4	15.99	2012-05-22 14:13:03	2012-05-22 14:13:03
177178673	48114926	215054540	1	15.99	2012-05-22 14:13:03	2012-05-22 14:13:03
439391678	308359551	215054540	4	15.99	2012-05-22 14:13:03	2012-05-22 14:13:03
758621481	627442156	215054540	4	15.99	2012-05-22 14:13:03	2012-05-22 14:13:03
233843917	94472210	215054540	4	15.99	2012-05-22 14:13:03	2012-05-22 14:13:03
989273180	849787035	215054540	1	15.99	2012-05-22 14:13:03	2012-05-22 14:13:03
603868644	732948771	215054540	3	15.99	2012-05-22 14:13:03	2012-05-22 14:13:03
351894905	480827830	215054540	4	15.99	2012-05-22 14:13:03	2012-05-22 14:13:03
178120916	46943257	215054540	3	15.99	2012-05-22 14:13:03	2012-05-22 14:13:03
1033558083	902528130	215054540	1	15.99	2012-05-22 14:13:03	2012-05-22 14:13:03
613648891	750923066	215054540	4	15.99	2012-05-22 14:13:03	2012-05-22 14:13:03
328513904	465903021	215054540	4	15.99	2012-05-22 14:13:03	2012-05-22 14:13:03
53191935	192544832	215054540	1	15.99	2012-05-22 14:13:03	2012-05-22 14:13:03
875336810	1014837421	215054540	2	15.99	2012-05-22 14:13:03	2012-05-22 14:13:03
174600196	37328065	215054540	3	15.99	2012-05-22 14:13:03	2012-05-22 14:13:03
1030684823	893297750	215054540	4	15.99	2012-05-22 14:13:03	2012-05-22 14:13:03
610685231	741864942	215054540	1	15.99	2012-05-22 14:13:03	2012-05-22 14:13:03
325149112	456181117	215054540	3	15.99	2012-05-22 14:13:03	2012-05-22 14:13:03
218493981	89411802	215054540	2	15.99	2012-05-22 14:13:03	2012-05-22 14:13:03
973259920	844324943	215054540	1	15.99	2012-05-22 14:13:03	2012-05-22 14:13:03
587961656	727331319	215054540	4	15.99	2012-05-22 14:13:03	2012-05-22 14:13:03
336373153	475857254	215054540	3	15.99	2012-05-22 14:13:03	2012-05-22 14:13:03
78886962	216145139	215054540	3	15.99	2012-05-22 14:13:03	2012-05-22 14:13:03
867469481	1004874852	215054540	4	15.99	2012-05-22 14:13:03	2012-05-22 14:13:03
326304069	455255426	215054540	4	15.99	2012-05-22 14:13:03	2012-05-22 14:13:03
611594712	740660503	215054540	4	15.99	2012-05-22 14:13:03	2012-05-22 14:13:03
1031626864	892126383	215054540	1	15.99	2012-05-22 14:13:03	2012-05-22 14:13:03
175788281	36435006	215054540	4	15.99	2012-05-22 14:13:03	2012-05-22 14:13:03
337560924	474964377	215054540	3	15.99	2012-05-22 14:13:03	2012-05-22 14:13:03
588903887	726159630	215054540	4	15.99	2012-05-22 14:13:03	2012-05-22 14:13:03
974169207	843120822	215054540	1	15.99	2012-05-22 14:13:03	2012-05-22 14:13:03
219649248	88485925	215054540	1	15.99	2012-05-22 14:13:03	2012-05-22 14:13:03
497584499	368651700	215054540	1	15.99	2012-05-22 14:13:03	2012-05-22 14:13:03
716159466	587078949	215054540	3	15.99	2012-05-22 14:13:03	2012-05-22 14:13:03
361688498	539762571	215054540	2	15.99	2012-05-22 14:13:03	2012-05-22 14:13:03
648459260	1035625630	504220342	1	22.99	2012-05-22 14:13:03	2012-05-22 14:13:03
1068491328	615724322	504220342	2	22.99	2012-05-22 14:13:03	2012-05-22 14:13:03
145281751	330565047	504220342	2	22.99	2012-05-22 14:13:03	2012-05-22 14:13:03
382486392	231772182	504220342	2	22.99	2012-05-22 14:13:03	2012-05-22 14:13:03
566982629	987209861	504220342	2	22.99	2012-05-22 14:13:03	2012-05-22 14:13:03
952247897	601813305	504220342	1	22.99	2012-05-22 14:13:03	2012-05-22 14:13:03
264574672	349815214	504220342	1	22.99	2012-05-22 14:13:03	2012-05-22 14:13:03
528092001	73849921	504220342	1	22.99	2012-05-22 14:13:03	2012-05-22 14:13:03
679295946	862055596	504220342	1	22.99	2012-05-22 14:13:03	2012-05-22 14:13:03
146453040	335228811	504220342	1	22.99	2012-05-22 14:13:03	2012-05-22 14:13:03
437198278	335228811	405540681	1	19.99	2012-05-22 14:13:03	2012-05-22 14:13:03
755510615	620502818	405540681	3	19.99	2012-05-22 14:13:03	2012-05-22 14:13:03
872512751	1039486630	405540681	1	19.99	2012-05-22 14:13:03	2012-05-22 14:13:03
50744442	183664179	405540681	2	19.99	2012-05-22 14:13:03	2012-05-22 14:13:03
493017565	345435026	405540681	3	19.99	2012-05-22 14:13:03	2012-05-22 14:13:03
711321934	596761353	405540681	2	19.99	2012-05-22 14:13:03	2012-05-22 14:13:03
862763254	983075517	405540681	1	19.99	2012-05-22 14:13:03	2012-05-22 14:13:03
74156129	228571690	405540681	3	19.99	2012-05-22 14:13:03	2012-05-22 14:13:03
349476340	488679357	405540681	3	19.99	2012-05-22 14:13:03	2012-05-22 14:13:03
601073001	707237680	405540681	3	19.99	2012-05-22 14:13:03	2012-05-22 14:13:03
824331779	953580620	405540681	3	19.99	2012-05-22 14:13:03	2012-05-22 14:13:03
582187687	335228811	599112055	3	16.99	2012-05-22 14:13:03	2012-05-22 14:13:03
364137008	620502818	599112055	3	16.99	2012-05-22 14:13:03	2012-05-22 14:13:03
213719948	1039486630	599112055	2	16.99	2012-05-22 14:13:03	2012-05-22 14:13:03
1002056479	183664179	599112055	3	16.99	2012-05-22 14:13:03	2012-05-22 14:13:03
635354816	345435026	599112055	2	16.99	2012-05-22 14:13:03	2012-05-22 14:13:03
316247593	596761353	599112055	1	16.99	2012-05-22 14:13:03	2012-05-22 14:13:03
198238101	983075517	599112055	1	16.99	2012-05-22 14:13:03	2012-05-22 14:13:03
1020784392	228571690	599112055	2	16.99	2012-05-22 14:13:03	2012-05-22 14:13:03
745075349	488679357	599112055	2	16.99	2012-05-22 14:13:03	2012-05-22 14:13:03
460308994	707237680	599112055	3	16.99	2012-05-22 14:13:03	2012-05-22 14:13:03
161360230	953580620	599112055	1	16.99	2012-05-22 14:13:03	2012-05-22 14:13:03
1050221043	265374943	599112055	1	16.99	2012-05-22 14:13:03	2012-05-22 14:13:03
663767115	383262055	599112055	2	16.99	2012-05-22 14:13:03	2012-05-22 14:13:03
278362338	568274416	599112055	1	16.99	2012-05-22 14:13:03	2012-05-22 14:13:03
250867069	1069267029	599112055	2	16.99	2012-05-22 14:13:03	2012-05-22 14:13:03
972348906	146573512	599112055	3	16.99	2012-05-22 14:13:03	2012-05-22 14:13:03
553487442	297130368	599112055	1	16.99	2012-05-22 14:13:03	2012-05-22 14:13:03
402308297	649259497	599112055	2	16.99	2012-05-22 14:13:03	2012-05-22 14:13:03
122003800	906884218	599112055	2	16.99	2012-05-22 14:13:03	2012-05-22 14:13:03
809669057	17482993	599112055	3	16.99	2012-05-22 14:13:03	2012-05-22 14:13:03
277157925	567102733	599112055	1	16.99	2012-05-22 14:13:03	2012-05-22 14:13:03
223486112	567102733	52862384	4	13.99	2012-05-22 14:13:03	2012-05-22 14:13:03
978653197	382369184	52862384	7	13.99	2012-05-22 14:13:03	2012-05-22 14:13:03
593248689	264449064	52862384	6	13.99	2012-05-22 14:13:03	2012-05-22 14:13:03
341537064	952376497	52862384	6	13.99	2012-05-22 14:13:03	2012-05-22 14:13:03
171959431	648055060	52862384	9	13.99	2012-05-22 14:13:03	2012-05-22 14:13:03
1027134484	296204679	52862384	7	13.99	2012-05-22 14:13:03	2012-05-22 14:13:03
607225256	145680447	52862384	10	13.99	2012-05-22 14:13:03	2012-05-22 14:13:03
322352447	1068095656	52862384	4	13.99	2012-05-22 14:13:03	2012-05-22 14:13:03
59353266	790021435	52862384	4	13.99	2012-05-22 14:13:03	2012-05-22 14:13:03
881760315	403830194	52862384	2	13.99	2012-05-22 14:13:03	2012-05-22 14:13:03
34846300	780983247	52862384	4	13.99	2012-05-22 14:13:03	2012-05-22 14:13:03
890537679	428600156	52862384	9	13.99	2012-05-22 14:13:03	2012-05-22 14:13:03
740153207	8567520	52862384	8	13.99	2012-05-22 14:13:03	2012-05-22 14:13:03
454748128	931498615	52862384	1	13.99	2012-05-22 14:13:03	2012-05-22 14:13:03
92172869	702619608	52862384	1	13.99	2012-05-22 14:13:03	2012-05-22 14:13:03
846807768	518401861	52862384	5	13.99	2012-05-22 14:13:03	2012-05-22 14:13:03
728765296	133136121	52862384	5	13.99	2012-05-22 14:13:03	2012-05-22 14:13:03
477570041	820530800	52862384	5	13.99	2012-05-22 14:13:03	2012-05-22 14:13:03
214449770	542594049	52862384	8	13.99	2012-05-22 14:13:03	2012-05-22 14:13:03
1003425537	391144298	52862384	3	13.99	2012-05-22 14:13:03	2012-05-22 14:13:03
453543709	932702864	52862384	9	13.99	2012-05-22 14:13:03	2012-05-22 14:13:03
1070870207	1069267038	1013589418	1	12300.00	2012-09-13 12:45:55.796291	2012-09-13 12:45:55.796291
1070870216	1069267030	1013589501	1	234.00	2013-03-19 16:03:07.146257	2013-03-19 16:03:07.146257
1070870232	1069267040	1013589550	1	1442.00	2013-03-28 18:45:41.887708	2013-03-28 18:45:41.887708
1070870233	1069267041	1013589549	1	1000.00	2013-04-22 12:14:35.265912	2013-04-22 12:14:35.265912
\.


--
-- Data for Name: spree_log_entries; Type: TABLE DATA; Schema: public; Owner: alain
--

COPY spree_log_entries (id, source_id, source_type, details, created_at, updated_at) FROM stdin;
2	103	Spree::Payment	--- !ruby/object:ActiveMerchant::Billing::Response\nparams: {}\nmessage: ''\nsuccess: true\ntest: false\nauthorization: \nfraud_review: \navs_result:\n  code: \n  message: \n  street_match: \n  postal_match: \ncvv_result:\n  code: \n  message: \n	2012-09-13 12:51:38.142643	2012-09-13 12:51:38.142643
3	103	Spree::Payment	--- !ruby/object:ActiveMerchant::Billing::Response\nparams: {}\nmessage: ''\nsuccess: true\ntest: false\nauthorization: \nfraud_review: \navs_result:\n  code: \n  message: \n  street_match: \n  postal_match: \ncvv_result:\n  code: \n  message: \n	2012-09-13 12:51:44.674788	2012-09-13 12:51:44.674788
4	104	Spree::Payment	--- !ruby/object:ActiveMerchant::Billing::Response\nparams: {}\nmessage: ''\nsuccess: true\ntest: false\nauthorization: \nfraud_review: \navs_result:\n  code: \n  message: \n  street_match: \n  postal_match: \ncvv_result:\n  code: \n  message: \n	2012-09-13 12:56:44.994357	2012-09-13 12:56:44.994357
5	1	Spree::Payment	--- !ruby/object:ActiveMerchant::Billing::Response\nparams: {}\nmessage: ! 'Bogus Gateway: Forced success'\nsuccess: true\ntest: true\nauthorization: '67890'\nfraud_review: \navs_result:\n  code: \n  message: \n  street_match: \n  postal_match: \ncvv_result:\n  code: \n  message: \n	2012-09-13 12:58:04.49507	2012-09-13 12:58:04.49507
6	105	Spree::Payment	--- !ruby/object:ActiveMerchant::Billing::Response\nparams: {}\nmessage: ''\nsuccess: true\ntest: false\nauthorization: \nfraud_review: \navs_result:\n  code: \n  message: \n  street_match: \n  postal_match: \ncvv_result:\n  code: \n  message: \n	2013-03-19 16:09:59.913144	2013-03-19 16:09:59.913144
7	105	Spree::Payment	--- !ruby/object:ActiveMerchant::Billing::Response\nparams: {}\nmessage: ''\nsuccess: true\ntest: false\nauthorization: \nfraud_review: \navs_result:\n  code: \n  message: \n  street_match: \n  postal_match: \ncvv_result:\n  code: \n  message: \n	2013-03-19 16:10:06.520251	2013-03-19 16:10:06.520251
\.


--
-- Data for Name: spree_mail_methods; Type: TABLE DATA; Schema: public; Owner: alain
--

COPY spree_mail_methods (id, environment, active, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: spree_option_types; Type: TABLE DATA; Schema: public; Owner: alain
--

COPY spree_option_types (id, name, presentation, created_at, updated_at, "position") FROM stdin;
935339119	tailleEcran	Taille de l'écran	2012-09-12 17:15:05.984865	2013-03-07 13:36:05.868065	0
\.


--
-- Data for Name: spree_option_types_prototypes; Type: TABLE DATA; Schema: public; Owner: alain
--

COPY spree_option_types_prototypes (prototype_id, option_type_id) FROM stdin;
571598466	935339119
\.


--
-- Data for Name: spree_option_values; Type: TABLE DATA; Schema: public; Owner: alain
--

COPY spree_option_values (id, "position", name, presentation, option_type_id, created_at, updated_at) FROM stdin;
979459989	1	12	12	935339119	2012-09-17 13:42:07.885437	2012-09-17 13:42:07.885437
979459990	2	60	60	935339119	2012-09-17 13:46:47.68667	2012-09-17 13:46:47.68667
979459991	3	\N	12	935339119	2012-10-22 09:04:35.753615	2012-10-22 09:04:35.753615
979459992	4	\N	42	935339119	2012-10-22 09:47:24.581581	2012-10-22 09:47:24.581581
979459993	5	\N	10	935339119	2012-10-23 13:47:04.172679	2012-10-23 13:47:04.172679
979459994	6	\N	13	935339119	2012-10-23 13:47:04.235249	2012-10-23 13:47:04.235249
979459995	7	\N	56	935339119	2012-10-24 08:10:00.6792	2012-10-24 08:10:00.6792
979459996	8	\N	42	935339119	2012-10-24 08:13:19.27033	2012-10-24 08:13:19.27033
979459997	9	\N	56	935339119	2012-10-24 08:13:19.280917	2012-10-24 08:13:19.280917
979459998	10	\N	12	935339119	2012-10-26 13:51:06.4345	2012-10-26 13:51:06.4345
979459999	11	\N	50	935339119	2012-10-26 14:11:40.983386	2012-10-26 14:11:40.983386
979460000	12	\N	23	935339119	2012-10-26 14:29:24.040907	2012-10-26 14:29:24.040907
979460001	13	\N	123	935339119	2012-10-26 14:39:48.960335	2012-10-26 14:39:48.960335
979460003	14	\N	27	935339119	2012-10-26 15:05:43.293235	2012-10-29 13:06:44.820277
979460004	15	\N	54	935339119	2012-10-29 13:38:18.848873	2012-10-29 13:38:18.848873
979460005	16	\N	60	935339119	2012-10-29 13:38:18.859877	2012-10-29 13:38:18.859877
979460006	17	\N	76	935339119	2012-10-29 16:43:33.581081	2012-10-29 16:43:33.581081
979460007	18	\N	50	935339119	2012-11-02 14:38:42.011211	2012-11-02 14:38:42.011211
979460008	19	\N	42	935339119	2012-11-02 14:59:34.776452	2012-11-02 14:59:34.776452
979460009	20	\N	50	935339119	2012-11-02 14:59:34.81975	2012-11-02 14:59:34.81975
979460010	21	\N	100	935339119	2013-02-26 15:49:10.990802	2013-02-26 15:49:10.990802
979460011	22	\N	20	935339119	2013-02-26 15:50:20.354188	2013-02-26 15:50:20.354188
979460012	23	\N	42	935339119	2013-02-26 15:50:20.362618	2013-02-26 15:50:20.362618
979460013	24	\N	123	935339119	2013-02-26 15:55:27.304951	2013-02-26 15:55:27.304951
979460014	25	\N	10	935339119	2013-02-26 16:36:53.885696	2013-02-26 16:36:53.885696
979460015	26	\N	10	935339119	2013-02-26 16:41:54.145205	2013-02-26 16:41:54.145205
979460016	27	\N	10	935339119	2013-02-26 16:44:13.974236	2013-02-26 16:44:13.974236
979460017	28	\N	10	935339119	2013-02-26 16:53:24.025204	2013-02-26 16:53:24.025204
979460018	29	\N	10	935339119	2013-02-26 16:57:41.180187	2013-02-26 16:57:41.180187
979460019	30	\N	23	935339119	2013-02-26 17:11:44.605361	2013-02-26 17:11:44.605361
979460020	31	\N	14	935339119	2013-02-26 17:17:39.215954	2013-03-07 14:48:53.340712
979460021	32	\N	31	935339119	2013-03-12 11:25:06.553696	2013-03-12 11:25:06.553696
979460022	33	\N	38	935339119	2013-03-12 11:25:06.656118	2013-03-12 11:25:06.656118
979460023	34	\N	15	935339119	2013-03-22 16:10:33.505945	2013-03-22 16:10:33.505945
979460024	35	\N	21	935339119	2013-03-26 19:40:07.847296	2013-03-26 19:40:07.847296
979460025	36	\N	40	935339119	2013-03-26 19:40:07.872179	2013-03-26 19:40:07.872179
979460026	37	\N	46	935339119	2013-03-26 19:40:07.879022	2013-03-26 19:40:07.879022
979460027	38	\N	55	935339119	2013-03-26 19:40:07.885495	2013-03-26 19:40:07.885495
\.


--
-- Data for Name: spree_option_values_variants; Type: TABLE DATA; Schema: public; Owner: alain
--

COPY spree_option_values_variants (variant_id, option_value_id) FROM stdin;
1013589496	979460003
1013589501	979460004
1013589504	979460006
1013589507	979460007
1013589509	979460008
1013589510	979460009
1013589513	979460010
1013589516	979460011
1013589517	979460012
1013589532	979460017
1013589535	979460018
1013589541	979460020
1013589544	979460021
1013589545	979460022
1013589547	979460023
1013589549	979460024
1013589550	979460025
1013589551	979460026
1013589552	979460027
\.


--
-- Data for Name: spree_orders; Type: TABLE DATA; Schema: public; Owner: alain
--

COPY spree_orders (id, number, item_total, total, state, adjustment_total, user_id, created_at, updated_at, completed_at, bill_address_id, ship_address_id, payment_total, shipping_method_id, shipment_state, payment_state, email, special_instructions) FROM stdin;
330565047	R840714064	77.96	81.86	complete	3.90	220281934	2012-05-21 20:13:03	2012-05-22 14:13:03	2012-05-21 20:13:03	273802266	171295127	0.00	\N	pending	balance_due	kitty.hackett@prosacco.ca	\N
231772182	R827271628	93.95	98.65	complete	4.70	323332591	2012-05-21 13:13:03	2012-05-22 14:13:03	2012-05-21 13:13:03	238383541	340874296	0.00	\N	pending	balance_due	gertrude@howell.com	\N
987209861	R241823535	61.97	65.07	complete	3.10	608344442	2012-05-21 12:13:03	2012-05-22 14:13:03	2012-05-21 12:13:03	959594786	592864417	0.00	\N	pending	balance_due	jed@blanda.biz	\N
601813305	R078513401	38.98	40.93	complete	1.95	1028376774	2012-05-21 11:13:03	2012-05-22 14:13:03	2012-05-21 11:13:03	540741786	979318045	0.00	\N	pending	balance_due	alek@mayert.co.uk	\N
349815214	R637280408	86.95	91.30	complete	4.35	172816471	2012-05-21 10:13:03	2012-05-22 14:13:03	2012-05-21 10:13:03	389816337	223872400	0.00	\N	pending	balance_due	heloise@wunschstanton.uk	\N
862055596	R448614360	54.97	57.72	complete	2.75	771020115	2012-05-21 01:13:03	2012-05-22 14:13:03	2012-05-21 01:13:03	813960457	719333514	0.00	\N	pending	balance_due	kayden@kuhic.uk	\N
335228811	R457207820	125.93	129.68	complete	3.75	956993830	2012-05-20 17:13:03	2012-05-22 14:13:03	2012-05-20 17:13:03	99510657	826662719	0.00	\N	pending	balance_due	rachael.ernser@beer.com	\N
620502818	R741864824	126.93	130.73	complete	3.80	235774389	2012-05-20 10:13:03	2012-05-22 14:13:03	2012-05-20 10:13:03	854153494	105050026	0.00	\N	pending	balance_due	dennis@conroy.us	\N
1039486630	R516133033	101.94	105.34	complete	3.40	386199561	2012-05-20 00:13:03	2012-05-22 14:13:03	2012-05-20 00:13:03	736102574	525057558	0.00	\N	pending	balance_due	donald_kozey@batz.uk	\N
183664179	R177300374	106.94	109.74	complete	2.80	537116830	2012-05-19 16:13:03	2012-05-22 14:13:03	2012-05-19 16:13:03	484915261	676105863	0.00	\N	pending	balance_due	jeffry@damore.us	\N
345435026	R243886506	125.93	130.53	complete	4.60	1046959423	2012-05-19 12:13:03	2012-05-22 14:13:03	2012-05-19 12:13:03	42184090	908598054	0.00	\N	pending	balance_due	brooke.cartwright@moen.name	\N
596761353	R747233111	88.95	92.55	complete	3.60	157312430	2012-05-19 03:13:03	2012-05-22 14:13:03	2012-05-19 03:13:03	897883407	19868593	0.00	\N	pending	balance_due	kiarra@satterfield.uk	\N
228571690	R412301346	157.91	164.11	complete	6.20	661521543	2012-05-18 16:13:03	2012-05-22 14:13:03	2012-05-18 16:13:03	462093350	790710942	0.00	\N	pending	balance_due	monique.hegmann@hirthe.co.uk	\N
488679357	R486110043	141.92	147.32	complete	5.40	936450328	2012-05-18 07:13:03	2012-05-22 14:13:03	2012-05-18 07:13:03	188080563	1067341581	0.00	\N	pending	balance_due	phyllis@durgan.co.uk	\N
707237680	R343017142	174.90	181.10	complete	6.20	14035331	2012-05-18 01:13:03	2012-05-22 14:13:03	2012-05-18 01:13:03	1009963300	144271260	0.00	\N	pending	balance_due	betty@kassulke.uk	\N
953580620	R124024066	124.93	130.33	complete	5.40	304595689	2012-05-17 16:13:03	2012-05-22 14:13:03	2012-05-17 16:13:03	784546372	443059452	0.00	\N	pending	balance_due	frederik@stoltenbergbuckridge.name	\N
265374943	R082306365	32.98	33.78	complete	0.80	622916212	2012-05-17 14:13:03	2012-05-22 14:13:03	2012-05-17 14:13:03	432278229	762297451	0.00	\N	pending	balance_due	jordane_auer@douglas.com	\N
568274416	R127851148	64.96	67.36	complete	2.40	187601757	2012-05-16 22:13:03	2012-05-22 14:13:03	2012-05-16 22:13:03	936012796	56745288	0.00	\N	pending	balance_due	hillary_roob@barton.co.uk	\N
1069267029	R064812476	97.94	101.14	complete	3.20	357172992	2012-05-16 15:13:03	2012-05-22 14:13:03	2012-05-16 15:13:03	699334235	486885605	0.00	\N	pending	balance_due	heidi_medhurst@herman.us	\N
146573512	R700132443	82.95	84.55	complete	1.60	575485547	2012-05-16 08:13:03	2012-05-22 14:13:03	2012-05-16 08:13:03	514445004	704804980	0.00	\N	pending	balance_due	tre.moen@moencole.com	\N
297130368	R480312834	48.97	50.57	complete	1.60	994338771	2012-05-16 08:13:03	2012-05-22 14:13:03	2012-05-16 08:13:03	127967096	856369612	0.00	\N	pending	balance_due	gustave@reynolds.us	\N
649259497	R626654271	81.95	84.35	complete	2.40	205739844	2012-05-16 05:13:03	2012-05-22 14:13:03	2012-05-16 05:13:03	816295907	67901793	0.00	\N	pending	balance_due	oleta_leffler@torp.com	\N
906884218	R542508256	97.94	101.14	complete	3.20	486296279	2012-05-16 03:13:03	2012-05-22 14:13:03	2012-05-16 03:13:03	538489458	347276494	0.00	\N	pending	balance_due	cristopher@sipes.name	\N
17482993	R177756364	66.96	67.76	complete	0.80	737901126	2012-05-15 22:13:03	2012-05-22 14:13:03	2012-05-15 22:13:03	387941095	599012441	0.00	\N	pending	balance_due	bell.bogisich@gradylangosh.name	\N
382369184	R422234774	113.92	114.72	complete	0.80	1010549555	2012-05-15 15:13:03	2012-05-22 14:13:03	2012-05-15 15:13:03	14629780	880053548	0.00	\N	pending	balance_due	kip_mosciski@mccullough.com	\N
264449064	R666458433	99.93	100.73	complete	0.80	624071307	2012-05-15 10:13:03	2012-05-22 14:13:03	2012-05-15 10:13:03	433482288	763223188	0.00	\N	pending	balance_due	junior.williamson@goyette.biz	\N
952376497	R750527721	99.93	100.73	complete	0.80	305504796	2012-05-14 23:13:03	2012-05-22 14:13:03	2012-05-14 23:13:03	785472187	444263433	0.00	\N	pending	balance_due	lacey@boyer.biz	\N
648055060	R465451218	141.90	142.70	complete	0.80	206649281	2012-05-14 23:13:03	2012-05-22 14:13:03	2012-05-14 23:13:03	817221404	69106084	0.00	\N	pending	balance_due	mireille@boylebartoletti.com	\N
296204679	R211731747	161.89	165.09	complete	3.20	995493676	2012-05-14 20:13:03	2012-05-22 14:13:03	2012-05-14 20:13:03	129171341	857295155	0.00	\N	pending	balance_due	bryon_sauer@mante.name	\N
145680447	R563760805	171.88	173.48	complete	1.60	576673428	2012-05-14 12:13:03	2012-05-22 14:13:03	2012-05-14 12:13:03	515616313	705697931	0.00	\N	pending	balance_due	hester.fritsch@cummerata.co.uk	\N
1068095656	R813322564	87.94	89.54	complete	1.60	358114821	2012-05-14 03:13:03	2012-05-22 14:13:03	2012-05-14 03:13:03	700227236	488056864	0.00	\N	pending	balance_due	vita@bayer.co.uk	\N
403830194	R801112030	75.95	78.35	complete	2.40	853560069	2012-05-13 11:13:03	2012-05-22 14:13:03	2012-05-13 11:13:03	235189158	984548634	0.00	\N	pending	balance_due	tillman@dietrich.co.uk	\N
780983247	R351857331	103.93	106.33	complete	2.40	75326820	2012-05-13 04:13:03	2012-05-22 14:13:03	2012-05-13 04:13:03	949591493	204614523	0.00	\N	pending	balance_due	stefanie@schmeler.com	\N
428600156	R803364282	173.88	176.28	complete	2.40	863655417	2012-05-13 04:13:03	2012-05-22 14:13:03	2012-05-13 04:13:03	262057300	993336300	0.00	\N	pending	balance_due	dillan@kuhictreutel.com	\N
8567520	R834046544	159.89	162.29	complete	2.40	712180813	2012-05-12 17:13:03	2012-05-22 14:13:03	2012-05-12 17:13:03	379059436	574376536	0.00	\N	pending	balance_due	ayana.spencer@wolff.info	\N
931498615	R122301057	77.95	81.15	complete	3.20	494154972	2012-05-12 11:13:03	2012-05-22 14:13:03	2012-05-12 11:13:03	563137665	356219587	0.00	\N	pending	balance_due	jevon@wisozk.name	\N
702619608	R383108643	45.97	47.57	complete	1.60	51421563	2012-05-12 03:13:03	2012-05-22 14:13:03	2012-05-12 03:13:03	1072978396	190836580	0.00	\N	pending	balance_due	dudley@stoltenbergbosco.biz	\N
518401861	R820218385	133.91	137.11	complete	3.20	873959920	2012-05-11 19:13:03	2012-05-22 14:13:03	2012-05-11 19:13:03	150169931	1012457461	0.00	\N	pending	balance_due	emmett@pfeffer.uk	\N
820530800	R172118430	117.92	120.32	complete	2.40	437907651	2012-05-11 03:13:03	2012-05-22 14:13:03	2012-05-11 03:13:03	654116968	307674844	0.00	\N	pending	balance_due	catharine@schumm.com	\N
542594049	R684553346	143.90	145.50	complete	1.60	178711894	2012-05-11 03:13:03	2012-05-22 14:13:03	2012-05-11 03:13:03	910300663	48866121	0.00	\N	pending	balance_due	adrian@schneider.info	\N
391144298	R886633514	89.94	92.34	complete	2.40	1034018247	2012-05-11 01:13:03	2012-05-22 14:13:03	2012-05-11 01:13:03	21308770	904827870	0.00	\N	pending	balance_due	pierre_mante@roob.us	\N
932702864	R602147837	189.87	193.07	complete	3.20	493245475	2012-05-10 17:13:03	2012-05-22 14:13:03	2012-05-10 17:13:03	562211972	355015228	0.00	\N	pending	balance_due	darius@bogisichlegros.us	\N
9493021	R275526735	31.98	33.58	complete	1.60	711025848	2012-05-10 11:13:03	2012-05-22 14:13:03	2012-05-10 11:13:03	377854995	573450925	0.00	\N	pending	balance_due	terrance_mcdermott@mohrlittel.us	\N
429493153	R660868740	31.98	33.58	complete	1.60	862467340	2012-05-10 01:13:03	2012-05-22 14:13:03	2012-05-10 01:13:03	260885931	992443161	0.00	\N	pending	balance_due	eldred@schinner.name	\N
615724322	R768254127	61.97	65.07	complete	3.10	975572189	2012-05-22 02:13:03	2012-05-22 14:13:03	2012-05-22 02:13:03	660001923	1026748676	0.00	\N	pending	balance_due	roy_moore@bayermarquardt.com	\N
73849921	R220570265	54.97	57.72	complete	2.75	452191684	2012-05-21 06:13:03	2012-05-22 14:13:03	2012-05-21 06:13:03	126041504	501684253	0.00	\N	pending	balance_due	mateo_robel@witting.co.uk	\N
1035625630	R487663886	54.97	57.72	complete	2.75	590306657	2012-05-22 10:13:03	2012-05-22 14:13:03	2012-05-22 10:13:03	1046447419	607887544	57.72	\N	ready	paid	richie_rosenbaum@cole.com	\N
821702295	R511235362	63.96	67.16	complete	3.20	436965436	2012-05-09 08:13:03	2012-05-22 14:13:03	2012-05-09 08:13:03	653224093	306503203	0.00	\N	pending	balance_due	dana_oconnell@bradtke.us	\N
134028804	R262238651	31.98	33.58	complete	1.60	755802289	2012-05-09 03:13:03	2012-05-22 14:13:03	2012-05-09 03:13:03	300439564	625209012	0.00	\N	pending	balance_due	jeramie.jewess@gutmann.co.uk	\N
519327672	R556508821	31.98	33.58	complete	1.60	872804629	2012-05-08 18:13:03	2012-05-22 14:13:03	2012-05-08 18:13:03	148965812	1011531536	0.00	\N	pending	balance_due	walker@durgan.com	\N
703823663	R474880280	63.96	67.16	complete	3.20	50512260	2012-05-08 18:13:03	2012-05-22 14:13:03	2012-05-08 18:13:03	1072052521	189632411	0.00	\N	pending	balance_due	cale_greenholt@champlin.info	\N
239817259	R774413225	31.98	33.58	complete	1.60	616230022	2012-05-08 00:13:03	2012-05-22 14:13:03	2012-05-08 00:13:03	408818721	754295455	0.00	\N	pending	balance_due	travon@lockmankirlin.co.uk	\N
481999185	R268687280	47.97	50.37	complete	2.40	910886886	2012-05-07 15:13:03	2012-05-22 14:13:03	2012-05-07 15:13:03	179306311	1040468473	0.00	\N	pending	balance_due	hope_cremin@bernier.ca	\N
733841882	R560374317	63.96	67.16	complete	3.20	21772151	2012-05-07 04:13:03	2012-05-22 14:13:03	2012-05-07 04:13:03	1034473426	151222638	0.00	\N	pending	balance_due	demetris@wisoky.ca	\N
850712674	R151506644	63.96	67.16	complete	3.20	407201487	2012-05-06 17:13:03	2012-05-22 14:13:03	2012-05-06 17:13:03	614571630	269101270	0.00	\N	pending	balance_due	hellen@boganwaelchi.ca	\N
95676661	R854356257	47.97	50.37	complete	2.40	792876634	2012-05-06 14:13:03	2012-05-22 14:13:03	2012-05-06 14:13:03	329690879	655169605	0.00	\N	pending	balance_due	dock.west@klingemard.info	\N
467107162	R841746501	47.97	50.37	complete	2.40	824624125	2012-05-06 11:13:03	2012-05-22 14:13:03	2012-05-06 11:13:03	230832990	963218914	0.00	\N	pending	balance_due	camron.robel@leffler.info	\N
903421051	R132247206	63.96	67.16	complete	3.20	522756822	2012-05-05 19:13:03	2012-05-22 14:13:03	2012-05-05 19:13:03	600595061	392686799	0.00	\N	pending	balance_due	reina_feest@lehner.ca	\N
48114926	R147476110	15.99	16.79	complete	0.80	674206273	2012-05-05 11:13:03	2012-05-22 14:13:03	2012-05-05 11:13:03	348875494	543218782	0.00	\N	pending	balance_due	bernie.kreiger@brekke.info	\N
308359551	R608116162	63.96	67.16	complete	3.20	948998100	2012-05-05 05:13:03	2012-05-22 14:13:03	2012-05-05 05:13:03	74741621	819970507	0.00	\N	pending	balance_due	mavis_brown@dare.ca	\N
627442156	R685212628	63.96	67.16	complete	3.20	261603145	2012-05-05 01:13:03	2012-05-22 14:13:03	2012-05-05 01:13:03	863193060	131658076	0.00	\N	pending	balance_due	amelia@vonrueden.us	\N
94472210	R856480800	63.96	67.16	complete	3.20	793786021	2012-05-04 15:13:03	2012-05-22 14:13:03	2012-05-04 15:13:03	330616326	656373946	0.00	\N	pending	balance_due	katheryn_dickinson@luettgen.info	\N
732948771	R054236270	47.97	50.37	complete	2.40	22960014	2012-05-04 11:13:03	2012-05-22 14:13:03	2012-05-04 11:13:03	1035644717	152115607	0.00	\N	pending	balance_due	bobby@simonismayer.ca	\N
480827830	R763754840	63.96	67.16	complete	3.20	911828761	2012-05-04 02:13:03	2012-05-22 14:13:03	2012-05-04 02:13:03	180199358	1041639686	0.00	\N	pending	balance_due	florian.rolfson@greenfelder.info	\N
46943257	R572421324	47.97	50.37	complete	2.40	675148478	2012-05-03 20:13:03	2012-05-22 14:13:03	2012-05-03 20:13:03	349768223	544390305	0.00	\N	pending	balance_due	johann.schuppe@waelchi.us	\N
902528130	R111405058	15.99	16.79	complete	0.80	523944495	2012-05-03 17:13:03	2012-05-22 14:13:03	2012-05-03 17:13:03	601766538	393579574	0.00	\N	pending	balance_due	hermann@koelpin.name	\N
750923066	R584582751	63.96	67.16	complete	3.20	104043415	2012-05-03 17:13:03	2012-05-22 14:13:03	2012-05-03 17:13:03	987196214	243064206	0.00	\N	pending	balance_due	amina_blanda@kautzer.name	\N
465903021	R243413728	63.96	67.16	complete	3.20	825533186	2012-05-03 06:13:03	2012-05-22 14:13:03	2012-05-03 06:13:03	231758759	964422941	0.00	\N	pending	balance_due	jairo_tromp@mullerbrown.com	\N
192544832	R300658431	15.99	16.79	complete	0.80	562806419	2012-05-02 22:13:03	2012-05-22 14:13:03	2012-05-02 22:13:03	493831732	700772492	0.00	\N	pending	balance_due	josie_rolfson@rice.com	\N
37328065	R445438881	47.97	50.37	complete	2.40	684206702	2012-05-02 13:13:03	2012-05-22 14:13:03	2012-05-02 13:13:03	338481867	545743993	0.00	\N	pending	balance_due	anita@jewess.com	\N
893297750	R115466211	63.96	67.16	complete	3.20	533666555	2012-05-02 03:13:03	2012-05-22 14:13:03	2012-05-02 03:13:03	590078562	394286306	0.00	\N	pending	balance_due	alyce@schowaltermitchell.name	\N
741864942	R340802838	15.99	16.79	complete	0.80	113658691	2012-05-01 20:13:03	2012-05-22 14:13:03	2012-05-01 20:13:03	975352806	243860826	0.00	\N	pending	balance_due	dave@hellerhettinger.uk	\N
456181117	R356717426	47.97	50.37	complete	2.40	834763738	2012-05-01 12:13:03	2012-05-22 14:13:03	2012-05-01 12:13:03	220562291	965621197	0.00	\N	pending	balance_due	therese_walsh@walter.ca	\N
89411802	R162675434	31.98	33.58	complete	1.60	799403637	2012-05-01 11:13:03	2012-05-22 14:13:03	2012-05-01 11:13:03	323032786	669687922	0.00	\N	pending	balance_due	karley_wisozk@mosciski.us	\N
844324943	R456171307	15.99	16.79	complete	0.80	413327074	2012-05-01 02:13:03	2012-05-22 14:13:03	2012-05-01 02:13:03	608577097	284004603	0.00	\N	pending	balance_due	josefina@halvorson.name	\N
727331319	R806118215	63.96	67.16	complete	3.20	28020570	2012-05-01 02:13:03	2012-05-22 14:13:03	2012-05-01 02:13:03	1028618237	165986627	0.00	\N	pending	balance_due	bartholome@rolfsonbrekke.com	\N
475857254	R158806072	47.97	50.37	complete	2.40	917290961	2012-04-30 20:13:03	2012-05-22 14:13:03	2012-04-30 20:13:03	172509034	1055125974	0.00	\N	pending	balance_due	amara_bergstrom@schowalter.co.uk	\N
216145139	R760707035	47.97	50.37	complete	2.40	638820960	2012-04-30 11:13:03	2012-05-22 14:13:03	2012-04-30 11:13:03	452418301	777841735	0.00	\N	pending	balance_due	lexi@kerluke.biz	\N
455255426	R124161208	63.96	67.16	complete	3.20	835918637	2012-04-30 05:13:03	2012-05-22 14:13:03	2012-04-30 05:13:03	221766538	966546746	0.00	\N	pending	balance_due	misael.wintheiser@gislason.co.uk	\N
740660503	R773423206	63.96	67.16	complete	3.20	114568122	2012-04-29 21:13:03	2012-05-22 14:13:03	2012-04-29 21:13:03	976278305	245065123	0.00	\N	pending	balance_due	ciara.romaguera@bechtelar.ca	\N
892126383	R718327824	15.99	16.79	complete	0.80	534608386	2012-04-29 12:13:03	2012-05-22 14:13:03	2012-04-29 12:13:03	590971557	395457563	0.00	\N	pending	balance_due	aleen.gulgowski@schulist.uk	\N
36435006	R333834202	63.96	67.16	complete	3.20	685394585	2012-04-29 01:13:03	2012-05-22 14:13:03	2012-04-29 01:13:03	339653170	546636942	0.00	\N	pending	balance_due	austen_hilpert@white.ca	\N
474964377	R272472500	47.97	50.37	complete	2.40	918478646	2012-04-28 18:13:03	2012-05-22 14:13:03	2012-04-28 18:13:03	173680531	1056018737	0.00	\N	pending	balance_due	jayme.gerhold@luettgen.info	\N
843120822	R514821167	15.99	16.79	complete	0.80	414236187	2012-04-28 07:13:03	2012-05-22 14:13:03	2012-04-28 07:13:03	609502910	285208578	0.00	\N	pending	balance_due	gisselle.sipes@prohaska.biz	\N
88485925	R724734638	15.99	16.79	complete	0.80	800558738	2012-04-28 02:13:03	2012-05-22 14:13:03	2012-04-28 02:13:03	324236843	670613653	0.00	\N	pending	balance_due	lowell.bradtke@franecki.us	\N
368651700	R842774676	15.99	16.79	complete	0.80	1057526559	2012-04-27 19:13:03	2012-05-22 14:13:03	2012-04-27 19:13:03	65825724	927456520	0.00	\N	pending	balance_due	tressie_moen@uptondibbert.info	\N
587078949	R343875844	47.97	50.37	complete	2.40	135242632	2012-04-27 15:13:03	2012-05-22 14:13:03	2012-04-27 15:13:03	887839535	4255125	0.00	\N	pending	balance_due	trycia.wehner@ryangaylord.ca	\N
539762571	R547605203	31.98	33.58	complete	1.60	140587364	2012-04-27 10:13:03	2012-05-22 14:13:03	2012-04-27 10:13:03	421966440	42776516	0.00	\N	pending	balance_due	isadore.west@beahan.info	\N
983075517	R221567180	100.94	105.14	complete	4.20	275330066	2012-05-18 22:13:03	2012-05-22 14:13:03	2012-05-18 22:13:03	747490487	405174797	0.00	\N	pending	balance_due	rafaela_haag@yost.com	\N
383262055	R845557237	49.97	50.77	complete	0.80	1009361868	2012-05-17 05:13:03	2012-05-22 14:13:03	2012-05-17 05:13:03	13458289	879160787	0.00	\N	pending	balance_due	stella_runolfsson@bins.ca	\N
567102733	R557274271	136.91	140.11	complete	3.20	188543912	2012-05-15 20:13:03	2012-05-22 14:13:03	2012-05-15 20:13:03	936905475	57916861	0.00	\N	pending	balance_due	ari@gleichner.biz	\N
790021435	R635054075	87.94	89.54	complete	1.60	99056534	2012-05-13 19:13:03	2012-05-22 14:13:03	2012-05-13 19:13:03	956531505	229127567	0.00	\N	pending	balance_due	king_keebler@feeney.ca	\N
133136121	R413502076	85.94	86.74	complete	0.80	756990036	2012-05-11 11:13:03	2012-05-22 14:13:03	2012-05-11 11:13:03	301611251	626101841	0.00	\N	pending	balance_due	laura@mcglynncorwin.name	\N
782154552	R546527237	47.97	50.37	complete	2.40	74384795	2012-05-09 14:13:03	2012-05-22 14:13:03	2012-05-09 14:13:03	948698432	203443076	0.00	\N	pending	balance_due	jerry.vonrueden@weber.info	\N
961307330	R178804307	31.98	33.58	complete	1.60	331209749	2012-05-08 11:13:03	2012-05-22 14:13:03	2012-05-08 11:13:03	794371254	468881930	0.00	\N	pending	balance_due	abigayle.smitham@ritchie.biz	\N
751848899	R881512421	47.97	50.37	complete	2.40	102888302	2012-05-06 05:13:03	2012-05-22 14:13:03	2012-05-06 05:13:03	985992137	242138487	0.00	\N	pending	balance_due	kelsie@cruickshankroberts.uk	\N
849787035	R658018855	15.99	16.79	complete	0.80	408356406	2012-05-04 13:13:03	2012-05-22 14:13:03	2012-05-04 13:13:03	615775889	270026799	0.00	\N	pending	balance_due	mable_treutel@legroswilliamson.com	\N
1014837421	R075480357	31.98	33.58	complete	1.60	378310152	2012-05-02 16:13:03	2012-05-22 14:13:03	2012-05-02 16:13:03	711489187	516145181	0.00	\N	pending	balance_due	boris.pacocha@bergnaumreynolds.info	\N
1004874852	R667603126	63.96	67.16	complete	3.20	286560969	2012-04-30 11:13:03	2012-05-22 14:13:03	2012-04-30 11:13:03	770730608	425450708	0.00	\N	pending	balance_due	zelda_wunsch@ward.uk	\N
726159630	R863145803	63.96	67.16	complete	3.20	28962723	2012-04-28 15:13:03	2012-05-22 14:13:03	2012-04-28 15:13:03	1029510922	167158202	0.00	\N	pending	balance_due	loma.bruen@romaguera.biz	\N
1069267031	R888744746	0.00	0.00	cart	0.00	1057526560	2012-05-22 15:29:36.160015	2012-05-22 15:29:36.160015	\N	\N	\N	0.00	\N	\N	\N	\N	\N
1069267033	R431427352	0.00	0.00	cart	0.00	1057526562	2012-06-08 13:34:55.748493	2012-06-08 13:34:55.748493	\N	\N	\N	0.00	\N	\N	\N	\N	\N
1069267034	R258355048	0.00	0.00	cart	0.00	1057526563	2012-06-13 15:21:45.13327	2012-06-13 15:21:45.13327	\N	\N	\N	0.00	\N	\N	paid	\N	\N
1069267038	R400410313	12300.00	12920.00	complete	620.00	1057526566	2012-09-13 12:45:33.448155	2012-09-13 12:49:44.716159	2012-09-13 12:49:44.717935	1072978397	1072978398	12920.00	574015644	backorder	paid	test@test.be	\N
1069267037	R654287322	0.00	0.00	cart	0.00	1057526565	2012-09-13 12:41:25.806292	2012-09-13 12:41:25.806292	\N	\N	\N	0.00	\N	\N	\N	\N	\N
1069267030	R700102701	234.00	239.00	complete	5.00	1	2012-05-22 14:17:21.563461	2013-03-19 16:06:48.030375	2013-03-19 16:06:48.030375	1072978401	1072978400	0.00	574015644	backorder	balance_due	alain@typix.be	\N
1069267040	R512733718	1442.00	1447.00	complete	5.00	1	2013-03-19 20:42:59.884842	2013-03-30 15:48:13.043053	2013-03-30 15:48:13.043053	1072978402	1072978403	0.00	574015644	pending	balance_due	alain@typix.be	\N
1069267041	R810551638	1000.00	1000.00	cart	0.00	1	2013-04-22 11:28:18.663475	2013-04-22 12:14:35.455008	\N	\N	\N	0.00	\N	\N	balance_due	alain@typix.be	\N
\.


--
-- Data for Name: spree_payment_methods; Type: TABLE DATA; Schema: public; Owner: alain
--

COPY spree_payment_methods (id, type, name, description, active, environment, created_at, updated_at, deleted_at, display_on) FROM stdin;
193416319	Spree::Gateway::Bogus	Credit Card	Bogus payment gateway for development.	t	development	2012-05-22 14:13:03	2012-05-22 14:13:03	\N	\N
732545999	Spree::PaymentMethod::Check	Check	Pay by check.	t	development	2012-05-22 14:13:03	2012-05-22 14:13:03	\N	\N
535962117	Spree::Gateway::Bogus	Credit Card	Bogus payment gateway for test.	t	test	2012-05-22 14:13:03	2012-05-22 14:13:03	\N	\N
842616223	Spree::Gateway::Bogus	Credit Card	Bogus payment gateway for production.	t	production	2012-05-22 14:13:03	2012-05-22 14:13:03	\N	\N
931422120	Spree::Gateway::Bogus	Credit Card	Bogus payment gateway for staging.	t	staging	2012-05-22 14:13:03	2012-05-22 14:13:03	\N	\N
\.


--
-- Data for Name: spree_payments; Type: TABLE DATA; Schema: public; Owner: alain
--

COPY spree_payments (id, amount, order_id, created_at, updated_at, source_id, source_type, payment_method_id, state, response_code, avs_response) FROM stdin;
106	239.00	1069267030	2013-03-19 16:11:18.363326	2013-03-19 16:11:18.363326	\N	\N	732545999	checkout	\N	\N
107	1447.00	1069267040	2013-03-30 15:48:12.776411	2013-03-30 15:48:12.776411	\N	\N	732545999	checkout	\N	\N
103	12920.00	1069267038	2012-09-13 12:49:44.651717	2012-09-13 12:51:44.678838	\N	\N	732545999	void	\N	\N
104	12920.00	1069267038	2012-09-13 12:52:01.686602	2012-09-13 12:56:44.998477	\N	\N	732545999	completed	\N	\N
2	65.07	615724322	2012-05-22 14:13:08.625413	2012-05-22 14:13:08.625413	1	Spree::CreditCard	193416319	pending	12345	\N
3	81.86	330565047	2012-05-22 14:13:08.71158	2012-05-22 14:13:08.71158	1	Spree::CreditCard	193416319	pending	12345	\N
4	98.65	231772182	2012-05-22 14:13:08.87463	2012-05-22 14:13:08.87463	1	Spree::CreditCard	193416319	pending	12345	\N
5	65.07	987209861	2012-05-22 14:13:08.961774	2012-05-22 14:13:08.961774	1	Spree::CreditCard	193416319	pending	12345	\N
6	40.93	601813305	2012-05-22 14:13:09.04639	2012-05-22 14:13:09.04639	1	Spree::CreditCard	193416319	pending	12345	\N
7	91.30	349815214	2012-05-22 14:13:09.137961	2012-05-22 14:13:09.137961	1	Spree::CreditCard	193416319	pending	12345	\N
8	57.72	73849921	2012-05-22 14:13:09.318273	2012-05-22 14:13:09.318273	1	Spree::CreditCard	193416319	pending	12345	\N
9	57.72	862055596	2012-05-22 14:13:09.403926	2012-05-22 14:13:09.403926	1	Spree::CreditCard	193416319	pending	12345	\N
10	129.68	335228811	2012-05-22 14:13:09.492196	2012-05-22 14:13:09.492196	1	Spree::CreditCard	193416319	pending	12345	\N
11	130.73	620502818	2012-05-22 14:13:09.6737	2012-05-22 14:13:09.6737	1	Spree::CreditCard	193416319	pending	12345	\N
12	105.34	1039486630	2012-05-22 14:13:09.76317	2012-05-22 14:13:09.76317	1	Spree::CreditCard	193416319	pending	12345	\N
13	109.74	183664179	2012-05-22 14:13:09.852751	2012-05-22 14:13:09.852751	1	Spree::CreditCard	193416319	pending	12345	\N
14	130.53	345435026	2012-05-22 14:13:10.039066	2012-05-22 14:13:10.039066	1	Spree::CreditCard	193416319	pending	12345	\N
15	92.55	596761353	2012-05-22 14:13:10.131057	2012-05-22 14:13:10.131057	1	Spree::CreditCard	193416319	pending	12345	\N
16	105.14	983075517	2012-05-22 14:13:10.220033	2012-05-22 14:13:10.220033	1	Spree::CreditCard	193416319	pending	12345	\N
17	164.11	228571690	2012-05-22 14:13:10.402918	2012-05-22 14:13:10.402918	1	Spree::CreditCard	193416319	pending	12345	\N
18	147.32	488679357	2012-05-22 14:13:10.4952	2012-05-22 14:13:10.4952	1	Spree::CreditCard	193416319	pending	12345	\N
19	181.10	707237680	2012-05-22 14:13:10.58427	2012-05-22 14:13:10.58427	1	Spree::CreditCard	193416319	pending	12345	\N
20	130.33	953580620	2012-05-22 14:13:10.773715	2012-05-22 14:13:10.773715	1	Spree::CreditCard	193416319	pending	12345	\N
21	33.78	265374943	2012-05-22 14:13:10.863612	2012-05-22 14:13:10.863612	1	Spree::CreditCard	193416319	pending	12345	\N
22	50.77	383262055	2012-05-22 14:13:10.947346	2012-05-22 14:13:10.947346	1	Spree::CreditCard	193416319	pending	12345	\N
23	67.36	568274416	2012-05-22 14:13:11.122259	2012-05-22 14:13:11.122259	1	Spree::CreditCard	193416319	pending	12345	\N
24	101.14	1069267029	2012-05-22 14:13:11.21632	2012-05-22 14:13:11.21632	1	Spree::CreditCard	193416319	pending	12345	\N
25	84.55	146573512	2012-05-22 14:13:11.303214	2012-05-22 14:13:11.303214	1	Spree::CreditCard	193416319	pending	12345	\N
26	50.57	297130368	2012-05-22 14:13:11.472888	2012-05-22 14:13:11.472888	1	Spree::CreditCard	193416319	pending	12345	\N
27	84.35	649259497	2012-05-22 14:13:11.559089	2012-05-22 14:13:11.559089	1	Spree::CreditCard	193416319	pending	12345	\N
28	101.14	906884218	2012-05-22 14:13:11.643816	2012-05-22 14:13:11.643816	1	Spree::CreditCard	193416319	pending	12345	\N
29	67.76	17482993	2012-05-22 14:13:11.818701	2012-05-22 14:13:11.818701	1	Spree::CreditCard	193416319	pending	12345	\N
30	140.11	567102733	2012-05-22 14:13:11.912797	2012-05-22 14:13:11.912797	1	Spree::CreditCard	193416319	pending	12345	\N
31	114.72	382369184	2012-05-22 14:13:12.001334	2012-05-22 14:13:12.001334	1	Spree::CreditCard	193416319	pending	12345	\N
32	100.73	264449064	2012-05-22 14:13:12.17228	2012-05-22 14:13:12.17228	1	Spree::CreditCard	193416319	pending	12345	\N
33	100.73	952376497	2012-05-22 14:13:12.280693	2012-05-22 14:13:12.280693	1	Spree::CreditCard	193416319	pending	12345	\N
34	142.70	648055060	2012-05-22 14:13:12.369003	2012-05-22 14:13:12.369003	1	Spree::CreditCard	193416319	pending	12345	\N
35	165.09	296204679	2012-05-22 14:13:12.541101	2012-05-22 14:13:12.541101	1	Spree::CreditCard	193416319	pending	12345	\N
36	173.48	145680447	2012-05-22 14:13:12.632407	2012-05-22 14:13:12.632407	1	Spree::CreditCard	193416319	pending	12345	\N
37	89.54	1068095656	2012-05-22 14:13:12.719329	2012-05-22 14:13:12.719329	1	Spree::CreditCard	193416319	pending	12345	\N
38	89.54	790021435	2012-05-22 14:13:12.804822	2012-05-22 14:13:12.804822	1	Spree::CreditCard	193416319	pending	12345	\N
39	78.35	403830194	2012-05-22 14:13:12.985607	2012-05-22 14:13:12.985607	1	Spree::CreditCard	193416319	pending	12345	\N
40	106.33	780983247	2012-05-22 14:13:13.072185	2012-05-22 14:13:13.072185	1	Spree::CreditCard	193416319	pending	12345	\N
41	176.28	428600156	2012-05-22 14:13:13.175165	2012-05-22 14:13:13.175165	1	Spree::CreditCard	193416319	pending	12345	\N
42	162.29	8567520	2012-05-22 14:13:13.356426	2012-05-22 14:13:13.356426	1	Spree::CreditCard	193416319	pending	12345	\N
43	81.15	931498615	2012-05-22 14:13:13.443165	2012-05-22 14:13:13.443165	1	Spree::CreditCard	193416319	pending	12345	\N
44	47.57	702619608	2012-05-22 14:13:13.527949	2012-05-22 14:13:13.527949	1	Spree::CreditCard	193416319	pending	12345	\N
45	137.11	518401861	2012-05-22 14:13:13.705447	2012-05-22 14:13:13.705447	1	Spree::CreditCard	193416319	pending	12345	\N
46	86.74	133136121	2012-05-22 14:13:13.793231	2012-05-22 14:13:13.793231	1	Spree::CreditCard	193416319	pending	12345	\N
47	120.32	820530800	2012-05-22 14:13:13.879612	2012-05-22 14:13:13.879612	1	Spree::CreditCard	193416319	pending	12345	\N
48	145.50	542594049	2012-05-22 14:13:14.053123	2012-05-22 14:13:14.053123	1	Spree::CreditCard	193416319	pending	12345	\N
49	92.34	391144298	2012-05-22 14:13:14.140569	2012-05-22 14:13:14.140569	1	Spree::CreditCard	193416319	pending	12345	\N
50	193.07	932702864	2012-05-22 14:13:14.226775	2012-05-22 14:13:14.226775	1	Spree::CreditCard	193416319	pending	12345	\N
51	33.58	9493021	2012-05-22 14:13:14.408828	2012-05-22 14:13:14.408828	1	Spree::CreditCard	193416319	pending	12345	\N
52	33.58	429493153	2012-05-22 14:13:14.502353	2012-05-22 14:13:14.502353	1	Spree::CreditCard	193416319	pending	12345	\N
53	50.37	782154552	2012-05-22 14:13:14.582626	2012-05-22 14:13:14.582626	1	Spree::CreditCard	193416319	pending	12345	\N
54	67.16	821702295	2012-05-22 14:13:14.75162	2012-05-22 14:13:14.75162	1	Spree::CreditCard	193416319	pending	12345	\N
55	33.58	134028804	2012-05-22 14:13:14.837762	2012-05-22 14:13:14.837762	1	Spree::CreditCard	193416319	pending	12345	\N
56	33.58	519327672	2012-05-22 14:13:14.919311	2012-05-22 14:13:14.919311	1	Spree::CreditCard	193416319	pending	12345	\N
57	67.16	703823663	2012-05-22 14:13:15.000048	2012-05-22 14:13:15.000048	1	Spree::CreditCard	193416319	pending	12345	\N
58	33.58	961307330	2012-05-22 14:13:15.185582	2012-05-22 14:13:15.185582	1	Spree::CreditCard	193416319	pending	12345	\N
59	33.58	239817259	2012-05-22 14:13:15.266606	2012-05-22 14:13:15.266606	1	Spree::CreditCard	193416319	pending	12345	\N
60	50.37	481999185	2012-05-22 14:13:15.346933	2012-05-22 14:13:15.346933	1	Spree::CreditCard	193416319	pending	12345	\N
61	67.16	733841882	2012-05-22 14:13:15.53226	2012-05-22 14:13:15.53226	1	Spree::CreditCard	193416319	pending	12345	\N
62	67.16	850712674	2012-05-22 14:13:15.618548	2012-05-22 14:13:15.618548	1	Spree::CreditCard	193416319	pending	12345	\N
63	50.37	95676661	2012-05-22 14:13:15.700146	2012-05-22 14:13:15.700146	1	Spree::CreditCard	193416319	pending	12345	\N
64	50.37	467107162	2012-05-22 14:13:15.876592	2012-05-22 14:13:15.876592	1	Spree::CreditCard	193416319	pending	12345	\N
65	50.37	751848899	2012-05-22 14:13:15.959333	2012-05-22 14:13:15.959333	1	Spree::CreditCard	193416319	pending	12345	\N
66	67.16	903421051	2012-05-22 14:13:16.040276	2012-05-22 14:13:16.040276	1	Spree::CreditCard	193416319	pending	12345	\N
67	16.79	48114926	2012-05-22 14:13:16.209365	2012-05-22 14:13:16.209365	1	Spree::CreditCard	193416319	pending	12345	\N
1	57.72	1035625630	2012-05-22 14:13:08.524121	2012-09-13 12:58:04.499798	1	Spree::CreditCard	193416319	completed	67890	\N
68	67.16	308359551	2012-05-22 14:13:16.301823	2012-05-22 14:13:16.301823	1	Spree::CreditCard	193416319	pending	12345	\N
69	67.16	627442156	2012-05-22 14:13:16.38598	2012-05-22 14:13:16.38598	1	Spree::CreditCard	193416319	pending	12345	\N
70	67.16	94472210	2012-05-22 14:13:16.466099	2012-05-22 14:13:16.466099	1	Spree::CreditCard	193416319	pending	12345	\N
71	16.79	849787035	2012-05-22 14:13:16.640001	2012-05-22 14:13:16.640001	1	Spree::CreditCard	193416319	pending	12345	\N
72	50.37	732948771	2012-05-22 14:13:16.722915	2012-05-22 14:13:16.722915	1	Spree::CreditCard	193416319	pending	12345	\N
73	67.16	480827830	2012-05-22 14:13:16.802764	2012-05-22 14:13:16.802764	1	Spree::CreditCard	193416319	pending	12345	\N
74	50.37	46943257	2012-05-22 14:13:16.976972	2012-05-22 14:13:16.976972	1	Spree::CreditCard	193416319	pending	12345	\N
75	16.79	902528130	2012-05-22 14:13:17.059029	2012-05-22 14:13:17.059029	1	Spree::CreditCard	193416319	pending	12345	\N
76	67.16	750923066	2012-05-22 14:13:17.146529	2012-05-22 14:13:17.146529	1	Spree::CreditCard	193416319	pending	12345	\N
77	67.16	465903021	2012-05-22 14:13:17.329493	2012-05-22 14:13:17.329493	1	Spree::CreditCard	193416319	pending	12345	\N
78	16.79	192544832	2012-05-22 14:13:17.41173	2012-05-22 14:13:17.41173	1	Spree::CreditCard	193416319	pending	12345	\N
79	33.58	1014837421	2012-05-22 14:13:17.491818	2012-05-22 14:13:17.491818	1	Spree::CreditCard	193416319	pending	12345	\N
80	50.37	37328065	2012-05-22 14:13:17.666967	2012-05-22 14:13:17.666967	1	Spree::CreditCard	193416319	pending	12345	\N
81	67.16	893297750	2012-05-22 14:13:17.750551	2012-05-22 14:13:17.750551	1	Spree::CreditCard	193416319	pending	12345	\N
82	16.79	741864942	2012-05-22 14:13:17.833376	2012-05-22 14:13:17.833376	1	Spree::CreditCard	193416319	pending	12345	\N
83	50.37	456181117	2012-05-22 14:13:17.913271	2012-05-22 14:13:17.913271	1	Spree::CreditCard	193416319	pending	12345	\N
84	33.58	89411802	2012-05-22 14:13:18.093572	2012-05-22 14:13:18.093572	1	Spree::CreditCard	193416319	pending	12345	\N
85	16.79	844324943	2012-05-22 14:13:18.17445	2012-05-22 14:13:18.17445	1	Spree::CreditCard	193416319	pending	12345	\N
86	67.16	727331319	2012-05-22 14:13:18.255466	2012-05-22 14:13:18.255466	1	Spree::CreditCard	193416319	pending	12345	\N
87	50.37	475857254	2012-05-22 14:13:18.433418	2012-05-22 14:13:18.433418	1	Spree::CreditCard	193416319	pending	12345	\N
88	50.37	216145139	2012-05-22 14:13:18.515377	2012-05-22 14:13:18.515377	1	Spree::CreditCard	193416319	pending	12345	\N
89	67.16	1004874852	2012-05-22 14:13:18.595231	2012-05-22 14:13:18.595231	1	Spree::CreditCard	193416319	pending	12345	\N
90	67.16	455255426	2012-05-22 14:13:18.782117	2012-05-22 14:13:18.782117	1	Spree::CreditCard	193416319	pending	12345	\N
91	67.16	740660503	2012-05-22 14:13:18.875375	2012-05-22 14:13:18.875375	1	Spree::CreditCard	193416319	pending	12345	\N
92	16.79	892126383	2012-05-22 14:13:18.955734	2012-05-22 14:13:18.955734	1	Spree::CreditCard	193416319	pending	12345	\N
93	67.16	36435006	2012-05-22 14:13:19.130698	2012-05-22 14:13:19.130698	1	Spree::CreditCard	193416319	pending	12345	\N
94	50.37	474964377	2012-05-22 14:13:19.218695	2012-05-22 14:13:19.218695	1	Spree::CreditCard	193416319	pending	12345	\N
95	67.16	726159630	2012-05-22 14:13:19.29991	2012-05-22 14:13:19.29991	1	Spree::CreditCard	193416319	pending	12345	\N
96	16.79	843120822	2012-05-22 14:13:19.37965	2012-05-22 14:13:19.37965	1	Spree::CreditCard	193416319	pending	12345	\N
97	16.79	88485925	2012-05-22 14:13:19.576416	2012-05-22 14:13:19.576416	1	Spree::CreditCard	193416319	pending	12345	\N
98	16.79	368651700	2012-05-22 14:13:19.673746	2012-05-22 14:13:19.673746	1	Spree::CreditCard	193416319	pending	12345	\N
99	50.37	587078949	2012-05-22 14:13:19.753392	2012-05-22 14:13:19.753392	1	Spree::CreditCard	193416319	pending	12345	\N
100	33.58	539762571	2012-05-22 14:13:19.930867	2012-05-22 14:13:19.930867	1	Spree::CreditCard	193416319	pending	12345	\N
105	239.00	1069267030	2013-03-19 16:06:47.951334	2013-03-19 16:10:06.524051	\N	\N	732545999	void	\N	\N
\.


--
-- Data for Name: spree_pending_promotions; Type: TABLE DATA; Schema: public; Owner: alain
--

COPY spree_pending_promotions (id, user_id, promotion_id) FROM stdin;
\.


--
-- Name: spree_pending_promotions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alain
--

SELECT pg_catalog.setval('spree_pending_promotions_id_seq', 1, false);


--
-- Data for Name: spree_preferences; Type: TABLE DATA; Schema: public; Owner: alain
--

COPY spree_preferences (id, name, owner_id, owner_type, value, created_at, updated_at, key, value_type) FROM stdin;
1	\N	\N	\N	5.0	2012-05-22 14:13:20.018078	2012-05-22 14:13:20.018078	spree/calculator/flat_rate/amount/574015644	decimal
2	\N	\N	\N	15.0	2012-05-22 14:13:20.031286	2012-05-22 14:13:20.031286	spree/calculator/flat_rate/amount/13537749	decimal
3	\N	\N	\N	10.0	2012-05-22 14:13:20.041062	2012-05-22 14:13:20.041062	spree/calculator/flat_rate/amount/192811543	decimal
7	\N	\N	\N	Typix	2012-10-02 14:20:55.555255	2013-05-06 09:22:10.126291	spree/app_configuration/site_name	string
11	\N	\N	\N		2013-03-27 22:23:05.883973	2013-03-27 22:23:05.883973	spree/app_configuration/default_seo_title	string
12	\N	\N	\N	spree, demo	2013-03-27 22:23:05.946677	2013-03-27 22:23:05.946677	spree/app_configuration/default_meta_keywords	string
13	\N	\N	\N	Spree demo site	2013-03-27 22:23:05.957844	2013-03-27 22:23:05.957844	spree/app_configuration/default_meta_description	string
14	\N	\N	\N	demo.spreecommerce.com	2013-03-27 22:23:05.964094	2013-03-27 22:23:05.964094	spree/app_configuration/site_url	string
15	\N	\N	\N	t	2013-03-27 22:23:05.974602	2013-03-27 22:23:05.974602	spree/app_configuration/allow_ssl_in_production	boolean
16	\N	\N	\N	t	2013-03-27 22:23:05.980675	2013-03-27 22:23:05.980675	spree/app_configuration/allow_ssl_in_staging	boolean
17	\N	\N	\N	f	2013-03-27 22:23:05.988369	2013-03-27 22:23:05.988369	spree/app_configuration/allow_ssl_in_development_and_test	boolean
18	\N	\N	\N	t	2013-03-27 22:23:05.997399	2013-03-27 22:23:05.997399	spree/app_configuration/check_for_spree_alerts	boolean
19	\N	\N	\N	f	2013-03-27 22:23:06.008572	2013-03-27 22:23:06.008572	spree/app_configuration/display_currency	boolean
20	\N	\N	\N	EUR	2013-03-27 22:23:06.132485	2013-03-27 22:23:06.132485	spree/app_configuration/currency	string
\.


--
-- Data for Name: spree_product_option_types; Type: TABLE DATA; Schema: public; Owner: alain
--

COPY spree_product_option_types (id, "position", product_id, option_type_id, created_at, updated_at) FROM stdin;
856797686	1	1060500604	935339119	2012-10-15 20:00:05.351811	2012-10-15 20:00:05.351811
856797687	1	1060500605	935339119	2012-10-15 20:03:43.6142	2012-10-15 20:03:43.6142
856797689	1	1060500607	935339119	2012-10-15 20:25:08.515441	2012-10-15 20:25:08.515441
856797706	1	1060500650	935339119	2012-10-26 15:05:43.264111	2012-10-26 15:05:43.264111
856797707	1	1060500651	935339119	2012-10-29 13:38:18.76242	2012-10-29 13:38:18.76242
856797708	1	1060500653	935339119	2012-11-02 14:59:34.701896	2012-11-02 14:59:34.701896
856797709	1	1060500654	935339119	2013-02-26 15:49:10.610464	2013-02-26 15:49:10.610464
856797710	1	1060500655	935339119	2013-02-26 15:50:20.334078	2013-02-26 15:50:20.334078
856797715	1	1060500660	935339119	2013-02-26 16:53:23.998534	2013-02-26 16:53:23.998534
856797716	1	1060500661	935339119	2013-02-26 16:57:41.154481	2013-02-26 16:57:41.154481
856797718	1	1060500663	935339119	2013-02-26 17:17:39.185108	2013-02-26 17:17:39.185108
856797719	1	1060500664	935339119	2013-03-12 11:25:06.318226	2013-03-12 11:25:06.318226
856797720	1	1060500665	935339119	2013-03-26 19:40:07.687455	2013-03-26 19:40:07.687455
\.


--
-- Data for Name: spree_product_properties; Type: TABLE DATA; Schema: public; Owner: alain
--

COPY spree_product_properties (id, value, product_id, property_id, created_at, updated_at) FROM stdin;
1073273571	Sony	1060500665	161337574	2013-03-26 19:40:07.727265	2013-03-26 19:40:07.727265
1073273572	2	1060500665	905834915	2013-03-26 19:40:07.732799	2013-03-26 19:40:07.732799
1073273573	1	1060500665	905834916	2013-03-26 19:40:07.73449	2013-03-26 19:40:07.73449
1073273574	1	1060500665	905834917	2013-03-26 19:40:07.736033	2013-03-26 19:40:07.736033
1073273575	2	1060500665	905834919	2013-03-26 19:40:07.737561	2013-03-26 19:40:07.737561
1073273576	0	1060500665	905834920	2013-03-26 19:40:07.739015	2013-03-26 19:40:07.739015
1073273577	0	1060500665	905834921	2013-03-26 19:40:07.740518	2013-03-26 19:40:07.740518
1073273578	LED	1060500665	905834903	2013-03-26 19:40:07.741799	2013-03-26 19:40:07.741799
1073273579	1080p	1060500665	905834904	2013-03-26 19:40:07.743235	2013-03-26 19:40:07.743235
1073273580	PCMCIA (compatible CI+)	1060500665	905834905	2013-03-26 19:40:07.744685	2013-03-26 19:40:07.744685
1073273581	1	1060500665	905834907	2013-03-26 19:40:07.746049	2013-03-26 19:40:07.746049
1073273582	1	1060500665	905834906	2013-03-26 19:40:07.74765	2013-03-26 19:40:07.74765
1073273583	1	1060500665	905834914	2013-03-26 19:40:07.749074	2013-03-26 19:40:07.749074
1073273584	0	1060500665	905834918	2013-03-26 19:40:07.750245	2013-03-26 19:40:07.750245
1073273490	sony	1060500651	161337574	2012-10-29 13:38:18.819069	2012-10-29 13:38:18.819069
1073273491	420p	1060500651	905834904	2012-10-29 13:38:18.8216	2012-10-29 13:38:18.8216
1073273493	0	1060500651	905834907	2012-10-29 13:38:18.826463	2012-10-29 13:38:18.826463
1073273494	1	1060500651	905834906	2012-10-29 13:38:18.828434	2012-10-29 13:38:18.828434
1073273495	sony	1060500652	161337574	2012-11-02 14:30:06.71685	2012-11-02 14:30:06.71685
1073273497	0	1060500652	905834907	2012-11-02 14:30:06.802886	2012-11-02 14:30:06.802886
1073273498	1	1060500652	905834906	2012-11-02 14:30:06.805578	2012-11-02 14:30:06.805578
1073273169	truc	1060500602	905834908	2012-10-15 13:03:52.703929	2012-10-15 13:03:52.703929
1073273170	dfoi	1060500602	905834909	2012-10-15 13:03:52.7308	2012-10-15 13:03:52.7308
1073273171	df	1060500602	905834910	2012-10-15 13:03:52.732815	2012-10-15 13:03:52.732815
1073273172	0	1060500602	905834911	2012-10-15 13:03:52.734674	2012-10-15 13:03:52.734674
1073273173	1	1060500602	905834912	2012-10-15 13:03:52.736372	2012-10-15 13:03:52.736372
1073273174	bide	1060500603	161337574	2012-10-15 13:32:43.806655	2012-10-15 13:32:43.806655
1073273177	1	1060500603	905834907	2012-10-15 13:32:43.810399	2012-10-15 13:32:43.810399
1073273178	0	1060500603	905834906	2012-10-15 13:32:43.811437	2012-10-15 13:32:43.811437
1073273179	dfs	1060500604	161337574	2012-10-15 20:00:05.186786	2012-10-15 20:00:05.186786
1073273182	1	1060500604	905834907	2012-10-15 20:00:05.192227	2012-10-15 20:00:05.192227
1073273183	0	1060500604	905834906	2012-10-15 20:00:05.193295	2012-10-15 20:00:05.193295
1073273189	qsdf	1060500605	161337574	2012-10-15 20:03:43.545484	2012-10-15 20:03:43.545484
1073273192	1	1060500605	905834907	2012-10-15 20:03:43.548765	2012-10-15 20:03:43.548765
1073273193	0	1060500605	905834906	2012-10-15 20:03:43.549781	2012-10-15 20:03:43.549781
1073273194	Sony	1060500605	161337574	2012-10-15 20:03:43.56016	2013-02-28 17:15:22.365091
1073273560	Sony	1060500663	161337574	2013-02-26 17:17:39.190273	2013-03-22 15:26:31.754686
1073273569	0	1060500664	905834907	2013-03-12 11:25:06.390199	2013-03-28 18:42:30.698663
1073273212	1	1060500607	905834907	2012-10-15 20:25:08.325294	2012-10-15 20:25:08.325294
1073273213	0	1060500607	905834906	2012-10-15 20:25:08.326428	2012-10-15 20:25:08.326428
1073273500	Sony	1060500653	161337574	2012-11-02 14:59:34.746091	2012-11-02 14:59:34.746091
1073273501	1080p	1060500653	905834904	2012-11-02 14:59:34.747977	2012-11-02 14:59:34.747977
1073273502	LED	1060500653	905834903	2012-11-02 14:59:34.749643	2012-11-02 14:59:34.749643
1073273503	1	1060500653	905834907	2012-11-02 14:59:34.751256	2012-11-02 14:59:34.751256
1073273504	1	1060500653	905834906	2012-11-02 14:59:34.752834	2012-11-02 14:59:34.752834
1073273492	cathodique	1060500651	905834903	2012-10-29 13:38:18.824194	2013-02-25 10:36:26.234879
1073273506	Sony	1060500654	161337574	2013-02-26 15:49:10.785058	2013-02-26 15:49:10.785058
1073273507	420p	1060500654	905834904	2013-02-26 15:49:10.787298	2013-02-26 15:49:10.787298
1073273509	1	1060500654	905834907	2013-02-26 15:49:10.791073	2013-02-26 15:49:10.791073
1073273510	0	1060500654	905834906	2013-02-26 15:49:10.793098	2013-02-26 15:49:10.793098
1073273512	Samsung	1060500655	161337574	2013-02-26 15:50:20.337126	2013-02-26 15:50:20.337126
1073273513	1080p	1060500655	905834904	2013-02-26 15:50:20.338487	2013-02-26 15:50:20.338487
1073273514	LED	1060500655	905834903	2013-02-26 15:50:20.339837	2013-02-26 15:50:20.339837
1073273487	0	1060500650	905834907	2012-10-26 15:05:43.273837	2012-10-26 15:05:43.273837
1073273488	1	1060500650	905834906	2012-10-26 15:05:43.275012	2012-10-26 15:05:43.275012
1073273515	1	1060500655	905834907	2013-02-26 15:50:20.341139	2013-02-26 15:50:20.341139
1073273516	1	1060500655	905834906	2013-02-26 15:50:20.342538	2013-02-26 15:50:20.342538
1073273545	0	1060500660	905834907	2013-02-26 16:53:24.009096	2013-02-26 16:53:24.009096
1073273546	1	1060500660	905834906	2013-02-26 16:53:24.010591	2013-02-26 16:53:24.010591
1073273551	0	1060500661	905834907	2013-02-26 16:57:41.162381	2013-02-26 16:57:41.162381
1073273552	0	1060500661	905834906	2013-02-26 16:57:41.163512	2013-02-26 16:57:41.163512
1073273563	0	1060500663	905834907	2013-02-26 17:17:39.194199	2013-02-26 17:17:39.194199
1073273564	0	1060500663	905834906	2013-02-26 17:17:39.19556	2013-02-26 17:17:39.19556
1073273150	Sony	1060500596	161337574	2012-09-11 19:18:05.658155	2013-02-28 17:12:44.619193
1073273184	Sony	1060500604	161337574	2012-10-15 20:00:05.208464	2013-02-28 17:15:22.361519
1073273214	Sony	1060500607	161337574	2012-10-15 20:25:08.340086	2013-02-28 17:15:22.371883
1073273566	Samsung	1060500664	161337574	2013-03-12 11:25:06.385152	2013-03-12 11:25:06.385152
1073273567	4K	1060500664	905834904	2013-03-12 11:25:06.386898	2013-03-12 11:25:06.386898
1073273568	cathodique	1060500664	905834903	2013-03-12 11:25:06.38864	2013-03-12 11:25:06.38864
1073273570	1	1060500664	905834906	2013-03-12 11:25:06.39159	2013-03-12 11:25:06.39159
1073273548	Samsung	1060500661	161337574	2013-02-26 16:57:41.1591	2013-03-12 13:46:30.51823
1073273549	420p	1060500661	905834904	2013-02-26 16:57:41.160291	2013-03-12 13:46:30.520412
1073273550	LED	1060500661	905834903	2013-02-26 16:57:41.161337	2013-03-12 13:46:30.522467
1073273508	cathodique	1060500654	905834903	2013-02-26 15:49:10.789128	2013-03-12 13:46:48.444488
1073273542	Sony	1060500660	161337574	2013-02-26 16:53:24.004012	2013-03-12 13:48:23.72512
1073273543	420p	1060500660	905834904	2013-02-26 16:53:24.005718	2013-03-12 13:48:23.726266
1073273544	LCD	1060500660	905834903	2013-02-26 16:53:24.007506	2013-03-12 13:48:23.727358
1073273485	4K	1060500650	905834904	2012-10-26 15:05:43.271056	2013-03-12 13:48:52.064766
1073273486	OLED	1060500650	905834903	2012-10-26 15:05:43.272689	2013-03-12 13:48:52.066146
1073273561	1080p	1060500663	905834904	2013-02-26 17:17:39.191664	2013-03-12 13:49:22.813622
1073273562	LCD	1060500663	905834903	2013-02-26 17:17:39.192961	2013-03-12 13:49:22.815362
\.


--
-- Data for Name: spree_products; Type: TABLE DATA; Schema: public; Owner: alain
--

COPY spree_products (id, name, description, available_on, deleted_at, permalink, meta_description, meta_keywords, tax_category_id, shipping_category_id, created_at, updated_at, count_on_hand, is_discovery) FROM stdin;
1060500607	lebon	\N	\N	\N	lebon	\N	\N	\N	\N	2012-10-15 20:25:08.318484	2012-10-15 20:25:08.519405	0	\N
1060500597	dsfqds	\N	\N	\N	dsfqds	\N	\N	\N	\N	2012-09-12 17:45:58.398813	2012-09-12 17:45:58.505832	0	\N
1060500652	blu-ray platine		2012-11-02 14:30:06.59124	\N	blu-ray-platine	\N	\N	\N	\N	2012-11-02 14:30:06.651358	2013-05-06 08:44:24.03801	0	f
1060500665	Bravia KDL22EX320		2013-03-26 19:40:07.279766	\N	bravia-kdl22ex320	\N	\N	\N	\N	2013-03-26 19:40:07.551006	2013-05-06 08:44:24.059123	0	f
1060500605	lesdain2	\N	\N	\N	lesdain2	\N	\N	\N	\N	2012-10-15 20:03:43.543651	2012-10-15 20:03:43.616811	0	\N
1060500596	gaston lagaffe		2012-09-04 00:00:00	2012-09-18 14:07:06.189121	gaston-lagaffe			\N	\N	2012-09-11 19:18:05.640051	2012-09-18 14:07:06.261738	0	\N
1060500600	test	\N	\N	\N	test	\N	\N	\N	\N	2012-10-15 12:41:39.943264	2012-10-15 12:41:40.008971	0	\N
1060500601	perlinpinpin	\N	\N	\N	perlinpinpin	\N	\N	\N	\N	2012-10-15 12:42:54.324623	2012-10-15 12:42:54.333131	0	\N
1060500602	machint	\N	\N	\N	machint	\N	\N	\N	\N	2012-10-15 13:03:52.700903	2012-10-15 13:03:52.748943	0	\N
1060500603	rondoudou	\N	\N	\N	rondoudou	\N	\N	\N	\N	2012-10-15 13:32:43.804361	2012-10-15 13:32:43.817673	0	\N
1060500604	lesdain	\N	\N	\N	lesdain	\N	\N	\N	\N	2012-10-15 20:00:05.183463	2012-10-15 20:00:05.398231	0	\N
1060500663	sensbien		2013-02-26 17:17:39.141262	\N	sensbien	\N	\N	\N	\N	2013-02-26 17:17:39.161026	2013-03-22 16:10:33.602919	0	f
1060500660	bubulle		2013-02-26 16:53:23.967395	\N	bubllle	\N	\N	\N	\N	2013-02-26 16:53:23.988851	2013-03-12 13:48:23.731725	0	f
1060500651	papytv	super télé pour égayer vos soirées fauteuils.	2012-10-29 13:38:18.617705	\N	papytv	\N	\N	\N	\N	2012-10-29 13:38:18.634495	2013-02-28 15:51:08.25499	0	f
1060500650	thegood		2012-10-26 15:05:43.229509	\N	thegood	\N	\N	\N	\N	2012-10-26 15:05:43.2439	2013-03-12 13:48:52.070985	0	f
1060500653	klh45		2012-11-02 14:59:34.541007	\N	klh45	\N	\N	\N	\N	2012-11-02 14:59:34.558925	2013-03-12 14:06:03.312486	0	f
1060500655	machintruc	encore une télé\r\n\r\nMais c'est une magnifique télé!	2013-02-26 15:50:20.315827	\N	machintruc	\N	\N	\N	\N	2013-02-26 15:50:20.329644	2013-03-27 10:01:25.503242	0	t
1060500664	mirecolor	bah une télé quoi	2013-03-12 11:25:05.567624	\N	mirecolor	\N	\N	\N	\N	2013-03-12 11:25:05.997067	2013-03-28 18:42:30.712666	0	f
1060500661	teeellleeee		2013-02-26 16:57:40.993993	\N	marre	\N	\N	\N	\N	2013-02-26 16:57:41.011526	2013-03-12 13:46:30.559943	0	f
1060500654	telékiki	tele old school	2013-02-26 15:49:10.426937	\N	telekiki	\N	\N	\N	\N	2013-02-26 15:49:10.505477	2013-03-12 13:46:48.449623	0	f
\.


--
-- Data for Name: spree_products_promotion_rules; Type: TABLE DATA; Schema: public; Owner: alain
--

COPY spree_products_promotion_rules (product_id, promotion_rule_id) FROM stdin;
\.


--
-- Data for Name: spree_products_taxons; Type: TABLE DATA; Schema: public; Owner: alain
--

COPY spree_products_taxons (product_id, taxon_id) FROM stdin;
1060500652	558398382
1060500653	558398361
1060500654	558398361
1060500655	558398361
1060500660	558398361
1060500661	558398361
1060500663	558398361
1060500650	558398361
1060500651	558398361
1060500664	558398361
1060500665	558398361
\.


--
-- Data for Name: spree_promotion_action_line_items; Type: TABLE DATA; Schema: public; Owner: alain
--

COPY spree_promotion_action_line_items (id, promotion_action_id, variant_id, quantity) FROM stdin;
1	7	1013589516	1
\.


--
-- Data for Name: spree_promotion_actions; Type: TABLE DATA; Schema: public; Owner: alain
--

COPY spree_promotion_actions (id, activator_id, "position", type) FROM stdin;
\.


--
-- Data for Name: spree_promotion_rules; Type: TABLE DATA; Schema: public; Owner: alain
--

COPY spree_promotion_rules (id, activator_id, user_id, product_group_id, type, created_at, updated_at) FROM stdin;
7	3	\N	\N	Spree::Promotion::Rules::Product	2013-04-22 19:12:36.413339	2013-04-22 19:12:36.413339
\.


--
-- Data for Name: spree_promotion_rules_users; Type: TABLE DATA; Schema: public; Owner: alain
--

COPY spree_promotion_rules_users (user_id, promotion_rule_id) FROM stdin;
\.


--
-- Data for Name: spree_properties; Type: TABLE DATA; Schema: public; Owner: alain
--

COPY spree_properties (id, name, presentation, created_at, updated_at, value_type) FROM stdin;
905834907	internet	internet	2012-09-17 13:37:57.809924	2012-10-02 15:46:37.171891	boolean
905834906	three_d	3D	2012-09-17 13:37:47.697111	2012-10-10 13:10:07.337574	boolean
905834913	compatible	compatible	2013-03-12 13:44:28.572231	2013-03-12 13:44:58.190674	string
161337574	brand	Marque	2012-05-22 14:13:04	2013-03-26 16:12:12.257108	string
905834914	wifi	wifi	2013-03-26 16:13:35.45905	2013-03-26 16:13:35.45905	boolean
905834915	hdmi	HDMI	2013-03-26 16:14:06.144354	2013-03-26 16:14:06.144354	integer
905834916	yuv	YUV	2013-03-26 16:14:31.933612	2013-03-26 16:14:31.933612	integer
905834917	vga	VGA	2013-03-26 16:16:48.081191	2013-03-26 16:16:48.081191	integer
905834918	itruc	iPod/iPhone	2013-03-26 16:17:58.015323	2013-03-26 16:17:58.015323	boolean
905834919	usb	USB	2013-03-26 16:18:17.171793	2013-03-26 16:18:17.171793	integer
905834920	scart	SCART	2013-03-26 16:19:13.411947	2013-03-26 16:19:13.411947	integer
905834921	composite	COMPOSITE	2013-03-26 16:19:37.58239	2013-03-26 16:19:37.58239	integer
905834903	technologie	technologie	2012-09-17 13:23:57.87959	2013-03-26 16:26:38.806889	string
905834904	resolution	résolution	2012-09-17 13:36:35.319972	2013-03-26 16:29:28.14601	string
905834905	slot	lecteur carte	2012-09-17 13:36:55.177578	2013-03-26 16:29:38.687586	string
\.


--
-- Data for Name: spree_properties_prototypes; Type: TABLE DATA; Schema: public; Owner: alain
--

COPY spree_properties_prototypes (prototype_id, property_id) FROM stdin;
571598464	1925472
571598466	161337574
571598466	905834907
571598466	905834904
571598466	905834903
571598466	905834906
571598466	905834921
571598466	905834915
571598466	905834918
571598466	905834920
571598466	905834905
571598466	905834919
571598466	905834917
571598466	905834914
571598466	905834916
\.


--
-- Data for Name: spree_prototypes; Type: TABLE DATA; Schema: public; Owner: alain
--

COPY spree_prototypes (id, name, created_at, updated_at, taxon_id) FROM stdin;
571598466	tv	2012-09-19 15:31:31.097105	2012-10-18 17:43:30.167503	558398361
571598468	blu-ray	2012-11-02 13:00:50.269052	2012-11-02 13:00:50.281539	558398382
\.


--
-- Data for Name: spree_relation_types; Type: TABLE DATA; Schema: public; Owner: alain
--

COPY spree_relation_types (id, name, description, applies_to, created_at, updated_at) FROM stdin;
1	accessoires		Spree::Product	2012-10-04 10:48:08.048645	2012-10-04 10:48:08.048645
2	accessories		Spree::Taxon	2013-03-13 17:28:51.58449	2013-03-13 17:30:42.168624
\.


--
-- Name: spree_relation_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alain
--

SELECT pg_catalog.setval('spree_relation_types_id_seq', 2, true);


--
-- Data for Name: spree_relations; Type: TABLE DATA; Schema: public; Owner: alain
--

COPY spree_relations (id, relation_type_id, relatable_id, relatable_type, related_to_id, related_to_type, created_at, updated_at, discount_amount) FROM stdin;
1	1	1060500605	Spree::Product	1060500655	Spree::Product	2013-03-13 17:30:13.402127	2013-03-13 17:30:13.402127	0.00
\.


--
-- Name: spree_relations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alain
--

SELECT pg_catalog.setval('spree_relations_id_seq', 1, true);


--
-- Data for Name: spree_return_authorizations; Type: TABLE DATA; Schema: public; Owner: alain
--

COPY spree_return_authorizations (id, number, state, amount, order_id, reason, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: spree_roles; Type: TABLE DATA; Schema: public; Owner: alain
--

COPY spree_roles (id, name) FROM stdin;
930089099	admin
770229923	user
\.


--
-- Data for Name: spree_roles_users; Type: TABLE DATA; Schema: public; Owner: alain
--

COPY spree_roles_users (role_id, user_id) FROM stdin;
930089099	1
930089099	1
\.


--
-- Data for Name: spree_shipments; Type: TABLE DATA; Schema: public; Owner: alain
--

COPY spree_shipments (id, tracking, number, cost, shipped_at, order_id, shipping_method_id, address_id, created_at, updated_at, state) FROM stdin;
583969526	\N	H78046672965	\N	\N	615724322	574015644	1026748676	2012-05-22 14:13:04	2012-05-22 14:13:04	pending
365533797	\N	H56058215997	\N	\N	330565047	574015644	171295127	2012-05-22 14:13:04	2012-05-22 14:13:04	pending
195891138	\N	H701071882185	\N	\N	231772182	574015644	340874296	2012-05-22 14:13:04	2012-05-22 14:13:04	pending
1017790295	\N	H10010085821064	\N	\N	987209861	574015644	592864417	2012-05-22 14:13:04	2012-05-22 14:13:04	pending
631467759	\N	H8945101053165	\N	\N	601813305	574015644	979318045	2012-05-22 14:13:04	2012-05-22 14:13:04	pending
312761982	\N	H71024657101008	\N	\N	349815214	574015644	223872400	2012-05-22 14:13:04	2012-05-22 14:13:04	pending
35341291	\N	H48384857470	\N	\N	73849921	574015644	501684253	2012-05-22 14:13:04	2012-05-22 14:13:04	pending
891057020	\N	H43861068932	\N	\N	862055596	574015644	719333514	2012-05-22 14:13:04	2012-05-22 14:13:04	pending
629437518	\N	H94197476163	\N	\N	335228811	574015644	826662719	2012-05-22 14:13:04	2012-05-22 14:13:04	pending
193598819	\N	H41977551844	\N	\N	1039486630	574015644	525057558	2012-05-22 14:13:04	2012-05-22 14:13:04	pending
1015883258	\N	H80810510174102	\N	\N	183664179	574015644	676105863	2012-05-22 14:13:04	2012-05-22 14:13:04	pending
585740373	\N	H104267371071	\N	\N	345435026	574015644	908598054	2012-05-22 14:13:04	2012-05-22 14:13:04	pending
367952066	\N	H0105811688210	\N	\N	596761353	574015644	19868593	2012-05-22 14:13:04	2012-05-22 14:13:04	pending
216519034	\N	H53798466552	\N	\N	983075517	574015644	405174797	2012-05-22 14:13:04	2012-05-22 14:13:04	pending
1004593649	\N	H1037328917910	\N	\N	228571690	574015644	790710942	2012-05-22 14:13:04	2012-05-22 14:13:04	pending
727710848	\N	H34641039107510	\N	\N	488679357	574015644	1067341581	2012-05-22 14:13:04	2012-05-22 14:13:04	pending
475581673	\N	H757135991022	\N	\N	707237680	574015644	144271260	2012-05-22 14:13:04	2012-05-22 14:13:04	pending
245966735	\N	H28610657083	\N	\N	953580620	574015644	443059452	2012-05-22 14:13:04	2012-05-22 14:13:04	pending
967710488	\N	H264279831061	\N	\N	265374943	574015644	762297451	2012-05-22 14:13:04	2012-05-22 14:13:04	pending
547833508	\N	H101640991010610	\N	\N	383262055	574015644	879160787	2012-05-22 14:13:04	2012-05-22 14:13:04	pending
396391991	\N	H52215708981	\N	\N	568274416	574015644	56745288	2012-05-22 14:13:04	2012-05-22 14:13:04	pending
163898264	\N	H731038179871	\N	\N	1069267029	574015644	486885605	2012-05-22 14:13:04	2012-05-22 14:13:04	pending
1053020929	\N	H101010551468109	\N	\N	146573512	574015644	704804980	2012-05-22 14:13:04	2012-05-22 14:13:04	pending
667583165	\N	H234302505310	\N	\N	297130368	574015644	856369612	2012-05-22 14:13:04	2012-05-22 14:13:04	pending
281915952	\N	H710551322322	\N	\N	649259497	574015644	67901793	2012-05-22 14:13:04	2012-05-22 14:13:04	pending
7516093	\N	H71037667870	\N	\N	906884218	574015644	347276494	2012-05-22 14:13:04	2012-05-22 14:13:04	pending
930455338	\N	H05152840068	\N	\N	17482993	574015644	599012441	2012-05-22 14:13:04	2012-05-22 14:13:04	pending
397547216	\N	H43807225429	\N	\N	567102733	574015644	57916861	2012-05-22 14:13:04	2012-05-22 14:13:04	pending
548742745	\N	H875461791061	\N	\N	382369184	574015644	880053548	2012-05-22 14:13:04	2012-05-22 14:13:04	pending
968652773	\N	H610010439126	\N	\N	264449064	574015644	763223188	2012-05-22 14:13:04	2012-05-22 14:13:04	pending
247154552	\N	H1010233582909	\N	\N	952376497	574015644	444263433	2012-05-22 14:13:04	2012-05-22 14:13:04	pending
668525120	\N	H28523674303	\N	\N	296204679	574015644	857295155	2012-05-22 14:13:04	2012-05-22 14:13:04	pending
1053930492	\N	H108773446223	\N	\N	145680447	574015644	705697931	2012-05-22 14:13:04	2012-05-22 14:13:04	pending
165053295	\N	H690513103744	\N	\N	1068095656	574015644	488056864	2012-05-22 14:13:04	2012-05-22 14:13:04	pending
426352382	\N	H7818751010791	\N	\N	790021435	574015644	229127567	2012-05-22 14:13:04	2012-05-22 14:13:04	pending
779005547	\N	H76831586110	\N	\N	403830194	574015644	984548634	2012-05-22 14:13:04	2012-05-22 14:13:04	pending
418611208	\N	H41136672621	\N	\N	780983247	574015644	204614523	2012-05-22 14:13:04	2012-05-22 14:13:04	pending
804565151	\N	H980103011736	\N	\N	428600156	574015644	993336300	2012-05-22 14:13:04	2012-05-22 14:13:04	pending
922607911	\N	H95882914089	\N	\N	8567520	574015644	574376536	2012-05-22 14:13:04	2012-05-22 14:13:04	pending
33214900	\N	H68663019879	\N	\N	931498615	574015644	356219587	2012-05-22 14:13:04	2012-05-22 14:13:04	pending
530465809	\N	H6010010917056	\N	\N	702619608	574015644	190836580	2012-05-22 14:13:04	2012-05-22 14:13:04	pending
681145480	\N	H82796510105104	\N	\N	518401861	574015644	1012457461	2012-05-22 14:13:04	2012-05-22 14:13:04	pending
831530304	\N	H135671061041	\N	\N	133136121	574015644	626101841	2012-05-22 14:13:04	2012-05-22 14:13:04	pending
110564781	\N	H627108723686	\N	\N	820530800	574015644	307674844	2012-05-22 14:13:04	2012-05-22 14:13:04	pending
371722298	\N	H210508832204	\N	\N	542594049	574015644	48866121	2012-05-22 14:13:04	2012-05-22 14:13:04	pending
556742829	\N	H0992821461010	\N	\N	391144298	574015644	904827870	2012-05-22 14:13:04	2012-05-22 14:13:04	pending
32026953	\N	H6635810281013	\N	\N	932702864	574015644	355015228	2012-05-22 14:13:04	2012-05-22 14:13:04	pending
921666016	\N	H48036778168	\N	\N	9493021	574015644	573450925	2012-05-22 14:13:04	2012-05-22 14:13:04	pending
803655784	\N	H375003868103	\N	\N	429493153	574015644	992443161	2012-05-22 14:13:04	2012-05-22 14:13:04	pending
417456373	\N	H100350446108	\N	\N	782154552	574015644	203443076	2012-05-22 14:13:04	2012-05-22 14:13:04	pending
109409616	\N	H2346101508104	\N	\N	821702295	574015644	306503203	2012-05-22 14:13:04	2012-05-22 14:13:04	pending
830621127	\N	H76307045303	\N	\N	134028804	574015644	625209012	2012-05-22 14:13:04	2012-05-22 14:13:04	pending
680203391	\N	H700106653645	\N	\N	519327672	574015644	1011531536	2012-05-22 14:13:04	2012-05-22 14:13:04	pending
255015291	\N	H025670493104	\N	\N	961307330	574015644	468881930	2012-05-22 14:13:04	2012-05-22 14:13:04	pending
942934510	\N	H69307873834	\N	\N	239817259	574015644	754295455	2012-05-22 14:13:04	2012-05-22 14:13:04	pending
717611658	\N	H4091046492810	\N	\N	481999185	574015644	1040468473	2012-05-22 14:13:04	2012-05-22 14:13:04	pending
499307037	\N	H48310738823	\N	\N	733841882	574015644	151222638	2012-05-22 14:13:04	2012-05-22 14:13:04	pending
80446377	\N	H092102943358	\N	\N	850712674	574015644	269101270	2012-05-22 14:13:04	2012-05-22 14:13:04	pending
869053234	\N	H48073299445	\N	\N	95676661	574015644	655169605	2012-05-22 14:13:04	2012-05-22 14:13:04	pending
765994643	\N	H103724977857	\N	\N	467107162	574015644	963218914	2012-05-22 14:13:04	2012-05-22 14:13:04	pending
447682054	\N	H77233241986	\N	\N	751848899	574015644	242138487	2012-05-22 14:13:04	2012-05-22 14:13:04	pending
61228994	\N	H01344026898	\N	\N	903421051	574015644	392686799	2012-05-22 14:13:04	2012-05-22 14:13:04	pending
882997035	\N	H242922448102	\N	\N	48114926	574015644	543218782	2012-05-22 14:13:04	2012-05-22 14:13:04	pending
605973176	\N	H062710954100	\N	\N	308359551	574015644	819970507	2012-05-22 14:13:04	2012-05-22 14:13:04	pending
320428591	\N	H8105779106957	\N	\N	627442156	574015644	131658076	2012-05-22 14:13:04	2012-05-22 14:13:04	pending
870241227	\N	H605101010185109	\N	\N	94472210	574015644	656373946	2012-05-22 14:13:04	2012-05-22 14:13:04	pending
81388382	\N	H73258610105100	\N	\N	849787035	574015644	270026799	2012-05-22 14:13:04	2012-05-22 14:13:04	pending
500216554	\N	H836710315227	\N	\N	732948771	574015644	152115607	2012-05-22 14:13:04	2012-05-22 14:13:04	pending
718766707	\N	H5106157010270	\N	\N	480827830	574015644	1041639686	2012-05-22 14:13:04	2012-05-22 14:13:04	pending
884152274	\N	H51024001051069	\N	\N	46943257	574015644	544390305	2012-05-22 14:13:04	2012-05-22 14:13:04	pending
62138181	\N	H57357167167	\N	\N	902528130	574015644	393579574	2012-05-22 14:13:04	2012-05-22 14:13:04	pending
448624385	\N	H49067319044	\N	\N	750923066	574015644	243064206	2012-05-22 14:13:04	2012-05-22 14:13:04	pending
767182442	\N	H243042103897	\N	\N	465903021	574015644	964422941	2012-05-22 14:13:04	2012-05-22 14:13:04	pending
1023761401	\N	H76099578038	\N	\N	192544832	574015644	700772492	2012-05-22 14:13:04	2012-05-22 14:13:04	pending
877055750	\N	H10735678297	\N	\N	37328065	574015644	545743993	2012-05-22 14:13:04	2012-05-22 14:13:04	pending
54656917	\N	H5294658104110	\N	\N	893297750	574015644	394286306	2012-05-22 14:13:04	2012-05-22 14:13:04	pending
440970793	\N	H79338433132	\N	\N	741864942	574015644	243860826	2012-05-22 14:13:04	2012-05-22 14:13:04	pending
760192702	\N	H802057926101	\N	\N	456181117	574015644	965621197	2012-05-22 14:13:04	2012-05-22 14:13:04	pending
858458911	\N	H70772739919	\N	\N	89411802	574015644	669687922	2012-05-22 14:13:04	2012-05-22 14:13:04	pending
70007694	\N	H485505811026	\N	\N	844324943	574015644	284004603	2012-05-22 14:13:04	2012-05-22 14:13:04	pending
488991282	\N	H53167060737	\N	\N	727331319	574015644	165986627	2012-05-22 14:13:04	2012-05-22 14:13:04	pending
706894503	\N	H91544098412	\N	\N	475857254	574015644	1055125974	2012-05-22 14:13:04	2012-05-22 14:13:04	pending
983385912	\N	H63706184146	\N	\N	216145139	574015644	777841735	2012-05-22 14:13:04	2012-05-22 14:13:04	pending
310592731	\N	H232107014183	\N	\N	620502818	574015644	105050026	2012-05-22 14:13:04	2012-05-22 14:13:04	pending
283103959	\N	H680574210206	\N	\N	648055060	574015644	69106084	2012-05-22 14:13:04	2012-05-22 14:13:04	pending
529278188	\N	H175079101626	\N	\N	703823663	574015644	189632411	2012-05-22 14:13:04	2012-05-22 14:13:04	pending
167930736	\N	H681031091063102	\N	\N	1014837421	574015644	516145181	2012-05-22 14:13:04	2012-05-22 14:13:04	pending
228226979	\N	H910227386227	\N	\N	1004874852	574015644	425450708	2012-05-22 14:13:04	2012-05-22 14:13:04	pending
761134663	\N	H2100968761102	\N	\N	455255426	574015644	966546746	2012-05-22 14:13:04	2012-05-22 14:13:04	pending
442158806	\N	H54213532213	\N	\N	740660503	574015644	245065123	2012-05-22 14:13:04	2012-05-22 14:13:04	pending
55811946	\N	H383112107241	\N	\N	892126383	574015644	395457563	2012-05-22 14:13:04	2012-05-22 14:13:04	pending
877965311	\N	H3692109273106	\N	\N	36435006	574015644	546636942	2012-05-22 14:13:04	2012-05-22 14:13:04	pending
707803742	\N	H42834411011010	\N	\N	474964377	574015644	1056018737	2012-05-22 14:13:04	2012-05-22 14:13:04	pending
490146509	\N	H97293531467	\N	\N	726159630	574015644	167158202	2012-05-22 14:13:04	2012-05-22 14:13:04	pending
71195505	\N	H2781005101688	\N	\N	843120822	574015644	285208578	2012-05-22 14:13:04	2012-05-22 14:13:04	pending
859401190	\N	H210325552217	\N	\N	88485925	574015644	670613653	2012-05-22 14:13:04	2012-05-22 14:13:04	pending
596014713	\N	H91170695180	\N	\N	368651700	574015644	927456520	2012-05-22 14:13:04	2012-05-22 14:13:04	pending
344016612	\N	H79541388269	\N	\N	587078949	574015644	4255125	2012-05-22 14:13:04	2012-05-22 14:13:04	pending
1020487291	\N	H850961741009	\N	\N	539762571	574015644	42776516	2012-05-22 14:13:04	2012-05-22 14:13:04	pending
1053930493	\N	H45176411204	\N	\N	1069267038	574015644	1072978398	2012-09-13 12:48:17.564705	2012-09-13 12:48:17.564705	pending
1002961742	\N	H52296962451	\N	\N	1035625630	574015644	607887544	2012-05-22 14:13:04	2012-05-22 14:13:04	ready
1053930494	\N	H18444155801	\N	\N	1069267030	574015644	1072978400	2013-03-19 16:06:42.223024	2013-03-19 16:06:42.223024	pending
1053930495	\N	H45032382334	\N	\N	1069267040	574015644	1072978403	2013-03-30 15:47:15.937702	2013-03-30 15:47:15.937702	pending
\.


--
-- Data for Name: spree_shipping_categories; Type: TABLE DATA; Schema: public; Owner: alain
--

COPY spree_shipping_categories (id, name, created_at, updated_at) FROM stdin;
727197546	Default Shipping	2012-05-22 14:13:04	2012-05-22 14:13:04
\.


--
-- Data for Name: spree_shipping_methods; Type: TABLE DATA; Schema: public; Owner: alain
--

COPY spree_shipping_methods (id, name, zone_id, created_at, updated_at, display_on, shipping_category_id, match_none, match_all, match_one, deleted_at) FROM stdin;
574015644	UPS Ground	2	2012-05-22 14:13:04	2012-05-22 14:13:04	\N	\N	\N	\N	\N	\N
192811543	UPS Two Day	2	2012-05-22 14:13:04	2012-05-22 14:13:04	\N	\N	\N	\N	\N	\N
13537749	UPS One Day	2	2012-05-22 14:13:04	2012-05-22 14:13:04	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: spree_skrill_transactions; Type: TABLE DATA; Schema: public; Owner: alain
--

COPY spree_skrill_transactions (id, email, amount, currency, transaction_id, customer_id, payment_type, created_at, updated_at) FROM stdin;
\.


--
-- Name: spree_skrill_transactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alain
--

SELECT pg_catalog.setval('spree_skrill_transactions_id_seq', 1, false);


--
-- Data for Name: spree_state_changes; Type: TABLE DATA; Schema: public; Owner: alain
--

COPY spree_state_changes (id, name, previous_state, stateful_id, user_id, created_at, updated_at, stateful_type, next_state) FROM stdin;
1	payment	balance_due	1069267034	1057526563	2012-06-13 15:27:58.868406	2012-06-13 15:27:58.868406	Spree::Order	paid
2	payment	balance_due	1069267034	1057526563	2012-06-13 15:27:58.954407	2012-06-13 15:27:58.954407	Spree::Order	paid
5	shipment	pending	1069267038	1057526566	2012-09-13 12:49:44.814065	2012-09-13 12:49:44.814065	Spree::Order	backorder
6	order	cart	1069267038	1057526566	2012-09-13 12:49:44.993989	2012-09-13 12:49:44.993989	Spree::Order	complete
7	payment	balance_due	1069267038	1	2012-09-13 12:51:38.264138	2012-09-13 12:51:38.264138	Spree::Order	paid
8	payment	paid	1069267038	1	2012-09-13 12:51:44.688867	2012-09-13 12:51:44.688867	Spree::Order	balance_due
9	payment	balance_due	1069267038	1	2012-09-13 12:56:45.009014	2012-09-13 12:56:45.009014	Spree::Order	paid
10	payment	balance_due	1035625630	1	2012-09-13 12:58:04.513607	2012-09-13 12:58:04.513607	Spree::Order	paid
11	shipment	pending	1035625630	1	2012-09-13 12:58:04.526725	2012-09-13 12:58:04.526725	Spree::Order	ready
12	payment	balance_due	1069267039	1	2012-09-26 16:28:28.228803	2012-09-26 16:28:28.228803	Spree::Order	paid
13	payment	balance_due	1069267039	1	2012-09-26 16:28:28.443337	2012-09-26 16:28:28.443337	Spree::Order	paid
14	payment	balance_due	1069267030	1	2012-10-31 13:57:04.180305	2012-10-31 13:57:04.180305	Spree::Order	paid
15	payment	balance_due	1069267030	1	2012-10-31 13:57:04.302665	2012-10-31 13:57:04.302665	Spree::Order	paid
16	payment	paid	1069267030	1	2012-11-02 15:50:43.639338	2012-11-02 15:50:43.639338	Spree::Order	balance_due
17	payment	balance_due	1069267030	1	2013-03-18 21:11:56.767215	2013-03-18 21:11:56.767215	Spree::Order	paid
18	payment	balance_due	1069267030	1	2013-03-18 21:11:56.935482	2013-03-18 21:11:56.935482	Spree::Order	paid
19	payment	paid	1069267030	1	2013-03-18 21:12:04.078964	2013-03-18 21:12:04.078964	Spree::Order	balance_due
20	order	cart	1069267030	1	2013-03-19 16:06:49.319844	2013-03-19 16:06:49.319844	Spree::Order	complete
21	payment	balance_due	1069267030	1	2013-03-19 16:10:00.129579	2013-03-19 16:10:00.129579	Spree::Order	paid
22	shipment	pending	1069267030	1	2013-03-19 16:10:00.155328	2013-03-19 16:10:00.155328	Spree::Order	backorder
23	payment	paid	1069267030	1	2013-03-19 16:10:06.536631	2013-03-19 16:10:06.536631	Spree::Order	balance_due
24	payment	balance_due	1069267040	1	2013-03-27 21:43:30.666738	2013-03-27 21:43:30.666738	Spree::Order	paid
25	payment	balance_due	1069267040	1	2013-03-27 21:43:30.728064	2013-03-27 21:43:30.728064	Spree::Order	paid
26	payment	paid	1069267040	1	2013-03-27 21:43:40.656229	2013-03-27 21:43:40.656229	Spree::Order	balance_due
27	payment	balance_due	1069267040	1	2013-03-28 09:48:14.73338	2013-03-28 09:48:14.73338	Spree::Order	paid
28	payment	balance_due	1069267040	1	2013-03-28 09:48:14.772146	2013-03-28 09:48:14.772146	Spree::Order	paid
29	payment	paid	1069267040	1	2013-03-28 18:27:54.100927	2013-03-28 18:27:54.100927	Spree::Order	balance_due
30	order	cart	1069267040	1	2013-03-30 15:48:14.031841	2013-03-30 15:48:14.031841	Spree::Order	complete
\.


--
-- Data for Name: spree_states; Type: TABLE DATA; Schema: public; Owner: alain
--

COPY spree_states (id, name, abbr, country_id) FROM stdin;
931624400	Michigan	MI	214
615306087	South Dakota	SD	214
414569975	Washington	WA	214
103680699	Wisconsin	WI	214
948208802	Arizona	AZ	214
625629523	Illinois	IL	214
426832442	New Hampshire	NH	214
177087202	North Carolina	NC	214
969722173	Kansas	KS	214
653576146	Missouri	MO	214
471470972	Arkansas	AR	214
179539703	Nevada	NV	214
6764998	District of Columbia	DC	214
982433740	Idaho	ID	214
673350891	Nebraska	NE	214
471711976	Pennsylvania	PA	214
199950338	Hawaii	HI	214
17199670	Utah	UT	214
989115415	Vermont	VT	214
721598219	Delaware	DE	214
474001862	Rhode Island	RI	214
248548169	Oklahoma	OK	214
37199952	Louisiana	LA	214
999156632	Montana	MT	214
726305632	Tennessee	TN	214
480368357	Maryland	MD	214
267271847	Florida	FL	214
41111624	Virginia	VA	214
1032288924	Minnesota	MN	214
750950030	New Jersey	NJ	214
485193526	Ohio	OH	214
276110813	California	CA	214
51943165	North Dakota	ND	214
1055056709	Maine	ME	214
769938586	Indiana	IN	214
525212995	Texas	TX	214
298914262	Oregon	OR	214
66390489	Wyoming	WY	214
1061493585	Alabama	AL	214
825306985	Iowa	IA	214
532363768	Mississippi	MS	214
308473843	Kentucky	KY	214
69729944	New Mexico	NM	214
876916760	Georgia	GA	214
536031023	Colorado	CO	214
385551075	Massachusetts	MA	214
69870734	Connecticut	CT	214
889445952	New York	NY	214
597434151	South Carolina	SC	214
403740659	Alaska	AK	214
91367981	West Virginia	WV	214
\.


--
-- Data for Name: spree_tax_categories; Type: TABLE DATA; Schema: public; Owner: alain
--

COPY spree_tax_categories (id, name, description, created_at, updated_at, is_default, deleted_at) FROM stdin;
25484906	Clothing	\N	2012-05-22 14:13:04	2012-05-22 14:13:04	f	\N
698318840	Food	\N	2012-05-22 14:13:04	2012-05-22 14:13:04	f	\N
\.


--
-- Data for Name: spree_tax_rates; Type: TABLE DATA; Schema: public; Owner: alain
--

COPY spree_tax_rates (id, amount, zone_id, tax_category_id, created_at, updated_at, included_in_price) FROM stdin;
967941380	0.05000	2	25484906	2012-05-22 14:13:04	2012-05-22 14:13:04	f
\.


--
-- Data for Name: spree_taxonomies; Type: TABLE DATA; Schema: public; Owner: alain
--

COPY spree_taxonomies (id, name, created_at, updated_at) FROM stdin;
854451431	produits	2012-09-17 09:45:15.233702	2012-10-31 15:18:39.991747
\.


--
-- Data for Name: spree_taxons; Type: TABLE DATA; Schema: public; Owner: alain
--

COPY spree_taxons (id, parent_id, "position", name, permalink, taxonomy_id, created_at, updated_at, lft, rgt, icon_file_name, icon_content_type, icon_file_size, icon_updated_at, description) FROM stdin;
558398396	558398387	0	compact	produits/photo/compact	854451431	2013-03-29 14:29:13.051238	2013-03-29 14:29:13.051238	23	24	\N	\N	\N	\N	\N
558398378	558398359	1	home cinéma	produits/home-cinema	854451431	2012-10-31 13:41:39.553309	2012-10-31 13:41:39.553309	8	15	\N	\N	\N	\N	\N
558398381	558398378	1	amplificateur	produits/home-cinema/amplificateur	854451431	2012-10-31 13:42:37.825774	2012-10-31 13:42:37.825774	11	12	\N	\N	\N	\N	\N
558398379	558398378	0	système surround	produits/home-cinema/systeme-surround	854451431	2012-10-31 13:42:02.953469	2012-10-31 13:42:02.953469	9	10	\N	\N	\N	\N	\N
558398382	558398378	2	lecteur Blu-Ray	produits/home-cinema/lecteur-blu-ray	854451431	2012-10-31 13:42:47.911596	2012-10-31 13:43:00.753289	13	14	\N	\N	\N	\N	\N
558398397	558398387	1	bridge	produits/photo/bridge	854451431	2013-03-29 14:29:34.068215	2013-03-29 14:29:34.068215	25	26	\N	\N	\N	\N	\N
558398398	558398387	2	reflex	produits/photo/reflex	854451431	2013-03-29 14:29:39.385121	2013-03-29 14:29:39.385121	27	28	\N	\N	\N	\N	\N
558398360	558398359	0	écran	produits/ecran	854451431	2012-09-17 09:45:30.02287	2012-09-17 09:59:57.383972	2	7	\N	\N	\N	\N	\N
558398362	558398360	1	projecteur	produits/ecran/projecteurs	854451431	2012-09-17 09:46:04.863036	2012-09-17 10:00:13.608822	5	6	\N	\N	\N	\N	\N
558398361	558398360	0	TV	produits/ecran/tv	854451431	2012-09-17 09:45:41.755594	2012-09-17 10:00:03.055913	3	4	\N	\N	\N	\N	\N
558398402	558398391	1	radio réveil	produits/audio-domestique/radioreveil	854451431	2013-03-29 20:00:02.798795	2013-03-29 20:00:32.360091	39	40	\N	\N	\N	\N	
558398403	558398391	2	support iPhone et iPad	produits/audio-domestique/support-iphone-et-ipad	854451431	2013-03-29 20:01:01.462796	2013-03-29 20:01:01.462796	41	42	\N	\N	\N	\N	\N
558398399	558398390	0	flash	produits/camescope/flash	854451431	2013-03-29 19:59:28.875009	2013-03-29 19:59:28.875009	31	32	\N	\N	\N	\N	\N
558398400	558398390	1	HDD	produits/camescope/hdd	854451431	2013-03-29 19:59:35.219375	2013-03-29 19:59:35.219375	33	34	\N	\N	\N	\N	\N
558398401	558398391	0	système hifi	produits/audio-domestique/systeme-hifi	854451431	2013-03-29 19:59:49.063693	2013-03-29 19:59:49.063693	37	38	\N	\N	\N	\N	\N
558398404	558398392	0	lecteur MP3	produits/audio-nomade/lecteur-mp3	854451431	2013-03-29 20:01:08.9714	2013-03-29 20:01:08.9714	45	46	\N	\N	\N	\N	\N
558398383	558398359	2	ordinateur	produits/ordinateur	854451431	2012-10-31 15:17:31.873368	2012-10-31 15:17:31.873368	16	21	\N	\N	\N	\N	\N
558398384	558398383	0	fixe	produits/ordinateur/fixe	854451431	2012-10-31 15:17:51.560559	2012-10-31 15:17:51.560559	17	18	\N	\N	\N	\N	\N
558398385	558398383	1	portable	produits/ordinateur/portable	854451431	2012-10-31 15:17:56.160205	2012-10-31 15:17:56.160205	19	20	\N	\N	\N	\N	\N
558398387	558398359	3	photo	produits/photo	854451431	2013-03-13 17:13:59.14646	2013-03-13 17:13:59.14646	22	29	\N	\N	\N	\N	\N
558398359	\N	0	produits	produits	854451431	2012-09-17 09:45:15.700203	2012-09-25 08:59:18.665564	1	60	\N	\N	\N	\N	\N
558398393	558398359	7	reader	produits/reader	854451431	2013-03-13 17:15:09.971574	2013-03-13 17:15:09.971574	54	55	\N	\N	\N	\N	\N
558398390	558398359	4	camescope	produits/camescope	854451431	2013-03-13 17:14:47.363043	2013-03-13 17:14:47.363043	30	35	\N	\N	\N	\N	\N
558398405	558398392	1	casque	produits/audio-nomade/casque	854451431	2013-03-29 20:01:13.146787	2013-03-29 20:01:13.146787	47	48	\N	\N	\N	\N	\N
558398406	558398392	2	écouteurs	produits/audio-nomade/ecouteurs	854451431	2013-03-29 20:01:16.744329	2013-03-29 20:01:16.744329	49	50	\N	\N	\N	\N	\N
558398407	558398392	3	enregistreur vocal	produits/audio-nomade/enregistreur-vocal	854451431	2013-03-29 20:01:25.790321	2013-03-29 20:01:25.790321	51	52	\N	\N	\N	\N	\N
558398391	558398359	5	audio domestique	produits/audio-domestique	854451431	2013-03-13 17:14:58.276372	2013-03-13 17:14:58.276372	36	43	\N	\N	\N	\N	\N
558398392	558398359	6	audio nomade	produits/audio-nomade	854451431	2013-03-13 17:15:04.13024	2013-03-13 17:15:04.13024	44	53	\N	\N	\N	\N	\N
558398394	558398359	8	tablette	produits/tablette	854451431	2013-03-13 17:15:16.961056	2013-03-13 17:15:16.961056	56	57	\N	\N	\N	\N	\N
558398395	558398359	9	voo	produits/voo	854451431	2013-03-13 17:15:20.264272	2013-03-13 17:15:20.264272	58	59	\N	\N	\N	\N	\N
\.


--
-- Data for Name: spree_tokenized_permissions; Type: TABLE DATA; Schema: public; Owner: alain
--

COPY spree_tokenized_permissions (id, permissable_id, permissable_type, token, created_at, updated_at) FROM stdin;
1	1069267030	Spree::Order	eabfce7b97aa06a7	2012-05-22 14:17:21.6492	2012-05-22 14:17:21.6492
2	1069267031	Spree::Order	6e754b9838fdd948	2012-05-22 15:29:36.291071	2012-05-22 15:29:36.291071
3	1069267032	Spree::Order	e44f0b9803b7da3c	2012-05-24 11:27:03.654304	2012-05-24 11:27:03.654304
4	1069267033	Spree::Order	f5930ab4da3be605	2012-06-08 13:34:56.147288	2012-06-08 13:34:56.147288
5	1069267034	Spree::Order	fb5c278d7fed0a45	2012-06-13 15:21:45.545484	2012-06-13 15:21:45.545484
6	1069267035	Spree::Order	548496b4c04b1c53	2012-06-14 09:59:53.713128	2012-06-14 09:59:53.713128
7	1069267036	Spree::Order	310e3155c97f5534	2012-09-10 21:05:30.585303	2012-09-10 21:05:30.585303
8	1069267037	Spree::Order	317fb065506f9351	2012-09-13 12:41:25.999311	2012-09-13 12:41:25.999311
9	1069267038	Spree::Order	d2a5248fa8a23421	2012-09-13 12:45:33.456924	2012-09-13 12:45:33.456924
10	1069267039	Spree::Order	b1d7bcb31c8f064b	2012-09-26 16:28:05.347268	2012-09-26 16:28:05.347268
11	1069267040	Spree::Order	6175fb40606cacf0	2013-03-19 20:43:00.037349	2013-03-19 20:43:00.037349
12	1069267041	Spree::Order	10ba8d654aa393ae	2013-04-22 11:28:18.713548	2013-04-22 11:28:18.713548
\.


--
-- Data for Name: spree_trackers; Type: TABLE DATA; Schema: public; Owner: alain
--

COPY spree_trackers (id, environment, analytics_id, active, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: spree_users; Type: TABLE DATA; Schema: public; Owner: alain
--

COPY spree_users (id, encrypted_password, password_salt, email, remember_token, persistence_token, reset_password_token, perishable_token, sign_in_count, failed_attempts, last_request_at, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, login, ship_address_id, bill_address_id, created_at, updated_at, authentication_token, unlock_token, locked_at, remember_created_at, reset_password_sent_at, api_key) FROM stdin;
590306657	\N	\N	marcellus@weimann.com	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	607887544	1046447419	2012-05-22 14:13:04	2012-05-22 14:13:04	\N	\N	\N	\N	\N	\N
975572189	\N	\N	cierra_quitzon@huels.co.uk	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	1026748676	660001923	2012-05-22 14:13:04	2012-05-22 14:13:04	\N	\N	\N	\N	\N	\N
220281934	\N	\N	otto@leffler.info	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	171295127	273802266	2012-05-22 14:13:04	2012-05-22 14:13:04	\N	\N	\N	\N	\N	\N
323332591	\N	\N	vena_smith@johnsbartoletti.com	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	340874296	238383541	2012-05-22 14:13:04	2012-05-22 14:13:04	\N	\N	\N	\N	\N	\N
608344442	\N	\N	kayleigh_smitham@barton.info	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	592864417	959594786	2012-05-22 14:13:04	2012-05-22 14:13:04	\N	\N	\N	\N	\N	\N
1028376774	\N	\N	abdiel_oreilly@dickens.ca	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	979318045	540741786	2012-05-22 14:13:04	2012-05-22 14:13:04	\N	\N	\N	\N	\N	\N
172816471	\N	\N	london@dibbert.biz	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	223872400	389816337	2012-05-22 14:13:04	2012-05-22 14:13:04	\N	\N	\N	\N	\N	\N
452191684	\N	\N	joany_cremin@grantdubuque.info	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	501684253	126041504	2012-05-22 14:13:04	2012-05-22 14:13:04	\N	\N	\N	\N	\N	\N
771020115	\N	\N	antone@goyette.ca	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	719333514	813960457	2012-05-22 14:13:04	2012-05-22 14:13:04	\N	\N	\N	\N	\N	\N
956993830	\N	\N	nettie_lindgren@block.biz	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	826662719	99510657	2012-05-22 14:13:04	2012-05-22 14:13:04	\N	\N	\N	\N	\N	\N
235774389	\N	\N	ashley.schmitt@langosh.info	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	105050026	854153494	2012-05-22 14:13:04	2012-05-22 14:13:04	\N	\N	\N	\N	\N	\N
386199561	\N	\N	carroll@green.info	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	525057558	736102574	2012-05-22 14:13:04	2012-05-22 14:13:04	\N	\N	\N	\N	\N	\N
537116830	\N	\N	alfreda_goyette@collins.com	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	676105863	484915261	2012-05-22 14:13:04	2012-05-22 14:13:04	\N	\N	\N	\N	\N	\N
1046959423	\N	\N	johann.schmitt@waters.ca	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	908598054	42184090	2012-05-22 14:13:04	2012-05-22 14:13:04	\N	\N	\N	\N	\N	\N
157312430	\N	\N	napoleon@zieme.us	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	19868593	897883407	2012-05-22 14:13:04	2012-05-22 14:13:04	\N	\N	\N	\N	\N	\N
275330066	\N	\N	deven.okeefe@dickinson.ca	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	405174797	747490487	2012-05-22 14:13:04	2012-05-22 14:13:04	\N	\N	\N	\N	\N	\N
661521543	\N	\N	dock_armstrong@kerluke.ca	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	790710942	462093350	2012-05-22 14:13:04	2012-05-22 14:13:04	\N	\N	\N	\N	\N	\N
936450328	\N	\N	kattie.smitham@abbott.info	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	1067341581	188080563	2012-05-22 14:13:04	2012-05-22 14:13:04	\N	\N	\N	\N	\N	\N
14035331	\N	\N	madyson@johnswitting.name	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	144271260	1009963300	2012-05-22 14:13:04	2012-05-22 14:13:04	\N	\N	\N	\N	\N	\N
304595689	\N	\N	connor_price@herman.name	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	443059452	784546372	2012-05-22 14:13:04	2012-05-22 14:13:04	\N	\N	\N	\N	\N	\N
622916212	\N	\N	blake@deckowharvey.co.uk	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	762297451	432278229	2012-05-22 14:13:04	2012-05-22 14:13:04	\N	\N	\N	\N	\N	\N
1009361868	\N	\N	jacquelyn@cummingsbayer.us	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	879160787	13458289	2012-05-22 14:13:04	2012-05-22 14:13:04	\N	\N	\N	\N	\N	\N
187601757	\N	\N	treva@weberweber.uk	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	56745288	936012796	2012-05-22 14:13:04	2012-05-22 14:13:04	\N	\N	\N	\N	\N	\N
357172992	\N	\N	jerald@bashirianschimmel.info	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	486885605	699334235	2012-05-22 14:13:04	2012-05-22 14:13:04	\N	\N	\N	\N	\N	\N
575485547	\N	\N	kyla_lind@hane.us	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	704804980	514445004	2012-05-22 14:13:04	2012-05-22 14:13:04	\N	\N	\N	\N	\N	\N
994338771	\N	\N	easter@bashirian.co.uk	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	856369612	127967096	2012-05-22 14:13:04	2012-05-22 14:13:04	\N	\N	\N	\N	\N	\N
205739844	\N	\N	marco@reilly.name	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	67901793	816295907	2012-05-22 14:13:04	2012-05-22 14:13:04	\N	\N	\N	\N	\N	\N
486296279	\N	\N	adrien_lind@brakus.com	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	347276494	538489458	2012-05-22 14:13:04	2012-05-22 14:13:04	\N	\N	\N	\N	\N	\N
737901126	\N	\N	norwood_carroll@aufderhar.info	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	599012441	387941095	2012-05-22 14:13:04	2012-05-22 14:13:04	\N	\N	\N	\N	\N	\N
188543912	\N	\N	mellie_skiles@wilkinsonhirthe.co.uk	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	57916861	936905475	2012-05-22 14:13:04	2012-05-22 14:13:04	\N	\N	\N	\N	\N	\N
1010549555	\N	\N	margaretta.ziemann@herman.com	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	880053548	14629780	2012-05-22 14:13:04	2012-05-22 14:13:04	\N	\N	\N	\N	\N	\N
624071307	\N	\N	mertie@anderson.co.uk	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	763223188	433482288	2012-05-22 14:13:04	2012-05-22 14:13:04	\N	\N	\N	\N	\N	\N
305504796	\N	\N	kenyatta@tremblay.us	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	444263433	785472187	2012-05-22 14:13:04	2012-05-22 14:13:04	\N	\N	\N	\N	\N	\N
206649281	\N	\N	timmothy@funkbeahan.info	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	69106084	817221404	2012-05-22 14:13:04	2012-05-22 14:13:04	\N	\N	\N	\N	\N	\N
995493676	\N	\N	milton@dibbert.co.uk	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	857295155	129171341	2012-05-22 14:13:04	2012-05-22 14:13:04	\N	\N	\N	\N	\N	\N
576673428	\N	\N	madaline@kiehn.us	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	705697931	515616313	2012-05-22 14:13:04	2012-05-22 14:13:04	\N	\N	\N	\N	\N	\N
358114821	\N	\N	makenzie@kuhlmanrunolfsson.ca	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	488056864	700227236	2012-05-22 14:13:04	2012-05-22 14:13:04	\N	\N	\N	\N	\N	\N
99056534	\N	\N	isaias.klocko@schmitt.info	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	229127567	956531505	2012-05-22 14:13:04	2012-05-22 14:13:04	\N	\N	\N	\N	\N	\N
853560069	\N	\N	devyn@robel.info	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	984548634	235189158	2012-05-22 14:13:04	2012-05-22 14:13:04	\N	\N	\N	\N	\N	\N
75326820	\N	\N	syble.bergstrom@stiedemann.biz	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	204614523	949591493	2012-05-22 14:13:04	2012-05-22 14:13:04	\N	\N	\N	\N	\N	\N
863655417	\N	\N	price.rice@corkeryrunte.name	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	993336300	262057300	2012-05-22 14:13:04	2012-05-22 14:13:04	\N	\N	\N	\N	\N	\N
712180813	\N	\N	gus.considine@hartmannparisian.ca	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	574376536	379059436	2012-05-22 14:13:04	2012-05-22 14:13:04	\N	\N	\N	\N	\N	\N
494154972	\N	\N	dedrick_mitchell@reichel.us	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	356219587	563137665	2012-05-22 14:13:04	2012-05-22 14:13:04	\N	\N	\N	\N	\N	\N
51421563	\N	\N	zane@schulistpaucek.us	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	190836580	1072978396	2012-05-22 14:13:04	2012-05-22 14:13:04	\N	\N	\N	\N	\N	\N
873959920	\N	\N	jimmy_prosacco@doyle.biz	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	1012457461	150169931	2012-05-22 14:13:04	2012-05-22 14:13:04	\N	\N	\N	\N	\N	\N
756990036	\N	\N	terrence@krajcik.info	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	626101841	301611251	2012-05-22 14:13:04	2012-05-22 14:13:04	\N	\N	\N	\N	\N	\N
437907651	\N	\N	berenice.kuvalis@cummerata.info	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	307674844	654116968	2012-05-22 14:13:04	2012-05-22 14:13:04	\N	\N	\N	\N	\N	\N
178711894	\N	\N	stephan_quigley@bernhardoconnell.info	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	48866121	910300663	2012-05-22 14:13:04	2012-05-22 14:13:04	\N	\N	\N	\N	\N	\N
1034018247	\N	\N	rosella.heaney@ryanfeest.us	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	904827870	21308770	2012-05-22 14:13:04	2012-05-22 14:13:04	\N	\N	\N	\N	\N	\N
493245475	\N	\N	earlene@block.com	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	355015228	562211972	2012-05-22 14:13:04	2012-05-22 14:13:04	\N	\N	\N	\N	\N	\N
711025848	\N	\N	eino.gorczany@abbott.uk	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	573450925	377854995	2012-05-22 14:13:04	2012-05-22 14:13:04	\N	\N	\N	\N	\N	\N
862467340	\N	\N	eileen_breitenberg@wiegandkoelpin.name	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	992443161	260885931	2012-05-22 14:13:04	2012-05-22 14:13:04	\N	\N	\N	\N	\N	\N
74384795	\N	\N	rodger.rath@dickenskuhn.com	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	203443076	948698432	2012-05-22 14:13:04	2012-05-22 14:13:04	\N	\N	\N	\N	\N	\N
436965436	\N	\N	sylvester_paucek@blickmcdermott.name	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	306503203	653224093	2012-05-22 14:13:04	2012-05-22 14:13:04	\N	\N	\N	\N	\N	\N
755802289	\N	\N	casper@borer.ca	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	625209012	300439564	2012-05-22 14:13:04	2012-05-22 14:13:04	\N	\N	\N	\N	\N	\N
872804629	\N	\N	hailey_leannon@gleichnersanford.uk	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	1011531536	148965812	2012-05-22 14:13:04	2012-05-22 14:13:04	\N	\N	\N	\N	\N	\N
50512260	\N	\N	josianne_wolff@harris.uk	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	189632411	1072052521	2012-05-22 14:13:04	2012-05-22 14:13:04	\N	\N	\N	\N	\N	\N
331209749	\N	\N	cordia@gleichner.co.uk	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	468881930	794371254	2012-05-22 14:13:04	2012-05-22 14:13:04	\N	\N	\N	\N	\N	\N
616230022	\N	\N	jaquelin@lubowitzsatterfield.com	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	754295455	408818721	2012-05-22 14:13:04	2012-05-22 14:13:04	\N	\N	\N	\N	\N	\N
910886886	\N	\N	kaycee_ohara@jones.uk	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	1040468473	179306311	2012-05-22 14:13:04	2012-05-22 14:13:04	\N	\N	\N	\N	\N	\N
21772151	\N	\N	rebecca_eichmann@purdypagac.uk	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	151222638	1034473426	2012-05-22 14:13:04	2012-05-22 14:13:04	\N	\N	\N	\N	\N	\N
407201487	\N	\N	tess@klein.name	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	269101270	614571630	2012-05-22 14:13:04	2012-05-22 14:13:04	\N	\N	\N	\N	\N	\N
792876634	\N	\N	rachel@johnsonbatz.us	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	655169605	329690879	2012-05-22 14:13:04	2012-05-22 14:13:04	\N	\N	\N	\N	\N	\N
824624125	\N	\N	patricia@runolfsdottirkautzer.us	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	963218914	230832990	2012-05-22 14:13:04	2012-05-22 14:13:04	\N	\N	\N	\N	\N	\N
102888302	\N	\N	delores_lind@wunsch.us	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	242138487	985992137	2012-05-22 14:13:04	2012-05-22 14:13:04	\N	\N	\N	\N	\N	\N
522756822	\N	\N	angeline.jones@spencer.info	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	392686799	600595061	2012-05-22 14:13:04	2012-05-22 14:13:04	\N	\N	\N	\N	\N	\N
674206273	\N	\N	rickey@jakubowski.uk	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	543218782	348875494	2012-05-22 14:13:04	2012-05-22 14:13:04	\N	\N	\N	\N	\N	\N
948998100	\N	\N	vivien@hodkiewicz.ca	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	819970507	74741621	2012-05-22 14:13:04	2012-05-22 14:13:04	\N	\N	\N	\N	\N	\N
261603145	\N	\N	deshaun.hammes@wehnerherzog.name	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	131658076	863193060	2012-05-22 14:13:04	2012-05-22 14:13:04	\N	\N	\N	\N	\N	\N
793786021	\N	\N	buck@kulasbraun.uk	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	656373946	330616326	2012-05-22 14:13:04	2012-05-22 14:13:04	\N	\N	\N	\N	\N	\N
408356406	\N	\N	enos@cummerata.com	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	270026799	615775889	2012-05-22 14:13:04	2012-05-22 14:13:04	\N	\N	\N	\N	\N	\N
22960014	\N	\N	andre.rowe@gibsonpowlowski.us	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	152115607	1035644717	2012-05-22 14:13:04	2012-05-22 14:13:04	\N	\N	\N	\N	\N	\N
911828761	\N	\N	sibyl@mooregutkowski.biz	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	1041639686	180199358	2012-05-22 14:13:04	2012-05-22 14:13:04	\N	\N	\N	\N	\N	\N
675148478	\N	\N	oscar@murazik.info	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	544390305	349768223	2012-05-22 14:13:04	2012-05-22 14:13:04	\N	\N	\N	\N	\N	\N
523944495	\N	\N	emory_considine@ondricka.ca	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	393579574	601766538	2012-05-22 14:13:04	2012-05-22 14:13:04	\N	\N	\N	\N	\N	\N
104043415	\N	\N	callie_feeney@sporer.info	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	243064206	987196214	2012-05-22 14:13:04	2012-05-22 14:13:04	\N	\N	\N	\N	\N	\N
825533186	\N	\N	erich_franecki@lemke.co.uk	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	964422941	231758759	2012-05-22 14:13:04	2012-05-22 14:13:04	\N	\N	\N	\N	\N	\N
562806419	\N	\N	otilia.pouros@block.us	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	700772492	493831732	2012-05-22 14:13:04	2012-05-22 14:13:04	\N	\N	\N	\N	\N	\N
378310152	\N	\N	gregoria@gaylord.com	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	516145181	711489187	2012-05-22 14:13:04	2012-05-22 14:13:04	\N	\N	\N	\N	\N	\N
684206702	\N	\N	oda@sporerreichel.uk	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	545743993	338481867	2012-05-22 14:13:04	2012-05-22 14:13:04	\N	\N	\N	\N	\N	\N
533666555	\N	\N	elna@mueller.co.uk	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	394286306	590078562	2012-05-22 14:13:04	2012-05-22 14:13:04	\N	\N	\N	\N	\N	\N
113658691	\N	\N	keith_stokes@koss.com	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	243860826	975352806	2012-05-22 14:13:04	2012-05-22 14:13:04	\N	\N	\N	\N	\N	\N
834763738	\N	\N	marisol.botsford@westmaggio.co.uk	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	965621197	220562291	2012-05-22 14:13:04	2012-05-22 14:13:04	\N	\N	\N	\N	\N	\N
799403637	\N	\N	seth.rice@parkerdamore.co.uk	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	669687922	323032786	2012-05-22 14:13:04	2012-05-22 14:13:04	\N	\N	\N	\N	\N	\N
413327074	\N	\N	heidi.mosciski@spinka.biz	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	284004603	608577097	2012-05-22 14:13:04	2012-05-22 14:13:04	\N	\N	\N	\N	\N	\N
28020570	\N	\N	bertram_mann@bartolettihintz.uk	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	165986627	1028618237	2012-05-22 14:13:04	2012-05-22 14:13:04	\N	\N	\N	\N	\N	\N
917290961	\N	\N	daryl@prosacco.uk	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	1055125974	172509034	2012-05-22 14:13:04	2012-05-22 14:13:04	\N	\N	\N	\N	\N	\N
638820960	\N	\N	deborah.walter@hauck.info	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	777841735	452418301	2012-05-22 14:13:04	2012-05-22 14:13:04	\N	\N	\N	\N	\N	\N
286560969	\N	\N	pearline@dickinson.com	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	425450708	770730608	2012-05-22 14:13:04	2012-05-22 14:13:04	\N	\N	\N	\N	\N	\N
835918637	\N	\N	lynn_herman@langoshwill.co.uk	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	966546746	221766538	2012-05-22 14:13:04	2012-05-22 14:13:04	\N	\N	\N	\N	\N	\N
114568122	\N	\N	vernie@labadie.biz	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	245065123	976278305	2012-05-22 14:13:04	2012-05-22 14:13:04	\N	\N	\N	\N	\N	\N
534608386	\N	\N	jacky@huelsschuppe.info	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	395457563	590971557	2012-05-22 14:13:04	2012-05-22 14:13:04	\N	\N	\N	\N	\N	\N
685394585	\N	\N	santiago@ratke.com	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	546636942	339653170	2012-05-22 14:13:04	2012-05-22 14:13:04	\N	\N	\N	\N	\N	\N
918478646	\N	\N	garret_gerhold@lind.co.uk	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	1056018737	173680531	2012-05-22 14:13:04	2012-05-22 14:13:04	\N	\N	\N	\N	\N	\N
28962723	\N	\N	rosemarie@mannlarson.info	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	167158202	1029510922	2012-05-22 14:13:04	2012-05-22 14:13:04	\N	\N	\N	\N	\N	\N
414236187	\N	\N	harvey@walsh.co.uk	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	285208578	609502910	2012-05-22 14:13:04	2012-05-22 14:13:04	\N	\N	\N	\N	\N	\N
800558738	\N	\N	marlen_breitenberg@okeefe.info	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	670613653	324236843	2012-05-22 14:13:04	2012-05-22 14:13:04	\N	\N	\N	\N	\N	\N
1057526559	\N	\N	oswald_cassin@oconner.com	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	927456520	65825724	2012-05-22 14:13:04	2012-05-22 14:13:04	\N	\N	\N	\N	\N	\N
135242632	\N	\N	armand@wunschconn.name	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	4255125	887839535	2012-05-22 14:13:04	2012-05-22 14:13:04	\N	\N	\N	\N	\N	\N
140587364	\N	\N	lorine_herzog@price.info	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	42776516	421966440	2012-05-22 14:13:04	2012-05-22 14:13:04	\N	\N	\N	\N	\N	\N
1057526560	9e7e106b36cc1892126d11a5c9878cf15a9e3abdfb1149b03b2c898ea1e4bc1ec1539d46c87d7754f942e35e392e62bef4b2bbc7b9c0c68bcb0ed80914daac37	ss5Caexui3gXwyNXNSvM	gdBLycugUSByKArVdp1E@example.net	\N	gdBLycugUSByKArVdp1E	\N	\N	0	0	\N	\N	\N	\N	\N	gdBLycugUSByKArVdp1E@example.net	\N	\N	2012-05-22 15:29:36.147536	2012-05-22 15:29:36.147536	\N	\N	\N	\N	\N	\N
1057526561	c97e907718ca5fd5ee9793dfc50ebd02f9da70d596ae072bb1b1d497fc5b4265ae9983a6f71457854f168243a5af03fc0bd4c4dd96659b9719a8c27e90b13852	5JTova3wUYRnLP7AVwyU	g3k61X2JeQkDa50FaFk1@example.net	\N	g3k61X2JeQkDa50FaFk1	\N	\N	0	0	\N	\N	\N	\N	\N	g3k61X2JeQkDa50FaFk1@example.net	\N	\N	2012-05-24 11:27:03.157613	2012-05-24 11:27:03.157613	\N	\N	\N	\N	\N	\N
1057526562	4f1ea98e4ca663f81b880f69500987c47d41293b89785db6556ef811915c2c11245e259ffc825d94d46acd5590cbea4719c49f716cef383108b3ac34ccd339cd	Ex2p5c2Ey3tC3PfxzfzP	ygtoqg6DEZLF9CkounVf@example.net	\N	ygtoqg6DEZLF9CkounVf	\N	\N	0	0	\N	\N	\N	\N	\N	ygtoqg6DEZLF9CkounVf@example.net	\N	\N	2012-06-08 13:34:55.620114	2012-06-08 13:34:55.620114	\N	\N	\N	\N	\N	\N
1057526563	51f5d9b578694847837da875e5b11ec84ab6449af7a8cad0e92692844f152b0f83ff98521130e240e3f557b7e723ff42a953997acc0e559d6b41e0dafad5ad1c	FzNVkWRWodP1Ahosxxz2	_vMVPExt15Jg9gL5Qhxf@example.net	\N	_vMVPExt15Jg9gL5Qhxf	\N	\N	0	0	\N	\N	\N	\N	\N	_vMVPExt15Jg9gL5Qhxf@example.net	\N	\N	2012-06-13 15:21:44.970974	2012-06-13 15:21:44.970974	\N	\N	\N	\N	\N	\N
1057526564	84fcb675f3e732b2346ea1e38e51eed3b44faa509b6acaa33300208871482de34b6fbf5aba0971ba280bc93785fb0d078ba884c700a2bd62f341d32405448e3d	AWizsPz1n4qLysaZRkXL	DEh4w4oSM6Jj4_h2qqhF@example.net	\N	DEh4w4oSM6Jj4_h2qqhF	\N	\N	0	0	\N	\N	\N	\N	\N	DEh4w4oSM6Jj4_h2qqhF@example.net	\N	\N	2012-06-14 09:59:53.640712	2012-06-14 09:59:53.640712	\N	\N	\N	\N	\N	\N
1057526565	a87aa402918fb11b471ff480489403ad41507f2b754fc42b2cf84492d517178dcb3d4e5416155bb7885d75610aa254d2d87b94b3d586195874b45bafca3c87c3	XaJKr9Hxx3Nq1NVnVWsE	bZNZaP8GKEdJxkN3ArCe@example.net	\N	bZNZaP8GKEdJxkN3ArCe	\N	\N	0	0	\N	\N	\N	\N	\N	bZNZaP8GKEdJxkN3ArCe@example.net	\N	\N	2012-09-13 12:41:25.769743	2012-09-13 12:41:25.769743	\N	\N	\N	\N	\N	\N
1057526566	c679281c8686b5e8ed23f32ef17558b5568516a948d1bff8f2d5092ccfed2da9684f8d51151206e5a8ff8deb9413483830c97f76913e21345823f11a6f1cb233	KVt3CW3uXn9GqQgjvtcf	test@test.be	\N	\N	\N	\N	1	0	\N	2012-09-13 12:45:33.31401	2012-09-13 12:45:33.31401	127.0.0.1	127.0.0.1	test@test.be	\N	\N	2012-09-13 12:45:33.158977	2012-09-13 12:45:33.318243	\N	\N	\N	\N	\N	\N
1	a22c460a38651443f29a5736f576b89241ef2bd85d8c665dfc840826f4f3efd1e3c3a626bf78a7e822a5d98bc20a705242030f7159f099512d3d901090272c0d	qAPU4WhbvQPwtY3WuBDj	alain@typix.be	\N	\N	\N	\N	186	0	\N	2013-05-06 08:43:41.809542	2013-04-25 21:51:50.156212	127.0.0.1	127.0.0.1	alain@typix.be	\N	\N	2012-05-22 14:12:54.565638	2013-05-06 08:43:41.870957	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: spree_variants; Type: TABLE DATA; Schema: public; Owner: alain
--

COPY spree_variants (id, sku, price, weight, height, width, depth, deleted_at, is_master, product_id, count_on_hand, cost_price, "position", reduction) FROM stdin;
1013589501		234.00	\N	\N	\N	\N	\N	f	1060500651	-1	\N	\N	0
1013589547		242.99	\N	\N	\N	\N	\N	f	1060500663	0	\N	\N	0
1013589542		242.99	\N	\N	\N	\N	\N	t	1060500663	0	\N	\N	0
1013589551		1800.00	\N	\N	\N	\N	\N	f	1060500665	0	\N	\N	0
1013589552		2000.00	\N	\N	\N	\N	\N	f	1060500665	0	\N	\N	0
1013589553		1000.00	\N	\N	\N	\N	\N	t	1060500665	0	\N	\N	0
1013589518		1000.00	\N	\N	\N	\N	\N	t	1060500655	0	\N	\N	0
1013589546		230.00	\N	\N	\N	\N	\N	t	1060500664	0	\N	\N	0
1013589423		12.00	\N	\N	\N	\N	\N	t	1060500597	0	\N	\N	0
1013589422		2400.00	\N	\N	\N	\N	2012-09-18 14:07:06.337192	f	1060500596	0	\N	\N	0
1013589421		2400.00	\N	\N	\N	\N	2012-09-18 14:07:06.337192	f	1060500596	0	\N	\N	0
1013589420		24.00	\N	\N	\N	\N	2012-09-18 14:07:06.337192	t	1060500596	0	\N	\N	0
1013589504		4242.00	\N	\N	\N	\N	\N	f	1060500651	0	\N	\N	0
1013589428		23.00	\N	\N	\N	\N	\N	t	1060500600	0	\N	\N	0
1013589429		34.00	\N	\N	\N	\N	\N	t	1060500601	0	\N	\N	0
1013589430		345.00	\N	\N	\N	\N	\N	t	1060500602	0	\N	\N	0
1013589431		123.00	\N	\N	\N	\N	\N	t	1060500603	0	\N	\N	0
1013589432		23.00	\N	\N	\N	\N	\N	t	1060500604	0	\N	\N	0
1013589433		34.00	\N	\N	\N	\N	\N	t	1060500605	0	\N	\N	0
1013589435		45.00	\N	\N	\N	\N	\N	t	1060500607	0	\N	\N	0
1013589507		345.00	\N	\N	\N	\N	\N	f	1060500651	0	\N	\N	0
1013589509		1200.00	\N	\N	\N	\N	\N	f	1060500653	0	\N	\N	0
1013589510		1600.00	\N	\N	\N	\N	\N	f	1060500653	0	\N	\N	0
1013589513		120.00	\N	\N	\N	\N	\N	f	1060500654	0	\N	\N	0
1013589516		1000.00	\N	\N	\N	\N	\N	f	1060500655	0	\N	\N	0
1013589517		4242.00	\N	\N	\N	\N	\N	f	1060500655	0	\N	\N	0
1013589532		1222.00	\N	\N	\N	\N	\N	f	1060500660	0	\N	\N	0
1013589535		3434.00	\N	\N	\N	\N	\N	f	1060500661	0	\N	\N	0
1013589496		234.00	\N	\N	\N	\N	\N	f	1060500650	0	\N	\N	0
1013589541		234.00	\N	\N	\N	\N	\N	f	1060500663	0	\N	\N	0
1013589503		234.00	\N	\N	\N	\N	\N	t	1060500651	0	\N	\N	0
1013589544		230.00	\N	\N	\N	\N	\N	f	1060500664	0	\N	\N	0
1013589545		290.00	\N	\N	\N	\N	\N	f	1060500664	0	\N	\N	0
1013589536		3434.00	\N	\N	\N	\N	\N	t	1060500661	0	\N	\N	0
1013589514		120.00	\N	\N	\N	\N	\N	t	1060500654	0	\N	\N	0
1013589533		1222.00	\N	\N	\N	\N	\N	t	1060500660	0	\N	\N	0
1013589497		234.00	\N	\N	\N	\N	\N	t	1060500650	0	\N	\N	0
1013589511		1200.00	\N	\N	\N	\N	\N	t	1060500653	0	\N	\N	0
1013589506		300.00	\N	\N	\N	\N	\N	t	1060500652	0	\N	\N	20
1013589549		1000.00	\N	\N	\N	\N	\N	f	1060500665	0	\N	\N	20
1013589550		1442.00	\N	\N	\N	\N	\N	f	1060500665	-1	\N	\N	20
\.


--
-- Data for Name: spree_zone_members; Type: TABLE DATA; Schema: public; Owner: alain
--

COPY spree_zone_members (id, zoneable_id, zoneable_type, zone_id, created_at, updated_at) FROM stdin;
394938353	162	Spree::Country	1	2009-06-04 13:22:26	2009-06-04 13:22:26
966149671	67	Spree::Country	1	2009-06-04 13:22:26	2009-06-04 13:22:26
91991191	163	Spree::Country	1	2009-06-04 13:22:26	2009-06-04 13:22:26
847027202	167	Spree::Country	1	2009-06-04 13:22:26	2009-06-04 13:22:26
777453396	74	Spree::Country	1	2009-06-04 13:22:26	2009-06-04 13:22:26
244414130	68	Spree::Country	1	2009-06-04 13:22:26	2009-06-04 13:22:26
729140670	183	Spree::Country	1	2009-06-04 13:22:26	2009-06-04 13:22:26
424792003	90	Spree::Country	1	2009-06-04 13:22:26	2009-06-04 13:22:26
477297967	184	Spree::Country	1	2009-06-04 13:22:26	2009-06-04 13:22:26
5807739	96	Spree::Country	1	2009-06-04 13:22:26	2009-06-04 13:22:26
4914820	13	Spree::Country	1	2009-06-04 13:22:26	2009-06-04 13:22:26
35022990	188	Spree::Country	1	2009-06-04 13:22:26	2009-06-04 13:22:26
929017584	98	Spree::Country	1	2009-06-04 13:22:26	2009-06-04 13:22:26
423866172	20	Spree::Country	1	2009-06-04 13:22:26	2009-06-04 13:22:26
890329113	194	Spree::Country	1	2009-06-04 13:22:26	2009-06-04 13:22:26
691747661	110	Spree::Country	1	2009-06-04 13:22:26	2009-06-04 13:22:26
776249265	30	Spree::Country	1	2009-06-04 13:22:26	2009-06-04 13:22:26
739772837	213	Spree::Country	1	2009-06-04 13:22:26	2009-06-04 13:22:26
507251676	116	Spree::Country	1	2009-06-04 13:22:26	2009-06-04 13:22:26
807406092	51	Spree::Country	1	2009-06-04 13:22:26	2009-06-04 13:22:26
120937060	117	Spree::Country	1	2009-06-04 13:22:26	2009-06-04 13:22:26
120011419	52	Spree::Country	1	2009-06-04 13:22:26	2009-06-04 13:22:26
195044517	214	Spree::Country	2	2009-06-04 17:22:41	2009-06-04 17:22:41
808610553	125	Spree::Country	1	2009-06-04 13:22:26	2009-06-04 13:22:26
506358563	53	Spree::Country	1	2009-06-04 13:22:26	2009-06-04 13:22:26
1017582644	35	Spree::Country	2	2009-06-04 17:22:41	2009-06-04 17:22:41
546142054	142	Spree::Country	1	2009-06-04 13:22:26	2009-06-04 13:22:26
690576312	62	Spree::Country	1	2009-06-04 13:22:26	2009-06-04 13:22:26
\.


--
-- Data for Name: spree_zones; Type: TABLE DATA; Schema: public; Owner: alain
--

COPY spree_zones (id, name, description, created_at, updated_at, default_tax, zone_members_count) FROM stdin;
1	EU_VAT	Countries that make up the EU VAT zone.	2009-06-04 17:22:26	2009-06-04 17:22:26	f	26
2	North America	USA + Canada	2009-06-04 17:22:41	2009-06-04 17:22:41	f	2
\.


--
-- Name: state_events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alain
--

SELECT pg_catalog.setval('state_events_id_seq', 30, true);


--
-- Name: states_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alain
--

SELECT pg_catalog.setval('states_id_seq', 1061493586, false);


--
-- Name: tax_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alain
--

SELECT pg_catalog.setval('tax_categories_id_seq', 698318841, false);


--
-- Name: tax_rates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alain
--

SELECT pg_catalog.setval('tax_rates_id_seq', 967941381, false);


--
-- Name: taxonomies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alain
--

SELECT pg_catalog.setval('taxonomies_id_seq', 854451432, true);


--
-- Name: taxons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alain
--

SELECT pg_catalog.setval('taxons_id_seq', 558398408, true);


--
-- Name: tokenized_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alain
--

SELECT pg_catalog.setval('tokenized_permissions_id_seq', 12, true);


--
-- Name: trackers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alain
--

SELECT pg_catalog.setval('trackers_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alain
--

SELECT pg_catalog.setval('users_id_seq', 1057526566, true);


--
-- Name: variants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alain
--

SELECT pg_catalog.setval('variants_id_seq', 1013589553, true);


--
-- Name: zone_members_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alain
--

SELECT pg_catalog.setval('zone_members_id_seq', 1017582645, false);


--
-- Name: zones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alain
--

SELECT pg_catalog.setval('zones_id_seq', 3, false);


--
-- Name: activators_pkey; Type: CONSTRAINT; Schema: public; Owner: alain; Tablespace: 
--

ALTER TABLE ONLY spree_activators
    ADD CONSTRAINT activators_pkey PRIMARY KEY (id);


--
-- Name: addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: alain; Tablespace: 
--

ALTER TABLE ONLY spree_addresses
    ADD CONSTRAINT addresses_pkey PRIMARY KEY (id);


--
-- Name: adjustments_pkey; Type: CONSTRAINT; Schema: public; Owner: alain; Tablespace: 
--

ALTER TABLE ONLY spree_adjustments
    ADD CONSTRAINT adjustments_pkey PRIMARY KEY (id);


--
-- Name: assets_pkey; Type: CONSTRAINT; Schema: public; Owner: alain; Tablespace: 
--

ALTER TABLE ONLY spree_assets
    ADD CONSTRAINT assets_pkey PRIMARY KEY (id);


--
-- Name: calculators_pkey; Type: CONSTRAINT; Schema: public; Owner: alain; Tablespace: 
--

ALTER TABLE ONLY spree_calculators
    ADD CONSTRAINT calculators_pkey PRIMARY KEY (id);


--
-- Name: configurations_pkey; Type: CONSTRAINT; Schema: public; Owner: alain; Tablespace: 
--

ALTER TABLE ONLY spree_configurations
    ADD CONSTRAINT configurations_pkey PRIMARY KEY (id);


--
-- Name: countries_pkey; Type: CONSTRAINT; Schema: public; Owner: alain; Tablespace: 
--

ALTER TABLE ONLY spree_countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id);


--
-- Name: creditcards_pkey; Type: CONSTRAINT; Schema: public; Owner: alain; Tablespace: 
--

ALTER TABLE ONLY spree_credit_cards
    ADD CONSTRAINT creditcards_pkey PRIMARY KEY (id);


--
-- Name: gateways_pkey; Type: CONSTRAINT; Schema: public; Owner: alain; Tablespace: 
--

ALTER TABLE ONLY spree_gateways
    ADD CONSTRAINT gateways_pkey PRIMARY KEY (id);


--
-- Name: inventory_units_pkey; Type: CONSTRAINT; Schema: public; Owner: alain; Tablespace: 
--

ALTER TABLE ONLY spree_inventory_units
    ADD CONSTRAINT inventory_units_pkey PRIMARY KEY (id);


--
-- Name: line_items_pkey; Type: CONSTRAINT; Schema: public; Owner: alain; Tablespace: 
--

ALTER TABLE ONLY spree_line_items
    ADD CONSTRAINT line_items_pkey PRIMARY KEY (id);


--
-- Name: log_entries_pkey; Type: CONSTRAINT; Schema: public; Owner: alain; Tablespace: 
--

ALTER TABLE ONLY spree_log_entries
    ADD CONSTRAINT log_entries_pkey PRIMARY KEY (id);


--
-- Name: mail_methods_pkey; Type: CONSTRAINT; Schema: public; Owner: alain; Tablespace: 
--

ALTER TABLE ONLY spree_mail_methods
    ADD CONSTRAINT mail_methods_pkey PRIMARY KEY (id);


--
-- Name: option_types_pkey; Type: CONSTRAINT; Schema: public; Owner: alain; Tablespace: 
--

ALTER TABLE ONLY spree_option_types
    ADD CONSTRAINT option_types_pkey PRIMARY KEY (id);


--
-- Name: option_values_pkey; Type: CONSTRAINT; Schema: public; Owner: alain; Tablespace: 
--

ALTER TABLE ONLY spree_option_values
    ADD CONSTRAINT option_values_pkey PRIMARY KEY (id);


--
-- Name: orders_pkey; Type: CONSTRAINT; Schema: public; Owner: alain; Tablespace: 
--

ALTER TABLE ONLY spree_orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: payment_methods_pkey; Type: CONSTRAINT; Schema: public; Owner: alain; Tablespace: 
--

ALTER TABLE ONLY spree_payment_methods
    ADD CONSTRAINT payment_methods_pkey PRIMARY KEY (id);


--
-- Name: payments_pkey; Type: CONSTRAINT; Schema: public; Owner: alain; Tablespace: 
--

ALTER TABLE ONLY spree_payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY (id);


--
-- Name: preferences_pkey; Type: CONSTRAINT; Schema: public; Owner: alain; Tablespace: 
--

ALTER TABLE ONLY spree_preferences
    ADD CONSTRAINT preferences_pkey PRIMARY KEY (id);


--
-- Name: product_option_types_pkey; Type: CONSTRAINT; Schema: public; Owner: alain; Tablespace: 
--

ALTER TABLE ONLY spree_product_option_types
    ADD CONSTRAINT product_option_types_pkey PRIMARY KEY (id);


--
-- Name: product_properties_pkey; Type: CONSTRAINT; Schema: public; Owner: alain; Tablespace: 
--

ALTER TABLE ONLY spree_product_properties
    ADD CONSTRAINT product_properties_pkey PRIMARY KEY (id);


--
-- Name: products_pkey; Type: CONSTRAINT; Schema: public; Owner: alain; Tablespace: 
--

ALTER TABLE ONLY spree_products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: promotion_action_line_items_pkey; Type: CONSTRAINT; Schema: public; Owner: alain; Tablespace: 
--

ALTER TABLE ONLY spree_promotion_action_line_items
    ADD CONSTRAINT promotion_action_line_items_pkey PRIMARY KEY (id);


--
-- Name: promotion_actions_pkey; Type: CONSTRAINT; Schema: public; Owner: alain; Tablespace: 
--

ALTER TABLE ONLY spree_promotion_actions
    ADD CONSTRAINT promotion_actions_pkey PRIMARY KEY (id);


--
-- Name: promotion_rules_pkey; Type: CONSTRAINT; Schema: public; Owner: alain; Tablespace: 
--

ALTER TABLE ONLY spree_promotion_rules
    ADD CONSTRAINT promotion_rules_pkey PRIMARY KEY (id);


--
-- Name: properties_pkey; Type: CONSTRAINT; Schema: public; Owner: alain; Tablespace: 
--

ALTER TABLE ONLY spree_properties
    ADD CONSTRAINT properties_pkey PRIMARY KEY (id);


--
-- Name: prototypes_pkey; Type: CONSTRAINT; Schema: public; Owner: alain; Tablespace: 
--

ALTER TABLE ONLY spree_prototypes
    ADD CONSTRAINT prototypes_pkey PRIMARY KEY (id);


--
-- Name: relation_types_pkey; Type: CONSTRAINT; Schema: public; Owner: alain; Tablespace: 
--

ALTER TABLE ONLY spree_relation_types
    ADD CONSTRAINT relation_types_pkey PRIMARY KEY (id);


--
-- Name: relations_pkey; Type: CONSTRAINT; Schema: public; Owner: alain; Tablespace: 
--

ALTER TABLE ONLY spree_relations
    ADD CONSTRAINT relations_pkey PRIMARY KEY (id);


--
-- Name: return_authorizations_pkey; Type: CONSTRAINT; Schema: public; Owner: alain; Tablespace: 
--

ALTER TABLE ONLY spree_return_authorizations
    ADD CONSTRAINT return_authorizations_pkey PRIMARY KEY (id);


--
-- Name: roles_pkey; Type: CONSTRAINT; Schema: public; Owner: alain; Tablespace: 
--

ALTER TABLE ONLY spree_roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: shipments_pkey; Type: CONSTRAINT; Schema: public; Owner: alain; Tablespace: 
--

ALTER TABLE ONLY spree_shipments
    ADD CONSTRAINT shipments_pkey PRIMARY KEY (id);


--
-- Name: shipping_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: alain; Tablespace: 
--

ALTER TABLE ONLY spree_shipping_categories
    ADD CONSTRAINT shipping_categories_pkey PRIMARY KEY (id);


--
-- Name: shipping_methods_pkey; Type: CONSTRAINT; Schema: public; Owner: alain; Tablespace: 
--

ALTER TABLE ONLY spree_shipping_methods
    ADD CONSTRAINT shipping_methods_pkey PRIMARY KEY (id);


--
-- Name: spree_pending_promotions_pkey; Type: CONSTRAINT; Schema: public; Owner: alain; Tablespace: 
--

ALTER TABLE ONLY spree_pending_promotions
    ADD CONSTRAINT spree_pending_promotions_pkey PRIMARY KEY (id);


--
-- Name: spree_skrill_transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: alain; Tablespace: 
--

ALTER TABLE ONLY spree_skrill_transactions
    ADD CONSTRAINT spree_skrill_transactions_pkey PRIMARY KEY (id);


--
-- Name: state_events_pkey; Type: CONSTRAINT; Schema: public; Owner: alain; Tablespace: 
--

ALTER TABLE ONLY spree_state_changes
    ADD CONSTRAINT state_events_pkey PRIMARY KEY (id);


--
-- Name: states_pkey; Type: CONSTRAINT; Schema: public; Owner: alain; Tablespace: 
--

ALTER TABLE ONLY spree_states
    ADD CONSTRAINT states_pkey PRIMARY KEY (id);


--
-- Name: tax_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: alain; Tablespace: 
--

ALTER TABLE ONLY spree_tax_categories
    ADD CONSTRAINT tax_categories_pkey PRIMARY KEY (id);


--
-- Name: tax_rates_pkey; Type: CONSTRAINT; Schema: public; Owner: alain; Tablespace: 
--

ALTER TABLE ONLY spree_tax_rates
    ADD CONSTRAINT tax_rates_pkey PRIMARY KEY (id);


--
-- Name: taxonomies_pkey; Type: CONSTRAINT; Schema: public; Owner: alain; Tablespace: 
--

ALTER TABLE ONLY spree_taxonomies
    ADD CONSTRAINT taxonomies_pkey PRIMARY KEY (id);


--
-- Name: taxons_pkey; Type: CONSTRAINT; Schema: public; Owner: alain; Tablespace: 
--

ALTER TABLE ONLY spree_taxons
    ADD CONSTRAINT taxons_pkey PRIMARY KEY (id);


--
-- Name: tokenized_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: alain; Tablespace: 
--

ALTER TABLE ONLY spree_tokenized_permissions
    ADD CONSTRAINT tokenized_permissions_pkey PRIMARY KEY (id);


--
-- Name: trackers_pkey; Type: CONSTRAINT; Schema: public; Owner: alain; Tablespace: 
--

ALTER TABLE ONLY spree_trackers
    ADD CONSTRAINT trackers_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: alain; Tablespace: 
--

ALTER TABLE ONLY spree_users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: variants_pkey; Type: CONSTRAINT; Schema: public; Owner: alain; Tablespace: 
--

ALTER TABLE ONLY spree_variants
    ADD CONSTRAINT variants_pkey PRIMARY KEY (id);


--
-- Name: zone_members_pkey; Type: CONSTRAINT; Schema: public; Owner: alain; Tablespace: 
--

ALTER TABLE ONLY spree_zone_members
    ADD CONSTRAINT zone_members_pkey PRIMARY KEY (id);


--
-- Name: zones_pkey; Type: CONSTRAINT; Schema: public; Owner: alain; Tablespace: 
--

ALTER TABLE ONLY spree_zones
    ADD CONSTRAINT zones_pkey PRIMARY KEY (id);


--
-- Name: email_idx_unique; Type: INDEX; Schema: public; Owner: alain; Tablespace: 
--

CREATE UNIQUE INDEX email_idx_unique ON spree_users USING btree (email);


--
-- Name: index_addresses_on_firstname; Type: INDEX; Schema: public; Owner: alain; Tablespace: 
--

CREATE INDEX index_addresses_on_firstname ON spree_addresses USING btree (firstname);


--
-- Name: index_addresses_on_lastname; Type: INDEX; Schema: public; Owner: alain; Tablespace: 
--

CREATE INDEX index_addresses_on_lastname ON spree_addresses USING btree (lastname);


--
-- Name: index_adjustments_on_order_id; Type: INDEX; Schema: public; Owner: alain; Tablespace: 
--

CREATE INDEX index_adjustments_on_order_id ON spree_adjustments USING btree (adjustable_id);


--
-- Name: index_assets_on_viewable_id; Type: INDEX; Schema: public; Owner: alain; Tablespace: 
--

CREATE INDEX index_assets_on_viewable_id ON spree_assets USING btree (viewable_id);


--
-- Name: index_assets_on_viewable_type_and_type; Type: INDEX; Schema: public; Owner: alain; Tablespace: 
--

CREATE INDEX index_assets_on_viewable_type_and_type ON spree_assets USING btree (viewable_type, type);


--
-- Name: index_configurations_on_name_and_type; Type: INDEX; Schema: public; Owner: alain; Tablespace: 
--

CREATE INDEX index_configurations_on_name_and_type ON spree_configurations USING btree (name, type);


--
-- Name: index_inventory_units_on_order_id; Type: INDEX; Schema: public; Owner: alain; Tablespace: 
--

CREATE INDEX index_inventory_units_on_order_id ON spree_inventory_units USING btree (order_id);


--
-- Name: index_inventory_units_on_shipment_id; Type: INDEX; Schema: public; Owner: alain; Tablespace: 
--

CREATE INDEX index_inventory_units_on_shipment_id ON spree_inventory_units USING btree (shipment_id);


--
-- Name: index_inventory_units_on_variant_id; Type: INDEX; Schema: public; Owner: alain; Tablespace: 
--

CREATE INDEX index_inventory_units_on_variant_id ON spree_inventory_units USING btree (variant_id);


--
-- Name: index_line_items_on_order_id; Type: INDEX; Schema: public; Owner: alain; Tablespace: 
--

CREATE INDEX index_line_items_on_order_id ON spree_line_items USING btree (order_id);


--
-- Name: index_line_items_on_variant_id; Type: INDEX; Schema: public; Owner: alain; Tablespace: 
--

CREATE INDEX index_line_items_on_variant_id ON spree_line_items USING btree (variant_id);


--
-- Name: index_option_values_variants_on_variant_id; Type: INDEX; Schema: public; Owner: alain; Tablespace: 
--

CREATE INDEX index_option_values_variants_on_variant_id ON spree_option_values_variants USING btree (variant_id);


--
-- Name: index_option_values_variants_on_variant_id_and_option_value_id; Type: INDEX; Schema: public; Owner: alain; Tablespace: 
--

CREATE INDEX index_option_values_variants_on_variant_id_and_option_value_id ON spree_option_values_variants USING btree (variant_id, option_value_id);


--
-- Name: index_orders_on_number; Type: INDEX; Schema: public; Owner: alain; Tablespace: 
--

CREATE INDEX index_orders_on_number ON spree_orders USING btree (number);


--
-- Name: index_product_properties_on_product_id; Type: INDEX; Schema: public; Owner: alain; Tablespace: 
--

CREATE INDEX index_product_properties_on_product_id ON spree_product_properties USING btree (product_id);


--
-- Name: index_products_on_available_on; Type: INDEX; Schema: public; Owner: alain; Tablespace: 
--

CREATE INDEX index_products_on_available_on ON spree_products USING btree (available_on);


--
-- Name: index_products_on_deleted_at; Type: INDEX; Schema: public; Owner: alain; Tablespace: 
--

CREATE INDEX index_products_on_deleted_at ON spree_products USING btree (deleted_at);


--
-- Name: index_products_on_name; Type: INDEX; Schema: public; Owner: alain; Tablespace: 
--

CREATE INDEX index_products_on_name ON spree_products USING btree (name);


--
-- Name: index_products_on_permalink; Type: INDEX; Schema: public; Owner: alain; Tablespace: 
--

CREATE INDEX index_products_on_permalink ON spree_products USING btree (permalink);


--
-- Name: index_products_promotion_rules_on_product_id; Type: INDEX; Schema: public; Owner: alain; Tablespace: 
--

CREATE INDEX index_products_promotion_rules_on_product_id ON spree_products_promotion_rules USING btree (product_id);


--
-- Name: index_products_promotion_rules_on_promotion_rule_id; Type: INDEX; Schema: public; Owner: alain; Tablespace: 
--

CREATE INDEX index_products_promotion_rules_on_promotion_rule_id ON spree_products_promotion_rules USING btree (promotion_rule_id);


--
-- Name: index_products_taxons_on_product_id; Type: INDEX; Schema: public; Owner: alain; Tablespace: 
--

CREATE INDEX index_products_taxons_on_product_id ON spree_products_taxons USING btree (product_id);


--
-- Name: index_products_taxons_on_taxon_id; Type: INDEX; Schema: public; Owner: alain; Tablespace: 
--

CREATE INDEX index_products_taxons_on_taxon_id ON spree_products_taxons USING btree (taxon_id);


--
-- Name: index_promotion_rules_on_product_group_id; Type: INDEX; Schema: public; Owner: alain; Tablespace: 
--

CREATE INDEX index_promotion_rules_on_product_group_id ON spree_promotion_rules USING btree (product_group_id);


--
-- Name: index_promotion_rules_on_user_id; Type: INDEX; Schema: public; Owner: alain; Tablespace: 
--

CREATE INDEX index_promotion_rules_on_user_id ON spree_promotion_rules USING btree (user_id);


--
-- Name: index_promotion_rules_users_on_promotion_rule_id; Type: INDEX; Schema: public; Owner: alain; Tablespace: 
--

CREATE INDEX index_promotion_rules_users_on_promotion_rule_id ON spree_promotion_rules_users USING btree (promotion_rule_id);


--
-- Name: index_promotion_rules_users_on_user_id; Type: INDEX; Schema: public; Owner: alain; Tablespace: 
--

CREATE INDEX index_promotion_rules_users_on_user_id ON spree_promotion_rules_users USING btree (user_id);


--
-- Name: index_roles_users_on_role_id; Type: INDEX; Schema: public; Owner: alain; Tablespace: 
--

CREATE INDEX index_roles_users_on_role_id ON spree_roles_users USING btree (role_id);


--
-- Name: index_roles_users_on_user_id; Type: INDEX; Schema: public; Owner: alain; Tablespace: 
--

CREATE INDEX index_roles_users_on_user_id ON spree_roles_users USING btree (user_id);


--
-- Name: index_shipments_on_number; Type: INDEX; Schema: public; Owner: alain; Tablespace: 
--

CREATE INDEX index_shipments_on_number ON spree_shipments USING btree (number);


--
-- Name: index_spree_pending_promotions_on_promotion_id; Type: INDEX; Schema: public; Owner: alain; Tablespace: 
--

CREATE INDEX index_spree_pending_promotions_on_promotion_id ON spree_pending_promotions USING btree (promotion_id);


--
-- Name: index_spree_pending_promotions_on_user_id; Type: INDEX; Schema: public; Owner: alain; Tablespace: 
--

CREATE INDEX index_spree_pending_promotions_on_user_id ON spree_pending_promotions USING btree (user_id);


--
-- Name: index_spree_preferences_on_key; Type: INDEX; Schema: public; Owner: alain; Tablespace: 
--

CREATE UNIQUE INDEX index_spree_preferences_on_key ON spree_preferences USING btree (key);


--
-- Name: index_taxons_on_parent_id; Type: INDEX; Schema: public; Owner: alain; Tablespace: 
--

CREATE INDEX index_taxons_on_parent_id ON spree_taxons USING btree (parent_id);


--
-- Name: index_taxons_on_permalink; Type: INDEX; Schema: public; Owner: alain; Tablespace: 
--

CREATE INDEX index_taxons_on_permalink ON spree_taxons USING btree (permalink);


--
-- Name: index_taxons_on_taxonomy_id; Type: INDEX; Schema: public; Owner: alain; Tablespace: 
--

CREATE INDEX index_taxons_on_taxonomy_id ON spree_taxons USING btree (taxonomy_id);


--
-- Name: index_tokenized_name_and_type; Type: INDEX; Schema: public; Owner: alain; Tablespace: 
--

CREATE INDEX index_tokenized_name_and_type ON spree_tokenized_permissions USING btree (permissable_id, permissable_type);


--
-- Name: index_users_on_persistence_token; Type: INDEX; Schema: public; Owner: alain; Tablespace: 
--

CREATE INDEX index_users_on_persistence_token ON spree_users USING btree (persistence_token);


--
-- Name: index_variants_on_product_id; Type: INDEX; Schema: public; Owner: alain; Tablespace: 
--

CREATE INDEX index_variants_on_product_id ON spree_variants USING btree (product_id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: alain; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: public; Type: ACL; Schema: -; Owner: hachpai
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM hachpai;
GRANT ALL ON SCHEMA public TO hachpai;
GRANT ALL ON SCHEMA public TO "HachPai";
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

