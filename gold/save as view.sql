
-- Analytics 

CREATE OR REPLACE VIEW lib_analysis AS
SELECT 
    f.loan_id,
    m.name AS member_name,
    b.title AS book_title,
    a.author_name AS author_name,
    c.category_name AS genre,
    f.loan_date_key AS date_borrowed
FROM loans_fact f 
-- Make sure these join on your Primary Keys (the IDs)
JOIN members_dim m ON f.member_id = m.member_id
JOIN books_dim b ON f.book_id = b.book_id
JOIN authors_dim a ON b.author_id = a.author_id
JOIN categories_dim c ON b.category_id = c.category_id;



SELECT * FROM lib_analysis;


-- Daily Loan Trends

CREATE OR REPLACE VIEW daily_loan_trends AS
SELECT
    d.date_key,
    d.is_weekend,
    COUNT(f.loan_id) AS number_of_loans
FROM date_dim d
LEFT JOIN loans_fact f ON d.date_key = f.loan_date_key
GROUP BY d.date_key, d.is_weekend
ORDER BY d.date_key DESC;