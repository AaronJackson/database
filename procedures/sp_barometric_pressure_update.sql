drop procedure if exists sp_barometric_pressure_update;

DELIMITER //
CREATE PROCEDURE sp_barometric_pressure_update
(
  IN sensor       varchar(30),
  IN preassure  float
)
SQL SECURITY DEFINER
BEGIN
  declare sensor_exists int;
  set sensor_exists = 0;
  
  SELECT count(*) into sensor_exists
  FROM barometric_pressures bp
  WHERE bp.sensor = sensor;
  
  if (sensor_exists = 1) then
    UPDATE barometric_pressures
    SET
      reading = (preassure),
      time = UTC_TIMESTAMP()
    WHERE barometric_pressures.sensor = sensor;
  else
    INSERT INTO barometric_pressures (sensor, reading)
    VALUES (sensor, preassure);
  end if;

END //
DELIMITER ;

