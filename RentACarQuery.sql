create database RentACar

--

use RentACar

CREATE TABLE [Types](
	Id int IDENTITY(1,1) PRIMARY KEY,
	[Type] nvarchar(64) NOT NULL,
	SummerTariff decimal(10,2) NOT NULL,
	WinterTariff decimal(10,2) NOT NULL
)

CREATE TABLE Vehicles(
	Id int IDENTITY(1,1) PRIMARY KEY,
	Brand nvarchar(64) NOT NULL,
	Model nvarchar(64) NOT NULL,
	[Group] nvarchar(64) NOT NULL,
	Kilometrage dec(16,2) NOT NULL,
	TypeId int FOREIGN KEY REFERENCES [Types](Id) NOT NULL
)

CREATE TABLE Registrations(
	Id int IDENTITY(1,1) PRIMARY KEY,
	RegistrationDate datetime2 NOT NULL,
	RegistrationExpiry datetime2,
	Registration nvarchar(64) NOT NULL,
	VehicleId int FOREIGN KEY REFERENCES Vehicles(Id) NOT NULL
)

CREATE TABLE Employees(
	Id int IDENTITY(1,1) PRIMARY KEY,
	PayPerMonth dec NOT NULL,
	FirstName nvarchar(32) NOT NULL,
	LastName nvarchar(32) NOT NULL,
	OIB nvarchar(11) NOT NULL,
)

CREATE TABLE Leases(
	Id int IDENTITY(1,1) PRIMARY KEY,
	StartTime datetime2 NOT NULL,
	EndTime datetime2 NOT NULL,

	LesseeFirstName nvarchar(32) NOT NULL,
	LesseeLastName nvarchar(32) NOT NULL,
	LesseeOIB nvarchar(11) NOT NULL,
	LesseeDateOfBirth datetime2 NOT NULL,
	LesseeLicence nvarchar(11) NOT NULL,
	LesseeCreditCardNumber nvarchar(24) NOT NULL,

	VehicleId int FOREIGN KEY REFERENCES Vehicles(Id) NOT NULL,
	EmployeeId int FOREIGN KEY REFERENCES Employees(Id) NOT NULL
)

insert into Employees(FirstName, LastName, OIB, PayPerMonth) VALUES
('Viktorija', 'Slavenic', '27382570741', 5000),
('Mario', 'Cindric', '60085059820', 4500),
('Karla', 'Pavicic', '42988828407', 4750.50),
('Mihovil', 'Milic', '11455145500', 5133.75),
('Mihael', 'Delic', '88507976585', 4900.67)

insert into [Types]([Type], SummerTariff, WinterTariff) VALUES
('Economy', 103, 78),
('Compact', 195, 150),
('Standard', 261.4, 220),
('Full Size', 199, 120),
('Luxury', 580, 500),
('SUV', 150, 103.2),
('Scooter', 60, 40)

insert into Vehicles(Brand, Model, [Group], Kilometrage, TypeId) VALUES
('Mercedes', 'A-Class', 'Car', 196503.2, 1),
('Hyundai', 'i20', 'Car', 135234, 1),
('Toyota', 'Auris', 'Car', 90000, 2),
('Volkswagen', 'Polo', 'Car', 78300, 1),
('Volkswagen', 'Passat', 'Car', 134800.5, 4),
('Skoda', 'Octavia', 'Car', 102000, 3),
('Kia', 'Sportage', 'Car', 230670, 6),
('Volkswagen', 'Golf', 'Car', 300000, 3),
('BMW', '1series', 'Car', 123756, 2),
('Toyota', 'Avensis', 'Car', 100546, 4),
('Piaggio', 'Typhoon 50', 'Scooter', 45000, 7),
('Mercedes', 'C-Class', 'Car', 200567, 4),
('Mercedes', 'E-Class', 'Car', 93423, 4),
('Skoda', 'Octavia', 'Car', 109030, 3),
('Kia', 'Sportage', 'Car', 67000, 6),
('Piaggio', 'Beverly 300', 'Scooter', 100200.5, 7),
('Yamaha', 'T-MAX 500', 'Scooter', 134000, 7),
('Land Rover', 'Discovery', 'Car', 230000, 6),
('Porsche', 'Carrera 4S 992', 'Car', 50000, 5),
('Audi', 'RS5', 'Car', 45002, 5)

insert into Registrations(RegistrationDate, RegistrationExpiry, Registration, VehicleId) VALUES
('2017-12-12', null, 'DA-2567-NE', 1),
('2018-12-13', null, 'DA-2567-NE', 1),
('2019-12-16', null, 'DA-2567-NE', 1),
('2020-12-18', '2021-12-18', 'DA-2567-NE', 1),
('2020-01-03', '2021-01-03', 'DA-8452-OP', 20),
('2020-10-04', '2021-10-04', 'ST-3121-NA', 3),
('2020-09-09', '2021-09-09', 'DU-632-RE', 2),
('2019-07-30', null, 'ST-3420-BU', 4),
('2018-07-21', '2019-07-21', 'ST-3420-BU', 4),
('2016-04-01', '2017-04-01', 'PU-555-RR', 5),
('2020-07-23', '2021-07-23', 'DA-3321-VU', 7),
('2020-03-21', '2021-03-21', 'DA-8345-VT', 6),
('2019-12-10', '2020-12-10', 'DA-4561-NH', 9),
('2020-06-14', '2021-06-14', 'ST-8672-UU', 11),
('2020-07-11', '2021-07-11', 'DA-007-HN', 15),
('2020-04-07', '2021-04-07', 'DA-4652-BT', 13),
('2020-02-14', '2021-02-14', 'DA-999-GT', 19),
('2020-01-16', '2021-01-16', 'ZG-144-BG', 8),
('2018-06-07', null, 'ST-3612-HN', 12),
('2019-06-25', '2020-06-25', 'ST-4842-GP', 12),
('2020-12-12', '2021-12-12', 'ST-111-JB', 14),
('2018-05-03', '2019-05-03', 'DA-2100-EZ', 17),
('2019-11-22', '2020-11-22', 'ST-2211-JM', 16),
('2018-04-02', null, 'DA-6599-VA', 18),
('2019-04-10', '2020-04-10', 'DA-6599-VA', 18)

INSERT INTO Leases(StartTime, EndTime, LesseeFirstName, LesseeLastName,
LesseeOIB, LesseeDateOfBirth, LesseeLicence, LesseeCreditCardNumber, VehicleId, EmployeeId) VALUES
('2020-12-15 10:00', '2020-12-16 17:00', 'Damir', 'Tokic', '05040101613', '1972-04-01', '654383917', '4556783828436197', 2, 4),
('2021-01-07 09:00', '2021-01-14 17:30', 'Karlo', 'Paulic', '58101156845', '1980-11-18', '957847812', '4929908328610849', 6, 1),
('2019-10-25 08:30', '2019-10-25 12:45', 'Velimir', 'Tomas', '27480846608', '1990-03-04', '380542955', '375928647557593', 7, 3),
('2020-10-17 14:00', '2020-10-23 12:00', 'Tihana', 'Beljan', '56394888042', '1986-12-25', '345754551', '344115209990432', 13, 2),
('2020-06-21 09:45', '2020-06-23 10:00', 'David', 'Visnjic', '46297669097', '1964-09-17', '661556494', '6011809108678051', 2, 1),
('2020-07-11 10:00', '2020-07-12 09:00', 'Damir', 'Dukic', '14732859645', '1988-01-29', '32571979', '5590523544946532', 3, 5),
('2020-09-18 12:20', '2020-09-20 17:00', 'Ivo', 'Matenda', '16225190119', '1996-08-20', '187943556', '5514661003733570', 11, 5),
('2020-01-29 11:35', '2020-01-31 13:00', 'Igor', 'Tunjic', '86363325783', '1960-09-13', '749873842', '5118562927646973', 11, 5),
('2019-03-11 17:00', '2019-03-16 19:00', 'Helena', 'Brlek', '00419399474', '1992-07-28', '225785523', '4556584613101107', 9, 1),
('2018-07-22 20:00', '2018-07-23 09:00', 'Marta', 'Dosen', '90648036551', '1978-09-20', '519750990', '4024007127159654', 18, 2),
('2019-03-06 15:00', '2019-03-08 19:00', 'Magdalena', 'Vojnovic', '48872188335', '1967-08-05', '232260873', '4556785778639258', 1, 2),
('2020-08-22 13:00', '2020-08-22 18:00', 'Ena', 'Perak', '56954232395', '1979-01-17', '488842478', '376065886390417', 1, 3),
('2019-12-07 11:00', '2019-12-10 10:30', 'Antonio', 'Zizic', '30740755429', '1977-10-09', '293141657', '6011850178312353', 7, 3),
('2020-07-30 12:00', '2020-07-30 19:00', 'Branislav', 'Mikulcic', '81188102100', '1997-04-12', '91201138', '4532317533933518', 15, 1),
('2020-10-28 09:00', '2020-10-29 10:00', 'Viktorija', 'Herceg', '93176654310', '1989-03-16', '521323905', '6011477384775619', 14, 3),
('2018-02-20 14:45', '2018-02-23 10:20', 'Mirko', 'Skrlec', '47216389223', '1996-08-20', '738300444', '4024007126491496', 1, 1),
('2018-05-09 12:25', '2018-05-09 19:30', 'Adam', 'Cvitanovic', '33598347963', '1982-03-31', '632059714', '5372991371516393', 20, 2),
('2018-02-26 10:30', '2018-02-27 09:30', 'Dino', 'Baric', '94439592153', '1987-07-08', '161130165', '347557209987792', 4, 5),
('2019-05-26 16:00', '2019-05-29 15:00', 'Tea', 'Zekic', '91016027450', '1963-06-07', '858940581', '379882516976382', 20, 4),
('2019-08-02 08:00', '2019-08-03 09:45', 'Luka', 'Celina', '41019973238', '1971-09-15', '91201138', '376065886390417', 9, 4),
('2020-12-12 08:45', '2020-12-17 17:00', 'Marija', 'Milardovic', '27814741709', '1999-02-09', '381528850', '5558631762738257', 6, 5),
('2020-12-27 18:30', '2020-12-28 15:30', 'Anita', 'Gavran', '08897116317', '1987-01-15', '529666140', '4556692620377816', 8, 3),
('2019-07-28 14:00', '2019-07-29 13:00', 'Eva', 'Susak', '23038474010', '1990-08-30', '125058358', '4024007106010696', 18, 5),
('2018-06-28 10:30', '2018-06-29 09:30', 'Dino', 'Baric', '94439592153', '1987-07-08', '161130165', '347557209987792', 7, 5)



SELECT v.Id, v.Brand, v.Model, r.RegistrationExpiry FROM Vehicles v
JOIN Registrations r ON r.VehicleId = v.Id
WHERE RegistrationExpiry < GETDATE()
ORDER BY v.Id



SELECT v.Id, v.Brand, v.Model, r.RegistrationExpiry FROM Vehicles v
JOIN Registrations r ON r.VehicleId = v.Id
WHERE RegistrationExpiry BETWEEN GETDATE() AND DATEADD(month, 1, GETDATE())
ORDER BY v.Id



SELECT v.[Group], COUNT(*) AS NumberOfVehiclesInGroup FROM Vehicles v
GROUP BY v.[Group]



SELECT TOP 5 l.Id AS LeaseId, l.StartTime, l.EndTime, l.LesseeFirstName, l.LesseeLastName, l.EmployeeId FROM Leases l
JOIN Employees e ON e.Id = l.EmployeeId
WHERE e.Id = 5
ORDER BY l.StartTime DESC



DECLARE @TempDate datetime2, @Limit datetime2, @TotalLeaseCost DECIMAL, @SummerTariff DECIMAL, @WinterTariff DECIMAL

SELECT @TempDate = l.StartTime, @Limit = l.EndTime, @TotalLeaseCost = 0.00, 
@SummerTariff = t.SummerTariff, @WinterTariff = t.WinterTariff 
FROM Leases l
JOIN Vehicles v ON l.VehicleId = v.Id
JOIN [Types] t ON t.Id = v.TypeId
WHERE l.Id = 5

WHILE(@TempDate <= @Limit)
BEGIN
	DECLARE @SummerTariffStart datetime2, @SummerTariffEnd datetime2

	SET @SummerTariffStart = CAST(DATEADD(year, DATEPART(year, @TempDate) - 2010, CONVERT(datetime2, '2010-03-01')) AS datetime2)
	SET @SummerTariffEnd = CAST(DATEADD(year, DATEPART(year, @TempDate) - 2010, CONVERT(datetime2, '2010-10-01')) AS datetime2)

	IF(@TempDate BETWEEN @SummerTariffStart AND @SummerTariffEnd)
		SET @TotalLeaseCost = @TotalLeaseCost + @SummerTariff/2
	ELSE
		SET @TotalLeaseCost = @TotalLeaseCost + @WinterTariff/2

	SET @TempDate = CAST(DATEADD(hour, 12, @TempDate) AS datetime2)
END

SELECT @TotalLeaseCost AS LeaseCost



SELECT DISTINCT l.LesseeFirstName, l.LesseeLastName, l.LesseeOIB FROM Leases l



SELECT e.Id AS EmployeeId, MAX(l.StartTime) AS LatestLease FROM Employees e
JOIN Leases l ON l.EmployeeId = e.Id
GROUP BY e.Id



SELECT v.Brand, COUNT(*) FROM Vehicles v
GROUP BY v.Brand



SELECT * INTO LeasesWithCosts FROM Leases l
ALTER TABLE LeasesWithCosts ADD TotalLeaseCost DECIMAL

DECLARE @Counter INT, @NumberOfLeases INT

SELECT @Counter = MIN(l.Id), @NumberOfLeases = MAX(l.Id) FROM Leases l

WHILE(@Counter < @NumberOfLeases)
BEGIN
	DECLARE @TempDate2 datetime2, @Limit2 datetime2, @TotalLeaseCost2 DECIMAL, @SummerTariff2 DECIMAL, @WinterTariff2 DECIMAL

	SELECT @TempDate2 = l.StartTime, @Limit2 = l.EndTime, @TotalLeaseCost2 = 0.00, 
	@SummerTariff2 = t.SummerTariff, @WinterTariff2 = t.WinterTariff
	FROM Leases l
	JOIN Vehicles v ON l.VehicleId = v.Id
	JOIN [Types] t ON t.Id = v.TypeId
	WHERE l.Id = @Counter

	WHILE(@TempDate2 <= @Limit2)
	BEGIN
		DECLARE @SummerTariffStart2 datetime2, @SummerTariffEnd2 datetime2

		SET @SummerTariffStart2 = CAST(DATEADD(year, DATEPART(year, @TempDate2) - 2010, CONVERT(datetime2, '2010-03-01')) AS datetime2)
		SET @SummerTariffEnd2 = CAST(DATEADD(year, DATEPART(year, @TempDate2) - 2010, CONVERT(datetime2, '2010-10-01')) AS datetime2)

		IF(@TempDate2 BETWEEN @SummerTariffStart2 AND @SummerTariffEnd2)
			SET @TotalLeaseCost2 = @TotalLeaseCost2 + @SummerTariff2/2
		ELSE
			SET @TotalLeaseCost2 = @TotalLeaseCost2 + @WinterTariff2/2

		SET @TempDate2 = CAST(DATEADD(hour, 12, @TempDate2) AS datetime2)
	END

	UPDATE LeasesWithCosts
	SET TotalLeaseCost = @TotalLeaseCost2
	WHERE LeasesWithCosts.Id = @Counter

	SET @Counter = @Counter + 1
END

SELECT * FROM LeasesWithCosts



CREATE TABLE TempTable(
	[Month] INT,
	NumberOfLeases INT
)

DECLARE @TempDate3 datetime2
SET @TempDate3 = CONVERT(datetime2, '2020-01-01')

WHILE(@TempDate3 < CONVERT(datetime2, '2021-01-01'))
BEGIN
	INSERT INTO TempTable([Month], NumberOfLeases)
	SELECT DATEPART(MONTH, @TempDate3) AS [Month], COUNT(*) AS NumberOfLeases FROM Leases l
	WHERE l.StartTime BETWEEN @TempDate3 AND CAST(DATEADD(month, 1, @TempDate3) AS datetime2)

	SET @TempDate3 = CAST(DATEADD(month, 1, @TempDate3) AS datetime2)
END

SELECT * FROM TempTable
DROP TABLE TempTable



SELECT r.VehicleId, v.Brand, v.Model,
CASE
	WHEN r.RegistrationExpiry BETWEEN GETDATE() AND DATEADD(month, 1, GETDATE()) THEN 'Treba registraciju'
	WHEN r.RegistrationExpiry NOT BETWEEN GETDATE() AND DATEADD(month, 1, GETDATE()) THEN 'Ne treba registraciju'
END AS NeedsRegistration
FROM Registrations r
JOIN Vehicles v ON v.Id = r.VehicleId
WHERE v.[Group] = 'Car' AND r.RegistrationExpiry IS NOT NULL
ORDER BY r.VehicleId



SELECT v.[Group] AS VehicleGroup, COUNT(l.Id) AS NumberOfLeasesOverAverageDuration FROM Leases l
JOIN Vehicles v ON v.Id = l.VehicleId
WHERE DATEDIFF(hour, l.StartTime, l.EndTime) > (
	SELECT AVG(DATEDIFF(hour, l.StartTime, l.EndTime)) FROM Leases l
)
GROUP BY v.[Group]