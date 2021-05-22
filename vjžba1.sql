drop database if exists kol1;
create database kol1;
use  kol1;

create table sestra (
sifra int not null primary key auto_increment,
introventno bit,
haljina varchar (31)not null,
maraka decimal (16,6),
hlaæe varchar(45) not null,
narukvica int not null
);

create table svekar (
sifra int not null primary key auto_increment ,
bojaoèiju varchar (40) not null,
prstena int,
dukserica varchar (41),
lipa decimal (13,8),
eura decimal (12,7),
majica varchar (35)
);

create table sestra_svekar (
sifra int not null primary key auto_increment,
sestra int not null,
svekar int not null
);

create table zena (
sifra int not null primary key auto_increment,
treciputa datetime,
hlace varchar(46),
kratkamajica varchar (41) not null,
jmbg char (11) not null,
bojaoèiju varchar (39) not null,
haljina varchar (44),
sestra int not null
);

create table muskarac (
sifra int not null primary key auto_increment,
bojaoèiju varchar (50)not null,
hlace varchar (30),
modelnaocala varchar (43),
maraka decimal (14.5)not null,
zena int not null
);

create table mladic (
sifra int not null primary key auto_increment,
suknja varchar (50) not null,
kuna decimal (16.8) not null,
drugiputa datetime ,
asocijalno bit ,
ekstroventno bit not null,
dukserica varchar (40) not null,
muskarac int 
);

create table punac (
sifra int not null primary key auto_increment,
ogrlica int,
gustoca decimal (14.9),
hlace varchar (41) not null
);

create table cura (
sifra int not null primary key auto_increment,
novcica decimal (16.5) not null,
gustoca decimal (18.6),
lipa decimal(18.6),
ogrlica int not null,
bojakose varchar (38),
suknja varchar(36),
punac int
);

alter table sestra_svekar add foreign key (svekar) references svekar (sifra);
alter table sestra_svekar add foreign key (sestra) references sestra (sifra);
alter table zena add foreign key (sestra) references sestra (sifra);
alter table muskarac add foreign key (zena) references zena (sifra);
alter table cura add foreign key (punac) references punac (sifra);
alter table mladic add foreign key (muskarac) references muskarac (sifra);






