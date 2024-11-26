delimiter $$
drop trigger if exists payment_after_delete;
create trigger payment_after_delete
after delete on payments
for each row
begin
   update invoices
   set payment_total=payment_total-old.amount
   where invoice_id=old.invoice_id;
   insert into payment_audit
   values(old.client_id,old.date,old.amount,'delete',now());
end $$
delimiter ;
