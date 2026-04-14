# Findings - User Behavior & Funnel Analysis

## Overview
This analysis explores user behavior across device types (mobile, desktop, tablet) using a product interaction funnel:

view -> add_to_cart -> purchase

---

## Key Insights

### 1. Device-Based Behavior Differences

- Desktop users show the highest **view → add_to_cart conversion rate**, suggesting a more effective browsing experience.
- Mobile users convert less frequently at the browsing stage, indicating potential UX or decision friction.
- Tablet data is limited and not statistically meaningful.

---

### 2. Funnel Bottleneck

- The largest drop-off occurs between **view → add_to_cart** across all devices.
- This suggests that users hesitate before committing, likely due to:
  - pricing perception
  - unclear value proposition
  - weak product presentation

---

### 3. Funnel Inconsistency Identified

- Mobile sessions show **more purchases than add-to-cart events**, which is not possible in a strict funnel.
- This indicates that the funnel is **not sequentially enforced**.

Possible causes:
- Missing or inconsistent tracking of `add_to_cart` events
- Alternative purchase flows (e.g., direct purchase)
- Simplified dataset limitations

---

### 4. Event-Level vs Session-Level Analysis

- Initial analysis using event counts produced misleading conversion rates.
- A session-based approach improved interpretation by ensuring each session contributes only once per funnel stage.
- However, inconsistencies still exist due to the dataset design.

---

## Conclusion

- Desktop users perform better at early funnel stages (browsing → intent).
- Mobile shows abnormal conversion patterns, likely due to tracking or modeling issues.
- Funnel metrics must be validated before making business decisions.

---

## Key Takeaway

Accurate analysis depends not only on correct SQL, but also on understanding how data is structured.  
Event-level aggregation can lead to misleading conclusions if the funnel sequence is not properly defined.
