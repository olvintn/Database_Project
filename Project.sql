CREATE DATABASE FamilyMart;

=======================================


CREATE TABLE Kasir (
	Id_kasir VARCHAR(3),
    Nama_kasir VARCHAR(25)
);


CREATE TABLE Barang (
    Nama_barang VARCHAR(225) PRIMARY KEY,
    Harga INT
);


CREATE TABLE Transaksi (
    No_nota VARCHAR(20),
    Nama_barang VARCHAR(225),
    Jumlah INT,
    Harga INT,
    Diskon INT,
    Jumlah_harga INT,

	CONSTRAINT My_Composite_Key PRIMARY KEY (No_nota, Nama_barang)
);


CREATE TABLE Struk (
	No_nota VARCHAR(20) PRIMARY KEY,
	Id_kasir VARCHAR(3),
	Tanggal_pembelian DATE,
	Waktu_pembelian DATE
);


CREATE TABLE Pembayaran (
	No_nota VARCHAR(20) PRIMARY KEY,
	Tipe_Pembayaran VARCHAR(225),
	Total_Pembayaran INT,
	Kembalian INT, 
	DPP INT, 
	PPN INT, 
	PB1 INT
);


==========================================


INSERT INTO Kasir (
    Id_kasir, Nama_kasir
) VALUES 
	('002', 'Agil Adi Chandra'),
	('003', 'Adi Chandra'),
	('004', 'Rani'),
	('005', 'Putri Riani'),
	('006', 'Melati'),
	('007', 'Anggrek');


INSERT INTO Barang (
	Nama_barang, Harga
) VALUES
	('Paket Crispy Chicken Korean Buldak', '15000'), 
    ('Ice Peppermint Chocolate', '17000'),
	('Paket Crispy Chicken Sambal Ijo', '12000'), 
    ('Americano', '10000'), 
	('Iced Mocha', '12000');


INSERT INTO Transaksi (
    No_nota, Nama_barang, Jumlah, Harga, Diskon, Jumlah_harga
) VALUES 
	('9122120500290854', 'Paket Crispy Chicken Korean Buldak', '1', '15000', '2000', '13000'),
	('9122120500290854', 'Ice Peppermint Chocolate', '1', '17000', '3000', '14000'),
	('9122120500290855', 'Paket Crispy Chicken Sambal Ijo', '1', '12000', '2000', '10000'),
	('9122120500290855', 'Americano', '1', '10000', '2000', '8000'),
	('9122120500290856', 'Iced Mocha', '1', '12000', '2000', '10000'),
	('9122120500290856', 'Ice Peppermint Chocolate', '1', '17000', '3000', '14000'),
	('9122120500290856', 'Americano', '1', '10000', '2000', '8000'),
	('9122120500290857', 'Americano', '1', '10000', '2000', '8000'),
	('9122120500290857', 'Paket Crispy Chicken Korean Buldak', '1', '15000', '2000', '13000'),
	('9122120500290858', 'Americano', '1', '10000', '2000', '8000'),
	('9122120500290858', 'Iced Mocha', '1', '12000', '2000', '10000');


INSERT INTO Struk (
	No_nota, Id_kasir, Tanggal_pembelian, Waktu_pembelian
) VALUES 
	('9122120500290854', '002', '2022-12-05','11:22:00'),
	('9122120500290855', '003', '2022-12-06','08:40:20'),
	('9122120500290856', '004', '2022-12-07','13:50:20'),
	('9122120500290857', '005', '2022-12-08','16:30:20'),
	('9122120500290858', '006', '2022-12-09','12:50:20');


INSERT INTO Pembayaran (
	No_nota, Tipe_Pembayaran, Total_Pembayaran, Kembalian, DPP, PPN, PB1
) VALUES 
	('9122120500290854', 'Dana', '27000', '0', '24545' ,'0', '2455'),
	('9122120500290855', 'Gopay', '18000', '0', '15676', '0', '1568'),
	('9122120500290856', 'Dana', '10000', '0', '7263', '0', '727'),
	('9122120500290857', 'Dana', '21000', '0', '18334', '0', '1833'),
	('9122120500290858', 'Dana', '18000', '0', '14667', '0', '1467');


==========================================================================

select Tipe_pembayaran, count(*) as Kuantitas from Pembayaran group by Tipe_pembayaran order by ;

select Tipe_pembayaran, count(*) as Kuantitas from Pembayaran group by Tipe_pembayaran order by Kuantitas DESC = 1;

select Tipe_pembayaran, max(count(*)) from Pembayaran group by Tipe_pembayaran;


SELECT
	TransactionHeader.TransactionID, 
	TransactionHeader.TransactionDate, 
	MsCustomer.CustomerName, 
	MsStaff.StaffName



FROM TransactionHeader
JOIN MsCustomer
ON TransactionHeader.TransactionID = MsCustomer.CustomerID
JOIN MsStaff
ON MsCustomer.CustomerID = MsStaff.StaffID
WHERE LEFT(MsCustomer.CustomerName, 1) = 'J' 
AND MsStaff.StaffEmail LIKE '%@mail.com'





SELECT * FROM Kasir;
SELECT * FROM Barang;
SELECT * FROM Transaksi;
SELECT * FROM Struk;
SELECT * FROM Pembayaran;