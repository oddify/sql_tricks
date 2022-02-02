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

Insert into products VALUES(10,'V_POWER',100,'refineed_oil');
Insert into products VALUES(10,'V_POWER',101,'noodeles');

Insert into products VALUES(11,'woodpik',102,'Keychains');
Insert into products VALUES(11,'woodpik',103,'furniture');

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
    
    
    /* 
        1.What is basic structure of plsql block?
        Declare
        Begin
        Exception
        END;
        
        
        2.What is Exception handling?
            Exception handling in PL/SQL can be adjusted. When an error occurs, the program’s error handling code is included. There are three different sorts of exceptions:

            Pre-defined exceptions are frequent errors that have already been defined. NO DATA FOUND is an example.
            Undefined exceptions are errors that don’t have a name assigned to them.
            User-defined exceptions are handled by the user’s own code.
            
        3.Mention a few predefined exceptions?
            The following are some examples of predefined exceptions:

                NO DATA FOUND: A single-row SELECT statement that returns no data.
                TOO MANY ROWS: A single row SELECT statement that returns many rows.
                INVALID CURSOR: An incorrect cursor operation was performed.
                ZERO DIVIDE: Attempt at zero division.
                
        4.What is a left outer join? example?
            In an outer join, unmatched rows in one or both tables can be returned. LEFT JOIN returns only unmatched rows on left table
            
        5.What are the types of parameters in PL/SQL?
        There are three types of parameters in PL/SQL which are as follows:

            IN: IN parameters allow you to send values to the procedure that is being called, and they can be set to default values. They behave as constants and cannot be changed.
            OUT: OUT arguments must be mentioned because they return a value to the caller. These are uninitialized variables that can’t be used in expressions.
            IN OUT: IN OUT parameters send starting values to a procedure and then return updated values to the caller. These parameters should be treated as initialized variables and given a value.
    
        6.Why do we use Index in a table?
            In a table, we use indexes to allow quick access to rows. For procedures that return a small percentage of a table’s rows, indexes allow faster access to data.
            
         7.Which cursor attributes are the result of a DML statement saved when it is executed?
            The statement’s result is saved in four cursor attributes. The four attributes are: 

            SQL% FOUND 
            SQL% NOTFOUND 
            SQL% ROWCOUNT 
            SQL% ISOPEN
            
        PRACTICAL
        1. join the 2 tables to get the name of company year and yearly sales quantity?
        2. select products which are not in hte yearly sales query. (using left join, or any other way).
        3. Find for each product which year had the highest sales (in that i want you should select company_name, product_id, year and year_sales_qty.)
         
        
    */
