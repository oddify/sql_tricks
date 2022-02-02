Create table products (Company_id NUMBER,Company_name varchar2(10), Product_id NUMBER,  product_name VARCHAR2(30)); 
--drop table products

Insert into products VALUES(1,'bens',1,'A1_tires');
Insert into products VALUES(1,'bens',2,'NEON_tires');
Insert into products VALUES(1,'bens',3,'B3_tires');

Insert into products VALUES(2,'voltz',4,'A2_battries');
Insert into products VALUES(2,'voltz',5,'A3_battries');

Insert into products VALUES(3,'Glow',6,'neon_tubes');
Insert into products VALUES(3,'Glow',7,'neon_bulbs');
Insert into products VALUES(3,'Glow',8,'glow_sticks');


select * from products
--truncate table products;
--truncate table Yearly_sales

Create table Yearly_sales (Year Number,Product_id NUMBER, YR_sales_qty NUMBER);
Insert into Yearly_sales VALUES(2018,1,500);
Insert into Yearly_sales VALUES(2019,1,400);
Insert into Yearly_sales VALUES(2020,1,900);

Insert into Yearly_sales VALUES(2018,2,1000);
Insert into Yearly_sales VALUES(2019,2,850);
Insert into Yearly_sales VALUES(2020,2,600);

Insert into Yearly_sales VALUES(2018,3,1050);
Insert into Yearly_sales VALUES(2019,3,200);
Insert into Yearly_sales VALUES(2020,3,450);

Insert into Yearly_sales VALUES(2018,4,485);
Insert into Yearly_sales VALUES(2019,4,700);
Insert into Yearly_sales VALUES(2020,4,620);

Insert into Yearly_sales VALUES(2018,5,100);
Insert into Yearly_sales VALUES(2019,5,300);
Insert into Yearly_sales VALUES(2020,5,200);

Insert into Yearly_sales VALUES(2018,6,900);
Insert into Yearly_sales VALUES(2019,6,200);
Insert into Yearly_sales VALUES(2020,6,999);

Insert into Yearly_sales VALUES(2018,7,645);
Insert into Yearly_sales VALUES(2019,7,740);
Insert into Yearly_sales VALUES(2020,7,700);

Insert into Yearly_sales VALUES(2018,8,980);
Insert into Yearly_sales VALUES(2019,8,600);
Insert into Yearly_sales VALUES(2020,8,420);
commit;
select * from yearly_sales;


select p.company_name,p.product_id,p.product_name,ys.year,ys.yr_sales_qty from products p join yearly_sales ys on p.product_id = ys.product_id

select * from
(SELECT
    p.company_name,
    p.product_id,
    p.product_name,
    ys.year,
    ys.yr_sales_qty,
    row_number() over(partition by p.product_id
        order by ys.yr_sales_qty desc )as rn
FROM
         products p
    JOIN yearly_sales ys ON p.product_id = ys.product_id)
    where  rn =1
    order by product_id;
