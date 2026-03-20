-- update loan table and ref key to match with members_dim

UPDATE loans_fact SET member_id= 1001
	WHERE member_id=1;
UPDATE loans_fact SET member_id= 1002
	WHERE member_id=2;
UPDATE loans_fact SET member_id= 1003
	WHERE member_id=3;

ALTER TABLE members_dim ADD PRIMARY KEY (members_id);

ALTER TABLE loans_fact
ADD CONSTRAINT fk_loans_members
FOREIGN KEY (member_id)
REFERENCES members_dim(member_id);


-- update books_dim and members_dim tables

ALTER TABLE categories_dim DROP CONSTRAINT categories_dim_pkey CASCADE;

ALTER TABLE categories_dim ADD PRIMARY KEY (category_id);

ALTER TABLE books_dim 
ADD CONSTRAINT books_dim_category_id_fkey 
FOREIGN KEY (category_id) REFERENCES categories_dim(category_id);