drop table if exists pvjtest;

create table pvjtest(col1 varchar2(12), col2 varchar2(12), col3 varchar2(12));

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

ALTER SYSTEM DUMP DATAFILE 15 BLOCK 174;        

select * from v$diag_info where name = 'Default Trace File'


block_row_dump:
tab 0, row 0, @0x1f6e
tl: 42 fb: --H-FL-- lb: 0x1  cc: 3
col  0: [12]  53 79 6d 70 6f 73 69 75 6d 20 34 32
col  1: [12]  53 79 6d 70 6f 73 69 75 6d 20 34 32
col  2: [12]  53 79 6d 70 6f 73 69 75 6d 20 34 32
tab 0, row 1, @0x1f51
tl: 29 fb: --H-FL-- lb: 0x1  cc: 2
col  0: [12]  53 79 6d 70 6f 73 69 75 6d 20 34 32
col  1: [12]  53 79 6d 70 6f 73 69 75 6d 20 34 32
tab 0, row 2, @0x1f33
tl: 30 fb: --H-FL-- lb: 0x1  cc: 3
col  0: [12]  53 79 6d 70 6f 73 69 75 6d 20 34 32
col  1: *NULL*
col  2: [12]  53 79 6d 70 6f 73 69 75 6d 20 34 32
tab 0, row 3, @0x1f23
tl: 16 fb: --H-FL-- lb: 0x1  cc: 1
col  0: [12]  53 79 6d 70 6f 73 69 75 6d 20 34 32
tab 0, row 4, @0x1f05
tl: 30 fb: --H-FL-- lb: 0x1  cc: 3
col  0: *NULL*
col  1: [12]  53 79 6d 70 6f 73 69 75 6d 20 34 32
col  2: [12]  53 79 6d 70 6f 73 69 75 6d 20 34 32
tab 0, row 5, @0x1ef4
tl: 17 fb: --H-FL-- lb: 0x1  cc: 2
col  0: *NULL*
col  1: [12]  53 79 6d 70 6f 73 69 75 6d 20 34 32
tab 0, row 6, @0x1ee2
tl: 18 fb: --H-FL-- lb: 0x1  cc: 3
col  0: *NULL*
col  1: *NULL*
col  2: [12]  53 79 6d 70 6f 73 69 75 6d 20 34 32
tab 0, row 7, @0x1edf
tl: 3 fb: --H-FL-- lb: 0x1  cc: 0
end_of_block_dump