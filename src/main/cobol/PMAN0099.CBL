      *---------------------------------------------------------------*
      *    Standard fuer alle Objekte unter PVCS VM
      *            Datum     :  01.08.2016
      *            Kategorie :  Cobol-Programm
      *---------------------------------------------------------------*
      *    Copyright (c) 2016 ATLAS Dienstleistungen f. V. GmbH
      *---------------------------------------------------------------*
      *    $Workfile:   PMAN0099.CBL  $
      *    $Revision:   2.3  $
      *
      *    $Log:   L:/mf/COBOL/PMAN0099.CBv  $
      *
      *   Rev 2.3   Aug 10 2016 09:38:46   t13ae34
      *FAN01094: AMV unvollständiger XGDV-Satz bei Bestandsmanagement
      *
      *   Rev 2.2   Aug 02 2016 11:59:38   t13ae34
      *FAN01094: AMV unvollständiger XGDV-Satz bei Bestandsmanagement
      *
      *   Rev 2.1   Aug 01 2016 17:15:36   t13ae34
      *FAN01094: AMV unvollständiger XGDV-Satz bei Bestandsmanagement
      *
      *   Rev 2.0   Aug 01 2016 09:16:48   t13ae34
      *Archiverstellung
      *
      *---------------------------------------------------------------*
       IDENTIFICATION DIVISION.
       PROGRAM-ID.    PMAN0099.
      *AUTHOR.        M.HEIDER
      *DATE-WRITTEN.  AUGUST 2016
      *DATE-COMPILED.
      ****************************************************************
      *    VERSION
      ****************************************************************
      * AENDERUNGEN:                                                 *
      * AUFTRAG ! DATUM  !VER ! AENDERUNG                 ! NAME     *
      * -------------------------------------------------------------*
      * FAN01094!01.08.16!2.1 ! NEU                       ! HEIDER   *
      * FAN01094!10.08.16!2.2 ! LÖSCHEN NACH ZWEITEM '$'  ! HEIDER   *
      *         !        !    !                           !          *
      *         !        !    !                           !          *
      *         !        !    !                           !          *
      *                                                              *
      * ENDE-LOGBUCH                                                 *
      ****************************************************************
      ****************************************************************
      *                                                              *
      *   <KURZE FACHLICHE BESCHREIBUNG>                             *
      *   KORREKTURPROGRAMM FILETRANSFERSÄTZE AMV POA                *
      *                                                              *
      *                                                              *
      *                                                              *
      *                                                              *
      *   <N?> GRUPPENWECHSEL                                        *
      *                                                              *
      ****************************************************************
      ****************************************************************
      *                                                              *
      *   --------->  B A T C H - N O R* M R* A H M E N  <-----------  *
      *   --------->        N GRUPPENWECHSEL           <-----------  *
      *   --------->        1 EINGABEDATEI             <-----------  *
      *                                                              *
      *   DIESES PROGRAMM WURDE MIT EINEM BATCH-NORMRAHMEN ERSTELLT. *
      *   DER RAHMEN IST FÜR DIE BEARBEITUNG MEHRERER GRUPPENWECHSEL *
      *   UND EINER EINGABEDATEI / EINES EINGABE-CURSORS KONZIPIERT. *
      *                                                              *
      *   DIESER RAHMEN ENTHÄLT EINE RESTART-VERWALTUNG.             *
      *                                                              *
      *                       *************                          *
      *                       *  ACHTUNG  *                          *
      *                       *************                          *
      *       +---------------------------------------------+        *
      *       !  VORAUSSETZUNGEN FÜR DEN RAHMEN:            !        *
      *       !  - S-DATEI-STATUS MUSS DEFINIERT SEIN       !        *
      *       !  - K-PGM-NAME     MUSS ANGELEGT SEIN        !        *
      *       !  - DIV. COPYS MÜSSEN VORH. SEIN (JEWEILS    !        *
      *       !       IM KOMMENTAR ZU DEN COPYS ANGEGEBEN)  !        *
      *       +---------------------------------------------+        *
      *                                                              *
      *                                                              *
      *   ALLGEMEINE VERARBEITUNGSHINWEISE                           *
      *   --------------------------------                           *
      *                                                              *
      *   - 'PMAN0099' IST DURCH DEN PROGRAMMNAMEN ZU ERSETZEN       *
      *                                                              *
      *   - ALLE RELEVANTEN ZEILEN FÜR GRUPPENWECHSEL SIND IN DEN    *
      *     SPALTEN 5 BIS 7 MARKIERT UND MÜSSEN BEI BEDARF AKTIVIERT *
      *     WERDEN:                                                  *
      *       - MARKIERUNG FÜR EINSTUFIGEN  GRUPPENWECHSEL: 'G1*'    *
      *       - MARKIERUNG FÜR ZWEISTUFIGEN GRUPPENWECHSEL: 'G2*'    *
      *                                                              *
      *   - ALLE RELEVANTEN ZEILEN DER RESTART-VERWALTUNG SIND IN    *
      *     DEN SPALTEN 6 BIS 7 MARKIERT UND MÜSSEN BEI BEDARF       *
      *     AKTIVIERT WERDEN:                                        *
      *       - MARKIERUNG FÜR RESTART-VERWALTUNG         :  'R '    *
      *                                                              *
      *   - AM ENDE DER DATEI/CURSOR VERSORGEN VON S-NZ MIT          *
      *     K-ZUSTAND-EOF. DIE RAHMENSTEUERUNG VERZWEIGT DANN        *
      *     DIREKT ZU SÄMTLICHEN NACHLAUF-ROUTINEN (N2 N1 N0).       *
      *                                                              *
      *                                                              *
      *   REGELN FÜR FEHLERHANDLING:                                 *
      *   -------------------------                                  *
      *   - VERWENDUNG DER STANDARD-FEHLER-ROUTINEN ZUR FEHLERAUF-   *
      *     BEREITUNG UND AUSGABE (BR91, BR93, BR94, BR95, BR99)     *
      *                                                              *
      *   - NACH DEM AUFRUF VON BR91, BR93, BR94, BR95 ODER BR99 MUß *
      *     DIE ROUTINE "U01-ABBRUCH" (=PROGRAMMABBRUCH) AUFGERUFEN  *
      *     WERDEN. HIER KANN EIN ROLLBACK DURCHGEFÜHRT WERDEN.      *
      *                                                              *
      *     *******                                                  *
      *     ACHTUNG: U01-ABBRUCH BEENDET DAS PROGRAMM !!!            *
      *     *******                                                  *
      *                                                              *
      ****************************************************************

       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
      *OBJECT-COMPUTER.  IBM-4300.
      *SOURCE-COMPUTER.  IBM-4381 WITH DEBUGGING MODE.
       SOURCE-COMPUTER.  IBM-4381.
       SPECIAL-NAMES.
               DECIMAL-POINT IS COMMA.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
      *    SELECT  <DATEI1> ASSIGN       TO  AS-<DATEI1>.
      *            FILE STATUS           IS  <DATEI1>-STATUS.
           SELECT  EINGABE-DATEI ASSIGN  TO  EINGABE
                   FILE STATUS  IS  S-EINGABE-STATUS.

           SELECT  AUSGABE-DATEI ASSIGN  TO  AUSGABE
                   FILE STATUS  IS  S-AUSGABE-STATUS.
      *    SELECT  <DATEI2> ASSIGN       TO  <DATEI2>.
      *****************************************************************
       DATA DIVISION.
      *****************************************************************
       FILE SECTION.
      *FD  <DATEI1>
      *    BLOCK 0 RECORDS.
       FD  EINGABE-DATEI
           BLOCK 0 RECORDS
           RECORDING MODE IS V.
           COPY DRAN0057 REPLACING POA-FT-DVAG-AMV BY EINGABE-SATZ.

       FD  AUSGABE-DATEI
           BLOCK 0 RECORDS
           RECORD IS VARYING IN SIZE FROM 1 TO 25196 CHARACTERS
                     DEPENDING ON Z-RECL-AUSGABE
           RECORDING MODE IS V.
           COPY DRAN0057 REPLACING POA-FT-DVAG-AMV BY AUSGABE-SATZ.
      *
      ****************************************************************
       WORKING-STORAGE SECTION.
      ****************************************************************
       01  FILLER.
           05  FILLER               PIC X(024)
                                    VALUE '*** WORKING-STORAGE ***'.

      *>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>*
      *  DATENFELDER FÜR BATCH-RAHMENSTEUERUNG                     *
      *>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>*
      *------------------------------------------------------------*
      * ERR-ERROR-BEREICH  -  STANDARD-FEHLER-BEREICH              *
      * BENÖTIGT: IMMER                                            *
      *------------------------------------------------------------*
       COPY DRAT0004.
      *------------------------------------------------------------*
      * D-ERROR-BEREICH  -  DRUCKAUFBEREITUNG ERROR-BEREICH        *
      * BENÖTIGT: IMMER                                            *
      *------------------------------------------------------------*
       COPY DRAT0006.
      *------------------------------------------------------------*
      * D-DB2S  -  DRUCKAUFBEREITUNG SCHNITTST. DB2-SCHREIBMODUL   *
      * BENÖTIGT: IMMER                                            *
      *------------------------------------------------------------*
       COPY DRAT0021.
      *------------------------------------------------------------*
      * PARAMETER-STEUER/-RETURN  -  SCHNITTST. DB2-SCHREIBMODUL   *
      * BENÖTIGT: IMMER                                            *
      *------------------------------------------------------------*
       COPY DRAT0007.
      *------------------------------------------------------------*
      * STANDARD-STATUS-BEREICH                                    *
      * BENÖTIGT: IMMER                                            *
      *------------------------------------------------------------*
       COPY DRAT0109.
      *>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>*
      *  ENDE DATENFELDER FÜR BATCH-RAHMENSTEUERUNG                *
      *>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>*

      *>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>*
      *  ANFANG DATENFELDER FÜR RESTARTVERWALTUNG                  *
      *>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>*
      *
      *** KONSTANTEN FUER RESTARTVERWALTUNG   ***
     R* COPY DWAT0052.
      *
      *------------------------------------------------------------*
      * SPEZIFIKATIONEN ZUR RESTART-COPY-STRECKE:                  *
      *                                                            *
      * -                                                          *
      * MAX.LAENGE (DRSSNNNN) = 4000. FALLS MEHR RESTARTANGABEN    *
      * ERFORDERLICH SIND, MUESSEN ZUSAETZLICHE DEFINIERT WERDEN.  *
      * -                                                          *
      * NAME DER COPY-STRECKE: DRSSNNNN                            *
      * -                                                          *
      * DIE COPY-STRECKE ENTHÄLT AB DER 1. STELLE DEN 8-STELLIGEN  *
      * COPYNAMEN                                                  *
      * -                                                          *
      * DIE ÜBRIGE COPY-GLIEDERUNG RICHTET SICH NACH DEN           *
      * ERFORDERNISSEN DES PROGRAMMS.                              *
      *------------------------------------------------------------*
     R* COPY DRSSNNNN-COPY-1.
      *
      ***   FALLS WEITERE RESTARTINFO-COPIES BENOETIGT WERDEN ...
     R* COPY DRSSNNNN-COPY-2.
      ***   ETC.
      *>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>*
      *  ENDE DER DATENFELDER FUER RESTARTVERWALTUNG               *
      *>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>*
       01  FILLER.
           05  FILLER               PIC  X(032)
                                    VALUE '*** DB2-BEREICHE ***'.

      *    INCLUDE FÜR DB2 SPEZIFISCHE DATENFELDER
            EXEC SQL
                 INCLUDE SQLCA
            END-EXEC.

      **************************************************************
       01  FILLER.
           05  FILLER               PIC X(032)
                                    VALUE '*** DRUCKBEREICH ***'.

           05 D-ANZ-EINGABE         PIC -(009)9.
           05 D-ANZ-OK              PIC -(009)9.
           05 D-ANZ-NOK             PIC -(009)9.
           05 D-ANZ-AUSGABE         PIC -(009)9.


      **************************************************************
       01  FILLER.
           05  FILLER               PIC X(032)
                                    VALUE '*** KONSTANTEN ***'.

      *------------------------------------------------------------*
      * K-PGM-NAME                                                 *
      * BENÖTIGT: IMMER                                            *
      *------------------------------------------------------------*
      *
           05  K-PGM-NAME                PIC  X(008) VALUE 'PMAN0099'.

      *    * KONSTANTEN FÜR STANDARD-RAHMEN (ZUSTAND)
           05  K-ZUSTAND-OK              PIC  X(001)      VALUE '1'.
           05  K-ZUSTAND-EOF             PIC  X(001)      VALUE '2'.

      *    * STANDARD-KONSTANTEN
           EXEC SQL
              INCLUDE DRAT0009
           END-EXEC.

           05 K-XGDV-MAX-LAENGE   PIC 9(05) COMP-3 VALUE 25000.
100816     05  K-BEGRENZER-BLACK-BOX         PIC X(001) VALUE '$'.
      **************************************************************
       01  FILLER.
           05  FILLER               PIC X(032)
                                    VALUE '*** PARAMETER-BEREICH ***'.
       01  VORLAUFKARTE.
           05  VLK-PGM                 PIC  X(008).
           05  FILLER                  PIC  X(001).
           05  VLK-KENNZEICHEN         PIC  X(001).
           88  VLK-KENNZEICHEN-ALLE    VALUE 'A'.
           88  VLK-KENNZEICHEN-FOLGE   VALUE 'F'.
020816     05  FILLER                  PIC  X(001).
020816     05  VLK-DATEINAME           PIC  X(060).
      *

      **************************************************************
       01  FILLER.
           05  FILLER               PIC X(032)
                                    VALUE '*** QSAM-BEREICH ***'.

      ****************************************************************
       01  FILLER.
           05  FILLER               PIC  X(032)
                                VALUE '*** SCHALTER /STEUERFELDER ***'.

      *------------------------------------------------------------*
      * STEUERFELDER GRUPPENWECHSELSTEUERUNG                       *
      * BENÖTIGT: IMMER                                            *
      *------------------------------------------------------------*
           05 S-NEU.
    G2*       10 S-NG2.
    G1*          15 S-NG1.
                    20 S-NZ         PIC  X(001)        VALUE SPACE.
    G1*             20 S-N1         PIC S9(004) COMP   VALUE ZERO.
    G2*          15 S-N2            PIC S9(004) COMP   VALUE ZERO.

           05 S-ALT.
    G2*       10 S-AG2.
    G1*          15 S-AG1.
                    20 S-AZ         PIC  X(001)        VALUE SPACE.
    G1*             20 S-A1         PIC S9(004) COMP   VALUE ZERO.
    G2*          15 S-A2            PIC S9(004) COMP   VALUE ZERO.

           05 S-LETZTES-ZEICHEN     PIC X(1).
           88 ENDEKENNZEICHEN       VALUE '$'.

           05 S-SCHREIBEN           PIC X(1).
           88 FOLGESATZ-SCHREIBEN        VALUE 'J'.
           88 FOLGESATZ-NICHT-SCHREIBEN  VALUE 'N'.

100816*>>>>>
           05  S-BLACK-BOX-BEGRENZER    PIC 9(9).
               88 BEGRENZER-GEFUNDEN       VALUE 1.
               88 BEGRENZER-NICHT-GEFUNDEN VALUE 0.
100816*<<<<<
      *------------------------------------------------------------*
      * S-DATEI-STATUS                                             *
      * BENÖTIGT: IMMER                                            *
      *------------------------------------------------------------*
           05  S-DATEI-STATUS       PIC  X(002)        VALUE SPACE.
           05  S-EINGABE-STATUS     PIC  X(002)        VALUE SPACE.
               88 S-EINGABE-OK                         VALUE '00', '04'.
               88 S-EINGABE-EOF                        VALUE '10'.
           05  S-AUSGABE-STATUS     PIC  X(002)        VALUE SPACE.
               88 S-AUSGABE-OK                         VALUE '00'.

      * --------- SONSTIGE SCHALTER ------------------------------

      **************************************************************
       01  FILLER.
           05  FILLER               PIC X(032)
                                    VALUE '*** TABELLEN-BEREICH   ***'.

           05 I-INDEX1             PIC S9(005)  BINARY SYNC VALUE ZERO.
      **************************************************************
       01  FILLER.
           05  FILLER                        PIC X(032)
                                    VALUE '*** ZWISCHENFELDER ETC ***'.

       01  FILLER.
           05  Z-TAGESDATUM-EUR              PIC X(010).
           05  Z-TAGESZEIT-EUR        PIC  X(008) VALUE SPACES.
           05  Z-TAGESDATUM-ISO       PIC  X(010) VALUE SPACES.

           05 Z-ANZ-EINGABE         PIC 9(9) COMP-3 VALUE ZERO.
           05 Z-ANZ-OK              PIC 9(9) COMP-3 VALUE ZERO.
           05 Z-ANZ-NOK             PIC 9(9) COMP-3 VALUE ZERO.
           05 Z-ANZ-AUSGABE         PIC 9(9) COMP-3 VALUE ZERO.
           05 Z-POA-XGDV-LEN        PIC S9(6) COMP-3 VALUE ZERO.
           05 Z-RECL-AUSGABE        PIC  9(6) COMP-3 VALUE ZERO.

     R*
     R*     05  Z-COMMIT-PROGRAMM    PIC  X(008).
     R*     05  Z-COMMIT-FUNKTION    PIC  X(008).
      *
      ****************************************************************
      ****************************************************************
       PROCEDURE DIVISION.
      ****************************************************************
      *------------------------------------------------------------*
      * HAUPTSTEUERUNG                                             *
      *------------------------------------------------------------*
      * VERARBEITUNG:                                              *
      *   STEUERUNG VON GRUPPENWECHSEL UND VERARBEITUNG EINER      *
      *      EINGABEDATEI                                          *
      *------------------------------------------------------------*
      *DECLARATIVES.
      *TESTHILFE SECTION.
      *    USE FOR DEBUGGING ON ALL PROCEDURES.
      *    DISPLAY DEBUG-NAME.
      *END DECLARATIVES.

       S-HAUPTSTEUERUNG SECTION.

           PERFORM V0-VORLAUF
           PERFORM E0-LESEN

           PERFORM WITH TEST BEFORE    UNTIL S-NZ  NOT = K-ZUSTAND-OK

      *       * FÜLLEN GRUPPENBEZOGENE STEUERFELDER
              MOVE S-NEU                        TO S-ALT

    G1*       PERFORM V1-VORLAUF
    G1*       PERFORM WITH TEST BEFORE       UNTIL S-NG1 NOT = S-AG1

    G2*          MOVE S-NEU                     TO S-ALT
    G2*          PERFORM V2-VORLAUF

    G2*          PERFORM WITH TEST BEFORE    UNTIL S-NG2 NOT = S-AG2
                       PERFORM SB-BEARBEITUNG
    G2*          END-PERFORM

    G2*          PERFORM N2-NACHLAUF

    G1*       END-PERFORM
    G1*       PERFORM N1-NACHLAUF

           END-PERFORM

           PERFORM N0-NACHLAUF
           STOP RUN
           .
       S-EXIT.
           EXIT.

      *------------------------------------------------------
       V0-VORLAUF SECTION.
      *------------------------------------------------------
      * INPUT: -                                            -
      *------------------------------------------------------
      *    * VORBELEGUNGEN GRUPPENSTEUERFELDER
           MOVE K-ZUSTAND-OK           TO S-NZ

           DISPLAY '  ============================================='
           DISPLAY ' '
           ACCEPT  VORLAUFKARTE
           DISPLAY '  VLK: ' VORLAUFKARTE
           DISPLAY ' '
           DISPLAY '  ---------------------------------------------'
           DISPLAY ' '

           IF VLK-PGM = K-PGM-NAME
              CONTINUE
           ELSE
              MOVE 'VLK-PROGRAMM UNGUELTIG' TO ERR-VAR-ZEILE01
              MOVE VLK-PGM                  TO ERR-VAR-ZEILE02
              MOVE K-1                      TO ERR-ORT-LFD
              PERFORM BR93-PROG-FEHLER
              PERFORM U01-ABBRUCH
           END-IF

           EVALUATE TRUE
100816     WHEN VLK-KENNZEICHEN-ALLE
           WHEN VLK-KENNZEICHEN-FOLGE
                CONTINUE
           WHEN OTHER
              MOVE 'VLK-KENNZEICHEN UNG.  ' TO ERR-VAR-ZEILE01
              MOVE VLK-KENNZEICHEN          TO ERR-VAR-ZEILE02
              MOVE K-2                      TO ERR-ORT-LFD
              PERFORM BR93-PROG-FEHLER
              PERFORM U01-ABBRUCH
           END-EVALUATE

      *    * VORBELEGUNG ARBEITSVARIABLEN
      *    INITIALIZE                  ...
           OPEN INPUT EINGABE-DATEI
           IF NOT S-EINGABE-OK
              MOVE 'V0  '                TO ERR-ORT-SEC
              MOVE K-3                   TO ERR-ORT-LFD
              MOVE 'FEHLER BEIM OEFFNEN EINGABE'
                                         TO ERR-VAR-ZEILE01
              MOVE S-EINGABE-STATUS      TO S-DATEI-STATUS
              PERFORM BR94-DATEI-FEHLER
              PERFORM U01-ABBRUCH
           END-IF
      *
           OPEN OUTPUT AUSGABE-DATEI
           IF NOT S-AUSGABE-OK
              MOVE 'V0  '                TO ERR-ORT-SEC
              MOVE K-4                   TO ERR-ORT-LFD
              MOVE 'FEHLER BEIM OEFFNEN AUSGABE'
                                         TO ERR-VAR-ZEILE01
              MOVE S-AUSGABE-STATUS      TO S-DATEI-STATUS
              PERFORM BR94-DATEI-FEHLER
              PERFORM U01-ABBRUCH
           END-IF

      *    * ERMITTELN TAGESDATUM
           PERFORM U08-TAGESDATUM

      *    * AUSGABE KOPF
           PERFORM V01-AUSGABE-KOPF
      *
      *    * VORBELEGUNG STANDARD-STATUS-BEREICH
      *    * (WIRD AUCH FÜR DAS RESTART-MODUL BENÖTIGT)
           INITIALIZE STANDARD-STATUS-BEREICH
           MOVE K-PGM-NAME           TO STAT-KENNUNG
           SET STAT-BATCH            TO TRUE
      *
     R*     PERFORM BR81-RESTARTPGM-ANMELDEN
           .
       V0-EXIT.
           EXIT.

      *
      *------------------------------------------------------
       V01-AUSGABE-KOPF SECTION.
      *------------------------------------------------------
      * INPUT: -                                            -
      *------------------------------------------------------
           DISPLAY ' '
           DISPLAY '  < KORREKTUR AMV FILETRANSFERDATEI > '
           DISPLAY ' '
           DISPLAY '  PGM PMAN0099                        '
           DISPLAY ' '
           DISPLAY ' '
           DISPLAY '  PROGRAMMSTART AM   ' Z-TAGESDATUM-EUR
           DISPLAY '                UM   ' Z-TAGESZEIT-EUR
           DISPLAY '  ---------------------------------------------'
           DISPLAY ' '
           .
       V01-EXIT.
           EXIT.
      *
      *------------------------------------------------------
       E0-LESEN SECTION.
      *------------------------------------------------------
      *  INPUT : -                                          -
      *  OUTPUT: 1. SATZ EINGABEDATEI / EINGABE-CURSOR      -
      *------------------------------------------------------
      *    < # Z.B. ÖFFNEN CURSOR >
     R*     IF NOT BR-Z-RC-OK
     R*        PERFORM E0-RESTART-LESEN
     R*     ELSE
              SET FOLGESATZ-NICHT-SCHREIBEN TO TRUE

              PERFORM E1-EINGABE
     R*     END-IF
           .
       E0-EXIT.
           EXIT.

      *
      *------------------------------------------------------
     R* E0-RESTART-LESEN SECTION.
      *------------------------------------------------------
      *  INPUT : BR-Z-JOBNAME                               -
      *          K-PGM-NAME                                 -
      *          BR-Z-LAUFENDE-NR                           -
      *  OUTPUT: BR-Z-RC (OK)                               -
      *          BR-Z-RESTARTINFO                           -
      *  VERARBEITUNG:                                      -
      *          RESTARTINFORMATIONEN LESEN, FALLS RESTART  -
      *          ERFOLGEN SOLL, D.H. BR-Z-RC NOT= K-RC-OK   -
      *                                                     -
      *          BEI UNKONTROLLIERTEM ABBRUCH AUSGABE DES   -
      *          LETZTEN PROTOKOLLS                         -
      *------------------------------------------------------
     R*     PERFORM BR84-RESTARTINFO-LESEN
     R*
      ***  FALLS WEITERE RESTARTINFO-COPIES DEFINIERT WURDEN ...
      *    MOVE BR-Z-RESTARTINFO TO RESTARTDATEN DES DRSSNNNN-COPIES-1
      *    ADD K-1   TO BR-Z-LAUFENDE-NR
      *    PERFORM BR84-RESTARTINFO-LESEN
      *    MOVE BR-Z-RESTARTINFO TO RESTARTDATEN DES DRSSNNNN-COPIES-2
      ***  ETC.
      *
     R*     IF BR81-Z-RC-UNK-PGMABBRUCH
      *       ÜBERTRAGEN DER ZÄHLER
     R*        MOVE DRSSNNNN-ANZ-...           TO Z-ANZ-...
     R*        PERFORM N08-PROTOKOLL
      *
      *       ZURÜCKSETZEN DER ZÄHLER AUF NULL
     R*        MOVE ZERO                       TO Z-ANZ-...
     R*     END-IF
     R*
     R*     .
     R* E0-RESTART-LESEN-EXIT.
     R*     EXIT.

      *----------------------------------------------------------
       E1-EINGABE SECTION.
      *----------------------------------------------------------
      * INPUT : -                                               -
      * OUTPUT: (NÄCHSTER) SATZ EINGABEDATEI / EINGABE-CURSOR,  -
      *         S-NZ (ZUSTAND)                                  -
      *----------------------------------------------------------
      *    < # Z. B. FETCH CURSOR >

           INITIALIZE EINGABE-SATZ
           READ EINGABE-DATEI
           EVALUATE TRUE
           WHEN S-EINGABE-OK

              MOVE K-ZUSTAND-OK          TO S-NZ

              ADD K-1                    TO Z-ANZ-EINGABE

           WHEN S-EINGABE-EOF

              MOVE K-ZUSTAND-EOF         TO S-NZ

           WHEN OTHER
              MOVE 'E1   '
                TO ERR-ORT-SEC
              MOVE K-5                   TO ERR-ORT-LFD
              MOVE S-EINGABE-STATUS
                TO S-DATEI-STATUS
              PERFORM BR94-DATEI-FEHLER
              PERFORM U01-ABBRUCH
           END-EVALUATE


      * PLAUSI: AUFSTEIGENDE SORTIERUNG DES GRUPPENWECHSELBEGRIFFS
           IF S-NEU < S-ALT
              MOVE 'E1   '               TO ERR-ORT-SEC
              MOVE K-6                   TO ERR-ORT-LFD
              MOVE 'SORTIERFEHLER BEI DEN STEUERDATEN !!!'
                                         TO ERR-VAR-ZEILE01
              PERFORM BR93-PROG-FEHLER
              PERFORM U01-ABBRUCH
           END-IF
           .
       E1-EXIT.
           EXIT.

      *------------------------------------------------------
       N0-NACHLAUF SECTION.
      *------------------------------------------------------
           PERFORM N08-PROTOKOLL
           PERFORM N09-AUSGABE-FUSS

           CLOSE EINGABE-DATEI
           IF NOT S-EINGABE-OK
              MOVE 'N0  '                TO ERR-ORT-SEC
              MOVE K-7                   TO ERR-ORT-LFD
              MOVE 'FEHLER BEIM CLOSE EINGABE'
                                         TO ERR-VAR-ZEILE01
              MOVE S-EINGABE-STATUS      TO S-DATEI-STATUS
              PERFORM BR94-DATEI-FEHLER
              PERFORM U01-ABBRUCH
           END-IF

           CLOSE AUSGABE-DATEI
           IF NOT S-AUSGABE-OK
              MOVE 'N0  '                TO ERR-ORT-SEC
              MOVE K-8                   TO ERR-ORT-LFD
              MOVE 'FEHLER BEIM CLOSE AUSGABE'
                                         TO ERR-VAR-ZEILE01
              MOVE S-EINGABE-STATUS      TO S-DATEI-STATUS
              PERFORM BR94-DATEI-FEHLER
              PERFORM U01-ABBRUCH
           END-IF

     R*     IF BR-Z-PROGRAMM-BEENDEN = K-JA
     R*        MOVE K-8 TO RETURN-CODE
     R*     ELSE
     R*        PERFORM BR82-RESTARTPROGRAMM-ABMELDEN
     R*     END-IF
           .
       N0-EXIT.
           EXIT.
      *------------------------------------------------------
       N08-PROTOKOLL SECTION.
      *------------------------------------------------------
      * INPUT: -                                            -
      *------------------------------------------------------
           DISPLAY '  PROTOKOLL                '

           DISPLAY ' '
           MOVE Z-ANZ-EINGABE      TO D-ANZ-EINGABE
           DISPLAY '  ANZAHL EINGABESÄTZE               : '
           D-ANZ-EINGABE
           MOVE Z-ANZ-OK           TO D-ANZ-OK
           DISPLAY '  DAVON  OK                         : '
           D-ANZ-OK
           MOVE Z-ANZ-NOK          TO D-ANZ-NOK
           DISPLAY '  DAVON  NOK                        : '
           D-ANZ-NOK
           MOVE Z-ANZ-AUSGABE      TO D-ANZ-AUSGABE
           DISPLAY '  ANZAHL AUSGABESÄTZE               : '
           D-ANZ-AUSGABE
           .
       N08-EXIT.
           EXIT.

      *------------------------------------------------------
       N09-AUSGABE-FUSS SECTION.
      *------------------------------------------------------
      * INPUT: -                                            -
      *------------------------------------------------------
           DISPLAY ' '
           DISPLAY '  ENDE PGM PMAN0099'
           DISPLAY '  ============================================== '
           DISPLAY ' '
           .
       N09-EXIT.
           EXIT.


    G1*-------------------------------------------------------
    G1* V1-VORLAUF SECTION.
    G1*-------------------------------------------------------
    G1* INPUT :
    G1* OUTPUT:
    G1* VERARBEITUNG:
    G1*
    G1*-------------------------------------------------------
    G1*
    G1*    .
    G1* V1-EXIT.
    G1*    EXIT.

    G1*-------------------------------------------------------
    G1* N1-NACHLAUF SECTION.
    G1*-------------------------------------------------------
    G1* INPUT :
    G1* OUTPUT:
    G1* VERARBEITUNG:
    G1*
    G1*-------------------------------------------------------
    G1*
     R*     ADD K-1 TO BR-Z-ANZ-VERARB-SAETZE
     R*     IF BR-Z-ANZ-VERARB-SAETZE = BR-Z-COMMITHAEUFIGKEIT
     R*        PERFORM N1-RESTART-NACHLAUF
     R*     END-IF
    G1*    .
    G1* N1-EXIT.
    G1*    EXIT.
      *
      *-------------------------------------------------------
     R* N1-RESTART-NACHLAUF SECTION.
      *-------------------------------------------------------
      * INPUT : BR-Z-JOBNAME                                 -
      *         K-PGM-NAME                                   -
      * OUTPUT: BR-Z-RC (OK)                                 -
      *         BR-Z-COMMITHAEUFIGKEIT                       -
      *         BR-Z-PROGRAMM-BEENDEN                        -
      *         BR-Z-ANZ-VERARB-SAETZE                       -
      * VERARBEITUNG:                                        -
      *         BR-Z-COMMITPOINT-NUMMER UM EINS ERHOEHEN.    -
      *         BR-Z-COMMITHAEUFIGKEITS-WERT AKTUALISIEREN.  -
      *         BR-Z-PROGRAMM-BEENDEN-WERT AKTUALISIEREN.    -
      *         RESTARTINFORMATIONEN SCHREIBEN.              -
      *         ABFRAGE AUF PROGRAMM BEENDEN                 -
      *         COMMIT AUSFUEHREN.                           -
      * VORRAUSETZUNG:                                       -
      *         AKTUELLE RESTART-DATEN MUESSEN VORHER ER-    -
      *         MITTELT UND AUF DIE                          -
      *         COPY-STRECKEN-FELDER UEBERTRAGEN WORDEN SEIN;-
      *         WIE Z.B.:                                    -
      *         MOVE KEY-AKTUELL TO RESTARTDATEN             -
      *                          DES DRSSNNNN-COPIES-1.
      *-------------------------------------------------------
     R*     PERFORM BR83-VERARBEITUNGSBLOCK-ABMELD


     R*     MOVE K-1 TO BR-Z-LAUFENDE-NR
     R*     MOVE RESTARTDATEN D. DRSSNNNN-COPIES-1 TO BR-Z-RESTARTINFO
     R*     PERFORM BR85-RESTARTINFO-SCHREIBEN
     R*
      ***  FALLS WEITERE RESTART-COPIES DEFINIERT WURDEN ...
     R*     ADD 1   TO BR-Z-LAUFENDE-NR
     R*     MOVE RESTARTDATEN D. DRSSNNNN-COPIES-2 TO BR-Z-RESTARTINFO
     R*     PERFORM BR85-RESTARTINFO-SCHREIBEN
      ***  ETC.


      ***  SOLL DIE VERARBEITUNG BEENDET WERDEN ?
      ***  (STEUERUNGSMÖGLICHKEIT FÜR DAS OPERATING)
     R*     IF BR-Z-PROGRAMM-BEENDEN = K-JA
     R*        MOVE K-ZUSTAND-EOF   TO S-NZ
      ***     COMMIT ERFOLGT AM TASKENDE
     R*
     R*     ELSE
      ***     DIE VERARBEITUNG LÄUFT NORMAL WEITER
     R*
      * ----> ZUNÄCHST COMMIT AUF DIE EINZELNEN DATEIEN
     R*        IF PI-DRPANNNN-UFKT = K-INSERT-DATEI
     R*          SET  PI-ZTPANNNN-DRAT0228-COM TO TRUE
     R*          MOVE PI-ZTPANNNN-FUNKTION TO Z-COMMIT-FUNKTION
     R*          MOVE BR-Z-COMMITPOINT-NR  TO PI-DRAT0228-COMMIT-POINT-NR
     R*          MOVE K-ZTPANNNN           TO Z-COMMIT-PROGRAMM
     R*          PERFORM QSAM-COMMIT
     R*        END-IF
     R*
     R*        PERFORM SQL-COMMIT
     R*     END-IF


     R*     MOVE ZERO TO BR-Z-ANZ-VERARB-SAETZE
     R*     .
     R* N1-RESTART-NACHLAUF-EXIT.
     R*     EXIT.
     R*
    G2*-------------------------------------------------------
    G2* V2-VORLAUF SECTION.
    G2*-------------------------------------------------------
    G2* INPUT :
    G2* OUTPUT:
    G2* VERARBEITUNG:
    G2*
    G2*-------------------------------------------------------
    G2*
    G2*    .
    G2* V2-EXIT.
    G2*    EXIT.

    G2*-------------------------------------------------------
    G2* N2-NACHLAUF SECTION.
    G2*-------------------------------------------------------
    G2* INPUT :
    G2* OUTPUT:
    G2* VERARBEITUNG:
    G2*
    G2*-------------------------------------------------------
    G2*
    G2*    .
    G2* N2-EXIT.
    G2*    EXIT.

      *------------------------------------------------------
       SB-BEARBEITUNG SECTION.
      *------------------------------------------------------
           PERFORM B1-BEARBEITUNG
           PERFORM E1-EINGABE
           .
       SB-EXIT.
           EXIT.

      *--------------------------------------------------------------
       B1-BEARBEITUNG SECTION.
      *-------------------------------------------------------------*
      *  INPUT :                                                    *
      *  OUTPUT:                                                    *
      *  VERARBEITUNG:                                              *
      *-------------------------------------------------------------*

           EVALUATE TRUE
100816*>>>>>
           WHEN VLK-KENNZEICHEN-ALLE
                PERFORM U18-BLACK-BOX-KORREKTUR
                PERFORM U11-AUSGABE-SCHREIBEN
100816*<<<<<
           WHEN VLK-KENNZEICHEN-FOLGE AND FOLGESATZ-SCHREIBEN
                PERFORM U10-XGDV-LAENGE-ERMITTELN
                INITIALIZE AUSGABE-SATZ
                MOVE EINGABE-SATZ TO AUSGABE-SATZ
                DISPLAY '  FOLGEVORSCHLAG ZU SCHREIBEN       : '
                POA-FT-DVAG-AMV-HVANTNUM IN EINGABE-SATZ

                MOVE 196 TO Z-RECL-AUSGABE
                ADD Z-POA-XGDV-LEN TO Z-RECL-AUSGABE
                EVALUATE TRUE
                WHEN ENDEKENNZEICHEN
                     CONTINUE
                WHEN OTHER
                     MOVE 'N$'
                       TO POA-FT-DVAG-AMV-XGDV
                       IN AUSGABE-SATZ(Z-POA-XGDV-LEN + K-1:K-2)
                      ADD K-2 TO Z-RECL-AUSGABE
                END-EVALUATE
                PERFORM U11-AUSGABE-SCHREIBEN
                SET FOLGESATZ-NICHT-SCHREIBEN TO TRUE
                PERFORM U10-XGDV-LAENGE-ERMITTELN

                EVALUATE TRUE
                WHEN ENDEKENNZEICHEN
                     ADD K-1 TO Z-ANZ-OK
                WHEN OTHER
                     ADD K-1 TO Z-ANZ-NOK
                     SET FOLGESATZ-SCHREIBEN TO TRUE
                     DISPLAY '  FEHLERHAFTER VORSCHLAG            : '
                     POA-FT-DVAG-AMV-HVANTNUM IN EINGABE-SATZ

                END-EVALUATE

           WHEN OTHER
                CONTINUE
           END-EVALUATE

           .
       B1-EXIT.
           EXIT.

      *----------------------------------------------------------
       U01-ABBRUCH SECTION.
      *----------------------------------------------------------
      * AUFRUF DER STANDARD-ABBRUCHROUTINE 'ILBOABN0' FÜR DEN
      * PROGRAMMIERTEN VERARBEITUNGSABBRUCH
      * - ALLE NOCH OFFENEN DATEIEN WERDEN GESCHLOSSEN
      * - STANDARDMÄßIG WIRD KEIN DUMP ERZEUGT
      * - RC K-COMP-CODE (3501) WIRD AN DAS JOB-PROTOKOLL ÜBERGEBEN
      * *******
      * ACHTUNG: IN DER ROUTINE 'ILBOABN0' WIRD DAS PGM. BEENDET!
      * *******
      *----------------------------------------------------------
           PERFORM U09-ROLLBACK
           PERFORM N08-PROTOKOLL
           PERFORM N09-AUSGABE-FUSS
           CALL 'ILBOABN0'  USING K-COMP-CODE
           .
       U01-EXIT.
           EXIT.
      *
      *----------------------------------------------------------
       U08-TAGESDATUM SECTION.
      *----------------------------------------------------------
           PERFORM SQL-SEL-TAGESDATUM
           IF SQLCODE NOT = KS-OK
              MOVE 'U08  '               TO ERR-ORT-SEC
              MOVE K-9                   TO ERR-ORT-LFD
              PERFORM BR91-SQL-FEHLER
              PERFORM U01-ABBRUCH
           END-IF
           .
       U08-EXIT.
           EXIT.

      *----------------------------------------------------------
       U09-ROLLBACK SECTION.
      *----------------------------------------------------------
           PERFORM SQL-ROLLBACK
           IF SQLCODE NOT = KS-OK
              MOVE 'U09  '               TO ERR-ORT-SEC
              MOVE K-10                  TO ERR-ORT-LFD
              PERFORM BR91-SQL-FEHLER
           ELSE
              DISPLAY '  ===>  ROLLBACK AUSGEFÜHRT <==='
           END-IF
           .
       U09-EXIT.
           EXIT.

      *-------------------------------------------------------------
       U10-XGDV-LAENGE-ERMITTELN SECTION.
      *-------------------------------------------------------------
      * INPUT:  POA-FT-DVAG-AMV-XGDV IN EINGABE-SATZ               *
      * OUTPUT: Z-POA-XGDV-LEN S-LETZTES-ZEICHEN                   *
      *                                                            *
      * VERARB: ERMITTELN LAENGE DES XGDV-SATZES + LETZTES ZEICHEN *
      *------------------------------------------------------------*
      *

           MOVE K-ZERO TO Z-POA-XGDV-LEN
           PERFORM  WITH TEST AFTER
              VARYING  I-INDEX1 FROM K-XGDV-MAX-LAENGE BY -1
              UNTIL I-INDEX1 = 1
                 OR (POA-FT-DVAG-AMV-XGDV
                     IN EINGABE-SATZ(I-INDEX1:1) NOT = SPACE AND
                                                 NOT = LOW-VALUE)
                    IF POA-FT-DVAG-AMV-XGDV
                       IN EINGABE-SATZ(I-INDEX1:1) NOT = SPACE AND
                                                   NOT = LOW-VALUE
                       MOVE I-INDEX1 TO Z-POA-XGDV-LEN
                       MOVE POA-FT-DVAG-AMV-XGDV
                         IN EINGABE-SATZ(I-INDEX1:1)
                         TO S-LETZTES-ZEICHEN
                    END-IF

           END-PERFORM

           .
       AAA-EXIT.
           EXIT.

      *----------------------------------------------------------
       U11-AUSGABE-SCHREIBEN SECTION.
      *----------------------------------------------------------
      * INPUT : AUSGABE-SATZ                                    -
      * OUTPUT:                                                 -
      *                                                         -
      *----------------------------------------------------------
      *    < # Z. B. FETCH CURSOR >

           MOVE 'U11  ' TO ERR-ORT-SEC

           WRITE AUSGABE-SATZ
           EVALUATE TRUE
           WHEN S-AUSGABE-OK

              ADD K-1                    TO Z-ANZ-AUSGABE

           WHEN OTHER
              MOVE K-11                  TO ERR-ORT-LFD
              MOVE S-AUSGABE-STATUS
                TO S-DATEI-STATUS
              PERFORM BR94-DATEI-FEHLER
              PERFORM U01-ABBRUCH
           END-EVALUATE
           .
       AAA-EXIT.
           EXIT.
100816*>>>>>
      *----------------------------------------------------------
       U18-BLACK-BOX-KORREKTUR SECTION.
      *-------------------------------------------------------------
      * INPUT:  EINGABE-SATZ                                       *
      * OUTPUT: AUSGABE-SATZ, Z-RECL-AUSGABE                       *
      *                                                            *
      * VERARB: ENTFERNEN ZEICHEN NACH BEGRENZER ENDE $            *
      *------------------------------------------------------------*
      *

           MOVE K-196                   TO Z-RECL-AUSGABE
           SET BEGRENZER-NICHT-GEFUNDEN TO TRUE
           MOVE EINGABE-SATZ            TO AUSGABE-SATZ

           MOVE K-1 TO I-INDEX1
           PERFORM  WITH TEST AFTER
              VARYING  I-INDEX1 FROM K-2 BY K-1
              UNTIL I-INDEX1 >= 25000
                 OR BEGRENZER-GEFUNDEN
                    IF POA-FT-DVAG-AMV-XGDV
                       IN EINGABE-SATZ(I-INDEX1:1) =
                       K-BEGRENZER-BLACK-BOX
                       SET BEGRENZER-GEFUNDEN TO TRUE
                       INITIALIZE POA-FT-DVAG-AMV-XGDV IN AUSGABE-SATZ

                       MOVE POA-FT-DVAG-AMV-XGDV
                         IN EINGABE-SATZ(K-1:I-INDEX1)
                         TO POA-FT-DVAG-AMV-XGDV
                         IN AUSGABE-SATZ(K-1:I-INDEX1)

                       MOVE I-INDEX1      TO Z-POA-XGDV-LEN
                       ADD Z-POA-XGDV-LEN TO Z-RECL-AUSGABE

                       ADD K-1            TO Z-ANZ-OK

                    END-IF

           END-PERFORM

           EVALUATE TRUE
           WHEN BEGRENZER-NICHT-GEFUNDEN
                ADD K-1 TO Z-ANZ-NOK
                SET FOLGESATZ-SCHREIBEN TO TRUE
                DISPLAY '  FEHLERHAFTER VORSCHLAG OHNE BEGRENZER : '
                POA-FT-DVAG-AMV-HVANTNUM IN EINGABE-SATZ
           WHEN OTHER
                CONTINUE
           END-EVALUATE

           .
       AAA-9000.
           EXIT.
100816*<<<<<
      ***********************************************************
      *    ALLE SQL-STATEMENTS (AUSSER DECLARE CURSOR)          *
      ***********************************************************


      *----------------------------------------------------------
       SQL-SEL-TAGESDATUM SECTION.
      *----------------------------------------------------------
           EXEC SQL
                VALUES
                   (
                     CHAR(DATE(CURRENT DATE), EUR)
                   , CHAR(TIME(CURRENT TIME), EUR)
                   , CHAR(DATE(CURRENT DATE), ISO)
                   )
                INTO
                     :Z-TAGESDATUM-EUR
                   , :Z-TAGESZEIT-EUR
                   , :Z-TAGESDATUM-ISO
           END-EXEC

           IF SQLCODE NOT = KS-OK
              MOVE 'FEHLER BEI TAGESDATUM-ZEIT'  TO ERR-VAR-ZEILE01
              MOVE SQLCODE                       TO ERR-VAR-ZEILE02
              MOVE K-12                          TO ERR-ORT-LFD
              PERFORM BR93-PROG-FEHLER
              PERFORM U01-ABBRUCH
           END-IF
           .
       SQL-SEL-TAGESDATUM-EXIT.
           EXIT.

      *----------------------------------------------------------
       SQL-ROLLBACK SECTION.
      *----------------------------------------------------------
           EXEC SQL
                ROLLBACK
           END-EXEC
           .
       SQL-ROLLBACK-EXIT.
           EXIT.

      *----------------------------------------------------------
     R* SQL-COMMIT SECTION.
      *----------------------------------------------------------
     R*     EXEC SQL
     R*          COMMIT
     R*     END-EXEC
     R*     .
     R* SQL-COMMIT-EXIT.
     R*     EXIT.
     R*
      *------------------------------------------------------------*
      * QSAM-COMMIT                                                *
      *------------------------------------------------------------*
      * COMMIT-POINTS BEI DATEIEN SETZEN                           *
      *                                                            *
      *------------------------------------------------------------*
     R* QSAM-COMMIT SECTION.
     R*
     R*     CALL Z-COMMIT-PROGRAMM USING BY REFERENCE
     R*                                        Z-COMMIT-FUNKTION
     R*                                        PI-DRAT0228
     R*                                        PO-DRAT0228
     R*                                        ERR-ERROR-BEREICH
     R*                                        STANDARD-STATUS-BEREICH
     R*     END-CALL
     R*
     R*     IF ERR-RC-OK
     R*        EVALUATE TRUE
     R*        WHEN PO-DRAT0228-RC-OK
     R*             CONTINUE
     R*        WHEN OTHER
     R*             MOVE Z-COMMIT-PROGRAMM     TO ERR-VAR-ZEILE01
     R*             MOVE '/'                   TO ERR-VAR-ZEILE01(09:01)
     R*             MOVE Z-COMMIT-FUNKTION     TO ERR-VAR-ZEILE01(10:08)
     R*             MOVE ': RETURNCODE UNGUELTIG'
     R*                                        TO ERR-VAR-ZEILE01(18:22)
     R*             MOVE PO-DRAT0228-RC        TO ERR-VAR-ZEILE02
     R*             MOVE K-99                  TO ERR-ORT-LFD
     R*             PERFORM BR93-PROG-FEHLER
     R*             PERFORM U01-ABBRUCH
     R*        END-EVALUATE
     R*     ELSE
     R*        PERFORM BR99-SCHWERER-FEHLER-DISPLAY
     R*        PERFORM U01-ABBRUCH
     R*     END-IF
     R*
     R*     .
     R* QSAM-COMMIT-EXIT.
     R*     EXIT.
      *>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>*
      *  BATCHRAHMEN: FEHLERAUFBEREITUNG UND -AUSGABE (DISPLAYS),  *
      *               RESTART                                      *
      *>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>*
      *------------------------------------------------------------*
      * BENÖTIGT:  FUER RESTART                                    *
      *                                                            *
      *                                                            *
      * BR81-RESTARTPROGRAMM-ANMELDEN                              *
      * INPUT : MUSS: BR-Z-JOBNAME                                 *
      *               K-PGM-NAME                                   *
      *         KANN:                                              *
      * OUTPUT      : BR-Z-RC (OK,                                 *
      *                        UPA=UNKONTROLLIERTER PGM-ABBRUCH,   *
      *                        KPA=KONTROLLIERTER PGM-ABBRUCH)     *
      *               BR-Z-COMMITPOINT-NR                          *
      *               BR-Z-COMMITFREQUENZ                          *
      *                                                            *
      * BR82-RESTARTPROGRAMM-ABMELDEN                              *
      * INPUT : MUSS: BR-Z-JOBNAME                                 *
      *               K-PGM-NAME                                   *
      *         KANN:                                              *
      * OUTPUT      : BR-Z-RC (OK)                                 *
      *                                                            *
      * BR83-VERARBEITUNGSBLOCK ABMELDEN:                          *
      *      DER VERARBEITUNGSBLOCK WIRD NACH ERFOLGREICHER        *
      *      BEARBEITUNG FUER DEN COMMIT(=LOESCHEN DER LOG-SAETZE, *
      *      DIE ZUM NACHFUEHREN DER DATEN ANGELEGT WURDEN)        *
      *      VORBEREITET                                           *
      * INPUT : MUSS: BR-Z-JOBNAME                                 *
      *               K-PGM-NAME                                   *
      *         KANN:                                              *
      * OUTPUT      : BR-Z-RC (OK)                                 *
      *               BR-Z-COMMITPOINT-NR                          *
      *               BR-Z-COMMITHAEUFIGKEIT                       *
      *               BR-Z-PROGRAMM-BEENDEN                        *
      *                                                            *
      * BR84-RESTARTINFORMATION LESEN                              *
      * INPUT : MUSS: BR-Z-JOBNAME                                 *
      *               K-PGM-NAME                                   *
      *               BR-Z-LAUFENDE-NR                             *
      *         KANN:                                              *
      * OUTPUT      : BR-Z-RC (OK)                                 *
      *               BR-Z-RESTARTINFO                             *
      *                                                            *
      * BR85-RESTARTINFORMATIONEN SCHREIBEN                        *
      * INPUT : MUSS: BR-Z-JOBNAME                                 *
      *               K-PGM-NAME                                   *
      *               BR-Z-LAUFENDE-NR                             *
      *               BR-Z-RESTARTINFO                             *
      *         KANN:                                              *
      * OUTPUT      : BR-Z-RC (OK)                                 *
      *------------------------------------------------------------*
     R* COPY DPAT0052.

      *------------------------------------------------------------*
      * BR91-SQL-FEHLER   --  SQL-FEHLER-BEHANDLUNG                *
      * INPUT : MUSS: K-PGM-NAME, SQLCODE, SQLERRMC, SQLERRML      *
      *         KANN: ERR-ORT-SEC, ERR-ORT-LFD, ERR-VAR-ZEILE01 -04*
      * BENÖTIGT: BEI DB2-ZUGRIFFEN                                *
      *------------------------------------------------------------*
       COPY DPAT0034.

      *------------------------------------------------------------*
      * BR93-PROG-FEHLER  --  PROGRAMM-/LOGIK-FEHLER BEHANDLUNG    *
      * INPUT : MUSS: K-PGM-NAME                                   *
      *         KANN: ERR-ORT-SEC, ERR-ORT-LFD, ERR-VAR-ZEILE01 -04*
      * BENÖTIGT: IMMER                                            *
      *------------------------------------------------------------*
       COPY DPAT0035.

      *------------------------------------------------------------*
      * BR94-DATEI-FEHLER --  DATEI-FEHLER-BEHANDLUNG              *
      * INPUT : MUSS: S-DATEI-STATUS, K-PGM-NAME                   *
      *         KANN: ERR-ORT-SEC, ERR-ORT-LFD, ERR-VAR-ZEILE01 -04*
      * BENÖTIGT: BEI DATEI-ZUGRIFFEN                              *
      *------------------------------------------------------------*
       COPY DPAT0036.

      *------------------------------------------------------------*
      * BR95-DB2S-FEHLER  --  DB2-SCHREIBMODUL-FEHLER BEHANDLUNG   *
      * INPUT : MUSS: K-PGM-NAME, PARAMETER-STEUER,PARAMETER-RETURN*
      *         KANN: ERR-ORT-SEC, ERR-ORT-LFD, ERR-VAR-ZEILE01 -04*
      * BENÖTIGT: BEI DB2-UPDATES/-INSERTS                         *
      *------------------------------------------------------------*
      *COPY DPAT0037.

      *------------------------------------------------------------*
      * BR99-SCHWERER-FEHLER-DISPLAY  --  FEHLER-AUFBEREITUNG      *
      * UR82-D-ERR-DISPLAY                UND -AUSGABE             *
      * INPUT   : ERR-ERROR-BEREICH                                *
      * BENÖTIGT: IMMER                                            *
      *------------------------------------------------------------*
       COPY DPAT0038.

      *------------------------------------------------------------*
      * UR81-ERR-AUFBER   --  FEHLER-AUFBEREITUNG                  *
      * INPUT   : ERR-ERROR-BEREICH                                *
      * BENÖTIGT: IMMER                                            *
      *------------------------------------------------------------*
       COPY DPAT0039.

      *>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>*
      *  ENDE BATCHRAHMEN: FEHLERAUFBEREITUNG UND -AUSGABE         *
      *>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>*

      *--------------------- ENDE PMSSNNN -------------------------*



