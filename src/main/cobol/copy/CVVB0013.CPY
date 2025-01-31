      *---------------------------------------------------------------*
      *    Standard für alle Objekte unter PVCS
      *            Datum   :  November 1995
      *            Kopf aus:  N:\PROFILE\KOPFCBL.DAT
      *---------------------------------------------------------------*
      *
      *---------------------------------------------------------------*
      *    Copyright 1995 ATLAS Dienstleistungs GmbH
      *---------------------------------------------------------------*
      *    $Workfile:   CVVB0013.CPY  $
      *    $Revision:   2.0  $
      *
      *    $Log:   L:\MF\CPY\CVVB0013.CPv  $
      *
      *   Rev 2.0   Feb 27 1999 15:56:26   P13SP20
      *NT-Umstellung
      *
      *   Rev 1.0   Nov 04 1995 12:13:54   P13SP13
      *Initial revision.
      *
      *---------------------------------------------------------------*
      ******************************************************************
      * DCLGEN TABLE(VIVB0013)                                         *
      *        LIBRARY(P130005.BP010000.SRCDCL(CVVB0013))              *
      *        ACTION(REPLACE)                                         *
      *        QUOTE                                                   *
      * ... IS THE DCLGEN COMMAND THAT MADE THE FOLLOWING STATEMENTS   *
      ******************************************************************
           EXEC SQL DECLARE VIVB0013 TABLE
           ( MA_ST_NR                       INTEGER NOT NULL,
             AV_DAT_VON                     TIMESTAMP NOT NULL,
             AV_LAST_UPDATE                 TIMESTAMP NOT NULL,
             KTY_AV_TYP                     SMALLINT NOT NULL,
             KNR_AV_TYP                     SMALLINT NOT NULL,
             AV_VERTRAGSDAT                 DATE,
             AV_DAT_BIS                     DATE NOT NULL,
             AV_UMSCHREIB_DAT               DATE,
             AV_UMSCHREIB_PTN               CHAR(40) NOT NULL
           ) END-EXEC.
      ******************************************************************
      * COBOL DECLARATION FOR TABLE VIVB0013                           *
      ******************************************************************
       01  VIVB0013-GESAMT.
        05  NI-VIVB0013-TAB.
           10  NI-VIVB0013-ELE     PIC S9(04)  COMP   OCCURS  9  TIMES.
        05  NI-VIVB0013            REDEFINES   NI-VIVB0013-TAB.
           10 NI-MA-ST-NR          PIC S9(04)  COMP.
           10 NI-AV-DAT-VON        PIC S9(04)  COMP.
           10 NI-AV-LAST-UPDATE    PIC S9(04)  COMP.
           10 NI-KTY-AV-TYP        PIC S9(04)  COMP.
           10 NI-KNR-AV-TYP        PIC S9(04)  COMP.
           10 NI-AV-VERTRAGSDAT    PIC S9(04)  COMP.
           10 NI-AV-DAT-BIS        PIC S9(04)  COMP.
           10 NI-AV-UMSCHREIB-DAT  PIC S9(04)  COMP.
           10 NI-AV-UMSCHREIB-PTN  PIC S9(04)  COMP.
        05  DCL-VIVB0013.
           10 MA-ST-NR             PIC S9(9) USAGE COMP.
           10 AV-DAT-VON           PIC X(26).
           10 AV-LAST-UPDATE       PIC X(26).
           10 KTY-AV-TYP           PIC S9(4) USAGE COMP.
           10 KNR-AV-TYP           PIC S9(4) USAGE COMP.
           10 AV-VERTRAGSDAT       PIC X(10).
           10 AV-DAT-BIS           PIC X(10).
           10 AV-UMSCHREIB-DAT     PIC X(10).
           10 AV-UMSCHREIB-PTN     PIC X(40).
      ******************************************************************
      * THE NUMBER OF COLUMNS DESCRIBED BY THIS DECLARATION IS 9       *
      ******************************************************************
