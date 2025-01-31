      *---------------------------------------------------------------*
      *    Standard für alle Objekte unter PVCS
      *            Datum   :  November 1995
      *            Kopf aus:  N:\PROFILE\KOPFCBL.DAT
      *---------------------------------------------------------------*
      *
      *---------------------------------------------------------------*
      *    Copyright 1995 ATLAS Dienstleistungs GmbH
      *---------------------------------------------------------------*
      *    $Workfile:   CVAT0002.CPY  $
      *    $Revision:   2.0  $
      *
      *    $Log:   L:\MF\CPY\CVAT0002.CPv  $
      *
      *   Rev 2.0   Feb 27 1999 11:56:40   P13SP20
      *NT-Umstellung
      *
      *   Rev 1.0   Nov 04 1995 12:05:06   P13SP13
      *Initial revision.
      *
      *---------------------------------------------------------------*
      ******************************************************************
      * DCLGEN TABLE(VIAT0002)                                         *
      *        LIBRARY(P130005.BP010000.SRCDCL(CVAT0002))              *
      *        ACTION(REPLACE)                                         *
      *        QUOTE                                                   *
      * ... IS THE DCLGEN COMMAND THAT MADE THE FOLLOWING STATEMENTS   *
      ******************************************************************
           EXEC SQL DECLARE VIAT0002 TABLE
           ( ERR_PROG_NAME                  CHAR(8) NOT NULL,
             ERR_TYP                        CHAR(1) NOT NULL,
             ERR_NR                         SMALLINT NOT NULL,
             ERR_LAST_UPDATE                TIMESTAMP NOT NULL,
             ERR_TEXT                       CHAR(70) NOT NULL
           ) END-EXEC.
      ******************************************************************
      * COBOL DECLARATION FOR TABLE VIAT0002                           *
      ******************************************************************
       01  VIAT0002-GESAMT.
        05  NI-VIAT0002-TAB.
           10 NI-VIAT0002-ELE      PIC S9(04) COMP  OCCURS 5 TIMES.
        05  NI-VIAT0002            REDEFINES  NI-VIAT0002-TAB.
           10 NI-ERR-PROG-NAME     PIC S9(4) USAGE COMP.
           10 NI-ERR-TYP           PIC S9(4) USAGE COMP.
           10 NI-ERR-NR            PIC S9(4) USAGE COMP.
           10 NI-ERR-LAST-UPDATE   PIC S9(4) USAGE COMP.
           10 NI-ERR-TEXT          PIC S9(4) USAGE COMP.
        05 DCL-VIAT0002.
           10 ERR-PROG-NAME        PIC X(8).
           10 ERR-TYP              PIC X(1).
           10 ERR-NR               PIC S9(4) USAGE COMP.
           10 ERR-LAST-UPDATE      PIC X(26).
           10 ERR-TEXT             PIC X(70).
      ******************************************************************
      * THE NUMBER OF COLUMNS DESCRIBED BY THIS DECLARATION IS 4       *
      ******************************************************************
