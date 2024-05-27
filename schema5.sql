-- Максимальный и минимальный credit_limit
SELECT MAX(credit_limit) AS max_credit_limit, MIN(credit_limit) AS min_credit_limit
FROM customers;

-- Покупатели с credit_limit выше среднего
SELECT *
FROM customers
WHERE credit_limit > (SELECT AVG(credit_limit) FROM customers);

-- Количество покупателей, имя которых начинается на букву 'D' и credit_limit больше 500
SELECT COUNT(*) AS count_customers
FROM customers
WHERE first_name LIKE 'D%' AND credit_limit > 500;

-- Среднее значение unit_price:
SELECT AVG(unit_price) AS average_unit_price
FROM order_items;

-- Вывести имена продуктов(PRODUCT_NAME) кол/во(QUANTITY) которых меньше среднего
SELECT p.product_name, oi.quantity
FROM order_items oi
JOIN product_information p ON oi.product_id = p.product_id
WHERE oi.quantity < (SELECT AVG(quantity) FROM order_items);

-- Вывести имена продуктов(PRODUCT_NAME) кол/во(QUANTITY) которых меньше среднего.
SELECT c.first_name, c.last_name, MAX(o.order_total) AS max_order_total
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.first_name, c.last_name
ORDER BY max_order_total DESC
LIMIT 1;

-- Вывести имя, фамилия пользователей и даты их заказов (order_date)
SELECT c.first_name, c.last_name, o.order_date
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id;

-- Вывести даты заказов продуктов и описание этих продуктов(product_description).
SELECT o.order_date, p.product_description
FROM order_items oi
JOIN orders o ON oi.order_id = o.order_id
JOIN product_information p ON oi.product_id = p.product_id;

-- Вывести Имя, фамилия пользователей, даты заказов (order_date), описание продуктов и категории (category_name):
SELECT c.first_name, c.last_name, o.order_date, p.product_description, p.category_name
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN product_information p ON oi.product_id = p.product_id;

-- Вывести названия (product_name), описания категорий (category_description) и количества (quantity) тех продуктов, у которых минимальная стоимость (min_price) больше 300:
SELECT p.product_name, p.category_description, oi.quantity
FROM product_information p
JOIN order_items oi ON p.product_id = oi.product_id
WHERE p.min_price > 300;

-- Вывести имя, фамилию покупателей, которые купили принтеры.
SELECT DISTINCT c.first_name, c.last_name
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN product_information p ON oi.product_id = p.product_id
WHERE p.product_name LIKE '%Printer%';