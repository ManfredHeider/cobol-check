      *---------------------------------------------------------------*
      *    Standard für alle Objekte unter PVCS
      *            Datum   :  November 1995
      *            Kopf aus:  N:\PROFILE\KOPFCBL.DAT
      *---------------------------------------------------------------*
      *
      *---------------------------------------------------------------*
      *    Copyright 1995 ATLAS Dienstleistungs GmbH
      *---------------------------------------------------------------*
      *    $Workfile:   WVVB0065.CPY  $
      *    $Revision:   2.0  $
      *
      *    $Log:   L:\MF\CPY\WVVB0065.CPv  $
      *
      *   Rev 2.0   Feb 27 1999 15:59:12   P13SP20
      *NT-Umstellung
      *
      *   Rev 1.0   Nov 04 1995 10:29:38   P13SP99
      *Initial revision.
      *
      *---------------------------------------------------------------*
      ***************************************************************** 00010000
      *    COPY-MEMBER: WVVB0065                                      * 00020000
      *    --------------------------------------------------------   * 00050000
      *    ERSTELLT: SCHÖLLHAMMER                                     * 00060000
      *    DATUM:    12.09.1995                                       * 00070000
      ***************************************************************** 00080000
      *    VERSION   1    14.10.95 10:15:42
      ****************************************************************  00100000
      * AENDERUNGEN:                                                 *  00110000
      * AUFTRAG ! DATUM  !VER ! AENDERUNG                 ! NAME     *  00120000
      * -------------------------------------------------------------*  00130000
      * AFVB0237!12.09.95!    ! NEU                       ! SCHÖLLH. *  00140000
      *         !14.10.95! 01 ! PROD.UEBERGABE            ! SCHÖLLH. *  00136001
      *         !        !    !                           !          *  00143000
      *         !        !    !                           !          *  00143100
      *         !        !    !                           !          *  00144000
      *         !        !    !                           !          *  00145000
      *                                                              *  00146000
      * ENDE-LOGBUCH                                                 *  00147000
      ****************************************************************  00148000
      ******************************************************************
      * COBOL DECLARATION FOR VIEW  VIVB0065                           *
      ******************************************************************
        05  WB-NI-VIVB0065-TAB.
           10 WB-NI-VIVB0065-ELE      PIC S9(04) COMP  OCCURS 19 TIMES.
        05  WB-NI-VIVB0065            REDEFINES  WB-NI-VIVB0065-TAB.
           10 WB-NI-ST-NR             PIC S9(4) USAGE COMP.
           10 WB-NI-GEEV-MONAT        PIC S9(4) USAGE COMP.
           10 WB-NI-KNR-WAEHRUNG      PIC S9(4) USAGE COMP.
           10 WB-NI-KTY-WAEHRUNG      PIC S9(4) USAGE COMP.
           10 WB-NI-GEEV-EH-GS-ZU-EG  PIC S9(4) USAGE COMP.
           10 WB-NI-GEEV-EH-GS-ZU-GR  PIC S9(4) USAGE COMP.
           10 WB-NI-GEEV-EH-GS-AB-EG  PIC S9(4) USAGE COMP.
           10 WB-NI-GEEV-EH-GS-AB-GR  PIC S9(4) USAGE COMP.
           10 WB-NI-GEEV-PV-GS-NT-EG  PIC S9(4) USAGE COMP.
           10 WB-NI-GEEV-PV-GS-NT-GR  PIC S9(4) USAGE COMP.
           10 WB-NI-GEEV-PV-FG-NT-EG  PIC S9(4) USAGE COMP.
           10 WB-NI-GEEV-PV-FG-NT-GR  PIC S9(4) USAGE COMP.
           10 WB-NI-GEEV-EH-FG-ZU-EG  PIC S9(4) USAGE COMP.
           10 WB-NI-GEEV-EH-FG-ZU-GR  PIC S9(4) USAGE COMP.
           10 WB-NI-GEEV-EH-FG-AB-EG  PIC S9(4) USAGE COMP.
           10 WB-NI-GEEV-EH-FG-AB-GR  PIC S9(4) USAGE COMP.
           10 WB-NI-GEEV-PRV-RCK-ZFL  PIC S9(4) USAGE COMP.
           10 WB-NI-GEEV-RCK-AUSZ-Q   PIC S9(4) USAGE COMP.
           10 WB-NI-GEEV-UEBWEIS      PIC S9(4) USAGE COMP.
        05  WB-VIVB0065.
           10 WB-ST-NR                PIC S9(9) USAGE COMP.
           10 WB-GEEV-MONAT           PIC X(10).
           10 WB-KNR-WAEHRUNG         PIC S9(4) USAGE COMP.
           10 WB-KTY-WAEHRUNG         PIC S9(4) USAGE COMP.
           10 WB-GEEV-EH-GS-ZU-EG     PIC S999999999V9 USAGE COMP-3.
           10 WB-GEEV-EH-GS-ZU-GR     PIC S999999999V9 USAGE COMP-3.
           10 WB-GEEV-EH-GS-AB-EG     PIC S999999999V9 USAGE COMP-3.
           10 WB-GEEV-EH-GS-AB-GR     PIC S999999999V9 USAGE COMP-3.
           10 WB-GEEV-PV-GS-NT-EG     PIC S999999999V99 USAGE COMP-3.
           10 WB-GEEV-PV-GS-NT-GR     PIC S999999999V99 USAGE COMP-3.
           10 WB-GEEV-PV-FG-NT-EG     PIC S999999999V99 USAGE COMP-3.
           10 WB-GEEV-PV-FG-NT-GR     PIC S999999999V99 USAGE COMP-3.
           10 WB-GEEV-EH-FG-ZU-EG     PIC S999999999V9 USAGE COMP-3.
           10 WB-GEEV-EH-FG-ZU-GR     PIC S999999999V9 USAGE COMP-3.
           10 WB-GEEV-EH-FG-AB-EG     PIC S999999999V9 USAGE COMP-3.
           10 WB-GEEV-EH-FG-AB-GR     PIC S999999999V9 USAGE COMP-3.
           10 WB-GEEV-PRV-RCK-ZFL     PIC S999999999V99 USAGE COMP-3.
           10 WB-GEEV-RCK-AUSZ-Q      PIC S999999999V99 USAGE COMP-3.
           10 WB-GEEV-UEBWEIS         PIC S999999999V99 USAGE COMP-3.
      ******************************************************************
      * THE NUMBER OF COLUMNS DESCRIBED BY THIS DECLARATION IS 19      *
      ******************************************************************
