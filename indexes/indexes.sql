drop table if exists t;
create table t (c1 number, c2 number);
insert into t (c1, c2) values (null, null);
insert into t (c1, c2) values (1, null);
insert into t (c1, c2) values (null, 1);
insert into t (c1, c2) values (1, 1);