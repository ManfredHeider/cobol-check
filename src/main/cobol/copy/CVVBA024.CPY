      *---------------------------------------------------------------*
      *    Standard für alle Objekte unter PVCS
      *            Datum   :  November 1995
      *            Kopf aus:  N:\PROFILE\KOPFCBL.DAT
      *---------------------------------------------------------------*
      *
      *---------------------------------------------------------------*
      *    Copyright 1995 ATLAS Dienstleistungs GmbH
      *---------------------------------------------------------------*
      *    $Workfile:   CVVBA024.CPY  $
      *    $Revision:   2.0  $
      *
      *    $Log:   L:\MF\CPY\CVVBA024.CPv  $
      *
      *   Rev 2.0   Feb 27 1999 15:56:46   P13SP20
      *NT-Umstellung
      *
      *   Rev 1.0   Nov 04 1995 12:09:36   P13SP13
      *Initial revision.
      *
      *---------------------------------------------------------------*
      ******************************************************************
      * DCLGEN TABLE(VIVBA024)                                         *
      *        LIBRARY(P130005.BP010000.SRCDCL(CVVBA024))              *
      *        ACTION(REPLACE)                                         *
      *        QUOTE                                                   *
      * ... IS THE DCLGEN COMMAND THAT MADE THE FOLLOWING STATEMENTS   *
      ******************************************************************
           EXEC SQL DECLARE VIVBA024 TABLE
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
             VSWZ_DBI_KTO_NR                CHAR(9)
           ) END-EXEC.
      ******************************************************************
      * COBOL DECLARATION FOR TABLE VIVBA024                           *
      ******************************************************************
       01  VIVBA024-GESAMT.
        05  NI-VIVBA024-TAB.
           10  NI-VIVBA024-ELE     PIC S9(04)  COMP   OCCURS  19 TIMES.
        05  NI-VIVBA024            REDEFINES   NI-VIVBA024-TAB.
           10 NI-MA-ST-NR          PIC S9(04)  COMP.
           10 NI-VSWZ-LAST-UPDATE  PIC S9(04)  COMP.
           10 NI-VSWZ-ZUSAGE-DAT   PIC S9(04)  COMP.
           10 NI-VSWZ-A-IG-DAT     PIC S9(04)  COMP.
           10 NI-VSWZ-A-GESAMT     PIC S9(04)  COMP.
           10 NI-VSWZ-G-DAT-VON    PIC S9(04)  COMP.
           10 NI-VSWZ-G-STZ-JAHR   PIC S9(04)  COMP.
           10 NI-VSWZ-G-VERS-SUM   PIC S9(04)  COMP.
           10 NI-VSWZ-G-STZ-ANZ    PIC S9(04)  COMP.
           10 NI-VSWZ-G-VERS-NR    PIC S9(04)  COMP.
           10 NI-VSWZ-Z-VERS-SUM   PIC S9(04)  COMP.
           10 NI-VSWZ-Z-VERS-NR    PIC S9(04)  COMP.
           10 NI-VSWZ-Z-DAT-VON    PIC S9(04)  COMP.
           10 NI-KTY-A-BERECHTIG   PIC S9(04)  COMP.
           10 NI-KNR-A-BERECHTIG   PIC S9(04)  COMP.
           10 NI-KTY-G-BERECHTIG   PIC S9(04)  COMP.
           10 NI-KNR-G-BERECHTIG   PIC S9(04)  COMP.
           10 NI-VSWZ-DBI-DAT      PIC S9(04)  COMP.
           10 NI-VSWZ-DBI-KTO-NR   PIC S9(04)  COMP.
        05  DCL-VIVBA024.
           10 MA-ST-NR             PIC S9(9) USAGE COMP.
           10 VSWZ-LAST-UPDATE     PIC X(26).
           10 VSWZ-ZUSAGE-DAT      PIC X(10).
           10 VSWZ-A-IG-DAT        PIC X(10).
           10 VSWZ-A-GESAMT        PIC S999999999V99 USAGE COMP-3.
           10 VSWZ-G-DAT-VON       PIC X(10).
           10 VSWZ-G-STZ-JAHR      PIC X(10).
           10 VSWZ-G-VERS-SUM      PIC S999999999V99 USAGE COMP-3.
           10 VSWZ-G-STZ-ANZ       PIC S9(4) USAGE COMP.
           10 VSWZ-G-VERS-NR       PIC S999999999999999V USAGE COMP-3.
           10 VSWZ-Z-VERS-SUM      PIC S999999999V99 USAGE COMP-3.
           10 VSWZ-Z-VERS-NR       PIC S999999999999999V USAGE COMP-3.
           10 VSWZ-Z-DAT-VON       PIC X(10).
           10 KTY-A-BERECHTIG      PIC S9(4) USAGE COMP.
           10 KNR-A-BERECHTIG      PIC S9(4) USAGE COMP.
           10 KTY-G-BERECHTIG      PIC S9(4) USAGE COMP.
           10 KNR-G-BERECHTIG      PIC S9(4) USAGE COMP.
           10 VSWZ-DBI-DAT         PIC X(10).
           10 VSWZ-DBI-KTO-NR      PIC X(9).
      ******************************************************************
      * THE NUMBER OF COLUMNS DESCRIBED BY THIS DECLARATION IS 19      *
      ******************************************************************
