# Data Analytics-Assessment

## Q1: High-Value Customers
- Approach: Used double join on plans_plan to detect both savings and investment plans. Aggregated deposits using savings_savingsaccount.

- Recommendation: Focus retention marketing efforts on customers who show multi-product usage. Consider offering loyalty incentives or early access to premium plans.

## Q2: Transaction Frequency
- Approach: Counted transactions per user, divided by months active, categorized based on given ranges.

- Recommendation:“High Frequency” users may benefit from automation features or alerts. “Low Frequency” users could be nudged via reminders or educational content.

## Q3: Account Inactivity
- Approach: Found latest transaction per plan. Filtered those with no transaction in the past 365 days.

- Recommendation: Flagging inactive users early enables re-engagement campaigns. A targeted email offering incentives to return could reduce churn.

## Q4: CLV Estimation
- Approach: Estimated tenure using date_joined, computed CLV using the given formula.

- Recommendation: High CLV users can be enrolled into exclusive tiers or referral programs. Low CLV users might need more onboarding or plan optimization nudges.

## Challenges
- Handling amount values in kobo (converted to naira).
- Assuring users had both plan types in Q1 required careful joins.


# Insight

Based on this query’s result, the business could segment customers with both savings and investment plans for cross-promotional campaigns. These users are already engaged and likely to respond to offers for long-term products or premium services.
