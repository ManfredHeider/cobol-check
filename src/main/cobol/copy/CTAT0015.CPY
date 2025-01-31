      *---------------------------------------------------------------*
      *    Standard für alle Objekte unter PVCS
      *            Datum   :  November 1995
      *            Kopf aus:  N:\PROFILE\KOPFCBL.DAT
      *---------------------------------------------------------------*
      *
      *---------------------------------------------------------------*
      *    Copyright 1995 ATLAS Dienstleistungs GmbH
      *---------------------------------------------------------------*
      *    $Workfile:   CTAT0015.CPY  $
      *    $Revision:   2.0  $
      *
      *    $Log:   L:\MF\CPY\CTAT0015.CPv  $
      *
      *   Rev 2.0   Feb 27 1999 11:56:38   P13SP20
      *NT-Umstellung
      *
      *   Rev 1.0   Nov 04 1995 11:49:28   P13SP13
      *Initial revision.
      *
      *---------------------------------------------------------------*
      ***************************************************************** 00010000
      *    COPY-MEMBER: CTAT0015                                      * 00020000
      *    --------------------------------------------------------   * 00030000
      *    DCLGEN VON TBAT0015 (PSGS)                                 * 00040001
      *    --------------------------------------------------------   * 00050000
      *    ERSTELLT: KUHN                                             * 00060000
      *    DATUM:    18.11.1994                                       * 00070000
      ***************************************************************** 00080000
      *    VERSION   1    10.01.95 16:17:01
      ****************************************************************  00100000
      * AENDERUNGEN:                                                 *  00110000
      * AUFTRAG ! DATUM  !VER ! AENDERUNG                 ! NAME     *  00120000
      * -------------------------------------------------------------*  00130000
      * AFVB0142!18.11.94! 01 ! NEU                       ! KUHN     *  00140000
      *         !        !    !                           !          *  00143000
      *         !        !    !                           !          *  00143100
      *         !        !    !                           !          *  00144000
      *         !        !    !                           !          *  00145000
      *                                                              *  00146000
      * ENDE-LOGBUCH                                                 *  00147000
      ****************************************************************  00148000
      ******************************************************************
      * DCLGEN TABLE(TBAT0015)                                         *
      *        QUOTE                                                   *
      * ... IS THE DCLGEN COMMAND THAT MADE THE FOLLOWING STATEMENTS   *
      ******************************************************************
           EXEC SQL DECLARE TBAT0015 TABLE
           ( KNR_GRP_SPARTE                 SMALLINT NOT NULL,
             KNR_PROV_TYP                   SMALLINT NOT NULL,
             KNR_PROD_SPARTE                SMALLINT NOT NULL,
             PSGS_DAT_VON                   TIMESTAMP NOT NULL,
             PSGS_LAST_UPDATE               TIMESTAMP NOT NULL,
             PSGS_DAT_BIS                   DATE NOT NULL,
             KTY_GRP_SPARTE                 SMALLINT NOT NULL,
             KTY_PROV_TYP                   SMALLINT NOT NULL,
             KTY_PROD_SPARTE                SMALLINT NOT NULL
           ) END-EXEC.
      ******************************************************************
      * COBOL DECLARATION FOR TABLE TBAT0015                           *
      ******************************************************************
       01  TBAT0015-GESAMT.
        05  NI-TBAT0015-TAB.
           10 NI-TBAT0015-ELE      PIC S9(04) COMP  OCCURS 9 TIMES.
        05  NI-TBAT0015            REDEFINES  NI-TBAT0015-TAB.
           10 NI-KNR-GRP-SPARTE    PIC S9(4) USAGE COMP.
           10 NI-KNR-PROV-TYP      PIC S9(4) USAGE COMP.
           10 NI-KNR-PROD-SPARTE   PIC S9(4) USAGE COMP.
           10 NI-PSGS-DAT-VON      PIC S9(4) USAGE COMP.
           10 NI-PSGS-LAST-UPDATE  PIC S9(4) USAGE COMP.
           10 NI-PSGS-DAT-BIS      PIC S9(4) USAGE COMP.
           10 NI-KTY-GRP-SPARTE    PIC S9(4) USAGE COMP.
           10 NI-KTY-PROV-TYP      PIC S9(4) USAGE COMP.
           10 NI-KTY-PROD-SPARTE   PIC S9(4) USAGE COMP.
        05  DCL-TBAT0015.
           10 KNR-GRP-SPARTE       PIC S9(4) USAGE COMP.
           10 KNR-PROV-TYP         PIC S9(4) USAGE COMP.
           10 KNR-PROD-SPARTE      PIC S9(4) USAGE COMP.
           10 PSGS-DAT-VON         PIC  X(26).
           10 PSGS-LAST-UPDATE     PIC  X(26).
           10 PSGS-DAT-BIS         PIC  X(10).
           10 KTY-GRP-SPARTE       PIC S9(4) USAGE COMP.
           10 KTY-PROV-TYP         PIC S9(4) USAGE COMP.
           10 KTY-PROD-SPARTE      PIC S9(4) USAGE COMP.
      ******************************************************************
      * THE NUMBER OF COLUMNS DESCRIBED BY THIS DECLARATION IS 9       *
      ******************************************************************
