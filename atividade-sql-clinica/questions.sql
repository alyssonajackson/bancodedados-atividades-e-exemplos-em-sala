-- 1. Buscar o nome e o CPF dos médicos com menos de 40 anos ou com especialidade diferente de traumatologia;
SELECT * FROM `medico` WHERE `idade` < 40 AND `especialidade` <> 'Traumatologia';
