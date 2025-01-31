      *---------------------------------------------------------------*
      *    Standard fuer alle Objekte unter PVCS VM
      *            Datum      :  18.05.2016
      *            Kategorie  :  Copystrecke
      *---------------------------------------------------------------*
      *    Copyright (c) 2016 ATLAS Dienstleistungen f. V. GmbH
      *---------------------------------------------------------------*
      *    $Workfile:   DRVB1139.CPY  $
      *    $Revision:   2.1  $
      *
      *    $Log:   L:/mf/CPY/DRVB1139.CPv  $
      *
      *   Rev 2.1   May 31 2016 07:57:50   t13ex30
      *AVB01400: Projekt Lucy2 - FIBU-Schnittstelle BOB/LBP PMRW0043
      *
      *   Rev 2.0   May 18 2016 15:34:38   t13ex30
      *Archiverstellung
      *
      *---------------------------------------------------------------*
      *****************************************************************
      *    COPY-MEMBER: DRVB1139                                      *
      *    --------------------------------------------------------   *
      *    SCHNITTSTELLE FÜR DAS JOIN-OZP ZJVB0028                    *
      *    --------------------------------------------------------   *
      *    ERSTELLT: H.WÖLFLIK                                        *
      *    DATUM:    18.05.2016                                       *
      *****************************************************************
      *    VERSION
      *****************************************************************
      * AENDERUNGEN:                                                  *
      * AUFTRAG ! DATUM  !VER ! AENDERUNG                 ! NAME      *
      * --------+--------+----+---------------------------+-----------*
      * AVB01400!18.05.16!2.1 ! NEU                       ! H.WÖLFLIK *
      *         !        !    !                           !           *
      *                                                               *
      *****************************************************************
      *                                                               *
      *    DIESES COPY ENTHÄLT DIE EIN- UND AUSGABEPARAMETER FÜR DIE  *
      *    FUNKTION DRVB1139 - ERMITTELN OFFENE ANSPRÜCHE AUS BOZA    *
      *                        INKL. UMSATZSTEUERPFLICHTIGE ANSPRÜCHE *
      *                                                               *
      *    AUSSER: DEM FUNKTIONSNAMEN,                                *
      *            DEM ERR-ERROR-BEREICH UND                          *
      *            DEM STANDARD-STATUS-BEREICH                        *
      *            (JEWEILS SEPARATE COPYS)                           *
      *                                                               *
      *****************************************************************
      *
       01  PI-DRVB1139.
           05  PI-DRVB1139-DATEN.
               10  PI-DRVB1139-UFKT-CODE          PIC  9(002).
               10  PI-DRVB1139-KNR-GESELL-TYP     PIC S9(004) COMP.
               10  PI-DRVB1139-KNR-ANSPR-STATUS   PIC S9(004) COMP.
               10  PI-DRVB1139-ANSPR-VOM-JJJJ     PIC  9(004).
               10  PI-DRVB1139-ANSPR-VOM-MM       PIC  9(002).
      *
       01  PO-DRVB1139.
           05  PO-DRVB1139-RC                     PIC  X(003).
               88  PO-DRVB1139-RC-OK                   VALUE 'OK '.
               88  PO-DRVB1139-RC-EOF                  VALUE 'EOF'.
           05  PO-DRVB1139-DATEN.
               10  PO-DRVB1139-BOZA-ST-NR         PIC S9(009) COMP.
               10  PO-DRVB1139-BOZA-ANSPR-VOM     PIC  X(010).
               10  PO-DRVB1139-KNR-ANSPR-GRUND    PIC S9(004) COMP.
               10  PO-DRVB1139-KTY-ANSPR-GRUND    PIC S9(004) COMP.
               10  PO-DRVB1139-BOZA-LAST-UPDATE   PIC  X(026).
               10  PO-DRVB1139-KTY-WAEHRUNG       PIC S9(004) COMP.
               10  PO-DRVB1139-KNR-WAEHRUNG       PIC S9(004) COMP.
               10  PO-DRVB1139-BOZA-ANSPR-BETRAG  PIC S9(009)V99 COMP-3.
               10  PO-DRVB1139-KTY-ANSPR-STATUS   PIC S9(004) COMP.
               10  PO-DRVB1139-KNR-ANSPR-STATUS   PIC S9(004) COMP.
               10  PO-DRVB1139-BOZA-ANSP-BET-UPFL PIC S9(009)V99 COMP-3.
      ****
      **** ENDE COPY DRVB1139 ****************************************
      ****

