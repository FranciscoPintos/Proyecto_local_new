--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-0ubuntu0.20.04.1)

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
-- Name: account_emailaddress; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account_emailaddress (
    id bigint NOT NULL,
    email character varying(254) NOT NULL,
    verified boolean NOT NULL,
    "primary" boolean NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.account_emailaddress OWNER TO postgres;

--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.account_emailaddress_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_emailaddress_id_seq OWNER TO postgres;

--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.account_emailaddress_id_seq OWNED BY public.account_emailaddress.id;


--
-- Name: account_emailconfirmation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account_emailconfirmation (
    id bigint NOT NULL,
    created timestamp with time zone NOT NULL,
    sent timestamp with time zone,
    key character varying(64) NOT NULL,
    email_address_id bigint NOT NULL
);


ALTER TABLE public.account_emailconfirmation OWNER TO postgres;

--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.account_emailconfirmation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_emailconfirmation_id_seq OWNER TO postgres;

--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.account_emailconfirmation_id_seq OWNED BY public.account_emailconfirmation.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: comentarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comentarios (
    id integer NOT NULL,
    comentarios character varying(2000) NOT NULL,
    activo boolean NOT NULL,
    creador_id bigint NOT NULL,
    project_id bigint NOT NULL,
    us_id integer NOT NULL
);


ALTER TABLE public.comentarios OWNER TO postgres;

--
-- Name: comentarios_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.comentarios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comentarios_id_seq OWNER TO postgres;

--
-- Name: comentarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.comentarios_id_seq OWNED BY public.comentarios.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id bigint NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO postgres;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_site_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO postgres;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_site_id_seq OWNED BY public.django_site.id;


--
-- Name: equipo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.equipo (
    id integer NOT NULL,
    capacidad integer,
    sprint_id integer,
    CONSTRAINT equipo_capacidad_check CHECK ((capacidad >= 0))
);


ALTER TABLE public.equipo OWNER TO postgres;

--
-- Name: equipo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.equipo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.equipo_id_seq OWNER TO postgres;

--
-- Name: equipo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.equipo_id_seq OWNED BY public.equipo.id;


--
-- Name: equipo_miembros; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.equipo_miembros (
    id bigint NOT NULL,
    equipo_id integer NOT NULL,
    miembro_id bigint NOT NULL
);


ALTER TABLE public.equipo_miembros OWNER TO postgres;

--
-- Name: equipo_miembros_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.equipo_miembros_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.equipo_miembros_id_seq OWNER TO postgres;

--
-- Name: equipo_miembros_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.equipo_miembros_id_seq OWNED BY public.equipo_miembros.id;


--
-- Name: etiqueta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.etiqueta (
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    fecha_creacion date NOT NULL,
    activo boolean NOT NULL,
    proyecto_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.etiqueta OWNER TO postgres;

--
-- Name: etiqueta_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.etiqueta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.etiqueta_id_seq OWNER TO postgres;

--
-- Name: etiqueta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.etiqueta_id_seq OWNED BY public.etiqueta.id;


--
-- Name: historial_tarea; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.historial_tarea (
    id bigint NOT NULL,
    descripcion character varying(2000) NOT NULL,
    hora integer NOT NULL,
    fecha_modificacion timestamp with time zone,
    tarea_id bigint,
    sprimt_id integer,
    CONSTRAINT historial_tarea_hora_check CHECK ((hora >= 0))
);


ALTER TABLE public.historial_tarea OWNER TO postgres;

--
-- Name: historial_tarea_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.historial_tarea_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.historial_tarea_id_seq OWNER TO postgres;

--
-- Name: historial_tarea_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.historial_tarea_id_seq OWNED BY public.historial_tarea.id;


--
-- Name: miembros; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.miembros (
    id bigint NOT NULL,
    "horaTrabajo" integer NOT NULL,
    activo boolean NOT NULL,
    rol_id bigint,
    user_id bigint NOT NULL
);


ALTER TABLE public.miembros OWNER TO postgres;

--
-- Name: miembros_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.miembros_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.miembros_id_seq OWNER TO postgres;

--
-- Name: miembros_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.miembros_id_seq OWNED BY public.miembros.id;


--
-- Name: principalApp_holidaytime; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."principalApp_holidaytime" (
    id bigint NOT NULL,
    holiday_date date NOT NULL
);


ALTER TABLE public."principalApp_holidaytime" OWNER TO postgres;

--
-- Name: principalApp_holidaytime_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."principalApp_holidaytime_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."principalApp_holidaytime_id_seq" OWNER TO postgres;

--
-- Name: principalApp_holidaytime_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."principalApp_holidaytime_id_seq" OWNED BY public."principalApp_holidaytime".id;


--
-- Name: project; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.project (
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    fecha_inicio date,
    fecha_fin date,
    active boolean NOT NULL,
    estado character varying(20) NOT NULL,
    creator_id bigint NOT NULL
);


ALTER TABLE public.project OWNER TO postgres;

--
-- Name: project_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.project_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.project_id_seq OWNER TO postgres;

--
-- Name: project_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.project_id_seq OWNED BY public.project.id;


--
-- Name: rol_proyecto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rol_proyecto (
    id bigint NOT NULL,
    name character varying(60) NOT NULL,
    project_id bigint
);


ALTER TABLE public.rol_proyecto OWNER TO postgres;

--
-- Name: rol_proyecto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rol_proyecto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rol_proyecto_id_seq OWNER TO postgres;

--
-- Name: rol_proyecto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rol_proyecto_id_seq OWNED BY public.rol_proyecto.id;


--
-- Name: rol_proyecto_permisos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rol_proyecto_permisos (
    id bigint NOT NULL,
    rolproyecto_id bigint NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.rol_proyecto_permisos OWNER TO postgres;

--
-- Name: rol_proyecto_permisos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rol_proyecto_permisos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rol_proyecto_permisos_id_seq OWNER TO postgres;

--
-- Name: rol_proyecto_permisos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rol_proyecto_permisos_id_seq OWNED BY public.rol_proyecto_permisos.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id integer NOT NULL,
    rol character varying(50) NOT NULL
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_id_seq OWNER TO postgres;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- Name: roles_permisos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles_permisos (
    id bigint NOT NULL,
    rol_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.roles_permisos OWNER TO postgres;

--
-- Name: roles_permisos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.roles_permisos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_permisos_id_seq OWNER TO postgres;

--
-- Name: roles_permisos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.roles_permisos_id_seq OWNED BY public.roles_permisos.id;


--
-- Name: socialaccount_socialaccount; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.socialaccount_socialaccount (
    id bigint NOT NULL,
    provider character varying(30) NOT NULL,
    uid character varying(191) NOT NULL,
    last_login timestamp with time zone NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    extra_data text NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.socialaccount_socialaccount OWNER TO postgres;

--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.socialaccount_socialaccount_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialaccount_id_seq OWNER TO postgres;

--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.socialaccount_socialaccount_id_seq OWNED BY public.socialaccount_socialaccount.id;


--
-- Name: socialaccount_socialapp; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.socialaccount_socialapp (
    id bigint NOT NULL,
    provider character varying(30) NOT NULL,
    name character varying(40) NOT NULL,
    client_id character varying(191) NOT NULL,
    secret character varying(191) NOT NULL,
    key character varying(191) NOT NULL
);


ALTER TABLE public.socialaccount_socialapp OWNER TO postgres;

--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.socialaccount_socialapp_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialapp_id_seq OWNER TO postgres;

--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.socialaccount_socialapp_id_seq OWNED BY public.socialaccount_socialapp.id;


--
-- Name: socialaccount_socialapp_sites; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.socialaccount_socialapp_sites (
    id bigint NOT NULL,
    socialapp_id bigint NOT NULL,
    site_id integer NOT NULL
);


ALTER TABLE public.socialaccount_socialapp_sites OWNER TO postgres;

--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.socialaccount_socialapp_sites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialapp_sites_id_seq OWNER TO postgres;

--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.socialaccount_socialapp_sites_id_seq OWNED BY public.socialaccount_socialapp_sites.id;


--
-- Name: socialaccount_socialtoken; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.socialaccount_socialtoken (
    id bigint NOT NULL,
    token text NOT NULL,
    token_secret text NOT NULL,
    expires_at timestamp with time zone,
    account_id bigint NOT NULL,
    app_id bigint NOT NULL
);


ALTER TABLE public.socialaccount_socialtoken OWNER TO postgres;

--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.socialaccount_socialtoken_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialtoken_id_seq OWNER TO postgres;

--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.socialaccount_socialtoken_id_seq OWNED BY public.socialaccount_socialtoken.id;


--
-- Name: sprint; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sprint (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    fecha_incio date,
    fecha_fin date,
    estado integer NOT NULL,
    proyecto_id bigint
);


ALTER TABLE public.sprint OWNER TO postgres;

--
-- Name: sprint_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sprint_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sprint_id_seq OWNER TO postgres;

--
-- Name: sprint_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sprint_id_seq OWNED BY public.sprint.id;


--
-- Name: sprint_us; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sprint_us (
    id bigint NOT NULL,
    sprint_id integer NOT NULL,
    us_id integer NOT NULL
);


ALTER TABLE public.sprint_us OWNER TO postgres;

--
-- Name: sprint_us_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sprint_us_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sprint_us_id_seq OWNER TO postgres;

--
-- Name: sprint_us_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sprint_us_id_seq OWNED BY public.sprint_us.id;


--
-- Name: sprintplanning; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sprintplanning (
    id bigint NOT NULL,
    paso integer NOT NULL,
    sprint_id integer NOT NULL
);


ALTER TABLE public.sprintplanning OWNER TO postgres;

--
-- Name: sprintplanning_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sprintplanning_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sprintplanning_id_seq OWNER TO postgres;

--
-- Name: sprintplanning_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sprintplanning_id_seq OWNED BY public.sprintplanning.id;


--
-- Name: tarea; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tarea (
    id bigint NOT NULL,
    descripcion character varying(2000) NOT NULL,
    horas integer NOT NULL,
    fecha_creacion timestamp with time zone,
    ustory_id integer,
    sprimt_id integer,
    CONSTRAINT tarea_horas_check CHECK ((horas >= 0))
);


ALTER TABLE public.tarea OWNER TO postgres;

--
-- Name: tarea_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tarea_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tarea_id_seq OWNER TO postgres;

--
-- Name: tarea_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tarea_id_seq OWNED BY public.tarea.id;


--
-- Name: us; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.us (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    descripcion character varying(2000) NOT NULL,
    prioridad integer NOT NULL,
    estimacionscrum integer,
    estimaciondesarrollador integer,
    storypoints integer,
    estado integer NOT NULL,
    activo boolean NOT NULL,
    etiqueta_id bigint,
    project_id bigint NOT NULL,
    user_id bigint,
    CONSTRAINT us_estimaciondesarrollador_check CHECK ((estimaciondesarrollador >= 0)),
    CONSTRAINT us_estimacionscrum_check CHECK ((estimacionscrum >= 0)),
    CONSTRAINT us_storypoints_check CHECK ((storypoints >= 0))
);


ALTER TABLE public.us OWNER TO postgres;

--
-- Name: us_historialcomentarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.us_historialcomentarios (
    id integer NOT NULL,
    us_name character varying(50),
    project_name character varying(50),
    creator_name character varying(50),
    comentarios character varying(2000),
    fecha_modificacion timestamp with time zone,
    comentario_id integer NOT NULL,
    creador_id bigint,
    us_id integer,
    activo boolean
);


ALTER TABLE public.us_historialcomentarios OWNER TO postgres;

--
-- Name: us_historialcomentarios_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.us_historialcomentarios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.us_historialcomentarios_id_seq OWNER TO postgres;

--
-- Name: us_historialcomentarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.us_historialcomentarios_id_seq OWNED BY public.us_historialcomentarios.id;


--
-- Name: us_historialus; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.us_historialus (
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    descripcion character varying(2000) NOT NULL,
    prioridad integer NOT NULL,
    estado integer NOT NULL,
    storypoints integer,
    fecha_modificacion timestamp with time zone,
    user_id bigint,
    ustory_id integer,
    activo boolean NOT NULL,
    estimaciondesarrollador integer,
    estimacionscrum integer,
    etiqueta_id bigint,
    sprint_id integer,
    CONSTRAINT us_historialus_estimaciondesarrollador_check CHECK ((estimaciondesarrollador >= 0)),
    CONSTRAINT us_historialus_estimacionscrum_check CHECK ((estimacionscrum >= 0)),
    CONSTRAINT us_historialus_storypoints_check CHECK ((storypoints >= 0))
);


ALTER TABLE public.us_historialus OWNER TO postgres;

--
-- Name: us_historialus_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.us_historialus_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.us_historialus_id_seq OWNER TO postgres;

--
-- Name: us_historialus_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.us_historialus_id_seq OWNED BY public.us_historialus.id;


--
-- Name: us_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.us_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.us_id_seq OWNER TO postgres;

--
-- Name: us_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.us_id_seq OWNED BY public.us.id;


--
-- Name: usuario_usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario_usuario (
    id bigint NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    username character varying(50) NOT NULL,
    names character varying(50),
    lastname character varying(50),
    ci character varying(10),
    email character varying(70) NOT NULL,
    fecha_nac date,
    fecha_created date,
    fecha_deleted date,
    usuario_activo boolean,
    usuario_administrador boolean,
    image character varying(100),
    rol_id integer
);


ALTER TABLE public.usuario_usuario OWNER TO postgres;

--
-- Name: usuario_usuario_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario_usuario_groups (
    id bigint NOT NULL,
    usuario_id bigint NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.usuario_usuario_groups OWNER TO postgres;

--
-- Name: usuario_usuario_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuario_usuario_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usuario_usuario_groups_id_seq OWNER TO postgres;

--
-- Name: usuario_usuario_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuario_usuario_groups_id_seq OWNED BY public.usuario_usuario_groups.id;


--
-- Name: usuario_usuario_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuario_usuario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usuario_usuario_id_seq OWNER TO postgres;

--
-- Name: usuario_usuario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuario_usuario_id_seq OWNED BY public.usuario_usuario.id;


--
-- Name: usuario_usuario_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario_usuario_user_permissions (
    id bigint NOT NULL,
    usuario_id bigint NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.usuario_usuario_user_permissions OWNER TO postgres;

--
-- Name: usuario_usuario_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuario_usuario_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usuario_usuario_user_permissions_id_seq OWNER TO postgres;

--
-- Name: usuario_usuario_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuario_usuario_user_permissions_id_seq OWNED BY public.usuario_usuario_user_permissions.id;


--
-- Name: account_emailaddress id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailaddress ALTER COLUMN id SET DEFAULT nextval('public.account_emailaddress_id_seq'::regclass);


--
-- Name: account_emailconfirmation id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailconfirmation ALTER COLUMN id SET DEFAULT nextval('public.account_emailconfirmation_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: comentarios id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comentarios ALTER COLUMN id SET DEFAULT nextval('public.comentarios_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: django_site id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_site ALTER COLUMN id SET DEFAULT nextval('public.django_site_id_seq'::regclass);


--
-- Name: equipo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.equipo ALTER COLUMN id SET DEFAULT nextval('public.equipo_id_seq'::regclass);


--
-- Name: equipo_miembros id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.equipo_miembros ALTER COLUMN id SET DEFAULT nextval('public.equipo_miembros_id_seq'::regclass);


--
-- Name: etiqueta id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.etiqueta ALTER COLUMN id SET DEFAULT nextval('public.etiqueta_id_seq'::regclass);


--
-- Name: historial_tarea id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historial_tarea ALTER COLUMN id SET DEFAULT nextval('public.historial_tarea_id_seq'::regclass);


--
-- Name: miembros id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.miembros ALTER COLUMN id SET DEFAULT nextval('public.miembros_id_seq'::regclass);


--
-- Name: principalApp_holidaytime id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."principalApp_holidaytime" ALTER COLUMN id SET DEFAULT nextval('public."principalApp_holidaytime_id_seq"'::regclass);


--
-- Name: project id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.project ALTER COLUMN id SET DEFAULT nextval('public.project_id_seq'::regclass);


--
-- Name: rol_proyecto id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rol_proyecto ALTER COLUMN id SET DEFAULT nextval('public.rol_proyecto_id_seq'::regclass);


--
-- Name: rol_proyecto_permisos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rol_proyecto_permisos ALTER COLUMN id SET DEFAULT nextval('public.rol_proyecto_permisos_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Name: roles_permisos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles_permisos ALTER COLUMN id SET DEFAULT nextval('public.roles_permisos_id_seq'::regclass);


--
-- Name: socialaccount_socialaccount id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialaccount ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialaccount_id_seq'::regclass);


--
-- Name: socialaccount_socialapp id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialapp ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialapp_id_seq'::regclass);


--
-- Name: socialaccount_socialapp_sites id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialapp_sites_id_seq'::regclass);


--
-- Name: socialaccount_socialtoken id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialtoken ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialtoken_id_seq'::regclass);


--
-- Name: sprint id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sprint ALTER COLUMN id SET DEFAULT nextval('public.sprint_id_seq'::regclass);


--
-- Name: sprint_us id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sprint_us ALTER COLUMN id SET DEFAULT nextval('public.sprint_us_id_seq'::regclass);


--
-- Name: sprintplanning id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sprintplanning ALTER COLUMN id SET DEFAULT nextval('public.sprintplanning_id_seq'::regclass);


--
-- Name: tarea id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tarea ALTER COLUMN id SET DEFAULT nextval('public.tarea_id_seq'::regclass);


--
-- Name: us id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.us ALTER COLUMN id SET DEFAULT nextval('public.us_id_seq'::regclass);


--
-- Name: us_historialcomentarios id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.us_historialcomentarios ALTER COLUMN id SET DEFAULT nextval('public.us_historialcomentarios_id_seq'::regclass);


--
-- Name: us_historialus id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.us_historialus ALTER COLUMN id SET DEFAULT nextval('public.us_historialus_id_seq'::regclass);


--
-- Name: usuario_usuario id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario_usuario ALTER COLUMN id SET DEFAULT nextval('public.usuario_usuario_id_seq'::regclass);


--
-- Name: usuario_usuario_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario_usuario_groups ALTER COLUMN id SET DEFAULT nextval('public.usuario_usuario_groups_id_seq'::regclass);


--
-- Name: usuario_usuario_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario_usuario_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.usuario_usuario_user_permissions_id_seq'::regclass);


--
-- Data for Name: account_emailaddress; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.account_emailaddress (id, email, verified, "primary", user_id) FROM stdin;
1	userprueba1is2@gmail.com	t	t	2
2	userprueba2is2@gmail.com	t	t	3
3	userprue1@gmail.com	t	t	4
4	userprue2@gmail.com	t	t	5
5	gerenciaequipo09@gmail.com	t	t	6
\.


--
-- Data for Name: account_emailconfirmation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.account_emailconfirmation (id, created, sent, key, email_address_id) FROM stdin;
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add site	6	add_site
22	Can change site	6	change_site
23	Can delete site	6	delete_site
24	Can view site	6	view_site
25	Can add email address	7	add_emailaddress
26	Can change email address	7	change_emailaddress
27	Can delete email address	7	delete_emailaddress
28	Can view email address	7	view_emailaddress
29	Can add email confirmation	8	add_emailconfirmation
30	Can change email confirmation	8	change_emailconfirmation
31	Can delete email confirmation	8	delete_emailconfirmation
32	Can view email confirmation	8	view_emailconfirmation
33	Can add social account	9	add_socialaccount
34	Can change social account	9	change_socialaccount
35	Can delete social account	9	delete_socialaccount
36	Can view social account	9	view_socialaccount
37	Can add social application	10	add_socialapp
38	Can change social application	10	change_socialapp
39	Can delete social application	10	delete_socialapp
40	Can view social application	10	view_socialapp
41	Can add social application token	11	add_socialtoken
42	Can change social application token	11	change_socialtoken
43	Can delete social application token	11	delete_socialtoken
44	Can view social application token	11	view_socialtoken
45	Can add holidaytime	12	add_holidaytime
46	Can change holidaytime	12	change_holidaytime
47	Can delete holidaytime	12	delete_holidaytime
48	Can view holidaytime	12	view_holidaytime
49	Can add user	13	add_usuario
50	Can change user	13	change_usuario
51	Can delete user	13	delete_usuario
52	Can view user	13	view_usuario
53	Can add Rol	14	add_rol
54	Can change Rol	14	change_rol
55	Can delete Rol	14	delete_rol
56	Can view Rol	14	view_rol
57	Can add proyecto	15	add_proyecto
58	Can change proyecto	15	change_proyecto
59	Can delete proyecto	15	delete_proyecto
60	Can view proyecto	15	view_proyecto
61	Can start a Project	15	start_proyecto
62	Can end a Project	15	end_proyecto
63	Can add miembro	16	add_miembro
64	Can change miembro	16	change_miembro
65	Can delete miembro	16	delete_miembro
66	Can view miembro	16	view_miembro
67	Can add rol proyecto	17	add_rolproyecto
68	Can change rol proyecto	17	change_rolproyecto
69	Can delete rol proyecto	17	delete_rolproyecto
70	Can view rol proyecto	17	view_rolproyecto
71	Can assign a member to a rolproyecto	17	asignar_rolproyecto
72	Can add Comentarios	18	add_comentarios
73	Can change Comentarios	18	change_comentarios
74	Can delete Comentarios	18	delete_comentarios
75	Can view Comentarios	18	view_comentarios
76	Can add historial comentarios	19	add_historialcomentarios
77	Can change historial comentarios	19	change_historialcomentarios
78	Can delete historial comentarios	19	delete_historialcomentarios
79	Can view historial comentarios	19	view_historialcomentarios
80	Can add historial us	20	add_historialus
81	Can change historial us	20	change_historialus
82	Can delete historial us	20	delete_historialus
83	Can view historial us	20	view_historialus
84	Can add Us	21	add_us
85	Can change Us	21	change_us
86	Can delete Us	21	delete_us
87	Can view Us	21	view_us
88	Can valuate a US	21	estimar_sprintplanning
89	Can add Tarea	22	add_tarea
90	Can change Tarea	22	change_tarea
91	Can delete Tarea	22	delete_tarea
92	Can view Tarea	22	view_tarea
93	Can add HistorialTarea	23	add_historialtarea
94	Can change HistorialTarea	23	change_historialtarea
95	Can delete HistorialTarea	23	delete_historialtarea
96	Can view HistorialTarea	23	view_historialtarea
97	Can add Etiqueta	24	add_etiqueta
98	Can change Etiqueta	24	change_etiqueta
99	Can delete Etiqueta	24	delete_etiqueta
100	Can view Etiqueta	24	view_etiqueta
101	Can add Sprint	25	add_sprint
102	Can change Sprint	25	change_sprint
103	Can delete Sprint	25	delete_sprint
104	Can view Sprint	25	view_sprint
105	Can add Us to Sprint Backlog	25	charge_sprintplanning
106	Can view Sprint Backlog	25	view_sprintbacklog
107	Can view Burdownchart	25	view_burdownchart
108	Can start Sprint	25	start_sprint
109	Can finalize a Sprint	25	end_sprint
110	Can add Equipo	26	add_equipo
111	Can change Equipo	26	change_equipo
112	Can delete Equipo	26	delete_equipo
113	Can view Equipo	26	view_equipo
114	Can add SprintPlanning	27	add_sprintplanning
115	Can change SprintPlanning	27	change_sprintplanning
116	Can delete SprintPlanning	27	delete_sprintplanning
117	Can view SprintPlanning	27	view_sprintplanning
\.


--
-- Data for Name: comentarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comentarios (id, comentarios, activo, creador_id, project_id, us_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2021-12-02 20:40:01.040151-03	1	Aplicación OAuth	1	[{"added": {}}]	10	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	sites	site
7	account	emailaddress
8	account	emailconfirmation
9	socialaccount	socialaccount
10	socialaccount	socialapp
11	socialaccount	socialtoken
12	principalApp	holidaytime
13	usuario	usuario
14	roles	rol
15	project	proyecto
16	miembros	miembro
17	miembros	rolproyecto
18	us	comentarios
19	us	historialcomentarios
20	us	historialus
21	us	us
22	tarea	tarea
23	tarea	historialtarea
24	etiqueta	etiqueta
25	sprint	sprint
26	equipo	equipo
27	sprintPlanning	sprintplanning
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2021-12-02 20:38:26.389349-03
2	contenttypes	0002_remove_content_type_name	2021-12-02 20:38:26.432625-03
3	auth	0001_initial	2021-12-02 20:38:26.547702-03
4	auth	0002_alter_permission_name_max_length	2021-12-02 20:38:26.557408-03
5	auth	0003_alter_user_email_max_length	2021-12-02 20:38:26.566708-03
6	auth	0004_alter_user_username_opts	2021-12-02 20:38:26.574222-03
7	auth	0005_alter_user_last_login_null	2021-12-02 20:38:26.581805-03
8	auth	0006_require_contenttypes_0002	2021-12-02 20:38:26.584702-03
9	auth	0007_alter_validators_add_error_messages	2021-12-02 20:38:26.591631-03
10	auth	0008_alter_user_username_max_length	2021-12-02 20:38:26.598768-03
11	auth	0009_alter_user_last_name_max_length	2021-12-02 20:38:26.615031-03
12	auth	0010_alter_group_name_max_length	2021-12-02 20:38:26.625609-03
13	auth	0011_update_proxy_permissions	2021-12-02 20:38:26.633536-03
14	auth	0012_alter_user_first_name_max_length	2021-12-02 20:38:26.641846-03
15	roles	0001_initial	2021-12-02 20:38:26.721379-03
16	usuario	0001_initial	2021-12-02 20:38:27.002001-03
17	account	0001_initial	2021-12-02 20:38:27.256646-03
18	account	0002_email_max_length	2021-12-02 20:38:27.306428-03
19	account	0003_auto_20210813_0611	2021-12-02 20:38:27.580207-03
20	admin	0001_initial	2021-12-02 20:38:27.679952-03
21	admin	0002_logentry_remove_auto_add	2021-12-02 20:38:27.699748-03
22	admin	0003_logentry_add_action_flag_choices	2021-12-02 20:38:27.720166-03
23	project	0001_initial	2021-12-02 20:38:27.768011-03
24	miembros	0001_initial	2021-12-02 20:38:27.891501-03
25	miembros	0002_initial	2021-12-02 20:38:27.991692-03
26	etiqueta	0001_initial	2021-12-02 20:38:28.003905-03
27	etiqueta	0002_etiqueta_proyecto	2021-12-02 20:38:28.048483-03
28	us	0001_initial	2021-12-02 20:38:28.324858-03
29	project	0002_proyecto_creator	2021-12-02 20:38:28.417192-03
30	us	0002_initial	2021-12-02 20:38:28.66284-03
31	sprint	0001_initial	2021-12-02 20:38:28.80992-03
32	miembros	0003_miembro_user	2021-12-02 20:38:28.852518-03
33	equipo	0001_initial	2021-12-02 20:38:28.922738-03
34	equipo	0002_equipo_sprint	2021-12-02 20:38:28.966943-03
35	etiqueta	0003_etiqueta_user	2021-12-02 20:38:28.997348-03
36	miembros	0004_alter_rolproyecto_options	2021-12-02 20:38:29.014842-03
37	principalApp	0001_initial	2021-12-02 20:38:29.026499-03
38	project	0003_auto_20211130_1414	2021-12-02 20:38:29.061923-03
39	sessions	0001_initial	2021-12-02 20:38:29.093294-03
40	sites	0001_initial	2021-12-02 20:38:29.104955-03
41	sites	0002_alter_domain_unique	2021-12-02 20:38:29.134607-03
42	socialaccount	0001_initial	2021-12-02 20:38:29.363793-03
43	socialaccount	0002_token_max_lengths	2021-12-02 20:38:29.411961-03
44	socialaccount	0003_extra_data_default_dict	2021-12-02 20:38:29.428896-03
45	socialaccount	0004_auto_20210813_0611	2021-12-02 20:38:29.743514-03
46	sprint	0002_alter_sprint_options	2021-12-02 20:38:29.779552-03
47	sprint	0003_auto_20211105_0934	2021-12-02 20:38:29.812266-03
48	sprint	0004_alter_sprint_options	2021-12-02 20:38:29.82994-03
49	sprintPlanning	0001_initial	2021-12-02 20:38:29.905368-03
50	tarea	0001_initial	2021-12-02 20:38:30.026865-03
51	tarea	0002_auto_20211116_2122	2021-12-02 20:38:30.157898-03
52	tarea	0003_alter_tarea_fecha_creacion	2021-12-02 20:38:30.200932-03
53	us	0003_alter_us_options	2021-12-02 20:38:30.262426-03
54	us	0004_historialcomentarios_activo	2021-12-02 20:38:30.287607-03
55	us	0005_auto_20211123_1835	2021-12-02 20:38:30.413982-03
56	us	0006_historialus_sprint	2021-12-02 20:38:30.449331-03
57	us	0007_auto_20211130_1414	2021-12-02 20:38:30.561223-03
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
u5rlz936yim69zse3b4g48s35e91yvtp	eyJzb2NpYWxhY2NvdW50X3N0YXRlIjpbeyJwcm9jZXNzIjoibG9naW4iLCJzY29wZSI6IiIsImF1dGhfcGFyYW1zIjoiIn0sIlV5WjJEak53MldERiJdfQ:1klNVi:aHfMkIM5KsNi7xHrp4cELtfAJW4OwiJ9LnPiLHOFZU4	2020-12-18 23:41:22.065819-03
tytv9wvuyx0mm3kagegwfo9vnxy3cm87	eyJzb2NpYWxhY2NvdW50X3N0YXRlIjpbeyJwcm9jZXNzIjoibG9naW4iLCJzY29wZSI6IiIsImF1dGhfcGFyYW1zIjoiIn0sIm5ycEV3Y25lQUVoQyJdfQ:1kwGNx:-vsRVSyvTumrmNT9lHkdVnT04n1-CJfIWxAF4ZsaeAk	2021-01-18 00:18:21.676611-03
vxytibbyq0q6dlwruk3oddfm5qb9al4d	eyJzb2NpYWxhY2NvdW50X3N0YXRlIjpbeyJwcm9jZXNzIjoibG9naW4iLCJzY29wZSI6IiIsImF1dGhfcGFyYW1zIjoiIn0sImhYaFVwNzV0eG9ZMSJdfQ:1kkcL3:WjJJFJZ0V0hFFrem5RYbFx5SKC2BtTiasQhlxLdyMkA	2020-12-16 21:19:13.458582-03
ojd51mwhp31lvzvpuj2osxgai6yntad0	eyJzb2NpYWxhY2NvdW50X3N0YXRlIjpbeyJwcm9jZXNzIjoibG9naW4iLCJzY29wZSI6IiIsImF1dGhfcGFyYW1zIjoiIn0sIm12clB4V05QTUFROSJdfQ:1kkcN5:2xnIfJikBclgTW2s7CorwujJSYpn8B8_OXYLPlhuZIg	2020-12-16 21:21:19.954499-03
l9qk9ok8qyytz2ibxqm6xd0p03kbs5l4	eyJzb2NpYWxhY2NvdW50X3N0YXRlIjpbeyJwcm9jZXNzIjoibG9naW4iLCJzY29wZSI6IiIsImF1dGhfcGFyYW1zIjoiIn0sIkhpR0ttQnZFM05qMyJdfQ:1klOLC:K6pUjCyPSdj9y2V0a57pFwSHwphO3PsadPfzdxTN_ZU	2020-12-19 00:34:34.054096-03
cg9qr3tssgngmqhnew79v99pxjppzbeh	eyJzb2NpYWxhY2NvdW50X3N0YXRlIjpbeyJwcm9jZXNzIjoibG9naW4iLCJzY29wZSI6IiIsImF1dGhfcGFyYW1zIjoiIn0sIlg2cUN5Mkc4aloycSJdfQ:1kllCL:qFtywc4CiFIIcoX1tUGWgyUGvuv5N2svKUvKrfkcG7U	2020-12-20 00:58:57.115339-03
i8coxhcckksmzg6zjug4m0usuinb1r38	eyJzb2NpYWxhY2NvdW50X3N0YXRlIjpbeyJwcm9jZXNzIjoibG9naW4iLCJzY29wZSI6IiIsImF1dGhfcGFyYW1zIjoiIn0sIkhJNDRnVVZUZ0dhNCJdfQ:1l8Emd:bYp9SG4dueMab4N9TpQAICEikS0i29gmghLhPt-QQgo	2021-02-20 01:01:19.041475-03
5efbohqnoakygei7yx6mbfcj6w0pzn3w	eyJzb2NpYWxhY2NvdW50X3N0YXRlIjpbeyJwcm9jZXNzIjoibG9naW4iLCJzY29wZSI6IiIsImF1dGhfcGFyYW1zIjoiIn0sImxvRlJRYnNDOThIRyJdfQ:1kkywZ:KMPqFaz2GQahkeHB0M_Ub6D5UZYRULndMn8BUgxwXYs	2020-12-17 21:27:27.488273-03
kv4ax0i1dmw26seb48rknfodeeicku85	.eJxVjMEOwiAQRP-Fs2mwC1K86Y-QZWEDsaGJwMn471LTgx7nvZl5CYe9JddrfLocxFWAOP0yj_SIZRe4rjuekGjrpU3fzqHrdBsplpYJW97K_Vj9XSWsafwsVoLSmrU9K0aFMwJQCBqNiYrZqLggB89y9ACslB7AM2klLzNRsOL9Abb1PHQ:1mt8r3:qjXxVfiq15Y3KfO8JAqWL8V1SThHAp9nqguQhRNODc4	2021-12-17 10:44:01.542777-03
ncbarhjf8dnkqlwlduo9ad14pbpdu7zt	eyJzb2NpYWxhY2NvdW50X3N0YXRlIjpbeyJwcm9jZXNzIjoibG9naW4iLCJzY29wZSI6IiIsImF1dGhfcGFyYW1zIjoiIn0sIkJDRHRWamlIWUJ5NiJdfQ:1kvvUe:h4C4Xqn2ku4ECfYxJnmkBk3D-t9vTbJoVGsVrgvluP8	2021-01-17 01:59:52.812049-03
os8n9vqi6qiroel3d7e531hpy41w7kjj	eyJzb2NpYWxhY2NvdW50X3N0YXRlIjpbeyJwcm9jZXNzIjoibG9naW4iLCJzY29wZSI6IiIsImF1dGhfcGFyYW1zIjoiIn0sIm90aGNvM2FTS2M2dSJdfQ:1kvzTQ:GyzgGPuIy0MGq3FodAMQDVq2Awv9jRDUz6MV9Eq6FaY	2021-01-17 06:14:52.282636-03
glx9mhx3i62r8pnpscb3tuncezf3h9a6	.eJxVjDsOwjAQRO_iGllx_A0dXCTaXa9li8iRsFMh7k6CUkA5b2beS8yw9TxvjZ9zieIqnLj8MgR6cD0KWJYDSyBat9rld3PWTd72xLUXgl7Wej9ff6oMLe8ezY7JuokIPMZxCoCk1JCcTWiNVgrYE3tjnbXKBUQNxqOJQek0DsGI9wfR5zxH:1mt1Rz:VyguRZEEnopKYJXwlNT36Uz61-xlJH9ljArdS8oPDgY	2021-12-17 02:49:39.524794-03
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_site (id, domain, name) FROM stdin;
4	example.com	example.com
\.


--
-- Data for Name: equipo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.equipo (id, capacidad, sprint_id) FROM stdin;
1	624	1
2	400	2
3	64	3
4	272	4
\.


--
-- Data for Name: equipo_miembros; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.equipo_miembros (id, equipo_id, miembro_id) FROM stdin;
1	1	5
2	1	6
3	1	7
4	2	6
5	3	10
6	4	9
7	4	10
\.


--
-- Data for Name: etiqueta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.etiqueta (id, name, fecha_creacion, activo, proyecto_id, user_id) FROM stdin;
\.


--
-- Data for Name: historial_tarea; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.historial_tarea (id, descripcion, hora, fecha_modificacion, tarea_id, sprimt_id) FROM stdin;
1	inicio de trabajo	8	2020-12-05 00:45:00-03	1	1
4	t3	8	2020-12-08 02:38:00-03	4	1
6	t3	8	2020-12-08 02:38:00-03	4	1
7	inicio de trabajo	8	2020-12-05 00:45:00-03	1	1
8	t4	10	2020-12-10 02:38:00-03	5	1
9	t6	13	2020-12-11 02:39:00-03	6	1
10	t8	10	2020-12-12 02:39:00-03	7	1
11	tareas conjuntas	42	2020-12-05 02:41:00-03	8	1
12	tarea 1	8	2020-12-05 03:32:00-03	9	1
13	tryr	48	2020-12-05 00:33:24.917686-03	10	1
14	tarerq	52	2020-12-05 00:33:55.560814-03	11	1
16	Templates de roles y us	5	2021-01-04 09:05:00-03	13	3
17	Template de Inicio	2	2021-01-05 09:05:00-03	14	3
18	Templates de sprint y planning	7	2021-01-08 09:10:00-03	15	3
19	Templates de historiales	2	2021-01-09 09:10:00-03	16	3
20	templates de kamban	4	2021-01-09 11:12:00-03	17	3
21	Vistas de Proyecto	2	2021-01-03 11:13:00-03	18	3
22	Vistas de Us	4	2021-01-04 09:13:00-03	19	3
23	Vistas de Proyecto	2	2021-01-03 11:13:00-03	18	3
25	Vistas de Product Backlog	4	2021-01-14 10:44:00-03	21	3
26	Template de Administracion	2	2021-01-16 05:48:00-03	22	3
28	Prueba de vistas de burdown	4	2021-01-18 10:49:13.281193-03	23	4
29	Pruebas de vistas de roles	3	2021-01-20 13:50:00-03	25	4
30	Prueba de vistas de US	3	2021-01-21 13:53:00-03	26	4
31	Prueba de vistas de US	3	2021-01-21 13:53:00-03	27	4
32	Test de vistas de cambio de roles	5	2021-01-23 14:05:00-03	28	4
33	Test de vistas de estimaciones	2	2021-01-23 14:09:00-03	29	4
34	Test de vistas de equipo	4	2021-01-25 14:10:00-03	30	4
\.


--
-- Data for Name: miembros; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.miembros (id, "horaTrabajo", activo, rol_id, user_id) FROM stdin;
1	0	t	2	6
2	0	t	6	6
3	0	t	10	6
4	0	t	14	6
8	8	t	1	2
5	8	t	4	4
6	8	t	4	3
7	8	t	4	5
15	8	t	9	4
13	8	t	12	3
14	8	t	12	2
16	8	t	12	5
18	8	t	13	2
17	8	t	16	3
19	8	t	16	4
20	8	t	16	5
21	10	f	3	1
11	8	t	5	4
9	8	t	8	3
10	8	t	8	2
12	8	t	8	5
\.


--
-- Data for Name: principalApp_holidaytime; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."principalApp_holidaytime" (id, holiday_date) FROM stdin;
\.


--
-- Data for Name: project; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.project (id, name, fecha_inicio, fecha_fin, active, estado, creator_id) FROM stdin;
3	Proyecto 3	2021-05-11	2021-09-30	t	E	6
4	Proyecto 4	2021-08-13	2022-01-21	t	E	6
1	Proyecto 1	2021-03-31	2021-07-16	t	F	6
2	Proyecto 2	2021-01-02	2021-05-31	t	I	6
\.


--
-- Data for Name: rol_proyecto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rol_proyecto (id, name, project_id) FROM stdin;
1	Product Owner	1
2	Scrum Master	1
3		1
4	Desarrollador	1
5	Product Owner	2
6	Scrum Master	2
7		2
8	Desarrollador	2
9	Product Owner	3
10	Scrum Master	3
11		3
12	Desarrollador	3
13	Product Owner	4
14	Scrum Master	4
15		4
16	Desarrollador	4
\.


--
-- Data for Name: rol_proyecto_permisos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rol_proyecto_permisos (id, rolproyecto_id, permission_id) FROM stdin;
1	2	110
2	2	111
3	2	112
4	2	113
5	2	97
6	2	98
7	2	99
8	2	100
9	2	63
10	2	64
11	2	65
12	2	66
13	2	67
14	2	71
15	2	68
16	2	69
17	2	70
18	2	46
19	2	47
20	2	48
21	2	57
22	2	58
23	2	59
24	2	62
25	2	61
26	2	60
27	2	53
28	2	54
29	2	55
30	2	56
31	2	101
32	2	102
33	2	105
34	2	103
35	2	109
36	2	108
37	2	107
38	2	104
39	2	106
40	2	114
41	2	115
42	2	116
43	2	117
44	2	93
45	2	94
46	2	95
47	2	96
48	2	89
49	2	90
50	2	91
51	2	92
52	2	72
53	2	73
54	2	74
55	2	75
56	2	76
57	2	77
58	2	78
59	2	79
60	2	80
61	2	81
62	2	82
63	2	83
64	2	84
65	2	85
66	2	86
67	2	88
68	2	87
69	2	49
70	2	50
71	2	51
72	2	52
73	1	60
74	1	66
75	1	75
76	1	79
77	1	83
78	1	84
79	1	85
80	1	86
81	1	87
82	1	96
83	1	92
84	1	97
85	1	98
86	1	99
87	1	100
88	1	104
89	1	113
90	1	106
91	1	107
92	4	60
93	4	66
94	4	75
95	4	79
96	4	83
97	4	87
98	4	96
99	4	92
100	4	89
101	4	91
102	4	90
103	4	104
104	4	113
105	4	106
106	4	107
107	4	88
108	6	110
109	6	111
110	6	112
111	6	113
112	6	97
113	6	98
114	6	99
115	6	100
116	6	63
117	6	64
118	6	65
119	6	66
120	6	67
121	6	71
122	6	68
123	6	69
124	6	70
125	6	46
126	6	47
127	6	48
128	6	57
129	6	58
130	6	59
131	6	62
132	6	61
133	6	60
134	6	53
135	6	54
136	6	55
137	6	56
138	6	101
139	6	102
140	6	105
141	6	103
142	6	109
143	6	108
144	6	107
145	6	104
146	6	106
147	6	114
148	6	115
149	6	116
150	6	117
151	6	93
152	6	94
153	6	95
154	6	96
155	6	89
156	6	90
157	6	91
158	6	92
159	6	72
160	6	73
161	6	74
162	6	75
163	6	76
164	6	77
165	6	78
166	6	79
167	6	80
168	6	81
169	6	82
170	6	83
171	6	84
172	6	85
173	6	86
174	6	88
175	6	87
176	6	49
177	6	50
178	6	51
179	6	52
180	5	60
181	5	66
182	5	75
183	5	79
184	5	83
185	5	84
186	5	85
187	5	86
188	5	87
189	5	96
190	5	92
191	5	97
192	5	98
193	5	99
194	5	100
195	5	104
196	5	113
197	5	106
198	5	107
199	8	60
200	8	66
201	8	75
202	8	79
203	8	83
204	8	87
205	8	96
206	8	92
207	8	89
208	8	91
209	8	90
210	8	104
211	8	113
212	8	106
213	8	107
214	8	88
215	10	110
216	10	111
217	10	112
218	10	113
219	10	97
220	10	98
221	10	99
222	10	100
223	10	63
224	10	64
225	10	65
226	10	66
227	10	67
228	10	71
229	10	68
230	10	69
231	10	70
232	10	46
233	10	47
234	10	48
235	10	57
236	10	58
237	10	59
238	10	62
239	10	61
240	10	60
241	10	53
242	10	54
243	10	55
244	10	56
245	10	101
246	10	102
247	10	105
248	10	103
249	10	109
250	10	108
251	10	107
252	10	104
253	10	106
254	10	114
255	10	115
256	10	116
257	10	117
258	10	93
259	10	94
260	10	95
261	10	96
262	10	89
263	10	90
264	10	91
265	10	92
266	10	72
267	10	73
268	10	74
269	10	75
270	10	76
271	10	77
272	10	78
273	10	79
274	10	80
275	10	81
276	10	82
277	10	83
278	10	84
279	10	85
280	10	86
281	10	88
282	10	87
283	10	49
284	10	50
285	10	51
286	10	52
287	9	60
288	9	66
289	9	75
290	9	79
291	9	83
292	9	84
293	9	85
294	9	86
295	9	87
296	9	96
297	9	92
298	9	97
299	9	98
300	9	99
301	9	100
302	9	104
303	9	113
304	9	106
305	9	107
306	12	60
307	12	66
308	12	75
309	12	79
310	12	83
311	12	87
312	12	96
313	12	92
314	12	89
315	12	91
316	12	90
317	12	104
318	12	113
319	12	106
320	12	107
321	12	88
322	14	110
323	14	111
324	14	112
325	14	113
326	14	97
327	14	98
328	14	99
329	14	100
330	14	63
331	14	64
332	14	65
333	14	66
334	14	67
335	14	71
336	14	68
337	14	69
338	14	70
339	14	46
340	14	47
341	14	48
342	14	57
343	14	58
344	14	59
345	14	62
346	14	61
347	14	60
348	14	53
349	14	54
350	14	55
351	14	56
352	14	101
353	14	102
354	14	105
355	14	103
356	14	109
357	14	108
358	14	107
359	14	104
360	14	106
361	14	114
362	14	115
363	14	116
364	14	117
365	14	93
366	14	94
367	14	95
368	14	96
369	14	89
370	14	90
371	14	91
372	14	92
373	14	72
374	14	73
375	14	74
376	14	75
377	14	76
378	14	77
379	14	78
380	14	79
381	14	80
382	14	81
383	14	82
384	14	83
385	14	84
386	14	85
387	14	86
388	14	88
389	14	87
390	14	49
391	14	50
392	14	51
393	14	52
394	13	60
395	13	66
396	13	75
397	13	79
398	13	83
399	13	84
400	13	85
401	13	86
402	13	87
403	13	96
404	13	92
405	13	97
406	13	98
407	13	99
408	13	100
409	13	104
410	13	113
411	13	106
412	13	107
413	16	60
414	16	66
415	16	75
416	16	79
417	16	83
418	16	87
419	16	96
420	16	92
421	16	89
422	16	91
423	16	90
424	16	104
425	16	113
426	16	106
427	16	107
428	16	88
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (id, rol) FROM stdin;
1	Creador de Proyectos
\.


--
-- Data for Name: roles_permisos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles_permisos (id, rol_id, permission_id) FROM stdin;
1	1	53
2	1	54
3	1	55
4	1	56
5	1	57
6	1	58
7	1	59
8	1	60
9	1	61
10	1	62
\.


--
-- Data for Name: socialaccount_socialaccount; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.socialaccount_socialaccount (id, provider, uid, last_login, date_joined, extra_data, user_id) FROM stdin;
4	google	114586346910533844068	2021-12-02 21:24:05.699978-03	2021-12-02 20:48:56.384303-03	{"id": "114586346910533844068", "email": "userprue2@gmail.com", "verified_email": true, "name": "Usuario Prueba", "given_name": "Usuario", "family_name": "Prueba", "picture": "https://lh3.googleusercontent.com/a/AATXAJxl1ID58A-7kIOb_gezZCp8K9d12c_2369A1p4E=s96-c", "locale": "es"}	5
3	google	111176747050293652630	2021-12-03 01:26:23.954635-03	2021-12-02 20:48:26.659686-03	{"id": "111176747050293652630", "email": "userprue1@gmail.com", "verified_email": true, "name": "Usuario Prueba", "given_name": "Usuario", "family_name": "Prueba", "picture": "https://lh3.googleusercontent.com/a/AATXAJwffHcpF9Qb1OVRjwLpHhDEMyROvSdvdBJG7oia=s96-c", "locale": "es"}	4
1	google	114859760729133515892	2021-12-03 10:31:13.977569-03	2021-12-02 20:43:55.073112-03	{"id": "114859760729133515892", "email": "userprueba1is2@gmail.com", "verified_email": true, "name": "User Prueba 1 IS2", "given_name": "User Prueba 1", "family_name": "IS2", "picture": "https://lh3.googleusercontent.com/a/AATXAJztPtNhN46ocdmT_2qT3oz-zqkOzTwEkL4xdhLb=s96-c", "locale": "es"}	2
5	google	109790281120895607033	2021-12-03 10:32:51.698059-03	2021-12-02 20:52:21.053211-03	{"id": "109790281120895607033", "email": "gerenciaequipo09@gmail.com", "verified_email": true, "name": "Gestor_equipo09 is2", "given_name": "Gestor_equipo09", "family_name": "is2", "picture": "https://lh3.googleusercontent.com/a/AATXAJw9aZM9UWc6cuIgF1K0UHyxBPqw7jMZQdkNG_2k=s96-c", "locale": "es"}	6
2	google	105675435886523813510	2021-12-03 10:44:01.487754-03	2021-12-02 20:44:01.397221-03	{"id": "105675435886523813510", "email": "userprueba2is2@gmail.com", "verified_email": true, "name": "User Prueba 2 IS2", "given_name": "User Prueba 2", "family_name": "IS2", "picture": "https://lh3.googleusercontent.com/a/AATXAJxTY924CdT45YhF1sWTsUfI0doUuK8c3e-fSh_c=s96-c", "locale": "es"}	3
\.


--
-- Data for Name: socialaccount_socialapp; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.socialaccount_socialapp (id, provider, name, client_id, secret, key) FROM stdin;
1	google	Aplicación OAuth	96128541178-8hkdejl0g62hiurv8a71ah99uvls9up6.apps.googleusercontent.com	HZaQQ9N-W__8oaltWtQ_xquG	
\.


--
-- Data for Name: socialaccount_socialapp_sites; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.socialaccount_socialapp_sites (id, socialapp_id, site_id) FROM stdin;
1	1	4
\.


--
-- Data for Name: socialaccount_socialtoken; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.socialaccount_socialtoken (id, token, token_secret, expires_at, account_id, app_id) FROM stdin;
4	ya29.a0ARrdaM8y99tF0jcAESICbUGphRfgEzO34IAGT8HnKas0XEvf07yGZRFVFS61cuyJ2VfzaPnPR2axfVB2IJJLKo5pwOhisdl4xGGnyo-Z6t5_lrz6AT3YNvqiQesQlHG3BVu6fg3tl4jW2bxF5Pc2qXyrE86a		2021-12-02 22:24:04.406857-03	4	1
3	ya29.a0ARrdaM8guhQKCS20MVwrrGDfywxcsAdQnAkpo22Qe9mU_NM_Yl-cE_PPViyEAbb5Gad0Om1wBtZKtII4RJAhamxM4F6AT5P-FRMF7rPPz8R76qlZK3a4dzPycbTuUt3In1qoCqjvSuAkKx7m7HYBWsA4aVyXeA		2021-12-03 02:26:22.679379-03	3	1
1	ya29.a0ARrdaM9wWPNO5oIRF-N-7lqo8LciQ5XHQDU--M64wXnkLO72MzxxaCwAG5nEv3fw87e1QflBzH8cclLcp2QTOTzIfO-Wt8XnVQAazgDI1vAj4k9-bE9uRiGtADz8tpDCWktLSS2RMzqqpHY4IQyLvDkyLfdN2Q		2021-12-03 11:31:12.740771-03	1	1
5	ya29.a0ARrdaM8xd0Mxumo6TXKL3bMt3XatLKytTc8IlNPAy9tO34DUoh_8WA63Go6nBlizsKBvYiOGQfri6Qs3Eo7CF7gEiVnlbWCh0dckL4hnzdDCTV-Qdy8J2h--fle6IbIXRggNn_F7LqWDozyrCo2VjitlFVfhuw		2021-12-03 11:32:50.45077-03	5	1
2	ya29.a0ARrdaM-1fZLRt1w4bDanLJ4j5SrUQql3qpTl3BQzDVFn_PVHeMpXJgal8UANS5p7wX8vcMYI2q2kLxS9qofHxRGLUYWyDSvbCXmrf8K1B5bBkji4SDkXtyP1sAwxNlQgOIRG8K68Zhao87QJz6xqTrJUMxOn_g		2021-12-03 11:44:00.222522-03	2	1
\.


--
-- Data for Name: sprint; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sprint (id, name, fecha_incio, fecha_fin, estado, proyecto_id) FROM stdin;
1	SPRINT 1 - P1	2020-12-03	2021-12-02	3	1
2	SPRINT 2 - P1	2021-02-05	2021-03-30	3	1
3	Sprint 1	2021-01-03	2021-01-17	3	2
4	Sprint 2	2021-01-18	2021-02-06	2	2
\.


--
-- Data for Name: sprint_us; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sprint_us (id, sprint_id, us_id) FROM stdin;
1	1	8
2	1	1
3	1	3
4	1	9
5	2	2
6	2	4
7	2	5
8	2	6
9	2	7
10	2	10
11	2	11
12	2	12
13	3	17
14	3	13
15	3	15
16	4	16
17	4	14
18	4	19
\.


--
-- Data for Name: sprintplanning; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sprintplanning (id, paso, sprint_id) FROM stdin;
1	4	1
2	4	2
3	4	3
4	4	4
\.


--
-- Data for Name: tarea; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tarea (id, descripcion, horas, fecha_creacion, ustory_id, sprimt_id) FROM stdin;
4	t3	8	2020-12-08 02:38:00-03	8	1
1	inicio de trabajo	8	2020-12-05 00:45:00-03	8	1
5	t4	10	2020-12-10 02:38:00-03	8	1
6	t6	13	2020-12-11 02:39:00-03	8	1
7	t8	10	2020-12-12 02:39:00-03	8	1
8	tareas conjuntas	42	2020-12-05 02:41:00-03	9	1
9	tarea 1	8	2020-12-05 03:32:00-03	1	1
10	tryr	48	2020-12-05 00:33:24.917686-03	1	1
11	tarerq	52	2020-12-05 00:33:55.560814-03	3	1
13	Templates de roles y us	5	2021-01-04 09:05:00-03	17	3
14	Template de Inicio	2	2021-01-05 09:05:00-03	17	3
15	Templates de sprint y planning	7	2021-01-08 09:10:00-03	17	3
16	Templates de historiales	2	2021-01-09 09:10:00-03	17	3
17	templates de kamban	4	2021-01-09 11:12:00-03	17	3
19	Vistas de Us	4	2021-01-04 09:13:00-03	13	3
18	Vistas de Proyecto	2	2021-01-03 11:13:00-03	13	3
21	Vistas de Product Backlog	4	2021-01-14 10:44:00-03	13	3
22	Template de Administracion	2	2021-01-16 05:48:00-03	15	3
23	Prueba de vistas de burdown	4	2021-01-18 10:49:13.281193-03	14	4
25	Pruebas de vistas de roles	3	2021-01-20 13:50:00-03	14	4
26	Prueba de vistas de US	3	2021-01-21 13:53:00-03	14	4
27	Prueba de vistas de US	3	2021-01-21 13:53:00-03	14	4
28	Test de vistas de cambio de roles	5	2021-01-23 14:05:00-03	14	4
29	Test de vistas de estimaciones	2	2021-01-23 14:09:00-03	14	4
30	Test de vistas de equipo	4	2021-01-25 14:10:00-03	14	4
\.


--
-- Data for Name: us; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.us (id, name, descripcion, prioridad, estimacionscrum, estimaciondesarrollador, storypoints, estado, activo, etiqueta_id, project_id, user_id) FROM stdin;
4	US 6 P1	El menú de aplicación, situado junto al botón de Actividades, muestra el nombre de la aplicación activa junto con su icono y proporciona un acceso rápido a las ventanas y los detalles de la aplicación, así como a un elemento para salir.	3	15	16	15	4	t	\N	1	6
3	US 3  P1	Pulse en el botón de rejilla en la parte inferior del tablero para mostrar la vista de aplicaciones. Esto le muestra todas las aplicaciones instaladas en su equipo. Pulse en cualquier aplicación para ejecutarla, o arrastre una aplicación a la vista o sobre la miniatura del espacio de trabajo. También puede arrastrar una aplicación al tablero para que sea uno de los favoritos. Sus aplicaciones favoritas permanecerán en el tablero, incluso cuando no estén en funcionamiento, para que pueda acceder a ellas rápidamente.	4	56	48	52	4	t	\N	1	6
1	US 1 P1	La barra superior proporciona acceso a las ventanas y a sus aplicaciones, a su calendario y a sus citas y a las propiedades del sistema como el sonido, la red, y la energía. En el menú de estado en la barra superior, puede cambiar el volumen o el brillo de la pantalla, editar su conexión Inalámbrica, comprobar el estado de la batería, salir o cambiar de usuario, y apagar el equipo.	5	60	56	58	4	t	\N	1	6
7	US 7 P1	Cuando bloquea su pantalla o se bloquea automáticamente, se muestra la pantalla de bloqueo. Además de proteger su escritorio mientras está ausente de su equipo, la pantalla de bloqueo muestra la fecha y la hora. También muestra información sobre la batería y el estado de la red.	3	15	16	15	4	t	\N	1	6
8	US 8 P1	Cuando bloquea su pantalla o se bloquea automáticamente, se muestra la pantalla de bloqueo. Además de proteger su escritorio mientras está ausente de su equipo, la pantalla de bloqueo muestra la fecha y la hora. También muestra información sobre la batería y el estado de la red.	5	65	60	62	4	t	\N	1	6
9	US 9 P1	Más información\r\nGuía del escritorio de Ubuntu\r\nSu escritorio — Calendario, notificaciones, atajos del teclado, ventanas y áreas de trabajo…	4	40	45	42	4	t	\N	1	6
11	US11 P1	To unlock your computer, click once with your mouse or touchpad, or press Esc or Enter. This will reveal the login screen, where you can enter your password to unlock. Alternatively, just start typing your password and the login screen will be automatically shown as you type. You can also switch users at the bottom right of the login screen if your system is configured for more than one.	4	10	10	10	4	t	\N	1	6
5	US 4 P1	Reloj, calendario, citas y notificaciones\r\nPulse en el reloj en el centro de la barra superior para ver la fecha actual, un calendario mensual y una lista de sus próximas citas. También puede abrir el calendario pulsando Súper+M. Puede acceder a la configuración de fecha y hora y abrir totalmente su calendario directamente desde el menú.	2	15	20	17	4	t	\N	1	6
2	US 2 P1	Para acceder a sus ventanas y aplicaciones, pulse el botón Actividades, o simplemente lleve el puntero del ratón a la esquina superior izquierda activa. También puede pulsar la tecla Super en su teclado. Puede ver sus ventanas y aplicaciones en la vista de actividades. También puede empezar a escribir para buscar aplicaciones, archivos o carpetas y en la web.	4	50	50	50	4	t	\N	1	6
6	US5 P1	Al dejar su equipo, puede bloquear la pantalla para evitar que otras personas lo usen. Puede rápidamente cambiar de usuario sin necesidad de iniciar la sesión completamente para dar a alguien acceso al equipo. O bien, puede suspender o apagar el equipo desde el menú.	1	30	27	28	4	t	\N	1	6
10	US10 P1	The lock screen means that you can see what is happening while your computer is locked, and it allows you to get a summary of what has been happening while you have been away. The lock screen provides useful information:	2	20	30	25	4	t	\N	1	6
12	US 12 P1	Ayuda Guía de escritorio de Ubuntu » Escritorio › Aplicaciones y ventanas »\r\nAyuda Guía de escritorio de Ubuntu » Escritorio › Personalizar su escritorio » Notificaciones y la lista de notificaciones › Ocultar notificaciones en la pantalla de bloqueo »	3	15	15	15	4	t	\N	1	6
18	Poblar bases de datos	Crear modelos de bases de datos con datos previos	3	\N	\N	\N	1	t	\N	2	\N
16	Realizar script	Realizar scripts de entornos, pruebas, documentacion	4	12	16	14	1	t	\N	2	10
19	Testear Modelos	Test de models	1	16	14	15	1	t	\N	2	10
14	Testear Vistas	Correr test de los views	2	20	20	20	2	t	\N	2	9
13	Crear Vistas	Definir vistas de los diferentes modulos	4	12	20	16	4	t	\N	2	10
15	Realizar Templates	Trabajo en html	3	20	20	20	4	t	\N	2	10
17	Probar templates	Gestion de botones y permisos	2	15	25	20	4	t	\N	2	10
\.


--
-- Data for Name: us_historialcomentarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.us_historialcomentarios (id, us_name, project_name, creator_name, comentarios, fecha_modificacion, comentario_id, creador_id, us_id, activo) FROM stdin;
\.


--
-- Data for Name: us_historialus; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.us_historialus (id, name, descripcion, prioridad, estado, storypoints, fecha_modificacion, user_id, ustory_id, activo, estimaciondesarrollador, estimacionscrum, etiqueta_id, sprint_id) FROM stdin;
1	US 1 P1	La barra superior proporciona acceso a las ventanas y a sus aplicaciones, a su calendario y a sus citas y a las propiedades del sistema como el sonido, la red, y la energía. En el menú de estado en la barra superior, puede cambiar el volumen o el brillo de la pantalla, editar su conexión Inalámbrica, comprobar el estado de la batería, salir o cambiar de usuario, y apagar el equipo.	5	1	\N	2020-12-02 21:10:34.194052-03	1	1	t	\N	\N	\N	\N
2	US 2 P1	Para acceder a sus ventanas y aplicaciones, pulse el botón Actividades, o simplemente lleve el puntero del ratón a la esquina superior izquierda activa. También puede pulsar la tecla Super en su teclado. Puede ver sus ventanas y aplicaciones en la vista de actividades. También puede empezar a escribir para buscar aplicaciones, archivos o carpetas y en la web.	4	1	\N	2020-12-02 21:10:52.869975-03	1	2	t	\N	\N	\N	\N
3	US 3	Pulse en el botón de rejilla en la parte inferior del tablero para mostrar la vista de aplicaciones. Esto le muestra todas las aplicaciones instaladas en su equipo. Pulse en cualquier aplicación para ejecutarla, o arrastre una aplicación a la vista o sobre la miniatura del espacio de trabajo. También puede arrastrar una aplicación al tablero para que sea uno de los favoritos. Sus aplicaciones favoritas permanecerán en el tablero, incluso cuando no estén en funcionamiento, para que pueda acceder a ellas rápidamente.	4	1	\N	2020-12-02 21:11:15.607665-03	1	3	t	\N	\N	\N	\N
4	US 3 P1	El menú de aplicación, situado junto al botón de Actividades, muestra el nombre de la aplicación activa junto con su icono y proporciona un acceso rápido a las ventanas y los detalles de la aplicación, así como a un elemento para salir.	3	1	\N	2020-12-02 21:11:36.541144-03	1	4	t	\N	\N	\N	\N
5	US 4	Reloj, calendario, citas y notificaciones\r\nPulse en el reloj en el centro de la barra superior para ver la fecha actual, un calendario mensual y una lista de sus próximas citas. También puede abrir el calendario pulsando Súper+M. Puede acceder a la configuración de fecha y hora y abrir totalmente su calendario directamente desde el menú.	2	1	\N	2020-12-02 21:11:56.277243-03	1	5	t	\N	\N	\N	\N
6	US 4 P1	Reloj, calendario, citas y notificaciones\r\nPulse en el reloj en el centro de la barra superior para ver la fecha actual, un calendario mensual y una lista de sus próximas citas. También puede abrir el calendario pulsando Súper+M. Puede acceder a la configuración de fecha y hora y abrir totalmente su calendario directamente desde el menú.	2	1	\N	2020-12-02 21:12:09.693459-03	1	5	t	\N	\N	\N	\N
7	US5 P1	Al dejar su equipo, puede bloquear la pantalla para evitar que otras personas lo usen. Puede rápidamente cambiar de usuario sin necesidad de iniciar la sesión completamente para dar a alguien acceso al equipo. O bien, puede suspender o apagar el equipo desde el menú.	1	1	\N	2020-12-02 21:12:29.414729-03	1	6	t	\N	\N	\N	\N
8	US 3  P1	Pulse en el botón de rejilla en la parte inferior del tablero para mostrar la vista de aplicaciones. Esto le muestra todas las aplicaciones instaladas en su equipo. Pulse en cualquier aplicación para ejecutarla, o arrastre una aplicación a la vista o sobre la miniatura del espacio de trabajo. También puede arrastrar una aplicación al tablero para que sea uno de los favoritos. Sus aplicaciones favoritas permanecerán en el tablero, incluso cuando no estén en funcionamiento, para que pueda acceder a ellas rápidamente.	4	1	\N	2020-12-02 21:12:48.911157-03	1	3	t	\N	\N	\N	\N
9	US 6 P1	El menú de aplicación, situado junto al botón de Actividades, muestra el nombre de la aplicación activa junto con su icono y proporciona un acceso rápido a las ventanas y los detalles de la aplicación, así como a un elemento para salir.	3	1	\N	2020-12-02 21:12:59.241535-03	1	4	t	\N	\N	\N	\N
10	US 7 P1	Cuando bloquea su pantalla o se bloquea automáticamente, se muestra la pantalla de bloqueo. Además de proteger su escritorio mientras está ausente de su equipo, la pantalla de bloqueo muestra la fecha y la hora. También muestra información sobre la batería y el estado de la red.	3	1	\N	2020-12-02 21:13:16.267751-03	1	7	t	\N	\N	\N	\N
11	US 8 P1	Cuando bloquea su pantalla o se bloquea automáticamente, se muestra la pantalla de bloqueo. Además de proteger su escritorio mientras está ausente de su equipo, la pantalla de bloqueo muestra la fecha y la hora. También muestra información sobre la batería y el estado de la red.	5	1	\N	2020-12-02 21:13:34.994615-03	1	8	t	\N	\N	\N	\N
12	US 9 P1	Más información\r\nGuía del escritorio de Ubuntu\r\nSu escritorio — Calendario, notificaciones, atajos del teclado, ventanas y áreas de trabajo…	4	1	\N	2020-12-02 21:13:58.466798-03	1	9	t	\N	\N	\N	\N
13	US10 P1	The lock screen means that you can see what is happening while your computer is locked, and it allows you to get a summary of what has been happening while you have been away. The lock screen provides useful information:	2	1	\N	2020-12-02 21:14:18.108502-03	1	10	t	\N	\N	\N	\N
14	US11 P1	To unlock your computer, click once with your mouse or touchpad, or press Esc or Enter. This will reveal the login screen, where you can enter your password to unlock. Alternatively, just start typing your password and the login screen will be automatically shown as you type. You can also switch users at the bottom right of the login screen if your system is configured for more than one.	4	1	\N	2020-12-02 21:14:34.326361-03	1	11	t	\N	\N	\N	\N
15	US 12 P1	Ayuda Guía de escritorio de Ubuntu » Escritorio › Aplicaciones y ventanas »\r\nAyuda Guía de escritorio de Ubuntu » Escritorio › Personalizar su escritorio » Notificaciones y la lista de notificaciones › Ocultar notificaciones en la pantalla de bloqueo »	3	1	\N	2020-12-02 21:14:55.637903-03	1	12	t	\N	\N	\N	\N
16	US 1 P1	La barra superior proporciona acceso a las ventanas y a sus aplicaciones, a su calendario y a sus citas y a las propiedades del sistema como el sonido, la red, y la energía. En el menú de estado en la barra superior, puede cambiar el volumen o el brillo de la pantalla, editar su conexión Inalámbrica, comprobar el estado de la batería, salir o cambiar de usuario, y apagar el equipo.	5	1	\N	2020-12-02 21:18:02.062489-03	5	1	t	\N	60	\N	1
17	US 8 P1	Cuando bloquea su pantalla o se bloquea automáticamente, se muestra la pantalla de bloqueo. Además de proteger su escritorio mientras está ausente de su equipo, la pantalla de bloqueo muestra la fecha y la hora. También muestra información sobre la batería y el estado de la red.	5	1	\N	2020-12-02 21:18:18.17962-03	6	8	t	\N	65	\N	1
48	US5 P1	Al dejar su equipo, puede bloquear la pantalla para evitar que otras personas lo usen. Puede rápidamente cambiar de usuario sin necesidad de iniciar la sesión completamente para dar a alguien acceso al equipo. O bien, puede suspender o apagar el equipo desde el menú.	1	1	\N	2020-12-06 00:58:43.44439-03	6	6	t	\N	30	\N	2
18	US 3  P1	Pulse en el botón de rejilla en la parte inferior del tablero para mostrar la vista de aplicaciones. Esto le muestra todas las aplicaciones instaladas en su equipo. Pulse en cualquier aplicación para ejecutarla, o arrastre una aplicación a la vista o sobre la miniatura del espacio de trabajo. También puede arrastrar una aplicación al tablero para que sea uno de los favoritos. Sus aplicaciones favoritas permanecerán en el tablero, incluso cuando no estén en funcionamiento, para que pueda acceder a ellas rápidamente.	4	1	\N	2020-12-02 21:18:38.674244-03	7	3	t	\N	56	\N	1
19	US 1 P1	La barra superior proporciona acceso a las ventanas y a sus aplicaciones, a su calendario y a sus citas y a las propiedades del sistema como el sonido, la red, y la energía. En el menú de estado en la barra superior, puede cambiar el volumen o el brillo de la pantalla, editar su conexión Inalámbrica, comprobar el estado de la batería, salir o cambiar de usuario, y apagar el equipo.	5	1	58	2021-12-02 21:23:03.199504-03	5	1	t	56	60	\N	1
20	US 3  P1	Pulse en el botón de rejilla en la parte inferior del tablero para mostrar la vista de aplicaciones. Esto le muestra todas las aplicaciones instaladas en su equipo. Pulse en cualquier aplicación para ejecutarla, o arrastre una aplicación a la vista o sobre la miniatura del espacio de trabajo. También puede arrastrar una aplicación al tablero para que sea uno de los favoritos. Sus aplicaciones favoritas permanecerán en el tablero, incluso cuando no estén en funcionamiento, para que pueda acceder a ellas rápidamente.	4	1	52	2021-12-02 21:23:56.668613-03	7	3	t	48	56	\N	1
21	US 3  P1	Pulse en el botón de rejilla en la parte inferior del tablero para mostrar la vista de aplicaciones. Esto le muestra todas las aplicaciones instaladas en su equipo. Pulse en cualquier aplicación para ejecutarla, o arrastre una aplicación a la vista o sobre la miniatura del espacio de trabajo. También puede arrastrar una aplicación al tablero para que sea uno de los favoritos. Sus aplicaciones favoritas permanecerán en el tablero, incluso cuando no estén en funcionamiento, para que pueda acceder a ellas rápidamente.	4	1	52	2021-12-02 21:24:18.323598-03	7	3	t	48	56	\N	1
22	US 8 P1	Cuando bloquea su pantalla o se bloquea automáticamente, se muestra la pantalla de bloqueo. Además de proteger su escritorio mientras está ausente de su equipo, la pantalla de bloqueo muestra la fecha y la hora. También muestra información sobre la batería y el estado de la red.	5	1	62	2021-12-02 21:24:38.685712-03	6	8	t	60	65	\N	1
23	US 9 P1	Más información\r\nGuía del escritorio de Ubuntu\r\nSu escritorio — Calendario, notificaciones, atajos del teclado, ventanas y áreas de trabajo…	4	1	\N	2021-12-02 21:25:43.40582-03	6	9	t	\N	40	\N	1
24	US 9 P1	Más información\r\nGuía del escritorio de Ubuntu\r\nSu escritorio — Calendario, notificaciones, atajos del teclado, ventanas y áreas de trabajo…	4	1	42	2021-12-02 21:26:04.379759-03	6	9	t	45	40	\N	1
25	US 8 P1	Cuando bloquea su pantalla o se bloquea automáticamente, se muestra la pantalla de bloqueo. Además de proteger su escritorio mientras está ausente de su equipo, la pantalla de bloqueo muestra la fecha y la hora. También muestra información sobre la batería y el estado de la red.	5	2	62	2020-12-03 21:44:28.375945-03	6	8	t	60	65	\N	1
26	US 9 P1	Más información\r\nGuía del escritorio de Ubuntu\r\nSu escritorio — Calendario, notificaciones, atajos del teclado, ventanas y áreas de trabajo…	4	2	42	2020-12-03 21:44:31.138719-03	6	9	t	45	40	\N	1
27	US 8 P1	Cuando bloquea su pantalla o se bloquea automáticamente, se muestra la pantalla de bloqueo. Además de proteger su escritorio mientras está ausente de su equipo, la pantalla de bloqueo muestra la fecha y la hora. También muestra información sobre la batería y el estado de la red.	5	3	62	2020-12-04 23:40:30.82289-03	6	8	t	60	65	\N	1
28	US 9 P1	Más información\r\nGuía del escritorio de Ubuntu\r\nSu escritorio — Calendario, notificaciones, atajos del teclado, ventanas y áreas de trabajo…	4	3	42	2020-12-04 23:41:18.846495-03	6	9	t	45	40	\N	1
29	US 8 P1	Cuando bloquea su pantalla o se bloquea automáticamente, se muestra la pantalla de bloqueo. Además de proteger su escritorio mientras está ausente de su equipo, la pantalla de bloqueo muestra la fecha y la hora. También muestra información sobre la batería y el estado de la red.	5	4	62	2021-12-02 23:42:47.571788-03	6	8	t	60	65	\N	1
30	US 9 P1	Más información\r\nGuía del escritorio de Ubuntu\r\nSu escritorio — Calendario, notificaciones, atajos del teclado, ventanas y áreas de trabajo…	4	4	42	2021-12-02 23:42:48.548951-03	6	9	t	45	40	\N	1
31	US 1 P1	La barra superior proporciona acceso a las ventanas y a sus aplicaciones, a su calendario y a sus citas y a las propiedades del sistema como el sonido, la red, y la energía. En el menú de estado en la barra superior, puede cambiar el volumen o el brillo de la pantalla, editar su conexión Inalámbrica, comprobar el estado de la batería, salir o cambiar de usuario, y apagar el equipo.	5	1	58	2021-12-03 00:29:28.034039-03	6	1	t	56	60	\N	1
32	US 3  P1	Pulse en el botón de rejilla en la parte inferior del tablero para mostrar la vista de aplicaciones. Esto le muestra todas las aplicaciones instaladas en su equipo. Pulse en cualquier aplicación para ejecutarla, o arrastre una aplicación a la vista o sobre la miniatura del espacio de trabajo. También puede arrastrar una aplicación al tablero para que sea uno de los favoritos. Sus aplicaciones favoritas permanecerán en el tablero, incluso cuando no estén en funcionamiento, para que pueda acceder a ellas rápidamente.	4	1	52	2021-12-03 00:29:47.478762-03	6	3	t	48	56	\N	1
33	US 1 P1	La barra superior proporciona acceso a las ventanas y a sus aplicaciones, a su calendario y a sus citas y a las propiedades del sistema como el sonido, la red, y la energía. En el menú de estado en la barra superior, puede cambiar el volumen o el brillo de la pantalla, editar su conexión Inalámbrica, comprobar el estado de la batería, salir o cambiar de usuario, y apagar el equipo.	5	2	58	2021-12-03 00:30:28.887761-03	6	1	t	56	60	\N	1
34	US 3  P1	Pulse en el botón de rejilla en la parte inferior del tablero para mostrar la vista de aplicaciones. Esto le muestra todas las aplicaciones instaladas en su equipo. Pulse en cualquier aplicación para ejecutarla, o arrastre una aplicación a la vista o sobre la miniatura del espacio de trabajo. También puede arrastrar una aplicación al tablero para que sea uno de los favoritos. Sus aplicaciones favoritas permanecerán en el tablero, incluso cuando no estén en funcionamiento, para que pueda acceder a ellas rápidamente.	4	2	52	2021-12-03 00:30:31.746809-03	6	3	t	48	56	\N	1
35	US 1 P1	La barra superior proporciona acceso a las ventanas y a sus aplicaciones, a su calendario y a sus citas y a las propiedades del sistema como el sonido, la red, y la energía. En el menú de estado en la barra superior, puede cambiar el volumen o el brillo de la pantalla, editar su conexión Inalámbrica, comprobar el estado de la batería, salir o cambiar de usuario, y apagar el equipo.	5	3	58	2020-12-05 00:33:41.832663-03	6	1	t	56	60	\N	1
36	US 3  P1	Pulse en el botón de rejilla en la parte inferior del tablero para mostrar la vista de aplicaciones. Esto le muestra todas las aplicaciones instaladas en su equipo. Pulse en cualquier aplicación para ejecutarla, o arrastre una aplicación a la vista o sobre la miniatura del espacio de trabajo. También puede arrastrar una aplicación al tablero para que sea uno de los favoritos. Sus aplicaciones favoritas permanecerán en el tablero, incluso cuando no estén en funcionamiento, para que pueda acceder a ellas rápidamente.	4	3	52	2020-12-05 00:34:26.867167-03	6	3	t	48	56	\N	1
37	US 1 P1	La barra superior proporciona acceso a las ventanas y a sus aplicaciones, a su calendario y a sus citas y a las propiedades del sistema como el sonido, la red, y la energía. En el menú de estado en la barra superior, puede cambiar el volumen o el brillo de la pantalla, editar su conexión Inalámbrica, comprobar el estado de la batería, salir o cambiar de usuario, y apagar el equipo.	5	4	58	2021-12-03 00:39:03.612966-03	6	1	t	56	60	\N	1
38	US 3  P1	Pulse en el botón de rejilla en la parte inferior del tablero para mostrar la vista de aplicaciones. Esto le muestra todas las aplicaciones instaladas en su equipo. Pulse en cualquier aplicación para ejecutarla, o arrastre una aplicación a la vista o sobre la miniatura del espacio de trabajo. También puede arrastrar una aplicación al tablero para que sea uno de los favoritos. Sus aplicaciones favoritas permanecerán en el tablero, incluso cuando no estén en funcionamiento, para que pueda acceder a ellas rápidamente.	4	4	52	2021-12-03 00:39:04.632755-03	6	3	t	48	56	\N	1
39	US 2 P1	Para acceder a sus ventanas y aplicaciones, pulse el botón Actividades, o simplemente lleve el puntero del ratón a la esquina superior izquierda activa. También puede pulsar la tecla Super en su teclado. Puede ver sus ventanas y aplicaciones en la vista de actividades. También puede empezar a escribir para buscar aplicaciones, archivos o carpetas y en la web.	4	1	\N	2020-12-06 00:56:46.984995-03	6	2	t	\N	50	\N	2
40	US11 P1	To unlock your computer, click once with your mouse or touchpad, or press Esc or Enter. This will reveal the login screen, where you can enter your password to unlock. Alternatively, just start typing your password and the login screen will be automatically shown as you type. You can also switch users at the bottom right of the login screen if your system is configured for more than one.	4	1	\N	2020-12-06 00:56:58.682941-03	6	11	t	\N	10	\N	2
41	US 2 P1	Para acceder a sus ventanas y aplicaciones, pulse el botón Actividades, o simplemente lleve el puntero del ratón a la esquina superior izquierda activa. También puede pulsar la tecla Super en su teclado. Puede ver sus ventanas y aplicaciones en la vista de actividades. También puede empezar a escribir para buscar aplicaciones, archivos o carpetas y en la web.	4	1	\N	2020-12-06 00:57:09.814291-03	6	2	t	\N	50	\N	2
42	US 12 P1	Ayuda Guía de escritorio de Ubuntu » Escritorio › Aplicaciones y ventanas »\r\nAyuda Guía de escritorio de Ubuntu » Escritorio › Personalizar su escritorio » Notificaciones y la lista de notificaciones › Ocultar notificaciones en la pantalla de bloqueo »	3	1	\N	2020-12-06 00:57:21.136097-03	6	12	t	\N	15	\N	2
43	US 6 P1	El menú de aplicación, situado junto al botón de Actividades, muestra el nombre de la aplicación activa junto con su icono y proporciona un acceso rápido a las ventanas y los detalles de la aplicación, así como a un elemento para salir.	3	1	\N	2020-12-06 00:57:36.7153-03	6	4	t	\N	15	\N	2
44	US 7 P1	Cuando bloquea su pantalla o se bloquea automáticamente, se muestra la pantalla de bloqueo. Además de proteger su escritorio mientras está ausente de su equipo, la pantalla de bloqueo muestra la fecha y la hora. También muestra información sobre la batería y el estado de la red.	3	1	\N	2020-12-06 00:57:50.361475-03	6	7	t	\N	15	\N	2
45	US 4 P1	Reloj, calendario, citas y notificaciones\r\nPulse en el reloj en el centro de la barra superior para ver la fecha actual, un calendario mensual y una lista de sus próximas citas. También puede abrir el calendario pulsando Súper+M. Puede acceder a la configuración de fecha y hora y abrir totalmente su calendario directamente desde el menú.	2	1	\N	2020-12-06 00:58:08.717258-03	6	5	t	\N	15	\N	2
46	US10 P1	The lock screen means that you can see what is happening while your computer is locked, and it allows you to get a summary of what has been happening while you have been away. The lock screen provides useful information:	2	1	\N	2020-12-06 00:58:26.075366-03	6	10	t	\N	20	\N	2
47	US10 P1	The lock screen means that you can see what is happening while your computer is locked, and it allows you to get a summary of what has been happening while you have been away. The lock screen provides useful information:	2	1	\N	2020-12-06 00:58:36.83093-03	6	10	t	\N	20	\N	2
49	US 2 P1	Para acceder a sus ventanas y aplicaciones, pulse el botón Actividades, o simplemente lleve el puntero del ratón a la esquina superior izquierda activa. También puede pulsar la tecla Super en su teclado. Puede ver sus ventanas y aplicaciones en la vista de actividades. También puede empezar a escribir para buscar aplicaciones, archivos o carpetas y en la web.	4	1	50	2021-12-03 00:59:57.422027-03	6	2	t	50	50	\N	2
50	US11 P1	To unlock your computer, click once with your mouse or touchpad, or press Esc or Enter. This will reveal the login screen, where you can enter your password to unlock. Alternatively, just start typing your password and the login screen will be automatically shown as you type. You can also switch users at the bottom right of the login screen if your system is configured for more than one.	4	1	10	2021-12-03 01:00:02.739576-03	6	11	t	10	10	\N	2
51	US 12 P1	Ayuda Guía de escritorio de Ubuntu » Escritorio › Aplicaciones y ventanas »\r\nAyuda Guía de escritorio de Ubuntu » Escritorio › Personalizar su escritorio » Notificaciones y la lista de notificaciones › Ocultar notificaciones en la pantalla de bloqueo »	3	1	15	2021-12-03 01:00:08.363294-03	6	12	t	15	15	\N	2
52	US 6 P1	El menú de aplicación, situado junto al botón de Actividades, muestra el nombre de la aplicación activa junto con su icono y proporciona un acceso rápido a las ventanas y los detalles de la aplicación, así como a un elemento para salir.	3	1	15	2021-12-03 01:00:12.707593-03	6	4	t	16	15	\N	2
53	US 7 P1	Cuando bloquea su pantalla o se bloquea automáticamente, se muestra la pantalla de bloqueo. Además de proteger su escritorio mientras está ausente de su equipo, la pantalla de bloqueo muestra la fecha y la hora. También muestra información sobre la batería y el estado de la red.	3	1	15	2021-12-03 01:00:16.976436-03	6	7	t	16	15	\N	2
54	US 4 P1	Reloj, calendario, citas y notificaciones\r\nPulse en el reloj en el centro de la barra superior para ver la fecha actual, un calendario mensual y una lista de sus próximas citas. También puede abrir el calendario pulsando Súper+M. Puede acceder a la configuración de fecha y hora y abrir totalmente su calendario directamente desde el menú.	2	1	17	2021-12-03 01:00:21.891706-03	6	5	t	20	15	\N	2
55	US10 P1	The lock screen means that you can see what is happening while your computer is locked, and it allows you to get a summary of what has been happening while you have been away. The lock screen provides useful information:	2	1	25	2021-12-03 01:00:26.561759-03	6	10	t	30	20	\N	2
56	US5 P1	Al dejar su equipo, puede bloquear la pantalla para evitar que otras personas lo usen. Puede rápidamente cambiar de usuario sin necesidad de iniciar la sesión completamente para dar a alguien acceso al equipo. O bien, puede suspender o apagar el equipo desde el menú.	1	1	28	2021-12-03 01:00:32.506089-03	6	6	t	27	30	\N	2
57	US 2 P1	Para acceder a sus ventanas y aplicaciones, pulse el botón Actividades, o simplemente lleve el puntero del ratón a la esquina superior izquierda activa. También puede pulsar la tecla Super en su teclado. Puede ver sus ventanas y aplicaciones en la vista de actividades. También puede empezar a escribir para buscar aplicaciones, archivos o carpetas y en la web.	4	2	50	2021-02-07 01:02:13.375223-03	6	2	t	50	50	\N	2
58	US11 P1	To unlock your computer, click once with your mouse or touchpad, or press Esc or Enter. This will reveal the login screen, where you can enter your password to unlock. Alternatively, just start typing your password and the login screen will be automatically shown as you type. You can also switch users at the bottom right of the login screen if your system is configured for more than one.	4	2	10	2021-02-07 01:02:14.43573-03	6	11	t	10	10	\N	2
59	US 6 P1	El menú de aplicación, situado junto al botón de Actividades, muestra el nombre de la aplicación activa junto con su icono y proporciona un acceso rápido a las ventanas y los detalles de la aplicación, así como a un elemento para salir.	3	2	15	2021-02-07 01:02:17.114952-03	6	4	t	16	15	\N	2
60	US 12 P1	Ayuda Guía de escritorio de Ubuntu » Escritorio › Aplicaciones y ventanas »\r\nAyuda Guía de escritorio de Ubuntu » Escritorio › Personalizar su escritorio » Notificaciones y la lista de notificaciones › Ocultar notificaciones en la pantalla de bloqueo »	3	2	15	2021-02-07 01:02:18.113115-03	6	12	t	15	15	\N	2
61	US 4 P1	Reloj, calendario, citas y notificaciones\r\nPulse en el reloj en el centro de la barra superior para ver la fecha actual, un calendario mensual y una lista de sus próximas citas. También puede abrir el calendario pulsando Súper+M. Puede acceder a la configuración de fecha y hora y abrir totalmente su calendario directamente desde el menú.	2	2	17	2021-02-07 01:02:19.177655-03	6	5	t	20	15	\N	2
62	US10 P1	The lock screen means that you can see what is happening while your computer is locked, and it allows you to get a summary of what has been happening while you have been away. The lock screen provides useful information:	2	2	25	2021-02-07 01:02:20.400796-03	6	10	t	30	20	\N	2
63	US5 P1	Al dejar su equipo, puede bloquear la pantalla para evitar que otras personas lo usen. Puede rápidamente cambiar de usuario sin necesidad de iniciar la sesión completamente para dar a alguien acceso al equipo. O bien, puede suspender o apagar el equipo desde el menú.	1	2	28	2021-02-07 01:02:22.078877-03	6	6	t	27	30	\N	2
64	US 7 P1	Cuando bloquea su pantalla o se bloquea automáticamente, se muestra la pantalla de bloqueo. Además de proteger su escritorio mientras está ausente de su equipo, la pantalla de bloqueo muestra la fecha y la hora. También muestra información sobre la batería y el estado de la red.	3	2	15	2021-02-07 01:02:23.664147-03	6	7	t	16	15	\N	2
65	US 12 P1	Ayuda Guía de escritorio de Ubuntu » Escritorio › Aplicaciones y ventanas »\r\nAyuda Guía de escritorio de Ubuntu » Escritorio › Personalizar su escritorio » Notificaciones y la lista de notificaciones › Ocultar notificaciones en la pantalla de bloqueo »	3	3	15	2021-02-07 01:02:27.275437-03	6	12	t	15	15	\N	2
66	US11 P1	To unlock your computer, click once with your mouse or touchpad, or press Esc or Enter. This will reveal the login screen, where you can enter your password to unlock. Alternatively, just start typing your password and the login screen will be automatically shown as you type. You can also switch users at the bottom right of the login screen if your system is configured for more than one.	4	3	10	2021-02-07 01:02:28.298901-03	6	11	t	10	10	\N	2
67	US 2 P1	Para acceder a sus ventanas y aplicaciones, pulse el botón Actividades, o simplemente lleve el puntero del ratón a la esquina superior izquierda activa. También puede pulsar la tecla Super en su teclado. Puede ver sus ventanas y aplicaciones en la vista de actividades. También puede empezar a escribir para buscar aplicaciones, archivos o carpetas y en la web.	4	3	50	2021-02-07 01:02:29.567728-03	6	2	t	50	50	\N	2
68	US 7 P1	Cuando bloquea su pantalla o se bloquea automáticamente, se muestra la pantalla de bloqueo. Además de proteger su escritorio mientras está ausente de su equipo, la pantalla de bloqueo muestra la fecha y la hora. También muestra información sobre la batería y el estado de la red.	3	3	15	2021-02-07 01:02:30.373636-03	6	7	t	16	15	\N	2
69	US11 P1	To unlock your computer, click once with your mouse or touchpad, or press Esc or Enter. This will reveal the login screen, where you can enter your password to unlock. Alternatively, just start typing your password and the login screen will be automatically shown as you type. You can also switch users at the bottom right of the login screen if your system is configured for more than one.	4	3	10	2021-02-07 01:02:31.418872-03	6	11	t	10	10	\N	2
70	US 6 P1	El menú de aplicación, situado junto al botón de Actividades, muestra el nombre de la aplicación activa junto con su icono y proporciona un acceso rápido a las ventanas y los detalles de la aplicación, así como a un elemento para salir.	3	3	15	2021-02-07 01:02:32.058251-03	6	4	t	16	15	\N	2
71	US10 P1	The lock screen means that you can see what is happening while your computer is locked, and it allows you to get a summary of what has been happening while you have been away. The lock screen provides useful information:	2	3	25	2021-02-07 01:02:33.608768-03	6	10	t	30	20	\N	2
72	US10 P1	The lock screen means that you can see what is happening while your computer is locked, and it allows you to get a summary of what has been happening while you have been away. The lock screen provides useful information:	2	3	25	2021-02-07 01:02:35.294662-03	6	10	t	30	20	\N	2
73	US5 P1	Al dejar su equipo, puede bloquear la pantalla para evitar que otras personas lo usen. Puede rápidamente cambiar de usuario sin necesidad de iniciar la sesión completamente para dar a alguien acceso al equipo. O bien, puede suspender o apagar el equipo desde el menú.	1	3	28	2021-02-07 01:02:36.386304-03	6	6	t	27	30	\N	2
74	US 4 P1	Reloj, calendario, citas y notificaciones\r\nPulse en el reloj en el centro de la barra superior para ver la fecha actual, un calendario mensual y una lista de sus próximas citas. También puede abrir el calendario pulsando Súper+M. Puede acceder a la configuración de fecha y hora y abrir totalmente su calendario directamente desde el menú.	2	3	17	2021-02-07 01:02:37.660539-03	6	5	t	20	15	\N	2
75	US 4 P1	Reloj, calendario, citas y notificaciones\r\nPulse en el reloj en el centro de la barra superior para ver la fecha actual, un calendario mensual y una lista de sus próximas citas. También puede abrir el calendario pulsando Súper+M. Puede acceder a la configuración de fecha y hora y abrir totalmente su calendario directamente desde el menú.	2	3	17	2021-02-07 01:02:39.616651-03	6	5	t	20	15	\N	2
76	US 2 P1	Para acceder a sus ventanas y aplicaciones, pulse el botón Actividades, o simplemente lleve el puntero del ratón a la esquina superior izquierda activa. También puede pulsar la tecla Super en su teclado. Puede ver sus ventanas y aplicaciones en la vista de actividades. También puede empezar a escribir para buscar aplicaciones, archivos o carpetas y en la web.	4	4	50	2021-12-03 01:03:56.396697-03	6	2	t	50	50	\N	2
77	US 12 P1	Ayuda Guía de escritorio de Ubuntu » Escritorio › Aplicaciones y ventanas »\r\nAyuda Guía de escritorio de Ubuntu » Escritorio › Personalizar su escritorio » Notificaciones y la lista de notificaciones › Ocultar notificaciones en la pantalla de bloqueo »	3	4	15	2021-12-03 01:03:57.424864-03	6	12	t	15	15	\N	2
78	US 6 P1	El menú de aplicación, situado junto al botón de Actividades, muestra el nombre de la aplicación activa junto con su icono y proporciona un acceso rápido a las ventanas y los detalles de la aplicación, así como a un elemento para salir.	3	4	15	2021-12-03 01:03:58.732805-03	6	4	t	16	15	\N	2
79	US 7 P1	Cuando bloquea su pantalla o se bloquea automáticamente, se muestra la pantalla de bloqueo. Además de proteger su escritorio mientras está ausente de su equipo, la pantalla de bloqueo muestra la fecha y la hora. También muestra información sobre la batería y el estado de la red.	3	4	15	2021-12-03 01:03:59.830864-03	6	7	t	16	15	\N	2
80	US11 P1	To unlock your computer, click once with your mouse or touchpad, or press Esc or Enter. This will reveal the login screen, where you can enter your password to unlock. Alternatively, just start typing your password and the login screen will be automatically shown as you type. You can also switch users at the bottom right of the login screen if your system is configured for more than one.	4	4	10	2021-12-03 01:04:02.635513-03	6	11	t	10	10	\N	2
81	US 4 P1	Reloj, calendario, citas y notificaciones\r\nPulse en el reloj en el centro de la barra superior para ver la fecha actual, un calendario mensual y una lista de sus próximas citas. También puede abrir el calendario pulsando Súper+M. Puede acceder a la configuración de fecha y hora y abrir totalmente su calendario directamente desde el menú.	2	4	17	2021-12-03 01:04:07.800213-03	6	5	t	20	15	\N	2
82	US5 P1	Al dejar su equipo, puede bloquear la pantalla para evitar que otras personas lo usen. Puede rápidamente cambiar de usuario sin necesidad de iniciar la sesión completamente para dar a alguien acceso al equipo. O bien, puede suspender o apagar el equipo desde el menú.	1	4	28	2021-12-03 01:04:09.083333-03	6	6	t	27	30	\N	2
83	US10 P1	The lock screen means that you can see what is happening while your computer is locked, and it allows you to get a summary of what has been happening while you have been away. The lock screen provides useful information:	2	4	25	2021-12-03 01:04:10.870705-03	6	10	t	30	20	\N	2
84	Crear Vistas	Definir vistas de los diferentes modulos	4	1	\N	2021-01-03 01:38:10.781428-03	2	13	t	\N	\N	\N	\N
85	Testear Vistas	Correr test de los views	2	1	\N	2021-01-03 01:38:45.537146-03	2	14	t	\N	\N	\N	\N
86	Realizar Templates	Trabajo en html	3	1	\N	2021-01-03 01:45:15.899015-03	2	15	t	\N	\N	\N	\N
87	Realizar script	Realizar script de poblacion	4	1	\N	2021-01-03 01:53:19.564452-03	2	16	t	\N	\N	\N	\N
88	Probar templates	Gestion de botones y permisos	2	1	\N	2021-01-03 01:55:26.089854-03	2	17	t	\N	\N	\N	\N
89	Crear Vistas	Definir vistas de los diferentes modulos	4	1	\N	2021-01-03 01:59:14.818467-03	10	13	t	\N	12	\N	3
90	Realizar Templates	Trabajo en html	3	1	\N	2021-01-03 01:59:31.815994-03	10	15	t	\N	20	\N	3
91	Realizar Templates	Trabajo en html	3	1	\N	2021-01-03 01:59:32.055633-03	10	15	t	\N	20	\N	3
92	Probar templates	Gestion de botones y permisos	2	1	\N	2021-01-03 01:59:45.332572-03	10	17	t	\N	15	\N	3
93	Crear Vistas	Definir vistas de los diferentes modulos	4	1	16	2021-12-03 02:01:35.700156-03	10	13	t	20	12	\N	3
94	Realizar Templates	Trabajo en html	3	1	20	2021-12-03 02:01:44.78617-03	10	15	t	20	20	\N	3
95	Probar templates	Gestion de botones y permisos	2	1	20	2021-12-03 02:01:56.892406-03	10	17	t	25	15	\N	3
96	Probar templates	Gestion de botones y permisos	2	2	20	2021-01-03 06:04:24.085902-03	10	17	t	25	15	\N	3
97	Crear Vistas	Definir vistas de los diferentes modulos	4	2	16	2021-01-03 06:12:43.795897-03	10	13	t	20	12	\N	3
98	Realizar Templates	Trabajo en html	3	2	20	2021-12-03 02:48:10.155115-03	10	15	t	20	20	\N	3
99	Crear Vistas	Definir vistas de los diferentes modulos	4	3	16	2021-12-03 02:49:24.655675-03	10	13	t	20	12	\N	3
100	Realizar Templates	Trabajo en html	3	3	20	2021-12-03 02:49:25.386674-03	10	15	t	20	20	\N	3
101	Probar templates	Gestion de botones y permisos	2	3	20	2021-12-03 02:49:26.618233-03	10	17	t	25	15	\N	3
102	Crear Vistas	Definir vistas de los diferentes modulos	4	4	16	2021-12-03 02:50:37.223339-03	10	13	t	20	12	\N	3
103	Realizar Templates	Trabajo en html	3	4	20	2021-12-03 02:50:38.452501-03	10	15	t	20	20	\N	3
104	Probar templates	Gestion de botones y permisos	2	4	20	2021-12-03 02:50:40.093668-03	10	17	t	25	15	\N	3
105	Poblar bases de datos	Crear modelos de bases de datos con datos previos	3	1	\N	2021-12-03 09:31:39.630128-03	2	18	t	\N	\N	\N	\N
106	Realizar script	Realizar scripts de entornos, pruebas, documentacion	4	1	\N	2021-12-03 09:39:47.3317-03	2	16	t	\N	\N	\N	\N
107	Testear Modelos	Test de models	1	1	\N	2021-12-03 10:26:14.119412-03	2	19	t	\N	\N	\N	\N
108	Realizar script	Realizar scripts de entornos, pruebas, documentacion	4	1	\N	2021-12-03 10:28:48.813889-03	10	16	t	\N	12	\N	4
109	Testear Vistas	Correr test de los views	2	1	\N	2021-12-03 10:29:13.409212-03	9	14	t	\N	20	\N	4
110	Testear Modelos	Test de models	1	1	\N	2021-12-03 10:29:31.942162-03	10	19	t	\N	16	\N	4
111	Testear Vistas	Correr test de los views	2	1	20	2021-12-03 10:30:59.646559-03	9	14	t	20	20	\N	4
112	Realizar script	Realizar scripts de entornos, pruebas, documentacion	4	1	14	2021-12-03 10:32:32.678186-03	10	16	t	16	12	\N	4
113	Testear Modelos	Test de models	1	1	15	2021-12-03 10:32:42.015948-03	10	19	t	14	16	\N	4
114	Testear Vistas	Correr test de los views	2	2	20	2021-01-18 10:45:52.663106-03	9	14	t	20	20	\N	4
\.


--
-- Data for Name: usuario_usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuario_usuario (id, password, last_login, is_superuser, first_name, last_name, is_active, date_joined, username, names, lastname, ci, email, fecha_nac, fecha_created, fecha_deleted, usuario_activo, usuario_administrador, image, rol_id) FROM stdin;
1	pbkdf2_sha256$260000$BYPS7drSPuJNgrnWcDrxc9$K8ior06rwRKv/11fJVjC6Axx5aSbAsbNNAFpnWsC1aQ=	2021-12-02 20:52:33.656922-03	t			t	2021-12-02 20:39:02.015411-03	Admin	\N	\N	\N	admin@admin.com	\N	\N	\N	t	t		\N
5	!RaLUnPdn2ts9MN4RfQNSUZmBdyZuITmaFed3W4Dk	2021-12-02 21:24:05.735545-03	f	Usuario	Prueba	t	2021-12-02 20:48:56.361921-03	usuario4	\N	\N	\N	userprue2@gmail.com	\N	\N	\N	t	f		\N
4	!TMQLYmKwNWkS6WZuYmg31zzDXEq01PONn8x3pj7N	2021-12-03 01:26:23.972901-03	f	Usuario	Prueba	t	2021-12-02 20:48:26.60719-03	usuario	\N	\N	\N	userprue1@gmail.com	\N	\N	\N	t	f		\N
2	!5jt1FxaOL314aPMGOrSjIMDpZ1ml7vlD9fZlvn9b	2021-12-03 10:31:14.001103-03	f	User Prueba 1	IS2	t	2021-12-02 20:43:55.033008-03	user_prueba_1	\N	\N	\N	userprueba1is2@gmail.com	\N	\N	\N	t	f		\N
6	!rZlQltK4lWT5BJq7LlcnXVt2PxSr07JAAAIYiZk4	2021-12-03 10:32:51.717718-03	f	Gestor_equipo09	is2	t	2021-12-02 20:52:21.022459-03	gestor_equipo09	\N	\N	\N	gerenciaequipo09@gmail.com	\N	\N	\N	t	f		1
3	!iPKYIulObhKgpEWQl8XGbj5cjmvVNjpGgindJMg4	2021-12-03 10:44:01.514277-03	f	User Prueba 2	IS2	t	2021-12-02 20:44:01.376153-03	user_prueba_2	\N	\N	\N	userprueba2is2@gmail.com	\N	\N	\N	t	f		\N
\.


--
-- Data for Name: usuario_usuario_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuario_usuario_groups (id, usuario_id, group_id) FROM stdin;
\.


--
-- Data for Name: usuario_usuario_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuario_usuario_user_permissions (id, usuario_id, permission_id) FROM stdin;
\.


--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.account_emailaddress_id_seq', 5, true);


--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.account_emailconfirmation_id_seq', 1, false);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 117, true);


--
-- Name: comentarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comentarios_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 27, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 57, true);


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_site_id_seq', 4, true);


--
-- Name: equipo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.equipo_id_seq', 4, true);


--
-- Name: equipo_miembros_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.equipo_miembros_id_seq', 7, true);


--
-- Name: etiqueta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.etiqueta_id_seq', 1, false);


--
-- Name: historial_tarea_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.historial_tarea_id_seq', 34, true);


--
-- Name: miembros_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.miembros_id_seq', 21, true);


--
-- Name: principalApp_holidaytime_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."principalApp_holidaytime_id_seq"', 1, false);


--
-- Name: project_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.project_id_seq', 4, true);


--
-- Name: rol_proyecto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rol_proyecto_id_seq', 16, true);


--
-- Name: rol_proyecto_permisos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rol_proyecto_permisos_id_seq', 428, true);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_id_seq', 1, true);


--
-- Name: roles_permisos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_permisos_id_seq', 10, true);


--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.socialaccount_socialaccount_id_seq', 5, true);


--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.socialaccount_socialapp_id_seq', 1, true);


--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.socialaccount_socialapp_sites_id_seq', 1, true);


--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.socialaccount_socialtoken_id_seq', 5, true);


--
-- Name: sprint_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sprint_id_seq', 4, true);


--
-- Name: sprint_us_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sprint_us_id_seq', 18, true);


--
-- Name: sprintplanning_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sprintplanning_id_seq', 4, true);


--
-- Name: tarea_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tarea_id_seq', 30, true);


--
-- Name: us_historialcomentarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.us_historialcomentarios_id_seq', 1, false);


--
-- Name: us_historialus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.us_historialus_id_seq', 114, true);


--
-- Name: us_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.us_id_seq', 19, true);


--
-- Name: usuario_usuario_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuario_usuario_groups_id_seq', 1, false);


--
-- Name: usuario_usuario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuario_usuario_id_seq', 6, true);


--
-- Name: usuario_usuario_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuario_usuario_user_permissions_id_seq', 1, false);


--
-- Name: account_emailaddress account_emailaddress_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_email_key UNIQUE (email);


--
-- Name: account_emailaddress account_emailaddress_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_pkey PRIMARY KEY (id);


--
-- Name: account_emailconfirmation account_emailconfirmation_key_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_key_key UNIQUE (key);


--
-- Name: account_emailconfirmation account_emailconfirmation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: comentarios comentarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comentarios
    ADD CONSTRAINT comentarios_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site django_site_domain_a2e37b91_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_domain_a2e37b91_uniq UNIQUE (domain);


--
-- Name: django_site django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: equipo_miembros equipo_miembros_equipo_id_miembro_id_f86ad09f_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.equipo_miembros
    ADD CONSTRAINT equipo_miembros_equipo_id_miembro_id_f86ad09f_uniq UNIQUE (equipo_id, miembro_id);


--
-- Name: equipo_miembros equipo_miembros_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.equipo_miembros
    ADD CONSTRAINT equipo_miembros_pkey PRIMARY KEY (id);


--
-- Name: equipo equipo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.equipo
    ADD CONSTRAINT equipo_pkey PRIMARY KEY (id);


--
-- Name: etiqueta etiqueta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.etiqueta
    ADD CONSTRAINT etiqueta_pkey PRIMARY KEY (id);


--
-- Name: historial_tarea historial_tarea_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historial_tarea
    ADD CONSTRAINT historial_tarea_pkey PRIMARY KEY (id);


--
-- Name: miembros miembros_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.miembros
    ADD CONSTRAINT miembros_pkey PRIMARY KEY (id);


--
-- Name: principalApp_holidaytime principalApp_holidaytime_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."principalApp_holidaytime"
    ADD CONSTRAINT "principalApp_holidaytime_pkey" PRIMARY KEY (id);


--
-- Name: project project_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.project
    ADD CONSTRAINT project_name_key UNIQUE (name);


--
-- Name: project project_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.project
    ADD CONSTRAINT project_pkey PRIMARY KEY (id);


--
-- Name: rol_proyecto_permisos rol_proyecto_permisos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rol_proyecto_permisos
    ADD CONSTRAINT rol_proyecto_permisos_pkey PRIMARY KEY (id);


--
-- Name: rol_proyecto_permisos rol_proyecto_permisos_rolproyecto_id_permissio_90686c24_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rol_proyecto_permisos
    ADD CONSTRAINT rol_proyecto_permisos_rolproyecto_id_permissio_90686c24_uniq UNIQUE (rolproyecto_id, permission_id);


--
-- Name: rol_proyecto rol_proyecto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rol_proyecto
    ADD CONSTRAINT rol_proyecto_pkey PRIMARY KEY (id);


--
-- Name: roles_permisos roles_permisos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles_permisos
    ADD CONSTRAINT roles_permisos_pkey PRIMARY KEY (id);


--
-- Name: roles_permisos roles_permisos_rol_id_permission_id_6f5c9ebf_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles_permisos
    ADD CONSTRAINT roles_permisos_rol_id_permission_id_6f5c9ebf_uniq UNIQUE (rol_id, permission_id);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: roles roles_rol_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_rol_key UNIQUE (rol);


--
-- Name: socialaccount_socialaccount socialaccount_socialaccount_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialaccount socialaccount_socialaccount_provider_uid_fc810c6e_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_provider_uid_fc810c6e_uniq UNIQUE (provider, uid);


--
-- Name: socialaccount_socialapp_sites socialaccount_socialapp__socialapp_id_site_id_71a9a768_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_socialapp__socialapp_id_site_id_71a9a768_uniq UNIQUE (socialapp_id, site_id);


--
-- Name: socialaccount_socialapp socialaccount_socialapp_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialapp
    ADD CONSTRAINT socialaccount_socialapp_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialapp_sites socialaccount_socialapp_sites_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_socialapp_sites_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialtoken socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq UNIQUE (app_id, account_id);


--
-- Name: socialaccount_socialtoken socialaccount_socialtoken_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_socialtoken_pkey PRIMARY KEY (id);


--
-- Name: sprint sprint_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sprint
    ADD CONSTRAINT sprint_pkey PRIMARY KEY (id);


--
-- Name: sprint_us sprint_us_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sprint_us
    ADD CONSTRAINT sprint_us_pkey PRIMARY KEY (id);


--
-- Name: sprint_us sprint_us_sprint_id_us_id_86cb7bb3_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sprint_us
    ADD CONSTRAINT sprint_us_sprint_id_us_id_86cb7bb3_uniq UNIQUE (sprint_id, us_id);


--
-- Name: sprintplanning sprintplanning_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sprintplanning
    ADD CONSTRAINT sprintplanning_pkey PRIMARY KEY (id);


--
-- Name: tarea tarea_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tarea
    ADD CONSTRAINT tarea_pkey PRIMARY KEY (id);


--
-- Name: us_historialcomentarios us_historialcomentarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.us_historialcomentarios
    ADD CONSTRAINT us_historialcomentarios_pkey PRIMARY KEY (id);


--
-- Name: us_historialus us_historialus_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.us_historialus
    ADD CONSTRAINT us_historialus_pkey PRIMARY KEY (id);


--
-- Name: us us_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.us
    ADD CONSTRAINT us_pkey PRIMARY KEY (id);


--
-- Name: usuario_usuario usuario_usuario_ci_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario_usuario
    ADD CONSTRAINT usuario_usuario_ci_key UNIQUE (ci);


--
-- Name: usuario_usuario usuario_usuario_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario_usuario
    ADD CONSTRAINT usuario_usuario_email_key UNIQUE (email);


--
-- Name: usuario_usuario_groups usuario_usuario_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario_usuario_groups
    ADD CONSTRAINT usuario_usuario_groups_pkey PRIMARY KEY (id);


--
-- Name: usuario_usuario_groups usuario_usuario_groups_usuario_id_group_id_a4cfb0b8_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario_usuario_groups
    ADD CONSTRAINT usuario_usuario_groups_usuario_id_group_id_a4cfb0b8_uniq UNIQUE (usuario_id, group_id);


--
-- Name: usuario_usuario usuario_usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario_usuario
    ADD CONSTRAINT usuario_usuario_pkey PRIMARY KEY (id);


--
-- Name: usuario_usuario_user_permissions usuario_usuario_user_per_usuario_id_permission_id_c0a85055_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario_usuario_user_permissions
    ADD CONSTRAINT usuario_usuario_user_per_usuario_id_permission_id_c0a85055_uniq UNIQUE (usuario_id, permission_id);


--
-- Name: usuario_usuario_user_permissions usuario_usuario_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario_usuario_user_permissions
    ADD CONSTRAINT usuario_usuario_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: usuario_usuario usuario_usuario_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario_usuario
    ADD CONSTRAINT usuario_usuario_username_key UNIQUE (username);


--
-- Name: account_emailaddress_email_03be32b2_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX account_emailaddress_email_03be32b2_like ON public.account_emailaddress USING btree (email varchar_pattern_ops);


--
-- Name: account_emailaddress_user_id_2c513194; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX account_emailaddress_user_id_2c513194 ON public.account_emailaddress USING btree (user_id);


--
-- Name: account_emailconfirmation_email_address_id_5b7f8c58; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX account_emailconfirmation_email_address_id_5b7f8c58 ON public.account_emailconfirmation USING btree (email_address_id);


--
-- Name: account_emailconfirmation_key_f43612bd_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX account_emailconfirmation_key_f43612bd_like ON public.account_emailconfirmation USING btree (key varchar_pattern_ops);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: comentarios_creador_id_3bc5484d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX comentarios_creador_id_3bc5484d ON public.comentarios USING btree (creador_id);


--
-- Name: comentarios_project_id_7c5de1ba; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX comentarios_project_id_7c5de1ba ON public.comentarios USING btree (project_id);


--
-- Name: comentarios_us_id_6cb48bef; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX comentarios_us_id_6cb48bef ON public.comentarios USING btree (us_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: django_site_domain_a2e37b91_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_site_domain_a2e37b91_like ON public.django_site USING btree (domain varchar_pattern_ops);


--
-- Name: equipo_miembros_equipo_id_60b2fd47; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX equipo_miembros_equipo_id_60b2fd47 ON public.equipo_miembros USING btree (equipo_id);


--
-- Name: equipo_miembros_miembro_id_346261fc; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX equipo_miembros_miembro_id_346261fc ON public.equipo_miembros USING btree (miembro_id);


--
-- Name: equipo_sprint_id_cab7087a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX equipo_sprint_id_cab7087a ON public.equipo USING btree (sprint_id);


--
-- Name: etiqueta_proyecto_id_b1406cc9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX etiqueta_proyecto_id_b1406cc9 ON public.etiqueta USING btree (proyecto_id);


--
-- Name: etiqueta_user_id_b1e0b21a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX etiqueta_user_id_b1e0b21a ON public.etiqueta USING btree (user_id);


--
-- Name: historial_tarea_sprimt_id_927a8cdc; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX historial_tarea_sprimt_id_927a8cdc ON public.historial_tarea USING btree (sprimt_id);


--
-- Name: historial_tarea_tarea_id_1d22de24; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX historial_tarea_tarea_id_1d22de24 ON public.historial_tarea USING btree (tarea_id);


--
-- Name: miembros_rol_id_863e4832; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX miembros_rol_id_863e4832 ON public.miembros USING btree (rol_id);


--
-- Name: miembros_user_id_6dcd0150; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX miembros_user_id_6dcd0150 ON public.miembros USING btree (user_id);


--
-- Name: project_creator_id_e70918ae; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX project_creator_id_e70918ae ON public.project USING btree (creator_id);


--
-- Name: project_name_0c79925e_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX project_name_0c79925e_like ON public.project USING btree (name varchar_pattern_ops);


--
-- Name: rol_proyecto_permisos_permission_id_6297be67; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX rol_proyecto_permisos_permission_id_6297be67 ON public.rol_proyecto_permisos USING btree (permission_id);


--
-- Name: rol_proyecto_permisos_rolproyecto_id_b1c05880; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX rol_proyecto_permisos_rolproyecto_id_b1c05880 ON public.rol_proyecto_permisos USING btree (rolproyecto_id);


--
-- Name: rol_proyecto_project_id_0dda0c3b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX rol_proyecto_project_id_0dda0c3b ON public.rol_proyecto USING btree (project_id);


--
-- Name: roles_permisos_permission_id_32bc9271; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX roles_permisos_permission_id_32bc9271 ON public.roles_permisos USING btree (permission_id);


--
-- Name: roles_permisos_rol_id_5daf3c70; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX roles_permisos_rol_id_5daf3c70 ON public.roles_permisos USING btree (rol_id);


--
-- Name: roles_rol_079a694b_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX roles_rol_079a694b_like ON public.roles USING btree (rol varchar_pattern_ops);


--
-- Name: socialaccount_socialaccount_user_id_8146e70c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX socialaccount_socialaccount_user_id_8146e70c ON public.socialaccount_socialaccount USING btree (user_id);


--
-- Name: socialaccount_socialapp_sites_site_id_2579dee5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX socialaccount_socialapp_sites_site_id_2579dee5 ON public.socialaccount_socialapp_sites USING btree (site_id);


--
-- Name: socialaccount_socialapp_sites_socialapp_id_97fb6e7d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX socialaccount_socialapp_sites_socialapp_id_97fb6e7d ON public.socialaccount_socialapp_sites USING btree (socialapp_id);


--
-- Name: socialaccount_socialtoken_account_id_951f210e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX socialaccount_socialtoken_account_id_951f210e ON public.socialaccount_socialtoken USING btree (account_id);


--
-- Name: socialaccount_socialtoken_app_id_636a42d7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX socialaccount_socialtoken_app_id_636a42d7 ON public.socialaccount_socialtoken USING btree (app_id);


--
-- Name: sprint_proyecto_id_e22addde; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sprint_proyecto_id_e22addde ON public.sprint USING btree (proyecto_id);


--
-- Name: sprint_us_sprint_id_50f321b4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sprint_us_sprint_id_50f321b4 ON public.sprint_us USING btree (sprint_id);


--
-- Name: sprint_us_us_id_ef20b30c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sprint_us_us_id_ef20b30c ON public.sprint_us USING btree (us_id);


--
-- Name: sprintplanning_sprint_id_df8c8129; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sprintplanning_sprint_id_df8c8129 ON public.sprintplanning USING btree (sprint_id);


--
-- Name: tarea_sprimt_id_0d6e9d9f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tarea_sprimt_id_0d6e9d9f ON public.tarea USING btree (sprimt_id);


--
-- Name: tarea_ustory_id_241ae66d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tarea_ustory_id_241ae66d ON public.tarea USING btree (ustory_id);


--
-- Name: us_etiqueta_id_34d426e8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX us_etiqueta_id_34d426e8 ON public.us USING btree (etiqueta_id);


--
-- Name: us_historialcomentarios_comentario_id_b0a844d3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX us_historialcomentarios_comentario_id_b0a844d3 ON public.us_historialcomentarios USING btree (comentario_id);


--
-- Name: us_historialcomentarios_creador_id_3cbf96f0; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX us_historialcomentarios_creador_id_3cbf96f0 ON public.us_historialcomentarios USING btree (creador_id);


--
-- Name: us_historialcomentarios_us_id_6350b015; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX us_historialcomentarios_us_id_6350b015 ON public.us_historialcomentarios USING btree (us_id);


--
-- Name: us_historialus_etiqueta_id_d3c765ea; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX us_historialus_etiqueta_id_d3c765ea ON public.us_historialus USING btree (etiqueta_id);


--
-- Name: us_historialus_sprint_id_69006543; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX us_historialus_sprint_id_69006543 ON public.us_historialus USING btree (sprint_id);


--
-- Name: us_historialus_user_id_31434e45; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX us_historialus_user_id_31434e45 ON public.us_historialus USING btree (user_id);


--
-- Name: us_historialus_ustory_id_8a035044; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX us_historialus_ustory_id_8a035044 ON public.us_historialus USING btree (ustory_id);


--
-- Name: us_project_id_2bb655fc; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX us_project_id_2bb655fc ON public.us USING btree (project_id);


--
-- Name: us_user_id_fc569683; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX us_user_id_fc569683 ON public.us USING btree (user_id);


--
-- Name: usuario_usuario_ci_d7ef3c04_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX usuario_usuario_ci_d7ef3c04_like ON public.usuario_usuario USING btree (ci varchar_pattern_ops);


--
-- Name: usuario_usuario_email_a8fcd603_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX usuario_usuario_email_a8fcd603_like ON public.usuario_usuario USING btree (email varchar_pattern_ops);


--
-- Name: usuario_usuario_groups_group_id_b9c090f8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX usuario_usuario_groups_group_id_b9c090f8 ON public.usuario_usuario_groups USING btree (group_id);


--
-- Name: usuario_usuario_groups_usuario_id_62de76a1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX usuario_usuario_groups_usuario_id_62de76a1 ON public.usuario_usuario_groups USING btree (usuario_id);


--
-- Name: usuario_usuario_rol_id_3abe68b9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX usuario_usuario_rol_id_3abe68b9 ON public.usuario_usuario USING btree (rol_id);


--
-- Name: usuario_usuario_user_permissions_permission_id_5cad0a4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX usuario_usuario_user_permissions_permission_id_5cad0a4b ON public.usuario_usuario_user_permissions USING btree (permission_id);


--
-- Name: usuario_usuario_user_permissions_usuario_id_5969a193; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX usuario_usuario_user_permissions_usuario_id_5969a193 ON public.usuario_usuario_user_permissions USING btree (usuario_id);


--
-- Name: usuario_usuario_username_9e5f6fb3_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX usuario_usuario_username_9e5f6fb3_like ON public.usuario_usuario USING btree (username varchar_pattern_ops);


--
-- Name: account_emailaddress account_emailaddress_user_id_2c513194_fk_usuario_usuario_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_user_id_2c513194_fk_usuario_usuario_id FOREIGN KEY (user_id) REFERENCES public.usuario_usuario(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_emailconfirmation account_emailconfirmation_email_address_id_5b7f8c58_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_email_address_id_5b7f8c58_fk FOREIGN KEY (email_address_id) REFERENCES public.account_emailaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: comentarios comentarios_creador_id_3bc5484d_fk_usuario_usuario_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comentarios
    ADD CONSTRAINT comentarios_creador_id_3bc5484d_fk_usuario_usuario_id FOREIGN KEY (creador_id) REFERENCES public.usuario_usuario(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: comentarios comentarios_project_id_7c5de1ba_fk_project_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comentarios
    ADD CONSTRAINT comentarios_project_id_7c5de1ba_fk_project_id FOREIGN KEY (project_id) REFERENCES public.project(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: comentarios comentarios_us_id_6cb48bef_fk_us_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comentarios
    ADD CONSTRAINT comentarios_us_id_6cb48bef_fk_us_id FOREIGN KEY (us_id) REFERENCES public.us(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_usuario_usuario_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_usuario_usuario_id FOREIGN KEY (user_id) REFERENCES public.usuario_usuario(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: equipo_miembros equipo_miembros_equipo_id_60b2fd47_fk_equipo_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.equipo_miembros
    ADD CONSTRAINT equipo_miembros_equipo_id_60b2fd47_fk_equipo_id FOREIGN KEY (equipo_id) REFERENCES public.equipo(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: equipo_miembros equipo_miembros_miembro_id_346261fc_fk_miembros_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.equipo_miembros
    ADD CONSTRAINT equipo_miembros_miembro_id_346261fc_fk_miembros_id FOREIGN KEY (miembro_id) REFERENCES public.miembros(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: equipo equipo_sprint_id_cab7087a_fk_sprint_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.equipo
    ADD CONSTRAINT equipo_sprint_id_cab7087a_fk_sprint_id FOREIGN KEY (sprint_id) REFERENCES public.sprint(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: etiqueta etiqueta_proyecto_id_b1406cc9_fk_project_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.etiqueta
    ADD CONSTRAINT etiqueta_proyecto_id_b1406cc9_fk_project_id FOREIGN KEY (proyecto_id) REFERENCES public.project(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: etiqueta etiqueta_user_id_b1e0b21a_fk_usuario_usuario_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.etiqueta
    ADD CONSTRAINT etiqueta_user_id_b1e0b21a_fk_usuario_usuario_id FOREIGN KEY (user_id) REFERENCES public.usuario_usuario(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: historial_tarea historial_tarea_sprimt_id_927a8cdc_fk_sprint_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historial_tarea
    ADD CONSTRAINT historial_tarea_sprimt_id_927a8cdc_fk_sprint_id FOREIGN KEY (sprimt_id) REFERENCES public.sprint(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: historial_tarea historial_tarea_tarea_id_1d22de24_fk_tarea_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historial_tarea
    ADD CONSTRAINT historial_tarea_tarea_id_1d22de24_fk_tarea_id FOREIGN KEY (tarea_id) REFERENCES public.tarea(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: miembros miembros_rol_id_863e4832_fk_rol_proyecto_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.miembros
    ADD CONSTRAINT miembros_rol_id_863e4832_fk_rol_proyecto_id FOREIGN KEY (rol_id) REFERENCES public.rol_proyecto(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: miembros miembros_user_id_6dcd0150_fk_usuario_usuario_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.miembros
    ADD CONSTRAINT miembros_user_id_6dcd0150_fk_usuario_usuario_id FOREIGN KEY (user_id) REFERENCES public.usuario_usuario(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: project project_creator_id_e70918ae_fk_usuario_usuario_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.project
    ADD CONSTRAINT project_creator_id_e70918ae_fk_usuario_usuario_id FOREIGN KEY (creator_id) REFERENCES public.usuario_usuario(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rol_proyecto_permisos rol_proyecto_permiso_permission_id_6297be67_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rol_proyecto_permisos
    ADD CONSTRAINT rol_proyecto_permiso_permission_id_6297be67_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rol_proyecto_permisos rol_proyecto_permiso_rolproyecto_id_b1c05880_fk_rol_proye; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rol_proyecto_permisos
    ADD CONSTRAINT rol_proyecto_permiso_rolproyecto_id_b1c05880_fk_rol_proye FOREIGN KEY (rolproyecto_id) REFERENCES public.rol_proyecto(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rol_proyecto rol_proyecto_project_id_0dda0c3b_fk_project_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rol_proyecto
    ADD CONSTRAINT rol_proyecto_project_id_0dda0c3b_fk_project_id FOREIGN KEY (project_id) REFERENCES public.project(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: roles_permisos roles_permisos_permission_id_32bc9271_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles_permisos
    ADD CONSTRAINT roles_permisos_permission_id_32bc9271_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: roles_permisos roles_permisos_rol_id_5daf3c70_fk_roles_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles_permisos
    ADD CONSTRAINT roles_permisos_rol_id_5daf3c70_fk_roles_id FOREIGN KEY (rol_id) REFERENCES public.roles(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialapp_sites socialaccount_social_site_id_2579dee5_fk_django_si; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_social_site_id_2579dee5_fk_django_si FOREIGN KEY (site_id) REFERENCES public.django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialaccount socialaccount_social_user_id_8146e70c_fk_usuario_u; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_social_user_id_8146e70c_fk_usuario_u FOREIGN KEY (user_id) REFERENCES public.usuario_usuario(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialtoken socialaccount_socialtoken_account_id_951f210e_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_socialtoken_account_id_951f210e_fk FOREIGN KEY (account_id) REFERENCES public.socialaccount_socialaccount(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialtoken socialaccount_socialtoken_app_id_636a42d7_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_socialtoken_app_id_636a42d7_fk FOREIGN KEY (app_id) REFERENCES public.socialaccount_socialapp(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sprint sprint_proyecto_id_e22addde_fk_project_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sprint
    ADD CONSTRAINT sprint_proyecto_id_e22addde_fk_project_id FOREIGN KEY (proyecto_id) REFERENCES public.project(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sprint_us sprint_us_sprint_id_50f321b4_fk_sprint_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sprint_us
    ADD CONSTRAINT sprint_us_sprint_id_50f321b4_fk_sprint_id FOREIGN KEY (sprint_id) REFERENCES public.sprint(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sprint_us sprint_us_us_id_ef20b30c_fk_us_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sprint_us
    ADD CONSTRAINT sprint_us_us_id_ef20b30c_fk_us_id FOREIGN KEY (us_id) REFERENCES public.us(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sprintplanning sprintplanning_sprint_id_df8c8129_fk_sprint_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sprintplanning
    ADD CONSTRAINT sprintplanning_sprint_id_df8c8129_fk_sprint_id FOREIGN KEY (sprint_id) REFERENCES public.sprint(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tarea tarea_sprimt_id_0d6e9d9f_fk_sprint_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tarea
    ADD CONSTRAINT tarea_sprimt_id_0d6e9d9f_fk_sprint_id FOREIGN KEY (sprimt_id) REFERENCES public.sprint(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tarea tarea_ustory_id_241ae66d_fk_us_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tarea
    ADD CONSTRAINT tarea_ustory_id_241ae66d_fk_us_id FOREIGN KEY (ustory_id) REFERENCES public.us(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: us us_etiqueta_id_34d426e8_fk_etiqueta_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.us
    ADD CONSTRAINT us_etiqueta_id_34d426e8_fk_etiqueta_id FOREIGN KEY (etiqueta_id) REFERENCES public.etiqueta(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: us_historialcomentarios us_historialcomentar_comentario_id_b0a844d3_fk_comentari; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.us_historialcomentarios
    ADD CONSTRAINT us_historialcomentar_comentario_id_b0a844d3_fk_comentari FOREIGN KEY (comentario_id) REFERENCES public.comentarios(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: us_historialcomentarios us_historialcomentar_creador_id_3cbf96f0_fk_usuario_u; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.us_historialcomentarios
    ADD CONSTRAINT us_historialcomentar_creador_id_3cbf96f0_fk_usuario_u FOREIGN KEY (creador_id) REFERENCES public.usuario_usuario(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: us_historialcomentarios us_historialcomentarios_us_id_6350b015_fk_us_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.us_historialcomentarios
    ADD CONSTRAINT us_historialcomentarios_us_id_6350b015_fk_us_id FOREIGN KEY (us_id) REFERENCES public.us(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: us_historialus us_historialus_etiqueta_id_d3c765ea_fk_etiqueta_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.us_historialus
    ADD CONSTRAINT us_historialus_etiqueta_id_d3c765ea_fk_etiqueta_id FOREIGN KEY (etiqueta_id) REFERENCES public.etiqueta(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: us_historialus us_historialus_sprint_id_69006543_fk_sprint_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.us_historialus
    ADD CONSTRAINT us_historialus_sprint_id_69006543_fk_sprint_id FOREIGN KEY (sprint_id) REFERENCES public.sprint(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: us_historialus us_historialus_user_id_31434e45_fk_miembros_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.us_historialus
    ADD CONSTRAINT us_historialus_user_id_31434e45_fk_miembros_id FOREIGN KEY (user_id) REFERENCES public.miembros(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: us_historialus us_historialus_ustory_id_8a035044_fk_us_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.us_historialus
    ADD CONSTRAINT us_historialus_ustory_id_8a035044_fk_us_id FOREIGN KEY (ustory_id) REFERENCES public.us(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: us us_project_id_2bb655fc_fk_project_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.us
    ADD CONSTRAINT us_project_id_2bb655fc_fk_project_id FOREIGN KEY (project_id) REFERENCES public.project(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: us us_user_id_fc569683_fk_miembros_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.us
    ADD CONSTRAINT us_user_id_fc569683_fk_miembros_id FOREIGN KEY (user_id) REFERENCES public.miembros(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: usuario_usuario_groups usuario_usuario_grou_usuario_id_62de76a1_fk_usuario_u; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario_usuario_groups
    ADD CONSTRAINT usuario_usuario_grou_usuario_id_62de76a1_fk_usuario_u FOREIGN KEY (usuario_id) REFERENCES public.usuario_usuario(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: usuario_usuario_groups usuario_usuario_groups_group_id_b9c090f8_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario_usuario_groups
    ADD CONSTRAINT usuario_usuario_groups_group_id_b9c090f8_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: usuario_usuario usuario_usuario_rol_id_3abe68b9_fk_roles_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario_usuario
    ADD CONSTRAINT usuario_usuario_rol_id_3abe68b9_fk_roles_id FOREIGN KEY (rol_id) REFERENCES public.roles(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: usuario_usuario_user_permissions usuario_usuario_user_permission_id_5cad0a4b_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario_usuario_user_permissions
    ADD CONSTRAINT usuario_usuario_user_permission_id_5cad0a4b_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: usuario_usuario_user_permissions usuario_usuario_user_usuario_id_5969a193_fk_usuario_u; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario_usuario_user_permissions
    ADD CONSTRAINT usuario_usuario_user_usuario_id_5969a193_fk_usuario_u FOREIGN KEY (usuario_id) REFERENCES public.usuario_usuario(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

