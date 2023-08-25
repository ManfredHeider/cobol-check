      *---------------------------------------------------------------*
      *    Standard fuer alle Objekte unter PVCS VM
      *            Datum      :  19.06.2006
      *            Kategorie  :  Copystrecke
      *---------------------------------------------------------------*
      *
      *---------------------------------------------------------------*
      *    Copyright (c) 2006 ATLAS Dienstleistungen f. V. GmbH
      *---------------------------------------------------------------*
      *    $Workfile:   CVVBA006.CPY  $
      *    $Revision:   2.1  $
      *
      *    $Log:   L:/mf/CPY/CVVBA006.CPv  $
      *
      *   Rev 2.1   Jun 26 2006 11:22:38   t13ae13
      *AVB00852: Anpassung VB-System an "Neue Komm.Strategie": SWL 
      *
      *   Rev 2.0   Jun 19 2006 13:02:22   t13ae13
      *Archiverstellung
      *
      *---------------------------------------------------------------*
      ****************************************************************  
      * AENDERUNGEN:                                                 *  
      * AUFTRAG ! DATUM  !VER ! AENDERUNG                 ! NAME     *  
      * -------------------------------------------------------------*  
      * AVB00852!20.06.06!2.1 ! NEU                       ! S. Walb  *  
      *         !        !    !                           !          *  
      *         !        !    !                           !          *  
      *         !        !    !                           !          *  
      *                                                              *  
      * ENDE-LOGBUCH                                                 *  
      ****************************************************************  
      ******************************************************************
      * DCLGEN TABLE(VIVBA006)                                         *
      *        LIBRARY(P130005.BP010000.SRCDCL(CVVBA006))              *
      *        ACTION(REPLACE)                                         *
      *        QUOTE                                                   *
      * ... IS THE DCLGEN COMMAND THAT MADE THE FOLLOWING STATEMENTS   *
      ******************************************************************
           EXEC SQL DECLARE VIVBA006 TABLE
           ( DIR_NR                         SMALLINT NOT NULL,
             DIR_LAST_UPDATE                TIMESTAMP NOT NULL,
             KTY_DIR_TYP                    SMALLINT NOT NULL,
             KNR_DIR_TYP                    SMALLINT NOT NULL,
             KTY_REGION                     SMALLINT NOT NULL,
             KNR_REGION                     SMALLINT NOT NULL,
             KTY_RESERV_TYP                 SMALLINT NOT NULL,
             KNR_RESERV_TYP                 SMALLINT NOT NULL,
             MA_ST_NR                       INTEGER NOT NULL,
             DIR_NAME                       CHAR(40) NOT NULL,
             DIR_INFORMATION                CHAR(150) NOT NULL,
             KTY_VERTRBER                   SMALLINT NOT NULL,
             KNR_VERTRBER                   SMALLINT NOT NULL
           ) END-EXEC.
      ******************************************************************
      * COBOL DECLARATION FOR TABLE VIVBA006                           *
      ******************************************************************
       01  VIVBA006-GESAMT.
        05  NI-VIVBA006-TAB.
           10  NI-VIVBA006-ELE       PIC S9(04)  COMP   OCCURS 13 TIMES.
        05  NI-VIVBA006              REDEFINES   NI-VIVBA006-TAB.
           10 NI-DIR-NR              PIC S9(04)  COMP.
           10 NI-DIR-LAST-UPDATE     PIC S9(04)  COMP.
           10 NI-KTY-DIR-TYP         PIC S9(04)  COMP.
           10 NI-KNR-DIR-TYP         PIC S9(04)  COMP.
           10 NI-KTY-REGION          PIC S9(04)  COMP.
           10 NI-KNR-REGION          PIC S9(04)  COMP.
           10 NI-KTY-RESERV-TYP      PIC S9(04)  COMP.
           10 NI-KNR-RESERV-TYP      PIC S9(04)  COMP.
           10 NI-MA-ST-NR            PIC S9(04)  COMP.
           10 NI-DIR-NAME            PIC S9(04)  COMP.
           10 NI-DIR-INFORMATION     PIC S9(04)  COMP.
           10 NI-KTY-VERTRBER        PIC S9(04)  COMP.
           10 NI-KNR-VERTRBER        PIC S9(04)  COMP.
        05  DCL-VIVBA006.
           10 DIR-NR               PIC S9(4) USAGE COMP.
           10 DIR-LAST-UPDATE      PIC X(26).
           10 KTY-DIR-TYP          PIC S9(4) USAGE COMP.
           10 KNR-DIR-TYP          PIC S9(4) USAGE COMP.
           10 KTY-REGION           PIC S9(4) USAGE COMP.
           10 KNR-REGION           PIC S9(4) USAGE COMP.
           10 KTY-RESERV-TYP       PIC S9(4) USAGE COMP.
           10 KNR-RESERV-TYP       PIC S9(4) USAGE COMP.
           10 MA-ST-NR             PIC S9(9) USAGE COMP.
           10 DIR-NAME             PIC X(40).
           10 DIR-INFORMATION      PIC X(150).
           10 KTY-VERTRBER         PIC S9(4) USAGE COMP.
           10 KNR-VERTRBER         PIC S9(4) USAGE COMP.
      ******************************************************************
      * THE NUMBER OF COLUMNS DESCRIBED BY THIS DECLARATION IS 13      *
      ******************************************************************
