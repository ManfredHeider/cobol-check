      *---------------------------------------------------------------*
      *    Standard fuer alle Objekte unter PVCS VM
      *            Datum      :  10.11.2006
      *            Kategorie  :  Copystrecke
      *---------------------------------------------------------------*
      *
      *---------------------------------------------------------------*
      *    Copyright (c) 2006 ATLAS Dienstleistungen f. V. GmbH
      *---------------------------------------------------------------*
      *    $Workfile:   CTAN0011.CPY  $
      *    $Revision:   2.1  $
      *
      *    $Log:   L:/mf/CPY/CTAN0011.CPv  $
      *
      *   Rev 2.1   10 Nov 2006 13:08:44   t13ae34
      *AAN00655: Erweiterung des PS auf 3 Stellen
      *
      *   Rev 2.0   10 Nov 2006 08:19:50   t13ae34
      *Archiverstellung
      *
      *---------------------------------------------------------------*

           EXEC SQL DECLARE TBAN0011 TABLE
           (
              PGEB_GES                       SMALLINT
                                             NOT NULL,
              PROD_PROD_SCHL                 SMALLINT
                                             NOT NULL,
              ANTQ_PLAUSI                    SMALLINT
                                             NOT NULL,
              ANTQ_GUELTIG_AB                DATE
                                             NOT NULL,
              ANTQ_GUELTIG_BIS               DATE
                                             NOT NULL
                                             WITH DEFAULT,
              ANTQ_WERT_NUM                  DECIMAL (12, 3)
                                             NOT NULL
                                             WITH DEFAULT,
              ANTQ_WERT_ALPHANUM             CHAR (30)
                                             NOT NULL
                                             WITH DEFAULT,
              ANTQ_LAST_UPDATE               TIMESTAMP
                                             NOT NULL
                                             WITH DEFAULT,
              ANTQ_KENNUNG                   CHAR (8)
                                             NOT NULL
                                             WITH DEFAULT
           )
           END-EXEC.


       01  DCL-TBAN0011.
           03 PGEB-GES                       PIC S9(4) COMP.
           03 PROD-PROD-SCHL                 PIC S9(4) COMP.
           03 ANTQ-PLAUSI                    PIC S9(4) COMP.
           03 ANTQ-GUELTIG-AB                PIC X(10).
           03 ANTQ-GUELTIG-BIS               PIC X(10).
           03 ANTQ-WERT-NUM                  PIC S9(9)V9(3) COMP-3.
           03 ANTQ-WERT-ALPHANUM             PIC X(30).
           03 ANTQ-LAST-UPDATE               PIC X(26).
           03 ANTQ-KENNUNG                   PIC X(8).
