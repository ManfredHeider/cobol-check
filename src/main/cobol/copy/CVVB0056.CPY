      *---------------------------------------------------------------*
      *    Standard für alle Objekte unter PVCS
      *            Datum   :  November 1995
      *            Kopf aus:  N:\PROFILE\KOPFCBL.DAT
      *---------------------------------------------------------------*
      *
      *---------------------------------------------------------------*
      *    Copyright 1995 ATLAS Dienstleistungs GmbH
      *---------------------------------------------------------------*
      *    $Workfile:   CVVB0056.CPY  $
      *    $Revision:   2.0  $
      *
      *    $Log:   L:\MF\CPY\CVVB0056.CPv  $
      *
      *   Rev 2.0   Feb 27 1999 15:56:40   P13SP20
      *NT-Umstellung
      *
      *   Rev 1.0   Nov 04 1995 12:22:34   P13SP13
      *Initial revision.
      *
      *---------------------------------------------------------------*
      ******************************************************************
      * DCLGEN TABLE(VIVB0056)                                         *
      *        LIBRARY(P130005.BP010000.SRCDCL(CVVB0056))              *
      *        ACTION(REPLACE)                                         *
      *        QUOTE                                                   *
      * ... IS THE DCLGEN COMMAND THAT MADE THE FOLLOWING STATEMENTS   *
      ******************************************************************
           EXEC SQL DECLARE VIVB0056 TABLE
           ( MS_NR                          SMALLINT NOT NULL,
             MA_ST_NR                       INTEGER  NOT NULL,
             UMSF_UMSATZ_KZ                 CHAR(1)  NOT NULL
           ) END-EXEC.
      ******************************************************************
      * COBOL DECLARATION FOR TABLE VIVB0056                           *
      ******************************************************************
       01  VIVB0056-GESAMT.
        05  NI-VIVB0056-TAB.
           10  NI-VIVB0056-ELE     PIC S9(04)  COMP   OCCURS   3 TIMES.
        05  NI-VIVB0056            REDEFINES   NI-VIVB0056-TAB.
           10 NI-MS-NR             PIC S9(04)  COMP.
           10 NI-MA-ST-NR          PIC S9(04)  COMP.
           10 NI-UMSF-UMSATZ-KZ    PIC S9(04)  COMP.
        05  DCL-VIVB0056.
           10 MS-NR                PIC S9(4) USAGE COMP.
           10 MA-ST-NR             PIC S9(9) USAGE COMP.
           10 UMSF-UMSATZ-KZ       PIC X(1).
      ******************************************************************
      * THE NUMBER OF COLUMNS DESCRIBED BY THIS DECLARATION IS 3       *
      ******************************************************************
