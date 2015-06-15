UPDATE categories c SET count_products = (
  SELECT COUNT(DISTINCT p.id)
  FROM products p
  WHERE p.category_id = c.id
);

CREATE TEMPORARY TABLE tmp
  SELECT * FROM categories c;

UPDATE categories c SET count_products = (
  SELECT
    SUM(count_products) as count_products
  FROM tmp
  WHERE tmp.parent_id = c.id
  GROUP BY parent_id

) WHERE count_products = 0;

UPDATE categories c SET count_products = NULL WHERE count_products = 0;