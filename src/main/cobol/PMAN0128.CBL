       IDENTIFICATION DIVISION.
       PROGRAM-ID.    PMAN0128.
      *****************************************************************
      * LOGBUCH:
      * AUFTRAG    ! DATUM  ! AENDERUNG                    ! NAME
      * --------------------------------------------------------------*
      * ANTRAG-2071!28.04.23! NEU ÜBERFÜHRT AUS UU432      ! RAHNER
      *            !        !                              !
      *            !        !                              !
      *
      * ENDE-LOGBUCH
      *****************************************************************
      *****************************************************************
      *
      *   PFLEGEPROGRAMM FÜR DIE NEUE DIREKTIONEN-DATEI
      *   UU009900. PER VORLAUFKARTE.
      *   (ÜBERFÜHRT AUS PROGRAMM UU432)
      *
      *    VERARBEITUNGSMERKMALE:
      *    DIE ERSTE VORLAUFKARTE WIRD GELESEN UND GEPRÜFT.
      *    DER ZUGEHOERIGE DIREKTIONENSATZ WIRD IN DATEI UU0099
      *    EINGETRAGEN ODER EIN BESTEHENDER EINTRAG ERFÄHRT EIN UPDATE.
      *    ANSCHLIESSEND WIRD DIE NAECHSTE VORLAUFKARTE
      *    GELESEN UND VERARBEITET ETC.
      *
      *
      *   <N?> GRUPPENWECHSEL
      *
      *****************************************************************
      *****************************************************************
      *
      *   --------->  B A T C H - N O R M R A H M E N  <-----------
      *   --------->        N GRUPPENWECHSEL           <-----------
      *   --------->        1 EINGABEDATEI             <-----------
      *
      *   DIESES PROGRAMM WURDE MIT EINEM BATCH-NORMRAHMEN ERSTELLT.
      *   DER RAHMEN IST FÜR DIE BEARBEITUNG MEHRERER GRUPPENWECHSEL
      *   UND EINER EINGABEDATEI / EINES EINGABE-CURSORS KONZIPIERT.
      *
      *   DIESER RAHMEN ENTHÄLT EINE RESTART-VERWALTUNG.
      *
      *                       *************
      *                       *  ACHTUNG  *
      *                       *************
      *       +---------------------------------------------+
      *       !  VORAUSSETZUNGEN FÜR DEN RAHMEN:            !
      *       !  - S-DATEI-STATUS MUSS DEFINIERT SEIN       !
      *       !  - K-PGM-NAME     MUSS ANGELEGT SEIN        !
      *       !  - DIV. COPYS MÜSSEN VORH. SEIN (JEWEILS    !
      *       !       IM KOMMENTAR ZU DEN COPYS ANGEGEBEN)  !
      *       +---------------------------------------------+
      *
      *
      *   ALLGEMEINE VERARBEITUNGSHINWEISE
      *   --------------------------------
      *
      *   - 'PMXX0000' IST DURCH DEN PROGRAMMNAMEN ZU ERSETZEN
      *
      *   - ALLE RELEVANTEN ZEILEN FÜR GRUPPENWECHSEL SIND IN DEN
      *     SPALTEN 5 BIS 7 MARKIERT UND MÜSSEN BEI BEDARF AKTIVIERT
      *     WERDEN:
      *       - MARKIERUNG FÜR EINSTUFIGEN  GRUPPENWECHSEL: 'G1*'
      *       - MARKIERUNG FÜR ZWEISTUFIGEN GRUPPENWECHSEL: 'G2*'
      *
      *   - ALLE RELEVANTEN ZEILEN DER RESTART-VERWALTUNG SIND IN
      *     DEN SPALTEN 6 BIS 7 MARKIERT UND MÜSSEN BEI BEDARF
      *     AKTIVIERT WERDEN:
      *       - MARKIERUNG FÜR RESTART-VERWALTUNG         :  'R*'
      *
      *   - ALLE RELEVANTEN ZEILEN FÜR DIE VORLAGE ZUM AUFRUF VON
      *     UNTERPROGRAMMEN UND OBJEKTZUGRIFFSPROGRAMMEN (OZP) SIND
      *     IN DEN SPALTEN 6 UND 7 MARKIERT UND MÜSSEN BEI BEDARF
      *     AKTIVIERT WERDEN
      *       - MARKIERUNG FÜR AUFRUF UPRO BZW. OZP       :  'X*'
      *
      *   - AM ENDE DER DATEI/CURSOR VERSORGEN VON S-NZ MIT
      *     K-ZUSTAND-EOF. DIE RAHMENSTEUERUNG VERZWEIGT DANN
      *     DIREKT ZU SÄMTLICHEN NACHLAUF-ROUTINEN (N2 N1 N0).
      *
      *
      *   REGELN FÜR FEHLERHANDLING:
      *   -------------------------
      *   - VERWENDUNG DER STANDARD-FEHLER-ROUTINEN ZUR FEHLERAUF-
      *     BEREITUNG UND AUSGABE (BR93, BR94, BR95, BR99)
      *
      *   - NACH DEM AUFRUF VON BR93, BR94, BR95 ODER BR99 MUSS
      *     DIE ROUTINE "U01-ABBRUCH" (=PROGRAMMABBRUCH) AUFGERUFEN
      *     WERDEN. HIER KANN EIN ROLLBACK DURCHGEFÜHRT WERDEN.
      *
      *     *******
      *     ACHTUNG: U01-ABBRUCH BEENDET DAS PROGRAMM !!!
      *     *******
      *
      *****************************************************************
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
               DECIMAL-POINT IS COMMA.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
      *
           SELECT AFILE1 ASSIGN TO UU0099
                  RECORD KEY IS XDIR-NEU
                  ACCESS DYNAMIC
                  ORGANIZATION INDEXED
                  FILE STATUS S-DATEI-STATUS.
       
      *****************************************************************
       DATA DIVISION.
      *****************************************************************
       FILE SECTION.
       
       FD  AFILE1.
       01  AFILE1-REC.
           10 XDIR-NEU           PIC 9(3).
           10 XDIR-ALT           PIC 9(3).
           10 XDATUM             PIC 9(6) PACKED-DECIMAL.
           10 XMANR              PIC 9(7) PACKED-DECIMAL.
       
      *****************************************************************
       WORKING-STORAGE SECTION.
      *****************************************************************
       01 FILLER.
          05 FILLER                      PIC  X(026)
                                         VALUE '** WORKING-STORAGE **'.
      *
      *>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>*
      *  ANFANG DATENFELDER FÜR BATCH-RAHMENSTEUERUNG
      *>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>*
      *---------------------------------------------------------------*
      * ERR-ERROR-BEREICH  -  STANDARD-FEHLER-BEREICH
      * BENÖTIGT: IMMER
      *---------------------------------------------------------------*
        COPY DRAT0004.
      *---------------------------------------------------------------*
      * D-ERROR-BEREICH  -  DRUCKAUFBEREITUNG ERROR-BEREICH
      * BENÖTIGT: IMMER
      *---------------------------------------------------------------*
        COPY DRAT0006.
      *---------------------------------------------------------------*
      * D-DB2S  -  DRUCKAUFBEREITUNG SCHNITTST. DB2-SCHREIBMODUL
      * BENÖTIGT: IMMER
      *---------------------------------------------------------------*
        COPY DRAT0021.
      *---------------------------------------------------------------*
      * PARAMETER-STEUER/-RETURN  -  SCHNITTST. DB2-SCHREIBMODUL
      * BENÖTIGT: IMMER
      *---------------------------------------------------------------*
        COPY DRAT0007.
      *---------------------------------------------------------------*
      * STANDARD-STATUS-BEREICH
      * BENÖTIGT: IMMER
      *---------------------------------------------------------------*
        COPY DRAT0109.
      *>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>*
      *  ENDE DATENFELDER FÜR BATCH-RAHMENSTEUERUNG
      *>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>*
      *
      *>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>*
      *  ANFANG DATENFELDER FÜR ALLGEMEINE ROUTINEN
      *>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>*
      *
      * DATENFELDER FÜR LAUFDATUM
        COPY DWAT0068.
      *
      * DATENFELDER FÜR DB2-BEFEHLE
        COPY DWAT0069.
      *>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>*
      *  ENDE DATENFELDER FÜR ALLGEMEINE ROUTINEN
      *>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>*
       01 DRUCK-BEREICH.
          05 FILLER                      PIC  X(026)
                                         VALUE '** DRUCK-BEREICH **'.
      *
          05 D-ANZ                       PIC  -(009)9.
      *
      *****************************************************************
       01 KONSTANTEN.
          05 FILLER                      PIC  X(026)
                                         VALUE '** KONSTANTEN **'.
      *
          05 K-PGM-NAME                  PIC  X(008) VALUE 'PMAN0128'.
          05 K-UPVB0104                  PIC  X(008) VALUE 'UPVB0104'.
          05 K-ZWVB0001                  PIC  X(008) VALUE 'ZWVB0001'.
          05 K-ZWVB0006                  PIC  X(008) VALUE 'ZWVB0006'.
          05 K-ZWVB0019                  PIC  X(008) VALUE 'ZWVB0019'.
      *
      *   KONSTANTEN FÜR STANDARD-RAHMEN (ZUSTAND)
          05 K-ZUSTAND-OK                PIC  X(001) VALUE '1'.
          05 K-ZUSTAND-EOF               PIC  X(001) VALUE '2'.
      *
      * STANDARD-KONSTANTEN
        COPY DRAT0009.
      *****************************************************************
       01 PARAMETER-BEREICH.
          05 FILLER                      PIC  X(026)
                                         VALUE '** PARAMETER **'.
      *
      ******************************
      * UPVB0104 - FUNKTIONENCOPY
        COPY DRVB0217.
      * FUNKTION - DRVB0303
        COPY DRVB0303.
      ******************************
      *
      ******************************
      * ZWVB0001 - FUNKTIONENCOPY
        COPY DRVB0117.
      * FUNKTION - DRVB0118
        COPY DRVB0118.
      ******************************
      *   
      ******************************
      * ZWVB0006 - FUNKTIONENCOPY
        COPY DRVB0183.
      * FUNKTION - DRVB0202
        COPY DRVB0202.
      ******************************
      *
      ******************************
      * ZWVB0019 - FUNKTIONENCOPY
        COPY DRVB0191.
      * FUNKTION - DRSYNNU2
        COPY DRVB0450.
      ******************************
      *
      *****************************************************************
       01 QSAM-BEREICH.
          05 FILLER                      PIC  X(026)
                                         VALUE '** QSAM-BEREICH **'.
      *
      *****************************************************************
       01 SCHALTER-STEUERFELDER.
          05 FILLER                      PIC  X(026)
                                         VALUE '** SCHALTER **'.
      *   STEUERFELDER GRUPPENWECHSEL
          05 S-NEU.
                   20 S-NZ               PIC  X(001) VALUE SPACE.
      *
          05 S-ALT.
                   20 S-AZ               PIC  X(001) VALUE SPACE.
      *
      *   DATEISTATUS
          05 S-DATEI-STATUS              PIC  X(002) VALUE SPACE.
             88 S-DATEI-STATUS-OK                    VALUE '00'.
             88 S-DATEI-STATUS-EOF                   VALUE '10'.
             88 S-DATEI-STATUS-NOT-FOUND             VALUE '23'.
      *
          05 S-VK-DIR-NR-PRUEFEN         PIC  9(001) VALUE ZERO.
             88 S-VK-DIR-NR-PRUEFEN-OK               VALUE 1.
             88 S-VK-DIR-NR-PRUEFEN-NOK              VALUE 2.
      *
          05 S-VK-VB-NUMMER-PRUEFEN      PIC  9(001) VALUE ZERO.
             88 S-VK-VB-NR-OK                        VALUE 1.
             88 S-VK-VB-NR-NOK                       VALUE 2.

          05 S-D-LEITER-PRUEFEN          PIC  9(001) VALUE ZERO.
             88 S-D-LEITER-PRUEFEN-OK                VALUE 1.
             88 S-D-LEITER-PRUEFEN-NOK               VALUE 2.
      *
      *****************************************************************
       01 TABELLEN-BEREICH.
          05 FILLER                      PIC  X(026)
                                         VALUE '** TABELLEN-BEREICH *'.
      *
      *****************************************************************
       01 ZWISCHENFELDER.
          05 FILLER                      PIC  X(026)
                                         VALUE '** ZWISCHENFELDER **'.
          05 Z-ZAEHL-AF1                 PIC S9(007) VALUE ZERO.
          05 Z-ZAEHL-AF1-UPDATE          PIC S9(007) VALUE ZERO.
          05 Z-ZW-DATUM                  PIC 9(006)  VALUE ZERO.
          05 Z-DIR-NR                    PIC S9(004) COMP.
          05 Z-ST-NR                     PIC S9(009) COMP.
           
      *   VARIABLEN FUER DIE FEHLERPRUEFUNG BEI DATEIAKTIONEN
          05 Z-DATEI-OPEN-FEHLER.
             10 Z-DATEI-NAME             PIC  X(030).
          05 Z-DATEI-STATUS              PIC  X(002).      
          
       01  VORLAUFKARTE.
           05 VK-ID               PIC  X(011).
           05 FILLER              PIC  X.
           05 VK-DATUM.
              10 MM               PIC  9(002).
              10 FILLER           PIC  X.
              10 JJ               PIC  9(002).
           05 VK-ENDE REDEFINES VK-DATUM  PIC  X.
           05 FILLER              PIC  X.
           05 VK-DIR-NEU          PIC  9(003).
           05 FILLER              PIC  X.
           05 VK-DIR-ALT          PIC  9(003).
           05 FILLER              PIC  X.
           05 VK-MANR             PIC  9(007).
           05 FILLER              PIC  X(050).
           
      *****************************************************************
       PROCEDURE DIVISION.
      *****************************************************************
      *---------------------------------------------------------------*
       S-HAUPTSTEUERUNG SECTION.
      *---------------------------------------------------------------*
      * INPUT : -
      * OUTPUT: -
      * VERARBEITUNG:
      *         STEUERUNG VON GRUPPENWECHSEL UND VERARBEITUNG EINER
      *         EINGABEDATEI
      *---------------------------------------------------------------*
      *
           PERFORM V0-VORLAUF
           
           IF S-NZ =  K-ZUSTAND-OK
              PERFORM E0-LESEN
           ELSE
              CONTINUE
           END-IF
      *
           PERFORM WITH TEST BEFORE    UNTIL S-NZ  NOT = K-ZUSTAND-OK
      *
                       PERFORM SB-BEARBEITUNG
      *
           END-PERFORM
      *
           PERFORM N0-NACHLAUF
           STOP RUN
           .
       S-EXIT.
           EXIT.
      *
      *---------------------------------------------------------------*
       V0-VORLAUF SECTION.
      *---------------------------------------------------------------*
      * INPUT : VORLAUFKARTE
      * OUTPUT: 
      * VERARBEITUNG:
      *         - PRÜFEN VORLAUFKARTE
      *         - ERMITTELN LAUFDATUM
      *         - INI-FELDER
      *         - ÖFFNEN DATEI
      *---------------------------------------------------------------*
           ACCEPT VORLAUFKARTE

           DISPLAY '       VORLAUFKARTE = ' VORLAUFKARTE

           IF VORLAUFKARTE = SPACE
           OR VK-ENDE = 'E'
              MOVE K-ZUSTAND-EOF TO S-NZ
              EXIT SECTION
                
           ELSE
              CONTINUE 
           END-IF           
           
           IF VK-ID NOT = 'VK-PMAN0128'
              MOVE 'V0-  '                      TO ERR-ORT-SEC
              MOVE K-1                          TO ERR-ORT-LFD
              MOVE 'VORLAUFKARTE-ID FALSCH !!!' TO ERR-VAR-ZEILE01
              PERFORM BR93-PROG-FEHLER
              PERFORM U01-ABBRUCH
           END-IF
           
           IF MM IN VK-DATUM NOT NUMERIC
           OR MM IN VK-DATUM > 12
           OR MM IN VK-DATUM < 1
              MOVE 'V0-  '                         TO ERR-ORT-SEC
              MOVE K-2                             TO ERR-ORT-LFD
              MOVE 'VORLAUFKARTE MONAT FALSCH !!!' TO ERR-VAR-ZEILE01
              PERFORM BR93-PROG-FEHLER
              PERFORM U01-ABBRUCH
           END-IF
           
           IF JJ IN VK-DATUM NOT NUMERIC
              MOVE 'V0-  '                        TO ERR-ORT-SEC
              MOVE K-3                            TO ERR-ORT-LFD
              MOVE 'VORLAUFKARTE JAHR FALSCH !!!' TO ERR-VAR-ZEILE01
              PERFORM BR93-PROG-FEHLER
              PERFORM U01-ABBRUCH
           ELSE 
              MOVE JJ IN VK-DATUM                 TO PI-DRVB0303-JAHR-1
           END-IF
           
           PERFORM X01-AUFRUF-DRVB0303
               
      *    PRÜFUNG JAHR ÜBER OZP
      
           EVALUATE TRUE
           WHEN PO-DRVB0303-RC-OK
                CONTINUE
                
           WHEN OTHER
                MOVE 'V0-'                          TO ERR-ORT-SEC
                MOVE K-4                            TO ERR-ORT-LFD
                MOVE 'VORLAUFKARTE JAHR FALSCH !!!' TO ERR-VAR-ZEILE01
                PERFORM BR93-PROG-FEHLER
                PERFORM U01-ABBRUCH
           END-EVALUATE
           
      *    PRÜFUNG DIR-NR NEU ÜBER OZP
      
           MOVE VK-DIR-NEU TO Z-DIR-NR
           MOVE Z-DIR-NR   TO PI-DRVB0202-DIR-NR

           PERFORM X02-AUFRUF-DRVB0202
           
           IF S-VK-DIR-NR-PRUEFEN-NOK
              MOVE 'V0-'                          TO ERR-ORT-SEC
              MOVE K-5                            TO ERR-ORT-LFD
              MOVE 'VORLAUFKARTE DIR-NEU FALSCH !!!' 
                TO ERR-VAR-ZEILE01
              PERFORM BR93-PROG-FEHLER
              PERFORM U01-ABBRUCH
           ELSE
                CONTINUE
           END-IF
           
      *    PRÜFUNG DIR-NR ALT ÜBER OZP
           
           MOVE VK-DIR-ALT TO Z-DIR-NR
           MOVE Z-DIR-NR   TO PI-DRVB0202-DIR-NR
      
           PERFORM X02-AUFRUF-DRVB0202
           
           IF S-VK-DIR-NR-PRUEFEN-NOK
                MOVE 'V0-'                          TO ERR-ORT-SEC
                MOVE K-6                            TO ERR-ORT-LFD
                MOVE 'VORLAUFKARTE DIR-ALT FALSCH !!!' 
                  TO ERR-VAR-ZEILE01
                PERFORM BR93-PROG-FEHLER
                PERFORM U01-ABBRUCH
           ELSE
                CONTINUE
           END-IF
           
      *    PRÜFUNG VB-NUMMER NEUER D-LEITER ÜBER OZP
      
           MOVE VK-MANR TO Z-ST-NR
           MOVE Z-ST-NR TO PI-DRVB0118-ST-NR
           
           PERFORM X03-AUFRUF-DRVB0118
           
           IF S-VK-VB-NR-NOK
              MOVE 'V0-'                          TO ERR-ORT-SEC
              MOVE K-7                            TO ERR-ORT-LFD
              MOVE 'VORLAUFKARTE VB-NUMMER FALSCH !!!' 
                TO ERR-VAR-ZEILE01
              PERFORM BR93-PROG-FEHLER
              PERFORM U01-ABBRUCH               
           END-IF           
           
      *    PRÜFUNG VK-MANR OB D-LEITER ÜBER OZP
      
           MOVE VK-MANR TO Z-ST-NR
           MOVE Z-ST-NR TO PI-DRVB0450-DL-BEZUGS-NR
           
           PERFORM X04-AUFRUF-DRVB0450
           
           IF S-D-LEITER-PRUEFEN-NOK
              MOVE 'V0-'                          TO ERR-ORT-SEC
              MOVE K-8                            TO ERR-ORT-LFD
              MOVE 'VORLAUFKARTE VB-NUMMER FALSCH !!!' 
                TO ERR-VAR-ZEILE01
              PERFORM BR93-PROG-FEHLER
              PERFORM U01-ABBRUCH               
           END-IF
           
      * -> ERMITTELN LAUFDATUM
           PERFORM U02-LAUFDATUM
      *
      * -> VORBELEGUNG VARIABLEN
           PERFORM V02-INIT-FELDER
      *
      * -> AUSGABE KOPF
           PERFORM V01-AUSGABE-KOPF
      *
      * -> ÖFFNEN DER DATEIEN / CURSOR
           PERFORM V03-OPEN
      *    
           .
       V0-EXIT.
           EXIT.
      *
      *---------------------------------------------------------------*
       V01-AUSGABE-KOPF SECTION.
      *---------------------------------------------------------------*
      * INPUT : -
      * OUTPUT: -
      * VERARBEITUNG:
      *         -
      *---------------------------------------------------------------*
           DISPLAY ' '
           DISPLAY '       =============================================
      -            '='
           DISPLAY ' '
           DISPLAY '       PFLEGE NEUE DIREKTIONEN-DATEI UU009900'
           DISPLAY ' '
           DISPLAY '       PGM PMAN0128                          '
           DISPLAY ' '
           DISPLAY '       PROGRAMMLAUF             '
                   BR-Z-LAUFDATUM-EUR
                   ' / '
                   BR-Z-LAUFZEIT-A(1:8)
           DISPLAY '       GENERIERUNG              '
                   BR-Z-GENDATUM-A
                   ' / '
                   BR-Z-GENZEIT-A
           DISPLAY ' '
           DISPLAY '       ---------------------------------------------
      -            '-'
           DISPLAY ' '
           .
       V01-EXIT.
           EXIT.
      *
      *---------------------------------------------------------------*
       V02-INIT-FELDER SECTION.
      *---------------------------------------------------------------*
      * INPUT : -
      * OUTPUT: -
      * VERARBEITUNG:
      *         ES WERDEN DIVERSE FELDER INITIALISIERT
      *         BZW. VORBELEGT.
      *---------------------------------------------------------------*
      *
      * -> VORBELEGUNG GRUPPENSTEUERFELDER
           MOVE K-ZUSTAND-OK   TO S-NZ
      *
      * -> VORBELEGUNG ARBEITSVARIABLEN
           MOVE VK-DIR-NEU     TO XDIR-NEU
           INITIALIZE Z-ZAEHL-AF1
                      Z-ZAEHL-AF1-UPDATE
      *
      * -> VORBELEGUNG STANDARD-STATUS-BEREICH, ERR-ERROR-BEREICH
      *    (WIRD AUCH FÜR DAS RESTART-MODUL BENÖTIGT)
           INITIALIZE STANDARD-STATUS-BEREICH
           MOVE K-PGM-NAME               TO STAT-KENNUNG
           SET  STAT-BATCH               TO TRUE
           MOVE K-PGM-NAME               TO ERR-PROGNAME
           
           .
       V02-EXIT.
           EXIT.
      *
      *---------------------------------------------------------------*
       V03-OPEN SECTION.
      *---------------------------------------------------------------*
      * INPUT : -
      * OUTPUT: -
      * VERARBEITUNG:
      *         DIE DATEIEN / CURSOR WERDEN GEÖFFNET
      *---------------------------------------------------------------*
      *
      *    < # Z.B. AUCH OPEN CURSOR >
      *
           OPEN I-O AFILE1
           MOVE S-DATEI-STATUS                   TO Z-DATEI-STATUS
           MOVE 'AFILE1                        ' TO Z-DATEI-NAME
           PERFORM V031-PRUEF-OPEN-DATEISTATUS
      *
           .
       V03-EXIT.
           EXIT.
      *
      *---------------------------------------------------------------*
       V031-PRUEF-OPEN-DATEISTATUS SECTION.
      *---------------------------------------------------------------*
      * INPUT : -
      * OUTPUT: -
      * VERARBEITUNG:
      *         ES WIRD DIE PRÜFUNG DES DATEISTATUS NACH
      *         DEM ÖFFNEN EINER DATEI DURCHGEFÜHRT.
      *---------------------------------------------------------------*
           IF Z-DATEI-STATUS = KF-OK
              CONTINUE
           ELSE
              MOVE Z-DATEI-STATUS        TO S-DATEI-STATUS
              MOVE Z-DATEI-OPEN-FEHLER   TO ERR-VAR-ZEILE01
              MOVE 'V031-'               TO ERR-ORT-SEC
              MOVE K-20                  TO ERR-ORT-LFD
              PERFORM BR94-DATEI-FEHLER
              PERFORM U01-ABBRUCH
           END-IF
           .
       V031-EXIT.
           EXIT.
      *
      *---------------------------------------------------------------*
       E0-LESEN SECTION.
      *---------------------------------------------------------------*
      * INPUT : -
      * OUTPUT: 1. SATZ EINGABEDATEI / EINGABE-CURSOR
      * VERARBEITUNG:
      *         -
      *---------------------------------------------------------------*
      *
           PERFORM E1-EINGABE
      *
           .
       E0-EXIT.
           EXIT.
      *
      *---------------------------------------------------------------*
       E1-EINGABE SECTION.
      *---------------------------------------------------------------*
      * INPUT : -
      * OUTPUT: (NÄCHSTER) SATZ EINGABEDATEI / EINGABE-CURSOR,
      *         S-NZ (ZUSTAND)
      * VERARBEITUNG:
      *         -
      *---------------------------------------------------------------*
      *
           READ AFILE1
      *
           EVALUATE S-DATEI-STATUS
           WHEN KF-OK
           WHEN KF-EOF
           WHEN KF-NOT-FOUND
                CONTINUE
           WHEN OTHER
              MOVE S-DATEI-STATUS       TO S-DATEI-STATUS
              MOVE 'FEHLER LESEN AFILE1' TO ERR-VAR-ZEILE01
              MOVE 'E1-  '               TO ERR-ORT-SEC
              MOVE K-30                  TO ERR-ORT-LFD
              PERFORM BR94-DATEI-FEHLER
              PERFORM U01-ABBRUCH
           END-EVALUATE
      *
      * -> PLAUSI: AUFSTEIGENDE SORTIERUNG DES GRUPPENWECHSELBEGRIFFS
           IF S-NEU < S-ALT
              MOVE 'E1-  '               TO ERR-ORT-SEC
              MOVE K-31                  TO ERR-ORT-LFD
              MOVE 'SORTIERFEHLER BEI DEN STEUERDATEN !!!'
                                         TO ERR-VAR-ZEILE01
              PERFORM BR93-PROG-FEHLER
              PERFORM U01-ABBRUCH
           END-IF
           .
           
       E1-EXIT.
           EXIT.
      *
      *---------------------------------------------------------------*
       N0-NACHLAUF SECTION.
      *---------------------------------------------------------------*
      * INPUT : -
      * OUTPUT: -
      * VERARBEITUNG:
      *         -
      *---------------------------------------------------------------*
      *
      * -> SCHLIEßEN DER DATEIEN / CURSOR
           PERFORM N01-CLOSE
      *
           PERFORM N02-PROTOKOLL
           PERFORM N03-AUSGABE-FUSS
      *
           .
       N0-EXIT.
           EXIT.
      *
      *---------------------------------------------------------------*
       N01-CLOSE SECTION.
      *---------------------------------------------------------------*
      * INPUT : -
      * OUTPUT: -
      * VERARBEITUNG:
      *         DIE DATEIEN / CURSOR WERDEN GESCHLOSSEN
      *---------------------------------------------------------------*
      *
      *    < # Z.B. AUCH CLOSE CURSOR >
      *
           CLOSE AFILE1
           .
       N01-EXIT.
           EXIT.
      *
      *---------------------------------------------------------------*
       N02-PROTOKOLL SECTION.
      *---------------------------------------------------------------*
      * INPUT : DIVERSE VERARBEITUNGSZÄHLER
      * OUTPUT: SYSOUT
      * VERARBEITUNG:
      *         -
      *---------------------------------------------------------------*
           EVALUATE TRUE
           WHEN Z-ZAEHL-AF1 > ZERO
                DISPLAY '       DIREKTION NEU     :' VK-DIR-NEU
                DISPLAY '       AUS DIRKETION ALT :' VK-DIR-ALT
                DISPLAY '       NEUER D-LEITER    :' VK-MANR
                DISPLAY '       ZUM DATUM         :' Z-ZW-DATUM
                DISPLAY '       NEU EINGETRAGEN.   '
                DISPLAY '                          '
      *
           WHEN Z-ZAEHL-AF1-UPDATE > ZERO
                DISPLAY '       DIREKTION NEU     :' VK-DIR-NEU
                DISPLAY '       AUS DIRKETION ALT :' VK-DIR-ALT
                DISPLAY '       NEUER D-LEITER    :' VK-MANR
                DISPLAY '       ZUM DATUM         :' Z-ZW-DATUM
                DISPLAY '       UPDATE DA BEREITS EINTRAG VORHANDEN.'
                DISPLAY '                          '
               
           END-EVALUATE
           .
       N02-EXIT.
           EXIT.
      *
      *---------------------------------------------------------------*
       N03-AUSGABE-FUSS SECTION.
      *---------------------------------------------------------------*
      * INPUT : -
      * OUTPUT: SYSOUT
      * VERARBEITUNG:
      *         -
      *---------------------------------------------------------------*
      *
           DISPLAY ' '
           DISPLAY '       ENDE PGM PMAN0128'
           DISPLAY '       =============================================
      -            '='
           DISPLAY ' '
           .
       N03-EXIT.
           EXIT.
      *
      *---------------------------------------------------------------*
       SB-BEARBEITUNG SECTION.
      *---------------------------------------------------------------*
      * INPUT : -
      * OUTPUT: -
      * VERARBEITUNG:
      *         -
      *---------------------------------------------------------------*
      *
           PERFORM B1-BEARBEITUNG
           .
       SB-EXIT.
           EXIT.
      *
      *---------------------------------------------------------------*
       B1-BEARBEITUNG SECTION.
      *---------------------------------------------------------------*
      * INPUT : DATEN AUS VORLAUFKARTE, STATUS NACH READ DATEI
      * OUTPUT: NEUEINTRAG ODER UPDATE IN DATEI
      * VERARBEITUNG: ABHÄNGIG VOM STATUS DES READ DER DATEI MIT
      *         DER NEUEN DIRKETION ERFOLGT UPDATE ODER NEUEINTRAG
      *---------------------------------------------------------------*
           EVALUATE S-DATEI-STATUS

           WHEN KF-OK
      *         ES GIBT BEREITS EINEN SATZ FÜR DIE NEUE DIREKTION
      *         D.H. DIE DIREKTIONSNUMMER WIRD "WIEDERVERWENDET"
      *         ES WIRD EIN UPDATE DURCHGEFÜHRT
                MOVE VK-DIR-NEU     TO XDIR-NEU
                MOVE VK-DIR-ALT     TO XDIR-ALT
                MOVE VK-MANR        TO XMANR
                MOVE JJ IN VK-DATUM TO Z-ZW-DATUM (1:2)
                MOVE MM IN VK-DATUM TO Z-ZW-DATUM (3:2)
                MOVE ZERO           TO Z-ZW-DATUM (5:2)
                MOVE Z-ZW-DATUM     TO XDATUM
                          
                REWRITE AFILE1-REC
                
                IF S-DATEI-STATUS NOT = KF-OK
                   DISPLAY 'FEHLER REWRITE UU0099, STATUS = '
                           S-DATEI-STATUS
                   DISPLAY 'VBNR      ' VK-MANR
                   DISPLAY 'DIR-NEU   ' VK-DIR-NEU
                   DISPLAY 'DIR-ALT   ' VK-DIR-ALT
                   DISPLAY 'DATUM     ' VK-DATUM
                   PERFORM BR94-DATEI-FEHLER
                   PERFORM U01-ABBRUCH
                ELSE
                   MOVE K-ZUSTAND-EOF TO S-NZ
                   ADD 1 TO Z-ZAEHL-AF1-UPDATE
                END-IF               
                
           WHEN KF-EOF
           WHEN KF-NOT-FOUND
      *         DATEIENDE (STATUS = 10)
      *         BZW. ES WURDE KEIN DATENSATZ GEFUNDEN (STATUS = 23)
      *         ES WIRD EIN NEUER SATZ IN DIE DATEI GESCHIEBEN 
                MOVE VK-DIR-NEU     TO XDIR-NEU
                MOVE VK-DIR-ALT     TO XDIR-ALT
                MOVE VK-MANR        TO XMANR
                MOVE JJ IN VK-DATUM TO Z-ZW-DATUM (1:2)
                MOVE MM IN VK-DATUM TO Z-ZW-DATUM (3:2)
                MOVE ZERO           TO Z-ZW-DATUM (5:2)
                MOVE Z-ZW-DATUM     TO XDATUM
                          
                WRITE AFILE1-REC
                
                IF S-DATEI-STATUS NOT = KF-OK
                   DISPLAY 'FEHLER WRITE UU0099, STATUS = '
                           S-DATEI-STATUS
                   DISPLAY 'VBNR      ' VK-MANR
                   DISPLAY 'DIR-NEU   ' VK-DIR-NEU
                   DISPLAY 'DIR-ALT   ' VK-DIR-ALT
                   DISPLAY 'DATUM     ' VK-DATUM
                   PERFORM BR94-DATEI-FEHLER
                   PERFORM U01-ABBRUCH
                ELSE
                   MOVE K-ZUSTAND-EOF TO S-NZ
                   ADD 1 TO Z-ZAEHL-AF1
                END-IF
                
           END-EVALUATE
           
           .
       B1-EXIT.
           EXIT.
      *
      *---------------------------------------------------------------*
       U01-ABBRUCH SECTION.
      *---------------------------------------------------------------*
      * INPUT : -
      * OUTPUT: -
      * VERARBEITUNG:
      *         - DB2-ROLLBACK DURCHFÜHREN
      *         - DISPLAY PROTOKOLL
      *         - DISPLAY FUSS
      *         AUFRUF DER STANDARD-ABBRUCHROUTINE FÜR DEN
      *         PROGRAMMIERTEN VERARBEITUNGSABBRUCH
      *           - ALLE NOCH OFFENEN DATEIEN WERDEN GESCHLOSSEN
      *           - STANDARDMäßIG WIRD KEIN DUMP ERZEUGT
      *           - RC K-COMP-CODE (3501) WIRD AN DAS JOB-PROTOKOLL
      *             üBERGEBEN
      *         *******
      *         ACHTUNG: IN DER ABBRUCHROUTINE WIRD DAS PGM BEENDET !
      *         *******
      *---------------------------------------------------------------*
      *
           PERFORM BR04-ROLLBACK
           PERFORM N02-PROTOKOLL
           PERFORM N03-AUSGABE-FUSS
           PERFORM BR06-ABBRUCHROUTINE
           .
       U01-EXIT.
           EXIT.
      *
      *---------------------------------------------------------------*
       U02-LAUFDATUM SECTION.
      *---------------------------------------------------------------*
      * INPUT : -
      * OUTPUT: BR-Z-LAUFDATUM-EUR
      *         BR-Z-LAUFDATUM-ISO1
      *         BR-Z-LAUFDATUM-ISO2
      *         BR-Z-LAUFDATUM-TS
      *         BR-Z-LAUFZEIT-A
      *         BR-Z-GENDATUM-A
      *         BR-Z-GENZEIT-A
      * VERARBEITUNG:
      *         DIESE ROUTINE STELLT DAS LAUFDATUM, DIE UHRZEIT,
      *         SOWIE DAS GENERIERUNGSDATUM DES PROGRAMMS ZUR
      *         VERFÜGUNG.
      *---------------------------------------------------------------*
      *
           PERFORM BR01-ERM-LAUFDATUM
           .
       U02-EXIT.
           EXIT.
      *
      *---------------------------------------------------------------*
       U04-ROLLBACK SECTION.
      *---------------------------------------------------------------*
      * INPUT : -
      * OUTPUT: -
      * VERARBEITUNG:
      *         DIESE ROUTINE FÜHRT EINEN DB2-ROLLBACK DURCH.
      *---------------------------------------------------------------*
      *
           PERFORM BR04-ROLLBACK
           .
       U04-EXIT.
           EXIT.
      *---------------------------------------------------------------*
       X01-AUFRUF-DRVB0303 SECTION.
      *---------------------------------------------------------------*
      * INPUT : PI-DRVB0303
      * OUTPUT: PO-DRVB0303
      * VERARBEITUNG:
      *         AUFRUF UPVB0104 MIT FUNKTION DRVB0303 
      * PRFÜEN OB JAHR AUS VORLAUFKARTE KORREKT IST
      *---------------------------------------------------------------*
       
      *----FUNKTION SETZEN FUER GRENZE  80  -  FIX --------------
           SET PI-UPVB0104-DRVB0303 TO TRUE
       
           CALL K-UPVB0104 USING BY CONTENT   PI-UPVB0104
                                              PI-DRVB0303
                                 BY REFERENCE PO-DRVB0303
                                              ERR-ERROR-BEREICH
                                 BY CONTENT   STANDARD-STATUS-BEREICH
           END-CALL
       
           IF ERR-RC-SCHWERER-FEHLER
              PERFORM BR99-SCHWERER-FEHLER-DISPLAY
              PERFORM U01-ABBRUCH
           END-IF
       
           EVALUATE TRUE
           WHEN PO-DRVB0303-RC-OK
                CONTINUE
           WHEN OTHER
                MOVE K-UPVB0104          TO ERR-VAR-ZEILE01
                MOVE '/'                 TO ERR-VAR-ZEILE01(09:01)
                MOVE PI-UPVB0104-FUNKTION
                                         TO ERR-VAR-ZEILE01(10:08)
                MOVE ': RETURNCODE UNGUELTIG'
                                         TO ERR-VAR-ZEILE01(18:22)
                MOVE PO-DRVB0303-RC      TO ERR-VAR-ZEILE02
                MOVE 'X01-'              TO ERR-ORT-SEC
                MOVE K-10                TO ERR-ORT-LFD
                PERFORM BR93-PROG-FEHLER
                PERFORM U01-ABBRUCH
           END-EVALUATE
       
           .
       X01-EXIT.
           EXIT.
      *---------------------------------------------------------------*
       X02-AUFRUF-DRVB0202 SECTION.
      *---------------------------------------------------------------*
      * INPUT : PI-DRVB0202
      * OUTPUT: PO-DRVB0202
      * VERARBEITUNG:
      *         AUFRUF ZWVB0006 MIT FUNKTION DRVB0202 
      * PRFÜEN OB DIR-NEU AUS VORLAUFKARTE KORREKT IST
      *---------------------------------------------------------------*
      
           SET PI-ZWVB0006-DRVB0202 TO TRUE
      
           CALL K-ZWVB0006 USING BY CONTENT   PI-ZWVB0006
                                              PI-DRVB0202
                                 BY REFERENCE PO-DRVB0202
                                              ERR-ERROR-BEREICH
                                 BY CONTENT   STANDARD-STATUS-BEREICH
           END-CALL
      
      *----ABBRUCH WENN UPRO SCHWEREN FEHLER ERZEUGT-------------
      
           IF ERR-RC-SCHWERER-FEHLER
              PERFORM BR99-SCHWERER-FEHLER-DISPLAY
              PERFORM U01-ABBRUCH
           END-IF
      
      *----PO-RC DES UPROS AUSWERTEN UND UEBERTRAGEN DER DATEN----
      
           EVALUATE TRUE
           WHEN PO-DRVB0202-RC-OK
                SET S-VK-DIR-NR-PRUEFEN-OK  TO TRUE
           WHEN PO-DRVB0202-RC-NOT-FOUND
                SET S-VK-DIR-NR-PRUEFEN-NOK TO TRUE
           WHEN OTHER
                MOVE K-ZWVB0006           TO ERR-VAR-ZEILE01
                MOVE '/'                  TO ERR-VAR-ZEILE01(09:01)
                MOVE PI-ZWVB0006-FUNKTION TO ERR-VAR-ZEILE01(10:08)
                MOVE ': RETURNCODE UNGUELTIG'
                                          TO ERR-VAR-ZEILE01(18:22)
                MOVE PO-DRVB0202-RC       TO ERR-VAR-ZEILE02
                MOVE 'X02-'               TO ERR-ORT-SEC
                MOVE K-11                 TO ERR-ORT-LFD
                PERFORM BR93-PROG-FEHLER
                PERFORM U01-ABBRUCH      
           END-EVALUATE
           
           .
       X02-EXIT.
           EXIT.
      *---------------------------------------------------------------*
       X03-AUFRUF-DRVB0118 SECTION.
      *---------------------------------------------------------------*
      * INPUT : PI-DRVB0118
      * OUTPUT: PO-DRVB0118
      * VERARBEITUNG:
      *         AUFRUF ZWVB0001 MIT FUNKTION DRVB0118 
      * PRFÜEN OB DIR-ALT AUS VORLAUFKARTE KORREKT IST
      *---------------------------------------------------------------*
           SET PI-ZWVB0001-DRVB0118 TO TRUE
      
           CALL K-ZWVB0001 USING BY CONTENT   PI-ZWVB0001
                                              PI-DRVB0118
                                 BY REFERENCE PO-DRVB0118
                                              ERR-ERROR-BEREICH
                                 BY CONTENT   STANDARD-STATUS-BEREICH
           END-CALL
      
      *----ABBRUCH WENN UPRO SCHWEREN FEHLER ERZEUGT-------------
      
           IF ERR-RC-SCHWERER-FEHLER
              PERFORM BR99-SCHWERER-FEHLER-DISPLAY
              PERFORM U01-ABBRUCH
           END-IF
      
      *----PO-RC DES UPROS AUSWERTEN UND UEBERTRAGEN DER DATEN----
      
           EVALUATE TRUE
      
           WHEN PO-DRVB0118-RC-OK
                SET S-VK-VB-NR-OK  TO TRUE
      
           WHEN PO-DRVB0118-RC-NOT-FOUND
                SET S-VK-VB-NR-NOK TO TRUE
      
           WHEN OTHER
                MOVE K-ZWVB0001           TO ERR-VAR-ZEILE01
                MOVE '/'                  TO ERR-VAR-ZEILE01(09:01)
                MOVE PI-ZWVB0001-FUNKTION TO ERR-VAR-ZEILE01(10:08)
                MOVE ': RETURNCODE UNGUELTIG'
                                          TO ERR-VAR-ZEILE01(18:22)
                MOVE PO-DRVB0118-RC       TO ERR-VAR-ZEILE02
                MOVE 'X03-'               TO ERR-ORT-SEC
                MOVE K-12                 TO ERR-ORT-LFD
                PERFORM BR93-PROG-FEHLER
                PERFORM U01-ABBRUCH      
      
           END-EVALUATE
           .
       X03-EXIT.
           EXIT.
      *-------------------------------------------------------------* 
       X04-AUFRUF-DRVB0450 SECTION.
      *-------------------------------------------------------------* 
      * INPUT : PI-DRVB0450
      * OUTPUT: PO-DRVB0450
      * VERARBEITUNG: AUFRUF ZWVB0019 MIT FUNKTION DRVB0450
      * PRFÜEN OB VB AUS VORLAUFKARTE D-LEITER IST
      *-------------------------------------------------------------*  
           SET PI-ZWVB0019-DRVB0450 TO TRUE
      
           CALL K-ZWVB0019 USING BY CONTENT   PI-ZWVB0019
                                              PI-DRVB0450
                                 BY REFERENCE PO-DRVB0450
                                              ERR-ERROR-BEREICH
                                 BY CONTENT   STANDARD-STATUS-BEREICH
           END-CALL
      
      *----ABBRUCH WENN UPRO SCHWEREN FEHLER ERZEUGT-------------
      
           IF ERR-RC-SCHWERER-FEHLER
              PERFORM BR99-SCHWERER-FEHLER-DISPLAY
              PERFORM U01-ABBRUCH
           END-IF
      
      *----PO-RC DES UPROS AUSWERTEN UND UEBERTRAGEN DER DATEN----
      
           EVALUATE TRUE
           WHEN PO-DRVB0450-RC-OK
                SET S-D-LEITER-PRUEFEN-OK  TO TRUE
           WHEN PO-DRVB0450-RC-LEER     
           WHEN PO-DRVB0450-RC-EOF      
           WHEN PO-DRVB0450-RC-NOT-FOUND
                SET S-D-LEITER-PRUEFEN-NOK TO TRUE
           WHEN OTHER
                MOVE K-ZWVB0019           TO ERR-VAR-ZEILE01
                MOVE '/'                  TO ERR-VAR-ZEILE01(09:01)
                MOVE PI-ZWVB0019-FUNKTION TO ERR-VAR-ZEILE01(10:08)
                MOVE ': RETURNCODE UNGUELTIG'
                                          TO ERR-VAR-ZEILE01(18:22)
                MOVE PO-DRVB0450-RC       TO ERR-VAR-ZEILE02
                MOVE 'X04-'               TO ERR-ORT-SEC
                MOVE K-13                 TO ERR-ORT-LFD
                PERFORM BR93-PROG-FEHLER
                PERFORM U01-ABBRUCH      
              
           END-EVALUATE
           .
       X04-EXIT.
           EXIT.
      *****************************************************************
      *    ALLE SONSTIGEN STATEMENTS
      *****************************************************************
      *
      *
      *>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>*
      *  BATCHRAHMEN: STANDARDROUTINEN,
      *               RESTART,
      *               FEHLERAUFBEREITUNG UND -AUSGABE (DISPLAYS)
      *>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>*
      *---------------------------------------------------------------*
      * BR01-ERM-LAUFDATUM --   ERMITTELN LAUFDATUM
      * INPUT : -
      * OUTPUT:
      * BENÖTIGT: IMMER
      *---------------------------------------------------------------*
        COPY DPAT0068.
      *
      *---------------------------------------------------------------*
      * BR02-ERM-TIMESTAMP --   ERMITTELN LAUFDATUM AUS DB2/TIMESTAMP
      * INPUT : -
      * OUTPUT:
      * BENÖTIGT: BEI BEDARF
      *
      * BR03-COMMIT        --   DURCHFÜHREN COMMIT
      * INPUT : -
      * OUTPUT:
      * BENÖTIGT: BEI RESTART
      *
      * BR04-ROLLBACK      --   DURCHFÜHREN ROLLBACK
      * INPUT : -
      * OUTPUT:
      * BENÖTIGT: IMMER
      *
      * BR05-DISPLAY-ABBRUCH  --   DISPLAY ABBRUCH
      * INPUT : -
      * OUTPUT:
      * BENÖTIGT: IMMER
      *---------------------------------------------------------------*
        COPY DPAT0069.
      *
      *---------------------------------------------------------------*
      * BR06-ABBRUCHROUTINE   --   AUFRUF  ABBRUCHROUTINE
      * INPUT : -
      * OUTPUT:
      * BENÖTIGT: IMMER
      *---------------------------------------------------------------*
        COPY DPAT0073.
      *---------------------------------------------------------------*
      * BR93-PROG-FEHLER  --  PROGRAMM-/LOGIK-FEHLER BEHANDLUNG
      * INPUT : MUSS: K-PGM-NAME
      *         KANN: ERR-ORT-SEC, ERR-ORT-LFD, ERR-VAR-ZEILE01 -04
      * BENÖTIGT: IMMER
      *---------------------------------------------------------------*
        COPY DPAT0035.
      *
      *---------------------------------------------------------------*
      * BR94-DATEI-FEHLER --  DATEI-FEHLER-BEHANDLUNG
      * INPUT : MUSS: S-DATEI-STATUS, K-PGM-NAME
      *         KANN: ERR-ORT-SEC, ERR-ORT-LFD, ERR-VAR-ZEILE01 -04
      * BENÖTIGT: BEI DATEI-ZUGRIFFEN
      *---------------------------------------------------------------*
        COPY DPAT0036.
      *
      *---------------------------------------------------------------*
      * BR99-SCHWERER-FEHLER-DISPLAY  --  FEHLER-AUFBEREITUNG
      * UR82-D-ERR-DISPLAY                UND -AUSGABE
      * INPUT : ERR-ERROR-BEREICH
      * BENÖTIGT: IMMER
      *---------------------------------------------------------------*
        COPY DPAT0038.
      *
      *---------------------------------------------------------------*
      * UR81-ERR-AUFBER   --  FEHLER-AUFBEREITUNG
      * INPUT : ERR-ERROR-BEREICH
      * BENÖTIGT: IMMER
      *---------------------------------------------------------------*
        COPY DPAT0039.
      *
      *>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>><<<>>>>>>>>>>>>>>>>>*
      *  ENDE BATCHRAHMEN: FEHLERAUFBEREITUNG UND -AUSGABE
      *>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>><<<>>>>>>>>>>>>>>>>>>>>*
      *
      *****************************************************************
      *---------------------- ENDE PMAN0128 --------------------------*
      *****************************************************************
