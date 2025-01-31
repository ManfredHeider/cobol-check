      *---------------------------------------------------------------*
      *    Standard für alle Objekte unter PVCS
      *            Datum   :  November 1995
      *            Kopf aus:  N:\PROFILE\KOPFCBL.DAT
      *---------------------------------------------------------------*
      *
      *---------------------------------------------------------------*
      *    Copyright 1995 ATLAS Dienstleistungs GmbH
      *---------------------------------------------------------------*
      *    $Workfile:   CTVB0040.CPY  $
      *    $Revision:   2.0  $
      *
      *    $Log:   L:\MF\CPY\CTVB0040.CPv  $
      *
      *   Rev 2.0   Feb 27 1999 15:56:12   P13SP20
      *NT-Umstellung
      *
      *   Rev 1.0   Nov 04 1995 12:00:14   P13SP13
      *Initial revision.
      *
      *---------------------------------------------------------------*
      ******************************************************************
      * DCLGEN TABLE(TBVB0040)                                         *
      *        LIBRARY(P130005.BP010000.SRCDCL(CTVB0040))              *
      *        ACTION(REPLACE)                                         *
      *        QUOTE                                                   *
      * ... IS THE DCLGEN COMMAND THAT MADE THE FOLLOWING STATEMENTS   *
      ******************************************************************
           EXEC SQL DECLARE TBVB0040 TABLE
           ( KL_ST_NR                       INTEGER NOT NULL,
             KL_LAST_UPDATE                 TIMESTAMP NOT NULL,
             KL_DAT_VON                     DATE NOT NULL,
             KL_DAT_BIS                     DATE,
             KL_PROV_STZ_AP                 DECIMAL(5, 2) NOT NULL,
             KL_PROV_STZ_GP                 DECIMAL(5, 2) NOT NULL,
             KL_PROZ_STZ                    DECIMAL(5, 2) NOT NULL,
             KL_RCK_STZ_DAT                 DATE NOT NULL,
             KL_RCK_STZ                     DECIMAL(5, 2) NOT NULL
           ) END-EXEC.
      ******************************************************************
      * COBOL DECLARATION FOR TABLE TBVB0040                           *
      ******************************************************************
       01  TBVB0040-GESAMT.
        05  NI-TBVB0040-TAB.
           10  NI-TBVB0040-ELE     PIC S9(04)  COMP   OCCURS  9  TIMES.
        05  NI-TBVB0040            REDEFINES   NI-TBVB0040-TAB.
           10 NI-KL-ST-NR          PIC S9(04)  COMP.
           10 NI-KL-LAST-UPDATE    PIC S9(04)  COMP.
           10 NI-KL-DAT-VON        PIC S9(04)  COMP.
           10 NI-KL-DAT-BIS        PIC S9(04)  COMP.
           10 NI-KL-PROV-STZ-AP    PIC S9(04)  COMP.
           10 NI-KL-PROV-STZ-GP    PIC S9(04)  COMP.
           10 NI-KL-PROZ-STZ       PIC S9(04)  COMP.
           10 NI-KL-RCK-STZ-DAT    PIC S9(04)  COMP.
           10 NI-KL-RCK-STZ        PIC S9(04)  COMP.
        05  DCL-TBVB0040.
           10 KL-ST-NR             PIC S9(9) USAGE COMP.
           10 KL-LAST-UPDATE       PIC X(26).
           10 KL-DAT-VON           PIC X(10).
           10 KL-DAT-BIS           PIC X(10).
           10 KL-PROV-STZ-AP       PIC S999V99 USAGE COMP-3.
           10 KL-PROV-STZ-GP       PIC S999V99 USAGE COMP-3.
           10 KL-PROZ-STZ          PIC S999V99 USAGE COMP-3.
           10 KL-RCK-STZ-DAT       PIC X(10).
           10 KL-RCK-STZ           PIC S999V99 USAGE COMP-3.
      ******************************************************************
      * THE NUMBER OF COLUMNS DESCRIBED BY THIS DECLARATION IS 9       *
      ******************************************************************
