CREATE VIEW `vw_relatorio_data_compra` AS
SELECT C.user_id AS `user_id`, C.cnpj AS CNPJ, 
MAX(S.data_horario_do_status) as DATA_COMPRA
FROM status AS S 
INNER JOIN clientes AS C 
ON C.user_id = S.user_id
WHERE S.status = "pending_kyc"
GROUP BY C.user_id;

CREATE VIEW `vw_relatorio_data_aprovacao` AS
SELECT C.user_id AS USER_ID, S.data_horario_do_status as DATA_APROV
FROM status AS S 
INNER JOIN clientes AS C 
ON C.user_id = S.user_id 
WHERE S.status = "approved";

CREATE VIEW `vw_relatorio_completo` AS
SELECT VW1.CNPJ as cnpj, VW1.DATA_COMPRA AS data_compra,
TIME_FORMAT(TIMEDIFF(TIMESTAMP(VW2.DATA_APROV), TIMESTAMP(VW1.DATA_COMPRA)), '%H:%i') AS tempo_aprovacao
FROM `vw_relatorio_data_compra` AS VW1
INNER JOIN `vw_relatorio_data_aprovacao` AS VW2
ON VW1.user_id = VW2.USER_ID
HAVING tempo_aprovacao > 0;

-- Query que retorna a média de tempo de aprovação
SELECT TIME_FORMAT(SEC_TO_TIME(AVG(TIME_TO_SEC(tempo_aprovacao))), '%H:%i') FROM `vw_relatorio_completo`;

-- Query que retorna o tempo máximo de aprovação
SELECT TIME_FORMAT(SEC_TO_TIME(MAX(TIME_TO_SEC(tempo_aprovacao))), '%H:%i') FROM `vw_relatorio_completo`;

-- Query que retorna o tempo mínimo de aprovação
SELECT TIME_FORMAT(SEC_TO_TIME(MIN(TIME_TO_SEC(tempo_aprovacao))), '%H:%i') FROM `vw_relatorio_completo`;
