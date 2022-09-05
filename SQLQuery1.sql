CREATE TABLE Клиент (IdКлиента INT PRIMARY KEY,
					 ФИО VARCHAR(50) NOT NULL,
					 ПаспортныеДанные VARCHAR(30) NOT NULL UNIQUE,
					 НомерТелефона VARCHAR(20) NOT NULL);
CREATE TABLE Запчасть (НомерЗапчасти INT PRIMARY KEY,
					   Название VARCHAR(50) NOT NULL,
					   Цена FLOAT NOT NULL CHECK (Цена>=0),
					   НаличиеНаСкладе INT NOT NULL,
					   ЕдИзмерения VARCHAR(10) NOT NULL DEFAULT 'шт');
CREATE TABLE Сотрудник (IdСотрудника INT PRIMARY KEY,
						ФИО VARCHAR(50) NOT NULL,
						НомерТелефона VARCHAR(20) NOT NULL,
						Стаж INT,
						Зарплата FLOAT NOT NULL DEFAULT 45000.00);
CREATE TABLE НарядЗаказ (НомерНарядЗаказа INT PRIMARY KEY,
						 IdКлиента INT NOT NULL FOREIGN KEY REFERENCES Клиент(IdКлиента),
						 ДатаОформления DATE NOT NULL,
					 	 ДатаИсполнения DATE NOT NULL,
					 	 Гарантия INT,
						 СтатусОплаты VARCHAR(50) NOT NULL DEFAULT 'false',
						 ГосНомер VARCHAR(20),
						 VINКод VARCHAR(20) NOT NULL,
						 Цвет VARCHAR(20) NOT NULL DEFAULT 'Чёрный',
						 МаркаМашины VARCHAR(20) NOT NULL,
						 CHECK (DATEDIFF(DAY,ДатаОформления,ДатаИсполнения)<=7));
CREATE TABLE ЗаказНаЗакупкуЗапчастей (НомерЗаказа INT PRIMARY KEY,
									  IdСотрудника INT NOT NULL FOREIGN KEY REFERENCES Сотрудник(IdСотрудника),
									  ЦенаНаЗаказ FLOAT NOT NULL,
									  ВремяДоставки INT NOT NULL CHECK (ВремяДоставки<=30),
									  КоличествоПозиций INT NOT NULL)
CREATE TABLE СотрудникНарядЗаказ (IdНомерСотрудникНарядЗаказа INT PRIMARY KEY,
								  НомерНарядЗаказа INT NOT NULL FOREIGN KEY REFERENCES НарядЗаказ(НомерНарядЗаказа),
								  IdСотрудника INT NOT NULL FOREIGN KEY REFERENCES Сотрудник(IdСотрудника),
								  ВидРабот VARCHAR(50) NOT NULL,
								  ДатаРемонта DATE NOT NULL);
CREATE TABLE СоставЗаказаНаЗакупку (IdСоставаЗаказаНаЗакупку INT PRIMARY KEY,
									НомерЗаказа INT NOT NULL FOREIGN KEY REFERENCES ЗаказНаЗакупкуЗапчастей(НомерЗаказа),
									НомерЗапчасти INT NOT NULL FOREIGN KEY REFERENCES Запчасть(НомерЗапчасти),
									Количество INT NOT NULL,
									ЕдиницаИзмирения VARCHAR(10) NOT NULL DEFAULT 'шт');
CREATE TABLE ЗапчастьНарядЗаказа (IdЗапчастиНарядЗаказа INT PRIMARY KEY,
								  НомерНарядЗаказа INT NOT NULL FOREIGN KEY REFERENCES НарядЗаказ(НомерНарядЗаказа),
								  НомерЗапчасти INT NOT NULL FOREIGN KEY REFERENCES Запчасть(НомерЗапчасти),
								  Количество INT NOT NULL DEFAULT 1);