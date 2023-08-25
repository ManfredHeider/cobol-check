      *---------------------------------------------------------------*
      *    Standard für alle Objekte unter PVCS
      *            Datum   :  November 1995
      *            Kopf aus:  N:\PROFILE\KOPFCBL.DAT
      *---------------------------------------------------------------*
      *
      *---------------------------------------------------------------*
      *    Copyright 1995 ATLAS Dienstleistungs GmbH
      *---------------------------------------------------------------*
      *    $Workfile:   DPZV0002.CPY  $
      *    $Revision:   1.0  $
      *
      *    $Log:   L:/MF/CPY/DPZV0002.CPv  $
      *
      *   Rev 1.0   Nov 04 1995 08:32:00   P13SP99
      *Initial revision.
      *
      *---------------------------------------------------------------*
      *****************************************************************
      *    COPY-MEMBER: DPZV0002       SCHREIBMODULE                  *
      *                                  *--  LOG-TABLE VERARBEITUNG  *
      *    --------------------------------------------------------   *
      *    VERSION   001                                              *
      *    --------------------------------------------------------   *
      *    ERSTELLT: M. KUHN          (DVAG)                          *
      *    DATUM:    17.03.1993                                       *
      *    STAND:    17.03.1993                                       *
      *****************************************************************
      *
       Verarb-Log-Table.
      *---------------------------------------------------------------
      * Aufruf durch:                                                *
      *                                                              *
      *    -  Main                                                   *
      *    *--  Verarb-Update                                        *
      *    !--  Verarb-Insert                                        *
      *    `--  Verarb-Delete                                        *
      *                                                              *
      * Aufgerufene Paragraphen:                                     *
      *                                                              *
      *    -  -/-                                                    *
      *                                                              *


      *
      *
      *
           MOVE  WB-TBAT0005-Gesamt     TO  TBAT0005-Gesamt

           PERFORM  WITH TEST AFTER
                    VARYING  WI-Index1 FROM 1 BY  1
                                    UNTIL  WI-Index1 > K-Schreib-Max
                                     OR    (SQLCODE  NOT =  -904)
              EXEC SQL
                 INSERT  INTO    TBAT0005
                        (
                             LOG_TABLE_ID,
                             LOG_MA_NR,
                             LOG_DAT_AB,
                             LOG_DAT_AEND,
                             LOG_PROGRAMM_ID,
                             LOG_USER_ID,
                             LOG_TERMINAL_ID,
                             LOG_AEND_KZ,
                             LOG_AEND_TYP,
                             LOG_TUPEL_ALT_GS,
                             LOG_TUPEL_NEU_GS
                        )
                   VALUES
                        (
                            :LOG-TABLE-ID,
                            :LOG-MA-NR,
                            :LOG-DAT-AB,
                            :LOG-DAT-AEND,
                            :LOG-PROGRAMM-ID,
                            :LOG-USER-ID,
                            :LOG-TERMINAL-ID,
                            :LOG-AEND-KZ,
                            :LOG-AEND-TYP,
                            :LOG-TUPEL-ALT-GS:NI-LOG-TUPEL-ALT-GS,
                            :LOG-TUPEL-NEU-GS:NI-LOG-TUPEL-NEU-GS
                        )
              END-EXEC

           END-PERFORM

           IF   SQLCODE  =   ZERO
             CONTINUE
            ELSE
              SET   Verarb-Fehler  TO  TRUE
              SET   Rlback         TO  TRUE
              MOVE  SQLCODE        TO  WLR-Fehler-Nr
              IF    SQLERRML       >   ZERO
                  MOVE  SQLERRMC       TO   WLR-Fehler-Text
               ELSE
                   MOVE  SPACE          TO   WLR-Fehler-Text
              END-IF
           END-IF
           .
           EJECT
