CREATE TABLE public.drink (
    product_id integer NOT NULL,
    name character varying(100),
    price numeric(8,2),
    is_recommend boolean
);


INSERT INTO public.drink VALUES (3, 'latte', 60.00, true);
INSERT INTO public.drink VALUES (7, 'mocha', 45.00, false);
INSERT INTO public.drink VALUES (1, 'espresso', 50.00, NULL);
INSERT INTO public.drink VALUES (5, 'green tea', 80.00, true);
INSERT INTO public.drink VALUES (6, 'black tea', 50.00, false);
INSERT INTO public.drink VALUES (63, 'water', 10.00, NULL);
INSERT INTO public.drink VALUES (2, 'coke', 20.00, NULL);
INSERT INTO public.drink VALUES (4, 'fanta', 20.00, false);
INSERT INTO public.drink VALUES (40, 'pepsi', 20.00, true);
INSERT INTO public.drink VALUES (41, '7-up', 20.00, NULL);
INSERT INTO public.drink VALUES (42, 'milk', 60.00, true);
INSERT INTO public.drink VALUES (43, 'honey tea', 70.00, NULL);
INSERT INTO public.drink VALUES (44, 'jasmine tea', 50.00, false);


--
-- TOC entry 2689 (class 2606 OID 17903)
-- Name: drink drink_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.drink
    ADD CONSTRAINT drink_pkey PRIMARY KEY (product_id);

