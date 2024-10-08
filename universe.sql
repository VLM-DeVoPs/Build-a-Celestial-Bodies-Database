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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(255) NOT NULL,
    size_km double precision NOT NULL,
    is_potentially_hazardous boolean,
    orbit_period_days double precision,
    planet_id integer,
    star_id integer
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    distance_from_earth numeric NOT NULL,
    type text,
    has_life boolean
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
    name character varying(255) NOT NULL,
    planet_id integer NOT NULL,
    size integer,
    is_inhabited boolean,
    orbit_duration integer
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
    name character varying(255) NOT NULL,
    star_id integer NOT NULL,
    radius double precision NOT NULL,
    has_atmosphere boolean,
    population integer
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
    name character varying(255) NOT NULL,
    galaxy_id integer NOT NULL,
    mass double precision NOT NULL,
    is_burning boolean,
    brightness integer
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


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
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 945, false, 1680, 1, NULL);
INSERT INTO public.asteroid VALUES (2, 'Vesta', 525, false, 1325, 1, NULL);
INSERT INTO public.asteroid VALUES (3, 'Eros', 34, true, 643, NULL, 1);
INSERT INTO public.asteroid VALUES (4, 'Pallas', 512, false, 1680, 2, NULL);
INSERT INTO public.asteroid VALUES (5, 'Apophis', 0.325, true, 323, NULL, 5);
INSERT INTO public.asteroid VALUES (6, 'Hygiea', 431, false, 2034, 2, NULL);
INSERT INTO public.asteroid VALUES (7, 'Bennu', 0.492, true, 437, NULL, 1);
INSERT INTO public.asteroid VALUES (8, 'Icarus', 1.4, true, 409, NULL, 3);
INSERT INTO public.asteroid VALUES (9, 'Gaspra', 18, false, 900, NULL, 5);
INSERT INTO public.asteroid VALUES (10, 'Psyche', 226, false, 1825, 3, NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way I', 0, 'Spiral', true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 2537000, 'Spiral', false);
INSERT INTO public.galaxy VALUES (3, 'Whirlpool', 23000000, 'Spiral', false);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 29000000, 'Elliptical', false);
INSERT INTO public.galaxy VALUES (5, 'Triangulum', 3000000, 'Spiral', false);
INSERT INTO public.galaxy VALUES (6, 'Messier 81', 12000000, 'Spiral', false);
INSERT INTO public.galaxy VALUES (7, 'Messier 82', 12000000, 'Spiral', false);
INSERT INTO public.galaxy VALUES (8, 'Centaurus A', 13000000, 'Lenticular', false);
INSERT INTO public.galaxy VALUES (9, 'NGC 6744', 20000000, 'Spiral', false);
INSERT INTO public.galaxy VALUES (10, 'NGC 1300', 50000000, 'Spiral', false);
INSERT INTO public.galaxy VALUES (11, 'NGC 253', 10000000, 'Spiral', false);
INSERT INTO public.galaxy VALUES (12, 'NGC 1365', 60000000, 'Barred Spiral', false);
INSERT INTO public.galaxy VALUES (13, 'NGC 2403', 10000000, 'Spiral', false);
INSERT INTO public.galaxy VALUES (14, 'NGC 300', 6000000, 'Spiral', false);
INSERT INTO public.galaxy VALUES (15, 'NGC 4314', 40000000, 'Spiral', false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 3474, false, 27);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 22, false, 1);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 12, false, 30);
INSERT INTO public.moon VALUES (4, 'Europa', 3, 3121, false, 85);
INSERT INTO public.moon VALUES (5, 'Ganymede', 3, 5268, false, 171);
INSERT INTO public.moon VALUES (6, 'Callisto', 3, 4820, false, 400);
INSERT INTO public.moon VALUES (7, 'Proxima Centauri b I', 4, 3000, false, 100);
INSERT INTO public.moon VALUES (8, 'Alpha Centauri Bb I', 5, 2000, false, 60);
INSERT INTO public.moon VALUES (9, 'Vega I A', 6, 2500, false, 40);
INSERT INTO public.moon VALUES (10, 'Vega II A', 7, 1500, false, 50);
INSERT INTO public.moon VALUES (11, 'Sirius B I A', 8, 1700, false, 20);
INSERT INTO public.moon VALUES (12, 'Sirius B II A', 9, 1800, false, 60);
INSERT INTO public.moon VALUES (13, 'Andromeda I A', 10, 2200, false, 90);
INSERT INTO public.moon VALUES (14, 'Betelgeuse I A', 11, 2400, false, 100);
INSERT INTO public.moon VALUES (15, 'Sombrero I A', 12, 2100, false, 150);
INSERT INTO public.moon VALUES (16, 'Io', 3, 3643, false, 43);
INSERT INTO public.moon VALUES (17, 'Titan', 4, 5150, false, 400);
INSERT INTO public.moon VALUES (18, 'Enceladus', 4, 505, false, 33);
INSERT INTO public.moon VALUES (19, 'Triton', 4, 2707, false, 165);
INSERT INTO public.moon VALUES (20, 'Miranda', 3, 236, false, 1);
INSERT INTO public.moon VALUES (21, 'Oberon', 5, 761, false, 13);
INSERT INTO public.moon VALUES (22, 'Rhea', 1, 764, false, 4);
INSERT INTO public.moon VALUES (23, 'Titania', 3, 789, false, 8);
INSERT INTO public.moon VALUES (24, 'Umbriel', 3, 585, false, 10);
INSERT INTO public.moon VALUES (25, 'Hyperion', 4, 271, false, 21);
INSERT INTO public.moon VALUES (26, 'Iapetus', 4, 735, false, 79);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 6371, true, 780000000);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 3389, true, 0);
INSERT INTO public.planet VALUES (3, 'Jupiter', 1, 69911, false, 0);
INSERT INTO public.planet VALUES (4, 'Proxima b', 5, 6357, true, 0);
INSERT INTO public.planet VALUES (5, 'Alpha Centauri Bb', 5, 5000, false, 0);
INSERT INTO public.planet VALUES (6, 'Vega I', 3, 6000, true, 0);
INSERT INTO public.planet VALUES (7, 'Vega II', 3, 7000, false, 0);
INSERT INTO public.planet VALUES (8, 'Sirius B I', 2, 7000, false, 0);
INSERT INTO public.planet VALUES (9, 'Sirius B II', 2, 8000, true, 0);
INSERT INTO public.planet VALUES (10, 'Andromeda I', 2, 9000, true, 0);
INSERT INTO public.planet VALUES (11, 'Betelgeuse I', 4, 7500, false, 0);
INSERT INTO public.planet VALUES (12, 'Sombrero I', 4, 8000, false, 0);
INSERT INTO public.planet VALUES (13, 'Titan', 1, 2575, true, 0);
INSERT INTO public.planet VALUES (14, 'Europa', 1, 1560, true, 0);
INSERT INTO public.planet VALUES (15, 'Ganymede', 1, 2634, true, 0);
INSERT INTO public.planet VALUES (16, 'Callisto', 1, 2410, false, 0);
INSERT INTO public.planet VALUES (17, 'Exoplanet A', 5, 6200, true, 0);
INSERT INTO public.planet VALUES (18, 'Exoplanet B', 5, 5800, false, 0);
INSERT INTO public.planet VALUES (19, 'Super-Earth 1', 3, 12000, true, 0);
INSERT INTO public.planet VALUES (20, 'Super-Earth 2', 4, 9000, false, 0);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 1.989e+30, true, 100);
INSERT INTO public.star VALUES (2, 'Sirius', 2, 3.978e+30, true, 25);
INSERT INTO public.star VALUES (3, 'Vega', 3, 2.135e+30, true, 50);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 1, 3.085e+31, true, 80);
INSERT INTO public.star VALUES (5, 'Alpha Centauri', 1, 1.1e+30, true, 90);
INSERT INTO public.star VALUES (6, 'Rigel', 4, 4.23e+31, true, 70);
INSERT INTO public.star VALUES (7, 'Proxima Centauri', 1, 2.446e+30, true, 1);
INSERT INTO public.star VALUES (8, 'Aldebaran', 5, 1.65e+31, true, 60);
INSERT INTO public.star VALUES (9, 'Antares', 6, 1.7e+31, true, 80);
INSERT INTO public.star VALUES (10, 'Castor', 7, 2.5e+30, true, 70);
INSERT INTO public.star VALUES (11, 'Pollux', 7, 1.5e+30, true, 65);
INSERT INTO public.star VALUES (12, 'Deneb', 8, 1.77e+31, true, 90);
INSERT INTO public.star VALUES (13, 'Betelgeuse A', 9, 2e+31, true, 75);
INSERT INTO public.star VALUES (14, 'Capella', 10, 1.2e+30, true, 50);
INSERT INTO public.star VALUES (15, 'Aquila', 11, 1.8e+30, true, 55);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 10, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 15, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 26, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 20, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 15, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


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
-- Name: asteroid asteroid_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: asteroid asteroid_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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

