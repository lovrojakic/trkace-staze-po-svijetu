--
-- PostgreSQL database dump
--

-- Dumped from database version 14.9 (Ubuntu 14.9-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.9 (Ubuntu 14.9-0ubuntu0.22.04.1)

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
-- Name: drzava; Type: TABLE; Schema: public; Owner: lovro
--

CREATE TABLE public.drzava (
    oznaka character(3) NOT NULL,
    naziv character varying(30) NOT NULL
);


ALTER TABLE public.drzava OWNER TO lovro;

--
-- Name: natjecanje; Type: TABLE; Schema: public; Owner: lovro
--

CREATE TABLE public.natjecanje (
    id integer NOT NULL,
    naziv character varying(50) NOT NULL,
    godina integer NOT NULL
);


ALTER TABLE public.natjecanje OWNER TO lovro;

--
-- Name: natjecanje_id_seq; Type: SEQUENCE; Schema: public; Owner: lovro
--

ALTER TABLE public.natjecanje ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.natjecanje_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: odrzavase; Type: TABLE; Schema: public; Owner: lovro
--

CREATE TABLE public.odrzavase (
    staza_id integer NOT NULL,
    natjecanje_id integer NOT NULL
);


ALTER TABLE public.odrzavase OWNER TO lovro;

--
-- Name: rekord; Type: TABLE; Schema: public; Owner: lovro
--

CREATE TABLE public.rekord (
    id integer NOT NULL,
    vrijeme time without time zone NOT NULL,
    vozilo character varying(45) NOT NULL,
    vozac_id integer NOT NULL
);


ALTER TABLE public.rekord OWNER TO lovro;

--
-- Name: rekord_id_seq; Type: SEQUENCE; Schema: public; Owner: lovro
--

ALTER TABLE public.rekord ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.rekord_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: staza; Type: TABLE; Schema: public; Owner: lovro
--

CREATE TABLE public.staza (
    id integer NOT NULL,
    naziv character varying(50) NOT NULL,
    oznaka_drzave character(3) NOT NULL,
    datum_otvorenja date NOT NULL,
    podloga character varying(20) NOT NULL,
    duljina_km numeric(5,3) NOT NULL,
    broj_zavoja integer NOT NULL,
    url character varying(100),
    kapacitet_gledatelja integer,
    rekord_id integer NOT NULL
);


ALTER TABLE public.staza OWNER TO lovro;

--
-- Name: staza_id_seq; Type: SEQUENCE; Schema: public; Owner: lovro
--

ALTER TABLE public.staza ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.staza_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: vozac; Type: TABLE; Schema: public; Owner: lovro
--

CREATE TABLE public.vozac (
    id integer NOT NULL,
    ime character varying(25) NOT NULL,
    prezime character varying(25) NOT NULL,
    datum_rodenja date,
    oznaka_drzave character(3) NOT NULL
);


ALTER TABLE public.vozac OWNER TO lovro;

--
-- Name: vozac_id_seq; Type: SEQUENCE; Schema: public; Owner: lovro
--

ALTER TABLE public.vozac ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.vozac_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: drzava; Type: TABLE DATA; Schema: public; Owner: lovro
--

COPY public.drzava (oznaka, naziv) FROM stdin;
HRV	Hrvatska
AUT	Austrija
NED	Nizozemska
DEU	Njemacka
ITA	Italija
BRA	Brazil
USA	Sjedinjene Američke Države
BEL	Belgija
FIN	Finska
HUN	Mađarska
GBR	Ujedinjeno kraljevstvo
SGP	Singapur
MCO	Monako
\.


--
-- Data for Name: natjecanje; Type: TABLE DATA; Schema: public; Owner: lovro
--

COPY public.natjecanje (id, naziv, godina) FROM stdin;
1	FIM Sidecar World Championship	2021
2	FIM Sidecar World Championship	2022
3	GT World Challenge Europe	2020
4	GT World Challenge Europe	2021
5	GT World Challenge Europe	2023
6	DTM	2020
7	DTM	2021
8	DTM	2022
9	DTM	2023
10	Nürburgring 24 Hours 	2020
11	Nürburgring 24 Hours 	2021
12	Nürburgring 24 Hours 	2022
13	Nürburgring 24 Hours 	2023
14	NLS	2020
15	NLS	2021
16	NLS	2022
17	NLS	2023
18	European Truck Racing Championship	2022
19	European Truck Racing Championship	2023
20	Formula 1	2020
21	Formula 1	2021
22	Formula 1	2022
23	Formula 1	2023
24	FIA World Endurance Championship	2021
25	FIA World Endurance Championship	2022
26	FIA World Endurance Championship	2023
27	NASCAR Cup Series	2020
28	NASCAR Cup Series	2021
29	NASCAR Cup Series	2022
30	NASCAR Cup Series	2023
31	NASCAR Xfinity Series	2020
32	NASCAR Xfinity Series	2021
33	NASCAR Xfinity Series	2022
34	NASCAR Xfinity Series	2023
35	NASCAR Craftsman Truck Series	2020
36	NASCAR Craftsman Truck Series	2021
37	NASCAR Craftsman Truck Series	2022
38	NASCAR Craftsman Truck Series	2023
39	Intercontinental GT Challenge	2020
40	Intercontinental GT Challenge	2021
41	Intercontinental GT Challenge	2022
42	Intercontinental GT Challenge	2023
43	TCR World Tour	2023
44	International GT Open	2020
45	International GT Open	2021
46	International GT Open	2022
47	International GT Open	2023
48	Grand Prix motorcycle racing	2021
49	Grand Prix motorcycle racing	2022
50	Grand Prix motorcycle racing	2023
51	Silverstone Classic	2021
52	Silverstone Classic	2022
53	Silverstone Classic	2023
54	TCR South America	2021
55	TCR South America	2022
56	TCR South America	2023
57	Formula E	2021
58	Formula E	2022
59	Formula E	2023
60	Historic Grand Prix of Monaco	2021
61	Historic Grand Prix of Monaco	2022
\.


--
-- Data for Name: odrzavase; Type: TABLE DATA; Schema: public; Owner: lovro
--

COPY public.odrzavase (staza_id, natjecanje_id) FROM stdin;
1	1
1	2
2	3
2	4
2	5
2	6
2	7
2	8
2	9
2	10
2	11
2	12
2	13
2	14
2	15
2	16
2	17
2	18
2	19
3	4
3	5
3	20
3	21
3	22
3	23
3	24
3	25
3	26
4	27
4	28
4	29
4	30
4	31
4	32
4	33
4	34
4	35
4	36
4	37
4	38
5	20
5	21
5	22
5	23
5	24
5	25
5	26
5	39
5	40
5	41
5	42
6	20
6	21
6	22
6	23
6	43
6	44
6	45
6	46
6	47
7	20
7	21
7	22
7	23
7	48
7	49
7	50
7	51
7	52
7	53
8	21
8	22
8	23
8	54
8	55
8	56
9	23
10	21
10	22
10	23
10	57
10	58
10	59
10	60
10	61
\.


--
-- Data for Name: rekord; Type: TABLE DATA; Schema: public; Owner: lovro
--

COPY public.rekord (id, vrijeme, vozilo, vozac_id) FROM stdin;
1	00:01:16.388	Minardi M190	1
2	00:01:28.139	Red Bull Racing RB16	2
3	00:01:28.139	Ferrari F2004	3
4	00:00:40.364	Ford EcoBoost 3.5L GDI V6tt	4
5	00:01:46.286	Mercedes W09	5
6	00:01:16.627	Mercedes W11	6
7	00:01:27.097	Red Bull Racing RB16	2
8	00:01:10.54	Mercedes W09	5
9	00:01:35.867	Mercedes W14	6
10	00:01:12.909	Mercedes W12	6
\.


--
-- Data for Name: staza; Type: TABLE DATA; Schema: public; Owner: lovro
--

COPY public.staza (id, naziv, oznaka_drzave, datum_otvorenja, podloga, duljina_km, broj_zavoja, url, kapacitet_gledatelja, rekord_id) FROM stdin;
1	Automotodrom Grobnik	HRV	1978-09-14	asfalt	4.168	18	https://grobnik.hr	40000	1
2	Nürburgring GP-Strecke	DEU	1984-05-12	asfalt	5.148	15	https://www.nuerburgring.de	150000	2
3	Autodromo Nazionale di Monza	ITA	1922-09-03	asfalt	5.793	11	https://www.monzanet.it	118865	3
4	Daytona International Speedway NASCAR Tri-Oval	USA	1959-02-22	asfalt	4.023	4	https://www.daytonainternationalspeedway.com	167785	4
5	Circuit de Spa-Francorchamps Grand Prix Circuit	BEL	1921-08-01	asfalt	7.004	20	https://www.spa-francorchamps.be	70000	5
6	Hungaroring Grand Prix Circuit	HUN	1986-03-24	asfalt	4.381	14	https://hungaroring.hu	70000	6
7	Silverstone Arena Grand Prix Circuit	GBR	1947-01-01	asfalt	5.891	18	https://www.silverstone.co.uk	160000	7
8	Autódromo de Interlagos Grand Prix Circuit	BRA	1940-05-12	asfalt	4.309	15	https://autodromodeinterlagos.com.br	60000	8
9	Marina Bay Street Revised 2023	SGP	2008-08-31	asfalt	4.940	19	https://singaporegp.sg	90000	9
10	Circuit de Monaco Revised 2015	MCO	1929-04-14	asfalt	3.337	19	https://www.monacograndprixticket.com/formula1monaco/the-circuit-of-monaco	37000	10
\.


--
-- Data for Name: vozac; Type: TABLE DATA; Schema: public; Owner: lovro
--

COPY public.vozac (id, ime, prezime, datum_rodenja, oznaka_drzave) FROM stdin;
1	Josef	Neuhauser	\N	AUT
2	Max	Verstappen	1997-09-30	NED
3	Rubens	Barrichello	1972-05-23	BRA
4	Colin	Braun	1988-09-22	USA
5	Valtteri	Bottas	1989-08-28	FIN
6	Lewis	Hamilton	1985-01-07	GBR
\.


--
-- Name: natjecanje_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lovro
--

SELECT pg_catalog.setval('public.natjecanje_id_seq', 61, true);


--
-- Name: rekord_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lovro
--

SELECT pg_catalog.setval('public.rekord_id_seq', 10, true);


--
-- Name: staza_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lovro
--

SELECT pg_catalog.setval('public.staza_id_seq', 10, true);


--
-- Name: vozac_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lovro
--

SELECT pg_catalog.setval('public.vozac_id_seq', 6, true);


--
-- Name: drzava drzava_pkey; Type: CONSTRAINT; Schema: public; Owner: lovro
--

ALTER TABLE ONLY public.drzava
    ADD CONSTRAINT drzava_pkey PRIMARY KEY (oznaka);


--
-- Name: natjecanje natjecanje_pkey; Type: CONSTRAINT; Schema: public; Owner: lovro
--

ALTER TABLE ONLY public.natjecanje
    ADD CONSTRAINT natjecanje_pkey PRIMARY KEY (id);


--
-- Name: odrzavase odrzavase_pkey; Type: CONSTRAINT; Schema: public; Owner: lovro
--

ALTER TABLE ONLY public.odrzavase
    ADD CONSTRAINT odrzavase_pkey PRIMARY KEY (staza_id, natjecanje_id);


--
-- Name: rekord rekord_pkey; Type: CONSTRAINT; Schema: public; Owner: lovro
--

ALTER TABLE ONLY public.rekord
    ADD CONSTRAINT rekord_pkey PRIMARY KEY (id);


--
-- Name: staza staza_pkey; Type: CONSTRAINT; Schema: public; Owner: lovro
--

ALTER TABLE ONLY public.staza
    ADD CONSTRAINT staza_pkey PRIMARY KEY (id);


--
-- Name: staza staza_url_key; Type: CONSTRAINT; Schema: public; Owner: lovro
--

ALTER TABLE ONLY public.staza
    ADD CONSTRAINT staza_url_key UNIQUE (url);


--
-- Name: vozac vozac_pkey; Type: CONSTRAINT; Schema: public; Owner: lovro
--

ALTER TABLE ONLY public.vozac
    ADD CONSTRAINT vozac_pkey PRIMARY KEY (id);


--
-- Name: odrzavase odrzavase_natjecanje_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lovro
--

ALTER TABLE ONLY public.odrzavase
    ADD CONSTRAINT odrzavase_natjecanje_id_fkey FOREIGN KEY (natjecanje_id) REFERENCES public.natjecanje(id);


--
-- Name: odrzavase odrzavase_staza_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lovro
--

ALTER TABLE ONLY public.odrzavase
    ADD CONSTRAINT odrzavase_staza_id_fkey FOREIGN KEY (staza_id) REFERENCES public.staza(id);


--
-- Name: rekord rekord_vozac_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lovro
--

ALTER TABLE ONLY public.rekord
    ADD CONSTRAINT rekord_vozac_id_fkey FOREIGN KEY (vozac_id) REFERENCES public.vozac(id);


--
-- Name: staza staza_oznaka_drzave_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lovro
--

ALTER TABLE ONLY public.staza
    ADD CONSTRAINT staza_oznaka_drzave_fkey FOREIGN KEY (oznaka_drzave) REFERENCES public.drzava(oznaka);


--
-- Name: staza staza_rekord_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lovro
--

ALTER TABLE ONLY public.staza
    ADD CONSTRAINT staza_rekord_id_fkey FOREIGN KEY (rekord_id) REFERENCES public.rekord(id);


--
-- Name: vozac vozac_oznaka_drzave_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lovro
--

ALTER TABLE ONLY public.vozac
    ADD CONSTRAINT vozac_oznaka_drzave_fkey FOREIGN KEY (oznaka_drzave) REFERENCES public.drzava(oznaka);


--
-- PostgreSQL database dump complete
--

