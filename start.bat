::建立日期
ECHO %date%
SET Date_NAME=%date:~0,4%%date:~5,2%%date:~8,2%
::建立時間(24小時制)
ECHO %time%
For /f "tokens=1-3 delims=/: " %%a in ("%TIME%") do (if %%a LSS 10 (set Time_NAME=0%%a%%b%%c) else (set Time_NAME=%%a%%b%%c))
::建立依照日期、時間產生相應名稱之資料夾
MD G:\backup_%Date_NAME%_%Time_NAME%
ECHO building...
::條件式判斷資料夾路徑是否存在(隨身碟抓不到也就表示含日期、時間之backup資料夾不會出現)
IF EXIST G:\backup_%Date_NAME%_%Time_NAME% (
    XCOPY C:\backup\* G:\backup_%Date_NAME%_%Time_NAME% /E /Y /I
    ECHO Copy complete, please check your usb flash drive.
    @PAUSE
) else (
    ECHO Path error, please check your usb flash drive.
    @PAUSE
)
