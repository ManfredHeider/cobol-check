      *---------------------------------------------------------------*
      *    Standard für alle Objekte unter PVCS
      *            Datum   :  November 1995
      *            Kopf aus:  N:\PROFILE\KOPFCBL.DAT
      *---------------------------------------------------------------*
      *
      *---------------------------------------------------------------*
      *    Copyright 1995 ATLAS Dienstleistungs GmbH
      *---------------------------------------------------------------*
      *    $Workfile:   WVVB0051.CPY  $
      *    $Revision:   2.0  $
      *
      *    $Log:   L:\MF\CPY\WVVB0051.CPv  $
      *
      *   Rev 2.0   Feb 27 1999 15:59:10   P13SP20
      *NT-Umstellung
      *
      *   Rev 1.0   Nov 04 1995 10:27:22   P13SP99
      *Initial revision.
      *
      *---------------------------------------------------------------*
      ***************************************************************** 00010000
      *    COPY-MEMBER: WVVB0051                                      * 00022008
      *    --------------------------------------------------------   * 00030000
      *    ERSTELLT: DB2 SYSTEMGRUPPE                                 * 00060002
      *    DATUM:    22.04.1993                                       * 00070001
      *    STAND:    22.04.1993                                       * 00080001
      *    --------------------------------------------------------   * 00081001
      *    VERSION:  001                                              * 00082003
      ***************************************************************** 00090000
      *                                                                 00100000
      ******************************************************************
      * COBOL DECLARATION FOR TABLE VIVB0051                           *
      ******************************************************************
        05  WB-NI-VIVB0051-TAB.
           10  WB-NI-VIVB0051-ELE  PIC S9(04)  COMP   OCCURS  12 TIMES.
        05  WB-NI-VIVB0051          REDEFINES   WB-NI-VIVB0051-TAB.
           10 WB-NI-JUR-ST-NR       PIC S9(04)  COMP.
           10 WB-NI-JUR-LAST-UPDATE PIC S9(04) COMP.
           10 WB-NI-JUR-DAT-VON     PIC S9(04)  COMP.
           10 WB-NI-JUR-DAT-BIS     PIC S9(04)  COMP.
           10 WB-NI-JUR-PROV-STZ-AP PIC S9(04)  COMP.
           10 WB-NI-JUR-PROV-STZ-GP PIC S9(04)  COMP.
           10 WB-NI-JUR-PROZ-STZ    PIC S9(04)  COMP.
           10 WB-NI-JUR-RCK-STZ-DAT PIC S9(04)  COMP.
           10 WB-NI-JUR-RCK-STZ     PIC S9(04)  COMP.
           10 WB-NI-KTY-VERSAND     PIC S9(04)  COMP.
           10 WB-NI-KNR-VERSAND     PIC S9(04)  COMP.
           10 WB-NI-JUR-BEZ         PIC S9(04)  COMP.
        05  WB-VIVB0051.
           10 WB-JUR-ST-NR         PIC S9(9)  COMP          VALUE ZERO.
           10 WB-JUR-LAST-UPDATE   PIC X(26)                VALUE SPACE.
           10 WB-JUR-DAT-VON       PIC X(10)                VALUE SPACE.
           10 WB-JUR-DAT-BIS       PIC X(10)                VALUE SPACE.
           10 WB-JUR-PROV-STZ-AP   PIC S9(3)V99 COMP-3      VALUE ZERO.
           10 WB-JUR-PROV-STZ-GP   PIC S9(3)V99 COMP-3      VALUE ZERO.
           10 WB-JUR-PROZ-STZ      PIC S9(3)V99 COMP-3      VALUE ZERO.
           10 WB-JUR-RCK-STZ-DAT   PIC X(10)                VALUE SPACE.
           10 WB-JUR-RCK-STZ       PIC S9(3)V99 COMP-3      VALUE ZERO.
           10 WB-KTY-VERSAND       PIC S9(4)  COMP          VALUE ZERO.
           10 WB-KNR-VERSAND       PIC S9(4)  COMP          VALUE ZERO.
           10 WB-JUR-BEZ           PIC X(40)                VALUE SPACE.
      ******************************************************************
      * THE NUMBER OF COLUMNS DESCRIBED BY THIS DECLARATION IS 12      *
      ******************************************************************
