----------UC1-Address Book Database----------
create database Address_Book
use Address_Book
----------UC2-Address Book Table----------
create table Address_Book_Table
(
  Id int identity(1,1) primary key,
  FirstName varchar(200),
  LastName varchar(200),
  Address varchar(200),
  City varchar(100),
  State varchar(100),
  ZipCode bigint,
  PhoneNumber bigint,
  Email varchar(200)
)
----------UC3-Insert values into the Address Book Table----------
insert into Address_Book_Table values 
('Chandler','Bing','Central Park','Adol','NewYork',12345,1234567,'chan@gmail.com'),
('Monica','Geller','Marilon','Kindle','NewJersy',6789,11234567,'mon@gmail.com'),
('Damon','Salvatore','MysticFalls','Gago','London',764561,47653272,'dam@gmail.com'),
('Joey','Tribiani','Seattle','Boredom','Canada',41365,57887482,'joey@gmail.com')
 select *from Address_Book_Table;
 ----------UC4-Insert values into the Address Book Table----------
 update Address_Book_Table set ZipCode=123456,PhoneNumber=98765321 where FirstName ='Monica' 
 select *from Address_Book_Table;