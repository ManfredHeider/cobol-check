      *---------------------------------------------------------------*
      *    Standard fuer alle Objekte unter PVCS VM
      *            Datum      :  30.03.2017
      *            Kategorie  :  Copystrecke
      *---------------------------------------------------------------*
      *    Copyright (c) 2017 ATLAS Dienstleistungen f. V. GmbH
      *---------------------------------------------------------------*
      *    $Workfile:   CVVBA205.CPY  $
      *    $Revision:   2.1  $
      *
      *    $Log:   L:/mf/CPY/CVVBA205.CPv  $
      *
      *   Rev 2.1   Jun 01 2017 14:48:34   t13ae30
      *ASL00567: Anpassen QED Ermittlung - TWI
      *
      *   Rev 2.0   Mar 30 2017 14:21:30   t13ae30
      *Archiverstellung
      *
      *---------------------------------------------------------------*
      *****************************************************************
      *    ERSTELLT: WILLIG                                           *
      *    DATUM:    06.04.2017                                       *
      *****************************************************************
      * AENDERUNGEN:                                                  *
      * AUFTRAG ! DATUM  !VER ! AENDERUNG                 ! NAME      *
      * --------+--------+----+---------------------------+---------- *
      * ASL00567!06.04.17!2.1 ! NEU                       ! WILLIG    *
      *         !        !    !                           !           *
      *         !        !    !                           !           *
      * ENDE-LOGBUCH                                                  *
      *****************************************************************
      * DCLGEN TABLE(VIVBA205) QEDD                                   *
      *        LIBRARY(P130005.BP010000.SRCDCL(CVVBA205)              *
      *        ACTION(REPLACE)                                        *
      *        QUOTE                                                  *
      * ... DIESES DCLGEN WURDE GENERIERT MIT GENERCBL (REXX)         *
      *****************************************************************

           EXEC SQL DECLARE VIVBA205 TABLE
           ( MA_ST_NR                    INTEGER NOT NULL
           , ED_ST_NR                    INTEGER NOT NULL
           , QEDD_ED_ZUSATZ              SMALLINT NOT NULL
           , ED_GENERATION               SMALLINT NOT NULL
           , QEDD_DATUM                  DATE NOT NULL
           , QEDD_ED_EINH                DECIMAL(10, 1) NOT NULL
           , QEDD_EINH_MAX               DECIMAL(10, 1) NOT NULL
           , QEDD_EINH_GEW               DECIMAL(10, 1) NOT NULL
           , QEDD_ANSPR_BETRAG           DECIMAL(11, 2) NOT NULL
           , KTY_WAEHRUNG                SMALLINT NOT NULL
           , KNR_WAEHRUNG                SMALLINT NOT NULL
           , DL_NET_GES_EH               DECIMAL(10, 1) NOT NULL
           , DL_EH_MAX_PROZ              DECIMAL(06, 3)
           , ED_EINH_FAKTOR              DECIMAL(06, 3) NOT NULL
           , QUARTAL                     CHAR(17) NOT NULL
           , QEDD_LAST_UPDATE            TIMESTAMP NOT NULL
           , KTY_UST_KZ                  SMALLINT NOT NULL
           , KNR_UST_KZ                  SMALLINT NOT NULL
           ) END-EXEC.

      *****************************************************************
      * COBOL DEKLARATION FÜR VIEW VIVBA205                           *
      *****************************************************************

       01  VIVBA205-GESAMT.
        05 NI-VIVBA205-TAB.
           10 NI-VIVBA205-ELE      PIC S9(04)  BINARY OCCURS  18.
        05 NI-VIVBA205             REDEFINES   NI-VIVBA205-TAB.
           10 NI-MA-ST-NR                 PIC S9(04)       BINARY.
           10 NI-ED-ST-NR                 PIC S9(04)       BINARY.
           10 NI-QEDD-ED-ZUSATZ           PIC S9(04)       BINARY.
           10 NI-ED-GENERATION            PIC S9(04)       BINARY.
           10 NI-QEDD-DATUM               PIC S9(04)       BINARY.
           10 NI-QEDD-ED-EINH             PIC S9(04)       BINARY.
           10 NI-QEDD-EINH-MAX            PIC S9(04)       BINARY.
           10 NI-QEDD-EINH-GEW            PIC S9(04)       BINARY.
           10 NI-QEDD-ANSPR-BETRAG        PIC S9(04)       BINARY.
           10 NI-KTY-WAEHRUNG             PIC S9(04)       BINARY.
           10 NI-KNR-WAEHRUNG             PIC S9(04)       BINARY.
           10 NI-DL-NET-GES-EH            PIC S9(04)       BINARY.
           10 NI-DL-EH-MAX-PROZ           PIC S9(04)       BINARY.
           10 NI-ED-EINH-FAKTOR           PIC S9(04)       BINARY.
           10 NI-QUARTAL                  PIC S9(04)       BINARY.
           10 NI-QEDD-LAST-UPDATE         PIC S9(04)       BINARY.
           10 NI-KTY-UST-KZ               PIC S9(04)       BINARY.
           10 NI-KNR-UST-KZ               PIC S9(04)       BINARY.

        05 DCL-VIVBA205.
           10 MA-ST-NR                    PIC S9(09)       BINARY.
           10 ED-ST-NR                    PIC S9(09)       BINARY.
           10 QEDD-ED-ZUSATZ              PIC S9(04)       BINARY.
           10 ED-GENERATION               PIC S9(04)       BINARY.
           10 QEDD-DATUM                  PIC  X(10).
           10 QEDD-ED-EINH                PIC S9(09)V9(01) COMP-3.
           10 QEDD-EINH-MAX               PIC S9(09)V9(01) COMP-3.
           10 QEDD-EINH-GEW               PIC S9(09)V9(01) COMP-3.
           10 QEDD-ANSPR-BETRAG           PIC S9(09)V9(02) COMP-3.
           10 KTY-WAEHRUNG                PIC S9(04)       BINARY.
           10 KNR-WAEHRUNG                PIC S9(04)       BINARY.
           10 DL-NET-GES-EH               PIC S9(09)V9(01) COMP-3.
           10 DL-EH-MAX-PROZ              PIC S9(03)V9(03) COMP-3.
           10 ED-EINH-FAKTOR              PIC S9(03)V9(03) COMP-3.
           10 QUARTAL                     PIC  X(17).
           10 QEDD-LAST-UPDATE            PIC  X(26).
           10 KTY-UST-KZ                  PIC S9(04)       BINARY.
           10 KNR-UST-KZ                  PIC S9(04)       BINARY.

      *****************************************************************
      * ANZAHL SPALTEN IN DIESER DEKLARATION :  18                    *
      *****************************************************************

