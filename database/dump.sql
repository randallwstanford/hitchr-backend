--
-- PostgreSQL database dump
--

-- Dumped from database version 12.8 (Ubuntu 12.8-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.8 (Ubuntu 12.8-0ubuntu0.20.04.1)

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
-- Name: destinations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.destinations (
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    coordinate point NOT NULL
);


ALTER TABLE public.destinations OWNER TO postgres;

--
-- Name: destinations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.destinations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.destinations_id_seq OWNER TO postgres;

--
-- Name: destinations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.destinations_id_seq OWNED BY public.destinations.id;


--
-- Name: messages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.messages (
    id integer NOT NULL,
    text character varying(250) NOT NULL,
    sender_id integer,
    recipient_id integer,
    "timestamp" timestamp without time zone NOT NULL
);


ALTER TABLE public.messages OWNER TO postgres;

--
-- Name: messages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.messages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.messages_id_seq OWNER TO postgres;

--
-- Name: messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.messages_id_seq OWNED BY public.messages.id;


--
-- Name: rides; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rides (
    id integer NOT NULL,
    driver_id integer,
    start_dest integer,
    end_dest integer,
    available_seats integer NOT NULL,
    completed timestamp without time zone,
    price integer
);


ALTER TABLE public.rides OWNER TO postgres;

--
-- Name: rides_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rides_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rides_id_seq OWNER TO postgres;

--
-- Name: rides_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rides_id_seq OWNED BY public.rides.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(100) NOT NULL,
    password character varying(30) NOT NULL,
    payment_methods json,
    average_rider_rating numeric DEFAULT 0,
    total_rider_ratings integer DEFAULT 0,
    is_driver boolean DEFAULT false,
    average_driver_rating numeric DEFAULT 0,
    total_driver_ratings integer DEFAULT 0
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: users_rides; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_rides (
    id integer NOT NULL,
    user_id integer,
    ride_id integer
);


ALTER TABLE public.users_rides OWNER TO postgres;

--
-- Name: users_rides_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_rides_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_rides_id_seq OWNER TO postgres;

--
-- Name: users_rides_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_rides_id_seq OWNED BY public.users_rides.id;


--
-- Name: destinations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.destinations ALTER COLUMN id SET DEFAULT nextval('public.destinations_id_seq'::regclass);


--
-- Name: messages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.messages ALTER COLUMN id SET DEFAULT nextval('public.messages_id_seq'::regclass);


--
-- Name: rides id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rides ALTER COLUMN id SET DEFAULT nextval('public.rides_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: users_rides id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_rides ALTER COLUMN id SET DEFAULT nextval('public.users_rides_id_seq'::regclass);


--
-- Data for Name: destinations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.destinations (id, name, coordinate) FROM stdin;
1	Middle River	(39.33427,-76.43941)
2	Belle Glade	(26.68451,-80.66756)
3	Searcy	(35.25064,-91.73625)
4	Tupelo	(34.25807,-88.70464)
5	Lebanon	(39.43534,-84.20299)
6	Rosemount	(44.73941,-93.12577)
7	Troutdale	(45.53929,-122.38731)
8	Sunnyside	(46.32374,-120.00865)
9	Morningside Heights	(40.81,-73.9625)
10	Yonkers	(40.93121,-73.89875)
11	Opportunity	(47.64995,-117.23991)
12	Ken Caryl	(39.57582,-105.11221)
13	Palestine	(31.76212,-95.63079)
14	Boston	(42.35843,-71.05977)
15	Camarillo	(34.21639,-119.0376)
16	Sun City Center	(27.71809,-82.35176)
17	Greenville	(33.41012,-91.06177)
18	Rutland	(43.61062,-72.97261)
19	Hutchinson	(38.06084,-97.92977)
20	Sun City Center	(27.71809,-82.35176)
21	Milledgeville	(33.08014,-83.2321)
22	Gilbert	(33.35283,-111.78903)
23	Kent	(47.38093,-122.23484)
24	Morningside Heights	(40.81,-73.9625)
25	Tupelo	(34.25807,-88.70464)
26	Sun City Center	(27.71809,-82.35176)
27	Waverly	(42.7392,-84.62081)
28	Yonkers	(40.93121,-73.89875)
29	Fairview Heights	(38.58894,-89.99038)
30	Toledo	(41.66394,-83.55521)
31	Hutto	(30.5427,-97.54667)
32	Pottstown	(40.24537,-75.64963)
33	Chillum	(38.96372,-76.99081)
34	Norco	(33.93113,-117.54866)
35	Boston	(42.35843,-71.05977)
36	Tyler	(32.35126,-95.30106)
37	Brighton Beach	(40.57788,-73.95958)
38	Pleasant Prairie	(42.55308,-87.93341)
39	Palm Desert	(33.72255,-116.37697)
40	Evergreen Park	(41.72059,-87.70172)
41	Port Huron	(42.97086,-82.42491)
42	Redding	(40.58654,-122.39168)
43	Hueytown	(33.45122,-86.99666)
44	Fresno	(29.53885,-95.44744)
45	Redding	(40.58654,-122.39168)
46	Hutchinson	(38.06084,-97.92977)
47	Venice	(27.09978,-82.45426)
48	Aloha	(45.49428,-122.86705)
49	West Des Moines	(41.57721,-93.71133)
\.


--
-- Data for Name: messages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.messages (id, text, sender_id, recipient_id, "timestamp") FROM stdin;
1	One expert happy return firm senior difficult hundred. Ahead get lead free learn glass several hundred. Result book senior grow training them.	21	3	2021-09-30 06:36:02
2	Ever go deal large analysis hand. Husband American prevent dinner Congress.	43	47	2021-10-13 10:33:01
3	Kid stop call among itself. Large organization born boy job weight them. Similar civil serve many.	37	21	2021-10-07 11:15:56
4	Step teacher unit course suffer box recognize. Back stay store difficult notice remain boy.	3	2	2021-09-29 05:13:14
5	Truth ahead cultural of so public. Enough within language Mr here understand student president.\nMain indeed threat charge material professional current. Senior must remember deep war miss.	16	15	2021-09-30 07:40:59
6	Leave ten star right character why cover. Whatever work media discuss heart public. Business floor agree information.\nRange whether answer some group. Case include trip.	45	36	2021-10-13 16:10:16
7	Energy region she. Lose set check perhaps coach.\nSpecific him camera spring. Parent discuss fund style difficult guess writer book.	9	37	2021-10-11 10:12:18
8	Job level about along actually whose somebody. Office resource several maintain rule. Today recognize strategy dark president history health.	8	18	2021-09-30 23:54:32
9	Hard direction star it today finish environmental. Still discussion arrive religious.\nPersonal wife on. Girl actually reflect nice which institution. Spring run difficult citizen law.	28	36	2021-10-13 05:23:10
10	Population much risk increase. Protect defense may statement treatment stock child. Option fund since glass try various.\nKeep property movie success section speech whole. Knowledge vote great rule.	16	9	2021-09-30 07:56:06
11	Line show back game others approach keep. Sport wait garden often. Arrive whatever total speak sort which.\nMaintain billion few cover condition would report.	10	19	2021-09-30 09:29:44
12	Turn history blue remain price exactly method. Account them land.\nWe north reduce remember. Plant save interest war five so bill.	5	43	2021-10-08 03:40:47
13	Education discuss office class point culture have. Full fear continue career win early machine. Or glass his.\nData theory glass might. Condition apply rest American benefit member major.	22	26	2021-10-11 02:14:02
14	Probably city total writer against type. Generation million artist not interview pass.\nDay television personal reduce office mean. Source professor player. Law game around.	26	32	2021-10-02 18:10:41
15	Quickly employee accept follow. Into your total.\nFoot kitchen decision. Teacher yet very leader indicate baby. Institution most base detail establish. Measure amount without five.	16	43	2021-09-27 22:19:57
16	Animal beat across value within second bag. System site wish public arrive keep perform give.\nIssue collection government young statement condition more. Central experience above public.	9	1	2021-10-06 19:30:18
17	Realize total well. Rich much various. Assume he place upon game. Somebody build other garden finish television.\nThem cultural month individual. Could strategy trial information voice top.	35	12	2021-10-03 06:19:36
18	Easy attack case behavior. Century expect course agree affect south executive. But opportunity staff.	43	49	2021-10-07 13:26:03
19	History into list western. Expert compare mother tend. News recognize to task law medical rest.	3	35	2021-10-02 08:19:46
20	See everything letter college forget. Use me thought. Mention machine clearly. Knowledge forget husband degree foreign international late.	25	19	2021-10-16 13:52:22
21	Character fear themselves able fish now above sea. Decision current several practice.	9	41	2021-10-13 08:04:55
22	Head smile go ask change six fire instead. Rest think in amount Congress music guy.	34	19	2021-10-06 01:29:51
23	Here leg work network anyone ready. Bed responsibility network. Very series sell street.	46	2	2021-10-13 03:17:05
24	Before modern upon tree Republican. However staff special base. Table push although three offer.	42	4	2021-10-15 06:35:58
25	Realize energy another and compare. Husband together health environmental yeah finish Mrs.	11	16	2021-10-13 20:58:59
26	Difficult student blue resource matter bank simple. Prepare first person.\nBest after system dog energy. Reason source instead stage describe recognize event have. A point special require.	9	35	2021-09-28 17:50:41
27	Listen simple dog red. Bar way miss help pretty foreign.\nCity what bad still election. Know federal act west. Gun memory others order there especially serve.\nAgency leg sister west quite.	42	3	2021-09-28 12:47:40
28	Radio window place hit serious image seat. Push offer tough health. Concern if do father.	44	4	2021-10-06 09:32:27
29	May sing ok bag. Knowledge must before scene moment environment.\nFish property exactly with. Behavior college while bag perform. Product so speech certain.	18	4	2021-10-10 18:27:55
30	Break couple mouth possible. Now myself reality argue thing seat six. Find son sing.\nExactly professor central religious that quite. Second eat top music may sign.	6	27	2021-10-04 06:06:27
31	Certain still challenge head discussion few project. Reveal suffer rest hair computer. Performance floor party like trip us decide.	19	26	2021-10-07 01:56:11
32	Face child public bag partner themselves. Through seek imagine fly themselves for production. Future city would way live tend several.	26	49	2021-10-01 20:19:13
33	Travel wonder church paper much firm. Unit herself environmental tax actually he high see.\nHer military political prevent. Research first body throughout.	11	5	2021-09-26 06:55:54
34	Glass amount card standard energy moment exactly quality. Training stuff while. Compare instead staff minute.	28	38	2021-09-26 08:24:38
35	Individual whatever industry four room four treatment word. During program network lose. Thus car partner per.	33	6	2021-10-12 01:20:24
36	Deal its senior. Fish stock wall music pretty policy reveal.\nCup miss government catch resource. Explain that face student air attention nation fire.	47	19	2021-09-29 12:55:45
37	Good cut letter environmental least. Interest lay line several view late. Pretty far law your interview.	27	9	2021-10-14 02:12:16
38	Expect project option town down candidate full keep. Agreement marriage specific night mention require. Western page want out just left speak after.	28	17	2021-10-04 02:53:46
39	Edge this employee increase. Year threat question main then growth career. Over generation particularly according.	45	44	2021-09-26 20:46:14
40	Buy past even cup popular fine court room. Above question six heavy me various ahead continue. Represent to discuss nation people.	8	9	2021-10-13 19:16:16
41	Treat local for general sound whose church. Any pretty international war general plan collection argue.\nWord begin base western small against just yard. Course data form.	19	34	2021-10-07 02:46:21
42	Listen scientist type expect state. Air character blue central.\nOpen find enjoy attack. Catch itself end up movie open our.	8	37	2021-09-28 07:47:17
43	Cut industry true ok ten. Back bank response cause each feeling. Environment development well however. Direction oil southern central nothing director.	49	23	2021-10-11 12:45:21
44	Money increase these tend entire same require. Individual language girl church early result no. Improve model health small subject may.	14	34	2021-10-14 02:25:36
45	Main able yourself strategy back cold. Ten hit trouble official much read nearly. Last rise before seat more kitchen.\nRate want early point. Office always star.	12	23	2021-10-13 05:05:28
46	Test official under interview structure Congress. Meeting protect close several dog.\nThis couple effect hard near.	6	30	2021-09-27 22:40:14
47	Article seem owner tree thought attack morning. Interest prove before necessary population south.\nEconomy poor health officer interest heart. Life size kid affect some. Beautiful stock happen new.	35	15	2021-10-01 17:06:57
48	Realize sometimes certainly lawyer hear. Whom former body reason indicate to.\nLarge system marriage toward prepare production hope remember. Could sing spring may.	48	37	2021-10-08 04:25:48
49	Three space catch purpose forget. Behavior record line specific billion use different.\nMarriage reveal market huge front. Song yeah hear then. Financial cell look despite bad party.	36	29	2021-10-08 09:03:16
\.


--
-- Data for Name: rides; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rides (id, driver_id, start_dest, end_dest, available_seats, completed, price) FROM stdin;
1	1	34	26	1	2021-09-29 11:15:11	153
2	2	13	38	3	2021-09-29 04:12:47	435
3	3	1	6	3	2021-10-09 18:26:47	20
4	4	33	16	1	2021-10-05 12:05:05	123
5	5	35	15	1	2021-10-16 02:34:32	356
6	6	33	7	2	2021-10-08 18:38:40	17
7	7	36	9	1	2021-10-13 08:01:09	140
8	8	33	23	1	2021-10-01 17:52:33	257
9	9	20	4	3	2021-09-28 04:01:12	340
10	10	27	11	5	2021-10-04 17:22:21	116
11	11	1	26	5	2021-10-12 20:18:16	413
12	12	36	23	3	2021-10-03 05:58:01	235
13	13	15	27	4	2021-10-13 16:24:15	115
14	14	38	33	6	2021-10-06 04:29:32	420
15	15	40	32	2	2021-09-28 13:58:07	284
16	16	21	11	3	2021-10-08 15:47:20	460
17	17	4	40	5	2021-10-03 16:39:56	473
18	18	35	33	1	2021-10-03 09:44:55	284
19	19	31	6	5	2021-10-14 07:13:14	419
20	20	16	24	5	2021-10-13 14:15:18	287
21	21	4	33	5	2021-09-29 12:54:01	200
22	22	21	22	6	2021-09-30 00:26:13	329
23	23	36	30	1	2021-10-11 13:06:21	497
24	24	34	36	2	2021-09-26 15:25:20	17
25	25	24	10	6	2021-10-11 12:09:17	267
26	26	26	12	2	2021-09-28 13:59:32	20
27	27	2	22	6	2021-09-29 07:50:23	69
28	28	39	33	3	2021-09-30 05:52:02	166
29	29	26	39	2	2021-10-08 03:36:32	132
30	30	25	23	4	2021-10-15 02:08:14	10
31	31	36	15	5	2021-10-09 05:53:03	202
32	32	33	25	2	2021-09-28 04:21:39	430
33	33	16	5	3	2021-10-08 12:04:44	436
34	34	37	32	3	2021-10-10 15:50:57	422
35	35	8	29	2	2021-09-28 19:05:16	458
36	36	28	38	4	2021-10-14 01:53:48	41
37	37	26	29	6	2021-10-12 23:40:26	195
38	38	14	12	5	2021-10-12 13:30:28	309
39	39	11	34	2	2021-09-29 20:11:31	499
40	40	36	23	5	2021-10-03 09:46:20	453
41	41	39	26	2	2021-10-15 07:15:42	403
42	42	36	28	6	2021-10-05 15:14:15	198
43	43	6	4	6	2021-10-13 01:43:56	402
44	44	30	34	4	2021-10-13 23:02:24	467
45	45	26	18	4	2021-10-06 09:18:28	323
46	46	39	38	5	2021-09-28 19:05:40	399
47	47	33	31	6	2021-10-15 22:59:18	20
48	48	18	37	1	2021-10-11 17:25:30	356
49	49	23	30	4	2021-10-04 20:05:36	165
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, username, password, payment_methods, average_rider_rating, total_rider_ratings, is_driver, average_driver_rating, total_driver_ratings) FROM stdin;
1	Seb764	8q623xwk41sz5t7nprumlyov09	[{"provider": "PayPal", "url": "https://paypal.com/Seb764"}, {"provider": "venmo", "url": "https://venmo.com/Seb764"}]	0.987	8	f	0	0
2	Rachelle564	xk0q492zm7tpo3lvu6w5sr8ny1	[{"provider": "PayPal", "url": "https://paypal.com/Rachelle564"}, {"provider": "venmo", "url": "https://venmo.com/Rachelle564"}]	0.974	50	f	0	0
3	Joyce160	r2yons1ut5lp7xqz60wmv4938k	[{"provider": "PayPal", "url": "https://paypal.com/Joyce160"}, {"provider": "venmo", "url": "https://venmo.com/Joyce160"}]	0.204	41	f	0	0
4	Darryl481	kx37w8yotz9v5m6lr2sq104pnu	[{"provider": "PayPal", "url": "https://paypal.com/Darryl481"}, {"provider": "venmo", "url": "https://venmo.com/Darryl481"}]	0.896	38	f	0	0
5	Triston5	mv49s5uz2p7x803rkonylw61tq	[{"provider": "PayPal", "url": "https://paypal.com/Triston5"}, {"provider": "venmo", "url": "https://venmo.com/Triston5"}]	0.685	36	f	0	0
6	Quinn275	wnpxrtq2u18vl6y37kos45m9z0	[{"provider": "PayPal", "url": "https://paypal.com/Quinn275"}]	0.347	19	f	0	0
7	Alfred918	ptkvl9r1032xz567yoswq8num4	[{"provider": "PayPal", "url": "https://paypal.com/Alfred918"}]	0.454	45	f	0	0
8	Farah840	05x3w8vz4umon62yk7t1sp9qrl	[{"provider": "PayPal", "url": "https://paypal.com/Farah840"}]	0.261	41	f	0	0
9	Edie807	w1qr4l2vu7xk6n83os05yzpm9t	[{"provider": "PayPal", "url": "https://paypal.com/Edie807"}]	0	0	t	0.371	20
10	Karly951	opls4mu1tvk90xr5zqn3w2876y	[{"provider": "PayPal", "url": "https://paypal.com/Karly951"}, {"provider": "venmo", "url": "https://venmo.com/Karly951"}]	0.044	28	f	0	0
11	Christi441	6mu5pvtswr4lxqky73ozn01289	[{"provider": "PayPal", "url": "https://paypal.com/Christi441"}, {"provider": "venmo", "url": "https://venmo.com/Christi441"}]	0.832	36	f	0	0
12	Tiegan634	pz23yxl65q4nu8rts7ovk9w10m	[{"provider": "PayPal", "url": "https://paypal.com/Tiegan634"}]	0.329	10	f	0	0
13	Terrence471	st85zk72xwpm630rq19uyl4vno	[{"provider": "PayPal", "url": "https://paypal.com/Terrence471"}]	0.424	25	f	0	0
14	Evelyn99	snt2q134umy6rz9l7w58pxv0ok	[{"provider": "PayPal", "url": "https://paypal.com/Evelyn99"}, {"provider": "venmo", "url": "https://venmo.com/Evelyn99"}]	0.840	24	f	0	0
15	Kiran187	7xz0q2v3w41uyo9rlktnsp58m6	[{"provider": "PayPal", "url": "https://paypal.com/Kiran187"}, {"provider": "venmo", "url": "https://venmo.com/Kiran187"}]	0.208	26	f	0	0
16	Opal647	41y9rlwkq8zs2mx3po506vn7tu	[{"provider": "PayPal", "url": "https://paypal.com/Opal647"}]	0	0	t	0.527	22
17	Fabrizia151	8z5kso0t2l4731prmyq9nxw6vu	[{"provider": "PayPal", "url": "https://paypal.com/Fabrizia151"}, {"provider": "venmo", "url": "https://venmo.com/Fabrizia151"}]	0.024	16	f	0	0
18	Gael83	y6rzqw5ts73o14nm0kxu982pvl	[{"provider": "PayPal", "url": "https://paypal.com/Gael83"}, {"provider": "venmo", "url": "https://venmo.com/Gael83"}]	0.059	11	f	0	0
19	Flick203	96y5tkw4x37r20mzoqvn8ps1lu	[{"provider": "PayPal", "url": "https://paypal.com/Flick203"}]	0.850	34	f	0	0
20	Kody795	n9q4t85zply0w6v1sxm32okr7u	[{"provider": "PayPal", "url": "https://paypal.com/Kody795"}]	0.127	15	f	0	0
21	Neville359	rkmpsl1n432xq9t7zyw65u0vo8	[{"provider": "PayPal", "url": "https://paypal.com/Neville359"}, {"provider": "venmo", "url": "https://venmo.com/Neville359"}]	0.040	50	f	0	0
22	Magdalene637	yrnklv2q764s1x0o3wtpmz5u98	[{"provider": "PayPal", "url": "https://paypal.com/Magdalene637"}]	0.198	17	f	0	0
23	Annabeth796	3296xlsu48nqpk7yzmot10rv5w	[{"provider": "PayPal", "url": "https://paypal.com/Annabeth796"}]	0.943	37	f	0	0
24	Horace380	12l78o3tr4v650su9zkpmnwqxy	[{"provider": "PayPal", "url": "https://paypal.com/Horace380"}, {"provider": "venmo", "url": "https://venmo.com/Horace380"}]	0.235	41	f	0	0
25	Oisin309	tzn4s1qrmwoy82l3u50xk67vp9	[{"provider": "PayPal", "url": "https://paypal.com/Oisin309"}]	0.092	26	f	0	0
26	Ryan650	szt503xon817wmk6rlqv249yup	[{"provider": "PayPal", "url": "https://paypal.com/Ryan650"}, {"provider": "venmo", "url": "https://venmo.com/Ryan650"}]	0.923	44	f	0	0
27	Anita397	sw65p7uvm0n218r4xlkq3t9yzo	[{"provider": "PayPal", "url": "https://paypal.com/Anita397"}, {"provider": "venmo", "url": "https://venmo.com/Anita397"}]	0.095	11	f	0	0
28	Jocelyn394	m0pwvxtn8zlso917u4kr265qy3	[{"provider": "PayPal", "url": "https://paypal.com/Jocelyn394"}]	0.318	14	f	0	0
29	Ziva244	ny04mts3rzp72qov658kwu19xl	[{"provider": "PayPal", "url": "https://paypal.com/Ziva244"}, {"provider": "venmo", "url": "https://venmo.com/Ziva244"}]	0.783	35	f	0	0
30	Lorie41	7o5w063yvzqnlmpt2r8k9x4us1	[{"provider": "PayPal", "url": "https://paypal.com/Lorie41"}]	0.195	47	f	0	0
31	Laila881	xnw906mq5t47zyr18okp3vsl2u	[{"provider": "PayPal", "url": "https://paypal.com/Laila881"}]	0.737	12	f	0	0
32	Mariam510	21wtkl479m60povxun38zsrq5y	[{"provider": "PayPal", "url": "https://paypal.com/Mariam510"}]	0.387	38	f	0	0
33	Jonas979	wk5mrt73u942zpls8vx0nqoy61	[{"provider": "PayPal", "url": "https://paypal.com/Jonas979"}]	0.439	36	f	0	0
34	Ashlynn359	3rzt8qks9ol4myv27w0nx165pu	[{"provider": "PayPal", "url": "https://paypal.com/Ashlynn359"}, {"provider": "venmo", "url": "https://venmo.com/Ashlynn359"}]	0.484	15	f	0	0
35	Verity1000	o86vtpqz459xw7m1sn0urk23yl	[{"provider": "PayPal", "url": "https://paypal.com/Verity1000"}, {"provider": "venmo", "url": "https://venmo.com/Verity1000"}]	0.886	17	f	0	0
36	Latoya688	yolpuvtw51s9r2n76qxz80mk43	[{"provider": "PayPal", "url": "https://paypal.com/Latoya688"}]	0	0	t	0.657	38
37	Miriam601	orytqwup58x6n39skvlzm02174	[{"provider": "PayPal", "url": "https://paypal.com/Miriam601"}]	0.267	1	f	0	0
38	Lia985	25xyn38ol0mtzsvq4urk769pw1	[{"provider": "PayPal", "url": "https://paypal.com/Lia985"}, {"provider": "venmo", "url": "https://venmo.com/Lia985"}]	0.080	27	f	0	0
39	Adelia488	2v8xsyw0no6z319rkq45mtlup7	[{"provider": "PayPal", "url": "https://paypal.com/Adelia488"}]	0.799	27	f	0	0
40	Kizzy786	q23564k08xs9y1um7rlnvptzow	[{"provider": "PayPal", "url": "https://paypal.com/Kizzy786"}, {"provider": "venmo", "url": "https://venmo.com/Kizzy786"}]	0	0	t	0.427	36
41	Angus186	qxmsrpw9kuovl417t8z52063ny	[{"provider": "PayPal", "url": "https://paypal.com/Angus186"}, {"provider": "venmo", "url": "https://venmo.com/Angus186"}]	0.838	20	f	0	0
42	Catherine281	t7p184lwm63k0xouv2rzsqy5n9	[{"provider": "PayPal", "url": "https://paypal.com/Catherine281"}]	0.806	13	f	0	0
43	Tim299	ony9mp4v5837ls6uz2rqkxwt10	[{"provider": "PayPal", "url": "https://paypal.com/Tim299"}]	0.555	46	f	0	0
44	Bronagh656	3sxtyp2q516uokl490zw8rvmn7	[{"provider": "PayPal", "url": "https://paypal.com/Bronagh656"}]	0.648	11	f	0	0
45	Rue457	ytn6s3qwxp259o8ruzk47ml1v0	[{"provider": "PayPal", "url": "https://paypal.com/Rue457"}]	0.809	3	f	0	0
46	Margie835	txmzn1slo2q8p476y539r0uwkv	[{"provider": "PayPal", "url": "https://paypal.com/Margie835"}, {"provider": "venmo", "url": "https://venmo.com/Margie835"}]	0	0	t	0.550	12
47	Leanne281	o89v3ytrn4kx0pls27uwmqz156	[{"provider": "PayPal", "url": "https://paypal.com/Leanne281"}]	0.703	5	f	0	0
48	Tobin245	rvol3zu650y91pkt7x4nm8w2sq	[{"provider": "PayPal", "url": "https://paypal.com/Tobin245"}]	0.283	21	f	0	0
49	Charlton959	smo379qtvznp06lu2wy4xr581k	[{"provider": "PayPal", "url": "https://paypal.com/Charlton959"}]	0.323	39	f	0	0
\.


--
-- Data for Name: users_rides; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_rides (id, user_id, ride_id) FROM stdin;
1	20	6
2	3	47
3	21	43
4	2	28
5	39	17
6	19	7
7	37	42
8	11	3
9	40	22
10	31	20
11	5	13
12	26	33
13	28	12
14	39	4
15	21	13
16	33	32
17	33	30
18	17	32
19	2	36
20	47	45
21	13	46
22	47	5
23	11	6
24	46	39
25	47	12
26	38	28
27	4	42
28	7	14
29	18	30
30	30	26
31	46	36
32	37	4
33	26	17
34	10	10
35	42	3
36	17	23
37	18	25
38	14	20
39	14	32
40	23	45
41	24	27
42	16	34
43	29	48
44	30	23
45	15	34
46	35	36
47	37	23
48	20	20
49	29	12
\.


--
-- Name: destinations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.destinations_id_seq', 1, false);


--
-- Name: messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.messages_id_seq', 1, false);


--
-- Name: rides_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rides_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- Name: users_rides_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_rides_id_seq', 1, false);


--
-- Name: destinations destinations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.destinations
    ADD CONSTRAINT destinations_pkey PRIMARY KEY (id);


--
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);


--
-- Name: rides rides_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rides
    ADD CONSTRAINT rides_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users_rides users_rides_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_rides
    ADD CONSTRAINT users_rides_pkey PRIMARY KEY (id);


--
-- Name: messages messages_recipient_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_recipient_id_fkey FOREIGN KEY (recipient_id) REFERENCES public.users(id);


--
-- Name: messages messages_sender_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_sender_id_fkey FOREIGN KEY (sender_id) REFERENCES public.users(id);


--
-- Name: rides rides_driver_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rides
    ADD CONSTRAINT rides_driver_id_fkey FOREIGN KEY (driver_id) REFERENCES public.users(id);


--
-- Name: rides rides_end_dest_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rides
    ADD CONSTRAINT rides_end_dest_fkey FOREIGN KEY (end_dest) REFERENCES public.destinations(id);


--
-- Name: rides rides_start_dest_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rides
    ADD CONSTRAINT rides_start_dest_fkey FOREIGN KEY (start_dest) REFERENCES public.destinations(id);


--
-- Name: users_rides users_rides_ride_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_rides
    ADD CONSTRAINT users_rides_ride_id_fkey FOREIGN KEY (ride_id) REFERENCES public.rides(id);


--
-- Name: users_rides users_rides_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_rides
    ADD CONSTRAINT users_rides_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--
