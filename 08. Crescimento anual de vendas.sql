
-- 08. Crescimento anual de vendas 

WITH ReceitaAnual AS (
SELECT
        C.ANO Ano,
        SUM(((V.Quantidade * V.PrecoUnitario) - V.Desconto)) AS Receita_Anual,
        SUM((V.Quantidade * V.PrecoUnitario) - V.Desconto) * 100.0 /
            (SELECT
                SUM((V.Quantidade * V.PrecoUnitario) - V.Desconto)
                FROM m3.fVendas V
                ) Percentual
FROM m3.fVendas V
    INNER JOIN m3.dCalendario C
        ON V.DataID = C.DATA
WHERE C.ANO IN (2024, 2025)
GROUP BY C.ANO
)
SELECT
    Ano,
    ROUND(Receita_Anual, 2) Receita_Anual,
    ROUND(SUM(Receita_Anual) OVER(), 2) Receita_Total,
    ROUND(Percentual, 2) Percentual
FROM ReceitaAnual
