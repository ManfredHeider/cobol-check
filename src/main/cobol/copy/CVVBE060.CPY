      *---------------------------------------------------------------*
      *    Standard fuer alle Objekte unter PVCS VersionManager
      *            Datum      :  10.02.2020
      *            Kategorie  :  Copystrecke
      *---------------------------------------------------------------*
      *    Copyright (c) 2020 ATLAS Dienstleistungen f. V. GmbH
      *---------------------------------------------------------------*
      *    $Workfile:   CVVBE060.CPY  $
      *    $Revision:   2.1  $
      *
      *    $Log:   L:/mf/CPY/CVVBE060.CPv  $
      *
      *   Rev 2.1   Feb 17 2020 14:41:32   t13ae30
      *AVB01605: Nacharbeiten alle Clubs (VB-System)
      *
      *   Rev 2.0   Feb 10 2020 10:20:16   t13ae30
      *Archiverstellung
      *
      *---------------------------------------------------------------*
      *****************************************************************
      *    ERSTELLT: T13AE30                                          *
      *    DATUM:    06.02.2020                                       *
      *****************************************************************
      * AENDERUNGEN:                                                  *
      * AUFTRAG ! DATUM  !VER ! AENDERUNG                 ! NAME      *
      * --------+--------+----+---------------------------+---------- *
      * VBL-1975!06.02.20!2.1 ! NEU                       ! T13AE30   *
      *         !        !    !                           !           *
      *         !        !    !                           !           *
      * ENDE-LOGBUCH                                                  *
      *****************************************************************
      * DCLGEN TABLE(VIVBE060) CLPRUEF                                *
      *        LIBRARY(P130005.BP010000.SRCDCL(CVVBE060)              *
      *        ACTION(REPLACE)                                        *
      *        QUOTE                                                  *
      * ... DIESES DCLGEN WURDE GENERIERT MIT GENERCBL (REXX)         *
      *****************************************************************
 
           EXEC SQL DECLARE VIVBE060 TABLE
           ( MA_ST_NR                    INTEGER NOT NULL
           , KTY_CLUB_TYP                SMALLINT NOT NULL
           , KNR_CLUB_TYP                SMALLINT NOT NULL
           , CLUB_KRITERIUM              SMALLINT NOT NULL
           , CLUB_MS_NR                  SMALLINT
           , CL_MS_NR_ERF                CHAR(01)
           , CLUB_VBP_NR                 SMALLINT
           , CL_VBP_NR_ERF               CHAR(01)
           , CLUB_ANZ_KDN                SMALLINT
           , CL_ANZ_KDN_ERF              CHAR(01)
           , ANZ_KDN_2_PLUS              SMALLINT
           , CL_ANZ_KDN2_ERF             CHAR(01)
           , NET_NEU_EIG_12MON           DECIMAL(10, 1)
           , CL_NN_EIG12MO_ERF           CHAR(01)
           , MAX_EQF_EIG                 DECIMAL(05, 2)
           , CL_MAX_EQFEIG_ERF           CHAR(01)
           , BEITRAG_VOL                 DECIMAL(11, 2)
           , CL_BEITRAG_ERF              CHAR(01)
           , VB_SEIT_MIN_MON             SMALLINT
           , CL_VB_SEIT_ERF              CHAR(01)
           , AS_SEIT_MIN_MON             SMALLINT
           , CL_AS_SEIT_ERF              CHAR(01)
           , NET_EIG_GES_36MO            DECIMAL(10, 1)
           , CL_NEGES36MO_ERF            CHAR(01)
           , NET_GES_12MO                DECIMAL(10, 1)
           , CL_NGES12MO_ERF             CHAR(01)
           , KTY_TYP_BEN_CLUB            SMALLINT
           , KNR_TYP_BEN_CLUB            SMALLINT
           , CL_BEN_CLUB_ERF             CHAR(01)
           , KTY_TYP_BEEND_CLUB          SMALLINT
           , KNR_TYP_BEEND_CLUB          SMALLINT
           , CL_BEEND_CLUB_ERF           CHAR(01)
           , ED_ANZ_SOLL                 SMALLINT
           , CL_EDANZ_ERF                CHAR(01)
           , ANZ_PART_KAP                SMALLINT
           , CL_ANZPART_ERF              CHAR(01)
           , ANZ_AKT_STRUK_ADM           SMALLINT
           , CL_AKTSTRUK_ERF             CHAR(01)
           , EIG_GES_12MON               DECIMAL(10, 1)
           , CL_GES_EIG12MO_ERF          CHAR(01)
           , CLBED_DAT_VON               DATE NOT NULL
           , MAX_EQF_GES                 DECIMAL(05, 2)
           , CL_MX_EQFGES_ERF            CHAR(01)
           , ANZ_HAUPTBEPART             SMALLINT
           , CL_HAUPTPART_ERF            CHAR(01)
           , ANZ_NEU_DIR_PART            SMALLINT
           , CL_NEU_DPART_ERF            CHAR(01)
           , NET_NEU_GES_12MO            DECIMAL(10, 1)
           , CL_NNGES12MO_ERF            CHAR(01)
           , CL_ANZ_STERNE               SMALLINT
           , CL_ANZ_STERNE_ERF           CHAR(01)
           , FAKTOR_1                    DECIMAL(05, 2)
           , FAKTOR_1_ERF                CHAR(01)
           , FAKTOR_2                    DECIMAL(05, 2)
           , FAKTOR_2_ERF                CHAR(01)
           , FAKTOR_GES                  DECIMAL(05, 2)
           , FAKTOR_GES_ERF              CHAR(01)
           , BQF                         DECIMAL(05, 2)
           , BQF_ERF                     CHAR(01)
           , CL_GESICHERT_BIS            DATE
           , BED_ERF_MIN_MON             SMALLINT
           , BED_ERF_MM_ERF              CHAR(01)
           , KAP_SEIT_MIN_MON            SMALLINT
           , KAP_SEIT_MM_ERF             CHAR(01)
           , ED_MITGL_BIS                DATE
           , FAK_1_ISTWERT               DECIMAL(10, 1)
           , FAK_2_ISTWERT               DECIMAL(10, 1)
           , GES_EH_EIG_MAX              DECIMAL(10, 1)
           , EH_ZUSTRUK                  DECIMAL(10, 1)
           , EH_NEUE_ED                  DECIMAL(10, 1)
           , FAK2_200_KZ                 CHAR(01)
           , KRIT_ERF_KZ                 CHAR(01)
           , PRUEF_GES_KZ                CHAR(01)
           , ED_MITGL_ERF                CHAR(01)
           ) END-EXEC.
 
      *****************************************************************
      * COBOL DEKLARATION FUER VIEW VIVBE060                          *
      *****************************************************************
 
       01  VIVBE060-GESAMT.
        05 NI-VIVBE060-TAB.
           10 NI-VIVBE060-ELE      PIC S9(04)  BINARY OCCURS  74.
        05 NI-VIVBE060             REDEFINES   NI-VIVBE060-TAB.
           10 NI-MA-ST-NR                 PIC S9(04)       BINARY.
           10 NI-KTY-CLUB-TYP             PIC S9(04)       BINARY.
           10 NI-KNR-CLUB-TYP             PIC S9(04)       BINARY.
           10 NI-CLUB-KRITERIUM           PIC S9(04)       BINARY.
           10 NI-CLUB-MS-NR               PIC S9(04)       BINARY.
           10 NI-CL-MS-NR-ERF             PIC S9(04)       BINARY.
           10 NI-CLUB-VBP-NR              PIC S9(04)       BINARY.
           10 NI-CL-VBP-NR-ERF            PIC S9(04)       BINARY.
           10 NI-CLUB-ANZ-KDN             PIC S9(04)       BINARY.
           10 NI-CL-ANZ-KDN-ERF           PIC S9(04)       BINARY.
           10 NI-ANZ-KDN-2-PLUS           PIC S9(04)       BINARY.
           10 NI-CL-ANZ-KDN2-ERF          PIC S9(04)       BINARY.
           10 NI-NET-NEU-EIG-12MON        PIC S9(04)       BINARY.
           10 NI-CL-NN-EIG12MO-ERF        PIC S9(04)       BINARY.
           10 NI-MAX-EQF-EIG              PIC S9(04)       BINARY.
           10 NI-CL-MAX-EQFEIG-ERF        PIC S9(04)       BINARY.
           10 NI-BEITRAG-VOL              PIC S9(04)       BINARY.
           10 NI-CL-BEITRAG-ERF           PIC S9(04)       BINARY.
           10 NI-VB-SEIT-MIN-MON          PIC S9(04)       BINARY.
           10 NI-CL-VB-SEIT-ERF           PIC S9(04)       BINARY.
           10 NI-AS-SEIT-MIN-MON          PIC S9(04)       BINARY.
           10 NI-CL-AS-SEIT-ERF           PIC S9(04)       BINARY.
           10 NI-NET-EIG-GES-36MO         PIC S9(04)       BINARY.
           10 NI-CL-NEGES36MO-ERF         PIC S9(04)       BINARY.
           10 NI-NET-GES-12MO             PIC S9(04)       BINARY.
           10 NI-CL-NGES12MO-ERF          PIC S9(04)       BINARY.
           10 NI-KTY-TYP-BEN-CLUB         PIC S9(04)       BINARY.
           10 NI-KNR-TYP-BEN-CLUB         PIC S9(04)       BINARY.
           10 NI-CL-BEN-CLUB-ERF          PIC S9(04)       BINARY.
           10 NI-KTY-TYP-BEEND-CLUB       PIC S9(04)       BINARY.
           10 NI-KNR-TYP-BEEND-CLUB       PIC S9(04)       BINARY.
           10 NI-CL-BEEND-CLUB-ERF        PIC S9(04)       BINARY.
           10 NI-ED-ANZ-SOLL              PIC S9(04)       BINARY.
           10 NI-CL-EDANZ-ERF             PIC S9(04)       BINARY.
           10 NI-ANZ-PART-KAP             PIC S9(04)       BINARY.
           10 NI-CL-ANZPART-ERF           PIC S9(04)       BINARY.
           10 NI-ANZ-AKT-STRUK-ADM        PIC S9(04)       BINARY.
           10 NI-CL-AKTSTRUK-ERF          PIC S9(04)       BINARY.
           10 NI-EIG-GES-12MON            PIC S9(04)       BINARY.
           10 NI-CL-GES-EIG12MO-ERF       PIC S9(04)       BINARY.
           10 NI-CLBED-DAT-VON            PIC S9(04)       BINARY.
           10 NI-MAX-EQF-GES              PIC S9(04)       BINARY.
           10 NI-CL-MX-EQFGES-ERF         PIC S9(04)       BINARY.
           10 NI-ANZ-HAUPTBEPART          PIC S9(04)       BINARY.
           10 NI-CL-HAUPTPART-ERF         PIC S9(04)       BINARY.
           10 NI-ANZ-NEU-DIR-PART         PIC S9(04)       BINARY.
           10 NI-CL-NEU-DPART-ERF         PIC S9(04)       BINARY.
           10 NI-NET-NEU-GES-12MO         PIC S9(04)       BINARY.
           10 NI-CL-NNGES12MO-ERF         PIC S9(04)       BINARY.
           10 NI-CL-ANZ-STERNE            PIC S9(04)       BINARY.
           10 NI-CL-ANZ-STERNE-ERF        PIC S9(04)       BINARY.
           10 NI-FAKTOR-1                 PIC S9(04)       BINARY.
           10 NI-FAKTOR-1-ERF             PIC S9(04)       BINARY.
           10 NI-FAKTOR-2                 PIC S9(04)       BINARY.
           10 NI-FAKTOR-2-ERF             PIC S9(04)       BINARY.
           10 NI-FAKTOR-GES               PIC S9(04)       BINARY.
           10 NI-FAKTOR-GES-ERF           PIC S9(04)       BINARY.
           10 NI-BQF                      PIC S9(04)       BINARY.
           10 NI-BQF-ERF                  PIC S9(04)       BINARY.
           10 NI-CL-GESICHERT-BIS         PIC S9(04)       BINARY.
           10 NI-BED-ERF-MIN-MON          PIC S9(04)       BINARY.
           10 NI-BED-ERF-MM-ERF           PIC S9(04)       BINARY.
           10 NI-KAP-SEIT-MIN-MON         PIC S9(04)       BINARY.
           10 NI-KAP-SEIT-MM-ERF          PIC S9(04)       BINARY.
           10 NI-ED-MITGL-BIS             PIC S9(04)       BINARY.
           10 NI-FAK-1-ISTWERT            PIC S9(04)       BINARY.
           10 NI-FAK-2-ISTWERT            PIC S9(04)       BINARY.
           10 NI-GES-EH-EIG-MAX           PIC S9(04)       BINARY.
           10 NI-EH-ZUSTRUK               PIC S9(04)       BINARY.
           10 NI-EH-NEUE-ED               PIC S9(04)       BINARY.
           10 NI-FAK2-200-KZ              PIC S9(04)       BINARY.
           10 NI-KRIT-ERF-KZ              PIC S9(04)       BINARY.
           10 NI-PRUEF-GES-KZ             PIC S9(04)       BINARY.
           10 NI-ED-MITGL-ERF             PIC S9(04)       BINARY.
 
        05 DCL-VIVBE060.
           10 MA-ST-NR                    PIC S9(09)       BINARY.
           10 KTY-CLUB-TYP                PIC S9(04)       BINARY.
           10 KNR-CLUB-TYP                PIC S9(04)       BINARY.
           10 CLUB-KRITERIUM              PIC S9(04)       BINARY.
           10 CLUB-MS-NR                  PIC S9(04)       BINARY.
           10 CL-MS-NR-ERF                PIC  X(01).
           10 CLUB-VBP-NR                 PIC S9(04)       BINARY.
           10 CL-VBP-NR-ERF               PIC  X(01).
           10 CLUB-ANZ-KDN                PIC S9(04)       BINARY.
           10 CL-ANZ-KDN-ERF              PIC  X(01).
           10 ANZ-KDN-2-PLUS              PIC S9(04)       BINARY.
           10 CL-ANZ-KDN2-ERF             PIC  X(01).
           10 NET-NEU-EIG-12MON           PIC S9(09)V9(01) COMP-3.
           10 CL-NN-EIG12MO-ERF           PIC  X(01).
           10 MAX-EQF-EIG                 PIC S9(03)V9(02) COMP-3.
           10 CL-MAX-EQFEIG-ERF           PIC  X(01).
           10 BEITRAG-VOL                 PIC S9(09)V9(02) COMP-3.
           10 CL-BEITRAG-ERF              PIC  X(01).
           10 VB-SEIT-MIN-MON             PIC S9(04)       BINARY.
           10 CL-VB-SEIT-ERF              PIC  X(01).
           10 AS-SEIT-MIN-MON             PIC S9(04)       BINARY.
           10 CL-AS-SEIT-ERF              PIC  X(01).
           10 NET-EIG-GES-36MO            PIC S9(09)V9(01) COMP-3.
           10 CL-NEGES36MO-ERF            PIC  X(01).
           10 NET-GES-12MO                PIC S9(09)V9(01) COMP-3.
           10 CL-NGES12MO-ERF             PIC  X(01).
           10 KTY-TYP-BEN-CLUB            PIC S9(04)       BINARY.
           10 KNR-TYP-BEN-CLUB            PIC S9(04)       BINARY.
           10 CL-BEN-CLUB-ERF             PIC  X(01).
           10 KTY-TYP-BEEND-CLUB          PIC S9(04)       BINARY.
           10 KNR-TYP-BEEND-CLUB          PIC S9(04)       BINARY.
           10 CL-BEEND-CLUB-ERF           PIC  X(01).
           10 ED-ANZ-SOLL                 PIC S9(04)       BINARY.
           10 CL-EDANZ-ERF                PIC  X(01).
           10 ANZ-PART-KAP                PIC S9(04)       BINARY.
           10 CL-ANZPART-ERF              PIC  X(01).
           10 ANZ-AKT-STRUK-ADM           PIC S9(04)       BINARY.
           10 CL-AKTSTRUK-ERF             PIC  X(01).
           10 EIG-GES-12MON               PIC S9(09)V9(01) COMP-3.
           10 CL-GES-EIG12MO-ERF          PIC  X(01).
           10 CLBED-DAT-VON               PIC  X(10).
           10 MAX-EQF-GES                 PIC S9(03)V9(02) COMP-3.
           10 CL-MX-EQFGES-ERF            PIC  X(01).
           10 ANZ-HAUPTBEPART             PIC S9(04)       BINARY.
           10 CL-HAUPTPART-ERF            PIC  X(01).
           10 ANZ-NEU-DIR-PART            PIC S9(04)       BINARY.
           10 CL-NEU-DPART-ERF            PIC  X(01).
           10 NET-NEU-GES-12MO            PIC S9(09)V9(01) COMP-3.
           10 CL-NNGES12MO-ERF            PIC  X(01).
           10 CL-ANZ-STERNE               PIC S9(04)       BINARY.
           10 CL-ANZ-STERNE-ERF           PIC  X(01).
           10 FAKTOR-1                    PIC S9(03)V9(02) COMP-3.
           10 FAKTOR-1-ERF                PIC  X(01).
           10 FAKTOR-2                    PIC S9(03)V9(02) COMP-3.
           10 FAKTOR-2-ERF                PIC  X(01).
           10 FAKTOR-GES                  PIC S9(03)V9(02) COMP-3.
           10 FAKTOR-GES-ERF              PIC  X(01).
           10 BQF                         PIC S9(03)V9(02) COMP-3.
           10 BQF-ERF                     PIC  X(01).
           10 CL-GESICHERT-BIS            PIC  X(10).
           10 BED-ERF-MIN-MON             PIC S9(04)       BINARY.
           10 BED-ERF-MM-ERF              PIC  X(01).
           10 KAP-SEIT-MIN-MON            PIC S9(04)       BINARY.
           10 KAP-SEIT-MM-ERF             PIC  X(01).
           10 ED-MITGL-BIS                PIC  X(10).
           10 FAK-1-ISTWERT               PIC S9(09)V9(01) COMP-3.
           10 FAK-2-ISTWERT               PIC S9(09)V9(01) COMP-3.
           10 GES-EH-EIG-MAX              PIC S9(09)V9(01) COMP-3.
           10 EH-ZUSTRUK                  PIC S9(09)V9(01) COMP-3.
           10 EH-NEUE-ED                  PIC S9(09)V9(01) COMP-3.
           10 FAK2-200-KZ                 PIC  X(01).
           10 KRIT-ERF-KZ                 PIC  X(01).
           10 PRUEF-GES-KZ                PIC  X(01).
           10 ED-MITGL-ERF                PIC  X(01).
 
      *****************************************************************
      * ANZAHL SPALTEN IN DIESER DEKLARATION :  74                    *
      *****************************************************************

