DROP TABLE IF EXISTS attributeList;
DROP TABLE IF EXISTS productAttributeList;
DROP TABLE IF EXISTS pa_uid;
DROP TABLE IF EXISTS pa_attributes;

CREATE TEMPORARY TABLE attributeList
    SELECT a2.*
    FROM agg.attributes a2
      LEFT JOIN horses.attributes a ON a.id_sync = a2.id
    WHERE a.id_sync IS NULL AND a2.attribute_name_id NOT IN (1,4,5);


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
    FROM attributeList;
commit;

CREATE TEMPORARY TABLE productAttributeList
    SELECT
      p.id as product_id,
      a.id as attribute_id,
      CONCAT(p.id, '_', a.id) as uid

    FROM agg.product_attributes pa

    INNER JOIN horses.products p ON pa.product_id = p.id_sync
    INNER JOIN horses.attributes a ON pa.attribute_id = a.id_sync

    WHERE a.attribute_name_id NOT IN (1,4,5);


CREATE  TEMPORARY TABLE pa_uid
  SELECT
    pa.*, CONCAT(pa.product_id, '_', pa.attribute_id) as uid
  FROM horses.product_attributes pa;

CREATE TEMPORARY TABLE pa_attributes
    SELECT
      pa.product_id as product_id, pa.attribute_id as attribute_id
    FROM productAttributeList pa
      LEFT JOIN pa_uid ON pa_uid.uid = pa.uid
    WHERE pa_uid.uid IS NULL;

start transaction;
  INSERT INTO horses.product_attributes
    SELECT
      null as id, pa.product_id, pa.attribute_id
    FROM pa_attributes pa;
commit;