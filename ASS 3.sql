ASSIGNMENT #3

SELECT * FROM JOMATO

--===Tasks to be performed:===


--1. Create a stored procedure to display the restaurant name, type and cuisine where the
-- booking is not zero.

CREATE PROC ST_1
AS
BEGIN
 SELECT restaurantname ,restauranTTYPE , CUISINESTYPE 
 FROM JOMATO WHERE TableBooking IS NOT NULL
END

EXEC ST_1  



--2. Create a transaction and update the cuisine type ‘Cafe’ to ‘Cafeteria’. Check the result
--and rollback it.

BEGIN TRANSACTION

UPDATE JOMATO
SET CuisinesType='CAFETERIA' WHERE CuisinesType='CAFE'

SELECT * FROM JOMATO WHERE CuisinesType ='CAFETERIA'

ROLLBACK;

--3. Generate a row number column and find the top 5 areas with the highest rating of
---restaurants.

SELECT TOP 5 * , RANK () OVER ( ORDER BY RESTAURANTNAME ASC) 
AS RANKING FROM JOMATO


--4. Use the while loop to display the 1 to 50.

CREATE PROC  LOOPS_1
AS
BEGIN
    DECLARE @X INT =1
	 WHILE @X <=50
	 BEGIN 
	 PRINT @X
	 SET @X= @X 
	 END
END

EXEC LOOPS_1

--5. Write a query to Create a Top rating view to store the generated top 5 highest rating of
--restaurants.


CREATE VIEW VIW_1 AS
SELECT TOP 5 RESTAURANTNAME , RATING FROM JOMATO 

 
 SELECT * FROM VIW_1 AS HIGHEST_NO_RATING

--6. Write a trigger that sends an email notification to the restaurant owner whenever a new
--record is inserted.

CREATE TRIGGER TRIG_022 ON EMP FOR INSERT
AS
BEGIN
	INSERT INTO EMP_LOG SELECT EMPNO, SAL, GETDATE(), 'INSERT' FROM inserted
END


CREATE TRIGGER NotifyRestaurantOwner
ON Restaurants
AFTER INSERT
AS
BEGIN
    DECLARE @RestaurantOwnerEmail NVARCHAR(255);
    DECLARE @RestaurantName NVARCHAR(255);

    SELECT @RestaurantOwnerEmail = OwnerEmail, @RestaurantName = RestaurantName 
    FROM inserted;

CREATE TRIGGER TRIG_1 ON JOMATO FOR INSERT
AS
BEGIN

  DECLARE @X NVARCHAR (100)
  DECLARE @Y VARCHAR (100)
  SELECT @X ='EMAIL'
  , @Y = 'RestaurantName' FROM inserted
END

SELECT RestaurantName  FROM INSERTED

