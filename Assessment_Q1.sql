SELECT 
    u.id AS owner_id,
    CONCAT(u.first_name, ' ', u.last_name) AS name,
    COUNT(DISTINCT s.id) AS savings_count,
    COUNT(DISTINCT i.id) AS investment_count,
    ROUND(SUM(sa.confirmed_amount) / 100, 2) AS total_deposits  -- converting kobo to naira
FROM users_customuser u
JOIN plans_plan s ON u.id = s.owner_id AND s.is_regular_savings = 1
JOIN plans_plan i ON u.id = i.owner_id AND i.is_a_fund = 1
JOIN savings_savingsaccount sa ON sa.plan_id = s.id
WHERE sa.confirmed_amount IS NOT NULL
GROUP BY u.id, name
ORDER BY total_deposits DESC;