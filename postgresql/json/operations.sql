-- 取得

-- jsonbを返す
SELECT json_data -> 'name' FROM t_json_example; 
SELECT jsonb_data -> 'name' FROM t_json_example; 

-- 文字列を返す
SELECT json_data ->> 'name' FROM t_json_example;

-- path
SELECT json_data -> 'parents' -> 0 FROM t_json_example;
SELECT json_data #> '{parents, 0}' FROM t_json_example;

-- 削除 (json型とは利用不能)
SELECT jsonb_data - 'name' FROM t_json_example;
SELECT jsonb_data #- '{parents, 0}' FROM t_json_example;

-- 追加　(json型とは利用不能)
SELECT jsonb_set(jsonb_data, '{parents, 0}', '"Rahul"') FROM t_json_example;
SELECT jsonb_insert(jsonb_data, '{parents, 0}', '"Rahul"') FROM t_json_example;

-- 行ごと展開
SELECT json_array_elements(json_data -> 'parents') FROM t_json_example;
SELECT json_array_elements_text(json_data -> 'parents') FROM t_json_example;

SELECT jsonb_array_elements(jsonb_data -> 'parents') FROM t_json_example;
SELECT jsonb_array_elements_text(jsonb_data -> 'parents') FROM t_json_example;

SELECT json_each(json_data) FROM t_json_example;
SELECT json_each_text(json_data) FROM t_json_example;
