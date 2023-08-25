      *****************************************************************
      *    ERSTELLT: T13AE15                                          *
      *    DATUM:    28.04.2021                                       *
      *****************************************************************
      * AENDERUNGEN:                                                  *
      * AUFTRAG | DATUM  |VER | AENDERUNG                 | NAME      *
      * --------+--------+----+---------------------------+---------- *
      * VLA-1953|28.04.21|2.1 | NEU                       | T13AE15   *
      *         |        |    |                           |           *
      *         |        |    |                           |           *
      * ENDE-LOGBUCH                                                  *
      *****************************************************************
      * DCLGEN TABLE(VIVBC023) EDD                                    *
      *        LIBRARY(P130005.BP010000.SRCDCL(CVVBC023)              *
      *        ACTION(REPLACE)                                        *
      *        QUOTE                                                  *
      * ... DIESES DCLGEN WURDE GENERIERT MIT GENERCBL (REXX)         *
      *****************************************************************

           EXEC SQL DECLARE VIVBC023 TABLE
           ( ED_ST_NR                    INTEGER NOT NULL
           , EDD_BEZUGS_NR               INTEGER NOT NULL
           , EDD_DAT_VON                 TIMESTAMP NOT NULL
           , EDD_LAST_UPDATE             TIMESTAMP NOT NULL
           , EDD_DAT_BIS                 DATE NOT NULL
           , KTY_BEZUGS_TYP              SMALLINT NOT NULL
           , KNR_BEZUGS_TYP              SMALLINT NOT NULL
           , KTY_EDD_URSACHE             SMALLINT NOT NULL
           , KNR_EDD_URSACHE             SMALLINT NOT NULL
           , BVH_UNTST_NR                INTEGER
           , EDD_EDW2_KZ                 CHAR(01) NOT NULL
           ) END-EXEC.

      *****************************************************************
      * COBOL DEKLARATION FUER VIEW VIVBC023                          *
      *****************************************************************

       01  VIVBC023-GESAMT.
        05 NI-VIVBC023-TAB.
           10 NI-VIVBC023-ELE      PIC S9(04)  BINARY OCCURS  11.
        05 NI-VIVBC023             REDEFINES   NI-VIVBC023-TAB.
           10 NI-ED-ST-NR                 PIC S9(04)       BINARY.
           10 NI-EDD-BEZUGS-NR            PIC S9(04)       BINARY.
           10 NI-EDD-DAT-VON              PIC S9(04)       BINARY.
           10 NI-EDD-LAST-UPDATE          PIC S9(04)       BINARY.
           10 NI-EDD-DAT-BIS              PIC S9(04)       BINARY.
           10 NI-KTY-BEZUGS-TYP           PIC S9(04)       BINARY.
           10 NI-KNR-BEZUGS-TYP           PIC S9(04)       BINARY.
           10 NI-KTY-EDD-URSACHE          PIC S9(04)       BINARY.
           10 NI-KNR-EDD-URSACHE          PIC S9(04)       BINARY.
           10 NI-BVH-UNTST-NR             PIC S9(04)       BINARY.
           10 NI-EDD-EDW2-KZ              PIC S9(04)       BINARY.

        05 DCL-VIVBC023.
           10 ED-ST-NR                    PIC S9(09)       BINARY.
           10 EDD-BEZUGS-NR               PIC S9(09)       BINARY.
           10 EDD-DAT-VON                 PIC  X(26).
           10 EDD-LAST-UPDATE             PIC  X(26).
           10 EDD-DAT-BIS                 PIC  X(10).
           10 KTY-BEZUGS-TYP              PIC S9(04)       BINARY.
           10 KNR-BEZUGS-TYP              PIC S9(04)       BINARY.
           10 KTY-EDD-URSACHE             PIC S9(04)       BINARY.
           10 KNR-EDD-URSACHE             PIC S9(04)       BINARY.
           10 BVH-UNTST-NR                PIC S9(09)       BINARY.
           10 EDD-EDW2-KZ                 PIC  X(01).

      *****************************************************************
      * ANZAHL SPALTEN IN DIESER DEKLARATION :  11                    *
      *****************************************************************