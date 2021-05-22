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
maraka decimal (14.5) not null,
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

#1 unos po tri retka u tablice muskarac,zene i sestra_svekar

insert into sestra (haljina,hlaæe,narukvica) values 
('crna','plava',1),
('bijala','crna',2),
('crvena','smeða',3);
select * from sestra;

insert into zena (kratkamajica,jmbg,bojaoèiju,sestra) values
('žuta',12345678910,'plava',1),
('crvena',12345678911,'zelena',2),
('plava',13456897123,'smeða',3);
select * from zena;


insert into muskarac (bojaoèiju,maraka,zena) values 
('plava',25.50,1),
('zelena',50.10,2),
('smeða',30.55,3);
select * from muskarac;

insert into svekar (bojaoèiju) values
('plava'),
('smeða'),
('zelena');
select * from svekar;

insert into sestra_svekar (sestra,svekar) values 
(1,1),(2,2),(3,3);
select * from sestra_svekar ;

#2 u tablici cura postavite svim zapisima kolonu gustoca na vrijednost
# 15.77

insert into punac (hlace) values 
('plave'),
('smeðe'),
('zelene');
select * from punac;

insert into cura (novcica,gustoca,ogrlica,punac) values
(50.70,100,1,1),
(80.30,100,2,2),
(90.50,100,3,3);
select * from cura;

update cura set gustoca=15.77 where gustoca <>15.77;
select * from cura;

#3 u tablici mladic obrišite sve zapise èija je vrijednost kolone kuna
#veæa od 15.78

delete  from mladic where kuna<15.78;

select * from mladic;

#4 izlsitajte kratka majica iz tablice zena uz uvijetda vrijednost
#kolone hlace sadrži vrijednost ana

select kratkamajica from zena where hlace='ana';

#5 prikažite dukserica iz tablice svekar , asocijalno iz tablice mladic
#hlace iz tablice muskarac uz uvijet da su vrijednosti kolone hlace
#iz tablice zena poèinju slovom a te da su vrijednosti kolone haljina iz 
#tablice sestra sadrže niz znakova ba,podatke posložite po hlace iz
#tablice muskarac silazno

select f.dukserica ,a.asocijalno,b.hlace 
from mladic a inner join muskarac b 
on a.muskarac=b.sifra
inner join zena c on b.zena=c.sifra 
inner join sestra d on c.sestra=d.sifra
inner join sestra_svekar e on e.sestra=d.sifra
inner join svekar f on e.svekar=f.sifra 
where c.hlace like '%a' and d.haljina like '%ba%'order by b.hlace desc ;




















