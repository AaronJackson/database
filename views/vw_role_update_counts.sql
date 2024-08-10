CREATE VIEW `vw_role_update_counts` AS
SELECT
    DATE(ru.created_at) AS date,
--     COUNT(IF(ra.name = 'member.approval', 1, NULL)) AS approval_added,
--     COUNT(IF(rr.name = 'member.approval', 1, NULL)) AS approval_removed,
--     COUNT(IF(ra.name = 'member.payment', 1, NULL)) AS payment_added,
--     COUNT(IF(rr.name = 'member.payment', 1, NULL)) AS payment_removed,
    COUNT(IF(ra.name = 'member.current', 1, NULL)) AS current_added,
    COUNT(IF(rr.name = 'member.current', 1, NULL)) AS current_removed,
    COUNT(IF(ra.name = 'member.young', 1, NULL)) AS young_added,
    COUNT(IF(rr.name = 'member.young', 1, NULL)) AS young_removed,
    COUNT(IF(ra.name = 'member.ex', 1, NULL)) AS ex_added,
    COUNT(IF(rr.name = 'member.ex', 1, NULL)) AS ex_removed,
    COUNT(IF(ra.name = 'member.temporarybanned', 1, NULL)) AS temporarybanned_added,
    COUNT(IF(rr.name = 'member.temporarybanned', 1, NULL)) AS temporarybanned_removed,
    COUNT(IF(ra.name = 'member.banned', 1, NULL)) AS banned_added,
    COUNT(IF(rr.name = 'member.banned', 1, NULL)) AS banned_removed
FROM
    role_updates ru
    LEFT JOIN roles ra ON (ra.id = ru.added_role_id)
    LEFT JOIN roles rr ON (rr.id = ru.removed_role_id)
WHERE
    ra.name IN (
--         'member.approval',
--         'member.payment',
        'member.current',
        'member.young',
        'member.ex',
        'member.temporarybanned',
        'member.banned'
    )
    OR rr.name IN (
--         'member.approval',
--         'member.payment',
        'member.current',
        'member.young',
        'member.ex',
        'member.temporarybanned',
        'member.banned'
    )
GROUP BY date
ORDER BY date;
