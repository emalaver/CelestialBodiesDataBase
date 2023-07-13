--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
    size_in_light_years numeric,
    is_an_spiral_galaxy boolean,
    distance_from_earth_in_light_years integer,
    number_of_stars_in_billions integer,
    name character varying NOT NULL,
    constellation text NOT NULL
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
    surface_gravity_in_m_per_s2 numeric NOT NULL,
    radio_in_km numeric,
    shape text,
    temperature_in_c integer,
    planet_id integer,
    name character varying NOT NULL,
    has_water boolean,
    orbit_in_days numeric,
    distance_to_planet_in_km integer
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
    is_in_hab_zone boolean NOT NULL,
    diameter_relative_to_earth numeric,
    planet_type text,
    star_id integer,
    name character varying NOT NULL,
    temperature_in_c integer,
    mass_relative_to_earth numeric,
    orbit_in_days numeric,
    discovery integer
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    distance_from_earth_in_light_years numeric,
    temperature_in_c integer,
    is_a_single_star_system boolean,
    spectral_type text NOT NULL,
    galaxy_id integer,
    name character varying NOT NULL,
    age_in_millions_of_years integer
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
-- Name: stellar; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.stellar (
    stellar_id integer NOT NULL,
    name character varying NOT NULL,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.stellar OWNER TO freecodecamp;

--
-- Name: stellar_stellar_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.stellar_stellar_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stellar_stellar_id_seq OWNER TO freecodecamp;

--
-- Name: stellar_stellar_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.stellar_stellar_id_seq OWNED BY public.stellar.stellar_id;


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: stellar stellar_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.stellar ALTER COLUMN stellar_id SET DEFAULT nextval('public.stellar_stellar_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (2, 87400, true, 26000, 200, 'Milky Way', 'Sagittarius');
INSERT INTO public.galaxy VALUES (3, 200000, true, 2480000, 1000, 'Andromeda', 'Andromeda');
INSERT INTO public.galaxy VALUES (4, 540000, false, 600000000, 2, 'Cygnus A', 'Cygnus');
INSERT INTO public.galaxy VALUES (6, 132000, false, 55000000, 1, 'Virgo A', 'Virgo');
INSERT INTO public.galaxy VALUES (5, 200000, false, 25000, 1, 'Canis Major Dwarf', 'Canis Major');
INSERT INTO public.galaxy VALUES (7, 61120, true, 3200000, 40, 'Triangulum', 'Triangulum');
INSERT INTO public.galaxy VALUES (8, 85000, true, 47000000, 1, 'Messier 77', 'Cetus');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 1.622, 1737.4, 'Spherical', -23, 7, 'Moon', true, 27, 384400);
INSERT INTO public.moon VALUES (2, 0.0057, 11, 'Irregular', -40, 8, 'Phobos', false, 1.25, 6000);
INSERT INTO public.moon VALUES (3, 0.003, 6.2, 'Irregular', -40, 8, 'Deimos', false, 1.263, 23460);
INSERT INTO public.moon VALUES (4, 1.315, 1560.80, 'Spherical', -185, 9, 'Europa', true, 3.54, 670900);
INSERT INTO public.moon VALUES (5, 1.428, 2634, 'Spherical', -163, 9, 'Ganymedes', true, 7.13, 1070000);
INSERT INTO public.moon VALUES (6, 1.236, 2410.30, 'Spherical', -139, 9, 'Callisto', true, 17, 1880000);
INSERT INTO public.moon VALUES (7, 0.077, 198.2, 'Spherical', -209, 10, 'Mimas', true, 0.96, 189176);
INSERT INTO public.moon VALUES (8, 0.145, 531, 'Spherical', -187, 10, 'Tethys', true, 1.88, 294619);
INSERT INTO public.moon VALUES (9, 0.232, 561.4, 'Spherical', -186, 10, 'Dione', true, 2.75, 377396);
INSERT INTO public.moon VALUES (10, 0.264, 763.8, 'Spherical', -193, 10, 'Rhea', true, 4.5, 527108);
INSERT INTO public.moon VALUES (11, 1.352, 2574.70, 'Spherical', -179, 10, 'Titan', false, 16, 1221870);
INSERT INTO public.moon VALUES (12, 0.02, 135, 'Irregular', -180, 10, 'Hyperion', true, 21, 1481009);
INSERT INTO public.moon VALUES (13, 0.223, 734.5, 'Spherical', -187, 10, 'Lapetus', true, 79, 3560820);
INSERT INTO public.moon VALUES (14, 0.079, 235.8, 'Spherical', -187, 11, 'Miranda', true, 1.42, 129900);
INSERT INTO public.moon VALUES (15, 0.249, 578.9, 'Spherical', -215, 11, 'Ariel', true, 2.50, 190000);
INSERT INTO public.moon VALUES (16, 0.20, 584.7, 'Spherical', -193, 11, 'Umbriel', true, 4.14, 266000);
INSERT INTO public.moon VALUES (17, 0.367, 788.4, 'Spherical', -203, 11, 'Titania', true, 8.71, 436300);
INSERT INTO public.moon VALUES (18, 0.354, 761.4, 'Spherical', -198, 11, 'Oberon', true, 13, 583500);
INSERT INTO public.moon VALUES (19, 0.07, 210, 'Irregular', -222, 12, 'Proteus', false, 1.13, 117646);
INSERT INTO public.moon VALUES (20, 0.779, 1353.40, 'Spherical', -238, 12, 'Triton', true, 5.9, 354759);
INSERT INTO public.moon VALUES (21, 0.071, 170, 'Irregular', -222, 12, 'Nereid', true, 360, 5513818);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, false, 0.54, 'Super Earth', 6, 'Kepler 62 c', 305, 4, 12.4, 2013);
INSERT INTO public.planet VALUES (2, true, 1.41, 'Super Earth', 6, 'Kepler 62 f', -34, 35, 267.3, 2013);
INSERT INTO public.planet VALUES (3, false, 1.18, 'Super Earth', 7, 'Tau Ceti g', 49, 1.75, 20.0, 2017);
INSERT INTO public.planet VALUES (4, true, 1.19, 'Super Earth', 7, 'Tau Ceti h', 68, 1.83, 49.4, 2017);
INSERT INTO public.planet VALUES (5, false, 0.38, 'Terrestrial', 3, 'Mercury', 160, 0.06, 88.0, NULL);
INSERT INTO public.planet VALUES (6, false, 0.95, 'Terrestrial', 3, 'Venus', 464, 0.815, 225.0, NULL);
INSERT INTO public.planet VALUES (7, true, 1.0, 'Terrestrial', 3, 'Earth', 15, 1.0, 365, NULL);
INSERT INTO public.planet VALUES (8, true, 0.53, 'Terrestrial', 3, 'Mars', -129, 0.11, 687, NULL);
INSERT INTO public.planet VALUES (9, false, 10.97, 'Gas Gigant', 3, 'Jupiter', -163, 317.8, 4333, NULL);
INSERT INTO public.planet VALUES (10, false, 9.14, 'Gas Gigant', 3, 'Saturn', -176, 95.16, 10759, NULL);
INSERT INTO public.planet VALUES (11, false, 3.98, 'Ice Gigant', 3, 'Uranus', -218, 14.54, 30687, 1781);
INSERT INTO public.planet VALUES (12, false, 3.86, 'Ice Gigant', 3, 'Neptune', -218, 17.15, 60190, 1846);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 8.6, 9667, false, 'A0mA1 Va', 6, 'Sirius A', 242);
INSERT INTO public.star VALUES (2, 4.344, 5517, false, 'K1V', 2, 'Alpha Centauri A', 5300);
INSERT INTO public.star VALUES (3, 0.000016, 5499, true, 'G2V', 2, 'Sun', 4500);
INSERT INTO public.star VALUES (4, 97, 13527, true, 'A3V', 3, 'Alpheratz', 60);
INSERT INTO public.star VALUES (5, 405, 21627, false, 'B2', 6, 'Adhara', 23);
INSERT INTO public.star VALUES (6, 982, 4652, true, 'K2V', 2, 'Kepler 62', 7000);
INSERT INTO public.star VALUES (7, 11.9, 5083, true, 'G8B', 8, 'Tau Ceti h', 10000);


--
-- Data for Name: stellar; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.stellar VALUES (1, 'Kepler 62 c', 2);
INSERT INTO public.stellar VALUES (2, 'Kepler 62 f', 2);
INSERT INTO public.stellar VALUES (3, 'Tau Ceti g', 8);
INSERT INTO public.stellar VALUES (4, 'Tau Ceti h', 8);
INSERT INTO public.stellar VALUES (5, 'Mercury', 2);
INSERT INTO public.stellar VALUES (6, 'Venus', 2);
INSERT INTO public.stellar VALUES (7, 'Earth', 2);
INSERT INTO public.stellar VALUES (8, 'Mars', 2);
INSERT INTO public.stellar VALUES (9, 'Jupyter', 2);
INSERT INTO public.stellar VALUES (10, 'Saturn', 2);
INSERT INTO public.stellar VALUES (11, 'Uranus', 2);
INSERT INTO public.stellar VALUES (12, 'Neptune', 2);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: stellar_stellar_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.stellar_stellar_id_seq', 12, true);


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
-- Name: stellar stellar_name_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.stellar
    ADD CONSTRAINT stellar_name_galaxy_id_key UNIQUE (name, galaxy_id);


--
-- Name: stellar stellar_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.stellar
    ADD CONSTRAINT stellar_pkey PRIMARY KEY (stellar_id);


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

