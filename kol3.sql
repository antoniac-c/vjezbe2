drop database if exists kol3;
create database kol3;
use kol3;

create table svekar (
sifra int not null primary key auto_increment,
novcica decimal (16.8) not null,
bojakose varchar (34),
prstena int,
narukvica int not null,
cura int not null
);

create table cura (
sifra int not null primary key auto_increment,
dukserica varchar (49),
maraka decimal (13.7),
drugiputa datetime,
majica varchar (49),
novcica decimal (15.8),
narukvica int not null
);

create table snasa (
sifra int not null primary key auto_increment,
introvertno boolean ,
kuna decimal (15.6)not null,
eura decimal (12.9) not null,
treciputa datetime ,
ostavljena int not null
);

create table punica (
sifra int not null primary key auto_increment,
asocijalno boolean,
kratkamajica varchar(44),
kuna decimal (13.8)not null,
vesta varchar (32) not null,
snasa int
);

create table ostavljena (
sifra int not null primary key auto_increment,
kuna decimal (17.5),
lipa decimal (15.6),
majica varchar (35),
modelnaocala varchar(31) not null,
prijatelj int
);

create table prijatelj (
sifra int not null primary key auto_increment,
kuna decimal (16.10),
haljina varchar (37),
lipa decimal(13.10),
dukserica varchar (31),
indiferentno boolean not null
);

create table brat (
sifra int not null primary key auto_increment,
jmbag char(11),
ogrlica int not null,
ekstrovertno boolean not null
);

create table prijatelj_brat (
sifra int not null primary key auto_increment,
prijatelj int not null,
brat int not null
);

alter table svekar add foreign key (cura) references cura (sifra);
alter table punica add foreign key (snasa) references snasa (sifra);
alter table snasa add foreign key (ostavljena) references ostavljena (sifra);
alter table ostavljena add foreign key (prijatelj) references prijatelj (sifra);
alter table prijatelj_brat add foreign key (prijatelj) references prijatelj (sifra);
alter table prijatelj_brat add foreign key (brat)references brat (sifra);

