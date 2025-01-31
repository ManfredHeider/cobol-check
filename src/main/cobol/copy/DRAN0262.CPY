      *---------------------------------------------------------------*
      *    Standard fuer alle Objekte unter PVCS VM
      *            Datum      :  13.01.2015
      *            Kategorie  :  Copystrecke
      *---------------------------------------------------------------*
      *    Copyright (c) 2015 ATLAS Dienstleistungen f. V. GmbH
      *---------------------------------------------------------------*
      *    $Workfile:   DRAN0262.CPY  $
      *    $Revision:   2.7  $
      *
      *    $Log:   L:/mf/CPY/DRAN0262.CPv  $
      *
      *   Rev 2.7   Feb 25 2016 10:08:28   t13ae23
      *AAN01240: Neue Feld "Fimenname (für DV-Antrag)" + 
      *Elektra 
      *- AGI, CKV - Deutsche Bank -
      *
      *   Rev 2.6   Feb 22 2016 14:20:24   t13ae23
      *AAN01240: Neue Feld "Fimenname (für DV-Antrag)"
      *
      *   Rev 2.5   Aug 12 2015 14:49:42   t13ae23
      *AAN01198: Deutsche Verrechnungsstelle Mittelstand  u. USt.pf
      *l. Prov. - Telefon u.a verlängern -
      *
      *   Rev 2.4   Jul 07 2015 15:54:56   t13ae23
      *AAN01198: Deutsche Verrechnungsstelle Mittelstand  u. USt.pf
      *l. Prov.
      *
      *   Rev 2.3   May 28 2015 09:53:46   t13ae34
      *AAN01211: Elektronischer Antrag - Änderungen eingereichtes G
      *eschäft - Einpflegen in Vorschlagsdaten
      *
      *   Rev 2.2   May 06 2015 11:04:34   t13ae34
      *AAN01211: Elektronischer Antrag - Änderungen eingereichtes G
      *eschäft - Einpflegen in Vorschlagsdaten
      *
      *   Rev 2.1   May 05 2015 16:08:40   t13ae23
      *AAN01198: Deutsche Verrechnungsstelle Mittelstand  u. USt.pf
      *l. Prov.
      *
      *   Rev 2.0   Jan 13 2015 13:46:02   t13ae23
      *Archiverstellung
      *
      *---------------------------------------------------------------*
      ****************************************************************
      *    COPY-MEMBER: DRAN0262                                     *
      *    FUNKTION   : UPDATE VNR IN DVM-BESTAND                    *
      *                                                              *
      ****************************************************************
      * AENDERUNGEN:                                                 *
      * AUFTRAG ! DATUM  !VER ! AENDERUNG                 ! NAME     *
      * -------------------------------------------------------------*
      * AAN01198!05.05.15!2.1 !NEU                        ! RAHNER   *
      * AAN01198!07.07.15!2.4 !NEU FELD EINR.GEBÜHR       ! RAHNER   *
      * AAN01198!11.08.15!2.5 !VERGRÖßERN FELDER          ! RAHNER   *
      * AAN01240!22.02.16!2.6 !NEU FELD FIRMA-NAME-LANG   ! RAHNER   *
      *         !        !    !                           !          *
      *         !        !    !                           !          *
      *         !        !    !                           !          *
      *                                                              *
      * ENDE-LOGBUCH                                                 *
      ****************************************************************
      *                                                              *
      *    DIESES COPY ENTHÄLT DIE EIN- UND AUSGABEPARAMETER         *
      *    FÜR DIE FUNKTION DRAN0262                                 *
      *    AUSSER: DEM FUNKTIONSNAMEN,                               *
      *            DEM ERR-ERROR-BEREICH UND                         *
      *            DEM STANDARD-STATUS-BEREICH                       *
      *            (JEWEILS SEPARATE COPYS)                          *
      *                                                              *
      ****************************************************************
       01 PI-DRAN0262.
           05 PI-DRAN0262-DVM-KEY.
               10 PI-DRAN0262-PGEB-GES       PIC X(2).
               10 PI-DRAN0262-DVM-HVANTNUM   PIC X(9).
               10 PI-DRAN0262-DVM-AVERM-E    PIC S9(9) COMP.
               10 PI-DRAN0262-DVM-AVERM-PZ-E PIC X(1).
      *
          05 PI-DRAN0262-DATEN.
               10 PI-DRAN0262-DVM-VNR             PIC S9(015)V COMP-3.
               10 PI-DRAN0262-DVM-VMNR-E          PIC S9(009) COMP.
               10 PI-DRAN0262-DVM-VMPZ-E          PIC X(001).
               10 PI-DRAN0262-DVM-VM-VORNA-E      PIC X(030).
               10 PI-DRAN0262-DVM-VM-ZUNA-E       PIC X(030).
      *
               10 PI-DRAN0262-DVM-FA-RF-E         PIC S9(004) COMP.
               10 PI-DRAN0262-DVM-FA-N1-E         PIC X(030).
               10 PI-DRAN0262-DVM-FA-N2-E         PIC X(030).
220216         10 PI-DRAN0262-DVM-FA-N-LANG-E     PIC X(070).
               10 PI-DRAN0262-DVM-FA-STR-E        PIC X(045).
               10 PI-DRAN0262-DVM-FA-PLZ-E        PIC X(015).
               10 PI-DRAN0262-DVM-FA-ORT-E        PIC X(050).
               10 PI-DRAN0262-DVM-FA-POSTF-E      PIC X(010).
               10 PI-DRAN0262-DVM-FA-PLZ-POSTF-E  PIC X(005).
               10 PI-DRAN0262-DVM-FA-ORT-POSTF-E  PIC X(040).
      *
110815*        10 PI-DRAN0262-DVM-FA-TELE-E       PIC X(015).
110815         10 PI-DRAN0262-DVM-FA-TELE-E       PIC X(030).
110815*        10 PI-DRAN0262-DVM-FA-FAX-E        PIC X(015).
110815         10 PI-DRAN0262-DVM-FA-FAX-E        PIC X(030).
110815*        10 PI-DRAN0262-DVM-FA-MOBIL-E      PIC X(015).
110815         10 PI-DRAN0262-DVM-FA-MOBIL-E      PIC X(030).
110815*        10 PI-DRAN0262-DVM-FA-EMAIL-E      PIC X(040).
110815         10 PI-DRAN0262-DVM-FA-EMAIL-E      PIC X(050).
      *
               10 PI-DRAN0262-DVM-FA-KZ-VST-E     PIC X(001).
               10 PI-DRAN0262-DVM-FA-ST-NR-E      PIC X(015).
               10 PI-DRAN0262-DVM-FA-HREG-AMTG-E  PIC X(050).
               10 PI-DRAN0262-DVM-FA-HREG-NR-E    PIC X(030).
               10 PI-DRAN0262-DVM-FA-INH-E        PIC X(100).
      *
               10 PI-DRAN0262-DVM-KZ-FAC-OPT-E    PIC X(001).
               10 PI-DRAN0262-DVM-UMSATZ-JAHR-E   PIC S9(009) COMP-3.
               10 PI-DRAN0262-DVM-KZ-GARANT-E     PIC X(001).
               10 PI-DRAN0262-DVM-KZ-GW-GES-E     PIC X(001).
               10 PI-DRAN0262-DVM-KZ-N-ERKL-E     PIC X(001).
      *
               10 PI-DRAN0262-DVM-VBEGINN-E       PIC S9(009) COMP.
      *
070715         10 PI-DRAN0262-DVM-EINRGEBUEHR-E   PIC X(001).
      *
               10 PI-DRAN0262-DVM-KIH-VN-E        PIC X(030).
               10 PI-DRAN0262-DVM-KIH-ZN-E        PIC X(030).
               10 PI-DRAN0262-DVM-KIH-ABW-STR-E   PIC X(045).
               10 PI-DRAN0262-DVM-KIH-ABW-PLZ-E   PIC X(015).
               10 PI-DRAN0262-DVM-KIH-ABW-ORT-E   PIC X(050).
               10 PI-DRAN0262-DVM-GELDINST-E      PIC X(058).
               10 PI-DRAN0262-DVM-IBAN-E          PIC X(034).
               10 PI-DRAN0262-DVM-BIC-E           PIC X(011).
               10 PI-DRAN0262-DVM-SEPA-M-BEG-E    PIC S9(009) COMP-3.
      *
               10 PI-DRAN0262-DVM-HAND            PIC X(001).
      *
       01 PO-DRAN0262.
          05 PO-DRAN0262-RC                   PIC X(003).
             88 PO-DRAN0262-RC-OK                  VALUE 'OK '.
             88 PO-DRAN0262-RC-NOK                 VALUE 'NOK'.
      ******** ENDE COPY-MEMBER **************************************




