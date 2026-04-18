# portfolio_sqlserver

Este projeto apresenta a construção e análise de Data Warehouse de Vendas utilizando SQL Server, com foco em modelagem, criação de tabelas fato e dimensão, além de consultas analíticas para responder perguntas de negócio.  

O objetivo é demonstrar habilidades em:  

. Conhecimento em modelagem Star Schema  
. Criação de tabelas fato e dimensão  
. Consultas analíticas  
  
O projeto inclui:  
. Scripts automáticos para gerar as tabelas 'dimensão'  
. Inserts manuais para gerar 500 registros na tabela fato  
  
Tabelas Dimensão incluídas:  
. dCalendario: Datas, meses, anos, dias da semana  
. dCliente: Informações de clientes  
. dLoja: Lojas e regiões  
. dProduto: Produtos, categorias e marcas  
. dVendedor: Vendedores e equipe comercial  
  
Tabela Fato:  
. Chaves estrangeiras para todas as dimensões  
. Quantidade vendida  
. Preço unitário  
. Desconto  
. Custo unitário  
  
Métricas Calculadas  
. Receita: quantidade x preço unitário - desconto  
. Lucro: (preço unitário - custo unitário - desconto) * quantidade  
. Ticket Médio: média da receita por transação  
