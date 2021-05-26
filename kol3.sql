drop database if exists kol3;
create database kol3;
use kol3;

create table svekar (
sifra int not null primary key auto_increment,
novcica decimal (16.8) not null,
suknja varchar (44) not null,
bojakose varchar (34),
prstena int,
narukvica int not null,
cura int not null
);

select * from svekar;

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

#u tablice snasa, ostavljena i prijatelj_brat unesite po tri retka
 

insert into ostavljena (modelnaocala)values
('dior'),('rayban'),('disel');

select * from ostavljena;
insert into snasa (kuna,eura,ostavljena) values
(20.1,50.2,1),
(30.8,25.3,2),
(51.2,25.5,3);

select * from snasa;

insert into prijatelj (indiferentno) values
(true),(false),(true);

insert into brat (ogrlica,ekstrovertno) values
(1,true),(2,false),(3,false);

insert into prijatelj_brat (prijatelj,brat) values
(1,1),(2,2),(3,3);

#u tablici svekar postavite svima zapisima kolonu suknja na vrijednost osijek

update svekar set suknja = 'Osijek';
select * from svekar ;

# u tablici punica obrišite sve zapise èija je vrijednost kolone kratkamajica jednako AB

delete from punica where kratkamajica ='AB';

#izlistajte majica iz tablice ostavljena uz uvijet da vrijednost kolone lipa 9,10,20,30
#ili 35

select majica from ostavljena where lipa <>9 and 10 and 20 and 30 and 35;
select * from ostavljena ;

#prikažite ekstrovertno iz tablice brat , vesta iz tablice punica
 #te kuna iz tablice snasa uz uvijet da su vrijednosti kolone lipa
#iz tablice ostavljena razlièito od 91 te da su vrijednosti kolone haljina
#iz tablice prijatelj sadrže niz znakova ba. podatke posložiti po
# kuna iz tablice snasa silazno.


select f.ekstrovertno ,a.vesta ,b.kuna 
from punica a inner join snasa b on a.snasa = b.sifra
inner join ostavljena c on b.ostavljena=c.sifra 
inner join prijatelj d on c.prijatelj  =d.sifra 
inner join prijatelj_brat e on e.prijatelj = d.sifra 
inner join brat f on e.brat = f.sifra 
where c.lipa <> '91' and d.haljina like '%ba%'
order by b.snasa desc ;









