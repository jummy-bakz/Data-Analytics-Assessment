WITH txn_counts AS (
    SELECT 
        sa.owner_id,
        COUNT(*) AS txn_count,
        TIMESTAMPDIFF(MONTH, MIN(sa.created_on), MAX(sa.created_on)) + 1 AS months_active
    FROM savings_savingsaccount sa
    GROUP BY sa.owner_id
),
categorized AS (
    SELECT 
        tc.owner_id,
        tc.txn_count,
        tc.months_active,
        ROUND(tc.txn_count / tc.months_active, 2) AS avg_txn_per_month,
        CASE 
            WHEN tc.txn_count / tc.months_active >= 10 THEN 'High Frequency'
            WHEN tc.txn_count / tc.months_active BETWEEN 3 AND 9 THEN 'Medium Frequency'
            ELSE 'Low Frequency'
        END AS frequency_category
    FROM txn_counts tc
)
SELECT 
    frequency_category,
    COUNT(owner_id) AS customer_count,
    ROUND(AVG(avg_txn_per_month), 2) AS avg_transactions_per_month
FROM categorized
GROUP BY frequency_category;