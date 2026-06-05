select count(*) as payement_count
from
(
  select t1.transaction_id
  from transactions as t1
  join transactions as t2
  ON t1.merchant_id = t2.merchant_id and t1.credit_card_id = t2.credit_card_id and 
  t1.amount = t2.amount and t1.transaction_id !=t2.transaction_id  and EXTRACT(year from t1.transaction_timestamp) = EXTRACT(year from t2.transaction_timestamp) 
  and EXTRACT(month from t1.transaction_timestamp) = EXTRACT(month from t2.transaction_timestamp) and 
  EXTRACT(day from t1.transaction_timestamp) = EXTRACT(day from t2.transaction_timestamp) AND
  EXTRACT(HOUR from t1.transaction_timestamp) = EXTRACT(hour from t2.transaction_timestamp) AND
  EXTRACT(MINUTE from t1.transaction_timestamp) +10 <= EXTRACT(minute from t2.transaction_timestamp)
) t
