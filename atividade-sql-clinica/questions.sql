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
-- 4.  Em quais cidades residem os funcionários?
-- 5.  Qual o menor e o maior salário dos funcionários residentes em Montes Claros?
-- 6.  Qual a média de idade dos médicos e o total de ambulatórios atendidos por eles?
-- 7.  Buscar o código, o nome e o salário líquido dos funcionários. O salário líquido é obtido pela diferença entre o salário cadastrado menos 20% deste mesmo salário
-- 8.  Buscar o nome dos funcionários que terminam com a letra “a”;
-- 9.  Buscar o nome e a especialidade dos médicos cujo nome comecem com a letra M;
-- 10. Buscar os nomes dos pacientes com mais de 25 anos que estão com fratura e gripe.
-- 11. Crie uma tabela temporária chamada atendimentos do tipo memory que contenha os seguintes dados: nome do médico, nome do paciente, doença e a data de atendimento.
