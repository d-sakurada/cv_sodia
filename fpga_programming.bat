@echo off
 @ REM ######################################
 @ REM # Variable to ignore <CR> in DOS
 @ REM # line endings
 @ set SHELLOPTS=igncr
 
@ REM ######################################
 @ REM # Variable to ignore mixed paths
 @ REM # i.e. G:/$SOPC_KIT_NIOS2/bin
 @ set CYGWIN=nodosfilewarning
 

@set QUARTUS_BIN=%QUARTUS_ROOTDIR%\\bin
 @if exist %QUARTUS_BIN%\\quartus_pgm.exe (goto DownLoad)
 
@set QUARTUS_BIN=%QUARTUS_ROOTDIR%\\bin64
 @if exist %QUARTUS_BIN%\\quartus_pgm.exe (goto DownLoad)

 
:: Prepare for future use (if exes are in bin32)
 @set QUARTUS_BIN=%QUARTUS_ROOTDIR%\\bin32
 
:DownLoad
 set project.sof=%~dp0\output_files\\soc_system.sof
 set project.jic=%~dp0\output_files\\soc_system.jic
 set project.rbf=%~dp0\output_files\\soc_system.rbf
 @set device_sfl.sof=%QUARTUS_ROOTDIR%\\common\\devinfo\\programmer\\sfl_enhanced_01_02D020DD.sof

 set DEVICE_POSITION=2
 goto main
 
:main
 echo **********************************
 echo  Please make sure both SoC and FPGA are chained in JTAG
 echo  Plesase choose your operation
 echo    "1" for programming .sof to FPGA.
 echo    "2" for converting .sof to .jic 
 echo    "3" for programming .jic to EPCQ.
 echo    "4" for erasing .jic from EPCQ.
 echo    "5" for converting .sof to .rbf.
 echo    "6" for Exit.
 echo **********************************
 choice /C 123456 /M "Please enter your choise:" 
if errorlevel 6 goto end
if errorlevel 5 goto e
if errorlevel 4 goto d 
if errorlevel 3 goto c  
if errorlevel 2 goto b  
if errorlevel 1 goto a 



:a
 echo ===========================================================
 echo "Progrming .sof to FPGA"
 echo ===========================================================
 %QUARTUS_BIN%\\quartus_pgm.exe -m jtag -c 1 -o "p;%project.sof%@%DEVICE_POSITION%"
 @ set SOPC_BUILDER_PATH=%SOPC_KIT_NIOS2%+%SOPC_BUILDER_PATH%
 goto end
 

:b 
echo ===========================================================
 echo "Convert .sof to .jic"
 echo ===========================================================
  %QUARTUS_BIN%\\quartus_cpf -c -d epcq256 -s 5cstfd6d5f31i7 %project.sof% %project.jic%
 goto end
 
:c
 echo ===========================================================
 echo "Programming EPCQ with .jic"
 echo ===========================================================
 %QUARTUS_BIN%\\quartus_pgm.exe -m jtag -c 1 -o "p;%device_sfl.sof%@%DEVICE_POSITION%"
 %QUARTUS_BIN%\\quartus_pgm.exe -m jtag -c 1 -o "p;%project.jic%@%DEVICE_POSITION%"
 goto end
 
:d
 echo ===========================================================
 echo "Erasing EPCQ with .jic"
 echo ===========================================================
 ::%QUARTUS_BIN%\\quartus_pgm.exe -m jtag -c 1 -o "p;%device_sfl.sof%@%DEVICE_POSITION%"
 %QUARTUS_BIN%\\quartus_pgm.exe -m jtag -c 1 -o "r;%project.jic%@%DEVICE_POSITION%"
 goto end
 
:e
echo ===========================================================
 echo "Convert .sof to .rbf"
 echo ===========================================================
  %QUARTUS_BIN%\\quartus_cpf -c -o bitstream_compression=on %project.sof% %project.rbf%
 goto end
 
 
:end
 echo Finish
 pause
