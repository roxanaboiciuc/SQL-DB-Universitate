CREATE DATABASE Universitate;

CREATE TABLE facultate(
id_facultate VARCHAR(6) PRIMARY KEY,
denumire VARCHAR(30) NOT NULL
);

CREATE TABLE specializari(
id_specializare VARCHAR(10) PRIMARY KEY,
id_facultate VARCHAR(6) NOT NULL,
denumire VARCHAR(30) NOT NULL,
totalnrcredite INT(4) NOT NULL,
FOREIGN KEY(id_facultate) REFERENCES facultate(id_facultate)
);

CREATE TABLE profesori(
id_profesor INT(5) PRIMARY KEY AUTO_INCREMENT,
prenume VARCHAR(30) NOT NULL,
nume VARCHAR(60) NOT NULL,
localitate VARCHAR(25) NOT NULL,
data_angajarii DATE,
salariu DOUBLE(8,2),
domeniustudiu VARCHAR(20),
id_facultate VARCHAR(6) NOT NULL,
FOREIGN KEY(id_facultate) REFERENCES facultate(id_facultate)
);

CREATE TABLE cursuri(
id_curs INT(4) PRIMARY KEY AUTO_INCREMENT,
denumire VARCHAR(40) NOT NULL,
durata_curs INT(3),
id_profesor INT(5),
FOREIGN KEY(id_profesor) REFERENCES profesori(id_profesor)
);


CREATE TABLE detalii_cursuri(
id_curs INT(4) NOT NULL,
id_student VARCHAR(10) NOT NULL,
calificativ FLOAT(4,2),
statuscurs VARCHAR(12),
PRIMARY KEY(id_curs, id_student),
FOREIGN KEY(id_curs) REFERENCES cursuri(id_curs)
);

CREATE TABLE studenti(
id_student VARCHAR(10) PRIMARY KEY NOT NULL,
prenume VARCHAR(30) NOT NULL,
nume VARCHAR(60) NOT NULL,
cnp CHAR(13) NOT NULL,
localitate VARCHAR(25),
ciclu_universitar VARCHAR(20),
an_studiu INT(2),
credite_an_curent SMALLINT(4),
id_facultate VARCHAR(6)
);

/* operatii de modificare a structurii tabelelor*/
ALTER TABLE cursuri ADD nrcreditecurs INT(2);

ALTER TABLE profesori DROP domeniustudiu;

ALTER TABLE studenti MODIFY id_facultate VARCHAR(6) NOT NULL;

ALTER TABLE studenti ADD FOREIGN KEY(id_facultate) REFERENCES facultate(id_facultate);

ALTER TABLE facultate CHANGE denumire denumire VARCHAR(100);

ALTER TABLE specializari CHANGE denumire denumire VARCHAR(100);

RENAME TABLE facultate TO facultati;

/* inserare date in tabele*/

INSERT INTO facultati VALUES ('AIMA', 'Antreprenoriat, Ingineria si Managementul Afacerilor'),
('BUSTUR','Business si Turism'),
('CIG','Contabilitate si informatica de gestiune'),
('DREPT','Drept'),
('ECOTA','Economie Teoretica si Aplicata'),
('FABBV','Finante, Asigurari, Banci si Burse de Valori'),
('GEOGR','Geografie'),
('CSIE','Cibernetica, Statistica si Informatica Economica'),
('JSC','Jurnalism si Stiintele Comunicarii'),
('MK','Marketing'),
('REI','Relatii Economice Internationale');

INSERT INTO specializari VALUES 
('MRU','AIMA','managementul resurselor umane',400),
('DEZVORG','AIMA','dezvoltare organizationala',400),
('MNGPRJ','AIMA','management de proiect',400),
('AAC','BUSTUR','administrarea afacerilor comerciale',450),
('AAT','BUSTUR','administrarea afacerilor in turism',450),
('MCEPC','BUSTUR','managementul calitatii, expertize si protectia consumatorului',450),
('FCARA','BUSTUR','fraude, contraafaceri si riscuri asociate',450),
('CIG','CIG','contabilitate si informatica de gestiune',500),
('AFEVAL','CIG','analiza financiara si evaluare',500),
('CCE','CIG','contabilitate, control si expertiza',500),
('CAIG','CIG','contabilitate, audit si informatica de gestiune',500),
('TCFGA','CIG','tehnici contabile si financiare de gestiunea afacerilor',500),
('CNINTL','CIG','contabilitate internationala',500),
('INECO','CSIE','informatica economica',500),
('CIBEREC','CSIE','cibernetica economica',500),
('STPE','CSIE','statistica  si previziune economica',500),
('CEC','CSIE','cibernetica si economie cantitativa',500),
('MIP','CSIE','managementul informatizat al proiectelor',500),
('SECINFO','CSIE','securitatea informatica',500),
('DRROM','DREPT','drept roman',500),
('INSPOL','DREPT','institutii politice',500),
('DOCJUR','DREPT','doctrine juridice',500),
('DREPUE','DREPT','dreptul UE',500),
('ECOPOL','DREPT','economie politica',500),
('DRINTL','DREPT','drept international',500),
('DECC','ECOTA','doctrine economice clasice si contemporane',300),
('ASECO','ECOTA','analize si strategii economice',300),
('TMC','ECOTA','teorii ?i modele ale concurentei',300),
('FINBC','FABBV','finante si banci',450),
('FISCA','FABBV','fiscalitate',450),
('FINCORP','FABBV','finante corporative',450),
('MFISB','FABBV','management financiar si investitii si a sistemelor bancare',450),
('APA','FABBV','aspecte practice in actuariat',450),
('PTERIT','GEOGR','planificare teritoriala',400),
('CARTO','GEOGR','cartografie',400),
('HIDMET','GEOGR','hidrologie-meteorologie',400),
('SISTGR','GEOGR','sisteme informationale geografice',400),
('DEZTER','GEOGR','dezvoltare teritoriala',400),
('GADR','GEOGR','geografie aplicata si dezvoltare regionala',400),
('JURN','JSC','jurnalism',300),
('CRP','JSC','comunicare si relatii publice',300),
('PUBL','JSC','publicitate',300),
('MIM','JSC','Managementul Institutiilor Media',300),
('MKSTR','MK','marketing strategiv',350),
('CERMK','MK','cercetari de marketing',350),
('MKONL','MK','marketing online',350),
('MKCA','MK','maketing si comunicare in afaceri',350),
('PRMK','MK','relatii publice in marketing',350),
('ECI','REI','economie si afaceri internationale',450),
('LMAC','REI','limbi moderne aplicate in economie',450),
('MNGPI','REI','managementul proiectelor internationale',450),
('LOGINTL','REI','logistica internationala',450),
('DEAI','REI','diplomatie economica si afaceri internationale',450),
('TIDC','REI','traductologie si interpretariat in domeniul economic',450);


INSERT INTO cursuri (id_curs, denumire, durata_curs, id_profesor, nrcreditecurs) VALUES 
(1,'Microeconomie',20,108,200),
(2,'Macroecnomie',35,102,150),
(3,'Statistica',14,103,150),
(4,'Econometrie',12,104,150),
(5,'Matematica',10,105,250),
(6,'Geografie',9,106,160),
(NULL,'PR',7,107,120),
(NULL,'Limba engleza',9,119,50),
(NULL,'Limba franceza',5,113,50),
(NULL,'Limba germana',3,109,50),
(NULL,'Limba latina',3,120,20),
(NULL,'Finante',19,121,250),
(NULL,'Fiscalitate',15,113,300),
(NULL,'Evaluarea intreprinderilor',13,114,210),
(NULL,'Marketing',24,118,110),
(NULL,'Informatica',35,116,250),
(NULL,'Drept comercial',14,128,120),
(NULL,'Drept international',32,126,290),
(NULL,'Drept penal',16,122,320),
(NULL,'Informatica economica',37,127,190),
(NULL,'E-business',29,101,270);


INSERT INTO studenti VALUES
('AS2920211','Adina','Suciu','2920211204480','Petrosani','licenta',2,200,'FABBV'),
('AC1920423','Adrian','Cadar','1920423270886','Roman','master',4,420,'BUSTUR'),
('AZ1900329','Adrian Nicolae','Zamfirescu','1900329340914','Rosiori de Vede','doctorat',1,180,'CIG'),
('AT1920912','Adrian Stefanel','Tiru','1920912090048','Braila','licenta',2,400,'DREPT'),
('AC2900222','Alexandra','Calenciuc','2900222090051','Braila','master',3,170,'ECOTA'),
('AB2881030','Alexandra','Bejgu','2881030460042','Bucuresti','master',4,150,'FABBV'),
('AP2900729','Alexandra','Petras','2900729226226','Hirlau','licenta',1,350,'GEOGR'),
('AS2880713','Alexandrina','Stoica','2880713046202','Bacau','licenta',2,360,'CSIE'),
('AI1880925','Alexandru','Irimia','1880925045418','Onesti','licenta',4,400,'ECOTA'),
('AI1891209','Alexandru Ciprian','Iacobescu','1891209360672','Macin','doctorat',2,170,'ECOTA'),
('AU1880601','Alexandru Liviu','Ungureanu','1880601100219','Buzau','licenta',4,190,'MK'),
('AV1920226','Alexandru Lucian','Vilcea','1920226295321','Sinaia','licenta',3,320,'FABBV'),
('AB1890517','Alexandru Mirel','Bulai','1890517270835','Roman','postuniversitar',1,700,'DREPT'),
('AD1891218','Alexandru Sebastian','Decianu','1891218134145','Constanta','postuniversitar',3,140,'CIG'),
('AP1880419','Alin George','Poede','1880419374558','Vaslui','licenta',3,640,'REI'),
('AD2900811','Ana Alexandra','Dinu','2900811162684','Bechet','doctorat',4,390,'REI'),
('AP2890617','Ana Maria','Predescu','2890617384960','Dragasani','master',1,120,'REI'),
('AF2881203','Andreea','Farcas','2881203270824','Roman','master',4,200,'JSC'),
('AC2890327','Andreea','Ciobanoiu','2890327100143','Buzau','licenta',4,100,'REI'),
('AL2900914','Andreea','Lungu','2900914270860','Roman','doctorat',2,350,'JSC'),
('AT2881122','Andreea Ionela','Tudor','2881122340944','Rosiori de Vede','licenta',3,400,'ECOTA'),
('AG2890327','Andreea Lucica','Grigore','2890327430122','Slatina','licenta',4,150,'FABBV'),
('AP2880903','Aura Nicoleta','Paraschiv','2880903394446','Focsani','postuniversitar',4,360,'REI'),
('BP1910112','Bogdan','Pecete','1910112226701','Iasi','master',1,360,'REI'),
('CA2880915','Claudia','Andronache','2880915150451','Gaesti','postuniversitar',3,420,'DREPT'),
('CS2900623','Claudia Elena','Stamatin','2900623270037','Piatra Neamt','master',2,140,'REI'),
('CP1890428','Cosmin Alexandru','Parvulescu','1890428020076','ARAD','doctorat',3,640,'GEOGR'),
('CU1911224','Cristian Dumitru','Uricec','1911224330679','Siret','licenta',1,390,'CIG'),
('CF1900120','Cristian Valentin','Fota','1900120283551','Draganesti','doctorat',4,360,'FABBV'),
('DU1881012','Daniel','Urda','1881012134207','Constanta','master',2,450,'BUSTUR'),
('DV1910208','Daniel George','Visoiu','1910208297241','Ploiesti','licenta',3,140,'AIMA'),
('DV2880523','Daniela Elena','Vasile','2880523420019','Bucuresti','licenta',3,250,'CSIE'),
('DG1901013','Doru Madalin','Geana','1901013180023','Tg Jiu','postuniversitar',4,120,'REI'),
('DB1900531','Dragos Andrei','Badan','1900531152474','Targoviste','licenta',2,200,'CSIE'),
('DB1920804','Dumitru Marius','Baisan','1920804385576','Ramnicu Valcea','master',2,100,'REI'),
('EU2890203','Elena Alexandra','Ungureanu','2890203134120','Constanta','licenta',3,350,'CIG'),
('ED2900624','Elena Andreea','Dinca','2900624385583','Ramnicu Valcea','licenta',3,400,'CSIE'),
('EC2910914','Elena Simona','Coles','2910914030019','Campulung','doctorat',2,150,'DREPT'),
('ED2900915','Elena Veronica','Dobrica','2900915450016','Bucuresti','doctorat',3,360,'GEOGR'),
('FP2890717','Florentina','Prodan','2890717133406','Cernavoda','licenta',4,360,'REI'),
('GB1910223','George Aurelian','Bombeanu','1910223460030','Bucuresti','licenta',4,420,'CSIE'),
('GA2891119','Georgiana','Amza','2891119250068','Drobeta Turnu Severin','licenta',1,150,'JSC'),
('GS2930409','Georgiana Florentina','Spiridon','2930409044925','Comanesti','licenta',3,360,'FABBV'),
('HB2900223','Hanna','Botar','2900223190438','Miercurea Ciuc','master',4,360,'REI'),
('IM2890812','Ileana Madalina','Matei','2890812152484','Targoviste','master',3,420,'REI'),
('IC2881016','Ioana','Comsulea','2881016081839','Fagaras','doctorat',3,350,'ECOTA'),
('IS2900217','Ioana','Simion','2900217280879','Caracal','licenta',2,400,'AIMA'),
('IC1890828','Ionut','Constantin','1890828360014','Tulcea','licenta',3,150,'CSIE'),
('IE1910821','Ionut Viorel','Enache','1910821384781','Horezu','master',1,360,'CSIE'),
('IR1890927','Iulian','Radu','1890927510026','Calarasi','master',1,150,'CSIE'),
('LB2890901','Laura Maria','Boncea','2890901180015','Targu Jiu','licenta',4,150,'DREPT'),
('LR2880615','Lilia','Raicu','2880615410170','Republica Moldova','licenta',1,360,'DREPT'),
('LS1881008','Liviu Nicolae','Spiroiu','1881008180020','Targu Jiu','licenta',3,360,'ECOTA'),
('LP1881030','Liviu Razvan','Popa','1881030410087','Onesti','licenta',1,420,'REI'),
('LP1881219','Lucian Ionut','Pantelimon','1881219160064','Craiova','master',1,100,'ECOTA'),
('MT2900811','Maria Cristina','Tapalau','2900811151642','Moreni','postuniversitar',1,250,'DREPT'),
('ML2890808','Maria Rucsandra','Lascae','2890808295927','Campina','doctorat',2,350,'REI'),
('MB2880419','Mihaela','Buga','2880419340446','Alexandria','master',1,350,'CSIE'),
('MB1890807','Mihai','Bulaicon','1890807336386','Falticeni','master',1,400,'CSIE'),
('MV1900212','Mihail Cristian','Viscea','1900212211196','Slobozia','postuniversitar',1,150,'CSIE'),
('MU2890427','Mirabela Larisa','Ureche','2890427132804','Medgidia','postuniversitar',2,150,'REI'),
('MA1910116','Mircea Cristian','Arhip','1910116450024','Bucuresti','master',2,360,'REI'),
('MN1880904','Mircea Dragos','Nicolescu','1880904160078','Craiova','doctorat',1,360,'REI'),
('MY7881007','Murat','Yilmaz','7881007400024','Turcia','master',2,420,'GEOGR'),
('OA2900324','Oana Maria','Alui-Ion','2900324271698','Tg. Neamt','master',4,500,'FABBV'),
('RL1900302','Radu Mihai','Lacatus','1900302100131','Buzau','licenta',2,150,'AIMA'),
('RA1880726','Radu Stefan','Andrei','1880726410103','Bucuresti','doctorat',3,360,'DREPT'),
('RD1881011','Razvan George','Dumitrica','1881011430024','Bucuresti','licenta',4,360,'ECOTA'),
('RS1900227','Robert Florin','Stefanescu','1900227440047','Bucuresti','licenta',1,420,'REI'),
('RT2890923','Roxana','Tudorache','2890923134207','Constanta','master',2,400,'DREPT'),
('SN1880908','Sergiu Mihai','Nita','1880908460056','Bucuresti','doctorat',2,500,'FABBV'),
('SF2880213','Silvia Alina','Florescu','2880213520051','Giurgiu','doctorat',2,300,'CSIE'),
('SR1880424','Sorin Victor','Rusu','1880424226739','Iasi','master',2,200,'DREPT'),
('SE1891118','Stefan','Ene','1891118035271','Pitesti','licenta',3,200,'JSC'),
('SO1880407','Stefan Alexandru','Ojog','1880407374522','Vaslui','licenta',1,400,'CIG'),
('TP2891001','Teodora Valeria','Parauta','2891001080094','Brasov','licenta',2,550,'REI'),
('TC2900501','Theodora Amalia','Chirila','2900501330198','Suceava','licenta',3,400,'GEOGR'),
('VB1890508','Valentin Adrian','Barbus','1890508384962','Dragasani','doctorat',4,150,'GEOGR'),
('VB2900626','Valentina','Bold','2900626284541','Slatina','licenta',4,150,'CIG'),
('VU1890117','Victor Sebastian','Ungureanu','1890117410107','Bucuresti','licenta',2,360,'REI'),
('VB1900506','Virgil Mihai','Balaban','1900506371692','Vaslui','licenta',4,360,'CIG'),
('VC1900807','Vlad','Cristea','1900807270024','Piatra Neamt','licenta',2,200,'GEOGR'),
('VI1920812','Vlad Nicolae','Ionescu','1920812450019','Bucuresti','licenta',1,200,'GEOGR');

INSERT INTO profesori VALUES
(101,'Marius Dumitru','Stuparu','Alexandria','2012-05-12',5400,'GEOGR'),
(102,'Florin ','Iosub','Bacau','2009-02-10',8700,'GEOGR'),
(103,'Razvan','Ichim','Braila','2015-04-07',4700,'MK'),
(104,'Ionela Nicoleta','Masdrag','Braila','2013-04-02',5000,'JSC'),
(105,'Dan ','Piciorus','Braila','2006-03-03',4500,'CSIE'),
(106,'Mihnea Alexandru','Bobes','Bucuresti','2016-04-12',2900,'FABBV'),
(107,'Andrei','Bostan','Bucuresti','2013-05-16',8700,'CIG'),
(108,'Ana Marina','Doana','Bucuresti','2004-01-10',5300,'REI'),
(109,'Bianca Nicoleta','Dumitrescu','Bucuresti','2006-12-01',3900,'ECOTA'),
(110,'Andreea Ioana','Fusareanu','Bucuresti','2008-06-13',5000,'BUSTUR'),
(111,'Constantin Valentin','Gheorghe','Buzau','2014-07-12',6700,'GEOGR'),
(112,'Corina ','Ghilase','Cernavoda','2009-02-10',4850,'FABBV'),
(113,'Mirela','Lepadatu','Cernavoda','2006-03-03',3600,'GEOGR'),
(114,'Marius Adrian','Leanca','Galati','2007-05-04',3900,'MK'),
(115,'Lucian Gheorghe','Corcaci','Iasi','2004-09-20',2700,'REI'),
(116,'Radu Bogdan','Nedelcu','Iasi','2013-02-23',5200,'AIMA'),
(117,'Valeriu','Chilian','Marasesti','2007-11-12',6500,'BUSTUR'),
(118,'Bianca Vasilica','Medovarschi','Nadlac','2013-07-19',4800,'DREPT'),
(119,'Claudia Corina','Schiopu','Piatra Neamt','2012-07-14',6000,'FABBV'),
(120,'Emanuela Maria','Stici','Piatra Neamt','2013-07-20',3390,'ECOTA'),
(121,'Mihaela Monica','Butnaru','Pitesti','2013-06-19',4600,'GEOGR'),
(122,'George Mihail','Stan', 'Ploiesti','2006-03-03',6000,'CSIE'),
(123,'Catalin Constantin','Bulancea','Roman','2013-02-23',6100,'FABBV'),
(124,'Sorin Aurel','Barbulea','Sibiu','2007-11-12',3900,'GEOGR'),
(125,'Costin Vladut','Dima','Slobozia','2006-03-03',7400,'CSIE'),
(126,'Luiza Marieta','Borjog','Suceava','2015-04-07',4300,'JSC'),
(127,'Dorin Mihai','Palanciuc','Suceava','2013-04-02',3900,'CSIE'),
(128,'Carmen Alina','Musat','Urziceni','2006-03-03',5200,'MK'),
(129,'Victor','Grigoriu','Vatra Dornei','2013-04-02',3870,'REI');

INSERT INTO detalii_cursuri VALUES
(1,'VB2900626',3,'RESPINS'),
(1,'LP1881030',9.5,'ADMIS'),
(2,'MN1880904',4,'RESPINS'),
(2,'AI1891209',8,'ADMIS'),
(2,'GS2930409',9,'ADMIS'),
(3,'SE1891118',6,'ADMIS'),
(4,'SR1880424',1,'RESPINS'),
(4,'TC2900501',2,'RESPINS'),
(4,'SO1880407',3,'RESPINS'),
(4,'IC1890828',5,'ADMIS'),
(4,'AD2900811',7,'ADMIS'),
(4,'AP2890617',8,'ADMIS'),
(4,'ED2900915',9,'ADMIS'),
(4,'HB2900223',9.8,'ADMIS'),
(4,'AC1920423',10,'ADMIS'),
(4,'AD1891218',10,'ADMIS'),
(6,'AT1920912',7.5,'ADMIS'),
(6,'MB1890807',8.5,'ADMIS'),
(6,'TP2891001',9,'ADMIS'),
(7,'CP1890428',6,'ADMIS'),
(7,'DU1881012',6,'ADMIS'),
(7,'IM2890812',7,'ADMIS'),
(8,'VB1890508',4,'RESPINS'),
(8,'RL1900302',8,'ADMIS'),
(8,'RT2890923',9,'ADMIS'),
(9,'AZ1900329',3,'RESPINS'),
(9,'RD1881011',6,'ADMIS'),
(9,'SF2880213',10,'ADMIS'),
(10,'VB1900506',7,'ADMIS'),
(10,'DV2880523',10,'ADMIS'),
(11,'CF1900120',8,'ADMIS'),
(11,'DB1900531',9,'ADMIS'),
(11,'LR2880615',9.8,'ADMIS'),
(12,'LS1881008',3,'RESPINS'),
(12,'IS2900217',4,'RESPINS'),
(12,'ML2890808',6,'ADMIS'),
(12,'AS2880713',8,'ADMIS'),
(12,'IE1910821',9,'ADMIS'),
(12,'MV1900212',10,'ADMIS'),
(12,'VC1900807',10,'ADMIS'),
(13,'SN1880908',4,'RESPINS'),
(13,'AP2880903',7,'ADMIS'),
(13,'AP2900729',8,'ADMIS'),
(13,'MY7881007',8,'ADMIS'),
(13,'DG1901013',9,'ADMIS'),
(13,'RS1900227',9,'ADMIS'),
(13,'MU2890427',9.8,'ADMIS'),
(14,'BP1910112',3,'RESPINS'),
(14,'CA2880915',6,'ADMIS'),
(15,'VU1890117',7,'ADMIS'),
(15,'GB1910223',10,'ADMIS'),
(15,'IC2881016',10,'ADMIS'),
(16,'DV1910208',4,'RESPINS'),
(16,'IR1890927',6,'ADMIS'),
(16,'MT2900811',6,'ADMIS'),
(16,'VI1920812',7,'ADMIS'),
(16,'AB2881030',8,'ADMIS'),
(16,'AC2900222',9,'ADMIS'),
(16,'FP2890717',9,'ADMIS'),
(16,'AI1880925',9.8,'ADMIS'),
(17,'MB2880419',3,'RESPINS'),
(17,'LP1881219',4,'RESPINS'),
(17,'CU1911224',6,'ADMIS'),
(17,'AT2881122',8,'ADMIS'),
(17,'GA2891119',9,'ADMIS'),
(18,'EC2910914',3,'RESPINS'),
(18,'CS2900623',4,'RESPINS'),
(18,'AF2881203',10,'ADMIS'),
(18,'AU1880601',10,'ADMIS'),
(19,'AB1890517',6,'ADMIS'),
(19,'EU2890203',10,'ADMIS'),
(20,'AL2900914',7,'ADMIS'),
(20,'AP1880419',8,'ADMIS'),
(20,'OA2900324',9,'ADMIS'),
(20,'AC2890327',10,'ADMIS'),
(21,'AS2920211',4,'RESPINS'),
(21,'DB1920804',6,'ADMIS'),
(21,'RA1880726',7.5,'ADMIS'),
(21,'AV1920226',9,'ADMIS'),
(21,'AG2890327',9.8,'ADMIS'),
(21,'ED2900624',10,'ADMIS'),
(21,'LB2890901',10,'ADMIS'),
(21,'MA1910116',10,'ADMIS');

/* instructiune sql prin care se vor muta cursurile de limbi straine profesorului cu id-ul 129*/

UPDATE cursuri SET id_profesor=129 WHERE id_curs IN(8,9,10,11);


/*instructiune sql prin care se vor mari notele studentilor la cursurile de limbi straine cu 2 puncte celor ce au nota
mai mica sau egala cu 5, astfel stautusul examenului va fi ADMIS*/

UPDATE detalii_cursuri SET calificativ=calificativ+2, statuscurs='ADMIS' 
WHERE calificativ<=5 AND id_curs BETWEEN 8 AND 11;


/*instructiune sql prin care se sterg cursurile de E-business si PR*/

DELETE FROM cursuri WHERE id_curs=7 OR id_curs=21;

/* se sterg profesorii angajati in 2008*/

DELETE FROM profesori WHERE YEAR(data_angajarii)=2008;


/* afisare studentii din provincie, ordonati dupa nume*/

SELECT * FROM studenti WHERE localitate!='Bucuresti' ORDER BY nume;

/* afisare cursuri cu cele mai mici durate, ordonati dupa durata; afisare: id curs, denumire, durata curs*/

SELECT id_curs, denumire, durata_curs FROM cursuri ORDER BY durata_curs ASC;

/* afisare profesori din Bucuresti angajati in 2016, ordonati dupa nume; afisare nume, prenume, localitate, data_angajarii*/

SELECT prenume, nume, localitate, data_angajarii FROM profesori WHERE YEAR(data_angajarii)=2016 ORDER BY nume;

/* selecteaza studentii cu note sub 7 ; afisare: id student si nota*/

SELECT id_student, calificativ FROM detalii_cursuri WHERE calificativ<7;


/* selecteaza cele mai mari 3 salarii ale profesorilor ce predau la Facultatea de Geografie; 
afisare: id_facultate, prenume, nume, salariu, */

SELECT id_facultate, prenume, nume, salariu FROM profesori 
WHERE id_facultate LIKE 'GEOGR' ORDER BY salariu DESC LIMIT 3;


/* afisare profesorii cu salarii cuprinse intre 1000 si 4000; afisare: prenume, nume, salariu; 
ordonati crescator dupa nume si descrescator dupa salariu*/

SELECT prenume, nume, salariu FROM profesori WHERE salariu BETWEEN 1000 AND 4000
ORDER BY nume ASC, salariu DESC;


/* afisare studentii de la facultatile REI si Geografie din anul 1, la ciclul licenta; 
afisare: id_facultate,prenume, nume, ciclu universitar, an studiu; ordonare dupa nume */

SELECT id_facultate, prenume, nume, ciclu_universitar, an_studiu FROM studenti
WHERE id_facultate IN('REI','GEOGR') AND ciclu_universitar LIKE 'licenta%'  AND an_studiu=1
ORDER BY nume ASC;

/* afisare nr total de studenti inscrisi la facultatile de Jurnalism si Drept; 
afisare: id_facultate, nr total de studenti */

SELECT id_facultate AS 'Facultate', COUNT(id_student) AS 'Nr total de studenti inscrisi' 
FROM studenti 
WHERE id_facultate='JSC' OR id_facultate='DREPT' GROUP BY id_facultate;

/*afisare nr de studenti din fiecare oras; afisare: oras  si nr de studenti*/

SELECT localitate AS 'Oras', COUNT(id_student) AS 'Numar de studenti'
FROM studenti GROUP BY localitate;


/* afisare studenti nascuti in anul 1990; afisare: prenume, nume, an ; ordonati dupa nume*/

SELECT prenume, nume, cnp FROM studenti WHERE cnp LIKE '_90%' ORDER BY nume;

/*afiseaza media salariilor profesorilor de la facultatea CSIE; 
afisare; id facultate, media (rotunjita la 2 zecimale) */

SELECT id_facultate AS 'Facultate', ROUND(AVG(salariu),2) AS 'Media salariilor' 
FROM profesori WHERE id_facultate='CSIE' GROUP BY id_facultate;


/* afisare studenti cu cele mai mari credite; 
afisare nume si prenume studenti, nr de credite*/


SELECT CONCAT(prenume,' ',nume) AS 'Nume si prenume', credite_an_curent AS 'Credite' FROM studenti 
ORDER BY credite_an_curent DESC;


/* afisare nr total de cursanti inscrisi la o facultate; 
afisare: denumirea facultatii, nr total de studenti*/


SELECT a.denumire AS 'Denumirea facultatii', COUNT(b.id_student) AS 'Nr studenti'
FROM facultati AS a 
JOIN studenti AS b 
ON a.id_facultate=b.id_facultate 
GROUP BY a.denumire;


/*afisare nr total de profesori care predau la o facultate;
afisare: id facultate si nr total de studenti */

SELECT a.id_facultate AS 'Id_facultate', COUNT(b.id_profesor) AS 'Nr profesori'
FROM facultati AS a 
JOIN profesori AS b 
ON a.id_facultate=b.id_facultate
GROUP BY a.id_facultate;


/* afisare profesori care predau la specializarile faculatilor de contabilitate si finante;
afisare: id_facultate, denumirea specializarii, numele si prenumele profesorului*/

SELECT s.id_facultate, s.denumire, CONCAT(p.prenume,' ',p.nume) AS 'Nume si prenume'
FROM profesori p 
JOIN specializari s
ON p.id_facultate=s.id_facultate
WHERE p.id_facultate='CIG' OR p.id_facultate='FABBV';

/* afisare studenti care au picat cursurile de Drept;
afisare: nume si prenume studenti, denumirea cursului, status curs */
SELECT CONCAT(s.prenume,' ',s.nume) AS 'Nume si prenume', c.denumire, d.statuscurs
FROM studenti s
JOIN detalii_cursuri d
ON s.id_student=d.id_student
JOIN cursuri c
ON d.id_curs=c.id_curs
WHERE c.id_curs IN(17,18,19) AND statuscurs='RESPINS';

/*aceeasi cerinta de mai sus, dar cu USING*/

SELECT CONCAT(s.prenume,' ',s.nume) AS 'Nume si prenume', c.denumire, d.statuscurs
FROM studenti s
JOIN detalii_cursuri d
USING(id_student)
JOIN cursuri c
USING(id_curs)
WHERE c.id_curs IN(17,18,19) AND d.statuscurs='RESPINS';

/*afisare profesori din Bucuresti si studenti din Bucuresti;
afisare: nume si prenume profesor/student, oras, observatii*/

SELECT CONCAT(p.prenume,' ',p.nume) AS 'Nume si prenume', p.localitate, 'Profesor' AS Observatii
FROM profesori p
WHERE localitate='Bucuresti'
UNION
SELECT CONCAT(s.prenume,' ',s.nume) AS 'Nume si prenume', s.localitate, 'Student' AS Observatii
FROM studenti s
WHERE localitate='Bucuresti'
ORDER BY 'Nume si prenume';

/* afisare studentii care au notele mai mari la cursul de informatica decat media cursului de econometrie;
afisare: nume si prenume si note */


SELECT CONCAT(s.prenume,' ',s.nume) AS 'Nume si prenume', d.calificativ
FROM studenti s JOIN detalii_cursuri d ON s.id_student=d.id_student WHERE d.id_curs=16 AND d.calificativ>(
SELECT ROUND(AVG(d.calificativ),2)
FROM detalii_cursuri d
WHERE d.id_curs=4);

/* afisare studentii care au mai putine credite la in anul curent decat nr maxim pt a promova facultatea de Anteprenoriat;
afisare: nume si prenume studenti, nr credite*/

SELECT CONCAT(stud.prenume,' ',stud.nume) AS 'Nume si prenume', stud.credite_an_curent AS 'Nr credite'
FROM studenti stud
JOIN specializari s
ON stud.id_facultate=s.id_facultate
WHERE stud.id_facultate='AIMA' AND stud.credite_an_curent<(
SELECT SUM(s.totalnrcredite)
FROM specializari s WHERE s.id_facultate='AIMA');

/* tabela virtuala cu profesorii dinafara Bucurestiului*/

CREATE VIEW profesori_view AS
SELECT * FROM profesori WHERE localitate!='Bucuresti';

/*tabela virtuala cu toate cursurile cu status "admis" */

CREATE VIEW cursuri_admis AS
SELECT * FROM detalii_cursuri WHERE statuscurs LIKE 'ADMIS';

/*se sterg din view cursurile 19,20,21*/


DELETE FROM cursuri_admis WHERE id_curs=19 OR id_curs=20 OR id_curs=21; 

/*inseram in view-ul profesori_view*/

INSERT INTO profesori_view VALUES (300,'Ion','Ionescu','Piatra Neamt','2016-11-21',9999,'REI');


/*o functie care primeste ca parametru de intrare un id specializare si sa returneze 
id-ul facultatii din care acesta face parte*/


DELIMITER //
CREATE FUNCTION id_fac(specializare VARCHAR(50))
	RETURNS VARCHAR(100)
BEGIN
DECLARE faculty VARCHAR(100);
SELECT id_fac INTO faculty
	FROM facultati f JOIN specializari s
	ON s.id_specializare=f.id_facultate
	WHERE id_spec LIKE specializare;
RETURN id_fac;
END;
//
DELIMITER ;

SELECT id_fac('CIG');


