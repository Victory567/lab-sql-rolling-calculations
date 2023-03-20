SELECT COUNT(DISTINCT customer_id) AS monthly_active_customers, 
       DATE_FORMAT(payment_date, '%Y-%m') AS month
FROM payment
GROUP BY month
ORDER BY month;

#2

SELECT COUNT(DISTINCT customer.customer_id) AS active_users
FROM customer
INNER JOIN rental ON rental.customer_id = customer.customer_id
WHERE rental.rental_date >= '2005-05-01' AND rental.rental_date < '2005-06-01';

#3
SELECT 
    DATE_FORMAT(rental.rental_date, '%Y-%m') AS month,
    COUNT(DISTINCT rental.customer_id) AS retained_customers
FROM rental
WHERE rental.rental_date >= '2005-05-01' AND rental.rental_date < '2006-06-01'
AND rental.customer_id IN (
    SELECT customer_id
    FROM rental
    WHERE rental_date >= '2005-05-01' AND rental_date < '2006-06-01'
)
GROUP BY DATE_FORMAT(rental.rental_date, '%Y-%m')
ORDER BY month;



