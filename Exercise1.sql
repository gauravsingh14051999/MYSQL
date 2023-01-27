use link;
-- 1.1 Select the names of all the products in the store.
Select name from products;


-- 1.2 Select the names and the prices of all the products in the store.
select  name,price from products;

-- 1.3 Select the name of the products with a price less than or equal to $200.
Select name, price from products where price<200;

-- 1.4 Select all the products with a price between $60 and $120.
Select name, price from products where price Between 60 and 200 ;

-- 1.5 Select the name and price in cents (i.e., the price must be multiplied by 100).
Select name, price, (price*100) price_in_cent from products ;

-- 1.6 Compute the average price of all the products.
Select avg(price)  from products;

-- 1.7 Compute the average price of all products with manufacturer code equal to 2.
Select avg(price)  from products where Manufacturer=2;

-- 1.8 Compute the number of products with a price larger than or equal to $180.
select count(name) as no_of_product from products where price>=180;

-- 1.9 Select the name and price of all products with a price larger than or equal to $180, and sort first by price (in descending order), and then by name (in ascending order).
Select name ,price from products where price>=180 order by price desc, name asc;

-- 1.10 Select all the data from the products, including all the data for each product's manufacturer.
Select * from products a cross join manufacturers b on a.manufacturer=b.code;

-- 1.11 Select the product name, price, and manufacturer name of all the products.
Select a.name,a.price, b.name from products a join manufacturers b on a.manufacturer=b.code;

-- 1.12 Select the average price of each manufacturer's products, showing only the manufacturer's code.
Select a.manufacturer, avg(a.price) from products a join manufacturers b on a.manufacturer=b.code group by a.manufacturer;

-- 1.13 Select the average price of each manufacturer's products, showing the manufacturer's name.
Select b.name, avg(a.price) from products a join manufacturers b on a.manufacturer=b.code group by a.manufacturer;

-- 1.14 Select the names of manufacturer whose products have an average price larger than or equal to $150.
Select b.name, avg(a.price) from products a join manufacturers b on a.manufacturer=b.code group by a.manufacturer having avg(price)>=150;

-- 1.15 Select the name and price of the cheapest product.

select name, price from Products 
where price = (
select min(price)
from products);

-- 1.16 Select the name of each manufacturer along with the name and price of its most expensive product.
select b.name,a.name,a.price from products a  join manufacturers b on a.manufacturer=b.code order by price desc ; 
select max_price_mapping.name as manu_name, max_price_mapping.price, products_with_manu_name.name as product_name
from 
    (SELECT Manufacturers.Name, MAX(Price) price
     FROM Products, Manufacturers
     WHERE Manufacturer = Manufacturers.Code
     GROUP BY Manufacturers.Name)
     as max_price_mapping
   left join
     (select products.*, manufacturers.name manu_name
      from products join manufacturers
      on (products.manufacturer = manufacturers.code))
      as products_with_manu_name
 on
   (max_price_mapping.name = products_with_manu_name.manu_name
    and
    max_price_mapping.price = products_with_manu_name.price); 
-- 1.17 Add a new product: Loudspeakers, $70, manufacturer 2.
select * from products;
insert into products (code,name,price,Manufacturer) values (11,"Loudspeaker",70,2);

-- 1.18 Update the name of product 8 to "Laser Printer".
update products set name="Laser Printer" where code=8;

-- 1.19 Apply a 10% discount to all products.
select *, (price-price*(0.1)) as "10%_discount" from products;

-- 1.20 Apply a 10% discount to all products with a price larger than or equal to $120.
Select  *,
case when price>=120 then (price-price*(0.1))
else  price
end as discount
from products;