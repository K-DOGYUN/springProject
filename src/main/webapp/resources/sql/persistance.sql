create table persistent_logins (
    username varchar(100) NOT NULL,
    series varchar(100) primary key,
    token varchar(100) not null,
    last_used timestamp not null
);

drop table persistent_logins;