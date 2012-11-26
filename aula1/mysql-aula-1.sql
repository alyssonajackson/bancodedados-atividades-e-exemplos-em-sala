-- Criando banco de dados `unimontes`
CREATE database `unimontes`;

/* *
  * Criando tabela `aluno`, com a seguinte estrutura:
  *		matricula - >campo numérico | chave primária | campo obrigatório | "auto incrementável"
  *		nome -> campo varchar | não nulo (obrigatório)
  * 		estadoCivil -> campo não obrigatório
  *		cidade -> campo não obrigatório, com valor padrão = 'Montes Claros' (o valor padrão é assumido caso seja passado como vazio)
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
INSERT INTO `aluno`(`nome`, `estadoCivil`, `sexo`) VALUES ('Vinícius', 'namorando', 'masc');

-- Inserindo registro na tabela aluno
INSERT INTO `aluno`(`nome`, `estadoCivil`, `sexo`) VALUES ('Sílvia', 'namorando', 'fem');

-- Inserindo registro na tabela aluno
INSERT INTO `aluno`(`nome`, `estadoCivil`, `sexo`) VALUES ('Paulinho gogó', 'chegando aí', 'masc');

-- Selecionando apenas os alunos do sexo masculino
SELECT `nome` FROM `aluno` WHERE sexo = 'masc';
