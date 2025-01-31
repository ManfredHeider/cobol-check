      *---------------------------------------------------------------*
      *    Standard für alle Objekte unter PVCS
      *            Datum   :  November 1995
      *            Kopf aus:  N:\PROFILE\KOPFCBL.DAT
      *---------------------------------------------------------------*
      *
      *---------------------------------------------------------------*
      *    Copyright 1995 ATLAS Dienstleistungs GmbH
      *---------------------------------------------------------------*
      *    $Workfile:   CTVB0011.CPY  $
      *    $Revision:   2.0  $
      *
      *    $Log:   L:\MF\CPY\CTVB0011.CPv  $
      *
      *   Rev 2.0   Feb 27 1999 15:56:02   P13SP20
      *NT-Umstellung
      *
      *   Rev 1.0   Nov 04 1995 11:53:38   P13SP13
      *Initial revision.
      *
      *---------------------------------------------------------------*
      ******************************************************************
      * DCLGEN TABLE(TBVB0011)                                         *
      *        LIBRARY(P130005.BP010000.SRCDCL(CTVB0011))              *
      *        ACTION(REPLACE)                                         *
      *        QUOTE                                                   *
      * ... IS THE DCLGEN COMMAND THAT MADE THE FOLLOWING STATEMENTS   *
      ******************************************************************
           EXEC SQL DECLARE TBVB0011 TABLE
           ( BVH_BETR_NR                    INTEGER NOT NULL,
             BVH_UNTST_NR                   INTEGER NOT NULL,
             BVH_DAT_VON                    TIMESTAMP NOT NULL,
             BVH_LAST_UPDATE                TIMESTAMP NOT NULL,
             BVH_DAT_BIS                    DATE NOT NULL,
             KTY_BETR_TYP                   SMALLINT NOT NULL,
             KNR_BETR_TYP                   SMALLINT NOT NULL,
             KTY_UNTST_TYP                  SMALLINT NOT NULL,
             KNR_UNTST_TYP                  SMALLINT NOT NULL
           ) END-EXEC.
      ******************************************************************
      * COBOL DECLARATION FOR TABLE TBVB0011                           *
      ******************************************************************
       01  TBVB0011-GESAMT.
        05  NI-TBVB0011-TAB.
           10  NI-TBVB0011-ELE     PIC S9(04)  COMP   OCCURS  9  TIMES.
        05  NI-TBVB0011            REDEFINES   NI-TBVB0011-TAB.
           10 NI-BVH-BETR-NR       PIC S9(04)  COMP.
           10 NI-BVH-UNTST-NR      PIC S9(04)  COMP.
           10 NI-BVH-DAT-VON       PIC S9(04)  COMP.
           10 NI-BVH-LAST-UPDATE   PIC S9(04)  COMP.
           10 NI-BVH-DAT-BIS       PIC S9(04)  COMP.
           10 NI-KTY-BETR-TYP      PIC S9(04)  COMP.
           10 NI-KNR-BETR-TYP      PIC S9(04)  COMP.
           10 NI-KTY-UNTST-TYP     PIC S9(04)  COMP.
           10 NI-KNR-UNTST-TYP     PIC S9(04)  COMP.
        05  DCL-TBVB0011.
           10 BVH-BETR-NR          PIC S9(9) USAGE COMP.
           10 BVH-UNTST-NR         PIC S9(9) USAGE COMP.
           10 BVH-DAT-VON          PIC X(26).
           10 BVH-LAST-UPDATE      PIC X(26).
           10 BVH-DAT-BIS          PIC X(10).
           10 KTY-BETR-TYP         PIC S9(4) USAGE COMP.
           10 KNR-BETR-TYP         PIC S9(4) USAGE COMP.
           10 KTY-UNTST-TYP        PIC S9(4) USAGE COMP.
           10 KNR-UNTST-TYP        PIC S9(4) USAGE COMP.
      ******************************************************************
      * THE NUMBER OF COLUMNS DESCRIBED BY THIS DECLARATION IS 9       *
      ******************************************************************
