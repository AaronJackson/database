drop procedure if exists sp_sensor_battery_update;

DELIMITER //
CREATE PROCEDURE sp_sensor_battery_update
(
  IN sensor       varchar(30),
  IN volts  float
)
SQL SECURITY DEFINER
BEGIN
  declare sensor_exists int;
  set sensor_exists = 0;
  
  SELECT count(*) into sensor_exists
  FROM sensor_batteries sb
  WHERE sb.sensor = sensor;
  
  if (sensor_exists = 1) then
    UPDATE sensor_batteries
    SET
      reading = (volts),
      time = UTC_TIMESTAMP()
    WHERE sensor_batteries.sensor = sensor;
  else
    INSERT INTO sensor_batteries (sensor, reading)
    VALUES (sensor, volts);
  end if;

END //
DELIMITER ;

