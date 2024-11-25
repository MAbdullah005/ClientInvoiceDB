CREATE DEFINER=`root`@`localhost` FUNCTION `get_risk_factor_for_client`(
client_id int
) RETURNS int
    READS SQL DATA
BEGIN
  declare risk_factor decimal(9,2) default 0;
  declare invoices_total decimal(9,2);
  declare invoices_count int;
  select count(*),sum(invoice_total)
  into invoices_count,invoices_total	
  from invoices i
  where i.client_id=client_id;
  set risk_factor=invoices_total/invoices_count*5;
RETURN ifnull(risk	_factor,0);
END
