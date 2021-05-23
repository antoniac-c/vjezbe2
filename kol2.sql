drop database if exists kol2;
create database kol2;
use  kol2;

create table cura (
sifra int not null primary key auto_increment,
haljina varchar (33) not null,
drugiputa datetime not null,
suknja varchar (38),
narukvica int,
introventno bit,
majica varchar(40)not null,
decko int
);

create table decko(
sifra int not null primary key auto_increment,
indiferentno bit,
vesta varchar(34) ,
asocijalno bit not null
);

create table zarucnica(
sifra int not null primary key auto_increment,
narukvica int,
bojakose varchar (37) not null,
novcica decimal (15.9),
lipa decimal (15.8) not null,
indiferentno bit not null
);

create table decko_zarucnica (
sifra int not null primary key auto_increment,
decko int not null,
zarucnica int not null
);

create table neprijatelj (
sifra int not null primary key auto_increment,
majica varchar(32),
haljina varchar (43) not null,
lipa decimal (16.8),
modelnaocala varchar (49)not null,
kuna decimal (12.6) not null,
jmbag char(11),
cura int
);

create table brat (
sifra int not null primary key auto_increment,
suknja varchar (47),
ogrlica int not null,
asocijalno bit not null,
neprijatelj int not null
);

create table prijatelj (
sifra int not null primary key auto_increment,
modelnaocala varchar (50),
treciputa datetime not null,
ekstroventno bit not null,
prviputa datetime,
svekar int not null
);

create table svekar (
sifra int not null primary key auto_increment,
stilfrizura varchar(48),
ogrlica int not null,
asocijalno bit not null
);


alter table neprijatelj add foreign key (cura) references cura (sifra);
alter table brat add foreign key (neprijatelj) references neprijatelj (sifra);
alter table cura add foreign key (decko) references decko (sifra);
alter table decko_zarucnica  add foreign key (decko) references decko (sifra);
alter table decko_zarucnica  add foreign key (zarucnica) references zarucnica (sifra);
alter table prijatelj add foreign key (svekar) references svekar (sifra);


#1 u tablice neprijatelj,cura i decko_zarucnica unesite po 3 retka

insert into cura (haljina,drugiputa,majica) values 
('plava','2021-05-20','crvena'),
('zelena','2021-05-19','žuta'),
('crna','2021-05-18','crna');

insert into decko (asocijalno) values
(true),(true),(false);

insert into zarucnica (bojakose,lipa,indiferentno) values
('plava',20.3,true),
('crna',125.7,true),
('smeða',82.4,false);

insert into decko_zarucnica (decko,zarucnica) values
(1,1),(2,2),(3,3);

insert into neprijatelj (haljina,modelnaocala,kuna) values
('crna','dior',25.5),
('crvena','diesel',30.2),
('plava','guess',15.4);

#2 u tablici prijatelj postavite svim zapisima kolonu treciputa na 
# vrijednost 30.travnja.2020

update  prijatelj set treciputa = '2020-04-30';
select * from prijatelj;

#3 u tablici brat obrišite sve zapise èija je vriednost kolone ogrlica
#razlièito od 14.

delete from brat where ogrlica<>14;

#4 izlistajte suknja iz tablice cura uz uvijet da vrijednost kolone
#drugiputa nepoznate

select  suknja from cura where drugiputa=null;

#5 prikažite novcica iz tablice zarucnica,neprijatelji iz tablice brat
#te haljina iz tablice neprijatelj uz uvijetda su vrijednosti kolne
#drugi puta iz tabice cura poznate te da su vrijednosto kolone vesta iz
#tablice decko sadrže niz znakova ba. podatke posložite po haljina iz tablice
#neprijatelj silazno

select a.novcica,f.neprijatelj,e.haljina 
from zarucnica a 
inner join decko_zarucnica b on b.zarucnica=a.sifra
inner join decko c on b.decko=c.sifra
inner join cura d on d.decko=c.sifra
inner join neprijatelj e on e.cura=d.sifra 
inner join brat f on f.neprijatelj=e.sifra 
where d.drugiputa is not null and c.vesta like '%ba%' order by e.haljina 
desc ;



