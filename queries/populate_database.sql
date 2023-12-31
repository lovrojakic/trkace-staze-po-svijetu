INSERT INTO drzava (oznaka, naziv)
VALUES
('HRV', 'Hrvatska'),
('AUT', 'Austrija'),
('NED', 'Nizozemska'),
('DEU', 'Njemacka'),
('ITA', 'Italija'),
('BRA', 'Brazil'),
('USA', 'Sjedinjene Američke Države'),
('BEL', 'Belgija'),
('FIN', 'Finska'),
('HUN', 'Mađarska'),
('GBR', 'Ujedinjeno kraljevstvo'),
('SGP', 'Singapur'),
('MCO', 'Monako');

INSERT INTO vozac (ime, prezime, datum_rodenja, oznaka_drzave)
VALUES
('Josef', 'Neuhauser', NULL, 'AUT'),
('Max', 'Verstappen', '1997-09-30', 'NED'),
('Rubens', 'Barrichello', '1972-05-23', 'BRA'),
('Colin', 'Braun', '1988-09-22', 'USA'),
('Valtteri', 'Bottas', '1989-08-28', 'FIN'),
('Lewis', 'Hamilton', '1985-01-07', 'GBR');

INSERT INTO rekord (vrijeme, vozilo, vozac_id)
VALUES
('00:01:16.388', 'Minardi M190', 1),
('00:01:28.139', 'Red Bull Racing RB16', 2),
('00:01:28.139', 'Ferrari F2004', 3),
('00:00:40.364', 'Ford EcoBoost 3.5L GDI V6tt', 4),
('00:01:46.286', 'Mercedes W09', 5),
('00:01:16.627', 'Mercedes W11', 6),
('00:01:27.097', 'Red Bull Racing RB16', 2),
('00:01:10.540', 'Mercedes W09', 5),
('00:01:35.867', 'Mercedes W14', 6),
('00:01:12.909', 'Mercedes W12', 6);

INSERT INTO natjecanje (naziv, godina)
VALUES
('FIM Sidecar World Championship', 2021),
('FIM Sidecar World Championship', 2022),
('GT World Challenge Europe', 2020),
('GT World Challenge Europe', 2021),
('GT World Challenge Europe', 2023),
('DTM', 2020),
('DTM', 2021),
('DTM', 2022),
('DTM', 2023),
('Nürburgring 24 Hours ', 2020),
('Nürburgring 24 Hours ', 2021),
('Nürburgring 24 Hours ', 2022),
('Nürburgring 24 Hours ', 2023),
('NLS', 2020),
('NLS', 2021),
('NLS', 2022),
('NLS', 2023),
('European Truck Racing Championship', 2022),
('European Truck Racing Championship', 2023),
('Formula 1', 2020),
('Formula 1', 2021),
('Formula 1', 2022),
('Formula 1', 2023),
('FIA World Endurance Championship', 2021),
('FIA World Endurance Championship', 2022),
('FIA World Endurance Championship', 2023),
('NASCAR Cup Series', 2020),
('NASCAR Cup Series', 2021),
('NASCAR Cup Series', 2022),
('NASCAR Cup Series', 2023),
('NASCAR Xfinity Series', 2020),
('NASCAR Xfinity Series', 2021),
('NASCAR Xfinity Series', 2022),
('NASCAR Xfinity Series', 2023),
('NASCAR Craftsman Truck Series', 2020),
('NASCAR Craftsman Truck Series', 2021),
('NASCAR Craftsman Truck Series', 2022),
('NASCAR Craftsman Truck Series', 2023),
('Intercontinental GT Challenge', 2020),
('Intercontinental GT Challenge', 2021),
('Intercontinental GT Challenge', 2022),
('Intercontinental GT Challenge', 2023),
('TCR World Tour', 2023),
('International GT Open', 2020),
('International GT Open', 2021),
('International GT Open', 2022),
('International GT Open', 2023),
('Grand Prix motorcycle racing', 2021),
('Grand Prix motorcycle racing', 2022),
('Grand Prix motorcycle racing', 2023),
('Silverstone Classic', 2021),
('Silverstone Classic', 2022),
('Silverstone Classic', 2023),
('TCR South America', 2021),
('TCR South America', 2022),
('TCR South America', 2023),
('Formula E', 2021),
('Formula E', 2022),
('Formula E', 2023),
('Historic Grand Prix of Monaco', 2021),
('Historic Grand Prix of Monaco', 2022);

INSERT INTO staza (naziv, datum_otvorenja, podloga, duljina_km, broj_zavoja, url, kapacitet_gledatelja, rekord_id, oznaka_drzave)
VALUES
('Automotodrom Grobnik', '1978-09-14', 'asfalt', 4.168, 18, 'https://grobnik.hr', 40000, 1, 'HRV'),
('Nürburgring GP-Strecke', '1984-05-12', 'asfalt', 5.148, 15, 'https://www.nuerburgring.de', 150000, 2, 'DEU'),
('Autodromo Nazionale di Monza', '1922-09-03', 'asfalt', 5.793, 11, 'https://www.monzanet.it', 118865, 3, 'ITA'),
('Daytona International Speedway NASCAR Tri-Oval', '1959-02-22', 'asfalt', 4.023, 4, 'https://www.daytonainternationalspeedway.com', 167785, 4, 'USA'),
('Circuit de Spa-Francorchamps Grand Prix Circuit', '1921-08-01', 'asfalt', 7.004, 20, 'https://www.spa-francorchamps.be', 70000, 5, 'BEL'),
('Hungaroring Grand Prix Circuit', '1986-03-24', 'asfalt', 4.381, 14, 'https://hungaroring.hu', 70000, 6, 'HUN'),
('Silverstone Arena Grand Prix Circuit', '1947-01-01', 'asfalt', 5.891, 18, 'https://www.silverstone.co.uk', 160000, 7, 'GBR'),
('Autódromo de Interlagos Grand Prix Circuit', '1940-05-12', 'asfalt', 	4.309, 	15, 'https://autodromodeinterlagos.com.br', 60000, 8, 'BRA'),
('Marina Bay Street Revised 2023', '2008-08-31', 'asfalt', 	4.940, 	19, 'https://singaporegp.sg', 90000, 9, 'SGP'),
('Circuit de Monaco Revised 2015', '1929-04-14', 'asfalt', 	3.337, 	19, 'https://www.monacograndprixticket.com/formula1monaco/the-circuit-of-monaco', 37000, 10, 'MCO');

INSERT INTO odrzavaSe (staza_id, natjecanje_id)
VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(2, 5),
(2, 6),
(2, 7),
(2, 8),
(2, 9),
(2, 10),
(2, 11),
(2, 12),
(2, 13),
(2, 14),
(2, 15),
(2, 16),
(2, 17),
(2, 18),
(2, 19),
(3, 4),
(3, 5),
(3, 20),
(3, 21),
(3, 22),
(3, 23),
(3, 24),
(3, 25),
(3, 26),
(4, 27),
(4, 28),
(4, 29),
(4, 30),
(4, 31),
(4, 32),
(4, 33),
(4, 34),
(4, 35),
(4, 36),
(4, 37),
(4, 38),
(5, 20),
(5, 21),
(5, 22),
(5, 23),
(5, 24),
(5, 25),
(5, 26),
(5, 39),
(5, 40),
(5, 41),
(5, 42),
(6, 20),
(6, 21),
(6, 22),
(6, 23),
(6, 43),
(6, 44),
(6, 45),
(6, 46),
(6, 47),
(7, 20),
(7, 21),
(7, 22),
(7, 23),
(7, 48),
(7, 49),
(7, 50),
(7, 51),
(7, 52),
(7, 53),
(8, 21),
(8, 22),
(8, 23),
(8, 54),
(8, 55),
(8, 56),
(9, 23),
(10, 21),
(10, 22),
(10, 23),
(10, 57),
(10, 58),
(10, 59),
(10, 60),
(10, 61);