      *---------------------------------------------------------------*
      *    Standard fuer alle Objekte unter PVCS VM
      *            Datum      :  03.05.2011
      *            Kategorie  :  Copystrecke
      *---------------------------------------------------------------*
      *
      *---------------------------------------------------------------*
      *    Copyright (c) 2011 ATLAS Dienstleistungen f. V. GmbH
      *---------------------------------------------------------------*
      *    $Workfile:   CVVB0310.CPY  $
      *    $Revision:   2.1  $
      *
      *    $Log:   L:/mf/CPY/CVVB0310.CPv  $
      *
      *   Rev 2.1   Jul 22 2011 10:38:32   t13ex13
      *ASL00382: RGT: PGM Ermittlung
      *
      *   Rev 2.0   May 03 2011 16:21:42   t13ex13
      *Archiverstellung
      *
      *---------------------------------------------------------------*
      *****************************************************************
      *    ERSTELLT: GUTFLEISCH                                       *
      *    DATUM:    03.05.2011                                       *
      *****************************************************************
      * AENDERUNGEN:                                                  *
      * AUFTRAG ! DATUM  !VER ! AENDERUNG                 ! NAME      *
      * --------+--------+----+---------------------------+---------- *
      * ASL00382!03.05.11!2.1 ! NEU                       ! GUTFLEISCH*
      *         !        !    !                           !           *
      *         !        !    !                           !           *
      * ENDE-LOGBUCH                                                  *
      *****************************************************************
      * DCLGEN TABLE(VIVB0310) FPA                                    *
      *        LIBRARY(P130005.BP010000.SRCDCL(CVVB0310)              *
      *        ACTION(REPLACE)                                        *
      *        QUOTE                                                  *
      * ... DIESES DCLGEN WURDE GENERIERT MIT GENERCBL (REXX)         *
      *****************************************************************

           EXEC SQL DECLARE VIVB0310 TABLE
           ( MA_ST_NR                    INTEGER NOT NULL
           , FPA_ANSPR_VOM               DATE NOT NULL
           , KNR_ANSPR_GRUND             SMALLINT NOT NULL
           , KTY_ANSPR_GRUND             SMALLINT NOT NULL
           , FPA_LAST_UPDATE             TIMESTAMP NOT NULL
           , KTY_WAEHRUNG                SMALLINT NOT NULL
           , KNR_WAEHRUNG                SMALLINT NOT NULL
           , FPA_ANSPR_BETRAG            DECIMAL(11, 2) NOT NULL
           , KTY_ANSPR_STATUS            SMALLINT NOT NULL
           , KNR_ANSPR_STATUS            SMALLINT NOT NULL
           ) END-EXEC.

      *****************************************************************
      * COBOL DEKLARATION FÜR VIEW VIVB0310                           *
      *****************************************************************

       01  VIVB0310-GESAMT.
        05 NI-VIVB0310-TAB.
           10 NI-VIVB0310-ELE      PIC S9(04)  BINARY OCCURS  10.
        05 NI-VIVB0310             REDEFINES   NI-VIVB0310-TAB.
           10 NI-MA-ST-NR                 PIC S9(04)       BINARY.
           10 NI-FPA-ANSPR-VOM            PIC S9(04)       BINARY.
           10 NI-KNR-ANSPR-GRUND          PIC S9(04)       BINARY.
           10 NI-KTY-ANSPR-GRUND          PIC S9(04)       BINARY.
           10 NI-FPA-LAST-UPDATE          PIC S9(04)       BINARY.
           10 NI-KTY-WAEHRUNG             PIC S9(04)       BINARY.
           10 NI-KNR-WAEHRUNG             PIC S9(04)       BINARY.
           10 NI-FPA-ANSPR-BETRAG         PIC S9(04)       BINARY.
           10 NI-KTY-ANSPR-STATUS         PIC S9(04)       BINARY.
           10 NI-KNR-ANSPR-STATUS         PIC S9(04)       BINARY.

        05 DCL-VIVB0310.
           10 MA-ST-NR                    PIC S9(09)       BINARY.
           10 FPA-ANSPR-VOM               PIC  X(10).
           10 KNR-ANSPR-GRUND             PIC S9(04)       BINARY.
           10 KTY-ANSPR-GRUND             PIC S9(04)       BINARY.
           10 FPA-LAST-UPDATE             PIC  X(26).
           10 KTY-WAEHRUNG                PIC S9(04)       BINARY.
           10 KNR-WAEHRUNG                PIC S9(04)       BINARY.
           10 FPA-ANSPR-BETRAG            PIC S9(09)V9(02) COMP-3.
           10 KTY-ANSPR-STATUS            PIC S9(04)       BINARY.
           10 KNR-ANSPR-STATUS            PIC S9(04)       BINARY.

      *****************************************************************
      * ANZAHL SPALTEN IN DIESER DEKLARATION :  10                    *
      *****************************************************************
