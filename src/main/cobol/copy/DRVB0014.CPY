      *---------------------------------------------------------------*
      *    Standard für alle Objekte unter PVCS
      *            Datum   :  November 1995
      *            Kopf aus:  N:\PROFILE\KOPFCBL.DAT
      *---------------------------------------------------------------*
      *
      *---------------------------------------------------------------*
      *    Copyright 1995 ATLAS Dienstleistungs GmbH
      *---------------------------------------------------------------*
      *    $Workfile:   DRVB0014.CPY  $
      *    $Revision:   2.0  $
      *
      *    $Log:   L:\MF\CPY\DRVB0014.CPv  $
      *
      *   Rev 2.0   Feb 27 1999 15:57:44   P13SP20
      *NT-Umstellung
      *
      *   Rev 1.0   Nov 04 1995 09:05:46   P13SP99
      *Initial revision.
      *
      *---------------------------------------------------------------*
      *****************************************************************
      *    COPY-MEMBER: DRVB0014                                      *
      *    SCHNITTSTELLE ZU UPVB0023                                  * 00040000
      *    --------------------------------------------------------   *
      *    ERSTELLT: NAUMANN                                          * 00060000
      *    DATUM:    30.03.1993                                       * 00070000
      ***************************************************************** 00090000
      *    VERSION   01   16.09.93                                   *  00090101
      ****************************************************************  00091000
      * AENDERUNGEN:                                                 *  00092000
      * AUFTRAG ! DATUM  !VER ! AENDERUNG                 ! NAME     *  00093000
      * -------------------------------------------------------------*  00094000
      *         !16.09.93! 01 ! NEU                       ! NAUMANN  *  00095002
      *         !        !    !                           !          *  00096001
      *         !        !    !                           !          *  00097001
      *         !        !    !                           !          *  00098001
      *         !        !    !                           !          *  00099000
      *         !        !    !                           !          *  00099100
      *         !        !    !                           !          *  00099200
      *         !        !    !                           !          *  00099300
      *                                                              *  00099400
      * ENDE-LOGBUCH                                                 *  00099500
      ****************************************************************  00099600
      *    DER ENTSPRECHENDE PROVISIONSSATZ (EIGEN) MUß IN            *
      *    PI-UPVB0023-PROV-STZ-AP ZUR VERFÜGUNG GESTELLT WERDEN.     *
      *                                                               *
      *    FALLS EINE VB-PRAXIS-STUFE DIESEM PROVISIONSSATZ ZUZU-     *
      *    ORDNEN IST, WIRD DAS DATENFELD PO-UPVB0023-VBP-NR MIT      *
      *    DEM ENTSPRECHENDEN INHALT ( <> 0) GEFÜLLT.                 *
      *                                                               *
      *    FALLS KEINE VB-PRAXIS-STUFE DIESEM PROVISIONSSATZ ZUZUORD- *
      *    NEN IST, WIRD DAS DATENFELD PO-UPVB0023-VBP-NR MIT ZERO    *
      *    BELEGT.                                                    *
                                                                        00110000
       01  PI-UPVB0023.                                                 00111000
           05  PI-UPVB0023-PROV-STZ-AP   PIC S999V99  COMP-3.           00112000
      *                                                                 00114000
       01  PO-UPVB0023.                                                 00115000
           05  PO-UPVB0023-VBP-NR        PIC S9(4)    COMP.             00116000
      ******** ENDE COPY-MEMBER (DRVB0014) *******************          00117000
