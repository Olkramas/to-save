CREATE TABLE TIM_MEMBER (
	seq_member	NUMBER		NOT NULL,
	member_id	VARCHAR2(20)		NOT NULL,
	member_pw	VARCHAR2(30)		NOT NULL,
	member_nick	VARCHAR2(20)		NOT NULL,
	member_name	VARCHAR2(20)		NOT NULL,
	member_phone	VARCHAR2(20)		NOT NULL,
	member_address	VARCHAR2(200)		NOT NULL,
	member_division	VARCHAR2(20)	DEFAULT 'buyer'	NOT NULL,
	member_date	DATE	DEFAULT sysdate	NULL
);

COMMENT ON COLUMN TIM_MEMBER.member_division IS 'buyer / seller';

CREATE TABLE TIM_ANSWER (
	seq_answer	NUMBER		NOT NULL,
	ask_num	    NUMBER		NOT NULL,
	answer	CLOB		NOT NULL,
	seller_id	VARCHAR2(100)		NOT NULL,
	answer_date	DATE	DEFAULT sysdate NULL
);

CREATE TABLE TIM_REVIEW (
	seq_review	INT		NOT NULL,
	goods_num	INT		NOT NULL,
	review	CLOB		NOT NULL,
	buyer_id	VARCHAR2(100)		NOT NULL,
	review_date	DATE	DEFAULT sysdate	NULL
);

CREATE TABLE TIM_GOODSINFO (
	seq_goods	INT		NOT NULL,
	goods_name	VARCHAR2(100)		NOT NULL,
	goods_price	INT		NOT NULL,
	goods_inven	INT		NOT NULL,
	goods_state	VARCHAR2(20)	DEFAULT 'state'	NOT NULL,
	goods_mid	VARCHAR2(100)		NOT NULL,
	goods_catename	VARCHAR2(100)		NOT NULL,
	goods_mdate	DATE	DEFAULT sysdate	NULL,
	goods_rdate	DATE	DEFAULT sysdate	NULL
);

COMMENT ON COLUMN TIM_GOODSINFO.goods_state IS 'state / stop / end';

CREATE TABLE TIM_ORDER (
	seq_order	INT		NOT NULL,
	buyer_id	VARCHAR2(100)	NOT NULL,
	goods_num	NUMBER		NOT NULL,
	count	NUMBER		NOT NULL,
	price	NUMBER		NOT NULL,
	order_date	DATE	DEFAULT sysdate	NULL
);


CREATE TABLE TIM_ASK (
	seq_ask	NUMBER		NOT NULL,
	goods_num	NUMBER		NOT NULL,
	ask	CLOB		NOT NULL,
	buyer_id	VARCHAR2(100)		NOT NULL,
	ask_date	DATE	DEFAULT sysdate	NULL
);

CREATE TABLE TIM_CART (
	seq_cart	INT		NOT NULL,
	goods_num	number		NOT NULL,
	member_id	VARCHAR2(100)		NOT NULL,
	count	NUMBER		NOT NULL,
	cart_date	DATE	DEFAULT sysdate	NULL
);

CREATE TABLE TIM_IMG (
	seq_img	NUMBER		NOT NULL,
	goods_num	NUMBER		NOT NULL,
	img_url	VARCHAR(200)		NOT NULL
);

CREATE TABLE TIM_CATEGORI (
	seq_cate	INT		NOT NULL,
	t_cate	VARCHAR2(100)		NOT NULL,
	b_cate	VARCHAR2(100)		NOT NULL
);

ALTER TABLE TIM_MEMBER ADD CONSTRAINT PK_TIM_MEMBER PRIMARY KEY (
	seq_member
);

ALTER TABLE TIM_ANSWER ADD CONSTRAINT PK_TIM_ANSWER PRIMARY KEY (
	seq_answer
);

ALTER TABLE TIM_REVIEW ADD CONSTRAINT PK_TIM_REVIEW PRIMARY KEY (
	seq_review
);

ALTER TABLE TIM_GOODSINFO ADD CONSTRAINT PK_TIM_GOODSINFO PRIMARY KEY (
	seq_goods
);

ALTER TABLE TIM_ORDER ADD CONSTRAINT PK_TIM_ORDER PRIMARY KEY (
	seq_order
);

ALTER TABLE TIM_ASK ADD CONSTRAINT PK_TIM_ASK PRIMARY KEY (
	seq_ask
);

ALTER TABLE TIM_CART ADD CONSTRAINT PK_TIM_CART PRIMARY KEY (
	seq_cart
);

ALTER TABLE TIM_IMG ADD CONSTRAINT PK_TIM_IMG PRIMARY KEY (
	seq_img
);

ALTER TABLE TIM_CATEGORI ADD CONSTRAINT PK_TIM_CATEGORI PRIMARY KEY (
	seq_cate
);