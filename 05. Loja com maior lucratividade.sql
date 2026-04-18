
-- 05. Loja com maior lucro

DECLARE @Ano INT = 2025

SELECT
	L.NomeLoja,
	ROUND(SUM((V.PrecoUnitario - V.Custos - V.Desconto) * V.Quantidade), 2) Lucro,
	ROUND(
		SUM((V.PrecoUnitario - V.Custos - V.Desconto) * V.Quantidade) * 100.0 /
			(
				SELECT SUM((V.PrecoUnitario - V.Custos - V.Desconto) * V.Quantidade)
				FROM m3.fVendas V
				), 2) Percentual
FROM m3.fVendas V 
	INNER JOIN m3.dCalendario C ON (V.DataID = C.DATA)
	LEFT JOIN m3.dLoja L ON (V.LojaID = L.LojaID)
WHERE C.ANO = @Ano
GROUP BY L.NomeLoja
ORDER BY Lucro DESC;