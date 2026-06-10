--
-- PostgreSQL database dump
--

\restrict sZglttFzWkVU957INZU1S3tShGyF0TJSccSST7dNMAtCbtAzeJWAS8vdP0daLiC

-- Dumped from database version 16.14 (Ubuntu 16.14-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 16.14 (Ubuntu 16.14-0ubuntu0.24.04.1)

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
-- Name: gifted_titles; Type: TABLE; Schema: public; Owner: wiisoap
--

CREATE TABLE public.gifted_titles (
    titleid character varying(255),
    fromwho character varying(255),
    towhom character varying(255),
    accepted boolean,
    rejected boolean,
    giftmsgsend character varying(255),
    giftmsgrecv character varying(255),
    "timestamp" bigint
);


ALTER TABLE public.gifted_titles OWNER TO wiisoap;

--
-- Name: owned_titles; Type: TABLE; Schema: public; Owner: wiisoap
--

CREATE TABLE public.owned_titles (
    account_id integer NOT NULL,
    title_id character varying(16) NOT NULL,
    version integer,
    item_id integer,
    date_purchased timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.owned_titles OWNER TO wiisoap;

--
-- Name: service_titles; Type: TABLE; Schema: public; Owner: wiisoap
--

CREATE TABLE public.service_titles (
    item_id integer NOT NULL,
    price_code integer NOT NULL,
    price integer NOT NULL,
    title_id character varying(16) NOT NULL,
    reference_id character varying(32)
);


ALTER TABLE public.service_titles OWNER TO wiisoap;

--
-- Name: userbase; Type: TABLE; Schema: public; Owner: wiisoap
--

CREATE TABLE public.userbase (
    device_id bigint NOT NULL,
    device_token character varying(21) NOT NULL,
    device_token_hashed character varying(32) NOT NULL,
    account_id integer NOT NULL,
    region character varying(3),
    serial_number character varying(12),
    points character varying(10),
    altregion text DEFAULT 'N/A'::text,
    og_title character varying(255) DEFAULT 0,
    og_mode boolean,
    language character varying(255),
    country character varying(255)
);


ALTER TABLE public.userbase OWNER TO wiisoap;

--
-- Name: service_titles item_id; Type: CONSTRAINT; Schema: public; Owner: wiisoap
--

ALTER TABLE ONLY public.service_titles
    ADD CONSTRAINT item_id PRIMARY KEY (item_id);


--
-- Name: service_titles service_titles_reference_id_key; Type: CONSTRAINT; Schema: public; Owner: wiisoap
--

ALTER TABLE ONLY public.service_titles
    ADD CONSTRAINT service_titles_reference_id_key UNIQUE (reference_id);


--
-- Name: userbase userbase_pk; Type: CONSTRAINT; Schema: public; Owner: wiisoap
--

ALTER TABLE ONLY public.userbase
    ADD CONSTRAINT userbase_pk PRIMARY KEY (account_id);



--
-- Name: owned_titles_account_id_uindex; Type: INDEX; Schema: public; Owner: wiisoap
--

CREATE INDEX owned_titles_account_id_uindex ON public.owned_titles USING btree (account_id);


--
-- Name: userbase_account_id_uindex; Type: INDEX; Schema: public; Owner: wiisoap
--

CREATE UNIQUE INDEX userbase_account_id_uindex ON public.userbase USING btree (account_id);


--
-- Name: userbase_device_id_uindex; Type: INDEX; Schema: public; Owner: wiisoap
--

CREATE UNIQUE INDEX userbase_device_id_uindex ON public.userbase USING btree (device_id);


--
-- Name: userbase_device_token_uindex; Type: INDEX; Schema: public; Owner: wiisoap
--

CREATE UNIQUE INDEX userbase_device_token_uindex ON public.userbase USING btree (device_token);


--
-- Name: owned_titles order_account_ids; Type: FK CONSTRAINT; Schema: public; Owner: wiisoap
--

ALTER TABLE ONLY public.owned_titles
    ADD CONSTRAINT order_account_ids FOREIGN KEY (account_id) REFERENCES public.userbase(account_id);


--
-- PostgreSQL database dump complete
--

\unrestrict sZglttFzWkVU957INZU1S3tShGyF0TJSccSST7dNMAtCbtAzeJWAS8vdP0daLiC