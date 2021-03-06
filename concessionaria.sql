CREATE TABLE IF NOT EXISTS Carro(

  cd_carro SERIAL,
  car_marca VARCHAR(20) NOT NULL,
  car_modelo VARCHAR(20) NOT NULL,
  car_valor REAL NOT NULL,  
  car_cor VARCHAR(10),
  car_ano CHAR(4) NOT NULL,
  car_estado VARCHAR (9) NOT NULL,
  car_chassi VARCHAR (17) NOT NULL UNIQUE,
  CONSTRAINT Carro_pkey PRIMARY KEY (cd_carro,car_valor)
);

CREATE TABLE IF NOT EXISTS Cliente(

  cd_cliente serial,
  cli_nome VARCHAR(12) NOT NULL,
  cli_sobrenome VARCHAR(20),
  cli_nasc DATE,
  cli_sexo CHAR(1) NOT NULL,
  cli_cpf CHAR(11) NOT NULL,
  cli_fone VARCHAR(13),
  CONSTRAINT cd_cliente_pkey PRIMARY KEY (cd_cliente)
);

CREATE TABLE IF NOT EXISTS  Vendedor(

  cd_vendedor serial,
  vend_nome VARCHAR(12) NOT NULL,
  vend_sobrenome VARCHAR (20),
  vend_sexo CHAR(1) NOT NULL,
  vend_salario REAL NOT NULL,
  vend_comissao REAL NOT NULL,
  vend_data_nasc DATE,
  vend_dt_admissao DATE,
  vend_fone VARCHAR(13),
  CONSTRAINT Vendedor_pkey PRIMARY KEY (cd_vendedor)
);
CREATE TABLE IF NOT EXISTS Loja(

  cd_loja serial,
  lj_nome VARCHAR(12) NOT NULL,
  lj_cnpj CHAR(14) NOT NULL,
  lj_cep CHAR(8),
  lj_fone VARCHAR(13),
  CONSTRAINT Loja_pkey PRIMARY KEY (cd_loja)


);


CREATE TABLE IF NOT EXISTS Venda(

  cd_venda serial NOT NULL UNIQUE,
  valor_fk REAL NOT NULL,
  carro_fk serial,
  venda_data DATE NOT NULL,
  Loja_fk serial REFERENCES Loja (cd_loja)ON UPDATE CASCADE,
  FOREIGN KEY (carro_fk,valor_fk) REFERENCES Carro(cd_carro,car_valor)ON UPDATE CASCADE,
  cliente_fk serial REFERENCES Cliente(cd_cliente)ON UPDATE CASCADE,
  vendedor_fk serial REFERENCES Vendedor(cd_vendedor)ON UPDATE CASCADE,
  CONSTRAINT Venda_pkey PRIMARY KEY (cd_venda)
);


