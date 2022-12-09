--Creating Tables
CREATE TABLE Authors(
    aid INT PRIMARY KEY,
    fname VARCHAR(30) NOT NULL,
    lname VARCHAR(30) NOT NULL
);

CREATE TABLE Addresses(
    addr_id INT PRIMARY KEY,
    street_name VARCHAR(50) NOT NULL,
    street_num INT NOT NULL,
    unit INT,
    city VARCHAR(50) NOT NULL,
    province VARCHAR(15) NOT NULL,
    postal VARCHAR(6) NOT NULL,
    country VARCHAR(25) NOT NULL

);

CREATE TABLE Publishers(
    pid INT PRIMARY KEY,
    fname VARCHAR(30) NOT NULL,
    lname VARCHAR(30) NOT NULL,
    email VARCHAR(50) NOT NULL,
    bank_acc INT NOT NULL,
    addr_id INT NOT NULL, FOREIGN KEY (addr_id) REFERENCES Addresses (addr_id)
);

CREATE TABLE Phone_numbers(
    pid INT, FOREIGN KEY (pid) REFERENCES Publishers (pid),
    phone_num BIGINT NOT NULL CHECK (phone_num between 0 and 9999999999),
    PRIMARY KEY (pid, phone_num)
);

CREATE TABLE Books(
    isbn VARCHAR(13) PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    pages INT NOT NULL,
    price NUMERIC(5, 2) NOT NULL,
    royalty_percent NUMERIC(4, 2) NOT NULL,
    stock INT NOT NULL,
    pid INT NOT NULL, FOREIGN KEY (pid) REFERENCES Publishers (pid)

);

CREATE TABLE Users(
    username VARCHAR(30) PRIMARY KEY,
    pword VARCHAR(30) NOT NULL,
    fname VARCHAR(30) NOT NULL,
    lname VARCHAR(30) NOT NULL,
    isOwner BOOLEAN NOT NULL
);

CREATE TABLE User_addrs(
    username VARCHAR(30), FOREIGN KEY (username) REFERENCES Users (username),
    addr_id INT, FOREIGN KEY (addr_id) REFERENCES Addresses (addr_id),
    isShipping BOOLEAN NOT NULL,
    isBilling BOOLEAN NOT NULL,
    PRIMARY KEY(username, addr_id)
);

CREATE TABLE Orders(
    order_num INT PRIMARY KEY,
    tracking_num VARCHAR(10) NOT NULL,
    ord_date DATE NOT NULL,
    ord_cost NUMERIC(8,2) NOT NULL,
    username VARCHAR(30) NOT NULL, FOREIGN KEY (username) REFERENCES Users (username)
);

CREATE TABLE Order_addrs(
    order_num INT, FOREIGN KEY (order_num) REFERENCES Orders (order_num),
    addr_id INT,FOREIGN KEY (addr_id) REFERENCES Addresses (addr_id),
    PRIMARY KEY (order_num, addr_id)
);

CREATE TABLE Genres (
    isbn VARCHAR(13), FOREIGN KEY (isbn) REFERENCES Books (isbn),
    gname VARCHAR (20),
    PRIMARY KEY(isbn, gname)
);

CREATE TABLE Authored(
    aid INT NOT NULL, FOREIGN KEY (aid) REFERENCES Authors (aid),
    isbn VARCHAR(13) NOT NULL, FOREIGN KEY (isbn) REFERENCES Books (isbn),
    PRIMARY KEY(aid, isbn)
);

CREATE TABLE In_Orders(
    isbn VARCHAR(13), FOREIGN KEY (isbn) REFERENCES Books (isbn),
    order_num INT, FOREIGN KEY (order_num) REFERENCES Orders (order_num),
    quantity INT NOT NULL,
    PRIMARY KEY(isbn, order_num)
);

INSERT INTO Users (username, pword, fname, lname, isOwner)
VALUES
('Robo.adam10', 'password', 'Adam', 'Lin', true),
('ColeKaufs', 'password', 'Cole', 'Kaufman', true),
('KingSully', 'sodijfoweinf', 'Seleman', 'Shinwarie', false),
('PerditaTheDog', 'sdifjoiejofisj', 'Perdita', 'Dalmatian', false),
('ForrestPlump', 'foeifnksjfnieu', 'Forrest', 'Gump', false),
('SavingMe', 'sldkfjoeinf', 'Private', 'Ryan', false),
('Leon', 'soeifmoeimfos', 'Leonard', 'Hoffstater', false)

INSERT INTO Addresses(addr_id, street_name, street_num, unit, city, province, postal, country)
VALUES
(1, 'Del Sol', '10108', null, 'Charleston', 'West Virginia', '25321', 'United States'),
(2, 'Pawling', '53', '2', 'Bellevue', 'Washington', '98008', 'United States'),
(3, 'Pennsylvania', '39', '813', 'Charleston', 'West Virginia', '25336','United States'),
(4, 'Eliot', '2', null, 'Jacksonville', 'Florida', '32209', 'United States'),
(5, 'Anhalt', '523', null, 'Albuquerque', 'New Mexico', '87121', 'United States'),
(6, 'Debra', '3', '7', 'Birmingham', 'Alabama', '35290', 'United States'),
(7, 'Melvin', '59', '62', 'Las Vegas', 'Nevada', '89166', 'United States'),
(8, 'Toban', '11', null, 'New Brunswick', 'New Jersey', '08922', 'United States'),
(9, 'Nobel', '19068', null, 'Charlotte', 'North Carolina', '28242', 'United States'),
(10, 'South', '636', null, 'Gary', 'Indiana', '46406', 'United States'),
(11, '66 Vidon Junction', '1491', '4', 'Rochester', 'Minnesota', '55905', 'United States'),
(12, '07561 Tony Plaza', '290', '15623', 'Indianapolis', 'Indiana', '46231', 'United States'),
(13, '3 Elka Road', '72', '6231', 'Tallahassee', 'Florida', '32314', 'United States'),
(14, '79970 Mariners Cove Avenue', '55', null, 'Evansville', 'Indiana', '47732', 'United States'),
(15, '343 Muir Plaza', '80669', '91704', 'San Diego', 'California', '92170', 'United States'),
(16, '59056 Forest Dale Point', '527', null, 'Mobile', 'Alabama', '36641', 'United States'),
(17, '03102 Sundown Circle', '21', '520', 'Brea', 'California', '92822', 'United States'),
(18, '776 Darwin Terrace', '923', '18', 'Charlotte', 'North Carolina', '28235', 'United States'),
(19, '76 Jay Court', '82', '7', 'Boca Raton', 'Florida', '33487', 'United States'),
(20, '499 Morrow Parkway', '8', '939', 'Richmond', 'Virginia', '23293', 'United States')

INSERT INTO User_addrs(username, addr_id, isShipping, isBilling)
VALUES
('Robo.adam10', 1, true, true),
('ColeKaufs', 2, true, true),
('KingSully', 3, true, false),
('KingSully', 4, false , true),
('PerditaTheDog', 5, true, true),
('ForrestPlump', 6, false, true),
('ForrestPlump', 7, true, false),
('SavingMe', 8, true, true),
('Leon', 9, true, false),
('Leon', 10, false, true)

INSERT INTO Publishers(pid, fname, lname, email, bank_acc, addr_id)
VALUES
(1, 'Sacha', 'Sparey', 'ssparey0@example.com', 12351343, 1),
(2, 'Madison', 'Wakelin', 'mwakelin1@theguardian.com', 64534513, 2),
(3, 'Colleen', 'Klosa', 'cklosa2@engadget.com', 25342525, 3),
(4, 'Kaiser', 'Killick', 'kkillick3@mtv.com', 658567235, 4),
(5, 'Elysia', 'Leppington', 'eleppington4@joomla.org', 74567316, 5),
(6, 'Jaquith', 'Bellow', 'jbellow5@washingtonpost.com', 8756435, 6),
(7, 'Lyle', 'Kilfeather', 'lkilfeather6@wired.com', 5789345, 7),
(8, 'Armin', 'Rainon', 'arainon7@dion.ne.jp', 34692356, 8),
(9, 'Julie', 'Randell', 'jrandell8@engadget.com', 9046583, 9),
(10, 'Bidget', 'Verman', 'bverman9@illinois.edu', 48622593, 10),
(11, 'Carlos', 'Temperley', 'ctemperleya@washingtonpost.com', 2355604, 11),
(12, 'Yanaton', 'Puddle', 'ypuddleb@zimbio.com', 36729032, 12),
(13, 'Kori', 'Baldock', 'kbaldockc@nih.gov', 8557057, 13),
(14, 'Collie', 'Jarmaine', 'cjarmained@pinterest.com', 23423565, 14),
(15, 'Noellyn', 'Lockart', 'nlockarte@unblog.fr', 2362632, 15),
(16, 'Katina', 'Trenaman', 'ktrenamanf@va.gov', 2624724, 16),
(17, 'Virgilio', 'Kinastan', 'vkinastang@cdc.gov', 7564245, 17),
(18, 'Demetra', 'Pavie', 'dpavieh@multiply.com', 34564352, 18),
(19, 'Ajay', 'Handscombe', 'ahandscombei@sbwire.com', 7467624, 19),
(20, 'Chrysler', 'Bonnesen', 'cbonnesenj@cnbc.com', 84683564, 20)

INSERT INTO Phone_numbers(pid, phone_num)
VALUES
(1, '2967117131'),
(1, '7084177354'),
(2, '9847948826'),
(3, '4605006923'),
(4, '1371113604'),
(5, '4212795348'),
(6, '6913894386'),
(7, '4442222996'),
(8, '1199605069'),
(9, '7577416997'),
(9, '6546884865'),
(10, '6573484622'),
(10, '7503372534'),
(11, '9792376493'),
(12, '5682587937'),
(13, '3918549402'),
(14, '1523254628'),
(15, '9348745387'),
(16, '2155421758'),
(17, '2857364499'),
(18, '6438610302'),
(19, '7943058070'),
(20, '6182754418'),
(20, '8361757582'),
(20, '7281470471')

INSERT INTO Books (isbn, title, pages, price, royalty_percent, stock, pid)
VALUES
('808097694-5', 'Bat, The', 484, 84, 4.44, 13, 1),
('209006286-X', 'Fantomas (Fantômas - À l''ombre de la guillotine)', 325, 113, 52.3, 78, 1),
('818074178-8', 'Gate II: Trespassers, The', 188, 48, 31.84, 31, 2),
('598378647-4', 'Pathfinder', 481, 93, 55.22, 29, 2),
('823942962-9', 'Stunt Man, The', 135, 100, 70.45, 45, 3),
('887416486-6', 'Out Cold', 173, 24, 90.66, 54, 4),
('622615924-3', 'You Are God (Jestes Bogiem)', 417, 95, 54.06, 46, 5),
('909893829-9', 'Man on a Ledge', 459, 76, 66.4, 59, 6),
('428308507-3', 'D.A.R.Y.L.', 234, 122, 80.36, 37, 7),
('643000129-6', 'Long, Hot Summer, The', 439, 100, 68.71, 30, 8),
('007919126-6', 'Atlantis: The Lost Empire', 345, 32, 25.12, 23, 9),
('113648857-X', 'Wordplay', 133, 44, 99.85, 13, 10),
('238501061-5', 'Wah-Wah', 58, 35, 18.16, 23, 10),
('710737254-8', 'Shadowlands', 139, 45, 20.42, 67, 11),
('508820449-3', 'Forty Guns', 192, 112, 66.96, 99, 12),
('967697938-4', 'Bikes vs Cars', 228, 91, 9.0, 94, 13),
('845633627-0', 'Stone', 448, 85, 13.87, 32, 14),
('546585337-9', 'Truth or Consequences, N.M.', 212, 58, 30.28, 75, 14),
('523019024-8', 'Nights in Rodanthe', 139, 14, 36.53, 51 ,15),
('009066565-1', 'Last Hurrah, The', 478, 133, 69.52, 86, 15),
('460503309-2', 'Foul King, The (Banchikwang)', 486, 85, 70.96, 100, 15),
('504443845-6', 'Vesna va veloce', 288, 133, 74.58, 16, 16),
('480910812-0', 'Weird Science', 481, 59, 59.9, 24, 17),
('460517955-0', 'Manakamana', 485, 91, 61.03, 28, 18),
('012490413-0', 'Around the World in 80 Days', 326, 81, 98.41, 35, 18),
('148956675-9', 'New Leaf, A', 322, 33, 57.58, 86, 19),
('499050502-6', 'Keep the Lights On', 93, 47, 68.44, 79, 19),
('295647859-1', 'Merrill''s Marauders', 437, 52, 13.13, 41, 3),
('191711496-6', 'Candy', 54, 51, 25.88, 95, 7),
('908142405-X', 'Sound of Fury, The', 387, 43, 87.25, 95, 6),
('842953482-2', 'The Pirates of Blood River', 492, 34, 99.55, 66, 20),
('523605904-6', 'Dead Birds', 272, 69, 85.54, 75, 20)

INSERT INTO Orders(order_num, tracking_num, ord_date, ord_cost, username)
VALUES
(1, 'SA3BX4S2K0', '9/30/2022', 335, 'KingSully'),
(2, 'AD4H7YYZLP', '10/16/2022', 203, 'PerditaTheDog'),
(3, '01O30K5SBC', '12/3/2022', 495, 'ForrestPlump'),
(4, '02ARHINU73', '2/21/2022', 1280, 'SavingMe'),
(5, 'U6EZYGHLC8', '8/6/2022', 84, 'Leon')

INSERT INTO Order_addrs(order_num, addr_id)
VALUES
(1, 3),
(2, 5),
(3, 7),
(4, 8),
(5, 9)

INSERT INTO In_Orders(isbn, order_num, quantity)
VALUES
('523605904-6', 1, 3),
('499050502-6', 1, 1),
('480910812-0', 2, 2),
('460503309-2', 2, 1),
('845633627-0', 3, 5),
('238501061-5', 3, 2),
('007919126-6', 4, 10),
('818074178-8', 4, 20),
('808097694-5', 5, 1)

INSERT INTO Genres (isbn, gname)
VALUES
('808097694-5', 'Comedy'),
('808097694-5', 'Animation'),
('209006286-X', 'Adventure'),
('818074178-8', 'Crime'),
('818074178-8', 'Horror'),
('598378647-4', 'Children'),
('823942962-9', 'War'),
('887416486-6', 'Sci-Fi'),
('622615924-3' ,'History'),
('622615924-3' ,'Satire'),
('909893829-9', 'Fantasy'),
('909893829-9', 'Fiction'),
('909893829-9', 'Satire'),
('428308507-3', 'Noir'),
('643000129-6', 'Cyberpunk'),
('007919126-6', 'Mystery'),
('007919126-6', 'Non-Fiction'),
('113648857-X', 'Adventure'),
('007919126-6', 'Crime'),
('113648857-X', 'Mystery'),
('113648857-X', 'War'),
('238501061-5', 'Children'),
('710737254-8', 'War'),
('710737254-8', 'Cyberpunk'),
('710737254-8', 'Romance'),
('508820449-3', 'Non-Fiction'),
('967697938-4', 'Drama'),
('845633627-0', 'Adventure'),
('546585337-9', 'Thriller'),
('523019024-8', 'Sci-Fi'),
('523019024-8', 'History'),
('009066565-1', 'Medieval'),
('460503309-2', 'Fantasy'),
('504443845-6', 'Drama'),
('480910812-0', 'Fiction'),
('460517955-0', 'Documentary'),
('012490413-0', 'Cyberpunk'),
('148956675-9', 'Crime'),
('148956675-9', 'Mystery'),
('499050502-6', 'Noir'),
('295647859-1', 'Western'),
('191711496-6', 'Adventure'),
('908142405-X', 'Non-Fiction'),
('842953482-2', 'Satire'),
('523605904-6', 'Animation')

INSERT INTO Authors (aid, fname, lname)
VALUES
(1, 'Lurlene', 'McClarence'),
(2, 'Andy', 'Mebes'),
(3, 'Ailene', 'Bignell'),
(4, 'Beau', 'Tutsell'),
(5, 'Berna', 'Scini'),
(6, 'Seamus', 'Thexton'),
(7, 'Gardner', 'Delbergue'),
(8, 'Kate', 'Yukhov'),
(9, 'Maressa', 'Salazar'),
(10, 'Evered', 'Paute'),
(11, 'Lura', 'Brayshay'),
(12, 'Orella', 'Toner'),
(13, 'Mitzi', 'Abramow'),
(14, 'Yvette', 'Carlisi'),
(15, 'Xaviera', 'Tamlett'),
(16, 'Nikolas', 'Brocklehurst'),
(17, 'Simone', 'Ridhole'),
(18, 'Jonathan', 'Oakenfull'),
(19, 'Bennie', 'Pesselt'),
(20, 'Breena', 'Fleckney'),
(21, 'Danika', 'Stanluck'),
(22, 'Tiphanie', 'Belchamp'),
(23, 'Mannie', 'Nann'),
(24, 'Douglas', 'Pancoust'),
(25, 'Roxanne', 'Pickard')

INSERT INTO Authored(aid, isbn)
VALUES
(1, '808097694-5'),
(2, '209006286-X'),
(2, '818074178-8'),
(3, '598378647-4'),
(4, '823942962-9'),
(5, '622615924-3'),
(6, '909893829-9'),
(7, '428308507-3'),
(8, '643000129-6'),
(8, '007919126-6'),
(8, '113648857-X'),
(9, '238501061-5'),
(10, '710737254-8'),
(11, '508820449-3'),
(12, '967697938-4'),
(13, '845633627-0'),
(14, '546585337-9'),
(15, '523019024-8'),
(15, '009066565-1'),
(16, '460503309-2'),
(17, '504443845-6'),
(18, '480910812-0'),
(19, '460517955-0'),
(19, '148956675-9'),
(20, '499050502-6'),
(20, '295647859-1'),
(21, '191711496-6'),
(22, '908142405-X'),
(23, '842953482-2'),
(24, '012490413-0'),
(25, '523605904-6')

