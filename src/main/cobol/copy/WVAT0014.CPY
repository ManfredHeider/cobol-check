      *---------------------------------------------------------------*
      *    Standard für alle Objekte unter PVCS
      *            Datum   :  November 1995
      *            Kopf aus:  N:\PROFILE\KOPFCBL.DAT
      *---------------------------------------------------------------*
      *
      *---------------------------------------------------------------*
      *    Copyright 1995 ATLAS Dienstleistungs GmbH
      *---------------------------------------------------------------*
      *    $Workfile:   WVAT0014.CPY  $
      *    $Revision:   2.0  $
      *
      *    $Log:   L:\MF\CPY\WVAT0014.CPv  $
      *
      *   Rev 2.0   Feb 27 1999 11:57:52   P13SP20
      *NT-Umstellung
      *
      *   Rev 1.0   Nov 04 1995 10:13:30   P13SP99
      *Initial revision.
      *
      *---------------------------------------------------------------*
      ***************************************************************** 00010000
      *    COPY-MEMBER: WVAT0014                                      * 00022003
      *    --------------------------------------------------------   * 00030000
      *    ERSTELLT: DB2 SYSTEMGRUPPE                                 * 00060002
      *    DATUM:    22.04.1993                                       * 00070001
      *    STAND:    22.04.1993                                       * 00080001
      *    --------------------------------------------------------   * 00081001
      *    VERSION:  001                                              * 00082003
      ***************************************************************** 00090000
      *                                                                 00100000
      ******************************************************************
      * COBOL DECLARATION FOR TABLE CVAT0014                           *
      ******************************************************************
        05  WB-NI-VIAT0014-TAB.
           10 WB-NI-VIAT0014-ELE   PIC S9(04)  COMP   OCCURS  5  TIMES.
        05  WB-NI-VIAT0014         REDEFINES   WB-NI-VIAT0014-TAB.
           10 WB-NI-RSM-TIMESTAMP  PIC S9(04)  COMP.
           10 WB-NI-RSM-HPROG-ID   PIC S9(04)  COMP.
           10 WB-NI-RSM-UPROG-ID   PIC S9(04)  COMP.
           10 WB-NI-RSM-SQLCODE    PIC S9(04)  COMP.
           10 WB-NI-RSM-SQLERRMC   PIC S9(04)  COMP.
        05 WB-VIAT0014.
           10 WB-RSM-TIMESTAMP     PIC X(26)                VALUE SPACE.
           10 WB-RSM-HPROG-ID      PIC X(8)                 VALUE SPACE.
           10 WB-RSM-UPROG-ID      PIC X(8)                 VALUE SPACE.
           10 WB-RSM-SQLCODE       PIC S9(4) USAGE COMP     VALUE ZERO.
           10 WB-RSM-SQLERRMC      PIC X(70)                VALUE SPACE.
      ******************************************************************
      * THE NUMBER OF COLUMNS DESCRIBED BY THIS DECLARATION IS 5       *
      ******************************************************************
