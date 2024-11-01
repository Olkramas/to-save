create sequence seq_member;

insert into TIM_MEMBER
values (seq_member.nextval, 'sample', 'sample', 'nickname', '샘플', '010-1234-6789', '대구 중구 국채보상로 586', 'buyer', sysdate);

insert into TIM_MEMBER
values (seq_member.nextval, 'test', 'test', 'im_test', '테스트', '010-4321-9876', '대구 중구 동성로 33', 'buyer', sysdate);

insert into TIM_MEMBER
values (seq_member.nextval, 'buyer', 'buyer', 'buying', '구매중', '010-0000-1111', '대구 중구 동성로6길 61', 'buyer', sysdate);

insert into TIM_MEMBER
values (seq_member.nextval, 'seller', 'seller', 'best_seller', '판매왕', '010-7777-7777', '대구 중구 중앙대로 403', 'seller', sysdate);

insert into TIM_MEMBER
values (seq_member.nextval, 'admin', 'admin', 'super_admin', '관리자', '010-4444-4444', '대구 중구 동성로2길 80', 'seller', sysdate);





create sequence seq_cate;

insert into TIM_CATEGORI
values (seq_cate.nextval, '패션의류/잡화', '여성의류');

insert into TIM_CATEGORI
values (seq_cate.nextval, '패션의류/잡화', '남성의류');

insert into TIM_CATEGORI
values (seq_cate.nextval, '패션의류/잡화', '공용의류');

insert into TIM_CATEGORI
values (seq_cate.nextval, '패션의류/잡화', '유아의류');

insert into TIM_CATEGORI
values (seq_cate.nextval, '패션의류/잡화', '속옷/잠옷');

insert into TIM_CATEGORI
values (seq_cate.nextval, '뷰티', '스킨케어');

insert into TIM_CATEGORI
values (seq_cate.nextval, '뷰티', '클렌징/필링');

insert into TIM_CATEGORI
values (seq_cate.nextval, '뷰티', '메이크업');

insert into TIM_CATEGORI
values (seq_cate.nextval, '뷰티', '향수');

insert into TIM_CATEGORI
values (seq_cate.nextval, '뷰티', '남성화장품');

insert into TIM_CATEGORI
values (seq_cate.nextval, '뷰티', '네일');

insert into TIM_CATEGORI
values (seq_cate.nextval, '뷰티', '뷰티소품');

insert into TIM_CATEGORI
values (seq_cate.nextval, '뷰티', '어린이화장품');

insert into TIM_CATEGORI
values (seq_cate.nextval, '뷰티', '헤어');

insert into TIM_CATEGORI
values (seq_cate.nextval, '뷰티', '바디');

insert into TIM_CATEGORI
values (seq_cate.nextval, '출산/유아동', '기저기');

insert into TIM_CATEGORI
values (seq_cate.nextval, '출산/유아동', '분유/어린이식품');

insert into TIM_CATEGORI
values (seq_cate.nextval, '출산/유아동', '수유용품');

insert into TIM_CATEGORI
values (seq_cate.nextval, '출산/유아동', '이유용품/유아식기');

insert into TIM_CATEGORI
values (seq_cate.nextval, '출산/유아동', '매트/안정용품');

insert into TIM_CATEGORI
values (seq_cate.nextval, '출산/유아동', '유모차/웨건');

insert into TIM_CATEGORI
values (seq_cate.nextval, '출산/유아동', '카시트');

insert into TIM_CATEGORI
values (seq_cate.nextval, '출산/유아동', '아기띠/외출용품');

insert into TIM_CATEGORI
values (seq_cate.nextval, '출산/유아동', '욕실용품/스킨케어');

insert into TIM_CATEGORI
values (seq_cate.nextval, '출산/유아동', '완구/교구');

insert into TIM_CATEGORI
values (seq_cate.nextval, '출산/유아동', '유아용도서');

insert into TIM_CATEGORI
values (seq_cate.nextval, '식품', '과일');

insert into TIM_CATEGORI
values (seq_cate.nextval, '식품', '견과/건과');

insert into TIM_CATEGORI
values (seq_cate.nextval, '식품', '채소');

insert into TIM_CATEGORI
values (seq_cate.nextval, '식품', '쌀/잡곡');

insert into TIM_CATEGORI
values (seq_cate.nextval, '식품', '음료');

insert into TIM_CATEGORI
values (seq_cate.nextval, '식품', '육류');

insert into TIM_CATEGORI
values (seq_cate.nextval, '식품', '수산물');

insert into TIM_CATEGORI
values (seq_cate.nextval, '식품', '커피/원두/차');

insert into TIM_CATEGORI
values (seq_cate.nextval, '식품', '조미료');

insert into TIM_CATEGORI
values (seq_cate.nextval, '식품', '가공식품');

insert into TIM_CATEGORI
values (seq_cate.nextval, '식품', '냉동식품');

insert into TIM_CATEGORI
values (seq_cate.nextval, '주방용품', '냄비/프라이팬');

insert into TIM_CATEGORI
values (seq_cate.nextval, '주방용품', '주방조리도구');

insert into TIM_CATEGORI
values (seq_cate.nextval, '주방용품', '그릇/홈세트');

insert into TIM_CATEGORI
values (seq_cate.nextval, '주방용품', '수저/커트러리');

insert into TIM_CATEGORI
values (seq_cate.nextval, '주방용품', '컵/텀블러/와인용품');

insert into TIM_CATEGORI
values (seq_cate.nextval, '주방용품', '주전자/커피/티용품');

insert into TIM_CATEGORI
values (seq_cate.nextval, '주방용품', '밀폐저장/도시락');

insert into TIM_CATEGORI
values (seq_cate.nextval, '주방용품', '주방잡화');

insert into TIM_CATEGORI
values (seq_cate.nextval, '주방용품', '일회용품/종이컵');

insert into TIM_CATEGORI
values (seq_cate.nextval, '생할용품', '헤어');

insert into TIM_CATEGORI
values (seq_cate.nextval, '생할용품', '바디/세안');

insert into TIM_CATEGORI
values (seq_cate.nextval, '생할용품', '구강/면도');

insert into TIM_CATEGORI
values (seq_cate.nextval, '생할용품', '화장지/물티슈');

insert into TIM_CATEGORI
values (seq_cate.nextval, '생할용품', '생리대/기저기');

insert into TIM_CATEGORI
values (seq_cate.nextval, '생할용품', '세탁/청소용품');

insert into TIM_CATEGORI
values (seq_cate.nextval, '생할용품', '청소/주방세제');

insert into TIM_CATEGORI
values (seq_cate.nextval, '생할용품', '수납/정리');

insert into TIM_CATEGORI
values (seq_cate.nextval, '생할용품', '공구/철물/DIY');

insert into TIM_CATEGORI
values (seq_cate.nextval, '생할용품', '생활잡화');

insert into TIM_CATEGORI
values (seq_cate.nextval, '홈인테리어', '가구');

insert into TIM_CATEGORI
values (seq_cate.nextval, '홈인테리어', '침구');

insert into TIM_CATEGORI
values (seq_cate.nextval, '홈인테리어', '커튼/블라인드');

insert into TIM_CATEGORI
values (seq_cate.nextval, '홈인테리어', '수예/수선');

insert into TIM_CATEGORI
values (seq_cate.nextval, '홈인테리어', '조명/스탠드');

insert into TIM_CATEGORI
values (seq_cate.nextval, '홈인테리어', '셀프인테리어');

insert into TIM_CATEGORI
values (seq_cate.nextval, '홈인테리어', '원예/가드닝');

insert into TIM_CATEGORI
values (seq_cate.nextval, '홈인테리어', '쿠션/거실화');

insert into TIM_CATEGORI
values (seq_cate.nextval, '가전디지털', 'TV');

insert into TIM_CATEGORI
values (seq_cate.nextval, '가전디지털', '냉장고');

insert into TIM_CATEGORI
values (seq_cate.nextval, '가전디지털', '세탁기');

insert into TIM_CATEGORI
values (seq_cate.nextval, '가전디지털', '노트북');

insert into TIM_CATEGORI
values (seq_cate.nextval, '가전디지털', '모니터');

insert into TIM_CATEGORI
values (seq_cate.nextval, '가전디지털', '휴대폰');

insert into TIM_CATEGORI
values (seq_cate.nextval, '가전디지털', '스마트워치');

insert into TIM_CATEGORI
values (seq_cate.nextval, '가전디지털', '게임');

insert into TIM_CATEGORI
values (seq_cate.nextval, '가전디지털', '키보드/마우스');

insert into TIM_CATEGORI
values (seq_cate.nextval, '가전디지털', '음향기기');

insert into TIM_CATEGORI
values (seq_cate.nextval, '가전디지털', '카메라');

insert into TIM_CATEGORI
values (seq_cate.nextval, '스포츠/레저', '홈트레이닝');

insert into TIM_CATEGORI
values (seq_cate.nextval, '스포츠/레저', '수영/수상스포츠');

insert into TIM_CATEGORI
values (seq_cate.nextval, '스포츠/레저', '골프');

insert into TIM_CATEGORI
values (seq_cate.nextval, '스포츠/레저', '런닝/라이딩');

insert into TIM_CATEGORI
values (seq_cate.nextval, '스포츠/레저', '등산/아웃도어');

insert into TIM_CATEGORI
values (seq_cate.nextval, '스포츠/레저', '구기스포츠');

insert into TIM_CATEGORI
values (seq_cate.nextval, '스포츠/레저', '헬스/요가/댄스');

insert into TIM_CATEGORI
values (seq_cate.nextval, '스포츠/레저', '복싱/검도/태권도');

insert into TIM_CATEGORI
values (seq_cate.nextval, '자동차용품', '자동차인테리어');

insert into TIM_CATEGORI
values (seq_cate.nextval, '자동차용품', '익스테리어');

insert into TIM_CATEGORI
values (seq_cate.nextval, '자동차용품', '세차/카케어');

insert into TIM_CATEGORI
values (seq_cate.nextval, '자동차용품', '차량용전자기기');

insert into TIM_CATEGORI
values (seq_cate.nextval, '자동차용품', '차량관리/소모품');

insert into TIM_CATEGORI
values (seq_cate.nextval, '자동차용품', '부품/안전/공구');

insert into TIM_CATEGORI
values (seq_cate.nextval, '자동차용품', '오토바이용품');

insert into TIM_CATEGORI
values (seq_cate.nextval, '자동차용품', '타이어');

insert into TIM_CATEGORI
values (seq_cate.nextval, '도서/음반/DVD', '어린이도서');

insert into TIM_CATEGORI
values (seq_cate.nextval, '도서/음반/DVD', '소설/에세이/시');

insert into TIM_CATEGORI
values (seq_cate.nextval, '도서/음반/DVD', '참고서');

insert into TIM_CATEGORI
values (seq_cate.nextval, '도서/음반/DVD', '여행');

insert into TIM_CATEGORI
values (seq_cate.nextval, '도서/음반/DVD', '역사');

insert into TIM_CATEGORI
values (seq_cate.nextval, '도서/음반/DVD', '만화/라노벨');

insert into TIM_CATEGORI
values (seq_cate.nextval, '도서/음반/DVD', '인문');

insert into TIM_CATEGORI
values (seq_cate.nextval, '도서/음반/DVD', '해외도서');

insert into TIM_CATEGORI
values (seq_cate.nextval, '완구/취미', '로봇');

insert into TIM_CATEGORI
values (seq_cate.nextval, '완구/취미', '역활놀이');

insert into TIM_CATEGORI
values (seq_cate.nextval, '완구/취미', '블록놀이');

insert into TIM_CATEGORI
values (seq_cate.nextval, '완구/취미', '보드게임');

insert into TIM_CATEGORI
values (seq_cate.nextval, '완구/취미', '프라모델');

insert into TIM_CATEGORI
values (seq_cate.nextval, '완구/취미', '피규어/다이캐스트');

insert into TIM_CATEGORI
values (seq_cate.nextval, '완구/취미', '콘솔/휴대용게임기기');

insert into TIM_CATEGORI
values (seq_cate.nextval, '문구/오피스', '미술/화방용품');

insert into TIM_CATEGORI
values (seq_cate.nextval, '문구/오피스', '학용품/수업준비');

insert into TIM_CATEGORI
values (seq_cate.nextval, '문구/오피스', '필기류');

insert into TIM_CATEGORI
values (seq_cate.nextval, '문구/오피스', '노트/메모지');

insert into TIM_CATEGORI
values (seq_cate.nextval, '문구/오피스', '바인더/파일');

insert into TIM_CATEGORI
values (seq_cate.nextval, '문구/오피스', '카드/엽서/봉투');

insert into TIM_CATEGORI
values (seq_cate.nextval, '문구/오피스', '앨범');

insert into TIM_CATEGORI
values (seq_cate.nextval, '문구/오피스', '보드/칠판/광고');

insert into TIM_CATEGORI
values (seq_cate.nextval, '반려동물용품', '강아지사료');

insert into TIM_CATEGORI
values (seq_cate.nextval, '반려동물용품', '고양이사료');

insert into TIM_CATEGORI
values (seq_cate.nextval, '반려동물용품', '산책용품');

insert into TIM_CATEGORI
values (seq_cate.nextval, '반려동물용품', '관상어용품');

insert into TIM_CATEGORI
values (seq_cate.nextval, '반려동물용품', '소동물/가축용품');

insert into TIM_CATEGORI
values (seq_cate.nextval, '헬스/건강식품', '성인용건강식품');

insert into TIM_CATEGORI
values (seq_cate.nextval, '헬스/건강식품', '여성용건강식품');

insert into TIM_CATEGORI
values (seq_cate.nextval, '헬스/건강식품', '남성용건강식품');

insert into TIM_CATEGORI
values (seq_cate.nextval, '헬스/건강식품', '임산부건강식품');

insert into TIM_CATEGORI
values (seq_cate.nextval, '헬스/건강식품', '어린이건강식품');

insert into TIM_CATEGORI
values (seq_cate.nextval, '헬스/건강식품', '헬스보충식품');

insert into TIM_CATEGORI
values (seq_cate.nextval, '헬스/건강식품', '홍삼/인삼');





create sequence seq_goods;

insert into TIM_GOODSINFO
values (seq_goods.nextval, '사과', 15000, 100, 'state', 'seller', '과일', sysdate, sysdate);

insert into TIM_GOODSINFO
values (seq_goods.nextval, '귤', 10000, 200, 'state', 'seller', '과일', sysdate, sysdate);

insert into TIM_GOODSINFO
values (seq_goods.nextval, '수박', 17500, 50, 'state', 'seller', '과일', sysdate, sysdate);

insert into TIM_GOODSINFO
values (seq_goods.nextval, '바나나', 5000, 400, 'state', 'seller', '과일', sysdate, sysdate);

insert into TIM_GOODSINFO
values (seq_goods.nextval, '감자', 7500, 150, 'state', 'seller', '채소', sysdate, sysdate);

insert into TIM_GOODSINFO
values (seq_goods.nextval, '당근', 5000, 150, 'state', 'seller', '채소', sysdate, sysdate);

insert into TIM_GOODSINFO
values (seq_goods.nextval, '양파', 5000, 200, 'state', 'seller', '채소', sysdate, sysdate);

insert into TIM_GOODSINFO
values (seq_goods.nextval, '샐러드', 10000, 100, 'state', 'seller', '채소', sysdate, sysdate);

insert into TIM_GOODSINFO
values (seq_goods.nextval, '생수', 7000, 400, 'state', 'seller', '음료', sysdate, sysdate);

insert into TIM_GOODSINFO
values (seq_goods.nextval, '탄산수', 12000, 100, 'state', 'seller', '음료', sysdate, sysdate);

insert into TIM_GOODSINFO
values (seq_goods.nextval, '콜라', 15000, 100, 'state', 'seller', '음료', sysdate, sysdate);

insert into TIM_GOODSINFO
values (seq_goods.nextval, '우유', 5000, 50, 'state', 'seller', '음료', sysdate, sysdate);

insert into TIM_GOODSINFO
values (seq_goods.nextval, '소고기', 20000, 100, 'state', 'seller', '육류', sysdate, sysdate);

insert into TIM_GOODSINFO
values (seq_goods.nextval, '돼지고기', 10000, 200, 'state', 'seller', '육류', sysdate, sysdate);

insert into TIM_GOODSINFO
values (seq_goods.nextval, '닭고기', 16000, 200, 'state', 'seller', '육류', sysdate, sysdate);

insert into TIM_GOODSINFO
values (seq_goods.nextval, '오리고기', 10000, 100, 'state', 'seller', '육류', sysdate, sysdate);

insert into TIM_GOODSINFO
values (seq_goods.nextval, '무지 브이넥 반팔 티셔츠', 15000, 30, 'state', 'admin', '여성의류', sysdate, sysdate);

insert into TIM_GOODSINFO
values (seq_goods.nextval, '투버튼 속밴딩 스키니진', 20000, 25, 'state', 'admin', '여성의류', sysdate, sysdate);

insert into TIM_GOODSINFO
values (seq_goods.nextval, '빈티지 카라 데일리 원피스', 22000, 30, 'state', 'admin', '여성의류', sysdate, sysdate);

insert into TIM_GOODSINFO
values (seq_goods.nextval, '에비드 유넥 반팔 티셔츠', 10000, 50, 'state', 'admin', '여성의류', sysdate, sysdate);

insert into TIM_GOODSINFO
values (seq_goods.nextval, '브이 슬릿넥 티셔츠', 10000, 50, 'state', 'admin', '남성의류', sysdate, sysdate);

insert into TIM_GOODSINFO
values (seq_goods.nextval, '트레이닝 일자 팬츠', 20000, 70, 'state', 'admin', '남성의류', sysdate, sysdate);

insert into TIM_GOODSINFO
values (seq_goods.nextval, '고탄력 워싱 밴드 스판 청바지 빅사이즈', 23000, 40, 'state', 'admin', '남성의류', sysdate, sysdate);

insert into TIM_GOODSINFO
values (seq_goods.nextval, '냉감 긴팔 크루넥 티', 8000, 30, 'state', 'admin', '남성의류', sysdate, sysdate);

insert into TIM_GOODSINFO
values (seq_goods.nextval, '초경량 패딩조끼', 24000, 80, 'state', 'admin', '공용의류', sysdate, sysdate);

insert into TIM_GOODSINFO
values (seq_goods.nextval, '면스판 카브라 밴딩 5부 반바지', 14000, 40, 'state', 'admin', '공용의류', sysdate, sysdate);

insert into TIM_GOODSINFO
values (seq_goods.nextval, '어블라인 오버핏 바람막이 자켓', 29000, 50, 'state', 'admin', '공용의류', sysdate, sysdate);

insert into TIM_GOODSINFO
values (seq_goods.nextval, '무지 오버핏 후드티', 32000, 70, 'state', 'admin', '공용의류', sysdate, sysdate);

insert into TIM_GOODSINFO
values (seq_goods.nextval, '아동용 융털 안감 레깅스 3종', 14000, 20, 'state', 'admin', '유아의류', sysdate, sysdate);

insert into TIM_GOODSINFO
values (seq_goods.nextval, '아동용 캐주얼 양말 5켤레', 9000, 30, 'state', 'admin', '유아의류', sysdate, sysdate);

insert into TIM_GOODSINFO
values (seq_goods.nextval, '아동용 심플 니트 가디건', 12000, 30, 'state', 'admin', '유아의류', sysdate, sysdate);

insert into TIM_GOODSINFO
values (seq_goods.nextval, '아동 폴리스판 카고 조거 팬츠', 13000, 25, 'state', 'admin', '유아의류', sysdate, sysdate);

insert into TIM_GOODSINFO
values (seq_goods.nextval, '삼성 4K 43인치 스탠드형', 770000, 20, 'state', 'seller', 'TV', sysdate, sysdate);

insert into TIM_GOODSINFO
values (seq_goods.nextval, 'LG 32인치 스탠드형', 111000, 20, 'state', 'seller', 'TV', sysdate, sysdate);

insert into TIM_GOODSINFO
values (seq_goods.nextval, 'LG 4K 50인치 스탠드형', 6700000, 15, 'state', 'seller', 'TV', sysdate, sysdate);

insert into TIM_GOODSINFO
values (seq_goods.nextval, '삼성 32인치 스탠드형', 260000, 20, 'state', 'seller', 'TV', sysdate, sysdate);

insert into TIM_GOODSINFO
values (seq_goods.nextval, 'LG 양문형 냉장고', 1240000, 5, 'state', 'seller', '냉장고', sysdate, sysdate);

insert into TIM_GOODSINFO
values (seq_goods.nextval, '캐리어 2도어 냉장고', 400000, 10, 'state', 'seller', '냉장고', sysdate, sysdate);

insert into TIM_GOODSINFO
values (seq_goods.nextval, '캐리어 4도어 냉장고', 760000, 10, 'state', 'seller', '냉장고', sysdate, sysdate);

insert into TIM_GOODSINFO
values (seq_goods.nextval, '삼성 4도어 냉장고', 1560000, 5, 'state', 'seller', '냉장고', sysdate, sysdate);

insert into TIM_GOODSINFO
values (seq_goods.nextval, '삼성 세탁기 + 건조기', 2260000, 5, 'state', 'seller', '세탁기', sysdate, sysdate);

insert into TIM_GOODSINFO
values (seq_goods.nextval, 'LG 세탁기 + 건조기', 2300000, 5, 'state', 'seller', '세탁기', sysdate, sysdate);

insert into TIM_GOODSINFO
values (seq_goods.nextval, '삼성 통버블 세탁기', 450000, 10, 'state', 'seller', '세탁기', sysdate, sysdate);

insert into TIM_GOODSINFO
values (seq_goods.nextval, 'LG 통돌이 세탁기', 620000, 10, 'state', 'seller', '세탁기', sysdate, sysdate);

insert into TIM_GOODSINFO
values (seq_goods.nextval, 'LG 그램 16', 1800000, 5, 'state', 'seller', '노트북', sysdate, sysdate);

insert into TIM_GOODSINFO
values (seq_goods.nextval, '삼성 갤럭시북 4', 800000, 10, 'state', 'seller', '노트북', sysdate, sysdate);

insert into TIM_GOODSINFO
values (seq_goods.nextval, '레노버 2024 아이디어패드 슬림3', 500000, 15, 'state', 'seller', '노트북', sysdate, sysdate);

insert into TIM_GOODSINFO
values (seq_goods.nextval, 'MSI 2023 CYBORG 15', 1200000, 5, 'state', 'seller', '노트북', sysdate, sysdate);








create sequence seq_review;

insert into TIM_REVIEW
values (seq_review.nextval, 1, '신선하네요', 'sample', sysdate);

insert into TIM_REVIEW
values (seq_review.nextval, 2, '생각보다 맛있어서 놀랐습니다.', 'test', sysdate);

insert into TIM_REVIEW
values (seq_review.nextval, 3, '배송이 조금 늦네요', 'sample', sysdate);

insert into TIM_REVIEW
values (seq_review.nextval, 5, '채소에 물기가 없어요', 'sample', sysdate);

insert into TIM_REVIEW
values (seq_review.nextval, 8, '싱싱하네요', 'buyer', sysdate);

insert into TIM_REVIEW
values (seq_review.nextval, 13, '아이스팩 넉넉하게 넣어주셔서 좋았습니다.', 'buyer', sysdate);

insert into TIM_REVIEW
values (seq_review.nextval, 21, '인터넷으로 사니까 조금 사이즈가 안맞네요', 'test', sysdate);

insert into TIM_REVIEW
values (seq_review.nextval, 34, '화질이 선명해요', 'sample', sysdate);

insert into TIM_REVIEW
values (seq_review.nextval, 35, '화질이 선명해요', 'sample', sysdate);

insert into TIM_REVIEW
values (seq_review.nextval, 35, '화면이 많이 크네요', 'sample', sysdate);

insert into TIM_REVIEW
values (seq_review.nextval, 35, '가격이 너무 비싸요', 'sample', sysdate);

insert into TIM_REVIEW
values (seq_review.nextval, 35, '가성비가 좋아요!', 'sample', sysdate);

insert into TIM_REVIEW
values (seq_review.nextval, 35, '역시 tv는 lg네요!!', 'sample', sysdate);

insert into TIM_REVIEW
values (seq_review.nextval, 35, '좋습니다 굿굿!', 'sample', sysdate);

insert into TIM_REVIEW
values (seq_review.nextval, 35, '가격에 비해서 성능은 그저 그래요', 'sample', sysdate);





create sequence seq_ask;

insert into TIM_ASK
values (seq_ask.nextval, 3, '언제쯤 도착하나요', 'sample', sysdate);

insert into TIM_ASK
values (seq_ask.nextval, 21, '사이즈가 조금 안맞는데 교환 가능한가요', 'test', sysdate);

insert into TIM_ASK
values (seq_ask.nextval, 35, '생각보다 너무 화면이 큰데 교환 가능한가요', 'test', sysdate);

insert into TIM_ASK
values (seq_ask.nextval, 35, '생각보다 너무 화면이 흐려요 교환해주세요', 'test', sysdate);

insert into TIM_ASK
values (seq_ask.nextval, 35, 'as는 몇년동안 가능한가요?', 'test', sysdate);

insert into TIM_ASK
values (seq_ask.nextval, 35, 'as문의드립니다 어디로 연락드리면 될까요?', 'test', sysdate);

insert into TIM_ASK
values (seq_ask.nextval, 35, '무료 반품 가능한가요?', 'test', sysdate);

insert into TIM_ASK
values (seq_ask.nextval, 35, '설치비용은 어떻게 되나요?', 'test', sysdate);

insert into TIM_ASK
values (seq_ask.nextval, 35, '물건이 안와요.. 언제쯤 오나요?', 'test', sysdate);

insert into TIM_ASK
values (seq_ask.nextval, 35, '주말에 기사님 방문하셔서 설치 가능한가요?', 'test', sysdate);

insert into TIM_ASK
values (seq_ask.nextval, 35, '색 표현이 잘되나요?', 'test', sysdate);

insert into TIM_ASK
values (seq_ask.nextval, 35, '답변이 너무 느려요..', 'test', sysdate);

insert into TIM_ASK
values (seq_ask.nextval, 35, '갑자기 화면이 검게 나오고 켜지질 않아요', 'test', sysdate);

create sequence seq_answer;

insert into TIM_ANSWER
values (seq_answer.nextval, 1, '발송했으니 곧 도착합니다.', 'seller', sysdate);

insert into TIM_ANSWER
values (seq_answer.nextval, 3, '단순 변심으로 인한 교환은 어렵습니다.', 'seller', sysdate);

insert into TIM_ANSWER
values (seq_answer.nextval, 4, '단순 변심으로 인한 교환은 어렵습니다.', 'seller', sysdate);

insert into TIM_ANSWER
values (seq_answer.nextval, 5, '1년 무상 AS가능합니다. 감사합니다.', 'seller', sysdate);

insert into TIM_ANSWER
values (seq_answer.nextval, 6, '053-000-000으로 전화주시면 신속한 응대 가능합니다.', 'seller', sysdate);

insert into TIM_ANSWER
values (seq_answer.nextval, 7, '제품 하자로 인한 반품만 무료로 가능합니다.', 'seller', sysdate);

insert into TIM_ANSWER
values (seq_answer.nextval, 8, '평일 3만원, 주말 10만원입니다.', 'seller', sysdate);

insert into TIM_ANSWER
values (seq_answer.nextval, 9, '고객님의 물건을 확인해본결과 1~2일 후 도착예정입니다', 'seller', sysdate);

insert into TIM_ANSWER
values (seq_answer.nextval, 10, '네 가능합니다.', 'seller', sysdate);

insert into TIM_ANSWER
values (seq_answer.nextval, 11, '상품상세란 참고 부탁드립니다', 'seller', sysdate);
create sequence seq_cart;

insert into TIM_CART
values (seq_cart.nextval, 11, 'sample', 4, sysdate);

insert into TIM_CART
values (seq_cart.nextval, 14, 'sample', 2, sysdate);

insert into TIM_CART
values (seq_cart.nextval, 47, 'test', 1, sysdate);






create sequence seq_order;

insert into TIM_ORDER
values (seq_order.nextval, 'sample', 3, 2, 17500, sysdate);

insert into TIM_ORDER
values (seq_order.nextval, 'test', 21, 1, 10000, sysdate);

commit;
create sequence seq_img;