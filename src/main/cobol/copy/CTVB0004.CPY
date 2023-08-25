      *---------------------------------------------------------------*
      *    Standard für alle Objekte unter PVCS
      *            Datum   :  November 1995
      *            Kopf aus:  N:\PROFILE\KOPFCBL.DAT
      *---------------------------------------------------------------*
      *
      *---------------------------------------------------------------*
      *    Copyright 1995 ATLAS Dienstleistungs GmbH
      *---------------------------------------------------------------*
      *    $Workfile:   CTVB0004.CPY  $
      *    $Revision:   2.0  $
      *
      *    $Log:   L:\MF\CPY\CTVB0004.CPv  $
      *
      *   Rev 2.0   Feb 27 1999 15:56:00   P13SP20
      *NT-Umstellung
      *
      *   Rev 1.0   Nov 04 1995 11:52:04   P13SP13
      *Initial revision.
      *
      *---------------------------------------------------------------*
      *      VERSION   1    22.06.94 18:05:49
      ******************************************************************
      * DCLGEN TABLE(TBVB0004)                                         *
      *        LIBRARY(T130005.DB2PILOT.SRCDCL(CTVB0004))              *
      *        ACTION(REPLACE)                                         *
      *        QUOTE                                                   *
      * ... IS THE DCLGEN COMMAND THAT MADE THE FOLLOWING STATEMENTS   *
      ******************************************************************
           EXEC SQL DECLARE TBVB0004 TABLE
           ( MA_ST_NR                       INTEGER NOT NULL,
             MA_LAST_UPDATE                 TIMESTAMP NOT NULL,
             KTY_MA_TYP                     SMALLINT NOT NULL,
             KNR_MA_TYP                     SMALLINT NOT NULL,
             MA_BDV_MITGLIED                CHAR(1) NOT NULL,
             MA_STRAFE                      CHAR(1) NOT NULL,
             MA_VERSANDSTOP                 CHAR(1) NOT NULL,
             MA_ZV_ZVII_ABL                 CHAR(1) NOT NULL,
             MA_RCK_STZ                     DECIMAL(5, 2) NOT NULL,
             MA_RCK_STZ_DAT                 DATE NOT NULL,
             MA_FUEH_ZEUG_DAT               DATE,
             MA_SCHUFA_DAT                  DATE,
             MA_34C_DAT                     DATE,
             MA_AFO                         CHAR(1) NOT NULL,
             MA_DARLEHEN                    CHAR(1) NOT NULL,
             MA_AVAG_DVAG                   DATE,
             MA_KOMPASS_AVAG                DATE,
             MA_AUTOTELEFON                 CHAR(14) NOT NULL,
             MA_TELETEXT                    CHAR(14) NOT NULL,
             MA_ZV_NR                       CHAR(1) NOT NULL,
             MA_ZV_DAT_BIS_R                DATE,
             MA_ZV_DAT_BIS                  DATE,
             MA_ZV_DAT_VON                  DATE,
             MA_ZV_KUE_DAT                  DATE,
             MA_ED_ZUSATZ                   SMALLINT NOT NULL,
             MA_ZV_VERL                     CHAR(1) NOT NULL
           ) END-EXEC.
      ******************************************************************
      * COBOL DECLARATION FOR TABLE TBVB0004                           *
      ******************************************************************
       01  TBVB0004-GESAMT.
        05  NI-TBVB0004-TAB.
           10  NI-TBVB0004-ELE     PIC S9(04)  COMP   OCCURS  26 TIMES.
        05  NI-TBVB0004            REDEFINES   NI-TBVB0004-TAB.
           10 NI-MA-ST-NR          PIC S9(04)  COMP.
           10 NI-MA-LAST-UPDATE    PIC S9(04)  COMP.
           10 NI-KTY-MA-TYP        PIC S9(04)  COMP.
           10 NI-KNR-MA-TYP        PIC S9(04)  COMP.
           10 NI-MA-BDV-MITGLIED   PIC S9(04)  COMP.
           10 NI-MA-STRAFE         PIC S9(04)  COMP.
           10 NI-MA-VERSANDSTOP    PIC S9(04)  COMP.
           10 NI-MA-ZV-ZVII-ABL    PIC S9(04)  COMP.
           10 NI-MA-RCK-STZ        PIC S9(04)  COMP.
           10 NI-MA-RCK-STZ-DAT    PIC S9(04)  COMP.
           10 NI-MA-FUEH-ZEUG-DAT  PIC S9(04)  COMP.
           10 NI-MA-SCHUFA-DAT     PIC S9(04)  COMP.
           10 NI-MA-34C-DAT        PIC S9(04)  COMP.
           10 NI-MA-AFO            PIC S9(04)  COMP.
           10 NI-MA-DARLEHEN       PIC S9(04)  COMP.
           10 NI-MA-AVAG-DVAG      PIC S9(04)  COMP.
           10 NI-MA-KOMPASS-AVAG   PIC S9(04)  COMP.
           10 NI-MA-AUTOTELEFON    PIC S9(04)  COMP.
           10 NI-MA-TELETEXT       PIC S9(04)  COMP.
           10 NI-MA-ZV-NR          PIC S9(04)  COMP.
           10 NI-MA-ZV-DAT-BIS-R   PIC S9(04)  COMP.
           10 NI-MA-ZV-DAT-BIS     PIC S9(04)  COMP.
           10 NI-MA-ZV-DAT-VON     PIC S9(04)  COMP.
           10 NI-MA-ZV-KUE-DAT     PIC S9(04)  COMP.
           10 NI-MA-ED-ZUSATZ      PIC S9(04)  COMP.
           10 NI-MA-ZV-VERL        PIC S9(04)  COMP.
        05  DCL-TBVB0004.
           10 MA-ST-NR             PIC S9(9) USAGE COMP.
           10 MA-LAST-UPDATE       PIC X(26).
           10 KTY-MA-TYP           PIC S9(4) USAGE COMP.
           10 KNR-MA-TYP           PIC S9(4) USAGE COMP.
           10 MA-BDV-MITGLIED      PIC X(1).
           10 MA-STRAFE            PIC X(1).
           10 MA-VERSANDSTOP       PIC X(1).
           10 MA-ZV-ZVII-ABL       PIC X(1).
           10 MA-RCK-STZ           PIC S999V99 USAGE COMP-3.
           10 MA-RCK-STZ-DAT       PIC X(10).
           10 MA-FUEH-ZEUG-DAT     PIC X(10).
           10 MA-SCHUFA-DAT        PIC X(10).
           10 MA-34C-DAT           PIC X(10).
           10 MA-AFO               PIC X(1).
           10 MA-DARLEHEN          PIC X(1).
           10 MA-AVAG-DVAG         PIC X(10).
           10 MA-KOMPASS-AVAG      PIC X(10).
           10 MA-AUTOTELEFON       PIC X(14).
           10 MA-TELETEXT          PIC X(14).
           10 MA-ZV-NR             PIC X(1).
           10 MA-ZV-DAT-BIS-R      PIC X(10).
           10 MA-ZV-DAT-BIS        PIC X(10).
           10 MA-ZV-DAT-VON        PIC X(10).
           10 MA-ZV-KUE-DAT        PIC X(10).
           10 MA-ED-ZUSATZ         PIC S9(4) USAGE COMP.
           10 MA-ZV-VERL           PIC X(1).
      ******************************************************************
      * THE NUMBER OF COLUMNS DESCRIBED BY THIS DECLARATION IS 26      *
      ******************************************************************
