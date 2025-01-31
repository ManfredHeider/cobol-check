      *---------------------------------------------------------------*
      *    Standard für alle Objekte unter PVCS
      *            Datum   :  November 1995
      *            Kopf aus:  N:\PROFILE\KOPFCBL.DAT
      *---------------------------------------------------------------*
      *
      *---------------------------------------------------------------*
      *    Copyright 1995 ATLAS Dienstleistungs GmbH
      *---------------------------------------------------------------*
      *    $Workfile:   CVVB0058.CPY  $
      *    $Revision:   2.0  $
      *
      *    $Log:   L:\MF\CPY\CVVB0058.CPv  $
      *
      *   Rev 2.0   Feb 27 1999 15:56:40   P13SP20
      *NT-Umstellung
      *
      *   Rev 1.0   Nov 04 1995 12:22:46   P13SP13
      *Initial revision.
      *
      *---------------------------------------------------------------*
      ***************************************************************** 00010000
      *    COPY-MEMBER: CVVB0058                                      * 00020000
      *    --------------------------------------------------------   * 00030000
      *    DCLGEN VON VIVB0058 (PSEV)                                 * 00040001
      *    --------------------------------------------------------   * 00050000
      *    ERSTELLT: KUHN                                             * 00060000
      *    DATUM:    15.09.1994                                       * 00070000
      ***************************************************************** 00080000
      *    VERSION   1    29.10.94 10:23:29
      ****************************************************************  00100000
      * AENDERUNGEN:                                                 *  00110000
      * AUFTRAG ! DATUM  !VER ! AENDERUNG                 ! NAME     *  00120000
      * -------------------------------------------------------------*  00130000
      * AFVB0142!15.09.94! 01 ! NEU                       ! KUHN     *  00140000
      *         !        !    !                           !          *  00143000
      *         !        !    !                           !          *  00143100
      *         !        !    !                           !          *  00144000
      *         !        !    !                           !          *  00145000
      *                                                              *  00146000
      * ENDE-LOGBUCH                                                 *  00147000
      ****************************************************************  00148000
      ******************************************************************
      * DCLGEN TABLE(VIVB0058)                                         *
      *        QUOTE                                                   *
      * ... IS THE DCLGEN COMMAND THAT MADE THE FOLLOWING STATEMENTS   *
      ******************************************************************
           EXEC SQL DECLARE VIVB0058 TABLE
           ( ST_NR                          INTEGER NOT NULL,
             PSEV_MONAT                     DATE NOT NULL,
             KNR_PROD_SPARTE                SMALLINT NOT NULL,
             KNR_WAEHRUNG                   SMALLINT NOT NULL,
             KTY_PROD_SPARTE                SMALLINT NOT NULL,
             KTY_WAEHRUNG                   SMALLINT NOT NULL,
             PSEV_EH_GS_ZU_EG               DECIMAL(10, 1) NOT NULL,
             PSEV_EH_GS_ZU_GR               DECIMAL(10, 1) NOT NULL,
             PSEV_EH_GS_AB_EG               DECIMAL(10, 1) NOT NULL,
             PSEV_EH_GS_AB_GR               DECIMAL(10, 1) NOT NULL,
             PSEV_PV_GS_NT_EG               DECIMAL(11, 2) NOT NULL,
             PSEV_PV_GS_NT_GR               DECIMAL(11, 2) NOT NULL,
             PSEV_PV_FG_NT_EG               DECIMAL(11, 2) NOT NULL,
             PSEV_PV_FG_NT_GR               DECIMAL(11, 2) NOT NULL,
             PSEV_EH_FG_ZU_EG               DECIMAL(10, 1) NOT NULL,
             PSEV_EH_FG_ZU_GR               DECIMAL(10, 1) NOT NULL,
             PSEV_EH_FG_AB_EG               DECIMAL(10, 1) NOT NULL,
             PSEV_EH_FG_AB_GR               DECIMAL(10, 1) NOT NULL
           ) END-EXEC.
      ******************************************************************
      * COBOL DECLARATION FOR TABLE VIVB0058                           *
      ******************************************************************
       01  VIVB0058-GESAMT.
        05  NI-VIVB0058-TAB.
           10 NI-VIVB0058-ELE      PIC S9(04) COMP  OCCURS 18 TIMES.
        05  NI-VIVB0058            REDEFINES  NI-VIVB0058-TAB.
           10 NI-ST-NR             PIC S9(4) USAGE COMP.
           10 NI-PSEV-MONAT        PIC S9(4) USAGE COMP.
           10 NI-KNR-PROD-SPARTE   PIC S9(4) USAGE COMP.
           10 NI-KNR-WAEHRUNG      PIC S9(4) USAGE COMP.
           10 NI-KTY-PROD-SPARTE   PIC S9(4) USAGE COMP.
           10 NI-KTY-WAEHRUNG      PIC S9(4) USAGE COMP.
           10 NI-PSEV-EH-GS-ZU-EG  PIC S9(4) USAGE COMP.
           10 NI-PSEV-EH-GS-ZU-GR  PIC S9(4) USAGE COMP.
           10 NI-PSEV-EH-GS-AB-EG  PIC S9(4) USAGE COMP.
           10 NI-PSEV-EH-GS-AB-GR  PIC S9(4) USAGE COMP.
           10 NI-PSEV-PV-GS-NT-EG  PIC S9(4) USAGE COMP.
           10 NI-PSEV-PV-GS-NT-GR  PIC S9(4) USAGE COMP.
           10 NI-PSEV-PV-FG-NT-EG  PIC S9(4) USAGE COMP.
           10 NI-PSEV-PV-FG-NT-GR  PIC S9(4) USAGE COMP.
           10 NI-PSEV-EH-FG-ZU-EG  PIC S9(4) USAGE COMP.
           10 NI-PSEV-EH-FG-ZU-GR  PIC S9(4) USAGE COMP.
           10 NI-PSEV-EH-FG-AB-EG  PIC S9(4) USAGE COMP.
           10 NI-PSEV-EH-FG-AB-GR  PIC S9(4) USAGE COMP.
        05  DCL-VIVB0058.
           10 ST-NR                PIC S9(9) USAGE COMP.
           10 PSEV-MONAT           PIC X(10).
           10 KNR-PROD-SPARTE      PIC S9(4) USAGE COMP.
           10 KNR-WAEHRUNG         PIC S9(4) USAGE COMP.
           10 KTY-PROD-SPARTE      PIC S9(4) USAGE COMP.
           10 KTY-WAEHRUNG         PIC S9(4) USAGE COMP.
           10 PSEV-EH-GS-ZU-EG     PIC S999999999V9 USAGE COMP-3.
           10 PSEV-EH-GS-ZU-GR     PIC S999999999V9 USAGE COMP-3.
           10 PSEV-EH-GS-AB-EG     PIC S999999999V9 USAGE COMP-3.
           10 PSEV-EH-GS-AB-GR     PIC S999999999V9 USAGE COMP-3.
           10 PSEV-PV-GS-NT-EG     PIC S999999999V99 USAGE COMP-3.
           10 PSEV-PV-GS-NT-GR     PIC S999999999V99 USAGE COMP-3.
           10 PSEV-PV-FG-NT-EG     PIC S999999999V99 USAGE COMP-3.
           10 PSEV-PV-FG-NT-GR     PIC S999999999V99 USAGE COMP-3.
           10 PSEV-EH-FG-ZU-EG     PIC S999999999V9 USAGE COMP-3.
           10 PSEV-EH-FG-ZU-GR     PIC S999999999V9 USAGE COMP-3.
           10 PSEV-EH-FG-AB-EG     PIC S999999999V9 USAGE COMP-3.
           10 PSEV-EH-FG-AB-GR     PIC S999999999V9 USAGE COMP-3.
      ******************************************************************
      * THE NUMBER OF COLUMNS DESCRIBED BY THIS DECLARATION IS 18      *
      ******************************************************************
