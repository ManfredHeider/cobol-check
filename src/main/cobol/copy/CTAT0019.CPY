      *---------------------------------------------------------------*
      *    Standard für alle Objekte unter PVCS
      *            Datum   :  November 1995
      *            Kopf aus:  N:\PROFILE\KOPFCBL.DAT
      *---------------------------------------------------------------*
      *
      *---------------------------------------------------------------*
      *    Copyright 1995 ATLAS Dienstleistungs GmbH
      *---------------------------------------------------------------*
      *    $Workfile:   CTAT0019.CPY  $
      *    $Revision:   2.0  $
      *
      *    $Log:   L:\MF\CPY\CTAT0019.CPv  $
      *
      *   Rev 2.0   Feb 27 1999 11:56:38   P13SP20
      *NT-Umstellung
      *
      *   Rev 1.0   Dec 29 1995 15:47:30   T13AE26
      *Initial revision.
      *
      *---------------------------------------------------------------*
      *****************************************************************
      *    COPY: CTAT0019                                             *
      *    --------------------------------------------------------   *
      *    ERSTELLT: T. Moll                                          *
      *    DATUM:    10.12.1995                                       *
      *****************************************************************
      *    VERSION
      *****************************************************************
      * AENDERUNGEN:                                                  *
      * AUFTRAG ! DATUM  !VER ! AENDERUNG                 ! NAME      *
      * ------------------------------------------------------------- *
      * AFVB0251!10.12.95!    ! NEU                       ! Moll      *
      *         !        !    !                           !           *
      *         !        !    !                           !           *
      *                                                               *
      * ENDE-LOGBUCH                                                  *
      *****************************************************************
      ******************************************************************
      * DCLGEN TABLE(TBAT0019)                                         *
      *        ACTION(REPLACE)                                         *
      *        QUOTE                                                   *
      * ... IS THE DCLGEN COMMAND THAT MADE THE FOLLOWING STATEMENTS   *
      ******************************************************************
           EXEC SQL DECLARE TBAT0019 TABLE
           ( KNR_GR                         SMALLINT NOT NULL,
             KNR_GREL                       SMALLINT NOT NULL
           ) END-EXEC.
      ******************************************************************
      * COBOL DECLARATION FOR TABLE TBAT0019
      ******************************************************************
       01  TBAT0019-GESAMT.
        05  NI-TBAT0019-TAB.
           10  NI-TBAT0019-ELE     PIC S9(04)  COMP   OCCURS  2  TIMES.
        05  NI-TBAT0019            REDEFINES   NI-TBAT0019-TAB.
           10 NI-KNR-GR            PIC S9(04)  COMP.
           10 NI-KNR-GR            PIC S9(04)  COMP.
        05  DCL-TBAT0019.
           10 KNR-GR               PIC S9(4) USAGE COMP.
           10 KNR-GREL             PIC S9(4) USAGE COMP.
