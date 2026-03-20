01 create tables.sql

-- Create the Author Dimension
CREATE TABLE authors_dim (
    author_id VARCHAR(50) NOT NULL,
    author_name VARCHAR(100) NOT NULL,
    country VARCHAR(50),
    language VARCHAR(50)
);

-- Create the Category Dimension
CREATE TABLE categories_dim (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL
);

-- Create the Member Dimension (SCD Type 2 columns)
CREATE TABLE members_dim (
    member_id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    address TEXT,
    phone VARCHAR(20),
    email VARCHAR(100) UNIQUE,
    effective_start_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    effective_end_date TIMESTAMP DEFAULT '9999-12-31',
    is_current BOOLEAN DEFAULT TRUE
);


-- Create the books Dimensoin 
CREATE TABLE books_dim (
    book_id SERIAL PRIMARY KEY,
    category_id INT REFERENCES categories_dim(category_id),
    title VARCHAR(255) NOT NULL,
    isbn VARCHAR(50) UNIQUE,
    release_year INT
);


-- Create the date Dimension
CREATE TABLE date_dim (
    date_key DATE PRIMARY KEY,
    year INT,
    month INT,
    day INT,
    day_of_week INT,
    is_weekend BOOLEAN
);

-- Create fact table
CREATE TABLE loans_fact (
    loan_id SERIAL PRIMARY KEY,
    book_id INT REFERENCES books_dim(book_id),
    member_id INT REFERENCES members_dim(member_id),
    loan_date_key DATE REFERENCES date_dim(date_key),
    due_date_key DATE REFERENCES date_dim(date_key),
    return_date_key DATE REFERENCES date_dim(date_key)
);