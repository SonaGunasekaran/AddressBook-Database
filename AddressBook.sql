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
 ----------UC4-Edit contact details using name in Address Book Table----------
 update Address_Book_Table set ZipCode=123456,PhoneNumber=98765321 where FirstName ='Monica' 
 select *from Address_Book_Table;
 ----------UC5-Delete contact details using name from the Address Book Table----------
 delete from Address_Book_Table  where FirstName ='Monica' 
 select *from Address_Book_Table;
 ----------UC6-Retrieve details using city or state from the Address Book Table----------
 select * from Address_Book_Table Where City='Gago' or State ='London' 
 ----------UC7-Size of address book by City and State----------
 select count(FirstName) as NumOfContacts,State from Address_Book_Table group by State
 select count(FirstName) as NumOfContacts,City from Address_Book_Table group by City