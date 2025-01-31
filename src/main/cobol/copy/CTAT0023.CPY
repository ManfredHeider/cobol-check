      *---------------------------------------------------------------*
      *    Standard für alle Objekte unter PVCS
      *            Datum   :  November 1995
      *            Kopf aus:  N:\PROFILE\KOPFCBL.DAT
      *---------------------------------------------------------------*
      *
      *---------------------------------------------------------------*
      *    Copyright 1995 ATLAS Dienstleistungs GmbH
      *---------------------------------------------------------------*
      *    $Workfile:   CTAT0023.CPY  $
      *    $Revision:   2.1  $
      *
      *    $Log:   L:/mf/CPY/CTAT0023.CPv  $
      *
      *   Rev 2.1   25 Jan 2007 10:50:16   t13ex49
      *AKI00556: Datenabgleich HOST-DB <-> Online-DB - Teil 2 
      *
      *   Rev 2.0   Feb 27 1999 11:56:38   P13SP20
      *NT-Umstellung
      *
      *   Rev 1.0   06 Feb 1998 10:53:30   P13SP19
      *Initial revision.
      *
      *---------------------------------------------------------------*
      *****************************************************************
      * AENDERUNGEN:                                                  *
      * AUFTRAG ! DATUM  !VER ! AENDERUNG                 ! NAME      *
      * --------------------------------------------------------------*
      * AKI00556!12.04.06!    ! Neu                       ! P. Pohl   *
      *         !        !    !                           !           *
      *         !        !    !                           !           *
      *****************************************************************
      *
           EXEC SQL DECLARE SYSIBM.SYSINDEXES TABLE
           ( NAME                           VARCHAR(18) NOT NULL,
             CREATOR                        CHAR(8) NOT NULL,
             TBNAME                         VARCHAR(18) NOT NULL,
             TBCREATOR                      CHAR(8) NOT NULL,
             UNIQUERULE                     CHAR(1) NOT NULL,
             COLCOUNT                       SMALLINT NOT NULL,
             CLUSTERING                     CHAR(1) NOT NULL,
             CLUSTERED                      CHAR(1) NOT NULL,
             DBID                           SMALLINT NOT NULL,
             OBID                           SMALLINT NOT NULL,
             ISOBID                         SMALLINT NOT NULL,
             DBNAME                         CHAR(8) NOT NULL,
             INDEXSPACE                     CHAR(8) NOT NULL,
             FIRSTKEYCARD                   INTEGER NOT NULL,
             FULLKEYCARD                    INTEGER NOT NULL,
             NLEAF                          INTEGER NOT NULL,
             NLEVELS                        SMALLINT NOT NULL,
             BPOOL                          CHAR(8) NOT NULL,
             PGSIZE                         SMALLINT NOT NULL,
             ERASERULE                      CHAR(1) NOT NULL,
             DSETPASS                       CHAR(8) NOT NULL,
             CLOSERULE                      CHAR(1) NOT NULL,
             SPACE                          INTEGER NOT NULL,
             IBMREQD                        CHAR(1) NOT NULL,
             CLUSTERRATIO                   SMALLINT NOT NULL,
             CREATEDBY                      CHAR(8) NOT NULL,
             IOFACTOR                       SMALLINT NOT NULL,
             PREFETCHFACTOR                 SMALLINT NOT NULL,
             STATSTIME                      TIMESTAMP NOT NULL,
             INDEXTYPE                      CHAR(1) NOT NULL,
             FIRSTKEYCARDF                  FLOAT NOT NULL,
             FULLKEYCARDF                   FLOAT NOT NULL,
             CREATEDTS                      TIMESTAMP NOT NULL,
             ALTEREDTS                      TIMESTAMP NOT NULL,
             PIECESIZE                      INTEGER NOT NULL,
             COPY                           CHAR(1) NOT NULL,
             COPYLRSN                       CHAR(6) NOT NULL,
             CLUSTERRATIOF                  FLOAT NOT NULL,
             SPACEF                         FLOAT NOT NULL,
             REMARKS                        VARCHAR(254) NOT NULL
           ) END-EXEC.
      ******************************************************************
      * COBOL DECLARATION FOR TABLE SYSIBM.SYSINDEXES                  *
      ******************************************************************
       01  DCLSYSINDEXES.
           10 NAME.
              49 NAME-LEN          PIC S9(4) USAGE COMP.
              49 NAME-TEXT         PIC X(18).
           10 CREATOR              PIC X(8).
           10 TBNAME.
              49 TBNAME-LEN        PIC S9(4) USAGE COMP.
              49 TBNAME-TEXT       PIC X(18).
           10 TBCREATOR            PIC X(8).
           10 UNIQUERULE           PIC X(1).
           10 COLCOUNT             PIC S9(4) USAGE COMP.
           10 CLUSTERING           PIC X(1).
           10 CLUSTERED            PIC X(1).
           10 DBID                 PIC S9(4) USAGE COMP.
           10 OBID                 PIC S9(4) USAGE COMP.
           10 ISOBID               PIC S9(4) USAGE COMP.
           10 DBNAME               PIC X(8).
           10 INDEXSPACE           PIC X(8).
           10 FIRSTKEYCARD         PIC S9(9) USAGE COMP.
           10 FULLKEYCARD          PIC S9(9) USAGE COMP.
           10 NLEAF                PIC S9(9) USAGE COMP.
           10 NLEVELS              PIC S9(4) USAGE COMP.
           10 BPOOL                PIC X(8).
           10 PGSIZE               PIC S9(4) USAGE COMP.
           10 ERASERULE            PIC X(1).
           10 DSETPASS             PIC X(8).
           10 CLOSERULE            PIC X(1).
      *    10 SPACE                PIC S9(9) USAGE COMP.
           10 FILLER               PIC S9(9) USAGE COMP.
           10 IBMREQD              PIC X(1).
           10 CLUSTERRATIO         PIC S9(4) USAGE COMP.
           10 CREATEDBY            PIC X(8).
           10 IOFACTOR             PIC S9(4) USAGE COMP.
           10 PREFETCHFACTOR       PIC S9(4) USAGE COMP.
           10 STATSTIME            PIC X(26).
           10 INDEXTYPE            PIC X(1).
           10 FIRSTKEYCARDF        USAGE COMP-2.
           10 FULLKEYCARDF         USAGE COMP-2.
           10 CREATEDTS            PIC X(26).
           10 ALTEREDTS            PIC X(26).
           10 PIECESIZE            PIC S9(9) USAGE COMP.
      *    10 COPY                 PIC X(1).
           10 FILLER               PIC X(1).
           10 COPYLRSN             PIC X(6).
           10 CLUSTERRATIOF        USAGE COMP-2.
           10 SPACEF               USAGE COMP-2.
           10 REMARKS.
              49 REMARKS-LEN       PIC S9(4) USAGE COMP.
              49 REMARKS-TEXT      PIC X(254).
      ******************************************************************
      * INDICATOR VARIABLE STRUCTURE                                   *
      ******************************************************************
       01  ISYSINDEXES.
           10 INDSTRUC           PIC S9(4) USAGE COMP OCCURS 40 TIMES.
      ******************************************************************
      * THE NUMBER OF COLUMNS DESCRIBED BY THIS DECLARATION IS 40      *
      ******************************************************************


