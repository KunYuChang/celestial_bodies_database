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
    galaxy_id integer NOT NULL
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
    number_of_stars integer NOT NULL,
    number_of_clusters integer NOT NULL,
    mass_in_billion_solar_masses numeric(10,2),
    description text,
    contains_life boolean NOT NULL,
    is_visible_from_earth boolean NOT NULL
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
    orbit_period_days integer,
    surface_gravity integer,
    description text,
    has_liquid_water boolean NOT NULL,
    is_inhabited boolean
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
    number_of_moons integer NOT NULL,
    supports_life boolean,
    radius_in_km integer,
    description text,
    has_atmosphere boolean NOT NULL
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
    age_in_million_years integer,
    number_of_planets integer NOT NULL,
    mass_in_solar_masses numeric(10,2),
    description text,
    is_stable boolean NOT NULL,
    has_planetary_system boolean NOT NULL
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

INSERT INTO public.asteroid VALUES (1, 'Ceres', 1);
INSERT INTO public.asteroid VALUES (2, 'Vesta', 1);
INSERT INTO public.asteroid VALUES (3, 'Pallas', 1);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 250000000, 3000, 1500.00, 'Our own galaxy.', true, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 1000000000, 5000, 1100.00, 'Nearest spiral galaxy.', false, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 400000000, 1500, 350.00, 'Part of the Local Group.', false, true);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 300000000, 2500, 430.00, 'Famous for its spiral arms.', false, true);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 200000000, 1200, 890.00, 'Looks like a sombrero hat.', false, true);
INSERT INTO public.galaxy VALUES (6, 'Magellanic Clouds', 50000000, 200, 50.00, 'Irregular dwarf galaxies.', true, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 1, 27, 2, 'The only natural satellite of Earth.', false, false);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 0, 0, 'One of the moons of Mars.', false, false);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 1, 0, 'The smaller moon of Mars.', false, false);
INSERT INTO public.moon VALUES (4, 'Io', 3, 2, 2, 'Most volcanically active body in the Solar System.', false, false);
INSERT INTO public.moon VALUES (5, 'Europa', 3, 4, 1, 'Icy moon with potential sub-surface ocean.', true, false);
INSERT INTO public.moon VALUES (6, 'Ganymede', 3, 7, 1, 'The largest moon in the Solar System.', false, false);
INSERT INTO public.moon VALUES (7, 'Callisto', 3, 17, 1, 'A heavily cratered moon with an ancient surface.', false, false);
INSERT INTO public.moon VALUES (8, 'Titan', 4, 16, 1, 'Largest moon of Saturn with thick atmosphere.', true, false);
INSERT INTO public.moon VALUES (9, 'Rhea', 4, 5, 0, 'Second largest moon of Saturn.', false, false);
INSERT INTO public.moon VALUES (10, 'Iapetus', 4, 79, 0, 'Moon with unusual two-tone coloration.', false, false);
INSERT INTO public.moon VALUES (11, 'Oberon', 5, 14, 0, 'The second largest moon of Uranus.', false, false);
INSERT INTO public.moon VALUES (12, 'Titania', 5, 9, 0, 'Largest moon of Uranus.', false, false);
INSERT INTO public.moon VALUES (13, 'Miranda', 5, 1, 0, 'Smallest of the five major Uranian moons.', false, false);
INSERT INTO public.moon VALUES (14, 'Triton', 6, 6, 1, 'Largest moon of Neptune, orbits in a retrograde direction.', false, false);
INSERT INTO public.moon VALUES (15, 'Proteus', 6, 1, 0, 'Second largest Neptunian moon.', false, false);
INSERT INTO public.moon VALUES (16, 'Charon', 7, 6, 0, 'Largest of the five known moons of Pluto.', false, false);
INSERT INTO public.moon VALUES (17, 'Nix', 7, 25, 0, 'A small natural satellite of Pluto.', false, false);
INSERT INTO public.moon VALUES (18, 'Hydra', 7, 38, 0, 'Outermost moon of Pluto.', false, false);
INSERT INTO public.moon VALUES (19, 'Kerberos', 7, 32, 0, 'Discovered in 2011, a moon of Pluto.', false, false);
INSERT INTO public.moon VALUES (20, 'Styx', 7, 20, 0, 'One of the moons of Pluto, discovered in 2012.', false, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 1, true, 6371, 'Our home planet.', true);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 2, false, 3389, 'The Red Planet.', true);
INSERT INTO public.planet VALUES (3, 'Venus', 1, 0, false, 6051, 'Known for its harsh conditions.', true);
INSERT INTO public.planet VALUES (4, 'Jupiter', 1, 79, false, 69911, 'The largest planet in our solar system.', true);
INSERT INTO public.planet VALUES (5, 'Saturn', 1, 62, false, 58232, 'Famous for its ring system.', true);
INSERT INTO public.planet VALUES (6, 'Neptune', 1, 14, false, 24622, 'Known for its beautiful blue color.', true);
INSERT INTO public.planet VALUES (7, 'Mercury', 1, 0, false, 2440, 'The smallest planet in the Solar System.', false);
INSERT INTO public.planet VALUES (8, 'Uranus', 1, 27, false, 25362, 'An ice giant with a ring system.', true);
INSERT INTO public.planet VALUES (9, 'Pluto', 1, 5, false, 1188, 'A dwarf planet in the Kuiper belt.', false);
INSERT INTO public.planet VALUES (10, 'Kepler-22b', 1, 0, true, 23455, 'An exoplanet in the habitable zone of its star.', true);
INSERT INTO public.planet VALUES (11, 'Gliese 581d', 1, 0, true, 8960, 'Potentially habitable exoplanet.', true);
INSERT INTO public.planet VALUES (12, 'Proxima Centauri b', 3, 0, true, 7012, 'Exoplanet orbiting Proxima Centauri.', false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 4600, 8, 1.00, 'The star at the center of our solar system.', true, true);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 200, 2, 2.10, 'Brightest star in the Earth night sky.', true, false);
INSERT INTO public.star VALUES (3, 'Alpha Centauri', 1, 5400, 1, 1.10, 'Closest star system to the Solar System.', true, true);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 1, 8300, 0, 19.50, 'A red supergiant near the end of its life.', false, false);
INSERT INTO public.star VALUES (5, 'Vega', 1, 455, 0, 2.14, 'One of the most luminous stars in the proximity of the Solar System.', true, false);
INSERT INTO public.star VALUES (6, 'Rigel', 1, 8000, 0, 21.00, 'A blue supergiant star that is the brightest in the constellation Orion.', true, false);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 3, true);


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
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: asteroid asteroid_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

