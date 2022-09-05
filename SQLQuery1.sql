CREATE TABLE ������ (Id������� INT PRIMARY KEY,
					 ��� VARCHAR(50) NOT NULL,
					 ���������������� VARCHAR(30) NOT NULL UNIQUE,
					 ������������� VARCHAR(20) NOT NULL);
CREATE TABLE �������� (������������� INT PRIMARY KEY,
					   �������� VARCHAR(50) NOT NULL,
					   ���� FLOAT NOT NULL CHECK (����>=0),
					   ��������������� INT NOT NULL,
					   ����������� VARCHAR(10) NOT NULL DEFAULT '��');
CREATE TABLE ��������� (Id���������� INT PRIMARY KEY,
						��� VARCHAR(50) NOT NULL,
						������������� VARCHAR(20) NOT NULL,
						���� INT,
						�������� FLOAT NOT NULL DEFAULT 45000.00);
CREATE TABLE ���������� (���������������� INT PRIMARY KEY,
						 Id������� INT NOT NULL FOREIGN KEY REFERENCES ������(Id�������),
						 �������������� DATE NOT NULL,
					 	 �������������� DATE NOT NULL,
					 	 �������� INT,
						 ������������ VARCHAR(50) NOT NULL DEFAULT 'false',
						 �������� VARCHAR(20),
						 VIN��� VARCHAR(20) NOT NULL,
						 ���� VARCHAR(20) NOT NULL DEFAULT '׸����',
						 ����������� VARCHAR(20) NOT NULL,
						 CHECK (DATEDIFF(DAY,��������������,��������������)<=7));
CREATE TABLE ����������������������� (����������� INT PRIMARY KEY,
									  Id���������� INT NOT NULL FOREIGN KEY REFERENCES ���������(Id����������),
									  ����������� FLOAT NOT NULL,
									  ������������� INT NOT NULL CHECK (�������������<=30),
									  ����������������� INT NOT NULL)
CREATE TABLE ������������������� (Id������������������������� INT PRIMARY KEY,
								  ���������������� INT NOT NULL FOREIGN KEY REFERENCES ����������(����������������),
								  Id���������� INT NOT NULL FOREIGN KEY REFERENCES ���������(Id����������),
								  �������� VARCHAR(50) NOT NULL,
								  ����������� DATE NOT NULL);
CREATE TABLE ��������������������� (Id���������������������� INT PRIMARY KEY,
									����������� INT NOT NULL FOREIGN KEY REFERENCES �����������������������(�����������),
									������������� INT NOT NULL FOREIGN KEY REFERENCES ��������(�������������),
									���������� INT NOT NULL,
									���������������� VARCHAR(10) NOT NULL DEFAULT '��');
CREATE TABLE ������������������� (Id������������������� INT PRIMARY KEY,
								  ���������������� INT NOT NULL FOREIGN KEY REFERENCES ����������(����������������),
								  ������������� INT NOT NULL FOREIGN KEY REFERENCES ��������(�������������),
								  ���������� INT NOT NULL DEFAULT 1);