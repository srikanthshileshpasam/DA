--CREATING DATABASE
CREATE DATABASE IT_Inventory_System;

--CREATING TABLES
	--HARDWARE TYPE
	CREATE TABLE HARDWARE_TYPES (
	HWTCode varchar(50) NOT NULL,
	HWTDescription varchar(50) NOT NULL,
	PRIMARY KEY (HWTCode)
	);

	--SOFTWARE TYPE
	CREATE TABLE SOFTWARE_TYPES (
	SWTCode varchar(50) NOT NULL,
	SWTDescription varchar(50) NOT NULL,
	PRIMARY KEY (SWTCode)
	);

	--HARDWARE
	CREATE TABLE HARDWARE (
	HardwareID varchar(50) NOT NULL,
	HWTCode varchar(50) NOT NULL,
	Description varchar(50) NOT NULL,
	Manufacturer varchar(50) NOT NULL,
	Model varchar(50) NOT NULL,
	Purchasing_Date date NOT NULL,
	Hardware_Cost int NOT NULL,
	Manufacturer_Weblink varchar(50) NOT NULL,
	Warranty_Details varchar(50) NOT NULL,
	Additional_Details varchar(50),
	Dimensions varchar(50),
	Power_Consumption int NOT NULL,
	PRIMARY KEY (HardwareID),
	FOREIGN KEY (HWTCode) REFERENCES [dbo].[HARDWARE_TYPES]([HWTCode])
	);

	--SOFTWARE
	CREATE TABLE SOFTWARE (
	SoftwareID varchar(50) NOT NULL,
	SWTCode varchar(50) NOT NULL,
	Software_Name varchar(50) NOT NULL,
	Manufacture varchar(50) NOT NULL,
	Purchasing_Date varchar(50) NOT NULL,
	Website varchar(50),
	Version int NOT NULL,
	Software_Description varchar(50) NOT NULL,
	Licensing_Information varchar(50),
	Software_Packs varchar(50) NOT NULL,
	Patches varchar(50) NOT NULL,
	OS_Requirements varchar(50),
	Software_Cost varchar(50) NOT NULL,
	Licensing_Cost int NOT NULL,
	Architecture varchar(50),
	Installation_Details varchar(50),
	PRIMARY KEY (SoftwareID),
	FOREIGN KEY (SWTCode) REFERENCES [dbo].[SOFTWARE_TYPES]([SWTCode])
	);

	--HARDWARE_SOFTWARE
	CREATE TABLE HARDWARE_SOFTWARE (
	HardwareID varchar(50) NOT NULL,
	SoftwareID varchar(50) NOT NULL,
	Installation_Date date NOT NULL,
	Installation_Done_By varchar(50) NOT NULL,
	HDD_Usage_MBs int NOT NULL,
	Installation_Path varchar(50) NOT NULL,
	Service_Display_Name varchar(50),
	Default_Program varchar(50),
	PRIMARY KEY (HardwareID, SoftwareID),
	FOREIGN KEY (HardwareID) REFERENCES [dbo].[HARDWARE]([HardwareID]),
	FOREIGN KEY (SoftwareID) REFERENCES [dbo].[SOFTWARE]([SoftwareID])
	);

--INSERTING VALUES IN THE COLUMNS
		--HARDWARE_TYPES
		INSERT INTO [dbo].[HARDWARE_TYPES] VALUES ('HWT1000', 'LCD');
		INSERT INTO [dbo].[HARDWARE_TYPES] VALUES ('HWT2000', 'CPU');
		INSERT INTO [dbo].[HARDWARE_TYPES] VALUES ('HWT3000', 'Keyboard');
		INSERT INTO [dbo].[HARDWARE_TYPES] VALUES ('HWT4000', 'Mouse');
		INSERT INTO [dbo].[HARDWARE_TYPES] VALUES ('HWT5000', 'Head Phone');
		INSERT INTO [dbo].[HARDWARE_TYPES] VALUES ('HWT6000', 'Routers');
		INSERT INTO [dbo].[HARDWARE_TYPES] VALUES ('HWT7000', 'Server');
		INSERT INTO [dbo].[HARDWARE_TYPES] VALUES ('HWT8000', 'Laptop');

		--SOFTWARE_TYPES
		INSERT INTO [dbo].[SOFTWARE_TYPES] VALUES ('SWT1000', 'Operating System');
		INSERT INTO [dbo].[SOFTWARE_TYPES] VALUES ('SWT2000', 'Programming Lanuage');
		INSERT INTO [dbo].[SOFTWARE_TYPES] VALUES ('SWT3000', 'Antivirus');
		INSERT INTO [dbo].[SOFTWARE_TYPES] VALUES ('SWT4000', 'Graphic Designing');
		INSERT INTO [dbo].[SOFTWARE_TYPES] VALUES ('SWT5000', 'Word Processor');
		INSERT INTO [dbo].[SOFTWARE_TYPES] VALUES ('SWT6000', 'BI Tool');
		INSERT INTO [dbo].[SOFTWARE_TYPES] VALUES ('SWT7000', 'Web Designing Tool');
		INSERT INTO [dbo].[SOFTWARE_TYPES] VALUES ('SWT8000', 'Database Management');

		--HARDWARE
		INSERT INTO [dbo].[HARDWARE] VALUES ('H1000', 'HWT1000', 'LCD', 'SAMSUNG', 'SG12345', '09-01-2019', '400', 'http://www.samsung.ca', '1 year', 'Extended Warranty', '21in', '110');
		INSERT INTO [dbo].[HARDWARE] VALUES ('H2000', 'HWT1000', 'LCD', 'HP', 'HP12345', '08-01-2019', '200', 'http://www.hp.ca', '6 months', 'Used', '17in', '110');
		INSERT INTO [dbo].[HARDWARE] VALUES ('H3000', 'HWT2000', 'CPU', 'DELL', 'DE12345', '07-01-2019', '800', 'http://www.dell.ca', '1 year', 'New', '10in x 10in', '110');
		INSERT INTO [dbo].[HARDWARE] VALUES ('H4000', 'HWT2000', 'CPU', 'IBM', 'IB12345', '10-01-2019', '700', 'http://www.dell.ca', '1 year', 'New', '10in x 10in', '110');
		INSERT INTO [dbo].[HARDWARE] VALUES ('H5000', 'HWT3000', 'Keyboard', 'Microsoft', 'MI12345', '01-01-2019', '150', 'http://www.microsoft.ca', '1 year', 'New', '10in x 5in', '110');
		INSERT INTO [dbo].[HARDWARE] VALUES ('H6000', 'HWT4000', 'Mouse', 'Microsoft', 'MI56789', '04-01-2019', '80', 'http://www.microsoft.ca', '1 year', 'New', '3in x 3in', '110');
		INSERT INTO [dbo].[HARDWARE] VALUES ('H7000', 'HWT5000', 'Head Phone', 'Bose', 'BO12345', '05-01-2019', '300', 'http://www.bose.ca', '2 years', 'New', '5in x 7in', '110');
		INSERT INTO [dbo].[HARDWARE] VALUES ('H8000', 'HWT6000', 'Router', 'Cisco', 'CI12345', '08-01-2019', '1800', 'http://www.cisco.ca', '3 years', 'New', '20in x 10in', '110');
		INSERT INTO [dbo].[HARDWARE] VALUES ('H9000', 'HWT7000', 'Server', 'Lenovo', 'LE12345', '06-01-2019', '5800', 'http://www.lenovo.ca', '5 years', 'New', '15in x 15in', '110');
		INSERT INTO [dbo].[HARDWARE] VALUES ('H10000', 'HWT7000', 'Server', 'DELL', 'DE04567', '05-01-2019', '5500', 'http://www.dell.ca', '5 years', 'New', '15in x 15in', '110');
		INSERT INTO [dbo].[HARDWARE] VALUES ('H11000', 'HWT8000', 'Laptop', 'Toshiba', 'TO12345', '07-01-2019', '1700', 'http://www.toshiba.ca', '1 year', 'New', '17in', '110');
		INSERT INTO [dbo].[HARDWARE] VALUES ('H12000', 'HWT8000', 'Laptop', 'HP', 'HP03456', '10-01-2019', '2000', 'http://www.hp.ca', '1 year', 'New', '15.1in', '110');
		INSERT INTO [dbo].[HARDWARE] VALUES ('H13000', 'HWT8000', 'Laptop', 'IBM', 'IB35350', '09-01-2019', '2100', 'http://www.ibm.ca', '1 year', 'New', '15.1in', '110');
		INSERT INTO [dbo].[HARDWARE] VALUES ('H14000', 'HWT8000', 'Laptop', 'IBM', 'IB06786', '03-01-2019', '1900', 'http://www.ibm.ca', '1 year', 'New', '15.1in', '110');

		--SOFTWARE
		INSERT INTO [dbo].[SOFTWARE] VALUES ('S1000', 'SWT1000', 'Windows', 'Microsoft', '09-01-2019', 'http://www.microsoft.ca', '7', 'Operating System', 'Lifetime', 'Service Pack 3', '0', 'Core i5', '299', '299', '32 bit', 'Installed on 09-01-2019');
		INSERT INTO [dbo].[SOFTWARE] VALUES ('S2000', 'SWT1000', 'Windows', 'Microsoft', '08-01-2019', 'http://www.microsoft.ca', '10', 'Operating System', 'Lifetime', 'Service Pack 1', '0', 'Core i7', '399', '399', '64 bit', 'Installed on 08-01-2019');
		INSERT INTO [dbo].[SOFTWARE] VALUES ('S3000', 'SWT2000', 'C Sharp', 'Microsoft', '06-01-2019', 'http://www.microsoft.ca', '5', 'Programming Language', 'Lifetime', '0', '0', 'Core i3', '199', '199', '64 bit', 'Installed on 06-01-2019');
		INSERT INTO [dbo].[SOFTWARE] VALUES ('S4000', 'SWT3000', 'McAfee LiveSafe', 'McAfee', '05-01-2019', 'http://www.mcafee.ca', '9', 'Antivirus', '1 year', 'Service Pack 1001', '0', 'Dual Core', '89', '89', '64 bit', 'Installed on 05-01-2019');
		INSERT INTO [dbo].[SOFTWARE] VALUES ('S5000', 'SWT4000', 'Adobe Photoshop', 'Adobe', '07-01-2019', 'http://www.adobe.ca', '11', 'Graphic Designing', '1 year', 'SP01', '2', 'Core i3', '109', '109', '64 bit', 'Installed on 07-01-2019');
		INSERT INTO [dbo].[SOFTWARE] VALUES ('S6000', 'SWT5000', 'Ms-Office 365', 'Microsoft', '04-01-2019', 'http://www.microsoft.ca', '365', 'Word Processor', 'Lifetime', 'SP3', '4', 'Core i3', '199', '199', '64 bit', 'Installed on 04-01-2019');
		INSERT INTO [dbo].[SOFTWARE] VALUES ('S7000', 'SWT6000', 'Power BI', 'Microsoft', '09-01-2019', 'http://www.microsoft.ca', '11', 'BI Tool', 'Lifetime', 'SP1', '1', 'Core i5', '299', '299', '64 bit', 'Installed on 09-01-2019');
		INSERT INTO [dbo].[SOFTWARE] VALUES ('S8000', 'SWT7000', 'Visual Studio', 'Microsoft', '04-01-2019', 'http://www.microsoft.ca', '9', 'Web Designing Tool', '1 year', 'SP1', '1', 'Core i5', '399', '399', '64 bit', 'Installed on 04-01-2019');
		INSERT INTO [dbo].[SOFTWARE] VALUES ('S9000', 'SWT8000', 'SQL Server Management', 'Microsoft', '03-01-2019', 'http://www.microsoft.ca', '17', 'Database Management', '2 years', 'SP3', '6', 'Core i5', '599', '599', '64 bit', 'Installed on 03-01-2019');

		--HARDWARE_SOFTWARE
		INSERT INTO [dbo].[HARDWARE_SOFTWARE] VALUES ('H3000', 'S1000', '09-01-2019', 'John', '1024', 'C: Drive', 'Full Service', 'Yes');
		INSERT INTO [dbo].[HARDWARE_SOFTWARE] VALUES ('H4000', 'S2000', '08-01-2019', 'Sameer', '1536', 'C: Drive', 'Full Service', 'Yes');
		INSERT INTO [dbo].[HARDWARE_SOFTWARE] VALUES ('H9000', 'S3000', '06-01-2019', 'Sameer', '536', 'C: Drive', 'Full Service', 'Yes');
		INSERT INTO [dbo].[HARDWARE_SOFTWARE] VALUES ('H10000', 'S4000', '05-01-2019', 'Mike', '588', 'C: Drive', 'Full Service', 'Yes');
		INSERT INTO [dbo].[HARDWARE_SOFTWARE] VALUES ('H11000', 'S5000', '07-01-2019', 'David', '800', 'C: Drive', 'Partial Service', 'Yes');
		INSERT INTO [dbo].[HARDWARE_SOFTWARE] VALUES ('H12000', 'S6000', '04-01-2019', 'Zheng', '1500', 'C: Drive', 'Partial Service', 'Yes');
		INSERT INTO [dbo].[HARDWARE_SOFTWARE] VALUES ('H13000', 'S7000', '09-01-2019', 'Zheng', '1200', 'C: Drive', 'Partial Service', 'Yes');
		INSERT INTO [dbo].[HARDWARE_SOFTWARE] VALUES ('H14000', 'S8000', '04-01-2019', 'Bill', '900', 'C: Drive', 'Partial Service', 'Yes');


