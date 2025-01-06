# Road Safety Analysis

This repository contains SQL scripts and PL/pgSQL procedures designed to manage and analyze road safety data. The data is stored across three tables:

- `Accident`
- `Report`
- `Vehicle_type`

Additionally, various procedures, triggers, and queries are provided for data manipulation and analysis.

---

## Table Structures

### Accident Table
```sql
CREATE TABLE Accident (
    Accident_id INT PRIMARY KEY,
    Location VARCHAR(40),
    Casualties INT,
    Date DATE,
    Time TIME,
    Weather VARCHAR(30)
);
```
#### Sample Data:
```sql
INSERT INTO Accident VALUES
    (1, 'ISKON', 9, '2023-07-15', '12:30:51', 'RAINY'),
    (2, 'SG HIGHWAY', 2, '2021-01-01', '10:05:55', 'WINTER');
```

### Report Table
```sql
CREATE TABLE Report (
    Vehicle_id INT PRIMARY KEY,
    Accident_id INT,
    Driver VARCHAR(30),
    Road VARCHAR(30),
    Characteristics VARCHAR(50),
    FOREIGN KEY (Accident_id) REFERENCES Accident (Accident_id)
);
```
#### Sample Data:
```sql
INSERT INTO Report VALUES
    (142, 15, 'MOHANLAL', 'HIGHWAY', 'UNDER MAINTAINED'),
    (153, 1, 'RAJ PATEL', 'STREET', 'WELL MAINTAINED');
```

### Vehicle_type Table
```sql
CREATE TABLE Vehicle_type (
    Vehicle_id INT PRIMARY KEY,
    Vehicle_type VARCHAR(30),
    Fuel_type VARCHAR(20),
    Insurance VARCHAR(20),
    FOREIGN KEY (Vehicle_id) REFERENCES Report (Vehicle_id)
);
```
#### Sample Data:
```sql
INSERT INTO Vehicle_type VALUES
    (142, 'CAR', 'PETROL', 'YES'),
    (153, 'SCOOTER', 'PETROL', 'NO');
```

---

## Procedures

### Insert Procedures
- **Insert Accident Details:**
  ```sql
  CREATE OR REPLACE PROCEDURE insert_accident_detaile(
      Accident_id INT,
      Location VARCHAR(40),
      Casualties INT,
      Acc_Date DATE,
      Acc_Time TIME,
      Weather VARCHAR(30))
  AS $$
  DECLARE
  BEGIN
      INSERT INTO Accident VALUES (Accident_id, Location, Casualties, Acc_Date, Acc_Time, Weather);
      IF FOUND THEN
          RAISE NOTICE 'Accident detail inserted Successfully...';
      ELSE
          RAISE NOTICE 'Failed to insert Accident detail...';
      END IF;
  END;
  $$ LANGUAGE plpgsql;
  ```
  **Usage:**
  ```sql
  CALL insert_accident_detaile(21, 'ISCON', 2, '2023-12-23', '12:23:56', 'RAINY');
  ```

- Similar procedures are available for `Report` and `Vehicle_type` tables.

### Update Procedures
- **Update Accident Details:**
  ```sql
  CREATE OR REPLACE PROCEDURE Update_accident(
      Id INT,
      loca VARCHAR(40),
      cas INT,
      Acc_date DATE,
      Acc_time TIME,
      Wea VARCHAR(30))
  AS $$
  BEGIN
      UPDATE Accident
      SET Location = loca, Casualties = cas, Weather = Wea, Date = Acc_date, Time = Acc_time
      WHERE Accident_id = Id;
      IF FOUND THEN
          RAISE NOTICE 'Update successfully...';
      ELSE
          RAISE NOTICE 'Failed to update...';
      END IF;
  END;
  $$ LANGUAGE plpgsql;
  ```

### Querying Procedures
- **Find Accident Details by ID:**
  ```sql
  CREATE OR REPLACE PROCEDURE find_accident(Id INT) 
  AS $$
  DECLARE
      acc_id Accident.Accident_id%TYPE;
      loc Accident.Location%TYPE;
      ...
  BEGIN
      ...
  END;
  $$ LANGUAGE plpgsql;
  ```

- **Find Vehicle Details:** Similar procedure is available for vehicles.

---

## Triggers

### Accident ID Validation Trigger
Ensures no negative accident IDs are inserted.
```sql
CREATE OR REPLACE FUNCTION user_value() RETURNS TRIGGER AS $$
BEGIN
    IF NEW.accident_id < 0 THEN
        RAISE 'Less than zero value not allowed';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER checkAccidentid 
BEFORE INSERT ON Accident
FOR EACH ROW 
EXECUTE PROCEDURE user_value();
```

### Date Validation Trigger
Ensures accident date is not in the future.
```sql
CREATE OR REPLACE FUNCTION date_check() RETURNS TRIGGER AS $$
BEGIN
    IF NEW.date > CURRENT_DATE THEN
        RAISE 'Invalid date';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER checkDate 
BEFORE INSERT ON Accident
FOR EACH ROW 
EXECUTE PROCEDURE date_check();
```

---

## Analysis Queries

- **Count Accidents in a Specific Location:**
  ```sql
  SELECT COUNT(*) AS "ISKON_ACCIDENTS" FROM Accident WHERE Location = 'ISKON';
  ```

- **Find Accident Details by Date:**
  ```sql
  CALL find_accident_date('2023-07-15');
  ```
