      *---------------------------------------------------------------*
      *    Standard fuer alle Objekte unter PVCS VM
      *            Datum      :  19.06.2007
      *            Kategorie  :  Copystrecke
      *---------------------------------------------------------------*
      *
      *---------------------------------------------------------------*
      *    Copyright (c) 2007 ATLAS Dienstleistungen f. V. GmbH
      *---------------------------------------------------------------*
      *    $Workfile:   DRVB0854.CPY  $
      *    $Revision:   2.1  $
      *
      *    $Log:   L:/mf/CPY/DRVB0854.CPv  $
      *
      *   Rev 2.1   18 Jul 2007 08:39:40   t13ae13
      *AVB00923: neue Aufstiegsbedingungen DVAG 2007 - MA erweitern
      *
      *   Rev 2.0   19 Jun 2007 17:41:20   t13ae30
      *Archiverstellung
      *
      *---------------------------------------------------------------*
      ***************************************************************
      * AENDERUNGEN:                                                 *
      * AUFTRAG ! DATUM  !VER ! AENDERUNG                 ! NAME     *
      * -------------------------------------------------------------*
      * AVB00905!18.06.07!2.1 ! NEU                       !TH.WILLIG *
      * AVB00923!        !    ! Neue Befbed 2007 für DVAG !          *
      *         !        !    !                           !          *
      *         !        !    !                           !          *
      *                                                              *
      * ENDE-LOGBUCH                                                 *
      ****************************************************************
      *                                                              *
      *    DIESES COPY ENTHÄLT DIE EIN- UND AUSGABEPARAMETER         *
      *    FÜR DIE FUNKTION DRVB0854                                 *
      *    ERMITTELN MA-BEFBED-NEU                                   *
      *    AUSSER: DEM FUNKTIONSNAMEN,                               *
      *            DEM ERR-ERROR-BEREICH UND                         *
      *            DEM STANDARD-STATUS-BEREICH                       *
      *            (JEWEILS SEPARATE COPYS)                          *
      *                                                              *
      ****************************************************************
       01 PI-DRVB0854.
          05 PI-DRVB0854-DATEN.
             10 PI-DRVB0854-MA-ST-NR         PIC S9(009) COMP.

      *
       01 PO-DRVB0854.
          05 PO-DRVB0854-RC                  PIC  X(003).
             88 PO-DRVB0854-RC-OK            VALUE 'OK '.
             88 PO-DRVB0854-RC-NFD           VALUE 'NFD'.
          05 PO-DRVB0854-DATEN.
             10 PO-DRVB0854-MA-REGISTER-NR   PIC X(30).
      ******** ENDE COPY-MEMBER **************************************
