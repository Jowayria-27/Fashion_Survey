/*DROP TABLE IF EXISTS Feedback_Responses;
DROP TABLE IF EXISTS Feedback_Questions;
DROP TABLE IF EXISTS Survey_Responses;
DROP TABLE IF EXISTS Survey_Questions;
DROP TABLE IF EXISTS Users;*/
/*Drop table if exists Responses;*/

Create Table Users(
UID int IDENTITY(1,1) primary key,
Name Varchar(100),
Age varchar(10),
Education varchar(100),
Gender varchar(50),
Starttime datetime,
Endtime datetime,
Duration varchar(50));

Create Table Survey_Questions(
QID int NOT NULL primary key,
Question varchar(300));
Create Table Survey_Responses(
AID int not null Identity (1,1) primary key,
Answer varchar(300),
UID int not null,
QID int not null,
FOREIGN KEY (UID) REFERENCES Users(UID),
FOREIGN KEY (QID) REFERENCES Survey_Questions(QID)
);
Create Table Feedback_Questions(
FQID int not null primary key,
Question varchar(300));


Create Table Feedback_Responses(
FAID int Identity (1,1) primary key,
Answer varchar(300),
UID int not null,
FQID int not null,
FOREIGN KEY (UID) REFERENCES Users(UID),
FOREIGN KEY (FQID) REFERENCES Feedback_Questions(FQID)
);

Insert into Survey_Questions (QID,Question) values
(1, 'I am confident in knowing the definition of fast fashion'),
(2, 'Fast fashion brands have influenced the contents of my wardrobe'),
(3, 'It is generally difficult to find information about a products ethicality'),
(4, 'I feel pressured to be ethical/environmental'),
(5, 'Fast fashion clothing quality is generally inadequate'),
(6, 'I would recommend fast fashion brands to others'),
(7, 'It is not a big deal if I purchase clothes I do not really need just because they are on sale'),
(8, ' It is too expensive to buy ethically'),
(9, 'I am happy to pay for delivery fees on online orders'),
(10, 'Realistically, I am willing to change my consumer habits to be ethical (paying more for environmentally-friendly products, shopping less)'),
(11, 'Realistically, I am willing to change my cleaning habits to be more ethical (amount of times clothing is washed through its life-cycle)'),
(12,'Companies using unsustainable production methods should be taxed by the government'),
(13,'I am loyal to a fast fashion brand (i.e. Bershka, Shein, Zara, Pull and bear)'),
(14,'Which factor is most influential in buying an item of clothing?'),
(15,'Do you buy clothes more often online or in-store?'),
(16,'Ultimately, who should be more ethically/environmentally responsible?'),
(17,'What do you believe is the most effective approach to reduce the environmental impact of fast fashion? eg - taxes, regulation/standards, change in customer behavior, change in company attitudes etc etc)');


Insert into Feedback_Questions(FQID, Question) values
(1,' I found the system easy to use'),
(2, 'The various functions in this system were well integrated.'),
(3, 'I felt confident using the system'),
(4, 'Did you find the survey helpful in increasing your understanding of the topic?'),
(5, 'I was encouraged to complete that survey because:'),
(6, 'It was fun to answer the survey'),
(7, 'I would recommend that survey to others'),
(8, 'The time I spent answering this survey just slipped away.'),
(9, 'I was absorbed in this experience'),
(10, 'This survey was aesthetically appealing'),
(11, 'If surveys that businesses/people send were as gamified, I would be more interested to answer them'),
(12, 'Please share any additional comments or feedback about your experience with the survey in the text box below. Your input is valuable to us. How can we improve this survey?');




-- Check Survey_Responses expects UID as FOREIGN KEY
/*EXEC sp_fkeys 'Survey_Responses';
Insert into Survey_Responses (Answer,Uid,QID) values (NULL,1009,1);*/

/*Create Table Responses(
UID int IDENTITY(1,1) primary key,
Name Varchar(100),
Age varchar(10),
Education varchar(100),
Gender varchar(50),
Starttime datetime,
Endtime datetime,
Duration time,
Q1 VARCHAR(50),
Q2 VARCHAR(50),
Q3 VARCHAR(50),
Q4 VARCHAR(50),
Q5 VARCHAR(50),
Q6 VARCHAR(50),
Q7 VARCHAR(50),
Q8 VARCHAR(50),
Q9 VARCHAR(50),
Q10 VARCHAR(50),
Q11 VARCHAR(50),
Q12 VARCHAR(50),
Q13 VARCHAR(50),
Q14 VARCHAR(100),
Q15 VARCHAR(100),
Q16 VARCHAR(100),
Q17 VARCHAR(300),
FQ1 VARCHAR(50),
FQ2 VARCHAR(50),
FQ3 VARCHAR(50),
FQ4 VARCHAR(50),
FQ5 VARCHAR(50),
FQ6 VARCHAR(50),
FQ7 VARCHAR(50),
FQ8 VARCHAR(50),
FQ9 VARCHAR(50),
FQ10 VARCHAR(50),
FQ11 VARCHAR(300));*/


/*SELECT 
    U.UID,
    MAX(Name) AS Name,
    MAX(Age) AS Age,
    MAX(Education) AS Education,
    MAX(Gender) AS Gender,
    MAX(Starttime) AS Starttime,
    MAX(Endtime) AS Endtime,
    MAX(Duration) AS Duration,

    -- Survey Questions
    MAX(CASE WHEN S.QID = '1' THEN S.Answer END) AS SQ1,
    MAX(CASE WHEN S.QID = '2' THEN S.Answer END) AS SQ2,
    MAX(CASE WHEN S.QID = '3' THEN S.Answer END) AS SQ3,
    MAX(CASE WHEN S.QID = '4' THEN S.Answer END) AS SQ4,
    MAX(CASE WHEN S.QID = '5' THEN S.Answer END) AS SQ5,
    MAX(CASE WHEN S.QID = '6' THEN S.Answer END) AS SQ6,
    MAX(CASE WHEN S.QID = '7' THEN S.Answer END) AS SQ7,
    MAX(CASE WHEN S.QID = '8' THEN S.Answer END) AS SQ8,
    MAX(CASE WHEN S.QID = '9' THEN S.Answer END) AS SQ9,
    MAX(CASE WHEN S.QID = '10' THEN S.Answer END) AS SQ10,
    MAX(CASE WHEN S.QID = '11' THEN S.Answer END) AS SQ11,
    MAX(CASE WHEN S.QID = '12' THEN S.Answer END) AS SQ12,
    MAX(CASE WHEN S.QID = '13' THEN S.Answer END) AS SQ13,
    MAX(CASE WHEN S.QID = '14' THEN S.Answer END) AS SQ14,
    MAX(CASE WHEN S.QID = '15' THEN S.Answer END) AS SQ15,
    MAX(CASE WHEN S.QID = '16' THEN S.Answer END) AS SQ16,
    MAX(CASE WHEN S.QID = '17' THEN S.Answer END) AS SQ17,

    -- Feedback Questions
    MAX(CASE WHEN R.FQID = '1' THEN R.Answer END) AS FQ1,
    MAX(CASE WHEN R.FQID = '2' THEN R.Answer END) AS FQ2,
    MAX(CASE WHEN R.FQID = '3' THEN R.Answer END) AS FQ3,
    MAX(CASE WHEN R.FQID = '4' THEN R.Answer END) AS FQ4,
    MAX(CASE WHEN R.FQID = '5' THEN R.Answer END) AS FQ5,
    MAX(CASE WHEN R.FQID = '6' THEN R.Answer END) AS FQ6,
    MAX(CASE WHEN R.FQID = '7' THEN R.Answer END) AS FQ7,
    MAX(CASE WHEN R.FQID = '8' THEN R.Answer END) AS FQ8,
    MAX(CASE WHEN R.FQID = '9' THEN R.Answer END) AS FQ9,
    MAX(CASE WHEN R.FQID = '10' THEN R.Answer END) AS FQ10,
    MAX(CASE WHEN R.FQID = '12' THEN R.Answer END) AS FQ11,
    MAX(CASE WHEN R.FQID = '11' THEN R.Answer END) AS FQ12

FROM Users U
LEFT JOIN Survey_Responses S ON S.UID = U.UID
LEFT JOIN Feedback_Responses R ON R.UID = U.UID
WHERE U.UID != 1 and U.duration IS NOT NULL
GROUP BY U.UID;
*/