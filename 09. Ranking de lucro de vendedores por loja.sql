
-- 09. Ranking de lucro vendedores por loja

CREATE OR ALTER VIEW m3.vw_RankingVendedores AS

SELECT
	L.NomeLoja,
	VE.NomeVendedor,
	ROUND(SUM((V.PrecoUnitario - V.Custos - V.Desconto) * V.Quantidade), 2) Lucro,
	DENSE_RANK() 
		OVER(ORDER BY SUM((V.PrecoUnitario - V.Custos - V.Desconto) * V.Quantidade) DESC) Ranking
FROM m3.fVendas V
	INNER JOIN m3.dLoja L
		ON (V.LojaID = L.LojaID)
	INNER JOIN m3.dVendedor VE
		ON (V.VendedorID = VE.VendedorID)
GROUP BY L.NomeLoja,VE.NomeVendedor

GO



SELECT * 
FROM m3.vw_RankingVendedores;