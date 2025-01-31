      *---------------------------------------------------------------*
      *    Standard für alle Objekte unter PVCS
      *            Datum   :  Januar 1999
      *            Kopf aus:  N:\PROFILE\KOPFCPY.DAT
      *---------------------------------------------------------------*
      *
      *---------------------------------------------------------------*
      *    Copyright 1999 ATLAS Dienstleistungs GmbH
      *---------------------------------------------------------------*
      *    $Workfile:   DRVB0505.CPY  $
      *    $Revision:   2.1  $
      *
      *    $Log:   L:\MF\CPY\DRVB0505.CPv  $
      *
      *   Rev 2.1   06 Oct 2000 10:40:36   T13AE30
      * 
      *
      *   Rev 2.0   07 Sep 2000 11:32:04   P13SP13
      *Archiverstellung
      *
      *---------------------------------------------------------------*
      *    COPY-MEMBER: DRVB0505                                      *
      *    --------------------------------------------------------   *
      *    SCHNITTSTELLE FUER DAS UPRO ZWVB0012                       *
      *    MIT DEN DATEN, DIE EINMAL PRO UPRO UEBERGEBEN WERDEN       *
      *    --------------------------------------------------------   *
      *    ERSTELLT: TH.WILLIG                                        *
      *    DATUM:    20.09.2000                                       *
      *****************************************************************
      *    VERSION  1
      ****************************************************************
      * AENDERUNGEN:                                                 *
      * AUFTRAG ! DATUM  !VER ! AENDERUNG                 ! NAME     *
      * -------------------------------------------------------------*
      * ASL00067!20.09.00!2.1 ! NEUERSTELLUNG             ! TH.WILLIG*
      *         !        !    !                           !          *
      *         !        !    !                           !          *
      *                                                              *
      * ENDE-LOGBUCH                                                 *
      ****************************************************************
      ****************************************************************
      *    DIESES COPY ENTHÄLT DIE EIN- UND AUSGABEPARAMETER         *
      *    FUER DIE FUNKTION DRVB0505                                *
      *    AUSSER: DEM FUNKTIONSNAMEN,                               *
      *            DEM ERR-ERROR-BEREICH UND                         *
      *            DEM STANDARD-STATUS-BEREICH                       *
      *            (JEWEILS SEPARATE COPYS)                          *
      *                                                              *
      ****************************************************************
      *
      *
       01 PI-DRVB0505.
          05 PI-DRVB0505-MA-ST-NR           PIC S9(009) COMP.
      *
       01 PO-DRVB0505.
          05 PO-DRVB0505-RC                 PIC X(003).
             88 PO-DRVB0505-RC-OK                        VALUE 'OK '.
             88 PO-DRVB0505-RC-LEER                      VALUE 'LER'.
             88 PO-DRVB0505-RC-EOF                       VALUE 'EOF'.
             88 PO-DRVB0505-RC-NOT-FOUND                 VALUE 'NFD'.

          05 PO-DRVB0505-DATEN.
             10 PO-DRVB0505-MS-NR           PIC S9(004) COMP.
             10 PO-DRVB0505-DATE-DAT-VON    PIC  X(010).
      *
      ****************** ENDE COPY-MEMBER DRVB0505 *********************
