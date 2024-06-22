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
    type character varying(50),
    distance_from_earth_in_millions integer,
    number_of_stars_in_millions numeric,
    description text
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
    mass double precision,
    radius double precision,
    orbital_period integer,
    distance_from_planet double precision,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    type character varying(50),
    orbital_period double precision,
    distance_from_star double precision,
    description text,
    has_life boolean,
    is_spherical boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    type character varying(50),
    mass numeric,
    description text,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_system; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star_system (
    star_system_id integer NOT NULL,
    name character varying(50) NOT NULL,
    type character varying(50)
);


ALTER TABLE public.star_system OWNER TO freecodecamp;

--
-- Name: star_system_star_system_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_system_star_system_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_system_star_system_id_seq OWNER TO freecodecamp;

--
-- Name: star_system_star_system_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_system_star_system_id_seq OWNED BY public.star_system.star_system_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: star_system star_system_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_system ALTER COLUMN star_system_id SET DEFAULT nextval('public.star_system_star_system_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 0, 100000, 'A barred spiral galaxy that contains our Solar System.');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 2537, 1000000, 'The nearest spiral galaxy to the Milky Way and the largest galaxy in the Local Group.');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 3000, 40, 'A member of the Local Group and the third-largest galaxy.');
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Spiral', 23000, 100, 'Known for its distinctive spiral shape and interaction with a nearby galaxy.');
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Elliptical', 29000, 800, 'An unbarred spiral galaxy with a bright nucleus and large central bulge.');
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 'Elliptical', 54000, 120000, 'A giant elliptical galaxy with a notable jet of energetic plasma.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 0.0123, 1737.4, 27, 384400, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 1e-05, 11.267, 0, 9377, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 2e-06, 6.2, 1, 23460, 4);
INSERT INTO public.moon VALUES (4, 'Io', 0.01496, 1821.6, 2, 421700, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 0.00803, 1560.8, 3, 670900, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 0.025, 2634.1, 7, 1070400, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 0.018, 2410.3, 17, 1882700, 5);
INSERT INTO public.moon VALUES (8, 'Titan', 0.0225, 2574.7, 16, 1221870, 6);
INSERT INTO public.moon VALUES (9, 'Rhea', 0.00038, 764.3, 5, 527040, 6);
INSERT INTO public.moon VALUES (10, 'Iapetus', 2e-05, 734.5, 79, 3561300, 6);
INSERT INTO public.moon VALUES (11, 'Dione', 0.00011, 561.4, 3, 377420, 6);
INSERT INTO public.moon VALUES (12, 'Tethys', 8e-05, 531.1, 2, 294670, 6);
INSERT INTO public.moon VALUES (13, 'Enceladus', 2e-05, 252.1, 1, 237950, 6);
INSERT INTO public.moon VALUES (14, 'Miranda', 0.00066, 235.8, 2, 129900, 7);
INSERT INTO public.moon VALUES (15, 'Ariel', 0.00129, 578.9, 3, 190900, 7);
INSERT INTO public.moon VALUES (16, 'Umbriel', 0.00118, 584.7, 4, 266000, 7);
INSERT INTO public.moon VALUES (17, 'Titania', 0.0035, 788.9, 9, 436300, 7);
INSERT INTO public.moon VALUES (18, 'Oberon', 0.003, 761.4, 13, 583500, 7);
INSERT INTO public.moon VALUES (19, 'Triton', 0.0036, 1353.4, 6, 354800, 8);
INSERT INTO public.moon VALUES (20, 'Nereid', 3e-06, 170, 360, 5513400, 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Terrestrial', 88, 0.39, 'The smallest planet in the Solar System.', false, true, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'Terrestrial', 225, 0.72, 'The second planet from the Sun, with a thick, toxic atmosphere.', false, true, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'Terrestrial', 365.25, 1, 'The only planet known to support life.', true, true, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'Terrestrial', 687, 1.52, 'Known as the Red Planet, it has the tallest volcano in the Solar System.', false, true, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Gas Giant', 4333, 5.2, 'The largest planet in the Solar System with a Great Red Spot.', false, true, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Gas Giant', 10759, 9.58, 'Famous for its prominent ring system.', false, true, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Ice Giant', 30687, 19.22, 'An ice giant with a blue-green color due to methane in its atmosphere.', false, true, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Ice Giant', 60190, 30.05, 'The farthest known planet in the Solar System.', false, true, 1);
INSERT INTO public.planet VALUES (9, 'Proxima b', 'Terrestrial', 11.2, 0.0485, 'A potentially habitable exoplanet orbiting Proxima Centauri.', false, true, 3);
INSERT INTO public.planet VALUES (10, 'Sirius b', 'White Dwarf', 50.1, 20, 'A white dwarf star with a mass comparable to the Sun.', false, true, 2);
INSERT INTO public.planet VALUES (11, 'Betelgeuse b', 'Gas Giant', 4300, 5.5, 'A gas giant orbiting the red supergiant Betelgeuse.', false, true, 4);
INSERT INTO public.planet VALUES (12, 'Rigel b', 'Gas Giant', 4500, 4, 'A massive gas giant in the Rigel system.', false, true, 5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'Yellow Dwarf', 1.0, 'The star at the center of our Solar System.', 1);
INSERT INTO public.star VALUES (2, 'Sirius', 'Main Sequence', 2.02, 'The brightest star in the night sky.', 1);
INSERT INTO public.star VALUES (3, 'Alpha Centauri', 'Main Sequence', 1.1, 'The closest star system to the Solar System.', 1);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 'Red Supergiant', 20.0, 'A well-known red supergiant star in the constellation Orion.', 2);
INSERT INTO public.star VALUES (5, 'Rigel', 'Blue Supergiant', 21.0, 'The brightest star in the constellation Orion.', 2);
INSERT INTO public.star VALUES (6, 'Vega', 'Main Sequence', 2.1, 'The fifth-brightest star in the night sky and the second-brightest star in the northern celestial hemisphere.', 3);


--
-- Data for Name: star_system; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star_system VALUES (1, 'Solar System', 'Single Star');
INSERT INTO public.star_system VALUES (2, 'Alpha Centauri System', 'Triple Star');
INSERT INTO public.star_system VALUES (3, 'Sirius System', 'Binary Star');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: star_system_star_system_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_system_star_system_id_seq', 3, true);


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
-- Name: star_system name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_system
    ADD CONSTRAINT name UNIQUE (name);


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
-- Name: star_system star_system_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_system
    ADD CONSTRAINT star_system_pkey PRIMARY KEY (star_system_id);


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

