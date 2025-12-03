SELECT name, setting
FROM pg_settings
WHERE name IN (
    'synchronous_commit',
    'wal_level',
    'max_wal_senders',
    'hot_standby'
);
