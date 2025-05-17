# Data Analytics-Assessment

## Q1: High-Value Customers
- Approach: Used double join on plans_plan to detect both savings and investment plans. Aggregated deposits using savings_savingsaccount.

## Q2: Transaction Frequency
- Approach: Counted transactions per user, divided by months active, categorized based on given ranges.

## Q3: Account Inactivity
- Approach: Found latest transaction per plan. Filtered those with no transaction in the past 365 days.

## Q4: CLV Estimation
- Approach: Estimated tenure using date_joined, computed CLV using the given formula.

## Challenges
- Handling amount values in kobo (converted to naira).
- Assuring users had both plan types in Q1 required careful joins.
