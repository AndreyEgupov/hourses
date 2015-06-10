CREATE TEMPORARY TABLE tmp
  SELECT p2.*
  FROM agg.products p2
  LEFT JOIN horses.products p ON p.id_sync = p2.id
  WHERE p.id_sync IS NULL AND p2.title IS NOT NULL;

start transaction;

  INSERT INTO horses.products (category_id, title, id_sync, date_create, date_update)
    SELECT
      c.id, tmp.title, tmp.id, tmp.created, tmp.updated
    FROM tmp
    INNER JOIN agg.params p ON tmp.param_id = p.id
    INNER JOIN agg.categories c ON c.id = p.category_id
    GROUP BY tmp.id;

commit;