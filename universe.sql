--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    distance_from_earth numeric NOT NULL,
    num_stars numeric NOT NULL,
    has_supermassive_black_hole boolean NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    planet_id integer NOT NULL,
    diameter_km integer NOT NULL,
    discovered_date date,
    has_water boolean
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    star_id integer NOT NULL,
    mass_earth_masses numeric NOT NULL,
    radius_km integer NOT NULL,
    has_life boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: sky; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.sky (
    sky_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text NOT NULL,
    visible_from_earth boolean NOT NULL
);


ALTER TABLE public.sky OWNER TO freecodecamp;

--
-- Name: sky_sky_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.sky_sky_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sky_sky_id_seq OWNER TO freecodecamp;

--
-- Name: sky_sky_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.sky_sky_id_seq OWNED BY public.sky.sky_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id integer NOT NULL,
    type character varying(50) NOT NULL,
    distance_from_earth numeric
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: sky sky_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.sky ALTER COLUMN sky_id SET DEFAULT nextval('public.sky_sky_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 0, 100000000000, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 2537000, 1000000000000, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 3000000, 40000000, false);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 23000000, 160000000, true);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 29000000, 800000000, true);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 21000000, 1000000000, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 3474, '1610-01-07', true);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 22, '1877-08-18', false);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 12, '1877-08-18', false);
INSERT INTO public.moon VALUES (4, 'Europa', 3, 3122, '1610-01-08', true);
INSERT INTO public.moon VALUES (5, 'Ganymede', 3, 5268, '1610-01-07', true);
INSERT INTO public.moon VALUES (6, 'Callisto', 3, 4821, '1610-01-07', true);
INSERT INTO public.moon VALUES (7, 'Io', 3, 3643, '1610-01-07', false);
INSERT INTO public.moon VALUES (8, 'Titan', 3, 5150, '1655-03-25', true);
INSERT INTO public.moon VALUES (9, 'Enceladus', 3, 504, '1789-08-28', true);
INSERT INTO public.moon VALUES (10, 'Triton', 4, 2707, '1846-10-10', true);
INSERT INTO public.moon VALUES (11, 'Vega Moon 1', 5, 3474, '2000-01-01', false);
INSERT INTO public.moon VALUES (12, 'Procyon Moon 1', 6, 3122, '2001-01-01', false);
INSERT INTO public.moon VALUES (13, 'Altair Moon 1', 7, 4800, '2002-01-01', false);
INSERT INTO public.moon VALUES (14, 'Aldebaran Moon 1', 8, 5262, '2003-01-01', false);
INSERT INTO public.moon VALUES (15, 'Antares Moon 1', 9, 5262, '2004-01-01', false);
INSERT INTO public.moon VALUES (16, 'Spica Moon 1', 10, 5270, '2005-01-01', false);
INSERT INTO public.moon VALUES (17, 'Polaris Moon 1', 11, 5152, '2006-01-01', false);
INSERT INTO public.moon VALUES (18, 'Kepler Moon 1', 12, 4900, '2007-01-01', false);
INSERT INTO public.moon VALUES (19, 'Kepler Moon 2', 12, 4900, '2008-01-01', false);
INSERT INTO public.moon VALUES (20, 'Kepler Moon 3', 12, 4900, '2009-01-01', false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 1.0, 6371, true);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 0.107, 3389, false);
INSERT INTO public.planet VALUES (3, 'Jupiter', 1, 317.8, 69911, false);
INSERT INTO public.planet VALUES (4, 'Proxima b', 4, 1.27, 6371, NULL);
INSERT INTO public.planet VALUES (5, 'Vega b', 6, 1.1, 6371, false);
INSERT INTO public.planet VALUES (6, 'Procyon b', 7, 1.5, 6371, false);
INSERT INTO public.planet VALUES (7, 'Altair b', 8, 0.9, 6371, false);
INSERT INTO public.planet VALUES (8, 'Aldebaran b', 9, 5.8, 6371, false);
INSERT INTO public.planet VALUES (9, 'Antares b', 10, 7.1, 6371, false);
INSERT INTO public.planet VALUES (10, 'Spica b', 11, 2.0, 6371, false);
INSERT INTO public.planet VALUES (11, 'Polaris b', 12, 4.5, 6371, false);
INSERT INTO public.planet VALUES (12, 'Kepler-22b', 2, 2.4, 6371, NULL);


--
-- Data for Name: sky; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.sky VALUES (1, 'Orion', 'A prominent constellation located on the celestial equator and visible throughout the world.', true);
INSERT INTO public.sky VALUES (2, 'Ursa Major', 'A constellation in the northern sky, whose associated mythology likely dates back into prehistory.', true);
INSERT INTO public.sky VALUES (3, 'Cassiopeia', 'A constellation in the northern sky, named after the vain queen Cassiopeia in Greek mythology.', true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'G-Type', 0);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 'A-Type', 8.6);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, 'M-Type', 642.5);
INSERT INTO public.star VALUES (4, 'Alpha Centauri', 2, 'G-Type', 4.37);
INSERT INTO public.star VALUES (5, 'Rigel', 2, 'B-Type', 860);
INSERT INTO public.star VALUES (6, 'Vega', 3, 'A-Type', 25);
INSERT INTO public.star VALUES (7, 'Procyon', 3, 'F-Type', 11.46);
INSERT INTO public.star VALUES (8, 'Altair', 4, 'A-Type', 16.73);
INSERT INTO public.star VALUES (9, 'Aldebaran', 4, 'K-Type', 65.1);
INSERT INTO public.star VALUES (10, 'Antares', 5, 'M-Type', 550);
INSERT INTO public.star VALUES (11, 'Spica', 5, 'B-Type', 250);
INSERT INTO public.star VALUES (12, 'Polaris', 6, 'F-Type', 323);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: sky_sky_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.sky_sky_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 12, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: sky sky_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.sky
    ADD CONSTRAINT sky_name_key UNIQUE (name);


--
-- Name: sky sky_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.sky
    ADD CONSTRAINT sky_pkey PRIMARY KEY (sky_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

