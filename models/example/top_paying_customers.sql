SELECT cus.firstname, cus.lastname, SUM(ord.netamount) netamount FROM public.customers cus
JOIN public.orders ord USING (customerid)
GROUP BY (cus.customerid)
ORDER BY netamount DESC
