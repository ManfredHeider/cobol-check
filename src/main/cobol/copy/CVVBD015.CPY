      *****************************************************************         
      *    ERSTELLT: KLEEMEIER                                        *         
      *    DATUM:    20.05.2021                                       *         
      *****************************************************************         
      * AENDERUNGEN:                                                  *         
      * JIRA     ! DATUM  ! AENDERUNG                     ! NAME      *         
      * ---------+--------+-------------------------------+---------- *         
      * VLA-2627 !20.05.21! NEU                           ! KLEEMEIER *         
      *          !        !                               !           *         
      *          !        !                               !           *         
      * ENDE-LOGBUCH                                                  *         
      *****************************************************************         
      * DCLGEN TABLE(VIVBD015) MAAN                                   *         
      *        LIBRARY(P130005.BP010000.SRCDCL(CVVBD015)              *         
      *        ACTION(REPLACE)                                        *         
      *        QUOTE                                                  *         
      * ... DIESES DCLGEN WURDE GENERIERT MIT GENERCBL (REXX)         *         
      *****************************************************************         
                                                                                
           EXEC SQL DECLARE VIVBD015 TABLE                                      
           ( MAAN_BEZUGS_NR              INTEGER NOT NULL                       
           , KTY_MAAN_TYP                SMALLINT NOT NULL                      
           , KNR_MAAN_TYP                SMALLINT NOT NULL                      
           , MAAN_DAT_VON                TIMESTAMP NOT NULL                     
           , MAAN_LAST_UPDATE            TIMESTAMP NOT NULL                     
           , MAAN_STRASSE                CHAR(40) NOT NULL                      
           , MAAN_PLZ_AKTUELL            CHAR(09) NOT NULL                      
           , MAAN_PLZ                    CHAR(09) NOT NULL                      
           , MAAN_ORT                    CHAR(40) NOT NULL                      
           , MAAN_PLZ_PF                 CHAR(09) NOT NULL                      
           , MAAN_ORT_PF                 CHAR(40) NOT NULL                      
           , MAAN_POSTFACH               CHAR(06) NOT NULL                      
           , MAAN_WOHNT_BEI              CHAR(40) NOT NULL                      
           , MAAN_DAT_BIS                DATE NOT NULL                          
           , MAAN_TELEFON                CHAR(26) NOT NULL                      
           , MAAN_TELEFAX                CHAR(26) NOT NULL                      
           , KTY_AUSL                    SMALLINT NOT NULL                      
           , KNR_AUSL                    SMALLINT NOT NULL                      
           , KTY_GRND                    SMALLINT NOT NULL                      
           , KNR_GRND                    SMALLINT NOT NULL                      
           , KTY_ZUSTELLUNG              SMALLINT NOT NULL                      
           , KNR_ZUSTELLUNG              SMALLINT NOT NULL                      
           , KTY_BEZUGS_TYP              SMALLINT NOT NULL                      
           , KNR_BEZUGS_TYP              SMALLINT NOT NULL                      
           , KTY_GEWERBE                 SMALLINT NOT NULL                      
           , KNR_GEWERBE                 SMALLINT NOT NULL                      
           , MAAN_STRASSE_GK             CHAR(40) NOT NULL                      
           , MAAN_ORT_GK                 CHAR(40) NOT NULL                      
           , KTY_BETRST                  SMALLINT NOT NULL                      
           , KNR_BETRST                  SMALLINT NOT NULL                      
           ) END-EXEC.                                                          
                                                                                
      *****************************************************************         
      * COBOL DEKLARATION FUER VIEW VIVBD015                          *         
      *****************************************************************         
                                                                                
       01  VIVBD015-GESAMT.                                                     
        05 NI-VIVBD015-TAB.                                                     
           10 NI-VIVBD015-ELE      PIC S9(04)  BINARY OCCURS  30.               
        05 NI-VIVBD015             REDEFINES   NI-VIVBD015-TAB.                 
           10 NI-MAAN-BEZUGS-NR           PIC S9(04)       BINARY.              
           10 NI-KTY-MAAN-TYP             PIC S9(04)       BINARY.              
           10 NI-KNR-MAAN-TYP             PIC S9(04)       BINARY.              
           10 NI-MAAN-DAT-VON             PIC S9(04)       BINARY.              
           10 NI-MAAN-LAST-UPDATE         PIC S9(04)       BINARY.              
           10 NI-MAAN-STRASSE             PIC S9(04)       BINARY.              
           10 NI-MAAN-PLZ-AKTUELL         PIC S9(04)       BINARY.              
           10 NI-MAAN-PLZ                 PIC S9(04)       BINARY.              
           10 NI-MAAN-ORT                 PIC S9(04)       BINARY.              
           10 NI-MAAN-PLZ-PF              PIC S9(04)       BINARY.              
           10 NI-MAAN-ORT-PF              PIC S9(04)       BINARY.              
           10 NI-MAAN-POSTFACH            PIC S9(04)       BINARY.              
           10 NI-MAAN-WOHNT-BEI           PIC S9(04)       BINARY.              
           10 NI-MAAN-DAT-BIS             PIC S9(04)       BINARY.              
           10 NI-MAAN-TELEFON             PIC S9(04)       BINARY.              
           10 NI-MAAN-TELEFAX             PIC S9(04)       BINARY.              
           10 NI-KTY-AUSL                 PIC S9(04)       BINARY.              
           10 NI-KNR-AUSL                 PIC S9(04)       BINARY.              
           10 NI-KTY-GRND                 PIC S9(04)       BINARY.              
           10 NI-KNR-GRND                 PIC S9(04)       BINARY.              
           10 NI-KTY-ZUSTELLUNG           PIC S9(04)       BINARY.              
           10 NI-KNR-ZUSTELLUNG           PIC S9(04)       BINARY.              
           10 NI-KTY-BEZUGS-TYP           PIC S9(04)       BINARY.              
           10 NI-KNR-BEZUGS-TYP           PIC S9(04)       BINARY.              
           10 NI-KTY-GEWERBE              PIC S9(04)       BINARY.              
           10 NI-KNR-GEWERBE              PIC S9(04)       BINARY.              
           10 NI-MAAN-STRASSE-GK          PIC S9(04)       BINARY.              
           10 NI-MAAN-ORT-GK              PIC S9(04)       BINARY.              
           10 NI-KTY-BETRST               PIC S9(04)       BINARY.              
           10 NI-KNR-BETRST               PIC S9(04)       BINARY.              
                                                                                
        05 DCL-VIVBD015.                                                        
           10 MAAN-BEZUGS-NR              PIC S9(09)       BINARY.              
           10 KTY-MAAN-TYP                PIC S9(04)       BINARY.              
           10 KNR-MAAN-TYP                PIC S9(04)       BINARY.              
           10 MAAN-DAT-VON                PIC  X(26).                           
           10 MAAN-LAST-UPDATE            PIC  X(26).                           
           10 MAAN-STRASSE                PIC  X(40).                           
           10 MAAN-PLZ-AKTUELL            PIC  X(09).                           
           10 MAAN-PLZ                    PIC  X(09).                           
           10 MAAN-ORT                    PIC  X(40).                           
           10 MAAN-PLZ-PF                 PIC  X(09).                           
           10 MAAN-ORT-PF                 PIC  X(40).                           
           10 MAAN-POSTFACH               PIC  X(06).                           
           10 MAAN-WOHNT-BEI              PIC  X(40).                           
           10 MAAN-DAT-BIS                PIC  X(10).                           
           10 MAAN-TELEFON                PIC  X(26).                           
           10 MAAN-TELEFAX                PIC  X(26).                           
           10 KTY-AUSL                    PIC S9(04)       BINARY.              
           10 KNR-AUSL                    PIC S9(04)       BINARY.              
           10 KTY-GRND                    PIC S9(04)       BINARY.              
           10 KNR-GRND                    PIC S9(04)       BINARY.              
           10 KTY-ZUSTELLUNG              PIC S9(04)       BINARY.              
           10 KNR-ZUSTELLUNG              PIC S9(04)       BINARY.              
           10 KTY-BEZUGS-TYP              PIC S9(04)       BINARY.              
           10 KNR-BEZUGS-TYP              PIC S9(04)       BINARY.              
           10 KTY-GEWERBE                 PIC S9(04)       BINARY.              
           10 KNR-GEWERBE                 PIC S9(04)       BINARY.              
           10 MAAN-STRASSE-GK             PIC  X(40).                           
           10 MAAN-ORT-GK                 PIC  X(40).                           
           10 KTY-BETRST                  PIC S9(04)       BINARY.              
           10 KNR-BETRST                  PIC S9(04)       BINARY.              
                                                                                
      *****************************************************************         
      * ANZAHL SPALTEN IN DIESER DEKLARATION :  30                    *         
      *****************************************************************         
