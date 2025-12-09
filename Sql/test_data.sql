insert into [Förlag] ([Namn]) values
('Albert Bonniers Förlag'),
('Natur & Kultur'),
('Norstedts Förlag'),
('Wahlström & Widstrand'),
('Ordfront Förlag');

insert into [Författare] ([Förnamn], [Efternamn], [Födelsedatum]) values
('Astrid', 'Lindgren', '1907-11-14'),
('Selma', 'Lagerlöf', '1858-11-20'),
('August', 'Strindberg', '1849-01-22'),
('Karin', 'Boye', '1900-10-26'),
('Hjalmar', 'Söderberg', '1869-07-02'),
('Tove', 'Jansson', '1914-08-09'),
('Stieg', 'Larsson', '1954-08-15'),
('Camilla', 'Läckberg', '1974-08-30'),
('Fredrik', 'Backman', '1981-06-02'),
('Jonas', 'Gardell', '1963-11-02');

insert into [Böcker] ([ISBN], [Titel], [Språk], [Pris], [Utgivningsdatum], [Förlag]) values
('9789129657692', 'Pippi Långstrump', 'Svenska', 129.00, '1945-11-26', 1),  -- Astrid Lindgren
('9789132214000', 'Nils Holgerssons underbara resa', 'Svenska', 159.00, '1906-12-01', 2), -- Selma
('9789132214017', 'Jerusalem', 'Svenska', 149.00, '1901-01-01', 2),                      -- Selma (författare med flera böcker)
('9789100123456', 'Röda rummet', 'Svenska', 139.00, '1879-01-01', 3),                     -- Strindberg
('9789100123463', 'Doktor Glas', 'Svenska', 129.00, '1905-01-01', 3),                     -- Söderberg
('9789100123470', 'Kallocain', 'Svenska', 119.00, '1940-01-01', 4),                       -- Karin Boye
('9789510123456', 'Muminpappans memoarer', 'Svenska', 129.00, '1950-01-01', 5),           -- Tove Jansson
('9789164200003', 'Män som hatar kvinnor', 'Svenska', 189.00, '2005-08-01', 1),           -- Stieg Larsson
('9789164200010', 'Fyrvaktaren', 'Svenska', 179.00, '2009-01-01', 1),                     -- Camilla Läckberg
('9789137148000', 'En man som heter Ove', 'Svenska', 169.00, '2012-08-27', 2),            -- Fredrik Backman
('9789123456789', 'Torka aldrig tårar utan handskar', 'Svenska', 159.00, '2012-01-01', 4),-- Jonas Gardell
('9789198400007', 'Svenska berättelser', 'Svenska', 199.00, '2020-01-01', 5);             -- Anthologi, flera författare

insert into [Bokförfattare] ([FörfattarId], [ISBN]) values
(1, '9789129657692'),  -- Astrid Lindgren – Pippi Långstrump

(2, '9789132214000'),  -- Selma Lagerlöf – Nils Holgersson
(2, '9789132214017'),  -- Selma Lagerlöf – Jerusalem (samma författare, flera böcker)

(3, '9789100123456'),  -- August Strindberg – Röda rummet

(5, '9789100123463'),  -- Hjalmar Söderberg – Doktor Glas

(4, '9789100123470'),  -- Karin Boye – Kallocain

(6, '9789510123456'),  -- Tove Jansson – Muminpappans memoarer

(7, '9789164200003'),  -- Stieg Larsson – Män som hatar kvinnor

(8, '9789164200010'),  -- Camilla Läckberg – Fyrvaktaren

(9, '9789137148000'),  -- Fredrik Backman – En man som heter Ove

(10, '9789123456789'), -- Jonas Gardell – Torka aldrig tårar...

-- Anthologi: samma bok, flera författare
(1, '9789198400007'),  -- Astrid Lindgren – Svenska berättelser
(2, '9789198400007'),  -- Selma Lagerlöf – Svenska berättelser
(3, '9789198400007');  -- August Strindberg – Svenska berättelser

insert into [Genrer] ([Namn]) values
('Barnbok'),
('Klassiker'),
('Roman'),
('Deckare'),
('Science fiction / dystopi'),
('Humor'),
('Antologi'),
('Drama');

insert into [Bokgenre] ([ISBN], [GenreId]) values
-- Pippi Långstrump
('9789129657692', 1),  -- Barnbok
('9789129657692', 2),  -- Klassiker
('9789129657692', 6),  -- Humor

-- Nils Holgerssons underbara resa
('9789132214000', 1),  -- Barnbok
('9789132214000', 2),  -- Klassiker

-- Jerusalem
('9789132214017', 2),  -- Klassiker
('9789132214017', 3),  -- Roman
('9789132214017', 8),  -- Drama

-- Röda rummet
('9789100123456', 2),  -- Klassiker
('9789100123456', 3),  -- Roman

-- Doktor Glas
('9789100123463', 2),  -- Klassiker
('9789100123463', 3),  -- Roman
('9789100123463', 8),  -- Drama

-- Kallocain
('9789100123470', 2),  -- Klassiker
('9789100123470', 3),  -- Roman
('9789100123470', 5),  -- Science fiction / dystopi

-- Muminpappans memoarer
('9789510123456', 1),  -- Barnbok
('9789510123456', 2),  -- Klassiker
('9789510123456', 6),  -- Humor

-- Män som hatar kvinnor
('9789164200003', 3),  -- Roman
('9789164200003', 4),  -- Deckare

-- Fyrvaktaren
('9789164200010', 3),  -- Roman
('9789164200010', 4),  -- Deckare

-- En man som heter Ove
('9789137148000', 3),  -- Roman
('9789137148000', 6),  -- Humor

-- Torka aldrig tårar utan handskar
('9789123456789', 3),  -- Roman
('9789123456789', 8),  -- Drama

-- Svenska berättelser (antologi med flera författare)
('9789198400007', 2),  -- Klassiker
('9789198400007', 7);  -- Antologi

insert into [Butiker] ([Namn], [Adress]) values
('Citybokhandeln Göteborg', 'Kungsportsavenyn 12, 411 36 Göteborg'),
('Hamnens Böcker', 'Lilla Bommen 5, 411 04 Göteborg'),
('Majorna Bok & Kafé', 'Allmänna vägen 24, 414 60 Göteborg');

insert into [LagerSaldo] ([ISBN], [ButiksId], [Antal]) values
-- Pippi Långstrump
('9789129657692', 1, 12),
('9789129657692', 2, 7),
('9789129657692', 3, 5),

-- Nils Holgerssons underbara resa
('9789132214000', 1, 6),
('9789132214000', 3, 4),

-- Jerusalem
('9789132214017', 1, 5),
('9789132214017', 2, 3),

-- Röda rummet
('9789100123456', 1, 4),
('9789100123456', 2, 6),

-- Doktor Glas
('9789100123463', 1, 5),
('9789100123463', 2, 5),
('9789100123463', 3, 2),

-- Kallocain
('9789100123470', 2, 4),
('9789100123470', 3, 3),

-- Muminpappans memoarer
('9789510123456', 1, 8),
('9789510123456', 3, 6),

-- Män som hatar kvinnor
('9789164200003', 1, 10),
('9789164200003', 2, 8),
('9789164200003', 3, 5),

-- Fyrvaktaren
('9789164200010', 2, 7),
('9789164200010', 3, 4),

-- En man som heter Ove
('9789137148000', 1, 9),
('9789137148000', 2, 6),
('9789137148000', 3, 3),

-- Torka aldrig tårar utan handskar
('9789123456789', 1, 5),
('9789123456789', 3, 2),

-- Svenska berättelser (antologi)
('9789198400007', 2, 5),
('9789198400007', 3, 3);

insert into [Kunder] ([Förnamn], [Efternamn], [Epost]) values
('Anna', 'Svensson', 'anna.svensson@example.com'),
('Erik', 'Johansson', 'erik.johansson@example.com'),
('Maria', 'Karlsson', 'maria.karlsson@example.com'),
('Johan', 'Nilsson', 'johan.nilsson@example.com'),
('Sara', 'Larsson', 'sara.larsson@example.com'),
('Daniel', 'Andersson', 'daniel.andersson@example.com'),
('Elin', 'Lindberg', 'elin.lindberg@example.com'),
('Oskar', 'Bergström', 'oskar.bergstrom@example.com'),
('Lisa', 'Holm', 'lisa.holm@example.com'),
('Patrik', 'Lundqvist', 'patrik.lundqvist@example.com');


insert into [Försäljningar] ([KundId], [ButiksId], [OrderDatum]) values
(1, 1, '2024-09-01 10:15:00'),  -- Anna köper i Citybokhandeln
(2, 2, '2024-09-01 11:30:00'),  -- Erik i Hamnens Böcker
(3, 3, '2024-09-02 14:05:00'),  -- Maria i Majorna Bok & Kafé
(1, 2, '2024-09-03 16:20:00'),  -- Anna handlar igen, annan butik
(4, 1, '2024-09-04 09:45:00'),
(5, 3, '2024-09-04 13:10:00'),
(6, 1, '2024-09-05 15:55:00'),
(7, 2, '2024-09-06 12:25:00'),
(8, 3, '2024-09-06 17:40:00'),
(9, 1, '2024-09-07 11:05:00'),
(10,2, '2024-09-08 10:50:00'),
(3, 1, '2024-09-09 16:35:00');   -- Maria handlar igen, annan butik

insert into [FörsäljningsDetaljer] ([ISBN], [FörsäljningsId], [Antal], [Pris]) values
-- Försäljning 1 (Id = 1) - Anna i Citybokhandeln
('9789137148000', 1, 1, 169.00),  -- En man som heter Ove
('9789129657692', 1, 2, 129.00),  -- Pippi Långstrump x2

-- Försäljning 2 (Id = 2) - Erik i Hamnens Böcker
('9789164200003', 2, 1, 189.00),  -- Män som hatar kvinnor

-- Försäljning 3 (Id = 3) - Maria i Majorna Bok & Kafé
('9789129657692', 3, 1, 129.00),  -- Pippi Långstrump
('9789510123456', 3, 1, 129.00),  -- Muminpappans memoarer
('9789132214000', 3, 1, 159.00),  -- Nils Holgerssons underbara resa

-- Försäljning 4 (Id = 4) - Anna igen, annan butik
('9789132214017', 4, 1, 149.00),  -- Jerusalem

-- Försäljning 5 (Id = 5)
('9789100123463', 5, 1, 129.00),  -- Doktor Glas
('9789100123456', 5, 1, 139.00),  -- Röda rummet

-- Försäljning 6 (Id = 6)
('9789123456789', 6, 2, 159.00),  -- Torka aldrig tårar utan handskar x2

-- Försäljning 7 (Id = 7)
('9789164200010', 7, 1, 179.00),  -- Fyrvaktaren
('9789164200003', 7, 1, 189.00),  -- Män som hatar kvinnor

-- Försäljning 8 (Id = 8)
('9789100123470', 8, 1, 119.00),  -- Kallocain
('9789132214017', 8, 1, 149.00),  -- Jerusalem

-- Försäljning 9 (Id = 9)
('9789510123456', 9, 1, 129.00),  -- Muminpappans memoarer

-- Försäljning 10 (Id = 10)
('9789198400007', 10, 1, 199.00), -- Svenska berättelser (antologi)
('9789137148000', 10, 1, 169.00), -- En man som heter Ove

-- Försäljning 11 (Id = 11)
('9789132214000', 11, 1, 159.00), -- Nils Holgerssons underbara resa
('9789129657692', 11, 1, 129.00), -- Pippi Långstrump

-- Försäljning 12 (Id = 12)
('9789164200003', 12, 1, 189.00), -- Män som hatar kvinnor
('9789123456789', 12, 1, 159.00), -- Torka aldrig tårar utan handskar
('9789100123470', 12, 1, 119.00); -- Kallocain


select 'Förlag' as Tabell, count(*) as Antal from Förlag
union all
select 'Författare', count(*) from Författare
union all
select 'Böcker', count(*) from Böcker
union all
select 'Bokförfattare', count(*) from Bokförfattare
union all
select 'Genrer', count(*) from Genrer
union all
select 'Bokgenre', count(*) from Bokgenre
union all
select 'Butiker', count(*) from Butiker
union all
select 'LagerSaldo', count(*) from LagerSaldo
union all
select 'Kunder', count(*) from Kunder
union all
select 'Försäljningar', count(*) from Försäljningar
union all
select 'FörsäljningsDetaljer', count(*) from FörsäljningsDetaljer;


insert into [Försäljningar] ([KundId], [ButiksId], [OrderDatum]) values
(1, 1, '2025-11-03 10:15:00'),  -- Anna i Citybokhandeln
(3, 2, '2025-11-05 14:20:00'),  -- Maria i Hamnens Böcker
(5, 3, '2025-11-10 16:45:00'),  -- Sara i Majorna Bok & Kafé
(2, 1, '2025-11-15 11:05:00'),  -- Erik i Citybokhandeln
(7, 2, '2025-11-22 13:30:00'),  -- Elin i Hamnens Böcker
(9, 3, '2025-11-28 17:55:00');  -- Lisa i Majorna Bok & Kafé

insert into [FörsäljningsDetaljer] ([ISBN], [FörsäljningsId], [Antal], [Pris]) values
-- Försäljning 13 – 2025-11-03
('9789137148000', 13, 1, 169.00),  -- En man som heter Ove
('9789129657692', 13, 2, 129.00),  -- Pippi Långstrump x2

-- Försäljning 14 – 2025-11-05
('9789164200003', 14, 1, 189.00),  -- Män som hatar kvinnor
('9789164200010', 14, 1, 179.00),  -- Fyrvaktaren

-- Försäljning 15 – 2025-11-10
('9789510123456', 15, 1, 129.00),  -- Muminpappans memoarer
('9789132214000', 15, 1, 159.00),  -- Nils Holgerssons underbara resa

-- Försäljning 16 – 2025-11-15
('9789164200003', 16, 2, 189.00),  -- Män som hatar kvinnor x2

-- Försäljning 17 – 2025-11-22
('9789123456789', 17, 1, 159.00),  -- Torka aldrig tårar...
('9789100123470', 17, 1, 119.00),  -- Kallocain

-- Försäljning 18 – 2025-11-28
('9789137148000', 18, 1, 169.00),  -- En man som heter Ove
('9789198400007', 18, 1, 199.00);  -- Svenska berättelser


insert into [Försäljningar] ([KundId], [ButiksId], [OrderDatum]) values
(4, 1, '2025-12-01 10:10:00'),  -- Johan i Citybokhandeln
(6, 2, '2025-12-02 15:25:00'),  -- Daniel i Hamnens Böcker
(8, 3, '2025-12-03 13:40:00'),  -- Oskar i Majorna Bok & Kafé
(2, 1, '2025-12-03 17:05:00'),  -- Erik i Citybokhandeln
(10,3, '2025-12-04 11:30:00');  -- Patrik i Majorna Bok & Kafé


insert into [FörsäljningsDetaljer] ([ISBN], [FörsäljningsId], [Antal], [Pris]) values
-- Försäljning 19 – 2025-12-01 (Johan)
('9789164200003', 19, 1, 189.00),  -- Män som hatar kvinnor
('9789137148000', 19, 1, 169.00),  -- En man som heter Ove

-- Försäljning 20 – 2025-12-02 (Daniel)
('9789129657692', 20, 2, 129.00),  -- Pippi Långstrump x2
('9789510123456', 20, 1, 129.00),  -- Muminpappans memoarer

-- Försäljning 21 – 2025-12-03 (Oskar)
('9789100123470', 21, 1, 119.00),  -- Kallocain
('9789123456789', 21, 1, 159.00),  -- Torka aldrig tårar utan handskar

-- Försäljning 22 – 2025-12-03 (Erik)
('9789132214000', 22, 1, 159.00),  -- Nils Holgerssons underbara resa
('9789198400007', 22, 1, 199.00),  -- Svenska berättelser

-- Försäljning 23 – 2025-12-04 (Patrik)
('9789164200010', 23, 1, 179.00),  -- Fyrvaktaren
('9789132214017', 23, 1, 149.00);  -- Jerusalem



-----

insert into [Leverantörer] ([Namn], [Telefon], [Epost]) values
('Förlagssystem AB',       '08-120 00 00', 'info@forlagssystem.se'),
('Bokia Distribution',     '08-220 00 00', 'order@bokia.se'),
('Akademibokhandeln Grossist', '010-123 45 67', 'grossist@akademibokhandeln.se'),
('Adlibris Wholesale',     '08-555 10 00', 'wholesale@adlibris.com');


insert into [BokLeverantör] ([LeverantörId], [ISBN], [InköpsPris]) values
-- Förlagssystem AB (Id = 1) – mycket av standardtitlarna
(1, '9789129657692',  75.00),  -- Pippi Långstrump
(1, '9789132214000',  95.00),  -- Nils Holgersson
(1, '9789132214017',  90.00),  -- Jerusalem
(1, '9789137148000', 110.00),  -- En man som heter Ove
(1, '9789164200003', 120.00),  -- Män som hatar kvinnor

-- Bokia Distribution (Id = 2) – främst deckare & moderna romaner
(2, '9789164200003', 118.00),  -- Män som hatar kvinnor (alternativ leverantör)
(2, '9789164200010', 115.00),  -- Fyrvaktaren
(2, '9789137148000', 108.00),  -- En man som heter Ove
(2, '9789123456789', 100.00),  -- Torka aldrig tårar utan handskar

-- Akademibokhandeln Grossist (Id = 3) – klassiker
(3, '9789100123456',  80.00),  -- Röda rummet
(3, '9789100123463',  82.00),  -- Doktor Glas
(3, '9789100123470',  78.00),  -- Kallocain

-- Adlibris Wholesale (Id = 4) – antologier & vissa moderna titlar
(4, '9789510123456',  85.00),  -- Muminpappans memoarer
(4, '9789198400007', 130.00),  -- Svenska berättelser
(4, '9789123456789',  98.00);  -- Torka aldrig tårar...
