drop table if exists pvjtest;

create table pvjtest(col1 varchar2(11), col2 varchar2(11), col3 varchar2(11));

insert into pvjtest (col1, col2, col3) values ('Symposium 42',  'Symposium 42',  'Symposium 42');
insert into pvjtest (col1, col2, col3) values ('Symposium 42',  'Symposium 42',   NULL);
insert into pvjtest (col1, col2, col3) values ('Symposium 42',  NULL,             'Symposium 42');
insert into pvjtest (col1, col2, col3) values ('Symposium 42',  NULL,             NULL);
insert into pvjtest (col1, col2, col3) values (NULL,            'Symposium 42',   'Symposium 42');
insert into pvjtest (col1, col2, col3) values (NULL,            'Symposium 42',   NULL);
insert into pvjtest (col1, col2, col3) values (NULL,            NULL,             'Symposium 42');
insert into pvjtest (col1, col2, col3) values (NULL,            NULL,             NULL);

commit;


select distinct dbms_rowid.rowid_relative_fno(rowid) fno,
                dbms_rowid.rowid_block_number(rowid) bno from pvjtest;

ALTER SYSTEM DUMP DATAFILE 15 BLOCK 158;        

select * from v$diag_info where name = 'Default Trace File'


block_row_dump:
tab 0, row 0, @0x1f8c
tl: 12 fb: --H-FL-- lb: 0x1  cc: 3
col  0: [ 2]  c1 2b
col  1: [ 2]  c1 2b
col  2: [ 2]  c1 2b
tab 0, row 1, @0x1f83
tl: 9 fb: --H-FL-- lb: 0x1  cc: 2
col  0: [ 2]  c1 2b
col  1: [ 2]  c1 2b
tab 0, row 2, @0x1f79
tl: 10 fb: --H-FL-- lb: 0x1  cc: 3
col  0: [ 2]  c1 2b
col  1: *NULL*
col  2: [ 2]  c1 2b
tab 0, row 3, @0x1f73
tl: 6 fb: --H-FL-- lb: 0x1  cc: 1
col  0: [ 2]  c1 2b
tab 0, row 4, @0x1f69
tl: 10 fb: --H-FL-- lb: 0x1  cc: 3
col  0: *NULL*
col  1: [ 2]  c1 2b
col  2: [ 2]  c1 2b
tab 0, row 5, @0x1f62
tl: 7 fb: --H-FL-- lb: 0x1  cc: 2
col  0: *NULL*
col  1: [ 2]  c1 2b
tab 0, row 6, @0x1f5a
tl: 8 fb: --H-FL-- lb: 0x1  cc: 3
col  0: *NULL*
col  1: *NULL*
col  2: [ 2]  c1 2b
tab 0, row 7, @0x1f57
tl: 3 fb: --H-FL-- lb: 0x1  cc: 0
end_of_block_dump