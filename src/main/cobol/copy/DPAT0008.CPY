      *---------------------------------------------------------------*
      *    Standard für alle Objekte unter PVCS
      *            Datum   :  November 1995
      *            Kopf aus:  N:\PROFILE\KOPFCBL.DAT
      *---------------------------------------------------------------*
      *
      *---------------------------------------------------------------*
      *    Copyright 1995 ATLAS Dienstleistungs GmbH
      *---------------------------------------------------------------*
      *    $Workfile:   DPAT0008.CPY  $
      *    $Revision:   2.0  $
      *
      *    $Log:   L:\MF\CPY\DPAT0008.CPv  $
      *
      *   Rev 2.0   Feb 27 1999 11:56:48   P13SP20
      *NT-Umstellung
      *
      *   Rev 1.1   Aug 26 1996 09:44:12   T13EX16
      *AFPA0002 Anpassungen wegen der Workbench
      *
      *   Rev 1.0   Nov 04 1995 08:12:04   P13SP99
      *Initial revision.
      *
      *---------------------------------------------------------------*
      ***************************************************************** 00010000
      *    COPY-MEMBER: DPAT0008      UPRO: SQL-FEHLER-BEHANDLUNG     * 00020000
      *    --------------------------------------------------------   * 00030000
      *    VERSION   001                                              * 00040000
      *    --------------------------------------------------------   * 00050000
      *    ERSTELLT: W. SCHÖLLHAMMER (INTEGRATA AG)                   * 00060000
      *    DATUM:    02.03.1993                                       * 00070000
      *    STAND:    21.04.1993                                       * 00080003
      ***************************************************************** 00090000
      ****************************************************************  00100000
      * AENDERUNGEN:                                                 *  00110000
      * AUFTRAG ! DATUM  !VER ! AENDERUNG                 ! NAME     *  00120000
      * -------------------------------------------------------------*  00130000
      * AFPA0002!23.08.96! 02 ! ERR-AUFBER-NORMAL GESETZT ! AUERBACH *  00140008
      *         !        !    ! WEGEN MF WB               !          *  00142000
      *         !        !    !                           !          *  00143000
      *         !        !    !                           !          *  00144000
      *                                                              *  00145000
      * ENDE-LOGBUCH                                                 *  00146000
      ****************************************************************  00147000
      *                                                                 00100000
      *    FEHLERBEHANDLUNGS-ROUTINE, DIE IN EINEM UPRO BEI AUFTRETEN   00110000
      *    EINES SQL-FEHLERS BENOETIGT WIRD                             00120000
      *                                                                 00130000
      *------------------------------------------------------------*    00140000
      * XR91-UPRO-SQL-FEHLER                                       *    00150000
      *------------------------------------------------------------*    00160000
      * INPUT : SQLCODE, SQLERRMC, ERR-ORT, K-PGM-NAME             *    00170000
      *                                                            *    00180000
      * OUTPUT: GEFUELLTER ERR-ERROR-BEREICH                       *    00190000
      *                                                            *    00200000
      * VERARBEITUNG:                                              *    00210000
      *   - FUELLEN DER ERROR-SCHNITTSTELLE FUER UPRO-SQL-FEHLER   *    00220000
      *                                                            *    00230000
      *------------------------------------------------------------*    00240000
       XR91-UPRO-SQL-FEHLER SECTION.                                    00250000
       XR91-ANF.                                                        00260000
      *                                                                 00270000
      *    * VERSORGEN SCHNITTSTELLE                                    00280000
           SET ERR-RC-SCHWERER-FEHLER      TO TRUE                      00281002
           SET ERR-FTYP-SQL                TO TRUE                      00281101
960823     SET ERR-AUFBER-NORMAL           TO TRUE                      00281101
           MOVE K-PGM-NAME                 TO ERR-UPRONAME              00282000
           MOVE SQLCODE                    TO ERR-SQLCODE               00283000
           IF SQLERRML > ZERO                                           00283100
              MOVE SQLERRMC                TO ERR-SQLERRMC              00284000
           END-IF                                                       00284100
           .                                                            00285000
       XR91-EXIT.                                                       00286000
           EXIT.                                                        00287000
      *                                                                 00288000
      ******* ENDE COPY-MEMBER DPAT0008 (UPRO: SQL-FEHLER)  ********    00289000
           EJECT                                                        00290000
