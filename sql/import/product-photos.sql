CREATE TEMPORARY TABLE tmp
    SELECT pi2.*
    FROM agg.product_images pi2
    LEFT JOIN horses.products_image pi ON pi.id_sync = pi2.id
    WHERE pi.id_sync IS NULL;

start transaction;

  INSERT INTO horses.products_image (product_id, src, id_sync)
    SELECT
      p.id, tmp.src, tmp.id
    FROM tmp
    LEFT JOIN horses.products p ON p.id_sync = tmp.product_id;

commit;