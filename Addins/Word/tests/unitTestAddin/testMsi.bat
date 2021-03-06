REM This line updates the .msi, by importing config.idt into the .msi.
REM The command is MsiDb
REM options:
REM -f folder where .idt is found
REM -d the .msi to be updated
REM -i import the .idt
REM (when these 3 arguments are passed, the command executes silently,without requesting user input)
"C:\Program Files\Microsoft SDKs\Windows\v6.0A\bin\MsiDb" -f "C:\tmp" -d "MarkLogic_Addin_For_Word_Setup.msi" -i config.idt"


REM installs the .msi
REM msiexec should be in your path if you have Windows Installer installed (Addin requires 3.1 or greater)
REM options:
REM /q - quiet
REM /i - install
REM TARGETDIR - directory to install msi to
msiexec /q /i "C:\tmp\MarkLogic_Addin_For_Word_Setup.msi" TARGETDIR="C:\tmp"

REM executes the C# app
REM this will start Word, and close Word after 20 seconds
REM the tests are run from the javascript in the page when it loads in the browswer
REM usage:> MarkLogic_WordAddin_Test.exe outputfile [inputfile]
REM         if not input file provided, a new doc is created in Word
MarkLogic_WordAddin_Test.exe "c:\\tmp\\testOutput\\addcontrolstest.docx"  
REM MarkLogic_WordAddin_Test.exe "c:\\tmp\\testOutput\\lockcontroltest.docx" "c:\\tmp\\testInput\\ccLockControlTest.docx"  
REM MarkLogic_WordAddin_Test.exe "c:\\tmp\\testOutput\\controlstest.docx" "c:\\tmp\\testInput\\ccControlsTest.docx"  
REM MarkLogic_WordAddin_Test.exe "c:\\tmp\\testOutput\\gettexttest.docx" "c:\\tmp\\testInput\\ccGetTextTest.docx"  
REM MarkLogic_WordAddin_Test.exe "c:\\tmp\\testOutput\\maptest.docx" "c:\\tmp\\testInput\\ccMapTest.docx" 
REM MarkLogic_WordAddin_Test.exe "c:\\tmp\\testOutput\\originaltests.docx"

REM uninstalls the Addin
msiexec /q /x "C:\tmp\MarkLogic_Addin_For_Word_Setup.msi" 


