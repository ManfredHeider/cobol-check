      *---------------------------------------------------------------*
      *    Standard für alle Objekte unter PVCS
      *            Datum   :  November 1995
      *            Kopf aus:  N:\PROFILE\KOPFCBL.DAT
      *---------------------------------------------------------------*
      *
      *---------------------------------------------------------------*
      *    Copyright 1995 ATLAS Dienstleistungs GmbH
      *---------------------------------------------------------------*
      *    $Workfile:   CVAT0003.CPY  $
      *    $Revision:   2.0  $
      *
      *    $Log:   L:\MF\CPY\CVAT0003.CPv  $
      *
      *   Rev 2.0   Feb 27 1999 11:56:40   P13SP20
      *NT-Umstellung
      *
      *   Rev 1.0   Nov 04 1995 12:05:20   P13SP13
      *Initial revision.
      *
      *---------------------------------------------------------------*
      ******************************************************************
      * DCLGEN TABLE(VIAT0003)                                         *
      *        LIBRARY(P130005.BP010000.SRCDCL(CVAT0003))              *
      *        ACTION(REPLACE)                                         *
      *        QUOTE                                                   *
      * ... IS THE DCLGEN COMMAND THAT MADE THE FOLLOWING STATEMENTS   *
      ******************************************************************
           EXEC SQL DECLARE VIAT0003 TABLE
           ( FKT_PROG_NAME                  CHAR(8) NOT NULL,
             FKT_BILD_ZUSTAND               CHAR(2) NOT NULL,
             FKT_LFD_NR                     SMALLINT NOT NULL,
             FKT_LAST_UPDATE                TIMESTAMP NOT NULL,
             FKT_TEXT                       CHAR(79) NOT NULL
           ) END-EXEC.
      ******************************************************************
      * COBOL DECLARATION FOR TABLE VIAT0003                           *
      ******************************************************************
       01  VIAT0003-GESAMT.
        05  NI-VIAT0003-TAB.
           10 NI-VIAT0003-ELE      PIC S9(04) COMP  OCCURS 5 TIMES.
        05  NI-VIAT0003            REDEFINES  NI-VIAT0003-TAB.
           10 NI-FKT-PROG-NAME     PIC S9(4) USAGE COMP.
           10 NI-FKT-BILD-ZUSTAND  PIC S9(4) USAGE COMP.
           10 NI-FKT-LFD-NR        PIC S9(4) USAGE COMP.
           10 NI-FKT-LAST-UPDATE   PIC S9(4) USAGE COMP.
           10 NI-FKT-TEXT          PIC S9(4) USAGE COMP.
        05 DCL-VIAT0003.
           10 FKT-PROG-NAME        PIC X(8).
           10 FKT-BILD-ZUSTAND     PIC X(2).
           10 FKT-LFD-NR           PIC S9(4) USAGE COMP.
           10 FKT-LAST-UPDATE      PIC X(26).
           10 FKT-TEXT             PIC X(79).
      ******************************************************************
      * THE NUMBER OF COLUMNS DESCRIBED BY THIS DECLARATION IS 4       *
      ******************************************************************
