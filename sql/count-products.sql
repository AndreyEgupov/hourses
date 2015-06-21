UPDATE categories c SET count_products = (
  SELECT COUNT(DISTINCT p.id)
  FROM products p
  WHERE p.category_id = c.id
);

CREATE TEMPORARY TABLE tmp
    SELECT * FROM categories c;

CREATE TEMPORARY TABLE tmp2
    SELECT * FROM categories c;

UPDATE categories c SET count_products = IF (
    (
      SELECT
        c.count_products + SUM(count_products) AS count_products
      FROM tmp
      WHERE tmp.parent_id = c.id
      GROUP BY parent_id
    ) IS NOT NULL,
    (
      SELECT
        c.count_products + SUM(count_products) AS count_products
      FROM tmp2
      WHERE tmp2.parent_id = c.id
      GROUP BY parent_id
    ),
    c.count_products
);

UPDATE categories c SET count_products = NULL WHERE count_products = 0;