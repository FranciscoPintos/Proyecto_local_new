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
    sprint_id integer NOT NULL,
    paso integer NOT NULL
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
1	everfgmolinas@fpuna.edu.py	t	t	2
2	userprueba2is2@gmail.com	t	t	3
3	userprueba79@gmail.com	t	t	4
4	userprueba1is2@gmail.com	t	t	5
5	everfgmolinas@hotmail.com	t	t	6
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
61	Can add miembro	16	add_miembro
62	Can change miembro	16	change_miembro
63	Can delete miembro	16	delete_miembro
64	Can view miembro	16	view_miembro
65	Can add rol proyecto	17	add_rolproyecto
66	Can change rol proyecto	17	change_rolproyecto
67	Can delete rol proyecto	17	delete_rolproyecto
68	Can view rol proyecto	17	view_rolproyecto
69	Can add Comentarios	18	add_comentarios
70	Can change Comentarios	18	change_comentarios
71	Can delete Comentarios	18	delete_comentarios
72	Can view Comentarios	18	view_comentarios
73	Can add Us to Product Backlog	18	add_comment
74	Can view Us to Product Backlog	18	view_comment
75	Can delete Us to Product Backlog	18	delete_comment
76	Can modify comment	18	modify_comment
77	Can add historial comentarios	19	add_historialcomentarios
78	Can change historial comentarios	19	change_historialcomentarios
79	Can delete historial comentarios	19	delete_historialcomentarios
80	Can view historial comentarios	19	view_historialcomentarios
81	Can add historial us	20	add_historialus
82	Can change historial us	20	change_historialus
83	Can delete historial us	20	delete_historialus
84	Can view historial us	20	view_historialus
85	Can add Us	21	add_us
86	Can change Us	21	change_us
87	Can delete Us	21	delete_us
88	Can view Us	21	view_us
89	Can add Us to Product Backlog	21	add_usproductbacklog
90	Can view Us to Product Backlog	21	view_usproductbacklog
91	Can delete Us to Product Backlog	21	delete_usproductbacklog
92	Can view Us to Product Backlog	21	change_usproductbacklog
93	Can calificate Us to Sprint Backlog	21	valuate_us
94	Can add HistorialTarea	22	add_historialtarea
95	Can change HistorialTarea	22	change_historialtarea
96	Can delete HistorialTarea	22	delete_historialtarea
97	Can view HistorialTarea	22	view_historialtarea
98	Can add Tarea	23	add_tarea
99	Can change Tarea	23	change_tarea
100	Can delete Tarea	23	delete_tarea
101	Can view Tarea	23	view_tarea
102	Can add Etiqueta	24	add_etiqueta
103	Can change Etiqueta	24	change_etiqueta
104	Can delete Etiqueta	24	delete_etiqueta
105	Can view Etiqueta	24	view_etiqueta
106	Can add Sprint	25	add_sprint
107	Can change Sprint	25	change_sprint
108	Can delete Sprint	25	delete_sprint
109	Can view Sprint	25	view_sprint
110	Can add Equipo	26	add_equipo
111	Can change Equipo	26	change_equipo
112	Can delete Equipo	26	delete_equipo
113	Can view Equipo	26	view_equipo
114	Can add SprintPlanning	27	add_sprintplanning
115	Can change SprintPlanning	27	change_sprintplanning
116	Can delete SprintPlanning	27	delete_sprintplanning
117	Can view SprintPlanning	27	view_sprintplanning
120	Can add Us to Sprint Backlog	25	charge_sprintplanning
121	Can view Sprint Backlog	25	view_sprintbacklog
122	Can view Sprint Backlog	25	view_burdownchart
123	Can start Sprint	25	start_sprint
124	Can start a Project	15	start_proyecto
125	Can end a Project	15	end_proyecto
126	Can assign a member to rolproyecto	17	asignar_rolproyeto
127	Can valuate a US	21	estimar_sprintplanning
128	Can finalize a Sprint	25	end_sprint
129	Can assign a member to a rolproyecto	17	asignar_rolproyecto
\.


--
-- Data for Name: comentarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comentarios (id, comentarios, activo, creador_id, project_id, us_id) FROM stdin;
1	Probar comentarios	t	2	7	18
2	Prueba historial	t	2	7	18
3	Prueba 4	t	2	7	18
4	Prueba 5	t	2	7	18
5	Prueba 6	t	2	7	18
6	Prueba 7	t	2	7	18
7	Prueba 9	t	2	7	18
8	Prueba 8	t	2	7	18
9	10	t	2	7	18
10	11	t	2	7	18
11	12	t	2	7	18
12	13	t	2	7	18
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2021-10-26 11:28:57.845792-03	1	Alloauth	1	[{"added": {}}]	10	1
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
22	tarea	historialtarea
23	tarea	tarea
24	etiqueta	etiqueta
25	sprint	sprint
26	equipo	equipo
27	sprintPlanning	sprintplanning
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2021-10-26 11:26:52.373375-03
2	contenttypes	0002_remove_content_type_name	2021-10-26 11:26:52.383799-03
3	auth	0001_initial	2021-10-26 11:26:52.467147-03
4	auth	0002_alter_permission_name_max_length	2021-10-26 11:26:52.473281-03
5	auth	0003_alter_user_email_max_length	2021-10-26 11:26:52.479902-03
6	auth	0004_alter_user_username_opts	2021-10-26 11:26:52.487554-03
7	auth	0005_alter_user_last_login_null	2021-10-26 11:26:52.49386-03
8	auth	0006_require_contenttypes_0002	2021-10-26 11:26:52.497156-03
9	auth	0007_alter_validators_add_error_messages	2021-10-26 11:26:52.50353-03
10	auth	0008_alter_user_username_max_length	2021-10-26 11:26:52.509933-03
11	auth	0009_alter_user_last_name_max_length	2021-10-26 11:26:52.516102-03
12	auth	0010_alter_group_name_max_length	2021-10-26 11:26:52.522767-03
13	auth	0011_update_proxy_permissions	2021-10-26 11:26:52.537729-03
14	auth	0012_alter_user_first_name_max_length	2021-10-26 11:26:52.544226-03
15	roles	0001_initial	2021-10-26 11:26:52.594746-03
16	usuario	0001_initial	2021-10-26 11:26:52.730348-03
17	account	0001_initial	2021-10-26 11:26:52.803491-03
18	account	0002_email_max_length	2021-10-26 11:26:52.8185-03
19	account	0003_auto_20211016_1040	2021-10-26 11:26:52.929453-03
20	admin	0001_initial	2021-10-26 11:26:52.982558-03
21	admin	0002_logentry_remove_auto_add	2021-10-26 11:26:52.998406-03
22	admin	0003_logentry_add_action_flag_choices	2021-10-26 11:26:53.009669-03
23	project	0001_initial	2021-10-26 11:26:53.038242-03
24	sprint	0001_initial	2021-10-26 11:26:53.05882-03
25	miembros	0001_initial	2021-10-26 11:26:53.124684-03
26	equipo	0001_initial	2021-10-26 11:26:53.141666-03
27	equipo	0002_equipo_miembros	2021-10-26 11:26:53.181914-03
28	equipo	0003_equipo_sprint	2021-10-26 11:26:53.198027-03
29	etiqueta	0001_initial	2021-10-26 11:26:53.209748-03
30	etiqueta	0002_etiqueta_proyecto	2021-10-26 11:26:53.236711-03
31	etiqueta	0003_etiqueta_user	2021-10-26 11:26:53.265561-03
32	miembros	0002_initial	2021-10-26 11:26:53.309991-03
33	miembros	0003_miembro_user	2021-10-26 11:26:53.340811-03
34	principalApp	0001_initial	2021-10-26 11:26:53.352096-03
35	project	0002_proyecto_creator	2021-10-26 11:26:53.379038-03
36	sessions	0001_initial	2021-10-26 11:26:53.428819-03
37	sites	0001_initial	2021-10-26 11:26:53.44041-03
38	sites	0002_alter_domain_unique	2021-10-26 11:26:53.463708-03
39	socialaccount	0001_initial	2021-10-26 11:26:53.646395-03
40	socialaccount	0002_token_max_lengths	2021-10-26 11:26:53.683659-03
41	socialaccount	0003_extra_data_default_dict	2021-10-26 11:26:53.697788-03
42	socialaccount	0004_auto_20211016_1040	2021-10-26 11:26:53.896587-03
43	us	0001_initial	2021-10-26 11:26:54.019427-03
44	sprint	0002_sprint_us	2021-10-26 11:26:54.075039-03
45	sprintPlanning	0001_initial	2021-10-26 11:26:54.116316-03
46	tarea	0001_initial	2021-10-26 11:26:54.159524-03
47	tarea	0002_initial	2021-10-26 11:26:54.222985-03
48	us	0002_initial	2021-10-26 11:26:54.432754-03
49	sprint	0003_alter_sprint_options	2021-10-27 17:31:25.277551-03
50	sprintPlanning	0002_sprintplanning_paso	2021-10-27 19:51:26.944006-03
51	tarea	0003_auto_20211114_1607	2021-11-14 19:07:22.194936-03
52	us	0003_historialcomentarios_activo	2021-11-14 19:07:22.220762-03
53	us	0004_alter_us_prioridad	2021-11-14 21:29:03.324773-03
54	us	0005_alter_us_prioridad	2021-11-14 21:32:12.05531-03
55	sprint	0003_auto_20211120_2104	2021-11-21 00:04:26.275892-03
56	us	0006_us_sprint	2021-11-21 00:04:26.331997-03
57	us	0007_historialus_sprint	2021-11-21 00:10:18.727204-03
58	us	0008_auto_20211120_2124	2021-11-21 00:24:24.446628-03
59	sprint	0004_sprint_us	2021-11-21 00:24:24.519366-03
60	tarea	0004_alter_tarea_fecha_creacion	2021-11-21 14:37:15.688378-03
61	us	0009_auto_20211122_1920	2021-11-22 22:20:28.770531-03
62	us	0010_alter_historialus_user	2021-11-23 00:17:04.531317-03
63	us	0011_historialus_sprint	2021-11-24 15:39:48.66267-03
64	project	0003_alter_proyecto_estado	2021-11-26 13:03:19.794337-03
65	sprint	0005_alter_sprint_options	2021-11-26 17:02:39.918042-03
66	us	0012_auto_20211126_1402	2021-11-26 17:02:39.95046-03
67	sprint	0006_alter_sprint_options	2021-11-26 17:04:12.379559-03
68	project	0004_alter_proyecto_options	2021-11-27 15:43:58.218725-03
69	miembros	0004_alter_rolproyecto_options	2021-11-27 16:27:40.639634-03
70	miembros	0005_alter_rolproyecto_options	2021-11-27 16:28:14.63294-03
71	sprint	0007_alter_sprint_options	2021-11-27 23:58:41.735554-03
72	us	0013_alter_us_options	2021-11-27 23:58:41.754475-03
73	miembros	0006_alter_rolproyecto_options	2021-11-28 15:29:55.700325-03
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
ccliibk2h0tx2jng3exf1cjylhpisa6s	eyJzb2NpYWxhY2NvdW50X3N0YXRlIjpbeyJwcm9jZXNzIjoibG9naW4iLCJzY29wZSI6IiIsImF1dGhfcGFyYW1zIjoiIn0sIlE4QzBsYk9FR3I4aCJdfQ:1mgSVi:nV4coJ5JiFKavbZyhcdlcmxoFi5yNeLp4A3cySNrEeA	2021-11-12 11:05:34.77769-03
b3moor0rqdg2uof939rc5458g9zij5hb	.eJxVjMsOwiAURP-FtSEgb3f2R5rL5RKIDU2Eroz_bmu60OWcmTkvNsM2yrx1es41sRu7sssvi4APakcBy3JgDojr1gb_bs668_ueqI2KMOrapvP1pyrQy-5xRkeFEmR0KpCLCEBe-SySVlIHm40IZGQKSXhlNFqRvbfRZUk-y2jZ-wO3nDwn:1mrv7o:iPagmZ03rwfL_rzU4o7Dq4qOwvdta8L1Kcy6xYsVCBI	2021-12-14 01:52:16.064149-03
dkpxzaiitu5s5mnjemkh3nlj9bt2jigz	.eJxVjMEOgyAQRP-Fc0PABV16qz9ilmUbTQ0mBU5N_73aeGiP82bmvdRErc5TK_KclqSuCtTll0Xih-SjoHU9sCbmreWqv5uzLvq2J8l1YarLlsfz9aeaqcy7x6XUCUbPvQmDRbTeuHSH5C30RjhG6dmLIwQ0Djs3BA7gBYUtQPBGvT-tizuV:1msDPw:XuLDBebsDlFVayUDePjfWsLazPImc0T8FzJO8l0c0i4	2021-12-14 21:24:12.811564-03
j6n195zmx5aj43ibffv1i1bc7ndxwuj3	eyJzb2NpYWxhY2NvdW50X3N0YXRlIjpbeyJwcm9jZXNzIjoibG9naW4iLCJzY29wZSI6IiIsImF1dGhfcGFyYW1zIjoiIn0sIjlRallGZ3NRY2VTUSJdfQ:1mr1Hp:UoRWVPFFSGJpriOG2_TdmuEx-9-xLQe4lou23BSbA24	2021-12-11 14:14:53.894401-03
bhoifqkv7xbrezjr0gx7uyj8ve45tokv	.eJxVjMsOwiAURP-FtSEgb3f2R5rL5RKIDU2Eroz_bmu60OWcmTkvNsM2yrx1es41sRu7sssvi4APakcBy3JgDojr1gb_bs668_ueqI2KMOrapvP1pyrQy-5xRkeFEmR0KpCLCEBe-SySVlIHm40IZGQKSXhlNFqRvbfRZUk-y2jZ-wO3nDwn:1mrlDY:wE7hJWbsgW3YneFtUQ8mPswOHe3zGy1T0Avl7T6shO8	2021-12-13 15:17:32.709676-03
u4qmukii7n5cd7btc1si8oojf7iw9xva	.eJxVjMsOwiAURP-FtSEgb3f2R5rL5RKIDU2Eroz_bmu60OWcmTkvNsM2yrx1es41sRu7sssvi4APakcBy3JgDojr1gb_bs668_ueqI2KMOrapvP1pyrQy-5xRkeFEmR0KpCLCEBe-SySVlIHm40IZGQKSXhlNFqRvbfRZUk-y2jZ-wO3nDwn:1mrutK:vJcZgDXhxjK7qczTb5Ff8bYmdSb-IPODw9SPvHolBYg	2021-12-14 01:37:18.581178-03
jlloywh5cxwho4q0vuji9jvu3x42c10v	.eJxVjMEOgyAQRP-Fc0NYEOv2Vn_ELMsSTQ0mBU5N_73aeGiP82bmvdRErc5TK_KclqhuyqvLLwvED8lHQet6YE3MW8tVfzdnXfR9T5LrwlSXLY_n6081U5l3T2AjjgN1nqJgoj4RQkKDvUcAR9ENUcCj5WDBXpPrIEVjZTACrkOr3h_gAzxt:1mstTb:yPr7GfRWQDMHS6KLgixA62hRcoiDl0oWmEYtbXIzYPo	2021-12-16 18:18:47.495682-03
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
5	24	9
6	42	10
7	6	11
8	3	12
9	2	13
10	32	14
11	8	15
12	4	16
\.


--
-- Data for Name: equipo_miembros; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.equipo_miembros (id, equipo_id, miembro_id) FROM stdin;
29	5	6
30	6	6
31	7	6
32	8	6
33	9	14
34	10	20
35	11	20
36	12	20
\.


--
-- Data for Name: etiqueta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.etiqueta (id, name, fecha_creacion, activo, proyecto_id, user_id) FROM stdin;
1	Pruebas	2021-11-27	f	5	2
2	Prueba	2021-11-27	t	5	2
\.


--
-- Data for Name: historial_tarea; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.historial_tarea (id, descripcion, hora, fecha_modificacion, tarea_id, sprimt_id) FROM stdin;
13	Tarea 1	8	2021-11-24 16:13:46.82368-03	12	9
14	Mover	1	2021-11-24 16:29:42.268102-03	13	10
15	Estimaciones	2	2021-11-28 16:45:43.270512-03	14	14
\.


--
-- Data for Name: miembros; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.miembros (id, "horaTrabajo", activo, rol_id, user_id) FROM stdin;
1	0	t	2	2
2	6	t	1	4
3	8	t	15	3
4	15	t	15	5
5	0	t	17	2
6	3	t	19	3
7	12	t	18	5
8	0	t	22	2
9	3	t	21	5
12	0	t	30	2
13	12	t	29	5
14	2	t	32	3
15	0	t	34	2
16	12	t	35	5
17	4	t	35	3
18	0	t	38	2
19	12	t	37	5
20	4	t	40	3
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
1	Proyecto 1	2021-10-27	2021-11-24	t	I	2
2	Proyecto 2	2021-11-23	2022-01-27	t	I	2
3	Proyecto 3	2021-11-26	2022-01-20	t	I	2
5	Proyecto 4	2021-11-27	2021-12-23	t	I	2
6	Proyecto 5	2021-11-30	2022-02-04	t	E	2
7	Proyecto 6	2021-11-28	2022-02-23	t	I	2
\.


--
-- Data for Name: rol_proyecto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rol_proyecto (id, name, project_id) FROM stdin;
1	Product Owner	1
2	Scrum Master	1
3		1
7	Prueba	1
6	Prueba	1
8	Prueba3	1
9	Prueba3	1
10	Prueba10	1
11	Prueba11	1
12	Prueba12	1
13	Prueba12	1
14	Probando	1
15	Desarrollador	1
16	Product Owner	2
17	Scrum Master	2
18		2
19	Desarrollador	2
20	rfaefs	2
21	Product Owner	3
22	Scrum Master	3
23		3
24	Desarrollador	3
29	Product Owner	5
30	Scrum Master	5
31		5
32	Desarrollador	5
33	Product Owner	6
34	Scrum Master	6
35		6
36	Desarrollador	6
37	Product Owner	7
38	Scrum Master	7
39		7
40	Desarrollador	7
\.


--
-- Data for Name: rol_proyecto_permisos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rol_proyecto_permisos (id, rolproyecto_id, permission_id) FROM stdin;
1	2	110
2	2	111
3	2	112
4	2	113
5	2	102
6	2	103
7	2	104
8	2	105
9	2	61
10	2	62
11	2	63
12	2	64
13	2	65
14	2	66
15	2	67
16	2	68
17	2	46
18	2	47
19	2	48
20	2	57
21	2	58
22	2	59
23	2	60
24	2	53
25	2	54
26	2	55
27	2	56
28	2	106
29	2	107
30	2	108
31	2	109
32	2	114
33	2	115
34	2	116
35	2	117
36	2	94
37	2	95
38	2	96
39	2	97
40	2	98
41	2	99
42	2	100
43	2	101
44	2	69
45	2	73
46	2	70
47	2	71
48	2	75
49	2	76
50	2	72
51	2	74
52	2	77
53	2	78
54	2	79
55	2	80
56	2	81
57	2	82
58	2	83
59	2	84
60	2	85
61	2	89
62	2	86
63	2	92
64	2	87
65	2	91
66	2	93
67	2	88
68	2	90
69	2	49
70	2	50
71	2	51
72	2	52
73	1	110
74	1	111
75	1	112
76	1	113
77	1	102
78	1	103
79	1	104
80	1	105
81	1	106
82	1	107
83	1	108
84	1	109
85	1	114
86	1	115
87	1	116
88	1	117
89	1	94
90	1	95
91	1	96
92	1	97
93	1	98
94	1	99
95	1	100
96	1	101
97	1	73
98	1	75
99	1	76
100	1	74
101	1	77
102	1	78
103	1	79
104	1	80
105	1	81
106	1	82
107	1	83
108	1	84
109	1	85
110	1	89
111	1	86
112	1	92
113	1	87
114	1	91
115	1	93
116	1	88
117	1	90
118	7	109
119	7	60
674	30	110
675	30	111
122	6	113
123	8	113
124	9	113
125	10	113
126	11	113
127	12	113
128	13	113
129	14	110
130	14	111
131	15	49
132	15	50
133	15	51
134	15	52
135	15	69
136	15	70
137	15	71
138	15	72
139	15	73
140	15	74
141	15	75
142	15	76
143	15	77
144	15	78
145	15	79
146	15	80
147	15	81
148	15	82
149	15	83
150	15	84
151	15	85
152	15	86
153	15	87
154	15	88
155	15	89
156	15	90
157	15	91
158	15	92
159	15	93
160	15	94
161	15	95
162	15	96
163	15	97
164	15	98
165	15	99
166	15	100
167	15	101
168	15	107
169	15	108
170	15	109
171	15	114
172	15	115
173	15	116
174	15	117
676	30	112
677	30	113
177	15	120
178	17	110
179	17	111
180	17	112
181	17	113
182	17	102
183	17	103
184	17	104
185	17	105
186	17	61
187	17	62
188	17	63
189	17	64
190	17	65
191	17	66
192	17	67
193	17	68
194	17	46
195	17	47
196	17	48
197	17	57
198	17	58
199	17	59
200	17	60
201	17	53
202	17	54
203	17	55
204	17	56
205	17	106
206	17	107
207	17	120
208	17	108
209	17	109
210	17	114
211	17	115
212	17	116
213	17	117
214	17	94
215	17	95
216	17	96
217	17	97
218	17	98
219	17	99
220	17	100
221	17	101
222	17	69
223	17	73
224	17	70
225	17	71
226	17	75
227	17	76
228	17	72
229	17	74
230	17	77
231	17	78
232	17	79
233	17	80
234	17	81
235	17	82
236	17	83
237	17	84
238	17	85
239	17	89
240	17	86
241	17	92
242	17	87
243	17	91
244	17	93
245	17	88
246	17	90
247	17	49
248	17	50
249	17	51
250	17	52
251	16	110
252	16	111
253	16	112
254	16	113
255	16	102
256	16	103
257	16	104
258	16	105
259	16	106
260	16	107
261	16	120
262	16	108
263	16	109
264	16	114
265	16	115
266	16	116
267	16	117
268	16	94
269	16	95
270	16	96
271	16	97
272	16	98
273	16	99
274	16	100
275	16	101
276	16	73
277	16	75
278	16	76
279	16	74
280	16	77
281	16	78
282	16	79
283	16	80
284	16	81
285	16	82
286	16	83
287	16	84
288	16	85
289	16	89
290	16	86
291	16	92
292	16	87
293	16	91
294	16	93
295	16	88
296	16	90
297	19	110
298	19	111
299	19	112
300	19	113
301	19	102
302	19	103
303	19	104
304	19	105
305	19	61
306	19	62
307	19	63
308	19	64
309	19	65
310	19	66
311	19	67
312	19	68
313	19	46
314	19	47
315	19	48
316	19	57
317	19	58
318	19	59
319	19	60
320	19	53
321	19	54
322	19	55
323	19	56
324	19	106
325	19	107
326	19	120
327	19	108
328	19	109
329	19	114
330	19	115
331	19	116
332	19	117
333	19	94
334	19	95
335	19	96
336	19	97
337	19	98
338	19	99
339	19	100
340	19	101
341	19	69
342	19	73
343	19	70
344	19	71
345	19	75
346	19	76
347	19	72
348	19	74
349	19	77
350	19	78
351	19	79
352	19	80
353	19	81
354	19	82
355	19	83
356	19	84
357	19	85
358	19	89
359	19	86
360	19	92
361	19	87
362	19	91
363	19	93
364	19	88
365	19	90
366	19	49
367	19	50
368	19	51
369	19	52
370	20	112
371	20	110
372	20	111
373	22	110
374	22	111
375	22	112
376	22	113
377	22	102
378	22	103
379	22	104
380	22	105
381	22	61
382	22	62
383	22	63
384	22	64
385	22	65
386	22	66
387	22	67
388	22	68
389	22	46
390	22	47
391	22	48
392	22	57
393	22	58
394	22	59
395	22	60
396	22	53
397	22	54
398	22	55
399	22	56
400	22	106
401	22	107
402	22	120
403	22	108
404	22	109
405	22	114
406	22	115
407	22	116
408	22	117
409	22	94
410	22	95
411	22	96
412	22	97
413	22	98
414	22	99
415	22	100
416	22	101
417	22	69
418	22	73
419	22	70
420	22	71
421	22	75
422	22	76
423	22	72
424	22	74
425	22	77
426	22	78
427	22	79
428	22	80
429	22	81
430	22	82
431	22	83
432	22	84
433	22	85
434	22	89
435	22	86
436	22	92
437	22	87
438	22	91
439	22	93
440	22	88
441	22	90
442	22	49
443	22	50
444	22	51
445	22	52
446	21	110
447	21	111
448	21	112
449	21	113
450	21	102
451	21	103
452	21	104
453	21	105
454	21	106
455	21	107
456	21	120
457	21	108
458	21	109
459	21	114
460	21	115
461	21	116
462	21	117
463	21	94
464	21	95
465	21	96
466	21	97
467	21	98
468	21	99
469	21	100
470	21	101
471	21	73
472	21	75
473	21	76
474	21	74
475	21	77
476	21	78
477	21	79
478	21	80
479	21	81
480	21	82
481	21	83
482	21	84
483	21	85
484	21	89
485	21	86
486	21	92
487	21	87
488	21	91
489	21	93
490	21	88
491	21	90
678	30	102
679	30	103
680	30	104
681	30	105
682	30	61
683	30	62
684	30	63
685	30	64
686	30	65
687	30	66
688	30	67
689	30	68
690	30	46
691	30	47
692	30	48
693	30	57
694	30	58
695	30	59
696	30	125
697	30	124
698	30	60
699	30	53
700	30	54
701	30	55
702	30	56
703	30	106
704	30	107
705	30	120
706	30	108
707	30	123
708	30	122
709	30	109
710	30	121
711	30	114
712	30	115
713	30	116
714	30	117
715	30	94
716	30	95
717	30	96
718	30	97
719	30	98
720	30	99
721	30	100
722	30	101
723	30	69
724	30	73
725	30	70
726	30	71
727	30	75
728	30	76
729	30	72
730	30	74
731	30	77
732	30	78
733	30	79
734	30	80
735	30	81
736	30	82
737	30	83
738	30	84
739	30	85
740	30	89
741	30	86
742	30	92
743	30	87
744	30	91
745	30	93
746	30	88
747	30	90
748	30	49
749	30	50
750	30	51
751	30	52
752	29	60
753	29	64
754	29	72
755	29	80
756	29	84
757	29	85
758	29	86
759	29	87
760	29	88
761	29	97
762	29	101
763	29	102
764	29	103
765	29	104
766	29	105
767	29	109
768	29	113
769	29	121
770	29	122
771	32	60
772	32	64
773	32	72
774	32	80
775	32	84
776	32	88
777	32	97
778	32	101
779	32	98
780	32	100
781	32	99
782	32	109
783	32	113
784	32	121
785	34	110
786	34	111
787	34	112
788	34	113
789	34	102
790	34	103
791	34	104
792	34	105
793	34	61
794	34	62
795	34	63
796	34	64
797	34	65
798	34	126
799	34	66
800	34	67
801	34	68
802	34	46
803	34	47
804	34	48
805	34	57
806	34	58
807	34	59
808	34	125
809	34	124
810	34	60
811	34	53
812	34	54
813	34	55
814	34	56
815	34	106
816	34	107
817	34	120
818	34	108
819	34	128
820	34	123
821	34	122
822	34	109
823	34	121
824	34	114
825	34	115
826	34	116
827	34	117
828	34	94
829	34	95
830	34	96
831	34	97
832	34	98
833	34	99
834	34	100
835	34	101
836	34	69
837	34	73
838	34	70
839	34	71
840	34	75
841	34	76
842	34	72
843	34	74
844	34	77
845	34	78
846	34	79
847	34	80
848	34	81
849	34	82
850	34	83
851	34	84
852	34	85
853	34	89
854	34	86
855	34	92
856	34	87
857	34	91
858	34	127
859	34	93
860	34	88
861	34	90
862	34	49
863	34	50
864	34	51
865	34	52
866	33	60
867	33	64
868	33	72
869	33	80
870	33	84
871	33	85
872	33	86
873	33	87
874	33	88
875	33	97
876	33	101
877	33	102
878	33	103
879	33	104
880	33	105
881	33	109
882	33	113
883	33	121
884	33	122
885	36	60
886	36	64
887	36	72
888	36	80
889	36	84
890	36	88
891	36	97
892	36	101
893	36	98
894	36	100
895	36	99
896	36	109
897	36	113
898	36	121
899	36	122
900	36	127
901	38	110
902	38	111
903	38	112
904	38	113
905	38	102
906	38	103
907	38	104
908	38	105
909	38	61
910	38	62
911	38	63
912	38	64
913	38	65
914	38	129
915	38	126
916	38	66
917	38	67
918	38	68
919	38	46
920	38	47
921	38	48
922	38	57
923	38	58
924	38	59
925	38	125
926	38	124
927	38	60
928	38	53
929	38	54
930	38	55
931	38	56
932	38	106
933	38	107
934	38	120
935	38	108
936	38	128
937	38	123
938	38	122
939	38	109
940	38	121
941	38	114
942	38	115
943	38	116
944	38	117
945	38	94
946	38	95
947	38	96
948	38	97
949	38	98
950	38	99
951	38	100
952	38	101
953	38	69
954	38	73
955	38	70
956	38	71
957	38	75
958	38	76
959	38	72
960	38	74
961	38	77
962	38	78
963	38	79
964	38	80
965	38	81
966	38	82
967	38	83
968	38	84
969	38	85
970	38	89
971	38	86
972	38	92
973	38	87
974	38	91
975	38	127
976	38	93
977	38	88
978	38	90
979	38	49
980	38	50
981	38	51
982	38	52
983	37	60
984	37	64
985	37	72
986	37	80
987	37	84
988	37	85
989	37	86
990	37	87
991	37	88
992	37	97
993	37	101
994	37	102
995	37	103
996	37	104
997	37	105
998	37	109
999	37	113
1000	37	121
1001	37	122
1002	40	60
1003	40	64
1004	40	72
1005	40	80
1006	40	84
1007	40	88
1008	40	97
1009	40	101
1010	40	98
1011	40	100
1012	40	99
1013	40	109
1014	40	113
1015	40	121
1016	40	122
1017	40	127
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (id, rol) FROM stdin;
1	Creador de proyectos
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
\.


--
-- Data for Name: socialaccount_socialaccount; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.socialaccount_socialaccount (id, provider, uid, last_login, date_joined, extra_data, user_id) FROM stdin;
3	google	107699811835725335531	2021-10-26 16:19:06.252271-03	2021-10-26 11:35:01.0094-03	{"id": "107699811835725335531", "email": "userprueba79@gmail.com", "verified_email": true, "name": "user prueba", "given_name": "user", "family_name": "prueba", "picture": "https://lh3.googleusercontent.com/a/AATXAJwmuRU4tVQT9WlZ38Sy_kLqGHTwT4aT0MnUqTX0=s96-c", "locale": "es"}	4
1	google	106540917061946581900	2021-11-30 01:52:16.036707-03	2021-10-26 11:29:15.069064-03	{"id": "106540917061946581900", "email": "everfgmolinas@fpuna.edu.py", "verified_email": true, "name": "Ever Fernando Garay Molinas", "given_name": "Ever Fernando", "family_name": "Garay Molinas", "picture": "https://lh3.googleusercontent.com/a/AATXAJybu-apnEI9-02FvpOXdFm2ghjRGnmcC3nlgCk-=s96-c", "locale": "es", "hd": "fpuna.edu.py"}	2
2	google	105675435886523813510	2021-11-30 21:24:12.768192-03	2021-10-26 11:32:54.553785-03	{"id": "105675435886523813510", "email": "userprueba2is2@gmail.com", "verified_email": true, "name": "User Prueba 2 IS2", "given_name": "User Prueba 2", "family_name": "IS2", "picture": "https://lh3.googleusercontent.com/a/AATXAJxTY924CdT45YhF1sWTsUfI0doUuK8c3e-fSh_c=s96-c", "locale": "es"}	3
5	google	106883599645748973111	2021-11-29 13:45:05.83198-03	2021-11-29 13:45:05.832004-03	{"id": "106883599645748973111", "email": "everfgmolinas@hotmail.com", "verified_email": true, "name": "Ever Fernando Garay Molinas", "given_name": "Ever Fernando", "family_name": "Garay Molinas", "picture": "https://lh3.googleusercontent.com/a-/AOh14Gh7dSw4FpeuBGBHVPCJELILFTFy6VzXuE_72O1A=s96-c", "locale": "es"}	6
4	google	114859760729133515892	2021-12-02 18:18:47.470385-03	2021-10-26 16:18:24.68876-03	{"id": "114859760729133515892", "email": "userprueba1is2@gmail.com", "verified_email": true, "name": "User Prueba 1 IS2", "given_name": "User Prueba 1", "family_name": "IS2", "picture": "https://lh3.googleusercontent.com/a/AATXAJztPtNhN46ocdmT_2qT3oz-zqkOzTwEkL4xdhLb=s96-c", "locale": "es"}	5
\.


--
-- Data for Name: socialaccount_socialapp; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.socialaccount_socialapp (id, provider, name, client_id, secret, key) FROM stdin;
1	google	Alloauth	96128541178-8hkdejl0g62hiurv8a71ah99uvls9up6.apps.googleusercontent.com	HZaQQ9N-W__8oaltWtQ_xquG	
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
3	ya29.a0ARrdaM_KExBa4eWEApUvimBPyy9CYkXzMI9_dmEGjAi64pV7mJrojNhpZVEfrlhrH7ZbWWuXmIMoYVFYS2S32TokKdPkMtEfGKdWuP_IO2s9jU3rBNs4fI0YhPw_aIQrIFj01Kolqp29--THBope70TI6oR5		2021-10-26 17:19:04.979853-03	3	1
5	ya29.a0ARrdaM9YIa57oU2-0_6cOvRNgABYxw4GhLK7ofMebYlmEK_CAoyplNTs2rXQ61KjxkASTIAakFOXiRsuivyRgbn5yXQNt_BwKFIb3Huos3D1AUJr7BnFjAcgAp2RZI3f11VwwiJB7yT6awbvsl1QVFIFGtEV		2021-11-29 14:45:04.506248-03	5	1
1	ya29.a0ARrdaM8zWPXm2zobMkTClLoMvwIMiU-h12BA6NNokb_UHrJTEwJ4ZHBAqKKFK9fzyfg7uqPmzIiHBOHV_sTYPLAVTj6LpSJcwI55XH9gF_3g-Hj_Ukp3qxs1pS3JdGD37vP6E_Xs6NyvYI_AUaXSC6cndg0G3g		2021-11-30 02:52:14.757359-03	1	1
2	ya29.a0ARrdaM-vXjB-GkSTynSWi63nNk4c-CWY71g_UFJumC-qTUjRaMW82IfKFtIwLcWuS_3b0_xfnhmxM8_rDVa_akkLor6fiDAALFFtpckZNnL7yJ0s-BJj8XOmZ2gOrPrRhOvhzUdQczYgS-N6wQoE7k-7v4iXgg		2021-11-30 22:24:11.176492-03	2	1
4	ya29.a0ARrdaM9UVD125IPu8ttFOchAqtIKpEEO7r33C3ZCNEVoX-i6vLsqOgkaUqcOrxDNyCst0RkZhTkd7tRhUO-iYbH6IL2PbwnW7bOpsE8fUTSX1eqbInx249c07wVlwa7TNBL08-909odk4gi1U3rNTNSDJFhT		2021-12-02 19:18:46.200358-03	4	1
\.


--
-- Data for Name: sprint; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sprint (id, name, fecha_incio, fecha_fin, estado, proyecto_id) FROM stdin;
10	Sprint2	2021-11-24	2021-11-24	3	2
11	Sprint 3	2021-12-11	2021-11-24	3	2
12	Sprint 4	2021-11-24	2021-11-26	2	2
13	Sprint 1	2021-11-28	2021-11-30	1	5
14	Sprint 1	2021-11-28	2021-11-28	3	7
15	Sprint 2	2021-11-29	2021-12-01	2	7
16	Sprint 3	2021-12-10	2021-12-11	1	7
9	Sprint 1	2021-11-24	2021-11-24	3	2
\.


--
-- Data for Name: sprint_us; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sprint_us (id, sprint_id, us_id) FROM stdin;
7	9	14
8	10	15
10	11	15
11	12	15
12	13	17
13	14	18
14	15	19
\.


--
-- Data for Name: sprintplanning; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sprintplanning (id, sprint_id, paso) FROM stdin;
14	15	4
15	16	3
8	9	4
9	10	4
10	11	4
11	12	4
12	13	4
13	14	4
\.


--
-- Data for Name: tarea; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tarea (id, descripcion, horas, fecha_creacion, ustory_id, sprimt_id) FROM stdin;
12	Tarea 1	8	2021-11-24 16:13:46.82368-03	14	9
13	Mover	1	2021-11-24 16:29:42.268102-03	15	10
14	Estimaciones	2	2021-11-28 16:45:43.270512-03	18	14
\.


--
-- Data for Name: us; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.us (id, name, descripcion, prioridad, estimacionscrum, estimaciondesarrollador, storypoints, estado, activo, etiqueta_id, project_id, user_id) FROM stdin;
14	US 1	Cierre	1	12	24	18	4	t	\N	2	6
15	Us 2	Mover us	5	24	14	19	4	t	\N	2	6
16	US 1	Gestion de permisos	2	\N	\N	\N	1	f	\N	5	\N
17	Us 1	Permisos	1	12	\N	\N	1	t	\N	5	14
18	US 1	Prueba de permisos	3	12	12	12	4	t	\N	7	20
20	US 3	Us3	1	\N	\N	\N	1	t	\N	7	\N
19	US 2	Botones y redirecciones	3	12	12	12	1	t	\N	7	20
\.


--
-- Data for Name: us_historialcomentarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.us_historialcomentarios (id, us_name, project_name, creator_name, comentarios, fecha_modificacion, comentario_id, creador_id, us_id, activo) FROM stdin;
1	US 1	Proyecto 6	Ever Fernando	Probar comentarios	2021-11-29 12:15:45.259338-03	1	2	18	t
2	US 1	Proyecto 6	Ever Fernando	Prueba historial	2021-11-29 13:50:43.736792-03	2	2	18	t
3	US 1	Proyecto 6	Ever Fernando	Prueba 4	2021-11-29 14:02:09.716107-03	3	2	18	t
4	US 1	Proyecto 6	Ever Fernando	Prueba 5	2021-11-29 14:03:53.647584-03	4	2	18	t
5	US 1	Proyecto 6	Ever Fernando	Prueba 6	2021-11-29 14:47:42.745484-03	5	2	18	t
6	US 1	Proyecto 6	Ever Fernando	Prueba 7	2021-11-29 14:49:08.987503-03	6	2	18	t
7	US 1	Proyecto 6	Ever Fernando	Prueba 9	2021-11-29 15:33:25.466185-03	7	2	18	t
8	US 1	Proyecto 6	Ever Fernando	Prueba 8	2021-11-29 15:37:26.080331-03	8	2	18	t
9	US 1	Proyecto 6	Ever Fernando	10	2021-11-29 15:56:25.334399-03	9	2	18	t
10	US 1	Proyecto 6	Ever Fernando	11	2021-11-29 16:10:54.887009-03	10	2	18	t
11	US 1	Proyecto 6	Ever Fernando	12	2021-11-29 16:11:27.217951-03	11	2	18	t
12	US 1	Proyecto 6	Ever Fernando	13	2021-11-29 17:09:26.829331-03	12	2	18	t
\.


--
-- Data for Name: us_historialus; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.us_historialus (id, name, descripcion, prioridad, estado, storypoints, fecha_modificacion, user_id, ustory_id, activo, estimaciondesarrollador, estimacionscrum, etiqueta_id, sprint_id) FROM stdin;
54	US 1	Cierre	1	1	\N	2021-11-24 15:57:17.092942-03	5	14	t	\N	\N	\N	\N
56	US 1	Cierre	1	1	\N	2021-11-24 16:03:15.42366-03	6	14	t	\N	12	\N	9
57	US 1	Cierre	1	1	18	2021-11-24 16:04:14.789578-03	6	14	t	24	12	\N	9
58	US 1	Cierre	1	2	18	2021-11-24 16:11:04.380684-03	6	14	t	24	12	\N	\N
59	US 1	Cierre	1	3	18	2021-11-24 16:13:57.274403-03	6	14	t	24	12	\N	\N
60	US 1	Cierre	1	1	18	2021-11-24 16:18:16.360447-03	6	14	t	24	12	\N	\N
61	US 1	Cierre	1	2	18	2021-11-24 16:19:01.741722-03	6	14	t	24	12	\N	\N
62	US 1	Cierre	1	3	18	2021-11-24 16:19:05.752521-03	6	14	t	24	12	\N	\N
63	US 1	Cierre	1	4	18	2021-11-24 16:20:22.055199-03	6	14	t	24	12	\N	\N
64	Us 2	Mover us	3	1	\N	2021-11-24 16:24:19.526626-03	5	15	t	\N	\N	\N	\N
65	Us 2	Mover us	3	1	\N	2021-11-24 16:26:39.340355-03	6	15	t	\N	1	\N	10
66	Us 2	Mover us	3	1	1	2021-11-24 16:28:41.154676-03	6	15	t	2	1	\N	10
67	Us 2	Mover us	3	2	1	2021-11-24 16:29:25.718614-03	6	15	t	2	1	\N	10
68	Us 2	Mover us	3	3	1	2021-11-24 16:31:34.859451-03	6	15	t	2	1	\N	10
69	Us 2	Mover us	3	1	1	2021-11-24 16:31:45.5552-03	6	15	t	2	1	\N	10
70	Us 2	Mover us	3	2	1	2021-11-24 16:32:03.959616-03	6	15	t	2	1	\N	10
71	Us 2	Mover us	5	2	\N	2021-11-24 16:32:55.672435-03	\N	15	t	2	1	\N	11
72	Us 2	Mover us	5	2	\N	2021-11-24 16:46:01.192442-03	\N	15	t	\N	\N	\N	\N
73	Us 2	Mover us	5	1	\N	2021-11-24 16:49:41.965458-03	6	15	t	\N	13	\N	11
74	Us 2	Mover us	5	1	13	2021-11-24 16:54:03.052094-03	6	15	t	14	13	\N	11
75	Us 2	Mover us	5	2	13	2021-11-24 16:55:25.263516-03	6	15	t	14	13	\N	11
76	Us 2	Mover us	5	1	\N	2021-11-24 16:55:30.16473-03	\N	15	t	14	13	\N	12
77	Us 2	Mover us	5	1	\N	2021-11-24 16:59:09.727541-03	6	15	t	14	24	\N	12
78	Us 2	Mover us	5	1	19	2021-11-24 16:59:18.413473-03	6	15	t	14	24	\N	12
79	Us 2	Mover us	5	2	19	2021-11-26 13:06:28.990153-03	6	15	t	14	24	\N	12
80	Us 2	Mover us	5	3	19	2021-11-26 13:06:37.875092-03	6	15	t	14	24	\N	12
81	Us 2	Mover us	5	4	19	2021-11-26 13:07:57.082512-03	6	15	t	14	24	\N	12
82	US 1	Gestion de permisos	2	1	\N	2021-11-27 17:00:06.059355-03	12	16	t	\N	\N	\N	\N
83	US 1	Gestion de permisos	2	1	\N	2021-11-27 17:53:25.836752-03	12	16	f	\N	\N	\N	\N
84	Us 1	Permisos	1	1	\N	2021-11-27 18:39:23.775971-03	12	17	t	\N	\N	\N	\N
85	Us 1	Permisos	1	1	\N	2021-11-27 18:41:13.888963-03	14	17	t	\N	12	\N	13
86	US 1	Prueba de permisos	3	1	\N	2021-11-28 15:35:27.952113-03	18	18	t	\N	\N	\N	\N
87	US 1	Prueba de permisos	3	1	\N	2021-11-28 15:37:49.270386-03	20	18	t	\N	12	\N	14
88	US 1	Prueba de permisos	3	1	12	2021-11-28 16:34:56.256256-03	20	18	t	12	12	\N	14
89	US 1	Prueba de permisos	3	2	12	2021-11-28 16:45:22.402712-03	20	18	t	12	12	\N	14
90	US 1	Prueba de permisos	3	3	12	2021-11-28 17:17:58.267708-03	20	18	t	12	12	\N	14
91	US 1	Prueba de permisos	3	4	12	2021-11-28 17:20:26.632157-03	20	18	t	12	12	\N	14
92	US 2	Botones y redirecciones	3	1	\N	2021-11-28 17:21:34.793559-03	18	19	t	\N	\N	\N	\N
93	US 2	Botones y redirecciones	3	1	\N	2021-11-29 16:12:36.130047-03	20	19	t	\N	12	\N	15
94	US 2	Botones y redirecciones	3	1	12	2021-11-29 16:14:02.650372-03	20	19	t	12	12	\N	15
95	US 2	Botones y redirecciones	3	2	12	2021-11-29 16:14:59.516616-03	20	19	t	12	12	\N	15
96	US 2	Botones y redirecciones	3	3	12	2021-11-29 16:15:09.724266-03	20	19	t	12	12	\N	15
97	US 3	Us3	1	1	\N	2021-11-30 01:38:00.421881-03	18	20	t	\N	\N	\N	\N
98	US 2	Botones y redirecciones	3	1	12	2021-11-30 01:44:21.560355-03	20	19	t	12	12	\N	15
\.


--
-- Data for Name: usuario_usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuario_usuario (id, password, last_login, is_superuser, first_name, last_name, is_active, date_joined, username, names, lastname, ci, email, fecha_nac, fecha_created, fecha_deleted, usuario_activo, usuario_administrador, image, rol_id) FROM stdin;
1	pbkdf2_sha256$260000$TLZq3hf1lT6aRJNvZXyCML$kid6JGxtZUXc8pI8tycP+g5qbvN0lLehPcD1uJIjfiQ=	2021-10-26 11:35:27.153984-03	t			t	2021-10-26 11:27:49.122105-03	Admin	\N	\N	\N	admin@admin.com	\N	\N	\N	t	t		\N
4	!KqVpkEX7igTnc3T8ts8V2H4k0d7QH8lKqYnf6sf5	2021-10-26 16:19:06.271468-03	f	user	prueba	t	2021-10-26 11:35:00.993309-03	user	\N	\N	\N	userprueba79@gmail.com	\N	\N	\N	t	f		\N
6	!Y2n9J7Uah1NgZr2tAu8DKYHiGUyIo8rLZ1QLCNjN	2021-11-29 13:45:05.862109-03	f	Ever Fernando	Garay Molinas	t	2021-11-29 13:45:05.805435-03	ever_fernando1	\N	\N	\N	everfgmolinas@hotmail.com	\N	\N	\N	t	f		\N
2	!Qkc94dSj1OJhEA3e4E5M87wgSMcq8yeIdL00Glz2	2021-11-30 01:52:16.05904-03	f	Ever Fernando	Garay Molinas	t	2021-10-26 11:29:15.052645-03	ever_fernando	\N	\N	\N	everfgmolinas@fpuna.edu.py	\N	\N	\N	t	f		1
5	!8Q48SWqJ9EtQXDEdqErcq6QJgrJmWhIILbevpOE2	2021-12-02 18:18:47.491136-03	f	User Prueba 1	IS2	t	2021-10-26 16:18:24.670135-03	user_prueba_1	\N	\N	\N	userprueba1is2@gmail.com	\N	\N	\N	t	f		\N
3	!x5ehUK918up2vCjZeGwuZVmtQeZ6ThFzL0I5mFit	2021-11-30 21:24:12.80306-03	f	User Prueba 2	IS2	t	2021-10-26 11:32:54.539694-03	user_prueba_2	\N	\N	\N	userprueba2is2@gmail.com	\N	\N	\N	t	f		1
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

SELECT pg_catalog.setval('public.auth_permission_id_seq', 129, true);


--
-- Name: comentarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comentarios_id_seq', 12, true);


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

SELECT pg_catalog.setval('public.django_migrations_id_seq', 73, true);


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_site_id_seq', 4, true);


--
-- Name: equipo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.equipo_id_seq', 12, true);


--
-- Name: equipo_miembros_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.equipo_miembros_id_seq', 36, true);


--
-- Name: etiqueta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.etiqueta_id_seq', 2, true);


--
-- Name: historial_tarea_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.historial_tarea_id_seq', 15, true);


--
-- Name: miembros_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.miembros_id_seq', 20, true);


--
-- Name: principalApp_holidaytime_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."principalApp_holidaytime_id_seq"', 1, false);


--
-- Name: project_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.project_id_seq', 7, true);


--
-- Name: rol_proyecto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rol_proyecto_id_seq', 40, true);


--
-- Name: rol_proyecto_permisos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rol_proyecto_permisos_id_seq', 1017, true);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_id_seq', 1, true);


--
-- Name: roles_permisos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_permisos_id_seq', 8, true);


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

SELECT pg_catalog.setval('public.sprint_id_seq', 16, true);


--
-- Name: sprint_us_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sprint_us_id_seq', 14, true);


--
-- Name: sprintplanning_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sprintplanning_id_seq', 15, true);


--
-- Name: tarea_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tarea_id_seq', 14, true);


--
-- Name: us_historialcomentarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.us_historialcomentarios_id_seq', 12, true);


--
-- Name: us_historialus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.us_historialus_id_seq', 98, true);


--
-- Name: us_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.us_id_seq', 20, true);


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

