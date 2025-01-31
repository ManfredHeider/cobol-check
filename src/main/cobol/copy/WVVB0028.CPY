      *---------------------------------------------------------------*
      *    Standard für alle Objekte unter PVCS
      *            Datum   :  November 1995
      *            Kopf aus:  N:\PROFILE\KOPFCBL.DAT
      *---------------------------------------------------------------*
      *
      *---------------------------------------------------------------*
      *    Copyright 1995 ATLAS Dienstleistungs GmbH
      *---------------------------------------------------------------*
      *    $Workfile:   WVVB0028.CPY  $
      *    $Revision:   2.0  $
      *
      *    $Log:   L:\MF\CPY\WVVB0028.CPv  $
      *
      *   Rev 2.0   Feb 27 1999 15:59:06   P13SP20
      *NT-Umstellung
      *
      *   Rev 1.0   Nov 04 1995 10:22:56   P13SP99
      *Initial revision.
      *
      *---------------------------------------------------------------*
      ***************************************************************** 00010000
      *    COPY-MEMBER: WVVB0028                                      * 00022006
      *    --------------------------------------------------------   * 00030000
      *    ERSTELLT: DB2 SYSTEMGRUPPE                                 * 00060002
      *    DATUM:    22.04.1993                                       * 00070001
      *    STAND:    22.04.1993                                       * 00080001
      *    --------------------------------------------------------   * 00081001
      *    VERSION:  001                                              * 00082003
      ***************************************************************** 00090000
      *                                                                 00100000
      ******************************************************************
      * COBOL DECLARATION FOR TABLE VIVB0028                           *
      ******************************************************************
        05  WB-NI-VIVB0028-TAB.
           10  WB-NI-VIVB0028-ELE  PIC S9(04)  COMP   OCCURS  5  TIMES.
        05  WB-NI-VIVB0028           REDEFINES   WB-NI-VIVB0028-TAB.
           10 WB-NI-MA-ST-NR         PIC S9(04)  COMP.
           10 WB-NI-KTY-SEMZ-TYP     PIC S9(04)  COMP.
           10 WB-NI-KNR-SEMZ-TYP     PIC S9(04)  COMP.
           10 WB-NI-SEMZ-LAST-UPDATE PIC S9(04)  COMP.
           10 WB-NI-SEMZ-DAT-VON     PIC S9(04)  COMP.
        05  WB-VIVB0028.
           10 WB-MA-ST-NR          PIC S9(9)   COMP         VALUE ZERO.
           10 WB-KTY-SEMZ-TYP      PIC S9(4)   COMP         VALUE ZERO.
           10 WB-KNR-SEMZ-TYP      PIC S9(4)   COMP         VALUE ZERO.
           10 WB-SEMZ-LAST-UPDATE  PIC X(26)                VALUE SPACE.
           10 WB-SEMZ-DAT-VON      PIC X(10)                VALUE SPACE.
      ******************************************************************
      * THE NUMBER OF COLUMNS DESCRIBED BY THIS DECLARATION IS 5       *
      ******************************************************************
