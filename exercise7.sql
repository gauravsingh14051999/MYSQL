-- 7.1 Who receieved a 1.5kg package?
    -- The result is "Al Gore's Head".
    Select c.Name from package p join  client c on p.recipient=c.AccountNumber where p.weight=1.5;
-- 7.2 What is the total weight of all the packages that he sent?
select sum(Weight) as Total_Weight from package where sender=2;
