      *****************************************************************
      *    ERSTELLT: TH.WILLIG                                        *
      *    DATUM:    15.10.2010                                       *
      *****************************************************************
      * AENDERUNGEN:                                                  *
      * AUFTRAG ! DATUM  !VER ! AENDERUNG                 ! NAME      *
      * --------+--------+----+---------------------------+---------- *
      * AVB01125!15.10.10!2.1 ! NEU                       ! TH.WILLIG *
      *         !        !    !                           !           *
      *         !        !    !                           !           *
      * ENDE-LOGBUCH                                                  *
      *****************************************************************
      * DCLGEN TABLE(VIVBA005) RFT                                    *
      *        LIBRARY(P130005.BP010000.SRCDCL(CVVBA005)              *
      *        ACTION(REPLACE)                                        *
      *        QUOTE                                                  *
      * ... DIESES DCLGEN WURDE GENERIERT MIT GENERCBL (REXX)         *
      *****************************************************************

           EXEC SQL DECLARE VIVBA005 TABLE
           ( RFT_ST_NR                   INTEGER NOT NULL
           , RFT_LAST_UPDATE             TIMESTAMP NOT NULL
           , MA_ST_NR                    INTEGER NOT NULL
           , RFT_PROV_STZ_AP             DECIMAL(05, 2) NOT NULL
           , RFT_PROV_STZ_GP             DECIMAL(05, 2) NOT NULL
           , RFT_PROZ_STZ                DECIMAL(05, 2) NOT NULL
           , RFT_RCK_STZ                 DECIMAL(05, 2) NOT NULL
           , RFT_RCK_STZ_DAT             DATE NOT NULL
           , RFT_DAT_VON                 DATE NOT NULL
           , RFT_DAT_BIS                 DATE
           , RFT_ABLAUF_DAT              DATE NOT NULL
           , KTY_RF_TYP                  SMALLINT NOT NULL
           , KNR_RF_TYP                  SMALLINT NOT NULL
           ) END-EXEC.

      *****************************************************************
      * COBOL DEKLARATION FÜR VIEW VIVBA005                           *
      *****************************************************************

       01  VIVBA005-GESAMT.
        05 NI-VIVBA005-TAB.
           10 NI-VIVBA005-ELE      PIC S9(04)  BINARY OCCURS  13.
        05 NI-VIVBA005             REDEFINES   NI-VIVBA005-TAB.
           10 NI-RFT-ST-NR                PIC S9(04)       BINARY.
           10 NI-RFT-LAST-UPDATE          PIC S9(04)       BINARY.
           10 NI-MA-ST-NR                 PIC S9(04)       BINARY.
           10 NI-RFT-PROV-STZ-AP          PIC S9(04)       BINARY.
           10 NI-RFT-PROV-STZ-GP          PIC S9(04)       BINARY.
           10 NI-RFT-PROZ-STZ             PIC S9(04)       BINARY.
           10 NI-RFT-RCK-STZ              PIC S9(04)       BINARY.
           10 NI-RFT-RCK-STZ-DAT          PIC S9(04)       BINARY.
           10 NI-RFT-DAT-VON              PIC S9(04)       BINARY.
           10 NI-RFT-DAT-BIS              PIC S9(04)       BINARY.
           10 NI-RFT-ABLAUF-DAT           PIC S9(04)       BINARY.
           10 NI-KTY-RF-TYP               PIC S9(04)       BINARY.
           10 NI-KNR-RF-TYP               PIC S9(04)       BINARY.

        05 DCL-VIVBA005.
           10 RFT-ST-NR                   PIC S9(09)       BINARY.
           10 RFT-LAST-UPDATE             PIC  X(26).
           10 MA-ST-NR                    PIC S9(09)       BINARY.
           10 RFT-PROV-STZ-AP             PIC S9(03)V9(02) COMP-3.
           10 RFT-PROV-STZ-GP             PIC S9(03)V9(02) COMP-3.
           10 RFT-PROZ-STZ                PIC S9(03)V9(02) COMP-3.
           10 RFT-RCK-STZ                 PIC S9(03)V9(02) COMP-3.
           10 RFT-RCK-STZ-DAT             PIC  X(10).
           10 RFT-DAT-VON                 PIC  X(10).
           10 RFT-DAT-BIS                 PIC  X(10).
           10 RFT-ABLAUF-DAT              PIC  X(10).
           10 KTY-RF-TYP                  PIC S9(04)       BINARY.
           10 KNR-RF-TYP                  PIC S9(04)       BINARY.

      *****************************************************************
      * ANZAHL SPALTEN IN DIESER DEKLARATION :  13                    *
      *****************************************************************
