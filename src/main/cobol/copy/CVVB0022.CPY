      *---------------------------------------------------------------*
      *    Standard für alle Objekte unter PVCS
      *            Datum   :  November 1995
      *            Kopf aus:  N:\PROFILE\KOPFCBL.DAT
      *---------------------------------------------------------------*
      *
      *---------------------------------------------------------------*
      *    Copyright 1995 ATLAS Dienstleistungs GmbH
      *---------------------------------------------------------------*
      *    $Workfile:   CVVB0022.CPY  $
      *    $Revision:   2.0  $
      *
      *    $Log:   L:\MF\CPY\CVVB0022.CPv  $
      *
      *   Rev 2.0   Feb 27 1999 15:56:30   P13SP20
      *NT-Umstellung
      *
      *   Rev 1.0   Nov 04 1995 12:15:44   P13SP13
      *Initial revision.
      *
      *---------------------------------------------------------------*
      ******************************************************************
      * DCLGEN TABLE(VIVB0022)                                         *
      *        LIBRARY(P130005.BP010000.SRCDCL(CVVB0022))              *
      *        ACTION(REPLACE)                                         *
      *        QUOTE                                                   *
      * ... IS THE DCLGEN COMMAND THAT MADE THE FOLLOWING STATEMENTS   *
      ******************************************************************
           EXEC SQL DECLARE VIVB0022 TABLE
           ( EDED_BETR_NR                   INTEGER NOT NULL,
             EDED_UNTST_NR                  INTEGER NOT NULL,
             EDED_DAT_VON                   TIMESTAMP NOT NULL,
             EDED_LAST_UPDATE               TIMESTAMP NOT NULL,
             EDED_DAT_BIS                   DATE NOT NULL,
             KTY_BETR_TYP                   SMALLINT NOT NULL,
             KNR_BETR_TYP                   SMALLINT NOT NULL
           ) END-EXEC.
      ******************************************************************
      * COBOL DECLARATION FOR TABLE VIVB0022                           *
      ******************************************************************
       01  VIVB0022-GESAMT.
        05  NI-VIVB0022-TAB.
           10  NI-VIVB0022-ELE     PIC S9(04)  COMP   OCCURS  7  TIMES.
        05  NI-VIVB0022            REDEFINES   NI-VIVB0022-TAB.
           10 NI-EDED-BETR-NR      PIC S9(04)  COMP.
           10 NI-EDED-UNTST-NR     PIC S9(04)  COMP.
           10 NI-EDED-DAT-VON      PIC S9(04)  COMP.
           10 NI-EDED-LAST-UPDATE  PIC S9(04)  COMP.
           10 NI-EDED-DAT-BIS      PIC S9(04)  COMP.
           10 NI-KTY-BETR-TYP      PIC S9(04)  COMP.
           10 NI-KNR-BETR-TYP      PIC S9(04)  COMP.
        05  DCL-VIVB0022.
           10 EDED-BETR-NR         PIC S9(9) USAGE COMP.
           10 EDED-UNTST-NR        PIC S9(9) USAGE COMP.
           10 EDED-DAT-VON         PIC X(26).
           10 EDED-LAST-UPDATE     PIC X(26).
           10 EDED-DAT-BIS         PIC X(10).
           10 KTY-BETR-TYP         PIC S9(4) USAGE COMP.
           10 KNR-BETR-TYP         PIC S9(4) USAGE COMP.
      ******************************************************************
      * THE NUMBER OF COLUMNS DESCRIBED BY THIS DECLARATION IS 7       *
      ******************************************************************
