
-- 06. Ranking - Vendedor com maior ticket médio

SELECT
	C.ANO,
	LTRIM(RTRIM(VE.NomeVendedor)) Nome_Vendedor,
	ROUND(AVG((V.Quantidade * V.PrecoUnitario) - V.Desconto), 2) Ticket_Medio,
	DENSE_RANK() 
		OVER(PARTITION BY C.ANO 
			ORDER BY AVG((V.Quantidade * V.PrecoUnitario) - V.Desconto) DESC ) Ranking
FROM m3.fVendas V 
		INNER JOIN m3.dCalendario C
			ON (V.DataID = C.DATA)
		LEFT JOIN m3.dVendedor VE
			ON (V.VendedorID = VE.VendedorID)
GROUP BY C.ANO, VE.NomeVendedor
	