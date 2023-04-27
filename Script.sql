PGDMP         3                {            Shop3 "   12.14 (Ubuntu 12.14-1.pgdg20.04+1)     15.2 (Ubuntu 15.2-1.pgdg20.04+1) 7    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    41562    Shop3    DATABASE     s   CREATE DATABASE "Shop3" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'ru_RU.UTF-8';
    DROP DATABASE "Shop3";
                postgres    false                        2615    2200    public    SCHEMA     2   -- *not* creating schema, since initdb creates it
 2   -- *not* dropping schema, since initdb creates it
                postgres    false            �           0    0    SCHEMA public    ACL     Q   REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;
                   postgres    false    6            �            1259    41565    category    TABLE     [   CREATE TABLE public.category (
    id integer NOT NULL,
    name character varying(255)
);
    DROP TABLE public.category;
       public         heap    postgres    false    6            �            1259    41563    category_id_seq    SEQUENCE     �   CREATE SEQUENCE public.category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.category_id_seq;
       public          postgres    false    6    203            �           0    0    category_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.category_id_seq OWNED BY public.category.id;
          public          postgres    false    202            �            1259    41573    image    TABLE     ~   CREATE TABLE public.image (
    id integer NOT NULL,
    file_name character varying(255),
    product_id integer NOT NULL
);
    DROP TABLE public.image;
       public         heap    postgres    false    6            �            1259    41571    image_id_seq    SEQUENCE     �   CREATE SEQUENCE public.image_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.image_id_seq;
       public          postgres    false    6    205            �           0    0    image_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.image_id_seq OWNED BY public.image.id;
          public          postgres    false    204            �            1259    41581    orders    TABLE       CREATE TABLE public.orders (
    id integer NOT NULL,
    count integer NOT NULL,
    date_time timestamp(6) without time zone,
    number character varying(255),
    price real NOT NULL,
    status smallint,
    person_id integer NOT NULL,
    product_id integer NOT NULL
);
    DROP TABLE public.orders;
       public         heap    postgres    false    6            �            1259    41579    orders_id_seq    SEQUENCE     �   CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.orders_id_seq;
       public          postgres    false    207    6            �           0    0    orders_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;
          public          postgres    false    206            �            1259    41589    person    TABLE     �   CREATE TABLE public.person (
    id integer NOT NULL,
    login character varying(100),
    password character varying(255),
    role character varying(255)
);
    DROP TABLE public.person;
       public         heap    postgres    false    6            �            1259    41587    person_id_seq    SEQUENCE     �   CREATE SEQUENCE public.person_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.person_id_seq;
       public          postgres    false    6    209            �           0    0    person_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.person_id_seq OWNED BY public.person.id;
          public          postgres    false    208            �            1259    41600    product    TABLE     �  CREATE TABLE public.product (
    id integer NOT NULL,
    date_time timestamp(6) without time zone,
    description text NOT NULL,
    price real NOT NULL,
    seller character varying(255) NOT NULL,
    title text NOT NULL,
    warehouse character varying(255) NOT NULL,
    category_id integer NOT NULL,
    CONSTRAINT product_price_check CHECK ((price >= (1)::double precision))
);
    DROP TABLE public.product;
       public         heap    postgres    false    6            �            1259    41612    product_cart    TABLE     m   CREATE TABLE public.product_cart (
    id integer NOT NULL,
    person_id integer,
    product_id integer
);
     DROP TABLE public.product_cart;
       public         heap    postgres    false    6            �            1259    41610    product_cart_id_seq    SEQUENCE     �   CREATE SEQUENCE public.product_cart_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.product_cart_id_seq;
       public          postgres    false    6    213            �           0    0    product_cart_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.product_cart_id_seq OWNED BY public.product_cart.id;
          public          postgres    false    212            �            1259    41598    product_id_seq    SEQUENCE     �   CREATE SEQUENCE public.product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.product_id_seq;
       public          postgres    false    211    6            �           0    0    product_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.product_id_seq OWNED BY public.product.id;
          public          postgres    false    210            2           2604    41568    category id    DEFAULT     j   ALTER TABLE ONLY public.category ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);
 :   ALTER TABLE public.category ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    202    203    203            3           2604    41576    image id    DEFAULT     d   ALTER TABLE ONLY public.image ALTER COLUMN id SET DEFAULT nextval('public.image_id_seq'::regclass);
 7   ALTER TABLE public.image ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    204    205    205            4           2604    41584 	   orders id    DEFAULT     f   ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);
 8   ALTER TABLE public.orders ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    206    207    207            5           2604    41592 	   person id    DEFAULT     f   ALTER TABLE ONLY public.person ALTER COLUMN id SET DEFAULT nextval('public.person_id_seq'::regclass);
 8   ALTER TABLE public.person ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    208    209    209            6           2604    41603 
   product id    DEFAULT     h   ALTER TABLE ONLY public.product ALTER COLUMN id SET DEFAULT nextval('public.product_id_seq'::regclass);
 9   ALTER TABLE public.product ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    211    210    211            7           2604    41615    product_cart id    DEFAULT     r   ALTER TABLE ONLY public.product_cart ALTER COLUMN id SET DEFAULT nextval('public.product_cart_id_seq'::regclass);
 >   ALTER TABLE public.product_cart ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    212    213    213            �          0    41565    category 
   TABLE DATA                 public          postgres    false    203   �;       �          0    41573    image 
   TABLE DATA                 public          postgres    false    205   ?<       �          0    41581    orders 
   TABLE DATA                 public          postgres    false    207   9B       �          0    41589    person 
   TABLE DATA                 public          postgres    false    209   C       �          0    41600    product 
   TABLE DATA                 public          postgres    false    211   D       �          0    41612    product_cart 
   TABLE DATA                 public          postgres    false    213   �Z       �           0    0    category_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.category_id_seq', 3, true);
          public          postgres    false    202            �           0    0    image_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.image_id_seq', 50, true);
          public          postgres    false    204            �           0    0    orders_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.orders_id_seq', 2, true);
          public          postgres    false    206            �           0    0    person_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.person_id_seq', 2, true);
          public          postgres    false    208            �           0    0    product_cart_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.product_cart_id_seq', 4, true);
          public          postgres    false    212            �           0    0    product_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.product_id_seq', 10, true);
          public          postgres    false    210            :           2606    41570    category category_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.category DROP CONSTRAINT category_pkey;
       public            postgres    false    203            <           2606    41578    image image_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.image
    ADD CONSTRAINT image_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.image DROP CONSTRAINT image_pkey;
       public            postgres    false    205            >           2606    41586    orders orders_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public            postgres    false    207            @           2606    41597    person person_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.person DROP CONSTRAINT person_pkey;
       public            postgres    false    209            F           2606    41617    product_cart product_cart_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT product_cart_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.product_cart DROP CONSTRAINT product_cart_pkey;
       public            postgres    false    213            B           2606    41609    product product_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.product DROP CONSTRAINT product_pkey;
       public            postgres    false    211            D           2606    41619 $   product uk_qka6vxqdy1dprtqnx9trdd47c 
   CONSTRAINT     `   ALTER TABLE ONLY public.product
    ADD CONSTRAINT uk_qka6vxqdy1dprtqnx9trdd47c UNIQUE (title);
 N   ALTER TABLE ONLY public.product DROP CONSTRAINT uk_qka6vxqdy1dprtqnx9trdd47c;
       public            postgres    false    211            H           2606    41625 "   orders fk1b0m4muwx1t377w9if3w6wwqn    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk1b0m4muwx1t377w9if3w6wwqn FOREIGN KEY (person_id) REFERENCES public.person(id);
 L   ALTER TABLE ONLY public.orders DROP CONSTRAINT fk1b0m4muwx1t377w9if3w6wwqn;
       public          postgres    false    2880    207    209            J           2606    41635 #   product fk1mtsbur82frn64de7balymq9s    FK CONSTRAINT     �   ALTER TABLE ONLY public.product
    ADD CONSTRAINT fk1mtsbur82frn64de7balymq9s FOREIGN KEY (category_id) REFERENCES public.category(id);
 M   ALTER TABLE ONLY public.product DROP CONSTRAINT fk1mtsbur82frn64de7balymq9s;
       public          postgres    false    203    211    2874            I           2606    41630 "   orders fk787ibr3guwp6xobrpbofnv7le    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk787ibr3guwp6xobrpbofnv7le FOREIGN KEY (product_id) REFERENCES public.product(id);
 L   ALTER TABLE ONLY public.orders DROP CONSTRAINT fk787ibr3guwp6xobrpbofnv7le;
       public          postgres    false    2882    207    211            G           2606    41620 !   image fkgpextbyee3uk9u6o2381m7ft1    FK CONSTRAINT     �   ALTER TABLE ONLY public.image
    ADD CONSTRAINT fkgpextbyee3uk9u6o2381m7ft1 FOREIGN KEY (product_id) REFERENCES public.product(id);
 K   ALTER TABLE ONLY public.image DROP CONSTRAINT fkgpextbyee3uk9u6o2381m7ft1;
       public          postgres    false    2882    211    205            K           2606    41645 (   product_cart fkhpnrxdy3jhujameyod08ilvvw    FK CONSTRAINT     �   ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT fkhpnrxdy3jhujameyod08ilvvw FOREIGN KEY (product_id) REFERENCES public.product(id);
 R   ALTER TABLE ONLY public.product_cart DROP CONSTRAINT fkhpnrxdy3jhujameyod08ilvvw;
       public          postgres    false    2882    211    213            L           2606    41640 (   product_cart fksgnkc1ko2i1o9yr2p63ysq3rn    FK CONSTRAINT     �   ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT fksgnkc1ko2i1o9yr2p63ysq3rn FOREIGN KEY (person_id) REFERENCES public.person(id);
 R   ALTER TABLE ONLY public.product_cart DROP CONSTRAINT fksgnkc1ko2i1o9yr2p63ysq3rn;
       public          postgres    false    209    2880    213            �   �   x���v
Q���W((M��L�KN,IM�/�T��L�Q�K�M�Ts�	uV�0�QP�������xӅ�_�w��b���5�'iF��Zx���6\�}���ދ��*\�sa����{�2�d����N�wa���@zׅ 㸸 ]hm      �   �  x���K�%E���+�N��!#22#W.\���m�ϡ�э�ޓw�.j�u7M�WY'�9Qo���������n�n�?�7���y��y������Ӈ�~��}���w���y|u����~���ۗ���E.�)�N=�NZ�b�ɓ�Һ�����rj��o�}���_}���т�ے1�#F�ک��k�JV�|-��1��/��4V7R	�ڰAUTuZ���a�>j�bv�(E��df�b�JU'm�eiT��s�f'̶�fN����G*SqE�H�9�������KIVkZ�4�Ec(��(�Mn��ƞ����ц�!�Y}u<���:�y)�����Fˣf;f�<cs�6nX�>I]��R����Q��~���0j�uK�P�2)z����0�5�þ�2&��h.i����q)٘R�
%y=��}�Uk1�R�8k�6S��9���?��=��?|��!^f�9˩P�3ب�UoĖ;^{	j�� O������@���T���Z��/����)=b[^�k���b/8	]��I!���l^X������~l�H�	.?	2d
���,8�p��O�`�m�}�X4��%�]Z��jIRP��	!e	��R/3l7�z��AⱒB Ԭ4�=�������p��u�m�EFO:�F�4�`A�h�wo�����'q4�w�jM� B���i[�{���/C��G�V4B9�, �<�l�z�!�Æo,�D�R�+N�0��qA�iu�`�iwI%~��t���Ȣ�Mp�B@ K΅V�ջT�|`H'^���8c�/}�I�5y��`�n�m��G?��u��cB&S�&-8_Y(��Ǫ�i��9��:��GA5��"8�Ky�<�KA�YZ-~��'��~)��Ԙ��m�>0p3���I3�{S��Y�va�r��{��eq�'�@b�!k�vCj� ���:�=��E(��B]��ߵ#?�[
+ǜ^�$��[�Y��MǮ 8�*	+��u�:�0�=�:�=���?�J!M�3�@��>�P�4��������{�@K^kR�m���l$�k`k�V6�I�Y�~�aGvǮ:c]p�R{C������pƁ�,��;�'.-cS-8�O�
FX�a��1i3>@���u�{ts��JU.��`��9����z�8��2���6���H�\�U���ec��BO�����p�%�@�v�iȋa�?V��N"��Rwz�2¶ʊ�2����9�T�����:��\�zA8��:öJ�{U!�CA����\�X:�pQS�=]���*�\�.q�cW���{�@�¥V-\|��u��Uv��(�❠�zA�����;W@��b/�t/�3l��8B-��һTQ(��J�6�[s3d��>�J�!��mOWO��	g�̐{�)X�ss�8��Y�������L5$@��ec9!1�"��l(��~>���K2�B�����ܟ������T�a��[^�H�.K��攩�:�٩�&B%�E��Lb�@q��;ūW�)��      �   �   x������0�{?�vI@
�Jr�\�"��H m�%����gsU�+��2��3�5���t��p9۟ޭ��C�a�{n�Cb�m
��?�!?�L�wd�dS��Rd��G�]�}���u��d@Z�@Ņ�i���F�����]m'Jk��NH͵������J�ַ���k�߾�V_E��������zcP�PO�2m�      �   �   x����k�0 �E�-H0ℱS?lL�Fb�J/��ԅY�I;?�����}�ǃ���8��xO��V�%W���L6��R�6���]��B5���"ʂ̐���
YS0��D��]�����ϣ$l���
F�'�noW';�	n�ؒ�:�#�B}���(��&�53ȿ\�t�WQ�qQ��S�º���2�l]�)�$ݪ�pZ�%�U藰���'o�o�����0�x �`]A      �      x��\[sTו~���a�Şji��n]�I6$0��a35/)��)�(!*�7��D܄a����8q�2�u�Q�U�/8�/�/�����>�t�2v\1����콮���:>uf���s�ԙs�����������V/ݸ���_�Tp�.�/�j}�������V����^-�kk+����+W��
n}e�
}�݅��˫7��_/�����_�\��}�x��K��R���\,W��3S�+U*�buzn�R������_ĭ�G�o���0&�����+���ŏ*��/O8���(�C���T|�܏;q?ƍd7��^�M6�n��M�O���Vr�F˷���L�%ۮ\�]|DW���l�3��%�x��_N�:�K/y��&n�!����t��{��=p���=Dt��ؠ���:]���e~"-��5��[�L#����Z�>]�Ҵ�#쫛��6�蒛��v��leǲ|Ԗ�ߍǼLr������ޏl�7y@��J��z,-,E���:�(��� ��ru��m�K���{��ܔ��=`�F���t�n;��H����o^љ#w��Y�]�h�G��cr?�;<7b9�"��$F�6X8@��ov�-R�cQ_ftD_aj܄��t��؅�d�'���Et��|���h���%��~��ʪ[Z�q��ns�^E�X�2=�,���Q�d��߇�6R���Y�7�Kvi��\���J5?J��L:1i|�>��0��.|.쀯o9�E�z�O�X;b�{�?��N/�a͒��|r��ZU
�7�xv���6:9������WHk�еW0�|��,��$�Uj��r�A��c�%��j��C�Dr���>�rcy}uu�rh/�tG�˭���>^;n��t�axn��[`O�!�t�A�xxm˶�h�����ֹ���vp�>�Ŗj_���x�ǧdm>�Ca����4���<��C�7S��|��;�^��Y�g�����,_Q��}U��_���QJy,�T����b�Z��p��V��\��~{amݝ��-�$��a���[���s�B�����TĲ.�H�$e����}����},�1\�F�ea���)��:�8&���|��l��s��n�o��98�6�ڃg���KE/���҃Gr��~ip!��*I�8�!$�Ѷ�gZ.���bY-u3>�����A�:�0�j@f=�sc$��ϓ[�ȝ;��u������ȉY���Hβ3�o,��ዲ�Q8R|���$��i�k�m:�w�3Q"�[�4��!��8+'`1�;��=c@�p�!��3��dd������"�T�q�uO��!�5A�� W�%R��w��K�/�D�l�9r�"g����j$�3�P�� �Q�C��d%�}`�"�}vV����[�zimu�+�HF/!L����(T���q6�x@����B��f���$} :h����Wy�m�E*���t�/VWse�}r���_h��>��'�1�D@�&�37�3�-d�:'˗�xM,cK!�@LkʘTj>^���4�ؐ1�u1d4��r�) w3P�!_�5y#]��Y�7���9`0,D�����:��� �&D 	�=_+W|���aS<,����z���0э`�c��q�@2ϯj��c�#g7Ei��ja<I[f�M���|?�#�2����/�إR�O�A��5!ʒT��sq�>��w^���9����$
.�����]�������o����1�עv�@9�֜�_Kn����78�reQ\�����Fu�va��������EF}1�?9ᐊҲ��)hxw��P�Ђ��CW�.jaH�Tpg�u�Z��PNw[�]V	�J�ʒ�8�h�N�o[��  �kX�Φ�@�y BZWc�P���v�Q��T
3��l�P!�.�#�q������,o�Ɉ�TywĝN���a�5���?殌`��B��P�M�k��S-��/_q�.�TNVf�%�$�#�����E���L�m�\�m�ru	L����Z��h��b�U��?5*�l�'0�4f��Ԝ=ne0?ui�â�1��nkay$����Y45�Bn�>��&�>Oz�l��GP��H9�\�V�!����x��B(
`�r"�yY���8-7,p��2Y�h�+u�������`�'�B���BJ�mu|�VZg_*B�����������Z"oS�GHI�rt���d�ͅ���L�.`k��B�F�=����J�.����ê�"��� ��S@��3��XX� ��r��I �&6,6��X��]�S�M�x�Fʣp<�_j���J��k�΁�l��$V�V$U3c�1��V�DO�i��3���G�-ʖS���>Ĺ���	XK�Iؖ{3��<���G���7(�@�#��nI@�BN{�H��e����V*Qb������f����=`�D�m	q��U��ʺ�x鸫��)L�i�f\��P�9���%B6���T�[��~�G�DS"d`�3�Bכzg���6L0Sgzv��T����^o!EZ�o	�J�U�ж�$7�3����3d��f����+�fp�&�	C�=Ĉf�m�f�J�"?v�"�D࿟�_Q�y�u>����KG&�=��yIa�[�����E�Ic_1�"�.�wԸMM�D!��p�$�������#�D}�CNS���p+��
�@+��2�U��=��J��4�78�ھy5����#M
Z�y7�3���oJ�VT�D��=�µ���T=YFNC*/�{H�yA�b ̪����
}�ݑ�Bk��?�E����<���A���S4Xs^�r��E�Jn\���H@,3���$v�q�\?c��Ґ�Ueu��~S��p�Ґ��S�#��^6xJZ`k}���wtt���$�oI:O�#0*�6΢m.۔.��ӣ�s���}}�����dX3�I1FϢ�R�J~n�yh@�[T��$�-fp�!�'�΅l����(d��,=c'���X�Em�iL�k�����"|�0�e0�!B@O��Jl��!	"������I{r�_���g&ԊoM?S���DoJ��=�V�S��B�4]�����K�Q���յ����ΗΜ<q�V^Z\B}���㸠�&��f�q5��#u&#L~B@Q�e����Qj{�˜�i��E�K��=�n�fE[�,a4���6٭��:q:�çl��.E��A�Qڼ��v�a(:'��i�JZ�� �70q�*��Z�i �٤FI���F�!�d�f؃�;͙�j�A5�?%;�@�yG!���,�F�4[,��Rݛ�v��s��-�`a�]�c��I�r$Q�M�l��l�H(����c��{�a�늌��̑���M2�HpEa�@G=�Z����X#�,n�b -T��ܨ9�j?�j�S�E��W?��q�,��4/��39B0��WQf38#��yd��Z�:��.�'�H�J_�|�烚�DE��T���8�\�-��JWF��I�)А`C���Bzr�����Ĺ*�@U�������&NG����$'��iOl~ř�+O�o�D�iv,3U�fJ��ZeF��?)uǸA�� 2~�Z3��?v�byf�X)�)Ν����$RN@"�u�~%��m��A_�ơ߂N��"-?�{��X;������|�����sfB�3�*�Ys{"KS��q���:C���#�I�ٶzs0{���1�M�k�xɴO�d���VqiW[>o�W+�rJ�j��2��^S��1M���c"�๜��@�J�%�����j����A3�9;!\Zj��P�J$��R�p��I��yƳ���P���HV
�(�]�BBCx��Fp&�b��)]k�}f�a��}`ď����Z�%��"�#�B�{�u�J�k��4���Nr���A�`�V�}OB��Ȟ����Ę$�߸�<$�tB�F�©���IS����ZNNG� �HY4H'Aڊ�l��0�u�1�d���h����'͞���1���an������1�6SC�:~f�A{q�j�uG�~����T��3�\������ɇ��z��/k����hɔ�r�DW[;���sڕ���z�� �  <��3Oy�G�4�c��(��ċ���FAFI�6�J���ʎa�M��[O۝Yu?_[��N��>t�ZW!�˄�om�N¦f ��Q l
�/Q��PO��Mx���E�e�U�k��ԗ� �N�����-_���5=*⦂H�esA�t��w��\��?�(�M�::���b���!Yl�J�L�L���F)y��Z8.,R��_W��qG��d�Q���e��.��������A�5�`!q�V������ ��B?�_�_���GJ.��5��V#A�ΐ��=%0m��ZZ�z}����������L�ic��W��`mm����5É���1n|��#6B)=&�0�m��k��\j?!Q=9�Gdd��lH��=�&��QBCR%��~�E�v����c��4�L ��$�065��~�.n<����G
���dXH�o&Yi03��b���˼�iw���)�����I
]!@P�^։�r��5��yu,��p�s|c��0�ji�۬a�zB�,�#�Yu�͵���ra�~�;?R��JŅby�8_����p��WY���KTZ��v�����6]�^����������{J��Z���k�A�'8V��ѓ3@^C#���,;?�oOdGV�[ײ�MF��&��0��]!b��W�`A���T�
Ǒ�v�кs=k�K�a�tڞG�+}��f	� �	S���/r;�|wҥe³!ơӚ�w3Cߴ��������W�j))}~g�k|�
f�C���h�'�Rq��j���ٙ�l���|��H��F� C�8%�xss'���>��T���/�y#^Vf�Ԛ���H�����(G�}$>���vXJ�ӑ,�m߀b�˪VgX9���I�dN����s×�-a�nV�s �l�w��>`0��������V�^�=%�%Z�{���L@ZG����]�KQ��ZV�؛7��~@'Ӣ�޴zg<|Se���Y��^|�$\�=�����SpJ��2���i����S꒎+��o�i��׽��ѧ?A�-O�ҕ� W�z�+���Q]���(G��YREہ�K�>0:�����Я��Z!R����c�3�����Vu����dO,F^�LeX�O �M)߬���\�P���ZP�t׹�|����3ӗ<�PJ8�3h2b:��	K��L��J���މIg�}Y&)OY7a��|� �}-l�J���lѡW19��������D��6�w�3�T������&��f٠_��$�
���"�~��Υ����H!0Zd�`e� !��b�����ɥyW������f�_锏� �\з.���pq[�A�%4y�q���BO����o�9JՌj<؝��3C3b5͂�A��ӷ-���އ�;�ξ�k\e[&Z�`n�'E��շ�A��������be��k="��4p��M�����ċ�|Z
��j��i<e'����E&��16�X}�N"��J�2���c�&ojd�S�w25�_�p\g�k�c�)�]�T��Y�O���r�����4�nn+��9B�锍!��Mf�u���VI�N3� y/�٣2��`�*;��>0OyF�V�B�{ ���,P˲����2_c'!���:1����$�7����I����P�������`�ZR���!�x�/��P�J[@��>��m+�úbț� D�:�N��i=�_�GZ�9�����c�� �Q�      �   
   x���         