      *---------------------------------------------------------------*
      *    Standard für alle Objekte unter PVCS
      *            Datum   :  November 1995
      *            Kopf aus:  N:\PROFILE\KOPFCBL.DAT
      *---------------------------------------------------------------*
      *
      *---------------------------------------------------------------*
      *    Copyright 1995 ATLAS Dienstleistungs GmbH
      *---------------------------------------------------------------*
      *    $Workfile:   CTAT0007.CPY  $
      *    $Revision:   2.0  $
      *
      *    $Log:   L:\MF\CPY\CTAT0007.CPv  $
      *
      *   Rev 2.0   Feb 27 1999 11:56:36   P13SP20
      *NT-Umstellung
      *
      *   Rev 1.0   Nov 04 1995 11:47:42   P13SP13
      *Initial revision.
      *
      *---------------------------------------------------------------*
      ******************************************************************
      * DCLGEN TABLE(TBAT0007)                                         *
      *        LIBRARY(P130005.BP010000.SRCDCL(CTVB0091))              *
      *        ACTION(REPLACE)                                         *
      *        QUOTE                                                   *
      * ... IS THE DCLGEN COMMAND THAT MADE THE FOLLOWING STATEMENTS   *
      ******************************************************************
           EXEC SQL DECLARE TBAT0007 TABLE
           ( KTY_NR                         SMALLINT NOT NULL,
             KTY_LAST_UPDATE                TIMESTAMP NOT NULL,
             KTY_BEZ                        CHAR(40) NOT NULL
           ) END-EXEC.
      ******************************************************************
      * COBOL DECLARATION FOR TABLE TBAT0007                           *
      ******************************************************************
       01  TBAT0007-GESAMT.
        05  NI-TBAT0007-TAB.
           10  NI-TBAT0007-ELE     PIC S9(04)  COMP   OCCURS  3  TIMES.
        05  NI-TBAT0007            REDEFINES   NI-TBAT0007-TAB.
           10 NI-KTY-NR            PIC S9(04)  COMP.
           10 NI-KTY-LAST-UPDATE   PIC S9(04)  COMP.
           10 NI-KTY-BEZ           PIC S9(04)  COMP.
        05  DCL-TBAT0007.
           10 KTY-NR               PIC S9(4) USAGE COMP.
           10 KTY-LAST-UPDATE      PIC X(26).
           10 KTY-BEZ              PIC X(40).
      ******************************************************************
      * THE NUMBER OF COLUMNS DESCRIBED BY THIS DECLARATION IS 2       *
      ******************************************************************
