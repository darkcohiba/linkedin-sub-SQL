huntrSELECT * FROM friend;
SELECT * FROM family;
SELECT * FROM city;
SELECT * FROM job;
 
UPDATE friend
SET relationship = 'Fiance'
WHERE relationship = 'Girlfriend';
 
UPDATE friend 
SET level = 4
WHERE name = 'Betsy';
 
UPDATE friend
SET family_id = 1
WHERE hometown = 'New York City';
 
 
SELECT name FROM friend ORDER BY level DESC;
 
SELECT name FROM friend WHERE level > (SELECT AVG(level) FROM friend);
 
CREATE TABLE family(
    family_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    family_name VARCHAR(40),
    members INT
)
 
CREATE TABLE friend(
    friend_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    firstName VARCHAR(40),
    lastName VARCHAR(40),
    relationship VARCHAR(40),
    hometown INT,
    family INT,
    job INT,
    level INT,
    sex VARCHAR (1),
    FOREIGN KEY (family) REFERENCES family(family_id) 
    ON DELETE SET NULL,
    FOREIGN KEY (hometown) REFERENCES city(city_id) 
    ON DELETE SET NULL,
    FOREIGN KEY (job) REFERENCES job(id) 
    ON DELETE SET NULL
)
 
CREATE TABLE city(
    city_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(40),
    state VARCHAR(40)
)
 
CREATE TABLE communication(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    sender INT,
    reciever INT,
    message VARCHAR(1000),
    FOREIGN KEY (sender) REFERENCES friend(friend_id)
    ON DELETE SET NULL,
    FOREIGN KEY (reciever) REFERENCES friend(friend_id)
    ON DELETE SET NULL
)
 
CREATE TABLE job(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    friend INT,
    job_title VARCHAR(50),
    company VARCHAR(50),
    income INT,
    years_employed INT
)
 
ALTER TABLE job
ADD FOREIGN KEY (friend)
REFERENCES friend(friend_id)
ON DELETE SET NULL;
 
ALTER TABLE job
DROP FOREIGN KEY friend;
 
ALTER TABLE job
DROP friend;
 
 
 
 
describe family;
describe friend;
DESCRIBE city;
DESCRIBE communication;
DESCRIBE job;
 
 
INSERT INTO family(family_name) VALUES('Waters');
 
ALTER TABLE friend ADD COLUMN family_id INT AFTER hometown;
 
 
 
DROP TABLE family;
DROP TABLE friend;
DROP TABLE job;
 
INSERT INTO city VALUES(1, 'Denver', 'Colorado');
INSERT INTO city(NAME, STATE) VALUES('New York City', 'New York');
INSERT INTO city(NAME, STATE) VALUES('Beverly Hills', 'California');
 
 
INSERT INTO family(family_name, members) VALUES('Waters', 4);
INSERT INTO family(family_name, members) VALUES('Sanchez', 2);
INSERT INTO family(family_name, members) VALUES('Unger', 3);
 
INSERT INTO job(job_title, company, income, years_employed) VALUES('Project Controller', 'LNTD', 82000, 1);
INSERT INTO job(job_title, company, income, years_employed) VALUES('Slide Master', 'Big Pharm', 112000, 2);
INSERT INTO job(job_title, income) VALUES('Unemployed', 0);
 
INSERT INTO friend(firstName, lastName, relationship, hometown, family, job, level, sex) VALUES('Ninfa', 'Sanchez', 'Girlfriend', 1, 2, 1, 5, "F");
INSERT INTO friend(firstName, lastName, relationship, hometown, family, job, level, sex) VALUES('Adam', 'Unger', 'Friend', 3, 3, 2, 5, "M");
 
 
 
SELECT * FROM friend ORDER BY sex DESC;
SELECT CONCAT(firstName, " ", lastName) AS "Full Name" FROM friend;
 

