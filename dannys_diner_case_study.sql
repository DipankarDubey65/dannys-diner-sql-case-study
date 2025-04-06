/* --------------------
   Case Study Questions
   --------------------*/

-- 1. What is the total amount each customer spent at the restaurant?
SELECT 
    s.customer_id, SUM(price)
FROM
    sales s
        JOIN
    menu m ON s.product_id = m.product_id
GROUP BY customer_id;

-- 2. How many days has each customer visited the restaurant?
SELECT 
    distinct s.customer_id, COUNT(DISTINCT s.order_date) visit_days
FROM
    sales s
GROUP BY s.customer_id;
-- 3. What was the first item from the menu purchased by each customer?
SELECT 
    s.customer_id, m.product_name, s.order_date
FROM
    sales s
        JOIN
    menu m ON s.product_id = m.product_id

ORDER BY s.order_date ASC; 

-- 4. What is the most purchased item on the menu and how many times was it purchased by all customers?
SELECT 
    product_name, MAX(purchase)
FROM
    (SELECT 
        m.product_name AS product_name, COUNT(s.product_id) purchase
    FROM
        menu m
    JOIN sales s ON m.product_id = s.product_id
    GROUP BY m.product_name) AS sub;


-- 5. Which item was the most popular for each customer?

with ranked_product as(select s.customer_id,m.product_name,count(*) purchase_count,
row_number() over( partition by s.customer_id order by count(*) desc) as rnk
from sales s join menu m on s.product_id = m.product_id group by s.customer_id,m.product_name)
select customer_id,product_name,purchase_count from ranked_product where rnk = 1;



-- 6. Which item was purchased first by the customer after they became a member?
with ranked_order as(SELECT 
    s.customer_id, m.product_name, s.order_date, 
    row_number() over(partition by s.customer_id order by order_date asc) rnk 
FROM
    sales s
        JOIN
    menu AS m ON s.product_id = m.product_id
        JOIN
    members mem ON s.customer_id = mem.customer_id
WHERE
    order_date > join_date)
    
    SELECT 
    customer_id, product_name, order_date
FROM
    ranked_order
WHERE
    rnk = 1;
    
-- 7. Which item was purchased just before the customer became a member?
with order_ranked_2 as(select s.customer_id,m.product_name,s.order_date,
row_number() over(partition by s.customer_id order by order_date desc) rnk from sales s 
join menu m on s.product_id = m.product_id 
join members mem on s.customer_id = mem.customer_id
where order_date<join_date)

SELECT 
    customer_id, product_name, order_date
FROM
    order_ranked_2
WHERE
    rnk = 1;
    
-- 8. What is the total items and amount spent for each member before they became a member?
SELECT 
    s.customer_id,
    COUNT(*) total_items,
    SUM(m.price) total_amount
FROM
    sales s
        JOIN
    menu m ON s.product_id = m.product_id
        JOIN
    members mem ON s.customer_id = mem.customer_id
WHERE
    order_date < join_date
GROUP BY s.customer_id;


-- 9.  If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have? yah question to hme bilkul samajh nhi aya
SELECT 
    s.customer_id,
    SUM(CASE
        WHEN m.product_name = 'sushi' THEN 2 * m.price * 10
        ELSE 10 * m.price
    END)  total_points
FROM
    sales s
        JOIN
    menu m ON s.product_id = m.product_id
GROUP BY s.customer_id;

-- 10. In the first week after a customer joins the program (including their join date) they earn 2x points on all items, not just sushi - how many points do customer A and B have at the end of January?
SELECT 
    s.customer_id,
    SUM(CASE
        WHEN s.order_date BETWEEN mem.join_date AND DATE_ADD(mem.join_date, INTERVAL 6 DAY) THEN 2 * m.price * 10
        WHEN m.product_name = 'sushi' THEN 2 * m.price * 10
        ELSE 10 * m.price
    END) total_points
FROM
    sales s
        JOIN
    menu m ON s.product_id = m.product_id
        JOIN
    members mem ON s.customer_id = mem.customer_id
WHERE
    s.order_date <= '2021-01-31'
GROUP BY s.customer_id;
