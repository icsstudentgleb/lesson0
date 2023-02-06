create or alter trigger dbo.TR_Basket_insert_update
on dbo.Basket
after insert
as
with DiscountSKU as (
    select ID_SKU
    from inserted
    group by ID_SKU
    having count(1) > 1
)
update dbo.Basket 
set DiscountValue = iif(ID_SKU in (select ID_SKU from DiscountSKU), Value * cast(5 as decimal) / 100, 0)
where ID in (select ID from inserted);