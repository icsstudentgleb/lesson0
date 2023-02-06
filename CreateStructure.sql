create table dbo.SKU(
    ID int identity not null
    ,Code as 's' + cast(ID as varchar)
    ,Name varchar(255)
    ,constraint PK_SKU primary key (ID)
    ,constraint UK_SKU_Code unique(Code));

create table dbo.Basket(
    ID int identity not null
    ,ID_SKU int
    ,Quantity int
    ,Value int
    ,PurchaseDate date default getdate()
    ,DiscountValue decimal(18,2)
    ,constraint PK_Basket primary key (ID)
    ,constraint FK_Basket_ID_SKU_SKU foreign key(ID_SKU) references dbo.SKU(ID)
    ,constraint CK_Basket_Quantity_Value check (Quantity > 0 and Value > 0));
    
create table dbo.Family(
    ID int identity not null
    ,SurName varchar(255)
    ,BudgetValue int
    ,constraint PK_Family primary key (ID));