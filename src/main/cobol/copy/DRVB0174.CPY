      *---------------------------------------------------------------*
      *    Standard für alle Objekte unter PVCS
      *            Datum   :  November 1995
      *            Kopf aus:  N:\PROFILE\KOPFCBL.DAT
      *---------------------------------------------------------------*
      *
      *---------------------------------------------------------------*
      *    Copyright 1995 ATLAS Dienstleistungs GmbH
      *---------------------------------------------------------------*
      *    $Workfile:   DRVB0174.CPY  $
      *    $Revision:   2.0  $
      *
      *    $Log:   L:\MF\CPY\DRVB0174.CPv  $
      *
      *   Rev 2.0   Feb 27 1999 15:58:18   P13SP20
      *NT-Umstellung
      *
      *   Rev 1.1   17 Oct 1997 11:58:22   T13AE35
      *AFVB0364 - Neuerstellung, SST PMVB0202-ZJVB0001, Daten
      *
      *   Rev 1.0   23 Jul 1997 12:10:44   P13SP99
      *Initial revision.
      *
      *---------------------------------------------------------------*
      *****************************************************************
      *    COPY-MEMBER: DRVB0174                                      *
      *    --------------------------------------------------------   *
      *    SCHNITTSTELLE FÜR DIE FUNKTION DRVB0174                    *
      *    --------------------------------------------------------   *
      *    ERSTELLT: Hering                                          *
      *    DATUM:    16.09.1997                                       *
      *****************************************************************
      *    VERSION
      ****************************************************************
      * AENDERUNGEN:                                                 *
      * AUFTRAG ! DATUM  !VER ! AENDERUNG                 ! NAME     *
      * -------------------------------------------------------------*
      * AFVB0364!16.09.97! 01 ! NEU                       ! HERING   *
      *         !        !    !                           !          *
      *         !        !    !                           !          *
      *                                                              *
      * ENDE-LOGBUCH                                                 *
      ****************************************************************
      *
      *    DIESES COPY ENTHÄLT DIE EIN- UND AUSGABEPARAMETER
      *    FÜR DIE FUNKTION DRVB0174
      *    AUSSER: DEM FUNKTIONSNAMEN,
      *            DEM ERR-ERROR-BEREICH UND
      *            DEM STANDARD-STATUS-BEREICH
      *            (JEWEILS SEPARATE COPYS)
      *
      ****************************************************************

       01  PI-DRVB0174.
           05  PI-DRVB0174-PROGRAMM             PIC X(008).
           05  PI-DRVB0174-UFKT-CODE            PIC 9(002).
           05  PI-DRVB0174-DATEN.
               10 PI-DRVB0174-ST-STUFE-VON       PIC S9(004) BINARY.
               10 PI-DRVB0174-ST-STUFE-BIS       PIC S9(004) BINARY.
               10 PI-DRVB0174-VP-STUFE-VON       PIC S9(004) BINARY.
               10 PI-DRVB0174-VP-STUFE-BIS       PIC S9(004) BINARY.

       01  PO-DRVB0174.
           05  PO-DRVB0174-RC                   PIC  X(003).
               88 PO-DRVB0174-RC-OK                        VALUE 'OK '.
               88 PO-DRVB0174-RC-LEER                      VALUE 'LER'.
               88 PO-DRVB0174-RC-EOF                       VALUE 'EOF'.
           05  Po-DRVB0174-DATEN.
               10 PO-DRVB0174-VB-NR             PIC S9(009) BINARY.
               10 PO-DRVB0174-DIR-NR            PIC S9(004) BINARY.
               10 PO-DRVB0174-MS-NR             PIC S9(004) BINARY.

      ******* ENDE COPY-MEMBER **************************************
