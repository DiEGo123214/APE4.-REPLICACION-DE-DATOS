INSERT INTO prueba_replicacion (accion, zona_escritura)
VALUES ('ANTES del Failover', inet_server_addr()::TEXT);

SELECT NOW(), pg_current_wal_lsn();

SELECT
    id,
    accion,
    timestamp_escritura,
    zona_escritura,
    timestamp_escritura - LAG(timestamp_escritura) OVER (ORDER BY id) AS tiempo_entre_escrituras
FROM prueba_replicacion
ORDER BY id DESC
LIMIT 10;
