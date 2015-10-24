--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
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

--
-- Name: item1; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE item1 AS (
	name text,
	uid integer
);


ALTER TYPE item1 OWNER TO postgres;

--
-- Name: room; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE room AS (
	lat double precision[],
	lon double precision[],
	center double precision[],
	radius double precision
);


ALTER TYPE room OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: academics; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE academics (
    subject text,
    course text
);


ALTER TABLE academics OWNER TO postgres;

--
-- Name: groups; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE groups (
    subject character varying(100),
    class character varying(50),
    end_time timestamp without time zone,
    gid integer,
    participants integer[],
    room integer,
    messages text[]
);


ALTER TABLE groups OWNER TO postgres;

--
-- Name: map; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE map (
    area text,
    building text,
    school text,
    rid integer,
    lat double precision,
    lon double precision,
    radius double precision
);


ALTER TABLE map OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE users (
    name character(20),
    pass character(40),
    room integer,
    checkin timestamp without time zone,
    study_group integer,
    uid integer
);


ALTER TABLE users OWNER TO postgres;

--
-- Data for Name: academics; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY academics (subject, course) FROM stdin;
\.


--
-- Data for Name: groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY groups (subject, class, end_time, gid, participants, room, messages) FROM stdin;
\.


--
-- Data for Name: map; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY map (area, building, school, rid, lat, lon, radius) FROM stdin;
Off main	574 Boston Ave.	Tufts	1	42.4037840000000017	-71.1142889999999994	30
Off main	574 Boston Ave.	Tufts	2	42.4038639999999987	-71.1141149999999982	30
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY users (name, pass, room, checkin, study_group, uid) FROM stdin;
\.


--
-- Name: groups_gid_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY groups
    ADD CONSTRAINT groups_gid_key UNIQUE (gid);


--
-- Name: map_rid_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY map
    ADD CONSTRAINT map_rid_key UNIQUE (rid);


--
-- Name: users_uid_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_uid_key UNIQUE (uid);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

