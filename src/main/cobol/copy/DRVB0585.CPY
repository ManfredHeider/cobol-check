000010*---------------------------------------------------------------*
000020*    Standard für alle Objekte unter PVCS
000030*            Datum   :  Januar 2001
000040*            Kopf aus:  N:\PROFILE\KOPFCPY.DAT
000050*---------------------------------------------------------------*
000060*
000070*---------------------------------------------------------------*
000080*    Copyright 2001 ATLAS Dienstleistungs GmbH
000090*---------------------------------------------------------------*
000100*    $Workfile:   DRVB0585.CPY  $
000110*    $Revision:   2.1  $
000120*
000130*    $Log:   L:/mf/cpy/DRVB0585.CPv  $
000140*
000150*   Rev 2.1   Apr 15 2002 17:14:28   t13ae30
000160*AAS00344 - REGIONENWBW 2002 DER SW1
000170*
000180*   Rev 2.0   Feb 25 2002 17:32:40   p13sp20
000190*Archiverstellung
000200*
000210*---------------------------------------------------------------*
000220****************************************************************
000230* COPYMEMBER DRVB0585, SATZBESCHREIBUNG FUER DIE DATEI         *
000240* AS006200 (REGIONENWETTBEWERB 2002 DER SW1)                   *
000250*                                                              *
000260* SATZLAENGE     BYTE                                          *
000270****************************************************************
000280* AENDERUNGEN:                                                 *
000290* AUFTRAG ! DATUM  !VER ! AENDERUNG                 ! NAME     *
000300* -------------------------------------------------------------*
000310* AAS00344!26.03.02! 01 ! NEU                       ! WILLIG   *
000320*         !        !    !                           !          *
000330*         !        !    !                           !          *
000340*                                                              *
000350* ENDE-LOGBUCH                                                 *
000360****************************************************************

000380 01 DRVB0585-SATZ.
000390    05 VB-KZ                        PIC X(01)      .
000400    05 DIR-NR                       PIC 9(004)     .
000410    05 VB-NR                        PIC 9(007)     .
000420    05 MS-NR                        PIC 9(004)     .
000430    05 STUFE                        PIC X(004)     .
000440    05 VB-NAME                      PIC X(062)     .
000450    05 BETR-VB-NR                   PIC 9(007)     .
000460    05 BETR-NAME                    PIC X(044)     .
000470    05 ABGER-EH                     PIC -(009)9,9  .
000480    05 EINGER-EH                    PIC Z(008)9,9  .
000490    05 ANZ-NEUE-VB                  PIC Z(003)9    .

000510*-------------------- COPY-MEMBER DRVB0585 -----------------------
