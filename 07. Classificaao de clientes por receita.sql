
-- 07. Classificação de Clientes por valor médio de receita 

WITH ReceitaCLiente AS (
	SELECT
		C.NomeCliente Nome_Cliente,
		SUM((V.Quantidade * V.PrecoUnitario) - V.Desconto) Receita
	FROM m3.fVendas V
		INNER JOIN M3.dCliente C
			ON (V.ClienteID = C.ClienteID)
	GROUP BY C.NomeCliente
),
MediaGeral AS (
	SELECT 
		AVG(Receita) Media_Receita
	FROM ReceitaCLiente
),
ReceitaTotal AS (
	SELECT 
		SUM(Receita) Receita_Total
	FROM ReceitaCLiente
)
SELECT
	R.Nome_Cliente,
	ROUND(R.Receita, 2) Receita,
	ROUND((R.Receita / RT.Receita_Total), 3) Percentual,
	IIF(R.Receita > MR.Media_Receita, 'Bom', 'Regular') Classificacao
FROM ReceitaCLiente R
	CROSS JOIN MediaGeral MR
	CROSS JOIN ReceitaTotal RT
ORDER BY R.Receita DESC;
