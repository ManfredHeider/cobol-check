      *---------------------------------------------------------------*
      *    Standard fuer alle Objekte unter PVCS VM
      *            Datum      :  27.10.2006
      *            Kategorie  :  Copystrecke
      *---------------------------------------------------------------*
      *
      *---------------------------------------------------------------*
      *    Copyright (c) 2006 ATLAS Dienstleistungen f. V. GmbH
      *---------------------------------------------------------------*
      *    $Workfile:   DRAN0161.CPY  $
      *    $Revision:   2.1  $
      *
      *    $Log:   L:/mf/CPY/DRAN0161.CPv  $
      *
      *   Rev 2.1   16 Nov 2006 10:34:12   t13ae23
      *AAN00655: Erweiterung des PS auf 3 Stellen
      *
      *   Rev 2.0   27 Oct 2006 10:22:44   t13ae23
      *Archiverstellung
      *
      *---------------------------------------------------------------*
      ****************************************************************
      *    COPY-MEMBER: DRAN0161  FUNKTION SELECT ÜBER GES, VNR      *
      ****************************************************************
      * AENDERUNGEN:                                                 *
      * AUFTRAG ! DATUM  !VER ! AENDERUNG                 ! NAME     *
      * -------------------------------------------------------------*
      * AAN00655!27.10.06!2.1 ! NEUERSTELLUNG             ! RAHNER   *
      *         !        !    !                           !          *
      *         !        !    !                           !          *
      *         !        !    !                           !          *
      *                                                              *
      * ENDE-LOGBUCH                                                 *
      ****************************************************************
      *    DIESES COPY ENTHÄLT DIE EIN- UND AUSGABEPARAMETER         *
      *    FÜR DIE FUNKTION DRAN0161                                 *
      *    AUSSER: DEM FUNKTIONSNAMEN,                               *
      *            DEM ERR-ERROR-BEREICH UND                         *
      *            DEM STANDARD-STATUS-BEREICH                       *
      *            (JEWEILS SEPARATE COPYS)                          *
      *                                                              *
      *    >>>  SELECT  <<<       TABELLE ANTS TBAN0011              *
      *                                                              *
      ****************************************************************
       01 PI-DRAN0161.
          05 ANTS-KEY.
             10 PGEB-GES                      PIC S9(4) COMP.
             10 ANTS-NR                       PIC S9(15)V COMP-3.
      *
       01 PO-DRAN0161.
          05 PO-DRAN0161-RC                   PIC X(003).
             88 PO-DRAN0161-RC-OK                 VALUE 'OK '.
             88 PO-DRAN0161-RC-NOT-FOUND          VALUE 'NFD'.
             88 PO-DRAN0161-RC-KEY-NOT-UNIQUE     VALUE 'KNU'.
      *
          05 PO-DRAN0161-ANTS-DATEN.
             10 PO-DRAN0161-PGEB-GES          PIC S9(4) COMP.
             10 PO-DRAN0161-ANTS-PIN          PIC S9(9) COMP.
             10 PO-DRAN0161-ANTS-NR           PIC S9(15)V COMP-3.
             10 PO-DRAN0161-ANTS-FREI         PIC X.
             10 PO-DRAN0161-ANTS-AVERM        PIC S9(9) COMP.
      ****** ENDE COPY-MEMBER ****************************************
