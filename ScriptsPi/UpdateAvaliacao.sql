UPDATE TB_FILME
SET VL_AVALIACAO = (
    SELECT AVG(NOTA)
    FROM TB_AVALIACAO_USUARIO_FILME
    WHERE ID_FILME = TB_FILME.ID_FILME
);