camper: /project$ psql --username=freecodecamp --dbname=postgres
Border style is 2.
Pager usage is off.
psql (12.22 (Ubuntu 12.22-0ubuntu0.20.04.4))
Type "help" for help.

postgres=> \l
                                 List of databases
+-----------+--------------+----------+---------+---------+-----------------------+
|   Name    |    Owner     | Encoding | Collate |  Ctype  |   Access privileges   |
+-----------+--------------+----------+---------+---------+-----------------------+
| postgres  | postgres     | UTF8     | C.UTF-8 | C.UTF-8 |                       |
| template0 | postgres     | UTF8     | C.UTF-8 | C.UTF-8 | =c/postgres          +|
|           |              |          |         |         | postgres=CTc/postgres |
| template1 | postgres     | UTF8     | C.UTF-8 | C.UTF-8 | =c/postgres          +|
|           |              |          |         |         | postgres=CTc/postgres |
| universe  | freecodecamp | UTF8     | C.UTF-8 | C.UTF-8 |                       |
+-----------+--------------+----------+---------+---------+-----------------------+
(4 rows)

postgres=> \c universe
You are now connected to database "universe" as user "freecodecamp".
universe=> pwd
universe-> git push -v
universe-> cat universe.sql
universe-> pwd
universe-> ls -l
universe-> \l
                                 List of databases
+-----------+--------------+----------+---------+---------+-----------------------+
|   Name    |    Owner     | Encoding | Collate |  Ctype  |   Access privileges   |
+-----------+--------------+----------+---------+---------+-----------------------+
| postgres  | postgres     | UTF8     | C.UTF-8 | C.UTF-8 |                       |
| template0 | postgres     | UTF8     | C.UTF-8 | C.UTF-8 | =c/postgres          +|
|           |              |          |         |         | postgres=CTc/postgres |
| template1 | postgres     | UTF8     | C.UTF-8 | C.UTF-8 | =c/postgres          +|
|           |              |          |         |         | postgres=CTc/postgres |
| universe  | freecodecamp | UTF8     | C.UTF-8 | C.UTF-8 |                       |
+-----------+--------------+----------+---------+---------+-----------------------+
(4 rows)

universe-> \q
camper: /project$ pwd
/workspace/project
camper: /project$ ls -l
total 0
camper: /project$ pg_dump -cC --inserts -U freecodecamp universe > universe.sql
camper: /project$ pwd
/workspace/project
camper: /project$ ls -l
total 16
-rw-r--r-- 1 camper camper 13708 Nov 19 06:03 universe.sql
camper: /project$ cat universe.sql
--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
    name character varying(50) NOT NULL,
    galaxy_type character varying(50) NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth integer NOT NULL,
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
    name character varying(50) NOT NULL,
    is_spherical boolean NOT NULL,
    size integer NOT NULL,
    distance_from_planet integer NOT NULL,
    planet_id integer NOT NULL
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
-- Name: observatory; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.observatory (
    observatory_id integer NOT NULL,
    name character varying(50) NOT NULL,
    founded_year integer NOT NULL,
    telescope_count integer NOT NULL,
    budget numeric(12,2) NOT NULL
);


ALTER TABLE public.observatory OWNER TO freecodecamp;

--
-- Name: observatory_observatory_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.observatory_observatory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.observatory_observatory_id_seq OWNER TO freecodecamp;

--
-- Name: observatory_observatory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.observatory_observatory_id_seq OWNED BY public.observatory.observatory_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    has_life boolean NOT NULL,
    radius integer NOT NULL,
    orbit_distance integer NOT NULL,
    star_id integer NOT NULL
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
    name character varying(50) NOT NULL,
    star_type character varying(50) NOT NULL,
    temperature integer NOT NULL,
    mass integer NOT NULL,
    galaxy_id integer NOT NULL
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
-- Name: observatory observatory_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.observatory ALTER COLUMN observatory_id SET DEFAULT nextval('public.observatory_observatory_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 13600, 0, 'Our home galaxy');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 10000, 2537000, 'Nearest major galaxy');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 12000, 2730000, 'Small spiral galaxy');
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'Elliptical', 9000, 29000000, 'Shaped like a sombrero');
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Spiral', 8000, 23000000, 'Companion galaxy nearby');
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 'Spiral', 14000, 21000000, 'Face-on spiral galaxy');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', true, 1737, 384000, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', false, 11, 6000, 2);
INSERT INTO public.moon VALUES (3, 'Deimos', false, 6, 20000, 2);
INSERT INTO public.moon VALUES (4, 'Io', true, 1821, 421700, 7);
INSERT INTO public.moon VALUES (5, 'Europa', true, 1560, 670900, 7);
INSERT INTO public.moon VALUES (6, 'Ganymede', true, 2634, 1070000, 7);
INSERT INTO public.moon VALUES (7, 'Callisto', true, 2410, 1880000, 7);
INSERT INTO public.moon VALUES (8, 'Titan', true, 2575, 1222000, 8);
INSERT INTO public.moon VALUES (9, 'Enceladus', true, 252, 237948, 8);
INSERT INTO public.moon VALUES (10, 'Mimas', false, 198, 185539, 8);
INSERT INTO public.moon VALUES (11, 'Triton', true, 1353, 354760, 10);
INSERT INTO public.moon VALUES (12, 'Proteus', false, 210, 117600, 10);
INSERT INTO public.moon VALUES (13, 'Nereid', false, 170, 5513400, 10);
INSERT INTO public.moon VALUES (14, 'Oberon', true, 761, 583000, 9);
INSERT INTO public.moon VALUES (15, 'Titania', true, 788, 436000, 9);
INSERT INTO public.moon VALUES (16, 'Miranda', false, 236, 129390, 9);
INSERT INTO public.moon VALUES (17, 'Ariel', true, 579, 191020, 9);
INSERT INTO public.moon VALUES (18, 'Umbriel', true, 585, 266000, 9);
INSERT INTO public.moon VALUES (19, 'Charon', true, 606, 17536, 11);
INSERT INTO public.moon VALUES (20, 'Styx', false, 5, 42000, 11);


--
-- Data for Name: observatory; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.observatory VALUES (1, 'Hubble Station', 1990, 12, 150000000.00);
INSERT INTO public.observatory VALUES (2, 'James Webb Center', 2021, 18, 1000000000.00);
INSERT INTO public.observatory VALUES (3, 'ALMA Facility', 2013, 66, 120000000.00);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', true, 6371, 1, 1);
INSERT INTO public.planet VALUES (2, 'Mars', false, 3389, 2, 1);
INSERT INTO public.planet VALUES (3, 'Venus', false, 6051, 0, 1);
INSERT INTO public.planet VALUES (4, 'Mercury', false, 2440, 0, 1);
INSERT INTO public.planet VALUES (5, 'Kepler-22b', false, 15000, 50, 4);
INSERT INTO public.planet VALUES (6, 'Proxima b', false, 7150, 1, 2);
INSERT INTO public.planet VALUES (7, 'Jupiter', false, 69911, 5, 1);
INSERT INTO public.planet VALUES (8, 'Saturn', false, 58232, 6, 1);
INSERT INTO public.planet VALUES (9, 'Uranus', false, 25362, 20, 1);
INSERT INTO public.planet VALUES (10, 'Neptune', false, 24622, 30, 1);
INSERT INTO public.planet VALUES (11, 'Planet X', false, 30000, 100, 6);
INSERT INTO public.planet VALUES (12, 'Gliese 581g', false, 9000, 3, 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'G-Type', 5778, 1, 1);
INSERT INTO public.star VALUES (2, 'Sirius', 'A-Type', 9940, 2, 1);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 'Red Supergiant', 3500, 16, 1);
INSERT INTO public.star VALUES (4, 'Vega', 'A-Type', 9602, 2, 2);
INSERT INTO public.star VALUES (5, 'Rigel', 'Blue Supergiant', 11000, 21, 2);
INSERT INTO public.star VALUES (6, 'Polaris', 'F-Type', 7200, 6, 3);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: observatory_observatory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.observatory_observatory_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: observatory observatory_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.observatory
    ADD CONSTRAINT observatory_name_key UNIQUE (name);


--
-- Name: observatory observatory_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.observatory
    ADD CONSTRAINT observatory_pkey PRIMARY KEY (observatory_id);


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

camper: /project$ 