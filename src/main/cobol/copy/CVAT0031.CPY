      *---------------------------------------------------------------*
      *    Standard für alle Objekte unter PVCS
      *            Datum   :  November 1995
      *            Kopf aus:  N:\PROFILE\KOPFCBL.DAT
      *---------------------------------------------------------------*
      *
      *---------------------------------------------------------------*
      *    Copyright 1995 ATLAS Dienstleistungs GmbH
      *---------------------------------------------------------------*
      *    $Workfile:   CVAT0031.CPY  $
      *    $Revision:   2.1  $
      *
      *    $Log:   L:\MF\CPY\CVAT0031.CPv  $
      *
      *   Rev 2.1   07 Jun 2000 14:10:32   T13AE34
      *AAT00019-SF14 Kompetenzgesteuert
      *
      *   Rev 2.0   Mar 16 1999 09:17:46   P13SP20
      *Archiverstellung
      *
      *---------------------------------------------------------------*
           EXEC SQL DECLARE VIAT0031 TABLE
           (
              BPKN_USER                      CHAR (7)
                                             NOT NULL,
              KTY_NR                         SMALLINT
                                             NOT NULL,
              BPKN_KS_PROFIL                 CHAR (1)
                                             NOT NULL,
              BPKN_KENNUNG                   CHAR (8)
                                             NOT NULL
           )
           END-EXEC.


       01  DCL-VIAT0031.
           03 BPKN-USER                      PIC X(7).
           03 KTY-NR                         PIC S9(4) COMP.
           03 BPKN-KS-PROFIL                 PIC X.
           03 BPKN-KENNUNG                   PIC X(8).
