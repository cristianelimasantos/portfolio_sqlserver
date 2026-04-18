
-- 03. Faturamento Mensal e Acumulado

WITH FaturamentoMensal AS (

SELECT
	C.ANO Ano,
	C.MES Mes,
	C.MES_ABREVIADO Nome_Mes,
	SUM((V.Quantidade * V.PrecoUnitario) - V.Desconto) Faturamento
FROM m3.fVendas V
	INNER JOIN m3.dCalendario C
		ON(V.DataID = C.DATA)
GROUP BY C.ANO, C.MES, C.MES_ABREVIADO
)

SELECT
	Ano,
	Mes,
	Nome_Mes,
	FORMAT(Faturamento, 'C', 'pt-BR') Faturamento,
	FORMAT(SUM(Faturamento) OVER (PARTITION BY Ano ORDER BY Mes), 'C', 'pt-BR') Fat_Acum
FROM FaturamentoMensal
ORDER BY Ano, Mes