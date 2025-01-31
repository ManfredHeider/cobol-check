      *---------------------------------------------------------------*
      *    Standard für alle Objekte unter PVCS
      *            Datum   :  Januar 1999
      *            Kopf aus:  N:\PROFILE\KOPFCPY.DAT
      *---------------------------------------------------------------*
      *
      *---------------------------------------------------------------*
      *    Copyright 1999 ATLAS Dienstleistungs GmbH
      *---------------------------------------------------------------*
      *    $Workfile:   CVVB0077.CPY  $
      *    $Revision:   2.2  $
      *
      *    $Log:   L:\MF\CPY\CVVB0077.CPv  $
      *
      *   Rev 2.2   Apr 18 2000 14:58:10   T13AE26
      *ASL00046 Vergessenes Komma ergänzt
      *
      *   Rev 2.1   Apr 18 2000 12:42:54   T13AE26
      *ASL00046 Einführung Förderbonus (Dimension 7)
      *
      *   Rev 2.0   Mar 30 2000 09:38:12   P13SP20
      *Archiverstellung
      *
      *---------------------------------------------------------------*
      ******************************************************************
      * DCLGEN TABLE(VIVB0077)                                         *
      *        LIBRARY(P130005.BP010000.SRCDCL(CVVB0077)               *
      *        ACTION(REPLACE)                                         *
      *        QUOTE                                                   *
      * ... IS THE DCLGEN COMMAND THAT MADE THE FOLLOWING STATEMENTS   *
      ******************************************************************
           EXEC SQL DECLARE VIVB0077 TABLE
           ( ST_NR                       INTEGER NOT NULL,
             FBAZ_ANSPR_VOM              DATE NOT NULL,
             FBAZ_UNTST_NR               INTEGER NOT NULL,
             KNR_ANSPR_FBONUS            SMALLINT NOT NULL,
             FBAZ_LAST_UPDATE            TIMESTAMP NOT NULL,
             KTY_ANSPR_FBONUS            SMALLINT NOT NULL,
             KTY_WAEHRUNG                SMALLINT NOT NULL,
             KNR_WAEHRUNG                SMALLINT NOT NULL,
             FBAZ_ANSPR_BETRAG           DECIMAL(11, 2) NOT NULL,
             KTY_ANSPR_STATUS            SMALLINT NOT NULL,
             KNR_ANSPR_STATUS            SMALLINT NOT NULL
           ) END-EXEC.
      ******************************************************************
      * COBOL DECLARATION FOR TABLE VIVB0077
      ******************************************************************
       01  VIVB0077-GESAMT.
        05  NI-VIVB0077-TAB.
           10 NI-VIVB0077-ELE      PIC S9(04) BINARY OCCURS  11 TIMES.
        05  NI-VIVB0077            REDEFINES   NI-VIVB0077-TAB.
           10 NI-ST-NR                    PIC S9(04)       BINARY.
           10 NI-FBAZ-ANSPR-VOM           PIC S9(04)       BINARY.
           10 NI-FBAZ-UNTST-NR            PIC S9(04)       BINARY.
           10 NI-KNR-ANSPR-FBONUS         PIC S9(04)       BINARY.
           10 NI-FBAZ-LAST-UPDATE         PIC S9(04)       BINARY.
           10 NI-KTY-ANSPR-FBONUS         PIC S9(04)       BINARY.
           10 NI-KTY-WAEHRUNG             PIC S9(04)       BINARY.
           10 NI-KNR-WAEHRUNG             PIC S9(04)       BINARY.
           10 NI-FBAZ-ANSPR-BETRAG        PIC S9(04)       BINARY.
           10 NI-KTY-ANSPR-STATUS         PIC S9(04)       BINARY.
           10 NI-KNR-ANSPR-STATUS         PIC S9(04)       BINARY.

        05  DCL-VIVB0077.
           10 ST-NR                       PIC S9(09)       BINARY.
           10 FBAZ-ANSPR-VOM              PIC X(10).
           10 FBAZ-UNTST-NR               PIC S9(09)       BINARY.
           10 KNR-ANSPR-FBONUS            PIC S9(04)       BINARY.
           10 FBAZ-LAST-UPDATE            PIC X(26).
           10 KTY-ANSPR-FBONUS            PIC S9(04)       BINARY.
           10 KTY-WAEHRUNG                PIC S9(04)       BINARY.
           10 KNR-WAEHRUNG                PIC S9(04)       BINARY.
           10 FBAZ-ANSPR-BETRAG           PIC S9(09)V9(02) USAGE COMP-3.
           10 KTY-ANSPR-STATUS            PIC S9(04)       BINARY.
           10 KNR-ANSPR-STATUS            PIC S9(04)       BINARY.
      ******************************************************************
      * THE NUMBER OF COLUMNS DESCRIBED BY THIS DECLARATION IS 11      *
      ******************************************************************