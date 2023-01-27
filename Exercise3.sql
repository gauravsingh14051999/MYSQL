use exercise3;
-- The Warehouse

--3.1 Selects alls warehouses
select  * from warehouses;
--3.2 Select all boxes with a value larger than $150.
select * from boxes where value>150;
--3.3 Select all distinct contents in all the boxes.
select distinct contents from boxes;
--3.4 Select the average value of all the boxes.
Select avg(Value) from boxes;
--3.5 Select the warehouse code and the average value of the boxes in each warehouse.
select warehouse,avg(value) from boxes group by warehouse; 

--3.6 Same as previous exercise, but select only those warehouses where the average value of the boxes is greater than 150.
select warehouse,avg(value) from boxes group by warehouse having avg(value)>150; 

--3.7 Select the code of each box, along with the name of the city the box is located in.
Select b.code,w.location from boxes b join warehouses w on b.Warehouse=w.code; 

--3.8 Select the warehouse codes, along with the number of boxes in each warehouse. 
    -- Optionally, take into account that some warehouses are empty (i.e., the box count should show up as zero, instead of omitting the warehouse from the result).
Select w.code,w.location,
case when count(b.warehouse)>=1 then count(b.warehouse)
else 0 End warehouse_count from boxes b join warehouses w on b.Warehouse=w.code group by b.Warehouse; 

--3.9 Select the codes of all warehouses that are saturated (a warehouse is saturated if the number of boxes in it is larger than the warehouse's capacity);
with a1 as (select code, capacity from warehouses),
a2 as(select count(*) as xyz,warehouse from boxes group by warehouse)
select a1.code from a1 join a2 on a1.code=a2.warehouse where a1.capacity<a2.xyz; 

--3.10 Select the codes of all the boxes located in Chicago.
select b.code from boxes b join warehouses w on b.warehouse=w.code where location="Chicago";

--3.11 Create a new warehouse in New York with a capacity for 3 boxes.
insert into warehouses values (6,"New york",3);
--3.12 Create a new box, with code "H5RT", containing "Papers" with a value of $200, and located in warehouse 2.
Insert into boxes values("H5RT","PApers",200,2);

--3.13 Reduce the value of all boxes by 15%.
update boxes set value=0.85*value;

--3.14 Remove all boxes with a value lower than $100.
Delete from boxes where value<100;

-- 3.15 Remove all boxes from saturated warehouses.

-- 3.16 Add Index for column "Warehouse" in table "boxes"
    -- !!!NOTE!!!: index should NOT be used on small tables in practice
    
    Create index index_ware on boxes(Warehouse);
-- 3.17 Print all the existing indexes
    -- !!!NOTE!!!: index should NOT be used on small tables in practice
    show index from boxes from exercise3;
-- 3.18 Remove (drop) the index you added just
    -- !!!NOTE!!!: index should NOT be used on small tables in practice
    drop index index_war