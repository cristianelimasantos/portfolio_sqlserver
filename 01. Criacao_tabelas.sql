-- 01. Criação de tabelas

USE BD_CDD_SQL_M1
GO

-- Criação do schema
CREATE SCHEMA m3;


-- Dimensão Produto
CREATE TABLE m3.dProduto(
	ProdutoID INT PRIMARY KEY,
	NomeProduto VARCHAR(100),
	Categoria VARCHAR(100),
	Subcategoria VARCHAR(100),
	Marca VARCHAR(100),
	DataCriacaoProduto DATE
)

-- Dimensão CLiente
CREATE TABLE m3.dCliente(
	ClienteID INT PRIMARY KEY,
	NomeCliente VARCHAR(150),
	Sexo CHAR(1),
	DataNascimento DATE,
	Cidade VARCHAR(100),
	Estado VARCHAR(50),
	Pais VARCHAR(50)
);


-- Dimensão Vendedor
CREATE TABLE m3.dVendedor(
	VendedorID INT PRIMARY KEY,
	NomeVendedor VARCHAR(150),
	Departamento VARCHAR(150),
	DataContratacao DATE
);



-- Dimensão Loja
CREATE TABLE m3.dLoja(
	LojaID INT PRIMARY KEY,
	NomeLoja VARCHAR(150),
	Cidade VARCHAR(100),
	Estado VARCHAR(50),
	Pais VARCHAR(50)
);


-- Tabela Fato Vendas
CREATE TABLE m3.fVendas (
    VendaID INT PRIMARY KEY,
    ProdutoID INT NOT NULL,
    ClienteID INT NOT NULL,
    VendedorID INT NOT NULL,
    DataID DATE NOT NULL,
    LojaID INT NOT NULL,
    Quantidade INT,
    PrecoUnitario DECIMAL(10,2),
    Desconto DECIMAL(10,2),
	Custos DECIMAL(10,2)
);