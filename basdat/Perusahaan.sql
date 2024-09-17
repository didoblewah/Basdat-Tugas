CREATE TABLE Kepala_Perusahaan
(
    Nama VARCHAR(30) NOT NULL,
    NIK_Kepala_Perusahaan CHAR(10) NOT NULL,
    PRIMARY KEY (NIK_Kepala_Perusahaan)
);

INSERT INTO Kepala_Perusahaan (Nama, NIK_Kepala_Perusahaan)
VALUES ('Sumarjono', '1001001'),
    ('Suwirjo', '1002002'),
    ('Sudiryo', '1003003');

CREATE TABLE Karyawan
(
    Nama VARCHAR(30) NOT NULL,
    NIK_Karyawan CHAR(20) NOT NULL,
    NIK_Kepala_Perusahaan CHAR(10) NOT NULL,
    PRIMARY KEY (NIK_Karyawan),
    FOREIGN KEY (NIK_Kepala_Perusahaan) REFERENCES Kepala_Perusahaan(NIK_Kepala_Perusahaan)
);

INSERT INTO Karyawan (Nama, NIK_Karyawan, NIK_Kepala_Perusahaan)
VALUES ('Teddy', '2001004', '1001001'),
    ('Freddy', '2002005', '1002002'),
    ('Fadly', '2003006', '1003003');

CREATE TABLE Gudang
(
    NomorGudang INT NOT NULL,
    ID_Gudang CHAR(20) NOT NULL,
    KodeZatCair CHAR(30) NOT NULL,
    KodeZatPadat CHAR(30) NOT NULL,
    PRIMARY KEY (ID_Gudang),
    UNIQUE (KodeZatCair),
    UNIQUE (KodeZatPadat)
);

INSERT INTO Gudang (NomorGudang, ID_Gudang, KodeZatCair, KodeZatPadat)
VALUES (1, '101011', '5011515', '6015454'),
    (2, '102022', '5022525', '6027676'),
    (3, '103033', '5033535', '6039898');

CREATE TABLE Pemasok
(
    Nama_Pemasok VARCHAR(30) NOT NULL,
    NIK_Pemasok CHAR(20) NOT NULL,
    PRIMARY KEY (NIK_Pemasok)
);

INSERT INTO Pemasok (Nama_Pemasok, NIK_Pemasok)
VALUES ('Farid', '3001321'),
    ('Zainal', '3002654'),
    ('Abidin', '3003987');

CREATE TABLE Komponen
(
    Nomor_Barang CHAR(20) NOT NULL,
    Nama_Barang VARCHAR(30) NOT NULL,
    PRIMARY KEY (Nomor_Barang)
);

INSERT INTO Komponen (Nomor_Barang, Nama_Barang)
VALUES ('401', 'Tissue'),
    ('402', 'Sabun muka'),
    ('403', 'Shampo');

CREATE TABLE GudangZatCair
(
    Volume_air CHAR(20) NOT NULL,
    ID_Gudang CHAR(20) NOT NULL,
    PRIMARY KEY (ID_Gudang),
    FOREIGN KEY (ID_Gudang) REFERENCES Gudang(ID_Gudang)
);

INSERT INTO GudangZatCair (Volume_air, ID_Gudang)
VALUES ('10Liter', '101011'),
    ('20Liter', '102022'),
    ('30Liter', '103033');

CREATE TABLE GudangZatPadat
(
    KilogramBenda CHAR(20) NOT NULL,
    ID_Gudang CHAR(20) NOT NULL,
    PRIMARY KEY (ID_Gudang),
    FOREIGN KEY (ID_Gudang) REFERENCES Gudang(ID_Gudang)
);

INSERT INTO GudangZatPadat (KilogramBenda, ID_Gudang)
VALUES ('10KG', '101011'),
    ('20KG', '102022'),
    ('30KG', '103033');

CREATE TABLE Tanggungan
(
    NomorIdentifikasiTanggungan INT NOT NULL,
    JumlahTanggungan INT NOT NULL,
    PRIMARY KEY (NomorIdentifikasiTanggungan)
);

INSERT INTO Tanggungan (NomorIdentifikasiTanggungan, JumlahTanggungan)
VALUES (50015001, 3),
    (50025002, 5),
    (50035003, 2);

CREATE TABLE Memasok
(
    NIK_Karyawan CHAR(20) NOT NULL,
    NIK_Pemasok CHAR(20) NOT NULL,
    PRIMARY KEY (NIK_Karyawan, NIK_Pemasok),
    FOREIGN KEY (NIK_Karyawan) REFERENCES Karyawan(NIK_Karyawan),
    FOREIGN KEY (NIK_Pemasok) REFERENCES Pemasok(NIK_Pemasok)
);

INSERT INTO Memasok (NIK_Karyawan, NIK_Pemasok)
VALUES ('2001004', '3001321'),
    ('2002005', '3002654'),
    ('2003006', '3003987');

CREATE TABLE Mengirim
(
    NIK_Pemasok CHAR(20) NOT NULL,
    ID_Gudang CHAR(20) NOT NULL,
    PRIMARY KEY (NIK_Pemasok, ID_Gudang),
    FOREIGN KEY (NIK_Pemasok) REFERENCES Pemasok(NIK_Pemasok),
    FOREIGN KEY (ID_Gudang) REFERENCES Gudang(ID_Gudang)
);

INSERT INTO Mengirim (NIK_Pemasok, ID_Gudang)
VALUES ('3001321', '101011'),
    ('3002654', '102022'),
    ('3003987', '103033');

CREATE TABLE Memerlukan
(
    NIK_Pemasok CHAR(20) NOT NULL,
    Nomor_Barang CHAR(20) NOT NULL,
    PRIMARY KEY (NIK_Pemasok, Nomor_Barang),
    FOREIGN KEY (NIK_Pemasok) REFERENCES Pemasok(NIK_Pemasok),
    FOREIGN KEY (Nomor_Barang) REFERENCES Komponen(Nomor_Barang)
);

INSERT INTO Memerlukan (NIK_Pemasok, Nomor_Barang)
VALUES ('3001321', '401'),
    ('3002654', '402'),
    ('3003987', '403');
    
drop TABLE if exists fotomakanan;
CREATE TABLE fotomakanan (
    id int(3) NOT NULL auto_increment,
    tipeimage VARCHAR(20) NOT NULL DEFAULT '',
    dataiamge blob NOT NULL,
    PRIMARY KEY (id));