DROP database if exists kol4;
create database kol4;
use kol4;

create table punac (
sifra int not null primary key auto_increment,
treciputa datetime,
majica varchar (46),
jmbag char (11) not null,
novcica decimal (18,7) not null,
maraka decimal (16,2)not null,
ostavljen int not null
);

create table ostavljen (
sifra int not null primary key auto_increment,
modelnaocala varchar (43),
introvertno bit,
kuna decimal(14,10)
);

create table snasa (
sifra int not null primary key auto_increment,
treciputa datetime,
haljina varchar(44)not null,
zena int not null
);

create table becar (
sifra int not null primary key auto_increment,
novcica decimal (14,2),
kratkamajica varchar(48) not null,
bojaociju varchar (36)not null,
snasa int
);

create table zena (
sifra int not null primary key auto_increment,
suknja varchar (36) not null,
lipa decimal (18,7),
prstena int
);

create table mladic (
sifra int not null primary key auto_increment,
kuna decimal (15,9),
lipa decimal (18,5),
nausnica int,
stilfrizura varchar (49),
vesta varchar (34) not null
);

create table zena_mladic (
sifra int not null primary key auto_increment,
zena int not null,
mladic int not null
);

create table prijatelj (
sifra int not null primary key auto_increment,
eura decimal(16,9), 
prstena int not null,
gustoca decimal(16,5),
jmbag char(11) not null,
suknja varchar(47) not null,
becar int not null
);

alter table prijatelj add foreign key (becar) references becar (sifra); 
alter table punac add foreign key (ostavljen) references ostavljen (sifra);
alter table snasa add foreign key (zena) references zena (sifra);
alter table becar add foreign key (snasa) references snasa (sifra);
alter table zena_mladic add foreign key (zena) references zena (sifra);
alter table zena_mladic add foreign key (mladic) references mladic (sifra);


#1 U tablice becar, snasa i zena_mladic unesite po 3 retka. (7)
insert into mladic (vesta) values
('plava'),('zelena'),('crna');
select * from mladic;

insert into zena (suknja) values
('crna'),('�uta'),('crvena');

insert into zena_mladic (zena,mladic) values
(1,1),(2,2),(3,3);

insert into snasa (haljina,zena) values
('plava',1),('crvea',2),('�uta',3);

insert into becar (kratkamajica,bojaociju) values
('crna','plava'),('zelena','zelena'),('�uta','sme�a');

#2. U tablici punac postavite svim zapisima kolonu majica na 
#vrijednost Osijek. (4)
update punac set majica='Osijek';


#3. U tablici prijatelj obri?ite sve zapise ?ija je vrijednost kolone 
#prstena ve?e od 17. (4)
delete  from prijetelj where prstena >17;

#4. Izlistajte haljina iz tablice snasa uz uvjet da vrijednost kolone 
#3treciputa nepoznate. (6)
select  haljina from snasa where treciputa !=null;

#35. Prika?ite nausnica iz tablice mladic, jmbag iz tablice prijatelj te 
#kratkamajica iz tablice becar uz uvjet da su vrijednosti kolone 
#treciputa iz tablice snasa poznate te da su vrijednosti kolone lipa iz 
#tablice zena razli?ite od 29. Podatke poslo?ite po kratkamajica iz 
##3tablice becar silazno. (10)
select m.nausnica, p.jmbag,b.kratkamajica from 
mladic m 
inner join zena_mladic zm on zm.mladic=m.sifra 
inner join zena z on zm.zena=z.sifra
inner join snasa s on s.zena=z.sifra
inner join becar b on b.snasa=s.sifra
inner join prijatelj p on p.becar=b.sifra 
where s.treciputa!= null and z.lipa <>29 order by b.kratkamajica desc ;
