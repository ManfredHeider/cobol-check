      *---------------------------------------------------------------*
      *    Standard fuer alle Objekte unter PVCS VM
      *            Datum      :  08.12.2003
      *            Kategorie  :  Copystrecke
      *---------------------------------------------------------------*
      *
      *---------------------------------------------------------------*
      *    Copyright (c) 2003 ATLAS Dienstleistungen f. V. GmbH
      *---------------------------------------------------------------*
      *    $Workfile:   CVVBB082.CPY  $
      *    $Revision:   2.2  $
      *
      *    $Log:   L:/mf/CPY/CVVBB082.CPv  $
      *
      *   Rev 2.2   Mar 11 2004 12:01:52   t13ae27
      *Scharfschaltung
      *
      *   Rev 2.1   Dec 18 2003 12:00:18   t13ex22
      *AAS00443: Erweiterung für Wettbewerb 2004
      *
      *   Rev 2.0   Dec 08 2003 15:20:52   t13ex22
      *Archiverstellung
      *
      *---------------------------------------------------------------*

           EXEC SQL DECLARE VIVBB082 TABLE
           (
              MA_ST_NR                       INT
                                             NOT NULL,
              LIST_MONAT                     DATE
                                             NOT NULL,
              KTY_WB_TYP                     SMALLINT
                                             NOT NULL
                                             WITH DEFAULT,
              KNR_WB_TYP                     SMALLINT
                                             NOT NULL,
              KTY_WERTUNGS_TYP               SMALLINT
                                             NOT NULL
                                             WITH DEFAULT,
              KNR_WERTUNGS_TYP               SMALLINT
                                             NOT NULL,
              LIST_STUF_BEZ                  CHAR (10)
                                             NOT NULL,
              LIST_LAST_UPDATE               TIMESTAMP
                                             NOT NULL
                                             WITH DEFAULT,
              DIR_NR                         SMALLINT
                                             NOT NULL,
              LIST_NAME                      CHAR (25)
                                             NOT NULL,
              LIST_VORNAME                   CHAR (25)
                                             NOT NULL,
              LIST_RANG                      INT
                                             NOT NULL,
              LIST_GEWINNER_KZ               CHAR (1)
                                             NOT NULL,
              LIST_EH_1                      DECIMAL (10, 1),
              LIST_EH_2                      DECIMAL (10, 1),
              LIST_EH_3                      DECIMAL (10, 1),
              LIST_EH_4                      DECIMAL (10, 1),
              LIST_EH_5                      DECIMAL (10, 1),
              LIST_SUM_EH                    DECIMAL (10, 1)
                                             NOT NULL
                                             WITH DEFAULT,
              KTY_REGION                     SMALLINT
                                             NOT NULL,
              KNR_REGION                     SMALLINT
                                             NOT NULL,
              LIST_BETRAG_1                  DECIMAL (11, 2),
              LIST_BETRAG_2                  DECIMAL (11, 2),
              LIST_BETRAG_3                  DECIMAL (11, 2),
              LIST_BETRAG_4                  DECIMAL (11, 2),
              LIST_BETRAG_5                  DECIMAL (11, 2),
              LIST_SUM_BETRAG                DECIMAL (11, 2),
              LIST_PROZSATZ                  DECIMAL (7, 2),
              LIST_BEMERKUNG                 CHAR (20),
              KTY_LIST_TYP                   SMALLINT
                                             NOT NULL
                                             WITH DEFAULT,
              KNR_LIST_TYP                   SMALLINT
                                             NOT NULL
                                             WITH DEFAULT,
              KTY_GESELL_TYP                 SMALLINT
                                             NOT NULL
                                             WITH DEFAULT,
              KNR_GESELL_TYP                 SMALLINT
                                             NOT NULL,
              LIST_WERTUNGSSTUFE             SMALLINT
           )
           END-EXEC.


       01  VIVBB082-GESAMT.
        05  NI-VIVBB082-TAB.
           10 NI-VIVBB082-ELE      PIC S9(04) BINARY OCCURS 34 TIMES.
        05  NI-VIVBB082            REDEFINES   NI-VIVBB082-TAB.
           10 NI-MA-ST-NR                PIC S9(04)  BINARY.
           10 NI-LIST-MONAT              PIC S9(04)  BINARY.
           10 NI-KTY-WB-TYP              PIC S9(04)  BINARY.
           10 NI-KNR-WB-TYP              PIC S9(04)  BINARY.
           10 NI-KTY-WERTUNGS-TYP        PIC S9(04)  BINARY.
           10 NI-KNR-WERTUNGS-TYP        PIC S9(04)  BINARY.
           10 NI-LIST-STUF-BEZ           PIC S9(04)  BINARY.
           10 NI-LIST-LAST-UPDATE        PIC S9(04)  BINARY.
           10 NI-DIR-NR                  PIC S9(04)  BINARY.
           10 NI-LIST-NAME               PIC S9(04)  BINARY.
           10 NI-LIST-VORNAME            PIC S9(04)  BINARY.
           10 NI-LIST-RANG               PIC S9(04)  BINARY.
           10 NI-LIST-GEWINNER-KZ        PIC S9(04)  BINARY.
           10 NI-LIST-EH-1               PIC S9(04)  BINARY.
           10 NI-LIST-EH-2               PIC S9(04)  BINARY.
           10 NI-LIST-EH-3               PIC S9(04)  BINARY.
           10 NI-LIST-EH-4               PIC S9(04)  BINARY.
           10 NI-LIST-EH-5               PIC S9(04)  BINARY.
           10 NI-LIST-SUM-EH             PIC S9(04)  BINARY.
           10 NI-KTY-REGION              PIC S9(04)  BINARY.
           10 NI-KNR-REGION              PIC S9(04)  BINARY.
           10 NI-LIST-BETRAG-1           PIC S9(04)  BINARY.
           10 NI-LIST-BETRAG-2           PIC S9(04)  BINARY.
           10 NI-LIST-BETRAG-3           PIC S9(04)  BINARY.
           10 NI-LIST-BETRAG-4           PIC S9(04)  BINARY.
           10 NI-LIST-BETRAG-5           PIC S9(04)  BINARY.
           10 NI-LIST-SUM-BETRAG         PIC S9(04)  BINARY.
           10 NI-LIST-PROZSATZ           PIC S9(04)  BINARY.
           10 NI-LIST-BEMERKUNG          PIC S9(04)  BINARY.
           10 NI-KTY-LIST-TYP            PIC S9(04)  BINARY.
           10 NI-KNR-LIST-TYP            PIC S9(04)  BINARY.
           10 NI-KTY-GESELL-TYP          PIC S9(04)  BINARY.
           10 NI-KNR-GESELL-TYP          PIC S9(04)  BINARY.
           10 NI-LIST-WERTUNGSSTUFE      PIC S9(04)  BINARY.
        05 DCL-VIVBB082.
           10 MA-ST-NR                   PIC S9(9) COMP.
           10 LIST-MONAT                 PIC X(10).
           10 KTY-WB-TYP                 PIC S9(4) COMP.
           10 KNR-WB-TYP                 PIC S9(4) COMP.
           10 KTY-WERTUNGS-TYP           PIC S9(4) COMP.
           10 KNR-WERTUNGS-TYP           PIC S9(4) COMP.
           10 LIST-STUF-BEZ              PIC X(10).
           10 LIST-LAST-UPDATE           PIC X(26).
           10 DIR-NR                     PIC S9(4) COMP.
           10 LIST-NAME                  PIC X(25).
           10 LIST-VORNAME               PIC X(20).
           10 LIST-RANG                  PIC S9(9) COMP.
           10 LIST-GEWINNER-KZ           PIC X.
           10 LIST-EH-1                  PIC S9(9)V9(1) COMP-3.
           10 LIST-EH-2                  PIC S9(9)V9(1) COMP-3.
           10 LIST-EH-3                  PIC S9(9)V9(1) COMP-3.
           10 LIST-EH-4                  PIC S9(9)V9(1) COMP-3.
           10 LIST-EH-5                  PIC S9(9)V9(1) COMP-3.
           10 LIST-SUM-EH                PIC S9(9)V9(1) COMP-3.
           10 KTY-REGION                 PIC S9(4) COMP.
           10 KNR-REGION                 PIC S9(4) COMP.
           10 LIST-BETRAG-1              PIC S9(9)V9(2) COMP-3.
           10 LIST-BETRAG-2              PIC S9(9)V9(2) COMP-3.
           10 LIST-BETRAG-3              PIC S9(9)V9(2) COMP-3.
           10 LIST-BETRAG-4              PIC S9(9)V9(2) COMP-3.
           10 LIST-BETRAG-5              PIC S9(9)V9(2) COMP-3.
           10 LIST-SUM-BETRAG            PIC S9(9)V9(2) COMP-3.
           10 LIST-PROZSATZ              PIC S9(5)V9(2) COMP-3.
           10 LIST-BEMERKUNG             PIC X(20).
           10 KTY-LIST-TYP               PIC S9(4) COMP.
           10 KNR-LIST-TYP               PIC S9(4) COMP.
           10 KTY-GESELL-TYP             PIC S9(4) COMP.
           10 KNR-GESELL-TYP             PIC S9(4) COMP.
           10 LIST-WERTUNGSSTUFE         PIC S9(4) COMP.
