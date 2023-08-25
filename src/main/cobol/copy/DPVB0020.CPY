      *---------------------------------------------------------------*
      *    Standard für alle Objekte unter PVCS
      *            Datum   :  November 1995
      *            Kopf aus:  N:\PROFILE\KOPFCBL.DAT
      *---------------------------------------------------------------*
      *
      *---------------------------------------------------------------*
      *    Copyright 1995 ATLAS Dienstleistungs GmbH
      *---------------------------------------------------------------*
      *    $Workfile:   DPVB0020.CPY  $
      *    $Revision:   2.2  $
      *
      *    $Log:   L:/mf/CPY/DPVB0020.CPv  $
      *
      *   Rev 2.2   Sep 26 2003 15:00:22   t13ex22
      *AVB00568: Erf. "Anwerber" VB11/13;Anz. im UU11; Änderung im VB21
      *
      *   Rev 2.1   Jul 18 2003 15:03:56   t13ex22
      *AVB00666.UE029: VBAS und ALP in QMF un stat. Aufrufe entfernt
      *
      *   Rev 2.0   Feb 27 1999 15:56:54   P13SP20
      *NT-Umstellung
      *
      *   Rev 1.1   Feb 28 1996 15:20:46   T13AE26
      *AFRZ0023: Anpassung an MF-Cobol Workbench
      *          (Nested Programs entf.)
      *
      *   Rev 1.0   Nov 04 1995 08:24:40   P13SP99
      *Initial revision.
      *
      *---------------------------------------------------------------*
      *****************************************************************
      *    COPY-MEMBER: DPVB0020                                      *
      *    LESEN DER TABLE MA                                         *
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
      *         !        !    !                           !          *
      *                                                              *
      * ENDE-LOGBUCH                                                 *
      ****************************************************************
      *----------------------------------------------------------
       MA-ERMITT SECTION.
      *----------------------------------------------------------
       MA-ERMITT-ANF.
           PERFORM  WITH TEST AFTER
                    VARYING  IND-I  FROM   1  BY  1
                                    UNTIL  IND-I   >  WK-LESEN-MAX
                                     OR    (SQLCODE  NOT =  -904)
           EXEC SQL
              SELECT
                    MA_ST_NR,
                    MA_LAST_UPDATE,
                    KTY_MA_TYP,
                    KNR_MA_TYP,
                    MA_BDV_MITGLIED,
                    MA_STRAFE,
                    MA_VERSANDSTOP,
                    MA_ZV_ZVII_ABL,
                    MA_RCK_STZ,
                    MA_RCK_STZ_DAT,
                    MA_FUEH_ZEUG_DAT,
                    MA_SCHUFA_DAT,
                    MA_34C_DAT,
                    MA_AFO,
                    MA_DARLEHEN,
                    MA_AVAG_DVAG,
                    MA_KOMPASS_AVAG,
                    MA_AUTOTELEFON,
                    MA_TELETEXT,
                    MA_ZV_NR,
                    MA_ZV_DAT_BIS_R,
                    MA_ZV_DAT_BIS,
                    MA_ZV_DAT_VON,
                    MA_ZV_KUE_DAT,
040803              MA_ED_ZUSATZ,
040803              MA_ZV_VERL,
040803              MA_FG_DAT,
040803              MA_127_DAT,
040803              MA_VA_DAT,
040803              MA_ANWERBER,
040803              MA_BEFBED_NEU
              INTO
040803*             :DCL-VIVB0004 UND NI-VIVB0004 JEWEILS AUF VIVBD004
040803*             GEÄNDERT
                    :DCL-VIVBD004.MA-ST-NR
                     :NI-VIVBD004.NI-MA-ST-NR
                   ,:DCL-VIVBD004.MA-LAST-UPDATE
                     :NI-VIVBD004.NI-MA-LAST-UPDATE
                   ,:DCL-VIVBD004.KTY-MA-TYP
                     :NI-VIVBD004.NI-KTY-MA-TYP
                   ,:DCL-VIVBD004.KNR-MA-TYP
                     :NI-VIVBD004.NI-KNR-MA-TYP
                   ,:DCL-VIVBD004.MA-BDV-MITGLIED
                     :NI-VIVBD004.NI-MA-BDV-MITGLIED
                   ,:DCL-VIVBD004.MA-STRAFE
                     :NI-VIVBD004.NI-MA-STRAFE
                   ,:DCL-VIVBD004.MA-VERSANDSTOP
                     :NI-VIVBD004.NI-MA-VERSANDSTOP
                   ,:DCL-VIVBD004.MA-ZV-ZVII-ABL
                     :NI-VIVBD004.NI-MA-ZV-ZVII-ABL
                   ,:DCL-VIVBD004.MA-RCK-STZ
                     :NI-VIVBD004.NI-MA-RCK-STZ
                   ,:DCL-VIVBD004.MA-RCK-STZ-DAT
                     :NI-VIVBD004.NI-MA-RCK-STZ-DAT
                   ,:DCL-VIVBD004.MA-FUEH-ZEUG-DAT
                     :NI-VIVBD004.NI-MA-FUEH-ZEUG-DAT
                   ,:DCL-VIVBD004.MA-SCHUFA-DAT
                     :NI-VIVBD004.NI-MA-SCHUFA-DAT
                   ,:DCL-VIVBD004.MA-34C-DAT
                     :NI-VIVBD004.NI-MA-34C-DAT
                   ,:DCL-VIVBD004.MA-AFO
                     :NI-VIVBD004.NI-MA-AFO
                   ,:DCL-VIVBD004.MA-DARLEHEN
                     :NI-VIVBD004.NI-MA-DARLEHEN
                   ,:DCL-VIVBD004.MA-AVAG-DVAG
                     :NI-VIVBD004.NI-MA-AVAG-DVAG
                   ,:DCL-VIVBD004.MA-KOMPASS-AVAG
                     :NI-VIVBD004.NI-MA-KOMPASS-AVAG
                   ,:DCL-VIVBD004.MA-AUTOTELEFON
                     :NI-VIVBD004.NI-MA-AUTOTELEFON
                   ,:DCL-VIVBD004.MA-TELETEXT
                     :NI-VIVBD004.NI-MA-TELETEXT
                   ,:DCL-VIVBD004.MA-ZV-NR
                     :NI-VIVBD004.NI-MA-ZV-NR
                   ,:DCL-VIVBD004.MA-ZV-DAT-BIS-R
                     :NI-VIVBD004.NI-MA-ZV-DAT-BIS-R
                   ,:DCL-VIVBD004.MA-ZV-DAT-BIS
                     :NI-VIVBD004.NI-MA-ZV-DAT-BIS
                   ,:DCL-VIVBD004.MA-ZV-DAT-VON
                     :NI-VIVBD004.NI-MA-ZV-DAT-VON
                   ,:DCL-VIVBD004.MA-ZV-KUE-DAT
                     :NI-VIVBD004.NI-MA-ZV-KUE-DAT
040803             ,:DCL-VIVBD004.MA-ED-ZUSATZ
040803               :NI-VIVBD004.NI-MA-ED-ZUSATZ
040803             ,:DCL-VIVBD004.MA-ZV-VERL
040803               :NI-VIVBD004.NI-MA-ZV-VERL
040803             ,:DCL-VIVBD004.MA-FG-DAT
040803               :NI-VIVBD004.NI-MA-FG-DAT
040803             ,:DCL-VIVBD004.MA-127-DAT
040803               :NI-VIVBD004.NI-MA-127-DAT
040803             ,:DCL-VIVBD004.MA-VA-DAT
040803               :NI-VIVBD004.NI-MA-VA-DAT
040803             ,:DCL-VIVBD004.MA-ANWERBER
040803               :NI-VIVBD004.NI-MA-ANWERBER
040803             ,:DCL-VIVBD004.MA-BEFBED-NEU
040803               :NI-VIVBD004.NI-MA-BEFBED-NEU

              FROM
040803*             VIVB0004
040803              VIVBD004
              WHERE
040803*             MA_ST_NR        =   :DCL-VIVB0004.MA-ST-NR
040803              MA_ST_NR        =   :DCL-VIVBD004.MA-ST-NR
           END-EXEC

           END-PERFORM

           EVALUATE   SQLCODE
           WHEN       0
                 MOVE MA-RCK-STZ           TO MPROVRUECK
170703*          CALL 'UPVB0064' USING
170703           CALL K-UPVB0064 USING
                 BY    CONTENT   MA-RCK-STZ-DAT
                 BY    REFERENCE MPROVDAT
      *
TTMMJJ*          MOVE SQLCODE              TO WLR-SQL-CODE
           WHEN       100
                 SET VERARB-LOG-FEHLER     TO TRUE
                 MOVE 'MA-ST-NR'           TO WK-TABLE-KEY
040803*          MOVE  MA-ST-NR IN DCL-VIVB0004
040803           MOVE  MA-ST-NR IN DCL-VIVBD004
                                           TO WK-ST-NR1
                 MOVE  WK-FEHLER-TEXT1     TO WLR-FEHLER-TEXT
           WHEN       OTHER
                 SET VERARB-SQL-CODE-EX    TO TRUE
                 MOVE SQLCODE              TO WLR-SQL-CODE
                 IF    SQLERRML       >   ZERO
                     MOVE  SQLERRMC        TO WLR-FEHLER-TEXT
                  ELSE
                      MOVE  SPACE          TO WLR-FEHLER-TEXT
                 END-IF
           END-EVALUATE
           .
       MA-ERMITT-EXIT.
           EXIT.
