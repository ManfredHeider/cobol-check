      *---------------------------------------------------------------*
      *    Standard für alle Objekte unter PVCS
      *            Datum   :  November 1995
      *            Kopf aus:  N:\PROFILE\KOPFCBL.DAT
      *---------------------------------------------------------------*
      *
      *---------------------------------------------------------------*
      *    Copyright 1995 ATLAS Dienstleistungs GmbH
      *---------------------------------------------------------------*
      *    $Workfile:   CTVB0016.CPY  $
      *    $Revision:   2.0  $
      *
      *    $Log:   L:\MF\CPY\CTVB0016.CPv  $
      *
      *   Rev 2.0   Feb 27 1999 15:56:04   P13SP20
      *NT-Umstellung
      *
      *   Rev 1.0   Nov 04 1995 11:54:42   P13SP13
      *Initial revision.
      *
      *---------------------------------------------------------------*
      ******************************************************************
      * DCLGEN TABLE(TBVB0016)                                         *
      *        LIBRARY(P130005.BP010000.SRCDCL(CTVB0016))              *
      *        ACTION(REPLACE)                                         *
      *        QUOTE                                                   *
      * ... IS THE DCLGEN COMMAND THAT MADE THE FOLLOWING STATEMENTS   *
      ******************************************************************
           EXEC SQL DECLARE TBVB0016 TABLE
           ( MA_ST_NR                       INTEGER NOT NULL,
             MS_NR                          SMALLINT NOT NULL,
             BS_NR                          SMALLINT NOT NULL,
             MSBZ_DAT_VON                   TIMESTAMP NOT NULL,
             IA_DAT_VON                     TIMESTAMP NOT NULL,
             IA_LAST_UPDATE                 TIMESTAMP NOT NULL,
             IA_DAT_BIS                     DATE NOT NULL
           ) END-EXEC.
      ******************************************************************
      * COBOL DECLARATION FOR TABLE TBVB0016                           *
      ******************************************************************
       01  TBVB0016-GESAMT.
        05  NI-TBVB0016-TAB.
           10  NI-TBVB0016-ELE     PIC S9(04)  COMP   OCCURS  7  TIMES.
        05  NI-TBVB0016            REDEFINES   NI-TBVB0016-TAB.
           10 NI-MA-ST-NR          PIC S9(04)  COMP.
           10 NI-MS-NR             PIC S9(04)  COMP.
           10 NI-BS-NR             PIC S9(04)  COMP.
           10 NI-MSBZ-DAT-VON      PIC S9(04)  COMP.
           10 NI-IA-DAT-VON        PIC S9(04)  COMP.
           10 NI-IA-LAST-UPDATE    PIC S9(04)  COMP.
           10 NI-IA-DAT-BIS        PIC S9(04)  COMP.
        05  DCL-TBVB0016.
           10 MA-ST-NR             PIC S9(9) USAGE COMP.
           10 MS-NR                PIC S9(4) USAGE COMP.
           10 BS-NR                PIC S9(4) USAGE COMP.
           10 MSBZ-DAT-VON         PIC X(26).
           10 IA-DAT-VON           PIC X(26).
           10 IA-LAST-UPDATE       PIC X(26).
           10 IA-DAT-BIS           PIC X(10).
      ******************************************************************
      * THE NUMBER OF COLUMNS DESCRIBED BY THIS DECLARATION IS 7       *
      ******************************************************************
