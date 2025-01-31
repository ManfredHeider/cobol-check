000010*---------------------------------------------------------------*
000020*    Standard für alle Objekte unter PVCS
000030*            Datum   :  Januar 2001
000040*            Kopf aus:  N:\PROFILE\KOPFCPY.DAT
000050*---------------------------------------------------------------*
000060*
000070*---------------------------------------------------------------*
000080*    Copyright 2001 ATLAS Dienstleistungs GmbH
000090*---------------------------------------------------------------*
000100*    $Workfile:   DRVB0571.CPY  $
000110*    $Revision:   2.2  $
000120*
000130*    $Log:   L:/mf/cpy/DRVB0571.CPv  $
000140*
000150*   Rev 2.2   Feb 20 2003 14:43:04   t13ex22
000160*AAN00660: Erfassen eMail im VB43
000170*
000180*   Rev 2.1   Aug 09 2002 11:04:54   t13ae27
000190*EMAIL/URL-Einführung
000200*
000210*   Rev 2.0   Feb 25 2002 17:31:10   p13sp20
000220*Archiverstellung
000230*
000240*---------------------------------------------------------------*
000250*****************************************************************
000260*    COPY-MEMBER: DRVB0571                                      *
000270*    --------------------------------------------------------   *
000280*    SCHNITTSTELLE FÜR DAS UPRO ZWVB0084                        *
000290*    MIT DEN DATEN, DIE EINMAL PRO UPRO ÜBERGEBEN WERDEN        *
000300*    --------------------------------------------------------   *
000310*    ERSTELLT: P. DUERR.                                        *
000320*    DATUM:    27.02.2002                                       *
000330*****************************************************************
000340*    VERSION
000350****************************************************************
000360* AENDERUNGEN:                                                 *
000370* AUFTRAG ! DATUM  !VER ! AENDERUNG                 ! NAME     *
000380* -------------------------------------------------------------*
000390* AVB00587!27.02.02! 01 ! NEU                       ! DUERR    *
000400* AVB00660!13.02.03! 02 ! NEUE FUNKTION DRVB0637    ! MUND     *
000410*                                                              *
000420* ENDE-LOGBUCH                                                 *
000430****************************************************************
000440*
000450*    DIESES COPY ENTHÄLT DIE INFORMATIONEN, DIE EINMAL
000460*    PRO UPRO ÜBERGEBEN WERDEN.
000470*    ALSO NICHT: DATEN, DIE PRO FUNKTION ÜBERGEBEN WERDEN
000480*                (IN SEPARATEN COPYS PRO FUNKTION)
000490*
000500****************************************************************
000510*
000520 01  PI-ZWVB0084.
000530     05  PI-ZWVB0084-FUNKTION            PIC  X(008).
000540         88 PI-ZWVB0084-DRVB0572              VALUE 'DRVB0572'.
000550         88 PI-ZWVB0084-DRVB0577              VALUE 'DRVB0577'.
000560         88 PI-ZWVB0084-DRVB0591              VALUE 'DRVB0591'.
000570         88 PI-ZWVB0084-DRVB0637              VALUE 'DRVB0637'.
000580*
000590******* ENDE COPY-MEMBER DRVB0124 *****************************
