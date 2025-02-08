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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer NOT NULL,
    guesses integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 1, 399);
INSERT INTO public.games VALUES (2, 1, 90);
INSERT INTO public.games VALUES (3, 2, 613);
INSERT INTO public.games VALUES (4, 2, 567);
INSERT INTO public.games VALUES (5, 1, 301);
INSERT INTO public.games VALUES (6, 1, 734);
INSERT INTO public.games VALUES (7, 1, 690);
INSERT INTO public.games VALUES (8, 5, 611);
INSERT INTO public.games VALUES (9, 5, 663);
INSERT INTO public.games VALUES (10, 6, 415);
INSERT INTO public.games VALUES (11, 6, 637);
INSERT INTO public.games VALUES (12, 5, 876);
INSERT INTO public.games VALUES (13, 5, 194);
INSERT INTO public.games VALUES (14, 5, 779);
INSERT INTO public.games VALUES (15, 7, 18);
INSERT INTO public.games VALUES (16, 8, 256);
INSERT INTO public.games VALUES (17, 8, 646);
INSERT INTO public.games VALUES (18, 9, 471);
INSERT INTO public.games VALUES (19, 9, 427);
INSERT INTO public.games VALUES (20, 8, 309);
INSERT INTO public.games VALUES (21, 8, 153);
INSERT INTO public.games VALUES (22, 8, 595);
INSERT INTO public.games VALUES (23, 10, 975);
INSERT INTO public.games VALUES (24, 10, 865);
INSERT INTO public.games VALUES (25, 11, 561);
INSERT INTO public.games VALUES (26, 11, 213);
INSERT INTO public.games VALUES (27, 10, 449);
INSERT INTO public.games VALUES (28, 10, 437);
INSERT INTO public.games VALUES (29, 10, 66);
INSERT INTO public.games VALUES (30, 12, 649);
INSERT INTO public.games VALUES (31, 12, 740);
INSERT INTO public.games VALUES (32, 13, 512);
INSERT INTO public.games VALUES (33, 13, 620);
INSERT INTO public.games VALUES (34, 12, 581);
INSERT INTO public.games VALUES (35, 12, 181);
INSERT INTO public.games VALUES (36, 12, 469);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'user_1739024808034');
INSERT INTO public.users VALUES (2, 'user_1739024808033');
INSERT INTO public.users VALUES (3, 'user_1739024965252');
INSERT INTO public.users VALUES (4, 'user_1739024965251');
INSERT INTO public.users VALUES (5, 'user_1739025026933');
INSERT INTO public.users VALUES (6, 'user_1739025026932');
INSERT INTO public.users VALUES (7, 'sherfiya');
INSERT INTO public.users VALUES (8, 'user_1739025459047');
INSERT INTO public.users VALUES (9, 'user_1739025459046');
INSERT INTO public.users VALUES (10, 'user_1739025703648');
INSERT INTO public.users VALUES (11, 'user_1739025703647');
INSERT INTO public.users VALUES (12, 'user_1739025852136');
INSERT INTO public.users VALUES (13, 'user_1739025852135');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 36, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 13, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

