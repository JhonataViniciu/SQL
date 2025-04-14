CREATE TABLE AUTOMOVEIS
(
    ID_AUTO         NUMBER PRIMARY KEY,
    PLACA_AUTO      VARCHAR(7) NOT NULL,
    MODELO_AUTO     VARCHAR(100),
    ANO             NUMBER,
    KM_RODADO       NUMBER              
);

CREATE TABLE CARGAS
(
    ID_CARGA        NUMBER PRIMARY KEY,
    DESCRICAO_CARGA VARCHAR(100)
);

CREATE TABLE ROTA 
(
    ID_AUTOMOVEL    NUMBER REFERENCES AUTOMOVEL(ID_AUTO),
    ID_CARGA        NUMBER REFERENCES CARGA(ID_CARGA),
    DATA_ENTREGA    DATE NOT NULL,
    VOLUME          NUMBER,
    NOME_MOTORISTA  VARCHAR(100)
);

INSERT INTO AUTOMOVEL VALUES (1,'TCP9KM1','MERCEDES',1999,200);

INSERT INTO CARGA VALUES (1,'MERCADORIA DO MERCADO LIVRE');

INSERT INTO ROTA VALUES (1,1,2025/04/14,50,'PAULO');

SELECT * FROM AUTO;
SELECT * FROM CARGA;
SELECT * FROM ROTA;

SELECT ID_CARGA AS NUMEROS, DESCRICAO_CARGA AS DESCRICAO
FROM CARGA;

SELECT ID_CARGA AS NUMEROS, DESCRICAO_CARGA AS DESCRICAO
FROM CARGA
WHERE DESCRICAO_CARGA LIKE '%MERCADO LIVRE%';

SELECT MIN(KM_RODADO)
FROM AUTO