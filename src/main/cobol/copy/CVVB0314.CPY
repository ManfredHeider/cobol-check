      *****************************************************************
      *    ERSTELLT: TH.WILLIG                                        *
      *    DATUM:    08.03.2012                                       *
      *****************************************************************
      * AENDERUNGEN:                                                  *
      * AUFTRAG ! DATUM  !VER ! AENDERUNG                 ! NAME      *
      * --------+--------+----+---------------------------+---------- *
      * AAS01008!08.03.12!2.1 ! NEU                       ! TH.WILLIG *
      *         !        !    !                           !           *
      *         !        !    !                           !           *
      * ENDE-LOGBUCH                                                  *
      *****************************************************************
      * DCLGEN TABLE(VIVB0314) PARTDW                                 *
      *        LIBRARY(P130005.BP010000.SRCDCL(CVVB0314)              *
      *        ACTION(REPLACE)                                        *
      *        QUOTE                                                  *
      * ... DIESES DCLGEN WURDE GENERIERT MIT GENERCBL (REXX)         *
      *****************************************************************

           EXEC SQL DECLARE VIVB0314 TABLE
           ( PARTDW_UNTST                INTEGER NOT NULL
           , PARTDW_BETR                 INTEGER NOT NULL
           , PARTDW_EBENE                SMALLINT NOT NULL
           , PARTDW_MONAT                DATE NOT NULL
           , KTY_ZUSTRUK_TYP             SMALLINT NOT NULL
           , KNR_ZUSTRUK_TYP             SMALLINT NOT NULL
           , PARTDW_EH_NE                DECIMAL(10, 1)
           , PARTDW_EH_NNE               DECIMAL(10, 1)
           , PARTDW_USTRU_DAT            DATE NOT NULL
           , PARTDW_LAST_UPD             TIMESTAMP NOT NULL
           , PARTDW_BEMERKUNG            CHAR(20)
           ) END-EXEC.

      *****************************************************************
      * COBOL DEKLARATION FÜR VIEW VIVB0314                           *
      *****************************************************************

       01  VIVB0314-GESAMT.
        05 NI-VIVB0314-TAB.
           10 NI-VIVB0314-ELE      PIC S9(04)  BINARY OCCURS  11.
        05 NI-VIVB0314             REDEFINES   NI-VIVB0314-TAB.
           10 NI-PARTDW-UNTST             PIC S9(04)       BINARY.
           10 NI-PARTDW-BETR              PIC S9(04)       BINARY.
           10 NI-PARTDW-EBENE             PIC S9(04)       BINARY.
           10 NI-PARTDW-MONAT             PIC S9(04)       BINARY.
           10 NI-KTY-ZUSTRUK-TYP          PIC S9(04)       BINARY.
           10 NI-KNR-ZUSTRUK-TYP          PIC S9(04)       BINARY.
           10 NI-PARTDW-EH-NE             PIC S9(04)       BINARY.
           10 NI-PARTDW-EH-NNE            PIC S9(04)       BINARY.
           10 NI-PARTDW-USTRU-DAT         PIC S9(04)       BINARY.
           10 NI-PARTDW-LAST-UPD          PIC S9(04)       BINARY.
           10 NI-PARTDW-BEMERKUNG         PIC S9(04)       BINARY.

        05 DCL-VIVB0314.
           10 PARTDW-UNTST                PIC S9(09)       BINARY.
           10 PARTDW-BETR                 PIC S9(09)       BINARY.
           10 PARTDW-EBENE                PIC S9(04)       BINARY.
           10 PARTDW-MONAT                PIC  X(10).
           10 KTY-ZUSTRUK-TYP             PIC S9(04)       BINARY.
           10 KNR-ZUSTRUK-TYP             PIC S9(04)       BINARY.
           10 PARTDW-EH-NE                PIC S9(09)V9(01) COMP-3.
           10 PARTDW-EH-NNE               PIC S9(09)V9(01) COMP-3.
           10 PARTDW-USTRU-DAT            PIC  X(10).
           10 PARTDW-LAST-UPD             PIC  X(26).
           10 PARTDW-BEMERKUNG            PIC  X(20).

      *****************************************************************
      * ANZAHL SPALTEN IN DIESER DEKLARATION :  11                    *
      *****************************************************************
