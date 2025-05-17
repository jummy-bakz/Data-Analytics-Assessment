WITH txn_summary AS (
    SELECT 
        sa.owner_id,
        COUNT(*) AS total_transactions,
        SUM(sa.confirmed_amount) AS total_value
    FROM savings_savingsaccount sa
    GROUP BY sa.owner_id
),
tenure_calc AS (
    SELECT 
        u.id AS customer_id,
        CONCAT(u.first_name, ' ', u.last_name) AS name,
        TIMESTAMPDIFF(MONTH, u.date_joined, CURDATE()) AS tenure_months
    FROM users_customuser u
),
clv_calc AS (
    SELECT 
        t.customer_id,
        t.name,
        t.tenure_months,
        ts.total_transactions,
        ROUND((ts.total_transactions / t.tenure_months) * 12 * 0.001, 2) AS estimated_clv
    FROM tenure_calc t
    JOIN txn_summary ts ON t.customer_id = ts.owner_id
    WHERE t.tenure_months > 0
)
SELECT *
FROM clv_calc
ORDER BY estimated_clv DESC;