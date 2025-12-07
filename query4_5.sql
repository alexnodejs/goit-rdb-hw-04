-- Завдання 4.5: Фільтрація груп де середня кількість товару > 21

USE `goit-rdb-hw-03`;

SELECT
    categories.name AS category_name,
    COUNT(*) AS row_count,
    AVG(order_details.quantity) AS avg_quantity
FROM order_details
INNER JOIN orders ON order_details.order_id = orders.id
INNER JOIN customers ON orders.customer_id = customers.id
INNER JOIN employees ON orders.employee_id = employees.employee_id
INNER JOIN shippers ON orders.shipper_id = shippers.id
INNER JOIN products ON order_details.product_id = products.id
INNER JOIN categories ON products.category_id = categories.id
INNER JOIN suppliers ON products.supplier_id = suppliers.id
GROUP BY categories.name
HAVING AVG(order_details.quantity) > 21;
