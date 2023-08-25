      *---------------------------------------------------------------*
      *    Standard fuer alle Objekte unter PVCS VM
      *            Datum      :  08.09.2006
      *            Kategorie  :  Copystrecke
      *---------------------------------------------------------------*
      *
      *---------------------------------------------------------------*
      *    Copyright (c) 2006 ATLAS Dienstleistungen f. V. GmbH
      *---------------------------------------------------------------*
      *    $Workfile:   CTAN0009.CPY  $
      *    $Revision:   2.4  $
      *
      *    $Log:   L:/mf/CPY/CTAN0009.CPv  $
      *
      *   Rev 2.4   15 Nov 2006 09:51:46   t13ae34
      *AAN00655: Erweiterung des PS auf 3 Stellen
      *
      *   Rev 2.3   14 Nov 2006 13:52:46   t13ae34
      *AAN00655: Erweiterung des PS auf 3 Stellen
      *
      *   Rev 2.2   Sep 26 2006 11:51:10   t13ae34
      *AAN00655: Erweiterung des PS auf 3 Stellen
      *
      *   Rev 2.1   Sep 11 2006 13:57:00   t13ae34
      *FAN00667: CTAN0008 CTAN0009
      *
      *   Rev 2.0   Sep 08 2006 16:13:34   t13ae34
      *Archiverstellung
      *
      *---------------------------------------------------------------*

           EXEC SQL DECLARE TBAN0009 TABLE
           (
              PGEB_GES                       SMALLINT
                                             NOT NULL,
              ANTP_NR                        DECIMAL (15, 0)
                                             NOT NULL,
              PROD_PROD_SCHL                 SMALLINT
                                             NOT NULL
                                             WITH DEFAULT,
              ANTP_LFD_NR                    SMALLINT
                                             NOT NULL
                                             WITH DEFAULT,
              ANTP_TARIF                     CHAR (15)
                                             NOT NULL
                                             WITH DEFAULT,
              ANTP_BETR                      DECIMAL (11, 2)
                                             NOT NULL
                                             WITH DEFAULT,
              ANTP_SUMME                     DECIMAL (11, 2)
                                             NOT NULL
                                             WITH DEFAULT,
              KNR_WAEHRUNG                   SMALLINT
                                             NOT NULL
                                             WITH DEFAULT,
              ANTP_ZAHLWEISE                 SMALLINT
                                             NOT NULL
                                             WITH DEFAULT,
              ANTP_LAUFZEIT                  SMALLINT
                                             NOT NULL
                                             WITH DEFAULT,
              ANTP_DYNAMIK                   DECIMAL (6, 3)
                                             NOT NULL
                                             WITH DEFAULT,
              ANTP_ZUSATZ_1                  DECIMAL (12, 3)
                                             NOT NULL
                                             WITH DEFAULT,
              ANTP_ZUSATZ_2                  DECIMAL (12, 3)
                                             NOT NULL
                                             WITH DEFAULT,
              ANTP_EINH_AVERM                DECIMAL (8, 2)
                                             NOT NULL
                                             WITH DEFAULT,
              ANTP_LAST_UPDATE               TIMESTAMP
                                             NOT NULL
                                             WITH DEFAULT,
              ANTP_KENNUNG                   CHAR (8)
                                             NOT NULL
                                             WITH DEFAULT
           )
           END-EXEC.


       01  DCL-TBAN0009.
           03 PGEB-GES                       PIC S9(4) COMP.
           03 ANTP-NR                        PIC S9(15)V COMP-3.
           03 PROD-PROD-SCHL                 PIC S9(4) COMP.
           03 ANTP-LFD-NR                    PIC S9(4) COMP.
           03 ANTP-TARIF                     PIC X(15).
           03 ANTP-BETR                      PIC S9(9)V9(2) COMP-3.
           03 ANTP-SUMME                     PIC S9(9)V9(2) COMP-3.
           03 KNR-WAEHRUNG                   PIC S9(4) COMP.
           03 ANTP-ZAHLWEISE                 PIC S9(4) COMP.
           03 ANTP-LAUFZEIT                  PIC S9(4) COMP.
           03 ANTP-DYNAMIK                   PIC S9(3)V9(3) COMP-3.
           03 ANTP-ZUSATZ-1                  PIC S9(9)V9(3) COMP-3.
           03 ANTP-ZUSATZ-2                  PIC S9(9)V9(3) COMP-3.
           03 ANTP-EINH-AVERM                PIC S9(6)V9(2) COMP-3.
           03 ANTP-LAST-UPDATE               PIC X(26).
           03 ANTP-KENNUNG                   PIC X(8).
