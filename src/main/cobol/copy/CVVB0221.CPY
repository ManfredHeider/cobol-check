      *---------------------------------------------------------------*
      *    Standard fuer alle Objekte unter PVCS VM
      *            Datum      :  11.08.2015
      *            Kategorie  :  Copystrecke
      *---------------------------------------------------------------*
      *    Copyright (c) 2015 ATLAS Dienstleistungen f. V. GmbH
      *---------------------------------------------------------------*
      *    $Workfile:   CVVB0221.CPY  $
      *    $Revision:   2.3  $
      *
      *    $Log:   L:/mf/CPY/CVVB0221.CPv  $
      *
      *   Rev 2.3   Feb 17 2016 09:32:16   t13ae14
      *ASL00530: SL12 - Dialog Ausbilder-Zuschuss
      *
      *   Rev 2.2   Feb 17 2016 09:16:50   t13ae14
      *ASL00530: SL12 - Dialog Ausbilder-Zuschuss
      *
      *   Rev 2.1   Feb 17 2016 08:47:12   t13ae14
      *ASL00530: SL12 - Dialog Ausbilder-Zuschuss
      *
      *   Rev 2.0   Aug 11 2015 13:00:38   t13ex13
      *Archiverstellung
      *
      *---------------------------------------------------------------*
      *****************************************************************
      *    ERSTELLT: GUTFLEISCH                                       *
      *    DATUM:    11.08.2015                                       *
      *****************************************************************
      * AENDERUNGEN:                                                  *
      * AUFTRAG ! DATUM  !VER ! AENDERUNG                 ! NAME      *
      * --------+--------+----+---------------------------+---------- *
      * ASL00530!11.08.15!2.1 ! NEU                       ! GUTFLEISCH*
      *         !        !    !                           !           *
      *         !        !    !                           !           *
      * ENDE-LOGBUCH                                                  *
      *****************************************************************
      * DCLGEN TABLE(VIVB0221) AZNERF                                 *
      *        LIBRARY(P130005.BP010000.SRCDCL(CVVB0221)              *
      *        ACTION(REPLACE)                                        *
      *        QUOTE                                                  *
      * ... DIESES DCLGEN WURDE GENERIERT MIT GENERCBL (REXX)         *
      *****************************************************************
 
           EXEC SQL DECLARE VIVB0221 TABLE
           ( AZNERF_PART_VBNR            INTEGER NOT NULL
           , AZNERF_BETR_VBNR            INTEGER NOT NULL
           , DIR_NR                      SMALLINT NOT NULL
           , MS_NR                       SMALLINT NOT NULL
           , AZNERF_ANSPR_VOM            DATE NOT NULL
           , AZNERF_ANSPR_SEIT           DATE NOT NULL
           , AZNERF_ANSPR_BIS            DATE
           , AZNERF_EBENE                SMALLINT NOT NULL
           , AZNERF_VERT_FAKTOR          SMALLINT NOT NULL
           , AZNERF_BETR_FAKTOR          DECIMAL(11, 2) NOT NULL
           , AZNERF_ANZAHL_MON           SMALLINT NOT NULL
           , AZNERF_BETRAG               DECIMAL(11, 2) NOT NULL
           , AZNERF_EH_GRENZE            DECIMAL(10, 1) NOT NULL
           , AZNERF_EH_EIGEN             DECIMAL(10, 1) NOT NULL
           , AZNERF_EH_EIGEN_MO          DECIMAL(10, 1) NOT NULL
           , AZNERF_EQF_EIGEN            DECIMAL(05, 2) NOT NULL
           , KNR_NERF_GRUND              SMALLINT NOT NULL
           , KTY_NERF_GRUND              SMALLINT NOT NULL
           , KTY_WAEHRUNG                SMALLINT NOT NULL
           , KNR_WAEHRUNG                SMALLINT NOT NULL
           , AZNERF_LAST_UPDATE          TIMESTAMP NOT NULL
           ) END-EXEC.
 
      *****************************************************************
      * COBOL DEKLARATION FÜR VIEW VIVB0221                           *
      *****************************************************************
 
       01  VIVB0221-GESAMT.
        05 NI-VIVB0221-TAB.
           10 NI-VIVB0221-ELE      PIC S9(04)  BINARY OCCURS  21.
        05 NI-VIVB0221             REDEFINES   NI-VIVB0221-TAB.
           10 NI-AZNERF-PART-VBNR         PIC S9(04)       BINARY.
           10 NI-AZNERF-BETR-VBNR         PIC S9(04)       BINARY.
           10 NI-DIR-NR                   PIC S9(04)       BINARY.
           10 NI-MS-NR                    PIC S9(04)       BINARY.
           10 NI-AZNERF-ANSPR-VOM         PIC S9(04)       BINARY.
           10 NI-AZNERF-ANSPR-SEIT        PIC S9(04)       BINARY.
           10 NI-AZNERF-ANSPR-BIS         PIC S9(04)       BINARY.
           10 NI-AZNERF-EBENE             PIC S9(04)       BINARY.
           10 NI-AZNERF-VERT-FAKTOR       PIC S9(04)       BINARY.
           10 NI-AZNERF-BETR-FAKTOR       PIC S9(04)       BINARY.
           10 NI-AZNERF-ANZAHL-MON        PIC S9(04)       BINARY.
           10 NI-AZNERF-BETRAG            PIC S9(04)       BINARY.
           10 NI-AZNERF-EH-GRENZE         PIC S9(04)       BINARY.
           10 NI-AZNERF-EH-EIGEN          PIC S9(04)       BINARY.
           10 NI-AZNERF-EH-EIGEN-MO       PIC S9(04)       BINARY.
           10 NI-AZNERF-EQF-EIGEN         PIC S9(04)       BINARY.
           10 NI-KNR-NERF-GRUND           PIC S9(04)       BINARY.
           10 NI-KTY-NERF-GRUND           PIC S9(04)       BINARY.
           10 NI-KTY-WAEHRUNG             PIC S9(04)       BINARY.
           10 NI-KNR-WAEHRUNG             PIC S9(04)       BINARY.
           10 NI-AZNERF-LAST-UPDATE       PIC S9(04)       BINARY.
 
        05 DCL-VIVB0221.
           10 AZNERF-PART-VBNR            PIC S9(09)       BINARY.
           10 AZNERF-BETR-VBNR            PIC S9(09)       BINARY.
           10 DIR-NR                      PIC S9(04)       BINARY.
           10 MS-NR                       PIC S9(04)       BINARY.
           10 AZNERF-ANSPR-VOM            PIC  X(10).
           10 AZNERF-ANSPR-SEIT           PIC  X(10).
           10 AZNERF-ANSPR-BIS            PIC  X(10).
           10 AZNERF-EBENE                PIC S9(04)       BINARY.
           10 AZNERF-VERT-FAKTOR          PIC S9(04)       BINARY.
           10 AZNERF-BETR-FAKTOR          PIC S9(09)V9(02) COMP-3.
           10 AZNERF-ANZAHL-MON           PIC S9(04)       BINARY.
           10 AZNERF-BETRAG               PIC S9(09)V9(02) COMP-3.
           10 AZNERF-EH-GRENZE            PIC S9(09)V9(01) COMP-3.
           10 AZNERF-EH-EIGEN             PIC S9(09)V9(01) COMP-3.
           10 AZNERF-EH-EIGEN-MO          PIC S9(09)V9(01) COMP-3.
           10 AZNERF-EQF-EIGEN            PIC S9(03)V9(02) COMP-3.
           10 KNR-NERF-GRUND              PIC S9(04)       BINARY.
           10 KTY-NERF-GRUND              PIC S9(04)       BINARY.
           10 KTY-WAEHRUNG                PIC S9(04)       BINARY.
           10 KNR-WAEHRUNG                PIC S9(04)       BINARY.
           10 AZNERF-LAST-UPDATE          PIC  X(26).
 
      *****************************************************************
      * ANZAHL SPALTEN IN DIESER DEKLARATION :  21                    *
      *****************************************************************
 
 

