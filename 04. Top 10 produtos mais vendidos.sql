
-- 04. Top 10 - Produtos mais vendidos por ano

SELECT TOP 10
		C.ANO Ano,
		P.NomeProduto Nome_Produto,
		SUM((V.Quantidade * V.PrecoUnitario) - V.Desconto) Receita,
		ROUND
			(SUM((V.Quantidade * V.PrecoUnitario) - V.Desconto) * 100.0 /
			(
				SELECT SUM((V.Quantidade * V.PrecoUnitario) - V.Desconto)
				FROM m3.fVendas V
			), 2) AS Percentual
FROM m3.fVendas V 
		INNER JOIN m3.dCalendario C ON (V.DataID = C.DATA)
		LEFT JOIN m3.dProduto P	ON (V.ProdutoID = P.ProdutoID)
GROUP BY C.ANO, P.NomeProduto
ORDER BY Receita DESC
