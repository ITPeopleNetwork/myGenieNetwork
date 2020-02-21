USE myGenieNetworkDB;

GO
DROP TABLE TestUserRights;
GO

DROP Table Employer_profile ;
GO 
CREATE TABLE Employer_profile 
(
employer_name int NOT NULL PRIMARY KEY,
business_domain varchar(255), 
address varchar(255),
primary_contact varchar(100),
user_Id varchar(255),
password varchar(50), 
fullName varchar(100),
email_Id varchar(100), 
phone_Number bigint, 
company varchar(100), 
designation? varchar(100), 
role nvarchar(50), 
interest_topic varchar(200), 
linkedin varchar(100))
;

GO


