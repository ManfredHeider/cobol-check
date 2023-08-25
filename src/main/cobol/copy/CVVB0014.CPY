      *---------------------------------------------------------------*
      *    Standard für alle Objekte unter PVCS
      *            Datum   :  November 1995
      *            Kopf aus:  N:\PROFILE\KOPFCBL.DAT
      *---------------------------------------------------------------*
      *
      *---------------------------------------------------------------*
      *    Copyright 1995 ATLAS Dienstleistungs GmbH
      *---------------------------------------------------------------*
      *    $Workfile:   CVVB0014.CPY  $
      *    $Revision:   2.0  $
      *
      *    $Log:   L:\MF\CPY\CVVB0014.CPv  $
      *
      *   Rev 2.0   Feb 27 1999 15:56:26   P13SP20
      *NT-Umstellung
      *
      *   Rev 1.0   Nov 04 1995 12:14:06   P13SP13
      *Initial revision.
      *
      *---------------------------------------------------------------*
      ******************************************************************
      * DCLGEN TABLE(VIVB0014)                                         *
      *        LIBRARY(P130005.BP010000.SRCDCL(CVVB0014))              *
      *        ACTION(REPLACE)                                         *
      *        QUOTE                                                   *
      * ... IS THE DCLGEN COMMAND THAT MADE THE FOLLOWING STATEMENTS   *
      ******************************************************************
           EXEC SQL DECLARE VIVB0014 TABLE
           ( MAN_BEZUGS_NR                  INTEGER NOT NULL,
             MAN_DAT_VON                    TIMESTAMP NOT NULL,
             MAN_LAST_UPDATE                TIMESTAMP NOT NULL,
             MAN_DAT_BIS                    DATE NOT NULL,
             KTY_BEZUGS_TYP                 SMALLINT NOT NULL,
             KNR_BEZUGS_TYP                 SMALLINT NOT NULL,
             MAN_GEBURTSDAT                 DATE,
             KTY_ANREDE                     SMALLINT NOT NULL,
             KNR_ANREDE                     SMALLINT NOT NULL,
             MAN_TITEL_ADEL                 CHAR(10) NOT NULL,
             MAN_TITEL_AKAD                 CHAR(10) NOT NULL,
             MAN_NAME                       CHAR(40) NOT NULL,
             MAN_VORNAME                    CHAR(20) NOT NULL
           ) END-EXEC.
      ******************************************************************
      * COBOL DECLARATION FOR TABLE VIVB0014                           *
      ******************************************************************
       01  VIVB0014-GESAMT.
        05  NI-VIVB0014-TAB.
           10  NI-VIVB0014-ELE     PIC S9(04)  COMP   OCCURS  13 TIMES.
        05  NI-VIVB0014            REDEFINES   NI-VIVB0014-TAB.
           10 NI-MAN-BEZUGS-NR     PIC S9(04)  COMP.
           10 NI-MAN-DAT-VON       PIC S9(04)  COMP.
           10 NI-MAN-LAST-UPDATE   PIC S9(04)  COMP.
           10 NI-MAN-DAT-BIS       PIC S9(04)  COMP.
           10 NI-KTY-BEZUGS-TYP    PIC S9(04)  COMP.
           10 NI-KNR-BEZUGS-TYP    PIC S9(04)  COMP.
           10 NI-MAN-GEBURTSDAT    PIC S9(04)  COMP.
           10 NI-KTY-ANREDE        PIC S9(04)  COMP.
           10 NI-KNR-ANREDE        PIC S9(04)  COMP.
           10 NI-MAN-TITEL-ADEL    PIC S9(04)  COMP.
           10 NI-MAN-TITEL-AKAD    PIC S9(04)  COMP.
           10 NI-MAN-NAME          PIC S9(04)  COMP.
           10 NI-MAN-VORNAME       PIC S9(04)  COMP.
        05  DCL-VIVB0014.
           10 MAN-BEZUGS-NR        PIC S9(9) USAGE COMP.
           10 MAN-DAT-VON          PIC X(26).
           10 MAN-LAST-UPDATE      PIC X(26).
           10 MAN-DAT-BIS          PIC X(10).
           10 KTY-BEZUGS-TYP       PIC S9(4) USAGE COMP.
           10 KNR-BEZUGS-TYP       PIC S9(4) USAGE COMP.
           10 MAN-GEBURTSDAT       PIC X(10).
           10 KTY-ANREDE           PIC S9(4) USAGE COMP.
           10 KNR-ANREDE           PIC S9(4) USAGE COMP.
           10 MAN-TITEL-ADEL       PIC X(10).
           10 MAN-TITEL-AKAD       PIC X(10).
           10 MAN-NAME             PIC X(40).
           10 MAN-VORNAME          PIC X(20).
      ******************************************************************
      * THE NUMBER OF COLUMNS DESCRIBED BY THIS DECLARATION IS 13      *
      ******************************************************************
