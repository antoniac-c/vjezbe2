drop database if exists udruga3;
create database udruga3;
use udruga3;

create table djelatnik (
sifra int not null primary key auto_increment,
ime varchar (50) not null,
prezime varchar (50) not null,
iban int (32)
);
create table zivotinja (
sifra int not null primary key auto_increment,
vrsta varchar (50),
djelatnik int not null,
prostor int
);
create table prostor (
sifra int not null primary key auto_increment,
zivotinja int
);

alter table zivotinja add foreign key (djelatnik) references djelatnik (sifra);
alter table zivotinja add foreign key (prostor) references prostor (sifra);


insert into djelatnik (sifra,ime,prezime) values
('1','marko','peric') ;

select * from djelatnik ;

insert into zivotinja (sifra, vrsta,djelatnik) values
('1','lav','1');

select * from zivotinja;

insert into prostor (sifra,zivotinja) values
('1','1');

select * from prostor;


