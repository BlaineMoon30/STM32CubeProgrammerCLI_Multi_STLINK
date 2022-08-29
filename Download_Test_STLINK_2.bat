@echo off
set STLINK_PATH="C:\Program Files\STMicroelectronics\STM32Cube\STM32CubeProgrammer\bin\STM32_Programmer_CLI.exe"
set FIRMWARE="Test_Firmware.bin"
set STLINK_1="001700273656501620363341"
set STLINK_2=""
color 0F
echo                /******************************************/
echo                           STM32_Programmer_CLI Test .bat
echo                /******************************************/
%STLINK_PATH% -c port=swd sn=%STLINK_1% -hardRst
echo                /******************************************/
echo                              Full Chip Erase
echo                /******************************************/
%STLINK_PATH% -c port=swd sn=%STLINK_1% -e all
echo                /******************************************/
echo                              Install FIRMWARE
echo                /******************************************/
%STLINK_PATH% -c port=swd sn=%STLINK_1% -w %FIRMWARE% 0x08000000 
echo                /******************************************/
echo                                 Reset STM32
echo                /******************************************/
%STLINK_PATH% -c port=swd sn=%STLINK_1% -hardRst
if NOT "%1" == "SILENT" pause