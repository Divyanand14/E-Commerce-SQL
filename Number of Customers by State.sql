select State,count(State) as Num_of_Customers
from `ECommerce.customer_data`
group by State
order by  Num_of_Customers desc