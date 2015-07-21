#!/bin/sh

pwdCmd="`pwd`"

resolvePath() {
  #  initial / indicates an absolute path
  case $0 in
    /*)
      # absolute path
      CURR_DIR=dirname $0
      ;;
    *)
      # relative path
      CURR_DIR=${pwdCmd}
      ;;
  esac
}

clear


# resolve path
resolvePath 

JVM_OPTS="-Dsun.lang.ClassLoader.allowArraySyntax=true -server -Xms512m -Xmx512m -XX:NewSize=128m -XX:MaxNewSize=128m -XX:PermSize=128m -XX:MaxPermSize=128m -XX:+DisableExplicitGC -XX:+CMSClassUnloadingEnabled -XX:+UseParallelGC"
JETTY_PORT=8090
#JETTY_OPTS="-Dorg.eclipse.jetty.util.log.stderr.DEBUG=true"
JETTY_OPTS="-Djetty.port=${JETTY_PORT}"

echo "*************************************************************************"
echo "* Starting Application at:" 
echo "*" 
echo "*            http://localhost:${JETTY_PORT}/context-path"
echo "*"
echo "* .. a browser window will be opened (unless your computer forbids it)."
echo "*************************************************************************"

COMMAND="java ${JVM_OPTS} ${JETTY_OPTS} -jar start.jar"
#eval $COMMAND > /dev/null 2>&1
eval $COMMAND
