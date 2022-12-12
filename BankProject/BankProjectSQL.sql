BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "Transaction" (
	"transactionId"	INTEGER,
	"recieverId"	INTEGER,
	"recieverName"	VARCHAR(50),
	"senderId"	INTEGER,
	"senderName"	VARCHAR(50),
	"Amount"	INTEGER,
	PRIMARY KEY("transactionId" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Account" (
	"accountId"	INTEGER,
	"iban"	INTEGER,
	"type"	VARCHAR(50),
	"password"	VARCHAR(50),
	"balance"	INTEGER,
	PRIMARY KEY("accountId" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Customer" (
	"customerId"	INTEGER,
	"customerName"	VARCHAR(50),
	"customerAddress"	VARCHAR(50),
	PRIMARY KEY("customerId" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Loan" (
	"loanId"	INTEGER,
	"intress"	INTEGER,
	"type"	VARCHAR(50),
	PRIMARY KEY("loanId" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Banker" (
	"bankerId"	INTEGER,
	"bankerName"	VARCHAR(50),
	"bankerAddress"	VARCHAR(50),
	PRIMARY KEY("bankerId" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Bank" (
	"bankId"	INTEGER,
	"bankName"	VARCHAR(50),
	"bankAddress"	VARCHAR(50),
	"bankLocation"	VARCHAR(50),
	PRIMARY KEY("bankId" AUTOINCREMENT)
);
INSERT INTO "Transaction" VALUES (1,1,'eka',2,'kolmas',200);
INSERT INTO "Transaction" VALUES (2,3,'toka',2,'kolmas',150);
INSERT INTO "Transaction" VALUES (3,2,'toka',1,'eka',10);
INSERT INTO "Account" VALUES (1,1234,'Savings','password',0);
INSERT INTO "Account" VALUES (2,2345,'Spending','passw0rd',100);
INSERT INTO "Account" VALUES (3,3456,'Food','p4ssword',1000);
INSERT INTO "Customer" VALUES (1,'Meikämakeli','Katu 7');
INSERT INTO "Customer" VALUES (2,'Teikäläinen','Kuja 3');
INSERT INTO "Customer" VALUES (3,'Jokainen','Satama 1');
INSERT INTO "Loan" VALUES (1,0.7,'Morgage');
INSERT INTO "Loan" VALUES (2,0.01,'Studentloan');
INSERT INTO "Loan" VALUES (3,1.3,'Car');
INSERT INTO "Banker" VALUES (1,'Tuomas','Orion 4');
INSERT INTO "Banker" VALUES (2,'Altti','Laserkatu 0');
INSERT INTO "Banker" VALUES (3,'Joona','Jokakatu 7');
INSERT INTO "Bank" VALUES (1,'LprB','Lappeenkatu 3','Lappeenranta');
INSERT INTO "Bank" VALUES (2,'KnmB','Kirkonkatu 7','Kirkkonummi');
INSERT INTO "Bank" VALUES (3,'TmpB','Keskustakuja 5','Tampere');
INSERT INTO "Bank" VALUES (4,'LapB','Skinnarila 2','Lappeenranta');
INSERT INTO "Bank" VALUES (5,'LutB','Yliopisto 1','Lappeenranta');
INSERT INTO "Bank" VALUES (6,'HelB','Helsingintie 10','Helsinki');
INSERT INTO "Bank" VALUES (7,'HebB','Rantakatu 3','Helsinki');
COMMIT;
