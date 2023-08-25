      *---------------------------------------------------------------*
      *    Standard für alle Objekte unter PVCS
      *            Datum   :  November 1995
      *            Kopf aus:  N:\PROFILE\KOPFCBL.DAT
      *---------------------------------------------------------------*
      *
      *---------------------------------------------------------------*
      *    Copyright 1995 ATLAS Dienstleistungs GmbH
      *---------------------------------------------------------------*
      *    $Workfile:   DPVB0050.CPY  $
      *    $Revision:   2.3  $
      *
      *    $Log:   L:/mf/CPY/DPVB0050.CPv  $
      *
      *   Rev 2.3   Jan 18 2016 13:10:10   t13ae13
      *FVB00789: Fehler bei Strukturermittlung mit in Zukunft austr
      *etenden ED
      *
      *   Rev 2.2   Jun 23 2009 11:18:34   t13ae13
      *AVB01029: Wahlmöglichkeit bei ED-Regelung - Rest
      *
      *   Rev 2.1   Jul 18 2003 15:04:08   t13ex22
      *AVB00666.UE029: VBAS und ALP in QMF un stat. Aufrufe entfernt
      *
      *   Rev 2.0   Feb 27 1999 15:57:36   P13SP20
      *NT-Umstellung
      *
      *   Rev 1.1   Feb 28 1996 15:22:58   T13AE26
      *AFRZ0023: Anpassung an MF-Cobol Workbench
      *          (Nested Programs entf.)
      *
      *   Rev 1.0   Nov 04 1995 08:31:04   P13SP99
      *Initial revision.
      *
      *---------------------------------------------------------------*
      *****************************************************************
      *    COPY-MEMBER: DPVB0050                                      *
      *    LESEN DER TABLE ED                                         *
      *    UND FÜLLEN DER RELEVANTEN DATENFELDER AUS WLR-VB1-STRUK    *
      *    ÄNDERUNGEN AN DIESEM COPY MÜSSEN EVENTUELL AUCH IM COPY    *
      *    DPVB0021 NACHGEZOGEN WERDEN. PRÜFEN!                       *
      *    --------------------------------------------------------   *
      *    ERSTELLT: O. NAUMANN       (DVAG)                          *
      *    DATUM:    01.04.1993                                       *
      *****************************************************************
      *    VERSION   2    23.05.95 10:52:54
      ****************************************************************
      * AENDERUNGEN:                                                 *
      * AUFTRAG ! DATUM  !VER ! AENDERUNG                 ! NAME     *
      * -------------------------------------------------------------*
      *         !16.09.93! 01 ! NEU                       ! NAUMANN  *
      * AFVB0142!20.01.95! 02 ! NUR 'TÄTIGE' ED-KONTEN    ! GIESE    *
      *         !        !    ! DÜRFEN STUFENNR. BEKOMMEN !          *
      * FEVB0238!24.04.95! 03 ! NEUANLAGE DPVB0021-QUER-  ! GIESE    *
      *         !        !    ! VERWEIS UND COMPILE       !          *
      * FEVB0245!22.05.95! 04 ! EDT-ZUGRIFF KORRIGIERT    ! SCHÖLLH. *
      * AFRZ0023!03.11.95!    ! Anpassung an MF-Cobol-    !          *
      *         !        ! 05 !  WORKBENCH                ! GERLACH  *
      * AVB00666!17.07.03! 2.1! STAT. AUFRUF ENTFERNT     ! MUND     *
      * AVB01029!11.05.09!2.2 ! neue View VIVBA003        ! Walb     *
      * FVB00789!15.01.16!2.3 ! Stufe 768 für ausgesch. ED! Walb     *
      *         !        !    !                           !          *
      *         !        !    !                           !          *
      *                                                              *
      * ENDE-LOGBUCH                                                 *
      ****************************************************************
      *----------------------------------------------------------
       ED-ERMITT SECTION.
      *----------------------------------------------------------
       ED-ERMITT-ANF.

           PERFORM  WITH TEST AFTER
                    VARYING  IND-I  FROM   1  BY  1
                                    UNTIL  IND-I   >  WK-LESEN-MAX
                                     OR    (SQLCODE  NOT =  -904)
           EXEC SQL
              SELECT
                    ED_ST_NR,
                    ED_LAST_UPDATE,
                    MA_ST_NR,
                    ED_RCK_STZ,
                    ED_RCK_STZ_DAT,
                    ED_BEZ
110509             ,ED_GENERATION
110509             ,ED_ZWEIG
110509             ,ED_ZWEIG_VOM
110509             ,ED_PROV1
110509             ,ED_PROV_DAT1
110509             ,ED_PROV2
110509             ,ED_PROV_DAT2
              INTO
110509*             :DCL-VIVB0003.ED-ST-NR
110509*              :NI-VIVB0003.NI-ED-ST-NR
110509*            ,:DCL-VIVB0003.ED-LAST-UPDATE
110509*              :NI-VIVB0003.NI-ED-LAST-UPDATE
110509*            ,:DCL-VIVB0003.MA-ST-NR
110509*              :NI-VIVB0003.NI-MA-ST-NR
110509*            ,:DCL-VIVB0003.ED-RCK-STZ
110509*              :NI-VIVB0003.NI-ED-RCK-STZ
110509*            ,:DCL-VIVB0003.ED-RCK-STZ-DAT
110509*              :NI-VIVB0003.NI-ED-RCK-STZ-DAT
110509*            ,:DCL-VIVB0003.ED-BEZ
110509*              :NI-VIVB0003.NI-ED-BEZ
110509              :DCL-VIVBA003.ED-ST-NR
110509               :NI-VIVBA003.NI-ED-ST-NR
110509             ,:DCL-VIVBA003.ED-LAST-UPDATE
110509               :NI-VIVBA003.NI-ED-LAST-UPDATE
110509             ,:DCL-VIVBA003.MA-ST-NR
110509               :NI-VIVBA003.NI-MA-ST-NR
110509             ,:DCL-VIVBA003.ED-RCK-STZ
110509               :NI-VIVBA003.NI-ED-RCK-STZ
110509             ,:DCL-VIVBA003.ED-RCK-STZ-DAT
110509               :NI-VIVBA003.NI-ED-RCK-STZ-DAT
110509             ,:DCL-VIVBA003.ED-BEZ
110509               :NI-VIVBA003.NI-ED-BEZ
110509             ,:DCL-VIVBA003.ED-GENERATION
110509               :NI-VIVBA003.NI-ED-GENERATION
110509             ,:DCL-VIVBA003.ED-ZWEIG
110509               :NI-VIVBA003.NI-ED-ZWEIG
110509             ,:DCL-VIVBA003.ED-ZWEIG-VOM
110509               :NI-VIVBA003.NI-ED-ZWEIG-VOM
110509             ,:DCL-VIVBA003.ED-PROV1
110509               :NI-VIVBA003.NI-ED-PROV1
110509             ,:DCL-VIVBA003.ED-PROV-DAT1
110509               :NI-VIVBA003.NI-ED-PROV-DAT1
110509             ,:DCL-VIVBA003.ED-PROV2
110509               :NI-VIVBA003.NI-ED-PROV2
110509             ,:DCL-VIVBA003.ED-PROV-DAT2
110509               :NI-VIVBA003.NI-ED-PROV-DAT2
              FROM
110509*             VIVB0003
110509              VIVBA003
              WHERE
110509*             ED_ST_NR        =   :DCL-VIVB0003.ED-ST-NR
110509              ED_ST_NR        =   :DCL-VIVBA003.ED-ST-NR
           END-EXEC

           END-PERFORM

           EVALUATE   SQLCODE
           WHEN       0
                 MOVE ED-BEZ (1:20)   TO MZUNAM
                 MOVE ED-RCK-STZ      TO MPROVRUECK
      *
170703*          CALL 'UPVB0064' USING
170703           CALL K-UPVB0064 USING
                 BY    CONTENT   ED-RCK-STZ-DAT
                 BY    REFERENCE MPROVDAT
      *
200195*          MOVE  768            TO MSTUFE (1)
200195***        *** NEU ANFANG
200195*          * PRÜFEN, WANN ED-KONTO EINGERICHTET WURDE
                 EXEC SQL
                    SELECT
                          ED_ST_NR
                    INTO
                          :DCL-VIVB0045.ED-ST-NR
                           :NI-VIVB0045.NI-ED-ST-NR
                    FROM
                          VIVB0045
                    WHERE
110509*                   ED_ST_NR     =   :DCL-VIVB0003.ED-ST-NR
110509                    ED_ST_NR     =   :DCL-VIVBA003.ED-ST-NR
220595               AND  EDT_DAT_VON <=   :Z-ZTPKT-TSTMP
220595               AND  EDT_DAT_BIS  >   :Z-ZTPKT-DATE
220595*               AND  EDT_DAT_VON <=   :Z-ZTPKT-TSTMP
                 END-EXEC
                 EVALUATE   SQLCODE
                 WHEN 0
      *             * ED-KONTO ZUM ZEITPUNKT 'TÄTIG'
                    MOVE  768              TO MSTUFE (1)
                 WHEN 100
      *             * ED-KONTO ZUM ZEITPUNKT NICHT 'TÄTIG'
150116*          Stufe muss doch gesetzt werden, da sonst keine Struktur
150116*          in Zukunft ermittelt werden kann (DAISY)
150116*             MOVE  ZERO             TO MSTUFE (1)
150116              MOVE  768              TO MSTUFE (1)
                 WHEN OTHER
                    SET VERARB-SQL-CODE-EX TO TRUE
                    MOVE SQLCODE           TO WLR-SQL-CODE
                    IF SQLERRML            >   ZERO
                       MOVE  SQLERRMC      TO   WLR-FEHLER-TEXT
                    ELSE
                       MOVE  SPACE         TO   WLR-FEHLER-TEXT
                    END-IF
                 END-EVALUATE
200195***        *** NEU ENDE
      *
TTMMJJ*          MOVE SQLCODE         TO WLR-SQL-CODE
           WHEN       100
                 SET VERARB-LOG-FEHLER     TO TRUE
                 MOVE 'ED-ST-NR'           TO WK-TABLE-KEY
110509*          MOVE  ED-ST-NR IN DCL-VIVB0003
110509           MOVE  ED-ST-NR IN DCL-VIVBA003
                                           TO WK-ST-NR1
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
       ED-ERMITT-EXIT.
           EXIT.

