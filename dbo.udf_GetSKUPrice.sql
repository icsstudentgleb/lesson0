create function dbo.udf_GetSKUPrice(
    @ID_SKU as int
)
returns decimal(18,2)
as
begin
    declare @result decimal(18,2);

    select @result = cast(sum(Value) as decimal) / sum(Quantity)
    from dbo.Basket
    where ID_SKU = 1;

    return @result
end;