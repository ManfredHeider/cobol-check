      *---------------------------------------------------------------*
      *    Standard für alle Objekte unter PVCS
      *            Datum   :  Mai 2002
      *            Kopf aus:  N:\PROFILE\KOPFCPY.DAT
      *---------------------------------------------------------------*
      *
      *---------------------------------------------------------------*
      *    Copyright (c) 2002 ATLAS Dienstleistungs GmbH
      *---------------------------------------------------------------*
      *    $Workfile:   DRVB0604.CPY  $
      *    $Revision:   2.1  $
      *
      *    $Log:   L:/mf/cpy/DRVB0604.CPv  $
      *
      *   Rev 2.1   Nov 15 2002 16:57:22   t13ae30
      *AVB00643 - Kapitäns-Club
      *
      *   Rev 2.0   Nov 05 2002 11:35:02   p13sp16
      *Archiverstellung
      *
      ****************************************************************
      *    COPY-MEMBER: DRVB0604                                     *
      *    FUNKTION KAPITÄNS-CLUB, AKTUELLE MITGLIEDER ERMITTELN     *
      *                                                              *
      *    --------------------------------------------------------- *
      *    ERSTELLT: WILLIG                                          *
      *    DATUM:    06.11.2002                                      *
      ****************************************************************
      *    VERSION   01                                              *
      ****************************************************************
      * AENDERUNGEN:                                                 *
      * AUFTRAG ! DATUM  !VER ! AENDERUNG                 ! NAME     *
      * -------------------------------------------------------------*
      * AVB00643!06.11.02! 01 ! NEUERSTELLUNG             ! WILLIG   *
      *         !        !    !                           !          *
      *         !        !    !                           !          *
      *                                                              *
      * ENDE-LOGBUCH                                                 *
      ****************************************************************
      *                                                              *
      *    DIESES COPY ENTHÄLT DIE EIN- UND AUSGABEPARAMETER         *
      *    FÜR DIE FUNKTION DRVB0604                                 *
      *    AUSSER: DEM FUNKTIONSNAMEN,                               *
      *            DEM ERR-ERROR-BEREICH UND                         *
      *            DEM STANDARD-STATUS-BEREICH                       *
      *            (JEWEILS SEPARATE COPYS)                          *
      *                                                              *
      ****************************************************************
       01 PI-DRVB0604.
          05 PI-DRVB0604-PROGRAMM           PIC  X(008).
          05 PI-DRVB0604-UFKT-CODE          PIC  9(002).
      *
       01 PO-DRVB0604.
          05 PO-DRVB0604-RC                 PIC  X(003).
             88 PO-DRVB0604-RC-OK                        VALUE 'OK '.
             88 PO-DRVB0604-RC-NFD                       VALUE 'NFD'.
             88 PO-DRVB0604-RC-LEER                      VALUE 'LER'.
             88 PO-DRVB0604-RC-EOF                       VALUE 'EOF'.
             88 PO-DRVB0604-RC-ERR                       VALUE 'ERR'.

          05 PO-DRVB0604-DATEN.
             10 PO-DRVB0604-MA-ST-NR        PIC  9(007)  COMP-3.
      *
      ******** Ende Copy-Member DRVB0604 *****************************
