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

DROP DATABASE students;
--
-- Name: students; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE students WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE students OWNER TO freecodecamp;

\connect students

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
-- Name: courses; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.courses (
    course_id integer NOT NULL,
    course character varying(100) NOT NULL
);


ALTER TABLE public.courses OWNER TO freecodecamp;

--
-- Name: courses_course_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.courses_course_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.courses_course_id_seq OWNER TO freecodecamp;

--
-- Name: courses_course_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.courses_course_id_seq OWNED BY public.courses.course_id;


--
-- Name: majors; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.majors (
    major_id integer NOT NULL,
    major character varying(50) NOT NULL
);


ALTER TABLE public.majors OWNER TO freecodecamp;

--
-- Name: majors_courses; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.majors_courses (
    major_id integer NOT NULL,
    course_id integer NOT NULL
);


ALTER TABLE public.majors_courses OWNER TO freecodecamp;

--
-- Name: majors_major_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.majors_major_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.majors_major_id_seq OWNER TO freecodecamp;

--
-- Name: majors_major_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.majors_major_id_seq OWNED BY public.majors.major_id;


--
-- Name: students; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.students (
    student_id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    major_id integer,
    gpa numeric(2,1)
);


ALTER TABLE public.students OWNER TO freecodecamp;

--
-- Name: students_student_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.students_student_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.students_student_id_seq OWNER TO freecodecamp;

--
-- Name: students_student_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.students_student_id_seq OWNED BY public.students.student_id;


--
-- Name: courses course_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.courses ALTER COLUMN course_id SET DEFAULT nextval('public.courses_course_id_seq'::regclass);


--
-- Name: majors major_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.majors ALTER COLUMN major_id SET DEFAULT nextval('public.majors_major_id_seq'::regclass);


--
-- Name: students student_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.students ALTER COLUMN student_id SET DEFAULT nextval('public.students_student_id_seq'::regclass);


--
-- Data for Name: courses; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.courses VALUES (1, 'Data Structures and Algorithms');
INSERT INTO public.courses VALUES (2, 'Web Programming');
INSERT INTO public.courses VALUES (3, 'Database Systems');
INSERT INTO public.courses VALUES (4, 'Computer Networks');
INSERT INTO public.courses VALUES (5, 'SQL');
INSERT INTO public.courses VALUES (6, 'Machine Learning');
INSERT INTO public.courses VALUES (7, 'Computer Systems');
INSERT INTO public.courses VALUES (8, 'Web Applications');
INSERT INTO public.courses VALUES (9, 'Artificial Intelligence');
INSERT INTO public.courses VALUES (10, 'Python');
INSERT INTO public.courses VALUES (11, 'Object-Oriented Programming');
INSERT INTO public.courses VALUES (12, 'Calculus');
INSERT INTO public.courses VALUES (13, 'Game Architecture');
INSERT INTO public.courses VALUES (14, 'Algorithms');
INSERT INTO public.courses VALUES (15, 'UNIX');
INSERT INTO public.courses VALUES (16, 'Server Administration');
INSERT INTO public.courses VALUES (17, 'Network Security');


--
-- Data for Name: majors; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.majors VALUES (1, 'Database Administration');
INSERT INTO public.majors VALUES (2, 'Web Development');
INSERT INTO public.majors VALUES (3, 'Data Science');
INSERT INTO public.majors VALUES (4, 'Network Engineering');
INSERT INTO public.majors VALUES (5, 'Computer Programming');
INSERT INTO public.majors VALUES (6, 'Game Design');
INSERT INTO public.majors VALUES (7, 'System Administration');


--
-- Data for Name: majors_courses; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.majors_courses VALUES (1, 1);
INSERT INTO public.majors_courses VALUES (2, 2);
INSERT INTO public.majors_courses VALUES (1, 3);
INSERT INTO public.majors_courses VALUES (3, 1);
INSERT INTO public.majors_courses VALUES (4, 4);
INSERT INTO public.majors_courses VALUES (1, 5);
INSERT INTO public.majors_courses VALUES (3, 6);
INSERT INTO public.majors_courses VALUES (4, 7);
INSERT INTO public.majors_courses VALUES (5, 4);
INSERT INTO public.majors_courses VALUES (1, 8);
INSERT INTO public.majors_courses VALUES (6, 9);
INSERT INTO public.majors_courses VALUES (3, 10);
INSERT INTO public.majors_courses VALUES (5, 11);
INSERT INTO public.majors_courses VALUES (7, 7);
INSERT INTO public.majors_courses VALUES (6, 12);
INSERT INTO public.majors_courses VALUES (2, 1);
INSERT INTO public.majors_courses VALUES (3, 12);
INSERT INTO public.majors_courses VALUES (2, 11);
INSERT INTO public.majors_courses VALUES (6, 13);
INSERT INTO public.majors_courses VALUES (7, 4);
INSERT INTO public.majors_courses VALUES (6, 14);
INSERT INTO public.majors_courses VALUES (7, 15);
INSERT INTO public.majors_courses VALUES (7, 16);
INSERT INTO public.majors_courses VALUES (5, 7);
INSERT INTO public.majors_courses VALUES (5, 10);
INSERT INTO public.majors_courses VALUES (4, 17);
INSERT INTO public.majors_courses VALUES (2, 8);
INSERT INTO public.majors_courses VALUES (4, 14);


--
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.students VALUES (1, 'Rhea', 'Kellems', 1, 2.5);
INSERT INTO public.students VALUES (2, 'Emma', 'Gilbert', NULL, NULL);
INSERT INTO public.students VALUES (3, 'Kimberly', 'Whitley', 2, 3.8);
INSERT INTO public.students VALUES (4, 'Jimmy', 'Felipe', 1, 3.7);
INSERT INTO public.students VALUES (5, 'Kyle', 'Stimson', NULL, 2.8);
INSERT INTO public.students VALUES (6, 'Casares', 'Hijo', 6, 4.0);
INSERT INTO public.students VALUES (7, 'Noe', 'Savage', NULL, 3.6);
INSERT INTO public.students VALUES (8, 'Sterling', 'Boss', 6, 3.9);
INSERT INTO public.students VALUES (9, 'Brian', 'Davis', NULL, 2.3);
INSERT INTO public.students VALUES (10, 'Kaija', 'Uronen', 6, 3.7);
INSERT INTO public.students VALUES (11, 'Faye', 'Conn', 6, 2.1);
INSERT INTO public.students VALUES (12, 'Efren', 'Reilly', 2, 3.9);
INSERT INTO public.students VALUES (13, 'Danh', 'Nhung', NULL, 2.4);
INSERT INTO public.students VALUES (14, 'Maxine', 'Hagenes', 1, 2.9);
INSERT INTO public.students VALUES (15, 'Larry', 'Saunders', 3, 2.2);
INSERT INTO public.students VALUES (16, 'Karl', 'Kuhar', 2, NULL);
INSERT INTO public.students VALUES (17, 'Lieke', 'Hazenveld', 6, 3.5);
INSERT INTO public.students VALUES (18, 'Obie', 'Hilpert', 2, NULL);
INSERT INTO public.students VALUES (19, 'Peter', 'Booysen', NULL, 2.9);
INSERT INTO public.students VALUES (20, 'Nathan', 'Turner', 1, 3.3);
INSERT INTO public.students VALUES (21, 'Gerald', 'Osiki', 3, 2.2);
INSERT INTO public.students VALUES (22, 'Vanya', 'Hassanah', 6, 4.0);
INSERT INTO public.students VALUES (23, 'Roxelana', 'Florescu', 1, 3.2);
INSERT INTO public.students VALUES (24, 'Helene', 'Parker', 3, 3.4);
INSERT INTO public.students VALUES (25, 'Mariana', 'Russel', 2, 1.8);
INSERT INTO public.students VALUES (26, 'Ajit', 'Dhungel', NULL, 3.0);
INSERT INTO public.students VALUES (27, 'Mehdi', 'Vandenberghe', 1, 1.9);
INSERT INTO public.students VALUES (28, 'Dejon', 'Howell', 2, 4.0);
INSERT INTO public.students VALUES (29, 'Aliya', 'Gulgowski', 7, 2.6);
INSERT INTO public.students VALUES (30, 'Ana', 'Tupajic', 3, 3.1);
INSERT INTO public.students VALUES (31, 'Hugo', 'Duran', NULL, 3.8);


--
-- Name: courses_course_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.courses_course_id_seq', 17, true);


--
-- Name: majors_major_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.majors_major_id_seq', 7, true);


--
-- Name: students_student_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.students_student_id_seq', 31, true);


--
-- Name: courses courses_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (course_id);


--
-- Name: majors_courses majors_courses_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.majors_courses
    ADD CONSTRAINT majors_courses_pkey PRIMARY KEY (major_id, course_id);


--
-- Name: majors majors_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.majors
    ADD CONSTRAINT majors_pkey PRIMARY KEY (major_id);


--
-- Name: students students_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (student_id);


--
-- Name: majors_courses majors_courses_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.majors_courses
    ADD CONSTRAINT majors_courses_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.courses(course_id);


--
-- Name: majors_courses majors_courses_major_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.majors_courses
    ADD CONSTRAINT majors_courses_major_id_fkey FOREIGN KEY (major_id) REFERENCES public.majors(major_id);


--
-- Name: students students_major_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_major_id_fkey FOREIGN KEY (major_id) REFERENCES public.majors(major_id);


--
-- PostgreSQL database dump complete
--

