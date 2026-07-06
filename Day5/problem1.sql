-- -- Show all of the patients grouped into weight groups.
-- -- Show the total amount of patients in each weight group.
-- -- Order the list by the weight group decending.

-- -- For example, if they weight 100 to 109 they are placed in the 100 weight group, 110-119 = 110 weight group, etc.


SELECT count(*) as patients_in_group, FLOOR((weight-1)/10)*10 as weight_group FROM patients
group by FLOOR((weight-1)/10)*10
order by weight_group desc;
-- Great question! The difference is **where the bucket starts**.

-- Let's compare them with actual values.

-- ## Pattern 1: `FLOOR((weight-1)/10) * 10`

-- ```sql
-- FLOOR((weight - 1) / 10) * 10
-- ```

-- | Weight | Calculation       | Result |
-- | -----: | ----------------- | -----: |
-- |      1 | FLOOR(0/10) × 10  |      0 |
-- |      9 | FLOOR(8/10) × 10  |      0 |
-- |     10 | FLOOR(9/10) × 10  |      0 |
-- |     11 | FLOOR(10/10) × 10 |     10 |
-- |     20 | FLOOR(19/10) × 10 |     10 |
-- |     21 | FLOOR(20/10) × 10 |     20 |

-- This creates buckets like:

-- ```text
-- 1-10   → 0
-- 11-20  → 10
-- 21-30  → 20
-- ```

-- Usually you'll add **1** to display the lower bound:

-- ```sql
-- CONCAT(
--     FLOOR((weight-1)/10) * 10 + 1,
--     '-',
--     FLOOR((weight-1)/10) * 10 + 10
-- )
-- ```

-- Result:

-- | Weight | Label |
-- | ------ | ----- |
-- | 1      | 1-10  |
-- | 7      | 1-10  |
-- | 10     | 1-10  |
-- | 11     | 11-20 |

-- ---

-- ## Pattern 2: `FLOOR(weight/10) * 10`

-- ```sql
-- FLOOR(weight / 10) * 10
-- ```

-- | Weight | Calculation    | Result |
-- | -----: | -------------- | -----: |
-- |    100 | FLOOR(10.0)×10 |    100 |
-- |    109 | FLOOR(10.9)×10 |    100 |
-- |    110 | FLOOR(11.0)×10 |    110 |
-- |    119 | FLOOR(11.9)×10 |    110 |
-- |    120 | FLOOR(12.0)×10 |    120 |

-- This creates buckets like:

-- ```text
-- 100-109 → 100
-- 110-119 → 110
-- 120-129 → 120
-- ```

-- Exactly like the example you gave.

-- ---

-- ## Why subtract 1?

-- Subtracting **1** shifts the boundary so that **10 belongs to the first bucket instead of the second**.

-- ### Without `-1`

-- ```text
-- 0-9
-- 10-19
-- 20-29
-- 30-39
-- ```

-- ### With `-1`

-- ```text
-- 1-10
-- 11-20
-- 21-30
-- 31-40
-- ```

-- ---

-- ## Interview Rule of Thumb

-- | Desired Range      | Formula                                                    |
-- | ------------------ | ---------------------------------------------------------- |
-- | 0-9, 10-19, 20-29  | `FLOOR(value/10) * 10`                                     |
-- | 1-10, 11-20, 21-30 | `FLOOR((value-1)/10) * 10 + 1` (or use it to build labels) |
-- | 100-109, 110-119   | `FLOOR(value/10) * 10`                                     |

-- ### Easy way to remember

-- * **Starts at 0?** → `FLOOR(value / N) * N`
-- * **Starts at 1?** → `FLOOR((value - 1) / N)`

-- This is one of the most common bucketing patterns you'll encounter in SQL interviews and real-world reporting.
