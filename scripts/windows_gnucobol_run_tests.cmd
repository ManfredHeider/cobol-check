@echo off
rem Windows - compile and execute a test Cobol program
rem
rem  Assumptions:
rem
rem GnuCOBOL 3.+ is installed and on the path. Its executable or alias or symlink is named "cobc".
cobc -std=ibm -I C:\Users\enovo\Projekte\cobol-check\src\main\cobol\copy -I C:\Users\enovo\Projekte\mainframe\allgemeine-technik\copy -I C:\Users\enovo\Projekte\mainframe\antrag\copy -I C:\Users\enovo\Projekte\mainframe\mapcopy -I C:\Users\enovo\Projekte\mainframe\provisionsverteilung\copy -I C:\Users\enovo\Projekte\mainframe\vb-leistung\copy  -x %* && "%~dpn1" 
rem basispfad=C:\Users\enovo\Projekte\cobol-check
rem obolsourcenpfad=%basispfad%\src\main\cobol\

rem Definiere den Pfad zum GNU COBOL Compiler (falls nicht im Pfad enthalten)
rem COBOL_COMPILER="C:\GnuCOBOL\bin\cobc.exe"

rem Kompiliere das COBOL-Programm
rem OL_COMPILER% %cobolsourcenpfad% -x %* && "%~dpn1" -free -I C:\Users\enovo\Projekte\cobol-check\src\main\cobol\copy\ -I C:\Users\enovo\Projekte\mainframe\allgemeine-technik\copy\ -I C:\Users\enovo\Projekte\mainframe\antrag\copy\ -I C:\Users\enovo\Projekte\mainframe\mapcopy\ -I C:\Users\enovo\Projekte\mainframe\provisionsverteilung\copy\ -I C:\Users\enovo\Projekte\mainframe\vb-leistung\copy\ 
