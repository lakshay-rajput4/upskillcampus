-- 1 Client Table
CREATE TABLE `bank_schema`.`client` (
  `client_id` int NOT NULL AUTO_INCREMENT,
  `f_name` varchar(45) NOT NULL,
  `l_name` varchar(45) NOT NULL,
  `father_name` varchar(45) NOT NULL,
  `mother_name` varchar(45) NOT NULL,
  `CNIC` varchar(45) NOT NULL,
  `DOB` date NOT NULL,
  `phone` varchar(45) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `address` varchar(100) NOT NULL,
  PRIMARY KEY (`client_id`),
  UNIQUE KEY `client_id_UNIQUE` (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

ALTER TABLE bank_schema.client AUTO_INCREMENT=10000;

-- 2 Login_Account Table
CREATE TABLE `bank_schema`.`login_account` (
  `login_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` char(8) NOT NULL,
  `type` char(1) NOT NULL,
  PRIMARY KEY (`login_id`),
  UNIQUE KEY `login_id_UNIQUE` (`login_id`)
) ENGINE=InnoDB AUTO_INCREMENT=206 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

ALTER TABLE bank_schema.login_account AUTO_INCREMENT=60000;

-- 3 Employee Table
CREATE TABLE `bank_schema`.`employee` (
  `employee_id` int NOT NULL AUTO_INCREMENT,
  `f_name` varchar(45) NOT NULL,
  `l_name` varchar(45) NOT NULL,
  `father_name` varchar(45) NOT NULL,
  `mother_name` varchar(45) NOT NULL,
  `job` varchar(45) NOT NULL,
  `phone_no` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `login_id` int DEFAULT NULL,
  PRIMARY KEY (`employee_id`),
  UNIQUE KEY `employee_id_UNIQUE` (`employee_id`),
  KEY `login_id_idx` (`login_id`),
  CONSTRAINT `login_id` FOREIGN KEY (`login_id`) REFERENCES `login_account` (`login_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

ALTER TABLE bank_schema.employee AUTO_INCREMENT=20000;

-- 4 Card Table
CREATE TABLE `bank_schema`.`card` (
  `card_num` int NOT NULL AUTO_INCREMENT,
  `type` char(1) NOT NULL,
  `Status` char(1) NOT NULL,
  `Pin_code` char(4) NOT NULL,
  `Issue_date` date NOT NULL,
  PRIMARY KEY (`card_num`)
) ENGINE=InnoDB AUTO_INCREMENT=301 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

ALTER TABLE bank_schema.card AUTO_INCREMENT=40000;

-- 5 Bank_Account table
CREATE TABLE `bank_schema`.`bank_account` (
  `acc_num` int NOT NULL AUTO_INCREMENT,
  `client_id` int NOT NULL,
  `login_id` int DEFAULT NULL,
  `type` char(10) NOT NULL,
  `balance` int NOT NULL,
  `status` int NOT NULL,
  `opening_date` date NOT NULL,
  `closing_date` date DEFAULT NULL,
  `card_num` int DEFAULT NULL,
  PRIMARY KEY (`acc_num`),
  UNIQUE KEY `acc_num_UNIQUE` (`acc_num`),
  KEY `client_id` (`client_id`),
  KEY `login_id` (`login_id`),
  KEY `card_num` (`card_num`),
  CONSTRAINT `bank_account_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`),
  CONSTRAINT `bank_account_ibfk_2` FOREIGN KEY (`login_id`) REFERENCES `login_account` (`login_id`),
  CONSTRAINT `bank_account_ibfk_3` FOREIGN KEY (`card_num`) REFERENCES `card` (`card_num`)
) ENGINE=InnoDB AUTO_INCREMENT=402 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

ALTER TABLE bank_schema.bank_account AUTO_INCREMENT=500000;

-- 6 Transaction_History Table
CREATE TABLE `bank_schema`.`transaction_history` (
  `serial_no` int unsigned NOT NULL AUTO_INCREMENT,
  `amount` int NOT NULL,
  `type` varchar(45) NOT NULL,
  `date` date NOT NULL,
  `time` varchar(45) NOT NULL,
  `account_num` int NOT NULL,
  `recv_acc_num` int DEFAULT NULL,
  `cheque_num` int DEFAULT NULL,
  PRIMARY KEY (`serial_no`),
  KEY `account_num` (`account_num`),
  CONSTRAINT `transaction_history_ibfk_1` FOREIGN KEY (`account_num`) REFERENCES `bank_account` (`acc_num`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

ALTER TABLE bank_schema.transaction_history AUTO_INCREMENT=70000;

-- 7 Cardless Withdrawal Table
CREATE TABLE `bank_schema`.`cardless_withdrawl` (
  `serial_no` int NOT NULL AUTO_INCREMENT,
  `card_no` int NOT NULL,
  `amount` int NOT NULL,
  `OTC` varchar(13) NOT NULL,
  `temp_pin` char(4) NOT NULL,
  `Status` char(1) NOT NULL,
  `date` date DEFAULT NULL,
  `time` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`serial_no`),
  UNIQUE KEY `serial_no_UNIQUE` (`serial_no`),
  KEY `card_no` (`card_no`),
  CONSTRAINT `cardless_withdrawl_ibfk_1` FOREIGN KEY (`card_no`) REFERENCES `card` (`card_num`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

ALTER TABLE bank_schema.cardless_withdrawl AUTO_INCREMENT=80000;


-- data set

-- employees
Insert into bank_schema.employee values(NULL, "Harsh", "Bhai", "Faisal", "Komal", "Manager", "03908967581", "harsh123@gmail.com", NULL );
Insert into bank_schema.employee values(NULL, "Faisal", "alam", "Rehmaan Aslam", "Asmeen alamm", "Accountant", "878367573", "faizalali0045@gmail.com", NULL );

-- clients
Insert Into bank_schema.client Values(NULL, "Harish", "Chandra", "Anju Mishra", "Satya Prakash Mishra", "67153-7853257-8", STR_TO_DATE("17,9,1999", "%d,%m,%Y"), "068687865", "aryan987@gmail.com", "House No. 412, Street 7, Fasil Colony, Rawalpindi");
Insert Into bank_schema.client Values(NULL, "Manish", "Yaadav", "suhani", "shivam", "8987735725762-1", STR_TO_DATE("22,3,1995", "%d,%m,%Y"), "63539899633", "kamal_y03@gmail.com", "House No. 112, Street 3B, Block 2, DHA Islamabad");
Insert Into bank_schema.client Values(NULL, "shubham", "kumar", "", "mukul prajapati", "9897535726-1", STR_TO_DATE("4,12,1998", "%d,%m,%Y"), "07635725237", "danielzahid909@gmail.com", "House No. 8, Street 12, Ramzan Colony, Rawalpindi");

-- bank accounts
Insert Into bank_schema.bank_account Values(NULL, 10000, NULL,"Current", 1000, 1, CURDATE(), NULL, NULL);
Insert Into bank_schema.bank_account Values(NULL, 10001, NULL,"Current", 20000, 1, CURDATE(), NULL, NULL);
Insert Into bank_schema.bank_account Values(NULL, 10002, NULL,"Saving", 7000, 1, CURDATE(), NULL, NULL);

-- login account
Insert into bank_schema.login_account values (NULL, "harsh333", "122221", 'M');
Insert into bank_schema.login_account values (NULL, "faisal", "909094", 'A');
Insert into bank_schema.login_account values (NULL, "harish", "blue", 'C');
Insert into bank_schema.login_account values (NULL, "manish", "red", 'C');
Insert into bank_schema.login_account values (NULL, "shubham", "kumar", 'C');

update bank_schema.employee set login_id = 60000 where employee_id = 20000;
update bank_schema.employee set login_id = 60001 where employee_id = 20001;
update bank_schema.bank_account set login_id = 60002 where acc_num = 500000;
update bank_schema.bank_account set login_id = 60003 where acc_num = 500001;
update bank_schema.bank_account set login_id = 60004 where acc_num = 500002;

-- cards
Insert into bank_schema.card values( NULL, "C", "A", "8947", CURDATE() );
Insert into bank_schema.card values( NULL, "D", "A", "3921", CURDATE() );

update bank_schema.bank_account set card_num = 40000 where acc_num = 500000;
update bank_schema.bank_account set card_num = 40001 where acc_num = 500001;

-- transactions
Insert into bank_schema.transaction_history values(NULL, 1500, "withdraw", CURDATE(), CURRENT_TIME(), 500000, NULL, NULL);
Insert into bank_schema.transaction_history values(NULL, 2000, "deposit", CURDATE(), CURRENT_TIME(), 500000, NULL, 7856459);
Insert into bank_schema.transaction_history values(NULL, 5000, "deposit", CURDATE(), CURRENT_TIME(), 500000, NULL, NULL);

Insert into bank_schema.transaction_history values(NULL, 1500, "transfer", CURDATE(), CURRENT_TIME(), 500001, 500000, NULL);
Insert into bank_schema.transaction_history values(NULL, 1000, "withdraw", CURDATE(), CURRENT_TIME(), 500001, NULL, NULL);

Insert into bank_schema.transaction_history values(NULL, 1800, "withdraw", CURDATE(), CURRENT_TIME(), 500002, NULL, NULL);
Insert into bank_schema.transaction_history values(NULL, 1200, "deposit", CURDATE(), CURRENT_TIME(), 500002, NULL, 1674534);




