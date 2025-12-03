CREATE TABLE prueba_replicacion (
    id SERIAL PRIMARY KEY,
    accion VARCHAR(100),
    timestamp_escritura TIMESTAMP(6) DEFAULT CLOCK_TIMESTAMP(),
    zona_escritura VARCHAR(50)
);

INSERT INTO prueba_replicacion (accion, zona_escritura)
VALUES ('Escritura en Primary', current_setting('cluster_name'));

SELECT
    pg_current_wal_lsn() AS posicion_actual,
    pg_wal_lsn_diff(pg_current_wal_lsn(), '0/0') / 1024 / 1024 AS mb_escritos;

SELECT
    CASE
        WHEN pg_last_wal_receive_lsn() = pg_last_wal_replay_lsn()
        THEN 'Replicación al día'
        ELSE 'Replicación con retraso'
    END AS estado_replicacion,
    pg_wal_lsn_diff(pg_last_wal_receive_lsn(), pg_last_wal_replay_lsn()) AS bytes_pendientes;
