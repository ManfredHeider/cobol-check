      *---------------------------------------------------------------*
      *    Standard für alle Objekte unter PVCS
      *            Datum   :  November 1995
      *            Kopf aus:  N:\PROFILE\KOPFCBL.DAT
      *---------------------------------------------------------------*
      *
      *---------------------------------------------------------------*
      *    Copyright 1995 ATLAS Dienstleistungs GmbH
      *---------------------------------------------------------------*
      *    $Workfile:   DPVB0018.CPY  $
      *    $Revision:   2.1  $
      *
      *    $Log:   L:/mf/CPY/DPVB0018.CPv  $
      *
      *   Rev 2.1   Jul 18 2003 15:03:46   t13ex22
      *AVB00666.UE029: VBAS und ALP in QMF un stat. Aufrufe entfernt
      *
      *   Rev 2.0   Feb 27 1999 15:56:54   P13SP20
      *NT-Umstellung
      *
      *   Rev 1.1   Feb 28 1996 15:19:46   T13AE26
      *AFRZ0023: Anpassung an MF-Cobol Workbench
      *          (Nested Programs entf.)
      *
      *   Rev 1.0   Nov 04 1995 08:24:12   P13SP99
      *Initial revision.
      *
      *---------------------------------------------------------------*
      *****************************************************************
      *    COPY-MEMBER: DPVB0018                                      *
      *    LESEN DER TABLE KL                                         *
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
      *         !12.08.93!    !MVARPROV-BERECHNUNG NICHT  ! NAUMANN  *
      *         !        !    !KORREKT.                   !          *
      *         !16.09.93! 01 !PROD.UEBERGABE             ! NAUMANN  *
      * AFRZ0023!03.11.95!    ! Anpassung an MF-Cobol-    !          *
      *         !        ! 02 !  WORKBENCH                ! GERLACH  *
      * AVB00666!17.07.03! 2.1! STAT. AUFRUF ENTFERNT     ! MUND     *
      *         !        !    !                           !          *
      *                                                              *
      * ENDE-LOGBUCH                                                 *
      ****************************************************************
      *----------------------------------------------------------
       KL-ERMITT SECTION.
      *----------------------------------------------------------
       KL-ERMITT-ANF.

           PERFORM  WITH TEST AFTER
                    VARYING  IND-I  FROM   1  BY  1
                                    UNTIL  IND-I   >  WK-LESEN-MAX
                                     OR    (SQLCODE  NOT =  -904)
           EXEC SQL
              SELECT
                    KL_ST_NR,
                    KL_LAST_UPDATE,
                    KL_DAT_VON,
                    KL_DAT_BIS,
                    KL_PROV_STZ_AP,
                    KL_PROV_STZ_GP,
                    KL_PROZ_STZ,
                    KL_RCK_STZ_DAT,
                    KL_RCK_STZ
              INTO
                    :DCL-VIVB0040.KL-ST-NR
                     :NI-VIVB0040.NI-KL-ST-NR
                   ,:DCL-VIVB0040.KL-LAST-UPDATE
                     :NI-VIVB0040.NI-KL-LAST-UPDATE
                   ,:DCL-VIVB0040.KL-DAT-VON
                     :NI-VIVB0040.NI-KL-DAT-VON
                   ,:DCL-VIVB0040.KL-DAT-BIS
                     :NI-VIVB0040.NI-KL-DAT-BIS
                   ,:DCL-VIVB0040.KL-PROV-STZ-AP
                     :NI-VIVB0040.NI-KL-PROV-STZ-AP
                   ,:DCL-VIVB0040.KL-PROV-STZ-GP
                     :NI-VIVB0040.NI-KL-PROV-STZ-GP
                   ,:DCL-VIVB0040.KL-PROZ-STZ
                     :NI-VIVB0040.NI-KL-PROZ-STZ
                   ,:DCL-VIVB0040.KL-RCK-STZ-DAT
                     :NI-VIVB0040.NI-KL-RCK-STZ-DAT
                   ,:DCL-VIVB0040.KL-RCK-STZ
                     :NI-VIVB0040.NI-KL-RCK-STZ
              FROM
                    VIVB0040
              WHERE
                    KL_ST_NR        =   :KL-ST-NR
           END-EXEC

           END-PERFORM

           EVALUATE   SQLCODE
           WHEN       0
120893*          IF  KL-PROV-STZ-GP    >=   KL-PROV-STZ-AP
120893*              MOVE KL-PROV-STZ-GP    TO MVARPROV (1)
120893*          ELSE
120893*              MOVE KL-PROV-STZ-AP    TO MVARPROV (1)
120893*          END-IF
      *
                 MOVE KL-RCK-STZ           TO MPROVRUECK
170703*          CALL 'UPVB0064' USING
170703           CALL K-UPVB0064 USING
                 BY    CONTENT   KL-RCK-STZ-DAT
                 BY    REFERENCE MPROVDAT
      *
170703*          CALL 'UPVB0064' USING
170703           CALL K-UPVB0064 USING
                 BY    CONTENT   KL-DAT-VON
                 BY    REFERENCE MEINDAT
      *
                 IF   NI-KL-DAT-BIS     = - 1
                      MOVE   000000             TO MAUSDAT
                 ELSE
170703*               CALL 'UPVB0064' USING
170703                CALL K-UPVB0064 USING
                      BY    CONTENT   KL-DAT-BIS
                      BY    REFERENCE MAUSDAT
                 END-IF

                 MOVE KL-ST-NR        TO Z-ST-NR
                 MOVE KL-PROV-STZ-AP  TO Z-PROV-STZ-AP
                 MOVE KL-PROV-STZ-GP  TO Z-PROV-STZ-GP
                 MOVE KL-PROZ-STZ     TO Z-PROZ-STZ
                 PERFORM KL-JUR-KONVERT
                 MOVE  Z-STUFE        TO MSTUFE (1)
                 MOVE  Z-EPROVKZ      TO MEPROVKZ (1)
120893           MOVE  Z-VARPROV      TO MVARPROV (1)
           WHEN       100
                 SET VERARB-LOG-FEHLER     TO TRUE
                 MOVE 'KL-ST-NR'           TO WK-TABLE-KEY
                 MOVE  KL-ST-NR            TO WK-ST-NR1
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
       KL-ERMITT-EXIT.
           EXIT.
