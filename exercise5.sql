-- 5.1 Select the name of all the pieces. 
Select name from pieces;
-- 5.2  Select all the providers' data. 
Select * from providers;
-- 5.3 Obtain the average price of each piece (show only the piece code and the average price).
Select piece, avg(price) from provides group by piece;
-- 5.4  Obtain the names of all providers who supply piece 1.
Select pr.Name from provides p join providers pr on p.provider=pr.code where piece=1 ;
-- 5.5 Select the name of pieces provided by provider with code "HAL".
Select p.name from provides ps join pieces p on ps.piece=p.code where provider="HAL"; 
Select name from pieces where code in (select piece from provides where provider="HAL" );
-- 5.6
-- ---------------------------------------------
-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
-- Interesting and important one.
-- For each piece, find the most expensive offering of that piece and include the piece name, provider name, and price 
-- (note that there could be two providers who supply the same piece at the most expensive price).
-- ---------------------------------------------
Select p.name,pr.name,max(prs.price) from provides prs left join pieces p on prs.piece=p.code  left join providers pr on prs.provider=pr.code group by p.name ; 

-- 5.7 Add an entry to the database to indicate that "Skellington Supplies" (code "TNBC") will provide sprockets (code "1") for 7 cents each.
insert into provides values(1,"TNBC",7);
-- 5.8 Increase all prices by one cent.
update provides set price=price+1;
-- 5.9 Update the database to reflect that "Susan Calvin Corp." (code "RBT") will not supply bolts (code 4).
delete from provides where piece=4;
-- 5.10 Update the database to reflect that "Susan Calvin Corp." (code "RBT") will not supply any pieces 
    -- (the provider should still remain in the database).
 delete from provides where provider="RBT";   