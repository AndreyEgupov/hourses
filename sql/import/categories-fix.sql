UPDATE categories SET title = SUBSTRING_INDEX(title, "(", 1);
UPDATE categories SET title = LOWER(title);

UPDATE categories SET parent_sort_id = id WHERE parent_id IS NULL;

CREATE TEMPORARY TABLE tmp SELECT * FROM categories WHERE parent_id IS NULL;
UPDATE categories SET parent_sort_id = CONCAT(parent_id, ".", id) WHERE parent_id IN (SELECT id FROM tmp);

CREATE TEMPORARY TABLE tmp
  SELECT c2.id, c1.parent_id, c1.parent_sort_id FROM categories c1
  INNER JOIN categories c2 ON c2.parent_id = c1.id
  WHERE c1.parent_id IS NOT NULL AND c2.parent_sort_id IS NULL AND c1.parent_sort_id IS NOT NULL;

UPDATE categories c SET parent_sort_id = CONCAT((SELECT parent_sort_id FROM tmp WHERE id = c.id), ".", id) WHERE parent_sort_id IS NULL;