      *---------------------------------------------------------------*
      *    Standard für alle Objekte unter PVCS
      *            Datum   :  November 1995
      *            Kopf aus:  N:\PROFILE\KOPFCBL.DAT
      *---------------------------------------------------------------*
      *
      *---------------------------------------------------------------*
      *    Copyright 1995 ATLAS Dienstleistungs GmbH
      *---------------------------------------------------------------*
      *    $Workfile:   CVAT0023.CPY  $
      *    $Revision:   2.0  $
      *
      *    $Log:   L:\MF\CPY\CVAT0023.CPv  $
      *
      *   Rev 2.0   Feb 27 1999 11:56:46   P13SP20
      *NT-Umstellung
      *
      *   Rev 1.1   14 Jan 1999 08:24:34   T13AE34
      *AKI00005 RESTART
      *
      *   Rev 1.0   06 Feb 1998 10:53:54   P13SP19
      *Initial revision.
      *
      *---------------------------------------------------------------*
      ******************************************************************
      * DCLGEN TABLE(VIAT0023)                                         *
      * AAT00000 V001.000 19980205                                     *
      ******************************************************************
           EXEC SQL DECLARE VIAT0023 TABLE
           ( RST_JOB_NAME                        CHAR(8) NOT NULL,
             RST_PRG_NAME                   CHAR(8) NOT NULL,
             RST_COMMIT_FRQ                 INTEGER NOT NULL,
             RST_ANZ_COMMITS                INTEGER NOT NULL,
             RST_LAST_UPDATE                TIMESTAMP NOT NULL,
             RST_PRG_BEENDEN               CHAR(1) NOT NULL
           ) END-EXEC.
      ******************************************************************
      * COBOL DECLARATION FOR TABLE VIAT0023                           *
      ******************************************************************
       01  VIAT0023-GESAMT.
         05  DCL-VIAT0023.
           10 JOBNAME              PIC X(8).
           10 PROGRAMMNAME         PIC X(8).
           10 COMMITFREQUENZ       PIC S9(9) USAGE COMP.
           10 ANZ-COMMITS          PIC S9(9) USAGE COMP.
           10 LAST-UPDATE          PIC X(26).
           10 PROGRAMM-BEENDEN     PIC X(1).
      ******************************************************************
      * THE NUMBER OF COLUMNS DESCRIBED BY THIS DECLARATION IS 6       *
      ******************************************************************
