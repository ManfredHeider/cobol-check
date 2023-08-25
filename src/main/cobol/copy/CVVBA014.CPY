      *---------------------------------------------------------------*
      *    Standard fuer alle Objekte unter PVCS VersionManager
      *            Datum      :  08.01.2019
      *            Kategorie  :  Copystrecke
      *---------------------------------------------------------------*
      *    Copyright (c) 2019 ATLAS Dienstleistungen f. V. GmbH
      *---------------------------------------------------------------*
      *    $Workfile:   CVVBA014.CPY  $
      *    $Revision:   2.1  $
      *
      *    $Log:   L:/mf/CPY/CVVBA014.CPv  $
      *
      *   Rev 2.1   Jan 08 2019 16:15:38   t13ae56
      *ACV00185: PGM - Vertragsrückläufer
      *
      *   Rev 2.0   Jan 08 2019 14:06:56   t13ae56
      *Archiverstellung
      *
      *---------------------------------------------------------------*
      *****************************************************************
      *    ERSTELLT: KLEEMEIER                                        *
      *    DATUM:    08.01.2019                                       *
      *****************************************************************
      * AENDERUNGEN:                                                  *
      * AUFTRAG ! DATUM  !VER ! AENDERUNG                 ! NAME      *
      * --------+--------+----+---------------------------+---------- *
      * ACV00185!08.01.19!2.1 ! NEU                       ! KLEEMEIER *
      *         !        !    !                           !           *
      *         !        !    !                           !           *
      * ENDE-LOGBUCH                                                  *
      *****************************************************************
      * DCLGEN TABLE(VIVBA014) ALIAS                                  *
      *        LIBRARY(P130005.BP010000.SRCDCL(CVVBA014)              *
      *        ACTION(REPLACE)                                        *
      *        QUOTE                                                  *
      * ... DIESES DCLGEN WURDE GENERIERT MIT GENERCBL (REXX)         *
      *****************************************************************

           EXEC SQL DECLARE VIVBA014 TABLE
           ( MAN_BEZUGS_NR               INTEGER NOT NULL
           , MAN_DAT_VON                 TIMESTAMP NOT NULL
           , MAN_LAST_UPDATE             TIMESTAMP NOT NULL
           , MAN_DAT_BIS                 DATE NOT NULL
           , KTY_BEZUGS_TYP              SMALLINT NOT NULL
           , KNR_BEZUGS_TYP              SMALLINT NOT NULL
           , MAN_GEBURTSDAT              DATE
           , KTY_ANREDE                  SMALLINT NOT NULL
           , KNR_ANREDE                  SMALLINT NOT NULL
           , MAN_TITEL_ADEL              CHAR(10) NOT NULL
           , MAN_TITEL_AKAD              CHAR(10) NOT NULL
           , MAN_NAME                    CHAR(40) NOT NULL
           , MAN_VORNAME                 CHAR(20) NOT NULL
           , MAN_NAME_GK                 CHAR(40) NOT NULL
           , MAN_VORNAME_GK              CHAR(20) NOT NULL
           ) END-EXEC.

      *****************************************************************
      * COBOL DEKLARATION FÜR VIEW VIVBA014                           *
      *****************************************************************

       01  VIVBA014-GESAMT.
        05 NI-VIVBA014-TAB.
           10 NI-VIVBA014-ELE      PIC S9(04)  BINARY OCCURS  15.
        05 NI-VIVBA014             REDEFINES   NI-VIVBA014-TAB.
           10 NI-MAN-BEZUGS-NR            PIC S9(04)       BINARY.
           10 NI-MAN-DAT-VON              PIC S9(04)       BINARY.
           10 NI-MAN-LAST-UPDATE          PIC S9(04)       BINARY.
           10 NI-MAN-DAT-BIS              PIC S9(04)       BINARY.
           10 NI-KTY-BEZUGS-TYP           PIC S9(04)       BINARY.
           10 NI-KNR-BEZUGS-TYP           PIC S9(04)       BINARY.
           10 NI-MAN-GEBURTSDAT           PIC S9(04)       BINARY.
           10 NI-KTY-ANREDE               PIC S9(04)       BINARY.
           10 NI-KNR-ANREDE               PIC S9(04)       BINARY.
           10 NI-MAN-TITEL-ADEL           PIC S9(04)       BINARY.
           10 NI-MAN-TITEL-AKAD           PIC S9(04)       BINARY.
           10 NI-MAN-NAME                 PIC S9(04)       BINARY.
           10 NI-MAN-VORNAME              PIC S9(04)       BINARY.
           10 NI-MAN-NAME-GK              PIC S9(04)       BINARY.
           10 NI-MAN-VORNAME-GK           PIC S9(04)       BINARY.

        05 DCL-VIVBA014.
           10 MAN-BEZUGS-NR               PIC S9(09)       BINARY.
           10 MAN-DAT-VON                 PIC  X(26).
           10 MAN-LAST-UPDATE             PIC  X(26).
           10 MAN-DAT-BIS                 PIC  X(10).
           10 KTY-BEZUGS-TYP              PIC S9(04)       BINARY.
           10 KNR-BEZUGS-TYP              PIC S9(04)       BINARY.
           10 MAN-GEBURTSDAT              PIC  X(10).
           10 KTY-ANREDE                  PIC S9(04)       BINARY.
           10 KNR-ANREDE                  PIC S9(04)       BINARY.
           10 MAN-TITEL-ADEL              PIC  X(10).
           10 MAN-TITEL-AKAD              PIC  X(10).
           10 MAN-NAME                    PIC  X(40).
           10 MAN-VORNAME                 PIC  X(20).
           10 MAN-NAME-GK                 PIC  X(40).
           10 MAN-VORNAME-GK              PIC  X(20).

      *****************************************************************
      * ANZAHL SPALTEN IN DIESER DEKLARATION :  15                    *
      *****************************************************************

