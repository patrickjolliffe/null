not null constraint

CREATE TABLE example_table (
    id INT PRIMARY KEY,
    username VARCHAR2(50) CONSTRAINT nn_username NOT NULL,
    email VARCHAR2(100)
);
