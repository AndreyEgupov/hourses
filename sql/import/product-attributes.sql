DROP TABLE IF EXISTS tmp;
DROP TABLE IF EXISTS pa;

CREATE TEMPORARY TABLE tmp
  SELECT a2.*
  FROM agg.attributes a2
    LEFT JOIN horses.attributes a ON a.id_sync = a2.id
  WHERE a.id_sync IS NULL;

CREATE TEMPORARY TABLE pa
  SELECT
    p.id as product_id, a.id as attribute_id
  FROM agg.product_attributes pa
  LEFT JOIN horses.products p ON p.id_sync = pa.product_id
  LEFT JOIN horses.attributes a ON a.id_sync = pa.attribute_id
  LEFT JOIN horses.product_attributes pa2 ON pa2.product_id = p.id AND pa2.attribute_id = a.id
  WHERE pa2.attribute_id IS NULL OR pa2.product_id IS NULL
  GROUP BY pa.product_id, pa.attribute_id;

start transaction;

  INSERT INTO horses.attribute_names (title, id_sync)
    SELECT
      an2.title, an2.id
      FROM agg.attribute_names an2
      LEFT JOIN horses.attribute_names an ON an.id_sync = an2.id
      WHERE an.id_sync IS NULL;

  INSERT INTO horses.attributes (attribute_name_id, text_, int_, double_, boolean_, date_, datetime_, varchar_, img_, hash, id_sync)
    SELECT
      attribute_name_id, text_, int_, double_, boolean_, date_, datetime_, varchar_, img_, hash, id
    FROM tmp;

  INSERT INTO horses.product_attributes
      SELECT
        pa.*
      FROM pa;

commit;