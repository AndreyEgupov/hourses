INSERT INTO `horses`.categories
SELECT id, parent_id, NULL as parent_sort_id, title, NULL as icon_class  FROM `aggregator-hourses`.categories