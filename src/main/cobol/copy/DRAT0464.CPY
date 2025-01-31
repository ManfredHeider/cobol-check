      *---------------------------------------------------------------*
      *    Standard fuer alle Objekte unter PVCS VM
      *            Datum      :  06.08.2009
      *            Kategorie  :  Copystrecke
      *---------------------------------------------------------------*
      *
      *---------------------------------------------------------------*
      *    Copyright (c) 2009 ATLAS Dienstleistungen f. V. GmbH
      *---------------------------------------------------------------*
      *    $Workfile:   DRAT0464.CPY  $
      *    $Revision:   2.1  $
      *
      *    $Log:   L:/mf/CPY/DRAT0464.CPv  $
      *
      *   Rev 2.1   Aug 14 2009 09:01:50   t13ex14
      *AKI00779: Änderung DTA- u. Ablaufkontrolle bzgl. Lfdnr.
      *
      *   Rev 2.0   Aug 06 2009 11:05:40   t13ex14
      *Archiverstellung
      *
      *---------------------------------------------------------------*
      *****************************************************************
      *    COPY-MEMBER: DRAT0464                                      *
      *    --------------------------------------------------------   *
      *    SCHNITTSTELLE FÜR DIE FUNKTION DRAT0464                    *
      *    --------------------------------------------------------   *
      *****************************************************************
      *    VERSION
      ****************************************************************
      * AENDERUNGEN:                                                 *
      * AUFTRAG ! DATUM  !VER ! AENDERUNG                 ! NAME     *
      * -------------------------------------------------------------*
      * AKI00779!03.08.09!    ! Neu                       ! WMI      *
      *         !        !    !                           !          *
      *                                                              *
      * ENDE-LOGBUCH                                                 *
      ****************************************************************
      *
      *    DIESES COPY ENTHÄLT DIE EIN- UND AUSGABEPARAMETER
      *    FÜR DIE FUNKTION DRAT0464
      *    AUSSER: DEM FUNKTIONSNAMEN,
      *            DEM ERR-ERROR-BEREICH UND
      *            DEM STANDARD-STATUS-BEREICH
      *            (JEWEILS SEPARATE COPYS)
      *
      *    >>>  SELECT  <<<
      *
      ****************************************************************
      *
       01  PI-DRAT0464.
           05  PI-DRAT0464-KEY.


             10 PI-DRAT0464-DTAMANDANTNR   PIC S9(9) COMP.
             10 PI-DRAT0464-DTAPARTGESID   PIC S9(4) COMP.
             10 PI-DRAT0464-DTAJOBNAME     PIC X(8).
             10 PI-DRAT0464-DTAGDGSTATUS   PIC X(1).

      *
       01  PO-DRAT0464.
           05  PO-DRAT0464-RC                 PIC  X(003).
               88 PO-DRAT0464-RC-OK           VALUE 'OK '.
               88 PO-DRAT0464-RC-NOT-FOUND    VALUE 'NFD'.
      *
           05  PO-DRAT0464-DATEN.


             10 PO-DRAT0464-DTALFN           PIC S9(9) COMP.


      *
      ******* ENDE COPY-MEMBER **************************************
