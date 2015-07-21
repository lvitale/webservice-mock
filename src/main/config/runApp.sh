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

JVM_OPTS="-Dsun.lang.ClassLoader.allowArraySyntax=true -server -Xms${jetty.maxSize}m -Xmx${jetty.maxSize}m -XX:NewSize=${jetty.minSize}m -XX:MaxNewSize=${jetty.minSize}m -XX:PermSize=${jetty.minSize}m -XX:MaxPermSize=${jetty.minSize}m -XX:+DisableExplicitGC -XX:+CMSClassUnloadingEnabled -XX:+UseParallelGC"
JETTY_PORT=${jetty.port}
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
