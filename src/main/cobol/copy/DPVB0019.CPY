      *---------------------------------------------------------------*
      *    Standard für alle Objekte unter PVCS
      *            Datum   :  November 1995
      *            Kopf aus:  N:\PROFILE\KOPFCBL.DAT
      *---------------------------------------------------------------*
      *
      *---------------------------------------------------------------*
      *    Copyright 1995 ATLAS Dienstleistungs GmbH
      *---------------------------------------------------------------*
      *    $Workfile:   DPVB0019.CPY  $
      *    $Revision:   2.1  $
      *
      *    $Log:   L:/mf/CPY/DPVB0019.CPv  $
      *
      *   Rev 2.1   Jul 18 2003 15:03:50   t13ex22
      *AVB00666.UE029: VBAS und ALP in QMF un stat. Aufrufe entfernt
      *
      *   Rev 2.0   Feb 27 1999 15:56:54   P13SP20
      *NT-Umstellung
      *
      *   Rev 1.1   Feb 28 1996 15:20:18   T13AE26
      *AFRZ0023: Anpassung an MF-Cobol Workbench
      *          (Nested Programs entf.)
      *
      *   Rev 1.0   Nov 04 1995 08:24:26   P13SP99
      *Initial revision.
      *
      *---------------------------------------------------------------*
      *****************************************************************
      *    COPY-MEMBER: DPVB0019                                      *
      *    LESEN DER TABLE RFT                                        *
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
      *         !        !    !                           !          *
      * AVB00666!17.07.03! 2.1! STAT. AUFRUF ENTFERNT     ! MUND     *
      *         !        !    !                           !          *
      *         !        !    !                           !          *
      *                                                              *
      * ENDE-LOGBUCH                                                 *
      ****************************************************************
      *----------------------------------------------------------
       RFT-ERMITT SECTION.
      *----------------------------------------------------------
       RFT-ERMITT-ANF.

           PERFORM  WITH TEST AFTER
                    VARYING  IND-I  FROM   1  BY  1
                                    UNTIL  IND-I   >  WK-LESEN-MAX
                                     OR    (SQLCODE  NOT =  -904)
           EXEC SQL
              SELECT
                    RFT_ST_NR,
                    RFT_LAST_UPDATE,
                    MA_ST_NR,
                    RFT_PROV_STZ_AP,
                    RFT_PROV_STZ_GP,
                    RFT_PROZ_STZ,
                    RFT_RCK_STZ,
                    RFT_RCK_STZ_DAT,
                    RFT_DAT_VON,
                    RFT_DAT_BIS,
                    RFT_ABLAUF_DAT
              INTO
                    :DCL-VIVB0005.RFT-ST-NR
                     :NI-VIVB0005.NI-RFT-ST-NR
                   ,:DCL-VIVB0005.RFT-LAST-UPDATE
                     :NI-VIVB0005.NI-RFT-LAST-UPDATE
                   ,:DCL-VIVB0005.MA-ST-NR
                     :NI-VIVB0005.NI-MA-ST-NR
                   ,:DCL-VIVB0005.RFT-PROV-STZ-AP
                     :NI-VIVB0005.NI-RFT-PROV-STZ-AP
                   ,:DCL-VIVB0005.RFT-PROV-STZ-GP
                     :NI-VIVB0005.NI-RFT-PROV-STZ-GP
                   ,:DCL-VIVB0005.RFT-PROZ-STZ
                     :NI-VIVB0005.NI-RFT-PROZ-STZ
                   ,:DCL-VIVB0005.RFT-RCK-STZ
                     :NI-VIVB0005.NI-RFT-RCK-STZ
                   ,:DCL-VIVB0005.RFT-RCK-STZ-DAT
                     :NI-VIVB0005.NI-RFT-RCK-STZ-DAT
                   ,:DCL-VIVB0005.RFT-DAT-VON
                     :NI-VIVB0005.NI-RFT-DAT-VON
                   ,:DCL-VIVB0005.RFT-DAT-BIS
                     :NI-VIVB0005.NI-RFT-DAT-BIS
                   ,:DCL-VIVB0005.RFT-ABLAUF-DAT
                     :NI-VIVB0005.NI-RFT-ABLAUF-DAT
              FROM
                    VIVB0005
              WHERE
                    RFT_ST_NR        =   :RFT-ST-NR
           END-EXEC

           END-PERFORM

           EVALUATE   SQLCODE
           WHEN       0
                 IF  RFT-PROV-STZ-GP    >=   RFT-PROV-STZ-AP
                     MOVE RFT-PROV-STZ-GP   TO MVARPROV (1)
                 ELSE
                     MOVE RFT-PROV-STZ-AP   TO MVARPROV (1)
                 END-IF
      *
                 MOVE RFT-RCK-STZ           TO MPROVRUECK
170703*          CALL 'UPVB0064' USING
170703           CALL K-UPVB0064 USING
                 BY    CONTENT   RFT-RCK-STZ-DAT
                 BY    REFERENCE MPROVDAT
      *
170703*          CALL 'UPVB0064' USING
170703           CALL K-UPVB0064 USING
                 BY    CONTENT   RFT-DAT-VON
                 BY    REFERENCE MEINDAT
      *
                 IF   NI-RFT-DAT-BIS     = - 1
                      MOVE   000000             TO MAUSDAT
                 ELSE
170703*               CALL 'UPVB0064' USING
170703                CALL K-UPVB0064 USING
                      BY    CONTENT   RFT-DAT-BIS
                      BY    REFERENCE MAUSDAT
                 END-IF
      *
                 MOVE  888            TO MSTUFE (1)
      *
           WHEN       100
                 SET VERARB-LOG-FEHLER     TO TRUE
                 MOVE 'RFT-ST-NR'          TO WK-TABLE-KEY
                 MOVE  RFT-ST-NR           TO WK-ST-NR1
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
       RFT-ERMITT-EXIT.
           EXIT.
