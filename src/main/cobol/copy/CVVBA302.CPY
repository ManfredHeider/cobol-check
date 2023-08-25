      *****************************************************************
      *    ERSTELLT: HITZEMANN                                        *
      *    DATUM:    13.04.2022                                       *
      *****************************************************************
      * AENDERUNGEN:                                                  *
      * JIRA     | DATUM  | AENDERUNG                     | NAME      *
      * ---------+--------+-------------------------------+---------- *
      * VLA-4491 |13.04.22| NEU                           | HITZEMANN *
      *          |        |                               |           *
      *          |        |                               |           *
      * ENDE-LOGBUCH                                                  *
      *****************************************************************
      * DCLGEN TABLE(VIVBA302) DETAILNP                               *
      *        LIBRARY(P130005.BP010000.SRCDCL(CVVBA302)              *
      *        ACTION(REPLACE)                                        *
      *        QUOTE                                                  *
      * ... DIESES DCLGEN WURDE GENERIERT MIT GENERCBL (REXX)         *
      *****************************************************************

           EXEC SQL DECLARE VIVBA302 TABLE
           ( DETAILNP_BETR               INTEGER NOT NULL
           , DETAILNP_MONAT              DATE NOT NULL
           , DETAILNP_UNTST              INTEGER NOT NULL
           , KNR_WB_TYP                  SMALLINT NOT NULL
           , KNR_WERTUNGS_TYP            SMALLINT NOT NULL
           , KTY_WB_TYP                  SMALLINT NOT NULL
           , KTY_WERTUNGS_TYP            SMALLINT NOT NULL
           , DETAILNP_LAST_UP            TIMESTAMP NOT NULL
           , DETAILNP_EH                 DECIMAL(10, 1) NOT NULL
           , DETAILNP_EBENE              CHAR(01) NOT NULL
           , DETAILNP_BIS                DATE
           , DETAILNP_BTR_TYP            CHAR(01)
           , DETAILNP_EH_UPFL            DECIMAL(10, 1) NOT NULL
           ) END-EXEC.

      *****************************************************************
      * COBOL DEKLARATION FUER VIEW VIVBA302                          *
      *****************************************************************

       01  VIVBA302-GESAMT.
        05 NI-VIVBA302-TAB.
           10 NI-VIVBA302-ELE      PIC S9(04)  BINARY OCCURS  13.
        05 NI-VIVBA302             REDEFINES   NI-VIVBA302-TAB.
           10 NI-DETAILNP-BETR            PIC S9(04)       BINARY.
           10 NI-DETAILNP-MONAT           PIC S9(04)       BINARY.
           10 NI-DETAILNP-UNTST           PIC S9(04)       BINARY.
           10 NI-KNR-WB-TYP               PIC S9(04)       BINARY.
           10 NI-KNR-WERTUNGS-TYP         PIC S9(04)       BINARY.
           10 NI-KTY-WB-TYP               PIC S9(04)       BINARY.
           10 NI-KTY-WERTUNGS-TYP         PIC S9(04)       BINARY.
           10 NI-DETAILNP-LAST-UP         PIC S9(04)       BINARY.
           10 NI-DETAILNP-EH              PIC S9(04)       BINARY.
           10 NI-DETAILNP-EBENE           PIC S9(04)       BINARY.
           10 NI-DETAILNP-BIS             PIC S9(04)       BINARY.
           10 NI-DETAILNP-BTR-TYP         PIC S9(04)       BINARY.
           10 NI-DETAILNP-EH-UPFL         PIC S9(04)       BINARY.

        05 DCL-VIVBA302.
           10 DETAILNP-BETR               PIC S9(09)       BINARY.
           10 DETAILNP-MONAT              PIC  X(10).
           10 DETAILNP-UNTST              PIC S9(09)       BINARY.
           10 KNR-WB-TYP                  PIC S9(04)       BINARY.
           10 KNR-WERTUNGS-TYP            PIC S9(04)       BINARY.
           10 KTY-WB-TYP                  PIC S9(04)       BINARY.
           10 KTY-WERTUNGS-TYP            PIC S9(04)       BINARY.
           10 DETAILNP-LAST-UP            PIC  X(26).
           10 DETAILNP-EH                 PIC S9(09)V9(01) COMP-3.
           10 DETAILNP-EBENE              PIC  X(01).
           10 DETAILNP-BIS                PIC  X(10).
           10 DETAILNP-BTR-TYP            PIC  X(01).
           10 DETAILNP-EH-UPFL            PIC S9(09)V9(01) COMP-3.

      *****************************************************************
      * ANZAHL SPALTEN IN DIESER DEKLARATION :  13                    *
      *****************************************************************