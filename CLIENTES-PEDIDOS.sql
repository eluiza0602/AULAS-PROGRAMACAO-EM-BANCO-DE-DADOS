CREATE DATABASE LOJA; 

USE LOJA

CREATE TABLE CLIENTES(
            Id_Cliente INT PRIMARY KEY AUTO_INCREMENT,
            Nome VARCHAR(100) NOT NULL,
            Endereco VARCHAR(150) NOT NULL, 
            Cidade VARCHAR(50) NOT NULL,
            Cep VARCHAR(15) NOT NULL
);

CREATE TABLE PEDIDOS(
			 Num_Pedidos INT PRIMARY KEY AUTO_INCREMENT,
             Data_Pedido DATE NOT NULL, 
             Item VARCHAR(100) NOT NULL, 
             Valor FLOAT NOT NULL,
             ID_Cliente INT,
             FOREIGN KEY (Id_Cliente) REFERENCES CLIENTES (Id_Cliente)
);
SELECT * FROM CLIENTES;

SELECT * FROM PEDIDOS;

INSERT INTO CLIENTES (Nome, Endereco, Cidade, Cep)
VALUES ('Tobias', 'Avenida Braz Leme', 'São Paulo', '2022011');

 INSERT INTO PEDIDOS (Data_Pedido, Item, Valor, ID_Cliente)
 VALUES ('2025-03-14', 'Lasanha', '50.00', 1);
 
 
 SELECT * FROM CLIENTES JOIN PEDIDOS;
