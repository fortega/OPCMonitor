drop table factores

create table Factores
(
aditivo1 float not null,
aditivo2 float not null,
aditivo3 float not null,
aditivo4 float not null,
aditivo5 float not null,
aditivo6 float not null,
soda1 float not null,
soda2 float not null,
soda3 float not null,
soda4 float not null,
soda5 float not null,
soda6 float not null,
primary key (aditivo1,aditivo2,aditivo3,aditivo4,aditivo5,aditivo6,
	soda1,soda2,soda3,soda4,soda5,soda6)
)

insert into factores(
aditivo1,
aditivo2,
aditivo3,
aditivo4,
aditivo5,
aditivo6,
soda1,
soda2,
soda3,
soda4,
soda5,
soda6)
values(0.18,0.18,0.18,0.18,0.18,0.18,
0.42,0.42,0.42,0.42,0.42,0.42)