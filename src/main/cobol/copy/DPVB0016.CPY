      *---------------------------------------------------------------*
      *    Standard für alle Objekte unter PVCS
      *            Datum   :  November 1995
      *            Kopf aus:  N:\PROFILE\KOPFCBL.DAT
      *---------------------------------------------------------------*
      *
      *---------------------------------------------------------------*
      *    Copyright 1995 ATLAS Dienstleistungs GmbH
      *---------------------------------------------------------------*
      *    $Workfile:   DPVB0016.CPY  $
      *    $Revision:   2.1  $
      *
      *    $Log:   L:/mf/CPY/DPVB0016.CPv  $
      *
      *   Rev 2.1   Jul 18 2003 15:03:32   t13ex22
      *AVB00666.UE029: VBAS und ALP in QMF un stat. Aufrufe entfernt
      *
      *   Rev 2.0   Feb 27 1999 15:56:54   P13SP20
      *NT-Umstellung
      *
      *   Rev 1.1   Feb 28 1996 15:14:08   T13AE26
      *AFRZ0023: Anpassung an MF-Cobol Workbench
      *          (Nested Programs entf.)
      *
      *   Rev 1.0   Nov 04 1995 08:23:40   P13SP99
      *Initial revision.
      *
      *---------------------------------------------------------------*
      *****************************************************************
      *    COPY-MEMBER: DPVB0016                                      *
      *    LESEN DER TABLE GK                                         *
      *    UND FÜLLEN DER RELEVANTEN DATENFELDER AUS WLR-VB1-STRUK    *
      *    --------------------------------------------------------   *
      *    ERSTELLT: O. NAUMANN       (DVAG)                          *
      *    DATUM:    01.04.1993                                       *
      *****************************************************************
      *    VERSION   01   16.09.93                                   *
      ****************************************************************
      * AENDERUNGEN:                                                 *
      * AUFTRAG ! DATUM  !VER ! AENDERUNG                 ! NAME     *
      * -------------------------------------------------------------*
      *         !16.09.93! 01 ! NEU                       ! NAUMANN  *
      * AFRZ0023!03.11.95!    ! Anpassung an MF-Cobol-    !          *
      *         !        ! 02 !  WORKBENCH                ! GERLACH  *
      * AVB00666!17.07.03! 2.1! STAT. AUFRUF ENTFERNT     ! MUND     *
      *         !        !    !                           !          *
      *                                                              *
      * ENDE-LOGBUCH                                                 *
      ****************************************************************
      *----------------------------------------------------------
       GK-ERMITT SECTION.
      *----------------------------------------------------------
       GK-ERMITT-ANF.

           PERFORM  WITH TEST AFTER
                    VARYING  IND-I  FROM   1  BY  1
                                    UNTIL  IND-I   >  WK-LESEN-MAX
                                     OR    (SQLCODE  NOT =  -904)
           EXEC SQL
              SELECT
                    GK_ST_NR,
                    GK_LAST_UPDATE,
                    GK_FUNKTION,
                    GK_DAT_VON,
                    GK_DAT_BIS,
                    GK_BEZ
              INTO
                    :DCL-VIVB0002.GK-ST-NR
                     :NI-VIVB0002.NI-GK-ST-NR
                   ,:DCL-VIVB0002.GK-LAST-UPDATE
                     :NI-VIVB0002.NI-GK-LAST-UPDATE
                   ,:DCL-VIVB0002.GK-FUNKTION
                     :NI-VIVB0002.NI-GK-FUNKTION
                   ,:DCL-VIVB0002.GK-DAT-VON
                     :NI-VIVB0002.NI-GK-DAT-VON
                   ,:DCL-VIVB0002.GK-DAT-BIS
                     :NI-VIVB0002.NI-GK-DAT-BIS
                   ,:DCL-VIVB0002.GK-BEZ
                     :NI-VIVB0002.NI-GK-BEZ
              FROM
                    VIVB0002
              WHERE
                    GK_ST_NR        =   :GK-ST-NR
           END-EXEC

           END-PERFORM

           EVALUATE   SQLCODE
           WHEN       0
                 MOVE GK-BEZ (1:20)        TO MZUNAM
                 MOVE GK-FUNKTION          TO MGEBDAT
      *
170703*          CALL 'UPVB0064' USING
170703           CALL K-UPVB0064 USING
                 BY    CONTENT   GK-DAT-VON
                 BY    REFERENCE MEINDAT
      *
                 IF GK-DAT-BIS (1:2)     = '31' AND
                    GK-DAT-BIS (4:2)     = '12' AND
                    GK-DAT-BIS (7:4)     = '9999'
      *          FALLS GK-DAT-BIS   GLEICH 31.12.9999
                    MOVE ZERO                 TO MAUSDAT
                 ELSE
170703*             CALL 'UPVB0064' USING
170703              CALL K-UPVB0064 USING
                    BY    CONTENT   GK-DAT-BIS
                    BY    REFERENCE MAUSDAT
                 END-IF
      *
                 MOVE  999            TO MSTUFE (1)
      *
TTMMJJ*          MOVE SQLCODE         TO WLR-SQL-CODE
           WHEN       100
                 SET VERARB-LOG-FEHLER     TO TRUE
                 MOVE 'GK-ST-NR'           TO WK-TABLE-KEY
                 MOVE  GK-ST-NR            TO WK-ST-NR1
                 MOVE  WK-FEHLER-TEXT1     TO WLR-FEHLER-TEXT
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
       GK-ERMITT-EXIT.
           EXIT.
