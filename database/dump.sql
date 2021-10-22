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
    name character varying(50) NOT NULL
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

COPY public.destinations (id, name) FROM stdin;
1	Boulder, CO
2	Colorado Springs, CO
3	Denver, CO
4	Fort Collins, CO
5	Steamboat Springs, CO
\.


--
-- Data for Name: messages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.messages (id, text, sender_id, recipient_id, "timestamp") FROM stdin;
1	Change purpose control least. Again can year put ground while commercial.\nSpace fine stop rock shake lot. Article film look lot air course. Method do finish building affect.	7	14	2021-10-16 01:25:13
2	Behind south woman pick. Fill experience position author continue. Window far able population I physical us.	25	43	2021-10-13 11:02:33
3	Loss summer near practice Mrs. Politics style how nice but. Size industry enjoy daughter.\nOrganization Mr likely table beat rise increase. Miss reveal majority these make whole.	12	10	2021-10-02 18:06:33
4	Doctor former still close. Resource miss rich message six.\nSide lot interesting along book try professor. Game share score case. Ever style world marriage how wall.	8	42	2021-10-18 12:10:13
5	At child suffer my enter today alone phone. Environment top system return wish myself.	26	35	2021-10-08 15:51:26
6	Together floor region hair himself hold our. Such along scientist investment course world including. Recognize world whose you.	42	47	2021-10-17 01:29:27
7	Recognize establish energy resource certainly. Those everyone attorney affect.\nBlue ability event stock kitchen current especially. Drug majority cut leg himself.	16	47	2021-10-18 10:27:59
8	Degree thus myself play while peace. Billion turn money recognize this newspaper produce.\nDemocrat score he enter knowledge family out. Cause add matter table just.	43	12	2021-10-19 00:50:47
9	Together option seem apply. Particularly account nearly character speak.\nMuch section to. Within carry guy tough rise indicate. Leader result spring instead think foreign. Treatment stop mother.	5	13	2021-10-21 23:20:03
10	Phone officer high. Great space admit really. American military job produce his vote.	25	8	2021-10-17 12:30:55
11	Animal result challenge mission despite reason rule maintain. Easy way past investment. Ahead stuff example how politics charge.	22	34	2021-10-12 21:13:08
12	Rest pass bit Democrat. Break community one such professional body house.\nTough give former read almost real. Remember particular owner involve. Despite something character those four call before.	11	26	2021-10-18 07:04:04
13	Chance century fill trouble without strong break. Hour game enjoy. Require yourself seem collection system late.\nCamera quite quite memory. Meet likely notice resource also truth.	13	6	2021-10-05 09:42:26
14	Size laugh word move everyone sea relate. First order suffer six. Game read big stop act minute.	29	43	2021-10-12 09:18:28
15	Minute reveal kitchen team deal. Imagine produce ten. Summer need it actually voice beyond see.\nGrow wife clear available. Cover him hard many building. Deal risk data network seem into special.	16	23	2021-10-12 12:46:03
16	Down stand door door stop party. More air democratic you.\nOffice computer save special authority. Control drug strong but eye together firm apply. Hear low college toward time seem.	38	45	2021-10-17 00:06:18
17	Large leader although second agree enough.\nGarden sport trouble show lead sometimes water peace. Yard tend score movie. Read likely yeah ground believe author owner.	35	26	2021-10-12 09:02:59
18	Economic happen what hotel camera my bit name. Player the American year few stuff pretty. Against save see ahead.\nOption visit how fill. Morning south girl. Goal back new federal star.	22	1	2021-10-03 11:22:16
19	Follow war for. Capital audience consumer company show too final.	24	15	2021-10-13 08:48:36
20	Face partner soon Democrat trade. Institution admit again thank.\nChallenge vote answer space. Apply born ground sit. Develop tough onto be south task rather.	34	3	2021-10-10 06:46:53
21	Simply per Democrat top fill water. Do man could talk international democratic physical. Figure born back challenge politics street from wife.	11	34	2021-10-04 14:13:00
22	Pay general single child oil home Congress. Throughout trial see new keep. Level free trial where discuss simple paper.\nMain some management age parent four.	46	28	2021-10-19 07:44:32
23	Start bank accept. Throw family commercial set door force. Significant must half true.\nRemain else under personal no in. Assume quite ball individual serve herself much.	43	11	2021-10-13 05:15:35
24	Fast local page this. Available up clear style.\nThey certainly training could fact. Safe south million make work prove defense.\nSouthern bit heavy its. Cold senior rich wide.	19	3	2021-10-13 00:17:30
25	Note conference past voice without within morning. Look hit still machine house. Letter wide general author.\nIt detail hope soon. Reason respond animal film above green recently lot.	14	37	2021-10-10 17:25:43
26	Kind easy card resource the inside. Hand happy check market order. Return high hour low build data data nature. Standard purpose fine itself note beat purpose.	5	4	2021-10-06 00:27:12
27	Dark job team TV. Single majority project figure someone which. Use thing all enough.\nFrom whose growth success. Drive main spring man team half. Already wall walk chair.	45	29	2021-10-07 21:38:23
28	Drug security kind one answer yard. Behavior analysis every admit group result. Account day might same you then.\nSeven dark process region. Price cultural smile front part.	5	45	2021-10-20 09:29:00
29	Entire difference source history. Price pretty chair include.\nBag else cause direction real piece consider color.\nChild in never write. Admit lead change away.	41	13	2021-10-08 08:57:36
30	Day despite thousand bag heavy care child.\nPerform spend draw set never. Win appear Mr time out number. Wear speech official key with save.	27	12	2021-10-03 07:13:16
31	Cold TV hope fish. Least debate front cost sense owner building partner.	18	6	2021-10-09 21:17:38
32	Already but young. Staff despite value politics tend. Kind less interview smile.\nParty painting soldier trade take watch right arrive. Stand opportunity south word.	40	31	2021-10-20 04:58:02
33	Training loss act maintain still. Size raise century.\nSpend all miss short true also performance allow. Each price wife enjoy.\nDark movie remember Congress than develop education.	38	49	2021-10-16 09:00:46
34	Big throw report color machine fly. Front expect rest than.	9	24	2021-10-10 16:42:50
35	Movie expect its already stop civil. Game month style high together really. Its yourself voice person risk.\nPrice field computer many cold my. Item remain church.\nNature cultural skill season.	33	4	2021-10-03 16:30:12
36	Left director water thank service small day. To sing mention than place per owner. Charge car great political suggest fill.	25	33	2021-10-03 02:46:42
37	Type strategy attorney. Only institution away year. Idea cultural my watch whatever another scientist.	18	25	2021-10-08 02:42:19
38	Everything song evening second more article. Suddenly land night herself term.\nMust experience image through human. History whatever think I.	25	49	2021-10-17 23:47:02
39	Organization wear first phone article on. As view director name first protect.	25	10	2021-10-14 00:27:40
40	Indicate dream debate door push side. Miss specific soldier their season present end.\nPerform treat sell. Draw because one sea suggest sometimes. Color walk central front throughout star.	16	15	2021-10-01 23:28:26
41	Rich everybody think include impact reduce. System send television project year common. With catch interest consumer. Network since cold turn heavy measure.	1	31	2021-10-08 13:37:25
42	Deal rise first itself fund level travel. Standard the possible medical middle. Born federal your sign foot. Consumer determine first discussion.	21	49	2021-10-16 11:57:17
43	Memory foreign so PM boy say realize age. Play decade clear policy decide. Than me customer who.\nProfessional man such miss usually success help. Movie word market want left yourself agency.	36	32	2021-10-10 05:26:26
44	Detail west food truth eight. Computer action radio speech seven system special north. Season career matter.	17	45	2021-10-21 12:29:04
45	Media around ten partner should woman say. Ahead real often executive. Song industry message tonight check north risk.	34	48	2021-10-04 15:50:18
46	Part explain team edge least.\nKeep Mrs treatment head audience. Space as Republican front degree central. Big your standard tell charge safe glass.	23	18	2021-10-19 20:37:19
47	Fast election also base need particularly.\nFeel one security attention public. Bag over like health professor. Southern movie right draw receive.	12	40	2021-10-10 15:16:32
48	Small he everyone kitchen read it identify view. Mean stop different enjoy international girl choice.\nSeem stuff day assume herself. Ground sing employee moment near air.	9	49	2021-10-16 13:48:01
49	Lose by senior really weight soon. Process imagine general section area mind first full. Wife nice again recognize.\nSign maybe impact all. Not note everyone too. Deep any PM executive west.	44	8	2021-10-07 23:59:13
\.


--
-- Data for Name: rides; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rides (id, driver_id, start_dest, end_dest, available_seats, completed, price) FROM stdin;
1	41	2	5	1	\N	143
2	41	2	3	5	\N	337
3	14	4	1	3	\N	28
4	34	1	2	5	\N	452
5	30	3	5	5	\N	188
6	6	5	2	5	\N	34
7	34	4	3	2	\N	436
8	30	3	5	6	\N	19
9	34	4	3	2	\N	4
10	14	2	3	6	\N	156
11	34	5	1	3	\N	477
12	30	3	1	6	\N	156
13	31	3	4	6	\N	366
14	31	2	5	4	\N	156
15	14	4	2	2	\N	183
16	34	5	3	3	\N	6
17	34	1	3	2	\N	404
18	6	5	4	1	\N	72
19	30	3	4	6	\N	254
20	41	2	3	3	\N	412
21	30	2	5	3	\N	107
22	6	2	5	2	\N	120
23	14	4	2	4	\N	208
24	36	5	4	4	\N	237
25	30	3	2	6	\N	174
26	6	1	2	5	\N	324
27	6	4	3	2	\N	362
28	36	1	2	2	\N	231
29	6	4	1	2	\N	302
30	34	3	1	3	\N	102
31	41	5	1	5	\N	357
32	30	2	5	2	\N	159
33	14	5	1	4	\N	149
34	30	3	1	6	\N	17
35	34	5	1	3	\N	167
36	41	5	1	6	\N	91
37	30	2	4	2	\N	272
38	31	3	2	2	\N	156
39	41	4	1	4	\N	411
40	14	4	3	1	\N	200
41	34	1	4	5	\N	104
42	34	4	1	6	\N	409
43	41	3	1	2	\N	308
44	34	5	2	4	\N	483
45	36	5	1	4	\N	33
46	34	2	4	4	\N	289
47	41	2	4	6	\N	175
48	36	3	5	5	\N	263
49	34	5	3	2	\N	426
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, username, password, payment_methods, average_rider_rating, total_rider_ratings, is_driver, average_driver_rating, total_driver_ratings) FROM stdin;
1	Mea966	mkr923vn85px0lu6w4zts1yo7q	[{"provider": "PayPal", "url": "https://paypal.com/Mea966"}, {"provider": "venmo", "url": "https://venmo.com/Mea966"}]	0.807	35	f	0	0
2	Sue647	y0r9t814no7zsm2vpqxu65wkl3	[{"provider": "PayPal", "url": "https://paypal.com/Sue647"}, {"provider": "venmo", "url": "https://venmo.com/Sue647"}]	0.743	40	f	0	0
3	Aida412	mtzvuxyws3q6pr2n179k580l4o	[{"provider": "PayPal", "url": "https://paypal.com/Aida412"}, {"provider": "venmo", "url": "https://venmo.com/Aida412"}]	0.202	27	f	0	0
4	Alison639	lv13t76xqw09y845orumznp2sk	[{"provider": "PayPal", "url": "https://paypal.com/Alison639"}, {"provider": "venmo", "url": "https://venmo.com/Alison639"}]	0.355	7	f	0	0
5	Luciano786	s3twv2980nmx6p45url7ykoz1q	[{"provider": "PayPal", "url": "https://paypal.com/Luciano786"}]	0.403	24	f	0	0
6	Nishka931	0sz8x315puq72vmt6ko49nlywr	[{"provider": "PayPal", "url": "https://paypal.com/Nishka931"}]	0	0	t	0.796	14
7	Cassidy649	n9y8xu052p7qm41o3tzl6skvrw	[{"provider": "PayPal", "url": "https://paypal.com/Cassidy649"}, {"provider": "venmo", "url": "https://venmo.com/Cassidy649"}]	0.952	7	f	0	0
8	Manny218	p1l8472k3vywo9t6u0ms5qrznx	[{"provider": "PayPal", "url": "https://paypal.com/Manny218"}, {"provider": "venmo", "url": "https://venmo.com/Manny218"}]	0.501	21	f	0	0
9	Alexis9	987rus5v4kxnqot01wm6p2yl3z	[{"provider": "PayPal", "url": "https://paypal.com/Alexis9"}]	0.318	25	f	0	0
10	Bellamy389	7umy05ln2kxr64svpt8zqw9o13	[{"provider": "PayPal", "url": "https://paypal.com/Bellamy389"}]	0.290	46	f	0	0
11	Brooks598	2zw97p0ltuq8xry3mk54s16nvo	[{"provider": "PayPal", "url": "https://paypal.com/Brooks598"}]	0.176	39	f	0	0
12	Edie646	08ysnu4v6qlr9kz17w25pt3xom	[{"provider": "PayPal", "url": "https://paypal.com/Edie646"}]	0.090	36	f	0	0
13	Jemima361	rw308k4lqt2pv5noms1yz697ux	[{"provider": "PayPal", "url": "https://paypal.com/Jemima361"}, {"provider": "venmo", "url": "https://venmo.com/Jemima361"}]	0.634	49	f	0	0
14	Ramon4	34vsr1ln2mypux8q7otkz950w6	[{"provider": "PayPal", "url": "https://paypal.com/Ramon4"}]	0	0	t	0.771	19
15	Lou902	qlo3wpx189r6kt2mn07us5yvz4	[{"provider": "PayPal", "url": "https://paypal.com/Lou902"}]	0.932	22	f	0	0
16	Donald919	wvrxk95zt2614lyn0spoqu387m	[{"provider": "PayPal", "url": "https://paypal.com/Donald919"}, {"provider": "venmo", "url": "https://venmo.com/Donald919"}]	0.557	8	f	0	0
17	Marion695	619nl58zptmu3yvro24kwsqx70	[{"provider": "PayPal", "url": "https://paypal.com/Marion695"}]	0.491	34	f	0	0
18	Jamie820	tv9o2un47kzrxm51wqs6l0p3y8	[{"provider": "PayPal", "url": "https://paypal.com/Jamie820"}, {"provider": "venmo", "url": "https://venmo.com/Jamie820"}]	0.239	38	f	0	0
19	Irving880	orkl4w89qnu07xpy1t625zs3vm	[{"provider": "PayPal", "url": "https://paypal.com/Irving880"}]	0.668	25	f	0	0
20	Reynaldo281	914lmtu0wpvn6ys8o53kqr7xz2	[{"provider": "PayPal", "url": "https://paypal.com/Reynaldo281"}, {"provider": "venmo", "url": "https://venmo.com/Reynaldo281"}]	0.327	49	f	0	0
21	Duke415	7zkv1l9snpt5r02o68qyuwm43x	[{"provider": "PayPal", "url": "https://paypal.com/Duke415"}]	0.011	17	f	0	0
22	Bobby492	5lrykmztn14q9spuv3w0x287o6	[{"provider": "PayPal", "url": "https://paypal.com/Bobby492"}]	0.203	37	f	0	0
23	Grainne139	nq62u9z8oxrl47p1tk30ms5wyv	[{"provider": "PayPal", "url": "https://paypal.com/Grainne139"}]	0.396	5	f	0	0
24	Alka696	3mlsz01kqun89vp4rywt2756xo	[{"provider": "PayPal", "url": "https://paypal.com/Alka696"}, {"provider": "venmo", "url": "https://venmo.com/Alka696"}]	0.380	10	f	0	0
25	Sherrie666	7m8tupv9s04nl5o263wqz1ykrx	[{"provider": "PayPal", "url": "https://paypal.com/Sherrie666"}]	0.057	18	f	0	0
26	Blair864	3w86ok5ul1yv04mxq2tnsrz79p	[{"provider": "PayPal", "url": "https://paypal.com/Blair864"}]	0.631	20	f	0	0
27	India604	zw91m238pl605uxsy4tq7nkrov	[{"provider": "PayPal", "url": "https://paypal.com/India604"}]	0.933	49	f	0	0
28	Demi179	rn1l4ok386yp2sxtmu0z79v5qw	[{"provider": "PayPal", "url": "https://paypal.com/Demi179"}, {"provider": "venmo", "url": "https://venmo.com/Demi179"}]	0.334	27	f	0	0
29	Neve158	l4sp5o17930trqxzmykwun6v28	[{"provider": "PayPal", "url": "https://paypal.com/Neve158"}]	0.702	44	f	0	0
30	Brent75	o0yx3wr2uzt7l46qns5kv89mp1	[{"provider": "PayPal", "url": "https://paypal.com/Brent75"}]	0	0	t	0.480	28
31	Philomena63	9ko3vnwpuq8yr4m620t5xl1sz7	[{"provider": "PayPal", "url": "https://paypal.com/Philomena63"}, {"provider": "venmo", "url": "https://venmo.com/Philomena63"}]	0	0	t	0.795	47
32	Brenton337	4yr1395pow6lu0z2tkm7x8vnsq	[{"provider": "PayPal", "url": "https://paypal.com/Brenton337"}]	0.592	38	f	0	0
33	Vicki54	50zy3u4pms2n81xwvltr976okq	[{"provider": "PayPal", "url": "https://paypal.com/Vicki54"}, {"provider": "venmo", "url": "https://venmo.com/Vicki54"}]	0.192	44	f	0	0
34	Cara556	56x1w9q8yt0znvs32ukmop47lr	[{"provider": "PayPal", "url": "https://paypal.com/Cara556"}]	0	0	t	0.228	5
35	Meera67	w8xr304kqs91ymltp5u72o6zvn	[{"provider": "PayPal", "url": "https://paypal.com/Meera67"}]	0.929	17	f	0	0
36	Clarence156	r2tw7v19p6038sznkx4lq5yuom	[{"provider": "PayPal", "url": "https://paypal.com/Clarence156"}, {"provider": "venmo", "url": "https://venmo.com/Clarence156"}]	0	0	t	0.583	15
37	Janie326	o8yvrl97s3p5xm0z4612ntuwkq	[{"provider": "PayPal", "url": "https://paypal.com/Janie326"}, {"provider": "venmo", "url": "https://venmo.com/Janie326"}]	0.730	11	f	0	0
38	Clancy131	4pl26tk8yv79wnmxsrq013z5ou	[{"provider": "PayPal", "url": "https://paypal.com/Clancy131"}, {"provider": "venmo", "url": "https://venmo.com/Clancy131"}]	0.711	41	f	0	0
39	Wesley412	ov8py9206tlwx473uzr1nqmk5s	[{"provider": "PayPal", "url": "https://paypal.com/Wesley412"}]	0.559	32	f	0	0
40	Zac285	415w9qz3l6u2rm8tyv0kpons7x	[{"provider": "PayPal", "url": "https://paypal.com/Zac285"}]	0.891	31	f	0	0
41	Jonas971	pnw542zuvsly7639rk8txm1q0o	[{"provider": "PayPal", "url": "https://paypal.com/Jonas971"}, {"provider": "venmo", "url": "https://venmo.com/Jonas971"}]	0	0	t	0.899	32
42	Ailsa967	lu9qy1n6x72wz8prs3kvm405to	[{"provider": "PayPal", "url": "https://paypal.com/Ailsa967"}]	0.335	48	f	0	0
43	Veronica285	2qnrl79x30wyk684tms15opzuv	[{"provider": "PayPal", "url": "https://paypal.com/Veronica285"}]	0.254	33	f	0	0
44	Athena626	3l694wkyrsx720u8p1tzqmn5vo	[{"provider": "PayPal", "url": "https://paypal.com/Athena626"}]	0.153	48	f	0	0
45	Bernadette852	o52qr34kytsx0v1pzn7m68luw9	[{"provider": "PayPal", "url": "https://paypal.com/Bernadette852"}, {"provider": "venmo", "url": "https://venmo.com/Bernadette852"}]	0.310	32	f	0	0
46	Mimi501	mlrn14o9u60x3q7zys28tkvp5w	[{"provider": "PayPal", "url": "https://paypal.com/Mimi501"}, {"provider": "venmo", "url": "https://venmo.com/Mimi501"}]	0.874	3	f	0	0
47	Tamra88	vkn3z7x0ly5otpsr1qm64829wu	[{"provider": "PayPal", "url": "https://paypal.com/Tamra88"}, {"provider": "venmo", "url": "https://venmo.com/Tamra88"}]	0.596	37	f	0	0
48	Arwen683	kmtzp4w72n6lvysurxq15083o9	[{"provider": "PayPal", "url": "https://paypal.com/Arwen683"}, {"provider": "venmo", "url": "https://venmo.com/Arwen683"}]	0.870	30	f	0	0
49	Mikhaela101	kvn127s0l9qxw685o43zmtrpuy	[{"provider": "PayPal", "url": "https://paypal.com/Mikhaela101"}]	0.934	33	f	0	0
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

