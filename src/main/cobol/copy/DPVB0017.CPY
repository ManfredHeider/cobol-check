      *---------------------------------------------------------------*
      *    Standard für alle Objekte unter PVCS
      *            Datum   :  November 1995
      *            Kopf aus:  N:\PROFILE\KOPFCBL.DAT
      *---------------------------------------------------------------*
      *
      *---------------------------------------------------------------*
      *    Copyright 1995 ATLAS Dienstleistungs GmbH
      *---------------------------------------------------------------*
      *    $Workfile:   DPVB0017.CPY  $
      *    $Revision:   2.1  $
      *
      *    $Log:   L:/mf/CPY/DPVB0017.CPv  $
      *
      *   Rev 2.1   Jul 18 2003 15:03:40   t13ex22
      *AVB00666.UE029: VBAS und ALP in QMF un stat. Aufrufe entfernt
      *
      *   Rev 2.0   Feb 27 1999 15:56:54   P13SP20
      *NT-Umstellung
      *
      *   Rev 1.1   Feb 28 1996 15:15:38   T13AE26
      *AFRZ0023: Anpassung an MF-Cobol Workbench
      *          (Nested Programs entf.)
      *
      *   Rev 1.0   Nov 04 1995 08:23:56   P13SP99
      *Initial revision.
      *
      *---------------------------------------------------------------*
      *****************************************************************
      *    COPY-MEMBER: DPVB0017                                      *
      *    LESEN DER TABLE JUR                                        *
      *    UND FÜLLEN DER RELEVANTEN DATENFELDER AUS WLR-VB1-STRUK    *
      *    --------------------------------------------------------   *
      *    ERSTELLT: O. NAUMANN       (DVAG)                          *
      *    DATUM:    01.04.1993                                       *
      *****************************************************************
      *    VERSION   01   16.09.93                                   *
      *****************************************************************
      * AENDERUNGEN:                                                 *
      * AUFTRAG ! DATUM  !VER ! AENDERUNG                 ! NAME     *
      * -------------------------------------------------------------*
      *         !27.08.93!    ! S. WARTUNGSAUFTRAG SCHNITTSTELLEN-   *
      *         !        !    ! MODULE V. 26.08.93, PUNKT 2          *
      *         !        !    ! ANREDE-KZ = 5 FÜR JUR     ! NAUMANN  *
      *         !16.09.93! 01 ! PROD.ÜBERGABE             ! NAUMANN  *
      * AFRZ0023!03.11.95!    ! Anpassung an MF-Cobol-    !          *
      *         !        ! 02 !  WORKBENCH                ! GERLACH  *
      *         !        !    !                           !          *
      * AVB00666!17.07.03! 2.1! STAT. AUFRUF ENTFERNT     ! MUND     *
      *         !        !    !                           !          *
      *         !        !    !                           !          *
      *         !        !    !                           !          *
      *                                                              *
      * ENDE-LOGBUCH                                                 *
      ****************************************************************
      *----------------------------------------------------------
       JUR-ERMITT SECTION.
      *----------------------------------------------------------
       JUR-ERMITT-ANF.

           PERFORM  WITH TEST AFTER
                    VARYING  IND-I  FROM   1  BY  1
                                    UNTIL  IND-I   >  WK-LESEN-MAX
                                     OR    (SQLCODE  NOT =  -904)
           EXEC SQL
              SELECT
                    JUR_ST_NR,
                    JUR_LAST_UPDATE,
                    JUR_DAT_VON,
                    JUR_DAT_BIS,
                    JUR_PROV_STZ_AP,
                    JUR_PROV_STZ_GP,
                    JUR_PROZ_STZ,
                    JUR_RCK_STZ_DAT,
                    JUR_RCK_STZ,
                    KTY_VERSAND,
                    KNR_VERSAND,
                    JUR_BEZ
              INTO
                    :DCL-VIVB0051.JUR-ST-NR
                     :NI-VIVB0051.NI-JUR-ST-NR
                   ,:DCL-VIVB0051.JUR-LAST-UPDATE
                     :NI-VIVB0051.NI-JUR-LAST-UPDATE
                   ,:DCL-VIVB0051.JUR-DAT-VON
                     :NI-VIVB0051.NI-JUR-DAT-VON
                   ,:DCL-VIVB0051.JUR-DAT-BIS
                     :NI-VIVB0051.NI-JUR-DAT-BIS
                   ,:DCL-VIVB0051.JUR-PROV-STZ-AP
                     :NI-VIVB0051.NI-JUR-PROV-STZ-AP
                   ,:DCL-VIVB0051.JUR-PROV-STZ-GP
                     :NI-VIVB0051.NI-JUR-PROV-STZ-GP
                   ,:DCL-VIVB0051.JUR-PROZ-STZ
                     :NI-VIVB0051.NI-JUR-PROZ-STZ
                   ,:DCL-VIVB0051.JUR-RCK-STZ-DAT
                     :NI-VIVB0051.NI-JUR-RCK-STZ-DAT
                   ,:DCL-VIVB0051.JUR-RCK-STZ
                     :NI-VIVB0051.NI-JUR-RCK-STZ
                   ,:DCL-VIVB0051.KTY-VERSAND
                     :NI-VIVB0051.NI-KTY-VERSAND
                   ,:DCL-VIVB0051.KNR-VERSAND
                     :NI-VIVB0051.NI-KNR-VERSAND
                   ,:DCL-VIVB0051.JUR-BEZ
                     :NI-VIVB0051.NI-JUR-BEZ
              FROM
                    VIVB0051
              WHERE
                    JUR_ST_NR       =   :JUR-ST-NR
           END-EXEC

           END-PERFORM

           EVALUATE   SQLCODE
           WHEN       KS-OK
270893           MOVE K-KNR-FIRMA          TO MANREDE
                 MOVE JUR-BEZ (1:20)       TO MZUNAM
      *
                 MOVE JUR-RCK-STZ          TO MPROVRUECK
170703*          CALL 'UPVB0064' USING
170703           CALL K-UPVB0064 USING
                 BY    CONTENT   JUR-RCK-STZ-DAT
                 BY    REFERENCE MPROVDAT
      *
170703*          CALL 'UPVB0064' USING
170703           CALL K-UPVB0064 USING
                 BY    CONTENT   JUR-DAT-VON
                 BY    REFERENCE MEINDAT
      *
                 IF   NI-JUR-DAT-BIS     = - 1
                      MOVE   000000      TO MAUSDAT
                 ELSE
170703*             CALL 'UPVB0064' USING
170703              CALL K-UPVB0064 USING
                    BY    CONTENT   JUR-DAT-BIS
                    BY    REFERENCE MAUSDAT
                 END-IF

                 MOVE JUR-ST-NR       TO Z-ST-NR
                 MOVE JUR-PROV-STZ-AP TO Z-PROV-STZ-AP
                 MOVE JUR-PROV-STZ-GP TO Z-PROV-STZ-GP
                 MOVE JUR-PROZ-STZ    TO Z-PROZ-STZ
                 PERFORM KL-JUR-KONVERT
                 MOVE Z-STUFE         TO MSTUFE (1)
                 MOVE Z-EPROVKZ       TO MEPROVKZ (1)
           WHEN       KS-NOT-FOUND
                 SET VERARB-LOG-FEHLER     TO TRUE
                 MOVE 'JUR-ST-NR'          TO WK-TABLE-KEY
                 MOVE  JUR-ST-NR           TO WK-ST-NR1
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
       JUR-ERMITT-EXIT.
           EXIT.
