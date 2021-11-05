
select * from member;
insert into member values('khmaster', 'khmaster1', '김포박장', '서울특별시 영등포구 양평동 이레빌딩', '010-1234-1234', 'khmaster@kh.com', '1998-08-11', default, 0, '관리자', '남');
insert into member values('testuser1', 'testuser1', '김고객', '사랑시 고백구 행복동', '010-1234-1233', 'testuser1@kh.com', '2000-01-01', default, 0, default, '남');

create sequence basket_seq;
select * from basket;
insert into basket values(basket_seq.nextval, 'testuser1', 1);

create sequence wishlist_seq;
select * from wishlist;
insert into wishlist values(wishlist_seq.nextval, 'testuser1', 1);

create sequence bigtype_seq;
select * from bigtype;
insert into bigtype values(bigtype_seq.nextval, 'Outer');

create sequence smalltype_seq;
select * from smalltype;
insert into smalltype values(smalltype_seq.nextval, 1,'코트');

create sequence stock_seq;
select * from stock;
insert into stock values(stock_seq.nextval, 1, 21, 1, default, 50);

create sequence sz_seq;
select * from sz;
insert into sz values(sz_seq.nextval, 'S');
insert into sz values(sz_seq.nextval, 'XL-2XL');

create sequence color_seq;
select * from color;
insert into color values(color_seq.nextval, '네이비');

create sequence productsize_seq;
select * from productsize;
insert into productsize values(productsize_seq.nextval, 21,1);


create sequence productcolor_seq;
select * from productcolor;
insert into productcolor values(productcolor_seq.nextval, 1, 1);

create sequence buy_seq;
select * from buy;
alter table buy modify (status default '배송 전');
alter table buy modify (status default '배송 전' check(status in('배송 전', '배송 중', '배송 후')));
insert into buy values(buy_seq.nextval, 'testuser1', 1, '카드 결제', default, '배송 전');

create sequence product_seq;
select * from product;
insert into product values(product_seq.nextval, 1, '모노 캐시라이크 오버 싱글코트', 110000, '바이모노가 이번 겨울을 위해

영혼을 담아 만든 코트입니다.



여유로운 오버핏 사이즈로 제작되어

두꺼운 이너와 함께 착용해도 깔끔한 실루엣을 연출해주며

포멀하게도, 캐주얼한 무드로도 모두 연출하기 용이합니다.



부드러운 터치감의 비스코스 블렌드 원단을 사용하여

보온성과 착용감이 뛰어납니다.



베이직한 블랙, 차콜, 네이비 3컬러로 구성되어 있어

다양한 컬러의 이너와 쉽게 매치하실 수 있습니다.



겨울 데일리 코트로 강력 추천드립니다:)', default);

create sequence productimage_seq;
select * from productimage;
insert into productimage values(productimage_seq.nextval, 1, '1-01.jpg', '1-01.jpg', 619113, 'image/jpeg');

create sequence reply_seq;
select * from reply;
insert into reply values(reply_seq.nextval, 'testuser1', 1, 5, '너무이뻐여', default);

create sequence replyimage_seq;
select * from replyimage;
insert into replyimage values(replyimage_seq.nextval, 1, '1-1.jpg', '1-1.jpg', 607633, 'image/jpeg');

create sequence board_seq;
select * from board;
insert into board values(board_seq.nextval, 'khmaster', 1, '김포박장 공지사항', '제발 사주세요', default, default, null, 1, 0);

create sequence boardimage_seq;
select * from boardimage;
insert into boardimage values(boardimage_seq.nextval, 1, 'k4pj.jpg', '1-1.jpg', 2238, 'image/jpeg');

commit;