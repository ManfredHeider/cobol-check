      *---------------------------------------------------------------*
      *    Standard für alle Objekte unter PVCS
      *            Datum   :  November 1995
      *            Kopf aus:  N:\PROFILE\KOPFCBL.DAT
      *---------------------------------------------------------------*
      *
      *---------------------------------------------------------------*
      *    Copyright 1995 ATLAS Dienstleistungs GmbH
      *---------------------------------------------------------------*
      *    $Workfile:   DPVB0034.CPY  $
      *    $Revision:   2.0  $
      *
      *    $Log:   L:\MF\CPY\DPVB0034.CPv  $
      *
      *   Rev 2.0   Feb 27 1999 15:57:32   P13SP20
      *NT-Umstellung
      *
      *   Rev 1.0   Nov 04 1995 08:27:58   P13SP99
      *Initial revision.
      *
      *---------------------------------------------------------------*
      ***************************************************************** 00010000
      *    COPY-MEMBER: DPVB0034                                      * 00020000
      *    DIESE SECTION ERMITTELT DIE SOG. SONDERPROVISION           * 00021000
      *    --------------------------------------------------------   * 00021300
      *    ERSTELLT: O. NAUMANN       (DVAG)                          * 00021600
      *    DATUM:    03.04.1993                                       * 00021700
      ***************************************************************** 00021900
      *    VERSION   01   16.09.93                                   *  00022002
      ****************************************************************  00022102
      * AENDERUNGEN:                                                 *  00022202
      * AUFTRAG ! DATUM  !VER ! AENDERUNG                 ! NAME     *  00022302
      * -------------------------------------------------------------*  00022402
      *         !16.09.93! 01 ! NEU                       ! NAUMANN  *  00022502
      *         !        !    !                           !          *  00022602
      *         !        !    !                           !          *  00022702
      *         !        !    !                           !          *  00022802
      *         !        !    !                           !          *  00022902
      *         !        !    !                           !          *  00023002
      *         !        !    !                           !          *  00023102
      *         !        !    !                           !          *  00023202
      *                                                              *  00023302
      * ENDE-LOGBUCH                                                 *  00023402
      ****************************************************************  00023502
      *---------------------------------------------------------------  00023600
       SOPROV-ERMITT SECTION.                                           00023700
      *---------------------------------------------------------------  00024000
      *-INPUT:  WK-PROV-GP-BETR, WK-PROV-GP-UNTST                    -  00025000
      *-        WK-PROZ-STZ                                          -  00026000
      *-OUTPUT: Z-AUSPROV                                            -  00027000
      *---------------------------------------------------------------  00028000
       SOPROV-ERMITT-ANF.                                               00029000
           COMPUTE Z-AUSPROV    = 0,01 * WK-PROZ-STZ * (WK-PROV-GP-BETR 00030001
                                                   -  WK-PROV-GP-UNTST) 00040000
           .                                                            00050000
       SOPROV-ERMITT-EXIT.                                              00060000
           EXIT.                                                        00070000
