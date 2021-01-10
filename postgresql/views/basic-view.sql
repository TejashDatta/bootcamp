CREATE VIEW v_purchase_june AS
  SELECT * FROM t_purchase
  WHERE to_char(ts, 'MM') = '06';

SELECT * FROM v_purchase_june;

INSERT INTO v_purchase_june VALUES
  (100300, 1026, '2017-06-07', 200);

UPDATE v_purchase_june SET point = 400 WHERE pid = 100300;

DROP VIEW v_purchase_june;
