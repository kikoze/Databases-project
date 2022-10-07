----------------------------------------------------------------------------------------------------
-- Project Assignment - Part 3 - populate.sql file
-- Script used to populate the database from the part 3 of the Project
----------------------------------------------------------------------------------------------------
-- erase data
TRUNCATE analyses;
TRUNCATE analyst CASCADE;
TRUNCATE supervisor CASCADE;
TRUNCATE person CASCADE;
TRUNCATE transformer CASCADE;
TRUNCATE line CASCADE;
TRUNCATE busbar CASCADE;
TRUNCATE element CASCADE;
TRUNCATE substation CASCADE;
TRUNCATE lineincident CASCADE;
TRUNCATE incident CASCADE;

-- insert person
INSERT INTO person VALUES ('Alexandre Reis', 'Rua de Lisboa nº31, Carcavelos', '913455490', '278737935');
INSERT INTO person VALUES ('Miguel Costa', 'Rua da Fragata nº115, Algés', '936441835', '259033846');
INSERT INTO person VALUES ('Francisco Freire', 'Rua do Paraíso nº3, Gaia', '937472457', '270658112');
INSERT INTO person VALUES ('Rui Paixão', 'Rua dos Douradores nº150, Lisboa', '962537717', '248002631');
INSERT INTO person VALUES ('Olavo Malveiro', 'Rua Serpa Pinto nº18, Loulé', '914857973', '260155385');
INSERT INTO person VALUES ('Pedro Marques', 'Rua da Liberdade nº44, Coimbra', '939840606', '262584762');
INSERT INTO person VALUES ('João Santos', 'Rua Alexandre Herculano nº223, Famalicão', '910488274', '293876482');
INSERT INTO person VALUES ('Jacinta Pires', 'Rua da Liberdade nº100, Loures', '915677274', '213871186');
INSERT INTO person VALUES ('Tomás Henriques', 'Rua da Farmácia nº3, Sintra', '911927663', '241567293');
INSERT INTO person VALUES ('Jorge Gonçalves', 'Rua General Fonseca nº23, Leiria', '928184279', '231847926');
INSERT INTO person VALUES ('Maria Coutinho', 'Largo da praça nº89, Lisboa', '923482719', '211284953');
INSERT INTO person VALUES ('Alfredo Lopes', 'Rua da Grande Guerra nº5, Algés', '914928047', '234849771');
INSERT INTO person VALUES ('Francisco Pato', 'Rua Conde de Roma nº2, Lisboa', '912983057', '289382957');
INSERT INTO person VALUES ('Teodósio Teotónio', 'Rua Tílio Titubeante nº332, Faro', '919823784', '212482937');
INSERT INTO person VALUES ('Carolina Coelho', 'Praceta Dom Gonçalo nº35, Famalicão', '962014829', '223084826');
INSERT INTO person VALUES ('Catarina Smith Santos', 'Rua dos Ferreiros nº10, Portimão', '932849014', '297839274');
INSERT INTO person VALUES ('Luís Silva', 'Rua Professor Granja Lopes nº47, Braga', '917826472', '291748297');
INSERT INTO person VALUES ('Rui André', 'Rua do Bandarra nº7, Lisboa', '917834572', '296248297');
INSERT INTO person VALUES ('Sandra Filipe', 'Rua Amarela nº67, Porto', '912874602', '283429700');
INSERT INTO person VALUES ('Afonso Martins', 'Rua da Graça nº56, Setúbal', '937826772', '291728617');
INSERT INTO person VALUES ('João Maria', 'Avenida de Sintra nº234, Barcelos', '93098772', '211798298');
INSERT INTO person VALUES ('Cátia Núncio', 'Rua 2 de Junho nº11, Oeiras', '917543872', '291499727');
INSERT INTO person VALUES ('Paulo Soares', 'Rua 1 de Maio nº90, Odivelas', '917654672', '214458997');
INSERT INTO person VALUES ('António Lopes', 'Avenida Engenheiro Manuel Policarpo nº56, Grijó', '917000472', '2517482956');
INSERT INTO person VALUES ('Alfredo Bensaúde', 'Rua das Amendoeiras nº87, Portimão', '927821272', '2914786325');
INSERT INTO person VALUES ('Marisa Matias', 'Avenida das Margaridas nº34, Lisboa', '93092112', '2349176234');
INSERT INTO person VALUES ('Marco Martins', 'Rua do Crucifixo nº45, Porto', '917847002', '2995756749');
INSERT INTO person VALUES ('Fernando Meirelles', 'Rua Guerra Junqueiro nº5, Coimbra', '967556472', '2017489376');
INSERT INTO person VALUES ('Joana Leitão', 'Rua do Arsenal nº170, Coimbra', '967826815', '2076566321');

-- insert analyst
INSERT INTO analyst VALUES ('Alexandre Reis', 'Rua de Lisboa nº31, Carcavelos');
INSERT INTO analyst VALUES ('Francisco Freire', 'Rua do Paraíso nº3, Gaia');
INSERT INTO analyst VALUES ('Miguel Costa', 'Rua da Fragata nº115, Algés');
INSERT INTO analyst VALUES ('Olavo Malveiro', 'Rua Serpa Pinto nº18, Loulé');
INSERT INTO analyst VALUES ('Pedro Marques', 'Rua da Liberdade nº44, Coimbra');
INSERT INTO analyst VALUES ('Jacinta Pires', 'Rua da Liberdade nº100, Loures');
INSERT INTO analyst VALUES ('Tomás Henriques', 'Rua da Farmácia nº3, Sintra');
INSERT INTO analyst VALUES ('Jorge Gonçalves', 'Rua General Fonseca nº23, Leiria');
INSERT INTO analyst VALUES ('Teodósio Teotónio', 'Rua Tílio Titubeante nº332, Faro');
INSERT INTO analyst VALUES ('Carolina Coelho', 'Praceta Dom Gonçalo nº35, Famalicão');
INSERT INTO analyst VALUES ('Catarina Smith Santos', 'Rua dos Ferreiros nº10, Portimão');
INSERT INTO analyst VALUES ('Alfredo Lopes', 'Rua da Grande Guerra nº5, Algés');
INSERT INTO analyst VALUES ('Francisco Pato', 'Rua Conde de Roma nº2, Lisboa');
INSERT INTO analyst VALUES ('Luís Silva', 'Rua Professor Granja Lopes nº47, Braga');
INSERT INTO analyst VALUES ('Marco Martins', 'Rua do Crucifixo nº45, Porto');
INSERT INTO analyst VALUES ('Fernando Meirelles', 'Rua Guerra Junqueiro nº5, Coimbra');
INSERT INTO analyst VALUES ('Joana Leitão', 'Rua do Arsenal nº170, Coimbra');
INSERT INTO analyst VALUES ('Paulo Soares', 'Rua 1 de Maio nº90, Odivelas');
INSERT INTO analyst VALUES ('António Lopes', 'Avenida Engenheiro Manuel Policarpo nº56, Grijó');
INSERT INTO analyst VALUES ('Alfredo Bensaúde', 'Rua das Amendoeiras nº87, Portimão');
INSERT INTO analyst VALUES ('Marisa Matias', 'Avenida das Margaridas nº34, Lisboa');


-- insert supervisor
INSERT INTO supervisor VALUES ('Francisco Freire', 'Rua do Paraíso nº3, Gaia');
INSERT INTO supervisor VALUES ('Miguel Costa', 'Rua da Fragata nº115, Algés');
INSERT INTO supervisor VALUES ('Olavo Malveiro', 'Rua Serpa Pinto nº18, Loulé');
INSERT INTO supervisor VALUES ('Pedro Marques', 'Rua da Liberdade nº44, Coimbra');
INSERT INTO supervisor VALUES ('João Santos', 'Rua Alexandre Herculano nº223, Famalicão');
INSERT INTO supervisor VALUES ('Rui Paixão', 'Rua dos Douradores nº150, Lisboa');
INSERT INTO supervisor VALUES ('Maria Coutinho', 'Largo da praça nº89, Lisboa');
INSERT INTO supervisor VALUES ('Luís Silva', 'Rua Professor Granja Lopes nº47, Braga');
INSERT INTO supervisor VALUES ('Catarina Smith Santos', 'Rua dos Ferreiros nº10, Portimão');
INSERT INTO supervisor VALUES ('Paulo Soares', 'Rua 1 de Maio nº90, Odivelas');
INSERT INTO supervisor VALUES ('António Lopes', 'Avenida Engenheiro Manuel Policarpo nº56, Grijó');
INSERT INTO supervisor VALUES ('Alfredo Bensaúde', 'Rua das Amendoeiras nº87, Portimão');
INSERT INTO supervisor VALUES ('Marisa Matias', 'Avenida das Margaridas nº34, Lisboa');
INSERT INTO supervisor VALUES ('Rui André', 'Rua do Bandarra nº7, Lisboa');
INSERT INTO supervisor VALUES ('Sandra Filipe', 'Rua Amarela nº67, Porto');
INSERT INTO supervisor VALUES ('Afonso Martins', 'Rua da Graça nº56, Setúbal');
INSERT INTO supervisor VALUES ('João Maria', 'Avenida de Sintra nº234, Barcelos');
INSERT INTO supervisor VALUES ('Cátia Núncio', 'Rua 2 de Junho nº11, Oeiras');

-- insert element
INSERT INTO element VALUES ('T-001');
INSERT INTO element VALUES ('T-002');
INSERT INTO element VALUES ('T-003');
INSERT INTO element VALUES ('T-004');
INSERT INTO element VALUES ('T-005');
INSERT INTO element VALUES ('T-006');
INSERT INTO element VALUES ('T-007');
INSERT INTO element VALUES ('T-008');
INSERT INTO element VALUES ('T-009');
INSERT INTO element VALUES ('T-010');
INSERT INTO element VALUES ('T-011');
INSERT INTO element VALUES ('T-012');
INSERT INTO element VALUES ('T-013');
INSERT INTO element VALUES ('L-001');
INSERT INTO element VALUES ('L-002');
INSERT INTO element VALUES ('L-003');
INSERT INTO element VALUES ('L-004');
INSERT INTO element VALUES ('L-005');
INSERT INTO element VALUES ('L-006');
INSERT INTO element VALUES ('L-007');
INSERT INTO element VALUES ('L-008');
INSERT INTO element VALUES ('L-009');
INSERT INTO element VALUES ('L-010');
INSERT INTO element VALUES ('L-011');
INSERT INTO element VALUES ('L-012');
INSERT INTO element VALUES ('L-013');
INSERT INTO element VALUES ('B-001');
INSERT INTO element VALUES ('B-002');
INSERT INTO element VALUES ('B-003');
INSERT INTO element VALUES ('B-004');
INSERT INTO element VALUES ('B-005');
INSERT INTO element VALUES ('B-006');
INSERT INTO element VALUES ('B-007');
INSERT INTO element VALUES ('B-008');
INSERT INTO element VALUES ('B-009');
INSERT INTO element VALUES ('B-789');
INSERT INTO element VALUES ('B-011');
INSERT INTO element VALUES ('B-012');
INSERT INTO element VALUES ('B-013');
INSERT INTO element VALUES ('B-014');
INSERT INTO element VALUES ('B-015');
INSERT INTO element VALUES ('B-016');
INSERT INTO element VALUES ('B-017');
INSERT INTO element VALUES ('B-018');
INSERT INTO element VALUES ('B-019');
INSERT INTO element VALUES ('B-020');
INSERT INTO element VALUES ('B-021');
INSERT INTO element VALUES ('B-022');
INSERT INTO element VALUES ('B-023');
INSERT INTO element VALUES ('B-024');
INSERT INTO element VALUES ('B-025');
INSERT INTO element VALUES ('B-026');

-- insert substation
INSERT INTO substation VALUES (38.719626, -9.151154, 'Lisboa', 'Miguel Costa', 'Rua da Fragata nº115, Algés');
INSERT INTO substation VALUES (38.703910, -9.209633, 'Lisboa', 'Catarina Smith Santos', 'Rua dos Ferreiros nº10, Portimão');
INSERT INTO substation VALUES (41.145828, -8.611107, 'Porto', 'Francisco Freire', 'Rua do Paraíso nº3, Gaia');
INSERT INTO substation VALUES (40.209163, -8.428431, 'Coimbra', 'Pedro Marques', 'Rua da Liberdade nº44, Coimbra');
INSERT INTO substation VALUES (37.014541, -7.934232, 'Faro', 'Olavo Malveiro', 'Rua Serpa Pinto nº18, Loulé');
INSERT INTO substation VALUES (38.550037, -8.426936, 'Braga', 'Rui Paixão', 'Rua dos Douradores nº150, Lisboa');
INSERT INTO substation VALUES (38.765685, -8.746745, 'Braga', 'Marisa Matias', 'Avenida das Margaridas nº34, Lisboa');
INSERT INTO substation VALUES (38.678637, -8.865896, 'Braga', 'Rui Paixão', 'Rua dos Douradores nº150, Lisboa');
INSERT INTO substation VALUES (39.787037, -6.420906, 'Alfornelos', 'António Lopes', 'Avenida Engenheiro Manuel Policarpo nº56, Grijó');
INSERT INTO substation VALUES (39.456037, -6.456936, 'Alfornelos', 'António Lopes', 'Avenida Engenheiro Manuel Policarpo nº56, Grijó');
INSERT INTO substation VALUES (39.336500, -8.936379, 'Rio Maior', 'António Lopes', 'Avenida Engenheiro Manuel Policarpo nº56, Grijó');

-- insert bus_bar
INSERT INTO busbar VALUES ('B-001', 500);
INSERT INTO busbar VALUES ('B-002', 570);
INSERT INTO busbar VALUES ('B-003', 584);
INSERT INTO busbar VALUES ('B-004', 478);
INSERT INTO busbar VALUES ('B-005', 480);
INSERT INTO busbar VALUES ('B-006', 513);
INSERT INTO busbar VALUES ('B-007', 494);
INSERT INTO busbar VALUES ('B-008', 511);
INSERT INTO busbar VALUES ('B-009', 602);
INSERT INTO busbar VALUES ('B-789', 549);
INSERT INTO busbar VALUES ('B-011', 499);
INSERT INTO busbar VALUES ('B-012', 501);
INSERT INTO busbar VALUES ('B-013', 498);
INSERT INTO busbar VALUES ('B-014', 502);
INSERT INTO busbar VALUES ('B-015', 497);
INSERT INTO busbar VALUES ('B-016', 503);
INSERT INTO busbar VALUES ('B-017', 674);
INSERT INTO busbar VALUES ('B-018', 600);
INSERT INTO busbar VALUES ('B-019', 670);
INSERT INTO busbar VALUES ('B-020', 500);
INSERT INTO busbar VALUES ('B-021', 490);
INSERT INTO busbar VALUES ('B-022', 508);
INSERT INTO busbar VALUES ('B-023', 494);
INSERT INTO busbar VALUES ('B-024', 509);
INSERT INTO busbar VALUES ('B-025', 700);
INSERT INTO busbar VALUES ('B-026', 603);

-- insert transformer
INSERT INTO transformer VALUES ('T-001', 500, 570, 38.719626, -9.151154, 'B-001','B-002');
INSERT INTO transformer VALUES ('T-002', 584, 478, 38.703910, -9.209633, 'B-003','B-004');
INSERT INTO transformer VALUES ('T-003', 480, 513, 41.145828, -8.611107, 'B-005','B-006');
INSERT INTO transformer VALUES ('T-004', 494, 511, 40.209163, -8.428431, 'B-007','B-008');
INSERT INTO transformer VALUES ('T-005', 602, 549, 37.014541, -7.934232, 'B-009','B-789');
INSERT INTO transformer VALUES ('T-006', 499, 501, 38.550037, -8.426936, 'B-011','B-012');
INSERT INTO transformer VALUES ('T-007', 498, 502, 38.765685, -8.746745, 'B-013','B-014');
INSERT INTO transformer VALUES ('T-008', 497, 503, 38.678637, -8.865896, 'B-015','B-016');
INSERT INTO transformer VALUES ('T-009', 674, 600, 39.787037, -6.420906, 'B-017','B-018');
INSERT INTO transformer VALUES ('T-010', 670, 500, 39.456037, -6.456936, 'B-019','B-020');
INSERT INTO transformer VALUES ('T-011', 490, 508, 37.014541, -7.934232, 'B-021','B-022');
INSERT INTO transformer VALUES ('T-012', 494, 509, 40.209163, -8.428431, 'B-023','B-024');
INSERT INTO transformer VALUES ('T-013', 700, 603, 41.145828, -8.611107, 'B-025','B-026');

-- insert line
INSERT INTO line VALUES ('L-001', 200, 'B-002','B-003');
INSERT INTO line VALUES ('L-002', 510, 'B-004','B-005');
INSERT INTO line VALUES ('L-003', 805, 'B-006','B-007');
INSERT INTO line VALUES ('L-004', 430, 'B-008','B-009');
INSERT INTO line VALUES ('L-005', 280, 'B-789','B-011');
INSERT INTO line VALUES ('L-006', 300, 'B-012','B-013');
INSERT INTO line VALUES ('L-007', 250, 'B-014','B-015');
INSERT INTO line VALUES ('L-008', 510, 'B-016','B-017');
INSERT INTO line VALUES ('L-009', 478, 'B-018','B-019');
INSERT INTO line VALUES ('L-010', 308, 'B-020','B-021');
INSERT INTO line VALUES ('L-011', 267, 'B-022','B-023');
INSERT INTO line VALUES ('L-012', 456, 'B-024','B-025');
INSERT INTO line VALUES ('L-013', 486, 'B-026','B-001');

-- insert incident
INSERT INTO incident VALUES ('2020-03-23 13:10:45', 'L-001', 'Curto-circuito na linha', 'Muito grave');
INSERT INTO incident VALUES ('2020-07-02 21:05:24', 'L-002', 'Rutura na linha', 'Muito Grave');
INSERT INTO incident VALUES ('2020-04-12 23:35:54', 'L-003', 'Curto-circuito na linha', 'Ligeiro');
INSERT INTO incident VALUES ('2020-01-23 06:08:34', 'L-003', 'Rutura na linha', 'Muito Grave');
INSERT INTO incident VALUES ('2019-12-12 20:00:16', 'L-007', 'Curto-circuito na linha', 'Grave');
INSERT INTO incident VALUES ('2020-06-14 13:24:33', 'T-002', 'Sobrecarga do primário', 'Grave');
INSERT INTO incident VALUES ('2020-04-15 18:31:01', 'T-004', 'Secundário danificado', 'Ligeiro');
INSERT INTO incident VALUES ('2020-06-13 17:11:04', 'T-006', 'Primário danificado', 'Grave');
INSERT INTO incident VALUES ('2020-05-10 16:33:45', 'T-007', 'Secundário danificado', 'Grave');
INSERT INTO incident VALUES ('2020-04-29 14:57:42', 'B-789', 'Barramento danificado', 'Grave');
INSERT INTO incident VALUES ('2020-08-02 09:35:16', 'B-789', 'Barramento danificado', 'Grave');
INSERT INTO incident VALUES ('2020-07-29 19:34:49', 'B-789', 'Barramento danificado', 'Grave');
INSERT INTO incident VALUES ('2020-04-15 17:05:21', 'B-004', 'Barramento danificado', 'Ligeiro');

-- insert line incident
INSERT INTO lineincident VALUES ('2020-03-23 13:10:45', 'L-001', 120);
INSERT INTO lineincident VALUES ('2020-07-02 21:05:24', 'L-002', 569);
INSERT INTO lineincident VALUES ('2020-04-12 23:35:54', 'L-003', 100);
INSERT INTO lineincident VALUES ('2020-01-23 06:08:34', 'L-003', 670);
INSERT INTO lineincident VALUES ('2019-12-12 20:00:16', 'L-007', 300);

-- insert analyses
INSERT INTO analyses VALUES ('2020-07-02 21:05:24', 'L-002','Rutura na linha', 'Luís Silva', 'Rua Professor Granja Lopes nº47, Braga');
INSERT INTO analyses VALUES ('2020-06-14 13:24:33', 'T-002','Sobrecarga do primário', 'Luís Silva', 'Rua Professor Granja Lopes nº47, Braga');
INSERT INTO analyses VALUES ('2020-04-15 18:31:01', 'T-004','Bobina danificada', 'Francisco Freire', 'Rua do Paraíso nº3, Gaia');
INSERT INTO analyses VALUES ('2020-07-29 19:34:49', 'B-789','Barramento danificado', 'Francisco Freire', 'Rua do Paraíso nº3, Gaia');
INSERT INTO analyses VALUES ('2020-04-29 14:57:42', 'B-789','Barramento danificado', 'Francisco Freire', 'Rua do Paraíso nº3, Gaia');
INSERT INTO analyses VALUES ('2020-08-02 09:35:16', 'B-789','Barramento danificado', 'Francisco Freire', 'Rua do Paraíso nº3, Gaia');
INSERT INTO analyses VALUES ('2020-04-15 17:05:21', 'B-004','Barramento danificado', 'Francisco Freire', 'Rua do Paraíso nº3, Gaia');