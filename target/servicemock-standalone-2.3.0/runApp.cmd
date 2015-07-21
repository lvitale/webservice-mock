echo off
cls
setlocal 

set CURR_DIR=%~dp0
set JVM_OPTS=-Dsun.lang.ClassLoader.allowArraySyntax=true -server -Xms512m -Xmx512m -XX:NewSize=128m -XX:MaxNewSize=128m -XX:PermSize=128m -XX:MaxPermSize=128m -XX:+DisableExplicitGC -XX:+CMSClassUnloadingEnabled -XX:+UseParallelGC -Xdebug -Xrunjdwp:transport=dt_socket,address=8787,server=y,suspend=n
REM -XX:+AggressiveOpts -XX:NewRatio=5 -XX:+PrintGCDateStamps -XX:+PrintGCTimeStamps -XX:+PrintGCDetails -XX:+PrintTenuringDistribution -XX:+UseConcMarkSweepGC -XX:CMSInitiatingOccupancyFraction=80
set JETTY_PORT=8090
REM set JETTY_OPTS=-Dorg.eclipse.jetty.util.log.stderr.DEBUG=true
set JETTY_OPTS=-Djetty.port=%JETTY_PORT%

echo *************************************************************************
echo * Starting Application at: 
echo * 
echo *            http://localhost:%JETTY_PORT%/context-path
echo *
echo * .. a browser window will be opened (unless your computer forbids it).
echo *************************************************************************

REM java %JVM_OPTS% %JETTY_OPTS% -jar start.jar > ./application.cmd.log 2> ./application.cmderr.log
java %JVM_OPTS% %JETTY_OPTS% -jar start.jar
endlocal
