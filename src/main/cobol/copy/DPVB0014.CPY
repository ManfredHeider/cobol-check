      *---------------------------------------------------------------*
      *    Standard für alle Objekte unter PVCS
      *            Datum   :  November 1995
      *            Kopf aus:  N:\PROFILE\KOPFCBL.DAT
      *---------------------------------------------------------------*
      *
      *---------------------------------------------------------------*
      *    Copyright 1995 ATLAS Dienstleistungs GmbH
      *---------------------------------------------------------------*
      *    $Workfile:   DPVB0014.CPY  $
      *    $Revision:   2.1  $
      *
      *    $Log:   L:/mf/CPY/DPVB0014.CPv  $
      *
      *   Rev 2.1   Jul 18 2003 15:02:26   t13ex22
      *
      *   Rev 2.0   Feb 27 1999 15:56:52   P13SP20
      *NT-Umstellung
      *
      *   Rev 1.1   Feb 28 1996 15:11:06   T13AE26
      *AFRZ0023: Anpassung an MF-Cobol Workbench
      *          (Nested Programs entf.)
      *
      *   Rev 1.0   Nov 04 1995 08:23:02   P13SP99
      *Initial revision.
      *
      *---------------------------------------------------------------*
      *****************************************************************
      *    COPY-MEMBER: DPVB0014                                      *
      *    ERMITTELN DER DATENFELDER AUS WLR-VB1-STRUK, DIE DEN DATEN-*
      *    FELDERN DER MAN ENTSPRECHEN.                               *
      *    --------------------------------------------------------   *
      *    ERSTELLT: O. NAUMANN       (DVAG)                          *
      *    DATUM:    01.04.1993                                       *
      *****************************************************************
      *    VERSION   01   16.09.93                                   *
      *****************************************************************
      * AENDERUNGEN:                                                 *
      * AUFTRAG ! DATUM  !VER ! AENDERUNG                 ! NAME     *
      * -------------------------------------------------------------*
      *         !01.04.93!    ! NEU                       ! NAUMANN  *
      *         !31.08.93!    ! SELECT-ANPASSUNG AN DEN BESCHLUß DER *
      *         !        !    ! PROJEKTSITZUNG VOM 07.05.1993        *
      *         !16.09.93! 01 ! Prod.uebergabe            ! NAUMANN  *
      * AFRZ0023!03.11.95!    ! Anpassung an MF-Cobol-    !          *
      *         !        ! 02 !  Workbench                ! Gerlach  *
      * AVB00666!17.07.03! 2.1! STAT. AUFRUF ENTFERNT     ! MUND     *
      *         !        !    !                           !          *
      *                                                              *
      * ENDE-LOGBUCH                                                 *
      ****************************************************************
      *----------------------------------------------------------
       MAN-ERMITT SECTION.
      *----------------------------------------------------------
       MAN-ERMITT-ANF.
           PERFORM  WITH TEST AFTER
                    VARYING  IND-I  FROM   1  BY  1
                                    UNTIL  IND-I   >  WK-LESEN-MAX
                                     OR    (SQLCODE  NOT =  -904)
           EXEC SQL
              SELECT
                    MAN_BEZUGS_NR,
                    MAN_DAT_VON,
                    MAN_LAST_UPDATE,
                    MAN_DAT_BIS,
                    KTY_BEZUGS_TYP,
                    KNR_BEZUGS_TYP,
                    MAN_GEBURTSDAT,
                    KTY_ANREDE,
                    KNR_ANREDE,
                    MAN_TITEL_ADEL,
                    MAN_TITEL_AKAD,
                    MAN_NAME,
                    MAN_VORNAME
              INTO
                    :DCL-VIVB0014.MAN-BEZUGS-NR
                     :NI-VIVB0014.NI-MAN-BEZUGS-NR
                   ,:DCL-VIVB0014.MAN-DAT-VON
                     :NI-VIVB0014.NI-MAN-DAT-VON
                   ,:DCL-VIVB0014.MAN-LAST-UPDATE
                     :NI-VIVB0014.NI-MAN-LAST-UPDATE
                   ,:DCL-VIVB0014.MAN-DAT-BIS
                     :NI-VIVB0014.NI-MAN-DAT-BIS
                   ,:DCL-VIVB0014.KTY-BEZUGS-TYP
                     :NI-VIVB0014.NI-KTY-BEZUGS-TYP
                   ,:DCL-VIVB0014.KNR-BEZUGS-TYP
                     :NI-VIVB0014.NI-KNR-BEZUGS-TYP
                   ,:DCL-VIVB0014.MAN-GEBURTSDAT
                     :NI-VIVB0014.NI-MAN-GEBURTSDAT
                   ,:DCL-VIVB0014.KTY-ANREDE
                     :NI-VIVB0014.NI-KTY-ANREDE
                   ,:DCL-VIVB0014.KNR-ANREDE
                     :NI-VIVB0014.NI-KNR-ANREDE
                   ,:DCL-VIVB0014.MAN-TITEL-ADEL
                     :NI-VIVB0014.NI-MAN-TITEL-ADEL
                   ,:DCL-VIVB0014.MAN-TITEL-AKAD
                     :NI-VIVB0014.NI-MAN-TITEL-AKAD
                   ,:DCL-VIVB0014.MAN-NAME
                     :NI-VIVB0014.NI-MAN-NAME
                   ,:DCL-VIVB0014.MAN-VORNAME
                     :NI-VIVB0014.NI-MAN-VORNAME
              FROM
                    VIVB0014 MAN1
              WHERE
                    MAN_BEZUGS_NR   =   :MAN-BEZUGS-NR
310893          AND MAN_LAST_UPDATE =
310893               (SELECT MAX(MAN2.MAN_LAST_UPDATE)
310893                FROM
310893                   VIVB0014 MAN2
310893                WHERE MAN1.MAN_BEZUGS_NR  =
310893                      MAN2.MAN_BEZUGS_NR
310893               )
310893*         AND MAN_DAT_VON     =
310893*              (SELECT MAX(MAN2.MAN_DAT_VON)
310893*               FROM
310893*                  VIVB0014 MAN2
310893*               WHERE MAN1.MAN_BEZUGS_NR  =
310893*                     MAN2.MAN_BEZUGS_NR
310893*                 AND MAN2.MAN_DAT_VON   <= CURRENT TIMESTAMP
310893*              )
           END-EXEC

           END-PERFORM

           EVALUATE   SQLCODE
           WHEN       0
              IF   NI-MAN-GEBURTSDAT     = - 1
                   MOVE   000000             TO MGEBDAT
              ELSE
170703*            CALL 'UPVB0064' USING
170703             CALL K-UPVB0064 USING
                   BY    CONTENT   MAN-GEBURTSDAT
                   BY    REFERENCE MGEBDAT
              END-IF
      *
              MOVE MAN-NAME          TO MZUNAM
      *
      *    BERÜCKSICHTIGUNG VON ADELS- UND AKAD. TITEL
      *    MVNAME = MAN-VORNAME + ',' + MAN-TITEL-AKAD +
      *                         + ' ' + MAN-TITEL-ADEL
      *
      *    ERMITTELN ANZAHL ZEICHEN VORNAME
              MOVE ZERO TO Z-VORNAME-LAENG
              PERFORM VARYING I-IND1 FROM 20 BY -1 UNTIL I-IND1 <= ZERO
                IF MAN-VORNAME (I-IND1:1) = SPACE
                   CONTINUE
                ELSE
                   MOVE   I-IND1 TO Z-VORNAME-LAENG
                   MOVE   ZERO   TO I-IND1
                END-IF
              END-PERFORM

      *    ERMITTELN ANZAHL ZEICHEN ADELSTITEL
              MOVE ZERO TO Z-TITEL-ADEL-LAENG
              PERFORM VARYING I-IND1 FROM 10 BY -1 UNTIL I-IND1 <= ZERO
                IF MAN-TITEL-ADEL (I-IND1:1) = SPACE
                   CONTINUE
                ELSE
                   MOVE   I-IND1 TO Z-TITEL-ADEL-LAENG
                   MOVE   ZERO   TO I-IND1
                END-IF
              END-PERFORM

      *    ERMITTELN ANZAHL ZEICHEN AKAD. TITEL
              MOVE ZERO TO Z-TITEL-AKAD-LAENG
              PERFORM VARYING I-IND1 FROM 10 BY -1 UNTIL I-IND1 <= ZERO
                IF MAN-TITEL-AKAD (I-IND1:1) = SPACE
                   CONTINUE
                ELSE
                   MOVE   I-IND1 TO Z-TITEL-AKAD-LAENG
                   MOVE   ZERO   TO I-IND1
                END-IF
              END-PERFORM

      * ERZEUGEN VON MVNAME
              EVALUATE Z-TITEL-AKAD-LAENG = ZERO
                  ALSO Z-TITEL-ADEL-LAENG = ZERO
                  WHEN TRUE  ALSO TRUE
      *           KEIN AKAD. TITEL UND KEIN ADELSTITEL
                     MOVE MAN-VORNAME  TO MVNAME
                  WHEN TRUE  ALSO FALSE
      *           KEIN AKAD. TITEL UND EIN ADELSTITEL
                     STRING   MAN-VORNAME (1:Z-VORNAME-LAENG)
                                                     DELIMITED BY SIZE
                     ', ' DELIMITED BY SIZE
                     MAN-TITEL-ADEL(1:Z-TITEL-ADEL-LAENG)
                                                     DELIMITED BY SIZE
                     INTO   MVNAME
                  WHEN FALSE ALSO TRUE
      *           EIN AKAD. TITEL UND KEIN ADELSTITEL
                     STRING   MAN-VORNAME (1:Z-VORNAME-LAENG)
                                                     DELIMITED BY SIZE
                     ', ' DELIMITED BY SIZE
                     MAN-TITEL-AKAD(1:Z-TITEL-AKAD-LAENG)
                                                     DELIMITED BY SIZE
                     INTO   MVNAME
                  WHEN FALSE ALSO FALSE
      *           EIN AKAD. TITEL UND EIN ADELSTITEL
                     STRING   MAN-VORNAME (1:Z-VORNAME-LAENG)
                                                     DELIMITED BY SIZE
                     ', ' DELIMITED BY SIZE
                     MAN-TITEL-AKAD(1:Z-TITEL-AKAD-LAENG)
                                                     DELIMITED BY SIZE
                     ', ' DELIMITED BY SIZE
                     MAN-TITEL-ADEL(1:Z-TITEL-ADEL-LAENG)
                                                     DELIMITED BY SIZE
                     INTO   MVNAME
              END-EVALUATE
      *
              MOVE KNR-ANREDE        TO MANREDE
      *
TTMMJJ*       MOVE SQLCODE         TO WLR-SQL-CODE
           WHEN       100
              CONTINUE
           WHEN       OTHER
              SET VERARB-SQL-CODE-EX    TO TRUE
              MOVE SQLCODE              TO WLR-SQL-CODE
              IF    SQLERRML       >   ZERO
                  MOVE  SQLERRMC        TO   WLR-FEHLER-TEXT
              ELSE
                  MOVE  SPACE          TO   WLR-FEHLER-TEXT
              END-IF
           END-EVALUATE
           .
       MAN-ERMITT-EXIT.
           EXIT.
