-- Criando banco de dados `unimontes`
CREATE database `unimontes`;

/* *
  * Criando tabela `aluno`, com a seguinte estrutura:
  *		matricula - >campo num�rico | chave prim�ria | campo obrigat�rio | "auto increment�vel"
  *		nome -> campo varchar | n�o nulo (obrigat�rio)
  * 		estadoCivil -> campo n�o obrigat�rio
  *		cidade -> campo n�o obrigat�rio, com valor padr�o = 'Montes Claros' (o valor padr�o � assumido caso seja passado como vazio)
  */
CREATE TABLE `aluno`(
    `matricula` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `nome` VARCHAR(50) NOT NULL,
    `estadoCivil` VARCHAR(20),
    `cidade` VARCHAR(30) DEFAULT 'Montes Claros'
);

-- Alterando estrutura da tabela aluno: O campo `sexo` foi adicionado.
ALTER TABLE `aluno` ADD `sexo` ENUM('masc', 'fem');

-- Inserindo registro na tabela aluno
INSERT INTO `aluno`(`nome`, `estadoCivil`, `sexo`) VALUES ('Vin�cius', 'namorando', 'masc');

-- Inserindo registro na tabela aluno
INSERT INTO `aluno`(`nome`, `estadoCivil`, `sexo`) VALUES ('S�lvia', 'namorando', 'fem');

-- Inserindo registro na tabela aluno
INSERT INTO `aluno`(`nome`, `estadoCivil`, `sexo`) VALUES ('Paulinho gog�', 'chegando a�', 'masc');

-- Selecionando apenas os alunos do sexo masculino
SELECT `nome` FROM `aluno` WHERE sexo = 'masc';
