-------------------------------------------------------
------------------Road Safety Analysis-----------------
-------------------------------------------------------

-------------create Accident analysis table------------

CREATE TABLE Accident (
   	 Accident_id INT PRIMARY KEY,
   	 Location VARCHAR(40),
     Casualties	INT,
     Date DATE,
     Time TIME,
     Weather VARCHAR(30));

INSERT INTO Accident VALUES
		(1,'ISKON',9, '2023-07-15', '12:30:51', 'RAINY'),
		(2,'SG HIGHWAY',2, '2021-01-01', '10:05:55', 'WINTER'),
		(3,'CG ROAD',0, '2020-05-16', '17:10:20', 'SUNNY'),
		(4,'SBR',3, '2021-06-12', '13:04:26', 'RAINY'),
		(5,'PALDI',7, '2019-05-12', '19:05:30','SUNNY'),
		(6,'SBR',1, '2019-04-10', '11:09:55', 'SUNNY'),
		(7,'VASTRAPUR',4, '2018-09-08', '13:20:41', 'WINTER'),
		(8,'SCIENCE CITY',3, '2021-03-14', '21:05:53', 'SPRING'),
		(9,'BODAKDEV',1, '2019-11-16', '15:19:45', 'WINTER'),
		(10,'SARKHEJ',0, '2022-12-14', '20:46:23', 'WINTER'),
		(11,'SANAND',2, '2019-09-19', '10:20:31', 'FALL'),
		(12,'PRAHALADNAGAR',1, '2022-07-23', '20:25:53', 'RAINY'),
		(13,'BOPAL',5, '2023-02-14', '22:34:28', 'WINTER'),
		(14,'AMBLI',0, '2019-08-17', '02:05:42','RAINY'),
		(15,'BODAKDEV',0, '2022-10-10', '10:01:58', 'FALL'),
		(16,'SARKHEJ',4, '2018-04-21', '08:27:43', 'SPRING'),
		(17,'SCIENCE CITY',0, '2019-05-08', '16:14:15', 'SUNNY'),
		(18,'ISKON',3, '2022-10-11', '06:18:07', 'FALL'),
		(19,'PALDI',3, '2018-07-07', '22:05:42', 'RAINY'),
		(20,'SANAND',6, '2022-03-22', '20:21:36', 'SPRING');
select * from Accident;

-------------------create Report table---------------------

CREATE TABLE Report (
     Vehicle_id INT PRIMARY KEY,
     Accident_id INT,
     Driver VARCHAR(30),
     Road VARCHAR(30),
     Characteristics VARCHAR(50),
     FOREIGN KEY (Accident_id) REFERENCES ACCIDENT (Accident_id));
	 
INSERT INTO Report VALUES
		 (142, 15, 'MOHANLAL', 'HIGHWAY', 'UNDER MAINTAINED'),
		 (153, 1, 'RAJ PATEL', 'STREET', 'WELL MAINTAINED'), 
		 (102, 13, 'SIMRAN SHAH', 'STREET', 'POORLY MAINTAINED'),
		 (170, 18, 'RAJESH SHARMA', 'THREE LANE', 'UNDER DEVELOPED'),
		 (135, 7, 'VRAJ SHAH', 'TWO WAY', 'UNDER DEVELOPED'),
		 (122, 4, 'KESHAV PATEL', 'THREE LANE', 'SEMI CONSTRUCTED'),
		 (169, 10, 'KUNAL ROY', 'HIGHWAY', 'UNDER DEVELOPED'),
		 (182, 14, 'PUJA SHAH', 'STREET', 'POORLY MAINTAINED'),
		 (111, 3, 'KETAN SHARMA', 'TWO LANE', 'WELL DEVELOPED'),
		 (179, 17, 'TIRTH JOSHI', 'TWO LANE', 'FULLY DEVELOPED'),
		 (124, 9, 'MAHI SHAH', 'STREET', 'WELL MAINTAINED'),
		 (108, 20, 'GAURI AHIJA', 'HIGHWAY', 'POORLY DEVELOPED'),
		 (133, 12, 'DEV RAINA', 'TWO LANE', 'UNDER MAINTAINED'),
		 (157, 2, 'PRITESH DAVE', 'HIGHWAY', 'FULLY DEVELOPED'),
		 (141, 6, 'HONEY PATEL', 'THREE LANE', 'SEMI DEVELOPED'),
		 (113, 11, 'MAHESH BHATT', 'HIGHWAY', 'UNDER DEVELOPED'),
		 (163, 16, 'MUKESH DOSHI', 'HIGHWAY', 'UNDER DEVELOPED'),
		 (116, 19, 'ZEEL SHAH', 'TWO LANE', 'UNDER MAINTAINED'),
		 (174, 5, 'RAJESH JOSHI', 'TWO LANE', 'SEMI DEVELOPED'),
		 (191, 8, 'HARDIK SHARMA', 'THREE LANE', 'WELL DEVELOPED');
select * from report;

-------------------create Vehicle type table---------------------

CREATE TABLE Vehicle_type (
   	 Vehicle_id INT PRIMARY KEY,
     Vehicle_type VARCHAR(30),
     Fuel_type VARCHAR(20),
     Insurance VARCHAR(20),
     FOREIGN KEY (Vehicle_id) REFERENCES REPORT (Vehicle_id));
	 
INSERT INTO Vehicle_type VALUES
		 (142, 'CAR', 'PETROL', 'YES'),
		 (153, 'SCOOTER', 'PETROL', 'NO'),
		 (102, 'BIKE', 'PETROL', 'YES'),
		 (170, 'SCOOTER', 'PETROL', 'YES'),
		 (135, 'CAR', 'CNG', 'NO'),
		 (122, 'BIKE', 'PETROL', 'NO'),
		 (169, 'TRUCK', 'DIESEL', 'NO'),
		 (182, 'CAR', 'DIESEL', 'YES'),
		 (111, 'SCOOTER', 'PETROL', 'NO'),
		 (179, 'BIKE', 'PETROL', 'YES'),
		 (124, 'TRUCK', 'PETROL', 'NO'),
		 (108, 'CAR', 'PETROL', 'NO'),
		 (133, 'BIKE', 'PETROL', 'YES'),
		 (157, 'TRUCK', 'PETROL', 'YES'),
		 (141, 'CAR', 'DIESEL', 'YES'),
		 (113, 'CAR', 'PETROL', 'NO'),
		 (163, 'SCOOTER', 'PETROL', 'NO'),
		 (116, 'BIKE', 'PETROL', 'NO'),
		 (174, 'SCOOTER', 'PETROL', 'NO'),
		 (191, 'CAR', 'CNG', 'YES');
select * from Vehicle_type;

-------------------------------------------------------
-----------Procedure insert Accident detail------------								

/*create or replace procedure insert_accident_detaile(
	 Accident_id INT,
   	 Location VARCHAR(40),
     Casualties	INT,
     Acc_Date DATE,
     Acc_Time TIME,
     Weather VARCHAR(30)) as $$
declare
begin
	insert into Accident values(Accident_id, Location, Casualties, Acc_Date, Acc_Time, Weather);
	if found then
	Raise Notice 'Accident detail inserted Successfully...';
	else
	Raise Notice 'Failed to insert Accident detail...';
	End if;
End;
$$
language plpgsql;*/

--call insert_accident_detaile(21,'ISCON',2,'2023-12-23','12:23:56','RAINY');
--select * from Accident;

-------------------------------------------------------
-----------Procedure insert Report detail--------------

/*create or replace procedure insert_report_detaile(
	 Vehicle_id INT,
     Accident_id INT,
     Driver VARCHAR(30),
     Road VARCHAR(30),
     Characteristics VARCHAR(50)) as $$
declare
begin
	insert into Report values(Vehicle_id, Accident_id, Driver, Road, Characteristics);
	if found then
	Raise Notice 'Report detail inserted Successfully...';
	else
	Raise Notice 'Failed to insert report detail...';
	End if;
End;
$$
language plpgsql;*/

--call insert_report_detaile(199,21,'MEET PATEL','HIGHWAY','UNDER MAINTAINED');
--select * from report;

-------------------------------------------------------
-----------Procedure insert Vehicle detail-------------

/*create or replace procedure insert_vehicle_detaile(
	 Vehicle_id INT,
     Vehicle_type VARCHAR(30),
     Fuel_type VARCHAR(20),
     Insurance VARCHAR(20)) as $$
declare
begin
	insert into Vehicle_type values(Vehicle_id, Vehicle_type, Fuel_type, Insurance);
	if found then
	Raise Notice 'Vehicle detail inserted Successfully...';
	else
	Raise Notice 'Failed to insert vehicle detail...';
	End if;
End;
$$
language plpgsql;*/

--call insert_vehicle_detaile(199,'BIKE','PETROL','YES');
--select * from Vehicle_type;

-------------------------------------------------------
---------------- find accident detail------------------
/*create or replace procedure find_accident(Id int) 
AS $$
declare
 acc_id Accident.Accident_id%type;
 loc Accident.Location%type;
 cas Accident.Casualties%type;
 date1 Accident.Date%type;
 time1 Accident.Time%type;
 weather1 Accident.Weather%type;
 Accident_cursor cursor for select * from Accident where Accident_id=Id;
 BEGIN
 open Accident_cursor;
 loop
 fetch Accident_cursor into acc_id,loc,cas,date1,time1,weather1;
 Exit when not found;
 raise notice 'accidnet_id : % ,location : % ,casualties : % ,date : % ,time : % ,weather : %',acc_id,loc,cas,date1,time1,weather1;
 end loop;
 close Accident_cursor;
End;
$$
language plpgsql;*/
 
--call find_accident(1);

-------------------------------------------------------
--------------------display report---------------------

/*do 
$$
declare
vehicle_id Report.Vehicle_id%type;
accident_id Report.Accident_id%type;
driver Report.Driver%type;
road Report.Road%type;
characteristics Report.Characteristics%type;
Report_cursor cursor for select * from Report;
 begin
 open Report_cursor;
 loop
 fetch Report_cursor into vehicle_id,accident_id,driver,road;
 exit when not found;
 raise notice 'vehicle_id: %,accident_id: %,driver: %,road : %,characteristics: %',vehicle_id,accident_id,driver,road,characteristics;
 end loop;
 close Report_cursor;
 end;
 $$*/

-------------------------------------------------------
-----------------find vehicle detail-------------------
/*create or replace procedure find_vehicle(Id int) 
AS $$
declare
 vehicle_type1 Vehicle_type.Vehicle_type% TYPE;
 fuel_type1 Vehicle_type.Fuel_type% TYPE;
 insurance1 Vehicle_type.Insurance% TYPE;
BEGIN
 SELECT vehicle_type,fuel_type,insurance into vehicle_type1,fuel_type1,insurance1 from vehicle_type WHERE VEHICLE_ID=Id;
 raise notice 'vehicle_type: %,fuel_type: %,insurance: %',vehicle_type1,fuel_type1,insurance1;
end;
$$
language plpgsql;*/

-- 	call find_vehicle(199);

-------------------------------------------------------
------------------Update accident detail---------------

/*create or replace procedure Update_accident(
	 Id int,
     loca VARCHAR(40),
     cas	INT,
     Acc_date DATE,
     Acc_time TIME,
     Wea VARCHAR(30)) 
AS $$
 BEGIN
 Update Accident set location = loca,Casualties = cas,Weather=wea,Date=Acc_date,Time=Acc_time where Accident_id=ID;
 if found then
 raise notice 'Update successfully...';
 else
 Raise Notice 'Failed to update...';
 End if;
End;
$$
language plpgsql;*/

--call Update_accident(1,'Narol','3','2023-07-15','01:12:23','SUNNY');
--select * from Accident;

-------------------------------------------------------
------------------Update Report detail-----------------

/*create or replace procedure Update_report(
	 Id int,
     Driver2 VARCHAR(30),
     Road2 VARCHAR(30),
     Characteristics2 VARCHAR(50))
AS $$
BEGIN
 Update Report set Driver=Driver2,Road=Road2,Characteristics=Characteristics2 where Vehicle_id=ID;
 if found then
 raise notice 'Update successfully...';
 else
 Raise Notice 'Failed to update...';
 End if;
End;
$$
language plpgsql;*/

--call update_report(142,'HARDIK PATEL','TWO WAY','UNDER DEVELOPED');
--select * from report;

-------------------------------------------------------
------------------Update vehicle detail----------------

/*create or replace procedure Update_vehicle(
	 Id int,
     Vehicle_type2 VARCHAR(30),
     Fuel_type2 VARCHAR(20),
     Insurance2 VARCHAR(20))
AS $$
BEGIN
 Update Vehicle_type set Vehicle_type=Vehicle_type2,Fuel_type= Fuel_type2,Insurance= Insurance2 where Vehicle_id=ID;
 if found then
 raise notice 'Update successfully...';
 else
 Raise Notice 'Failed to update...';
 End if;
End;
$$
language plpgsql;*/

--call Update_vehicle(142,'BIKE','PETROL','NO');
--select * from Vehicle_type;

-------------------------------------------------------
-------------- find accident detail by date------------
/*create or replace procedure find_accident_date(Acc_date DATE) 
AS $$
declare
 acc_id Accident.Accident_id%type;
 loc Accident.Location%type;
 cas Accident.Casualties%type;
 date1 Accident.Date%type;
 time1 Accident.Time%type;
 weather1 Accident.Weather%type;
 date_cursor cursor for select * from Accident where Date=Acc_date;
 BEGIN
 open date_cursor;
 loop
 fetch date_cursor into acc_id,loc,cas,date1,time1,weather1;
 Exit when not found;
 raise notice 'accidnet_id : % ,location : % ,casualties : % ,date : % ,time : % ,weather : %',acc_id,loc,cas,date1,time1,weather1;
 end loop;
 close date_cursor;
End;
$$
language plpgsql;*/
 
--call find_accident_date('2023-07-15');


-------------------------------------------------------
-------------Count accident in area--------------------

--SELECT COUNT(*)AS "ISKON_ACCIDENTS" FROM ACCIDENT WHERE LOCATION='ISKON';


-------------------------------------------------------

-------------------------------------------------------
------------Trigger for Accident Table-----------------

/*create or replace function user_value() returns trigger as 
$$
Begin
 if new.accident_id<0 then 
 Raise 'less than zero value not allowed';
 end if;
 return New;
 end;
$$
language plpgsql;*/

/*create trigger checkAccidentid 
before insert on accident
for each row 
execute procedure user_value();*/

--insert into Accident values(-1,'Amreli',3, '2018-07-07', '22:05:42', 'RAINY'),(22,'SANAND',6, '2022-03-22', '20:21:36', 'SPRING');


-------------------------------------------------------
------------Date Trigger for Accident Table-----------------

/*create or replace function date_check() returns trigger as 
$$
Begin
 if new.date>current_date then 
 Raise 'Invalid date';
 end if;
 return New;
 end;
$$
language plpgsql;

create trigger checkDate 
before insert on accident
for each row 
execute procedure date_check();*/

--insert into Accident values(101,'Amreli',3, '2023-10-12', '22:05:42', 'RAINY');
