
use master
go

drop database Vehiculos
go

create database Vehiculos
go

use Vehiculos
go

create table Vehiculo (
	placa varchar(10) primary key,
	marca varchar(50) not null,
	modelo varchar(50) not null,
	año varchar(5) not null,
	cilindraje varchar(20) not null,
	traspaso bit not null,
	precio float not null,
	kilometraje float not null,
	fechaIngreso date default GETDATE() not null,
	vgSoat date not null,
	vgTecno date not null);

go

insert into Vehiculo 
	(placa, marca, modelo, año, cilindraje, traspaso, precio, kilometraje, vgSoat, vgTecno)
	VALUES
		('COI725', 'Chevrolet', 'Spark Life' , '2006', '1000','true', 15500000, 153000, '2023-06-23','2023-05-15');
go

select * from Vehiculo
go

CREATE PROCEDURE USP_REGISTRAR
	@placa varchar(10),
	@marca varchar(50),
	@modelo varchar(50),
	@año varchar(5),
	@cilindraje varchar(20),
	@traspaso bit, 
	@precio float,
	@kilometraje float,
	@vgSoat date,
	@vgTecno date
AS
BEGIN
	INSERT INTO Vehiculo(placa, marca,modelo,año,cilindraje,traspaso,precio,kilometraje,vgSoat,vgTecno)
			VALUES (@placa, @marca,@modelo,@año,@cilindraje,@traspaso,@precio,@kilometraje,@vgSoat,@vgTecno)
	END
GO

EXECUTE USP_REGISTRAR 'COI425','Chevrolet','Spark Life','2006','1000','True',1.55E+07,153000.0,'2023-06-23T00:00:00','2023-05-15T00:00:00'


select* from Vehiculo


CREATE PROCEDURE USP_ACTUALIZAR
	@placa varchar(10),
	@marca varchar(50),
	@modelo varchar(50),
	@año varchar(5),
	@cilindraje varchar(20),
	@traspaso bit, 
	@precio float,
	@kilometraje float,
	@fechaIngreso date,
	@vgSoat date,
	@vgTecno date
AS
BEGIN
	UPDATE Vehiculo SET
		marca=@marca,
		modelo=@modelo,
		año=@año,
		cilindraje=@cilindraje,
		traspaso = @traspaso,
		precio=@precio,
		kilometraje=@kilometraje,
		fechaIngreso=@fechaIngreso,
		vgSoat=@vgSoat,
		vgTecno=@vgTecno
		WHERE placa=@placa
	END
GO

CREATE PROCEDURE USP_ELIMINAR
	@placa varchar(10)
AS
BEGIN
	DELETE FROM Vehiculo where placa=@placa
	END
GO

CREATE PROCEDURE USP_OBTENER
	@placa varchar(10)
AS
BEGIN
	SELECT * FROM Vehiculo where placa=@placa
	END
GO

CREATE PROCEDURE USP_LISTAR
AS
BEGIN
	SELECT * FROM Vehiculo
	END
GO