-- Creamos la tabla maestra de geolocalización
 CREATE TABLE IF NOT EXISTS olistdb.geo_referencia AS 
SELECT 
geolocation_zip_code_prefix,
 AVG(geolocation_lat) AS lat_promedio,
 AVG(geolocation_lng) AS lng_promedio,
 ANY_VALUE(geolocation_city) AS geolocation_city,
 ANY_VALUE(geolocation_state) AS geolocation_state
 FROM olistdb.geolocation
 GROUP BY geolocation_zip_code_prefix;
-- Podemos poner la Primary Key (es una sentencia aparte)
 ALTER TABLE olistdb.geo_referencia 
ADD PRIMARY KEY (geolocation_zip_code_prefix);-- Creamos índices para que MySQL permita la relación
 CREATE INDEX idx_seler_zip ON olistdb.selers (seler_zip_code_prefix);
 CREATE INDEX idx_customer_zip ON olistdb.customers (customer_zip_code_prefix);
 SET FOREIGN_KEY_CHECKS = 0;-- Conectamos Selers
 ALTER TABLE olistdb.selers 
ADD CONSTRAINT fk_selers_geo_ref 
FOREIGN KEY (seler_zip_code_prefix) REFERENCES olistdb.geo_referencia(geolocation_zip_code_prefix);-- Conectamos Customers
 ALTER TABLE olistdb.customers 
ADD CONSTRAINT fk_customers_geo_ref 
FOREIGN KEY (customer_zip_code_prefix) REFERENCES olistdb.geo_referencia(geolocation_zip_code_prefix);
 SET FOREIGN_KEY_CHECKS = 1;
