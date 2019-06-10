CREATE SEQUENCE SEQ_PESS
MINVALUE 1
MAXVALUE 999
START WITH 1
INCREMENT BY 1
NOCACHE;
CREATE TABLE PESS
(
  PESS_CD     NUMBER(6) DEFAULT SEQ_PESS.NEXTVAL NOT NULL,
  PESS_NOME   VARCHAR2(50) NOT NULL,
  PESS_LOG    VARCHAR2(50) NOT NULL,
  PESS_NUM    NUMBER(6) NOT NULL
  PESS_BRO    VARCHAR2(50) NOT NULL,
  PESS_CID    VARCHAR2(50) NOT NULL,
  PESS_ESTD   VARCHAR2(50) NOT NULL,
  PESS_CEP    NUMBER(9) NOT NULL,
  PESS_TEL1   VARCHAR2(50) NOT NULL,
  PESS_TEL2   VARCHAR2(50) NULL,
  PESS_TEL3   VARCHAR2(50) NULL,
  PESS_EMAIL  VARCHAR2(50) NULL
)
ALTER TABLE PESS ADD CONSTRAINT PK_PESS_PESS_CD PRIMARY KEY (PESS_CD);

CREATE SEQUENCE SEQ_BENS
MINVALUE 1
MAXVALUE 999
START WITH 1
INCREMENT BY 1
NOCACHE;
CREATE TABLE BENS
(
  BENS_CD           NUMBER(6) DEFAULT SEQ_BENS.NEXTVAL NOT NULL,
  BENS_DESC         VARCHAR2(50) NOT NULL,
  BENS_VAL_ESTM     NUMBER(12,2) NOT NULL,
  PESS_CD           NUMBER(6) NOT NULL
)
ALTER TABLE BENS ADD CONSTRAINT PK_BENS_BENS_CD PRIMARY KEY (BENS_CD);
ALTER TABLE BENS ADD CONSTRAINT FK_BENS_PESS_CD FOREIGN KEY (PESS_CD) REFERENCES PESS (PESS_CD);

CREATE TABLE OBRAART
(
  BENS_CD           NUMBER(6) NOT NULL,
  OBRAART_DESC      VARCHAR2(50) NOT NULL,
  OBRAART_ANO_ELAB  DATE NOT NULL
)
ALTER TABLE OBRAART ADD CONSTRAINT PK_OBRAART_BENS_CD PRIMARY KEY (BENS_CD);
ALTER TABLE OBRAART ADD CONSTRAINT FK_OBRAART_BENS_CD FOREIGN KEY (BENS_CD) REFERENCES BENS (BENS_CD);

CREATE TABLE IMOV
(
  BENS_CD     NUMBER(6) NOT NULL,
  IMOV_LOG    VARCHAR2(50) NOT NULL,
  IMOV_NUM    NUMBER(6) NOT NULL
  IMOV_BRO    VARCHAR2(50) NOT NULL,
  IMOV_CID    VARCHAR2(50) NOT NULL,
  IMOV_ESTD   VARCHAR2(50) NOT NULL,
  IMOV_CEP    NUMBER(9) NOT NULL,
  IMOV_TAM    NUMBER(9) NOT NULL
)
ALTER TABLE OBRAART ADD CONSTRAINT PK_IMOV_BENS_CD PRIMARY KEY (BENS_CD);
ALTER TABLE OBRAART ADD CONSTRAINT FK_IMOV_BENS_CD FOREIGN KEY (BENS_CD) REFERENCES BENS (BENS_CD);

CREATE SEQUENCE SEQ_INSTFINAN
MINVALUE 1
MAXVALUE 999
START WITH 1
INCREMENT BY 1
NOCACHE;
CREATE TABLE INSTFINAN
(
  INSTFINAN_CD        NUMBER(6) DEFAULT SEQ_INSTFINAN.NEXTVAL NOT NULL,
  INSTFINAN_NOME      VARCHAR2(50) NOT NULL,
  INSTFINAN_AGE       VARCHAR2(50) NOT NULL,
  INSTFINAN_LOCL      VARCHAR2(50) NOT NULL,
  INSTFINAN_NOME_GERT VARCHAR2(50) NOT NULL
)
ALTER TABLE INSTFINAN ADD CONSTRAINT PK_INSTFINAN_INSTFINAN_CD PRIMARY KEY (INSTFINAN_CD);

CREATE TABLE TEL_INSTFINAN
(
  INSTFINAN_CD        NUMBER(6) NOT NULL,
  TEL_INSTFINAN_NUM   VARCHAR2(50) NOT NULL
)
ALTER TABLE TEL_INSTFINAN ADD CONSTRAINT PK_TEL_INSTFINAN_INSTFINAN_CD PRIMARY KEY (INSTFINAN_CD,TEL_INSTFINAN);
ALTER TABLE TEL_INSTFINAN ADD CONSTRAINT FK_TEL_INSTFINAN_INSTFINAN_CD FOREIGN KEY (INSTFINAN_CD) REFERENCES INSTFINAN (INSTFINAN_CD);

CREATE TABLE MONET
  BENS_CD          NUMBER(6) NOT NULL,
  MONET_TP_MOEDA   VARCHAR2(50) NOT NULL,
  INSTFINAN_CD     NUMBER(6) NOT NULL
)
ALTER TABLE MONET ADD CONSTRAINT PK_MONET_BENS_CD PRIMARY KEY (BENS_CD);
ALTER TABLE MONET ADD CONSTRAINT FK_MONET_BENS_CD FOREIGN KEY (BENS_CD) REFERENCES BENS (BENS_CD);
ALTER TABLE MONET ADD CONSTRAINT FK_MONET_INSTFINAN_CD FOREIGN KEY (INSTFINAN_CD) REFERENCES INSTFINAN (INSTFINAN_CD);

CREATE SEQUENCE SEQ_CART
MINVALUE 1
MAXVALUE 999
START WITH 1
INCREMENT BY 1
NOCACHE;
CREATE TABLE CART
(
  CART_CD     NUMBER(6) DEFAULT SEQ_CART.NEXTVAL NOT NULL,
  CART_RZ_SOC      VARCHAR2(50) NOT NULL,
  CART_NOME_TBLAO  VARCHAR2(50) NOT NULL,
  CART_NOME_ECVAO  VARCHAR2(50) NOT NULL,
  CART_LOG         VARCHAR2(50) NOT NULL,
  CART_NUM         NUMBER(6) NOT NULL
  CART_BRO         VARCHAR2(50) NOT NULL,
  CART_CID         VARCHAR2(50) NOT NULL,
  CART_ESTD        VARCHAR2(50) NOT NULL,
  CART_CEP         NUMBER(9) NOT NULL
)
ALTER TABLE CART ADD CONSTRAINT PK_CART_CART_CD PRIMARY KEY (CART_CD);

CREATE TABLE TEL_CART
(
  CART_CD        NUMBER(6) NOT NULL,
  TEL_CART_NUM   VARCHAR2(50) NOT NULL
)
ALTER TABLE TEL_CART ADD CONSTRAINT PK_TEL_CART_CART_CD PRIMARY KEY (CART_CD,TEL_CART_NUM);
ALTER TABLE TEL_CART ADD CONSTRAINT FK_TEL_CART_CART_CD FOREIGN KEY (CART_CD) REFERENCES CART (CART_CD);

CREATE SEQUENCE SEQ_TSTM
MINVALUE 1
MAXVALUE 999
START WITH 1
INCREMENT BY 1
NOCACHE;
CREATE TABLE TSTM
(
  TSTM_CD           NUMBER(6) DEFAULT SEQ_TSTM.NEXTVAL NOT NULL,
  TSTM_DT_ELAB      DATE NOT NULL,
  TSTM_DT_REGS      DATE NOT NULL,
  TSTM_NUM_REGS     NUMBER(12) NOT NULL,
  PESS_CD           NUMBER(6) NOT NULL,
  CART_CD           NUMBER(6) NOT NULL
)
ALTER TABLE TSTM ADD CONSTRAINT PK_TSTM_TSTM_CD PRIMARY KEY (TSTM_CD);
ALTER TABLE TSTM ADD CONSTRAINT FK_TSTM_PESS_CD FOREIGN KEY (PESS_CD) REFERENCES PESS (PESS_CD);
ALTER TABLE TSTM ADD CONSTRAINT FK_TSTM_BENS_CD FOREIGN KEY (BENS_CD) REFERENCES BENS (BENS_CD);

CREATE SEQUENCE SEQ_HERD
MINVALUE 1
MAXVALUE 999
START WITH 1
INCREMENT BY 1
NOCACHE;
CREATE TABLE HERD
(
  HERD_CD           NUMBER(6) DEFAULT SEQ_HERD.NEXTVAL NOT NULL,
  HERD_NOME         VARCHAR2(50) NOT NULL,
  HERD_TP_PRTC      VARCHAR2(50) NOT NULL,
  HERD_DT_NASC      DATE NOT NULL,
  HERD_LOG          VARCHAR2(50) NOT NULL,
  HERD_NUM          NUMBER(6) NOT NULL
  HERD_BRO          VARCHAR2(50) NOT NULL,
  HERD_CID          VARCHAR2(50) NOT NULL,
  HERD_ESTD         VARCHAR2(50) NOT NULL,
  HERD_CEP          NUMBER(9) NOT NULL
  TSTM_CD           NUMBER(6) NOT NULL
)
ALTER TABLE HERD ADD CONSTRAINT PK_HERD_HERD_CD PRIMARY KEY (HERD_CD);
ALTER TABLE HERD ADD CONSTRAINT FK_HERD_TSTM_CD FOREIGN KEY (TSTM_CD) REFERENCES TSTM (TSTM_CD);

CREATE TABLE TEL_HERD
(
  HERD_CD        NUMBER(6) NOT NULL,
  TEL_HERD_NUM   VARCHAR2(50) NOT NULL
)
ALTER TABLE TEL_HERD ADD CONSTRAINT PK_TEL_HERD_HERD_CD PRIMARY KEY (HERD_CD,TEL_HERD_NUM);
ALTER TABLE TEL_HERD ADD CONSTRAINT FK_TEL_HERD_HERD_CD FOREIGN KEY (HERD_CD) REFERENCES HERD (HERD_CD);

CREATE TABLE HERC
(
  BENS_CD        NUMBER(6) NOT NULL,
  HERD_CD        NUMBER(6) NOT NULL,
  HERC_DT_RECEB  DATE NOT NULL
)
ALTER TABLE HERC ADD CONSTRAINT PK_HERC_HERC_CD PRIMARY KEY (BENS_CD,HERD_CD);
ALTER TABLE HERC ADD CONSTRAINT FK_HERC_HERD_CD FOREIGN KEY (HERD_CD) REFERENCES HERD (HERD_CD);
ALTER TABLE HERC ADD CONSTRAINT FK_HERC_BENS_CD FOREIGN KEY (BENS_CD) REFERENCES BENS (BENS_CD);


INSERT INTO PESS(PESS_NOME, PESS_LOG, PESS_NUM, PESS_BRO, PESS_CID, PESS_ESTD,PESS_CEP
		 PESS_TEL1, PESS_TEL2, PESS_TEL3, PESS_EMAIL)
VALUES("THOMAZ", "RUA DOS CAJU", 3, "ILHA DOS BENTOS", "VITORIA", "ESPIRITO SANTAO",
	25252150, "27272727", "28282828", "29292929", "THOMAZ@EMAIL.COM");

INSERT INTO PESS(PESS_NOME, PESS_LOG, PESS_NUM, PESS_BRO, PESS_CID, PESS_ESTD,PESS_CEP
		 PESS_TEL1, PESS_TEL2, PESS_TEL3, PESS_EMAIL)
VALUES("JOAO", "RUA DOS PESSEGOS", 3, "ILHA DOS BENTOS", "VITORIA", "ESPIRITO SANTAO",
	25252151, "25632563", "24562456", "25636985", "JOAO@EMAIL.COM");

INSERT INTO PESS(PESS_NOME, PESS_LOG, PESS_NUM, PESS_BRO, PESS_CID, PESS_ESTD,PESS_CEP
		 PESS_TEL1, PESS_TEL2, PESS_TEL3, PESS_EMAIL)
VALUES("LUAN", "RUA DAS GRAVIOLAS", 4, "ILHA DOS JUMENTOS", "VILA VELHA", "ESPIRITO SANTO",
	25104305, "99999899", "99889958", "99879958", "LUAN.LUAN@EMAIL.COM");

INSERT INTO PESS(PESS_NOME, PESS_LOG, PESS_NUM, PESS_BRO, PESS_CID, PESS_ESTD,PESS_CEP
		 PESS_TEL1, PESS_TEL2, PESS_TEL3, PESS_EMAIL)
VALUES("WESLEY", "RUA DAS ACEROLAS", 25, "BAIRRO DA PASSAGEM", "VILA VELHA", "RIO DE JANEIRO",
	25104305, "99992563", "99882525", "99872624", "WESLEY.LINDO@EMAIL.COM");

INSERT INTO PESS(PESS_NOME, PESS_LOG, PESS_NUM, PESS_BRO, PESS_CID, PESS_ESTD,PESS_CEP
		 PESS_TEL1, PESS_TEL2, PESS_TEL3, PESS_EMAIL)
VALUES("FELIPA", "RUA DAS ROSAS", 25, "GAIVOTAS", "VILA VELHA", "ESPIRITO SANTO",
	25104025, "99685574", "99859965", "99856589", "FELIPA.FELIPE@EMAIL.COM");

INSERT INTO BENS(BENS_CD, BENS_DESC, BENS_VAL_ESTM, PESS_CD)
VALUES(1, "CASA RUA JOAO", 100000, 1);

INSERT INTO BENS(BENS_CD, BENS_DESC, BENS_VAL_ESTM, PESS_CD)
VALUES(2, "APARTAMENTO BARRA", 110000, 2);

INSERT INTO BENS(BENS_CD, BENS_DESC, BENS_VAL_ESTM, PESS_CD)
VALUES(3, "CASA RJ", 95000, 3);

INSERT INTO BENS(BENS_CD, BENS_DESC, BENS_VAL_ESTM, PESS_CD)
VALUES(4, "CASA SP", 230000, 4);

INSERT INTO BENS(BENS_CD, BENS_DESC, BENS_VAL_ESTM, PESS_CD)
VALUES(5, "CASA PERNANBUCO", 115000, 5);

INSERT INTO OBRAART(BENS_CD, OBRAART_DESC, OBRAART_ANO_ELAB)
VALUES(1, "QUADRO MARILIA MENDONÇA", "24/10/2010");

INSERT INTO OBRAART(BENS_CD, OBRAART_DESC, OBRAART_ANO_ELAB)
VALUES(2, "QUADRO GUSTAVO LIMA E VOCE", "25/11/2009");

INSERT INTO OBRAART(BENS_CD, OBRAART_DESC, OBRAART_ANO_ELAB)
VALUES(3, "QUADRO SHAKESPEAR", "20/01/1998");

INSERT INTO OBRAART(BENS_CD, OBRAART_DESC, OBRAART_ANO_ELAB)
VALUES(4, "ESCULTURA PABLO", "10/05/2002");

INSERT INTO OBRAART(BENS_CD, OBRAART_DESC, OBRAART_ANO_ELAB)
VALUES(5, "ESCULTURA JOANA DARK", "02/06/2004");

INSERT INTO IMOV(BENS_CD, IMOV_LOG, IMOV_NUM, IMOV_BRO, IMOV_CID, IMOV_ESTD, IMOV_CEP,
		IMOV_TAM)
VALUES(1, "AVENIDA DOS CHUCRUTES", 2, "ILHA DAS PEDRAS", "VILA DOS PEDREIROS",
	"RIO DE JANEIRO", 29104205, 10);

INSERT INTO IMOV(BENS_CD, IMOV_LOG, IMOV_NUM, IMOV_BRO, IMOV_CID, IMOV_ESTD, IMOV_CEP,
		IMOV_TAM)
VALUES(2, "RUA DAS CORREIAS", 20, "ILHA DAS MAROLAS", "VITORIA",
	"FRIO DE JANEIRO", 29104305, 20);

INSERT INTO IMOV(BENS_CD, IMOV_LOG, IMOV_NUM, IMOV_BRO, IMOV_CID, IMOV_ESTD, IMOV_CEP,
		IMOV_TAM)
VALUES(3, "RUA DO JOAO", 999, "SAO JOAO", "RIO DE JANEIRO",
	"RIO DE JANEIRO", 29105305, 30);

INSERT INTO IMOV(BENS_CD, IMOV_LOG, IMOV_NUM, IMOV_BRO, IMOV_CID, IMOV_ESTD, IMOV_CEP,
		IMOV_TAM)
VALUES(4, "AVENIDA DOS MARGINAIS", 35, "JOCKEY", "SERRA",
	"SAO PAULO", 30104305, 45);

INSERT INTO IMOV(BENS_CD, IMOV_LOG, IMOV_NUM, IMOV_BRO, IMOV_CID, IMOV_ESTD, IMOV_CEP,
		IMOV_TAM)
VALUES(5, "AVENIDA DOS PERDEDORES", 100, "CENTRO", "JOAZEIRO",
	"SÃO PAULÃO", 55102305, 50);

INSERT INTO INSTFINAN (INSTFINAN_CD, INSTFINAN_NOME, INSTFINAN_AGE, INSTFINAN_LOCL, INSTFINAN_NOME_GERT)
VALUES (1, "CASTRO ALVES FINANCEIRA", "JARDIM DA PENHA I", "JARDIM DA PENHA", "GESTRUDES ALVES");

INSERT INTO INSTFINAN (INSTFINAN_CD, INSTFINAN_NOME, INSTFINAN_AGE, INSTFINAN_LOCL, INSTFINAN_NOME_GERT)
VALUES (2, "FINANCAS RIBEIRO", "AGENCIA CENTRO", "CENTRO DE SAO PAULO", "CARLOS DANIEL");

INSERT INTO INSTFINAN (INSTFINAN_CD, INSTFINAN_NOME, INSTFINAN_AGE, INSTFINAN_LOCL, INSTFINAN_NOME_GERT)
VALUES (3, "VITOR DINHEIROS", "BAIRRO REPUBLICA 3", "SERRA", "THOMAZ PRATA");

INSERT INTO INSTFINAN (INSTFINAN_CD, INSTFINAN_NOME, INSTFINAN_AGE, INSTFINAN_LOCL, INSTFINAN_NOME_GERT)
VALUES (4, "FLAVIA DAVILA CONTAS", "PENEDO 2", "VILA VELHA", "VIVIANE BARBOSA");

INSERT INTO INSTFINAN (INSTFINAN_CD, INSTFINAN_NOME, INSTFINAN_AGE, INSTFINAN_LOCL, INSTFINAN_NOME_GERT)
VALUES (5, "DELL FINANCEIRA", "DUDINCA", "RIO DE JANEIRO", "MERIA JOSE ALVARES");

INSERT INTO TEL_INSTFINAN (INSTFINAN_CD, TEL_INSTFINAN_NUM)
VALUES (1, "2799485778");

INSERT INTO TEL_INSTFINAN (INSTFINAN_CD, TEL_INSTFINAN_NUM)
VALUES (2, "2795577445");

INSERT INTO TEL_INSTFINAN (INSTFINAN_CD, TEL_INSTFINAN_NUM)
VALUES (3, "2798445564");

INSERT INTO TEL_INSTFINAN (INSTFINAN_CD, TEL_INSTFINAN_NUM)
VALUES (4, "2778886644");

INSERT INTO TEL_INSTFINAN (INSTFINAN_CD, TEL_INSTFINAN_NUM)
VALUES (5, "2748844556");

INSERT INTO CART (CART_CD, CART_RZ_SOC, CART_NOME_TBLAO, CART_NOME_ECVAO, CART_LOG, CART_NUM, CART_BRO, CART_CID, CART_ESTD, CART_CEP)
VALUES (1, "CARTORIO UM", "MARCOS ANTONIO", "BETO CALDELA", "RUA CASTRO ALVES", "1", "CINTOGA", "CIDADEMAIS", "ESTADAO", "283927349");

INSERT INTO CART (CART_CD, CART_RZ_SOC, CART_NOME_TBLAO, CART_NOME_ECVAO, CART_LOG, CART_NUM, CART_BRO, CART_CID, CART_ESTD, CART_CEP)
VALUES (2, "CARTORIO DOIS", "MARCUS ANTONIO", "BETO CALDELA", "RUA CASTRO ALVES", "2", "CINTOGA", "CIDADEMAIS", "ESTADAO", "283927349");

INSERT INTO CART (CART_CD, CART_RZ_SOC, CART_NOME_TBLAO, CART_NOME_ECVAO, CART_LOG, CART_NUM, CART_BRO, CART_CID, CART_ESTD, CART_CEP)
VALUES (3, "CARTORIO TRES", "MARCIOS ANTONIO", "BETINHO CALDELA", "RUAS CASTRO ALVES", "3", "CINTOGA", "CIDADEMAIS", "ESTADAO", "283927349");

INSERT INTO CART (CART_CD, CART_RZ_SOC, CART_NOME_TBLAO, CART_NOME_ECVAO, CART_LOG, CART_NUM, CART_BRO, CART_CID, CART_ESTD, CART_CEP)
VALUES (4, "CARTORIO QUATRO", "MARCIA ANTONIA", "BETA CALDELA", "RUA CASTRA ALVERS", "4", "SINTOGA", "CIDADEMAISES", "ESTADAOS", "2839273492");

INSERT INTO CART (CART_CD, CART_RZ_SOC, CART_NOME_TBLAO, CART_NOME_ECVAO, CART_LOG, CART_NUM, CART_BRO, CART_CID, CART_ESTD, CART_CEP)
VALUES (5, "CARTORIO CINCO", "MARCIUS JOSE", "BETOS CALDELA", "RUA CASTRO ALVARES", "5", "CININTOGA", "CIDADESMAIS", "ESTADAO GRANDE", "285427349");

INSERT INTO TEL_CART (CART_CD, TEL_CART_NUM)
VALUES (1, "2791944824");

INSERT INTO TEL_CART (CART_CD, TEL_CART_NUM)
VALUES (2, "2791944227");

INSERT INTO TEL_CART (CART_CD, TEL_CART_NUM)
VALUES (3, "2791944127");

INSERT INTO TEL_CART (CART_CD, TEL_CART_NUM)
VALUES (4, "2791744827");

INSERT INTO TEL_CART (CART_CD, TEL_CART_NUM)
VALUES (5, "2791044827");

INSERT INTO TSTM (TSTM_CD, TSTM_DT_ELAB, TSTM_DT_REGS, TSTM_NUM_REGS, PESS_CD, CART_CD)
VALUES (1, "01/02/2019", "01/02/2019", 123, 1, 1);

INSERT INTO TSTM (TSTM_CD, TSTM_DT_ELAB, TSTM_DT_REGS, TSTM_NUM_REGS, PESS_CD, CART_CD)
VALUES (2, "01/02/2019", "01/02/2019", 124, 2, 2);

INSERT INTO TSTM (TSTM_CD, TSTM_DT_ELAB, TSTM_DT_REGS, TSTM_NUM_REGS, PESS_CD, CART_CD)
VALUES (3, "01/02/2019", "01/02/2019", 125, 3, 3);

INSERT INTO TSTM (TSTM_CD, TSTM_DT_ELAB, TSTM_DT_REGS, TSTM_NUM_REGS, PESS_CD, CART_CD)
VALUES (4, "01/02/2019", "01/02/2019", 126, 4, 4);

INSERT INTO TSTM (TSTM_CD, TSTM_DT_ELAB, TSTM_DT_REGS, TSTM_NUM_REGS, PESS_CD, CART_CD)
VALUES (5, "01/02/2019", "01/02/2019", 127, 5, 5);

INSERT INTO HERD (HERD_CD, HERD_NOME, HERD_TP_PRTC, HERD_DT_NASC, HERD_LOG, HERD_NUM, HERD_BRO, HERD_CID, HERD_ESTD, HERD_CEP, TSTM_CD)
VALUES (1, "CLAUDIO", "FILHO", "03/08/1999", "RUA 1", 1, "PRAIA DA COSTA", "VILA VELHA", "ESPIRITO SANTO", "9223382", 1);

INSERT INTO HERD (HERD_CD, HERD_NOME, HERD_TP_PRTC, HERD_DT_NASC, HERD_LOG, HERD_NUM, HERD_BRO, HERD_CID, HERD_ESTD, HERD_CEP, TSTM_CD)
VALUES (2, "CLAUDIO", "FILHO", "03/08/1999", "RUA 2", 2, "PRAIA DA COSTA", "VILA VELHA", "ESPIRITO SANTO", "9223382", 2);

INSERT INTO HERD (HERD_CD, HERD_NOME, HERD_TP_PRTC, HERD_DT_NASC, HERD_LOG, HERD_NUM, HERD_BRO, HERD_CID, HERD_ESTD, HERD_CEP, TSTM_CD)
VALUES (3, "CLAUDIO", "FILHO", "03/08/1999", "RUA 3", 3, "PRAIA DA COSTA", "VILA VELHA", "ESPIRITO SANTO", "9223382", 3);

INSERT INTO HERD (HERD_CD, HERD_NOME, HERD_TP_PRTC, HERD_DT_NASC, HERD_LOG, HERD_NUM, HERD_BRO, HERD_CID, HERD_ESTD, HERD_CEP, TSTM_CD)
VALUES (4, "CLAUDIO", "FILHO", "03/08/1999", "RUA 4", 4, "PRAIA DA COSTA", "VILA VELHA", "ESPIRITO SANTO", "9223382", 4);

INSERT INTO HERD (HERD_CD, HERD_NOME, HERD_TP_PRTC, HERD_DT_NASC, HERD_LOG, HERD_NUM, HERD_BRO, HERD_CID, HERD_ESTD, HERD_CEP, TSTM_CD)
VALUES (5, "CLAUDIO", "FILHO", "03/08/1999", "RUA 5", 5, "PRAIA DA COSTA", "VILA VELHA", "ESPIRITO SANTO", "9223382", 5);

INSERT INTO TEL_HERD (HERD_CD, TEL_HERD_NUM)
VALUES (1, "2798997788");

INSERT INTO TEL_HERD (HERD_CD, TEL_HERD_NUM)
VALUES (2, "2798997787");

INSERT INTO TEL_HERD (HERD_CD, TEL_HERD_NUM)
VALUES (3, "2798997786");

INSERT INTO TEL_HERD (HERD_CD, TEL_HERD_NUM)
VALUES (4, "2798997785");

INSERT INTO TEL_HERD (HERD_CD, TEL_HERD_NUM)
VALUES (5, "2798997784");

INSERT INTO HERC (BENS_CD, HERD_CD, HERC_DT_RECEB)
VALUES (1, 1, "05/12/2019");

INSERT INTO HERC (BENS_CD, HERD_CD, HERC_DT_RECEB)
VALUES (2, 2, "05/12/2019");

INSERT INTO HERC (BENS_CD, HERD_CD, HERC_DT_RECEB)
VALUES (3, 3, "05/12/2019");

INSERT INTO HERC (BENS_CD, HERD_CD, HERC_DT_RECEB)
VALUES (4, 4, "05/12/2019");

INSERT INTO HERC (BENS_CD, HERD_CD, HERC_DT_RECEB)
VALUES (5, 5, "05/12/2019");
