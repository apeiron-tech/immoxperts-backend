--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.25
-- Dumped by pg_dump version 9.5.25

-- Started on 2025-04-16 00:16:21 CEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 16 (class 2615 OID 1208985823)
-- Name: dvf; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA dvf;


--
-- TOC entry 17 (class 2615 OID 1208985824)
-- Name: dvf_annexe; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA dvf_annexe;


--
-- TOC entry 4203 (class 1255 OID 1208986476)
-- Name: adresse_dispoparc_insert_trigger(); Type: FUNCTION; Schema: dvf; Owner: -
--

CREATE FUNCTION dvf.adresse_dispoparc_insert_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
     IF (NEW.coddep='94') THEN INSERT INTO dvf_d94.adresse_dispoparc VALUES(NEW.*); RETURN NULL;
ELSIF (NEW.coddep='95') THEN INSERT INTO dvf_d95.adresse_dispoparc VALUES(NEW.*); RETURN NULL;
ELSIF (NEW.coddep='971') THEN INSERT INTO dvf_d971.adresse_dispoparc VALUES(NEW.*); RETURN NULL;
ELSIF (NEW.coddep='972') THEN INSERT INTO dvf_d972.adresse_dispoparc VALUES(NEW.*); RETURN NULL;
ELSIF (NEW.coddep='973') THEN INSERT INTO dvf_d973.adresse_dispoparc VALUES(NEW.*); RETURN NULL;
ELSIF (NEW.coddep='974') THEN INSERT INTO dvf_d974.adresse_dispoparc VALUES(NEW.*); RETURN NULL;
ELSE RETURN NULL;END IF;
END;
$$;


--
-- TOC entry 4199 (class 1255 OID 1208986468)
-- Name: adresse_insert_trigger(); Type: FUNCTION; Schema: dvf; Owner: -
--

CREATE FUNCTION dvf.adresse_insert_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
     IF (NEW.coddep='94') THEN INSERT INTO dvf_d94.adresse VALUES(NEW.*); RETURN NULL;
ELSIF (NEW.coddep='95') THEN INSERT INTO dvf_d95.adresse VALUES(NEW.*); RETURN NULL;
ELSIF (NEW.coddep='971') THEN INSERT INTO dvf_d971.adresse VALUES(NEW.*); RETURN NULL;
ELSIF (NEW.coddep='972') THEN INSERT INTO dvf_d972.adresse VALUES(NEW.*); RETURN NULL;
ELSIF (NEW.coddep='973') THEN INSERT INTO dvf_d973.adresse VALUES(NEW.*); RETURN NULL;
ELSIF (NEW.coddep='974') THEN INSERT INTO dvf_d974.adresse VALUES(NEW.*); RETURN NULL;
ELSE RETURN NULL;END IF;
END;
$$;


--
-- TOC entry 4204 (class 1255 OID 1208986478)
-- Name: adresse_local_insert_trigger(); Type: FUNCTION; Schema: dvf; Owner: -
--

CREATE FUNCTION dvf.adresse_local_insert_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
     IF (NEW.coddep='94') THEN INSERT INTO dvf_d94.adresse_local VALUES(NEW.*); RETURN NULL;
ELSIF (NEW.coddep='95') THEN INSERT INTO dvf_d95.adresse_local VALUES(NEW.*); RETURN NULL;
ELSIF (NEW.coddep='971') THEN INSERT INTO dvf_d971.adresse_local VALUES(NEW.*); RETURN NULL;
ELSIF (NEW.coddep='972') THEN INSERT INTO dvf_d972.adresse_local VALUES(NEW.*); RETURN NULL;
ELSIF (NEW.coddep='973') THEN INSERT INTO dvf_d973.adresse_local VALUES(NEW.*); RETURN NULL;
ELSIF (NEW.coddep='974') THEN INSERT INTO dvf_d974.adresse_local VALUES(NEW.*); RETURN NULL;
ELSE RETURN NULL;END IF;
END;
$$;


--
-- TOC entry 4195 (class 1255 OID 1208986460)
-- Name: disposition_insert_trigger(); Type: FUNCTION; Schema: dvf; Owner: -
--

CREATE FUNCTION dvf.disposition_insert_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
     IF (NEW.coddep='94') THEN INSERT INTO dvf_d94.disposition VALUES(NEW.*); RETURN NULL;
ELSIF (NEW.coddep='95') THEN INSERT INTO dvf_d95.disposition VALUES(NEW.*); RETURN NULL;
ELSIF (NEW.coddep='971') THEN INSERT INTO dvf_d971.disposition VALUES(NEW.*); RETURN NULL;
ELSIF (NEW.coddep='972') THEN INSERT INTO dvf_d972.disposition VALUES(NEW.*); RETURN NULL;
ELSIF (NEW.coddep='973') THEN INSERT INTO dvf_d973.disposition VALUES(NEW.*); RETURN NULL;
ELSIF (NEW.coddep='974') THEN INSERT INTO dvf_d974.disposition VALUES(NEW.*); RETURN NULL;
ELSE RETURN NULL;END IF;
END;
$$;


--
-- TOC entry 4196 (class 1255 OID 1208986462)
-- Name: disposition_parcelle_insert_trigger(); Type: FUNCTION; Schema: dvf; Owner: -
--

CREATE FUNCTION dvf.disposition_parcelle_insert_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
     IF (NEW.coddep='94') THEN INSERT INTO dvf_d94.disposition_parcelle VALUES(NEW.*); RETURN NULL;
ELSIF (NEW.coddep='95') THEN INSERT INTO dvf_d95.disposition_parcelle VALUES(NEW.*); RETURN NULL;
ELSIF (NEW.coddep='971') THEN INSERT INTO dvf_d971.disposition_parcelle VALUES(NEW.*); RETURN NULL;
ELSIF (NEW.coddep='972') THEN INSERT INTO dvf_d972.disposition_parcelle VALUES(NEW.*); RETURN NULL;
ELSIF (NEW.coddep='973') THEN INSERT INTO dvf_d973.disposition_parcelle VALUES(NEW.*); RETURN NULL;
ELSIF (NEW.coddep='974') THEN INSERT INTO dvf_d974.disposition_parcelle VALUES(NEW.*); RETURN NULL;
ELSE RETURN NULL;END IF;
END;
$$;


--
-- TOC entry 4206 (class 1255 OID 1208992019)
-- Name: disposition_parcelle_plus_insert_trigger(); Type: FUNCTION; Schema: dvf; Owner: -
--

CREATE FUNCTION dvf.disposition_parcelle_plus_insert_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
     IF (NEW.coddep='01') THEN INSERT INTO dvf_d01.disposition_parcelle_plus VALUES(NEW.*); RETURN NULL;
ELSIF (NEW.coddep='02') THEN INSERT INTO dvf_d02.disposition_parcelle_plus VALUES(NEW.*); RETURN NULL;
ELSIF (NEW.coddep='03') THEN INSERT INTO dvf_d03.disposition_parcelle_plus VALUES(NEW.*); RETURN NULL;
ELSIF (NEW.coddep='04') THEN INSERT INTO dvf_d04.disposition_parcelle_plus VALUES(NEW.*); RETURN NULL;
ELSIF (NEW.coddep='05') THEN INSERT INTO dvf_d05.disposition_parcelle_plus VALUES(NEW.*); RETURN NULL;
ELSE RETURN NULL;END IF;
END;
$$;


--
-- TOC entry 4198 (class 1255 OID 1208986466)
-- Name: local_insert_trigger(); Type: FUNCTION; Schema: dvf; Owner: -
--

CREATE FUNCTION dvf.local_insert_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
     IF (NEW.coddep='94') THEN INSERT INTO dvf_d94.local VALUES(NEW.*); RETURN NULL;
ELSIF (NEW.coddep='95') THEN INSERT INTO dvf_d95.local VALUES(NEW.*); RETURN NULL;
ELSIF (NEW.coddep='971') THEN INSERT INTO dvf_d971.local VALUES(NEW.*); RETURN NULL;
ELSIF (NEW.coddep='972') THEN INSERT INTO dvf_d972.local VALUES(NEW.*); RETURN NULL;
ELSIF (NEW.coddep='973') THEN INSERT INTO dvf_d973.local VALUES(NEW.*); RETURN NULL;
ELSIF (NEW.coddep='974') THEN INSERT INTO dvf_d974.local VALUES(NEW.*); RETURN NULL;
ELSE RETURN NULL;END IF;
END;
$$;


--
-- TOC entry 4205 (class 1255 OID 1208992017)
-- Name: local_plus_insert_trigger(); Type: FUNCTION; Schema: dvf; Owner: -
--

CREATE FUNCTION dvf.local_plus_insert_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
     IF (NEW.coddep='01') THEN INSERT INTO dvf_d01.local_plus VALUES(NEW.*); RETURN NULL;
ELSIF (NEW.coddep='02') THEN INSERT INTO dvf_d02.local_plus VALUES(NEW.*); RETURN NULL;
ELSIF (NEW.coddep='03') THEN INSERT INTO dvf_d03.local_plus VALUES(NEW.*); RETURN NULL;
ELSIF (NEW.coddep='04') THEN INSERT INTO dvf_d04.local_plus VALUES(NEW.*); RETURN NULL;
ELSIF (NEW.coddep='05') THEN INSERT INTO dvf_d05.local_plus VALUES(NEW.*); RETURN NULL;
ELSE RETURN NULL;END IF;
END;
$$;


--
-- TOC entry 4202 (class 1255 OID 1208986474)
-- Name: lot_insert_trigger(); Type: FUNCTION; Schema: dvf; Owner: -
--

CREATE FUNCTION dvf.lot_insert_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
     IF (NEW.coddep='94') THEN INSERT INTO dvf_d94.lot VALUES(NEW.*); RETURN NULL;
ELSIF (NEW.coddep='95') THEN INSERT INTO dvf_d95.lot VALUES(NEW.*); RETURN NULL;
ELSIF (NEW.coddep='971') THEN INSERT INTO dvf_d971.lot VALUES(NEW.*); RETURN NULL;
ELSIF (NEW.coddep='972') THEN INSERT INTO dvf_d972.lot VALUES(NEW.*); RETURN NULL;
ELSIF (NEW.coddep='973') THEN INSERT INTO dvf_d973.lot VALUES(NEW.*); RETURN NULL;
ELSIF (NEW.coddep='974') THEN INSERT INTO dvf_d974.lot VALUES(NEW.*); RETURN NULL;
ELSE RETURN NULL;END IF;
END;
$$;


--
-- TOC entry 4194 (class 1255 OID 1208986458)
-- Name: mutation_article_cgi_insert_trigger(); Type: FUNCTION; Schema: dvf; Owner: -
--

CREATE FUNCTION dvf.mutation_article_cgi_insert_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
     IF (NEW.coddep='94') THEN INSERT INTO dvf_d94.mutation_article_cgi VALUES(NEW.*); RETURN NULL;
ELSIF (NEW.coddep='95') THEN INSERT INTO dvf_d95.mutation_article_cgi VALUES(NEW.*); RETURN NULL;
ELSIF (NEW.coddep='971') THEN INSERT INTO dvf_d971.mutation_article_cgi VALUES(NEW.*); RETURN NULL;
ELSIF (NEW.coddep='972') THEN INSERT INTO dvf_d972.mutation_article_cgi VALUES(NEW.*); RETURN NULL;
ELSIF (NEW.coddep='973') THEN INSERT INTO dvf_d973.mutation_article_cgi VALUES(NEW.*); RETURN NULL;
ELSIF (NEW.coddep='974') THEN INSERT INTO dvf_d974.mutation_article_cgi VALUES(NEW.*); RETURN NULL;
ELSE RETURN NULL;END IF;
END;
$$;


--
-- TOC entry 4193 (class 1255 OID 1208986456)
-- Name: mutation_insert_trigger(); Type: FUNCTION; Schema: dvf; Owner: -
--

CREATE FUNCTION dvf.mutation_insert_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
     IF (NEW.coddep='94') THEN INSERT INTO dvf_d94.mutation VALUES(NEW.*); RETURN NULL;
ELSIF (NEW.coddep='95') THEN INSERT INTO dvf_d95.mutation VALUES(NEW.*); RETURN NULL;
ELSIF (NEW.coddep='971') THEN INSERT INTO dvf_d971.mutation VALUES(NEW.*); RETURN NULL;
ELSIF (NEW.coddep='972') THEN INSERT INTO dvf_d972.mutation VALUES(NEW.*); RETURN NULL;
ELSIF (NEW.coddep='973') THEN INSERT INTO dvf_d973.mutation VALUES(NEW.*); RETURN NULL;
ELSIF (NEW.coddep='974') THEN INSERT INTO dvf_d974.mutation VALUES(NEW.*); RETURN NULL;
ELSE RETURN NULL;END IF;
END;
$$;


--
-- TOC entry 4207 (class 1255 OID 1208992021)
-- Name: mutation_plus_insert_trigger(); Type: FUNCTION; Schema: dvf; Owner: -
--

CREATE FUNCTION dvf.mutation_plus_insert_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
     IF (NEW.coddep='01') THEN INSERT INTO dvf_d01.mutation_plus VALUES(NEW.*); RETURN NULL;
ELSIF (NEW.coddep='02') THEN INSERT INTO dvf_d02.mutation_plus VALUES(NEW.*); RETURN NULL;
ELSIF (NEW.coddep='03') THEN INSERT INTO dvf_d03.mutation_plus VALUES(NEW.*); RETURN NULL;
ELSIF (NEW.coddep='04') THEN INSERT INTO dvf_d04.mutation_plus VALUES(NEW.*); RETURN NULL;
ELSIF (NEW.coddep='05') THEN INSERT INTO dvf_d05.mutation_plus VALUES(NEW.*); RETURN NULL;
ELSE RETURN NULL;END IF;
END;
$$;


--
-- TOC entry 4197 (class 1255 OID 1208986464)
-- Name: parcelle_insert_trigger(); Type: FUNCTION; Schema: dvf; Owner: -
--

CREATE FUNCTION dvf.parcelle_insert_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
     IF (NEW.coddep='94') THEN INSERT INTO dvf_d94.parcelle VALUES(NEW.*); RETURN NULL;
ELSIF (NEW.coddep='95') THEN INSERT INTO dvf_d95.parcelle VALUES(NEW.*); RETURN NULL;
ELSIF (NEW.coddep='971') THEN INSERT INTO dvf_d971.parcelle VALUES(NEW.*); RETURN NULL;
ELSIF (NEW.coddep='972') THEN INSERT INTO dvf_d972.parcelle VALUES(NEW.*); RETURN NULL;
ELSIF (NEW.coddep='973') THEN INSERT INTO dvf_d973.parcelle VALUES(NEW.*); RETURN NULL;
ELSIF (NEW.coddep='974') THEN INSERT INTO dvf_d974.parcelle VALUES(NEW.*); RETURN NULL;
ELSE RETURN NULL;END IF;
END;
$$;


--
-- TOC entry 4200 (class 1255 OID 1208986470)
-- Name: suf_insert_trigger(); Type: FUNCTION; Schema: dvf; Owner: -
--

CREATE FUNCTION dvf.suf_insert_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
     IF (NEW.coddep='94') THEN INSERT INTO dvf_d94.suf VALUES(NEW.*); RETURN NULL;
ELSIF (NEW.coddep='95') THEN INSERT INTO dvf_d95.suf VALUES(NEW.*); RETURN NULL;
ELSIF (NEW.coddep='971') THEN INSERT INTO dvf_d971.suf VALUES(NEW.*); RETURN NULL;
ELSIF (NEW.coddep='972') THEN INSERT INTO dvf_d972.suf VALUES(NEW.*); RETURN NULL;
ELSIF (NEW.coddep='973') THEN INSERT INTO dvf_d973.suf VALUES(NEW.*); RETURN NULL;
ELSIF (NEW.coddep='974') THEN INSERT INTO dvf_d974.suf VALUES(NEW.*); RETURN NULL;
ELSE RETURN NULL;END IF;
END;
$$;


--
-- TOC entry 4201 (class 1255 OID 1208986472)
-- Name: volume_insert_trigger(); Type: FUNCTION; Schema: dvf; Owner: -
--

CREATE FUNCTION dvf.volume_insert_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
     IF (NEW.coddep='94') THEN INSERT INTO dvf_d94.volume VALUES(NEW.*); RETURN NULL;
ELSIF (NEW.coddep='95') THEN INSERT INTO dvf_d95.volume VALUES(NEW.*); RETURN NULL;
ELSIF (NEW.coddep='971') THEN INSERT INTO dvf_d971.volume VALUES(NEW.*); RETURN NULL;
ELSIF (NEW.coddep='972') THEN INSERT INTO dvf_d972.volume VALUES(NEW.*); RETURN NULL;
ELSIF (NEW.coddep='973') THEN INSERT INTO dvf_d973.volume VALUES(NEW.*); RETURN NULL;
ELSIF (NEW.coddep='974') THEN INSERT INTO dvf_d974.volume VALUES(NEW.*); RETURN NULL;
ELSE RETURN NULL;END IF;
END;
$$;


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 307 (class 1259 OID 1208985869)
-- Name: adresse; Type: TABLE; Schema: dvf; Owner: -
--

CREATE TABLE dvf.adresse (
    idadresse integer NOT NULL,
    novoie integer,
    btq character varying(1),
    typvoie character varying(4),
    codvoie character varying(4),
    voie character varying(254),
    codepostal character varying(5),
    commune character varying(45),
    idadrinvar character varying(532),
    coddep character varying(3)
);


--
-- TOC entry 14159 (class 0 OID 0)
-- Dependencies: 307
-- Name: TABLE adresse; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON TABLE dvf.adresse IS 'table contenant les adresses (provenant des parcelles et des locaux';


--
-- TOC entry 14160 (class 0 OID 0)
-- Dependencies: 307
-- Name: COLUMN adresse.idadresse; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.adresse.idadresse IS 'identifiant pour clef primaire';


--
-- TOC entry 14161 (class 0 OID 0)
-- Dependencies: 307
-- Name: COLUMN adresse.novoie; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.adresse.novoie IS 'numéro de la voie';


--
-- TOC entry 14162 (class 0 OID 0)
-- Dependencies: 307
-- Name: COLUMN adresse.btq; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.adresse.btq IS 'indice de répétition';


--
-- TOC entry 14163 (class 0 OID 0)
-- Dependencies: 307
-- Name: COLUMN adresse.typvoie; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.adresse.typvoie IS 'type de voie';


--
-- TOC entry 14164 (class 0 OID 0)
-- Dependencies: 307
-- Name: COLUMN adresse.codvoie; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.adresse.codvoie IS 'code de la voie';


--
-- TOC entry 14165 (class 0 OID 0)
-- Dependencies: 307
-- Name: COLUMN adresse.voie; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.adresse.voie IS 'libellé de la voie';


--
-- TOC entry 14166 (class 0 OID 0)
-- Dependencies: 307
-- Name: COLUMN adresse.codepostal; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.adresse.codepostal IS 'code postal';


--
-- TOC entry 14167 (class 0 OID 0)
-- Dependencies: 307
-- Name: COLUMN adresse.commune; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.adresse.commune IS 'libellé de la commune';


--
-- TOC entry 14168 (class 0 OID 0)
-- Dependencies: 307
-- Name: COLUMN adresse.idadrinvar; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.adresse.idadrinvar IS 'identifiant invariant de la table adresse';


--
-- TOC entry 14169 (class 0 OID 0)
-- Dependencies: 307
-- Name: COLUMN adresse.coddep; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.adresse.coddep IS 'code du département';


--
-- TOC entry 314 (class 1259 OID 1208985900)
-- Name: adresse_dispoparc; Type: TABLE; Schema: dvf; Owner: -
--

CREATE TABLE dvf.adresse_dispoparc (
    idadresse integer,
    iddispopar integer,
    coddep character varying(3),
    idmutation integer
);


--
-- TOC entry 14170 (class 0 OID 0)
-- Dependencies: 314
-- Name: TABLE adresse_dispoparc; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON TABLE dvf.adresse_dispoparc IS 'table de liaison entre la table adresse et la table disposition_parcelle';


--
-- TOC entry 14171 (class 0 OID 0)
-- Dependencies: 314
-- Name: COLUMN adresse_dispoparc.idadresse; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.adresse_dispoparc.idadresse IS 'identifiant de la table adresse';


--
-- TOC entry 14172 (class 0 OID 0)
-- Dependencies: 314
-- Name: COLUMN adresse_dispoparc.iddispopar; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.adresse_dispoparc.iddispopar IS 'identifiant de la table disposition_parcelle';


--
-- TOC entry 14173 (class 0 OID 0)
-- Dependencies: 314
-- Name: COLUMN adresse_dispoparc.coddep; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.adresse_dispoparc.coddep IS 'code du département';


--
-- TOC entry 14174 (class 0 OID 0)
-- Dependencies: 314
-- Name: COLUMN adresse_dispoparc.idmutation; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.adresse_dispoparc.idmutation IS 'identifiant de clef primaire de la table mutation';


--
-- TOC entry 306 (class 1259 OID 1208985867)
-- Name: adresse_idadresse_seq; Type: SEQUENCE; Schema: dvf; Owner: -
--

CREATE SEQUENCE dvf.adresse_idadresse_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 14175 (class 0 OID 0)
-- Dependencies: 306
-- Name: adresse_idadresse_seq; Type: SEQUENCE OWNED BY; Schema: dvf; Owner: -
--

ALTER SEQUENCE dvf.adresse_idadresse_seq OWNED BY dvf.adresse.idadresse;


--
-- TOC entry 315 (class 1259 OID 1208985903)
-- Name: adresse_local; Type: TABLE; Schema: dvf; Owner: -
--

CREATE TABLE dvf.adresse_local (
    idadresse integer,
    iddispoloc integer,
    coddep character varying(3),
    idmutation integer
);


--
-- TOC entry 14176 (class 0 OID 0)
-- Dependencies: 315
-- Name: TABLE adresse_local; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON TABLE dvf.adresse_local IS 'table de liaison entre la table adresse et la table local';


--
-- TOC entry 14177 (class 0 OID 0)
-- Dependencies: 315
-- Name: COLUMN adresse_local.idadresse; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.adresse_local.idadresse IS 'identifiant de la table adresse';


--
-- TOC entry 14178 (class 0 OID 0)
-- Dependencies: 315
-- Name: COLUMN adresse_local.iddispoloc; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.adresse_local.iddispoloc IS 'identifiant de la table local';


--
-- TOC entry 14179 (class 0 OID 0)
-- Dependencies: 315
-- Name: COLUMN adresse_local.coddep; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.adresse_local.coddep IS 'code du département';


--
-- TOC entry 14180 (class 0 OID 0)
-- Dependencies: 315
-- Name: COLUMN adresse_local.idmutation; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.adresse_local.idmutation IS 'identifiant de clef primaire de la table mutation';


--
-- TOC entry 303 (class 1259 OID 1208985839)
-- Name: disposition; Type: TABLE; Schema: dvf; Owner: -
--

CREATE TABLE dvf.disposition (
    iddispo integer NOT NULL,
    idmutation integer,
    nodispo integer,
    valeurfonc numeric,
    nblot integer,
    coddep character varying(3)
);


--
-- TOC entry 14181 (class 0 OID 0)
-- Dependencies: 303
-- Name: TABLE disposition; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON TABLE dvf.disposition IS 'table des dispositions';


--
-- TOC entry 14182 (class 0 OID 0)
-- Dependencies: 303
-- Name: COLUMN disposition.iddispo; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.disposition.iddispo IS 'identifiant pour clef primaire';


--
-- TOC entry 14183 (class 0 OID 0)
-- Dependencies: 303
-- Name: COLUMN disposition.idmutation; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.disposition.idmutation IS 'identifiant de clef primaire de la table mutation';


--
-- TOC entry 14184 (class 0 OID 0)
-- Dependencies: 303
-- Name: COLUMN disposition.nodispo; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.disposition.nodispo IS 'numéro de disposition';


--
-- TOC entry 14185 (class 0 OID 0)
-- Dependencies: 303
-- Name: COLUMN disposition.valeurfonc; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.disposition.valeurfonc IS 'prix ou évaluation déclarée dans le cadre d''une mutation onéreuse';


--
-- TOC entry 14186 (class 0 OID 0)
-- Dependencies: 303
-- Name: COLUMN disposition.nblot; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.disposition.nblot IS 'nombre total de lots dans la disposition';


--
-- TOC entry 14187 (class 0 OID 0)
-- Dependencies: 303
-- Name: COLUMN disposition.coddep; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.disposition.coddep IS 'code du département';


--
-- TOC entry 302 (class 1259 OID 1208985837)
-- Name: disposition_iddispo_seq; Type: SEQUENCE; Schema: dvf; Owner: -
--

CREATE SEQUENCE dvf.disposition_iddispo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 14188 (class 0 OID 0)
-- Dependencies: 302
-- Name: disposition_iddispo_seq; Type: SEQUENCE OWNED BY; Schema: dvf; Owner: -
--

ALTER SEQUENCE dvf.disposition_iddispo_seq OWNED BY dvf.disposition.iddispo;


--
-- TOC entry 439 (class 1259 OID 1208991821)
-- Name: disposition_parcelle; Type: TABLE; Schema: dvf; Owner: -
--

CREATE TABLE dvf.disposition_parcelle (
    iddispopar integer NOT NULL,
    iddispo integer,
    idparcelle integer,
    idmutation integer,
    idpar character varying(14),
    coddep character varying(3),
    codcomm character varying(3),
    prefsect character varying(3),
    nosect character varying(2),
    noplan character varying(4),
    datemut date,
    anneemut integer,
    moismut integer,
    parcvendue boolean,
    nbmutjour integer,
    nbmutannee integer,
    datemutpre date,
    l_idmutpre integer[],
    datemutsui date,
    l_idmutsui integer[],
    dcnt01 numeric,
    dcnt02 numeric,
    dcnt03 numeric,
    dcnt04 numeric,
    dcnt05 numeric,
    dcnt06 numeric,
    dcnt07 numeric,
    dcnt08 numeric,
    dcnt09 numeric,
    dcnt10 numeric,
    dcnt11 numeric,
    dcnt12 numeric,
    dcnt13 numeric,
    dcntsol numeric,
    dcntagri numeric,
    dcntnat numeric,
    geomloc public.geometry,
    geompar public.geometry
);


--
-- TOC entry 14189 (class 0 OID 0)
-- Dependencies: 439
-- Name: TABLE disposition_parcelle; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON TABLE dvf.disposition_parcelle IS 'table des parcelles attachées à une disposition';


--
-- TOC entry 14190 (class 0 OID 0)
-- Dependencies: 439
-- Name: COLUMN disposition_parcelle.iddispopar; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.disposition_parcelle.iddispopar IS 'identifiant pour clef primaire';


--
-- TOC entry 14191 (class 0 OID 0)
-- Dependencies: 439
-- Name: COLUMN disposition_parcelle.iddispo; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.disposition_parcelle.iddispo IS 'identifiant de la table disposition';


--
-- TOC entry 14192 (class 0 OID 0)
-- Dependencies: 439
-- Name: COLUMN disposition_parcelle.idparcelle; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.disposition_parcelle.idparcelle IS 'identifiant de la table parcelle';


--
-- TOC entry 14193 (class 0 OID 0)
-- Dependencies: 439
-- Name: COLUMN disposition_parcelle.idmutation; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.disposition_parcelle.idmutation IS 'identifiant de clef primaire de la table mutation';


--
-- TOC entry 14194 (class 0 OID 0)
-- Dependencies: 439
-- Name: COLUMN disposition_parcelle.idpar; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.disposition_parcelle.idpar IS 'identifiant de la parcelle (idem Fichiers fonciers)';


--
-- TOC entry 14195 (class 0 OID 0)
-- Dependencies: 439
-- Name: COLUMN disposition_parcelle.coddep; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.disposition_parcelle.coddep IS 'code du département';


--
-- TOC entry 14196 (class 0 OID 0)
-- Dependencies: 439
-- Name: COLUMN disposition_parcelle.codcomm; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.disposition_parcelle.codcomm IS 'code insee de la commune';


--
-- TOC entry 14197 (class 0 OID 0)
-- Dependencies: 439
-- Name: COLUMN disposition_parcelle.prefsect; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.disposition_parcelle.prefsect IS 'prefixe de section de la parcelle';


--
-- TOC entry 14198 (class 0 OID 0)
-- Dependencies: 439
-- Name: COLUMN disposition_parcelle.nosect; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.disposition_parcelle.nosect IS 'numéro de section de la parcelle';


--
-- TOC entry 14199 (class 0 OID 0)
-- Dependencies: 439
-- Name: COLUMN disposition_parcelle.noplan; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.disposition_parcelle.noplan IS 'numéro de la parcelle';


--
-- TOC entry 14200 (class 0 OID 0)
-- Dependencies: 439
-- Name: COLUMN disposition_parcelle.datemut; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.disposition_parcelle.datemut IS 'date de signature du document (acte de vente)';


--
-- TOC entry 14201 (class 0 OID 0)
-- Dependencies: 439
-- Name: COLUMN disposition_parcelle.anneemut; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.disposition_parcelle.anneemut IS 'annee de signature du document';


--
-- TOC entry 14202 (class 0 OID 0)
-- Dependencies: 439
-- Name: COLUMN disposition_parcelle.moismut; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.disposition_parcelle.moismut IS 'mois de signature du document';


--
-- TOC entry 14203 (class 0 OID 0)
-- Dependencies: 439
-- Name: COLUMN disposition_parcelle.parcvendue; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.disposition_parcelle.parcvendue IS 'Vrai si la parcelle fait partie de la vente';


--
-- TOC entry 14204 (class 0 OID 0)
-- Dependencies: 439
-- Name: COLUMN disposition_parcelle.nbmutjour; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.disposition_parcelle.nbmutjour IS 'nombre de mutations de la parcelle au cours de la journée';


--
-- TOC entry 14205 (class 0 OID 0)
-- Dependencies: 439
-- Name: COLUMN disposition_parcelle.nbmutannee; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.disposition_parcelle.nbmutannee IS 'nombre de mutations de la parcelle au cours de l''année calendaire';


--
-- TOC entry 14206 (class 0 OID 0)
-- Dependencies: 439
-- Name: COLUMN disposition_parcelle.datemutpre; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.disposition_parcelle.datemutpre IS 'date de la précédente mutation de la parcelle (date antérieure)';


--
-- TOC entry 14207 (class 0 OID 0)
-- Dependencies: 439
-- Name: COLUMN disposition_parcelle.l_idmutpre; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.disposition_parcelle.l_idmutpre IS 'identifiants des mutations précédentes de la parcelle ayant eu lieu à la date de mutation précédente (datemutpre)';


--
-- TOC entry 14208 (class 0 OID 0)
-- Dependencies: 439
-- Name: COLUMN disposition_parcelle.datemutsui; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.disposition_parcelle.datemutsui IS 'date de la mutation suivante de la parcelle (date postérieure)';


--
-- TOC entry 14209 (class 0 OID 0)
-- Dependencies: 439
-- Name: COLUMN disposition_parcelle.l_idmutsui; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.disposition_parcelle.l_idmutsui IS 'identifiants des mutations suivantes de la parcelle ayant eu lieu à la date de mutation suivante (datemutsui)';


--
-- TOC entry 14210 (class 0 OID 0)
-- Dependencies: 439
-- Name: COLUMN disposition_parcelle.dcnt01; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.disposition_parcelle.dcnt01 IS 'surface de suf de type 01 ayant muté';


--
-- TOC entry 14211 (class 0 OID 0)
-- Dependencies: 439
-- Name: COLUMN disposition_parcelle.dcnt02; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.disposition_parcelle.dcnt02 IS 'surface de suf de type 02  ayant muté';


--
-- TOC entry 14212 (class 0 OID 0)
-- Dependencies: 439
-- Name: COLUMN disposition_parcelle.dcnt03; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.disposition_parcelle.dcnt03 IS 'surface de suf de type 03 ayant muté';


--
-- TOC entry 14213 (class 0 OID 0)
-- Dependencies: 439
-- Name: COLUMN disposition_parcelle.dcnt04; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.disposition_parcelle.dcnt04 IS 'surface de suf de type 04 ayant muté';


--
-- TOC entry 14214 (class 0 OID 0)
-- Dependencies: 439
-- Name: COLUMN disposition_parcelle.dcnt05; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.disposition_parcelle.dcnt05 IS 'surface de suf de type 05 ayant muté';


--
-- TOC entry 14215 (class 0 OID 0)
-- Dependencies: 439
-- Name: COLUMN disposition_parcelle.dcnt06; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.disposition_parcelle.dcnt06 IS 'surface de suf de type 06 ayant muté';


--
-- TOC entry 14216 (class 0 OID 0)
-- Dependencies: 439
-- Name: COLUMN disposition_parcelle.dcnt07; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.disposition_parcelle.dcnt07 IS 'surface de suf de type 07 ayant muté';


--
-- TOC entry 14217 (class 0 OID 0)
-- Dependencies: 439
-- Name: COLUMN disposition_parcelle.dcnt08; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.disposition_parcelle.dcnt08 IS 'surface de suf de type 08 ayant muté';


--
-- TOC entry 14218 (class 0 OID 0)
-- Dependencies: 439
-- Name: COLUMN disposition_parcelle.dcnt09; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.disposition_parcelle.dcnt09 IS 'surface de suf de type 09 ayant muté';


--
-- TOC entry 14219 (class 0 OID 0)
-- Dependencies: 439
-- Name: COLUMN disposition_parcelle.dcnt10; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.disposition_parcelle.dcnt10 IS 'surface de suf de type 10 ayant muté';


--
-- TOC entry 14220 (class 0 OID 0)
-- Dependencies: 439
-- Name: COLUMN disposition_parcelle.dcnt11; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.disposition_parcelle.dcnt11 IS 'surface de suf de type 11 ayant muté';


--
-- TOC entry 14221 (class 0 OID 0)
-- Dependencies: 439
-- Name: COLUMN disposition_parcelle.dcnt12; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.disposition_parcelle.dcnt12 IS 'surface de suf de type 12 ayant muté';


--
-- TOC entry 14222 (class 0 OID 0)
-- Dependencies: 439
-- Name: COLUMN disposition_parcelle.dcnt13; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.disposition_parcelle.dcnt13 IS 'surface de suf de type 13 ayant muté';


--
-- TOC entry 14223 (class 0 OID 0)
-- Dependencies: 439
-- Name: COLUMN disposition_parcelle.dcntsol; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.disposition_parcelle.dcntsol IS 'surface de suf de type sol ayant muté';


--
-- TOC entry 14224 (class 0 OID 0)
-- Dependencies: 439
-- Name: COLUMN disposition_parcelle.dcntagri; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.disposition_parcelle.dcntagri IS 'surface de suf de type agricole ayant muté';


--
-- TOC entry 14225 (class 0 OID 0)
-- Dependencies: 439
-- Name: COLUMN disposition_parcelle.dcntnat; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.disposition_parcelle.dcntnat IS 'surface de suf de type naturel ayant muté';


--
-- TOC entry 14226 (class 0 OID 0)
-- Dependencies: 439
-- Name: COLUMN disposition_parcelle.geomloc; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.disposition_parcelle.geomloc IS 'géométrie du localisant de la parcelle';


--
-- TOC entry 14227 (class 0 OID 0)
-- Dependencies: 439
-- Name: COLUMN disposition_parcelle.geompar; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.disposition_parcelle.geompar IS 'géométrie du contour de la parcelle';


--
-- TOC entry 438 (class 1259 OID 1208991819)
-- Name: disposition_parcelle_plus_iddispopar_seq; Type: SEQUENCE; Schema: dvf; Owner: -
--

CREATE SEQUENCE dvf.disposition_parcelle_plus_iddispopar_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 14228 (class 0 OID 0)
-- Dependencies: 438
-- Name: disposition_parcelle_plus_iddispopar_seq; Type: SEQUENCE OWNED BY; Schema: dvf; Owner: -
--

ALTER SEQUENCE dvf.disposition_parcelle_plus_iddispopar_seq OWNED BY dvf.disposition_parcelle.iddispopar;


--
-- TOC entry 437 (class 1259 OID 1208991812)
-- Name: local; Type: TABLE; Schema: dvf; Owner: -
--

CREATE TABLE dvf.local (
    iddispoloc integer NOT NULL,
    iddispopar integer,
    idpar character varying(14),
    idmutation integer,
    idloc character varying(25),
    identloc character varying(7),
    codtyploc integer,
    libtyploc character varying(254),
    nbpprinc integer,
    sbati numeric,
    coddep character varying(3),
    datemut date,
    anneemut integer,
    moismut integer,
    nbmutjour integer,
    nbmutannee integer,
    datemutpre date,
    l_idmutpre integer[],
    datemutsui date,
    l_idmutsui integer[],
    geomloc public.geometry
);


--
-- TOC entry 14229 (class 0 OID 0)
-- Dependencies: 437
-- Name: TABLE local; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON TABLE dvf.local IS 'table des locaux';


--
-- TOC entry 14230 (class 0 OID 0)
-- Dependencies: 437
-- Name: COLUMN local.iddispoloc; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.local.iddispoloc IS 'identifiant de clef primaire de la table local';


--
-- TOC entry 14231 (class 0 OID 0)
-- Dependencies: 437
-- Name: COLUMN local.iddispopar; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.local.iddispopar IS 'identifiant de la table disposition_parcelle';


--
-- TOC entry 14232 (class 0 OID 0)
-- Dependencies: 437
-- Name: COLUMN local.idpar; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.local.idpar IS 'identifiant de la parcelle (idem Fichiers fonciers)';


--
-- TOC entry 14233 (class 0 OID 0)
-- Dependencies: 437
-- Name: COLUMN local.idmutation; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.local.idmutation IS 'identifiant de clef primaire de la table mutation';


--
-- TOC entry 14234 (class 0 OID 0)
-- Dependencies: 437
-- Name: COLUMN local.idloc; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.local.idloc IS 'identifiant du local (Fichier Fonciers)';


--
-- TOC entry 14235 (class 0 OID 0)
-- Dependencies: 437
-- Name: COLUMN local.identloc; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.local.identloc IS 'identifiant du local';


--
-- TOC entry 14236 (class 0 OID 0)
-- Dependencies: 437
-- Name: COLUMN local.codtyploc; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.local.codtyploc IS 'code du type de local';


--
-- TOC entry 14237 (class 0 OID 0)
-- Dependencies: 437
-- Name: COLUMN local.libtyploc; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.local.libtyploc IS 'libellé du type de local';


--
-- TOC entry 14238 (class 0 OID 0)
-- Dependencies: 437
-- Name: COLUMN local.nbpprinc; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.local.nbpprinc IS 'nombre de pièces principales';


--
-- TOC entry 14239 (class 0 OID 0)
-- Dependencies: 437
-- Name: COLUMN local.sbati; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.local.sbati IS 'surface réelle attachée à l''identifiant local';


--
-- TOC entry 14240 (class 0 OID 0)
-- Dependencies: 437
-- Name: COLUMN local.coddep; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.local.coddep IS 'code du département';


--
-- TOC entry 14241 (class 0 OID 0)
-- Dependencies: 437
-- Name: COLUMN local.datemut; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.local.datemut IS 'date de signature du document (acte de vente)';


--
-- TOC entry 14242 (class 0 OID 0)
-- Dependencies: 437
-- Name: COLUMN local.anneemut; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.local.anneemut IS 'annee de signature du document';


--
-- TOC entry 14243 (class 0 OID 0)
-- Dependencies: 437
-- Name: COLUMN local.moismut; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.local.moismut IS 'mois de signature du document';


--
-- TOC entry 14244 (class 0 OID 0)
-- Dependencies: 437
-- Name: COLUMN local.nbmutjour; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.local.nbmutjour IS 'nombre de mutations du local au cours de la journée';


--
-- TOC entry 14245 (class 0 OID 0)
-- Dependencies: 437
-- Name: COLUMN local.nbmutannee; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.local.nbmutannee IS 'nombre de mutations du local au cours de l''année calendaire';


--
-- TOC entry 14246 (class 0 OID 0)
-- Dependencies: 437
-- Name: COLUMN local.datemutpre; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.local.datemutpre IS 'date de la précédente mutation du local';


--
-- TOC entry 14247 (class 0 OID 0)
-- Dependencies: 437
-- Name: COLUMN local.l_idmutpre; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.local.l_idmutpre IS 'identifiants des mutations précédentes du local ayant eu lieu à la date de mutation précédente (datemutpre)';


--
-- TOC entry 14248 (class 0 OID 0)
-- Dependencies: 437
-- Name: COLUMN local.datemutsui; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.local.datemutsui IS 'date de la mutation suivante du local';


--
-- TOC entry 14249 (class 0 OID 0)
-- Dependencies: 437
-- Name: COLUMN local.l_idmutsui; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.local.l_idmutsui IS 'identifiants des mutations suivantes du local ayant eu lieu à la date de mutation suivante (datemutsui)';


--
-- TOC entry 14250 (class 0 OID 0)
-- Dependencies: 437
-- Name: COLUMN local.geomloc; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.local.geomloc IS 'géométrie du localisant';


--
-- TOC entry 436 (class 1259 OID 1208991810)
-- Name: local_plus_iddispoloc_seq; Type: SEQUENCE; Schema: dvf; Owner: -
--

CREATE SEQUENCE dvf.local_plus_iddispoloc_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 14251 (class 0 OID 0)
-- Dependencies: 436
-- Name: local_plus_iddispoloc_seq; Type: SEQUENCE OWNED BY; Schema: dvf; Owner: -
--

ALTER SEQUENCE dvf.local_plus_iddispoloc_seq OWNED BY dvf.local.iddispoloc;


--
-- TOC entry 313 (class 1259 OID 1208985893)
-- Name: lot; Type: TABLE; Schema: dvf; Owner: -
--

CREATE TABLE dvf.lot (
    iddispolot integer NOT NULL,
    iddispopar integer,
    idmutation integer,
    iddispoloc integer,
    nolot character varying(7),
    scarrez numeric,
    coddep character varying(3)
);


--
-- TOC entry 14252 (class 0 OID 0)
-- Dependencies: 313
-- Name: TABLE lot; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON TABLE dvf.lot IS 'table des lots (seuls les 5 premiers lots sont mentionnés)';


--
-- TOC entry 14253 (class 0 OID 0)
-- Dependencies: 313
-- Name: COLUMN lot.iddispolot; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.lot.iddispolot IS 'identifiant pour clef primaire';


--
-- TOC entry 14254 (class 0 OID 0)
-- Dependencies: 313
-- Name: COLUMN lot.iddispopar; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.lot.iddispopar IS 'identifiant de la table disposition_parcelle';


--
-- TOC entry 14255 (class 0 OID 0)
-- Dependencies: 313
-- Name: COLUMN lot.idmutation; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.lot.idmutation IS 'identifiant de clef primaire de la table mutation';


--
-- TOC entry 14256 (class 0 OID 0)
-- Dependencies: 313
-- Name: COLUMN lot.iddispoloc; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.lot.iddispoloc IS 'identifiant de la table local';


--
-- TOC entry 14257 (class 0 OID 0)
-- Dependencies: 313
-- Name: COLUMN lot.nolot; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.lot.nolot IS 'numéro du lot';


--
-- TOC entry 14258 (class 0 OID 0)
-- Dependencies: 313
-- Name: COLUMN lot.scarrez; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.lot.scarrez IS 'surface Loi Carrez du lot';


--
-- TOC entry 14259 (class 0 OID 0)
-- Dependencies: 313
-- Name: COLUMN lot.coddep; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.lot.coddep IS 'code du département';


--
-- TOC entry 312 (class 1259 OID 1208985891)
-- Name: lot_iddispolot_seq; Type: SEQUENCE; Schema: dvf; Owner: -
--

CREATE SEQUENCE dvf.lot_iddispolot_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 14260 (class 0 OID 0)
-- Dependencies: 312
-- Name: lot_iddispolot_seq; Type: SEQUENCE OWNED BY; Schema: dvf; Owner: -
--

ALTER SEQUENCE dvf.lot_iddispolot_seq OWNED BY dvf.lot.iddispolot;


--
-- TOC entry 441 (class 1259 OID 1208991830)
-- Name: mutation; Type: TABLE; Schema: dvf; Owner: -
--

CREATE TABLE dvf.mutation (
    idmutation integer NOT NULL,
    idmutinvar character varying(60),
    idopendata character varying(60),
    idnatmut integer,
    codservch character varying(7),
    refdoc character varying(10),
    datemut date,
    anneemut integer,
    moismut integer,
    coddep character varying(3),
    libnatmut character varying(45),
    nbartcgi integer,
    l_artcgi character varying[],
    vefa boolean,
    valeurfonc numeric,
    nbdispo integer,
    nblot integer,
    nbcomm integer,
    l_codinsee character varying[],
    nbsection integer,
    l_section character varying[],
    nbpar integer,
    l_idpar character varying[],
    nbparmut integer,
    l_idparmut character varying[],
    nbsuf integer,
    sterr numeric,
    l_dcnt numeric[],
    nbvolmut integer,
    nblocmut integer,
    l_idlocmut character varying[],
    nblocmai integer,
    nblocapt integer,
    nblocdep integer,
    nblocact integer,
    nbapt1pp integer,
    nbapt2pp integer,
    nbapt3pp integer,
    nbapt4pp integer,
    nbapt5pp integer,
    nbmai1pp integer,
    nbmai2pp integer,
    nbmai3pp integer,
    nbmai4pp integer,
    nbmai5pp integer,
    sbati numeric,
    sbatmai numeric,
    sbatapt numeric,
    sbatact numeric,
    sapt1pp numeric,
    sapt2pp numeric,
    sapt3pp numeric,
    sapt4pp numeric,
    sapt5pp numeric,
    smai1pp numeric,
    smai2pp numeric,
    smai3pp numeric,
    smai4pp numeric,
    smai5pp numeric,
    geomlocmut public.geometry,
    geomparmut public.geometry,
    geompar public.geometry,
    codtypbien character varying(6),
    libtypbien text
);


--
-- TOC entry 14261 (class 0 OID 0)
-- Dependencies: 441
-- Name: TABLE mutation; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON TABLE dvf.mutation IS 'table des mutations';


--
-- TOC entry 14262 (class 0 OID 0)
-- Dependencies: 441
-- Name: COLUMN mutation.idmutation; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.mutation.idmutation IS 'identifiant de clef primaire de la table mutation';


--
-- TOC entry 14263 (class 0 OID 0)
-- Dependencies: 441
-- Name: COLUMN mutation.idmutinvar; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.mutation.idmutinvar IS 'identifiant invariant de la mutation';


--
-- TOC entry 14264 (class 0 OID 0)
-- Dependencies: 441
-- Name: COLUMN mutation.idopendata; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.mutation.idopendata IS 'identifiant de mutation';


--
-- TOC entry 14265 (class 0 OID 0)
-- Dependencies: 441
-- Name: COLUMN mutation.idnatmut; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.mutation.idnatmut IS 'identifiant de clef primaire de la table ann_nature_mutation';


--
-- TOC entry 14266 (class 0 OID 0)
-- Dependencies: 441
-- Name: COLUMN mutation.codservch; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.mutation.codservch IS 'code du service de conservation des hypothèques';


--
-- TOC entry 14267 (class 0 OID 0)
-- Dependencies: 441
-- Name: COLUMN mutation.refdoc; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.mutation.refdoc IS 'référence d''enregistrement du document (acte de vente)';


--
-- TOC entry 14268 (class 0 OID 0)
-- Dependencies: 441
-- Name: COLUMN mutation.datemut; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.mutation.datemut IS 'date de signature du document (acte de vente)';


--
-- TOC entry 14269 (class 0 OID 0)
-- Dependencies: 441
-- Name: COLUMN mutation.anneemut; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.mutation.anneemut IS 'annee de signature du document';


--
-- TOC entry 14270 (class 0 OID 0)
-- Dependencies: 441
-- Name: COLUMN mutation.moismut; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.mutation.moismut IS 'mois de signature du document';


--
-- TOC entry 14271 (class 0 OID 0)
-- Dependencies: 441
-- Name: COLUMN mutation.coddep; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.mutation.coddep IS 'code du département';


--
-- TOC entry 14272 (class 0 OID 0)
-- Dependencies: 441
-- Name: COLUMN mutation.libnatmut; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.mutation.libnatmut IS 'libellé de la nature de mutation';


--
-- TOC entry 14273 (class 0 OID 0)
-- Dependencies: 441
-- Name: COLUMN mutation.nbartcgi; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.mutation.nbartcgi IS 'nombre d''articles du Code Général des Impôts (CGI) associés à la mutation';


--
-- TOC entry 14274 (class 0 OID 0)
-- Dependencies: 441
-- Name: COLUMN mutation.l_artcgi; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.mutation.l_artcgi IS 'liste des codes d''articles CGI (Code Général des Impôts) associés à la mutation';


--
-- TOC entry 14275 (class 0 OID 0)
-- Dependencies: 441
-- Name: COLUMN mutation.vefa; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.mutation.vefa IS 'vrai si la mutation est une Vente en l''état futur d''achèvement (VEFA)';


--
-- TOC entry 14276 (class 0 OID 0)
-- Dependencies: 441
-- Name: COLUMN mutation.valeurfonc; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.mutation.valeurfonc IS 'prix ou évaluation déclarée dans le cadre d''une mutation onéreuse';


--
-- TOC entry 14277 (class 0 OID 0)
-- Dependencies: 441
-- Name: COLUMN mutation.nbdispo; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.mutation.nbdispo IS 'nombre de dispositions associées à la mutation';


--
-- TOC entry 14278 (class 0 OID 0)
-- Dependencies: 441
-- Name: COLUMN mutation.nblot; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.mutation.nblot IS 'nombre total de lots dans la mutation';


--
-- TOC entry 14279 (class 0 OID 0)
-- Dependencies: 441
-- Name: COLUMN mutation.nbcomm; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.mutation.nbcomm IS 'nombre de communes concernées par la mutation';


--
-- TOC entry 14280 (class 0 OID 0)
-- Dependencies: 441
-- Name: COLUMN mutation.l_codinsee; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.mutation.l_codinsee IS 'liste des codes INSEE des communes concernées par la mutation';


--
-- TOC entry 14281 (class 0 OID 0)
-- Dependencies: 441
-- Name: COLUMN mutation.nbsection; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.mutation.nbsection IS 'nombre de sections concernées par la mutation';


--
-- TOC entry 14282 (class 0 OID 0)
-- Dependencies: 441
-- Name: COLUMN mutation.l_section; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.mutation.l_section IS 'liste des sections concernées par la mutation';


--
-- TOC entry 14283 (class 0 OID 0)
-- Dependencies: 441
-- Name: COLUMN mutation.nbpar; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.mutation.nbpar IS 'nombre de parcelles concernées par la mutation';


--
-- TOC entry 14284 (class 0 OID 0)
-- Dependencies: 441
-- Name: COLUMN mutation.l_idpar; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.mutation.l_idpar IS 'liste des identifiants de parcelles concernées par la mutation (idpar)';


--
-- TOC entry 14285 (class 0 OID 0)
-- Dependencies: 441
-- Name: COLUMN mutation.nbparmut; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.mutation.nbparmut IS 'nombre de parcelles ayant muté';


--
-- TOC entry 14286 (class 0 OID 0)
-- Dependencies: 441
-- Name: COLUMN mutation.l_idparmut; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.mutation.l_idparmut IS 'liste des identifiants de parcelles ayant muté (idpar)';


--
-- TOC entry 14287 (class 0 OID 0)
-- Dependencies: 441
-- Name: COLUMN mutation.nbsuf; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.mutation.nbsuf IS 'nombre de subdivisions fiscales ayant muté';


--
-- TOC entry 14288 (class 0 OID 0)
-- Dependencies: 441
-- Name: COLUMN mutation.sterr; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.mutation.sterr IS 'surface de terrain ayant muté';


--
-- TOC entry 14289 (class 0 OID 0)
-- Dependencies: 441
-- Name: COLUMN mutation.l_dcnt; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.mutation.l_dcnt IS 'Liste ordonnée des surfaces de suf de 01 à 13';


--
-- TOC entry 14290 (class 0 OID 0)
-- Dependencies: 441
-- Name: COLUMN mutation.nbvolmut; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.mutation.nbvolmut IS 'nombre de volumes ayant muté';


--
-- TOC entry 14291 (class 0 OID 0)
-- Dependencies: 441
-- Name: COLUMN mutation.nblocmut; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.mutation.nblocmut IS 'nombre de locaux ayant muté';


--
-- TOC entry 14292 (class 0 OID 0)
-- Dependencies: 441
-- Name: COLUMN mutation.l_idlocmut; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.mutation.l_idlocmut IS 'liste des identifiants de locaux ayant muté (idloc)';


--
-- TOC entry 14293 (class 0 OID 0)
-- Dependencies: 441
-- Name: COLUMN mutation.nblocmai; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.mutation.nblocmai IS 'nombre de maisons ayant muté';


--
-- TOC entry 14294 (class 0 OID 0)
-- Dependencies: 441
-- Name: COLUMN mutation.nblocapt; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.mutation.nblocapt IS 'nombre d''appartements ayant muté';


--
-- TOC entry 14295 (class 0 OID 0)
-- Dependencies: 441
-- Name: COLUMN mutation.nblocdep; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.mutation.nblocdep IS 'nombre de dépendances ayant muté';


--
-- TOC entry 14296 (class 0 OID 0)
-- Dependencies: 441
-- Name: COLUMN mutation.nblocact; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.mutation.nblocact IS 'nombre de locaux d''activités ayant muté';


--
-- TOC entry 14297 (class 0 OID 0)
-- Dependencies: 441
-- Name: COLUMN mutation.nbapt1pp; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.mutation.nbapt1pp IS 'nombre d''appartements avec au plus une pièce principale ayant muté';


--
-- TOC entry 14298 (class 0 OID 0)
-- Dependencies: 441
-- Name: COLUMN mutation.nbapt2pp; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.mutation.nbapt2pp IS 'nombre d''appartements avec 2 pièces principales ayant muté';


--
-- TOC entry 14299 (class 0 OID 0)
-- Dependencies: 441
-- Name: COLUMN mutation.nbapt3pp; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.mutation.nbapt3pp IS 'nombre d''appartements avec 3 pièces principales ayant muté';


--
-- TOC entry 14300 (class 0 OID 0)
-- Dependencies: 441
-- Name: COLUMN mutation.nbapt4pp; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.mutation.nbapt4pp IS 'nombre d''appartements avec 4 pièces principales ayant muté';


--
-- TOC entry 14301 (class 0 OID 0)
-- Dependencies: 441
-- Name: COLUMN mutation.nbapt5pp; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.mutation.nbapt5pp IS 'nombre d''appartements avec au moins 5 pièces principales ayant muté';


--
-- TOC entry 14302 (class 0 OID 0)
-- Dependencies: 441
-- Name: COLUMN mutation.nbmai1pp; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.mutation.nbmai1pp IS 'nombre de maisons avec au plus une pièce principale ayant muté';


--
-- TOC entry 14303 (class 0 OID 0)
-- Dependencies: 441
-- Name: COLUMN mutation.nbmai2pp; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.mutation.nbmai2pp IS 'nombre de maisons avec 2 pièces principales ayant muté';


--
-- TOC entry 14304 (class 0 OID 0)
-- Dependencies: 441
-- Name: COLUMN mutation.nbmai3pp; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.mutation.nbmai3pp IS 'nombre de maisons avec 3 pièces principales ayant muté';


--
-- TOC entry 14305 (class 0 OID 0)
-- Dependencies: 441
-- Name: COLUMN mutation.nbmai4pp; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.mutation.nbmai4pp IS 'nombre de maisons avec 4 pièces principales ayant muté';


--
-- TOC entry 14306 (class 0 OID 0)
-- Dependencies: 441
-- Name: COLUMN mutation.nbmai5pp; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.mutation.nbmai5pp IS 'nombre de maisons avec au moins 5 pièces principales ayant muté';


--
-- TOC entry 14307 (class 0 OID 0)
-- Dependencies: 441
-- Name: COLUMN mutation.sbati; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.mutation.sbati IS 'surface de l''ensemble du bâti ayant muté';


--
-- TOC entry 14308 (class 0 OID 0)
-- Dependencies: 441
-- Name: COLUMN mutation.sbatmai; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.mutation.sbatmai IS 'surface de l''ensemble des maisons ayant muté';


--
-- TOC entry 14309 (class 0 OID 0)
-- Dependencies: 441
-- Name: COLUMN mutation.sbatapt; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.mutation.sbatapt IS 'surface de l''ensemble des appartements ayant muté';


--
-- TOC entry 14310 (class 0 OID 0)
-- Dependencies: 441
-- Name: COLUMN mutation.sbatact; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.mutation.sbatact IS 'surface de l''ensemble du bâti d''activité ayant muté';


--
-- TOC entry 14311 (class 0 OID 0)
-- Dependencies: 441
-- Name: COLUMN mutation.sapt1pp; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.mutation.sapt1pp IS 'surface de l''ensemble des appartements avec au plus une pièce principale ayant muté';


--
-- TOC entry 14312 (class 0 OID 0)
-- Dependencies: 441
-- Name: COLUMN mutation.sapt2pp; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.mutation.sapt2pp IS 'surface de l''ensemble des appartements avec 2 pièces principales ayant muté';


--
-- TOC entry 14313 (class 0 OID 0)
-- Dependencies: 441
-- Name: COLUMN mutation.sapt3pp; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.mutation.sapt3pp IS 'surface de l''ensemble des appartements avec 3 pièces principales ayant muté';


--
-- TOC entry 14314 (class 0 OID 0)
-- Dependencies: 441
-- Name: COLUMN mutation.sapt4pp; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.mutation.sapt4pp IS 'surface de l''ensemble des appartements avec 4 pièces principales ayant muté';


--
-- TOC entry 14315 (class 0 OID 0)
-- Dependencies: 441
-- Name: COLUMN mutation.sapt5pp; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.mutation.sapt5pp IS 'surface de l''ensemble des appartements avec au moins 5 pièces principales ayant muté';


--
-- TOC entry 14316 (class 0 OID 0)
-- Dependencies: 441
-- Name: COLUMN mutation.smai1pp; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.mutation.smai1pp IS 'surface de l''ensemble des maisons avec au plus une pièce principale ayant muté';


--
-- TOC entry 14317 (class 0 OID 0)
-- Dependencies: 441
-- Name: COLUMN mutation.smai2pp; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.mutation.smai2pp IS 'surface de l''ensemble des maisons avec 2 pièces principales ayant muté';


--
-- TOC entry 14318 (class 0 OID 0)
-- Dependencies: 441
-- Name: COLUMN mutation.smai3pp; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.mutation.smai3pp IS 'surface de l''ensemble des maisons avec 3 pièces principales ayant muté';


--
-- TOC entry 14319 (class 0 OID 0)
-- Dependencies: 441
-- Name: COLUMN mutation.smai4pp; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.mutation.smai4pp IS 'surface de l''ensemble des maisons avec 4 pièces principales ayant muté';


--
-- TOC entry 14320 (class 0 OID 0)
-- Dependencies: 441
-- Name: COLUMN mutation.smai5pp; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.mutation.smai5pp IS 'surface de l''ensemble des maisons avec au moins 5 pièces principales ayant muté';


--
-- TOC entry 14321 (class 0 OID 0)
-- Dependencies: 441
-- Name: COLUMN mutation.geomlocmut; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.mutation.geomlocmut IS 'géométrie de l''ensemble des localisants correspondant à des parcelles surlesquelles un local a muté';


--
-- TOC entry 14322 (class 0 OID 0)
-- Dependencies: 441
-- Name: COLUMN mutation.geomparmut; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.mutation.geomparmut IS 'géométrie de l''ensemble des contours des parcelles ayant muté';


--
-- TOC entry 14323 (class 0 OID 0)
-- Dependencies: 441
-- Name: COLUMN mutation.geompar; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.mutation.geompar IS 'geométrie de l''ensemble des contours des parcelles concernées par la mutation';


--
-- TOC entry 14324 (class 0 OID 0)
-- Dependencies: 441
-- Name: COLUMN mutation.codtypbien; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.mutation.codtypbien IS 'code de la typologie des biens du GnDVF';


--
-- TOC entry 14325 (class 0 OID 0)
-- Dependencies: 441
-- Name: COLUMN mutation.libtypbien; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.mutation.libtypbien IS 'libellé de la typologie des biens du GnDVF';


--
-- TOC entry 301 (class 1259 OID 1208985834)
-- Name: mutation_article_cgi; Type: TABLE; Schema: dvf; Owner: -
--

CREATE TABLE dvf.mutation_article_cgi (
    idmutation integer,
    idartcgi integer,
    ordarticgi integer,
    coddep character varying(3)
);


--
-- TOC entry 14326 (class 0 OID 0)
-- Dependencies: 301
-- Name: TABLE mutation_article_cgi; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON TABLE dvf.mutation_article_cgi IS 'table des articles du code général des impôts (CGI) attachés à la mutation';


--
-- TOC entry 14327 (class 0 OID 0)
-- Dependencies: 301
-- Name: COLUMN mutation_article_cgi.idmutation; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.mutation_article_cgi.idmutation IS 'identifiant de clef primaire de la table mutation';


--
-- TOC entry 14328 (class 0 OID 0)
-- Dependencies: 301
-- Name: COLUMN mutation_article_cgi.idartcgi; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.mutation_article_cgi.idartcgi IS 'identifiant de la table annexe ann_cgi';


--
-- TOC entry 14329 (class 0 OID 0)
-- Dependencies: 301
-- Name: COLUMN mutation_article_cgi.ordarticgi; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.mutation_article_cgi.ordarticgi IS 'numéro de l''ordre de l''article cgi';


--
-- TOC entry 14330 (class 0 OID 0)
-- Dependencies: 301
-- Name: COLUMN mutation_article_cgi.coddep; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.mutation_article_cgi.coddep IS 'code du département';


--
-- TOC entry 440 (class 1259 OID 1208991828)
-- Name: mutation_plus_idmutation_seq; Type: SEQUENCE; Schema: dvf; Owner: -
--

CREATE SEQUENCE dvf.mutation_plus_idmutation_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 14331 (class 0 OID 0)
-- Dependencies: 440
-- Name: mutation_plus_idmutation_seq; Type: SEQUENCE OWNED BY; Schema: dvf; Owner: -
--

ALTER SEQUENCE dvf.mutation_plus_idmutation_seq OWNED BY dvf.mutation.idmutation;


--
-- TOC entry 305 (class 1259 OID 1208985854)
-- Name: parcelle; Type: TABLE; Schema: dvf; Owner: -
--

CREATE TABLE dvf.parcelle (
    idparcelle integer NOT NULL,
    idpar character varying(14),
    coddep character varying(3),
    codcomm character varying(3),
    prefsect character varying(3),
    nosect character varying(2),
    noplan character varying(4)
);


--
-- TOC entry 14332 (class 0 OID 0)
-- Dependencies: 305
-- Name: TABLE parcelle; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON TABLE dvf.parcelle IS 'table des parcelles';


--
-- TOC entry 14333 (class 0 OID 0)
-- Dependencies: 305
-- Name: COLUMN parcelle.idparcelle; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.parcelle.idparcelle IS 'identifiant pour clef primaire';


--
-- TOC entry 14334 (class 0 OID 0)
-- Dependencies: 305
-- Name: COLUMN parcelle.idpar; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.parcelle.idpar IS 'identifiant de la parcelle (idem Fichiers fonciers)';


--
-- TOC entry 14335 (class 0 OID 0)
-- Dependencies: 305
-- Name: COLUMN parcelle.coddep; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.parcelle.coddep IS 'code du département';


--
-- TOC entry 14336 (class 0 OID 0)
-- Dependencies: 305
-- Name: COLUMN parcelle.codcomm; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.parcelle.codcomm IS 'code insee de la commune';


--
-- TOC entry 14337 (class 0 OID 0)
-- Dependencies: 305
-- Name: COLUMN parcelle.prefsect; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.parcelle.prefsect IS 'prefixe de section de la parcelle';


--
-- TOC entry 14338 (class 0 OID 0)
-- Dependencies: 305
-- Name: COLUMN parcelle.nosect; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.parcelle.nosect IS 'numéro de section de la parcelle';


--
-- TOC entry 14339 (class 0 OID 0)
-- Dependencies: 305
-- Name: COLUMN parcelle.noplan; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.parcelle.noplan IS 'numéro de la parcelle';


--
-- TOC entry 304 (class 1259 OID 1208985852)
-- Name: parcelle_idparcelle_seq; Type: SEQUENCE; Schema: dvf; Owner: -
--

CREATE SEQUENCE dvf.parcelle_idparcelle_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 14340 (class 0 OID 0)
-- Dependencies: 304
-- Name: parcelle_idparcelle_seq; Type: SEQUENCE OWNED BY; Schema: dvf; Owner: -
--

ALTER SEQUENCE dvf.parcelle_idparcelle_seq OWNED BY dvf.parcelle.idparcelle;


--
-- TOC entry 309 (class 1259 OID 1208985878)
-- Name: suf; Type: TABLE; Schema: dvf; Owner: -
--

CREATE TABLE dvf.suf (
    iddisposuf integer NOT NULL,
    iddispopar integer,
    idmutation integer,
    nbsufidt integer,
    sterr numeric,
    natcult character varying(2),
    natcultspe character varying(5),
    idsufinvar character varying(18),
    coddep character varying(3),
    nodcnt integer
);


--
-- TOC entry 14341 (class 0 OID 0)
-- Dependencies: 309
-- Name: TABLE suf; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON TABLE dvf.suf IS 'table des subdivisions fiscales';


--
-- TOC entry 14342 (class 0 OID 0)
-- Dependencies: 309
-- Name: COLUMN suf.iddisposuf; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.suf.iddisposuf IS 'identifiant pour clef primaire';


--
-- TOC entry 14343 (class 0 OID 0)
-- Dependencies: 309
-- Name: COLUMN suf.iddispopar; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.suf.iddispopar IS 'identifiant de la table disposition_parcelle';


--
-- TOC entry 14344 (class 0 OID 0)
-- Dependencies: 309
-- Name: COLUMN suf.idmutation; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.suf.idmutation IS 'identifiant de clef primaire de la table mutation';


--
-- TOC entry 14345 (class 0 OID 0)
-- Dependencies: 309
-- Name: COLUMN suf.nbsufidt; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.suf.nbsufidt IS 'nombre de suf identiques';


--
-- TOC entry 14346 (class 0 OID 0)
-- Dependencies: 309
-- Name: COLUMN suf.sterr; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.suf.sterr IS 'surface de terrain ayant muté';


--
-- TOC entry 14347 (class 0 OID 0)
-- Dependencies: 309
-- Name: COLUMN suf.natcult; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.suf.natcult IS 'libellé de nature de culture';


--
-- TOC entry 14348 (class 0 OID 0)
-- Dependencies: 309
-- Name: COLUMN suf.natcultspe; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.suf.natcultspe IS 'groupe de nature de culture spéciale';


--
-- TOC entry 14349 (class 0 OID 0)
-- Dependencies: 309
-- Name: COLUMN suf.idsufinvar; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.suf.idsufinvar IS 'identifiant invariant de la table suf';


--
-- TOC entry 14350 (class 0 OID 0)
-- Dependencies: 309
-- Name: COLUMN suf.coddep; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.suf.coddep IS 'code du département';


--
-- TOC entry 14351 (class 0 OID 0)
-- Dependencies: 309
-- Name: COLUMN suf.nodcnt; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.suf.nodcnt IS 'type de la suf';


--
-- TOC entry 308 (class 1259 OID 1208985876)
-- Name: suf_iddisposuf_seq; Type: SEQUENCE; Schema: dvf; Owner: -
--

CREATE SEQUENCE dvf.suf_iddisposuf_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 14352 (class 0 OID 0)
-- Dependencies: 308
-- Name: suf_iddisposuf_seq; Type: SEQUENCE OWNED BY; Schema: dvf; Owner: -
--

ALTER SEQUENCE dvf.suf_iddisposuf_seq OWNED BY dvf.suf.iddisposuf;


--
-- TOC entry 311 (class 1259 OID 1208985887)
-- Name: volume; Type: TABLE; Schema: dvf; Owner: -
--

CREATE TABLE dvf.volume (
    iddispovol integer NOT NULL,
    iddispopar integer,
    idmutation integer,
    novolume character varying(7),
    coddep character varying(3)
);


--
-- TOC entry 14353 (class 0 OID 0)
-- Dependencies: 311
-- Name: TABLE volume; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON TABLE dvf.volume IS 'table des volumes (division de l''espace dans la hauteur pour certaines co-propriétés verticales';


--
-- TOC entry 14354 (class 0 OID 0)
-- Dependencies: 311
-- Name: COLUMN volume.iddispovol; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.volume.iddispovol IS 'identifiant pour clef primaire';


--
-- TOC entry 14355 (class 0 OID 0)
-- Dependencies: 311
-- Name: COLUMN volume.iddispopar; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.volume.iddispopar IS 'identifiant de la table disposition_parcelle';


--
-- TOC entry 14356 (class 0 OID 0)
-- Dependencies: 311
-- Name: COLUMN volume.idmutation; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.volume.idmutation IS 'identifiant de clef primaire de la table mutation';


--
-- TOC entry 14357 (class 0 OID 0)
-- Dependencies: 311
-- Name: COLUMN volume.novolume; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.volume.novolume IS 'numéro de volume';


--
-- TOC entry 14358 (class 0 OID 0)
-- Dependencies: 311
-- Name: COLUMN volume.coddep; Type: COMMENT; Schema: dvf; Owner: -
--

COMMENT ON COLUMN dvf.volume.coddep IS 'code du département';


--
-- TOC entry 310 (class 1259 OID 1208985885)
-- Name: volume_iddispovol_seq; Type: SEQUENCE; Schema: dvf; Owner: -
--

CREATE SEQUENCE dvf.volume_iddispovol_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 14359 (class 0 OID 0)
-- Dependencies: 310
-- Name: volume_iddispovol_seq; Type: SEQUENCE OWNED BY; Schema: dvf; Owner: -
--

ALTER SEQUENCE dvf.volume_iddispovol_seq OWNED BY dvf.volume.iddispovol;


--
-- TOC entry 2934 (class 1259 OID 1218014736)
-- Name: ann_cgi; Type: TABLE; Schema: dvf_annexe; Owner: -
--

CREATE TABLE dvf_annexe.ann_cgi (
    idartcgi integer NOT NULL,
    artcgi character varying(20),
    libartcgi character varying(254)
);


--
-- TOC entry 14360 (class 0 OID 0)
-- Dependencies: 2934
-- Name: TABLE ann_cgi; Type: COMMENT; Schema: dvf_annexe; Owner: -
--

COMMENT ON TABLE dvf_annexe.ann_cgi IS 'table contenant les différents articles CGI';


--
-- TOC entry 2933 (class 1259 OID 1218014734)
-- Name: ann_cgi_idartcgi_seq; Type: SEQUENCE; Schema: dvf_annexe; Owner: -
--

CREATE SEQUENCE dvf_annexe.ann_cgi_idartcgi_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 14361 (class 0 OID 0)
-- Dependencies: 2933
-- Name: ann_cgi_idartcgi_seq; Type: SEQUENCE OWNED BY; Schema: dvf_annexe; Owner: -
--

ALTER SEQUENCE dvf_annexe.ann_cgi_idartcgi_seq OWNED BY dvf_annexe.ann_cgi.idartcgi;


--
-- TOC entry 2931 (class 1259 OID 1218014728)
-- Name: ann_nature_culture; Type: TABLE; Schema: dvf_annexe; Owner: -
--

CREATE TABLE dvf_annexe.ann_nature_culture (
    natcult character varying(2),
    libnatcult character varying(254)
);


--
-- TOC entry 14362 (class 0 OID 0)
-- Dependencies: 2931
-- Name: TABLE ann_nature_culture; Type: COMMENT; Schema: dvf_annexe; Owner: -
--

COMMENT ON TABLE dvf_annexe.ann_nature_culture IS 'table contenant les différentes natures de culture';


--
-- TOC entry 2932 (class 1259 OID 1218014731)
-- Name: ann_nature_culture_speciale; Type: TABLE; Schema: dvf_annexe; Owner: -
--

CREATE TABLE dvf_annexe.ann_nature_culture_speciale (
    natcultspe character varying(5),
    libnatcusp character varying(254)
);


--
-- TOC entry 14363 (class 0 OID 0)
-- Dependencies: 2932
-- Name: TABLE ann_nature_culture_speciale; Type: COMMENT; Schema: dvf_annexe; Owner: -
--

COMMENT ON TABLE dvf_annexe.ann_nature_culture_speciale IS 'table contenant les différentes natures de culture spéciale';


--
-- TOC entry 2936 (class 1259 OID 1218014742)
-- Name: ann_nature_mutation; Type: TABLE; Schema: dvf_annexe; Owner: -
--

CREATE TABLE dvf_annexe.ann_nature_mutation (
    idnatmut integer NOT NULL,
    libnatmut character varying(45)
);


--
-- TOC entry 14364 (class 0 OID 0)
-- Dependencies: 2936
-- Name: TABLE ann_nature_mutation; Type: COMMENT; Schema: dvf_annexe; Owner: -
--

COMMENT ON TABLE dvf_annexe.ann_nature_mutation IS 'table contenant les natures de mutation';


--
-- TOC entry 14365 (class 0 OID 0)
-- Dependencies: 2936
-- Name: COLUMN ann_nature_mutation.idnatmut; Type: COMMENT; Schema: dvf_annexe; Owner: -
--

COMMENT ON COLUMN dvf_annexe.ann_nature_mutation.idnatmut IS 'identifiant de clef primaire de la table ann_nature_mutation';


--
-- TOC entry 14366 (class 0 OID 0)
-- Dependencies: 2936
-- Name: COLUMN ann_nature_mutation.libnatmut; Type: COMMENT; Schema: dvf_annexe; Owner: -
--

COMMENT ON COLUMN dvf_annexe.ann_nature_mutation.libnatmut IS 'libellé de la nature de mutation';


--
-- TOC entry 2935 (class 1259 OID 1218014740)
-- Name: ann_nature_mutation_idnatmut_seq; Type: SEQUENCE; Schema: dvf_annexe; Owner: -
--

CREATE SEQUENCE dvf_annexe.ann_nature_mutation_idnatmut_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 14367 (class 0 OID 0)
-- Dependencies: 2935
-- Name: ann_nature_mutation_idnatmut_seq; Type: SEQUENCE OWNED BY; Schema: dvf_annexe; Owner: -
--

ALTER SEQUENCE dvf_annexe.ann_nature_mutation_idnatmut_seq OWNED BY dvf_annexe.ann_nature_mutation.idnatmut;


--
-- TOC entry 2937 (class 1259 OID 1218014746)
-- Name: ann_type_local; Type: TABLE; Schema: dvf_annexe; Owner: -
--

CREATE TABLE dvf_annexe.ann_type_local (
    codtyploc integer,
    libtyploc character varying(254)
);


--
-- TOC entry 14368 (class 0 OID 0)
-- Dependencies: 2937
-- Name: TABLE ann_type_local; Type: COMMENT; Schema: dvf_annexe; Owner: -
--

COMMENT ON TABLE dvf_annexe.ann_type_local IS 'table contenant les types de locaux';


--
-- TOC entry 468 (class 1259 OID 1208992762)
-- Name: ann_typologie; Type: TABLE; Schema: dvf_annexe; Owner: -
--

CREATE TABLE dvf_annexe.ann_typologie (
    codtypbien character varying(5),
    libtypbien text,
    niv1 character varying(1),
    libniv1 character varying,
    niv2 character varying(2),
    libniv2 character varying,
    niv3 character varying(3),
    libniv3 character varying,
    niv4 character varying(4),
    libniv4 character varying,
    niv5 character varying(5),
    libniv5 character varying
);


--
-- TOC entry 13986 (class 2604 OID 1208985872)
-- Name: idadresse; Type: DEFAULT; Schema: dvf; Owner: -
--

ALTER TABLE ONLY dvf.adresse ALTER COLUMN idadresse SET DEFAULT nextval('dvf.adresse_idadresse_seq'::regclass);


--
-- TOC entry 13984 (class 2604 OID 1208985842)
-- Name: iddispo; Type: DEFAULT; Schema: dvf; Owner: -
--

ALTER TABLE ONLY dvf.disposition ALTER COLUMN iddispo SET DEFAULT nextval('dvf.disposition_iddispo_seq'::regclass);


--
-- TOC entry 13991 (class 2604 OID 1208991824)
-- Name: iddispopar; Type: DEFAULT; Schema: dvf; Owner: -
--

ALTER TABLE ONLY dvf.disposition_parcelle ALTER COLUMN iddispopar SET DEFAULT nextval('dvf.disposition_parcelle_plus_iddispopar_seq'::regclass);


--
-- TOC entry 13990 (class 2604 OID 1208991815)
-- Name: iddispoloc; Type: DEFAULT; Schema: dvf; Owner: -
--

ALTER TABLE ONLY dvf.local ALTER COLUMN iddispoloc SET DEFAULT nextval('dvf.local_plus_iddispoloc_seq'::regclass);


--
-- TOC entry 13989 (class 2604 OID 1208985896)
-- Name: iddispolot; Type: DEFAULT; Schema: dvf; Owner: -
--

ALTER TABLE ONLY dvf.lot ALTER COLUMN iddispolot SET DEFAULT nextval('dvf.lot_iddispolot_seq'::regclass);


--
-- TOC entry 13992 (class 2604 OID 1208991833)
-- Name: idmutation; Type: DEFAULT; Schema: dvf; Owner: -
--

ALTER TABLE ONLY dvf.mutation ALTER COLUMN idmutation SET DEFAULT nextval('dvf.mutation_plus_idmutation_seq'::regclass);


--
-- TOC entry 13985 (class 2604 OID 1208985857)
-- Name: idparcelle; Type: DEFAULT; Schema: dvf; Owner: -
--

ALTER TABLE ONLY dvf.parcelle ALTER COLUMN idparcelle SET DEFAULT nextval('dvf.parcelle_idparcelle_seq'::regclass);


--
-- TOC entry 13987 (class 2604 OID 1208985881)
-- Name: iddisposuf; Type: DEFAULT; Schema: dvf; Owner: -
--

ALTER TABLE ONLY dvf.suf ALTER COLUMN iddisposuf SET DEFAULT nextval('dvf.suf_iddisposuf_seq'::regclass);


--
-- TOC entry 13988 (class 2604 OID 1208985890)
-- Name: iddispovol; Type: DEFAULT; Schema: dvf; Owner: -
--

ALTER TABLE ONLY dvf.volume ALTER COLUMN iddispovol SET DEFAULT nextval('dvf.volume_iddispovol_seq'::regclass);


--
-- TOC entry 13993 (class 2604 OID 1218014739)
-- Name: idartcgi; Type: DEFAULT; Schema: dvf_annexe; Owner: -
--

ALTER TABLE ONLY dvf_annexe.ann_cgi ALTER COLUMN idartcgi SET DEFAULT nextval('dvf_annexe.ann_cgi_idartcgi_seq'::regclass);


--
-- TOC entry 13994 (class 2604 OID 1218014745)
-- Name: idnatmut; Type: DEFAULT; Schema: dvf_annexe; Owner: -
--

ALTER TABLE ONLY dvf_annexe.ann_nature_mutation ALTER COLUMN idnatmut SET DEFAULT nextval('dvf_annexe.ann_nature_mutation_idnatmut_seq'::regclass);


--
-- TOC entry 14131 (class 0 OID 1208985869)
-- Dependencies: 307
-- Data for Name: adresse; Type: TABLE DATA; Schema: dvf; Owner: -
--

COPY dvf.adresse (idadresse, novoie, btq, typvoie, codvoie, voie, codepostal, commune, idadrinvar, coddep) FROM stdin;
\.


--
-- TOC entry 14138 (class 0 OID 1208985900)
-- Dependencies: 314
-- Data for Name: adresse_dispoparc; Type: TABLE DATA; Schema: dvf; Owner: -
--

COPY dvf.adresse_dispoparc (idadresse, iddispopar, coddep, idmutation) FROM stdin;
\.


--
-- TOC entry 14369 (class 0 OID 0)
-- Dependencies: 306
-- Name: adresse_idadresse_seq; Type: SEQUENCE SET; Schema: dvf; Owner: -
--

SELECT pg_catalog.setval('dvf.adresse_idadresse_seq', 9307806, true);


--
-- TOC entry 14139 (class 0 OID 1208985903)
-- Dependencies: 315
-- Data for Name: adresse_local; Type: TABLE DATA; Schema: dvf; Owner: -
--

COPY dvf.adresse_local (idadresse, iddispoloc, coddep, idmutation) FROM stdin;
\.


--
-- TOC entry 14127 (class 0 OID 1208985839)
-- Dependencies: 303
-- Data for Name: disposition; Type: TABLE DATA; Schema: dvf; Owner: -
--

COPY dvf.disposition (iddispo, idmutation, nodispo, valeurfonc, nblot, coddep) FROM stdin;
\.


--
-- TOC entry 14370 (class 0 OID 0)
-- Dependencies: 302
-- Name: disposition_iddispo_seq; Type: SEQUENCE SET; Schema: dvf; Owner: -
--

SELECT pg_catalog.setval('dvf.disposition_iddispo_seq', 16032450, true);


--
-- TOC entry 14143 (class 0 OID 1208991821)
-- Dependencies: 439
-- Data for Name: disposition_parcelle; Type: TABLE DATA; Schema: dvf; Owner: -
--

COPY dvf.disposition_parcelle (iddispopar, iddispo, idparcelle, idmutation, idpar, coddep, codcomm, prefsect, nosect, noplan, datemut, anneemut, moismut, parcvendue, nbmutjour, nbmutannee, datemutpre, l_idmutpre, datemutsui, l_idmutsui, dcnt01, dcnt02, dcnt03, dcnt04, dcnt05, dcnt06, dcnt07, dcnt08, dcnt09, dcnt10, dcnt11, dcnt12, dcnt13, dcntsol, dcntagri, dcntnat, geomloc, geompar) FROM stdin;
\.


--
-- TOC entry 14371 (class 0 OID 0)
-- Dependencies: 438
-- Name: disposition_parcelle_plus_iddispopar_seq; Type: SEQUENCE SET; Schema: dvf; Owner: -
--

SELECT pg_catalog.setval('dvf.disposition_parcelle_plus_iddispopar_seq', 27378094, true);


--
-- TOC entry 14141 (class 0 OID 1208991812)
-- Dependencies: 437
-- Data for Name: local; Type: TABLE DATA; Schema: dvf; Owner: -
--

COPY dvf.local (iddispoloc, iddispopar, idpar, idmutation, idloc, identloc, codtyploc, libtyploc, nbpprinc, sbati, coddep, datemut, anneemut, moismut, nbmutjour, nbmutannee, datemutpre, l_idmutpre, datemutsui, l_idmutsui, geomloc) FROM stdin;
\.


--
-- TOC entry 14372 (class 0 OID 0)
-- Dependencies: 436
-- Name: local_plus_iddispoloc_seq; Type: SEQUENCE SET; Schema: dvf; Owner: -
--

SELECT pg_catalog.setval('dvf.local_plus_iddispoloc_seq', 21027620, true);


--
-- TOC entry 14137 (class 0 OID 1208985893)
-- Dependencies: 313
-- Data for Name: lot; Type: TABLE DATA; Schema: dvf; Owner: -
--

COPY dvf.lot (iddispolot, iddispopar, idmutation, iddispoloc, nolot, scarrez, coddep) FROM stdin;
\.


--
-- TOC entry 14373 (class 0 OID 0)
-- Dependencies: 312
-- Name: lot_iddispolot_seq; Type: SEQUENCE SET; Schema: dvf; Owner: -
--

SELECT pg_catalog.setval('dvf.lot_iddispolot_seq', 16101265, true);


--
-- TOC entry 14145 (class 0 OID 1208991830)
-- Dependencies: 441
-- Data for Name: mutation; Type: TABLE DATA; Schema: dvf; Owner: -
--

COPY dvf.mutation (idmutation, idmutinvar, idopendata, idnatmut, codservch, refdoc, datemut, anneemut, moismut, coddep, libnatmut, nbartcgi, l_artcgi, vefa, valeurfonc, nbdispo, nblot, nbcomm, l_codinsee, nbsection, l_section, nbpar, l_idpar, nbparmut, l_idparmut, nbsuf, sterr, l_dcnt, nbvolmut, nblocmut, l_idlocmut, nblocmai, nblocapt, nblocdep, nblocact, nbapt1pp, nbapt2pp, nbapt3pp, nbapt4pp, nbapt5pp, nbmai1pp, nbmai2pp, nbmai3pp, nbmai4pp, nbmai5pp, sbati, sbatmai, sbatapt, sbatact, sapt1pp, sapt2pp, sapt3pp, sapt4pp, sapt5pp, smai1pp, smai2pp, smai3pp, smai4pp, smai5pp, geomlocmut, geomparmut, geompar, codtypbien, libtypbien) FROM stdin;
\.


--
-- TOC entry 14125 (class 0 OID 1208985834)
-- Dependencies: 301
-- Data for Name: mutation_article_cgi; Type: TABLE DATA; Schema: dvf; Owner: -
--

COPY dvf.mutation_article_cgi (idmutation, idartcgi, ordarticgi, coddep) FROM stdin;
\.


--
-- TOC entry 14374 (class 0 OID 0)
-- Dependencies: 440
-- Name: mutation_plus_idmutation_seq; Type: SEQUENCE SET; Schema: dvf; Owner: -
--

SELECT pg_catalog.setval('dvf.mutation_plus_idmutation_seq', 15739444, true);


--
-- TOC entry 14129 (class 0 OID 1208985854)
-- Dependencies: 305
-- Data for Name: parcelle; Type: TABLE DATA; Schema: dvf; Owner: -
--

COPY dvf.parcelle (idparcelle, idpar, coddep, codcomm, prefsect, nosect, noplan) FROM stdin;
\.


--
-- TOC entry 14375 (class 0 OID 0)
-- Dependencies: 304
-- Name: parcelle_idparcelle_seq; Type: SEQUENCE SET; Schema: dvf; Owner: -
--

SELECT pg_catalog.setval('dvf.parcelle_idparcelle_seq', 18857136, true);


--
-- TOC entry 14133 (class 0 OID 1208985878)
-- Dependencies: 309
-- Data for Name: suf; Type: TABLE DATA; Schema: dvf; Owner: -
--

COPY dvf.suf (iddisposuf, iddispopar, idmutation, nbsufidt, sterr, natcult, natcultspe, idsufinvar, coddep, nodcnt) FROM stdin;
\.


--
-- TOC entry 14376 (class 0 OID 0)
-- Dependencies: 308
-- Name: suf_iddisposuf_seq; Type: SEQUENCE SET; Schema: dvf; Owner: -
--

SELECT pg_catalog.setval('dvf.suf_iddisposuf_seq', 23126356, true);


--
-- TOC entry 14135 (class 0 OID 1208985887)
-- Dependencies: 311
-- Data for Name: volume; Type: TABLE DATA; Schema: dvf; Owner: -
--

COPY dvf.volume (iddispovol, iddispopar, idmutation, novolume, coddep) FROM stdin;
\.


--
-- TOC entry 14377 (class 0 OID 0)
-- Dependencies: 310
-- Name: volume_iddispovol_seq; Type: SEQUENCE SET; Schema: dvf; Owner: -
--

SELECT pg_catalog.setval('dvf.volume_iddispovol_seq', 106178, true);


--
-- TOC entry 14150 (class 0 OID 1218014736)
-- Dependencies: 2934
-- Data for Name: ann_cgi; Type: TABLE DATA; Schema: dvf_annexe; Owner: -
--

COPY dvf_annexe.ann_cgi (idartcgi, artcgi, libartcgi) FROM stdin;
1	1049*1	CGI 1049 *1 : Acquisition par une société HLM autre qu'un office public
2	1115	CGI 1115 : Exo DE sur achats avec engagement de revente
3	1115*1	CGI 1115*1 : Acquisitions par les marchands de biens
4	1115*2	CGI 1115*2 : Echanges par les marchands de biens
5	1137	CGI 1137 : Acquisitions en vue reboisement
6	1594D*1	CGI 1594 D *1 : MTO Immeuble ou de droits immobiliers 
7	1594D*2	CGI 1594 D * 2 : Vente de terrain à bâtir
8	1594FQA	CGI 1594 FquinquièsA : Ventes par marchands de biens dimmeubles achevés dans les 5 ans 
9	1594FQA*1	CGI 1594 F quinquies A *1 : Vente d'immeuble dans les 5 ans de l'achèvement,TVA perçue en SIE
10	1594FQA*2	CGI 1594 F quinquies A *2 : Vente en état futur d'achèvement d'un immeuble, TVA perçue en SIE
11	1594FQa	CGI 1594Fquinquiesa : Droit de 0,60% sur MTO d'immeuble soumises à TVA déposée sur CA3 
12	1594FQB	CGI 1594 FquinquièsB : Droit de 0,60% sur MTO d'immeuble rénovation urbaine
13	1594FQD	CGI 1594 FquinquièsD : Droit  de 0,60% sur MTO d'immeuble rural
14	1594FQE	CGI 1594 FquinquièsE : Acquisitions jeunes agriculteurs ds territoires ruraux de dvpmt prioritaire 
15	1594FQE I	CGI 1594 FQE I: Acquisitions par jeunes agriculteurs bénéficiaires des aides à l'installation
16	1594FQE II	CGI 1594 FQE II: Acquisitions en vue de donner à bail à de jeunes agriculteurs
17	1594FQF	CGI 1594 FquinquièsF: Droit  de 0,60% sur MTO terres incultes, abandonnées
18	1594FQG	CGI 1594 FquinquièsG : Droit de 0,60% sur ATO immeuble par SAFER et SICA (DOM)
19	1594Fter	CGI 1594Fter : abattement voté conseil général sur MTO immeuble habitation
20	1594H	CGI 1594 H: Acquisitions logements par HLM ou SEM
21	1594Ibis	CGI 1594 I bis : Acquisition dans DOM, d'un immeuble avec engagement de l'affecter à usage d'hôtel
22	1594OGA	CGI 1594OGA : exo enregistrement sur MTO terrains et immeubles soumises à TVA
23	257-7-1*2	CGI 257-7-1 *2 :  Vente en état futur d'achèvement TVA 19,60%, TPF à 0,6% et salaire à 0,1%
24	257-7-1*3	CGI 257-7-1 *3 : Vente de terrain à bâtir soumise à la TVA 19,60 %, DF à 125 EUR et salaire à 0,1%
25	278 sexies I.1	CGI 278 sexies-I.1: Vente aux HLM de terrain à bâtir. TVA à 5,50%, DFà 125 EUR et salaire à 0,05 %
26	278 sexies I.2	CGI 278 sexies-I.2 : Vente aux HLM. TVA au taux  de 5,50 %, DFà 125 EUR et salaire à 0,05 %
27	278 sexies I.3	CGI 278 sexies-I.3: ventes de logements sociaux neufs à usage locatif
28	278bis	CGI 278 bis : TVA au taux réduit
29	278sex-I	CGI 278 sexiès I : TVA au taux réduit sur ATO de TAB et logements sociaux
30	278sexIAM	CGI 278 sexiès IAM : TVA réduite sur ATO de TAB avec TPF à 0,60% en Alsace Moselle
31	296-1-a-*1	CGI 296-1-a *1 : Vente aux HLM immeuble, terrain à bâtir, soumise à TVA ds les DOM (hors Guyane)
32	296-1-a-*2	CGI 296-1-a *2 : VEFA aux HLM d'immeuble, soumise à TVA dans les DOM (hors Guyane)
33	296-1-b-*2	CGI 296-1-b *2 : VEFA d'un immeuble soumise à TVA 8,50% situé dans les DOM (hors Guyane)
34	691bis	CGI 691 bis : Acquisition de TAB soumise à droit fixe de 125 EUR - TVA sur CA3
35	810-IV	CGI 810-IV : Droit fixe exigible sur apports soumis à TVA
\.


--
-- TOC entry 14378 (class 0 OID 0)
-- Dependencies: 2933
-- Name: ann_cgi_idartcgi_seq; Type: SEQUENCE SET; Schema: dvf_annexe; Owner: -
--

SELECT pg_catalog.setval('dvf_annexe.ann_cgi_idartcgi_seq', 35, true);


--
-- TOC entry 14147 (class 0 OID 1218014728)
-- Dependencies: 2931
-- Data for Name: ann_nature_culture; Type: TABLE DATA; Schema: dvf_annexe; Owner: -
--

COPY dvf_annexe.ann_nature_culture (natcult, libnatcult) FROM stdin;
AB	terrains a bâtir
AG	terrains d'agrément
B	bois
BF	futaies feuillues
BM	futaies mixtes
BO	oseraies
BP	peupleraies
BR	futaies résineuses
BS	taillis sous futaie
BT	taillis simples
CA	carrières
CH	chemin de fer
E	eaux
J	jardins
L	landes
LB	landes boisées
P	prés
PA	pâtures
PC	pacages
PE	prés d'embouche
PH	herbages
PP	prés plantes
S	sols
T	terres
TP	terres plantées
VE	vergers
VI	vignes
\.


--
-- TOC entry 14148 (class 0 OID 1218014731)
-- Dependencies: 2932
-- Data for Name: ann_nature_culture_speciale; Type: TABLE DATA; Schema: dvf_annexe; Owner: -
--

COPY dvf_annexe.ann_nature_culture_speciale (natcultspe, libnatcusp) FROM stdin;
ABREU	Abreuvoirs
ABRIC	Abricotiers
ACACI	Acacias
AEROD	Aérodrome
AIRE	Aire ou airial
ALLEE	Allée (no groupe)
ALLUV	Alluvions
AMAND	Amandiers
ARDOI	Ardoisière
ARGIL	Argilière
ASPER	Aspergerie
AULN	Aulnaie
AVENU	Avenue
BALLA	Ballastière
BAMBO	Bambouseraie
BASS	Bassin
BIEF	Bief
BOUL	Boulaie
BROUS	Broussailles ou buissons
BRUY	Bruyère
BTIGE	Verger exploite en basses tiges
BUIS	Buissière
CAMP	Terrain de camping
CANAL	Canal
CASS	Cassis
CEDRA	Cédratiers
CERCL	Cercliere
CERIS	Cerisaie ou cerisiers
CHASS	Terrain de chasse
CHAT	Châtaigneraie
CHEM	Chemin (non groupe)
CHENE	Chênes
CHLIE	Chênes-lièges
CHTRU	Chênes -truffiers
CHVER	Chênes -verts
CIDRE	Cidre
CITRO	Citronniers
CLAIR	Claires
COING	Cognassiers
COULE	Bois de couleur
CRAY	Crayère
CRESS	Cressonnière
CRYPT	Cryptomeria
DIGUE	Digues
DUNE	Dunes
EAU	Pièce d'eau
ECOLE	Ecole
EPICE	Epicéas
ESPAL	Verger exploite en espaliers
ETANG	Etangs
EUCAL	Eucalyptus
FALAI	Falaise
FAMIL	Familial (jardin)
FER	Chemin de fer
FILAO	Filao
FLOR	Jardin floral
FONT	Fontaine
FOSSE	Fosse
FOUG	Fougeraie
FRAMB	Framboisiers
FRICH	Friche
GAREN	Garenne
GENET	Genets
GLAIS	Glaisière
GRAVE	Gravière
HAIES	Haies fruitières
HERB	Herbage
HETRE	Hêtres
HIST	Dépendances de monument historique
HORT	Jardin horticole
HOUBL	Houblon
HTIGE	Verger exploite en hautes tiges
HUITR	Parc à huîtres
IMM	Dépendances d'ensemble immobilier
IMPRO	Lande improductive
INTEN	Verger industriel
JARD	Jardin d'agrément
JETT	Jettins
JOUAL	Joualle
KIWIS	Kiwis
LAC	Lac
LAGUN	Lagune
LAVOI	Lavoir
LEGUM	Légumière de plein champ
MAQUI	Maquis
MARAI	Pré marais
MARAM	Jardin maraîcher aménagé
MARE	Mare
MAREC	Marécage
MARN	Marnière
MARNA	Jardin maraîcher non aménagé
MELEZ	Mélèzes
MOTTE	Mottes
MUR	Muraies ou muriers (vergers)
NATUR	Bois naturel
NOISE	Noiseraie ou noisetiers
NOYER	Noyeraie ou noyers
NPECH	Etang non pêchable
OLIVE	Oliveraie ou oliviers
ORANG	Orangers (verger)
ORME	Ormaie ou ormes
PACAG	Pacage
PAFEU	Pare -feux
PALMI	Bois palmiste
PARC	Parc
PASS	Passage (no groupe)
PATIS	Patis
PATUR	Pâture plantée
PECH	Etangs pêchables
PECHE	Pêchers
PEPIN	Pépinières
PIEDS	Pieds -mères (vignes)
PIERR	Pierraille. pierrier
PIN	Pins
PLAGE	Plage
PLATR	Plâtrière
PLVEN	Vergers de plein vent
POIRE	Poiriers
POMME	Pommiers
POTAG	Jardin potager
PROTE	Bois de protection
PRUNE	Pruniers
RAIS	Raisin de table
RESER	Réservoir
RESIN	Résineux
RIVAG	Rivage (bois de)
RIZ	Rizière
ROC	Rocs ou rochers
ROUI	Routoir ou ruissoir
RUE	Rue
RUINE	Ruines
SABLE	Sablière
SALIN	Marais salant
SAPIN	Sapins ou sapinière
SART	Sartières
SAULE	Saulaie ou saussaie
SERRE	Serre
SOL	Sol
SOURC	Source
SPORT	Terrain de sport
TAMAR	Tamarin
TAUZ	Taillis tauzin
TERRI	Terrils
TOURB	Tourbière
TOUYA	Touyas
VADC	Vins d'appellation d'origine contrôlée
VAGUE	Terrain vague
VANIL	Vanille
VAOC	Vins d'appellation d'origine contrôlée
VCHAS	Chasselat
VDQS	Vins délimités de qualité supérieure
VIGNE	Vigne
VIVIE	Vivier
\.


--
-- TOC entry 14152 (class 0 OID 1218014742)
-- Dependencies: 2936
-- Data for Name: ann_nature_mutation; Type: TABLE DATA; Schema: dvf_annexe; Owner: -
--

COPY dvf_annexe.ann_nature_mutation (idnatmut, libnatmut) FROM stdin;
1	Vente
2	Vente en l'état futur d'achèvement
3	Expropriation
4	Vente terrain à bâtir
5	Adjudication
6	Echange
\.


--
-- TOC entry 14379 (class 0 OID 0)
-- Dependencies: 2935
-- Name: ann_nature_mutation_idnatmut_seq; Type: SEQUENCE SET; Schema: dvf_annexe; Owner: -
--

SELECT pg_catalog.setval('dvf_annexe.ann_nature_mutation_idnatmut_seq', 6, true);


--
-- TOC entry 14153 (class 0 OID 1218014746)
-- Dependencies: 2937
-- Data for Name: ann_type_local; Type: TABLE DATA; Schema: dvf_annexe; Owner: -
--

COPY dvf_annexe.ann_type_local (codtyploc, libtyploc) FROM stdin;
1	Maison
2	Appartement
3	Dépendance
4	Local industriel, commercial ou assimilé
\.


--
-- TOC entry 14146 (class 0 OID 1208992762)
-- Dependencies: 468
-- Data for Name: ann_typologie; Type: TABLE DATA; Schema: dvf_annexe; Owner: -
--

COPY dvf_annexe.ann_typologie (codtypbien, libtypbien, niv1, libniv1, niv2, libniv2, niv3, libniv3, niv4, libniv4, niv5, libniv5) FROM stdin;
101	BATI - INDETERMINE : Vefa sans descriptif	1	BATI	10	BATI - INDETERMINE	101	BATI - INDETERMINE : Vefa sans descriptif	101	BATI - INDETERMINE : Vefa sans descriptif	101	BATI - INDETERMINE : Vefa sans descriptif
102	BATI - INDETERMINE : Vente avec volume(s)	1	BATI	10	BATI - INDETERMINE	102	BATI - INDETERMINE : Vente avec volume(s)	102	BATI - INDETERMINE : Vente avec volume(s)	102	BATI - INDETERMINE : Vente avec volume(s)
110	MAISON - INDETERMINEE	1	BATI	11	MAISON	110	MAISON - INDETERMINEE	110	MAISON - INDETERMINEE	110	MAISON - INDETERMINEE
111	UNE MAISON	1	BATI	11	MAISON	111	UNE MAISON	111	UNE MAISON	111	UNE MAISON
112	DES MAISONS	1	BATI	11	MAISON	112	DES MAISONS	112	DES MAISONS	112	DES MAISONS
120	APPARTEMENT INDETERMINE	1	BATI	12	APPARTEMENT	120	APPARTEMENT INDETERMINE	120	APPARTEMENT INDETERMINE	120	APPARTEMENT INDETERMINE
121	UN APPARTEMENT	1	BATI	12	APPARTEMENT	121	UN APPARTEMENT	121	UN APPARTEMENT	121	UN APPARTEMENT
122	DEUX APPARTEMENTS	1	BATI	12	APPARTEMENT	122	DEUX APPARTEMENTS	122	DEUX APPARTEMENTS	122	DEUX APPARTEMENTS
131	UNE DEPENDANCE	1	BATI	13	DEPENDANCE	131	UNE DEPENDANCE	131	UNE DEPENDANCE	131	UNE DEPENDANCE
132	DES DEPENDANCES	1	BATI	13	DEPENDANCE	132	DES DEPENDANCES	132	DES DEPENDANCES	132	DES DEPENDANCES
14	ACTIVITE	1	BATI	14	ACTIVITE	14	ACTIVITE	14	ACTIVITE	14	ACTIVITE
151	BATI MIXTE - LOGEMENTS	1	BATI	15	BATI MIXTE	151	BATI MIXTE - LOGEMENTS	151	BATI MIXTE - LOGEMENTS	151	BATI MIXTE - LOGEMENTS
152	BATI MIXTE - LOGEMENT/ACTIVITE	1	BATI	15	BATI MIXTE	152	BATI MIXTE - LOGEMENT/ACTIVITE	152	BATI MIXTE - LOGEMENT/ACTIVITE	152	BATI MIXTE - LOGEMENT/ACTIVITE
20	TERRAIN NON BATIS INDETERMINE	2	NON BATI	20	TERRAIN NON BATIS INDETERMINE	20	TERRAIN NON BATIS INDETERMINE	20	TERRAIN NON BATIS INDETERMINE	20	TERRAIN NON BATIS INDETERMINE
21	TERRAIN DE TYPE TAB	2	NON BATI	21	TERRAIN DE TYPE TAB	21	TERRAIN DE TYPE TAB	21	TERRAIN DE TYPE TAB	21	TERRAIN DE TYPE TAB
221	TERRAIN D'AGREMENT	2	NON BATI	22	TERRAIN ARTIFICIALISE	221	TERRAIN D'AGREMENT	221	TERRAIN D'AGREMENT	221	TERRAIN D'AGREMENT
222	TERRAIN D'EXTRACTION	2	NON BATI	22	TERRAIN ARTIFICIALISE	222	TERRAIN D'EXTRACTION	222	TERRAIN D'EXTRACTION	222	TERRAIN D'EXTRACTION
223	TERRAIN DE TYPE RESEAU	2	NON BATI	22	TERRAIN ARTIFICIALISE	223	TERRAIN DE TYPE RESEAU	223	TERRAIN DE TYPE RESEAU	223	TERRAIN DE TYPE RESEAU
229	TERRAIN ARTIFICIALISE MIXTE	2	NON BATI	22	TERRAIN ARTIFICIALISE	229	TERRAIN ARTIFICIALISE MIXTE	229	TERRAIN ARTIFICIALISE MIXTE	229	TERRAIN ARTIFICIALISE MIXTE
2311	TERRAIN VITICOLE	2	NON BATI	23	TERRAIN NATUREL	231	TERRAIN AGRICOLE	2311	TERRAIN VITICOLE	2311	TERRAIN VITICOLE
2312	TERRAIN VERGER	2	NON BATI	23	TERRAIN NATUREL	231	TERRAIN AGRICOLE	2312	TERRAIN VERGER	2312	TERRAIN VERGER
2313	TERRAIN DE TYPE TERRE ET PRE	2	NON BATI	23	TERRAIN NATUREL	231	TERRAIN AGRICOLE	2313	TERRAIN DE TYPE TERRE ET PRE	2313	TERRAIN DE TYPE TERRE ET PRE
2319	TERRAIN AGRICOLE MIXTE	2	NON BATI	23	TERRAIN NATUREL	231	TERRAIN AGRICOLE	2319	TERRAIN AGRICOLE MIXTE	2319	TERRAIN AGRICOLE MIXTE
232	TERRAIN FORESTIER	2	NON BATI	23	TERRAIN NATUREL	232	TERRAIN FORESTIER	232	TERRAIN FORESTIER	232	TERRAIN FORESTIER
233	TERRAIN LANDES ET EAUX	2	NON BATI	23	TERRAIN NATUREL	233	TERRAIN LANDES ET EAUX	233	TERRAIN LANDES ET EAUX	233	TERRAIN LANDES ET EAUX
239	TERRAIN NATUREL MIXTE	2	NON BATI	23	TERRAIN NATUREL	239	TERRAIN NATUREL MIXTE	239	TERRAIN NATUREL MIXTE	239	TERRAIN NATUREL MIXTE
\.


--
-- TOC entry 14002 (class 2620 OID 1218014726)
-- Name: insert_adresse_dispoparc_trigger; Type: TRIGGER; Schema: dvf; Owner: -
--

CREATE TRIGGER insert_adresse_dispoparc_trigger BEFORE INSERT ON dvf.adresse_dispoparc FOR EACH ROW EXECUTE PROCEDURE dvf.adresse_dispoparc_insert_trigger();


--
-- TOC entry 14003 (class 2620 OID 1218014727)
-- Name: insert_adresse_local_trigger; Type: TRIGGER; Schema: dvf; Owner: -
--

CREATE TRIGGER insert_adresse_local_trigger BEFORE INSERT ON dvf.adresse_local FOR EACH ROW EXECUTE PROCEDURE dvf.adresse_local_insert_trigger();


--
-- TOC entry 13998 (class 2620 OID 1218014722)
-- Name: insert_adresse_trigger; Type: TRIGGER; Schema: dvf; Owner: -
--

CREATE TRIGGER insert_adresse_trigger BEFORE INSERT ON dvf.adresse FOR EACH ROW EXECUTE PROCEDURE dvf.adresse_insert_trigger();


--
-- TOC entry 13996 (class 2620 OID 1218014718)
-- Name: insert_disposition_trigger; Type: TRIGGER; Schema: dvf; Owner: -
--

CREATE TRIGGER insert_disposition_trigger BEFORE INSERT ON dvf.disposition FOR EACH ROW EXECUTE PROCEDURE dvf.disposition_insert_trigger();


--
-- TOC entry 14001 (class 2620 OID 1218014725)
-- Name: insert_lot_trigger; Type: TRIGGER; Schema: dvf; Owner: -
--

CREATE TRIGGER insert_lot_trigger BEFORE INSERT ON dvf.lot FOR EACH ROW EXECUTE PROCEDURE dvf.lot_insert_trigger();


--
-- TOC entry 13995 (class 2620 OID 1218014717)
-- Name: insert_mutation_article_cgi_trigger; Type: TRIGGER; Schema: dvf; Owner: -
--

CREATE TRIGGER insert_mutation_article_cgi_trigger BEFORE INSERT ON dvf.mutation_article_cgi FOR EACH ROW EXECUTE PROCEDURE dvf.mutation_article_cgi_insert_trigger();


--
-- TOC entry 13997 (class 2620 OID 1218014720)
-- Name: insert_parcelle_trigger; Type: TRIGGER; Schema: dvf; Owner: -
--

CREATE TRIGGER insert_parcelle_trigger BEFORE INSERT ON dvf.parcelle FOR EACH ROW EXECUTE PROCEDURE dvf.parcelle_insert_trigger();


--
-- TOC entry 13999 (class 2620 OID 1218014723)
-- Name: insert_suf_trigger; Type: TRIGGER; Schema: dvf; Owner: -
--

CREATE TRIGGER insert_suf_trigger BEFORE INSERT ON dvf.suf FOR EACH ROW EXECUTE PROCEDURE dvf.suf_insert_trigger();


--
-- TOC entry 14000 (class 2620 OID 1218014724)
-- Name: insert_volume_trigger; Type: TRIGGER; Schema: dvf; Owner: -
--

CREATE TRIGGER insert_volume_trigger BEFORE INSERT ON dvf.volume FOR EACH ROW EXECUTE PROCEDURE dvf.volume_insert_trigger();


-- Completed on 2025-04-16 00:16:22 CEST

--
-- PostgreSQL database dump complete
--

-- Add indexes for mutation search
CREATE INDEX idx_mutation_datemut ON dvf.mutation(datemut);
CREATE INDEX idx_adresse_novoie ON dvf.adresse(novoie);
CREATE INDEX idx_adresse_voie ON dvf.adresse(voie);
CREATE INDEX idx_adresse_typvoie ON dvf.adresse(typvoie);
CREATE INDEX idx_adresse_local_idmutation ON dvf.adresse_local(idmutation);
CREATE INDEX idx_adresse_local_idadresse ON dvf.adresse_local(idadresse);

