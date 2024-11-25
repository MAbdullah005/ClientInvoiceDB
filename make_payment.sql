delimiter $$
drop procedure if exists make_payment;
create procedure make_payment
(
  invoice_id int,payment_amouth decimal(9,2),payment_date date
)
begin
if payment_amouth<0 then 
  signal sqlstate '22003'
  set Message_text='invalid payment amouth';
  end if;
update invoices i
set
 i.payment_total=payment_amouth,
 i.payment_date=payment_date
 where i.invoice_id=invoice_id;
 end $$
 delimiter ;
