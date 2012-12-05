-- 1.Buscar o nome (em ordem alfabética) de todos os pacientes que realizaram alguma consulta.

    SELECT `paciente`.`nome` FROM `consulta` INNER JOIN `paciente` ON `consulta`.`idPaciente` = `paciente`.`idPaciente` GROUP BY `consulta`.`idPaciente`;

    /*
        +---------------+
        | nome          |
        +---------------+
        | Ana Paula     |
        | Paulo Freitas |
        | Lucia Ramos   |
        | Carlos José   |
        | Maria José    |
        +---------------+
    */

-- 2.Qual o médico que mais atendeu pacientes?

    SELECT medico.idMedico, COUNT(idConsulta) FROM medico left join consulta on medico.idMedico = consulta.idMedico GROUP BY consulta.idMedico;
    -- OU --
    -- SELECT M.idMedico, COUNT(idConsulta) FROM medico M left join consulta C on M.idMedico = C.idMedico GROUP BY C.idMedico;

    /*
       +----------+-------------------+
       | idmedico | COUNT(idconsulta) |
       +----------+-------------------+
       |        3 |                 0 |
       |        1 |                 2 |
       |        2 |                 3 |
       |        4 |                 2 |
       |        5 |                 2 |
       |        6 |                 3 |
       +----------+-------------------+

     */

-- 3.Listar o nome dos médicos, especialidade e doença que eles atenderam.

    SELECT medico.idmedico,  medico.nome, medico.especialidade, consulta.doenca
    FROM medico LEFT JOIN consulta
    ON medico.idmedico = consulta.idmedico
    GROUP BY consulta.idMedico
    ORDER BY medico.idMedico ASC;

    /*
       +----------+---------------+---------------+---------------+
       | idmedico | nome          | especialidade | doenca        |
       +----------+---------------+---------------+---------------+
       |        1 | Tiago         | Ortopedia     | fratura perna |
       |        2 | Marco Aurelio | Obstetricia   | traumatismo   |
       |        3 | Joao          | Ortopedia     | NULL          |
       |        4 | Maria         | Traumatologia | consulta      |
       |        5 | Pedro         | Pediatra      | enxaqueca     |
       |        6 | Carlos        | Ortopedia     | pneumonia     |
       +----------+---------------+---------------+---------------+
     */

-- 4. Qual o ambulatório que possui a maior quantidade de médicos associados?

    SELECT COUNT(`idMedico`) as `total_medicos`, `idAmbulatorio` FROM `medico` GROUP BY `idAmbulatorio` ORDER BY `total_medicos` DESC LIMIT 1;

    /*
        +---------------+---------------+
        | total_medicos | idAmbulatorio |
        +---------------+---------------+
        |             3 |             1 |
        +---------------+---------------+
    */

-- 5. Quais as doenças diagnosticadas nas consultas?

    SELECT DISTINCT `Doenca` FROM `consulta`;

    /*
        +---------------+
        | Doenca        |
        +---------------+
        | fratura perna |
        | fratura braco |
        | traumatismo   |
        | pneumonia     |
        | consulta      |
        | enxaqueca     |
        | dor no peito  |
        | arritimia     |
        +---------------+
    */

-- 6. Qual o medico mais novo que atendeu algum paciente?

    SELECT `M`.`nome`, `M`.`idade`, `M`.`idMedico` FROM `medico` `M` INNER JOIN `consulta` `C` ON `M`.`idMedico` = `C`.`idMedico` ORDER BY `M`.`idade` ASC LIMIT 1;

    /*
        +--------+-------+----------+
        | nome   | idade | idMedico |
        +--------+-------+----------+
        | Carlos |    28 |        6 |
        +--------+-------+----------+
    */


-- 7. Qual o medico que mais atendeu pacientes?

    SELECT `C`.`idMedico`, COUNT(*) AS `total_consultas` FROM `consulta` `C` GROUP BY `C`.`idMedico` ORDER BY `total_consultas` DESC LIMIT 1;

    -- Para obter também o nome do médico (e não simplesmente o ID):
        -- SELECT `M`.`nome`, `C`.`idMedico`, COUNT(*) AS `total_consultas` FROM `consulta` `C` INNER JOIN `medico` `M` ON `C`.`idMedico` = `M`.`idMedico` GROUP BY `C`.`idMedico` ORDER BY `total_consultas` DESC LIMIT 1;

    /*
        +----------+-----------------+
        | idMedico | total_consultas |
        +----------+-----------------+
        |        2 |               3 |
        +----------+-----------------+
    */


-- 8. Listar o nome e idade de todos os pacientes que realizaram alguma consulta nos meses de outubro e novembro de 2010, ordenados por idade, do mais novo para o mais velho.

    SELECT `P`.`nome`, `P`.`idade` FROM `paciente` `P` INNER JOIN `consulta` `C` ON `P`.`idPaciente` = `C`.`idPaciente` WHERE `C`.`Data` BETWEEN '2010-10-01' AND '2010-11-30';

    /*
        +---------------+-------+
        | nome          | idade |
        +---------------+-------+
        | Ana Paula     |    20 |
        | Ana Paula     |    20 |
        | Ana Paula     |    20 |
        | Paulo Freitas |    24 |
        | Lucia Ramos   |    30 |
        | Lucia Ramos   |    30 |
        | Carlos Jos�   |    28 |
        | Carlos Jos�   |    28 |
        | Carlos Jos�   |    28 |
        | Carlos Jos�   |    28 |
        | Carlos Jos�   |    28 |
        | Maria Jos�    |    60 |
        +---------------+-------+
    */

-- 9. Qual a doença que mais foi diagnosticada durante as consultas? Quais médicos a diagnosticaram?
-- 10. Listar as especialidades dos médicos que mais atenderam aos pacientes.
-- 11. Qual ambulatório prestou o maior número de atendimentos?
