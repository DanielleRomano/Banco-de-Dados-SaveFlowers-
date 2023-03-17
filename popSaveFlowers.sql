create database SaveFlowers;

use SaveFlowers;

create table Empresa(
idEmpresa int primary key auto_increment,
nomeEmpresa varchar(80),
cnpj varchar(18) not null
);

create table Funcionario (
idFuncionario int primary key auto_increment,
nomeFuncionario varchar(60) not null,
emailFuncionario varchar(20),
telefoneFuncionario varchar(10),
cpfFuncionario varchar(14) not null
);

create table Sensor (
idSensor int primary key auto_increment,
tipoSensor varchar(20),
atividadeSensor varchar(10), constraint chkAtividadeSensor check(atividadeSensor in ('Ativo', 'Inativo')),
dataDeInsercao date
);

create table Caminhao (
idCaminhao int primary key auto_increment,
tamanhoCaminhao float,
cargaMaxima float,
placaCaminhao varchar(8)
);

create table CapturaSensores (
idCapturaSensores int primary key auto_increment,
fkSensor int, foreign key(fkSensor) references sensores(idSensor),
fkCaminhao int, foreign key(fkCaminhao) references caminhao(idCaminhao),
temperaturaCapturada decimal,
umidadeCapturada decimal
);

insert into Empresa values
	(null, 'SPTech', '01.001.000/0001-00'),
    (null, 'Starbucks', '02.002.000/0002-00');
    
insert into funcionario values
	(null, 'Augusto Santos', 'augusto.santos@email.com', '98888-8888', '786543678-90'),
    (null, 'Rodrigo Farias', 'rodrigo.farias@email.com', '9777-7777', '456875560-88');
    
insert into Sensor values
	(null, 'temperatura', 'ativo', '2020-02-03'),
    (null, 'umidade', 'ativo', '2021-08-12');
    
insert into Caminhao values 
	(null, 'grande', '340', 'abc1d23'),
    (null, 'medio', '120', 'efg6j89');
    
insert into CapturaSensores values
	(null, 1, 2, 23, 14),
    (null, 2, 1, 5, 24);

    
select * from Empresa;

select * from CapturaSensores order by umidadeCapturada desc;

select nome, telefone from Funcionario;

select * from Sensor where atividadesensor = 'ativo';

select * from Caminhao where placa like '_2';

select nomeEmpresa from Empresa where cnpj <> '000.000.000/0000-00'; 