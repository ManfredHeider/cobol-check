      *---------------------------------------------------------------*
      *    Standard für alle Objekte unter PVCS
      *            Datum   :  Januar 2001
      *            Kopf aus:  N:\PROFILE\KOPFCPY.DAT
      *---------------------------------------------------------------*
      *
      *---------------------------------------------------------------*
      *    Copyright 2001 ATLAS Dienstleistungs GmbH
      *---------------------------------------------------------------*
      *    $Workfile:   DRAT0390.CPY  $
      *    $Revision:   2.1  $
      *
      *    $Log:   L:/MF/CPY/DRAT0390.CPv  $
      *
      *   Rev 2.1   Feb 07 2003 11:42:40   t13ae34
      *AAT00023-STAT0006- KS10 Protokolldatei
      *
      *   Rev 2.0   26 Jun 2001 12:55:12   p13sp20
      *Archiverstellung
      *
      *---------------------------------------------------------------*
      *****************************************************************
      *    COPY-MEMBER: DRAT0390  K&S STAT0006 - SST PROTOKOLLDATEI   *
      *                           KS10                                *
      *    --------------------------------------------------------   *
      *    ERSTELLT: HEIDER                                           *
      *    DATUM:    20.01.2003                                       *
      *                                                               *
      *****************************************************************
      * AENDERUNGEN:                                                 *
      * AUFTRAG ! DATUM  !VER ! AENDERUNG                 ! NAME     *
      * -------------------------------------------------------------*
      * AAT00023!12.12.02!2.1 ! NEU                       ! HEIDER   *
      *         !        !    !                           !          *
      *         !        !    !                           !          *
      *                                                              *
      * ENDE-LOGBUCH                                                 *
      ****************************************************************
      *
       01  STAT0006S.
      *       KEY
           02 STAT0006-KEY.
      *       ÄNDERUNGSZETIPUNKT FORMAT JHJJMMTTHHMMSS
              03 STAT0006-ZEITPUNKT.
                 04 STAT0006-ZEITPUNKT-DATUM.
                    05 STAT0006-ZEITPUNKT-JH      PIC  X(02).
                    05 STAT0006-ZEITPUNKT-JJ      PIC  X(02).
                    05 STAT0006-ZEITPUNKT-MM      PIC  X(02).
                    05 STAT0006-ZEITPUNKT-TT      PIC  X(02).
                 04 STAT0006-ZEITPUNKT-ZEIT.
                    05 STAT0006-ZEITPUNKT-HH      PIC  X(02).
                    05 STAT0006-ZEITPUNKT-MI      PIC  X(02).
                    05 STAT0006-ZEITPUNKT-SS      PIC  X(02).
      *       SACHBEARBEITER
              03 STAT0006-SACHB             PIC  X(07).
      *       GEÄNDERTER USER
           02 STAT0006-USERID            PIC  X(07).
      *       ÄNDERUNGSART JE VORGANG USER
           02 STAT0006-AENDKZ            PIC  X(01).
              88 STAT0006-ERFASSEN-AENDERN-USER VALUE '1'.
              88 STAT0006-LOESCHEN-USER         VALUE '2'.
              88 STAT0006-ERFASSEN-AD-USER      VALUE '3'.
              88 STAT0006-GRUPPENPROFIL         VALUE '4'.
           02 STAT0006-BENGRUPPROFIL     PIC  X(80).
           02 STAT0006-UU11.
              03 STAT0006-UU11-BILD1     PIC  X(01).
              03 STAT0006-UU11-BILD2     PIC  X(01).
              03 STAT0006-UU11-BILD3     PIC  X(01).
              03 STAT0006-UU11-BILD4     PIC  X(01).
           02 STAT0006-ANZDIA            PIC  9(03).
           02 STAT0006-DIALOG-TAB.
              03 STAT0006-DIALOG-T OCCURS 300.
                 04 STAT0006-DIALOG      PIC  X(04).
                 04 STAT0006-PROFIL      PIC  X(01).
      *       ÄNDERUNGSART JE DIALOG
                 04 STAT0006-DIALOG-AEND PIC  X(01).
                 88 STAT0006-TRANS-NEU   VALUE 'N'.
                 88 STAT0006-TRANS-AEN   VALUE 'A'.
                 88 STAT0006-TRANS-LOE   VALUE 'L'.
                 04 STAT0006-STERN       PIC  X(01).
