Create Table Users(
UID int NOT NULL IDENTITY(1,1) primary key,
Name Varchar(100),
Age int,
Education nvarchar(100),
Gender varchar(50),
Starttime datetime,
Endtime datetime,
Duration datetime);

Create Table Survey_Questions(
QID int NOT NULL Identity(1,1) primary key,
Question varchar(100));

Create Table Survey_Responses(
AID int not null Identity (1,1) primary key,
Answer nvarchar(200),
Uid int not null,
QID int not null
FOREIGN KEY (UID) REFERENCES Users(UID)
FOREIGN KEY (QID) REFERENCES Survey_Questions(QID)
);
Create Table Feedback_Questions(
FQID int NOT NULL Identity(1,1) primary key,
Question varchar(100));


Create Table Feedback_Responses(
FAID int not null Identity (1,1) primary key,
Answer nvarchar(200),
Uid int not null,
FQID int not null
FOREIGN KEY (UID) REFERENCES Users(UID)
FOREIGN KEY (FQID) REFERENCES Feedback_Questions(FQID)
);