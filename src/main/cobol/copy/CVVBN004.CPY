      *---------------------------------------------------------------*
      *    Standard fuer alle Objekte unter PVCS VM
      *            Datum      :  13.09.2012
      *            Kategorie  :  Copystrecke
      *---------------------------------------------------------------*
      *
      *---------------------------------------------------------------*
      *    Copyright (c) 2012 ATLAS Dienstleistungen f. V. GmbH
      *---------------------------------------------------------------*
      *    $Workfile:   CVVBN004.CPY  $
      *    $Revision:   2.3  $
      *
      *    $Log:   L:/mf/CPY/CVVBN004.CPv  $
      *
      *   Rev 2.3   Jan 22 2013 10:42:02   t13ae13
      *AVB01252: §34f  - MA
      *
      *   Rev 2.2   Jan 10 2013 09:07:18   t13ae13
      *AVB01252: §34f  - MA
      *
      *   Rev 2.1   Nov 09 2012 16:05:52   t13ae13
      *AVB01252: §34f  - MA
      *
      *   Rev 2.0   Sep 13 2012 09:29:44   t13ae13
      *Archiverstellung
      *
      *---------------------------------------------------------------*
      *****************************************************************
      *    COPY-MEMBER: CVVBN004                                      *
      *    --------------------------------------------------------   *
      *    ERSTELLT: S. Walb                                          *
      *    DATUM:    13.09.2012                                       *
      *    --------------------------------------------------------   *
      *    VERSION:  001                                              *
      *****************************************************************
      *
      ****************************************************************
      * AENDERUNGEN:                                                 *
      * AUFTRAG ! DATUM  !VER ! AENDERUNG                 ! NAME     *
      * -------------------------------------------------------------*
      * AVB01252!13.09.12!2.1 ! NEU                       ! S. Walb  *
      * AVB01252!07.01.13!2.2 ! Neues Feld MA-34c-ANT-SCH ! S. Walb  *
      * AVB01272!21.01.13!2.3 ! Neues Feld MA-34F-REG-NR  ! S. Walb  *
      *         !        !    !                           !          *
      *                                                              *
      * ENDE-LOGBUCH                                                 *
      ****************************************************************
      ******************************************************************
      * DCLGEN TABLE(VIVBN004)                                         *
      *        LIBRARY(P130005.BP010000.SRCDCL(CVVBN004))              *
      *        ACTION(REPLACE)                                         *
      *        QUOTE                                                   *
      * ... IS THE DCLGEN COMMAND THAT MADE THE FOLLOWING STATEMENTS   *
      ******************************************************************
           EXEC SQL DECLARE VIVBN004 TABLE
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
             MA_GEWERBE_DAT                 DATE NOT NULL,
             MA_GRUNDSTUECKE                CHAR(1),
             MA_127_UNBES_DAT               DATE,
             MA_BEFBED_WIEN_07              DATE,
             MA_REGISTER_NR                 CHAR(30),
             MA_SCHULDNER_VERZ              DATE,
             MA_GEW_ZENTR_REG               DATE,
             MA_INSOLVENZ_VERZ              DATE,
             MA_AM_AGENT_NR                 INTEGER,
             MA_EINTR_DAT_AM                DATE,
             MA_HRD_ORT                     CHAR(40),
             MA_HRD_EINTR                   CHAR(8),
             MA_HROE_EINTR_VA               CHAR(25),
             MA_HROE_EINTR_VB               CHAR(25),
             MA_BEFBED_DVAG_07              DATE,
             KTY_NOTFALL_TYP                SMALLINT,
             KNR_NOTFALL_TYP                SMALLINT,
             MA_34C_AMT                     CHAR(40),
             MA_34C_STRASSE                 CHAR(40),
             MA_34C_PLZ                     CHAR(09),
             MA_34C_ORT                     CHAR(40),
             MA_ZV_ABSICHERG                DECIMAL(11, 2),
             MA_FG_VOM                      DATE,
             MA_127_VOM                     DATE,
             MA_VA_VOM                      DATE,
             MA_FUEH_ZEUG_VOM               DATE,
             MA_SCHUFA_VOM                  DATE,
             MA_GEW_Z_REG_VOM               DATE,
             MA_ANLAGE_BER                  CHAR(1),
             MA_HROE_EINTR_FG               CHAR(25),
             MA_VSH_POLNR                   CHAR(25),
             MA_VSH_DAT                     DATE,
             MA_VSH_VOM                     DATE,
             MA_HROE_EINTR_WG               CHAR(25),
             MA_WG_DAT                      DATE,
             MA_WG_VOM                      DATE,
             MA_BEFBED_2011                 DATE,
             MA_34F_DAT                     DATE,
             MA_34F_ANT_SCH                 CHAR(1) NOT NULL,
             MA_34F_AFO                     CHAR(1) NOT NULL,
             MA_34F_ANL_BER                 CHAR(1) NOT NULL,
             MA_34F_AMT                     CHAR(40),
             MA_34F_STRASSE                 CHAR(40),
             MA_34F_PLZ                     CHAR(09),
             MA_34F_ORT                     CHAR(40),
             MA_34C_ANT_SCH                 CHAR(1) NOT NULL,
             MA_34F_REG_NR                  CHAR(15)
           ) END-EXEC.
      ******************************************************************
      * COBOL DECLARATION FOR TABLE VIVBN004                          *
      ******************************************************************
       01  VIVBN004-GESAMT.
        05  NI-VIVBN004-TAB.
           10  NI-VIVBN004-ELE     PIC S9(04)  COMP   OCCURS  79 TIMES.
        05  NI-VIVBN004           REDEFINES   NI-VIVBN004-TAB.
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
           10 NI-MA-AM-AGENT-NR    PIC S9(04)  COMP.
           10 NI-MA-EINTR-DAT-AM   PIC S9(04)  COMP.
           10 NI-MA-HRD-ORT        PIC S9(04)  COMP.
           10 NI-MA-HRD-EINTR      PIC S9(04)  COMP.
           10 NI-MA-HROE-EINTR-VA  PIC S9(04)  COMP.
           10 NI-MA-HROE-EINTR-VB  PIC S9(04)  COMP.
           10 NI-MA-BEFBED-DVAG-07 PIC S9(04)  COMP.
           10 NI-KTY-NOTFALL-TYP   PIC S9(04)  COMP.
           10 NI-KNR-NOTFALL-TYP   PIC S9(04)  COMP.
           10 NI-MA-34C-AMT        PIC S9(04)  COMP.
           10 NI-MA-34C-STRASSE    PIC S9(04)  COMP.
           10 NI-MA-34C-PLZ        PIC S9(04)  COMP.
           10 NI-MA-34C-ORT        PIC S9(04)  COMP.
           10 NI-MA-ZV-ABSICHERG   PIC S9(04)  COMP.
           10 NI-MA-FG-VOM         PIC S9(04)  COMP.
           10 NI-MA-127-VOM        PIC S9(04)  COMP.
           10 NI-MA-VA-VOM         PIC S9(04)  COMP.
           10 NI-MA-FUEH-ZEUG-VOM  PIC S9(04)  COMP.
           10 NI-MA-SCHUFA-VOM     PIC S9(04)  COMP.
           10 NI-MA-GEW-Z-REG-VOM  PIC S9(04)  COMP.
           10 NI-MA-ANLAGE-BER     PIC S9(04)  COMP.
           10 NI-MA-HROE-EINTR-FG  PIC S9(04)  COMP.
           10 NI-MA-VSH-POLNR      PIC S9(04)  COMP.
           10 NI-MA-VSH-DAT        PIC S9(04)  COMP.
           10 NI-MA-VSH-VOM        PIC S9(04)  COMP.
           10 NI-MA-HROE-EINTR-WG  PIC S9(04)  COMP.
           10 NI-MA-WG-DAT         PIC S9(04)  COMP.
           10 NI-MA-WG-VOM         PIC S9(04)  COMP.
           10 NI-MA-BEFBED-2011    PIC S9(04)  COMP.
           10 NI-MA-34F-DAT        PIC S9(04)  COMP.
           10 NI-MA-34F-ANT-SCH    PIC S9(04)  COMP.
           10 NI-MA-34F-AFO        PIC S9(04)  COMP.
           10 NI-MA-34F-ANL-BER    PIC S9(04)  COMP.
           10 NI-MA-34F-AMT        PIC S9(04)  COMP.
           10 NI-MA-34F-STRASSE    PIC S9(04)  COMP.
           10 NI-MA-34F-PLZ        PIC S9(04)  COMP.
           10 NI-MA-34F-ORT        PIC S9(04)  COMP.
           10 NI-MA-34C-ANT-SCH    PIC S9(04)  COMP.
           10 NI-MA-34F-REG-NR     PIC S9(04)  COMP.
        05  DCL-VIVBN004.
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
           10 MA-AM-AGENT-NR       PIC S9(9) USAGE COMP.
           10 MA-EINTR-DAT-AM      PIC X(10).
           10 MA-HRD-ORT           PIC X(40).
           10 MA-HRD-EINTR         PIC X(8).
           10 MA-HROE-EINTR-VA     PIC X(25).
           10 MA-HROE-EINTR-VB     PIC X(25).
           10 MA-BEFBED-DVAG-07    PIC X(10).
           10 KTY-NOTFALL-TYP      PIC S9(4) USAGE COMP.
           10 KNR-NOTFALL-TYP      PIC S9(4) USAGE COMP.
           10 MA-34C-AMT           PIC X(40).
           10 MA-34C-STRASSE       PIC X(40).
           10 MA-34C-PLZ           PIC X(09).
           10 MA-34C-ORT           PIC X(40).
           10 MA-ZV-ABSICHERG      PIC S9(9)V99 USAGE COMP-3.
           10 MA-FG-VOM            PIC X(10).
           10 MA-127-VOM           PIC X(10).
           10 MA-VA-VOM            PIC X(10).
           10 MA-FUEH-ZEUG-VOM     PIC X(10).
           10 MA-SCHUFA-VOM        PIC X(10).
           10 MA-GEW-Z-REG-VOM     PIC X(10).
           10 MA-ANLAGE-BER        PIC X(1).
           10 MA-HROE-EINTR-FG     PIC X(25).
           10 MA-VSH-POLNR         PIC X(25).
           10 MA-VSH-DAT           PIC X(10).
           10 MA-VSH-VOM           PIC X(10).
           10 MA-HROE-EINTR-WG     PIC X(25).
           10 MA-WG-DAT            PIC X(10).
           10 MA-WG-VOM            PIC X(10).
           10 MA-BEFBED-2011       PIC X(10).
           10 MA-34F-DAT           PIC X(10).
           10 MA-34F-ANT-SCH       PIC X(01).
           10 MA-34F-AFO           PIC X(01).
           10 MA-34F-ANL-BER       PIC X(01).
           10 MA-34F-AMT           PIC X(40).
           10 MA-34F-STRASSE       PIC X(40).
           10 MA-34F-PLZ           PIC X(09).
           10 MA-34F-ORT           PIC X(40).
           10 MA-34C-ANT-SCH       PIC X(01).
           10 MA-34F-REG-NR        PIC X(15).

      ******************************************************************
      * THE NUMBER OF COLUMNS DESCRIBED BY THIS DECLARATION IS 79      *
      ******************************************************************

