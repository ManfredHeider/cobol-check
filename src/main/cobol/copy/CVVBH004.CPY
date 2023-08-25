      *---------------------------------------------------------------*
      *    Standard fuer alle Objekte unter PVCS VM
      *            Datum      :  08.03.2007
      *            Kategorie  :  Copystrecke
      *---------------------------------------------------------------*
      *
      *---------------------------------------------------------------*
      *    Copyright (c) 2007 ATLAS Dienstleistungen f. V. GmbH
      *---------------------------------------------------------------*
      *    $Workfile:   CVVBH004.CPY  $
      *    $Revision:   2.1  $
      *
      *    $Log:   L:/mf/CPY/CVVBH004.CPv  $
      *
      *   Rev 2.1   13 Apr 2007 10:42:26   t13ae13
      *AVB00907: Beförderungsbedingungen Österreich 2007
      *
      *   Rev 2.0   08 Mar 2007 12:55:42   t13ae13
      *Archiverstellung
      *
      *---------------------------------------------------------------*
      *****************************************************************
      *    COPY-MEMBER: CVVBH004                                      *
      *    --------------------------------------------------------   *
      *    ERSTELLT: Walb                                             *
      *    DATUM:    09.03.2007                                       *
      *    --------------------------------------------------------   *
      *    VERSION:  001                                              *
      *****************************************************************
      *
      ****************************************************************
      * AENDERUNGEN:                                                 *
      * AUFTRAG ! DATUM  !VER ! AENDERUNG                 ! NAME     *
      * -------------------------------------------------------------*
      * AVB00907!09.03.07!2.1 ! NEU                       ! S. Walb  *
      *         !        !    !                           !          *
      *         !        !    !                           !          *
      *                                                              *
      * ENDE-LOGBUCH                                                 *
      ****************************************************************
      ******************************************************************
      * DCLGEN TABLE(VIVBH004)                                         *
      *        LIBRARY(P130005.BP010000.SRCDCL(CVVBH004))              *
      *        ACTION(REPLACE)                                         *
      *        QUOTE                                                   *
      * ... IS THE DCLGEN COMMAND THAT MADE THE FOLLOWING STATEMENTS   *
      ******************************************************************
           EXEC SQL DECLARE VIVBH004 TABLE
           ( MA_ST_NR                       INTEGER NOT NULL,
             MA_LAST_UPDATE                 TIMESTAMP NOT NULL,
             KTY_MA_TYP                     SMALLINT NOT NULL,
             KNR_MA_TYP                     SMALLINT NOT NULL,
             MA_BDV_MITGLIED                CHAR(1) NOT NULL,
             MA_STRAFE                      CHAR(1) NOT NULL,
             MA_VERSANDSTOP                 CHAR(1) NOT NULL,
             MA_ZV_ZVII_ABL                 CHAR(1) NOT NULL,
             MA_RCK_STZ                     DECIMAL(5, 2) NOT NULL,
             MA_RCK_STZ_DAT                 DATE NOT NULL,
             MA_FUEH_ZEUG_DAT               DATE,
             MA_SCHUFA_DAT                  DATE,
             MA_34C_DAT                     DATE,
             MA_AFO                         CHAR(1) NOT NULL,
             MA_DARLEHEN                    CHAR(1) NOT NULL,
             MA_AVAG_DVAG                   DATE,
             MA_KOMPASS_AVAG                DATE,
             MA_AUTOTELEFON                 CHAR(26) NOT NULL,
             MA_TELETEXT                    CHAR(26) NOT NULL,
             MA_ZV_NR                       CHAR(1) NOT NULL,
             MA_ZV_DAT_BIS_R                DATE,
             MA_ZV_DAT_BIS                  DATE,
             MA_ZV_DAT_VON                  DATE,
             MA_ZV_KUE_DAT                  DATE,
             MA_ED_ZUSATZ                   SMALLINT NOT NULL,
             MA_ZV_VERL                     CHAR(1) NOT NULL,
             MA_FG_DAT                      DATE,
             MA_127_DAT                     DATE,
             MA_VA_DAT                      DATE,
             MA_ANWERBER                    INTEGER NOT NULL,
             MA_BEFBED_NEU                  DATE,
             MA_STEUER_NR                   CHAR(15),
             MA_GEWERBE_DAT                 INTEGER NOT NULL,
             MA_GRUNDSTUECKE                DATE,
             MA_127_UNBES_DAT               DATE,
             MA_BEFBED_WIEN_07              DATE,
             MA_REGISTER_NR                 CHAR(30),
             MA_SCHULDNER_VERZ              DATE,
             MA_GEW_ZENTR_REG               DATE,
             MA_INSOLVENZ_VERZ              DATE
           ) END-EXEC.
      ******************************************************************
      * COBOL DECLARATION FOR TABLE VIVBH004                           *
      ******************************************************************
       01  VIVBH004-GESAMT.
        05  NI-VIVBH004-TAB.
           10  NI-VIVBH004-ELE     PIC S9(04)  COMP   OCCURS  40 TIMES.
        05  NI-VIVBH004            REDEFINES   NI-VIVBH004-TAB.
           10 NI-MA-ST-NR          PIC S9(04)  COMP.
           10 NI-MA-LAST-UPDATE    PIC S9(04)  COMP.
           10 NI-KTY-MA-TYP        PIC S9(04)  COMP.
           10 NI-KNR-MA-TYP        PIC S9(04)  COMP.
           10 NI-MA-BDV-MITGLIED   PIC S9(04)  COMP.
           10 NI-MA-STRAFE         PIC S9(04)  COMP.
           10 NI-MA-VERSANDSTOP    PIC S9(04)  COMP.
           10 NI-MA-ZV-ZVII-ABL    PIC S9(04)  COMP.
           10 NI-MA-RCK-STZ        PIC S9(04)  COMP.
           10 NI-MA-RCK-STZ-DAT    PIC S9(04)  COMP.
           10 NI-MA-FUEH-ZEUG-DAT  PIC S9(04)  COMP.
           10 NI-MA-SCHUFA-DAT     PIC S9(04)  COMP.
           10 NI-MA-34C-DAT        PIC S9(04)  COMP.
           10 NI-MA-AFO            PIC S9(04)  COMP.
           10 NI-MA-DARLEHEN       PIC S9(04)  COMP.
           10 NI-MA-AVAG-DVAG      PIC S9(04)  COMP.
           10 NI-MA-KOMPASS-AVAG   PIC S9(04)  COMP.
           10 NI-MA-AUTOTELEFON    PIC S9(04)  COMP.
           10 NI-MA-TELETEXT       PIC S9(04)  COMP.
           10 NI-MA-ZV-NR          PIC S9(04)  COMP.
           10 NI-MA-ZV-DAT-BIS-R   PIC S9(04)  COMP.
           10 NI-MA-ZV-DAT-BIS     PIC S9(04)  COMP.
           10 NI-MA-ZV-DAT-VON     PIC S9(04)  COMP.
           10 NI-MA-ZV-KUE-DAT     PIC S9(04)  COMP.
           10 NI-MA-ED-ZUSATZ      PIC S9(04)  COMP.
           10 NI-MA-ZV-VERL        PIC S9(04)  COMP.
           10 NI-MA-FG-DAT         PIC S9(04)  COMP.
           10 NI-MA-127-DAT        PIC S9(04)  COMP.
           10 NI-MA-VA-DAT         PIC S9(04)  COMP.
           10 NI-MA-ANWERBER       PIC S9(04)  COMP.
           10 NI-MA-BEFBED-NEU     PIC S9(04)  COMP.
           10 NI-MA-STEUER-NR      PIC S9(04)  COMP.
           10 NI-MA-GEWERBE-DAT    PIC S9(04)  COMP.
           10 NI-MA-GRUNDSTUECKE   PIC S9(04)  COMP.
           10 NI-MA-127-UNBES-DAT  PIC S9(04)  COMP.
           10 NI-MA-BEFBED-WIEN-07 PIC S9(04)  COMP.
           10 NI-MA-REGISTER-NR    PIC S9(04)  COMP.
           10 NI-MA-SCHULDNER-VERZ PIC S9(04)  COMP.
           10 NI-MA-GEW-ZENTR-REG  PIC S9(04)  COMP.
           10 NI-MA-INSOLVENZ-VERZ PIC S9(04)  COMP.
        05  DCL-VIVBH004.
           10 MA-ST-NR             PIC S9(9) USAGE COMP.
           10 MA-LAST-UPDATE       PIC X(26).
           10 KTY-MA-TYP           PIC S9(4) USAGE COMP.
           10 KNR-MA-TYP           PIC S9(4) USAGE COMP.
           10 MA-BDV-MITGLIED      PIC X(1).
           10 MA-STRAFE            PIC X(1).
           10 MA-VERSANDSTOP       PIC X(1).
           10 MA-ZV-ZVII-ABL       PIC X(1).
           10 MA-RCK-STZ           PIC S999V99 USAGE COMP-3.
           10 MA-RCK-STZ-DAT       PIC X(10).
           10 MA-FUEH-ZEUG-DAT     PIC X(10).
           10 MA-SCHUFA-DAT        PIC X(10).
           10 MA-34C-DAT           PIC X(10).
           10 MA-AFO               PIC X(1).
           10 MA-DARLEHEN          PIC X(1).
           10 MA-AVAG-DVAG         PIC X(10).
           10 MA-KOMPASS-AVAG      PIC X(10).
           10 MA-AUTOTELEFON       PIC X(26).
           10 MA-TELETEXT          PIC X(26).
           10 MA-ZV-NR             PIC X(1).
           10 MA-ZV-DAT-BIS-R      PIC X(10).
           10 MA-ZV-DAT-BIS        PIC X(10).
           10 MA-ZV-DAT-VON        PIC X(10).
           10 MA-ZV-KUE-DAT        PIC X(10).
           10 MA-ED-ZUSATZ         PIC S9(4) USAGE COMP.
           10 MA-ZV-VERL           PIC X(1).
           10 MA-FG-DAT            PIC X(10).
           10 MA-127-DAT           PIC X(10).
           10 MA-VA-DAT            PIC X(10).
           10 MA-ANWERBER          PIC S9(9) USAGE COMP.
           10 MA-BEFBED-NEU        PIC X(10).
           10 MA-STEUER-NR         PIC X(15).
           10 MA-GEWERBE-DAT       PIC X(10).
           10 MA-GRUNDSTUECKE      PIC X(1).
           10 MA-127-UNBES-DAT     PIC X(10).
           10 MA-BEFBED-WIEN-07    PIC X(10).
           10 MA-REGISTER-NR       PIC X(30).
           10 MA-SCHULDNER-VERZ    PIC X(10).
           10 MA-GEW-ZENTR-REG     PIC X(10).
           10 MA-INSOLVENZ-VERZ    PIC X(10).
      ******************************************************************
      * THE NUMBER OF COLUMNS DESCRIBED BY THIS DECLARATION IS 40      *
      ******************************************************************

