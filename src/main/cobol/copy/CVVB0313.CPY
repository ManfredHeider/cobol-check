      *---------------------------------------------------------------*
      *    Standard fuer alle Objekte unter PVCS VM
      *            Datum      :  11.05.2011
      *            Kategorie  :  Copystrecke
      *---------------------------------------------------------------*
      *
      *---------------------------------------------------------------*
      *    Copyright (c) 2011 ATLAS Dienstleistungen f. V. GmbH
      *---------------------------------------------------------------*
      *    $Workfile:   CVVB0313.CPY  $
      *    $Revision:   2.1  $
      *
      *    $Log:   L:/mf/CPY/CVVB0313.CPv  $
      *
      *   Rev 2.1   Jul 07 2011 15:49:08   t13ae30
      *AAS00964: Zustrukturierung von Partnern
      *
      *   Rev 2.0   May 11 2011 17:07:34   t13ae30
      *Archiverstellung
      *
      *---------------------------------------------------------------*
      *****************************************************************
      *    ERSTELLT: TH.WILLIG                                        *
      *    DATUM:    30.06.2011                                       *
      *****************************************************************
      * AENDERUNGEN:                                                  *
      * AUFTRAG ! DATUM  !VER ! AENDERUNG                 ! NAME      *
      * --------+--------+----+---------------------------+---------- *
      * AAS00964!30.06.11!2.1 ! NEU                       ! TH.WILLIG *
      *         !        !    !                           !           *
      *         !        !    !                           !           *
      * ENDE-LOGBUCH                                                  *
      *****************************************************************
      * DCLGEN TABLE(VIVB0313) DETAILDW                               *
      *        LIBRARY(P130005.BP010000.SRCDCL(CVVB0313)              *
      *        ACTION(REPLACE)                                        *
      *        QUOTE                                                  *
      * ... DIESES DCLGEN WURDE GENERIERT MIT GENERCBL (REXX)         *
      *****************************************************************

           EXEC SQL DECLARE VIVB0313 TABLE
           ( DETAILDW_BETR               INTEGER NOT NULL
           , DETAILDW_UNTST              INTEGER NOT NULL
           , DETAILDW_JAHR               SMALLINT NOT NULL
           , DETAILDW_MONAT              DATE NOT NULL
           , KTY_WB_TYP                  SMALLINT NOT NULL
           , KNR_WB_TYP                  SMALLINT NOT NULL
           , DETAILDW_LAST_UP            TIMESTAMP NOT NULL
           , DETAILDW_EH                 DECIMAL(10, 1) NOT NULL
           , DETAILDW_BIS                DATE
           ) END-EXEC.

      *****************************************************************
      * COBOL DEKLARATION FÜR VIEW VIVB0313                           *
      *****************************************************************

       01  VIVB0313-GESAMT.
        05 NI-VIVB0313-TAB.
           10 NI-VIVB0313-ELE      PIC S9(04)  BINARY OCCURS   9.
        05 NI-VIVB0313             REDEFINES   NI-VIVB0313-TAB.
           10 NI-DETAILDW-BETR            PIC S9(04)       BINARY.
           10 NI-DETAILDW-UNTST           PIC S9(04)       BINARY.
           10 NI-DETAILDW-JAHR            PIC S9(04)       BINARY.
           10 NI-DETAILDW-MONAT           PIC S9(04)       BINARY.
           10 NI-KTY-WB-TYP               PIC S9(04)       BINARY.
           10 NI-KNR-WB-TYP               PIC S9(04)       BINARY.
           10 NI-DETAILDW-LAST-UP         PIC S9(04)       BINARY.
           10 NI-DETAILDW-EH              PIC S9(04)       BINARY.
           10 NI-DETAILDW-BIS             PIC S9(04)       BINARY.

        05 DCL-VIVB0313.
           10 DETAILDW-BETR               PIC S9(09)       BINARY.
           10 DETAILDW-UNTST              PIC S9(09)       BINARY.
           10 DETAILDW-JAHR               PIC S9(04)       BINARY.
           10 DETAILDW-MONAT              PIC  X(10).
           10 KTY-WB-TYP                  PIC S9(04)       BINARY.
           10 KNR-WB-TYP                  PIC S9(04)       BINARY.
           10 DETAILDW-LAST-UP            PIC  X(26).
           10 DETAILDW-EH                 PIC S9(09)V9(01) COMP-3.
           10 DETAILDW-BIS                PIC  X(10).

      *****************************************************************
      * ANZAHL SPALTEN IN DIESER DEKLARATION :   9                    *
      *****************************************************************
