      *---------------------------------------------------------------*
      *    Standard fuer alle Objekte unter PVCS VM
      *            Datum      :  22.11.2005
      *            Kategorie  :  Copystrecke
      *---------------------------------------------------------------*
      *
      *---------------------------------------------------------------*
      *    Copyright (c) 2005 ATLAS Dienstleistungen f. V. GmbH
      *---------------------------------------------------------------*
      *    $Workfile:   CVVBB024.CPY  $
      *    $Revision:   2.2  $
      *
      *    $Log:   L:/mf/CPY/CVVBB024.CPv  $
      *
      *   Rev 2.2   Mar 22 2006 14:53:40   t13ae28
      *ASL00216: VSWZ-neuer DCLGEN etc.
      *
      *   Rev 2.1   Mar 06 2006 15:49:34   t13ae30
      *ASL00216: VSWZ-neuer DCLGEN etc.
      *
      *   Rev 2.0   Nov 22 2005 14:26:16   t13ae30
      *Archiverstellung
      *
      *---------------------------------------------------------------*
      ******************************************************************
      * DCLGEN TABLE(VIVBB024)                                         *
      *        LIBRARY(P130005.BP010000.SRCDCL(CVVBB024))              *
      *        ACTION(REPLACE)                                         *
      *        QUOTE                                                   *
      * ... IS THE DCLGEN COMMAND THAT MADE THE FOLLOWING STATEMENTS   *
      ******************************************************************
           EXEC SQL DECLARE VIVBB024 TABLE
           ( MA_ST_NR                       INTEGER NOT NULL,
             VSWZ_LAST_UPDATE               TIMESTAMP NOT NULL,
             VSWZ_ZUSAGE_DAT                DATE NOT NULL,
             VSWZ_A_IG_DAT                  DATE,
             VSWZ_A_GESAMT                  DECIMAL(11, 2) NOT NULL,
             VSWZ_G_DAT_VON                 DATE,
             VSWZ_G_STZ_JAHR                DATE,
             VSWZ_G_VERS_SUM                DECIMAL(11, 2) NOT NULL,
             VSWZ_G_STZ_ANZ                 SMALLINT NOT NULL,
             VSWZ_G_VERS_NR                 DECIMAL(15, 0) NOT NULL,
             VSWZ_Z_VERS_SUM                DECIMAL(11, 2) NOT NULL,
             VSWZ_Z_VERS_NR                 DECIMAL(15, 0) NOT NULL,
             VSWZ_Z_DAT_VON                 DATE,
             KTY_A_BERECHTIG                SMALLINT NOT NULL,
             KNR_A_BERECHTIG                SMALLINT NOT NULL,
             KTY_G_BERECHTIG                SMALLINT NOT NULL,
             KNR_G_BERECHTIG                SMALLINT NOT NULL,
             VSWZ_DBI_DAT                   DATE,
             VSWZ_DBI_KTO_NR                CHAR(9),
             VSWZ_G_RV_VERS_NR              DECIMAL(15, 0),
             VSWZ_G_RV_RENTE                DECIMAL(11, 2),
             VSWZ_G_RV_ABF                  DECIMAL(11, 2),
             VSWZ_G_RV_BURENTE              DECIMAL(11, 2),
             VSWZ_Z_RV_VERS_NR              DECIMAL(15, 0),
             VSWZ_Z_RV_RENTE                DECIMAL(11, 2),
             VSWZ_Z_RV_ABF                  DECIMAL(11, 2),
             VSWZ_Z_RV_BURENTE              DECIMAL(11, 2),
             KTY_Z_BERECHTIG                SMALLINT NOT NULL,
             KNR_Z_BERECHTIG                SMALLINT NOT NULL
           ) END-EXEC.
      ******************************************************************
      * COBOL DECLARATION FOR TABLE VIVBB024                           *
      ******************************************************************
       01  VIVBB024-GESAMT.
        05  NI-VIVBB024-TAB.
           10  NI-VIVBB024-ELE     PIC S9(04)  COMP   OCCURS  29 TIMES.
        05  NI-VIVBB024            REDEFINES   NI-VIVBB024-TAB.
           10 NI-MA-ST-NR           PIC S9(04)  COMP.
           10 NI-VSWZ-LAST-UPDATE   PIC S9(04)  COMP.
           10 NI-VSWZ-ZUSAGE-DAT    PIC S9(04)  COMP.
           10 NI-VSWZ-A-IG-DAT      PIC S9(04)  COMP.
           10 NI-VSWZ-A-GESAMT      PIC S9(04)  COMP.
           10 NI-VSWZ-G-DAT-VON     PIC S9(04)  COMP.
           10 NI-VSWZ-G-STZ-JAHR    PIC S9(04)  COMP.
           10 NI-VSWZ-G-VERS-SUM    PIC S9(04)  COMP.
           10 NI-VSWZ-G-STZ-ANZ     PIC S9(04)  COMP.
           10 NI-VSWZ-G-VERS-NR     PIC S9(04)  COMP.
           10 NI-VSWZ-Z-VERS-SUM    PIC S9(04)  COMP.
           10 NI-VSWZ-Z-VERS-NR     PIC S9(04)  COMP.
           10 NI-VSWZ-Z-DAT-VON     PIC S9(04)  COMP.
           10 NI-KTY-A-BERECHTIG    PIC S9(04)  COMP.
           10 NI-KNR-A-BERECHTIG    PIC S9(04)  COMP.
           10 NI-KTY-G-BERECHTIG    PIC S9(04)  COMP.
           10 NI-KNR-G-BERECHTIG    PIC S9(04)  COMP.
           10 NI-VSWZ-DBI-DAT       PIC S9(04)  COMP.
           10 NI-VSWZ-DBI-KTO-NR    PIC S9(04)  COMP.
           10 NI-VSWZ-G-RV-VERS-NR  PIC S9(04)  COMP.
           10 NI-VSWZ-G-RV-RENTE    PIC S9(04)  COMP.
           10 NI-VSWZ-G-RV-ABF      PIC S9(04)  COMP.
           10 NI-VSWZ-G-RV-BURENTE  PIC S9(04)  COMP.
           10 NI-VSWZ-Z-RV-VERS-NR  PIC S9(04)  COMP.
           10 NI-VSWZ-Z-RV-RENTE    PIC S9(04)  COMP.
           10 NI-VSWZ-Z-RV-ABF      PIC S9(04)  COMP.
           10 NI-VSWZ-Z-RV-BURENTE  PIC S9(04)  COMP.
           10 NI-KTY-Z-BERECHTIG    PIC S9(04)  COMP.
           10 NI-KNR-Z-BERECHTIG    PIC S9(04)  COMP.
        05  DCL-VIVBB024.
           10 MA-ST-NR          PIC S9(9)     COMP       VALUE ZERO.
           10 VSWZ-LAST-UPDATE  PIC X(26)                VALUE SPACE.
           10 VSWZ-ZUSAGE-DAT   PIC X(10)                VALUE SPACE.
           10 VSWZ-A-IG-DAT     PIC X(10)                VALUE SPACE.
           10 VSWZ-A-GESAMT     PIC S9(09)V99 COMP-3     VALUE ZERO.
           10 VSWZ-G-DAT-VON    PIC X(10)                VALUE SPACE.
           10 VSWZ-G-STZ-JAHR   PIC X(10)                VALUE SPACE.
           10 VSWZ-G-VERS-SUM   PIC S9(09)V99 COMP-3     VALUE ZERO.
           10 VSWZ-G-STZ-ANZ    PIC S9(4)     COMP       VALUE ZERO.
           10 VSWZ-G-VERS-NR    PIC S9(15)    COMP-3     VALUE ZERO.
           10 VSWZ-Z-VERS-SUM   PIC S9(09)V99 COMP-3     VALUE ZERO.
           10 VSWZ-Z-VERS-NR    PIC S9(15)    COMP-3     VALUE ZERO.
           10 VSWZ-Z-DAT-VON    PIC X(10)                VALUE SPACE.
           10 KTY-A-BERECHTIG   PIC S9(4)     COMP       VALUE ZERO.
           10 KNR-A-BERECHTIG   PIC S9(4)     COMP       VALUE ZERO.
           10 KTY-G-BERECHTIG   PIC S9(4)     COMP       VALUE ZERO.
           10 KNR-G-BERECHTIG   PIC S9(4)     COMP       VALUE ZERO.
           10 VSWZ-DBI-DAT      PIC X(10)                VALUE SPACE.
           10 VSWZ-DBI-KTO-NR   PIC X(09)                VALUE SPACE.
           10 VSWZ-G-RV-VERS-NR PIC S9(15)    COMP-3     VALUE ZERO.
           10 VSWZ-G-RV-RENTE   PIC S9(09)V99 COMP-3     VALUE ZERO.
           10 VSWZ-G-RV-ABF     PIC S9(09)V99 COMP-3     VALUE ZERO.
           10 VSWZ-G-RV-BURENTE PIC S9(09)V99 COMP-3     VALUE ZERO.
           10 VSWZ-Z-RV-VERS-NR PIC S9(15)    COMP-3     VALUE ZERO.
           10 VSWZ-Z-RV-RENTE   PIC S9(09)V99 COMP-3     VALUE ZERO.
           10 VSWZ-Z-RV-ABF     PIC S9(09)V99 COMP-3     VALUE ZERO.
           10 VSWZ-Z-RV-BURENTE PIC S9(09)V99 COMP-3     VALUE ZERO.
           10 KTY-Z-BERECHTIG   PIC S9(4)     COMP       VALUE ZERO.
           10 KNR-Z-BERECHTIG   PIC S9(4)     COMP       VALUE ZERO.
      ******************************************************************
      * THE NUMBER OF COLUMNS DESCRIBED BY THIS DECLARATION IS 29      *
      ******************************************************************
