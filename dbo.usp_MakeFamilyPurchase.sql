create procedure dbo.usp_MakeFamilyPurchase (
    @FamilySurName as varchar(255)
)
as
begin
    declare @BasketPrice int;

    if (not exists (
        select 1 
        from dbo.Family 
        where SurName = @FamilySurName
        )
    )
        raiserror (N'There is no family with surname %s', 18, 1, @FamilySurName);
    
    select @BasketPrice = sum(Value)
    from dbo.Basket;
    
    update dbo.Family
    set BudgetValue = BudgetValue - @BasketPrice
    where SurName = @FamilySurName;
end;