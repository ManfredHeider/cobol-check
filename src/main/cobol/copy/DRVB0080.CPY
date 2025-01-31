      *---------------------------------------------------------------*
      *    Standard für alle Objekte unter PVCS
      *            Datum   :  November 1995
      *            Kopf aus:  N:\PROFILE\KOPFCBL.DAT
      *---------------------------------------------------------------*
      *
      *---------------------------------------------------------------*
      *    Copyright 1995 ATLAS Dienstleistungs GmbH
      *---------------------------------------------------------------*
      *    $Workfile:   drvb0080.CPY  $
      *    $Revision:   2.0  $
      *
      *    $Log:   L:\MF\CPY\drvb0080.CPv  $
      *
      *   Rev 2.0   Feb 27 1999 15:59:18   P13SP20
      *NT-Umstellung
      *
      *   Rev 1.0   Apr 01 1996 14:23:48   T13AE26
      *Initial revision.
      *
      *---------------------------------------------------------------*
      ****************************************************************
      *    COPY-MEMBER: DRVB0080                                     *
      *    --------------------------------------------------------  *
      *    COPYSTRECKE SCHNITTSTELLE UPVB0063                        *
      *    --------------------------------------------------------  *
      *    VERSION
      *    --------------------------------------------------------  *
      *    ERSTELLT: GERLACH                                         *
      *    DATUM:    18.05.1995                                      *
      *    STAND:    18.05.1995                                      *
      ****************************************************************
      * HINWEISE:                                                    *
      *    DATUM WIRD ALS JJMMTT ERWARTET                            *
      ****************************************************************
      *    VERSION
      ****************************************************************
      * AENDERUNGEN:                                                 *
      * AUFTRAG ! DATUM ! VER ! AENDERUNG                 ! NAME     *
      * -------------------------------------------------------------*
      * AFVB0200!18.05.95! 01 ! NEU                       ! GERLACH  *
      ****************************************************************
      *
        01 PI-UPVB0063.
            05 PI-UPVB0063-ST-NR             PIC  9(07).
            05 PI-UPVB0063-DATUM             PIC  X(06).

        01 PO-UPVB0063.
            05 PO-UPVB0063-PROVSATZ          PIC  999V9.
            05 PO-UPVB0063-MS-NR             PIC  9(03).
      *
      *
      ******** ENDE COPY-MEMBER (DRVB0080) *******************
