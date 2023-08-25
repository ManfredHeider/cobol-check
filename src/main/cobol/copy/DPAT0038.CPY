      *---------------------------------------------------------------*
      *    Standard für alle Objekte unter PVCS
      *            Datum   :  November 1995
      *            Kopf aus:  N:\PROFILE\KOPFCBL.DAT
      *---------------------------------------------------------------*
      *
      *---------------------------------------------------------------*
      *    Copyright 1995 ATLAS Dienstleistungs GmbH
      *---------------------------------------------------------------*
      *    $Workfile:   DPAT0038.CPY  $
      *    $Revision:   2.0  $
      *
      *    $Log:   L:\MF\CPY\DPAT0038.CPv  $
      *
      *   Rev 2.0   Feb 27 1999 11:56:54   P13SP20
      *NT-Umstellung
      *
      *   Rev 1.1   13 Nov 1998 16:53:12   T13EX26
      *PEG-PRODUKTIONSüBERGABE
      *
      *   Rev 1.0   Nov 04 1995 08:17:36   P13SP99
      *Initial revision.
      *
      *---------------------------------------------------------------*
      ***************************************************************** 00010000
      *    COPY-MEMBER: DPAT0038                                      * 00020000
      *    --------------------------------------------------------   * 00030000
      *    BATCHRAHMEN: FEHLERAUFBEREITUNG UND -AUSGABE (DISPLAYS)    * 00040000
      *    --------------------------------------------------------   * 00050000
      *    ERSTELLT: SCHÖLLHAMMER                                     * 00060000
      *    DATUM:    19.08.1994                                       * 00070001
      ***************************************************************** 00080000
      *    VERSION   1    14.09.94 16:35:20
      ****************************************************************  00100000
      * AENDERUNGEN:                                                 *  00110000
      * AUFTRAG ! DATUM  !VER ! AENDERUNG                 ! NAME     *  00120000
      * -------------------------------------------------------------*  00130000
      * AFVB0144!19.08.94!    ! NEU                       ! SCHÖLLH. *  00140004
      *         !06.09.94! 01 ! PROD.UEBERGABE            ! SCHÖLLH. *  00140104
      * AFPA0012!06.11.97! 02 ! AUSGABE D-ERR-SCHLUESSEL  ! AUERBACH *  00141000
      *         !        !    !                           !          *  00142000
      *         !        !    !                           !          *  00143000
      *         !        !    !                           !          *  00144000
      *                                                              *  00145000
      * ENDE-LOGBUCH                                                 *  00146000
      ****************************************************************  00147000
      *                                                                 00147100
      * ROUTINEN: - BR99-SCHWERER-FEHLER-DISPLAY                        00148000
      *           - UR82-D-ERR-DISPLAY                                  00148100
      *                                                                 00148400
      *------------------------------------------------------------*    00148500
       BR99-SCHWERER-FEHLER-DISPLAY SECTION.                            00148603
       BR99-ANF.                                                        00148703
      *------------------------------------------------------------*    00148800
      * INPUT : ERR-ERROR-BEREICH:                                 *    00148900
      * OUTPUT: FEHLERBILD (ERRIPRO) MIT FEHLERINFORMATIONEN       *    00151700
      * VERARBEITUNG:                                              *    00151900
      *   - AUFBEREITUNG DER ERROR-SCHNITTSTELLE ABHÄNGIG VON      *    00152000
      *     ERR-FEHLER-TYP UND ERR-AUFBEREITUNG                    *    00152100
      *   - AUSGABE DER ERROR-INFORMATIONEN (DISPLAYS)             *    00152200
      *------------------------------------------------------------*    00153000
                                                                        00191000
      *****  AUFBEREITEN FEHLER-INFORMATIONEN                           00199900
                                                                        00200000
           PERFORM UR81-ERR-AUFBER                                      00200100
                                                                        00200400
      *****  AUSGABE FEHLER-INFORMATIONEN                               00200600
                                                                        00200700
           PERFORM UR82-D-ERR-DISPLAY                                   00200800
           .                                                            00202500
       BR99-EXIT.                                                       00202603
           EXIT.                                                        00202700
      *                                                                 00202800
      *------------------------------------------------------------*    00203200
       UR82-D-ERR-DISPLAY SECTION.                                      00203300
       UR82-ANF.                                                        00203400
      *------------------------------------------------------------*    00203500
      * INPUT : D-ERROR-BEREICH                                    *    00203600
      * OUTPUT: FEHLERBILD (ERRIPRO) MIT FEHLERINFORMATIONEN       *    00205700
      * VERARBEITUNG:                                              *    00205900
      *   - AUSGABE DER ERROR-INFORMATIONEN (DISPLAYS)             *    00206200
      *------------------------------------------------------------*    00206300
                                                                        00206400
           DISPLAY D-ERR-ZEILE-01                                       00206502
           DISPLAY D-ERR-ZEILE-02                                       00206602
           DISPLAY D-ERR-ZEILE-03                                       00206702
           DISPLAY D-ERR-ZEILE-04                                       00206802
           DISPLAY D-ERR-ZEILE-05                                       00206902
           DISPLAY D-ERR-ZEILE-06                                       00207002
           DISPLAY D-ERR-ZEILE-07                                       00207102
           DISPLAY D-ERR-ZEILE-08                                       00207202
           DISPLAY D-ERR-ZEILE-09                                       00207302
           DISPLAY D-ERR-ZEILE-10                                       00207402
           DISPLAY D-ERR-ZEILE-11                                       00207502
           DISPLAY D-ERR-ZEILE-12                                       00207602
           DISPLAY D-ERR-ZEILE-13                                       00207702
           DISPLAY D-ERR-ZEILE-14                                       00207802
           DISPLAY D-ERR-ZEILE-15                                       00207902
           DISPLAY D-ERR-ZEILE-16                                       00208002

061197*    AUSGABE 'SCHLüSSEL DES AKTUELL BEARBEITETEN EINGABESATZ'
061197*    DIE AUSGABE ERFOLGT VOR DEM 'VARIABLEN TRACEBEREICH'
061197     DISPLAY D-ERR-ZEILE-25                                       00208102
061197     DISPLAY D-ERR-ZEILE-26                                       00208202
061197     DISPLAY D-ERR-ZEILE-27                                       00208302
061197     DISPLAY D-ERR-ZEILE-28                                       00208402
061197     DISPLAY D-ERR-ZEILE-29                                       00208502

           DISPLAY D-ERR-ZEILE-17                                       00208102
           DISPLAY D-ERR-ZEILE-18                                       00208202
           DISPLAY D-ERR-ZEILE-19                                       00208302
           DISPLAY D-ERR-ZEILE-20                                       00208402
           DISPLAY D-ERR-ZEILE-21                                       00208502
           DISPLAY D-ERR-ZEILE-22                                       00208602
           DISPLAY D-ERR-ZEILE-23                                       00208702
           DISPLAY D-ERR-ZEILE-24                                       00208802
           .                                                            00208900
       UR82-EXIT.                                                       00209000
           EXIT.                                                        00209100
      *                                                                 00209200
      ******** ENDE COPY-MEMBER (DPAT0038) *******************          00209300
                                                                        00210000
