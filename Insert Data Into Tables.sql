USE WatchAN
GO

INSERT INTO Customers VALUES
('CU001', 'Dali Endi', 'Male', 'Duren Sawit', '089765432'),
('CU002', 'Alih Ida', 'Male', 'Durian Runtuh', '089745387'),
('CU003', 'Edan Idah', 'Female', 'Pondok Bali', '0898456787'),
('CU004', 'Faris Tarih', 'Male', 'Manggisan', '08363783735'),
('CU005', 'Desa Wartya', 'Male', 'Yayalin', '08836345638'),
('CU006', 'Muhid Yahya', 'Male', 'Jatinegara', '0847464547'),
('CU007', 'Rara Alisya', 'Female', 'Duren Sawit', '0897464309'),
('CU008', 'Dali Andina', 'Female', 'Waringan', '087652097'),
('CU009', 'Amin Ihdan', 'Male', 'Bekasi', '08789335378'),
('CU010', 'Era Wartono', 'Female', 'Depok', '0884746352'),
('CU011', 'Wandi Hartno', 'Male', 'Medem', '0893637380')

INSERT INTO Vendor VALUES
('VN001', 'PT Andi Pratama', 'Kemanggisan', '0862728262', 'andi_pratama@gmail.com'),
('VN002', 'PT Jam Sejahtera', 'Duren Manis', '0893873353', 'jam_sej@gmail.com'),
('VN003', 'PT Waktu Raya', 'Pondok Bambu', '08973832277', 'waktu_raya@gmail.com'),
('VN004', 'PT Randa Rani', 'Manggisan', '08728266272', 'randa_runi@gmail.com'),
('VN005', 'PT Rudi Taruri', 'Soloalin', '0882828827', 'taruri_rudi@gmail.com'),
('VN006', 'PT Jaman Jam', 'Jatinegri', '0842772898', 'jam2x_an@gmail.com'),
('VN007', 'PT Yarsi Selamat', 'Sawa Rana', '0809236473', 'yarsi_safe@gmail.com'),
('VN008', 'PT Dua Selama', 'Karingan', '0862729872', 'duaselama@gmail.com'),
('VN009', 'PT Waktu Indah', 'Bekasi', '0827278276', 'waktuindah@gmail.com'),
('VN010', 'PT Permata Waktu', 'Depok', '088982252', 'permata_waktu@gmail.com'),
('VN011', 'PT Hartana Rana', 'Mardam', '0862728652', 'rana_hartana@gmail.com')

INSERT INTO Agent VALUES
('AG001', 'Dali Herdana', 'Male', 'Serawan Raya Street', 'daliherdana@gmail.com', '0883883993', 5000000),
('AG002', 'Alamanih Sirih', 'Female', 'Durian Manggela Street', 'sirihsirih@gmail.com', '08638297626', 4500000),
('AG003', 'Idah Gelana', 'Female', 'Pondok Teh I Street', 'idah_gelana@gmail.com', '08838905488', 6000000),
('AG004', 'Firsa Setiawati', 'Female', 'Manggisan II Street', 'setiawati_firsa@yahoo.com', '0830345628', 5500000),
('AG005', 'Dara Estana', 'Female', 'Serumserundi Raya Street', 'drstana@yahoo.com', '08276739327', 5600000),
('AG006', 'Ruru Hartono', 'Male', 'Jatiwaringin Raya Street', 'ruruharto@gmail.com', '08738302722', 4750000),
('AG007', 'Rara Aisya', 'Female', 'Opinian VI Street', 'raraaisya@gmail.com', '0883038257', 6000000),
('AG008', 'Geri Setiawan', 'Male', 'Kewaringan III Street', 'geri_setiawan@gmail.com', '08836390167', 6500000),
('AG009', 'Aminah Muli', 'Female', 'Bekasi Raya Street', 'aminahmuli@gmail.com', '08272711038', 5250000),
('AG010', 'Era Kurniawan', 'Male', 'Margonda VII Street', 'era_kur23@gmail.com', '0892736380', 5500000),
('AG011', 'Wandi Faris', 'Male', 'Radem Raya Street', 'wandi_faris@gmail.com', '0892649008', 4500000)

INSERT INTO Brand VALUES
('BD001', 'BVLGARIA'),
('BD002', 'Casio'),
('BD003', 'Saiko'),
('BD004', 'Jam Kita'),
('BD005', 'Jifors'),
('BD006', 'Everyday'),
('BD007', 'Switch'),
('BD008', 'Schwarshe'),
('BD009', 'Jamara'),
('BD010', 'The Watchers')

INSERT INTO Watch VALUES
('WA001', 'BD009', 'J09', 120000, 20),
('WA002', 'BD003', 'SI560-J', 200000, 19),
('WA003', 'BD010', 'WaterWatch Pro 387-J', 300000, 10),
('WA004', 'BD005', 'J-10', 200000, 25),
('WA005', 'BD005', 'J-25', 300000, 20),
('WA006', 'BD007', 'SW025', 199000, 30),
('WA007', 'BD004', 'JK90', 225000, 35),
('WA008', 'BD001', 'SM78', 300000, 20),
('WA009', 'BD006', 'GoTo 6', 400000, 18),
('WA010', 'BD009', 'J10', 150000, 20),
('WA011', 'BD002', 'C3-5K', 300000, 25)

INSERT INTO SalesTransaction VALUES
('SA001', 'CU007', 'AG009', '2018-06-05'),
('SA002', 'CU003', 'AG008', '2018-06-07'),
('SA003', 'CU010', 'AG003', '2018-06-10'),
('SA004', 'CU005', 'AG010', '2018-06-15'),
('SA005', 'CU009', 'AG005', '2018-06-19'),
('SA006', 'CU011', 'AG005', '2018-06-30'),
('SA007', 'CU004', 'AG009', '2018-07-05'),
('SA008', 'CU008', 'AG008', '2018-08-15'),
('SA009', 'CU006', 'AG006', '2018-08-20'),
('SA010', 'CU001', 'AG011', '2018-09-07'),
('SA011', 'CU002', 'AG007', '2018-09-10'),
('SA012', 'CU003', 'AG005', '2018-09-15'),
('SA013', 'CU011', 'AG006', '2018-09-20'),
('SA014', 'CU006', 'AG001', '2018-10-07'),
('SA015', 'CU007', 'AG002', '2018-10-11')

INSERT INTO SalesTransactionDetail VALUES
('SA001', 'WA007', 1), ('SA001', 'WA003', 2), ('SA002', 'WA010', 3),
('SA002', 'WA005', 1), ('SA003', 'WA009', 3), ('SA004', 'WA011', 2),
('SA004', 'WA004', 1), ('SA004', 'WA008', 1), ('SA005', 'WA006', 2),
('SA006', 'WA001', 3), ('SA007', 'WA002', 2), ('SA007', 'WA003', 1),
('SA008', 'WA011', 2), ('SA009', 'WA006', 1), ('SA009', 'WA007', 3),
('SA010', 'WA007', 1), ('SA010', 'WA002', 2), ('SA011', 'WA011', 3),
('SA012', 'WA007', 1), ('SA012', 'WA009', 3), ('SA013', 'WA001', 2),
('SA013', 'WA004', 1), ('SA014', 'WA008', 1), ('SA015', 'WA006', 2),
('SA015', 'WA005', 3)

INSERT INTO PurchaseTransaction VALUES
('PC001', 'VN008', 'AG008', '2018-06-05'),
('PC002', 'VN004', 'AG008', '2018-06-07'),
('PC003', 'VN010', 'AG002', '2018-06-10'),
('PC004', 'VN005', 'AG011', '2018-07-15'),
('PC005', 'VN009', 'AG005', '2018-07-19'),
('PC006', 'VN011', 'AG006', '2018-08-01'),
('PC007', 'VN001', 'AG004', '2018-08-05'),
('PC008', 'VN008', 'AG009', '2018-08-15'),
('PC009', 'VN007', 'AG006', '2018-08-20'),
('PC010', 'VN001', 'AG010', '2018-08-27'),
('PC011', 'VN002', 'AG007', '2018-09-10'),
('PC012', 'VN003', 'AG006', '2018-09-15'),
('PC013', 'VN009', 'AG003', '2018-09-20'),
('PC014', 'VN006', 'AG001', '2018-10-07'),
('PC015', 'VN007', 'AG002', '2018-10-11')

INSERT INTO PurchaseTransactionDetail VALUES
('PC001', 'WA002', 10), ('PC001', 'WA003', 20), ('PC002', 'WA003', 14),
('PC002', 'WA005', 7), ('PC003', 'WA009', 13), ('PC003', 'WA010', 12),
('PC004', 'WA004', 5), ('PC004', 'WA008', 16), ('PC005', 'WA006', 21),
('PC005', 'WA002', 5), ('PC006', 'WA002', 12), ('PC007', 'WA003', 10),
('PC008', 'WA011', 6), ('PC009', 'WA006', 11), ('PC009', 'WA007', 15),
('PC010', 'WA009', 8), ('PC011', 'WA002', 12), ('PC011', 'WA011', 16),
('PC012', 'WA007', 9), ('PC012', 'WA009', 14), ('PC013', 'WA001', 12),
('PC014', 'WA004', 11), ('PC014', 'WA008', 19), ('PC015', 'WA006', 14),
('PC015', 'WA010', 13)


