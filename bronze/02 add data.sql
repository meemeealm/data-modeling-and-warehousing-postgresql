-- Insert Authors
INSERT INTO authors_dim (author_id, author_name, country, language) VALUES 
('A001', 'George Orwell', 'UK', 'English'),
('A002', 'Gabriel García Márquez', 'Colombia', 'Spanish'),
('A003', 'Ted Chiang', 'USA', 'English');

-- Insert Categories
INSERT INTO categories_dim ('category_name) VALUES 
('Dystopian'),
('Magical Realism'),
('Sci-Fi');

INSERT INTO members_dim (member_id, name, address, email) VALUES 
(1001, 'Maria', 'Makati City', 'maria@email.com'),
(1002, 'Bob Reyes', 'Taguig City', 'bob@email.com'),
(1003, 'Charlie Lim', 'Davao City', 'charlie@email.com');

-- Books
INSERT INTO books_dim (book_id, author_id, category_id, title, isbn, release_year) VALUES 
(1, 'A001', 1, '1984', '9780451524935', 1949),
(2, 'A002', 2, 'One Hundred Years of Solitude', '9780060883287', 1967),
(3, 'A003', 3, 'Exhalation', '9781101947944', 2019);


-- Date
INSERT INTO date_dim (date_key, year, month, day, is_weekend) VALUES 
('2026-03-01', 2026, 3, 1, true),
('2026-03-05', 2026, 3, 5, false),
(CURRENT_DATE, 2026, 3, 20, false);


-- Fact Table (loan events)
INSERT INTO loans_fact (book_id, member_id, loan_date_key) VALUES 
(1, 1, '2026-03-01'),
(2, 2, '2026-03-05'),
(3, 1, CURRENT_DATE);


