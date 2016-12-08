::author: fr37

::extract_rar.bat


::the propose of this batch script is to extract file.rar saved in the variable rar_loc to the location saved in the variable ext_loc

::save the location of file.rar in the variable 'rar_loc'
set rar_loc=path\to\file.rar

::save the location of folder to be extracted in the variable 'ext_loc'
set ext_loc=path\to\extracted\folder

::save the possible location of UnRAR.exe in variable 'unrar_loc'
set unrar_loc=C:\Program Files\WinRAR\UnRAR.exe

::::save the possible location of a x86 architecture UnRAR.exe in variable 'unrar_x86_loc'
set unrar_x86_loc=C:\Program Files (x86)\WinRAR\UnRAR.exe

::check if UnRAR.exe exists in current directory 
if exist %cd%\UnRAR.exe (
    ::if yes extract file.rar to 'ext_loc'
    unrar x "%rar_loc%" "%ext_loc%" 
) else (
    ::if not call function copy_extract 
    call:copy_extract 
)

:copy_extract     
::check if UnRAR.exe exist "C:\Program Files\WinRAR"
if exist %unrar_loc%  
    ::if yes copy to current directory form Program Files
    copy "%unrar_loc%" "%cd%"
) else (
    ::if not copy to current directory form Program Files (x86)
    copy "%unrar_x86_loc%" "%cd%"
    ::extract file.rar to 'ext_loc' 
    unrar x "%rar_loc%" "%ext_loc%"
)