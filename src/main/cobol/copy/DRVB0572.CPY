000010*---------------------------------------------------------------*
000020*    Standard für alle Objekte unter PVCS
000030*            Datum   :  Januar 2001
000040*            Kopf aus:  N:\PROFILE\KOPFCPY.DAT
000050*---------------------------------------------------------------*
000060*
000070*---------------------------------------------------------------*
000080*    Copyright 2001 ATLAS Dienstleistungs GmbH
000090*---------------------------------------------------------------*
000100*    $Workfile:   DRVB0572.CPY  $
000110*    $Revision:   2.1  $
000120*
000130*    $Log:   L:/mf/cpy/DRVB0572.CPv  $
000140*
000150*   Rev 2.1   Aug 09 2002 11:04:58   t13ae27
000160*EMAIL/URL-Einführung
000170*
000180*   Rev 2.0   Feb 25 2002 17:31:16   p13sp20
000190*Archiverstellung
000200*
000210*---------------------------------------------------------------*
000220****************************************************************
000230*    COPY-MEMBER: DRVB0572, ALLGEMEINE SCHNITTSTELLE           *
000240*                 FÜR CTV-BATCH UPRO-CALL                      *
000250*    --------------------------------------------------------  *
000260*    ERSTELLT: P. Dürr                                         *
000270*    DATUM:    27.02.2002                                      *
000280****************************************************************
000290*    VERSION   1
000300****************************************************************
000310* AENDERUNGEN:                                                 *
000320* AUFTRAG ! DATUM  !VER ! AENDERUNG                 ! NAME     *
000330* -------------------------------------------------------------*
000340* AVB00587!27.02.02!    ! NEU                       ! P.DÜRR   *
000350*         !        !    !                           !          *
000360*         !        !    !                           !          *
000370*                                                              *
000380* ENDE-LOGBUCH                                                 *
000390****************************************************************
000400*
000410*   BESCHREIBUNG DER SCHNITTSTELLE:
000420*
000430*   EINGABE:
000440*
000450*     PI-DRVB0572-MURLZ-MA-ST-NR
000460*
000470*   AUSGABE:
000480*
000490*     PO-DRVB0572-RC
000500*     PO-DRVB0572-MURLZ-URL         URL-Adresse
000510*     PO-DRVB0572-MURLZ-DAT-VON     Datum-Ab  für URL-Adresse
000520*     PO-DRVB0572-MURLZ-DAT-BIS     Datum-Bis für URL-Adresse
000530*
000540***************************************************************
000550*                 PARAMETER-INPUT                             *
000560***************************************************************
000570 01  PI-DRVB0572.
000580     05  PI-DRVB0572-MA-ST-NR           PIC S9(009) COMP.

000600***************************************************************
000610*                 PARAMETER-OUTPUT                            *
000620***************************************************************
000630 01  PO-DRVB0572.
000640     05  PO-DRVB0572-RC                 PIC  X(003).
000650         88  PO-DRVB0572-RC-OK                      VALUE 'OK '.
000660         88  PO-DRVB0572-RC-NOK                     VALUE 'NOK'.
000670         88  PO-DRVB0572-RC-NOT-FOUND               VALUE 'NFD'.

000690     05  PO-DRVB0572-MURLZ-URL          PIC  X(070).
000700     05  PO-DRVB0572-MURLZ-DAT-VON      PIC  X(026).
000710     05  PO-DRVB0572-MURLZ-DAT-BIS      PIC  X(010).
000720     05  PO-DRVB0572-MURLZ-SST-KZ       PIC  X(001).

000740******** ENDE COPY-MEMBER ************************************

