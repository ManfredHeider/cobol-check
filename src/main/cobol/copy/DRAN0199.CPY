      *---------------------------------------------------------------*
      *    Standard fuer alle Objekte unter PVCS VM
      *            Datum      :  08.07.2008
      *            Kategorie  :  Copystrecke
      *---------------------------------------------------------------*
      *
      *---------------------------------------------------------------*
      *    Copyright (c) 2008 ATLAS Dienstleistungen f. V. GmbH
      *---------------------------------------------------------------*
      *    $Workfile:   DRAN0199.CPY  $
      *    $Revision:   2.7  $
      *
      *    $Log:   L:/mf/CPY/DRAN0199.CPv  $
      *
      *   Rev 2.7   Jul 25 2013 10:50:48   t13ae23
      *AAN01073: Projekt SEPA - Realisierung AN Österreich
      *GENERAL
      *I-LEBEN+SACH
      *
      *   Rev 2.6   May 15 2012 10:39:02   t13ae23
      *AAN01051: Neu Generali  "RISK Care" mit R6.16
      *
      *   Rev 2.5   Dec 14 2011 17:02:50   t13ae23
      *AAN01033: DVAG-Wien: Erweiterung Header-Datensatz für 26
      *
      *   Rev 2.4   May 27 2009 16:35:26   t13ae23
      *AAN00824: Elektronischer Antrag GENERALI Ges. 26 
      *- Beitrag
      *sfeld öffnen -
      *
      *   Rev 2.2   Nov 24 2008 14:20:18   t13ae23
      *AAN00824: Elektronischer Antrag GENERALI Ges. 26  Teil - Ant
      *rag Dialog-
      *
      *   Rev 2.1   Nov 24 2008 11:51:20   t13ae23
      *AAN00824: Elektronischer Antrag GENERALI Ges. 26  Teil - Ant
      *rag Dialog-
      *
      *   Rev 2.0   Jul 08 2008 10:34:08   i13ex34
      *Archiverstellung
      *
      *---------------------------------------------------------------*
      ****************************************************************
      *    COPY-MEMBER: DRAN0199  FUNKTION SELECT ÜBER GES, VN, AVERM*
      ****************************************************************
      * AENDERUNGEN:                                                 *
      * AUFTRAG ! DATUM  !VER ! AENDERUNG                 ! NAME     *
      * -------------------------------------------------------------*
      * AAN00824!24.11.08!2.1 ! NEUERSTELLUNG             ! RAHNER   *
      * AAN00824!23.05.09!2.2 ! ÖFFNEN BEITRAGSFELD       ! RAHNER   *
      * AAN01033!14.12.11!2.5 ! ERWEITERUNG DRAN0202      ! RAHNER   *
      * AAN01051!15.05.12!2.6 ! INTERNE ID-NUMMER GENERALI! RAHNER   *
      * AAN01073!25.07.13!2.7 ! SEPA                      ! RAHNER   *
      *         !        !    !                           !          *
      *                                                              *
      * ENDE-LOGBUCH                                                 *
      ****************************************************************
      *    DIESES COPY ENTHÄLT DIE EIN- UND AUSGABEPARAMETER         *
      *    FÜR DIE FUNKTION DRAN0199                                 *
      *    AUSSER: DEM FUNKTIONSNAMEN,                               *
      *            DEM ERR-ERROR-BEREICH UND                         *
      *            DEM STANDARD-STATUS-BEREICH                       *
      *            (JEWEILS SEPARATE COPYS)                          *
      *                                                              *
      *    >>>  SELECT  <<<       TABELLE GENL TBAN0012              *
      *                                                              *
      ****************************************************************
       01  PI-DRAN0199.
           05 PI-DRAN0199-GENL-KEY.
               10 PI-DRAN0199-PGEB-GES         PIC S9(4) COMP.
               10 PI-DRAN0199-GENL-HVANTNUM    PIC X(9).
               10 PI-DRAN0199-GENL-AVERM       PIC S9(9) COMP.
      *
       01  PO-DRAN0199.
           05 PO-DRAN0199-RC                   PIC  X(003).
             88 PO-DRAN0199-RC-OK                   VALUE 'OK '.
             88 PO-DRAN0199-RC-NOT-FOUND            VALUE 'NFD'.
             88 PO-DRAN0199-RC-KEY-NOT-UNIQUE       VALUE 'KNU'.
      *
           05 PO-DRAN0199-GENLB-DATEN.
               10 PO-DRAN0199-GENL-PIN         PIC S9(9) COMP.
               10 PO-DRAN0199-GENL-LAST-UPDATE PIC X(26).
               10 PO-DRAN0199-GENL-KENNUNG-A   PIC X(8).
      *    GENL-DATEN AUS PC-DATEN
           COPY DRAN0202.
      ****** ENDE COPY-MEMBER ****************************************

