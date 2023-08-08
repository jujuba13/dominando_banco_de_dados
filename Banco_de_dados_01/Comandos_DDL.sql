/* Exploando os comandos DDL*/

select now() as Timestamp;
CREATE DATABASE IF NOT EXISTS manipulation;
USE manipulation;
--drop database manipulation;

drop table contas_bancaria;
 CREATE TABLE IF NOT EXISTS contas_bancaria (
  Id_conta INT AUTO_INCREMENT PRIMARY KEY,
  Numero_conta INT NOT NULL,
  Agencia_conta INT NOT NULL,
  Saldo_conta FLOAT,
  Limite_conta FLOAT NOT NULL DEFAULT 500.00,
  CONSTRAINT conta_identificacao_constraint UNIQUE (Numero_conta, Agencia_conta)
);

INSERT INTO contas_bancaria (Numero_conta, Agencia_conta, Saldo_conta) VALUES
(2703275, 2930, 2640.00),
(2723301, 2930, 3640.00);
desc contas_bancaria;





/* alter table contas_bancaria add Limite_credito float not null default 1000.00;
   alter table contas_bancaria add email varchar(60);
   alter table contas_bancaria drop email;
   alter table contas_bancaria modify column nome_atributo tipo de dados condições
   alter table contas_bancaria add constraint nome_constraint condições
 */


drop table cliente_banco;
CREATE TABLE IF NOT EXISTS cliente_banco (
  Id_cliente INT AUTO_INCREMENT PRIMARY KEY,
  Numero_conta_cliente INT,
  CPF CHAR(11) NOT NULL,
  RG VARCHAR(10) NOT NULL,
  Nome_completo VARCHAR(50) NOT NULL,
  Endereco VARCHAR(100) NOT NULL,
  Cep VARCHAR(9) NOT NULL,
  Cidade VARCHAR(20) NOT NULL,
  Uf CHAR(2) NOT NULL,
  Email VARCHAR(50) NULL,
  Tel_contato VARCHAR(15) NULL,
  Celular VARCHAR(15) NOT NULL,
  Renda_mensal FLOAT,
  FOREIGN KEY (Numero_conta_cliente) REFERENCES contas_bancaria(Numero_conta) ON UPDATE CASCADE
);
desc cliente_banco;
select * from cliente_banco;

INSERT INTO cliente_banco (Numero_conta_cliente, CPF, RG, Nome_completo, Endereco, Cep, Cidade, Uf, Email, Tel_contato, Celular, Renda_mensal)
VALUES (2703275, '35733329912', '458997335', 'Juliana Souza de França', 'Rua Jurubatuba-27', '11033111', 'Santos', 'MG', 
'juliana_souza_franca@hotmail.com', '55(13)33276679', '55(13)988881777', 2640.00);

update cliente_banco set Uf = "SP" where Nome_completo = "Juliana Souza de França";

INSERT INTO cliente_banco (Numero_conta_cliente, CPF, RG, Nome_completo, Endereco, Cep, Cidade, Uf, Email, Tel_contato, Celular, Renda_mensal)
values(2723301, '25066632910', '5489923423', 'Rodrigo Venceslau Souza de França', 'Rua Jurubatuba-27', '11033111', 'Santos', 'MG',
'drrodrigoadv@hotmail.com', '55(13)3327-5449' , '55(13)988886444', 3640.00);

update cliente_banco set Uf = "SP" where Nome_completo = "Rodrigo Venceslau Souza de França";


drop table transacoes_bancaria;
CREATE TABLE IF NOT EXISTS transacoes_bancaria (
  Id_transacoes INT AUTO_INCREMENT PRIMARY KEY,
  Data_hora_ocorrencia DATETIME,
  status_transacao VARCHAR(30),
  valor_transferido FLOAT,
  origem_da_conta INT,
  destino_da_conta INT,
  CONSTRAINT fk_origem_da_conta_constraint FOREIGN KEY (origem_da_conta) REFERENCES contas_bancaria(Id_conta) ON UPDATE CASCADE,
  CONSTRAINT fk_destino_da_conta_constraint FOREIGN KEY (destino_da_conta) REFERENCES contas_bancaria(Id_conta) ON UPDATE CASCADE
);
desc transacoes_bancaria;

show tables;