drop procedure if exists sp_light_level_update;

DELIMITER //
CREATE PROCEDURE sp_light_level_update
(
  IN sensor       varchar(30),
  IN light_level  int
)
SQL SECURITY DEFINER
BEGIN
  declare sensor_exists int;
  set sensor_exists = 0;
  
  SELECT count(*) into sensor_exists
  FROM light_level l
  WHERE l.sensor = sensor;
  
  if (sensor_exists = 1) then
    UPDATE light_level
    SET
      reading = light_level,
      time = UTC_TIMESTAMP()
    WHERE light_level.sensor = sensor;
  else
    INSERT INTO light_level (sensor, reading)
    VALUES (sensor, light_level);
  end if;

END //
DELIMITER ;

