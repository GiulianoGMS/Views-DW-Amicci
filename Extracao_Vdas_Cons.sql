SELECT TO_CHAR(FV.DTAOPERACAO, 'MM') MES,
             --FV.SEQPRODUTO VENDA_SKU,
             FV.NROEMPRESA VENDA_NRO_EMPRESA, QC.categoria_nivel_2,
             SUM(FV.QTDOPERACAO) VENDA_QTD,
             SUM(FV.VVLROPERACAOBRUTO) VENDA_BRUTA,
             SUM(FV.VLROPERACAO)               VENDA_LIQUIDA,
             SUM(FV.VVLRCTOBRUTO)     VENDA_CUSTO_BRUTO,
             SUM(FV.VVLRCTOLIQUIDO)   VENDA_CUSTO_LIQUIDO
             --fv.seqnf VENDA_CUPOM,
             --sum(fv.vlrverbavda) AS VENDA_BONIFICACAO,
             --0 VENDA_CONTRATO,
            -- ROUND(SUM( FV.vlroperacao - FV.vvlrctoliquido - FV.vvlrimpostosaida - nvl( FV.vlrdespoperacionalitem, 0 ) - FV.vlrcomissao- FV.vlrverbacompra - FV.vlrcalcimpostovda ),2) VENDA_VLR_MARGEM,
            --
FROM FATO_VENDA FV LEFT JOIN QLV_PRODUTO QP ON FV.SEQPRODUTO = QP.SEQPRODUTO LEFT JOIN QLV_CATEGORIA QC ON QP.seqfamilia = QC.seqfamilia
WHERE FV.CODGERALOPER IN (37,48,123,610,615,613,810,916,910,911)
AND FV.DTAOPERACAO BETWEEN '01-JUL-2021' AND '31-JUL-2021'
GROUP BY TO_CHAR(FV.DTAOPERACAO, 'MM'), FV.NROEMPRESA, categoria_nivel_2
