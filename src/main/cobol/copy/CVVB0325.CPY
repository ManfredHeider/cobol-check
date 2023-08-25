      *---------------------------------------------------------------*
      *    Standard fuer alle Objekte unter PVCS VersionManager
      *            Datum      :  10.01.2018
      *            Kategorie  :  Copystrecke
      *---------------------------------------------------------------*
      *    Copyright (c) 2018 ATLAS Dienstleistungen f. V. GmbH
      *---------------------------------------------------------------*
      *    $Workfile:   CVVB0325.CPY  $
      *    $Revision:   2.1  $
      *
      *    $Log:   L:/mf/CPY/CVVB0325.CPv  $
      *
      *   Rev 2.1   Jan 17 2018 14:15:14   t13ae30
      *AAS01225: Programme - TWI
      *
      *   Rev 2.0   Jan 10 2018 14:16:46   t13ae30
      *Archiverstellung
      *
      *---------------------------------------------------------------*
      *****************************************************************
      *    ERSTELLT: TH.WILLIG                                        *
      *    DATUM:    10.01.2018                                       *
      *****************************************************************
      * AENDERUNGEN:                                                  *
      * AUFTRAG ! DATUM  !VER ! AENDERUNG                 ! NAME      *
      * --------+--------+----+---------------------------+---------- *
      * AAS01225!10.01.17!2.1 ! NEU                       ! TH.WILLIG *
      *         !        !    !                           !           *
      *         !        !    !                           !           *
      * ENDE-LOGBUCH                                                  *
      *****************************************************************
      * DCLGEN TABLE(VIVB0325) DETAILDW                               *
      *        LIBRARY(P130005.BP010000.SRCDCL(CVVB0325)              *
      *        ACTION(REPLACE)                                        *
      *        QUOTE                                                  *
      * ... DIESES DCLGEN WURDE GENERIERT MIT GENERCBL (REXX)         *
      *****************************************************************

           EXEC SQL DECLARE VIVB0325 TABLE
           ( DETAILST_BETR               INTEGER NOT NULL
           , DETAILST_UNTST              INTEGER NOT NULL
           , DETAILST_JAHR               SMALLINT NOT NULL
           , DETAILST_MONAT              DATE NOT NULL
           , KTY_WB_TYP                  SMALLINT NOT NULL
           , KNR_WB_TYP                  SMALLINT NOT NULL
           , DETAILST_LAST_UP            TIMESTAMP NOT NULL
           , DETAILST_EH                 DECIMAL(10, 1) NOT NULL
           , DETAILST_BIS                DATE
           ) END-EXEC.

      *****************************************************************
      * COBOL DEKLARATION FÜR VIEW VIVB0325                           *
      *****************************************************************

       01  VIVB0325-GESAMT.
        05 NI-VIVB0325-TAB.
           10 NI-VIVB0325-ELE      PIC S9(04)  BINARY OCCURS   9.
        05 NI-VIVB0325             REDEFINES   NI-VIVB0325-TAB.
           10 NI-DETAILST-BETR            PIC S9(04)       BINARY.
           10 NI-DETAILST-UNTST           PIC S9(04)       BINARY.
           10 NI-DETAILST-JAHR            PIC S9(04)       BINARY.
           10 NI-DETAILST-MONAT           PIC S9(04)       BINARY.
           10 NI-KTY-WB-TYP               PIC S9(04)       BINARY.
           10 NI-KNR-WB-TYP               PIC S9(04)       BINARY.
           10 NI-DETAILST-LAST-UP         PIC S9(04)       BINARY.
           10 NI-DETAILST-EH              PIC S9(04)       BINARY.
           10 NI-DETAILST-BIS             PIC S9(04)       BINARY.

        05 DCL-VIVB0325.
           10 DETAILST-BETR               PIC S9(09)       BINARY.
           10 DETAILST-UNTST              PIC S9(09)       BINARY.
           10 DETAILST-JAHR               PIC S9(04)       BINARY.
           10 DETAILST-MONAT              PIC  X(10).
           10 KTY-WB-TYP                  PIC S9(04)       BINARY.
           10 KNR-WB-TYP                  PIC S9(04)       BINARY.
           10 DETAILST-LAST-UP            PIC  X(26).
           10 DETAILST-EH                 PIC S9(09)V9(01) COMP-3.
           10 DETAILST-BIS                PIC  X(10).

      *****************************************************************
      * ANZAHL SPALTEN IN DIESER DEKLARATION :   9                    *
      *****************************************************************

