CREATE TABLE t_json_example (
  json_data json,
  jsonb_data jsonb
);

INSERT INTO t_json_example VALUES (
  '{"name": "Tejash", "age": 22, "parents": ["Kaushik", "Rajyashree"]}',
  '{"name": "Tejash", "age": 22, "parents": ["Kaushik", "Rajyashree"]}'
);
