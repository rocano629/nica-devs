IF NOT EXISTS 
    (SELECT * FROM sys.symmetric_keys WHERE symmetric_key_id = 101)
    CREATE MASTER KEY ENCRYPTION BY 
    PASSWORD = '23987hxJKL95QYV4369#ghf0%lekjg5k3fd117r$$#1946kcj$n44ncjhdlj'

CREATE CERTIFICATE Sales09
   WITH SUBJECT = 'Customer Credit Card Numbers';
GO

CREATE SYMMETRIC KEY CreditCards_Key11
    WITH ALGORITHM = AES_256
    ENCRYPTION BY CERTIFICATE Sales09;
GO

OPEN SYMMETRIC KEY CreditCards_Key11
   DECRYPTION BY CERTIFICATE Sales09;

alter table [dbo].[CAESS_FEB_2014]
add MEDIDOR_E VARBINARY(128)


USE AdventureWorks2012

-- Create a column in which to store the encrypted data.
ALTER TABLE Sales.CreditCard 
    ADD CardNumber_Encrypted varbinary(128); 
GO

-- Open the symmetric key with which to encrypt the data.
OPEN SYMMETRIC KEY CreditCards_Key11
   DECRYPTION BY CERTIFICATE Sales09;



UPDATE Sales.CreditCard
SET CardNumber_Encrypted = EncryptByKey(Key_GUID('CreditCards_Key11')
    , CardNumber, 1, HashBytes('SHA1', CONVERT( varbinary
    , CreditCardID)));
SELECT * FROM Sales.CreditCard