drop table t;
create table t(c number);
insert into t (NULL);

insert into t (NULL);
commit;
select count(*) from t;


drop table t;
create table t(c number not null);
insert into t values (null);

insert into t (NULL);
commit;
select count(*) from t;


