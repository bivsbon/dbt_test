with daily_revenue as (
	select orderdate date, sum(netamount) netamount, sum(totalamount) totalamount
	from public.orders
	group by (orderdate)
	order by orderdate
)

select date, netamount,
ROUND(AVG(netamount) OVER (ORDER BY date ROWS BETWEEN 4 PRECEDING AND CURRENT ROW), 2) AS ma5
from daily_revenue