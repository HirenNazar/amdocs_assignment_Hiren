CREATE TABLE categories (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL UNIQUE,
    description TEXT
);

CREATE TABLE suppliers (
    supplier_id SERIAL PRIMARY KEY,
    supplier_name VARCHAR(100) NOT NULL,
    contact_email VARCHAR(100),
    phone VARCHAR(20)
);

CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category_id INT REFERENCES categories(category_id),
    supplier_id INT REFERENCES suppliers(supplier_id),
    price NUMERIC(10, 2) CHECK (price >= 0),
    stock_quantity INT CHECK (stock_quantity >= 0),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


--(a) Retrieve a list of all products with category name and supplier name:

Copy code
SELECT p.product_name, c.category_name, s.supplier_name
FROM products p
JOIN categories c ON p.category_id = c.category_id
JOIN suppliers s ON p.supplier_id = s.supplier_id;


--(b) Find all products where stock quantity is below 5:

Copy code
SELECT product_name, stock_quantity
FROM products
WHERE stock_quantity < 5;


--(c) Add a new column discount_percent with default 0:

Copy code
ALTER TABLE products
ADD COLUMN discount_percent NUMERIC(5,2) DEFAULT 0;


--(d) Reduce price of all products in Electronics by 15%:

Copy code
UPDATE products
SET price = price * 0.85
WHERE category_id = (
    SELECT category_id FROM categories WHERE category_name = 'Electronics'
);


--(e) Total number of products:

Copy code
SELECT COUNT(*) AS total_products FROM products;


--(f) Average price of all products:

Copy code
SELECT AVG(price) AS avg_price FROM products;


--(g) Max and Min price in Electronics:

Copy code
SELECT MAX(price) AS max_price, MIN(price) AS min_price
FROM products p
JOIN categories c ON p.category_id = c.category_id
WHERE c.category_name = 'Electronics';


--(h) Categories with count of products:

Copy code
SELECT c.category_name, COUNT(p.product_id) AS product_count
FROM categories c
LEFT JOIN products p ON c.category_id = p.category_id
GROUP BY c.category_name;


--(i) Suppliers supplying products priced $50–$200:

Copy code
SELECT DISTINCT s.supplier_name
FROM suppliers s
JOIN products p ON s.supplier_id = p.supplier_id
WHERE p.price BETWEEN 50 AND 200;


--(j) Products with category_id in (1,3):

Copy code
SELECT product_name, category_id
FROM products
WHERE category_id IN (1, 3);


--(k) Total stock per category (only categories with >1 product):

Copy code
SELECT c.category_name, SUM(p.stock_quantity) AS total_stock
FROM products p
JOIN categories c ON p.category_id = c.category_id
GROUP BY c.category_name
HAVING COUNT(p.product_id) > 1;


--(l) Avg price per supplier (only >$100):

Copy code
SELECT s.supplier_name, AVG(p.price) AS avg_price
FROM suppliers s
JOIN products p ON s.supplier_id = p.supplier_id
GROUP BY s.supplier_name
HAVING AVG(p.price) > 100;


--(m) Products sorted by price descending:

Copy code
SELECT product_name, price
FROM products
ORDER BY price DESC;


--(n) Total stock value per category (sorted high → low):

Copy code
SELECT c.category_name, SUM(p.price * p.stock_quantity) AS total_value
FROM products p
JOIN categories c ON p.category_id = c.category_id
GROUP BY c.category_name
ORDER BY total_value DESC;


--(a) Products + category name (INNER JOIN):

Copy code
SELECT p.product_name, c.category_name
FROM products p
INNER JOIN categories c ON p.category_id = c.category_id;


--(b) Products + category name (include uncategorized):

Copy code
SELECT p.product_name, c.category_name
FROM products p
LEFT JOIN categories c ON p.category_id = c.category_id;


--(c) Categories + product count (include empty):

Copy code
SELECT c.category_name, COUNT(p.product_id) AS product_count
FROM categories c
LEFT JOIN products p ON c.category_id = p.category_id
GROUP BY c.category_name;


--(d) Products + supplier name (include products without supplier):

Copy code
SELECT p.product_name, s.supplier_name
FROM products p
LEFT JOIN suppliers s ON p.supplier_id = s.supplier_id;


--(e) Suppliers + products (include suppliers without products):

Copy code
SELECT s.supplier_name, p.product_name
FROM suppliers s
RIGHT JOIN products p ON s.supplier_id = p.supplier_id;


--(f) Products without supplier:

Copy code
SELECT product_name
FROM products
WHERE supplier_id IS NULL;


--(g) Products with category + supplier (multi-join):

Copy code
SELECT p.product_name, c.category_name, s.supplier_name
FROM products p
JOIN categories c ON p.category_id = c.category_id
JOIN suppliers s ON p.supplier_id = s.supplier_id;


--(h) All suppliers and categories (even if no products link them):

Copy code
SELECT s.supplier_name, c.category_name
FROM suppliers s
FULL OUTER JOIN products p ON s.supplier_id = p.supplier_id
FULL OUTER JOIN categories c ON p.category_id = c.category_id;


--(i) Products where supplier’s email is not null:

Copy code
SELECT p.product_name, s.supplier_name, s.contact_email
FROM products p
JOIN suppliers s ON p.supplier_id = s.supplier_id
WHERE s.contact_email IS NOT NULL;


--(j) Categories supplied by ‘Global Goods’:

Copy code
SELECT DISTINCT c.category_name
FROM products p
JOIN categories c ON p.category_id = c.category_id
JOIN suppliers s ON p.supplier_id = s.supplier_id
WHERE s.supplier_name = 'Global Goods';