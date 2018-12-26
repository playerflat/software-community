create table mingus.magazine (
  magazineNumber int(10) auto_increment primary key,
  stdNumber      varchar(9),
  title          varchar(50),
  name           varchar(10),
  contents       text,
  date           varchar(10)
);