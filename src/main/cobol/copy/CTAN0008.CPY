      *---------------------------------------------------------------*
      *    Standard fuer alle Objekte unter PVCS VM
      *            Datum      :  08.09.2006
      *            Kategorie  :  Copystrecke
      *---------------------------------------------------------------*
      *
      *---------------------------------------------------------------*
      *    Copyright (c) 2006 ATLAS Dienstleistungen f. V. GmbH
      *---------------------------------------------------------------*
      *    $Workfile:   CTAN0008.CPY  $
      *    $Revision:   2.8  $
      *
      *    $Log:   L:/mf/CPY/CTAN0008.CPv  $
      *
      *   Rev 2.8   Apr 20 2018 14:45:58   t13ae34
      *FAN01127: Erstellzeitpunkt wird in TBAN0008 verändert.
      *
      *   Rev 2.7   Mar 05 2012 17:11:00   t13ae23
      *AAN01045: DVAG Wien - Neuordnung der Stufe VBAS
      *- Änderung
      *TBAN0008 -
      *
      *   Rev 2.6   Dec 14 2011 16:57:36   t13ae23
      *AAN01033: DVAG-Wien: Erweiterung Header-Datensatz Ges. 16 u.
      * 26 - TBAN0008 -
      *
      *   Rev 2.5   14 Nov 2006 13:46:32   t13ae34
      *AAN00655: Erweiterung des PS auf 3 Stellen
      *
      *   Rev 2.4   26 Oct 2006 08:55:28   t13ae23
      *AAN00655: Erweiterung des PS auf 3 Stellen
      *
      *   Rev 2.3   24 Oct 2006 13:57:06   t13ae23
      *AAN00655: Erweiterung des PS auf 3 Stellen
      *
      *   Rev 2.2   Sep 26 2006 11:46:52   t13ae34
      *AAN00655: Erweiterung des PS auf 3 Stellen
      *
      *   Rev 2.1   Sep 11 2006 13:53:10   t13ae34
      *FAN00667: CTAN0008 CTAN0009
      *
      *   Rev 2.0   Sep 08 2006 16:11:58   t13ae34
      *Archiverstellung
      *
      *---------------------------------------------------------------*
      ****************************************************************
      *    COPY-MEMBER: CTAN0008                                     *
      *    FUNKTION   : DCLGEN FÜR TABELLE TBAN0008                  *
      ****************************************************************
      * AENDERUNGEN:                                                 *
      * AUFTRAG ! DATUM  !VER  ! AENDERUNG                 ! NAME    *
      * -------------------------------------------------------------*
      * FAN00667!11.09.06!2.1  !NEU                        !HEIDER   *
      * AAN01033!14.12.11!2.2  !DATEN GELDWÄSCHE/COMPILANCE!RAHNER   *
      * AAN01045!05.03.12!2.3  !ZEICHNER KONZESSION        !RAHNER   *
      * FAN01127!07.03.18!2.8  !ERSTELLZEITPUNKT           !HEIDER   *
      *         !        !     !                           !         *
      *         !        !     !                           !         *
      *         !        !     !                           !         *
      *                                                              *
      * ENDE-LOGBUCH                                                 *
      ****************************************************************

           EXEC SQL DECLARE TBAN0008 TABLE
           (
              PGEB_GES                       SMALLINT
                                             NOT NULL,
              ANTA_NR                        DECIMAL (15, 0)
                                             NOT NULL,
              ANTA_PIN                       INT
                                             NOT NULL
                                             WITH DEFAULT,
              ANTA_PIN_PZ                    CHAR (2)
                                             NOT NULL
                                             WITH DEFAULT,
              ANTA_VORSCHLAG_NR              CHAR (17)
                                             NOT NULL
                                             WITH DEFAULT,
              ANTA_AVERM                     INT
                                             NOT NULL
                                             WITH DEFAULT,
              ANTA_AVERM_PZ                  CHAR (1)
                                             NOT NULL
                                             WITH DEFAULT,
              ANTA_VM                        INT
                                             NOT NULL
                                             WITH DEFAULT,
              ANTA_VM_PZ                     CHAR (1)
                                             NOT NULL
                                             WITH DEFAULT,
              ANTA_DIR                       SMALLINT
                                             NOT NULL
                                             WITH DEFAULT,
              ANTA_KUNDE_NAME                CHAR (26)
                                             NOT NULL
                                             WITH DEFAULT,
              ANTA_MC_KUNDE_NAME             CHAR (8)
                                             NOT NULL
                                             WITH DEFAULT,
              ANTA_KUNDE_VNAME               CHAR (26)
                                             NOT NULL
                                             WITH DEFAULT,
              ANTA_PLZ                       CHAR (9)
                                             NOT NULL
                                             WITH DEFAULT,
              ANTA_ORT                       CHAR (21)
                                             NOT NULL
                                             WITH DEFAULT,
              ANTA_AUSL                      SMALLINT
                                             NOT NULL
                                             WITH DEFAULT,
              ANTA_ANTRAGS_ART               SMALLINT
                                             NOT NULL
                                             WITH DEFAULT,
              ANTA_AN_AUFN_DAT               DATE
                                             NOT NULL
                                             WITH DEFAULT,
              ANTA_STRUK_DAT                 DATE
                                             NOT NULL
                                             WITH DEFAULT,
              ANTA_STATISTIK_DAT             DATE
                                             NOT NULL
                                             WITH DEFAULT,
              ANTA_ANTR_STATUS_1             SMALLINT
                                             NOT NULL
                                             WITH DEFAULT,
              ANTA_STATUS_DAT_1              DATE
                                             NOT NULL
                                             WITH DEFAULT,
              ANTA_ANTR_STATUS_2             SMALLINT
                                             NOT NULL
                                             WITH DEFAULT,
              ANTA_STATUS_DAT_2              DATE
                                             NOT NULL
                                             WITH DEFAULT,
              ANTA_ANTR_STATUS_3             SMALLINT
                                             NOT NULL
                                             WITH DEFAULT,
              ANTA_STATUS_DAT_3              DATE
                                             NOT NULL
                                             WITH DEFAULT,
              ANTA_STATISTIK                 CHAR (1)
                                             NOT NULL
                                             WITH DEFAULT,
              ANTA_ERST_ERFASSER             CHAR (8)
                                             NOT NULL
                                             WITH DEFAULT,
              ANTA_KD_BEST_ID                DECIMAL (18, 0)
                                             NOT NULL
                                             WITH DEFAULT,
              ANTA_BERATER_EXEM              CHAR (1)
                                             NOT NULL
                                             WITH DEFAULT,
              ANTA_KENNUNG                   CHAR (8)
                                             NOT NULL
                                             WITH DEFAULT,
              ANTA_LAST_UPDATE               TIMESTAMP
                                             NOT NULL
                                             WITH DEFAULT,
              ANTA_VERS_BEGINN               DATE
                                             NOT NULL
                                             WITH DEFAULT,
              ANTA_VERS_ENDE                 DATE
                                             NOT NULL
                                             WITH DEFAULT,
              ANTA_EIGEN_ANTRAG              CHAR (1)
                                             NOT NULL
                                             WITH DEFAULT,
              ANTA_GEB_DAT                   DATE
                                             NOT NULL
                                             WITH DEFAULT,
              ANTA_BZ_ENDE                   DATE
                                             NOT NULL
                                             WITH DEFAULT,
              ANTA_RBA                       SMALLINT
                                             NOT NULL
                                             WITH DEFAULT,
              ANTA_KOLLEKTSTUFE              SMALLINT
                                             NOT NULL
                                             WITH DEFAULT,
              ANTA_DIREKTVERS                CHAR (1)
                                             NOT NULL
                                             WITH DEFAULT,
              ANTA_DTA_STRUK_DAT             DATE
                                             NOT NULL
                                             WITH DEFAULT,
              ANTA_HISTORIE                  SMALLINT
                                             NOT NULL
                                             WITH DEFAULT,
              ANTA_AG8_AENDERUNG             SMALLINT
                                             NOT NULL
                                             WITH DEFAULT,
              ANTA_ZUSATZ_1                  CHAR (10)
                                             NOT NULL
                                             WITH DEFAULT,
              ANTA_PROV_STRUK                VARCHAR (320)
                                             NOT NULL
                                             WITH DEFAULT,
141211        ANTA_KUNDE_STAA                SMALLINT
141211                                       NOT NULL
141211                                       WITH DEFAULT,
141211        ANTA_KUNDE_BGRP                CHAR (40)
141211                                       NOT NULL
141211                                       WITH DEFAULT,
141211        ANTA_KUNDE_BRAN                CHAR (40)
141211                                       NOT NULL
141211                                       WITH DEFAULT,
141211        ANTA_KUNDE_PEP                 CHAR (1)
141211                                       NOT NULL
141211                                       WITH DEFAULT,
050312        ANTA_VB_KONZESSION             INT
050312                                       NOT NULL
070318                                       WITH DEFAULT,
              ANTA_ERSTELLZEITPUNKT          TIMESTAMP NOT NULL
           )
           END-EXEC.


       01  DCL-TBAN0008.
           03 PGEB-GES                       PIC S9(4) COMP.
           03 ANTA-NR                        PIC S9(15)V COMP-3.
           03 ANTA-PIN                       PIC S9(9) COMP.
           03 ANTA-PIN-PZ                    PIC X(2).
           03 ANTA-VORSCHLAG-NR              PIC X(17).
           03 ANTA-AVERM                     PIC S9(9) COMP.
           03 ANTA-AVERM-PZ                  PIC X.
           03 ANTA-VM                        PIC S9(9) COMP.
           03 ANTA-VM-PZ                     PIC X.
           03 ANTA-DIR                       PIC S9(4) COMP.
           03 ANTA-KUNDE-NAME                PIC X(26).
           03 ANTA-MC-KUNDE-NAME             PIC X(8).
           03 ANTA-KUNDE-VNAME               PIC X(26).
           03 ANTA-PLZ                       PIC X(9).
           03 ANTA-ORT                       PIC X(21).
           03 ANTA-AUSL                      PIC S9(4) COMP.
           03 ANTA-ANTRAGS-ART               PIC S9(4) COMP.
           03 ANTA-AN-AUFN-DAT               PIC X(10).
           03 ANTA-STRUK-DAT                 PIC X(10).
           03 ANTA-STATISTIK-DAT             PIC X(10).
           03 ANTA-ANTR-STATUS-1             PIC S9(4) COMP.
           03 ANTA-STATUS-DAT-1              PIC X(10).
           03 ANTA-ANTR-STATUS-2             PIC S9(4) COMP.
           03 ANTA-STATUS-DAT-2              PIC X(10).
           03 ANTA-ANTR-STATUS-3             PIC S9(4) COMP.
           03 ANTA-STATUS-DAT-3              PIC X(10).
           03 ANTA-STATISTIK                 PIC X.
           03 ANTA-ERST-ERFASSER             PIC X(8).
           03 ANTA-KD-BEST-ID                PIC S9(18)V COMP-3.
           03 ANTA-BERATER-EXEM              PIC X.
           03 ANTA-KENNUNG                   PIC X(8).
           03 ANTA-LAST-UPDATE               PIC X(26).
           03 ANTA-VERS-BEGINN               PIC X(10).
           03 ANTA-VERS-ENDE                 PIC X(10).
           03 ANTA-EIGEN-ANTRAG              PIC X.
           03 ANTA-GEB-DAT                   PIC X(10).
           03 ANTA-BZ-ENDE                   PIC X(10).
           03 ANTA-RBA                       PIC S9(4) COMP.
           03 ANTA-KOLLEKTSTUFE              PIC S9(4) COMP.
           03 ANTA-DIREKTVERS                PIC X.
           03 ANTA-DTA-STRUK-DAT             PIC X(10).
           03 ANTA-HISTORIE                  PIC S9(4) COMP.
           03 ANTA-AG8-AENDERUNG             PIC S9(4) COMP.
           03 ANTA-ZUSATZ-1                  PIC X(10).
           03 ANTA-PROV-STRUK.
              49 ANTA-PROV-STRUK-LEN         PIC S9(4) COMP.
              49 ANTA-PROV-STRUK-TEXT        PIC X(320).
141211     03 ANTA-KUNDE-STAA                PIC S9(4) COMP.
141211     03 ANTA-KUNDE-BGRP                PIC X(40).
141211     03 ANTA-KUNDE-BRAN                PIC X(40).
141211     03 ANTA-KUNDE-PEP                 PIC X(1).
050312     03 ANTA-VB-KONZESSION             PIC S9(9) COMP.
070318     03 ANTA-ERSTELLZEITPUNKT          PIC X(26).

