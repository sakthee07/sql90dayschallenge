-- --Show first name, last name and role of every person that is either patient or doctor.
-- The roles are either "Patient" or "Doctor"
select first_name,last_name, 'Patient' as role
from patients

-- union ALL

-- select first_name,last_name, 'Doctor' as role
-- from doctors;

-- Here's the simplest way to think about it.

-- ### Read the question carefully:

-- > **"Show first name, last name and role of every person that is either patient or doctor."**

-- The keyword is **"every person"**.

-- That means:

-- * ✅ Show all rows.
-- * ✅ Don't remove any records.

-- So use **`UNION ALL`**.

-- ```sql
-- SELECT first_name, last_name, 'Patient' AS role
-- FROM patients

-- UNION ALL

-- SELECT first_name, last_name, 'Doctor' AS role
-- FROM doctors;
-- ```

-- ### When should you use `UNION`?

-- Use `UNION` only if the question says things like:

-- * "Show unique..."
-- * "Show distinct..."
-- * "Remove duplicates..."

-- Example:

-- > Show all unique first names.

-- ```sql
-- SELECT first_name FROM patients
-- UNION
-- SELECT first_name FROM doctors;
-- ```

-- If both tables have **John**, `UNION` shows **John only once**.

-- ### Easy trick to remember

-- * **`UNION` = Removes duplicates (Unique)**
-- * **`UNION ALL` = Keeps all rows**

-- ### For your question

-- ❓ **Show every person**

-- ✅ **Answer: `UNION ALL`**

-- Because the question wants **every record**, not just unique ones.

