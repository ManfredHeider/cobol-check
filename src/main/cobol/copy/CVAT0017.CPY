      *---------------------------------------------------------------*
      *    Standard für alle Objekte unter PVCS
      *            Datum   :  November 1995
      *            Kopf aus:  N:\PROFILE\KOPFCBL.DAT
      *---------------------------------------------------------------*
      *
      *---------------------------------------------------------------*
      *    Copyright 1995 ATLAS Dienstleistungs GmbH
      *---------------------------------------------------------------*
      *    $Workfile:   CVAT0017.CPY  $
      *    $Revision:   2.0  $
      *
      *    $Log:   L:\MF\CPY\CVAT0017.CPv  $
      *
      *   Rev 2.0   Feb 27 1999 11:56:44   P13SP20
      *NT-Umstellung
      *
      *   Rev 1.0   Nov 04 1995 12:08:28   P13SP13
      *Initial revision.
      *
      *---------------------------------------------------------------*
      ***************************************************************** 00010000
      *    COPY-MEMBER: CVAT0017                                      * 00020000
      *    --------------------------------------------------------   * 00030000
      *    DCLGEN VON VIAT0017 (PGES)                                 * 00040001
      *    --------------------------------------------------------   * 00050000
      *    ERSTELLT: KUHN                                             * 00060000
      *    DATUM:    18.11.1994                                       * 00070000
      ***************************************************************** 00080000
      *    VERSION   1    10.01.95 16:20:23
      ****************************************************************  00100000
      * AENDERUNGEN:                                                 *  00110000
      * AUFTRAG ! DATUM  !VER ! AENDERUNG                 ! NAME     *  00120000
      * -------------------------------------------------------------*  00130000
      * AFVB0142!18.11.94! 01 ! NEU                       ! KUHN     *  00140000
      *         !23.12.94! 01 ! ANPASSUNG NEUES FORMAT    ! KUHN     *  00145000
      *         !        !    !                           !          *  00145000
      *         !        !    !                           !          *  00145000
      *         !        !    !                           !          *  00145000
      *         !        !    !                           !          *  00145000
      *                                                              *  00146000
      * ENDE-LOGBUCH                                                 *  00147000
      ****************************************************************  00148000
      ******************************************************************
      * DCLGEN TABLE(VIAT0017)                                         *
      *        QUOTE                                                   *
      * ... IS THE DCLGEN COMMAND THAT MADE THE FOLLOWING STATEMENTS   *
      ******************************************************************
           EXEC SQL DECLARE VIAT0017 TABLE
           ( KNR_PROD_GB_GES                SMALLINT NOT NULL,
             PGES_DAT_VON                   TIMESTAMP NOT NULL,
             PGES_LAST_UPDATE               TIMESTAMP NOT NULL,
             PGES_DAT_BIS                   DATE      NOT NULL,
             KNR_AUSL                       SMALLINT NOT NULL,
             KNR_BEWERT_ART                 SMALLINT NOT NULL,
             KTY_PROD_GB_GES                SMALLINT NOT NULL,
             KTY_AUSL                       SMALLINT NOT NULL,
             KTY_BEWERT_ART                 SMALLINT NOT NULL
           ) END-EXEC.
      ******************************************************************
      * COBOL DECLARATION FOR TABLE VIAT0017                           *
      ******************************************************************
       01  VIAT0017-GESAMT.
        05  NI-VIAT0017-TAB.
           10 NI-VIAT0017-ELE      PIC S9(04) COMP  OCCURS 9 TIMES.
        05  NI-VIAT0017            REDEFINES  NI-VIAT0017-TAB.
           10 NI-KNR-PROD-GB-GES   PIC S9(4) USAGE COMP.
           10 NI-PGES-DAT-VON      PIC S9(4) USAGE COMP.
           10 NI-PGES-LAST-UPDATE  PIC S9(4) USAGE COMP.
           10 NI-PGES-DAT-BIS      PIC S9(4) USAGE COMP.
           10 NI-KNR-AUSL          PIC S9(4) USAGE COMP.
           10 NI-KNR-BEWERT-ART    PIC S9(4) USAGE COMP.
           10 NI-KTY-PROD-GB-GES   PIC S9(4) USAGE COMP.
           10 NI-KTY-AUSL          PIC S9(4) USAGE COMP.
           10 NI-KTY-BEWERT-ART    PIC S9(4) USAGE COMP.
        05  DCL-VIAT0017.
           10 KNR-PROD-GB-GES      PIC S9(4) USAGE COMP.
           10 PGES-DAT-VON         PIC  X(26).
           10 PGES-LAST-UPDATE     PIC  X(26).
           10 PGES-DAT-BIS         PIC  X(10).
           10 KNR-AUSL             PIC S9(4) USAGE COMP.
           10 KNR-BEWERT-ART       PIC S9(4) USAGE COMP.
           10 KTY-PROD-GB-GES      PIC S9(4) USAGE COMP.
           10 KTY-AUSL             PIC S9(4) USAGE COMP.
           10 KTY-BEWERT-ART       PIC S9(4) USAGE COMP.
      ******************************************************************
      * THE NUMBER OF COLUMNS DESCRIBED BY THIS DECLARATION IS 9       *
      ******************************************************************
