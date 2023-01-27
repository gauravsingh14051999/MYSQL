-- 10.1 Join table PEOPLE and ADDRESS, but keep only one address information for each person (we don't mind which record we take for each person). 
    -- i.e., the joined table should have the same number of rows as table PEOPLE
    Select name,address from people p left join address a on p.id=a.id group by p.id; 
-- 10.2 Join table PEOPLE and ADDRESS, but ONLY keep the LATEST address information for each person. 
    -- i.e., the joined table should have the same number of rows as table PEOPLE
    With a as 
(SELECT max(a.updatedate) as date ,p.id as id, p.name as name,a.address as address
 FROM address  a join people p on a.id=p.id group by p.id)
 Select address, name,date from a;