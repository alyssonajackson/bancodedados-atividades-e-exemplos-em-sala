-- 1.Buscar o nome (em ordem alfabética) de todos os pacientes que realizaram alguma consulta.

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
