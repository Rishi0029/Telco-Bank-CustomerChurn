QUERY 1
This query joins all 4 major tables (customers, services, transactions, and churn records) to create a full customer profile. It includes demographic details, services used, charges, and churn status.

QUERY 2
Shows the total numbers of rows available in the dataset that being 7032 rows.

QUERY 3
Verifies if any duplicate record lingers in the dataset to be cleaned

QUERY 4
Identifies unique number of distinctions for each of the categories, Gender with 2 distinctions, 3 differnt internet services, 3 different types of contracts, 4 types of payment methods and a true or false value if a customer is churned or not. 

QUERY 5
This query calculates the minimum, maximum, and average customer tenure in months.
Output: Minimum = 1, Maximum = 72, Average = 32.422

QUERY 6
Summarizes the minimum, maximum, and average monthly charges billed to customers.
Output: Minimum = $18.25, Maximum = $118.75, Average = $64.80

QUERY 7
Provides the minimum, maximum, and average total charges across all customer transactions.
Output: Minimum = $18.80, Maximum = $8684.80, Average = $2283.30

QUERY 8
Counts how many customers have churned (i.e. is_churned = 1).
Output: 1,869 customers have churned

QUERY 9
Computes the overall churn rate as a percentage of total customers.
Output: Churn Rate = 26.58%

QUERY 10
Shows churn distribution across gender.
Output
Female: Not churned = 2,544, Churned = 939
Male: Not churned = 2,619, Churned = 930

QUERY 11
Displays churn status based on customer contract type.
Output
Month-to-month: Not churned = 2,220, Churned = 1,655
One year: Not churned = 1,306, Churned = 166
Two year: Not churned = 1,637, Churned = 48

QUERY 12
Analyzes churn by customer payment method.
Output
Electronic check: Not churned = 1,294, Churned = 1,071
Mailed check: Not churned = 1,296, Churned = 308
Credit card: Not churned = 1,289, Churned = 232
Bank transfer: Not churned = 1,284, Churned = 258

QUERY 13
Groups customers by tenure buckets and shows churn distribution.
Output
0–1 year: Not churned = 1,138, Churned = 1,037
1–2 years: Not churned = 730, Churned = 294
2–4 years: Not churned = 1,269, Churned = 325
4+ years: Not churned = 2,026, Churned = 213

QUERY 14
Breaks down churn counts based on internet service type.
Output
DSL: Not churned = 1,957, Churned = 459
Fiber optic: Not churned = 1,799, Churned = 1,297
No service: Not churned = 1,407, Churned = 113

QUERY 15
Evaluates churn across ranges of monthly billing amounts.
Output:
< $30: Not churned = 1,485, Churned = 162
$30–$60: Not churned = 925, Churned = 327
$60–$90: Not churned = 1,582, Churned = 807
> $90: Not churned = 1,171, Churned = 573

QUERY 16
Groups churn outcomes by lifetime spending brackets.
Output
< $500: Not churned = 1,171, Churned = 829
$500–$2000: Not churned = 1,666, Churned = 510
$2000–$5000: Not churned = 1,348, Churned = 373
>= $5000: Not churned = 978, Churned = 157

QUERY 17
Combines contract type and tenure groupings to show nuanced churn behavior.
Output highlights (Full table more info.)
Month-to-month & 0–1 year: Not churned = 970, Churned = 1,024
Two year & 4+ years: Not churned = 1,221, Churned = 42
One year & 2–4 years: Not churned = 463, Churned = 55

QUERY 18
Cross-tabulates internet service types and payment methods against churn status.
Output hghlights (Full table more info.)
DSL & Credit card: Not churned = 521, Churned = 72
Fiber optic & Electronic check: Not churned = 746, Churned = 849
No internet & Mailed check: Not churned = 664, Churned = 71



