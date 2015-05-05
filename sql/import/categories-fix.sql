UPDATE categories SET title = SUBSTRING_INDEX(title, "(", 1);
UPDATE categories SET title = LOWER(title);

UPDATE categories SET parent_sort_id = id WHERE parent_id IS NULL;
