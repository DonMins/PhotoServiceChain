create table USERS
(
    ID         BIGINT auto_increment primary key,
    EMAIL      VARCHAR(255),
    NAME       VARCHAR(255),
    PASSWORD   VARCHAR(255),
    PATRONYMIC VARCHAR(255),
    PHONE      VARCHAR(255),
    SURNAME    VARCHAR(255),
    USERNAME   VARCHAR(255)
);

create table ORDERS
(
    ID            BIGINT auto_increment  primary key,
    COMMENT       VARCHAR(255),
    LINKONPHOTO   VARCHAR(255),
    SIZEPHOTO     VARCHAR(255),
    STATUS        VARCHAR(255),
    TOTAL         VARCHAR(255),
    TYPEPHOTO     VARCHAR(255),
    USERSFIELD_ID BIGINT,
    constraint FK_242S081YJKF3AHPGIO8STNE9S  foreign key (USERSFIELD_ID) references USERS
);


insert into USERS (ID, USERNAME, PASSWORD, EMAIL, NAME, SURNAME, PATRONYMIC, phone)
values (1, 'admin',
        '$2a$11$pPw69Lq/WysCjcZBqEq.F.W0Nrb63lzAayeVlb1azoRFldno4J8gi', 'admin@mail.ru',
        'admin', 'admin', 'admin', 'admin');

insert into USERS (ID, USERNAME, PASSWORD, EMAIL, NAME, SURNAME, PATRONYMIC, phone)
values (2, 'test',
        '$2a$11$ax09M7WH.oOmOKGUAoigD.n2Fr/vtOGIsSxmY09lXw9rjfu4E6IWu', 'test@mail.ru',
        'test', 'test', 'test', '894564532453')