%flink.ssql
DROP TABLE IF EXISTS sensordata.sensor_data_table;

CREATE TABLE sensor_data_table (
    sensor_id INT,
    temperature DOUBLE,
    humidity DOUBLE,
    `timestamp` DOUBLE
) WITH (
    'connector' = 'kinesis',
    'stream' = 'SensorData',
    'aws.region' = 'us-east-1',
    'scan.stream.initpos' = 'TRIM_HORIZON',
    'format' = 'json'
);

%flink.ssql
SELECT * FROM sensor_data_table;
