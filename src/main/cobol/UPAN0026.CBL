       IDENTIFICATION DIVISION.
       PROGRAM-ID.    UPAN0026.
      *****************************************************************
      * LOGBUCH:                                                      *
      * AUFTRAG    ! DATUM  ! AENDERUNG                    ! NAME     *
      * --------------------------------------------------------------*
      * ANTRAG-1120!TT.MM.JJ! NEU                          ! HEIDER   *
      * ANTRAG-1139!03.08.21! PROBLEME ED                  ! HEIDER   *
      * ANTRAG-1148!12.08.21! Z-RC FÜLLEN AUS ORIGINAL-FKT ! HEIDER   *
      * ANTRAG-1160!18.08.21! DRPA0200                     ! HEIDER   *
      * ANTRAG-1189!01.09.21! ABBRUCH DRPA0846 - BETRAG = 0! HEIDER   *
      * ANTRAG-1209!05.10.21! ZUGRIFF KONFIGURATION EGG    ! HEIDER   *
      * ANTRAG-1276!11.11.21! DRPA1652 DRPA1267            ! HEIDER   *
      * ANTRAG-1316!07.12.21! DRAN0310-> NOT-FOUND         ! HEIDER   *
      * ANTRAG-1363!14.01.22! LAUFZEITABHÄNGIGE GP         ! HEIDER   *
      * ANTRAG-1316!08.04.22! drpa1348 drpa1381            ! HEIDER   *
      * DSY-4734   !23.06.22! PI-DRPA0267 ERWEITERT        ! STORCH   *
      * ANTRAG-1810!27.10.22! OPTIMIEREN DRPA0284          ! HEIDER   *
      *                                                               *
      * ENDE-LOGBUCH                                                  *
      *****************************************************************
      *****************************************************************
      *
      *   DAS UNTERPROGRAMM BÜNDELT DIE ZUGRIFFE AUF DEN
      *   KONFIGURATIONSTAND IM EINGEREICHTEN GESCHÄFT (EGG).
      *   DURCH DIE ABLÖSUNG DES ZUGRIFFS VOM ABGERECHNETEN GESCHÄFTS
      *   (AGG) AUF EGG WIRD ÜBER EINEN SCHALTER (KTY=457) ENTSCHIEDEN,
      *   OB ZUR URSPRÜNGLICHEN AGG-FUNKTION DURCHGEROUTET WIRD ODER DIE
      *   NEUE EGG-FUNKTIONALITÄT MIT ZUGRIFF AUF
      *   EGG-KONFIGURATIONSBESTAND GENUTZT WIRD.
      *
      *
      *****************************************************************
      *                                                               *
      *   ALLGEMEINE VERARBEITUNGSHINWEISE                            *
      *   --------------------------------                            *
      *                                                               *
      *   FUER JEDE NEUE FUNKTION MUESSEN ALLE ROUTINEN UND DATEN-    *
      *   FELDER MIT 'SSNNNN' DUPLIZIERT WERDEN.                      *
      *                                                               *
      *   FOLGENDE VORKOMMENDEN ZEICHENKETTEN SIND ZU ERSETZEN:       *
      *                                                               *
      *    - 'UPAN0026' DURCH PROGRAMMNAMEN                           *
      *    - 'DRPA0822' DURCH FUNKTIONSNAMEN                          *
      *    - 'DRAN0386' DURCH NAME DES COPYS MIT DEN FKT-NAMEN        *
      *    - 'DRSSXXXX' DURCH FUNKTIONSNAMEN AUFGERUFENER UPROS       *
      *    - '...'      DURCH PASSENDES (Z. B. DATENFELDNAMEN)        *
      *                                                               *
      *   ALLE FELDER DES PO-BEREICHS MUESSEN EXPLIZIT GEFUELLT       *
      *   WERDEN.                                                     *
      *                                                               *
      *****************************************************************
      *
      *   PARAMETERBESCHREIBUNG
      *   IN     : PI-UPAN0026
      *          : PI-EINGABE
      *   OUT    : PO-RUECKGABE
      *            ERR-ERROR-BEREICH
      *   IN/OUT : STANDARD-STATUS-BEREICH
      *
      *   VERWENDETE UEBERGABEBEREICHE
      *
      *   COPY   : DRAN0386
      *   IN     : PI-UPAN0026
      *
      *   COPY   : DRPA0822
      *   IN     : PI-DRPA0822
      *   OUT    : PO-DRPA0822
      *
      *   ...(je Übergabebereich)
      *
      *****************************************************************
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
               DECIMAL-POINT IS COMMA.
       DATA DIVISION.
      *****************************************************************
       WORKING-STORAGE SECTION.
      *****************************************************************
       01  FILLER.
           05  FILLER               PIC  X(026)
                                    VALUE '** WORKING-STORAGE      **'.
      *
       01  TABELLEN-BEREICH.
           05 FILLER                PIC  X(026)
                                    VALUE '** TABELLEN-BEREICH     **'.

      **** RATENZAHLUNGSZUSCHLAGTABELLE-TABELLE
       01  TABELLE-RZAHLUNG.
      **** GES. 10
           05  FILLER.
               10  T-RZAHL-GES           PIC S9(004)      BINARY sync
                                         VALUE 10.
               10  T-RZAHL-KNR-ZAHLWEISE PIC S9(004)      BINARY sync
                                         VALUE 1.
               10  T-RZAHL-GUELTIG-AB    PIC S9(008)      BINARY sync
                                         VALUE 19700101.
               10  T-RZAHL-GUELTIG-BIS   PIC S9(008)      BINARY sync
                                         VALUE 99991231.
               10  T-RZAHL-ZUSCHLAG      PIC S9(003)V999  BINARY sync
                                         VALUE  00,000.
             05  FILLER.
               10  T-RZAHL-GES           PIC S9(004)      BINARY sync
                                         VALUE 10.
               10  T-RZAHL-KNR-ZAHLWEISE PIC S9(004)      BINARY sync
                                         VALUE 2.
               10  T-RZAHL-GUELTIG-AB    PIC S9(008)      BINARY sync
                                         VALUE 19700101.
               10  T-RZAHL-GUELTIG-BIS   PIC S9(008)      BINARY sync
                                         VALUE 99991231.
               10  T-RZAHL-ZUSCHLAG      PIC S9(003)V999  BINARY sync
                                         VALUE  03,000.
             05  FILLER.
               10  T-RZAHL-GES           PIC S9(004)      BINARY sync
                                         VALUE 10.
               10  T-RZAHL-KNR-ZAHLWEISE PIC S9(004)      BINARY sync
                                         VALUE 4.
               10  T-RZAHL-GUELTIG-AB    PIC S9(008)      BINARY sync
                                         VALUE 19700101.
               10  T-RZAHL-GUELTIG-BIS   PIC S9(008)      BINARY sync
                                         VALUE 99991231.
               10  T-RZAHL-ZUSCHLAG      PIC S9(003)V999  BINARY sync
                                         VALUE  05,000.
             05  FILLER.
               10  T-RZAHL-GES           PIC S9(004)     BINARY  sync
                                         VALUE 10.
               10  T-RZAHL-KNR-ZAHLWEISE PIC S9(004)     BINARY  sync
                                         VALUE 6.
               10  T-RZAHL-GUELTIG-AB    PIC S9(008)     BINARY  sync
                                         VALUE 19700101.
               10  T-RZAHL-GUELTIG-BIS   PIC S9(008)      BINARY sync
                                         VALUE 99991231.
               10  T-RZAHL-ZUSCHLAG      PIC S9(003)V999 BINARY  sync
                                         VALUE  07,000.
             05  FILLER.
               10  T-RZAHL-GES           PIC S9(004)     BINARY  sync
                                         VALUE 10.
               10  T-RZAHL-KNR-ZAHLWEISE PIC S9(004)     BINARY  sync
                                         VALUE 8.
               10  T-RZAHL-GUELTIG-AB    PIC S9(008)     BINARY  sync
                                         VALUE 19700101.
               10  T-RZAHL-GUELTIG-BIS   PIC S9(008)      BINARY sync
                                         VALUE 99991231.
               10  T-RZAHL-ZUSCHLAG      PIC S9(003)V999 BINARY  sync
                                           VALUE  00,000.
      ****  GES. 81
           05  FILLER.
               10  T-RZAHL-GES           PIC S9(004)      BINARY SYNC
                                         VALUE 81.
               10  T-RZAHL-KNR-ZAHLWEISE PIC S9(004)      BINARY SYNC
                                         VALUE 1.
               10  T-RZAHL-GUELTIG-AB    PIC S9(008)      BINARY SYNC
                                         VALUE 19700101.
               10  T-RZAHL-GUELTIG-BIS   PIC S9(008)      BINARY SYNC
                                         VALUE 99991231.
               10  T-RZAHL-ZUSCHLAG      PIC S9(003)V999  BINARY SYNC
                                         VALUE  00,000.
             05  FILLER.
               10  T-RZAHL-GES           PIC S9(004)      BINARY SYNC
                                         VALUE 81.
               10  T-RZAHL-KNR-ZAHLWEISE PIC S9(004)      BINARY SYNC
                                         VALUE 2.
               10  T-RZAHL-GUELTIG-AB    PIC S9(008)      BINARY SYNC
                                         VALUE 19700101.
               10  T-RZAHL-GUELTIG-BIS   PIC S9(008)      BINARY SYNC
                                         VALUE 99991231.
               10  T-RZAHL-ZUSCHLAG      PIC S9(003)V999  BINARY SYNC
                                         VALUE  03,000.
             05  FILLER.
               10  T-RZAHL-GES           PIC S9(004)      BINARY SYNC
                                         VALUE 81.
               10  T-RZAHL-KNR-ZAHLWEISE PIC S9(004)      BINARY SYNC
                                         VALUE 4.
               10  T-RZAHL-GUELTIG-AB    PIC S9(008)      BINARY SYNC
                                         VALUE 19700101.
               10  T-RZAHL-GUELTIG-BIS   PIC S9(008)      BINARY SYNC
                                         VALUE 99991231.
               10  T-RZAHL-ZUSCHLAG      PIC S9(003)V999  BINARY SYNC
                                         VALUE  05,000.
             05  FILLER.
               10  T-RZAHL-GES           PIC S9(004)     BINARY  SYNC
                                         VALUE 81.
               10  T-RZAHL-KNR-ZAHLWEISE PIC S9(004)     BINARY  SYNC
                                         VALUE 6.
               10  T-RZAHL-GUELTIG-AB    PIC S9(008)     BINARY  SYNC
                                         VALUE 19700101.
               10  T-RZAHL-GUELTIG-BIS   PIC S9(008)      BINARY SYNC
                                         VALUE 99991231.
               10  T-RZAHL-ZUSCHLAG      PIC S9(003)V999 BINARY  SYNC
                                         VALUE  05,000.
             05  FILLER.
               10  T-RZAHL-GES           PIC S9(004)     BINARY  SYNC
                                         VALUE 81.
               10  T-RZAHL-KNR-ZAHLWEISE PIC S9(004)     BINARY  SYNC
                                         VALUE 8.
               10  T-RZAHL-GUELTIG-AB    PIC S9(008)     BINARY  SYNC
                                         VALUE 19700101.
               10  T-RZAHL-GUELTIG-BIS   PIC S9(008)      BINARY SYNC
                                         VALUE 99991231.
               10  T-RZAHL-ZUSCHLAG      PIC S9(003)V999 BINARY  SYNC
                                           VALUE  00,000.
      *
      **** LADEN DER RATENZAHLUNG IN EINE INTERNE TABELLE
       01  TABELLE-1   REDEFINES TABELLE-RZAHLUNG.
           05  TAB1              OCCURS 14
                                 INDEXED BY TAB1-IND.
               10  T-GES                 PIC S9(004)     BINARY SYNC.
               10  T-KNR-ZAHLWEISE       PIC S9(004)     BINARY SYNC.
               10  T-GUELTIG-AB          PIC S9(008)     BINARY SYNC.
               10  T-GUELTIG-BIS         PIC S9(008)     BINARY SYNC.
               10  T-RZAHLUNG-ZUSCHLAG   PIC S9(003)V999 BINARY SYNC.
      *
       01  Z-TAB1-MAX                    PIC S9(04) COMP VALUE 14.

      *    TABELLE HAUPTTARIFE KTY=423
       01  TABELLE-KTY423.
           05  TAB-KTY423        OCCURS 1 TO 99999
                                 DEPENDING ON I-KTY423-MAX
                                 ASCENDING T-KTY423-PGEB-GES,
                                 ASCENDING T-KTY423-ANTQ-WERT-ALPHANUM
                                 INDEXED BY I-KTY423.
             10 T-KTY423-PGEB-GES        PIC S9(4) COMP.
             10 T-KTY423-PROD-PROD-SCHL  PIC S9(4) COMP.
             10 T-KTY423-ANTQ-WERT-ALPHANUM
                                         PIC X(30).
             10 T-KTY423-ANTQ-GUELTIG-AB
                                         PIC X(10).
             10 T-KTY423-ANTQ-GUELTIG-BIS
                                         PIC X(10).

      *    TABELLE NPM-Felder KTY=176
       01 TABELLE-DRPA1348.
          05 T-DRPA1348-NPM-FELD-TAB          OCCURS 30.
            10 T-DRPA1348-KNR-NPM-FELD-NAME   PIC  S9(004) BINARY.
            10 T-DRPA1348-KNR-NPM-FELD-ZUL    PIC  S9(004) BINARY.
            10 T-DRPA1348-KONF-Z-INFO         PIC  S9(004) BINARY.

          05 TAB-KTY176-NPM-FELD-TAB        OCCURS 30.
            10 T-KTY176-KNR-NPM-FELD-NAME   PIC  9(003).

      *
      *****************************************************************
       01  I-FELDER.
      **** INTERNE TABELLE MIT EINTRÄGEN KTY=423 AUS ANTQ
           05  I-KTY423-MAX      PIC S9(5) BINARY VALUE 0.
           05  I-01              PIC S9(5) BINARY VALUE 0.
           05  I-02              PIC S9(5) BINARY VALUE 0.
           05  I-03              PIC S9(5) BINARY VALUE 0.
      *
      *****************************************************************
       01  KONSTANTEN.
           05 FILLER                PIC  X(026)
                                    VALUE '** KONSTANTEN           **'.

           05 K-PGM-NAME            PIC  X(008)       VALUE 'UPAN0026'.

           05 K-UPAN0010            PIC X(008)        VALUE 'UPAN0010'.
           05 K-UPPA0007            PIC X(008)        VALUE 'UPPA0007'.
           05 K-UPPA0027            PIC X(008)        VALUE 'UPPA0027'.
           05 K-UPPA0031            PIC X(008)        VALUE 'UPPA0031'.
           05 K-UPPA0065            PIC X(008)        VALUE 'UPPA0065'.
           05 K-UPPA0088            PIC X(008)        VALUE 'UPPA0088'.
           05 K-ZTAN0011            PIC X(008)        VALUE 'ZTAN0011'.
           05 K-ZTAN0014            PIC X(008)        VALUE 'ZTAN0014'.
           05 K-ZWAT0008            PIC X(008)        VALUE 'ZWAT0008'.
           05 K-ZWPA0004            PIC X(008)        VALUE 'ZWPA0004'.
           05 K-ZXAN0011            PIC X(008)        VALUE 'ZXAN0011'.
           05 K-ZXPA0009            PIC X(008)        VALUE 'ZXPA0009'.

           05 K-PRODUKT-9999        PIC 9(004)        VALUE 9999.
           05 K-PGEB-9999           PIC 9(004)        VALUE 9999.
      ***  KONSTANTE FÜR AN32 DIALOG ZUM VERZWEIGEN
           05 K-ANTRAG-NUR-ANZEIGEN-TRANSAKT PIC X(20)
                  VALUE 'ANTRAG-NUR-ANSEHEN-A'.

      *    STANDARD-KONSTANTEN
           COPY DRAT0009.

      *    KONSTANTEN-TYPEN (KTY)
           COPY DRAT0044.

      *    KONSTANTEN-TYPEN (KTY) FÜR VERTRIEBSGESELLSCHAFT
           COPY DRAT0058.

      *    KONSTANTEN PRODUKTGEBER-GESELLSCHAFTEN
           COPY DRAT0084.

      *    RETURNCODE-KONSTANTEN
           COPY DRAT0107.

      *    KONSTANTEN KTY=435 UND KTY=119 - KONDITIONS-REGEL
      *    GRUNDPROVISION
           COPY DRAT0155.

      *    KNR-AUSPRÄGUNGEN ZU ANTRAG-ZAHLWEISEN KTY-421 -
           COPY DRAT0421.

      *    KNR-AUSPRÄGUNGEN ZU KTY-457 - K-KTY-AN-KONFIGURATION
           COPY DRAT0632.

      *    OPERATIONSCODE-KONSTANTEN FÜR BLÄTTER-/LIST-OZP
           COPY DRAT0108.

      *    KONSTANTEN kty=176 Arten NPM Felder
           COPY DRat0310.

      *    KONSTANTEN kty=176 Ausprägungen NPM Felder
           COPY DRat0311.

      *    KONSTANTEN kty=186 Arten Kardinalitätsbeziehung
           COPY DRat0325.

      *    KONSTANTEN kty=186 Ausprägungen Kardinalitätsbeziehung
           COPY DRat0326.

      *    Konstanten Daisy
           copy drpa0240.

      *

      *****************************************************************
       01  PARAMETER-BEREICH.
           05 FILLER                PIC  X(026)
                                    VALUE '** PARAMETER-BEREICH    **'.
      ***  UPAN0010 - FUNKTIONEN
           COPY DRAN0023.
      ***  -> DIE FUNKTIONEN ZU UPAN0010 WERDEN VOM UPAN0026 GEROUTET

      ***  UPPA0007 - FUNKTIONEN
           COPY DRPA0129.
      ***  -> DIE FUNKTIONEN ZU UPPA0007 WERDEN VOM UPAN0026 GEROUTET

      ***  ZWPA0004 - FUNKTIONEN
           COPY DRPA0199.
      ***  -> DIE FUNKTIONEN ZU ZWPA0004 WERDEN VOM UPAN0026 GEROUTET

      ***  UPPA0027 - FUNKTIONEN
           COPY DRPA1307.
      ***  -> DIE FUNKTIONEN ZU UPPA0027 WERDEN VOM UPAN0026 GEROUTET

      ***  UPPA0031 - FUNKTIONEN
           COPY DRPA0266.
      ***  -> DIE FUNKTIONEN ZU UPPA0031 WERDEN VOM UPAN0026 GEROUTET

      ***  UPPA0065 - FUNKTIONEN
           COPY DRPA0497.
      ***  -> DIE FUNKTIONEN ZU UPPA0065 WERDEN VOM UPAN0026 GEROUTET

      ***  UPPA0088 - FUNKTIONEN
           COPY DRPA0821.
      ***  -> DIE FUNKTIONEN ZU UPPA0088 WERDEN VOM UPAN0026 GEROUTET

      ***  ZWAT0008 - FUNKTIONEN
           COPY DRAT0138.

      ***  ZXPA0009 - FUNKTIONEN
           COPY DRPA0283.

      ***  FUNKTION - LESEN TBAT0008 ÜBER KTY, KNR
           COPY DRAT0151.
      *
      *************
      ***  ZTAN0011 - FUNKTIONEN
           COPY DRAN0168.
      ***  FUNKTION - SELECT TBAN0011 ANTQ
           COPY DRAN0172.
      *************
      *
      *************
      ***  ZTAN0014 - FUNKTIONEN
           COPY DRAN0229.
      ***  FUNKTION - SELECT TBAN0014 ANLZ - FACHLICHER SELECT
           COPY DRAN0372.
      *************
      *
      *************
      ***  ZXAN0011 - FUNKTIONEN
           COPY DRAN0319.
      ***  FUNKTION - LIST ANTQ - AKTUELLE EINTRÄGE ZU PGEB UND PLAUSI
           COPY DRAN0320.
      *************
      *
      *****************************************************************
       01  SCHALTER-STEUERFELDER.
           05 FILLER                PIC  X(026)
                                    VALUE '** SCHALTER/STEUERFELDER *'.
           05  S-KNR-AN-KONF-EGG-PRKO    PIC  X(03) VALUE SPACE.
               88 S-KNR-AN-KONF-EGG-PRKO-UNDEF      VALUE SPACE.
               88 S-KNR-AN-KONF-EGG-PRKO-JA         VALUE 'EGG'.
               88 S-KNR-AN-KONF-EGG-PRKO-NEIN       VALUE 'AGG'.
           05  S-KNR-AN-KONF-EGG-ZVP    PIC  X(03)  VALUE SPACE.
               88 S-KNR-AN-KONF-EGG-ZVP-UNDEF       VALUE SPACE.
               88 S-KNR-AN-KONF-EGG-ZVP-JA          VALUE 'EGG'.
               88 S-KNR-AN-KONF-EGG-ZVP-NEIN        VALUE 'AGG'.
           05  S-KNR-AN-KONF-EGG-PGRP    PIC  X(03) VALUE SPACE.
               88 S-KNR-AN-KONF-EGG-PGRP-UNDEF      VALUE SPACE.
               88 S-KNR-AN-KONF-EGG-PGRP-JA         VALUE 'EGG'.
               88 S-KNR-AN-KONF-EGG-PGRP-NEIN       VALUE 'AGG'.
           05  S-KNR-AN-KONF-EGG-PGTA    PIC  X(03) VALUE SPACE.
               88 S-KNR-AN-KONF-EGG-PGTA-UNDEF      VALUE SPACE.
               88 S-KNR-AN-KONF-EGG-PGTA-JA         VALUE 'EGG'.
               88 S-KNR-AN-KONF-EGG-PGTA-NEIN       VALUE 'AGG'.
           05  S-KNR-AN-KONF-EGG-PGKF    PIC  X(03) VALUE SPACE.
               88 S-KNR-AN-KONF-EGG-PGKF-UNDEF      VALUE SPACE.
               88 S-KNR-AN-KONF-EGG-PGKF-JA         VALUE 'EGG'.
               88 S-KNR-AN-KONF-EGG-PGKF-NEIN       VALUE 'AGG'.
           05  S-KNR-AN-KONF-EGG-PROD    PIC  X(03) VALUE SPACE.
               88 S-KNR-AN-KONF-EGG-PROD-UNDEF      VALUE SPACE.
               88 S-KNR-AN-KONF-EGG-PROD-JA         VALUE 'EGG'.
               88 S-KNR-AN-KONF-EGG-PROD-NEIN       VALUE 'AGG'.

           05 S-SUCHEN                   PIC 9.
              88 S-SUCHEN-NOK                       VALUE ZERO.
              88 S-SUCHEN-OK                        VALUE 1.

           05  S-KTY423-TABELLE          PIC 9(01)  VALUE ZERO.
               88 S-KTY423-TABELLE-GEFUELLT         VALUE 1.
           05  S-KTY423-SUCHEN           PIC 9(01)  VALUE ZERO.
               88 S-KTY423-SUCHEN-NOK               VALUE 0.
               88 S-KTY423-SUCHEN-OK                VALUE 1.
271022     05  S-LETZTES-ZEICHEN         PIC 9(01)  VALUE ZERO.
271022         88 S-LETZTES-ZEICHEN-INIT            VALUE 0.
271022         88 S-LETZTES-ZEICHEN-NUMERISCH       VALUE 1.
      *
      *****************************************************************
       01  DRUCKFELDER.
           05 D-ERR-VAR-ZEILE03.
              10 D-ERR-PGEB-GES-T      PIC  X(006) VALUE 'PGEB: '.
              10 D-ERR-PGEB-GES        PIC  Z(004).
              10 D-ERR-PROD-T          PIC  X(007) VALUE ' PROD: '.
              10 D-ERR-PROD            PIC  Z(004).
              10 D-ERR-PROD-X REDEFINES D-ERR-PROD PIC  X(004).
              10 D-ERR-STICHTAG-T      PIC  X(011) VALUE ' STICHTAG: '.
              10 D-ERR-STICHTAG        PIC  X(010).
      *
      *****************************************************************
       01  ZWISCHENFELDER.
      *
           05 Z-POINTER                  USAGE POINTER.
           05 Z-RC                       PIC  X(003).
           05 Z-DATUM-JHJJMMTT-1         PIC  X(008).
           05 Z-DATUM-JHJJMMTT-9         REDEFINES
              Z-DATUM-JHJJMMTT-1         PIC 9(8).
           05 Z-DATUM-JHJJMMTT-2         PIC  X(008).
           05 Z-DATUM-JHJJMMTT-3         PIC  X(008).
           05 Z-PROD-PROD-SCHL           PIC  9(04)  VALUE ZERO.
           05 Z-TARIF                    PIC  X(15)  VALUE SPACE.
           05 Z-TARIF-ST                 PIC  9(02)  VALUE ZERO.
271022     05 Z-TARIF-MIT-0              PIC  X(15)  VALUE SPACE.
           05 Z-X-1                      PIC  X(01)  VALUE SPACE.
           05 Z-9-1 REDEFINES Z-X-1      PIC  9(01).
           05 Z-X-2                      PIC  X(02)  VALUE SPACE.
           05 Z-9-2 REDEFINES Z-X-2      PIC  9(02).
           05 Z-X-3                      PIC  X(03)  VALUE SPACE.
           05 Z-9-3 REDEFINES Z-X-3      PIC  9(03).
           05 Z-X-4                      PIC  X(04)  VALUE SPACE.
           05 Z-9-4 REDEFINES Z-X-4      PIC  9(04).
           05 Z-X-30                     PIC  X(30)  VALUE SPACE.
           05 Z-BRUTTO-BEITRAG           PIC S9(9)V99 PACKED-DECIMAL.
           05 Z-RZAHLUNG-ZUSCHLAG
                                         PIC S9(003)V999 VALUE ZERO.
           05 Z-VERS-STEUER-STZ          PIC S9(3)V9(5) PACKED-DECIMAL.
           05 Z-NETTO-BEITRAG            PIC S9(9)V99 PACKED-DECIMAL.
           05 Z-ANTQ-PLAUSI              PIC S9(4) COMP VALUE ZERO.
           05 Z-UFKT                     PIC  9(2) VALUE ZERO.
           05 Z-z                        PIC  9(3) comp-3 value zero.
      *
      *****************************************************************
      * > > > > > > > > > > > > > > > > > > > > > > > > > > > > > > > >
      * > > > RAHMEN:  WORKING-STORAGE - START  > > > > > > > > > > > >
       01  RAHMEN-KONSTANTEN.
           05  FILLER               PIC  X(026)
                                    VALUE '** RAHMEN: KONSTANTEN   **'.
      *    KONSTANTEN FÜR ERROR-HANDLING UND TRACE
           COPY DRAT0023.
      * > > > > > > > > > > > > > > > > > > > > > > > > > > > > > > >
       01  RAHMEN-ZWISCHENFELDER.
           05  FILLER               PIC  X(026)
                                    VALUE '* RAHMEN: ZWISCHENFELDER *'.
      *    ZWISCHENFELDER FUER DPAT0005 (ERR-TRACE FUELLEN)
           COPY DWAT0005.
      *
      *    DATENFELDER FÜR LAUFDATUM -    KORRESPONDIERT MIT DPAT0068
           COPY DWAT0068.
      *
      *    DATENFELDER FÜR DB2-BEFEHLE (HIER: DB2-TIMESTAMP)
      *                                   KORRESPONDIERT MIT DPAT0070
           COPY DWAT0069.
      *
      * < < < RAHMEN:  WORKING-STORAGE - ENDE   < < < < < < < < < < < <
      * < < < < < < < < < < < < < < < < < < < < < < < < < < < < < < < <
      *****************************************************************
      *
      *****************************************************************
       LINKAGE SECTION.
      *****************************************************************
      *
      * ALLE FUNKTIONSAUFRUFE
      *
      *    UEBERGABEBEREICH UP-FUNKTIONEN
           COPY DRAN0386.
      *
      *    ANKER FÜR EINGABE UND RÜCKGABE JE FUNKTION
       01  PI-EINGABE               PIC X(001).
       01  PO-RUECKGABE             PIC X(001).
      *
      *    UEBERGABEBEREICHE
           COPY DRAN0100.
           COPY DRAN0310.
           COPY DRPA0014.
           COPY DRPA0015.
           COPY DRPA0267.
           COPY DRPA0200.
           COPY DRPA0284.
           COPY DRPA0822.
           COPY DRPA0823.
           COPY DRPA0846.
           COPY DRPA1266.
           COPY DRPA1267.
           COPY DRPA1348.
           COPY DRPA1381.
           COPY DRPA1558.
           COPY DRPA1652.
           COPY DRPA1818.
      *
      *    ERR-ERROR-BEREICH
           COPY DRAT0004.
      *
      *    STANDARD-STATUS-BEREICH
           COPY DRAT0109.
      *****************************************************************
       PROCEDURE DIVISION USING PI-UPAN0026
                                PI-EINGABE
                                PO-RUECKGABE
                                ERR-ERROR-BEREICH
                                STANDARD-STATUS-BEREICH.
      *****************************************************************
      *---------------------------------------------------------------*
       UPAN0026-STEUERUNG SECTION.
      *---------------------------------------------------------------*
      * INPUT : (SIEHE PROGRAMM-KOPF)
      * OUTPUT: (SIEHE PROGRAMM-KOPF)
      * VERARBEITUNG:
      *         ERMITTLUNG DES FUNKTIONSAUFRUFS UND
      *         VERZWEIGEN IN DIE ZUGEHOERIGE ROUTINE
      *         DERZEIT GÜLTIGE AUFRUFE:
      *            - DRPA0822
      *---------------------------------------------------------------*
           MOVE 'S-   '                  TO ERR-ORT-SEC
      *
      *    TRACE BEI UPRO-START
           COPY DPAT0048.

           SET ERR-RC-OK                       TO TRUE
           MOVE K-RC-OK                        TO Z-RC

           INITIALIZE D-ERR-VAR-ZEILE03

           EVALUATE TRUE
           WHEN PI-UPAN0026-DRPA0822
              PERFORM X01-FUNKTION-DRPA0822
           WHEN PI-UPAN0026-DRPA1558
              PERFORM X02-FUNKTION-DRPA1558
           WHEN PI-UPAN0026-DRPA0846
              PERFORM X03-FUNKTION-DRPA0846
           WHEN PI-UPAN0026-DRAN0100
              PERFORM X04-FUNKTION-DRAN0100
           WHEN PI-UPAN0026-DRPA0823
              PERFORM X05-FUNKTION-DRPA0823
           WHEN PI-UPAN0026-DRPA0014
              PERFORM X06-FUNKTION-DRPA0014
           WHEN PI-UPAN0026-DRPA0015
              PERFORM X07-FUNKTION-DRPA0015
           WHEN PI-UPAN0026-DRPA0267
              PERFORM X08-FUNKTION-DRPA0267
           WHEN PI-UPAN0026-DRPA1266
              PERFORM X09-FUNKTION-DRPA1266
           WHEN PI-UPAN0026-DRPA1348
              PERFORM X10-FUNKTION-DRPA1348
           WHEN PI-UPAN0026-DRPA1381
              PERFORM X11-FUNKTION-DRPA1381
           WHEN PI-UPAN0026-DRPA1818
              PERFORM X12-FUNKTION-DRPA1818
           WHEN PI-UPAN0026-DRAN0310
              PERFORM X13-FUNKTION-DRAN0310
           WHEN PI-UPAN0026-DRPA0284
              PERFORM X14-FUNKTION-DRPA0284
           WHEN PI-UPAN0026-DRPA0200
              PERFORM X15-FUNKTION-DRPA0200
           WHEN PI-UPAN0026-DRPA1652
              PERFORM X16-FUNKTION-DRPA1652
           WHEN PI-UPAN0026-DRPA1267
              PERFORM X17-FUNKTION-DRPA1267
           WHEN OTHER
              MOVE 'FUNKTIONSAUFRUF UNGUELTIG' TO ERR-VAR-ZEILE01
              MOVE SPACE                       TO ERR-VAR-ZEILE02
              MOVE 'PI-EINGABE      = '        TO ERR-VAR-ZEILE02(1:18)
              MOVE  PI-EINGABE                 TO ERR-VAR-ZEILE02(19:8)
              MOVE K-1                         TO ERR-ORT-LFD
              PERFORM XR93-UPRO-PROG-FEHLER
              GO TO XST-EXIT
           END-EVALUATE
      *
      *    TRACE BEI UPRO-ENDE
           COPY DPAT0049.
           .
       XST-EXIT.
           GOBACK.
      *
      *---------------------------------------------------------------*
       X01-FUNKTION-DRPA0822 SECTION.
      *---------------------------------------------------------------*
      * INPUT : -
      * OUTPUT: -
      * VERARBEITUNG:
      *         STEUERUNG DER FUNKTION DRPA0822
      *
      *         - ADRESSIERUNG DER ZUGEHOERIGEN FUNKTIONS-PARAMETER
      *           PI-DRPA0822 UND PO-DRPA0822
      *         - ANSTEUERUNG DER ROUTINEN VORLAUF, VERARBEITUNG UND
      *           NACHLAUF
      *
      *         - DER NACHLAUF MUSS IMMER DURCHGEFUEHRT WERDEN, UM DEN
      *           RC DER FUNKTION ZU BESCHICKEN
      *---------------------------------------------------------------*
           MOVE 'X01- '                  TO ERR-ORT-SEC
      *
           SET Z-POINTER                 TO ADDRESS OF PI-EINGABE
           SET ADDRESS OF PI-DRPA0822    TO Z-POINTER
           SET Z-POINTER                 TO ADDRESS OF PO-RUECKGABE
           SET ADDRESS OF PO-DRPA0822    TO Z-POINTER
      *
           IF Z-RC = K-RC-OK
              PERFORM X011-VORLAUF-DRPA0822
           END-IF
      *
           IF Z-RC = K-RC-OK
              PERFORM X012-VERARB-DRPA0822
           END-IF
      *
           PERFORM X013-NACHLAUF-DRPA0822
           .
       X01-EXIT.
           EXIT.
      *
      *---------------------------------------------------------------*
       X011-VORLAUF-DRPA0822 SECTION.
      *---------------------------------------------------------------*
      * INPUT : -
      * OUTPUT: -
      * VERARBEITUNG:
      *         VORLAUF FUER FUNKTION DRPA0822
      *
      *         - PLAUSIBILITAETSPRUEFUNG DER UEBERGABEPARAMETER
      *             - ...
      *         -
      *---------------------------------------------------------------*
           MOVE 'X011-'                            TO ERR-ORT-SEC
      *
           MOVE 'PGEB:'                  TO D-ERR-PGEB-GES-T
           MOVE PI-DRPA0822-PGEB-GES     TO D-ERR-PGEB-GES
           MOVE ' PROD:'                 TO D-ERR-PROD-T
           MOVE PI-DRPA0822-PROD-PROD-SCHL
                                         TO D-ERR-PROD
           MOVE ' STICHTAG:'             TO D-ERR-STICHTAG-T
           MOVE PI-DRPA0822-STICHTAG     TO D-ERR-STICHTAG
           MOVE D-ERR-VAR-ZEILE03        TO ERR-VAR-ZEILE03

           IF PI-DRPA0822-PGEB-GES = ZERO
              MOVE 'PARAMETER PI-DRPA0822-PGEB-GES = 0'  TO
              ERR-VAR-ZEILE01
              MOVE K-1                             TO ERR-ORT-LFD
              PERFORM XR93-UPRO-PROG-FEHLER
              GO TO XST-EXIT
           END-IF

           IF PI-DRPA0822-STICHTAG = SPACE
              MOVE 'PARAMETER PI-DRPA0822-STICHTAG LEER'  TO
              ERR-VAR-ZEILE01
              MOVE K-2                             TO ERR-ORT-LFD
              PERFORM XR93-UPRO-PROG-FEHLER
              GO TO XST-EXIT
           END-IF

140122     INITIALIZE PO-DRPA0822

           PERFORM U01-LAUFDATUM

           EVALUATE TRUE
           WHEN S-KNR-AN-KONF-EGG-PRKO-UNDEF
                INITIALIZE PI-DRAT0151
                           PO-DRAT0151
                MOVE K-KTY-AN-KONFIGURATION
                  TO PI-DRAT0151-KTY-NR
                MOVE K-KNR-AN-KONF-EGG-PRKO
                  TO PI-DRAT0151-KNR-NR
                PERFORM U10-ZWAT0008-DRAT0151

                EVALUATE TRUE
                WHEN PO-DRAT0151-RC-OK
                     SET S-KNR-AN-KONF-EGG-PRKO-JA TO TRUE
                WHEN OTHER
                     SET S-KNR-AN-KONF-EGG-PRKO-NEIN TO TRUE
                END-EVALUATE
           END-EVALUATE

           .
       X011-EXIT.
           EXIT.
      *
      *---------------------------------------------------------------*
       X012-VERARB-DRPA0822 SECTION.
      *---------------------------------------------------------------*
      * INPUT : -
      * OUTPUT: -
      * VERARBEITUNG:
      *         VERARBEITUNG FUER FUNKTION DRPA0822
      *         -  AUFRUF ORIGINAL (AGG)-FUNKTION ODER NEUE EGG
      *         -
      *         -
      *---------------------------------------------------------------*
           MOVE 'X012-'                  TO ERR-ORT-SEC

           EVALUATE TRUE
           WHEN S-KNR-AN-KONF-EGG-PRKO-JA
            PERFORM U31-EGG-UPAN0026-DRPA0822
           WHEN S-KNR-AN-KONF-EGG-PRKO-NEIN
            PERFORM U11-UPPA0088-DRPA0822
           END-EVALUATE


           .
       X012-EXIT.
           EXIT.
      *---------------------------------------------------------------*
       X013-NACHLAUF-DRPA0822 SECTION.
      *---------------------------------------------------------------*
      * INPUT : -
      * OUTPUT: -
      * VERARBEITUNG:
      *         NACHLAUF FUER FUNKTION DRPA0822
      *
      *         -
      *         -
      *         -
      *
      *         - RC DER FUNKTION FUELLEN
      *---------------------------------------------------------------**
           MOVE 'X013-'                  TO ERR-ORT-SEC
      *
           MOVE PO-DRPA0822-EINH-AVERM   TO PO-DRPA0822-EINH
                                            PO-DRPA0822-EINH-VTF
                                            PO-DRPA0822-EINH-VWF
                                            PO-DRPA0822-EINH-REST-STRK


           MOVE Z-RC TO PO-DRPA0822-RC
           .
       X013-EXIT.
           EXIT.
      *
      *---------------------------------------------------------------*
       X02-FUNKTION-DRPA1558 SECTION.
      *---------------------------------------------------------------*
      * INPUT : -
      * OUTPUT: -
      * VERARBEITUNG:
      *         STEUERUNG DER FUNKTION DRPA1558
      *
      *         - ADRESSIERUNG DER ZUGEHOERIGEN FUNKTIONS-PARAMETER
      *           PI-DRPA1558 UND PO-DRPA1558
      *         - ANSTEUERUNG DER ROUTINEN VORLAUF, VERARBEITUNG UND
      *           NACHLAUF
      *
      *         - DER NACHLAUF MUSS IMMER DURCHGEFUEHRT WERDEN, UM DEN
      *           RC DER FUNKTION ZU BESCHICKEN
      *---------------------------------------------------------------*
           MOVE 'X02- '                  TO ERR-ORT-SEC
      *
           SET Z-POINTER                 TO ADDRESS OF PI-EINGABE
           SET ADDRESS OF PI-DRPA1558    TO Z-POINTER
           SET Z-POINTER                 TO ADDRESS OF PO-RUECKGABE
           SET ADDRESS OF PO-DRPA1558    TO Z-POINTER
      *
           IF Z-RC = K-RC-OK
              PERFORM X021-VORLAUF-DRPA1558
           END-IF
      *
           IF Z-RC = K-RC-OK
              PERFORM X022-VERARB-DRPA1558
           END-IF
      *
           PERFORM X023-NACHLAUF-DRPA1558
           .
       X02-EXIT.
           EXIT.
      *
      *---------------------------------------------------------------*
       X021-VORLAUF-DRPA1558 SECTION.
      *---------------------------------------------------------------*
      * INPUT : -
      * OUTPUT: -
      * VERARBEITUNG:
      *         VORLAUF FUER FUNKTION DRPA1558
      *
      *         - PLAUSIBILITAETSPRUEFUNG DER UEBERGABEPARAMETER
      *             - ...
      *         -
      *---------------------------------------------------------------*
           MOVE 'X021-'                            TO ERR-ORT-SEC

           MOVE 'PGEB:'                  TO D-ERR-PGEB-GES-T
           MOVE PI-DRPA1558-PGEB-GES     TO D-ERR-PGEB-GES
           MOVE ' PROD:'                 TO D-ERR-PROD-T
           MOVE PI-DRPA1558-PROD-PROD-SCHL
                                         TO D-ERR-PROD
           MOVE ' STICHTAG:'             TO D-ERR-STICHTAG-T
           MOVE PI-DRPA1558-STICHTAG     TO D-ERR-STICHTAG
           MOVE D-ERR-VAR-ZEILE03        TO ERR-VAR-ZEILE03

           IF PI-DRPA1558-PGEB-GES = ZERO
              MOVE 'PARAMETER PI-DRPA1558-PGEB-GES = 0'  TO
              ERR-VAR-ZEILE01
              MOVE K-1                             TO ERR-ORT-LFD
              PERFORM XR93-UPRO-PROG-FEHLER
              GO TO XST-EXIT
           END-IF

           IF PI-DRPA1558-STICHTAG = SPACE
              MOVE 'PARAMETER PI-DRPA1558-STICHTAG LEER'  TO
              ERR-VAR-ZEILE01
              MOVE K-2                             TO ERR-ORT-LFD
              PERFORM XR93-UPRO-PROG-FEHLER
              GO TO XST-EXIT
           END-IF

           PERFORM U01-LAUFDATUM

           EVALUATE TRUE
           WHEN S-KNR-AN-KONF-EGG-PRKO-UNDEF
                INITIALIZE PI-DRAT0151
                           PO-DRAT0151
                MOVE K-KTY-AN-KONFIGURATION
                  TO PI-DRAT0151-KTY-NR
                MOVE K-KNR-AN-KONF-EGG-PRKO
                  TO PI-DRAT0151-KNR-NR
                PERFORM U10-ZWAT0008-DRAT0151

                EVALUATE TRUE
                WHEN PO-DRAT0151-RC-OK
                     SET S-KNR-AN-KONF-EGG-PRKO-JA TO TRUE
                WHEN OTHER
                     SET S-KNR-AN-KONF-EGG-PRKO-NEIN TO TRUE
                END-EVALUATE
           END-EVALUATE

           .
       X021-EXIT.
           EXIT.
      *
      *---------------------------------------------------------------*
       X022-VERARB-DRPA1558 SECTION.
      *---------------------------------------------------------------*
      * INPUT : -
      * OUTPUT: -
      * VERARBEITUNG:
      *         VERARBEITUNG FUER FUNKTION DRPA1558
      *         -  AUFRUF ORIGINAL (AGG)-FUNKTION ODER NEUE EGG
      *         -
      *         -
      *---------------------------------------------------------------*
           MOVE 'X022-'                  TO ERR-ORT-SEC

           EVALUATE TRUE
           WHEN S-KNR-AN-KONF-EGG-PRKO-JA
            PERFORM U32-EGG-UPAN0026-DRPA1558
           WHEN S-KNR-AN-KONF-EGG-PRKO-NEIN
            PERFORM U12-UPPA0088-DRPA1558
           END-EVALUATE


           .
       X022-EXIT.
           EXIT.
      *---------------------------------------------------------------*
       X023-NACHLAUF-DRPA1558 SECTION.
      *---------------------------------------------------------------*
      * INPUT : -
      * OUTPUT: -
      * VERARBEITUNG:
      *         NACHLAUF FUER FUNKTION DRPA1558
      *
      *         -
      *         -
      *         -
      *
      *         - RC DER FUNKTION FUELLEN
      *---------------------------------------------------------------**
           MOVE 'X023-'                  TO ERR-ORT-SEC
      *
           MOVE Z-RC TO PO-DRPA1558-RC
           .
       X023-EXIT.
           EXIT.
      *---------------------------------------------------------------*
       X03-FUNKTION-DRPA0846 SECTION.
      *---------------------------------------------------------------*
      * INPUT : -
      * OUTPUT: -
      * VERARBEITUNG:
      *         STEUERUNG DER FUNKTION DRPA0846
      *
      *         - ADRESSIERUNG DER ZUGEHOERIGEN FUNKTIONS-PARAMETER
      *           PI-DRPA0846 UND PO-DRPA0846
      *         - ANSTEUERUNG DER ROUTINEN VORLAUF, VERARBEITUNG UND
      *           NACHLAUF
      *
      *         - DER NACHLAUF MUSS IMMER DURCHGEFUEHRT WERDEN, UM DEN
      *           RC DER FUNKTION ZU BESCHICKEN
      *---------------------------------------------------------------*
           MOVE 'X03- '                  TO ERR-ORT-SEC
      *
           SET Z-POINTER                 TO ADDRESS OF PI-EINGABE
           SET ADDRESS OF PI-DRPA0846    TO Z-POINTER
           SET Z-POINTER                 TO ADDRESS OF PO-RUECKGABE
           SET ADDRESS OF PO-DRPA0846    TO Z-POINTER
      *
           IF Z-RC = K-RC-OK
              PERFORM X031-VORLAUF-DRPA0846
           END-IF
      *
           IF Z-RC = K-RC-OK
              PERFORM X032-VERARB-DRPA0846
           END-IF
      *
           PERFORM X033-NACHLAUF-DRPA0846
           .
       X03-EXIT.
           EXIT.
      *
      *---------------------------------------------------------------*
       X031-VORLAUF-DRPA0846 SECTION.
      *---------------------------------------------------------------*
      * INPUT : -
      * OUTPUT: -
      * VERARBEITUNG:
      *         VORLAUF FUER FUNKTION DRPA0846
      *
      *         - PLAUSIBILITAETSPRUEFUNG DER UEBERGABEPARAMETER
      *             - ...
      *         -
      *---------------------------------------------------------------*
           MOVE 'X031-'                            TO ERR-ORT-SEC
      *
           MOVE 'PGEB:'                  TO D-ERR-PGEB-GES-T
           MOVE PI-DRPA0846-PGEB-GES     TO D-ERR-PGEB-GES
           MOVE ' PROD:'                 TO D-ERR-PROD-T
           MOVE PI-DRPA0846-PROD-PROD-SCHL
                                         TO D-ERR-PROD
           MOVE ' STICHTAG:'             TO D-ERR-STICHTAG-T
           MOVE PI-DRPA0846-STICHTAG     TO D-ERR-STICHTAG
           MOVE D-ERR-VAR-ZEILE03        TO ERR-VAR-ZEILE03

           IF PI-DRPA0846-PGEB-GES = 0
              MOVE 'PARAMETER PI-DRPA0846-PGEB-GES = 0'  TO
              ERR-VAR-ZEILE01
              MOVE K-1                             TO ERR-ORT-LFD
              PERFORM XR93-UPRO-PROG-FEHLER
              GO TO XST-EXIT
           END-IF

           IF PI-DRPA0846-STICHTAG = SPACE
              MOVE 'PARAMETER PI-DRPA0846-STICHTAG LEER'  TO
              ERR-VAR-ZEILE01
              MOVE K-3                             TO ERR-ORT-LFD
              PERFORM XR93-UPRO-PROG-FEHLER
              GO TO XST-EXIT
           END-IF

           PERFORM U01-LAUFDATUM

           EVALUATE TRUE
           WHEN S-KNR-AN-KONF-EGG-PRKO-UNDEF
                INITIALIZE PI-DRAT0151
                           PO-DRAT0151
                MOVE K-KTY-AN-KONFIGURATION
                  TO PI-DRAT0151-KTY-NR
                MOVE K-KNR-AN-KONF-EGG-PRKO
                  TO PI-DRAT0151-KNR-NR
                PERFORM U10-ZWAT0008-DRAT0151

                EVALUATE TRUE
                WHEN PO-DRAT0151-RC-OK
                     SET S-KNR-AN-KONF-EGG-PRKO-JA TO TRUE
                WHEN OTHER
                     SET S-KNR-AN-KONF-EGG-PRKO-NEIN TO TRUE
                END-EVALUATE
           END-EVALUATE

           .
       X031-EXIT.
           EXIT.
      *
      *---------------------------------------------------------------*
       X032-VERARB-DRPA0846 SECTION.
      *---------------------------------------------------------------*
      * INPUT : -
      * OUTPUT: -
      * VERARBEITUNG:
      *         VERARBEITUNG FUER FUNKTION DRPA0846
      *         -  AUFRUF ORIGINAL (AGG)-FUNKTION ODER NEUE EGG
      *         -
      *         -
      *---------------------------------------------------------------*
           MOVE 'X032-'                  TO ERR-ORT-SEC

           EVALUATE TRUE
           WHEN S-KNR-AN-KONF-EGG-PRKO-JA
            PERFORM U33-EGG-UPAN0026-DRPA0846
           WHEN S-KNR-AN-KONF-EGG-PRKO-NEIN
            PERFORM U13-UPPA0088-DRPA0846
           END-EVALUATE


           .
       X032-EXIT.
           EXIT.
      *---------------------------------------------------------------*
       X033-NACHLAUF-DRPA0846 SECTION.
      *---------------------------------------------------------------*
      * INPUT : -
      * OUTPUT: -
      * VERARBEITUNG:
      *         NACHLAUF FUER FUNKTION DRPA0846
      *
      *         -
      *         -
      *         -
      *
      *         - RC DER FUNKTION FUELLEN
      *---------------------------------------------------------------**
           MOVE 'X033-'                  TO ERR-ORT-SEC
      *
           MOVE Z-RC TO PO-DRPA0846-RC
           .
       X033-EXIT.
           EXIT.
      *---------------------------------------------------------------*
       X04-FUNKTION-DRAN0100 SECTION.
      *---------------------------------------------------------------*
      * INPUT : -
      * OUTPUT: -
      * VERARBEITUNG:
      *         STEUERUNG DER FUNKTION DRAN0100
      *
      *         - ADRESSIERUNG DER ZUGEHOERIGEN FUNKTIONS-PARAMETER
      *           PI-DRAN0100 UND PO-DRAN0100
      *         - ANSTEUERUNG DER ROUTINEN VORLAUF, VERARBEITUNG UND
      *           NACHLAUF
      *
      *         - DER NACHLAUF MUSS IMMER DURCHGEFUEHRT WERDEN, UM DEN
      *           RC DER FUNKTION ZU BESCHICKEN
      *---------------------------------------------------------------*
           MOVE 'X04- '                  TO ERR-ORT-SEC
      *
           SET Z-POINTER                 TO ADDRESS OF PI-EINGABE
           SET ADDRESS OF PI-DRAN0100    TO Z-POINTER
           SET Z-POINTER                 TO ADDRESS OF PO-RUECKGABE
           SET ADDRESS OF PO-DRAN0100    TO Z-POINTER
      *
           IF Z-RC = K-RC-OK
              PERFORM X041-VORLAUF-DRAN0100
           END-IF
      *
           IF Z-RC = K-RC-OK
              PERFORM X042-VERARB-DRAN0100
           END-IF
      *
           PERFORM X043-NACHLAUF-DRAN0100
           .
       X04-EXIT.
           EXIT.
      *
      *---------------------------------------------------------------*
       X041-VORLAUF-DRAN0100 SECTION.
      *---------------------------------------------------------------*
      * INPUT : -
      * OUTPUT: -
      * VERARBEITUNG:
      *         VORLAUF FUER FUNKTION DRAN0100
      *
      *         - PLAUSIBILITAETSPRUEFUNG DER UEBERGABEPARAMETER
      *             - ...
      *         -
      *---------------------------------------------------------------*
           MOVE 'X041-'                            TO ERR-ORT-SEC
      *
           MOVE 'PGEB:'                  TO D-ERR-PGEB-GES-T
           MOVE PI-DRAN0100-PGEB-GES     TO D-ERR-PGEB-GES
           MOVE ' PROD:'                 TO D-ERR-PROD-T
           MOVE PI-DRAN0100-PROD-PROD-SCHL
                                         TO D-ERR-PROD
           MOVE ' STICHTAG:'             TO D-ERR-STICHTAG-T
           MOVE PI-DRAN0100-STICHTAG     TO D-ERR-STICHTAG
           MOVE D-ERR-VAR-ZEILE03        TO ERR-VAR-ZEILE03

           IF PI-DRAN0100-PGEB-GES = 0
              MOVE 'PARAMETER PI-DRAN0100-PGEB-GES = 0'  TO
              ERR-VAR-ZEILE01
              MOVE K-1                             TO ERR-ORT-LFD
              PERFORM XR93-UPRO-PROG-FEHLER
              GO TO XST-EXIT
           END-IF

           IF PI-DRAN0100-STICHTAG = SPACE
              MOVE 'PARAMETER PI-DRAN0100-STICHTAG LEER'  TO
              ERR-VAR-ZEILE01
              MOVE K-2                             TO ERR-ORT-LFD
              PERFORM XR93-UPRO-PROG-FEHLER
              GO TO XST-EXIT
           END-IF

140122     INITIALIZE PO-DRAN0100

           PERFORM U01-LAUFDATUM

           EVALUATE TRUE
           WHEN S-KNR-AN-KONF-EGG-PRKO-UNDEF
                INITIALIZE PI-DRAT0151
                           PO-DRAT0151
                MOVE K-KTY-AN-KONFIGURATION
                  TO PI-DRAT0151-KTY-NR
                MOVE K-KNR-AN-KONF-EGG-PRKO
                  TO PI-DRAT0151-KNR-NR
                PERFORM U10-ZWAT0008-DRAT0151

                EVALUATE TRUE
                WHEN PO-DRAT0151-RC-OK
                     SET S-KNR-AN-KONF-EGG-PRKO-JA TO TRUE
                WHEN OTHER
                     SET S-KNR-AN-KONF-EGG-PRKO-NEIN TO TRUE
                END-EVALUATE
           END-EVALUATE

           .
       X041-EXIT.
           EXIT.
      *
      *---------------------------------------------------------------*
       X042-VERARB-DRAN0100 SECTION.
      *---------------------------------------------------------------*
      * INPUT : -
      * OUTPUT: -
      * VERARBEITUNG:
      *         VERARBEITUNG FUER FUNKTION DRAN0100
      *         -  AUFRUF ORIGINAL (AGG)-FUNKTION ODER NEUE EGG
      *         -
      *         -
      *---------------------------------------------------------------*
           MOVE 'X042-'                  TO ERR-ORT-SEC

           EVALUATE TRUE
           WHEN S-KNR-AN-KONF-EGG-PRKO-JA
            PERFORM U34-EGG-UPAN0026-DRAN0100
           WHEN S-KNR-AN-KONF-EGG-PRKO-NEIN
            PERFORM U14-UPPA0065-DRAN0100
           END-EVALUATE


           .
       X042-EXIT.
           EXIT.
      *---------------------------------------------------------------*
       X043-NACHLAUF-DRAN0100 SECTION.
      *---------------------------------------------------------------*
      * INPUT : -
      * OUTPUT: -
      * VERARBEITUNG:
      *         NACHLAUF FUER FUNKTION DRAN0100
      *
      *         -
      *         -
      *         -
      *
      *         - RC DER FUNKTION FUELLEN
      *---------------------------------------------------------------**
           MOVE 'X043-'                  TO ERR-ORT-SEC
      *
           MOVE Z-RC TO PO-DRAN0100-RC
           .
       X043-EXIT.
           EXIT.
      *
      *---------------------------------------------------------------*
       X05-FUNKTION-DRPA0823 SECTION.
      *---------------------------------------------------------------*
      * INPUT : -
      * OUTPUT: -
      * VERARBEITUNG:
      *         STEUERUNG DER FUNKTION DRPA0823
      *
      *         - ADRESSIERUNG DER ZUGEHOERIGEN FUNKTIONS-PARAMETER
      *           PI-DRPA0823 UND PO-DRPA0823
      *         - ANSTEUERUNG DER ROUTINEN VORLAUF, VERARBEITUNG UND
      *           NACHLAUF
      *
      *         - DER NACHLAUF MUSS IMMER DURCHGEFUEHRT WERDEN, UM DEN
      *           RC DER FUNKTION ZU BESCHICKEN
      *---------------------------------------------------------------*
           MOVE 'X05- '                  TO ERR-ORT-SEC
      *
           SET Z-POINTER                 TO ADDRESS OF PI-EINGABE
           SET ADDRESS OF PI-DRPA0823    TO Z-POINTER
           SET Z-POINTER                 TO ADDRESS OF PO-RUECKGABE
           SET ADDRESS OF PO-DRPA0823    TO Z-POINTER
      *
           IF Z-RC = K-RC-OK
              PERFORM X051-VORLAUF-DRPA0823
           END-IF
      *
           IF Z-RC = K-RC-OK
              PERFORM X052-VERARB-DRPA0823
           END-IF
      *
           PERFORM X053-NACHLAUF-DRPA0823
           .
       X05-EXIT.
           EXIT.
      *
      *---------------------------------------------------------------*
       X051-VORLAUF-DRPA0823 SECTION.
      *---------------------------------------------------------------*
      * INPUT : -
      * OUTPUT: -
      * VERARBEITUNG:
      *         VORLAUF FUER FUNKTION DRPA0823
      *
      *         - PLAUSIBILITAETSPRUEFUNG DER UEBERGABEPARAMETER
      *             - ...
      *         -
      *---------------------------------------------------------------*
           MOVE 'X051-'                            TO ERR-ORT-SEC
      *
           MOVE 'PGEB:'                  TO D-ERR-PGEB-GES-T
           MOVE PI-DRPA0823-PGEB-GES     TO D-ERR-PGEB-GES
           MOVE ' PROD:'                 TO D-ERR-PROD-T
           MOVE PI-DRPA0823-PROD-PROD-SCHL
                                         TO D-ERR-PROD
           MOVE ' STICHTAG:'             TO D-ERR-STICHTAG-T
           MOVE PI-DRPA0823-STICHTAG     TO D-ERR-STICHTAG
           MOVE D-ERR-VAR-ZEILE03        TO ERR-VAR-ZEILE03

           IF PI-DRPA0823-PGEB-GES = 0
              MOVE 'PARAMETER PI-DRPA0823-PGEB-GES = 0'  TO
              ERR-VAR-ZEILE01
              MOVE K-1                             TO ERR-ORT-LFD
              PERFORM XR93-UPRO-PROG-FEHLER
              GO TO XST-EXIT
           END-IF

           IF PI-DRPA0823-STICHTAG = SPACE
              MOVE 'PARAMETER PI-DRPA0823-STICHTAG LEER'  TO
              ERR-VAR-ZEILE01
              MOVE K-2                             TO ERR-ORT-LFD
              PERFORM XR93-UPRO-PROG-FEHLER
              GO TO XST-EXIT
           END-IF

           PERFORM U01-LAUFDATUM

           EVALUATE TRUE
           WHEN S-KNR-AN-KONF-EGG-PGRP-UNDEF
                INITIALIZE PI-DRAT0151
                           PO-DRAT0151
                MOVE K-KTY-AN-KONFIGURATION
                  TO PI-DRAT0151-KTY-NR
                MOVE K-KNR-AN-KONF-EGG-PRKO
                  TO PI-DRAT0151-KNR-NR
                PERFORM U10-ZWAT0008-DRAT0151

                EVALUATE TRUE
                WHEN PO-DRAT0151-RC-OK
                     SET S-KNR-AN-KONF-EGG-PGRP-JA TO TRUE
                WHEN OTHER
                     SET S-KNR-AN-KONF-EGG-PGRP-NEIN TO TRUE
                END-EVALUATE
           END-EVALUATE

           .
       X051-EXIT.
           EXIT.
      *
      *---------------------------------------------------------------*
       X052-VERARB-DRPA0823 SECTION.
      *---------------------------------------------------------------*
      * INPUT : -
      * OUTPUT: -
      * VERARBEITUNG:
      *         VERARBEITUNG FUER FUNKTION DRPA0823
      *         -  AUFRUF ORIGINAL (AGG)-FUNKTION ODER NEUE EGG
      *         -
      *         -
      *---------------------------------------------------------------*
           MOVE 'X052-'                  TO ERR-ORT-SEC

           EVALUATE TRUE
           WHEN S-KNR-AN-KONF-EGG-PGRP-JA
            PERFORM U35-EGG-UPAN0026-DRPA0823
           WHEN S-KNR-AN-KONF-EGG-PGRP-NEIN
            PERFORM U15-UPPA0065-DRPA0823
           END-EVALUATE


           .
       X052-EXIT.
           EXIT.
      *---------------------------------------------------------------*
       X053-NACHLAUF-DRPA0823 SECTION.
      *---------------------------------------------------------------*
      * INPUT : -
      * OUTPUT: -
      * VERARBEITUNG:
      *         NACHLAUF FUER FUNKTION DRPA0823
      *
      *         -
      *         -
      *         -
      *
      *         - RC DER FUNKTION FUELLEN
      *---------------------------------------------------------------**
           MOVE 'X053-'                  TO ERR-ORT-SEC
      *
           MOVE Z-RC TO PO-DRPA0823-RC
           .
       X053-EXIT.
           EXIT.
      *---------------------------------------------------------------*
       X06-FUNKTION-DRPA0014 SECTION.
      *---------------------------------------------------------------*
      * INPUT : -
      * OUTPUT: -
      * VERARBEITUNG:
      *         STEUERUNG DER FUNKTION DRPA0014
      *
      *         - ADRESSIERUNG DER ZUGEHOERIGEN FUNKTIONS-PARAMETER
      *           PI-DRPA0014 UND PO-DRPA0014
      *         - ANSTEUERUNG DER ROUTINEN VORLAUF, VERARBEITUNG UND
      *           NACHLAUF
      *
      *         - DER NACHLAUF MUSS IMMER DURCHGEFUEHRT WERDEN, UM DEN
      *           RC DER FUNKTION ZU BESCHICKEN
      *---------------------------------------------------------------*
           MOVE 'X06- '                  TO ERR-ORT-SEC
      *
           SET Z-POINTER                 TO ADDRESS OF PI-EINGABE
           SET ADDRESS OF PI-DRPA0014    TO Z-POINTER
           SET Z-POINTER                 TO ADDRESS OF PO-RUECKGABE
           SET ADDRESS OF PO-DRPA0014    TO Z-POINTER
      *
           IF Z-RC = K-RC-OK
              PERFORM X061-VORLAUF-DRPA0014
           END-IF
      *
           IF Z-RC = K-RC-OK
              PERFORM X062-VERARB-DRPA0014
           END-IF
      *
           PERFORM X063-NACHLAUF-DRPA0014
           .
       X06-EXIT.
           EXIT.
      *
      *---------------------------------------------------------------*
       X061-VORLAUF-DRPA0014 SECTION.
      *---------------------------------------------------------------*
      * INPUT : -
      * OUTPUT: -
      * VERARBEITUNG:
      *         VORLAUF FUER FUNKTION DRPA0014
      *
      *         - PLAUSIBILITAETSPRUEFUNG DER UEBERGABEPARAMETER
      *             - ...
      *         -
      *---------------------------------------------------------------*
           MOVE 'X061-'                            TO ERR-ORT-SEC
      *
           MOVE 'PGEB:'                  TO D-ERR-PGEB-GES-T
           MOVE PI-DRPA0014-PGEB-GES     TO D-ERR-PGEB-GES
           MOVE '      '                 TO D-ERR-PROD-T
           MOVE ' STICHTAG:'             TO D-ERR-STICHTAG-T
           MOVE PI-DRPA0014-STICHTAG     TO D-ERR-STICHTAG
           MOVE D-ERR-VAR-ZEILE03        TO ERR-VAR-ZEILE03

           EVALUATE TRUE
           WHEN S-KNR-AN-KONF-EGG-ZVP-UNDEF
                INITIALIZE PI-DRAT0151
                           PO-DRAT0151
                MOVE K-KTY-AN-KONFIGURATION
                  TO PI-DRAT0151-KTY-NR
                MOVE K-KNR-AN-KONF-EGG-ZVP
                  TO PI-DRAT0151-KNR-NR
                PERFORM U10-ZWAT0008-DRAT0151

                EVALUATE TRUE
                WHEN PO-DRAT0151-RC-OK
                     SET S-KNR-AN-KONF-EGG-ZVP-JA TO TRUE
                WHEN OTHER
                     SET S-KNR-AN-KONF-EGG-ZVP-NEIN TO TRUE
                END-EVALUATE
           END-EVALUATE

           IF PI-DRPA0014-PGEB-GES = 0
              MOVE 'PARAMETER PI-DRPA0014-PGEB-GES = 0'  TO
              ERR-VAR-ZEILE01
              MOVE S-KNR-AN-KONF-EGG-ZVP           TO ERR-VAR-ZEILE02
              MOVE K-1                             TO ERR-ORT-LFD
              PERFORM XR93-UPRO-PROG-FEHLER
              GO TO XST-EXIT
           END-IF

           IF PI-DRPA0014-PZVP-VERFAHREN = SPACE
              MOVE 'PARAMETER PI-DRPA0014-PZVP-VERFAHREN LEER '
                                                   TO ERR-VAR-ZEILE01
              MOVE S-KNR-AN-KONF-EGG-ZVP           TO ERR-VAR-ZEILE02
              MOVE K-2                             TO ERR-ORT-LFD
              PERFORM XR93-UPRO-PROG-FEHLER
              GO TO XST-EXIT
           END-IF

           IF PI-DRPA0014-STICHTAG = SPACE
              MOVE 'PARAMETER PI-DRPA0014-PZVP-VERFAHREN LEER'  TO
              ERR-VAR-ZEILE01
              MOVE S-KNR-AN-KONF-EGG-ZVP           TO ERR-VAR-ZEILE02
              MOVE K-3                             TO ERR-ORT-LFD
              PERFORM XR93-UPRO-PROG-FEHLER
              GO TO XST-EXIT
           END-IF

           IF PI-DRPA0014-PZVP-VERFAHREN = K-ANTRAG-TRANSAKTIONEN
           OR PI-DRPA0014-PZVP-VERFAHREN =
           K-ANTRAG-NUR-ANZEIGEN-TRANSAKT
               CONTINUE
           ELSE
               SET PO-DRPA0014-RC-OK-VERF-UNDEF TO TRUE
               MOVE PO-DRPA0014-RC       TO Z-RC
           END-IF

           IF PI-DRPA0014-STICHTAG = SPACE
              MOVE 'PARAMETER PI-DRPA0014-PZVP-VERFAHREN LEER'  TO
              ERR-VAR-ZEILE01
              MOVE K-3                             TO ERR-ORT-LFD
              PERFORM XR93-UPRO-PROG-FEHLER
              GO TO XST-EXIT
           END-IF

           PERFORM U01-LAUFDATUM

           .
       X061-EXIT.
           EXIT.
      *
      *---------------------------------------------------------------*
       X062-VERARB-DRPA0014 SECTION.
      *---------------------------------------------------------------*
      * INPUT : -
      * OUTPUT: -
      * VERARBEITUNG:
      *         VERARBEITUNG FUER FUNKTION DRPA0014
      *         -  AUFRUF ORIGINAL (AGG)-FUNKTION ODER NEUE EGG
      *         -
      *         -
      *---------------------------------------------------------------*
           MOVE 'X062-'                  TO ERR-ORT-SEC

           EVALUATE TRUE
           WHEN S-KNR-AN-KONF-EGG-ZVP-JA
            PERFORM U36-EGG-UPPA0007-DRPA0014
           WHEN S-KNR-AN-KONF-EGG-ZVP-NEIN
            PERFORM U16-UPPA0007-DRPA0014
           END-EVALUATE


           .
       X062-EXIT.
           EXIT.
      *---------------------------------------------------------------*
       X063-NACHLAUF-DRPA0014 SECTION.
      *---------------------------------------------------------------*
      * INPUT : -
      * OUTPUT: -
      * VERARBEITUNG:
      *         NACHLAUF FUER FUNKTION DRPA0014
      *
      *         -
      *         -
      *         -
      *
      *         - RC DER FUNKTION FUELLEN
      *---------------------------------------------------------------**
           MOVE 'X063-'                  TO ERR-ORT-SEC
      *
           MOVE Z-RC TO PO-DRPA0014-RC
           .
       X063-EXIT.
           EXIT.
      *---------------------------------------------------------------*
       X07-FUNKTION-DRPA0015 SECTION.
      *---------------------------------------------------------------*
      * INPUT : -
      * OUTPUT: -
      * VERARBEITUNG:
      *         STEUERUNG DER FUNKTION DRPA0015
      *
      *         - ADRESSIERUNG DER ZUGEHOERIGEN FUNKTIONS-PARAMETER
      *           PI-DRPA0015 UND PO-DRPA0015
      *         - ANSTEUERUNG DER ROUTINEN VORLAUF, VERARBEITUNG UND
      *           NACHLAUF
      *
      *         - DER NACHLAUF MUSS IMMER DURCHGEFUEHRT WERDEN, UM DEN
      *           RC DER FUNKTION ZU BESCHICKEN
      *---------------------------------------------------------------*
           MOVE 'X07- '                  TO ERR-ORT-SEC
      *
           SET Z-POINTER                 TO ADDRESS OF PI-EINGABE
           SET ADDRESS OF PI-DRPA0015    TO Z-POINTER
           SET Z-POINTER                 TO ADDRESS OF PO-RUECKGABE
           SET ADDRESS OF PO-DRPA0015    TO Z-POINTER
      *
           IF Z-RC = K-RC-OK
              PERFORM X071-VORLAUF-DRPA0015
           END-IF
      *
           IF Z-RC = K-RC-OK
              PERFORM X072-VERARB-DRPA0015
           END-IF
      *
           PERFORM X073-NACHLAUF-DRPA0015
           .
       X07-EXIT.
           EXIT.
      *---------------------------------------------------------------*
       X071-VORLAUF-DRPA0015 SECTION.
      *---------------------------------------------------------------*
      * INPUT : -
      * OUTPUT: -
      * VERARBEITUNG:
      *         VORLAUF FUER FUNKTION DRPA0015
      *
      *         - PLAUSIBILITAETSPRUEFUNG DER UEBERGABEPARAMETER
      *             - ...
      *         -
      *---------------------------------------------------------------*
           MOVE 'X071-'                            TO ERR-ORT-SEC

           MOVE 'PGEB:'                  TO D-ERR-PGEB-GES-T
           MOVE PI-DRPA0015-PGEB-GES     TO D-ERR-PGEB-GES
           MOVE ' PROD:'                 TO D-ERR-PROD-T
           MOVE PI-DRPA0015-PROD-PROD-SCHL
                                         TO D-ERR-PROD
           MOVE ' STICHTAG:'             TO D-ERR-STICHTAG-T
           MOVE PI-DRPA0015-STICHTAG     TO D-ERR-STICHTAG
           MOVE D-ERR-VAR-ZEILE03        TO ERR-VAR-ZEILE03

           EVALUATE TRUE
           WHEN S-KNR-AN-KONF-EGG-ZVP-UNDEF
                INITIALIZE PI-DRAT0151
                           PO-DRAT0151
                MOVE K-KTY-AN-KONFIGURATION
                  TO PI-DRAT0151-KTY-NR
                MOVE K-KNR-AN-KONF-EGG-ZVP
                  TO PI-DRAT0151-KNR-NR
                PERFORM U10-ZWAT0008-DRAT0151

                EVALUATE TRUE
                WHEN PO-DRAT0151-RC-OK
                     SET S-KNR-AN-KONF-EGG-ZVP-JA TO TRUE
                WHEN OTHER
                     SET S-KNR-AN-KONF-EGG-ZVP-NEIN TO TRUE
                END-EVALUATE
           END-EVALUATE

           IF PI-DRPA0015-PGEB-GES = 0
              MOVE 'PARAMETER PI-DRPA0015-PGEB-GES = 0'  TO
              ERR-VAR-ZEILE01
              MOVE S-KNR-AN-KONF-EGG-ZVP           TO ERR-VAR-ZEILE02
              MOVE K-1                             TO ERR-ORT-LFD
              PERFORM XR93-UPRO-PROG-FEHLER
              GO TO XST-EXIT
           END-IF

           IF PI-DRPA0015-PZVP-VERFAHREN = SPACE
              MOVE 'PARAMETER PI-DRPA0015-PZVP-VERFAHREN LEER'  TO
              ERR-VAR-ZEILE01
              MOVE S-KNR-AN-KONF-EGG-ZVP           TO ERR-VAR-ZEILE02
              MOVE K-2                             TO ERR-ORT-LFD
              PERFORM XR93-UPRO-PROG-FEHLER
              GO TO XST-EXIT
           END-IF

           IF PI-DRPA0015-STICHTAG = SPACE
              MOVE 'PARAMETER PI-DRPA0015-STICHTAG LEER'  TO
              ERR-VAR-ZEILE01
              MOVE S-KNR-AN-KONF-EGG-ZVP           TO ERR-VAR-ZEILE02
              MOVE K-3                             TO ERR-ORT-LFD
              PERFORM XR93-UPRO-PROG-FEHLER
              GO TO XST-EXIT
           END-IF

           IF PI-DRPA0015-PZVP-VERFAHREN = K-ANTRAG-TRANSAKTIONEN
           OR PI-DRPA0015-PZVP-VERFAHREN =
           K-ANTRAG-NUR-ANZEIGEN-TRANSAKT
               CONTINUE
           ELSE
               SET PO-DRPA0015-RC-OK-VERF-UNDEF TO TRUE
               MOVE PO-DRPA0015-RC       TO Z-RC
           END-IF

           PERFORM U01-LAUFDATUM

           .
       X071-EXIT.
           EXIT.
      *
      *---------------------------------------------------------------*
       X072-VERARB-DRPA0015 SECTION.
      *---------------------------------------------------------------*
      * INPUT : -
      * OUTPUT: -
      * VERARBEITUNG:
      *         VERARBEITUNG FUER FUNKTION DRPA0015
      *         -  AUFRUF ORIGINAL (AGG)-FUNKTION ODER NEUE EGG
      *         -
      *         -
      *---------------------------------------------------------------*
           MOVE 'X072-'                  TO ERR-ORT-SEC

           EVALUATE TRUE
           WHEN S-KNR-AN-KONF-EGG-ZVP-JA
            PERFORM U37-EGG-UPPA0007-DRPA0015
           WHEN S-KNR-AN-KONF-EGG-ZVP-NEIN
            PERFORM U17-UPPA0007-DRPA0015
           END-EVALUATE


           .
       X072-EXIT.
           EXIT.
      *---------------------------------------------------------------*
       X073-NACHLAUF-DRPA0015 SECTION.
      *---------------------------------------------------------------*
      * INPUT : -
      * OUTPUT: -
      * VERARBEITUNG:
      *         NACHLAUF FUER FUNKTION DRPA0015
      *
      *         -
      *         -
      *         -
      *
      *         - RC DER FUNKTION FUELLEN
      *---------------------------------------------------------------**
           MOVE 'X073-'                  TO ERR-ORT-SEC
      *
           MOVE Z-RC TO PO-DRPA0015-RC
           .
       X073-EXIT.
           EXIT.
      *---------------------------------------------------------------*
       X08-FUNKTION-DRPA0267 SECTION.
      *---------------------------------------------------------------*
      * INPUT : -
      * OUTPUT: -
      * VERARBEITUNG:
      *         STEUERUNG DER FUNKTION DRPA0267
      *
      *         - ADRESSIERUNG DER ZUGEHOERIGEN FUNKTIONS-PARAMETER
      *           PI-DRPA0267 UND PO-DRPA0267
      *         - ANSTEUERUNG DER ROUTINEN VORLAUF, VERARBEITUNG UND
      *           NACHLAUF
      *
      *         - DER NACHLAUF MUSS IMMER DURCHGEFUEHRT WERDEN, UM DEN
      *           RC DER FUNKTION ZU BESCHICKEN
      *---------------------------------------------------------------*
           MOVE 'X08- '                  TO ERR-ORT-SEC
      *
           SET Z-POINTER                 TO ADDRESS OF PI-EINGABE
           SET ADDRESS OF PI-DRPA0267    TO Z-POINTER
           SET Z-POINTER                 TO ADDRESS OF PO-RUECKGABE
           SET ADDRESS OF PO-DRPA0267    TO Z-POINTER
      *
           IF Z-RC = K-RC-OK
              PERFORM X081-VORLAUF-DRPA0267
           END-IF
      *
           IF Z-RC = K-RC-OK
              PERFORM X082-VERARB-DRPA0267
           END-IF
      *
           PERFORM X083-NACHLAUF-DRPA0267
           .
       X08-EXIT.
           EXIT.
      *---------------------------------------------------------------*
       X081-VORLAUF-DRPA0267 SECTION.
      *---------------------------------------------------------------*
      * INPUT : -
      * OUTPUT: -
      * VERARBEITUNG:
      *         VORLAUF FUER FUNKTION DRPA0267
      *
      *         - PLAUSIBILITAETSPRUEFUNG DER UEBERGABEPARAMETER
      *             - ...
      *         -
      *---------------------------------------------------------------*
           MOVE 'X081-'                            TO ERR-ORT-SEC
      *
           MOVE 'PGEB:'                  TO D-ERR-PGEB-GES-T
           MOVE PI-DRPA0267-PGEB-GES     TO D-ERR-PGEB-GES
           MOVE ' TARIF'                 TO D-ERR-PROD-T
           MOVE PI-DRPA0267-TARIF
                                         TO D-ERR-PROD-X
           MOVE ' STICHTAG:'             TO D-ERR-STICHTAG-T
           MOVE PI-DRPA0267-STICHTAG     TO D-ERR-STICHTAG
           MOVE D-ERR-VAR-ZEILE03        TO ERR-VAR-ZEILE03

           IF PI-DRPA0267-PGEB-GES = 0
              MOVE 'PARAMETER PI-DRPA0267-PGEB-GES = 0'  TO
              ERR-VAR-ZEILE01
              MOVE K-1                             TO ERR-ORT-LFD
              PERFORM XR93-UPRO-PROG-FEHLER
              GO TO XST-EXIT
           END-IF

           IF PI-DRPA0267-TARIF = SPACE
              MOVE 'PARAMETER PI-DRPA0267-TARIF LEER'  TO
              ERR-VAR-ZEILE01
              MOVE K-2                             TO ERR-ORT-LFD
              PERFORM XR93-UPRO-PROG-FEHLER
              GO TO XST-EXIT
           END-IF

           IF PI-DRPA0267-STICHTAG = SPACE
              MOVE 'PARAMETER PI-DRPA0267-STICHTAG LEER'  TO
              ERR-VAR-ZEILE01
              MOVE K-3                             TO ERR-ORT-LFD
              PERFORM XR93-UPRO-PROG-FEHLER
              GO TO XST-EXIT
           END-IF

           PERFORM U01-LAUFDATUM

           EVALUATE TRUE
           WHEN S-KNR-AN-KONF-EGG-PGTA-UNDEF
                INITIALIZE PI-DRAT0151
                           PO-DRAT0151
                MOVE K-KTY-AN-KONFIGURATION
                  TO PI-DRAT0151-KTY-NR
                MOVE K-KNR-AN-KONF-EGG-PGTA
                  TO PI-DRAT0151-KNR-NR
                PERFORM U10-ZWAT0008-DRAT0151

                EVALUATE TRUE
                WHEN PO-DRAT0151-RC-OK
                     SET S-KNR-AN-KONF-EGG-PGTA-JA TO TRUE
                WHEN OTHER
                     SET S-KNR-AN-KONF-EGG-PGTA-NEIN TO TRUE
                END-EVALUATE
           END-EVALUATE

           .
       X081-EXIT.
           EXIT.
      *
      *---------------------------------------------------------------*
       X082-VERARB-DRPA0267 SECTION.
      *---------------------------------------------------------------*
      * INPUT : -
      * OUTPUT: -
      * VERARBEITUNG:
      *         VERARBEITUNG FUER FUNKTION DRPA0267
      *         -  AUFRUF ORIGINAL (AGG)-FUNKTION ODER NEUE EGG
      *         -
      *         -
      *---------------------------------------------------------------*
           MOVE 'X082-'                  TO ERR-ORT-SEC

           EVALUATE TRUE
           WHEN S-KNR-AN-KONF-EGG-PGTA-JA
      *     ACHTUNG: HIER KANN KEINE UMSTELLUNG AUF EGG ERFOLGEN!
      *     NUTZUNG DURCH: PGEB=10 MEMO-ANTRÄGE PROGRAMM=PMAN0073
            PERFORM U18-UPAN0026-DRPA0267
           WHEN S-KNR-AN-KONF-EGG-PGTA-NEIN
            PERFORM U18-UPAN0026-DRPA0267
           WHEN OTHER
              MOVE 'SCHALTER S-KNR-AN-KONF-EGG-PGTA UNDEFINIERT! '  TO
              ERR-VAR-ZEILE01
              MOVE K-1                             TO ERR-ORT-LFD
              PERFORM XR93-UPRO-PROG-FEHLER
              GO TO XST-EXIT
           END-EVALUATE


           .
       X082-EXIT.
           EXIT.
      *---------------------------------------------------------------*
       X083-NACHLAUF-DRPA0267 SECTION.
      *---------------------------------------------------------------*
      * INPUT : -
      * OUTPUT: -
      * VERARBEITUNG:
      *         NACHLAUF FUER FUNKTION DRPA0267
      *
      *         -
      *         -
      *         -
      *
      *         - RC DER FUNKTION FUELLEN
      *---------------------------------------------------------------**
           MOVE 'X083-'                  TO ERR-ORT-SEC
      *
           MOVE Z-RC TO PO-DRPA0267-RC
           .
       X083-EXIT.
           EXIT.
      *---------------------------------------------------------------*
       X09-FUNKTION-DRPA1266 SECTION.
      *---------------------------------------------------------------*
      * INPUT : -
      * OUTPUT: -
      * VERARBEITUNG:
      *         STEUERUNG DER FUNKTION DRPA1266
      *
      *         - ADRESSIERUNG DER ZUGEHOERIGEN FUNKTIONS-PARAMETER
      *           PI-DRPA1266 UND PO-DRPA1266
      *         - ANSTEUERUNG DER ROUTINEN VORLAUF, VERARBEITUNG UND
      *           NACHLAUF
      *
      *         - DER NACHLAUF MUSS IMMER DURCHGEFUEHRT WERDEN, UM DEN
      *           RC DER FUNKTION ZU BESCHICKEN
      *---------------------------------------------------------------*
           MOVE 'X09- '                  TO ERR-ORT-SEC
      *
           SET Z-POINTER                 TO ADDRESS OF PI-EINGABE
           SET ADDRESS OF PI-DRPA1266    TO Z-POINTER
           SET Z-POINTER                 TO ADDRESS OF PO-RUECKGABE
           SET ADDRESS OF PO-DRPA1266    TO Z-POINTER
      *
           IF Z-RC = K-RC-OK
              PERFORM X091-VORLAUF-DRPA1266
           END-IF
      *
           IF Z-RC = K-RC-OK
              PERFORM X092-VERARB-DRPA1266
           END-IF
      *
           PERFORM X093-NACHLAUF-DRPA1266
           .
       X09-EXIT.
           EXIT.
      *---------------------------------------------------------------*
       X091-VORLAUF-DRPA1266 SECTION.
      *---------------------------------------------------------------*
      * INPUT : -
      * OUTPUT: -
      * VERARBEITUNG:
      *         VORLAUF FUER FUNKTION DRPA1266
      *
      *         - PLAUSIBILITAETSPRUEFUNG DER UEBERGABEPARAMETER
      *             - ...
      *         -
      *---------------------------------------------------------------*
           MOVE 'X091-'                            TO ERR-ORT-SEC
      *
           MOVE 'PGEB:'                  TO D-ERR-PGEB-GES-T
           MOVE PI-DRPA1266-PGEB-GES     TO D-ERR-PGEB-GES
           MOVE ' PROD:'                 TO D-ERR-PROD-T
           MOVE PI-DRPA1266-PROD-PROD-SCHL
                                         TO D-ERR-PROD
           MOVE ' STICHTAG:'             TO D-ERR-STICHTAG-T
           MOVE PI-DRPA1266-STICHTAG     TO D-ERR-STICHTAG
           MOVE D-ERR-VAR-ZEILE03        TO ERR-VAR-ZEILE03

           IF PI-DRPA1266-PGEB-GES = 0
              MOVE 'PARAMETER PI-DRPA1266-PGEB-GES = 0'  TO
              ERR-VAR-ZEILE01
              MOVE K-1                             TO ERR-ORT-LFD
              PERFORM XR93-UPRO-PROG-FEHLER
              GO TO XST-EXIT
           END-IF

           IF PI-DRPA1266-STICHTAG = SPACE
              MOVE 'PARAMETER PI-DRPA1266-STICHTAG LEER'  TO
              ERR-VAR-ZEILE01
              MOVE K-3                             TO ERR-ORT-LFD
              PERFORM XR93-UPRO-PROG-FEHLER
              GO TO XST-EXIT
           END-IF

           PERFORM U01-LAUFDATUM

           EVALUATE TRUE
           WHEN S-KNR-AN-KONF-EGG-PGTA-UNDEF
                INITIALIZE PI-DRAT0151
                           PO-DRAT0151
                MOVE K-KTY-AN-KONFIGURATION
                  TO PI-DRAT0151-KTY-NR
                MOVE K-KNR-AN-KONF-EGG-PGTA
                  TO PI-DRAT0151-KNR-NR
                PERFORM U10-ZWAT0008-DRAT0151

                EVALUATE TRUE
                WHEN PO-DRAT0151-RC-OK
                     SET S-KNR-AN-KONF-EGG-PGTA-JA TO TRUE
                WHEN OTHER
                     SET S-KNR-AN-KONF-EGG-PGTA-NEIN TO TRUE
                END-EVALUATE
           END-EVALUATE

           .
       X091-EXIT.
           EXIT.
      *
      *---------------------------------------------------------------*
       X092-VERARB-DRPA1266 SECTION.
      *---------------------------------------------------------------*
      * INPUT : -
      * OUTPUT: -
      * VERARBEITUNG:
      *         VERARBEITUNG FUER FUNKTION DRPA1266
      *         -  AUFRUF ORIGINAL (AGG)-FUNKTION ODER NEUE EGG
      *         -
      *         -
      *---------------------------------------------------------------*
           MOVE 'X092-'                  TO ERR-ORT-SEC

           EVALUATE TRUE
           WHEN S-KNR-AN-KONF-EGG-PGTA-JA
            PERFORM U39-EGG-UPAN0026-DRPA1266
           WHEN S-KNR-AN-KONF-EGG-PGTA-NEIN
            PERFORM U19-UPAN0026-DRPA1266
           WHEN OTHER
              MOVE 'SCHALTER S-KNR-AN-KONF-EGG-PGTA UNDEFINIERT! '  TO
              ERR-VAR-ZEILE01
              MOVE K-1                             TO ERR-ORT-LFD
              PERFORM XR93-UPRO-PROG-FEHLER
              GO TO XST-EXIT
           END-EVALUATE


           .
       X092-EXIT.
           EXIT.
      *---------------------------------------------------------------*
       X093-NACHLAUF-DRPA1266 SECTION.
      *---------------------------------------------------------------*
      * INPUT : -
      * OUTPUT: -
      * VERARBEITUNG:
      *         NACHLAUF FUER FUNKTION DRPA1266
      *
      *         -
      *         -
      *         -
      *
      *         - RC DER FUNKTION FUELLEN
      *---------------------------------------------------------------**
           MOVE 'X093-'                  TO ERR-ORT-SEC
      *
           MOVE Z-RC TO PO-DRPA1266-RC
           .
       X093-EXIT.
           EXIT.
      *---------------------------------------------------------------*
       X10-FUNKTION-DRPA1348 SECTION.
      *---------------------------------------------------------------*
      * INPUT : -
      * OUTPUT: -
      * VERARBEITUNG:
      *         STEUERUNG DER FUNKTION DRPA1348
      *
      *         - ADRESSIERUNG DER ZUGEHOERIGEN FUNKTIONS-PARAMETER
      *           PI-DRPA1348 UND PO-DRPA1348
      *         - ANSTEUERUNG DER ROUTINEN VORLAUF, VERARBEITUNG UND
      *           NACHLAUF
      *
      *         - DER NACHLAUF MUSS IMMER DURCHGEFUEHRT WERDEN, UM DEN
      *           RC DER FUNKTION ZU BESCHICKEN
      *---------------------------------------------------------------*
           MOVE 'X10- '                  TO ERR-ORT-SEC
      *
           SET Z-POINTER                 TO ADDRESS OF PI-EINGABE
           SET ADDRESS OF PI-DRPA1348    TO Z-POINTER
           SET Z-POINTER                 TO ADDRESS OF PO-RUECKGABE
           SET ADDRESS OF PO-DRPA1348    TO Z-POINTER
      *
           IF Z-RC = K-RC-OK
              PERFORM X101-VORLAUF-DRPA1348
           END-IF
      *
           IF Z-RC = K-RC-OK
              PERFORM X102-VERARB-DRPA1348
           END-IF
      *
           PERFORM X103-NACHLAUF-DRPA1348
           .
       X10-EXIT.
           EXIT.
      *---------------------------------------------------------------*
       X101-VORLAUF-DRPA1348 SECTION.
      *---------------------------------------------------------------*
      * INPUT : -
      * OUTPUT: -
      * VERARBEITUNG:
      *         VORLAUF FUER FUNKTION DRPA1348
      *
      *         - PLAUSIBILITAETSPRUEFUNG DER UEBERGABEPARAMETER
      *             - ...
      *         -
      *---------------------------------------------------------------*
           MOVE 'X101-'                            TO ERR-ORT-SEC
      *
           MOVE 'PGEB:'                  TO D-ERR-PGEB-GES-T
           MOVE PI-DRPA1348-PGEB-GES     TO D-ERR-PGEB-GES
           MOVE '      '                 TO D-ERR-PROD-T
           MOVE D-ERR-VAR-ZEILE03        TO ERR-VAR-ZEILE03

           IF PI-DRPA1348-PGEB-GES = 0
              MOVE 'PARAMETER PI-DRPA1348-PGEB-GES = 0'  TO
              ERR-VAR-ZEILE01
              MOVE K-1                             TO ERR-ORT-LFD
              PERFORM XR93-UPRO-PROG-FEHLER
              GO TO XST-EXIT
           END-IF

           PERFORM U01-LAUFDATUM

           EVALUATE TRUE
           WHEN S-KNR-AN-KONF-EGG-PGKF-UNDEF
                INITIALIZE PI-DRAT0151
                           PO-DRAT0151
                MOVE K-KTY-AN-KONFIGURATION
                  TO PI-DRAT0151-KTY-NR
                MOVE K-KNR-AN-KONF-EGG-PGKF
                  TO PI-DRAT0151-KNR-NR
                PERFORM U10-ZWAT0008-DRAT0151

                EVALUATE TRUE
                WHEN PO-DRAT0151-RC-OK
                     SET S-KNR-AN-KONF-EGG-PGKF-JA TO TRUE
                WHEN OTHER
                     SET S-KNR-AN-KONF-EGG-PGKF-NEIN TO TRUE
                END-EVALUATE
           END-EVALUATE

           .
       X101-EXIT.
           EXIT.
      *
      *---------------------------------------------------------------*
       X102-VERARB-DRPA1348 SECTION.
      *---------------------------------------------------------------*
      * INPUT : -
      * OUTPUT: -
      * VERARBEITUNG:
      *         VERARBEITUNG FUER FUNKTION DRPA1348
      *         -  AUFRUF ORIGINAL (AGG)-FUNKTION ODER NEUE EGG
      *         -
      *         -
      *---------------------------------------------------------------*
           MOVE 'X102-'                  TO ERR-ORT-SEC

           EVALUATE TRUE
           WHEN S-KNR-AN-KONF-EGG-PGKF-JA
             PERFORM U40-UPAN0026-DRPA1348
           WHEN S-KNR-AN-KONF-EGG-PGKF-NEIN
            PERFORM U20-UPAN0026-DRPA1348
           WHEN OTHER
              MOVE 'SCHALTER S-KNR-AN-KONF-EGG-PGKF UNDEFINIERT! '  TO
              ERR-VAR-ZEILE01
              MOVE K-1                             TO ERR-ORT-LFD
              PERFORM XR93-UPRO-PROG-FEHLER
              GO TO XST-EXIT
           END-EVALUATE


           .
       X102-EXIT.
           EXIT.
      *---------------------------------------------------------------*
       X103-NACHLAUF-DRPA1348 SECTION.
      *---------------------------------------------------------------*
      * INPUT : -
      * OUTPUT: -
      * VERARBEITUNG:
      *         NACHLAUF FUER FUNKTION DRPA1348
      *
      *         -
      *         -
      *         -
      *
      *         - RC DER FUNKTION FUELLEN
      *---------------------------------------------------------------**
           MOVE 'X103-'                  TO ERR-ORT-SEC
      *
           MOVE Z-RC TO PO-DRPA1348-RC
           .
       X103-EXIT.
           EXIT.
      *---------------------------------------------------------------*
       X11-FUNKTION-DRPA1381 SECTION.
      *---------------------------------------------------------------*
      * INPUT : -
      * OUTPUT: -
      * VERARBEITUNG:
      *         STEUERUNG DER FUNKTION DRPA1381
      *
      *         - ADRESSIERUNG DER ZUGEHOERIGEN FUNKTIONS-PARAMETER
      *           PI-DRPA1381 UND PO-DRPA1381
      *         - ANSTEUERUNG DER ROUTINEN VORLAUF, VERARBEITUNG UND
      *           NACHLAUF
      *
      *         - DER NACHLAUF MUSS IMMER DURCHGEFUEHRT WERDEN, UM DEN
      *           RC DER FUNKTION ZU BESCHICKEN
      *---------------------------------------------------------------*
           MOVE 'X11- '                  TO ERR-ORT-SEC
      *
           SET Z-POINTER                 TO ADDRESS OF PI-EINGABE
           SET ADDRESS OF PI-DRPA1381    TO Z-POINTER
           SET Z-POINTER                 TO ADDRESS OF PO-RUECKGABE
           SET ADDRESS OF PO-DRPA1381    TO Z-POINTER
      *
           IF Z-RC = K-RC-OK
              PERFORM X111-VORLAUF-DRPA1381
           END-IF
      *
           IF Z-RC = K-RC-OK
              PERFORM X112-VERARB-DRPA1381
           END-IF
      *
           PERFORM X113-NACHLAUF-DRPA1381
           .
       X11-EXIT.
           EXIT.
      *---------------------------------------------------------------*
       X111-VORLAUF-DRPA1381 SECTION.
      *---------------------------------------------------------------*
      * INPUT : -
      * OUTPUT: -
      * VERARBEITUNG:
      *         VORLAUF FUER FUNKTION DRPA1381
      *
      *         - PLAUSIBILITAETSPRUEFUNG DER UEBERGABEPARAMETER
      *             - ...
      *         -
      *---------------------------------------------------------------*
           MOVE 'X111-'                            TO ERR-ORT-SEC
      *
           MOVE 'PGEB:'                  TO D-ERR-PGEB-GES-T
           MOVE PI-DRPA1381-PGEB-GES     TO D-ERR-PGEB-GES
           MOVE ' KARD:'                 TO D-ERR-PROD-T
           MOVE PI-DRPA1381-KNR-KARD-BEZ(1)
                                         TO D-ERR-PROD
           MOVE D-ERR-VAR-ZEILE03        TO ERR-VAR-ZEILE03


           IF PI-DRPA1381-PGEB-GES = 0
              MOVE 'PARAMETER PI-DRPA1381-PGEB-GES = 0'  TO
              ERR-VAR-ZEILE01
              MOVE K-1                             TO ERR-ORT-LFD
              PERFORM XR93-UPRO-PROG-FEHLER
              GO TO XST-EXIT
           END-IF

           PERFORM U01-LAUFDATUM

           EVALUATE TRUE
           WHEN S-KNR-AN-KONF-EGG-PGKF-UNDEF
                INITIALIZE PI-DRAT0151
                           PO-DRAT0151
                MOVE K-KTY-AN-KONFIGURATION
                  TO PI-DRAT0151-KTY-NR
                MOVE K-KNR-AN-KONF-EGG-PGKF
                  TO PI-DRAT0151-KNR-NR
                PERFORM U10-ZWAT0008-DRAT0151

                EVALUATE TRUE
                WHEN PO-DRAT0151-RC-OK
                     SET S-KNR-AN-KONF-EGG-PGKF-JA TO TRUE
                WHEN OTHER
                     SET S-KNR-AN-KONF-EGG-PGKF-NEIN TO TRUE
                END-EVALUATE
           END-EVALUATE

           .
       X111-EXIT.
           EXIT.
      *
      *---------------------------------------------------------------*
       X112-VERARB-DRPA1381 SECTION.
      *---------------------------------------------------------------*
      * INPUT : -
      * OUTPUT: -
      * VERARBEITUNG:
      *         VERARBEITUNG FUER FUNKTION DRPA1381
      *         -  AUFRUF ORIGINAL (AGG)-FUNKTION ODER NEUE EGG
      *         -
      *         -
      *---------------------------------------------------------------*
           MOVE 'X112-'                  TO ERR-ORT-SEC

           EVALUATE TRUE
           WHEN S-KNR-AN-KONF-EGG-PGKF-JA
             PERFORM U41-UPAN0026-DRPA1381
           WHEN S-KNR-AN-KONF-EGG-PGKF-NEIN
            PERFORM U21-UPAN0026-DRPA1381
           WHEN OTHER
              MOVE 'SCHALTER S-KNR-AN-KONF-EGG-PGKF UNDEFINIERT! '  TO
              ERR-VAR-ZEILE01
              MOVE K-1                             TO ERR-ORT-LFD
              PERFORM XR93-UPRO-PROG-FEHLER
              GO TO XST-EXIT
           END-EVALUATE


           .
       X112-EXIT.
           EXIT.
      *---------------------------------------------------------------*
       X113-NACHLAUF-DRPA1381 SECTION.
      *---------------------------------------------------------------*
      * INPUT : -
      * OUTPUT: -
      * VERARBEITUNG:
      *         NACHLAUF FUER FUNKTION DRPA1381
      *
      *         -
      *         -
      *         -
      *
      *         - RC DER FUNKTION FUELLEN
      *---------------------------------------------------------------**
           MOVE 'X113-'                  TO ERR-ORT-SEC
      *
           MOVE Z-RC TO PO-DRPA1381-RC
           .
       X113-EXIT.
           EXIT.
      *---------------------------------------------------------------*
       X12-FUNKTION-DRPA1818 SECTION.
      *---------------------------------------------------------------*
      * INPUT : -
      * OUTPUT: -
      * VERARBEITUNG:
      *         STEUERUNG DER FUNKTION DRPA1818
      *
      *         - ADRESSIERUNG DER ZUGEHOERIGEN FUNKTIONS-PARAMETER
      *           PI-DRPA1818 UND PO-DRPA1818
      *         - ANSTEUERUNG DER ROUTINEN VORLAUF, VERARBEITUNG UND
      *           NACHLAUF
      *
      *         - DER NACHLAUF MUSS IMMER DURCHGEFUEHRT WERDEN, UM DEN
      *           RC DER FUNKTION ZU BESCHICKEN
      *---------------------------------------------------------------*
           MOVE 'X12- '                  TO ERR-ORT-SEC
      *
           SET Z-POINTER                 TO ADDRESS OF PI-EINGABE
           SET ADDRESS OF PI-DRPA1818    TO Z-POINTER
           SET Z-POINTER                 TO ADDRESS OF PO-RUECKGABE
           SET ADDRESS OF PO-DRPA1818    TO Z-POINTER
      *
           IF Z-RC = K-RC-OK
              PERFORM X121-VORLAUF-DRPA1818
           END-IF
      *
           IF Z-RC = K-RC-OK
              PERFORM X122-VERARB-DRPA1818
           END-IF
      *
           PERFORM X123-NACHLAUF-DRPA1818
           .
       X12-EXIT.
           EXIT.
      *---------------------------------------------------------------*
       X121-VORLAUF-DRPA1818 SECTION.
      *---------------------------------------------------------------*
      * INPUT : -
      * OUTPUT: -
      * VERARBEITUNG:
      *         VORLAUF FUER FUNKTION DRPA1818
      *
      *         - PLAUSIBILITAETSPRUEFUNG DER UEBERGABEPARAMETER
      *             - ...
      *         -
      *---------------------------------------------------------------*
           MOVE 'X121-'                            TO ERR-ORT-SEC
      *
           MOVE 'PGEB:'                  TO D-ERR-PGEB-GES-T
           MOVE PI-DRPA1818-PGEB-GES     TO D-ERR-PGEB-GES
           MOVE ' PROD:'                 TO D-ERR-PROD-T
           MOVE PI-DRPA1818-PROD-PROD-SCHL
                                         TO D-ERR-PROD
           MOVE ' STICHTAG:'             TO D-ERR-STICHTAG-T
           MOVE PI-DRPA1818-STICHTAG     TO D-ERR-STICHTAG
           MOVE D-ERR-VAR-ZEILE03        TO ERR-VAR-ZEILE03

           IF PI-DRPA1818-PGEB-GES = 0
              MOVE 'PARAMETER PI-DRPA1818-PGEB-GES = 0'  TO
              ERR-VAR-ZEILE01
              MOVE K-1                             TO ERR-ORT-LFD
              PERFORM XR93-UPRO-PROG-FEHLER
              GO TO XST-EXIT
           END-IF

           PERFORM U01-LAUFDATUM

           EVALUATE TRUE
           WHEN S-KNR-AN-KONF-EGG-PROD-UNDEF
                INITIALIZE PI-DRAT0151
                           PO-DRAT0151
                MOVE K-KTY-AN-KONFIGURATION
                  TO PI-DRAT0151-KTY-NR
                MOVE K-KNR-AN-KONF-EGG-PROD
                  TO PI-DRAT0151-KNR-NR
                PERFORM U10-ZWAT0008-DRAT0151

                EVALUATE TRUE
                WHEN PO-DRAT0151-RC-OK
                     SET S-KNR-AN-KONF-EGG-PROD-JA TO TRUE
                WHEN OTHER
                     SET S-KNR-AN-KONF-EGG-PROD-NEIN TO TRUE
                END-EVALUATE
           END-EVALUATE

           .
       X121-EXIT.
           EXIT.
      *
      *---------------------------------------------------------------*
       X122-VERARB-DRPA1818 SECTION.
      *---------------------------------------------------------------*
      * INPUT : -
      * OUTPUT: -
      * VERARBEITUNG:
      *         VERARBEITUNG FUER FUNKTION DRPA1818
      *         -  AUFRUF ORIGINAL (AGG)-FUNKTION ODER NEUE EGG
      *         -
      *         -
      *---------------------------------------------------------------*
           MOVE 'X122-'                  TO ERR-ORT-SEC

           EVALUATE TRUE
           WHEN S-KNR-AN-KONF-EGG-PROD-JA
            PERFORM U42-EGG-UPAN0026-DRPA1818
           WHEN S-KNR-AN-KONF-EGG-PROD-NEIN
            PERFORM U22-UPAN0026-DRPA1818
           WHEN OTHER
              MOVE 'SCHALTER S-KNR-AN-KONF-EGG-PROD UNDEFINIERT! '  TO
              ERR-VAR-ZEILE01
              MOVE K-1                             TO ERR-ORT-LFD
              PERFORM XR93-UPRO-PROG-FEHLER
              GO TO XST-EXIT
           END-EVALUATE


           .
       X122-EXIT.
           EXIT.
      *---------------------------------------------------------------*
       X123-NACHLAUF-DRPA1818 SECTION.
      *---------------------------------------------------------------*
      * INPUT : -
      * OUTPUT: -
      * VERARBEITUNG:
      *         NACHLAUF FUER FUNKTION DRPA1818
      *
      *         -
      *         -
      *         -
      *
      *         - RC DER FUNKTION FUELLEN
      *---------------------------------------------------------------**
           MOVE 'X123-'                  TO ERR-ORT-SEC
      *
           MOVE Z-RC TO PO-DRPA1818-RC
           .
       X123-EXIT.
           EXIT.
      *---------------------------------------------------------------*
       X13-FUNKTION-DRAN0310 SECTION.
      *---------------------------------------------------------------*
      * INPUT : -
      * OUTPUT: -
      * VERARBEITUNG:
      *         STEUERUNG DER FUNKTION DRAN0310
      *
      *         - ADRESSIERUNG DER ZUGEHOERIGEN FUNKTIONS-PARAMETER
      *           PI-DRAN0310 UND PO-DRAN0310
      *         - ANSTEUERUNG DER ROUTINEN VORLAUF, VERARBEITUNG UND
      *           NACHLAUF
      *
      *         - DER NACHLAUF MUSS IMMER DURCHGEFUEHRT WERDEN, UM DEN
      *           RC DER FUNKTION ZU BESCHICKEN
      *---------------------------------------------------------------*
           MOVE 'X13- '                  TO ERR-ORT-SEC
      *
           SET Z-POINTER                 TO ADDRESS OF PI-EINGABE
           SET ADDRESS OF PI-DRAN0310    TO Z-POINTER
           SET Z-POINTER                 TO ADDRESS OF PO-RUECKGABE
           SET ADDRESS OF PO-DRAN0310    TO Z-POINTER
      *
           IF Z-RC = K-RC-OK
              PERFORM X131-VORLAUF-DRAN0310
           END-IF
      *
           IF Z-RC = K-RC-OK
              PERFORM X132-VERARB-DRAN0310
           END-IF
      *
           PERFORM X133-NACHLAUF-DRAN0310
           .
       X13-EXIT.
           EXIT.
      *---------------------------------------------------------------*
       X131-VORLAUF-DRAN0310 SECTION.
      *---------------------------------------------------------------*
      * INPUT : -
      * OUTPUT: -
      * VERARBEITUNG:
      *         VORLAUF FUER FUNKTION DRAN0310
      *
      *         - PLAUSIBILITAETSPRUEFUNG DER UEBERGABEPARAMETER
      *             - ...
      *         -
      *---------------------------------------------------------------*
           MOVE 'X131-'                            TO ERR-ORT-SEC
      *
           MOVE 'PG-QU'                  TO D-ERR-PGEB-GES-T
           MOVE PI-DRAN0310-PGEB-GES-QUELLE
                                         TO D-ERR-PGEB-GES
           MOVE ' PG-ZI'                 TO D-ERR-PROD-T
           MOVE PI-DRAN0310-PGEB-GES-ZIEL
                                         TO D-ERR-PROD
           MOVE ' PROD-QUE:'             TO D-ERR-STICHTAG-T
           MOVE PI-DRAN0310-PS-QUELLE    TO Z-9-4
           MOVE Z-9-4                    TO D-ERR-STICHTAG
           MOVE D-ERR-VAR-ZEILE03        TO ERR-VAR-ZEILE03

           IF PI-DRAN0310-PGEB-GES-QUELLE = 0
              MOVE 'PARAMETER PI-DRAN0310-PGEB-GES-QUELLE = 0'  TO
              ERR-VAR-ZEILE01
              MOVE K-1                             TO ERR-ORT-LFD
              PERFORM XR93-UPRO-PROG-FEHLER
              GO TO XST-EXIT
           END-IF
           IF PI-DRAN0310-PGEB-GES-ZIEL = 0
              MOVE 'PARAMETER PI-DRAN0310-PGEB-GES-ZIEL = 0'  TO
              ERR-VAR-ZEILE01
              MOVE K-2                             TO ERR-ORT-LFD
              PERFORM XR93-UPRO-PROG-FEHLER
              GO TO XST-EXIT
           END-IF

           PERFORM U01-LAUFDATUM

           EVALUATE TRUE
           WHEN S-KNR-AN-KONF-EGG-PGTA-UNDEF
                INITIALIZE PI-DRAT0151
                           PO-DRAT0151
                MOVE K-KTY-AN-KONFIGURATION
                  TO PI-DRAT0151-KTY-NR
                MOVE K-KNR-AN-KONF-EGG-PGTA
                  TO PI-DRAT0151-KNR-NR
                PERFORM U10-ZWAT0008-DRAT0151

                EVALUATE TRUE
                WHEN PO-DRAT0151-RC-OK
                     SET S-KNR-AN-KONF-EGG-PGTA-JA TO TRUE
                WHEN OTHER
                     SET S-KNR-AN-KONF-EGG-PGTA-NEIN TO TRUE
                END-EVALUATE
           END-EVALUATE

           .
       X131-EXIT.
           EXIT.
      *
      *---------------------------------------------------------------*
       X132-VERARB-DRAN0310 SECTION.
      *---------------------------------------------------------------*
      * INPUT : -
      * OUTPUT: -
      * VERARBEITUNG:
      *         VERARBEITUNG FUER FUNKTION DRAN0310
      *         -  AUFRUF ORIGINAL (AGG)-FUNKTION ODER NEUE EGG
      *         -
      *         -
      *---------------------------------------------------------------*
           MOVE 'X132-'                  TO ERR-ORT-SEC

           EVALUATE TRUE
           WHEN S-KNR-AN-KONF-EGG-PGTA-JA
            PERFORM U43-EGG-UPAN0026-DRAN0310
           WHEN S-KNR-AN-KONF-EGG-PGTA-NEIN
            PERFORM U23-UPAN0026-DRAN0310
           WHEN OTHER
              MOVE 'SCHALTER S-KNR-AN-KONF-EGG-PGTA UNDEFINIERT! '  TO
              ERR-VAR-ZEILE01
              MOVE K-1                             TO ERR-ORT-LFD
              PERFORM XR93-UPRO-PROG-FEHLER
              GO TO XST-EXIT
           END-EVALUATE


           .
       X132-EXIT.
           EXIT.
      *---------------------------------------------------------------*
       X133-NACHLAUF-DRAN0310 SECTION.
      *---------------------------------------------------------------*
      * INPUT : -
      * OUTPUT: -
      * VERARBEITUNG:
      *         NACHLAUF FUER FUNKTION DRAN0310
      *
      *         -
      *         -
      *         -
      *
      *         - RC DER FUNKTION FUELLEN
      *---------------------------------------------------------------**
           MOVE 'X133-'                  TO ERR-ORT-SEC
      *
           MOVE Z-RC TO PO-DRAN0310-RC
           .
       X133-EXIT.
           EXIT.
      *---------------------------------------------------------------*
       X14-FUNKTION-DRPA0284 SECTION.
      *---------------------------------------------------------------*
      * INPUT : -
      * OUTPUT: -
      * VERARBEITUNG:
      *         STEUERUNG DER FUNKTION DRPA0284
      *
      *         - ADRESSIERUNG DER ZUGEHOERIGEN FUNKTIONS-PARAMETER
      *           PI-DRPA0284 UND PO-DRPA0284
      *         - ANSTEUERUNG DER ROUTINEN VORLAUF, VERARBEITUNG UND
      *           NACHLAUF
      *
      *         - DER NACHLAUF MUSS IMMER DURCHGEFUEHRT WERDEN, UM DEN
      *           RC DER FUNKTION ZU BESCHICKEN
      *---------------------------------------------------------------*
           MOVE 'X14- '                  TO ERR-ORT-SEC
      *
           SET Z-POINTER                 TO ADDRESS OF PI-EINGABE
           SET ADDRESS OF PI-DRPA0284    TO Z-POINTER
           SET Z-POINTER                 TO ADDRESS OF PO-RUECKGABE
           SET ADDRESS OF PO-DRPA0284    TO Z-POINTER
      *
           IF Z-RC = K-RC-OK
              PERFORM X141-VORLAUF-DRPA0284
           END-IF
      *
           IF Z-RC = K-RC-OK
              PERFORM X142-VERARB-DRPA0284
           END-IF
      *
           PERFORM X143-NACHLAUF-DRPA0284
           .
       X14-EXIT.
           EXIT.
      *---------------------------------------------------------------*
       X141-VORLAUF-DRPA0284 SECTION.
      *---------------------------------------------------------------*
      * INPUT : -
      * OUTPUT: -
      * VERARBEITUNG:
      *         VORLAUF FUER FUNKTION DRPA0284
      *
      *         - PLAUSIBILITAETSPRUEFUNG DER UEBERGABEPARAMETER
      *             - ...
      *         -
      *---------------------------------------------------------------*
           MOVE 'X141-'                            TO ERR-ORT-SEC
      *
           MOVE 'PGEB:'                  TO D-ERR-PGEB-GES-T
           MOVE PI-DRPA0284-PGEB-GES     TO D-ERR-PGEB-GES
           MOVE ' TARIF'                 TO D-ERR-PROD-T
           MOVE PI-DRPA0284-PGTA-TARIF
                                         TO D-ERR-PROD-X
           MOVE ' PROGRAMM:'             TO D-ERR-STICHTAG-T
           MOVE PI-DRPA0284-PROGRAMM     TO D-ERR-STICHTAG
           MOVE D-ERR-VAR-ZEILE03        TO ERR-VAR-ZEILE03

           IF PI-DRPA0284-PGEB-GES = 0
              MOVE 'PARAMETER PI-DRPA0284-PGEB-GES = 0'  TO
              ERR-VAR-ZEILE01
              MOVE K-1                             TO ERR-ORT-LFD
              PERFORM XR93-UPRO-PROG-FEHLER
              GO TO XST-EXIT
           END-IF
           IF PI-DRPA0284-PGTA-TARIF = SPACE
              MOVE 'PARAMETER PI-DRPA0284-PGTA-TARI = SPACE'  TO
              ERR-VAR-ZEILE01
              MOVE K-2                             TO ERR-ORT-LFD
              PERFORM XR93-UPRO-PROG-FEHLER
              GO TO XST-EXIT
           END-IF
           IF PI-DRPA0284-PROGRAMM = SPACE
              MOVE 'PARAMETER PROGRAMM UNGUELTIG'   TO ERR-VAR-ZEILE01
              MOVE K-3                              TO ERR-ORT-LFD
              PERFORM XR93-UPRO-PROG-FEHLER
              GO TO XST-EXIT
           END-IF
      *
           EVALUATE PI-DRPA0284-UFKT
           WHEN K-LIST-FIRST
           WHEN K-LIST-NEXT
           WHEN K-LIST-QUIT
              CONTINUE
           WHEN OTHER
              MOVE 'PARAMETER UFKT-CODE UNGUELTIG'  TO ERR-VAR-ZEILE01
              MOVE K-4                              TO ERR-ORT-LFD
              PERFORM XR93-UPRO-PROG-FEHLER
              GO TO XST-EXIT
           END-EVALUATE


           PERFORM U01-LAUFDATUM

           EVALUATE TRUE
           WHEN S-KNR-AN-KONF-EGG-PGTA-UNDEF
                INITIALIZE PI-DRAT0151
                           PO-DRAT0151
                MOVE K-KTY-AN-KONFIGURATION
                  TO PI-DRAT0151-KTY-NR
                MOVE K-KNR-AN-KONF-EGG-PGTA
                  TO PI-DRAT0151-KNR-NR
                PERFORM U10-ZWAT0008-DRAT0151

                EVALUATE TRUE
                WHEN PO-DRAT0151-RC-OK
                     SET S-KNR-AN-KONF-EGG-PGTA-JA TO TRUE
                WHEN OTHER
                     SET S-KNR-AN-KONF-EGG-PGTA-NEIN TO TRUE
                END-EVALUATE
           END-EVALUATE

           .
       X141-EXIT.
           EXIT.
      *
      *---------------------------------------------------------------*
       X142-VERARB-DRPA0284 SECTION.
      *---------------------------------------------------------------*
      * INPUT : -
      * OUTPUT: -
      * VERARBEITUNG:
      *         VERARBEITUNG FUER FUNKTION DRPA0284
      *         -  AUFRUF ORIGINAL (AGG)-FUNKTION ODER NEUE EGG
      *         -
      *         -
      *---------------------------------------------------------------*
           MOVE 'X142-'                  TO ERR-ORT-SEC

           EVALUATE TRUE
           WHEN S-KNR-AN-KONF-EGG-PGTA-JA
            PERFORM U44-EGG-UPAN0026-DRPA0284
           WHEN S-KNR-AN-KONF-EGG-PGTA-NEIN
            PERFORM U24-UPAN0026-DRPA0284
           WHEN OTHER
              MOVE 'SCHALTER S-KNR-AN-KONF-EGG-PGTA UNDEFINIERT! '  TO
              ERR-VAR-ZEILE01
              MOVE K-1                             TO ERR-ORT-LFD
              PERFORM XR93-UPRO-PROG-FEHLER
              GO TO XST-EXIT
           END-EVALUATE


           .
       X142-EXIT.
           EXIT.
      *---------------------------------------------------------------*
       X143-NACHLAUF-DRPA0284 SECTION.
      *---------------------------------------------------------------*
      * INPUT : -
      * OUTPUT: -
      * VERARBEITUNG:
      *         NACHLAUF FUER FUNKTION DRPA0284
      *
      *         -
      *         -
      *         -
      *
      *         - RC DER FUNKTION FUELLEN
      *---------------------------------------------------------------**
           MOVE 'X143-'                  TO ERR-ORT-SEC
      *
           MOVE Z-RC                     TO PO-DRPA0284-RC
           .
       X143-EXIT.
           EXIT.
      *---------------------------------------------------------------*
       X15-FUNKTION-DRPA0200 SECTION.
      *---------------------------------------------------------------*
      * INPUT : -
      * OUTPUT: -
      * VERARBEITUNG:
      *         STEUERUNG DER FUNKTION DRPA0200
      *
      *         - ADRESSIERUNG DER ZUGEHOERIGEN FUNKTIONS-PARAMETER
      *           PI-DRPA0200 UND PO-DRPA0200
      *         - ANSTEUERUNG DER ROUTINEN VORLAUF, VERARBEITUNG UND
      *           NACHLAUF
      *
      *         - DER NACHLAUF MUSS IMMER DURCHGEFUEHRT WERDEN, UM DEN
      *           RC DER FUNKTION ZU BESCHICKEN
      *---------------------------------------------------------------*
           MOVE 'X15- '                  TO ERR-ORT-SEC
      *
           SET Z-POINTER                 TO ADDRESS OF PI-EINGABE
           SET ADDRESS OF PI-DRPA0200    TO Z-POINTER
           SET Z-POINTER                 TO ADDRESS OF PO-RUECKGABE
           SET ADDRESS OF PO-DRPA0200    TO Z-POINTER
      *
           IF Z-RC = K-RC-OK
              PERFORM X151-VORLAUF-DRPA0200
           END-IF
      *
           IF Z-RC = K-RC-OK
              PERFORM X152-VERARB-DRPA0200
           END-IF
      *
           PERFORM X153-NACHLAUF-DRPA0200
           .
       X15-EXIT.
           EXIT.
      *---------------------------------------------------------------*
       X151-VORLAUF-DRPA0200 SECTION.
      *---------------------------------------------------------------*
      * INPUT : -
      * OUTPUT: -
      * VERARBEITUNG:
      *         VORLAUF FUER FUNKTION DRPA0200
      *
      *         - PLAUSIBILITAETSPRUEFUNG DER UEBERGABEPARAMETER
      *             - ...
      *         -
      *---------------------------------------------------------------*
           MOVE 'X151-'                            TO ERR-ORT-SEC
      *
           MOVE 'PGEB:'                  TO D-ERR-PGEB-GES-T
           MOVE PI-DRPA0200-PGEB-GES     TO D-ERR-PGEB-GES
           MOVE ' PROD:'                 TO D-ERR-PROD-T
           MOVE PI-DRPA0200-PROD-PROD-SCHL
                                         TO D-ERR-PROD
           MOVE ' STICHTAG:'             TO D-ERR-STICHTAG-T
           MOVE PI-DRPA0200-STICHTAG  TO D-ERR-STICHTAG
           MOVE D-ERR-VAR-ZEILE03        TO ERR-VAR-ZEILE03

           IF PI-DRPA0200-PGEB-GES = 0
              MOVE 'PARAMETER PI-DRPA0200-PGEB-GES = 0'  TO
              ERR-VAR-ZEILE01
              MOVE K-1                             TO ERR-ORT-LFD
              PERFORM XR93-UPRO-PROG-FEHLER
              GO TO XST-EXIT
           END-IF

           PERFORM U01-LAUFDATUM

           EVALUATE TRUE
           WHEN S-KNR-AN-KONF-EGG-PROD-UNDEF
                INITIALIZE PI-DRAT0151
                           PO-DRAT0151
                MOVE K-KTY-AN-KONFIGURATION
                  TO PI-DRAT0151-KTY-NR
                MOVE K-KNR-AN-KONF-EGG-PROD
                  TO PI-DRAT0151-KNR-NR
                PERFORM U10-ZWAT0008-DRAT0151

                EVALUATE TRUE
                WHEN PO-DRAT0151-RC-OK
                     SET S-KNR-AN-KONF-EGG-PROD-JA TO TRUE
                WHEN OTHER
                     SET S-KNR-AN-KONF-EGG-PROD-NEIN TO TRUE
                END-EVALUATE
           END-EVALUATE

           .
       X151-EXIT.
           EXIT.
      *
      *---------------------------------------------------------------*
       X152-VERARB-DRPA0200 SECTION.
      *---------------------------------------------------------------*
      * INPUT : -
      * OUTPUT: -
      * VERARBEITUNG:
      *         VERARBEITUNG FUER FUNKTION DRPA0200
      *         -  AUFRUF ORIGINAL (AGG)-FUNKTION ODER NEUE EGG
      *         -
      *         -
      *---------------------------------------------------------------*
           MOVE 'X152-'                  TO ERR-ORT-SEC

           EVALUATE TRUE
           WHEN S-KNR-AN-KONF-EGG-PROD-JA
            PERFORM U46-EGG-UPAN0026-DRPA0200
           WHEN S-KNR-AN-KONF-EGG-PROD-NEIN
            PERFORM U26-UPAN0026-DRPA0200
           WHEN OTHER
              MOVE 'SCHALTER S-KNR-AN-KONF-EGG-PROD UNDEFINIERT! '  TO
              ERR-VAR-ZEILE01
              MOVE K-1                             TO ERR-ORT-LFD
              PERFORM XR93-UPRO-PROG-FEHLER
              GO TO XST-EXIT
           END-EVALUATE


           .
       X152-EXIT.
           EXIT.
      *---------------------------------------------------------------*
       X153-NACHLAUF-DRPA0200 SECTION.
      *---------------------------------------------------------------*
      * INPUT : -
      * OUTPUT: -
      * VERARBEITUNG:
      *         NACHLAUF FUER FUNKTION DRPA0200
      *
      *         -
      *         -
      *         -
      *
      *         - RC DER FUNKTION FUELLEN
      *---------------------------------------------------------------**
           MOVE 'X153-'                  TO ERR-ORT-SEC
      *
           MOVE Z-RC TO PO-DRPA0200-RC
           .
       X153-EXIT.
           EXIT.
      *---------------------------------------------------------------*
       X16-FUNKTION-DRPA1652 SECTION.
      *---------------------------------------------------------------*
      * INPUT : -
      * OUTPUT: -
      * VERARBEITUNG:
      *         STEUERUNG DER FUNKTION DRPA1652
      *
      *         - ADRESSIERUNG DER ZUGEHOERIGEN FUNKTIONS-PARAMETER
      *           PI-DRPA1652 UND PO-DRPA1652
      *         - ANSTEUERUNG DER ROUTINEN VORLAUF, VERARBEITUNG UND
      *           NACHLAUF
      *
      *         - DER NACHLAUF MUSS IMMER DURCHGEFUEHRT WERDEN, UM DEN
      *           RC DER FUNKTION ZU BESCHICKEN
      *---------------------------------------------------------------*
           MOVE 'X16- '                  TO ERR-ORT-SEC
      *
           SET Z-POINTER                 TO ADDRESS OF PI-EINGABE
           SET ADDRESS OF PI-DRPA1652    TO Z-POINTER
           SET Z-POINTER                 TO ADDRESS OF PO-RUECKGABE
           SET ADDRESS OF PO-DRPA1652    TO Z-POINTER
      *
           IF Z-RC = K-RC-OK
              PERFORM X161-VORLAUF-DRPA1652
           END-IF
      *
           IF Z-RC = K-RC-OK
              PERFORM X162-VERARB-DRPA1652
           END-IF
      *
           PERFORM X163-NACHLAUF-DRPA1652
           .
       X16-EXIT.
           EXIT.
      *---------------------------------------------------------------*
       X161-VORLAUF-DRPA1652 SECTION.
      *---------------------------------------------------------------*
      * INPUT : -
      * OUTPUT: -
      * VERARBEITUNG:
      *         VORLAUF FUER FUNKTION DRPA1652
      *
      *         - PLAUSIBILITAETSPRUEFUNG DER UEBERGABEPARAMETER
      *             - ...
      *         -
      *---------------------------------------------------------------*
           MOVE 'X161-'                            TO ERR-ORT-SEC
      *
           MOVE 'PGEB:'                  TO D-ERR-PGEB-GES-T
           MOVE PI-DRPA1652-PGEB-GES     TO D-ERR-PGEB-GES
           MOVE ' TARIF'                 TO D-ERR-PROD-T
           MOVE PI-DRPA1652-PROD-PROD-SCHL
                                         TO D-ERR-PROD
           MOVE ' PROGRAMM:'             TO D-ERR-STICHTAG-T
           MOVE PI-DRPA1652-PROGRAMM     TO D-ERR-STICHTAG
           MOVE D-ERR-VAR-ZEILE03        TO ERR-VAR-ZEILE03

           IF PI-DRPA1652-PGEB-GES = 0
              MOVE 'PARAMETER PI-DRPA1652-PGEB-GES = 0'  TO
              ERR-VAR-ZEILE01
              MOVE K-1                             TO ERR-ORT-LFD
              PERFORM XR93-UPRO-PROG-FEHLER
              GO TO XST-EXIT
           END-IF
           IF PI-DRPA1652-PROGRAMM = SPACE
              MOVE 'PARAMETER PROGRAMM UNGUELTIG'   TO ERR-VAR-ZEILE01
              MOVE K-3                              TO ERR-ORT-LFD
              PERFORM XR93-UPRO-PROG-FEHLER
              GO TO XST-EXIT
           END-IF

140122     INITIALIZE PO-DRPA1652

           EVALUATE PI-DRPA1652-UFKT-CODE
           WHEN K-LIST-FIRST
           WHEN K-LIST-NEXT
           WHEN K-LIST-QUIT
              CONTINUE
           WHEN OTHER
              MOVE 'PARAMETER UFKT-CODE UNGUELTIG'  TO ERR-VAR-ZEILE01
              MOVE K-4                              TO ERR-ORT-LFD
              PERFORM XR93-UPRO-PROG-FEHLER
              GO TO XST-EXIT
           END-EVALUATE


           PERFORM U01-LAUFDATUM

           EVALUATE TRUE
           WHEN S-KNR-AN-KONF-EGG-PRKO-UNDEF
                INITIALIZE PI-DRAT0151
                           PO-DRAT0151
                MOVE K-KTY-AN-KONFIGURATION
                  TO PI-DRAT0151-KTY-NR
                MOVE K-KNR-AN-KONF-EGG-PRKO
                  TO PI-DRAT0151-KNR-NR
                PERFORM U10-ZWAT0008-DRAT0151

                EVALUATE TRUE
                WHEN PO-DRAT0151-RC-OK
                     SET S-KNR-AN-KONF-EGG-PRKO-JA TO TRUE
                WHEN OTHER
                     SET S-KNR-AN-KONF-EGG-PRKO-NEIN TO TRUE
                END-EVALUATE
           END-EVALUATE

           .
       X161-EXIT.
           EXIT.
      *
      *---------------------------------------------------------------*
       X162-VERARB-DRPA1652 SECTION.
      *---------------------------------------------------------------*
      * INPUT : -
      * OUTPUT: -
      * VERARBEITUNG:
      *         VERARBEITUNG FUER FUNKTION DRPA1652
      *         -  AUFRUF ORIGINAL (AGG)-FUNKTION ODER NEUE EGG
      *         -
      *         -
      *---------------------------------------------------------------*
           MOVE 'X162-'                  TO ERR-ORT-SEC

           EVALUATE TRUE
           WHEN S-KNR-AN-KONF-EGG-PRKO-JA
            PERFORM U53-EGG-UPAN0026-DRPA1652
           WHEN S-KNR-AN-KONF-EGG-PRKO-NEIN
              MOVE 'DRPA1652 FÜR EGG-PRKO-NEIN NICHT IMPLEMENTIERT'
                                         TO ERR-VAR-ZEILE01
              MOVE K-1                   TO ERR-ORT-LFD
              PERFORM XR93-UPRO-PROG-FEHLER
              GO TO XST-EXIT
           WHEN OTHER
              MOVE 'SCHALTER S-KNR-AN-KONF-EGG-PRKO UNDEFINIERT! '  TO
              ERR-VAR-ZEILE01
              MOVE K-2                             TO ERR-ORT-LFD
              PERFORM XR93-UPRO-PROG-FEHLER
              GO TO XST-EXIT
           END-EVALUATE

           .
       X162-EXIT.
           EXIT.
      *---------------------------------------------------------------*
       X163-NACHLAUF-DRPA1652 SECTION.
      *---------------------------------------------------------------*
      * INPUT : -
      * OUTPUT: -
      * VERARBEITUNG:
      *         NACHLAUF FUER FUNKTION DRPA1652
      *
      *         -
      *         -
      *         -
      *
      *         - RC DER FUNKTION FUELLEN
      *---------------------------------------------------------------**
           MOVE 'X163-'                  TO ERR-ORT-SEC
      *
           MOVE Z-RC                     TO PO-DRPA1652-RC
           .
       X163-EXIT.
           EXIT.
      *---------------------------------------------------------------*
       X17-FUNKTION-DRPA1267 SECTION.
      *---------------------------------------------------------------*
      * INPUT : -
      * OUTPUT: -
      * VERARBEITUNG:
      *         STEUERUNG DER FUNKTION DRPA1267
      *
      *         - ADRESSIERUNG DER ZUGEHOERIGEN FUNKTIONS-PARAMETER
      *           PI-DRPA1267 UND PO-DRPA1267
      *         - ANSTEUERUNG DER ROUTINEN VORLAUF, VERARBEITUNG UND
      *           NACHLAUF
      *
      *         - DER NACHLAUF MUSS IMMER DURCHGEFUEHRT WERDEN, UM DEN
      *           RC DER FUNKTION ZU BESCHICKEN
      *---------------------------------------------------------------*
           MOVE 'X17- '                  TO ERR-ORT-SEC
      *
           SET Z-POINTER                 TO ADDRESS OF PI-EINGABE
           SET ADDRESS OF PI-DRPA1267    TO Z-POINTER
           SET Z-POINTER                 TO ADDRESS OF PO-RUECKGABE
           SET ADDRESS OF PO-DRPA1267    TO Z-POINTER
      *
           IF Z-RC = K-RC-OK
              PERFORM X171-VORLAUF-DRPA1267
           END-IF
      *
           IF Z-RC = K-RC-OK
              PERFORM X172-VERARB-DRPA1267
           END-IF
      *
           PERFORM X173-NACHLAUF-DRPA1267
           .
       X17-EXIT.
           EXIT.
      *---------------------------------------------------------------*
       X171-VORLAUF-DRPA1267 SECTION.
      *---------------------------------------------------------------*
      * INPUT : -
      * OUTPUT: -
      * VERARBEITUNG:
      *         VORLAUF FUER FUNKTION DRPA1267
      *
      *         - PLAUSIBILITAETSPRUEFUNG DER UEBERGABEPARAMETER
      *             - ...
      *         -
      *---------------------------------------------------------------*
           MOVE 'X171-'                            TO ERR-ORT-SEC
      *
           MOVE 'PGEB:'                  TO D-ERR-PGEB-GES-T
           MOVE PI-DRPA1267-PGEB-GES     TO D-ERR-PGEB-GES
           MOVE ' TARIF'                 TO D-ERR-PROD-T
           MOVE PI-DRPA1267-PROD-PROD-SCHL
                                         TO D-ERR-PROD-X
           MOVE ' PROGRAMM:'             TO D-ERR-STICHTAG-T
           MOVE PI-DRPA1267-PROGRAMM     TO D-ERR-STICHTAG
           MOVE D-ERR-VAR-ZEILE03        TO ERR-VAR-ZEILE03

           IF PI-DRPA1267-PGEB-GES = 0
              MOVE 'PARAMETER PI-DRPA1267-PGEB-GES = 0'  TO
              ERR-VAR-ZEILE01
              MOVE K-1                             TO ERR-ORT-LFD
              PERFORM XR93-UPRO-PROG-FEHLER
              GO TO XST-EXIT
           END-IF
           IF PI-DRPA1267-PROGRAMM = SPACE
              MOVE 'PARAMETER PROGRAMM UNGUELTIG'   TO ERR-VAR-ZEILE01
              MOVE K-3                              TO ERR-ORT-LFD
              PERFORM XR93-UPRO-PROG-FEHLER
              GO TO XST-EXIT
           END-IF

           EVALUATE PI-DRPA1267-UFKT
           WHEN K-LIST-FIRST
           WHEN K-LIST-NEXT
           WHEN K-LIST-QUIT
              CONTINUE
           WHEN OTHER
              MOVE 'PARAMETER UFKT-CODE UNGUELTIG'  TO ERR-VAR-ZEILE01
              MOVE K-4                              TO ERR-ORT-LFD
              PERFORM XR93-UPRO-PROG-FEHLER
              GO TO XST-EXIT
           END-EVALUATE


           PERFORM U01-LAUFDATUM

           EVALUATE TRUE
           WHEN S-KNR-AN-KONF-EGG-PGTA-UNDEF
                INITIALIZE PI-DRAT0151
                           PO-DRAT0151
                MOVE K-KTY-AN-KONFIGURATION
                  TO PI-DRAT0151-KTY-NR
                MOVE K-KNR-AN-KONF-EGG-PGTA
                  TO PI-DRAT0151-KNR-NR
                PERFORM U10-ZWAT0008-DRAT0151

                EVALUATE TRUE
                WHEN PO-DRAT0151-RC-OK
                     SET S-KNR-AN-KONF-EGG-PGTA-JA TO TRUE
                WHEN OTHER
                     SET S-KNR-AN-KONF-EGG-PGTA-NEIN TO TRUE
                END-EVALUATE
           END-EVALUATE

           .
       X171-EXIT.
           EXIT.
      *
      *---------------------------------------------------------------*
       X172-VERARB-DRPA1267 SECTION.
      *---------------------------------------------------------------*
      * INPUT : -
      * OUTPUT: -
      * VERARBEITUNG:
      *         VERARBEITUNG FUER FUNKTION DRPA1267
      *         -  AUFRUF ORIGINAL (AGG)-FUNKTION ODER NEUE EGG
      *         -
      *         -
      *---------------------------------------------------------------*
           MOVE 'X172-'                  TO ERR-ORT-SEC

           EVALUATE TRUE
           WHEN S-KNR-AN-KONF-EGG-PGTA-JA
                EVALUATE TRUE
                WHEN PI-DRPA1267-UFKT = K-LIST-FIRST
                WHEN PI-DRPA1267-UFKT = K-LIST-NEXT
                     PERFORM U54-EGG-UPAN0026-DRPA1267
                WHEN PI-DRPA1267-UFKT = K-LIST-QUIT
                     MOVE K-RC-OK        TO Z-RC
                END-EVALUATE
           WHEN S-KNR-AN-KONF-EGG-PGTA-NEIN
              MOVE 'DRPA1267 FÜR EGG-PGTA-NEIN NICHT IMPLEMENTIERT'
                                         TO ERR-VAR-ZEILE01
              MOVE K-1                   TO ERR-ORT-LFD
              PERFORM XR93-UPRO-PROG-FEHLER
              GO TO XST-EXIT
           WHEN OTHER
              MOVE 'SCHALTER S-KNR-AN-KONF-EGG-PGTA UNDEFINIERT! '  TO
              ERR-VAR-ZEILE01
              MOVE K-1                             TO ERR-ORT-LFD
              PERFORM XR93-UPRO-PROG-FEHLER
              GO TO XST-EXIT
           END-EVALUATE

           .
       X172-EXIT.
           EXIT.
      *---------------------------------------------------------------*
       X173-NACHLAUF-DRPA1267 SECTION.
      *---------------------------------------------------------------*
      * INPUT : -
      * OUTPUT: -
      * VERARBEITUNG:
      *         NACHLAUF FUER FUNKTION DRPA1267
      *
      *         -
      *         -
      *         -
      *
      *         - RC DER FUNKTION FUELLEN
      *---------------------------------------------------------------**
           MOVE 'X173-'                  TO ERR-ORT-SEC
      *
           MOVE Z-RC                     TO PO-DRPA1267-RC
           .
       X173-EXIT.
           EXIT.
      *---------------------------------------------------------------*
       U01-LAUFDATUM SECTION.
      *---------------------------------------------------------------*
      * INPUT : -                                                     *
      * OUTPUT: BR-Z-LAUFDATUM-EUR                                    *
      *         BR-Z-LAUFDATUM-ISO1                                   *
      *         BR-Z-LAUFDATUM-ISO2                                   *
      *         BR-Z-LAUFDATUM-TS                                     *
      *            [FORMAT JJJJ-MM-TT-HH.MM.SS.HS0000]                *
      *         BR-Z-LAUFZEIT-A                                       *
      *         BR-Z-GENDATUM-A                                       *
      *         BR-Z-GENZEIT-A                                        *
      * VERARBEITUNG:                                                 *
      *         DIESE ROUTINE STELLT DAS LAUFDATUM, DIE UHRZEIT,      *
      *         SOWIE DAS GENERIERUNGSDATUM DES PROGRAMMS ZUR         *
      *         VERFÜGUNG.                                            *
      *---------------------------------------------------------------*
      *    MOVE 'U01- '                  TO ERR-ORT-SEC
      *
           PERFORM BR01-ERM-LAUFDATUM
           .
       U01-EXIT.
           EXIT.
      *
      *---------------------------------------------------------------*
       U10-ZWAT0008-DRAT0151 SECTION.
      *---------------------------------------------------------------*
      * INPUT : PI-DRAT0151                                           *
      * OUTPUT: PO-DRAT0151                                           *
      * VERARBEITUNG:                                                 *
      *         DIESE ROUTINE STELLT DAS LAUFDATUM ALS TIMESTAMP      *
      *         AUS DB2 ZUR VERFÜGUNG.                                *
      *---------------------------------------------------------------*

           MOVE 'U10  ' TO ERR-ORT-SEC
           PERFORM UR2-TRACE

           SET PI-ZWAT0008-DRAT0151           TO TRUE
      *
           CALL K-ZWAT0008 USING BY REFERENCE PI-ZWAT0008
                                              PI-DRAT0151
                                              PO-DRAT0151
                                              ERR-ERROR-BEREICH
                                              STANDARD-STATUS-BEREICH
           END-CALL
      *
           IF ERR-RC-SCHWERER-FEHLER
              GO TO XST-EXIT
           END-IF
      *
           EVALUATE TRUE
           WHEN PO-DRAT0151-RC-OK
           WHEN PO-DRAT0151-RC-NOT-FOUND
                   CONTINUE
           WHEN OTHER
              MOVE 'ZWAT0008/DRAT0151:RETURN-CODE NICHT OK'
                                             TO ERR-VAR-ZEILE01
              MOVE PO-DRAT0151-RC            TO ERR-VAR-ZEILE02
              MOVE K-1                       TO ERR-ORT-LFD
              PERFORM XR93-UPRO-PROG-FEHLER
              GO TO XST-EXIT
           END-EVALUATE
           .
       U10-EXIT.
           EXIT.
      *-----------------------------------------------------------
       U11-UPPA0088-DRPA0822 SECTION.
      *-----------------------------------------------------------
      * IN   : PI-DRPA0822
      * OUT  : PO-DRPA0822
      * VERAR: ERMITTELN EINHEITEN
      *-----------------------------------------------------------
      *
           MOVE 'U11  ' TO ERR-ORT-SEC
           PERFORM UR2-TRACE
      *
           SET PI-UPPA0088-DRPA0822   TO TRUE

      *
           CALL K-UPPA0088 USING BY REFERENCE  PI-UPPA0088-FUNKTION
                                               PI-DRPA0822
                                               PO-DRPA0822
                                               ERR-ERROR-BEREICH
                                               STANDARD-STATUS-BEREICH
           END-CALL


           IF ERR-RC-SCHWERER-FEHLER
              GO TO XST-EXIT
           END-IF
      *
           EVALUATE TRUE
           WHEN PO-DRPA0822-RC-OK
           WHEN PO-DRPA0822-RC-NOK

                MOVE PO-DRPA0822-RC        TO Z-RC

           WHEN OTHER

                MOVE 'UNGUELTIGER RC     ' TO ERR-VAR-ZEILE01
                MOVE PO-DRPA0822-RC        TO ERR-VAR-ZEILE02
                MOVE K-1                   TO ERR-ORT-LFD
                PERFORM XR93-UPRO-PROG-FEHLER
                GO TO XST-EXIT

           END-EVALUATE

           .
       AAA-EXIT.
           EXIT.

      *-----------------------------------------------------------
       U12-UPPA0088-DRPA1558 SECTION.
      *-----------------------------------------------------------
      * IN   : PI-DRPA1558
      * OUT  : PO-DRPA1558
      * VERAR: ERMITTELN KONDITION UND GRUNDPROVISIONSSATZ
      *-----------------------------------------------------------
      *
           MOVE 'U12  ' TO ERR-ORT-SEC
           PERFORM UR2-TRACE
      *
           SET PI-UPPA0088-DRPA1558   TO TRUE

      *
           CALL K-UPPA0088 USING BY REFERENCE  PI-UPPA0088-FUNKTION
                                               PI-DRPA1558
                                               PO-DRPA1558
                                               ERR-ERROR-BEREICH
                                               STANDARD-STATUS-BEREICH
           END-CALL


           IF ERR-RC-SCHWERER-FEHLER
              GO TO XST-EXIT
           END-IF
      *
           EVALUATE TRUE
           WHEN PO-DRPA1558-RC-OK
           WHEN PO-DRPA1558-RC-NOK

                MOVE PO-DRPA1558-RC        TO Z-RC

           WHEN OTHER

                MOVE 'UNGUELTIGER RC     ' TO ERR-VAR-ZEILE01
                MOVE PO-DRPA1558-RC        TO ERR-VAR-ZEILE02
                MOVE K-1                   TO ERR-ORT-LFD
                PERFORM XR93-UPRO-PROG-FEHLER
                GO TO XST-EXIT

           END-EVALUATE

           .
       AAA-EXIT.
           EXIT.

      *-----------------------------------------------------------
       U13-UPPA0088-DRPA0846 SECTION.
      *-----------------------------------------------------------
      * IN   : PI-DRPA0846
      * OUT  : PO-DRPA0846
      * VERAR: UMRECHNEN RATIERLICH BRUTTO ZU NETTO
      *-----------------------------------------------------------
      *
           MOVE 'U13  ' TO ERR-ORT-SEC
           PERFORM UR2-TRACE
      *
           SET PI-UPPA0088-DRPA0846   TO TRUE

      *
           CALL K-UPPA0088 USING BY REFERENCE  PI-UPPA0088-FUNKTION
                                               PI-DRPA0846
                                               PO-DRPA0846
                                               ERR-ERROR-BEREICH
                                               STANDARD-STATUS-BEREICH
           END-CALL


           IF ERR-RC-SCHWERER-FEHLER
              GO TO XST-EXIT
           END-IF
      *
           EVALUATE TRUE
           WHEN PO-DRPA0846-RC-OK
           WHEN PO-DRPA0846-RC-NOK

                MOVE PO-DRPA0846-RC        TO Z-RC

           WHEN OTHER

                MOVE 'UNGUELTIGER RC     ' TO ERR-VAR-ZEILE01
                MOVE PO-DRPA0846-RC        TO ERR-VAR-ZEILE02
                MOVE K-1                   TO ERR-ORT-LFD
                PERFORM XR93-UPRO-PROG-FEHLER
                GO TO XST-EXIT

           END-EVALUATE

           .
       AAA-EXIT.
           EXIT.

      *-----------------------------------------------------------
       U14-UPPA0065-DRAN0100 SECTION.
      *-----------------------------------------------------------
      * IN   : PI-DRAN0100
      * OUT  : PO-DRAN0100
      * VERAR: FKT: ERMITTELN KONDITION FÜR GRUNDPROVISION EGG
      *-----------------------------------------------------------
      *
           MOVE 'U14  ' TO ERR-ORT-SEC
           PERFORM UR2-TRACE
      *
           SET PI-UPPA0065-DRAN0100   TO TRUE

      *
           CALL K-UPPA0065 USING BY REFERENCE  PI-UPPA0065-FUNKTION
                                               PI-DRAN0100
                                               PO-DRAN0100
                                               ERR-ERROR-BEREICH
                                               STANDARD-STATUS-BEREICH
           END-CALL


           IF ERR-RC-SCHWERER-FEHLER
              GO TO XST-EXIT
           END-IF
      *
           EVALUATE TRUE
           WHEN PO-DRAN0100-RC-OK
           WHEN PO-DRAN0100-RC-NOT-FOUND
           WHEN PO-DRAN0100-RC-KOND-DEF-NOK
           WHEN PO-DRAN0100-RC-SEL-KRIT-NOK

                MOVE PO-DRAN0100-RC        TO Z-RC

           WHEN OTHER

                MOVE 'UNGUELTIGER RC     ' TO ERR-VAR-ZEILE01
                MOVE PO-DRAN0100-RC        TO ERR-VAR-ZEILE02
                MOVE K-1                   TO ERR-ORT-LFD
                PERFORM XR93-UPRO-PROG-FEHLER
                GO TO XST-EXIT

           END-EVALUATE

           .
       AAA-EXIT.
           EXIT.

      *-----------------------------------------------------------
       U15-UPPA0065-DRPA0823 SECTION.
      *-----------------------------------------------------------
      * IN   : PI-DRPA0823
      * OUT  : PO-DRPA0823
      * VERAR: FKT: VERSICHERUNGSSTEUER ERMITTELN
      *-----------------------------------------------------------
      *
           MOVE 'U15  ' TO ERR-ORT-SEC
           PERFORM UR2-TRACE
      *
           SET PI-UPPA0065-DRPA0823   TO TRUE

      *
           CALL K-UPPA0065 USING BY REFERENCE  PI-UPPA0065-FUNKTION
                                               PI-DRPA0823
                                               PO-DRPA0823
                                               ERR-ERROR-BEREICH
                                               STANDARD-STATUS-BEREICH
           END-CALL


           IF ERR-RC-SCHWERER-FEHLER
              GO TO XST-EXIT
           END-IF
      *
           EVALUATE TRUE
           WHEN PO-DRPA0823-RC-OK
           WHEN PO-DRPA0823-RC-NOT-FOUND

                MOVE PO-DRPA0823-RC        TO Z-RC

           WHEN OTHER

                MOVE 'UNGUELTIGER RC     ' TO ERR-VAR-ZEILE01
                MOVE PO-DRPA0823-RC        TO ERR-VAR-ZEILE02
                MOVE K-1                   TO ERR-ORT-LFD
                PERFORM XR93-UPRO-PROG-FEHLER
                GO TO XST-EXIT

           END-EVALUATE

           .
       AAA-EXIT.
           EXIT.
      *-----------------------------------------------------------
       U16-UPPA0007-DRPA0014 SECTION.
      *-----------------------------------------------------------
      * IN   : PI-DRPA0014
      * OUT  : PO-DRPA0014
      * VERAR: FKT: ZVP ÜBER PRODUKTGEBER
      *-----------------------------------------------------------
      *
           MOVE 'U16  ' TO ERR-ORT-SEC
           PERFORM UR2-TRACE
      *
           SET PI-UPPA0007-DRPA0014   TO TRUE

      *
           CALL K-UPPA0007 USING BY REFERENCE  PI-UPPA0007-FUNKTION
                                               PI-DRPA0014
                                               PO-DRPA0014
                                               ERR-ERROR-BEREICH
                                               STANDARD-STATUS-BEREICH
           END-CALL


           IF ERR-RC-SCHWERER-FEHLER
              GO TO XST-EXIT
           END-IF
      *
           EVALUATE TRUE
           WHEN PO-DRPA0014-RC-OK
           WHEN PO-DRPA0014-RC-NOT-FOUND
           WHEN PO-DRPA0014-RC-OK-VERF-UNDEF

                MOVE PO-DRPA0014-RC        TO Z-RC

           WHEN OTHER

                MOVE 'UNGUELTIGER RC     ' TO ERR-VAR-ZEILE01
                MOVE PO-DRPA0014-RC        TO ERR-VAR-ZEILE02
                MOVE K-1                   TO ERR-ORT-LFD
                PERFORM XR93-UPRO-PROG-FEHLER
                GO TO XST-EXIT

           END-EVALUATE

           .
       AAA-EXIT.
           EXIT.
      *-----------------------------------------------------------
       U17-UPPA0007-DRPA0015 SECTION.
      *-----------------------------------------------------------
      * IN   : PI-DRPA0015
      * OUT  : PO-DRPA0015
      * VERAR: FKT: FKT. ZVP ÜBER PRODUKTGEBER UND PRODUKT
      *-----------------------------------------------------------
      *
           MOVE 'U17  ' TO ERR-ORT-SEC
           PERFORM UR2-TRACE
      *
           SET PI-UPPA0007-DRPA0015   TO TRUE

      *
           CALL K-UPPA0007 USING BY REFERENCE  PI-UPPA0007-FUNKTION
                                               PI-DRPA0015
                                               PO-DRPA0015
                                               ERR-ERROR-BEREICH
                                               STANDARD-STATUS-BEREICH
           END-CALL


           IF ERR-RC-SCHWERER-FEHLER
              GO TO XST-EXIT
           END-IF
      *
           EVALUATE TRUE
           WHEN PO-DRPA0015-RC-OK
           WHEN PO-DRPA0015-RC-NOT-FOUND
           WHEN PO-DRPA0015-RC-OK-VERF-UNDEF

                MOVE PO-DRPA0015-RC        TO Z-RC

           WHEN OTHER

                MOVE 'UNGUELTIGER RC     ' TO ERR-VAR-ZEILE01
                MOVE PO-DRPA0015-RC        TO ERR-VAR-ZEILE02
                MOVE K-1                   TO ERR-ORT-LFD
                PERFORM XR93-UPRO-PROG-FEHLER
                GO TO XST-EXIT

           END-EVALUATE

           .
       AAA-EXIT.
           EXIT.
      *-----------------------------------------------------------
       U18-UPAN0026-DRPA0267 SECTION.
      *-----------------------------------------------------------
      * IN   : PI-DRPA0267
      * OUT  : PO-DRPA0267
      * VERAR: ERMITTELN PRODUKTSCHLÜSSEL ZU TARIF
      *-----------------------------------------------------------
      *
           MOVE 'U18  ' TO ERR-ORT-SEC
           PERFORM UR2-TRACE
      *
           SET PI-UPAN0026-DRPA0267   TO TRUE

           MOVE K-KNR-DVAG TO PI-DRPA0267-KNR-MANDANT

      *
           CALL K-UPPA0031 USING BY REFERENCE  PI-UPAN0026-FUNKTION
                                               PI-DRPA0267
                                               PO-DRPA0267
                                               ERR-ERROR-BEREICH
                                               STANDARD-STATUS-BEREICH
           END-CALL


           IF ERR-RC-SCHWERER-FEHLER
              GO TO XST-EXIT
           END-IF
      *
           EVALUATE TRUE
           WHEN PO-DRPA0267-RC-OK
           WHEN PO-DRPA0267-RC-VSTAT-GEFUELLT

                MOVE PO-DRPA0267-RC        TO Z-RC

           WHEN OTHER

                MOVE 'UNGUELTIGER RC     ' TO ERR-VAR-ZEILE01
                MOVE PO-DRPA0267-RC        TO ERR-VAR-ZEILE02
                MOVE K-1                   TO ERR-ORT-LFD
                PERFORM XR93-UPRO-PROG-FEHLER
                GO TO XST-EXIT

           END-EVALUATE

           .
       AAA-EXIT.
           EXIT.
      *-----------------------------------------------------------
       U19-UPAN0026-DRPA1266 SECTION.
      *-----------------------------------------------------------
      * IN   : PI-DRPA1266
      * OUT  : PO-DRPA1266
      * VERAR: ERMITTELN TARIF ZU PRODUKTSCHLÜSSEL
      *-----------------------------------------------------------
      *
           MOVE 'U19  ' TO ERR-ORT-SEC
           PERFORM UR2-TRACE

           SET PI-UPAN0026-DRPA1266   TO TRUE

           CALL K-UPPA0031 USING BY REFERENCE  PI-UPAN0026-FUNKTION
                                               PI-DRPA1266
                                               PO-DRPA1266
                                               ERR-ERROR-BEREICH
                                               STANDARD-STATUS-BEREICH
           END-CALL


           IF ERR-RC-SCHWERER-FEHLER
              GO TO XST-EXIT
           END-IF

           EVALUATE TRUE
           WHEN PO-DRPA1266-RC-OK
           WHEN PO-DRPA1266-RC-NOT-FOUND

                MOVE PO-DRPA1266-RC        TO Z-RC

           WHEN OTHER

                MOVE 'UNGUELTIGER RC     ' TO ERR-VAR-ZEILE01
                MOVE PO-DRPA1266-RC        TO ERR-VAR-ZEILE02
                MOVE K-1                   TO ERR-ORT-LFD
                PERFORM XR93-UPRO-PROG-FEHLER
                GO TO XST-EXIT

           END-EVALUATE

           .
       AAA-EXIT.
           EXIT.
      *-----------------------------------------------------------
       U20-UPAN0026-DRPA1348 SECTION.
      *-----------------------------------------------------------
      * IN   : PI-DRPA1348
      * OUT  : PO-DRPA1348
      * VERAR: CHECK NPM-DATENFELDER ZULÄSSIGKEIT
      *-----------------------------------------------------------
      *
           MOVE 'U20  ' TO ERR-ORT-SEC
           PERFORM UR2-TRACE

           SET PI-UPAN0026-DRPA1348   TO TRUE

           CALL K-UPPA0027 USING BY REFERENCE  PI-UPAN0026-FUNKTION
                                               PI-DRPA1348
                                               PO-DRPA1348
                                               ERR-ERROR-BEREICH
                                               STANDARD-STATUS-BEREICH
           END-CALL


           IF ERR-RC-SCHWERER-FEHLER
              GO TO XST-EXIT
           END-IF

           EVALUATE TRUE
           WHEN PO-DRPA1348-RC-OK

                MOVE PO-DRPA1348-RC        TO Z-RC

           WHEN OTHER

                MOVE 'UNGUELTIGER RC     ' TO ERR-VAR-ZEILE01
                MOVE PO-DRPA1348-RC        TO ERR-VAR-ZEILE02
                MOVE K-1                   TO ERR-ORT-LFD
                PERFORM XR93-UPRO-PROG-FEHLER
                GO TO XST-EXIT

           END-EVALUATE

           .
       AAA-EXIT.
           EXIT.
      *-----------------------------------------------------------
       U21-UPAN0026-DRPA1381 SECTION.
      *-----------------------------------------------------------
      * IN   : PI-DRPA1381
      * OUT  : PO-DRPA1381
      * VERAR: CHECK CHECK KARDINALITÄTS-BEZIEHUNG
      *-----------------------------------------------------------
      *
           MOVE 'U21  ' TO ERR-ORT-SEC
           PERFORM UR2-TRACE

           SET PI-UPAN0026-DRPA1381   TO TRUE

           CALL K-UPPA0027 USING BY REFERENCE  PI-UPAN0026-FUNKTION
                                               PI-DRPA1381
                                               PO-DRPA1381
                                               ERR-ERROR-BEREICH
                                               STANDARD-STATUS-BEREICH
           END-CALL


           IF ERR-RC-SCHWERER-FEHLER
              GO TO XST-EXIT
           END-IF

           EVALUATE TRUE
           WHEN PO-DRPA1381-RC-OK

                MOVE PO-DRPA1381-RC        TO Z-RC

           WHEN OTHER

                MOVE 'UNGUELTIGER RC     ' TO ERR-VAR-ZEILE01
                MOVE PO-DRPA1381-RC        TO ERR-VAR-ZEILE02
                MOVE K-1                   TO ERR-ORT-LFD
                PERFORM XR93-UPRO-PROG-FEHLER
                GO TO XST-EXIT

           END-EVALUATE

           .
       AAA-EXIT.
           EXIT.
      *-----------------------------------------------------------
       U22-UPAN0026-DRPA1818 SECTION.
      *-----------------------------------------------------------
      * IN   : PI-DRPA1818
      * OUT  : PO-DRPA1818
      * VERAR: ERMITTELN KONDITION FÜR UMSATZSTEUER
      *-----------------------------------------------------------
      *
           MOVE 'U22  ' TO ERR-ORT-SEC
           PERFORM UR2-TRACE

           SET PI-UPAN0026-DRPA1818   TO TRUE

           CALL K-UPPA0065 USING BY REFERENCE  PI-UPAN0026-FUNKTION
                                               PI-DRPA1818
                                               PO-DRPA1818
                                               ERR-ERROR-BEREICH
                                               STANDARD-STATUS-BEREICH
           END-CALL


           IF ERR-RC-SCHWERER-FEHLER
              GO TO XST-EXIT
           END-IF

           EVALUATE TRUE
           WHEN PO-DRPA1818-RC-OK
           WHEN PO-DRPA1818-RC-NOT-FOUND

                MOVE PO-DRPA1818-RC        TO Z-RC

           WHEN OTHER

                MOVE 'UNGUELTIGER RC     ' TO ERR-VAR-ZEILE01
                MOVE PO-DRPA1818-RC        TO ERR-VAR-ZEILE02
                MOVE K-1                   TO ERR-ORT-LFD
                PERFORM XR93-UPRO-PROG-FEHLER
                GO TO XST-EXIT

           END-EVALUATE

           .
       AAA-EXIT.
           EXIT.
      *-----------------------------------------------------------
       U23-UPAN0026-DRAN0310 SECTION.
      *-----------------------------------------------------------
      * IN   : PI-DRAN0310
      * OUT  : PO-DRAN0310
      * VERAR: ERMITTELN PRODUKTSCHLÜSSEL ZU FREMDFONDS
      *-----------------------------------------------------------
      *
           MOVE 'U23  ' TO ERR-ORT-SEC
           PERFORM UR2-TRACE

           SET PI-UPAN0026-DRAN0310   TO TRUE

           CALL K-UPAN0010 USING BY REFERENCE  PI-UPAN0026-FUNKTION
                                               PI-DRAN0310
                                               PO-DRAN0310
                                               ERR-ERROR-BEREICH
                                               STANDARD-STATUS-BEREICH
           END-CALL


           IF ERR-RC-SCHWERER-FEHLER
              GO TO XST-EXIT
           END-IF

           EVALUATE TRUE
           WHEN PO-DRAN0310-RC-OK
           WHEN PO-DRAN0310-RC-NFD

                MOVE PO-DRAN0310-RC        TO Z-RC

           WHEN OTHER

                MOVE 'UNGUELTIGER RC     ' TO ERR-VAR-ZEILE01
                MOVE PO-DRAN0310-RC        TO ERR-VAR-ZEILE02
                MOVE K-1                   TO ERR-ORT-LFD
                PERFORM XR93-UPRO-PROG-FEHLER
                GO TO XST-EXIT

           END-EVALUATE

           .
       AAA-EXIT.
           EXIT.
      *-----------------------------------------------------------
       U24-UPAN0026-DRPA0284 SECTION.
      *-----------------------------------------------------------
      * IN   : PI-DRPA0284
      * OUT  : PO-DRPA0284
      * VERAR: ERMITTELN PRODUKTSCHLÜSSEL ZU TARIF
      *-----------------------------------------------------------
      *
           MOVE 'U24  ' TO ERR-ORT-SEC
           PERFORM UR2-TRACE

      *    UMFORMATIEREN DATUM TT.MM.JHJJ NACH JHJJMMTT
           MOVE BR-Z-LD-TAG-EUR
             TO Z-DATUM-JHJJMMTT-1(07:02)
           MOVE BR-Z-LD-MON-EUR
             TO Z-DATUM-JHJJMMTT-1(05:02)
           MOVE BR-Z-LD-JAHR-EUR
             TO Z-DATUM-JHJJMMTT-1(01:04)

           SET S-SUCHEN-NOK          TO TRUE
           MOVE K-RC-EOF               TO Z-RC
           MOVE K-ZERO                 TO Z-PROD-PROD-SCHL

           SET  PI-ZXPA0009-DRPA0284   TO TRUE
           MOVE K-PGM-NAME             TO PI-DRPA0284-PROGRAMM
           MOVE K-LIST-FIRST           TO PI-DRPA0284-UFKT
           MOVE PI-DRPA0284-PGTA-TARIF TO Z-TARIF
           MOVE K-7                    TO Z-TARIF-ST
           .
       AAA-2000.

           EVALUATE TRUE
           WHEN Z-TARIF-ST < K-2
      *         MIND. 2 ST. VOM HAUPTTARIF
                GO TO AAA-8000
           END-EVALUATE

           PERFORM U25-ZXPA0009-DRPA0284
      *
           MOVE K-LIST-NEXT            TO PI-DRPA0284-UFKT
      *
           PERFORM WITH TEST BEFORE
                   UNTIL PO-DRPA0284-RC-EOF
                      OR PO-DRPA0284-RC-LEER

      *            UMFORMATIEREN DATUM TT.MM.JHJJ NACH JHJJMMTT
                   MOVE PO-DRPA0284-PGTA-GUELT-AB(01:02)
                     TO Z-DATUM-JHJJMMTT-2(07:02)
                   MOVE PO-DRPA0284-PGTA-GUELT-AB(04:02)
                     TO Z-DATUM-JHJJMMTT-2(05:02)
                   MOVE PO-DRPA0284-PGTA-GUELT-AB(07:04)
                     TO Z-DATUM-JHJJMMTT-2(01:04)

                   MOVE PO-DRPA0284-PGTA-GUELT-BIS(01:02)
                     TO Z-DATUM-JHJJMMTT-3(07:02)
                   MOVE PO-DRPA0284-PGTA-GUELT-BIS(04:02)
                     TO Z-DATUM-JHJJMMTT-3(05:02)
                   MOVE PO-DRPA0284-PGTA-GUELT-BIS(07:04)
                     TO Z-DATUM-JHJJMMTT-3(01:04)

              EVALUATE TRUE
              WHEN BR-Z-LAUFDATUM-ISO1 >= Z-DATUM-JHJJMMTT-2 AND
                                       <= Z-DATUM-JHJJMMTT-3

                   SET S-SUCHEN-OK TO TRUE
                   MOVE K-RC-OK TO Z-RC
                   MOVE PO-DRPA0284-PROD-PROD-SCHL
                     TO Z-PROD-PROD-SCHL

                   GO TO AAA-8000

              WHEN OTHER

                   MOVE K-LIST-NEXT            TO PI-DRPA0284-UFKT
                   PERFORM U25-ZXPA0009-DRPA0284

              END-EVALUATE


           END-PERFORM

           SUBTRACT K-1 FROM Z-TARIF-ST
           MOVE Z-TARIF(K-1:Z-TARIF-ST)
             TO PI-DRPA0284-PGTA-TARIF

           MOVE K-LIST-QUIT
             TO PI-DRPA0284-UFKT
           PERFORM U25-ZXPA0009-DRPA0284

           MOVE K-LIST-FIRST
             TO PI-DRPA0284-UFKT

           GO TO AAA-2000

           .
      *
       AAA-8000.
           MOVE K-LIST-QUIT TO PI-DRPA0284-UFKT
           PERFORM U25-ZXPA0009-DRPA0284

           .
       AAA-EXIT.
           EXIT.
      *------------------------------------------------------------*
       U25-ZXPA0009-DRPA0284       SECTION.
       U25-ANF.
      *------------------------------------------------------------*
      * INPUT : PI-DRPA0284                                        *
      * OUTPUT: PO-DRPA0284                                        *
      * VERARBEITUNG:                                              *
      *   - AUFRUF DRPA0284 ZXPA0009                               *
      *------------------------------------------------------------*
           MOVE 'U25  ' TO ERR-ORT-SEC

           SET PI-ZXPA0009-DRPA0284          TO TRUE
      *
           CALL K-ZXPA0009 USING BY REFERENCE PI-ZXPA0009
                                              PI-DRPA0284
                                              PO-DRPA0284
                                              ERR-ERROR-BEREICH
                                              STANDARD-STATUS-BEREICH
           END-CALL
      *
           IF ERR-RC-SCHWERER-FEHLER
              GO TO XST-EXIT
           END-IF
      *
           EVALUATE TRUE
           WHEN PO-DRPA0284-RC-OK
           WHEN PO-DRPA0284-RC-EOF
           WHEN PO-DRPA0284-RC-LEER
                CONTINUE
           WHEN OTHER
                MOVE 'ZXPA0009/DRPA0284: RETURNCODE UNGUELTIG'
                                                 TO ERR-VAR-ZEILE01
                MOVE PO-DRPA0284-RC              TO ERR-VAR-ZEILE02
                MOVE K-1                         TO ERR-ORT-LFD
                PERFORM XR93-UPRO-PROG-FEHLER
                GO TO XST-EXIT
           END-EVALUATE

           .
       AAA-EXIT.
           EXIT.
      *-----------------------------------------------------------
       U26-UPAN0026-DRPA0200 SECTION.
      *-----------------------------------------------------------
      * IN   : PI-DRPA0200
      * OUT  : PO-DRPA0200
      * VERAR: ERMITTELN KONDITION FÜR UMSATZSTEUER
      *-----------------------------------------------------------
      *
           MOVE 'U26  ' TO ERR-ORT-SEC
           PERFORM UR2-TRACE

           SET PI-UPAN0026-DRPA0200   TO TRUE

           CALL K-ZWPA0004 USING BY REFERENCE  PI-UPAN0026-FUNKTION
                                               PI-DRPA0200
                                               PO-DRPA0200
                                               ERR-ERROR-BEREICH
                                               STANDARD-STATUS-BEREICH
           END-CALL


           IF ERR-RC-SCHWERER-FEHLER
              GO TO XST-EXIT
           END-IF

           EVALUATE TRUE
           WHEN PO-DRPA0200-RC-OK
           WHEN PO-DRPA0200-RC-NOT-FOUND

                MOVE PO-DRPA0200-RC        TO Z-RC

           WHEN OTHER

                MOVE 'UNGUELTIGER RC     ' TO ERR-VAR-ZEILE01
                MOVE PO-DRPA0200-RC        TO ERR-VAR-ZEILE02
                MOVE K-1                   TO ERR-ORT-LFD
                PERFORM XR93-UPRO-PROG-FEHLER
                GO TO XST-EXIT

           END-EVALUATE

           .
       AAA-EXIT.
           EXIT.
      *-----------------------------------------------------------
       U27-ZTAN0011-DRAN0172  SECTION.
      *-----------------------------------------------------------
      * IN   : PI-DRAN0172
      * OUT  : PO-DRAN0172
      * VERAR: SELECT TBAN0011 PLAUSI
      *-----------------------------------------------------------
      *
           MOVE 'U27  ' TO ERR-ORT-SEC
           PERFORM UR2-TRACE
      *
      *    ERMITTELN DATEN

           SET  PI-ZTAN0011-DRAN0172-SEL  TO TRUE

           CALL K-ZTAN0011 USING BY REFERENCE PI-ZTAN0011
                PI-DRAN0172
                PO-DRAN0172
                ERR-ERROR-BEREICH
                STANDARD-STATUS-BEREICH
           END-CALL

      *
           IF ERR-RC-SCHWERER-FEHLER
              GO TO XST-EXIT
           END-IF
      *
           EVALUATE TRUE
           WHEN PO-DRAN0172-RC-OK
           WHEN PO-DRAN0172-RC-NOT-FOUND

                CONTINUE

           WHEN OTHER

                MOVE 'PO-DRAN0172-RC UNGÜLTIG:'
                                          TO ERR-VAR-ZEILE01(01:25)
                MOVE PO-DRAN0172-RC       TO ERR-VAR-ZEILE01(27:03)
                MOVE K-1                  TO ERR-ORT-LFD
                PERFORM XR93-UPRO-PROG-FEHLER
                GO TO XST-EXIT

           END-EVALUATE

           .
       AAA-EXIT.
           EXIT.
      *-----------------------------------------------------------
       U28-ZTAN0014-DRAN0372  SECTION.
      *-----------------------------------------------------------
      * IN   : PI-DRAN0372
      * OUT  : PO-DRAN0372
      * VERAR: SELECT TBAN0014 PLAUSI
      *-----------------------------------------------------------
      *
           MOVE 'U28  ' TO ERR-ORT-SEC
           PERFORM UR2-TRACE
      *
      *    ERMITTELN DATEN

           SET  PI-ZTAN0014-DRAN0372 TO TRUE

           CALL K-ZTAN0014 USING BY REFERENCE PI-ZTAN0014
                PI-DRAN0372
                PO-DRAN0372
                ERR-ERROR-BEREICH
                STANDARD-STATUS-BEREICH
           END-CALL

      *
           IF ERR-RC-SCHWERER-FEHLER
              GO TO XST-EXIT
           END-IF
      *
           EVALUATE TRUE
           WHEN PO-DRAN0372-RC-OK
           WHEN PO-DRAN0372-RC-NOT-FOUND
           WHEN PO-DRAN0372-RC-MULT-ROWS

                CONTINUE

           WHEN OTHER

                MOVE 'PO-DRAN0372-RC UNGÜLTIG:'
                                          TO ERR-VAR-ZEILE01(01:25)
                MOVE PO-DRAN0372-RC       TO ERR-VAR-ZEILE01(27:03)
                MOVE K-1                  TO ERR-ORT-LFD
                PERFORM XR93-UPRO-PROG-FEHLER
                GO TO XST-EXIT

           END-EVALUATE

           .
       AAA-EXIT.
           EXIT.
      *-----------------------------------------------------------
       U31-EGG-UPAN0026-DRPA0822 SECTION.
      *-----------------------------------------------------------
      * IN   : PI-DRPA0822
      * OUT  : PO-DRPA0822
      * VERAR: EGG: ERMITTELN EINHEITEN
      *-----------------------------------------------------------
      *
           MOVE 'U31  ' TO ERR-ORT-SEC
           PERFORM UR2-TRACE

           SET PO-DRPA0822-RC-NOK TO TRUE

           INITIALIZE PI-DRAN0172 PO-DRAN0172

           MOVE K-KTY-AN-GP-SATZ         TO PI-DRAN0172-ANTQ-PLAUSI
           MOVE PI-DRPA0822-PGEB-GES     TO PI-DRAN0172-PGEB-GES
           MOVE PI-DRPA0822-PROD-PROD-SCHL
                                         TO PI-DRAN0172-PROD-PROD-SCHL
           MOVE PI-DRPA0822-STICHTAG     TO PI-DRAN0172-ANTQ-GUELTIG-AB

           PERFORM U27-ZTAN0011-DRAN0172

           EVALUATE TRUE
           WHEN PO-DRAN0172-RC-OK

                MOVE PO-DRAN0172-ANTQ-WERT-ALPHANUM(1:1)
                                         TO Z-X-1
                EVALUATE TRUE
                WHEN Z-X-1 NOT NUMERIC
                     MOVE 'KOND-REGEL LEER    ' TO ERR-VAR-ZEILE01
                     MOVE Z-X-1                 TO ERR-VAR-ZEILE02
                     MOVE K-1                   TO ERR-ORT-LFD
                     PERFORM XR93-UPRO-PROG-FEHLER
                     GO TO XST-EXIT
                WHEN Z-9-1 = K-KNR-K-REGEL-GRUND-P-SUM-LZ
                     MOVE PI-DRPA0822-PGEB-GES
                                         TO PI-DRAN0372-PGEB-GES
                     MOVE PI-DRPA0822-PROD-PROD-SCHL
                                         TO PI-DRAN0372-PROD-PROD-SCHL
                     MOVE PI-DRPA0822-STICHTAG
                                         TO PI-DRAN0372-ANLZ-GUELTIG-AB
                     MOVE PI-DRPA0822-LAUFZEIT
                                         TO PI-DRAN0372-ANLZ-LZ-VON
                     PERFORM U28-ZTAN0014-DRAN0372

                     EVALUATE TRUE
                     WHEN PO-DRAN0372-RC-OK

                          SET PO-DRPA0822-RC-OK TO TRUE
                          COMPUTE PO-DRPA0822-GRUND-PROV ROUNDED
                               = (PI-DRPA0822-NETTO-BEITRAG *
                                  PO-DRAN0372-ANLZ-SATZ) / 100
                          COMPUTE PO-DRPA0822-EINH-AVERM ROUNDED
                                = PO-DRPA0822-GRUND-PROV / 10

                     WHEN PO-DRAN0372-RC-NOT-FOUND
140122*>>>>>
      *                   CONTINUE
      *                   DANN WERTE AUF TBAN0011
                          SET PO-DRPA0822-RC-OK TO TRUE
                          COMPUTE PO-DRPA0822-GRUND-PROV ROUNDED
                                = (PI-DRPA0822-NETTO-BEITRAG *
                                   PO-DRAN0172-ANTQ-WERT-NUM) / 100
                               COMPUTE PO-DRPA0822-EINH-AVERM ROUNDED
                                     = PO-DRPA0822-GRUND-PROV / 10
140122*<<<<<
                     WHEN PO-DRAN0372-RC-MULT-ROWS
                          CONTINUE
                     END-EVALUATE

                WHEN Z-9-1 = K-KNR-K-REGEL-GRUND-P-VG-BTG
                WHEN Z-9-1 = K-KNR-K-REGEL-GRUND-P-VG-SUM

                     SET PO-DRPA0822-RC-OK TO TRUE
                     COMPUTE PO-DRPA0822-GRUND-PROV ROUNDED
                           = (PI-DRPA0822-NETTO-BEITRAG *
                              PO-DRAN0172-ANTQ-WERT-NUM) / 100
                          COMPUTE PO-DRPA0822-EINH-AVERM ROUNDED
                                = PO-DRPA0822-GRUND-PROV / 10

                WHEN Z-9-1 = K-KNR-K-REGEL-GRUND-P-VG-STK

                     SET PO-DRPA0822-RC-OK TO TRUE
                     COMPUTE PO-DRPA0822-GRUND-PROV ROUNDED
                           = PO-DRAN0172-ANTQ-WERT-NUM * 10
                          COMPUTE PO-DRPA0822-EINH-AVERM ROUNDED
                                = PO-DRPA0822-GRUND-PROV / 10

                WHEN Z-9-1 = K-KNR-K-REGEL-GRUND-P-KEINE

                     SET PO-DRPA0822-RC-OK TO TRUE
                     MOVE 0 TO PO-DRPA0822-GRUND-PROV
                               PO-DRPA0822-EINH-AVERM
                WHEN OTHER

                     MOVE 'KOND-REGEL UNGÜLTIG' TO ERR-VAR-ZEILE01
                     MOVE Z-X-1                 TO ERR-VAR-ZEILE02
                     MOVE K-2                   TO ERR-ORT-LFD
                     PERFORM XR93-UPRO-PROG-FEHLER
                     GO TO XST-EXIT
                END-EVALUATE

           WHEN PO-DRAN0172-RC-NOT-FOUND
                CONTINUE
           WHEN OTHER
                MOVE 'UNGUELTIGER RC     ' TO ERR-VAR-ZEILE01
                MOVE PO-DRPA0822-RC        TO ERR-VAR-ZEILE02
                MOVE K-3                   TO ERR-ORT-LFD
                PERFORM XR93-UPRO-PROG-FEHLER
                GO TO XST-EXIT
           END-EVALUATE

           EVALUATE TRUE
           WHEN PO-DRPA0822-RC-OK
           WHEN PO-DRPA0822-RC-NOK

                MOVE PO-DRPA0822-RC        TO Z-RC

           WHEN OTHER

                MOVE 'UNGUELTIGER RC     ' TO ERR-VAR-ZEILE01
                MOVE PO-DRPA0822-RC        TO ERR-VAR-ZEILE02
                MOVE K-4                   TO ERR-ORT-LFD
                PERFORM XR93-UPRO-PROG-FEHLER
                GO TO XST-EXIT

           END-EVALUATE

           .
       AAA-EXIT.
           EXIT.
      *-----------------------------------------------------------
       U32-EGG-UPAN0026-DRPA1558 SECTION.
      *-----------------------------------------------------------
      * IN   : PI-DRPA1558
      * OUT  : PO-DRPA1558
      * VERAR: EGG: ERMITTELN KONDITION UND GRUNDPROVISIONSSATZ EGG
      *-----------------------------------------------------------
      *
           MOVE 'U32  ' TO ERR-ORT-SEC
           PERFORM UR2-TRACE

           SET PO-DRPA1558-RC-NOK        TO TRUE

           INITIALIZE PI-DRAN0172 PO-DRAN0172

           MOVE K-KTY-AN-GP-SATZ         TO PI-DRAN0172-ANTQ-PLAUSI
           MOVE PI-DRPA1558-PGEB-GES     TO PI-DRAN0172-PGEB-GES
           MOVE PI-DRPA1558-PROD-PROD-SCHL
                                         TO PI-DRAN0172-PROD-PROD-SCHL
           MOVE PI-DRPA1558-STICHTAG     TO PI-DRAN0172-ANTQ-GUELTIG-AB

           PERFORM U27-ZTAN0011-DRAN0172

           EVALUATE TRUE
           WHEN PO-DRAN0172-RC-OK

                MOVE PO-DRAN0172-ANTQ-WERT-ALPHANUM(1:1)
                                         TO Z-X-1
                EVALUATE TRUE
                WHEN Z-X-1 NOT NUMERIC
                     MOVE 'KOND-REGEL LEER    ' TO ERR-VAR-ZEILE01
                     MOVE Z-X-1                 TO ERR-VAR-ZEILE02
                     MOVE K-1                   TO ERR-ORT-LFD
                     PERFORM XR93-UPRO-PROG-FEHLER
                     GO TO XST-EXIT
                WHEN Z-9-1 = K-KNR-K-REGEL-GRUND-P-SUM-LZ
      *              LAUFZEITABHÄNGIGE GRUNDPROVISION
                     INITIALIZE PI-DRAN0372 PO-DRAN0372
                     MOVE PI-DRPA1558-PGEB-GES
                                         TO PI-DRAN0372-PGEB-GES
                     MOVE PI-DRPA1558-PROD-PROD-SCHL
                                         TO PI-DRAN0372-PROD-PROD-SCHL
                     MOVE PI-DRPA1558-STICHTAG
                                         TO PI-DRAN0372-ANLZ-GUELTIG-AB
                     MOVE PI-DRPA1558-LAUFZEIT
                                         TO PI-DRAN0372-ANLZ-LZ-VON
                     PERFORM U28-ZTAN0014-DRAN0372

                     EVALUATE TRUE
                     WHEN PO-DRAN0372-RC-OK

                          SET PO-DRPA1558-RC-OK TO TRUE
                          MOVE Z-9-1
                            TO PO-DRPA1558-KNR-KOND-REGEL-GRP
                          MOVE PO-DRAN0372-ANLZ-SATZ
                            TO PO-DRPA1558-PRKO-GRP-STZ

                     WHEN PO-DRAN0372-RC-NOT-FOUND
140122*>>>>>              DANN WERT AUS TBAN0011
                          SET PO-DRPA1558-RC-OK TO TRUE
                          MOVE Z-9-1
                            TO PO-DRPA1558-KNR-KOND-REGEL-GRP
                          MOVE PO-DRAN0172-ANTQ-WERT-NUM
                            TO PO-DRPA1558-PRKO-GRP-STZ
140122*<<<<<
                     WHEN PO-DRAN0372-RC-MULT-ROWS
                          CONTINUE
                     END-EVALUATE

                WHEN Z-9-1 = K-KNR-K-REGEL-GRUND-P-VG-BTG
                WHEN Z-9-1 = K-KNR-K-REGEL-GRUND-P-VG-SUM
                WHEN Z-9-1 = K-KNR-K-REGEL-GRUND-P-VG-STK
                WHEN Z-9-1 = K-KNR-K-REGEL-GRUND-P-KEINE

                     SET PO-DRPA1558-RC-OK TO TRUE
                     MOVE Z-9-1
                       TO PO-DRPA1558-KNR-KOND-REGEL-GRP
                     MOVE PO-DRAN0172-ANTQ-WERT-NUM
                       TO PO-DRPA1558-PRKO-GRP-STZ

                     WHEN OTHER

                     MOVE 'KOND-REGEL UNGÜLTIG' TO ERR-VAR-ZEILE01
                     MOVE Z-X-1                 TO ERR-VAR-ZEILE02
                     MOVE K-2                   TO ERR-ORT-LFD
                     PERFORM XR93-UPRO-PROG-FEHLER
                     GO TO XST-EXIT
                END-EVALUATE

           WHEN PO-DRAN0172-RC-NOT-FOUND
                CONTINUE
           WHEN OTHER
                MOVE 'UNGUELTIGER RC DRAN0172    '
                                           TO ERR-VAR-ZEILE01
                MOVE PO-DRAN0172-RC        TO ERR-VAR-ZEILE02
                MOVE K-3                   TO ERR-ORT-LFD
                PERFORM XR93-UPRO-PROG-FEHLER
                GO TO XST-EXIT
           END-EVALUATE

           EVALUATE TRUE
           WHEN PO-DRPA1558-RC-OK
           WHEN PO-DRPA1558-RC-NOK

                MOVE PO-DRPA1558-RC        TO Z-RC

           WHEN OTHER

                MOVE 'UNGUELTIGER RC DRPA1558    '
                                           TO ERR-VAR-ZEILE01
                MOVE PO-DRPA1558-RC        TO ERR-VAR-ZEILE02
                MOVE K-4                   TO ERR-ORT-LFD
                PERFORM XR93-UPRO-PROG-FEHLER
                GO TO XST-EXIT

           END-EVALUATE

           .
       AAA-EXIT.
           EXIT.
      *-----------------------------------------------------------
       U33-EGG-UPAN0026-DRPA0846 SECTION.
      *-----------------------------------------------------------
      * IN   : PI-DRPA0846
      * OUT  : PO-DRPA0846
      * VERAR: EGG: UMRECHNEN RATIERLICH BRUTTO ZU NETTO
      *-----------------------------------------------------------
      *
           MOVE 'U33  ' TO ERR-ORT-SEC
           PERFORM UR2-TRACE

           SET PO-DRPA0846-RC-NOK TO TRUE

           STRING PI-DRPA0846-STICHTAG(7:4)   DELIMITED BY SIZE
                  PI-DRPA0846-STICHTAG(4:2)   DELIMITED BY SIZE
                  PI-DRPA0846-STICHTAG(1:2)   DELIMITED BY SIZE
             INTO Z-DATUM-JHJJMMTT-1
           END-STRING

      ***  UMRECHNEN BRUTTO-RATIERLICH NACH BRUTTO
           MOVE PI-DRPA0846-BRUTTO-BEITRAG-RAT
             TO Z-BRUTTO-BEITRAG

           EVALUATE PI-DRPA0846-ZAHLWEISE-ANTRAG
           WHEN K-KNR-AN-ZW-JAHR
           WHEN K-KNR-AN-ZW-DEPOT
           WHEN K-KNR-AN-ZW-EINMAL
           WHEN K-KNR-AN-ZW-KEINE
                CONTINUE
           WHEN K-KNR-AN-ZW-HALBJAHR
                COMPUTE Z-BRUTTO-BEITRAG ROUNDED =
                Z-BRUTTO-BEITRAG * 2
           WHEN K-KNR-AN-ZW-QUARTAL
                COMPUTE Z-BRUTTO-BEITRAG ROUNDED =
                Z-BRUTTO-BEITRAG * 4
           WHEN K-KNR-AN-ZW-MONAT
                COMPUTE Z-BRUTTO-BEITRAG ROUNDED =
                Z-BRUTTO-BEITRAG * 12
           END-EVALUATE

      ***  ERMITTELN RATENZAHLUNGSZUSCHLAG
           SET TAB1-IND                  TO 1
           MOVE 0                        TO Z-RZAHLUNG-ZUSCHLAG
                                            Z-VERS-STEUER-STZ

           SEARCH TAB1 VARYING TAB1-IND
           AT END
              CONTINUE
           WHEN (T-GES(TAB1-IND)               =  PI-DRPA0846-PGEB-GES)
           AND
                (T-KNR-ZAHLWEISE(TAB1-IND)     =
                PI-DRPA0846-ZAHLWEISE-ANTRAG)
           AND
                (T-GUELTIG-AB(TAB1-IND)        <= Z-DATUM-JHJJMMTT-9)
           AND
                (T-GUELTIG-BIS(TAB1-IND)       >= Z-DATUM-JHJJMMTT-9)

                MOVE T-RZAHLUNG-ZUSCHLAG(TAB1-IND)
                                         TO Z-RZAHLUNG-ZUSCHLAG

           END-SEARCH

      *    ERMITTELN PRODUKTGRUPPE VERSICHERUNGSSTEUER
           INITIALIZE PI-DRAN0172 PO-DRAN0172
           MOVE K-KTY-AN-PLAUSI-VERSSTGRUP
                                         TO PI-DRAN0172-ANTQ-PLAUSI
           MOVE PI-DRPA0846-PGEB-GES     TO PI-DRAN0172-PGEB-GES
           MOVE PI-DRPA0846-PROD-PROD-SCHL
                                         TO PI-DRAN0172-PROD-PROD-SCHL
           MOVE PI-DRPA0846-STICHTAG     TO PI-DRAN0172-ANTQ-GUELTIG-AB

           PERFORM U27-ZTAN0011-DRAN0172

           EVALUATE TRUE
           WHEN PO-DRAN0172-RC-OK
                MOVE PO-DRAN0172-ANTQ-WERT-NUM
                                         TO Z-9-4
                INITIALIZE PI-DRAN0172 PO-DRAN0172
                MOVE K-KTY-PGRP-ART-VERS-STEUER
                                         TO PI-DRAN0172-ANTQ-PLAUSI
                MOVE K-PGEB-9999         TO PI-DRAN0172-PGEB-GES

      *         NUMMER DER PRODUKTGRUPPE VERSICHERUNGSSTEUER, ZU DER DAS
      *         PRODUKT GEHÖRT
                MOVE Z-9-4               TO PI-DRAN0172-PROD-PROD-SCHL
                MOVE PI-DRPA0846-STICHTAG
                                         TO PI-DRAN0172-ANTQ-GUELTIG-AB

                PERFORM U27-ZTAN0011-DRAN0172
                EVALUATE TRUE
                WHEN PO-DRAN0172-RC-OK
                     SET PO-DRPA0846-RC-OK TO TRUE
      *              VERSICHERUNGSSTEUERSATZ DER PRODUKTGRUPPE
                     MOVE PO-DRAN0172-ANTQ-WERT-NUM
                                         TO Z-VERS-STEUER-STZ
                WHEN OTHER
                     MOVE
                     ' PRODUKTGRUPPE VERSICHERUNGSSTEUER BEI KTY=152 IST
      -    ' NICHT ERMITTELBAR!  '
                     TO ERR-VAR-ZEILE01
                     MOVE Z-9-4                 TO ERR-VAR-ZEILE02
                     MOVE K-1                   TO ERR-ORT-LFD
                     PERFORM XR93-UPRO-PROG-FEHLER
                     GO TO XST-EXIT

                END-EVALUATE

           WHEN OTHER
                CONTINUE
           END-EVALUATE

      *    ERRECHNEN NETTOBETRAG AUS BRUTTOBETRAG
           ADD 100 TO Z-RZAHLUNG-ZUSCHLAG
           DIVIDE Z-RZAHLUNG-ZUSCHLAG BY 100 GIVING
                  Z-RZAHLUNG-ZUSCHLAG

           COMPUTE Z-NETTO-BEITRAG ROUNDED =
                   Z-BRUTTO-BEITRAG / Z-RZAHLUNG-ZUSCHLAG

           ADD 100 TO Z-VERS-STEUER-STZ
           DIVIDE Z-VERS-STEUER-STZ BY 100 GIVING
                   Z-VERS-STEUER-STZ

           EVALUATE TRUE
           WHEN PI-DRPA0846-PGEB-GES = K-KNR-PGES-GENERALI-SACH
      *
                EVALUATE TRUE
      *
                WHEN PI-DRPA0846-PROD-PROD-SCHL = 24
                WHEN PI-DRPA0846-PROD-PROD-SCHL = 25
                WHEN PI-DRPA0846-PROD-PROD-SCHL = 26
                WHEN PI-DRPA0846-PROD-PROD-SCHL = 27
                WHEN PI-DRPA0846-PROD-PROD-SCHL = 28
                WHEN PI-DRPA0846-PROD-PROD-SCHL = 29
                WHEN PI-DRPA0846-PROD-PROD-SCHL = 30
      *
                    CONTINUE
      *
                WHEN OTHER
      *         ZWEI JAHRESNETTOBEITRÄGE -> VERDOPPLUNG DER EINHEITEN
                    COMPUTE Z-NETTO-BEITRAG = Z-NETTO-BEITRAG * K-2
      *
                END-EVALUATE
      *
           WHEN OTHER
      *
                CONTINUE
      *
           END-EVALUATE

           COMPUTE PO-DRPA0846-NETTO-BEITRAG ROUNDED =
                   Z-NETTO-BEITRAG / Z-VERS-STEUER-STZ

           SET PO-DRPA0846-RC-OK TO TRUE

           EVALUATE TRUE
           WHEN PO-DRPA0846-RC-OK
           WHEN PO-DRPA0846-RC-NOK

                MOVE PO-DRPA0846-RC        TO Z-RC

           WHEN OTHER

                MOVE 'UNGUELTIGER RC     ' TO ERR-VAR-ZEILE01
                MOVE PO-DRPA0846-RC        TO ERR-VAR-ZEILE02
                MOVE K-1                   TO ERR-ORT-LFD
                PERFORM XR93-UPRO-PROG-FEHLER
                GO TO XST-EXIT

           END-EVALUATE

           .
       AAA-EXIT.
           EXIT.
      *-----------------------------------------------------------
       U34-EGG-UPAN0026-DRAN0100 SECTION.
      *-----------------------------------------------------------
      * IN   : PI-DRAN0100
      * OUT  : PO-DRAN0100
      * VERAR: EGG: ERMITTELN KONDITION FÜR GRUNDPROVISION EGG
      *-----------------------------------------------------------
      *
           MOVE 'U34  ' TO ERR-ORT-SEC
           PERFORM UR2-TRACE

           SET PO-DRAN0100-RC-NOT-FOUND TO TRUE

           INITIALIZE PI-DRAN0172 PO-DRAN0172

           MOVE K-KTY-AN-GP-SATZ         TO PI-DRAN0172-ANTQ-PLAUSI
           MOVE PI-DRAN0100-PGEB-GES     TO PI-DRAN0172-PGEB-GES
           MOVE PI-DRAN0100-PROD-PROD-SCHL
                                         TO PI-DRAN0172-PROD-PROD-SCHL
           MOVE PI-DRAN0100-STICHTAG     TO PI-DRAN0172-ANTQ-GUELTIG-AB

           PERFORM U27-ZTAN0011-DRAN0172

           EVALUATE TRUE
           WHEN PO-DRAN0172-RC-OK

                MOVE PO-DRAN0172-ANTQ-WERT-ALPHANUM(1:1)
                                         TO Z-X-1
                EVALUATE TRUE
                WHEN Z-X-1 NOT NUMERIC
                     MOVE 'KOND-REGEL LEER    ' TO ERR-VAR-ZEILE01
                     MOVE Z-X-1                 TO ERR-VAR-ZEILE02
                     MOVE K-1                   TO ERR-ORT-LFD
                     PERFORM XR93-UPRO-PROG-FEHLER
                     GO TO XST-EXIT
                WHEN Z-9-1 = K-KNR-K-REGEL-GRUND-P-SUM-LZ

                     INITIALIZE PI-DRAN0372 PO-DRAN0372
                     MOVE PI-DRAN0100-PGEB-GES
                                         TO PI-DRAN0372-PGEB-GES
                     MOVE PI-DRAN0100-PROD-PROD-SCHL
                                         TO PI-DRAN0372-PROD-PROD-SCHL
                     MOVE PI-DRAN0100-STICHTAG
                                         TO PI-DRAN0372-ANLZ-GUELTIG-AB
                     MOVE PI-DRAN0100-LAUFZEIT
                                         TO PI-DRAN0372-ANLZ-LZ-VON
                     PERFORM U28-ZTAN0014-DRAN0372

                     EVALUATE TRUE
                     WHEN PO-DRAN0372-RC-OK

                          SET PO-DRAN0100-RC-OK TO TRUE
                          MOVE Z-9-1
                            TO KNR-KOND-REGEL-GRP IN PO-DRAN0100
                          MOVE PO-DRAN0372-ANLZ-SATZ
                            TO PRKO-GRP-STZ       IN PO-DRAN0100

                     WHEN PO-DRAN0372-RC-NOT-FOUND
140122*>>>>>              DANN WERTE AUS TBAN0011
      *                   CONTINUE
                          SET PO-DRAN0100-RC-OK TO TRUE
                          MOVE Z-9-1            TO KNR-KOND-REGEL-GRP
                                                IN PO-DRAN0100
                          MOVE PO-DRAN0172-ANTQ-WERT-NUM
                                                TO PRKO-GRP-STZ
                                                IN PO-DRAN0100
140122*<<<<<
                     WHEN PO-DRAN0372-RC-MULT-ROWS
                          CONTINUE
                     END-EVALUATE

                WHEN Z-9-1 = K-KNR-K-REGEL-GRUND-P-VG-BTG
                WHEN Z-9-1 = K-KNR-K-REGEL-GRUND-P-VG-SUM
                WHEN Z-9-1 = K-KNR-K-REGEL-GRUND-P-VG-STK
                WHEN Z-9-1 = K-KNR-K-REGEL-GRUND-P-KEINE

                     SET PO-DRAN0100-RC-OK TO TRUE
                     MOVE Z-9-1            TO KNR-KOND-REGEL-GRP
                                           IN PO-DRAN0100
                     MOVE PO-DRAN0172-ANTQ-WERT-NUM
                                           TO PRKO-GRP-STZ
                                           IN PO-DRAN0100
                WHEN OTHER

                     MOVE 'KOND-REGEL UNGÜLTIG' TO ERR-VAR-ZEILE01
                     MOVE Z-X-1                 TO ERR-VAR-ZEILE02
                     MOVE K-2                   TO ERR-ORT-LFD
                     PERFORM XR93-UPRO-PROG-FEHLER
                     GO TO XST-EXIT
                END-EVALUATE

                MOVE PO-DRAN0172-ANTQ-WERT-NUM  TO PRKO-GRP-STZ
                                                IN PO-DRAN0100

           WHEN PO-DRAN0172-RC-NOT-FOUND
                CONTINUE
           WHEN OTHER
                MOVE 'UNGUELTIGER RC DRAN0172    '
                                           TO ERR-VAR-ZEILE01
                MOVE PO-DRAN0172-RC        TO ERR-VAR-ZEILE02
                MOVE K-3                   TO ERR-ORT-LFD
                PERFORM XR93-UPRO-PROG-FEHLER
                GO TO XST-EXIT
           END-EVALUATE

           EVALUATE TRUE
           WHEN PO-DRAN0100-RC-OK
           WHEN PO-DRAN0100-RC-NOT-FOUND
           WHEN PO-DRAN0100-RC-KOND-DEF-NOK
           WHEN PO-DRAN0100-RC-SEL-KRIT-NOK

                MOVE PO-DRAN0100-RC        TO Z-RC

           WHEN OTHER

                MOVE 'UNGUELTIGER RC     ' TO ERR-VAR-ZEILE01
                MOVE PO-DRAN0100-RC        TO ERR-VAR-ZEILE02
                MOVE K-4                   TO ERR-ORT-LFD
                PERFORM XR93-UPRO-PROG-FEHLER
                GO TO XST-EXIT

           END-EVALUATE

           .
       AAA-EXIT.
           EXIT.
      *-----------------------------------------------------------
       U35-EGG-UPAN0026-DRPA0823 SECTION.
      *-----------------------------------------------------------
      * IN   : PI-DRPA0823
      * OUT  : PO-DRPA0823
      * VERAR: EGG: FKT: VERSICHERUNGSSTEUER ERMITTELN
      *        1. PRÜFEN, OB PRODUKT ZU EINER PRODUKTGRUPPE
      *           VERSICHERUNGSSTEUER GEHÖRT (KTY=352)
      *        2. WENN VORHANDEN, ERMITTELN VERSICHERUNGSSTEUERSATZ
      *           DIESER GRUPPE (KTY=152)
      *-----------------------------------------------------------
      *
           MOVE 'U35  ' TO ERR-ORT-SEC
           PERFORM UR2-TRACE

           SET PO-DRPA0823-RC-NOT-FOUND TO TRUE

           INITIALIZE PI-DRAN0172 PO-DRAN0172

           MOVE K-KTY-AN-PLAUSI-VERSSTGRUP
                                         TO PI-DRAN0172-ANTQ-PLAUSI
           MOVE PI-DRPA0823-PGEB-GES     TO PI-DRAN0172-PGEB-GES
           MOVE PI-DRPA0823-PROD-PROD-SCHL
                                         TO PI-DRAN0172-PROD-PROD-SCHL
           MOVE PI-DRPA0823-STICHTAG     TO PI-DRAN0172-ANTQ-GUELTIG-AB

           PERFORM U27-ZTAN0011-DRAN0172

           EVALUATE TRUE
           WHEN PO-DRAN0172-RC-OK
                MOVE PO-DRAN0172-ANTQ-WERT-NUM
                                         TO Z-9-4
                INITIALIZE PI-DRAN0172 PO-DRAN0172
                MOVE K-KTY-PGRP-ART-VERS-STEUER
                                         TO PI-DRAN0172-ANTQ-PLAUSI
                MOVE K-PGEB-9999         TO PI-DRAN0172-PGEB-GES

      *         NUMMER DER PRODUKTGRUPPE VERSICHERUNGSSTEUER, ZU DER DAS
      *         PRODUKT GEHÖRT                                         S
                MOVE Z-9-4               TO PI-DRAN0172-PROD-PROD-SCHL
                MOVE PI-DRPA0823-STICHTAG
                                         TO PI-DRAN0172-ANTQ-GUELTIG-AB

                PERFORM U27-ZTAN0011-DRAN0172
                EVALUATE TRUE
                WHEN PO-DRAN0172-RC-OK
                     SET PO-DRPA0823-RC-OK TO TRUE
                     MOVE PO-DRAN0172-ANTQ-WERT-NUM
                                         TO PO-DRPA0823-VERS-STEUER-STZ
                     MOVE PI-DRAN0172-PROD-PROD-SCHL
                                         TO PO-DRPA0823-KNR-VERS-STEUER
                WHEN OTHER
                     MOVE
                     ' PRODUKTGRUPPE VERSICHERUNGSSTEUER BEI KTY=152 IST
      -    ' NICHT ERMITTELBAR!  '
                     TO ERR-VAR-ZEILE01
                     MOVE Z-9-4                 TO ERR-VAR-ZEILE02
                     MOVE K-1                   TO ERR-ORT-LFD
                     PERFORM XR93-UPRO-PROG-FEHLER
                     GO TO XST-EXIT

                END-EVALUATE

           WHEN OTHER
                CONTINUE
           END-EVALUATE

           EVALUATE TRUE
           WHEN PO-DRPA0823-RC-OK
           WHEN PO-DRPA0823-RC-NOT-FOUND

                MOVE PO-DRPA0823-RC        TO Z-RC

           WHEN OTHER

                MOVE 'UNGUELTIGER RC     ' TO ERR-VAR-ZEILE01
                MOVE PO-DRPA0823-RC        TO ERR-VAR-ZEILE02
                MOVE K-1                   TO ERR-ORT-LFD
                PERFORM XR93-UPRO-PROG-FEHLER
                GO TO XST-EXIT

           END-EVALUATE
           .
       AAA-EXIT.
           EXIT.
      *-----------------------------------------------------------
       U36-EGG-UPPA0007-DRPA0014 SECTION.
      *-----------------------------------------------------------
      * IN   : PI-DRPA0014
      * OUT  : PO-DRPA0014
      * VERAR: EGG: ZVP ÜBER PRODUKTGEBER
      *-----------------------------------------------------------
      *
           MOVE 'U36  ' TO ERR-ORT-SEC
           PERFORM UR2-TRACE

           INITIALIZE PI-DRAN0172 PO-DRAN0172

           EVALUATE TRUE
           WHEN PI-DRPA0014-PZVP-VERFAHREN = K-ANTRAG-TRANSAKTIONEN
                MOVE K-KTY-AN-TRANS-PS-BEARBEIT
                                         TO PI-DRAN0172-ANTQ-PLAUSI
           WHEN PI-DRPA0014-PZVP-VERFAHREN =
                K-ANTRAG-NUR-ANZEIGEN-TRANSAKT
                MOVE K-KTY-AN-TRANS-PS-ANZEIGE
                                         TO PI-DRAN0172-ANTQ-PLAUSI
           END-EVALUATE

           MOVE PI-DRPA0014-PGEB-GES     TO PI-DRAN0172-PGEB-GES
           MOVE K-PRODUKT-9999           TO PI-DRAN0172-PROD-PROD-SCHL
           MOVE PI-DRPA0014-STICHTAG     TO PI-DRAN0172-ANTQ-GUELTIG-AB

           PERFORM U27-ZTAN0011-DRAN0172

           EVALUATE TRUE
           WHEN PO-DRAN0172-RC-OK
                SET PO-DRPA0014-RC-OK TO TRUE
                MOVE PO-DRAN0172-ANTQ-WERT-ALPHANUM
                                         TO PO-DRPA0014-PZVP-PROGRAMM
           WHEN PO-DRAN0172-RC-NOT-FOUND
                SET PO-DRPA0014-RC-NOT-FOUND TO TRUE
           WHEN OTHER
                MOVE 'UNGUELTIGER RC     ' TO ERR-VAR-ZEILE01
                MOVE PO-DRPA0014-RC        TO ERR-VAR-ZEILE02
                MOVE K-1                   TO ERR-ORT-LFD
                PERFORM XR93-UPRO-PROG-FEHLER
                GO TO XST-EXIT
           END-EVALUATE

           MOVE PO-DRPA0014-RC           TO Z-RC

           .
       AAA-EXIT.
           EXIT.
      *-----------------------------------------------------------
       U37-EGG-UPPA0007-DRPA0015 SECTION.
      *-----------------------------------------------------------
      * IN   : PI-DRPA0015
      * OUT  : PO-DRPA0015
      * VERAR: EGG: ZVP ÜBER PRODUKTGEBER UND PRODUKT
      *-----------------------------------------------------------
      *

           MOVE 'U37  ' TO ERR-ORT-SEC
           PERFORM UR2-TRACE

           INITIALIZE PI-DRAN0172 PO-DRAN0172

           EVALUATE TRUE
           WHEN PI-DRPA0015-PZVP-VERFAHREN = K-ANTRAG-TRANSAKTIONEN
                MOVE K-KTY-AN-TRANS-PS-BEARBEIT
                                         TO PI-DRAN0172-ANTQ-PLAUSI
           WHEN PI-DRPA0015-PZVP-VERFAHREN =
                K-ANTRAG-NUR-ANZEIGEN-TRANSAKT
                MOVE K-KTY-AN-TRANS-PS-ANZEIGE
                                         TO PI-DRAN0172-ANTQ-PLAUSI
           END-EVALUATE

           MOVE PI-DRPA0015-PGEB-GES     TO PI-DRAN0172-PGEB-GES
           MOVE PI-DRPA0015-PROD-PROD-SCHL
                                         TO PI-DRAN0172-PROD-PROD-SCHL
           MOVE PI-DRPA0015-STICHTAG     TO PI-DRAN0172-ANTQ-GUELTIG-AB

           PERFORM U27-ZTAN0011-DRAN0172

           EVALUATE TRUE
           WHEN PO-DRAN0172-RC-OK
                SET PO-DRPA0015-RC-OK TO TRUE
                MOVE PO-DRAN0172-ANTQ-WERT-ALPHANUM
                                         TO PO-DRPA0015-PZVP-PROGRAMM
           WHEN PO-DRAN0172-RC-NOT-FOUND
                SET PO-DRPA0015-RC-NOT-FOUND TO TRUE
           WHEN OTHER
                MOVE 'UNGUELTIGER RC     ' TO ERR-VAR-ZEILE01
                MOVE PO-DRPA0015-RC        TO ERR-VAR-ZEILE02
                MOVE K-1                   TO ERR-ORT-LFD
                PERFORM XR93-UPRO-PROG-FEHLER
                GO TO XST-EXIT
           END-EVALUATE

           MOVE PO-DRPA0015-RC           TO Z-RC

           .
       AAA-EXIT.
           EXIT.
      *-----------------------------------------------------------
       U39-EGG-UPAN0026-DRPA1266 SECTION.
      *-----------------------------------------------------------
      * IN   : PI-DRPA1266
      * OUT  : PO-DRPA1266
      * VERAR: EGG: ERMITTELN TARIF ZU PRODUKTSCHLÜSSEL
      *-----------------------------------------------------------
      *
           MOVE 'U39  ' TO ERR-ORT-SEC
           PERFORM UR2-TRACE

           SET PO-DRPA1266-RC-NOT-FOUND TO TRUE

           INITIALIZE PI-DRAN0172 PO-DRAN0172

           MOVE K-KTY-AN-TARIF           TO PI-DRAN0172-ANTQ-PLAUSI
           MOVE PI-DRPA1266-PGEB-GES     TO PI-DRAN0172-PGEB-GES
           MOVE PI-DRPA1266-PROD-PROD-SCHL
                                         TO PI-DRAN0172-PROD-PROD-SCHL
           MOVE PI-DRPA1266-STICHTAG     TO PI-DRAN0172-ANTQ-GUELTIG-AB

           PERFORM U27-ZTAN0011-DRAN0172

           EVALUATE TRUE
           WHEN PO-DRAN0172-RC-OK

                SET PO-DRPA1266-RC-OK    TO TRUE
                MOVE PO-DRAN0172-ANTQ-WERT-ALPHANUM
                                         TO PO-DRPA1266-TARIF
           END-EVALUATE

           EVALUATE TRUE
           WHEN PO-DRPA1266-RC-OK
           WHEN PO-DRPA1266-RC-NOT-FOUND

                MOVE PO-DRPA1266-RC        TO Z-RC

           WHEN OTHER

                MOVE 'UNGUELTIGER RC     ' TO ERR-VAR-ZEILE01
                MOVE PO-DRPA1266-RC        TO ERR-VAR-ZEILE02
                MOVE K-1                   TO ERR-ORT-LFD
                PERFORM XR93-UPRO-PROG-FEHLER
                GO TO XST-EXIT

           END-EVALUATE

           .
       AAA-EXIT.
           EXIT.
      *-----------------------------------------------------------
       U40-UPAN0026-DRPA1348 SECTION.
      *-----------------------------------------------------------
      * IN   : PI-DRPA1348
      * OUT  : PO-DRPA1348
      * VERAR: CHECK NPM-DATENFELDER ZULÄSSIGKEIT
      *-----------------------------------------------------------
      *
           MOVE 'U40  ' TO ERR-ORT-SEC
           PERFORM UR2-TRACE

           INITIALIZE TABELLE-DRPA1348
           MOVE 0 TO I-03

           PERFORM VARYING I-01 FROM 1 BY 1 UNTIL I-01 > 30
              MOVE PI-DRPA1348-KNR-NPM-FELD-NAME(I-01)
                TO PO-DRPA1348-KNR-NPM-FELD-NAME(I-01)
              MOVE K-KNR-NPM-FELD-UNZULAESSIG
              TO PO-DRPA1348-KNR-NPM-FELD-ZUL(I-01)
           END-PERFORM

           INITIALIZE PI-DRAN0172 PO-DRAN0172

           MOVE K-KTY-NPM-DATENFELD      TO PI-DRAN0172-ANTQ-PLAUSI
           MOVE PI-DRPA1348-PGEB-GES     TO PI-DRAN0172-PGEB-GES
           MOVE K-PRODUKT-9999           TO PI-DRAN0172-PROD-PROD-SCHL
           MOVE BR-Z-LAUFDATUM-EUR       TO PI-DRAN0172-ANTQ-GUELTIG-AB

           PERFORM U27-ZTAN0011-DRAN0172

           EVALUATE TRUE
           WHEN PO-DRAN0172-RC-OK


                MOVE SPACE TO Z-X-30
                MOVE 0     TO Z-9-3
                MOVE 0     TO I-02
                MOVE 0     TO I-03

                Perform varying i-01 from 1 by 1 until i-01 > 30

                    evaluate true
                    when PO-DRAN0172-ANTQ-WERT-ALPHANUM(i-01:1) NUMERIC
      *                  ÜBERTRAGEN IN ZWISCHENFELD
                         ADD 1 TO I-02
                         move PO-DRAN0172-ANTQ-WERT-ALPHANUM(I-01:1)
                         to Z-X-30(I-02:1)
                    WHEN PO-DRAN0172-ANTQ-WERT-ALPHANUM(I-01:1) = SPACE
                         CONTINUE
                    when PO-DRAN0172-ANTQ-WERT-ALPHANUM(I-01:1) =
                         K-KOMMA
                    when I-01 = 30
      *                  ZWISCHENFELD ÜBERTRAGEN IN TABELLE
                         ADD 1 TO I-03
                         COMPUTE T-DRPA1348-KNR-NPM-FELD-NAME(I-03) =
                         FUNCTION NUMVAL(Z-X-30)
                         MOVE SPACE TO Z-X-30
                         MOVE 1 TO I-02
                    end-evaluate

                end-perform

                PERFORM VARYING I-01 FROM 1 BY 1 UNTIL I-01 > 30
      *             TABELLE DURCHSUCHEN
                    SET S-SUCHEN-NOK TO TRUE
                    PERFORM VARYING I-02 FROM 1 BY 1  UNTIL I-02 >
                    30 OR S-SUCHEN-OK

                        EVALUATE TRUE
                        WHEN PI-DRPA1348-KNR-NPM-FELD-NAME(I-01)
                           = T-DRPA1348-KNR-NPM-FELD-NAME(I-02)
                         AND PI-DRPA1348-KNR-NPM-FELD-NAME(I-01) NOT = 0
      *                      EINTRAG GEFUNDEN, ALSO NPM-FELD ZULÄSSIG
                             SET S-SUCHEN-OK TO TRUE
                             MOVE K-KNR-NPM-FELD-ZULAESSIG
                               TO PO-DRPA1348-KNR-NPM-FELD-ZUL(I-01)
                        END-EVALUATE

                    END-PERFORM

                END-PERFORM

                SET PO-DRPA1348-RC-OK TO TRUE

           WHEN PO-DRAN0172-RC-NOT-FOUND
                CONTINUE
           END-EVALUATE


           EVALUATE TRUE
           WHEN PO-DRPA1348-RC-OK

                MOVE PO-DRPA1348-RC        TO Z-RC

           WHEN OTHER

                MOVE 'UNGUELTIGER RC     ' TO ERR-VAR-ZEILE01
                MOVE PO-DRPA1348-RC        TO ERR-VAR-ZEILE02
                MOVE K-1                   TO ERR-ORT-LFD
                PERFORM XR93-UPRO-PROG-FEHLER
                GO TO XST-EXIT

           END-EVALUATE



           .
       AAA-EXIT.
           EXIT.
      *-----------------------------------------------------------
       U41-UPAN0026-DRPA1381 SECTION.
      *-----------------------------------------------------------
      * IN   : PI-DRPA1381
      * OUT  : PO-DRPA1381
      * VERAR: CHECK CHECK KARDINALITÄTS-BEZIEHUNG
      *-----------------------------------------------------------
      *
           MOVE 'U41  ' TO ERR-ORT-SEC
           PERFORM UR2-TRACE

           INITIALIZE PI-DRAN0172 PO-DRAN0172

           MOVE K-KTY-ZUORDN-KARD-BEZ    TO PI-DRAN0172-ANTQ-PLAUSI
           MOVE PI-DRPA1381-PGEB-GES     TO PI-DRAN0172-PGEB-GES
           MOVE K-PRODUKT-9999           TO PI-DRAN0172-PROD-PROD-SCHL
           MOVE BR-Z-LAUFDATUM-EUR       TO PI-DRAN0172-ANTQ-GUELTIG-AB

           PERFORM U27-ZTAN0011-DRAN0172

           EVALUATE TRUE
           WHEN PO-DRAN0172-RC-OK

                PERFORM VARYING I-01 FROM 1 BY 1 UNTIL I-01 > 10
                    MOVE PI-DRPA1381-KNR-KARD-BEZ(I-01)
                      TO PO-DRPA1381-KNR-KARD-BEZ(I-01)
                END-PERFORM

                perform varying I-01 from 1 by 1 until i-01 > 10
                   evaluate true
                   when PI-DRPA1381-KNR-KARD-BEZ(i-01)
                      = K-KNR-KARD-VNR-PRINTE
                        move
                PO-DRAN0172-ANTQ-WERT-ALPHANUM(k-knr-kard-vnr-printe:1)
                        to PO-DRPA1381-KNR-KARD(I-01)

                   when PI-DRPA1381-KNR-KARD-BEZ(i-01)
                      = K-KNR-KARD-pin-PRINTE
                        move
                PO-DRAN0172-ANTQ-WERT-ALPHANUM(k-knr-kard-pin-printe:1)
                        to PO-DRPA1381-KNR-KARD(I-01)

                        when PI-DRPA1381-KNR-KARD-BEZ(i-01)
                      = K-KNR-KARD-ANTRAG-PROD
                        move
            PO-DRAN0172-ANTQ-WERT-ALPHANUM(k-knr-kard-antrag-prod:1)
            to PO-DRPA1381-KNR-KARD(I-01)

                   end-evaluate

                end-perform

                SET PO-DRPA1381-RC-OK TO TRUE

           WHEN PO-DRAN0172-RC-NOT-FOUND
                CONTINUE
           END-EVALUATE


           EVALUATE TRUE
           WHEN PO-DRPA1381-RC-OK

                MOVE PO-DRPA1381-RC        TO Z-RC

           WHEN OTHER

                MOVE 'UNGUELTIGER RC     ' TO ERR-VAR-ZEILE01
                MOVE PO-DRPA1381-RC        TO ERR-VAR-ZEILE02
                MOVE K-1                   TO ERR-ORT-LFD
                PERFORM XR93-UPRO-PROG-FEHLER
                GO TO XST-EXIT

           END-EVALUATE

           .
       AAA-EXIT.
           EXIT.
      *-----------------------------------------------------------
       U42-EGG-UPAN0026-DRPA1818 SECTION.
      *-----------------------------------------------------------
      * IN   : PI-DRPA1818
      * OUT  : PO-DRPA1818
      * VERAR: EGG: ERMITTELN KONDITION FÜR UMSATZSTEUER
      *-----------------------------------------------------------
      *
           MOVE 'U42  ' TO ERR-ORT-SEC
           PERFORM UR2-TRACE

           SET PO-DRPA1818-RC-NOT-FOUND  TO TRUE

           INITIALIZE PI-DRAN0172 PO-DRAN0172

           MOVE K-KTY-AN-UMSATZSTEUERPFLICHT
                                         TO PI-DRAN0172-ANTQ-PLAUSI
           MOVE PI-DRPA1818-PGEB-GES     TO PI-DRAN0172-PGEB-GES
           MOVE PI-DRPA1818-PROD-PROD-SCHL
                                         TO PI-DRAN0172-PROD-PROD-SCHL
           MOVE PI-DRPA1818-STICHTAG     TO PI-DRAN0172-ANTQ-GUELTIG-AB

           PERFORM U27-ZTAN0011-DRAN0172

           EVALUATE TRUE
           WHEN PO-DRAN0172-RC-OK

                SET PO-DRPA1818-RC-OK    TO TRUE

                MOVE PO-DRAN0172-ANTQ-WERT-NUM
                                         TO PO-DRPA1818-PROD-UST-SATZ

                EVALUATE TRUE
                WHEN PO-DRPA1818-PROD-UST-SATZ > 0
                     MOVE K-JA           TO PO-DRPA1818-S-UST-PFLICHTIG
                WHEN OTHER
                     MOVE K-NEIN         TO PO-DRPA1818-S-UST-PFLICHTIG
                END-EVALUATE

           WHEN PO-DRAN0172-RC-NOT-FOUND
                CONTINUE
           END-EVALUATE

           EVALUATE TRUE
           WHEN PO-DRPA1818-RC-OK
           WHEN PO-DRPA1818-RC-NOT-FOUND

                MOVE PO-DRPA1818-RC        TO Z-RC

           WHEN OTHER

                MOVE 'UNGUELTIGER RC     ' TO ERR-VAR-ZEILE01
                MOVE PO-DRPA1818-RC        TO ERR-VAR-ZEILE02
                MOVE K-1                   TO ERR-ORT-LFD
                PERFORM XR93-UPRO-PROG-FEHLER
                GO TO XST-EXIT

           END-EVALUATE


           EVALUATE TRUE
           WHEN PO-DRPA1818-RC-OK
           WHEN PO-DRPA1818-RC-NOT-FOUND

                MOVE PO-DRPA1818-RC        TO Z-RC

           WHEN OTHER

                MOVE 'UNGUELTIGER RC     ' TO ERR-VAR-ZEILE01
                MOVE PO-DRPA1818-RC        TO ERR-VAR-ZEILE02
                MOVE K-1                   TO ERR-ORT-LFD
                PERFORM XR93-UPRO-PROG-FEHLER
                GO TO XST-EXIT

           END-EVALUATE

           .
       AAA-EXIT.
           EXIT.
      *-----------------------------------------------------------
       U43-EGG-UPAN0026-DRAN0310 SECTION.
      *-----------------------------------------------------------
      * IN   : PI-DRAN0310
      * OUT  : PO-DRAN0310
      * VERAR: EGG: ERMITTELN PRODUKTSCHLÜSSEL ZU FREMDFONDS
      *-----------------------------------------------------------
      *
           MOVE 'U43  ' TO ERR-ORT-SEC
           PERFORM UR2-TRACE

           SET PO-DRAN0310-RC-NFD        TO TRUE

           INITIALIZE PI-DRAN0172 PO-DRAN0172

           MOVE K-KTY-AN-FREMDPRODUKT    TO PI-DRAN0172-ANTQ-PLAUSI
           MOVE PI-DRAN0310-PGEB-GES-QUELLE
                                         TO PI-DRAN0172-PGEB-GES
           MOVE PI-DRAN0310-PS-QUELLE
                                         TO PI-DRAN0172-PROD-PROD-SCHL
           MOVE BR-Z-LAUFDATUM-EUR       TO PI-DRAN0172-ANTQ-GUELTIG-AB

           PERFORM U27-ZTAN0011-DRAN0172

           EVALUATE TRUE
           WHEN PO-DRAN0172-RC-OK

               MOVE PI-DRAN0310-PGEB-GES-ZIEL
                                             TO Z-9-2

               SET S-SUCHEN-NOK            TO TRUE
               PERFORM VARYING I-01 FROM 1 BY 1 UNTIL I-01 > 23
               OR S-SUCHEN-OK

               MOVE PO-DRAN0172-ANTQ-WERT-ALPHANUM(I-01:2)
                                         TO Z-X-2
                  EVALUATE TRUE
                  WHEN Z-X-2 NUMERIC AND
                    PO-DRAN0172-ANTQ-WERT-ALPHANUM(I-01 + 2:1) = '-'

      *             ES HANDELT SICH UM DEN PRODUKTGEBER
                    EVALUATE TRUE
                    WHEN Z-9-2 = PI-DRAN0310-PGEB-GES-ZIEL
                         EVALUATE TRUE
                         WHEN PO-DRAN0172-ANTQ-WERT-ALPHANUM(I-01 + 3:3)
                              NUMERIC
      *                       ZIELPRODUKTSCHLÜSSEL IST FORMAL KORREKT
                              SET S-SUCHEN-OK    TO TRUE
                              MOVE
                              PO-DRAN0172-ANTQ-WERT-ALPHANUM(I-01 + 3:3)
                                         TO PO-DRAN0310-PS-ZIEL
                              SET PO-DRAN0310-RC-OK
                                              TO TRUE
                         WHEN OTHER
      *                       ZIELPRODUKTSCHLÜSSEL FORMAL NICHT KORREKT
                         MOVE 'ZIELPRODUKTSCLÜSSEL NICHT ERMITTELBAR  '
                                         TO ERR-VAR-ZEILE01
                               MOVE PO-DRAN0172-ANTQ-WERT-ALPHANUM
                                         TO ERR-VAR-ZEILE02
                               MOVE K-2  TO ERR-ORT-LFD
                               PERFORM XR93-UPRO-PROG-FEHLER
                               GO TO XST-EXIT

                         END-EVALUATE

                    WHEN OTHER
                         CONTINUE
                    END-EVALUATE

                  END-EVALUATE

               END-PERFORM

           WHEN OTHER
                CONTINUE
           END-EVALUATE

           EVALUATE TRUE
           WHEN PO-DRAN0310-RC-OK
           WHEN PO-DRAN0310-RC-NFD

                MOVE PO-DRAN0310-RC        TO Z-RC

           WHEN OTHER

                MOVE 'UNGUELTIGER RC     ' TO ERR-VAR-ZEILE01
                MOVE PO-DRAN0310-RC        TO ERR-VAR-ZEILE02
                MOVE K-1                   TO ERR-ORT-LFD
                PERFORM XR93-UPRO-PROG-FEHLER
                GO TO XST-EXIT

           END-EVALUATE

           .
       AAA-EXIT.
           EXIT.
      *-----------------------------------------------------------
       U44-EGG-UPAN0026-DRPA0284 SECTION.
      *-----------------------------------------------------------
      * IN   : PI-DRPA0284
      * OUT  : PO-DRPA0284
      * VERAR: EGG: ERMITTELN PRODUKTSCHLÜSSEL ZU TARIF
      *-----------------------------------------------------------
      *
           MOVE 'U44  ' TO ERR-ORT-SEC
           PERFORM UR2-TRACE
           SET PO-DRPA0284-RC-LEER       TO TRUE

           EVALUATE TRUE
           WHEN NOT S-KTY423-TABELLE-GEFUELLT
                PERFORM U50-FUELLEN-HAUPTTARIFE
           WHEN OTHER
                CONTINUE
           END-EVALUATE

           MOVE PI-DRPA0284-PGTA-TARIF   TO Z-TARIF
           MOVE 15                       TO Z-TARIF-ST
           SET S-KTY423-SUCHEN-NOK       TO TRUE
271022     SET S-LETZTES-ZEICHEN-INIT    TO TRUE
           PERFORM U52-SUCHEN-HAUPTTARIF UNTIL Z-TARIF-ST < 2
              OR S-KTY423-SUCHEN-OK

           EVALUATE TRUE
           WHEN S-KTY423-SUCHEN-OK
                SET PO-DRPA0284-RC-OK TO TRUE
           END-EVALUATE

           MOVE PO-DRPA0284-RC           TO Z-RC

           .
       AAA-EXIT.
           EXIT.
      *-----------------------------------------------------------
       U46-EGG-UPAN0026-DRPA0200 SECTION.
      *-----------------------------------------------------------
      * IN   : PI-DRPA0200
      * OUT  : PO-DRPA0200
      * VERAR: EGG: PROD ERMITTELN UMSATZSTEUER + PRODUKTKURZBEZ.
      *-----------------------------------------------------------
      *
           MOVE 'U46  ' TO ERR-ORT-SEC
           PERFORM UR2-TRACE

           SET PO-DRPA0200-RC-NOT-FOUND  TO TRUE

           INITIALIZE PI-DRAN0172 PO-DRAN0172

           MOVE K-KTY-AN-UMSATZSTEUERPFLICHT
                                         TO PI-DRAN0172-ANTQ-PLAUSI
           MOVE PI-DRPA0200-PGEB-GES     TO PI-DRAN0172-PGEB-GES
           MOVE PI-DRPA0200-PROD-PROD-SCHL
                                         TO PI-DRAN0172-PROD-PROD-SCHL
           MOVE PI-DRPA0200-STICHTAG     TO PI-DRAN0172-ANTQ-GUELTIG-AB

           PERFORM U27-ZTAN0011-DRAN0172

           EVALUATE TRUE
           WHEN PO-DRAN0172-RC-OK

                SET PO-DRPA0200-RC-OK    TO TRUE
                MOVE PO-DRAN0172-ANTQ-WERT-ALPHANUM
                                         TO PO-DRPA0200-PROD-BEZ-KURZ
           WHEN PO-DRAN0172-RC-NOT-FOUND
                CONTINUE
           END-EVALUATE

           EVALUATE TRUE
           WHEN PO-DRPA0200-RC-OK
           WHEN PO-DRPA0200-RC-NOT-FOUND

                MOVE PO-DRPA0200-RC        TO Z-RC

           WHEN OTHER

                MOVE 'UNGUELTIGER RC     ' TO ERR-VAR-ZEILE01
                MOVE PO-DRPA0200-RC        TO ERR-VAR-ZEILE02
                MOVE K-1                   TO ERR-ORT-LFD
                PERFORM XR93-UPRO-PROG-FEHLER
                GO TO XST-EXIT

           END-EVALUATE

           .
       AAA-EXIT.
           EXIT.
      *
      *-----------------------------------------------------------
       U50-FUELLEN-HAUPTTARIFE SECTION.
      *-----------------------------------------------------------
      * IN   : -
      * OUT  : GEFÜLLTE UND SORTIERTE TABELLE-KTY423
      * VERAR: FÜLLEN  UND SORTIEREN TABELLE-KTY423 (HAUPTTARIFE)
      *-----------------------------------------------------------
      *
           MOVE 'U50  ' TO ERR-ORT-SEC
           PERFORM UR2-TRACE

           SET S-KTY423-TABELLE-GEFUELLT TO TRUE
           MOVE HIGH-VALUE TO TABELLE-KTY423

           INITIALIZE PI-DRAN0320 PO-DRAN0320
           SET PI-ZXAN0011-DRAN0320      TO TRUE
           MOVE K-KTY-AN-TARIF           TO Z-ANTQ-PLAUSI
           MOVE K-LIST-FIRST             TO Z-UFKT
           PERFORM U51-ZXAN0011-DRAN0320
           EVALUATE TRUE
           WHEN PO-DRAN0320-RC-OK

                PERFORM U501-FUELLEN-HAUPTTARIFE UNTIL
                    NOT PO-DRAN0320-RC-OK

           WHEN OTHER
                CONTINUE
           END-EVALUATE

           SORT TAB-KTY423 ASCENDING T-KTY423-PGEB-GES
                                     T-KTY423-ANTQ-WERT-ALPHANUM

           MOVE K-LIST-QUIT              TO Z-UFKT
           PERFORM U51-ZXAN0011-DRAN0320

           .
       AAA-EXIT.
           EXIT.
      *
      *-----------------------------------------------------------
       U501-FUELLEN-HAUPTTARIFE SECTION.
      *-----------------------------------------------------------
      * IN   : -
      * OUT  : EINTRAG TABELLE-KTY423
      * VERAR: FÜLLEN TABELLE-KTY-423
      *-----------------------------------------------------------
      *
           MOVE 'U501 ' TO ERR-ORT-SEC
           PERFORM UR2-TRACE

           MOVE SPACE               TO Z-X-30
           MOVE 0                   TO I-02

           PERFORM VARYING I-01 FROM 1 BY 1 UNTIL I-01 > 30

              EVALUATE TRUE
              WHEN PO-DRAN0320-ANTQ-WERT-ALPHANUM(I-01:1) = K-KOMMA
                OR I-01 = 30

                   EVALUATE TRUE
                   WHEN Z-X-30 NOT = SPACE
      *                 IN TABELLENZEILE SPEICHERN
                        SET I-KTY423 UP BY 1
                        SET I-KTY423-MAX TO I-KTY423
                        MOVE PO-DRAN0320-PGEB-GES
                          TO T-KTY423-PGEB-GES(I-KTY423)
                        MOVE PO-DRAN0320-PROD-PROD-SCHL
                          TO T-KTY423-PROD-PROD-SCHL(I-KTY423)
                        MOVE Z-X-30(1:I-02)
                          TO T-KTY423-ANTQ-WERT-ALPHANUM(I-KTY423)
                        MOVE PO-DRAN0320-ANTQ-GUELTIG-AB
                          TO T-KTY423-ANTQ-GUELTIG-AB(I-KTY423)
                        MOVE PO-DRAN0320-ANTQ-GUELTIG-BIS
                          TO T-KTY423-ANTQ-GUELTIG-BIS(I-KTY423)

                        MOVE SPACE  TO Z-X-30
                        MOVE 0      TO I-02
                   WHEN OTHER
                        CONTINUE
                   END-EVALUATE

              WHEN OTHER
      *            ÜBERTRAGEN ZEICHEN NACH ZWISCHENFELD
                   ADD 1               TO I-02
                   MOVE PO-DRAN0320-ANTQ-WERT-ALPHANUM(I-01:1)
                     TO Z-X-30(I-02:1)

              END-EVALUATE

           END-PERFORM

           MOVE K-LIST-NEXT         TO Z-UFKT
           PERFORM U51-ZXAN0011-DRAN0320

           .
       AAA-EXIT.
           EXIT.
      *
      *-----------------------------------------------------------
       U51-ZXAN0011-DRAN0320 SECTION.
      *-----------------------------------------------------------
      * IN   : K-PGM-NAME, Z-UFKT, Z-ANTQ-PLAUSI
      * OUT  : PO-DRAN0320
      * VERAR: CURSOR DRAN0320
      *-----------------------------------------------------------
      *
           MOVE 'U51  ' TO ERR-ORT-SEC
           PERFORM UR2-TRACE

           SET PI-ZXAN0011-DRAN0320 TO TRUE
           MOVE K-PGM-NAME               TO PI-DRAN0320-PROGRAMM
           MOVE Z-UFKT                   TO PI-DRAN0320-UFKT
           MOVE Z-ANTQ-PLAUSI            TO  PI-DRAN0320-ANTQ-PLAUSI


           CALL K-ZXAN0011 USING BY REFERENCE
                                  PI-ZXAN0011
                                  PI-DRAN0320
                                  PO-DRAN0320
                                  ERR-ERROR-BEREICH
                                  STANDARD-STATUS-BEREICH
           END-CALL

           IF ERR-RC-SCHWERER-FEHLER
              GO TO XST-EXIT
           END-IF

           EVALUATE TRUE
           WHEN PO-DRAN0320-RC-OK
           WHEN PO-DRAN0320-RC-EOF
           WHEN PO-DRAN0320-RC-LEER
                   CONTINUE
           WHEN OTHER
              MOVE 'UPAN0010/DRAN0320: RETURN-CODE NICHT OK'
                                             TO ERR-VAR-ZEILE01
              MOVE PO-DRAN0320-RC            TO ERR-VAR-ZEILE02
              MOVE K-1                       TO ERR-ORT-LFD
              PERFORM XR93-UPRO-PROG-FEHLER
              GO TO XST-EXIT
           END-EVALUATE

           .
       AAA-EXIT.
           EXIT.
      *
      *-----------------------------------------------------------
       U52-SUCHEN-HAUPTTARIF SECTION.
      *-----------------------------------------------------------
      * IN   : Z-TARIF
      * OUT  : S-KTY423-SUCHEN Z-TARIF-ST
      * VERAR: SUCHEN TARIF IN TABELLE-KTY423 (HAUPTTARIFE)
      *-----------------------------------------------------------

           MOVE 'U52  ' TO ERR-ORT-SEC
           PERFORM UR2-TRACE

           PERFORM U521-SUCHEN-HAUPTTARIF

           SUBTRACT 1 FROM Z-TARIF-ST

           .
       AAA-EXIT.
           EXIT.
      *
      *-----------------------------------------------------------
       U521-SUCHEN-HAUPTTARIF SECTION.
      *-----------------------------------------------------------
      * IN   : Z-TARIF
      * OUT  : S-KTY423-SUCHEN, PO-DRPA0284-PROD-PROD-SCHL
      * VERAR: SUCHEN TARIF IN TABELLE-KTY423 (HAUPTTARIFE)
      *-----------------------------------------------------------

           MOVE 'U52  ' TO ERR-ORT-SEC
           PERFORM UR2-TRACE

           SEARCH ALL TAB-KTY423
           AT END
              SET S-KTY423-SUCHEN-NOK TO TRUE
           WHEN T-KTY423-PGEB-GES(I-KTY423) = PI-DRPA0284-PGEB-GES
            AND T-KTY423-ANTQ-WERT-ALPHANUM(I-KTY423)
                                            = Z-TARIF(1:Z-TARIF-ST)

                MOVE T-KTY423-PROD-PROD-SCHL(I-KTY423)
                                         TO PO-DRPA0284-PROD-PROD-SCHL
                MOVE T-KTY423-ANTQ-GUELTIG-AB(I-KTY423)
                                         TO PO-DRPA0284-PGTA-GUELT-AB
                MOVE T-KTY423-ANTQ-GUELTIG-BIS(I-KTY423)
                                         TO PO-DRPA0284-PGTA-GUELT-BIS
                SET S-KTY423-SUCHEN-OK TO TRUE
           END-SEARCH
           
271022     EVALUATE TRUE
271022     WHEN S-LETZTES-ZEICHEN-INIT
271022      AND S-KTY423-SUCHEN-NOK
271022      AND Z-TARIF-ST < 15
271022      AND Z-TARIF(Z-TARIF-ST:1) NUMERIC
271022          SET S-LETZTES-ZEICHEN-NUMERISCH TO TRUE
271022          MOVE Z-TARIF             TO Z-TARIF-MIT-0
271022          MOVE '0'                 TO 
271022               Z-TARIF-MIT-0(Z-TARIF-ST + 1:1)
271022          
271022          SEARCH ALL TAB-KTY423
271022          AT END
271022             SET S-KTY423-SUCHEN-NOK TO TRUE
271022          WHEN T-KTY423-PGEB-GES(I-KTY423) = PI-DRPA0284-PGEB-GES
271022           AND T-KTY423-ANTQ-WERT-ALPHANUM(I-KTY423)
271022             = Z-TARIF-MIT-0(1:Z-TARIF-ST + 1)
271022          
271022               MOVE T-KTY423-PROD-PROD-SCHL(I-KTY423)              
271022                                    TO PO-DRPA0284-PROD-PROD-SCHL  
271022               MOVE T-KTY423-ANTQ-GUELTIG-AB(I-KTY423)
271022                                    TO PO-DRPA0284-PGTA-GUELT-AB   
271022               MOVE T-KTY423-ANTQ-GUELTIG-BIS(I-KTY423)
271022                                    TO PO-DRPA0284-PGTA-GUELT-BIS  
271022               SET S-KTY423-SUCHEN-OK TO TRUE
271022          END-SEARCH
271022          
271022     END-EVALUATE

           .
       AAA-EXIT.
           EXIT.
      *-----------------------------------------------------------
       U53-EGG-UPAN0026-DRPA1652 SECTION.
      *-----------------------------------------------------------
      * IN   : PI-DRPA1652
      * OUT  : PO-DRPA1652
      * VERAR: EGG: ERMITTELN EINHEITEN
      *-----------------------------------------------------------
      *
           MOVE 'U53  ' TO ERR-ORT-SEC
           PERFORM UR2-TRACE

           SET PO-DRPA1652-RC-LEER       TO TRUE

           INITIALIZE PI-DRAN0172 PO-DRAN0172

           MOVE K-KTY-AN-GP-SATZ         TO PI-DRAN0172-ANTQ-PLAUSI
           MOVE PI-DRPA1652-PGEB-GES     TO PI-DRAN0172-PGEB-GES
           MOVE PI-DRPA1652-PROD-PROD-SCHL
                                         TO PI-DRAN0172-PROD-PROD-SCHL
           MOVE PI-DRPA1652-STICHTAG     TO PI-DRAN0172-ANTQ-GUELTIG-AB

           PERFORM U27-ZTAN0011-DRAN0172

           EVALUATE TRUE
           WHEN PO-DRAN0172-RC-OK

                MOVE PO-DRAN0172-ANTQ-WERT-ALPHANUM(1:1)
                                         TO Z-X-1
                EVALUATE TRUE
                WHEN Z-X-1 NOT NUMERIC
                     MOVE 'KOND-REGEL LEER    ' TO ERR-VAR-ZEILE01
                     MOVE Z-X-1                 TO ERR-VAR-ZEILE02
                     MOVE K-1                   TO ERR-ORT-LFD
                     PERFORM XR93-UPRO-PROG-FEHLER
                     GO TO XST-EXIT
                WHEN Z-9-1 = K-KNR-K-REGEL-GRUND-P-SUM-LZ

                     SET PO-DRPA1652-RC-OK TO TRUE
                     MOVE Z-9-1            TO PO-DRPA1652-KNR-KOND-REGEL

                WHEN OTHER
                     SET PO-DRPA1652-RC-LEER TO TRUE
                     MOVE Z-9-1            TO PO-DRPA1652-KNR-KOND-REGEL
                END-EVALUATE

           WHEN PO-DRAN0172-RC-NOT-FOUND
                CONTINUE
           WHEN OTHER
                MOVE 'DRAN0172 - UNGUELTIGER RC     '
                                         TO ERR-VAR-ZEILE01
                MOVE PO-DRAN0172-RC      TO ERR-VAR-ZEILE02
                MOVE K-1                 TO ERR-ORT-LFD
                PERFORM XR93-UPRO-PROG-FEHLER
                GO TO XST-EXIT
           END-EVALUATE

           MOVE PO-DRPA1652-RC           TO Z-RC

           .
       AAA-EXIT.
           EXIT.
      *-----------------------------------------------------------
       U54-EGG-UPAN0026-DRPA1267 SECTION.
      *-----------------------------------------------------------
      * IN   : PI-DRPA1267
      * OUT  : PO-DRPA1267
      * VERAR: EGG: ERMITTELN TARIF ZU PRODUKTSCHLÜSSEL
      *-----------------------------------------------------------
      *
           MOVE 'U54  ' TO ERR-ORT-SEC
           PERFORM UR2-TRACE

           SET PO-DRPA1267-RC-LEER       TO TRUE

           INITIALIZE PI-DRAN0172 PO-DRAN0172

           MOVE K-KTY-AN-TARIF           TO PI-DRAN0172-ANTQ-PLAUSI
           MOVE PI-DRPA1267-PGEB-GES     TO PI-DRAN0172-PGEB-GES
           MOVE PI-DRPA1267-PROD-PROD-SCHL
                                         TO PI-DRAN0172-PROD-PROD-SCHL
           MOVE BR-Z-LAUFDATUM-EUR       TO PI-DRAN0172-ANTQ-GUELTIG-AB

           PERFORM U27-ZTAN0011-DRAN0172

           EVALUATE TRUE
           WHEN PO-DRAN0172-RC-OK

                SET PO-DRPA1267-RC-OK    TO TRUE
                PERFORM VARYING I-01 FROM 1 BY 1 UNTIL I-01 > 15 OR
                PO-DRAN0172-ANTQ-WERT-ALPHANUM(I-01:1) = K-KOMMA
                   MOVE PO-DRAN0172-ANTQ-WERT-ALPHANUM(I-01:1)
                                         TO
                                         PO-DRPA1267-PGTA-TARIF(I-01:1)
                END-PERFORM
           WHEN PO-DRAN0172-RC-NOT-FOUND
                CONTINUE
           END-EVALUATE

           EVALUATE TRUE
           WHEN PO-DRPA1267-RC-OK
           WHEN PO-DRPA1267-RC-LEER
           WHEN PO-DRPA1267-RC-EOF

                MOVE PO-DRPA1267-RC        TO Z-RC

           WHEN OTHER

                MOVE 'UNGUELTIGER RC     ' TO ERR-VAR-ZEILE01
                MOVE PO-DRPA1267-RC        TO ERR-VAR-ZEILE02
                MOVE K-1                   TO ERR-ORT-LFD
                PERFORM XR93-UPRO-PROG-FEHLER
                GO TO XST-EXIT

           END-EVALUATE

           .
       AAA-EXIT.
           EXIT.
      *
      *---------------------------------------------------------------*
      *
      *>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>*
      *  UPRORAHMEN: STANDARDROUTINEN,
      *              ERROR-HANDLING UND TRACE
      *>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>*
      *---------------------------------------------------------------*
      * BR01-ERM-LAUFDATUM     --   ERMITTELN LAUFDATUM               *
      * INPUT : -                                                     *
      * OUTPUT:                                                       *
      * BENÖTIGT: BEI BEDARF                                          *
      *---------------------------------------------------------------*
        COPY DPAT0068.
      *---------------------------------------------------------------*
      * XR02-ERM-TIMESTAMP     --   ERMITTELN LAUFDATUM AUS           *
      *                             DB2/TIMESTAMP                     *
      * INPUT : -                                                     *
      * OUTPUT:                                                       *
      * BENÖTIGT: BEI BEDARF                                          *
      *---------------------------------------------------------------*
        COPY DPAT0070.
      *
      *---------------------------------------------------------------*
      * UR2-TRACE              --   ERR-TRACE FUELLEN                 *
      * INPUT : -                                                     *
      * OUTPUT:                                                       *
      * BENÖTIGT: IMMER                                               *
      *---------------------------------------------------------------*
        COPY DPAT0005.
      *
      *---------------------------------------------------------------*
      * XR93-UPRO-PROG-FEHLER  --   LOGIK-/PROGRAMMIERFEHLER          *
      * INPUT : -                                                     *
      * OUTPUT:                                                       *
      * BENÖTIGT: IMMER                                               *
      *---------------------------------------------------------------*
        COPY DPAT0009.
      *
      *---------------------------------------------------------------*
      * XR94-UPRO-DATEI-FEHLER --   DATEI-FEHLER                      *
      * INPUT : -                                                     *
      * OUTPUT:                                                       *
      * BENÖTIGT: BEI BEDARF                                          *
      *---------------------------------------------------------------*
      * COPY DPAT0046.
      *
      *****************************************************************
      *---------------------- ENDE UPAN0026 --------------------------*
      *****************************************************************
