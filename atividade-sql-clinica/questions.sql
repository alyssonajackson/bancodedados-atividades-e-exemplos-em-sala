-- 1. Buscar o nome e o CPF dos médicos com menos de 40 anos ou com especialidade diferente de traumatologia;
    SELECT * FROM `medico` WHERE `idade` < 40 AND `especialidade` <> 'Traumatologia';

    /* O resultado deve ser algo parecido com isso:

    +----------+--------+-------+---------------+-------------+---------------+---------------+
    | idMedico | nome   | idade | especialidade | CPF         | cidade        | idAmbulatorio |
    +----------+--------+-------+---------------+-------------+---------------+---------------+
    |        6 | Carlos |    28 | Ortopedia     | 11000110000 | Ipatinga      |             5 |
    |        7 | Marcia |    33 | Neurologia    | 11000111000 | Cataguaes     |             3 |
    |        8 | Renato |    29 | Cardiologista | 10000110001 | Montes Claros |             4 |
    +----------+--------+-------+---------------+-------------+---------------+---------------+

    */


-- 2.  Buscar o nome e a idade dos pacientes que não residem em Montes Claros;
    SELECT `nome`, `idade` FROM medico WHERE `cidade` <> 'Montes Claros';

    /* O resultado deve ser algo parecido com isso:
        +--------+-------+
        | nome   | idade |
        +--------+-------+
        | Maria  |    42 |
        | Pedro  |    51 |
        | Carlos |    28 |
        | Marcia |    33 |
        +--------+-------+
    */

-- 3.  Buscar o nome e a idade (em meses) dos pacientes;

    SELECT `nome`, CONCAT((`idade` * 12), " Meses") AS `idade em meses` FROM `medico`;

    /* O resultado deve ser algo parecido com isso:

        +---------------+----------------+
        | nome          | idade em meses |
        +---------------+----------------+
        | Tiago         | 480 Meses      |
        | Marco Aurelio | 576 Meses      |
        | Joao          | 480 Meses      |
        | Maria         | 504 Meses      |
        | Pedro         | 612 Meses      |
        | Carlos        | 336 Meses      |
        | Marcia        | 396 Meses      |
        | Renato        | 348 Meses      |
        +---------------+----------------+
    */


-- 4.  Em quais cidades residem os funcionários?

    SELECT DISTINCT `cidade` FROM `medico`;

    /* O resultado deve ser algo parecido com isso:

        +---------------+
        | cidade        |
        +---------------+
        | Montes Claros |
        | Janauba       |
        | Pirapora      |
        | Ipatinga      |
        | Cataguaes     |
        +---------------+

    */


-- 5.  Qual o menor e o maior salário dos funcionários residentes em Montes Claros?

    SELECT MAX(`salario`) AS `maior_salario`, MIN(`salario`) AS `menor_salario` FROM `funcionario`;

    /* O resultado deve ser algo parecido com isso:

        +---------------+---------------+
        | maior_salario | menor_salario |
        +---------------+---------------+
        |          5500 |          1200 |
        +---------------+---------------+
    */

-- 6.  Qual a média de idade dos médicos e o total de ambulatórios atendidos por eles?

    SELECT AVG(`idade`) AS `media_da_idade_dos_medicos`, COUNT(DISTINCT `idAmbulatorio`) AS `total_de_ambulatorios` FROM `medico`;

    /* O resultado deve ser algo parecido com isso:

        +----------------------------+-----------------------+
        | media_da_idade_dos_medicos | total_de_ambulatorios |
        +----------------------------+-----------------------+
        |                    38.8750 |                     5 |
        +----------------------------+-----------------------+
    */

-- 7.  Buscar o código, o nome e o salário líquido dos funcionários. O salário líquido é obtido pela diferença entre o salário cadastrado menos 20% deste mesmo salário

    SELECT `idFuncionario` AS `codigo`, `nome`, (`salario` - (`salario` / 100 * 20)) AS `salario_liquido` FROM `funcionario`;

    /* O resultado deve ser algo parecido com isso:
        +--------+---------------+-----------------+
        | codigo | nome          | salario_liquido |
        +--------+---------------+-----------------+
        |      1 | Rita Kadilac  |        960.0000 |
        |      2 | Maria Bonita  |       1056.0000 |
        |      3 | Caio Pereira  |        988.0000 |
        |      4 | Carlos Lucena |        960.0000 |
        |      5 | Juliana Paes  |       4400.0000 |
        +--------+---------------+-----------------+
    */


-- 8.  Buscar o nome dos funcionários que terminam com a letra “a”;

    SELECT `nome` FROM `funcionario` WHERE `nome` LIKE '%a';

    /* O resultado deve ser algo parecido com isso:
       +---------------+
       | nome          |
       +---------------+
       | Maria Bonita  |
       | Caio Pereira  |
       | Carlos Lucena |
       +---------------+
    */


-- 9.  Buscar o nome e a especialidade dos médicos cujo nome comecem com a letra M;

    SELECT `nome`, `especialidade` FROM `medico` WHERE `nome` LIKE 'M%';

    /* O resultado deve ser algo parecido com isso:
        +---------------+---------------+
        | nome          | especialidade |
        +---------------+---------------+
        | Marco Aurelio | Obstetricia   |
        | Maria         | Traumatologia |
        | Marcia        | Neurologia    |
        +---------------+---------------+
    */


-- 10. Buscar os nomes dos pacientes com mais de 25 anos que estão com fratura e gripe.


    /* Considerando que a questão esteja pedindo os pacientes que tem "fratura" OU "gripe": */

    SELECT `nome` FROM `paciente` P
    LEFT JOIN `consulta` C ON C.idPaciente = P.idPaciente
    WHERE (C.doenca like 'fratura%' OR C.doenca like '%gripe%') AND P.idade > 25;

    /* O resultado deve ser algo parecido com isso:
        +-------------+
        | nome        |
        +-------------+
        | Carlos José |
        | Carlos José |
        +-------------+
    */


-- 11. Crie uma tabela temporária chamada atendimentos do tipo memory que contenha os seguintes dados: nome do médico, nome do paciente, doença e a data de atendimento.
