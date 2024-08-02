drop procedure if exists sp_humidity_update;

DELIMITER //
CREATE PROCEDURE sp_humidity_update
(
  IN sensor       varchar(30),
  IN humidity  float
)
SQL SECURITY DEFINER
BEGIN
  declare sensor_exists int;
  set sensor_exists = 0;
  
  SELECT count(*) into sensor_exists
  FROM humidities h
  WHERE h.sensor = sensor;
  
  if (sensor_exists = 1) then
    UPDATE humidities
    SET
      reading = (humidity),
      time = UTC_TIMESTAMP()
    WHERE humidities.sensor = sensor;
  else
    INSERT INTO humidities (sensor, reading)
    VALUES (sensor, humidity);
  end if;

END //
DELIMITER ;

