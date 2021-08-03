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
 ----------UC8-Sort the Names by City in the Address Book Table ----------
 select * from Address_Book_Table Where City='Gago' order by(firstName)
 ----------UC9-Identify each Address Book with name and Type----------
 insert into Address_Book_Table(FirstName,LastName,Address,City,State,ZipCode,PhoneNumber,Email) values 
('Monica','Geller','Marilon','Kindle','NewJersy',6789,11234567,'mon@gmail.com'),
('Rachel','Green','Greenland','Vietnam','Mexico',6521,974650012,'rach@gmail.com')
select * from Address_Book_Table 
alter table Address_Book_Table add AddressBookType varchar(200)
update Address_Book_Table set AddressBookType='Friends' where FirstName='Joey' or FirstName='Rachel'
update Address_Book_Table set AddressBookType='Family' where FirstName='Chandler' or FirstName='Monica'
update Address_Book_Table set AddressBookType='Profession' where FirstName='Damon'
select * from Address_Book_Table
----------UC10 Count the Contacts by AddressBook Type-----------
select count(FirstName)as NunOfContacts,AddressBookType from Address_Book_Table group by AddressBookType
----------UC11 Add person to both Friend and Family-----------
insert into Address_Book_Table values 
('Chandler','Bing','Central Park','Adol','NewYork',12345,1234567,'chan@gmail.com','Friends')
select * from Address_Book_Table
-----------UC12 Implement the ER Diagram for Address Book Service DB----------
create table AddressBook
(
AddressBook_ID int primary key,
AddressBook_Name varchar(100)
)
insert into AddressBook values (1,'Sona'),(2,'Damon');
select*from AddressBook

create table Contacts
(
  AddressBook_ID int,
  Contact_Id int identity(1,1) primary key,
  FirstName varchar(200),
  LastName varchar(200),
  Address varchar(200),
  City varchar(100),
  State varchar(100),
  ZipCode bigint,
  PhoneNumber bigint,
  Email varchar(200)
  foreign key (AddressBook_ID) references AddressBook(AddressBook_ID)
)
select *from Contacts

insert into Contacts(AddressBook_ID,FirstName,LastName,Address,City,State,ZipCode,PhoneNumber,Email)values
(1,'Chandler','Bing','Central Park','Adol','NewYork',12345,1234567,'chan@gmail.com'),
(1,'Monica','Geller','Marilon','Kindle','NewJersy',6789,11234567,'mon@gmail.com'),
(2,'Damon','Salvatore','MysticFalls','Gago','London',764561,47653272,'dam@gmail.com'),
(1,'Joey','Tribiani','Seattle','Boredom','Canada',41365,57887482,'joey@gmail.com'),
(2,'Rachel','Green','Greenland','Vietnam','Mexico',6521,974650012,'rach@gmail.com')

create table ContactType 
(
 ContactType_Id int identity (1,1) primary key,
 ContactType_Name varchar(50),
)
insert into ContactType values ('Friend'),('Family'),('Profession')
select * from ContactType

create Table AddressBook_Type(
ContactType_ID int,
Contact_ID int,
foreign key (ContactType_ID) references ContactType(ContactType_ID),
foreign key (Contact_ID) references Contacts(Contact_ID)
)
insert into AddressBook_Type values
(1,3),
(1,5),
(2,1),
(3,2),
(2,4)
Select * from AddressBook_Type;

