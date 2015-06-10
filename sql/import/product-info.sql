DROP TABLE IF EXISTS tmp;
CREATE TABLE tmp
  SELECT
    p.*, a.text_, a.double_, a.int_, a.varchar_, a.attribute_name_id
  FROM horses.products p
  LEFT JOIN agg.product_attributes pa ON pa.product_id = p.id_sync
  LEFT JOIN agg.attributes a ON a.id = pa.attribute_id
  WHERE p.id_sync IS NOT NULL;

start transaction;
   UPDATE horses.products p SET price = NULL WHERE p.id_sync IN (SELECT id FROM tmp);
   UPDATE horses.products p SET price_old = NULL WHERE p.id_sync IN (SELECT id FROM tmp);
   UPDATE horses.products p SET description = NULL WHERE p.id_sync IN (SELECT id FROM tmp);

   UPDATE horses.products p SET price = (SELECT double_ FROM tmp WHERE tmp.id = p.id AND tmp.attribute_name_id = 4) WHERE p.id_sync IN (SELECT id FROM tmp);
   UPDATE horses.products p SET price_old = (SELECT double_ FROM tmp WHERE tmp.id = p.id AND tmp.attribute_name_id = 1) WHERE price IS NOT NULL AND  p.id_sync IN (SELECT id FROM tmp);
   UPDATE horses.products p SET price = (SELECT double_ FROM tmp WHERE tmp.id = p.id AND tmp.attribute_name_id = 1) WHERE price IS NULL AND  p.id_sync IN (SELECT id FROM tmp);

   UPDATE horses.products p SET description = (SELECT text_ FROM tmp WHERE tmp.id = p.id AND tmp.attribute_name_id = 5) WHERE  p.id_sync IN (SELECT id FROM tmp);
commit;