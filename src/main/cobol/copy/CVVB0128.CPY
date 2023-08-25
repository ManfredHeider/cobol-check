      *---------------------------------------------------------------*
      *    Standard fuer alle Objekte unter PVCS VM
      *            Datum      :  01.12.2017
      *            Kategorie  :  Copystrecke
      *---------------------------------------------------------------*
      *    Copyright (c) 2017 ATLAS Dienstleistungen f. V. GmbH
      *---------------------------------------------------------------*
      *    $Workfile:   CVVB0128.CPY  $
      *    $Revision:   2.3  $
      *
      *    $Log:   L:/mf/CPY/CVVB0128.CPv  $
      *
      *   Rev 2.3   Dec 07 2018 14:31:06   t13ex18
      *AVB01456: Nachfolgeregelungen Zugriiffsmodul TBVB0128
      *
      *   Rev 2.2   Aug 16 2018 12:52:48   t13ex18
      *AVB01456: Nachfolgeregelungen Tabellen NRB, NRP, NRPF
      *
      *   Rev 2.1   02 Aug 2018 16:17:04   t13ae13
      *AVB01456: Nachfolgeregelungen Tabellen NRB, NRP, NRPF
      *
      *   Rev 2.0   Dec 01 2017 12:59:12   t13ae13
      *Archiverstellung
      *
      *---------------------------------------------------------------*
      *****************************************************************
      *    ERSTELLT: WALB                                             *
      *    DATUM:    04.12.2017                                       *
      *****************************************************************
      * AENDERUNGEN:                                                  *
      * AUFTRAG ! DATUM  !VER ! AENDERUNG                 ! NAME      *
      * --------+--------+----+---------------------------+---------- *
      * AVB01456!04.12.17!2.1 ! NEU                       ! WALB      *
      *         !        !    !                           !           *
      *         !        !    !                           !           *
      * ENDE-LOGBUCH                                                  *
      *****************************************************************
      * DCLGEN TABLE(VIVB0128) ALIAS                               *
      *        LIBRARY(P130005.BP010000.SRCDCL(CVVB0128)              *
      *        ACTION(REPLACE)                                        *
      *        QUOTE                                                  *
      * ... DIESES DCLGEN WURDE GENERIERT MIT GENERCBL (REXX)         *
      *****************************************************************
 
           EXEC SQL DECLARE VIVB0128 TABLE
           ( NRPF_ABGEB_NR               INTEGER NOT NULL
           , NRPF_AUFNEHM_NR             INTEGER NOT NULL
           , KTY_NR_TYP                  SMALLINT NOT NULL
           , KNR_NR_TYP                  SMALLINT NOT NULL
           , NRPF_DAT_VON                DATE NOT NULL
           , KTY_NRPF_TYP                SMALLINT NOT NULL
           , KNR_NRPF_TYP                SMALLINT NOT NULL
           , NRPF_LAST_UPDATE            TIMESTAMP NOT NULL
           , NRPF_ZAHLUNG1               DATE
           , NRPF_BETRAG1                DECIMAL(11, 2)
           , NRPF_ZAHLUNG2               DATE
           , NRPF_BETRAG2                DECIMAL(11, 2)
           , NRPF_ZAHLUNG3               DATE
           , NRPF_BETRAG3                DECIMAL(11, 2)
           , NRPF_ZAHLUNG4               DATE
           , NRPF_BETRAG4                DECIMAL(11, 2)
           , NRPF_ZAHLUNG5               DATE
           , NRPF_BETRAG5                DECIMAL(11, 2)
           , NRPF_DAUER                  SMALLINT NOT NULL
           , NRPF_ABSCHL_VON             DATE
           , NRPF_ABSCHL_BIS             DATE
           , NRPF_ABSCHL_ZAHLG           DECIMAL(11, 2)
           , NRPF_P_ABGEB                SMALLINT NOT NULL
           , NRPF_ERHANSPR               CHAR(01) NOT NULL
           , NRPF_P_AUFNEHM              SMALLINT NOT NULL
           , NRPF_PSTUFE_1               SMALLINT NOT NULL
           , NRPF_PDAT_RECH_1            DATE NOT NULL
           , NRPF_PDAT_TATS_1            DATE
           , NRPF_FAKTOR_1               DECIMAL(05, 2)
           , NRPF_PDAT_VERL_1            DATE
           , NRPF_PSTUFE_2               SMALLINT
           , NRPF_PDAT_RECH_2            DATE
           , NRPF_PDAT_TATS_2            DATE
           , NRPF_FAKTOR_2               DECIMAL(05, 2)
           , NRPF_PDAT_VERL_2            DATE
           , NRPF_PSTUFE_3               SMALLINT
           , NRPF_PDAT_RECH_3            DATE
           , NRPF_PDAT_TATS_3            DATE
           , NRPF_FAKTOR_3               DECIMAL(05, 2)
           , NRPF_PDAT_VERL_3            DATE
           , NRPF_VB_EIGEN               INTEGER
           , NRPF_VB_GRUPPE              INTEGER
           , ZUGANG                      TIMESTAMP NOT NULL
           , VON                         TIMESTAMP NOT NULL
           , BIS                         TIMESTAMP NOT NULL
           ) END-EXEC.
 
      *****************************************************************
      * COBOL DEKLARATION FÜR VIEW VIVB0128                           *
      *****************************************************************
 
       01  VIVB0128-GESAMT.
        05 NI-VIVB0128-TAB.
           10 NI-VIVB0128-ELE      PIC S9(04)  BINARY OCCURS  45.
        05 NI-VIVB0128             REDEFINES   NI-VIVB0128-TAB.
           10 NI-NRPF-ABGEB-NR            PIC S9(04)       BINARY.
           10 NI-NRPF-AUFNEHM-NR          PIC S9(04)       BINARY.
           10 NI-KTY-NR-TYP               PIC S9(04)       BINARY.
           10 NI-KNR-NR-TYP               PIC S9(04)       BINARY.
           10 NI-NRPF-DAT-VON             PIC S9(04)       BINARY.
           10 NI-KTY-NRPF-TYP             PIC S9(04)       BINARY.
           10 NI-KNR-NRPF-TYP             PIC S9(04)       BINARY.
           10 NI-NRPF-LAST-UPDATE         PIC S9(04)       BINARY.
           10 NI-NRPF-ZAHLUNG1            PIC S9(04)       BINARY.
           10 NI-NRPF-BETRAG1             PIC S9(04)       BINARY.
           10 NI-NRPF-ZAHLUNG2            PIC S9(04)       BINARY.
           10 NI-NRPF-BETRAG2             PIC S9(04)       BINARY.
           10 NI-NRPF-ZAHLUNG3            PIC S9(04)       BINARY.
           10 NI-NRPF-BETRAG3             PIC S9(04)       BINARY.
           10 NI-NRPF-ZAHLUNG4            PIC S9(04)       BINARY.
           10 NI-NRPF-BETRAG4             PIC S9(04)       BINARY.
           10 NI-NRPF-ZAHLUNG5            PIC S9(04)       BINARY.
           10 NI-NRPF-BETRAG5             PIC S9(04)       BINARY.
           10 NI-NRPF-DAUER               PIC S9(04)       BINARY.
           10 NI-NRPF-ABSCHL-VON          PIC S9(04)       BINARY.
           10 NI-NRPF-ABSCHL-BIS          PIC S9(04)       BINARY.
           10 NI-NRPF-ABSCHL-ZAHLG        PIC S9(04)       BINARY.
           10 NI-NRPF-P-ABGEB             PIC S9(04)       BINARY.
           10 NI-NRPF-ERHANSPR            PIC S9(04)       BINARY.
           10 NI-NRPF-P-AUFNEHM           PIC S9(04)       BINARY.
           10 NI-NRPF-PSTUFE-1            PIC S9(04)       BINARY.
           10 NI-NRPF-PDAT-RECH-1         PIC S9(04)       BINARY.
           10 NI-NRPF-PDAT-TATS-1         PIC S9(04)       BINARY.
           10 NI-NRPF-FAKTOR-1            PIC S9(04)       BINARY.
           10 NI-NRPF-PDAT-VERL-1         PIC S9(04)       BINARY.
           10 NI-NRPF-PSTUFE-2            PIC S9(04)       BINARY.
           10 NI-NRPF-PDAT-RECH-2         PIC S9(04)       BINARY.
           10 NI-NRPF-PDAT-TATS-2         PIC S9(04)       BINARY.
           10 NI-NRPF-FAKTOR-2            PIC S9(04)       BINARY.
           10 NI-NRPF-PDAT-VERL-2         PIC S9(04)       BINARY.
           10 NI-NRPF-PSTUFE-3            PIC S9(04)       BINARY.
           10 NI-NRPF-PDAT-RECH-3         PIC S9(04)       BINARY.
           10 NI-NRPF-PDAT-TATS-3         PIC S9(04)       BINARY.
           10 NI-NRPF-FAKTOR-3            PIC S9(04)       BINARY.
           10 NI-NRPF-PDAT-VERL-3         PIC S9(04)       BINARY.
           10 NI-NRPF-VB-EIGEN            PIC S9(04)       BINARY.
           10 NI-NRPF-VB-GRUPPE           PIC S9(04)       BINARY.
           10 NI-ZUGANG                   PIC S9(04)       BINARY.
           10 NI-VON                      PIC S9(04)       BINARY.
           10 NI-BIS                      PIC S9(04)       BINARY.
 
        05 DCL-VIVB0128.
           10 NRPF-ABGEB-NR               PIC S9(09)       BINARY.
           10 NRPF-AUFNEHM-NR             PIC S9(09)       BINARY.
           10 KTY-NR-TYP                  PIC S9(04)       BINARY.
           10 KNR-NR-TYP                  PIC S9(04)       BINARY.
           10 NRPF-DAT-VON                PIC  X(10).
           10 KTY-NRPF-TYP                PIC S9(04)       BINARY.
           10 KNR-NRPF-TYP                PIC S9(04)       BINARY.
           10 NRPF-LAST-UPDATE            PIC  X(26).
           10 NRPF-ZAHLUNG1               PIC  X(10).
           10 NRPF-BETRAG1                PIC S9(09)V9(02) COMP-3.
           10 NRPF-ZAHLUNG2               PIC  X(10).
           10 NRPF-BETRAG2                PIC S9(09)V9(02) COMP-3.
           10 NRPF-ZAHLUNG3               PIC  X(10).
           10 NRPF-BETRAG3                PIC S9(09)V9(02) COMP-3.
           10 NRPF-ZAHLUNG4               PIC  X(10).
           10 NRPF-BETRAG4                PIC S9(09)V9(02) COMP-3.
           10 NRPF-ZAHLUNG5               PIC  X(10).
           10 NRPF-BETRAG5                PIC S9(09)V9(02) COMP-3.
           10 NRPF-DAUER                  PIC S9(04)       BINARY.
           10 NRPF-ABSCHL-VON             PIC  X(10).
           10 NRPF-ABSCHL-BIS             PIC  X(10).
           10 NRPF-ABSCHL-ZAHLG           PIC S9(09)V9(02) COMP-3.
           10 NRPF-P-ABGEB                PIC S9(04)       BINARY.
           10 NRPF-ERHANSPR               PIC  X(01).
           10 NRPF-P-AUFNEHM              PIC S9(04)       BINARY.
           10 NRPF-PSTUFE-1               PIC S9(04)       BINARY.
           10 NRPF-PDAT-RECH-1            PIC  X(10).
           10 NRPF-PDAT-TATS-1            PIC  X(10).
           10 NRPF-FAKTOR-1               PIC S9(03)V9(02) COMP-3.
           10 NRPF-PDAT-VERL-1            PIC  X(10).
           10 NRPF-PSTUFE-2               PIC S9(04)       BINARY.
           10 NRPF-PDAT-RECH-2            PIC  X(10).
           10 NRPF-PDAT-TATS-2            PIC  X(10).
           10 NRPF-FAKTOR-2               PIC S9(03)V9(02) COMP-3.
           10 NRPF-PDAT-VERL-2            PIC  X(10).
           10 NRPF-PSTUFE-3               PIC S9(04)       BINARY.
           10 NRPF-PDAT-RECH-3            PIC  X(10).
           10 NRPF-PDAT-TATS-3            PIC  X(10).
           10 NRPF-FAKTOR-3               PIC S9(03)V9(02) COMP-3.
           10 NRPF-PDAT-VERL-3            PIC  X(10).
           10 NRPF-VB-EIGEN               PIC S9(09)       BINARY.
           10 NRPF-VB-GRUPPE              PIC S9(09)       BINARY.
           10 ZUGANG                      PIC  X(26).
           10 VON                         PIC  X(26).
           10 BIS                         PIC  X(26).
 
      *****************************************************************
      * ANZAHL SPALTEN IN DIESER DEKLARATION :  45                    *
      *****************************************************************
 
 
 

