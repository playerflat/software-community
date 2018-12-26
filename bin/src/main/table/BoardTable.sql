create table mingus.board (
  boardNumber int(10) auto_increment primary key,
  stdNumber   varchar(20),
  name        varchar(10),
  title       varchar(50),
  contents    text,
  date        varchar(10)
);
