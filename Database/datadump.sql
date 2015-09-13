--
-- Dumping data for table `company`
--
INSERT INTO `company` (`companyID`, `companyName`, `typeOfCompany`, `phoneNumber` , `address`, `insurance`, `insuranceDocuments`, `termsAndAgreements`) VALUES
(1, 'Pepsi Cola', 'typeOfCompany', '123-456-7890','1 Pepsi Way Somers NY 10589', 1, 'insuranceDocuments','termsAndAgreements'),
(2, 'Coca Cola', 'typeOfCompany', '098-765-4321','1 Coca Way Somers NY 10589', 0, 'insuranceDocuments','termsAndAgreements');

--
-- Dumping data for table `company_job`
--
INSERT INTO `company_job` (`companyID`, `jobID`) VALUES
(1, 2),
(2, 1);

--
-- Dumping data for table `jobs`
--
INSERT INTO `jobs` (`jobID`, `jobTitle`, `desiredStaff`, `nameOfEvent` , `duties`, `rate`, `date`, `time`,`location`,`gender`,`languagesNeeded`,`tattoos`,`piercings` ) VALUES
(1, 'coca event', 0, 'nameOfEvent','coca event name', 30.00, '10/01/15','8:00pm','miami', 0, 'english','0', '0'),
(2, 'pepsi event', 1, 'nameOfEvent','pepsi event name', 45.00, '11/01/15','11:00pm','broward', 1, 'english','0', '0');


--
-- Dumping data for table `people`
--
INSERT INTO `people` (`peopleID`, `companyID`, `staffType`, `firstName` , `middleInitial`, `lastName`, `nickname`, `email`,`address`,`phone`,`profession`,`website`,`socialMedia`, `pictures`,`dateOfBirth`,`gender`,`languages`,`typeDL`,`ethnicity`,`height`,`weight`,`hairColor`,`eyeColor`,`shirtSize`,`pantSize`,`chestSize`,`waistSize`,`hipSize`,`dressSize`,`shoeSize`,`tattoos`,`piercings`,`desiredPayRate`,`ssnOrEin`,`travel`,`insurance`,`insuranceDocuments`, `bankRouting`, `accountNumber`, `resume` ) VALUES
(1, 1, 1, 'Luis', 'A', 'Castillo', 'Lu', 'luoandre29@hotmail.com','11200 Sw 8 St Miami, FL 33199','123-000-7890',1,'luis.castille.me','luandrecast', 'pictures','11/29/1987',1,'english, spanish', 1, 3, 5.5, 150.0, 'black','brown','M',0,0,0,0,0, 8,0,0,30,'12345678709',1,0,'insuranceDocuments', 'bankRouting', 'accountNumber', 'resume'),
(2, 0, 2, 'Wilfredo', 'G', 'Gomez', 'Willy', 'willyggh@outlook.com','10555 W Flagger St Miami, Fl 33174','098-000-1234',2,'wilfredo.gomez.me','willyggh', 'pictures','4/16/1989',1,'enlish, spanish', 0, 2, 5.6, 160.0, 'black','dark brown',0,0,0,0,0,0,9,0,0,35,'12345678709',0,1,'insuranceDocuments', 'bankRouting', 'accountNumber', 'resume');


--
-- Dumping data for table `registeredcompany`
--
INSERT INTO `registeredcompany` (`companyID`, `username`,`password`, `email`, `emailValidated`) VALUES
(1, 'luoandre29Dos','$2y$10$G2kKzSJ/tgY2xUSUIsSS9uug7eycD7NNrNwC3lPZvuWvZwHa3FyKq','lcast053@fiu.edu',0),
(2, 'willygghDos','$2y$10$G2kKzSJ/tgY2xUSUIsSS9uug7eycD7NNrNwC3lPZvuWvZwHa3FyKq','wgome015@fiu.edu',0);
-- password   = hashedpassword
-- passwordDos = $2y$10$G2kKzSJ/tgY2xUSUIsSS9uug7eycD7NNrNwC3lPZvuWvZwHa3FyKq


--
-- Dumping data for table `registeredstaff`
--
INSERT INTO `registeredstaff` (`peopleID`, `username`,`password`, `email`, `emailValidated`) VALUES
(1, 'luoandre29Uno','$2y$10$Ssps5xdqAyN1sMFidvG20O/AAQbuSo8h4fvucgoyp8yYRT7q2hKO6','luoandre29@yahoo.com',0),
(2, 'willygghUno','$2y$10$Ssps5xdqAyN1sMFidvG20O/AAQbuSo8h4fvucgoyp8yYRT7q2hKO6','willyggh@gmail.com',0);
-- password   = hashedpassword
-- passwordUno = $2y$10$Ssps5xdqAyN1sMFidvG20O/AAQbuSo8h4fvucgoyp8yYRT7q2hKO6
--
-- Dumping data for table `stafftype`
--
INSERT INTO `stafftype` (`staffID`, `jobTitle`) VALUES
(1, 'Bartender'),
(2, 'Waiter/Waitress'),
(3, 'Model'),
(4, 'Sales Executive');

