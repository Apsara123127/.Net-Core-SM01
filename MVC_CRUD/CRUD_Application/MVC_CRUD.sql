Create database MVC_CRUD
use MVC_CRUD

Create table Departments(
DepartmentId int primary key identity(1,1),
DepartmentName varchar(100) not null
);

Insert into Departments (DepartmentName) values ('Electronics');
Insert into Departments (DepartmentName) values ('Clothing');
Insert into Departments (DepartmentName) values ('Books');

select*from Departments

Create table Products(
ProductId int primary key identity(1,1),
ProductName varchar(100) not null,
Price decimal(10,2) not null,
DepartmentId int foreign key references Departments(DepartmentId)
);

Insert into Products (ProductName, Price, DepartmentId) values ('Laptop', 999.99, 1);
Insert into Products (ProductName, Price, DepartmentId) values ('T-Shirt', 199.99, 2);
Insert into Products (ProductName, Price, DepartmentId) values ('Jeans', 989.99, 2);
Insert into Products (ProductName, Price, DepartmentId) values ('Ram c/o Anandhi', 399.99, 3);
Insert into Products (ProductName, Price, DepartmentId) values ('Wings of Fire ', 299.99, 3);


select * from Products

Create procedure GetProductsByDepartment
@DepartmentId int
as
begin
select ProductId, ProductName, Price from Products where DepartmentId = @DepartmentId;
end;

exec GetProductsByDepartment @DepartmentId = 3;

