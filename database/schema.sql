--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.21
-- Dumped by pg_dump version 13.2

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

--
-- Name: api_coc; Type: SCHEMA; Schema: -; Owner: admin
--

CREATE SCHEMA api_coc;


ALTER SCHEMA api_coc OWNER TO admin;

SET default_tablespace = '';

--
-- Name: users; Type: TABLE; Schema: api_coc; Owner: admin
--

CREATE TABLE api_coc.users (
    id integer NOT NULL,
    username text NOT NULL,
    password_hash character varying NOT NULL,
    player_tag character varying NOT NULL,
    discord_user character varying NOT NULL
);


ALTER TABLE api_coc.users OWNER TO admin;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: api_coc; Owner: admin
--

CREATE SEQUENCE api_coc.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE api_coc.users_id_seq OWNER TO admin;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: api_coc; Owner: admin
--

ALTER SEQUENCE api_coc.users_id_seq OWNED BY api_coc.users.id;


--
-- Name: users id; Type: DEFAULT; Schema: api_coc; Owner: admin
--

ALTER TABLE ONLY api_coc.users ALTER COLUMN id SET DEFAULT nextval('api_coc.users_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: api_coc; Owner: admin
--

COPY api_coc.users (id, username, password_hash, player_tag, discord_user) FROM stdin;
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: api_coc; Owner: admin
--

SELECT pg_catalog.setval('api_coc.users_id_seq', 1, false);


--
-- Name: users users_pk; Type: CONSTRAINT; Schema: api_coc; Owner: admin
--

ALTER TABLE ONLY api_coc.users
    ADD CONSTRAINT users_pk PRIMARY KEY (id);


--
-- Name: users_id_uindex; Type: INDEX; Schema: api_coc; Owner: admin
--

CREATE UNIQUE INDEX users_id_uindex ON api_coc.users USING btree (id);


--
-- PostgreSQL database dump complete
--

