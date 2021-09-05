--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Drop databases (except postgres and template1)
--

DROP DATABASE argwatch;




--
-- Drop roles
--

DROP ROLE root;


--
-- Roles
--

CREATE ROLE root;
ALTER ROLE root WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'md5b4b8daf4b8ea9d39568719e1e320076f';






--
-- Databases
--

--
-- Database "template1" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 12.4 (Debian 12.4-1.pgdg100+1)
-- Dumped by pg_dump version 12.4 (Debian 12.4-1.pgdg100+1)

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

UPDATE pg_catalog.pg_database SET datistemplate = false WHERE datname = 'template1';
DROP DATABASE template1;
--
-- Name: template1; Type: DATABASE; Schema: -; Owner: root
--

CREATE DATABASE template1 WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';


ALTER DATABASE template1 OWNER TO root;

\connect template1

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

--
-- Name: DATABASE template1; Type: COMMENT; Schema: -; Owner: root
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: template1; Type: DATABASE PROPERTIES; Schema: -; Owner: root
--

ALTER DATABASE template1 IS_TEMPLATE = true;


\connect template1

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

--
-- Name: DATABASE template1; Type: ACL; Schema: -; Owner: root
--

REVOKE CONNECT,TEMPORARY ON DATABASE template1 FROM PUBLIC;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


--
-- PostgreSQL database dump complete
--

--
-- Database "argwatch" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 12.4 (Debian 12.4-1.pgdg100+1)
-- Dumped by pg_dump version 12.4 (Debian 12.4-1.pgdg100+1)

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

--
-- Name: argwatch; Type: DATABASE; Schema: -; Owner: root
--

CREATE DATABASE argwatch WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';


ALTER DATABASE argwatch OWNER TO root;

\connect argwatch

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
-- Name: archives; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.archives (
    id character varying(6) NOT NULL,
    added_by character varying(30) NOT NULL,
    locked boolean,
    num_comments integer,
    permalink character varying(2048),
    upvotes integer,
    upvote_ratio double precision,
    title character varying(512) NOT NULL,
    selftext text,
    created_on timestamp without time zone,
    updated_on timestamp without time zone,
    is_img boolean,
    classification character varying(4),
    url character varying(2048)
);


ALTER TABLE public.archives OWNER TO root;

--
-- Name: submissions; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.submissions (
    id character varying(6) NOT NULL,
    added_by character varying(30) NOT NULL,
    locked boolean,
    num_comments integer,
    permalink character varying(2048),
    upvotes integer,
    upvote_ratio double precision,
    title character varying(512) NOT NULL,
    selftext text,
    created_on timestamp without time zone,
    updated_on timestamp without time zone,
    url character varying(2048),
    is_img boolean,
    classification character varying(4)
);


ALTER TABLE public.submissions OWNER TO root;

--
-- Name: subreddit_submissions; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.subreddit_submissions (
    id character varying(6) NOT NULL,
    subreddit character varying(30) NOT NULL
);


ALTER TABLE public.subreddit_submissions OWNER TO root;

--
-- Name: subreddits; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.subreddits (
    id character varying(30) NOT NULL
);


ALTER TABLE public.subreddits OWNER TO root;

--
-- Name: usernames; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.usernames (
    id character varying(30) NOT NULL,
    last_scanned_on timestamp without time zone
);


ALTER TABLE public.usernames OWNER TO root;

--
-- Data for Name: archives; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.archives (id, added_by, locked, num_comments, permalink, upvotes, upvote_ratio, title, selftext, created_on, updated_on, is_img, classification, url) FROM stdin;
mhid1l	archival	f	104	/r/ARG/comments/mhid1l/guys_is_this_an_arg_found_a_pencil_might_be_an_arg/	863	0.97	Guys, is this an ARG? Found a pencil. Might be an ARG.		2021-09-04 18:05:11.54399	2021-09-04 18:05:11.544	t		https://i.redd.it/mgj76nyy5gq61.jpg
d5kh5z	archival	f	21	/r/ARG/comments/d5kh5z/rarg_starter_pack/	663	0.99	r/ARG starter pack		2021-09-04 18:05:19.479164	2021-09-04 18:05:19.479175	t		https://i.redd.it/tbngq9t1z6n31.png
l7pyhx	archival	f	37	/r/ARG/comments/l7pyhx/satoshi_was_found_go_to_the_site_a_decade_old_arg/	656	0.99	Satoshi was found! Go to the site. A decade old ARG was solved.		2021-09-04 18:05:20.813376	2021-09-04 18:05:20.813386	t		https://findsatoshi.files.wordpress.com/2011/04/satoshi.jpg
cfnq6b	archival	f	49	/r/ARG/comments/cfnq6b/gordon_ramsey_arg/	634	1	Gordon Ramsey ARG?		2021-09-04 18:05:23.692205	2021-09-04 18:05:23.69223	t		https://i.redd.it/txvbf2bsjhb31.jpg
dhx1fi	archival	f	121	/r/ARG/comments/dhx1fi/greetings/	595	0.97	Greetings		2021-09-04 18:05:27.196222	2021-09-04 18:05:27.196233	t		https://i.redd.it/k0nwqkpgmks31.png
hvafdp	archival	f	116	/r/ARG/comments/hvafdp/found_in_kingston_on_cicada_in_the_bottom_right/	581	0.97	Found in Kingston, ON.. Cicada in the bottom right??		2021-09-04 18:05:29.342417	2021-09-04 18:05:29.342427	t		https://i.redd.it/116587f1l8c51.jpg
86uxs3	archival	f	198	/r/ARG/comments/86uxs3/at_the_end_frames_a_code_is_seen_in_how_to_basics/	441	0.97	At the end frames a code is seen in How to Basic's "Face Reveal"		2021-09-04 18:05:45.015247	2021-09-04 18:05:45.015264	f		https://www.youtube.com/watch?v=JSXGagNzNLw
e1an6b	archival	f	14	/r/ARG/comments/e1an6b/dad_is_ice_cold/	404	0.99	dad is ice cold		2021-09-04 18:05:49.95712	2021-09-04 18:05:49.95713	t		https://i.redd.it/eatvjayvdr041.jpg
maun2l	archival	f	19	/r/ARG/comments/maun2l/didnt_think_id_find_an_arg_on_rteenagers/	405	0.98	Didn’t think I’d find an ARG on r/teenagers		2021-09-04 18:05:51.284099	2021-09-04 18:05:51.28411	f		https://i.redd.it/yttc9gemclo61.gif
gioxmn	archival	f	135	/r/ARG/comments/gioxmn/a_new_arg/	400	0.99	A New ARG?		2021-09-04 18:05:53.950133	2021-09-04 18:05:53.950143	t		https://i.redd.it/14mktfykofy41.jpg
dcj4zb	archival	f	178	/r/ARG/comments/dcj4zb/new_noology_network/	395	1	New Noology Network		2021-09-04 18:05:56.359158	2021-09-04 18:05:56.359168	t		https://i.redd.it/qj1jrkkhy7q31.jpg
e8i8u1	archival	f	29	/r/ARG/comments/e8i8u1/saw_this_on_campus_today/	396	0.99	Saw this on campus today?		2021-09-04 18:05:57.101466	2021-09-04 18:05:57.101477	t		https://i.redd.it/2tqsoq3c3p341.jpg
ditnn9	archival	f	54	/r/ARG/comments/ditnn9/looking_forward_to_receiving_your_applications/	364	0.98	Looking forward to receiving your applications!		2021-09-04 18:06:03.196271	2021-09-04 18:06:03.196284	t		https://i.redd.it/akyfyin07ys31.png
fhtkki	archival	f	26	/r/ARG/comments/fhtkki/flyer_popped_up_in_minnesota_competitive_arg/	366	1	Flyer popped up in Minnesota. Competitive arg where players run to be president of a cult and explore the multiverse.		2021-09-04 18:06:04.090163	2021-09-04 18:06:04.090175	t		https://i.imgur.com/LrY7LW6.jpg
be0b24	archival	f	29	/r/ARG/comments/be0b24/straight_up_i_made_a_tsv_parody_account_with_the/	349	0.96	Straight up, I made a tsv parody account with the duolingo owl. Check it out if you want or ignore it, choice is yours 😂		2021-09-04 18:06:05.595081	2021-09-04 18:06:05.595093	t		https://i.redd.it/aw9qssmqfps21.jpg
iia0eg	archival	f	76	/r/ARG/comments/iia0eg/found_on_my_college_campus/	355	0.97	Found on my college campus		2021-09-04 18:06:06.804317	2021-09-04 18:06:06.804329	t		https://i.redd.it/xtd6c110qrj51.jpg
l31m19	archival	f	28	/r/ARG/comments/l31m19/alternate_reality_where_john_doe_is_our_president/	342	0.98	Alternate Reality Where John Doe is our President! 🤨		2021-09-04 18:06:10.721797	2021-09-04 18:06:10.721808	f		https://www.youtube.com/watch?v=tzmjslT7Jsg
9zsvub	archival	f	22	/r/ARG/comments/9zsvub/edgy_arg_starterpack/	340	0.98	Edgy ARG Starterpack		2021-09-04 18:06:12.418437	2021-09-04 18:06:12.418447	t		https://i.redd.it/d7303smxr5021.png
kouq06	archival	f	46	/r/ARG/comments/kouq06/looking_around_the_dmz_on_google_earth_and_found/	329	0.99	Looking around the DMZ on Google Earth, and found a weird sign with a QR code in the middle of nowhere that takes you to a site with codes, cyphers, but it’s pretty interesting- seems like a lot of work was put into this stuff.		2021-09-04 18:06:15.296643	2021-09-04 18:06:15.296655	f		https://v.redd.it/aom0n9e51w861
k30psp	archival	f	9	/r/ARG/comments/k30psp/guy_finds_a_mysterious_note/	325	0.98	Guy finds a mysterious note.		2021-09-04 18:06:16.576826	2021-09-04 18:06:16.576842	f		https://v.redd.it/enx1te8n71261
fuph99	archival	f	12	/r/ARG/comments/fuph99/finished_howtobasics_april_fools_treasure_hunt/	322	0.99	Finished HowToBasics April fools treasure hunt	Proof: HowToBasic Treasure 2020 FOUND! https://imgur.com/gallery/YAidQkP\n\nI used coordinates hidden in his 'how to make pulled pork' video to get to Hessel Road just outside of Melbourne. After about 1 km of gravel road I made it to the coordinates. Off to the right of the road was a barbed wire fence I had to climb through into some bushland. I used the 3 pictures also hidden in his video to find where to dig. I dug down about a foot until I hit a box (good thing I brought a shovel). \n\nThe box was filled with: \n- 12 egg plushies \n- a HowToBasic shirt \n- $100 cash \n- A bunch of chocolate eggs \n- Egg-themed cooking supplies, decorations, toys and books\n- A single roll of toilet paper\n\nHope HTB decides to do this next year as well!	2021-09-04 18:06:19.577353	2021-09-04 18:06:19.577364	f		https://www.reddit.com/r/ARG/comments/fuph99/finished_howtobasics_april_fools_treasure_hunt/
djy23n	archival	f	55	/r/ARG/comments/djy23n/found_this_strange_usb_inside_of_my_local_walmart/	326	0.91	Found this strange usb inside of my local walmart, gonna check it out when i get back home, if theres anything interesting ill update if not ill still update, wouldnt get your hopes up though		2021-09-04 18:06:20.05802	2021-09-04 18:06:20.058032	t		https://i.redd.it/klby3ah7xet31.jpg
nant19	archival	f	35	/r/ARG/comments/nant19/possible_portal_3_arg/	316	0.96	Possible Portal 3 ARG		2021-09-04 18:06:20.892677	2021-09-04 18:06:20.892688	t		https://i.redd.it/pjdrzvr3uky61.jpg
oeitwp	archival	f	51	/r/ARG/comments/oeitwp/possible_arg/	312	0.98	Possible arg?		2021-09-04 18:06:23.482279	2021-09-04 18:06:23.482289	t		https://i.redd.it/hk0eml8n9h971.jpg
oahc3q	archival	f	93	/r/ARG/comments/oahc3q/so_i_randomly_got_accepted_into_this_subreddit/	299	0.98	So i randomly got accepted into this subreddit with 100 other people, we will compete for the unknown "grand prize", first challange it is to post something, should i join and keep you guys updated?		2021-09-04 18:06:33.595838	2021-09-04 18:06:33.595856	f		https://www.reddit.com/gallery/oahc3q
knk6mb	archival	f	20	/r/ARG/comments/knk6mb/perplex_city_billion_to_one_find_satoshi_solved/	277	0.99	Perplex City - Billion to One (Find Satoshi) solved after 14 years	&#x200B;\n\nhttps://preview.redd.it/tpi1e2q7og861.jpg?width=283&format=pjpg&auto=webp&s=b742ae8fb249da1e06090f110dfef2cb580e8ab5\n\n14 years after the start of the Perplex City ARG, the second-to-last card (the last being the Reimann Hypothesis Card) has been solved. The characters on the card read "Find Me." and a hint from Perplex City reads "My name is Satoshi." More details on how he was found are at [https://findsatoshi.com](https://findsatoshi.com)	2021-09-04 18:06:38.504265	2021-09-04 18:06:38.504276	f		https://www.reddit.com/r/ARG/comments/knk6mb/perplex_city_billion_to_one_find_satoshi_solved/
la04sw	archival	f	11	/r/ARG/comments/la04sw/dad_arg_its_time_comment_is_on_night_minds_video/	277	0.98	Dad ARG "It's time" (comment is on Night Mind's video)		2021-09-04 18:06:39.44559	2021-09-04 18:06:39.445601	t		https://i.redd.it/ycbvqhgleue61.jpg
fou9fq	archival	f	79	/r/ARG/comments/fou9fq/possible_arg_hidden_in_halflife_alyx/	297	1	Possible ARG hidden in Half-Life: Alyx	So I’m pretty sure there’s a huge ARG hidden in Half-Life: Alyx that no one seems to have caught onto yet.\n\nAt the start of the game, if you turn the radio dial clockwise, you reach a station playing some very fuzzy music. However, if you pull the antenna out and very slowly turn the dial to the left end of the spectrum... you’ll eventually reach a ‘numbers station’. It seems to have some unique noises playing in it as well.\n\nAdditionally, when entering the North Star hotel, on the first floor in the bar there is a radio on the table in the middle of the bar.\n\nYou can’t interact with this radio, but it will briefly play a portion of a number station as well. I’m not sure if it’s the same recording or a different one.\n\nThis is really reminding me of the Portal 1 ARG with the radios that led into the Portal 2 announcement and release with the ARG players rebooting GlADoS\n\nI have absolutely no skills with this, and can’t find a single post or video on the internet about this. I’m letting y’all know in case anyone knows how to trawl the files and find the sound file for the number station, or more than just the one if there’s any more. I haven’t completed the game yet and may have missed other stuff.\n\nEDIT:\nMade a recording. \nhttps://mega.nz/#!9xUigYzC!7jOEtDzwu7-Zn710gTwHgNcdV9deiNYDRH2e9RjA6eQ\n\nits tough to get a clean sound, theres all the background environment, and the voice slows or speeds sometimes\n\nseems to be a pattern of "LETTER/NUMBER and LETTER/NUMBER" etc, and it sounds like there might be a few different strings, so i recorded for a while\n\nEDIT 2: Recording of the other radio in the northern star hotel bar.\nhttps://mega.nz/#!lgFUkajQ!UxbKq-cKjqI1TxVmkO0IpNkp6ieqJloCRP0DkBAx7c4\n\nEDIT 3:\nu/j-max04 did a high pass edit of the first recording to try and clear up some of the background noise. I think the station is easier to hear in it. Here's a link: https://mega.nz/#!MoUliKBT!OIo0z3KIKtHRyShr2Pg_RWK-KUdHI-gF2LtqZcjH6cA	2021-09-04 18:06:28.099467	2021-09-04 18:06:28.09948	f		https://www.reddit.com/r/ARG/comments/fou9fq/possible_arg_hidden_in_halflife_alyx/
ko7qa1	archival	f	42	/r/ARG/comments/ko7qa1/enjoy/	288	0.97	Enjoy...		2021-09-04 18:06:34.427402	2021-09-04 18:06:34.427417	t		https://i.redd.it/zgo16wllho861.jpg
p7a63v	archival	f	5	/r/ARG/comments/p7a63v/go_ahead_order_a_large_you_only_live_once/	276	0.99	Go ahead, order a large. You only live once.		2021-09-04 18:06:39.14196	2021-09-04 18:06:39.141971	t		https://i.redd.it/nsq2zaklsyh71.jpg
ghukgn	archival	f	27	/r/ARG/comments/ghukgn/times_up_lets_do_this/	276	0.99	Time's up! Let's do this!		2021-09-04 18:06:39.995708	2021-09-04 18:06:39.995724	t		https://i.redd.it/wmptl1azs6y41.png
\.


--
-- Data for Name: submissions; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.submissions (id, added_by, locked, num_comments, permalink, upvotes, upvote_ratio, title, selftext, created_on, updated_on, url, is_img, classification) FROM stdin;
p7rcog	indires	f	9	/r/ARG/comments/p7rcog/karmas_puzzle/	106	0.94	Karma's Puzzle		2021-09-04 18:08:10.679039	2021-09-04 18:08:10.679062	https://i.redd.it/o7gfi9ofrei71.jpg	t	
p657bx	indires	f	54	/r/ARG/comments/p657bx/dont_underestimate_this_story_theres_a_hidden/	19	0.85	Don't underestimate this story. There's a hidden message.		2021-09-04 18:08:11.074374	2021-09-04 18:08:11.074391	https://i.redd.it/zynxvb9ekxh71.png	t	
nmnmf9	indires	f	79	/r/puzzles/comments/nmnmf9/secret_word/	69	0.97	Secret Word	A teacher writes six words on the board:                                                                                                                                                  cat, dog, has, max, dim, tag.      \n\nThe teacher hands a piece of paper to Alex, another to Ben, and another to Chris. The teacher explains that each paper contains a different letter from one of the words written on the board and those 3 letters combined spell one of the six words above.\n\nThe teacher asks Alex if he knows the secret word, and he replies aloud, "Yes."\n\nThe teacher then asks Ben, and after a moment of thinking, he also says, "Yes."\n\nAnd finally Chris is asked and he takes a moment and then confidently replies, "Yes," he also knows the word.\n\nAlex, Ben and Chris always ace their logic exams. Which of the above was the secret word? Which letter did each person get?	2021-09-04 18:08:15.957618	2021-09-04 18:08:15.957634	https://www.reddit.com/r/puzzles/comments/nmnmf9/secret_word/	f	
moxncs	indires	f	64	/r/codes/comments/moxncs/found_this_cipher_text_that_is_supposedly_linked/	69	0.99	Found this cipher text that is supposedly linked to an 'art project'	I found [this post](https://np.reddit.com/r/puzzles/comments/moteui/a_cryptographic_puzzle_for_a_new_art_project/) on the puzzles subreddit.  Apparently everything you need to solve the puzzle can be found at [libeskind.art](https://libeskind.art) ([archive](https://archive.is/HBdVW)). The post indicates that hints will be provided periodically.\n \nHere is the cipher text exactly as given:\n \n```\n \n \njA0EBwMC5uf3Y3IBXGTo0ukB9cKropsbGp1u5pGXbk7ZS9dJJPkS5Fyf6Hm0UBV/\nenwbjHHMD8tAeD0yRXmqmyAaIY4X9l6IVgwAJ+yyIW5ZI5FBeax48PVzZ2li38rb\nLYDR30T6Pb7Im8pFoqpkSkY6CcIfQikDHx/AoDvnnsVIl704Lqzh0bhvSe95zSMc\nfeGHH0BdUu0SE7RzmN0Fou73cUHyKJTG/SPG1iqJi/fv4IN22EXriUMecVqZYVs6\ntTOt1UTMAssRXm7tI1z3P6NqpOatWh7h+F8tOVrqSZTF1Jls5e3rLQL2Op90XpQE\nJvYXB0B6NVgGMyRA8P53jQW8fpfAFBDcjrXPK3Vgbl6JVYAg9Hxd/C+WhTBUQtRQ\nZx1dCKCH1LrnJJ7cnRRPUmSXRcLdUDto9S6FgmNCIHIuggDGvVeeW7fPDgHy7wuk\n5OsqOFmf6bcGgpyZyOrojzcJY2qkRqqODCU+vyReoHacBANlS2Kna/IHnaqa7v1r\nJyAFQVriPyqslJOWiFfeRalCDpAMECgfmIT5WR4mmk/Fxs4gmQTVolr5r3wU8Du/\nLCdzhIrFs5CR2zg9ip7ACDisVQVk0hqU1qoqvPonHoZIyFmbeR8epgJ+Ixhy5tfA\nnR/ckgavHaD3UOAYA6X++eYMoe2PCqAppG3oiqp1YdGHGU0/h04ObL9yuVHUbXVG\n78A8qQIYuOx8b8gTZwKvkZTI6d1W6rvB8r07edAiKKsyp4C37iov9DWqQX0qaJf0\nl4hyo8eBiqUt6PGB8nqeWccL8sRVjl1XU3mDN9/h7sKv9COfSRv5K01J8s1luvTu\ntZJkwBm6vkG55wfHWj0WlCWAE+6eJAgKjMfVULPo8u6ikJybhJDOEo6QoRO/pWsW\nHdY7ScgTadjrgvNp/ebpJFDw2N3ZZEF5WltClbehVW45d9PF0QTdZ0B1W9JE6rHO\nzb/Viv0bu5XSirWFdE//xd1vRP+0lKqbnzQmOcllBiKD5CsZK4OyGxC1Xjg8qO1z\nzincjPY/P8HEuSMrP5Lm\n=EOX6\n \n```\n \nI'm a beginner at this and not sure where to start but it seems interesting. \n \nV sbyybjrq gur ehyrf	2021-09-04 18:08:25.730606	2021-09-04 18:08:25.730619	https://www.reddit.com/r/codes/comments/moxncs/found_this_cipher_text_that_is_supposedly_linked/	f	
m4blpa	indires	f	16	/r/ARG/comments/m4blpa/opensea_arg/	98	0.99	OPENSEA ARG		2021-09-04 18:08:27.029283	2021-09-04 18:08:27.0293	https://i.redd.it/1pv54dic4um61.png	t	
ldtxuz	indires	f	29	/r/ARG/comments/ldtxuz/are_args_dangerous_and_can_they_change_anything/	32	0.84	Are ARGs dangerous and can they change anything in the actual world?		2021-09-04 18:08:29.172956	2021-09-04 18:08:29.172972	https://www.reddit.com/r/ARG/comments/ldtxuz/are_args_dangerous_and_can_they_change_anything/	f	
kszdu9	indires	f	11	/r/codes/comments/kszdu9/2_variations_on_a_theme_decryption_puzzle/	49	0.95	2 Variations on a Theme. Decryption Puzzle (Transcript included)		2021-09-04 18:08:29.464337	2021-09-04 18:08:29.464352	https://i.redd.it/6tudmgk2y2a61.png	t	
juqln9	indires	f	4	/r/ARG/comments/juqln9/challenges_and_riddles_2/	1	0.57	Challenges and Riddles - #2	Hey everyone,\n\nfrom six answers to the last challenge ([https://www.reddit.com/r/ARG/comments/jtfd9w/challenges\\_and\\_riddles/](https://www.reddit.com/r/ARG/comments/jtfd9w/challenges_and_riddles/)), four of them came from r/ARG, so although I put the challenge in multiple place going forward I'll stick with r/ARG because it seems to be the right place for this.\n\nI'll try to increase the difficulty but for now keep giving as much hints as possible without being obvious.\n\nHaving said that, this challenge consist of two riddles and an image association exercise. The first riddle serves as hint for the image.\n\nSo:\n\n**Where hopeful people go**\n\n**Seeking fortune, not fame**\n\n**What lucky people scream**\n\n**It's were you'll find my name**\n\n[https://i.imgur.com/JjiQxUz.png](https://i.imgur.com/JjiQxUz.png)\n\n&#x200B;\n\nAnd then:\n\n**What a strange name for a person**\n\n**But my occupation is also odd**\n\n**Come connect with me**\n\n**Where everyone has a fake job**\n\n&#x200B;\n\nWould really appreciate some feedback on this.\n\nLet me know if you think it's too easy, too hard, what can be improved.\n\nThanks and have fun :)\n\n&#x200B;\n\n**EDIT:**\n\nHINT #1: >!The first riddle is a hint itself for the image. The image refers to a location. !<	2021-09-04 18:08:32.126524	2021-09-04 18:08:32.126539	https://www.reddit.com/r/ARG/comments/juqln9/challenges_and_riddles_2/	f	
jqgv62	indires	f	27	/r/ARG/comments/jqgv62/burn_emailed_me_this_saying_its_step_1whats_step_2/	125	0.99	BURN emailed me this saying it's step 1...what's step 2??		2021-09-04 18:08:32.505254	2021-09-04 18:08:32.505282	https://i.redd.it/u39cx6l592y51.png	t	
jgcle4	indires	f	4	/r/puzzles/comments/jgcle4/w2_s1_v28_p265/	1	1	w2 s1 v28 p265	2w9y02lsolwoyr7m12zftb8n88vvxho9fn2cnkflmacm5dysx5h4utgu7lgabhiz4yzf5gpqr5qhpyk7w46gmn2qjelberemjn8iylf5roo266igwc2n1vkmu4b5uvitmkigai64y76umh61rt1evvp4yd9j95m5dn9w7xva369fsbdy3k8xigxpovmzq0k2bn75xu7r2otfyo1t60se4os6c51kwdd7d6655e368hct758wbpp6rwgkj56768e1n241ckuz569sju3cwnoumpus7c2jaz1jnmnen55uw7o3szg7vbvggfjifi5nhd7fbnyhvakaxs66g9p4rh6sq4cdtn0enbzxnet3gxubkya9bubcubudvgsie242970x2fc61kg2yal2brh0yuf7t7uq3gpkky345swkpna0i1x0j3tlxjfmk5bpujea6cggi04q8jn3so8bpr9l81l568b9ppkjpv20mer8ydfs54q3w81yjcj93xx3zmexlvp7ezkyo23svk0at8k3ljpfe7d8wrypfzpvxniabmzs8ddmyh7s5ejrlq13ydme09rb2deg82bhakgjnkp8oxn251cld5bx68mxmbi21troub3wnxcf0nciag53oevsrjhtmowo67nymet644yq4uvw897sul3m2wo7h7a4k8daej1ynkjdxqq1vrck5fzrdtokj6sttw7gyyuavgz6ni79bruqgklye3wv3n9382iorglg8x5ft67otv6os301m7ny3ptbvslcldgm7i1oqo1h0ywzeakme6j7gwc3z2b5ofmawy26f10wieptn4wj6g8fibr37jiv9kzllqux2q4h9kjfnu5ed1vxvfp3diys0nwh7pltjbyolcek8fwt2lwhw0ksl9wzgdm65dll3htfoj5nh20xwxt0kqco8gzvypcefr6i8uph3sqfk4yto91n6ov6za3ds7xb2bx20hq57j7u80kqiovtm2hjosmacycsb1fhr4yv5ov6yw6ardj5e2rko4su5hhmrq5l12kk55ivnq3p9k0ycsycgt47ar4t79qavntpcg1p4cookbgvqsbsih1b8guyuntwjir6y86nlzd8og7fcype5wbojgareyatr34x2md5g55ifhhegm6yhrlj8yfmp6oq2vbb0ab23ygdggv3vblgxf8xlj9o3rapxqj2ul84us4qb9a2oqemd8zrouy5czovt8larn4fagpccrr9uo6fo6oiqbapcnuwx4hpe7qsim4196gx9xolazivdz5kgroymxa7m07ac1sei3p6pvnxsx4p6woehlcb83fi309xm8ihrggryxr0xrs3ch7w29dft8r0ldv06my2nnqz58crptaay7r4rufvdi0lipomizosjz0kf574q3kgnpszygv5ttkr3q1zs080c7fjn1cic4reo2ve2228v7bi54hmk1t0elk6mfbew8uqws5w24adjksgk0kaxo4babqqfq79io0pt3g2e5vknd1sv96e3ap6dff0id1ghx8uostuew3gmp8vnzorwrr44za8zhvsz1m2l5xrqigjk1n7mkz3jcm13x8728kb685a5fb50w43968qt68pjjk0ms7qiphmvlgno3t3j4olk64k2cb23z74uxfpbdem24no1ftbpilu9iylabnu0epw9pbouk1p8j0b78uefl181nr7j138swldqpo9oscm9f7819t4f7zmhdgt70nwgh5jxlzfsgwe9yaeyf7inqc85ki3q9uv6ahk72hxs5z75qxb778x7xi3oklfuxsx18kv06sgz98ir8owhogaf7f0qghpq6agxzhndyzu8uotk6n241cydxb1zsfiv75h3a9qpv2hss611zjdme0dzecqxlig5e4c9b14emqrlft3eronub8248h278u54knqvskkg2unrlf0ixs3pjud24kb30h61s8116lk36h3z9j24fhxe6jp8j6g2hdbsd95249vp0r2p98shrti5t1foi1sr33dnewxq2b9vrlefs2yvbm06w6mol7es31mov9rwodrqlvf4s0v3cntzwvvqepq1v4prcrcrh00n3whmpocapck34tlaoyldqio22vvnglpxt4yueiv43l44bwee2w91gfxrwlesofsn5tsp3qyc4urrjz50hry5r156ntcou7wxczp1wvpygawn1kujejx1pr5r8opbeqj7po79xqv7tnsfsaurgjpgcomltia52fzkvg7c3a84tvfht8k012gcwdruxpclbts8xd0ws6txxae2bla0k82w7yosu5lsbdc8p913p9t4kvg1xw7ad98glci5jxaqn5nldbhfxnmf0njuxvfdhby7qahd0fxve8rekbrlcymoyf84t1pou1e26vzt7dfkl7kjknnfavmbrmrkrpv4t7rhop2hbf0zri4ynzokftfey5ia0phwn0buwfum6i7i84l5563ekocfbbd2sbws3jbp01vluiggn1ewkeyfgp4kfurzzp9idqjkmz15dlcwklmje7oykgxbm2i3yuxm0iejwoljcmi4ibeubsuw4dh0gqa5cndqmow2nagfgdkelkj6uspx28txzd3iw6p1nvjyzjznxueunfmf0nx1oeeuj7hmbvn13s8c2ixphglmoa6jbzfn4jjpnrzyx80yrmmqj84jkpa1dylb0scyur56vkemr246nhdlhhhx3gb1bs5wwikw56ggpypq527nmna2g80hg81ugivburevu9elq181hfps3705koccqeppklu64eo0y08n2iib3pkacd70f4jmea8clln55qt91ibapbpfgpa80r6sqov8ti8mnifo8me6hcu5fhfjhk869bjgsnzk870qbe874zeigmz1pg5ngo5gkovdbgw1f2ovu0uoo10nhg4ca2y2zbdvmnlih83yinjvdhgp5qsqri99z4dh6ohpyukths2jf314v70x5dgxmzenehvwpr11tf2xal18lxbd57vt6yjxiyifdi7s0ynac6l1cxny2atmwhqqhsc4uu4tir15tt3p6pvvjk4nq8kp94nom3ttblesro2t1vy4zkidarzmy0qnjie6cbjh8utlzly33qxhln0q7injaxk00686n98q9swq946psdh4qx9mchc3z5fbe6ryf5dg5gqmli8w3wrvn6q0eithd0k7gv5y09p4k4utl67479q1fgh61ndm0	2021-09-04 18:08:34.275312	2021-09-04 18:08:34.275344	https://www.reddit.com/r/puzzles/comments/jgcle4/w2_s1_v28_p265/	f	
jfjy0u	indires	f	5	/r/codes/comments/jfjy0u/base_64_5_steps_english_self_made/	2	1	Base 64; 5 Steps; English; Self Made	V sbyybjrq gur ehyrf\nPlease comment both your answer and method\n\niVBORw0KGgoAAAANSUhEUgAAAAoAAAAKCAYAAACNMs+9AAAAAXNSR0IArs4c6QAAAIRlWElmTU0A\r\nKgAAAAgABQEGAAMAAAABAAIAAAEaAAUAAAABAAAASgEbAAUAAAABAAAAUgEoAAMAAAABAAIAAIdp\r\nAAQAAAABAAAAWgAAAAAAAACEAAAAAQAAAIQAAAABAAOgAQADAAAAAQABAACgAgAEAAAAAQAAAAqg\r\nAwAEAAAAAQAAAAoAAAAAo1FUXwAAAAlwSFlzAAAUTQAAFE0BlMqNLwAAAg9pVFh0WE1MOmNvbS5h\r\nZG9iZS54bXAAAAAAADx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9\r\nIlhNUCBDb3JlIDYuMC4wIj4KICAgPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9y\r\nZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4KICAgICAgPHJkZjpEZXNjcmlwdGlvbiByZGY6\r\nYWJvdXQ9IiIKICAgICAgICAgICAgeG1sbnM6dGlmZj0iaHR0cDovL25zLmFkb2JlLmNvbS90aWZm\r\nLzEuMC8iPgogICAgICAgICA8dGlmZjpZUmVzb2x1dGlvbj4xMzI8L3RpZmY6WVJlc29sdXRpb24+\r\nCiAgICAgICAgIDx0aWZmOlhSZXNvbHV0aW9uPjEzMjwvdGlmZjpYUmVzb2x1dGlvbj4KICAgICAg\r\nICAgPHRpZmY6UGhvdG9tZXRyaWNJbnRlcnByZXRhdGlvbj4yPC90aWZmOlBob3RvbWV0cmljSW50\r\nZXJwcmV0YXRpb24+CiAgICAgICAgIDx0aWZmOlJlc29sdXRpb25Vbml0PjI8L3RpZmY6UmVzb2x1\r\ndGlvblVuaXQ+CiAgICAgIDwvcmRmOkRlc2NyaXB0aW9uPgogICA8L3JkZjpSREY+CjwveDp4bXBt\r\nZXRhPgogvBl9AAAAR0lEQVQYGWMMSUv9z0AEYFFh5iVCGQMDy2fmj8QpZP8vTpzCL78+EKfw2Xui\r\n/MLAoqbwkzgTWRhfEqeQmZGTOIVv/ysRpRAA+c4PdjHH/KsAAAAASUVORK5CYII=	2021-09-04 18:08:35.319803	2021-09-04 18:08:35.319819	https://www.reddit.com/r/codes/comments/jfjy0u/base_64_5_steps_english_self_made/	f	
iy3g56	indires	f	16	/r/ARG/comments/iy3g56/find_me_puzzle/	173	0.99	"find me" puzzle		2021-09-04 18:08:39.290018	2021-09-04 18:08:39.290047	https://i.redd.it/0h34feqwqto51.png	t	
nzsn5t	PotatoKingTheVII	f	2	/r/ARG/comments/nzsn5t/oh_no_watch_out/	0	0.5	Oh no! Watch out!		2021-09-04 18:09:55.114571	2021-09-04 18:09:55.114587	https://m.imgur.com/a/UuxbcNi	f	
j8sjbv	indires	f	6	/r/puzzles/comments/j8sjbv/egypt/	1	1	egypt	I have a puzzle that uses lists/sequences to find answers.\n\nThe required number increases by 1 on each row\n\nexamples:\n\ngiven 'Neon' (the 10th entry in the periodic table)  the required answer is 'Sodium' the 11th value of the periodic table\n\nentering 'Sodium' as the answer I am given 'november' ( the 11th month of the year)  and the required answer is the 12th month 'december'\n\n&#x200B;\n\nentering 'december' as the answer  I am given 'Gone With the Wind' (which is 12th Academy Awards – Best Picture ) so the required answer is the 13th Best Picture award 'Rebecca'\n\n&#x200B;\n\nentering 'Rebecca' as the answer I am given 'Eqypt' --- which has to be the 13th of something and I need the 14th of it!!!\n\nAny suggestions would be appreciated.	2021-09-04 18:08:36.47915	2021-09-04 18:08:36.479177	https://www.reddit.com/r/puzzles/comments/j8sjbv/egypt/	f	
j2ul6m	indires	f	8	/r/codes/comments/j2ul6m/weird_code_that_seems_like_hex/	4	0.84	Weird code that seems like hex????	68 74 74 70 73 3l 2q 2q 64 6q 63 73 2p 67 6q 6q 67 6n 65 2p 63 6q 6o 2q 64 6q 63 75 6o 65 6p 74 2q 64 2q 31 70 4l 6q 70 6q 4n 67 74 53 62 37 76 74 76 48 46 56 65 5l 47 32 39 38 30 36 55 54 79 4p 72 77 35 6l 33 79 50 55 58 75 77 65 39 63 2q 65 64 69 74 3q 75 73 70 3o 73 68 61 72 69 6p 67\n\nIt gives out most of the message which is a google doc, but some letters are missing\n\nhttpsdcsggecdcuetd1ppgtSb7vtvHFVeG29806UTyrw53yPUXuwe9cedituspsharig\n\nMost i've been able to scrap is this\n\n[https://docs.google.com/document/d/1p](https://docs.google.com/document/d/1p)pgtSb7vtvHFVeG29806UTyrw53yPUXuwe9c/edit/usp/sharing  \n\n\n V sbyybjrq gur ehyrf	2021-09-04 18:08:38.617654	2021-09-04 18:08:38.617672	https://www.reddit.com/r/codes/comments/j2ul6m/weird_code_that_seems_like_hex/	f	
iory3z	indires	f	11	/r/codes/comments/iory3z/found_a_cryptographic_treasure_hunt_on_yt/	26	0.95	Found a cryptographic treasure hunt on yt.	 [https://www.youtube.com/channel/UCt1dPCuSKdc8qShXWldHx9Q](https://www.youtube.com/channel/UCt1dPCuSKdc8qShXWldHx9Q) \n\n V sbyybjrq gur ehyrf	2021-09-04 18:08:41.127214	2021-09-04 18:08:41.127241	https://www.reddit.com/r/codes/comments/iory3z/found_a_cryptographic_treasure_hunt_on_yt/	f	
htj1t0	indires	f	5	/r/codes/comments/htj1t0/a_very_simple_cipher_or_is_it_trust_me_it_is/	3	1	A very simple cipher, or is it? Trust me, it is.	Okay, so I was bored and made this simple cipher, its a relatively simple one, I found this cipher method while playing a game, and I figured out how to crack the game’s cipher in under 5 minutes and I decided to make my own fun puzzle with the cipher I had learned, so well, if you’re clever, have fun. There are two hints in the cipher itself to help and make sure to look keenly and you might want to think about it if you’re struggling. I think its a easily solvable cipher in under 10 minutes! \n\n<-> Cipher starts from here <->\n\nPee, tgn zfmjzcnq eq.\nTgn’jq mpzfb tgnj ydqoqj, xnm wjq tgn?\n.\nAjctcp, zsr grq icwcb.\n.\n‘Fglr’(q)\nUip’ml diicahy rim ao.\nSzwo wml uip omuahy oi rahg?\n\n<-> Cipher ends here <->\n\n\n[ V sbyybjrq gur ehyrf ]	2021-09-04 18:08:48.348224	2021-09-04 18:08:48.348241	https://www.reddit.com/r/codes/comments/htj1t0/a_very_simple_cipher_or_is_it_trust_me_it_is/	f	
ht0paj	indires	f	8	/r/puzzles/comments/ht0paj/i_guess_this_fits_here/	2	1	I guess this fits here...	A friends wanted me to solve this once...\n\n\nYou have 10 boxes, each with gold rods inside, but one of those 10 boxes contain false rods that are indistinguishable from the real gold. The only difference is that the false rods weigh 0.1kg more than the real gold. You have a scale and can only use it once and then it breaks. How do you figure out which box contains the false rods?	2021-09-04 18:08:49.725471	2021-09-04 18:08:49.725487	https://www.reddit.com/r/puzzles/comments/ht0paj/i_guess_this_fits_here/	f	
h7h4l7	indires	f	50	/r/ARG/comments/h7h4l7/i_thought_we_were_friends_francis/	49	0.88	I thought we were friends, Francis?		2021-09-04 18:08:52.265853	2021-09-04 18:08:52.265871	https://www.aidentity.nl	f	
gtlbff	indires	f	1	/r/ARG/comments/gtlbff/is_this_part_of_that_thing_called_tryfg_it_seems/	0	0.5	Is this part of that thing called tryfg? It seems they're still in activity...	[http://pelzer.fun/](http://pelzer.fun/)	2021-09-04 18:08:53.306624	2021-09-04 18:08:53.306641	https://www.reddit.com/r/ARG/comments/gtlbff/is_this_part_of_that_thing_called_tryfg_it_seems/	f	
ph3bck	StudentConfident9045	f	4	/r/ARG/comments/ph3bck/mediaoffline_notepad_10/	23	0.88	Mediaoffline notepad 1.0		2021-09-04 18:09:13.09335	2021-09-04 18:09:13.093367	https://i.redd.it/j8ipq7xdx9l71.jpg	t	
ownbcu	PotatoKingTheVII	f	3	/r/codes/comments/ownbcu/3_layer_unknown_code/	2	1	3 Layer Unknown Code	Hello, sorry to bother this subreddit, but I need help with a code. For context, the message is a message in one of the announcements, where they posted a message to foreshadow the happenings of an upcoming event. We don't know the answer to it yet. The full message is below:\n\n    You recieve a broadcast from an unknown number.\n\n***Your connection to the wildcard will cost you more than her life but also yours. Hand the wildcard over to us or we will take her by force***\n\n    The call ends and you recieve a text from a different number\n\n*21830465 89715420 61182351 07544216 24166642 07319868 01350790 00124680 23517041 63357086 87105068 81392416 67380810*\n\nNothing else is said as the number goes offline\n\nPrepare for an event made by yours truely. It will be puzzle centric, can you keep up?📷\n\nThere are no keys, according to the same admin, and there are supposedly 3 "layers", presumably ciphers or steps.\n\nV sbyybjrq gur ehyrf	2021-09-04 18:09:44.923687	2021-09-04 18:09:44.923702	https://www.reddit.com/r/codes/comments/ownbcu/3_layer_unknown_code/	f	
olymhz	PotatoKingTheVII	f	50	/r/ARG/comments/olymhz/are_you_the_chosen_one/	150	0.98	Are you the chosen one?		2021-09-04 18:09:45.698721	2021-09-04 18:09:45.698736	https://i.redd.it/477gh0nxqpb71.jpg	t	
oi1w61	PotatoKingTheVII	f	3	/r/ARG/comments/oi1w61/who_is_my_torment_and_key/	1	0.6	who is my torment and key?		2021-09-04 18:09:46.489465	2021-09-04 18:09:46.48948	https://imgur.com/a/aGIyjrI	f	
ogln28	PotatoKingTheVII	f	5	/r/ARG/comments/ogln28/base64/	1	0.55	Base64	 \n\nCan anyone translate? Upper and lower case letters are not correctly spelled.  \nBase64\n\nW4KGZNJPBY4GTWUGC2LUDG\n\n8GC296AW5OBYBLIGLZB2XHZG\n\n86ZGUGDHVKBY4GTMFKYSBTY\n\nWLZIGZHEIBZZW50AWRVLCBLI\n\nGEGBWVZZXMGBSOJBYBZAWS\n\nOBYB2B250YWRLIGRLIHZPDMV\n\nYLIBOWSNVIHNLASBHDMOPIHF\n\n1YW5KBYB2B3UGY29UC2VNDW\n\nLYIGFNDWVUDGFYIGLZC28UIE7\n\nDO28GC2VPIHNLIGFSZ3XDOWO\n\nGDMFPIGXLCIBPC3NVLCBLIGIL\n\nC21VIHFIZSBSZWLHLCBZZXLD\n\nOSBPBXBVC3PDRXZLBCBTZSB\n\nZYWX2YXIU	2021-09-04 18:09:49.471146	2021-09-04 18:09:49.471161	https://www.reddit.com/r/ARG/comments/ogln28/base64/	f	
ochhcs	PotatoKingTheVII	f	13	/r/ARG/comments/ochhcs/ok_well_here_is_a_number/	17	0.95	Ok, well, here is a number?	I was trying to call an old friend that gave me his number, but he either gave me the wrong one or I misdialed. Anyways, I called 4192960172. Weird ass voicemail, could be a troll, or a new arg. Who knows. Anyways, good luck, I’m too lazy to do this lol	2021-09-04 18:09:51.769466	2021-09-04 18:09:51.769481	https://www.reddit.com/r/ARG/comments/ochhcs/ok_well_here_is_a_number/	f	
o9mx0z	PotatoKingTheVII	f	19	/r/ARG/comments/o9mx0z/johan_needs_you/	65	0.91	Johan needs you.		2021-09-04 18:09:52.41579	2021-09-04 18:09:52.415806	https://i.redd.it/z9w63bkt11871.jpg	t	
o1wn9v	PotatoKingTheVII	f	6	/r/codes/comments/o1wn9v/found_this_on_rt3dea_it_looked_like_a_barcode_at/	5	1	Found this on r/T3DEA, it looked like a barcode at first so I tried to convert into a text but it didn’t work out, what do you think about this?		2021-09-04 18:09:54.331063	2021-09-04 18:09:54.33108	https://i.redd.it/era3p919qt571.jpg	t	
ifrjf1	indires	f	36	/r/ARG/comments/ifrjf1/whu_does_the_community_on_this_sub_feel_so_toxic/	167	0.96	Whu does the community on this sub feel so toxic and gatekeepy?	I only recently got into ARGs and was really excited to be apart of this community, but literally only after a few hours of browsing the subreddit I saw so much negativity and hatred towards other users and their projects. Is there something I'm not getting ? Is that just how it is here? If so then that kind of sucks. I can get behind the whole no in character posting rule, that would ruin the immersion completely, but instead of calling people names and making fun of their projects, why not just ignore them ? I dont know, maybe im taking this too seriously, but I just found it to be a bummer.	2021-09-04 18:08:42.353428	2021-09-04 18:08:42.353444	https://www.reddit.com/r/ARG/comments/ifrjf1/whu_does_the_community_on_this_sub_feel_so_toxic/	f	
i75r0f	indires	f	3	/r/codes/comments/i75r0f/possible_rot47_might_be_something_similar/	4	0.83	Possible Rot47 > ?? > ??, might be something similar	Hi, it's-a me. Again.Straight to the point, another document. **NOTE THAT THIS DOCUMENT IS IN NO WAY RELATED TO THE OTHER EARLIER POST I MADE ON ANOTHER DOCUMENT.**[ ](https://docs.google.com/document/d/1YAVzfuBWyvG6noHxOy--qpraKlRdoL8K242rSad7Zgg/edit)[https://docs.google.com/document/d/10RNw0SEYTcXv6tLyZru9jRSJC6Wkh6zGIH4KJ0r8AWc/edit?usp=sharing](https://docs.google.com/document/d/10RNw0SEYTcXv6tLyZru9jRSJC6Wkh6zGIH4KJ0r8AWc/edit?usp=sharing)  \nThe document doesn't contain much simple:  \n=\\`8F\\*FD,B+CERn@FlIq>Eb-A%Ci=3&+E)CE+E)-?FD,5.Ea\\`iuAI;@MFED57iddF>F(oH%DKI"DDId=!+EMX5EcQFJF)-%P$;,G\\^F<G!7D..I.ASc'uiddF>@<<W6BOr</DJ=9\\*EcYe!6#L3UGAhA0ATDL&iddF>iddD\\*Dfp.EFD,\\*)+E))UJ=.O"F\\_,W9Bl@lM+EqLE57.a#Dfm1DBOP\\[f+F.mJEZf%,@:UKhF<GdGEbo9-+E(j7GAhMBGq9:qDJs\\`5DW627+DGp?@;0W=J=1L%De=\\*&DBO%7@<<W;Dft\\&iR;?\\[\\^Anc-n/.+\\[ZC\\`mh5AKYE!F\\*D29F!,RC+F.mJEZf@EATDKrEsb6FDIm6uBHVD1AKYK!ARTU%@VfI\\_CER\\\\6Gp$O5A0>i\\*DIkF-$<\\_:i+EqaAA7\\]d(BkAK3AKZ#3F(HJ:E$/b5Df$V6F\\^thFDIal6@;K\\^jA0>r8Ea\\`ZpBQPA\\*DIal3@;Ka&F\\`;8:+EV:2F!,%&Ecc!SJ<UC:EZfR7F!,1=+CT)&+CfG'@<?'k+DG\\^9@3BE\\*D.RU,idd7#5p0ZUDI\\[6sFD5Z2+EV:\\*F<G4)G%De=F!,RFF\\_)\\\\)Bl\\\\<//d\\_qOEb-A;AKYDtC\\`mV6+Dl%;AKZ).@;\\[30BQ%s'+Dl%7CLqd4$:T,VCj'N1iddF>F)5c=Cj@.6Dg-(ACh\\[KmiddG<+Dbt6B-;#)DIl$>:N@RlF!,R<ATD?)D/XH++EVNEARTV$BHU\\`$A0>Ps@<Q4"$<1qd@q\\]Fa+C\\]U=F)Po,FD,B+B-;;:F\\_l=GF\\*1r.Bl.EG$49jG+DYP"E$0(:+E2I@@q\\]RoiddF>@r-'nCNCV,DIal"@<?U-AI:\\_@A0>u7H"h0UJ=.O%D\\]i\\\\(F<G\\[=Ec6)5BHUkp@q\\[!&ATo86DfTaTJ<UC-F\\`\\\\a?F!,R<ATD?)D/XH++EVNECh\\[Km+EV:\\*DBNJ8Bl;p\\\\R0l5tA0?)1Cht5<AKZ&4D.RC!G9C@++ED%&DfT\\_\\[$49(8C\\`mh5AKYJkFED>1+DYk5G9CaJ+D>2(A0>i3De\\*BmDW627$:/\\_U8K\\_h\\\\@:UL&BOu$'@;Kk"B-;;1D.V\\^WR<'Kl@:UL)@<pj\\_PR:K'+Dbb8AKYT'EZeh6F<G!7Ao(msBPDADJ=.NsDf'''F=\\[bbF!,\\[<+Eq79@q\\[!$BkCp!B5\\\\o%Gp$g=+E)./+EM47Ec\\`F7@<jIJ$49\\^M+DkP&AKZ).AKYGnF\\*&OCAfu29@;0P!+F.mJ+ED1,ALns6Dg,Z/H/a@=$:SB5BHVD8D/XH8Dg\\*=<F!+q1FD)eBDfp)A+CT.u+Dkh1A\\`A6)$:/Q?+D5,/AKYf-DJ()#F<GXH@<-E3Bl5&8BOQ!\\*G%#H6+EM=D$;bPI@qB0nFD,6+AKYH-+DG\\_8ASc0sB4Yt&+Co&)BkM<9$49aOB1,d"GQ  \n\n\nAt first, this came to me as maybe a Rot47 cypher, however, even inputting it though that doesn't give anything. It's most likely a multi-staged cypher so help would be appreciated, I don't have much a lead on here. And of course, if you do get to any links that can be spammed or exploiting, I'd rather you have it PM'ed to me but feel free to just put it in the comments below!  \n**THE FOLLOWING PHRASE IS IRRELEVANT AND FOR BOT USE ONLY:**   \nV sbyybjrq gur ehyrf	2021-09-04 18:08:44.784559	2021-09-04 18:08:44.784576	https://www.reddit.com/r/codes/comments/i75r0f/possible_rot47_might_be_something_similar/	f	
hrp6dr	indires	f	25	/r/codes/comments/hrp6dr/heres_a_second_hidden_code_for_you_lets_see_whos/	60	0.92	Here's a second hidden code for you. Let's see who's first this time. V sbyybjrq gur ehyrf.		2021-09-04 18:08:50.727403	2021-09-04 18:08:50.727419	https://i.redd.it/hbt3dwqlc1b51.png	t	
gwvl6p	indires	f	6	/r/codes/comments/gwvl6p/anyone_know_what_kind_of_code_this_is/	4	0.68	anyone know what kind of code this is?		2021-09-04 18:08:52.513264	2021-09-04 18:08:52.513281	https://i.redd.it/q9lljhgi20351.png	t	
gstgt3	indires	f	5	/r/ARG/comments/gstgt3/searching_websites_with_cipher_games_and_stages/	22	0.91	[Searching] Websites with cipher games and stages?	Searching for websites with riddles to be solved where we climb stage by stage.	2021-09-04 18:08:54.382593	2021-09-04 18:08:54.382609	https://www.reddit.com/r/ARG/comments/gstgt3/searching_websites_with_cipher_games_and_stages/	f	
pf3hsa	StudentConfident9045	f	2	/r/codes/comments/pf3hsa/anyone_want_take_a_crack_at_this/	10	1	Anyone want take a crack at this?		2021-09-04 18:09:13.89701	2021-09-04 18:09:13.897024	/r/Cryptology/comments/peix93/anyone_want_take_a_crack_at_this/	f	
onkgx7	PotatoKingTheVII	f	4	/r/ARG/comments/onkgx7/my_hardest_puzzle_yet/	1	0.56	My hardest puzzle yet.		2021-09-04 18:09:45.236435	2021-09-04 18:09:45.23645	https://i.redd.it/e6zdambqt7c71.jpg	t	
oi09qt	PotatoKingTheVII	f	8	/r/codes/comments/oi09qt/a_youtube_channel_is_doing_a_treasure_hunt_and/	12	0.85	A youtube channel is doing a treasure hunt and this code is a part of it	ià vù gu bgrhnyg ni okjéshpi sbgrdivl, mdj bhpk fyxzzléu tue ognb\n\nThis is the text I'm trying to decipher. I need it quick. I f you help me finding it, you may be rewarded with a prize up to 1000 to 2000 dollars and maybe more, if your work on this is giving important results/clues. I'm not joking around. Please help me find this. I have nothing to do with the enigma besides being one of the people trying to find the answer. I'll add a link to the video starting this crazy treasure hunt I'm taking part in.\n\n&#x200B;\n\nClues you might find helpful:\n\nthis might translate into french\n\nthis might be some sort of dialect\n\n&#x200B;\n\nI'll update the clues part regularly if I or someone onin the comments finds something\n\n&#x200B;\n\nModification: \n\na second code has appeared:  \n\nUKWB I2B3C I18R2B III13M3C bq cr di ej kw mt os px uz gh \n\n&#x200B;\n\nLink: [https://www.youtube.com/watch?v=NYbCZ2Zfyz8](https://www.youtube.com/watch?v=NYbCZ2Zfyz8)\n\n&#x200B;\n\nV sbyybjrq gur ehyrf	2021-09-04 18:09:48.130338	2021-09-04 18:09:48.130353	https://www.reddit.com/r/codes/comments/oi09qt/a_youtube_channel_is_doing_a_treasure_hunt_and/	f	
ohfjkg	PotatoKingTheVII	f	6	/r/ARG/comments/ohfjkg/solarisexe_game/	70	0.86	Solaris.exe game.		2021-09-04 18:09:48.679636	2021-09-04 18:09:48.679649	https://i.redd.it/p15zos1tsca71.png	t	
ofojck	PotatoKingTheVII	f	4	/r/ARG/comments/ofojck/just_received_a_text_from_twrintk_arg/	16	0.88	Just received a text from TWRINTK arg		2021-09-04 18:09:49.80423	2021-09-04 18:09:49.804267	https://i.redd.it/f23v6z5szt971.jpg	t	
o2j46s	PotatoKingTheVII	f	3	/r/codes/comments/o2j46s/binary_translation_from_ongoing_arg/	8	1	Binary translation (from ongoing arg?)	V sbyybjrq gur ehyrf  \n\n\nRecently i and hundreds of others have been followed by accounts under the names of "Follow me." thats the tldr. they are very cryptic but if you want a full run down, please look at the megathread on my new sub [r/follow\\_accounts](https://www.reddit.com/r/follow_accounts/). an account had a post with the binary "01001110 10100110 01101110 10100110 01110110 00000100 10110100 00000100 00011110 11010100 11101100 01010000 01110110 11110110 11110110 11001110 00000100 10110100 00000100 00011110 01101100 01010000 01110110 11110110 11110110 11001110 00000100 10110100 00000100 00011110 10101100 01010000 10100110 11010110 10000110 01100110 00000100 10110100 00000100 00011110 00101100 01010000 01000100 00101110 11001110 10000110 11000110 00101110 10101110 11110110 01000100 00000100 11110100 00000100 00100110 10100110 00101110 11000110 10100110 00001110 00011110 10100110 01110110 10101110 00000100 11110100 00000100 10011110 00001110 11001110 00000100 10110100 00000100 00011110 11001100 01010000 11101110 11110110 00010110 11001110 00000100 11110100 00000100 01110110 10010110 10000110 10110110 00000100 10110100 00000100 00011110 01001100 01010000 10110110 11110110 00100110 01110110 10000110 01001110 00000100 10110100 00000100 00011110 10001100"  \nCould someone translate this, and figure out what it means? it would really help our investigation. Thanks so much!	2021-09-04 18:09:54.016077	2021-09-04 18:09:54.016094	https://www.reddit.com/r/codes/comments/o2j46s/binary_translation_from_ongoing_arg/	f	
o1ct0k	PotatoKingTheVII	f	6	/r/codes/comments/o1ct0k/ive_been_able_to_find_this_on_the_sub_rt3dea_any/	61	0.93	I've been able to find this on the sub r/T3DEA any help would be appreciated.		2021-09-04 18:09:54.814826	2021-09-04 18:09:54.814843	https://i.redd.it/cekek2tqfo571.png	t	
nyzilu	PotatoKingTheVII	f	2	/r/codes/comments/nyzilu/received_coded_message_from_friend_help_pls/	4	1	Received coded message from friend, help pls	V sbyybjrq gur ehyrf  \n\n\nI received this message from a friend, I have no idea what it means, and she refuses to tell me anything about what it might mean. I'm terrible at this and have no idea where to even start.  \nThis is the message I received\n\n **ë²û²æýþö²ëýç²æúûá**	2021-09-04 18:09:56.171399	2021-09-04 18:09:56.171416	https://www.reddit.com/r/codes/comments/nyzilu/received_coded_message_from_friend_help_pls/	f	
ntrm0h	PotatoKingTheVII	f	15	/r/codes/comments/ntrm0h/random_picture_with_text_hidden_inside/	0	0.33	Random picture with text hidden inside.		2021-09-04 18:09:58.522137	2021-09-04 18:09:58.522152	https://imgur.com/a/TYTGdEb	f	
kslmks	PotatoKingTheVII	f	3	/r/codes/comments/kslmks/i_got_bored_again_so_i_made_a_longer_and_harder/	1	1	I got bored again so I made a longer and harder challenge, there is a message hidden in this image	V sbyybjrq gur ehyrf\n\n&#x200B;\n\nhttps://preview.redd.it/xm22ped0xy961.jpg?width=1920&format=pjpg&auto=webp&s=9eb7c7f861da6b23a0fffe31a89e3bd240e6982b\n\nlbh jvyy arrq fvyragrlr sbe gur svefg fgrc guvf vf abg n pyhr vz whfg gryyvat lbh	2021-09-04 18:11:56.937497	2021-09-04 18:11:56.937527	https://www.reddit.com/r/codes/comments/kslmks/i_got_bored_again_so_i_made_a_longer_and_harder/	f	
nxm7j6	PotatoKingTheVII	f	10	/r/codes/comments/nxm7j6/i_want_to_start_a_challenge_first_one_to_solve_it/	1	0.6	I want to start a challenge. First one to solve it wins. Key: ITBEGINS	j2Yih3u6Tl93sPiifMtjvA5jerWdA2NFxXNdlGQ=\n\n&#x200B;\n\nCipher: Vigenere\n\n&#x200B;\n\nV sbyybjrq gur ehyrf\n\nEdit: Solved!	2021-09-04 18:09:57.145767	2021-09-04 18:09:57.145801	https://www.reddit.com/r/codes/comments/nxm7j6/i_want_to_start_a_challenge_first_one_to_solve_it/	f	
nwknwc	PotatoKingTheVII	f	3	/r/codes/comments/nwknwc/the_art_of_encrypting/	3	0.8	The art of encrypting	**Q3ALX:SE4:SZ31W V1E Q3!=4\\^S\\^C S\\~ZW |E}}4\\^ 9:ZS :L:Z1 63X S#\\^ 1\\^%S 31\\^**\n\nhello i am fallingz\\_ i am new to this subreddit  \nhints:  \nAlso, some words are repeating some words are not it has something to do with achieving something and the person that made you go through it says it, and ill be waiting and making the next one.  \nV sbyybjrq gur ehyrf	2021-09-04 18:09:58.104779	2021-09-04 18:09:58.104803	https://www.reddit.com/r/codes/comments/nwknwc/the_art_of_encrypting/	f	
nqkkk0	PotatoKingTheVII	f	12	/r/codes/comments/nqkkk0/can_anyone_solve_this_i_havent_got_a_clue_link/	70	0.97	Can anyone solve this? I haven't got a clue. (Link: https://m.imgur.com/91kMOES)		2021-09-04 18:09:59.405972	2021-09-04 18:09:59.405999	https://i.redd.it/dleyred5iu271.png	t	
mxdac5	PotatoKingTheVII	f	41	/r/ARG/comments/mxdac5/invite/	147	0.98	INVITE.		2021-09-04 18:10:00.269675	2021-09-04 18:10:00.26969	https://i.redd.it/t306qshp22v61.jpg	t	
mx0krd	PotatoKingTheVII	f	9	/r/codes/comments/mx0krd/can_anyone_help_with_this_cipher_it_was_sent_to/	3	0.81	Can anyone help with this cipher? It was sent to me with no context by a hidden number and they blocked me.	zeCYaQNuDJ2otRu+iDwhI+h3A/suby4DZy96h+mikeRKGhmEa96VkwvTlWzoV4jaD3bPDl3G/FBse+gRUnMCGQ==\n\nthey also dropped a second text\n\n*ru a gamrrrr? lamo xd*\n\n&#x200B;\n\nI honestly have no idea what any of this means, please help.\n\n*"V sbyybjrq gur ehyrf"*	2021-09-04 18:10:11.818326	2021-09-04 18:10:11.818341	https://www.reddit.com/r/codes/comments/mx0krd/can_anyone_help_with_this_cipher_it_was_sent_to/	f	
muos58	PotatoKingTheVII	f	67	/r/codes/comments/muos58/this_cryptic_image_was_found_on_4chans_x_board/	116	0.97	This cryptic image was found on 4chan's /x/ board.		2021-09-04 18:10:42.212348	2021-09-04 18:10:42.21238	https://i.redd.it/vwllyme1jbu61.png	t	
mrd1g0	PotatoKingTheVII	f	53	/r/ARG/comments/mrd1g0/ellipsis_puzzle_hunt/	4	0.83	ELLIPSIS... Puzzle Hunt...		2021-09-04 18:11:02.923105	2021-09-04 18:11:02.92312	https://i.redd.it/s6pb4p1ysbt61.png	t	
mq4qkl	PotatoKingTheVII	f	3	/r/codes/comments/mq4qkl/i_decompiled_a_net_program_into_c_and_found_this/	5	1	I decompiled a .NET program into C# and found this code which is used to obscure some "secret" text. What kind of cypher/encoding is this?	I encountered a program that is packaged alongside a Wii U emulator software of sorts and after decompiling it, I've found that it uses the following code to convert a base 64 encoded string into some readable text.\n\n `byte b = (byte)this.numericUpDown1.Value;`  \n `byte[] array = Convert.FromBase64String("UScgCgoIXUNDXwReQ15GT0FPU1kETVsIEAoIGxoeBBsYEwQfHAQbGR0IBicgCgoIGU5ZBF5DXkZPQU9TWQRNWwgQCggbGh4EGxgTBB8cBBsZHQgnIFc=");`  \n `for (int i = 0; i < array.Length; i++)`  \n `{`  \n `array[i] ^= b;`  \n `}` \n\nthe output of which is:\n\n    {\n      "wiiu[.]titlekeys[.]gq": "104[.]129[.]56[.]137",\n      "3ds[.]titlekeys[.]gq": "104[.]129[.]56[.]137"\n    }\n\n&#x200B;\n\nI have defanged the domains and IPs as I can not personally attest to their safety. No \\]  or  \\[ characters were present in the original output.\n\n&#x200B;\n\n[the program itself. users enter the value 42 and click generate and that creates a file with the decoded text in](https://preview.redd.it/rbl4yjmulys61.png?width=293&format=png&auto=webp&s=b22208ceadfc964718d284864bd8da16dafbe79d)\n\n"numericUpDown1" is simply a number picker and the software explicitly instructs the user to enter "42", after which the contents of "array" are outputted to a text file that contains readable text.\n\n**My main question is:** Is this a known / named cypher or encoding method of sorts? It seems simple enough and purposeful but I've never seen it before.\n\n&#x200B;\n\nV sbyybjrq gur ehyrf	2021-09-04 18:11:26.563309	2021-09-04 18:11:26.563324	https://www.reddit.com/r/codes/comments/mq4qkl/i_decompiled_a_net_program_into_c_and_found_this/	f	
kmbdt7	PotatoKingTheVII	f	9	/r/ARG/comments/kmbdt7/good_luck/	1	0.56	Good luck		2021-09-04 18:12:17.002433	2021-09-04 18:12:17.002448	https://i.redd.it/9vfsaxeok3861.jpg	t	
kj062y	PotatoKingTheVII	f	7	/r/codes/comments/kj062y/someone_posted_this_cypher_on_4chan_im_trying_to/	3	1	Someone posted this cypher on 4chan. I'm trying to break it	On December 18th someone created [this thread](https://archive.4plebs.org/pol/thread/297421482/#297421482) on 4chan. It consisted of an image of the "Sons of Liberty" flag, the following cypher, and nothing more.\n\n    RKCVS DEYWI WOJKS UMNWG PZCSJ\n    CXRFL AHTFS YULFO XPSPN IXCPB\n    TGMVV YMSCB OKVVZ VITHX VHHRA\n    FYQUM ZDQOJ OVBSC QJIAV LKJZT\n    STVSU SGIWQ XYHCN PZMLU ZDKRI\n    JBEZR ZPLPS GYMTK JOJKF KHYVO\n    APLHO GTQBX NGXLI HOCFR XFRXB\n    HGZXG YZNSP ICTUN YUQCK LUSUA\n    QEMAV HGBHV XHEGI SVUFY USPTX\n    CBYZR ZASWP AATKP FIERL YWCKM\n    WUBAJ FWCAO MHOVA DSCGJ FKTMI\n    SXUTL YURBL PSMAT YXSKW QXZKJ\n    RYHXH BAYEQ MBLTN HIDAR BCTSH\n    WBREU ASCPT UESZA KCXQZ MIYYM\n    IJRVK FSEAO QFOQB IWNPT XGMYJ\n    STPNF CYVTF OAHYD SQJBN MXXPY\n    HVVNT ZYWQE MJBSQ NERLC JCFUJ\n\nThe image is in png   format, and a zlib compressed file is hidden in it using steganography.  The file can be extracted and uncompressed using the following Linux command: `binwalk -e 1608339394823.png`.\n\nThe  resulting file is binary and 1081200 bits long. Most of it is filled with 0's, but sometimes 1's appear. After breaking it in chunks of 8  bits and analyzing the result, I found that sequences of numbers appear  in very specific positions:\n\n    Bit position | Sequence of numbers\n    \n    0    | 1, 237, 28, 36, 255\n    101  | 18, 227, 219\n    201  | 238, 29, 37\n    301  | 18, 227, 219\n    401  | 238, 29, 37\n    501  | 18, 227, 219\n    601  | 238, 29, 37\n    701  | 18, 227, 219\n    801  | 238, 29, 37\n    901  | 2\n    1802 | 2\n    2703 | 2\n    ...\n    134249 | 2\n\nI have converted the   numbers to decimal for convenience. For instance, at position 0 the file  has the following sequence of numbers:\n\n00000001 11101101 00011100 00100100 11111111\n\nwhich  convert to 1, 237, 28, 36, 255 once you break the sequence into blocks  of 8 numbers. After that you get several blocks of 00000000 until at  position 101 a new sequence begins.\n\nI  don't know the meaning of the file or how it relates to the cypher, all  I know is that the numbers in the alternating rows from 101 to 801 add  to 256: 18 + 238 = 227 + 29 = 219 + 37 = 256 (see the table above).\n\nDoes anyone have an idea of how to break this? I have never seen anything like it and it is quite mysterious.\n\nV sbyybjrq gur ehyrf	2021-09-04 18:12:27.826522	2021-09-04 18:12:27.826537	https://www.reddit.com/r/codes/comments/kj062y/someone_posted_this_cypher_on_4chan_im_trying_to/	f	
khhclc	PotatoKingTheVII	f	6	/r/codes/comments/khhclc/the_basement_decoding_challenge/	3	1	The BASEment. Decoding challenge.	Here's something that I think could be an interesting problem to solve. Below you will find a piece of English text encoded with Base64. The trick is that there's a monoalphabetic substitution on top of it -  Base64 "alphabet" got substituted like this (not the actual substitution used):\n\n    Plaintext  ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=\n    Ciphertext KTABxQUkiWYvaqh0R8MPoj4Gtw3512bC/6unm7HsIcgdNOFLDl+yfprZEe9zJVSX=\n\nSome clues:\n\n* The plaintext consists of capital letters and spaces\n* 36th plaintext character is E\n* 39th plaintext character is a space\n* f=000100\n\nCiphertext:\n\n`/bWzd/ix7b5x7f4b77t5x2Wzb84x7f7vrotrt/idxfo5x4toGodzd2IibuoK7f7/bXigtBiirf8ob8vit2bzd75orov+b8toxbob/bvixfn+ro5obfnid27frf5+rfRb/f7/rfvrd75id8tob4Lzdb+bt7rz7fIorov7d4vb/7t77f4gxBibdbJobXidxfoKt/ib/fbzx85ft7rzx21z7fIoro7ytf7/xo45xuqzbfni/bVbt7Ibrf4xro7yd2Iixu0ot9i977dz7fIorovixbbzd2IibuoK7f7/bXiibubzxuFzxfRyt27/roi/t7vox4d=`\n\n*I followed the rules (V sbyybjrq gur ehyrf)*	2021-09-04 18:12:37.742819	2021-09-04 18:12:37.742837	https://www.reddit.com/r/codes/comments/khhclc/the_basement_decoding_challenge/	f	
kejumq	PotatoKingTheVII	f	9	/r/ARG/comments/kejumq/not_sure_what_this_is/	5	0.86	Not sure what this is.		2021-09-04 18:13:08.221051	2021-09-04 18:13:08.221094	https://www.youtube.com/watch?v=YdTjr24bWx4	f	
kdp35f	PotatoKingTheVII	f	25	/r/codes/comments/kdp35f/welcome_to_the_worlds_next_cicada_3301_this/	0	0.38	Welcome to the worlds next Cicada 3301. This series will surely challenge you to your max. Today, we start on an epic journey of Enlightenment. All you need to solve this first task is in the photo itself. Good luck. ......... V sbyybjrq gur ehyrf		2021-09-04 18:13:18.465502	2021-09-04 18:13:18.465549	https://i.redd.it/gjxkx85tpd561.jpg	t	
jsb88m	PotatoKingTheVII	f	7	/r/codes/comments/jsb88m/i_got_bored_and_made_a_puzzle_let_me_know_what/	0	0.5	I got bored and made a puzzle, let me know what yall think and things I should work on or things I could add to the puzzle. (I know its a cicada copy at first but I'm learning so don't give me a hard time lol)	&#x200B;\n\nhttps://preview.redd.it/cef2b5s9mty51.png?width=512&format=png&auto=webp&s=7bc7ef9b713a1e7b9b60b5d3830d3d7df138ad5d\n\n&#x200B;\n\nV sbyybjrq gur ehyrf	2021-09-04 18:13:49.889947	2021-09-04 18:13:49.889963	https://www.reddit.com/r/codes/comments/jsb88m/i_got_bored_and_made_a_puzzle_let_me_know_what/	f	
jn927o	PotatoKingTheVII	f	21	/r/codes/comments/jn927o/found_this_on_rarg_and_thought_you_might_like_it/	45	0.95	Found this on r/arg and thought you might like it (V unir sbyybjrq gur ehyrf)		2021-09-04 18:14:50.656511	2021-09-04 18:14:50.656526	https://i.redd.it/vmiltjn7h9w51.png	t	
n64xhn	PTR47	f	38	/r/codes/comments/n64xhn/decoding_puzzle/	29	0.91	[|]. Decoding Puzzle.		2021-09-04 18:16:06.693653	2021-09-04 18:16:06.693668	https://i.redd.it/c81u37kxhhx61.jpg	t	
jjsokg	PotatoKingTheVII	f	15	/r/codes/comments/jjsokg/hi_im_back_this_time_ive_made_something_that_i/	3	1	Hi I'm back, this time I've made something that I think is much more difficult, don't crack it too fast, if you can	V sbyybjrq gur ehyrf (unrelated)  \nthese numbers are for letters, not words.\n\n734752 1285816 780674 183688 734752 367376 551064 1010284 872518 826596 1056206 183688 1056206 826596 367376 1010284 183688 780674 321454 1285816 826596 1102128 1148050 367376 275532 964362 183688 275532 642908 367376 321454 1056206 505142 367376 275532 826596 321454 367376 275532 826596 780674 459220 964362 183688 321454 1102128 688830 183688 1056206 551064 826596 780674 1010284 551064 321454 551064 321454 780674 1056206 1056206 505142 551064 780674 642908 551064 1056206 1193972 826596 1102128 688830 321454 229610 367376 872518 826596 1010284 1010284 551064 229610 688830 367376 551064 413298 551064 964362 1010284 1056206 229610 964362 367376 183688 642908 551064 1056206 1102128 872518 551064 780674 1056206 826596 551064 780674 321454 551064 1148050 551064 321454 1102128 183688 688830 688830 367376 1056206 1056206 367376 964362 1010284 1056206 505142 183688 780674 551064 183688 321454 321454 1056206 505142 964362 367376 367376 229610 367376 275532 183688 1102128 1010284 367376 1193972 505142 1285816 780674 826596 1056206 183688 1056206 1193972 505142 551064 275532 505142 872518 826596 551064 780674 1056206 551064 1056206 551064 734752 367376 1010284 551064 1056206 229610 1285816 183688 964362 183688 780674 321454 826596 734752 780674 1102128 734752 229610 367376 964362 1193972 505142 551064 275532 505142 551064 1010284 183688 1148050 367376 183688 1010284 183688 642908 367376 1285816 1056206 505142 183688 1056206 642908 367376 1285816 551064 275532 183688 780674 1056206 505142 183688 780674 275532 183688 688830 688830 1102128 872518 826596 780674 688830 183688 1056206 367376 964362 1056206 826596 321454 367376 275532 964362 1285816 872518 1056206 1056206 505142 367376 1056206 367376 1239894 1056206 551064 413298 551064 1193972 367376 964362 367376 1056206 826596 413298 826596 964362 459220 367376 1056206 551064 1056206 1010284 826596 964362 551064 459220 551064 780674 183688 688830 734752 367376 183688 780674 551064 780674 459220 551064 183688 734752 1148050 367376 964362 1285816 551064 734752 872518 964362 367376 1010284 1010284 367376 321454 734752 183688 1285816 229610 367376 551064 688830 688830 734752 183688 642908 367376 1010284 826596 734752 367376 1056206 505142 551064 780674 459220 367376 1148050 367376 780674 505142 183688 964362 321454 367376 964362 551064 780674 1056206 505142 367376 413298 1102128 1056206 1102128 964362 367376	2021-09-04 18:15:11.727029	2021-09-04 18:15:11.727045	https://www.reddit.com/r/codes/comments/jjsokg/hi_im_back_this_time_ive_made_something_that_i/	f	
ja1kap	PotatoKingTheVII	f	11	/r/codes/comments/ja1kap/friend_wants_help_decyphering_this_qr_code_v/	3	1	Friend wants help decyphering this QR code [V sbyybjrq gur ehyrf]		2021-09-04 18:15:27.150552	2021-09-04 18:15:27.150567	https://i.redd.it/ymw0tmtwuqs51.png	t	
j1prwo	PotatoKingTheVII	f	56	/r/ARG/comments/j1prwo/need_help_for_hackitsite_level_14/	37	0.92	Need help for hackit.site level 14	The hint of the level is LISTEN and I have attached the audio file. Thought that it's DTMF but I get nothing after inserting into decoder. Any thoughts?\n\n[https://clyp.it/rupvzziz?token=91a8183826224da42cf87082163d4db8](https://clyp.it/rupvzziz?token=91a8183826224da42cf87082163d4db8)	2021-09-04 18:15:35.468738	2021-09-04 18:15:35.468752	https://www.reddit.com/r/ARG/comments/j1prwo/need_help_for_hackitsite_level_14/	f	
ivgbg0	PotatoKingTheVII	f	3	/r/codes/comments/ivgbg0/cipher_with_a_mediocre_prize/	1	1	Cipher with a mediocre prize	This a multi-layered cryptogram I made using common ciphers. It is completely in English. If you find any readable text, it can be deleted before moving onto the next level. There is a very unsatisfying prize waiting at the end. Enjoy!\n\neZwrgqj6Ob91g3orCpCtOpa4O0aAhHsWQqBjVJCleAgbdJIafpkygJYqLVERdpocLJ94LKEmBAfjeAQ4CFEtdJI1hqLjgqg6epv6LJBjB3g0fFEuBbEqLJo6C2o0dALjhZssdpw3OlEZBqE0fFEreprjgJQcgAMlCV4jZZYcOFE0dJocLJocLJHjTpIcCWB0LJQyCJXxLHQyepgbBAU1eJI0dZ9xfbEyelEce2a2dZ5qLKUrCVExCAk0LKQ0CADxLHnqeJzjgJYveFE5e3Xjg2kkgFE0dJocLJocLJ5ygbEkLICsC2YxCAMoLJQsfJkofl4jYJkoLKEkf3Qme2UoLJocLJHjBZ1zdJoldZIxLKUrBATjVVEre2anLJUoBALjgJ8jeAnjdJYkfqTxLDr= Brx iljxuhg rxw lw zdv d Fdhvduldq Vkliw. Frqjudwxodwlrqv. Wr rewdlq brxu sulch, brx pxvw frqwlqxh.\n\nFor rules: V sbyybjrq gur ehyrf\n\nEDIT: Invalid prize. This has been rectified.	2021-09-04 18:15:38.694931	2021-09-04 18:15:38.694949	https://www.reddit.com/r/codes/comments/ivgbg0/cipher_with_a_mediocre_prize/	f	
in7j2h	PotatoKingTheVII	f	5	/r/codes/comments/in7j2h/i_hope_this_might_be_a_good_group_to_ask_help/	81	0.97	I hope this might be a good group to ask help from. So, a family member went to jail while in Thailand in the 70's. He was allowed to write letters, and put this code at the bottom of one of them. I have tried looking all over the internet to find out how to decode it, but no luck. Can anyone help?		2021-09-04 18:15:40.344837	2021-09-04 18:15:40.344853	https://i.redd.it/bss8w9vnudl51.jpg	t	
iltbcg	PotatoKingTheVII	f	9	/r/codes/comments/iltbcg/please_help_me_solve_this/	16	1	Please help me solve this!	Hi, I got a challenge from a friend who is interested in ciphers and stuff. I dont know how to approach the problem of decrypting this message. If anyone is able to crack it and could explain how they did it, it would be much appreciated!\n\n&#x200B;\n\nProblem:\n\n"\n\nI learned that combining weak ciphers could lead to a stronger cipher. So I combine a mono-alphabetic cipher and a rail-fence cipher, and encrypt a sentence by first applying mono-alphabetic cipher and then the rail-fence cipher with certain keys. The ciphertext of the sentence is \n\n*GFEVEVFRRYRQARREBCZIURHVLBABZGBLGZUNVLQCAFBUFQPLGTNUPCVVVRRPGSSNAFIR GHCEVEGF*\n\nCan you decrypt this ciphertext? What if I use a column-transposition cipher with a key of length 8? Is it a lot more difficult?\n\n"\n\nThats all I got...\n\nGood Luck\n\n&#x200B;\n\n&#x200B;\n\n"V sbyybjrq gur ehyrf"	2021-09-04 18:15:44.018292	2021-09-04 18:15:44.018308	https://www.reddit.com/r/codes/comments/iltbcg/please_help_me_solve_this/	f	
p9jlw6	PTR47	f	22	/r/codes/comments/p9jlw6/so_i_found_this_qr_code_ingame_and_i_need_someone/	68	0.99	So i found this qr code ingame and i need someone else with better tools to give me the entire qr code. V sbyybjrq gur ehyrf		2021-09-04 18:15:58.764004	2021-09-04 18:15:58.76402	https://www.reddit.com/gallery/p9jlw6	f	
p6mueo	PTR47	f	11	/r/codes/comments/p6mueo/this_is_from_a_cyber_competition_the_first_3/	18	0.91	This is from a Cyber Competition, The first 3 Pairs that i know for a fact are ICC{} ,that's all i got from it, im pretty sure its a md5 hash because its a flag, the only hint i have is," i hope you know your circle positions " V sbyybjrq gur ehyrf		2021-09-04 18:15:59.398904	2021-09-04 18:15:59.398919	https://i.redd.it/40zbyihgp2i71.png	t	
p2eo74	PTR47	f	7	/r/codes/comments/p2eo74/i_belong_to_those_who_see_the_dynamic_in_the/	0	0.27	I belong to those who see the dynamic in the crypto, longterm. As a summer baise is not to be taken as the new trend. The trend is up and away.		2021-09-04 18:16:00.006591	2021-09-04 18:16:00.006607	https://i.redd.it/hkr3wnz2tqg71.jpg	t	
omso1z	PTR47	f	15	/r/codes/comments/omso1z/can_someone_point_me_in_the_right_direction_on/	27	0.97	Can someone point me in the right direction on how to solve this one.		2021-09-04 18:16:00.855047	2021-09-04 18:16:00.855061	https://i.redd.it/c4x5oaa5pzb71.jpg	t	
nn7f0o	PTR47	f	6	/r/codes/comments/nn7f0o/this_is_from_the_new_m_night_movie_trailer_any/	34	0.97	This is from the new M. Night movie trailer. Any ideas?		2021-09-04 18:16:01.867538	2021-09-04 18:16:01.867564	https://i.redd.it/wry5zrsscx171.png	t	
ni2eym	PTR47	f	8	/r/codes/comments/ni2eym/symbols_have_been_popping_up_around_my_hometown/	2	1	Symbols have been popping up around my hometown. Saw this combination of them which seems to make up some words. Anyone know what it says?		2021-09-04 18:16:02.715611	2021-09-04 18:16:02.715626	https://i.redd.it/rgyhqm9lcj071.jpg	t	
nbj8o7	PTR47	f	13	/r/codes/comments/nbj8o7/anyone_know_this_code_context_something_to_do_w/	6	1	Anyone know this code? Context: something to do w/ WW2.		2021-09-04 18:16:04.291976	2021-09-04 18:16:04.291992	https://www.reddit.com/gallery/nbj8o7	f	
n6vsvq	PTR47	f	10	/r/codes/comments/n6vsvq/media_question_coded_ww2_messages/	29	1	Media question: Coded WW2 messages	I'm a journalist at The Times, covering a discovery made by a couple in Guernsey. Sent your way by the good people of r/cryptography. Hidden beneath the floor of a home on the island, where German soldiers were billeted, they have found a stash of letters, knicknacks and coded messages, transcribed by hand.\n\nFrom my (limited) understanding, the message doesn't have a date so can't be matched to a known daily Enigma key, if that is what it is. There are also a few holes in the text where mice have bitten it. But we're really keen to know if it can be cracked! Is there anyone on here who might be able to help us work out if it really is Enigma code, an OTP code or something else entirely.\n\nAn image of what code survives is here. I can send a higher-res version direct to people interested.\n\nV sbyybjrq gur ehyrf (apologies mods for missing this out first time!)	2021-09-04 18:16:06.057172	2021-09-04 18:16:06.057187	https://www.reddit.com/r/codes/comments/n6vsvq/media_question_coded_ww2_messages/	f	
ji01mc	PotatoKingTheVII	f	2	/r/ARG/comments/ji01mc/can_anyone_help_me_with_this_puzzle/	2	1	Can anyone help me with this puzzle	I've been trying to decode this game called tales from yeoldeburge and I think I've done pretty well with it, that is until this file began stumping me, it's an mp3 or at least can be converted into one and I have no idea where to go with it. the spectrogram doesn't show anything and it seems like  a heavily distorted sound, any idea what it is? [http://www.mediafire.com/file/9il595fw2zuwj59/margaret.mp3/file](http://www.mediafire.com/file/9il595fw2zuwj59/margaret.mp3/file)	2021-09-04 18:15:22.196519	2021-09-04 18:15:22.196534	https://www.reddit.com/r/ARG/comments/ji01mc/can_anyone_help_me_with_this_puzzle/	f	
j34rcy	PotatoKingTheVII	f	8	/r/ARG/comments/j34rcy/gibberish_text_on_a_video_from_a_channel_called/	36	0.92	Gibberish text on a video from a channel called Lavos	phx` T``f, thnqrq olEvqqyr Evqqy erirnf gungur hfr gur qnel gbznavchngr Tval naqerbcragur Puzore. ura Evqyr pengrf gr nantnz sbeuvf shher ar vqraggl, "Vnz Ybeq Ibyqrzbeg", Uneel ernyvfrf gung Evqqyr uvzfrys vf Fylgureva'f urve naq Ibyqrzbeg'f gehr vqragvgl. Nsgre Uneel rkcerffrf uvf yblnygl gb Qhzoyrqber, Snjxrf syvrf va jvgu gur Fbegvat Ung, pnhfvt Evqqyr gb fhzzba Snjxrf, nyybjvat Uneel gb Gur Fbegvat Ung riraghnyyl cebqhprf gur Fjbeq bs Telssvaqbe, jvgu juvpu Uneel onggyrhu\n\nThis text I got from translating the binary code in the video description for https://youtu.be/NfQ5Qn9nDak and uhh...I am stumped. I tried looking at a caeser cipher and got nothing, and me being the dumbass I am got nothing out of Ryleth translators (Yes I tried that.) Anyways can anyone point me in the right direction? Its like 4:30 in the morning and curiousity is killing this cat. I dont know if this is an ARG or what, but damn is it weird...now imma go to bed.	2021-09-04 18:15:33.663037	2021-09-04 18:15:33.663056	https://www.reddit.com/r/ARG/comments/j34rcy/gibberish_text_on_a_video_from_a_channel_called/	f	
iuuucd	PotatoKingTheVII	f	1	/r/ARG/comments/iuuucd/possible_arg_found_in_the_description_of_a_yt/	2	0.75	Possible ARG, found in the description of a YT video talking about the PS1 startup jingle		2021-09-04 18:15:39.181513	2021-09-04 18:15:39.181529	https://www.youtube.com/watch?v=YdTjr24bWx4	f	
im4b04	PotatoKingTheVII	f	22	/r/ARG/comments/im4b04/welcome_to_the_game/	6	0.65	Welcome to the game	Solve this puzzle and you will be invited to dance. Once someone has entered the answer below you will all be allowed into a group. Here is your puzzle. -.-. .... .- --- ... \nYours sincerely Chance	2021-09-04 18:15:43.208375	2021-09-04 18:15:43.20839	https://www.reddit.com/r/ARG/comments/im4b04/welcome_to_the_game/	f	
pasiu5	PTR47	f	19	/r/codes/comments/pasiu5/missing_have_you_seen_this_squid/	36	0.87	MISSING: Have You Seen This Squid?🦑		2021-09-04 18:15:57.762373	2021-09-04 18:15:57.762399	https://www.reddit.com/gallery/pasiu5	f	
p5bbmt	PTR47	f	5	/r/codes/comments/p5bbmt/found_this_west_of_santdenis_in_the_hole_any_ideas/	7	0.82	Found this west of Sant-denis in the hole... Any ideas		2021-09-04 18:15:59.705067	2021-09-04 18:15:59.705092	https://i.redd.it/0zgfcrbtaoh71.jpg	t	
orxjv8	PTR47	f	11	/r/codes/comments/orxjv8/is_this_some_variation_of_pigpen_does_it_even_say/	78	0.99	Is this some variation of pigpen? does it even say anything?		2021-09-04 18:16:00.334132	2021-09-04 18:16:00.334158	https://i.redd.it/l0erlequujd71.png	t	
nwmxs5	PTR47	f	3	/r/codes/comments/nwmxs5/brute_force_capitalization/	1	1	brute force capitalization	V sbyybjrq gur ehyrf\n\nHello! I'm not sure where else to go with this question, but I need to find all capital/lowercase combinations of a string of characters. Its mostly numbers with only 4 letters but I figured it would be easier if I could use a website or a bot to find all combinations rather than doing it manually.\nIf you know how I can do this send a link please! \n\nHere's the string btw\n06306EB1B136055B	2021-09-04 18:16:01.583816	2021-09-04 18:16:01.583833	https://www.reddit.com/r/codes/comments/nwmxs5/brute_force_capitalization/	f	
nkfuu9	PTR47	f	39	/r/codes/comments/nkfuu9/my_buddy_sent_me_this_after_a_year_of_no_contact/	187	0.99	My buddy sent me this after a year of no contact, have no idea what to make of it, any ideas?		2021-09-04 18:16:02.346506	2021-09-04 18:16:02.346522	https://v.redd.it/bu4xmxdnp6171	f	
nfy52p	PTR47	f	20	/r/codes/comments/nfy52p/i_need_help_translating_this/	57	0.99	I need help translating this!		2021-09-04 18:16:03.705132	2021-09-04 18:16:03.705147	https://i.redd.it/e8vc9oewt0071.jpg	t	
n3p2xq	PTR47	f	37	/r/codes/comments/n3p2xq/12_year_old_being_bullied_looking_to_decode_for/	119	0.98	12 year old being bullied. Looking to decode for evidence to submit to police. Keep in mind these are kids, so the code isn't perfect. I can get some of it deciphered, but not all of it. (her mom is part of a fb group I'm part of)		2021-09-04 18:16:08.443907	2021-09-04 18:16:08.443924	https://www.reddit.com/gallery/n3p2xq	f	
n2xmgv	PTR47	f	8	/r/codes/comments/n2xmgv/found_this_today_in_tucson_az_any_ideas_as_to/	3	1	Found this today in Tucson, AZ. Any ideas as to what it means?		2021-09-04 18:16:07.54202	2021-09-04 18:16:07.542036	https://imgur.com/a/VwCUovN/	f	
\.


--
-- Data for Name: subreddit_submissions; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.subreddit_submissions (id, subreddit) FROM stdin;
\.


--
-- Data for Name: subreddits; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.subreddits (id) FROM stdin;
ARG
puzzles
codes
\.


--
-- Data for Name: usernames; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.usernames (id, last_scanned_on) FROM stdin;
indires	2021-09-04 18:08:55.68813
StudentConfident9045	2021-09-04 18:09:13.907001
PotatoKingTheVII	2021-09-04 18:15:44.02507
PTR47	2021-09-04 18:16:09.182412
\.


--
-- Name: archives archives_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.archives
    ADD CONSTRAINT archives_pkey PRIMARY KEY (id);


--
-- Name: submissions submissions_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.submissions
    ADD CONSTRAINT submissions_pkey PRIMARY KEY (id);


--
-- Name: subreddit_submissions subreddit_submissions_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.subreddit_submissions
    ADD CONSTRAINT subreddit_submissions_pkey PRIMARY KEY (id, subreddit);


--
-- Name: subreddits subreddits_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.subreddits
    ADD CONSTRAINT subreddits_pkey PRIMARY KEY (id);


--
-- Name: usernames usernames_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.usernames
    ADD CONSTRAINT usernames_pkey PRIMARY KEY (id);


--
-- Name: subreddit_submissions subreddit_submissions_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.subreddit_submissions
    ADD CONSTRAINT subreddit_submissions_id_fkey FOREIGN KEY (id) REFERENCES public.submissions(id);


--
-- Name: subreddit_submissions subreddit_submissions_subreddit_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.subreddit_submissions
    ADD CONSTRAINT subreddit_submissions_subreddit_fkey FOREIGN KEY (subreddit) REFERENCES public.subreddits(id);


--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 12.4 (Debian 12.4-1.pgdg100+1)
-- Dumped by pg_dump version 12.4 (Debian 12.4-1.pgdg100+1)

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

DROP DATABASE postgres;
--
-- Name: postgres; Type: DATABASE; Schema: -; Owner: root
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';


ALTER DATABASE postgres OWNER TO root;

\connect postgres

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

--
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: root
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

