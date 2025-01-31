000010*---------------------------------------------------------------*
000020*    Standard für alle Objekte unter PVCS
000030*            Datum   :  Januar 2001
000040*            Kopf aus:  N:\PROFILE\KOPFCPY.DAT
000050*---------------------------------------------------------------*
000060*
000070*---------------------------------------------------------------*
000080*    Copyright 2001 ATLAS Dienstleistungs GmbH
000090*---------------------------------------------------------------*
000100*    $Workfile:   DRVB0580.CPY  $
000110*    $Revision:   2.1  $
000120*
000130*    $Log:   L:/mf/cpy/DRVB0580.CPv  $
000140*
000150*   Rev 2.1   Apr 30 2002 09:15:28   t13ae27
000160*zusätzliche Parameter in CTV-Briefen
000170*
000180*   Rev 2.0   Feb 25 2002 17:32:08   p13sp20
000190*Archiverstellung
000200*
000210*---------------------------------------------------------------*
000220****************************************************************
000230*    COPY-MEMBER: DRVB0580, ALLGEMEINE SCHNITTSTELLE           *
000240*                 FÜR CTV-BATCH UPRO-CALL                      *
000250*    --------------------------------------------------------  *
000260*    ERSTELLT: P. Dürr                                         *
000270*    DATUM:    13.03.2002                                      *
000280****************************************************************
000290*    VERSION   1
000300****************************************************************
000310* AENDERUNGEN:                                                 *
000320* AUFTRAG ! DATUM  !VER ! AENDERUNG                 ! NAME     *
000330* -------------------------------------------------------------*
000340* ACV00007!13.03.02!    ! NEU                       ! P.DÜRR   *
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
000450*     PI-DRVB0580-MA-ST-NR
000460*     PI-DRVB0580-CICS-DATUM
000470*
000480*   AUSGABE:
000490*
000500*     PO-DRVB0580-RC
000510*     PO-DRVB0580-MA-ZV-DAT-VON             ZV-Datum
000520*
000530***************************************************************
000540*                 PARAMETER-INPUT                             *
000550***************************************************************
000560 01  PI-DRVB0580.
000570     05  PI-DRVB0580-MA-ST-NR           PIC S9(009) COMP.
000580     05  PI-DRVB0580-CICS-DATUM         PIC X(010).

000600***************************************************************
000610*                 PARAMETER-OUTPUT                            *
000620***************************************************************
000630 01  PO-DRVB0580.
000640     05  PO-DRVB0580-RC                 PIC  X(003).
000650         88 PO-DRVB0580-RC-OK                  VALUE 'OK '.
000660         88 PO-DRVB0580-RC-NOK                 VALUE 'NOK'.
000670         88 PO-DRVB0580-RC-NOT-FOUND           VALUE 'NFD'.
000680         88 PO-DRVB0580-RC-ERR                 VALUE 'ERR'.
000690*
000700     05  PO-DRVB0580-MA-ZV-DAT-VON      PIC X(010).

000720******** ENDE COPY-MEMBER ************************************



