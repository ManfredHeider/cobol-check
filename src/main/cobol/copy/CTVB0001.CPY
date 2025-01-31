      *---------------------------------------------------------------*
      *    Standard für alle Objekte unter PVCS
      *            Datum   :  November 1995
      *            Kopf aus:  N:\PROFILE\KOPFCBL.DAT
      *---------------------------------------------------------------*
      *
      *---------------------------------------------------------------*
      *    Copyright 1995 ATLAS Dienstleistungs GmbH
      *---------------------------------------------------------------*
      *    $Workfile:   CTVB0001.CPY  $
      *    $Revision:   2.0  $
      *
      *    $Log:   L:\MF\CPY\CTVB0001.CPv  $
      *
      *   Rev 2.0   Feb 27 1999 15:55:58   P13SP20
      *NT-Umstellung
      *
      *   Rev 1.0   Nov 04 1995 11:51:26   P13SP13
      *Initial revision.
      *
      *---------------------------------------------------------------*
      ***************************************************************** 00001000
      *    SRCDCL-MEMBER FÜR DIE VIEW AUF DIE DB2-TABLE ST            * 00002000
      *    --------------------------------------------------------   * 00002200
      *    ERSTELLT: KUHN                                             * 00002300
      *    DATUM:    31.03.1994                                       * 00002400
      ***************************************************************** 00002500
      *    VERSION   1    31.03.94 18:18:23
      ****************************************************************  00002700
      * AENDERUNGEN:                                                 *  00002800
      * AUFTRAG ! DATUM  !VER ! AENDERUNG                 ! NAME     *  00002900
      * -------------------------------------------------------------*  00003000
      * AFVB0044!31.03.94!    ! ERWEITERUNG               ! KUHN     *  00004001
      *         !        !    !                           !          *  00005000
      *         !        !    !                           !          *  00006000
      *         !        !    !                           !          *  00007000
      *         !        !    !                           !          *  00008000
      *         !        !    !                           !          *  00009000
      *         !        !    !                           !          *  00010000
      *         !        !    !                           !          *  00010100
      *                                                              *  00010200
      * ENDE-LOGBUCH                                                 *  00010300
      ****************************************************************  00010400
      ******************************************************************
      * DCLGEN TABLE(TBVB0001)                                         *
      *        LIBRARY(T130003.CE010000.SRCDCL(CTVB0001))              *
      *        ACTION(REPLACE)                                         *
      *        QUOTE                                                   *
      * ... IS THE DCLGEN COMMAND THAT MADE THE FOLLOWING STATEMENTS   *
      ******************************************************************
           EXEC SQL DECLARE TBVB0001 TABLE
           ( ST_NR                          INTEGER NOT NULL,
             ST_LAST_UPDATE                 TIMESTAMP NOT NULL,
             ST_PRUEFZIFFER                 CHAR(1) NOT NULL,
             ST_FREI                        CHAR(1) NOT NULL,
             ST_BEREINIGUNG                 CHAR(1) NOT NULL,
             KTY_ST_TYP                     SMALLINT NOT NULL,
             KNR_ST_TYP                     SMALLINT NOT NULL,
             KTY_GESELL_TYP                 SMALLINT NOT NULL,
             KNR_GESELL_TYP                 SMALLINT NOT NULL
           ) END-EXEC.
      ******************************************************************
      * COBOL DECLARATION FOR TABLE TBVB0001                           *
      ******************************************************************
       01  TBVB0001-GESAMT.
        05  NI-TBVB0001-TAB.
           10 NI-TBVB0001-ELE      PIC S9(04)  COMP   OCCURS  9  TIMES.
        05  NI-TBVB0001            REDEFINES   NI-TBVB0001-TAB.
           10 NI-ST-NR             PIC S9(04)  COMP.
           10 NI-ST-LAST-UPDATE    PIC S9(04)  COMP.
           10 NI-ST-PRUEFZIFFER    PIC S9(04)  COMP.
           10 NI-ST-FREI           PIC S9(04)  COMP.
           10 NI-ST-BEREINIGUNG    PIC S9(04)  COMP.
           10 NI-KTY-ST-TYP        PIC S9(04)  COMP.
           10 NI-KNR-ST-TYP        PIC S9(04)  COMP.
           10 NI-KTY-GESELL-TYP    PIC S9(04)  COMP.
           10 NI-KNR-GESELL-TYP    PIC S9(04)  COMP.
        05  DCL-TBVB0001.
           10 ST-NR                PIC S9(9) USAGE COMP.
           10 ST-LAST-UPDATE       PIC X(26).
           10 ST-PRUEFZIFFER       PIC X(1).
           10 ST-FREI              PIC X(1).
           10 ST-BEREINIGUNG       PIC X(1).
           10 KTY-ST-TYP           PIC S9(4) USAGE COMP.
           10 KNR-ST-TYP           PIC S9(4) USAGE COMP.
           10 KTY-GESELL-TYP       PIC S9(4) USAGE COMP.
           10 KNR-GESELL-TYP       PIC S9(4) USAGE COMP.
      ******************************************************************
      * THE NUMBER OF COLUMNS DESCRIBED BY THIS DECLARATION IS 9       *
      ******************************************************************
