#!/sbin/runscript

depend() {
    need net
    use dns logger mysql postgresql
}

JENKINS_PIDFILE=${JENKINS_PIDFILE:="/var/run/jenkins/jenkins.pid"}
JENKINS_WAR="/usr/lib/jenkins/jenkins.war"
JENKINS_LOGDIR=${JENKINS_LOGDIR:="/var/log/jenkins"}

RUN_AS=jenkins

checkconfig() {
    if [ ! -n "${JENKINS_HOME}" ] ; then
        eerror "JENKINS_HOME not configured"
        return 1
    fi
    if [ ! -w "${JENKINS_HOME}" ] ; then
        eerror "JENKINS_HOME directory: ${JENKINS_HOME} does not exists or is not writable"
        return 1
    fi
    if [ ! -w "${JENKINS_LOGDIR}" ]; then
        eerror "JENKINS_LOGDIR directory: ${JENKINS_LOGDIR} does not exist or is not writeable"
        return 1
    fi
    return 0
}

start() {
    checkconfig || return 1

    JAVA_HOME=$(java-config --jre-home)
    COMMAND="${JAVA_HOME}/bin/java"

    JAVA_PARAMS="${JENKINS_JAVA_OPTIONS} -DJENKINS_HOME=${JENKINS_HOME} -jar ${JENKINS_WAR}"

    # Don't use --daemon here, because in this case stop will not work
    PARAMS="--logfile=${JENKINS_LOGDIR}/jenkins.log"
    [ -n "${JENKINS_PORT}" ] && PARAMS="${PARAMS} --httpPort=${JENKINS_PORT}"
    [ -n "${JENKINS_DEBUG_LEVEL}" ] && PARAMS="${PARAMS} --debug=${JENKINS_DEBUG_LEVEL}"
    [ -n "${JENKINS_HANDLER_STARTUP}" ] && PARAMS="${PARAMS} --handlerCountStartup=${JENKINS_HANDLER_STARTUP}"
    [ -n "${JENKINS_HANDLER_MAX}" ] && PARAMS="${PARAMS} --handlerCountMax=${JENKINS_HANDLER_MAX}"
    [ -n "${JENKINS_HANDLER_IDLE}" ] && PARAMS="${PARAMS} --handlerCountMaxIdle=${JENKINS_HANDLER_IDLE}"
    [ -n "${JENKINS_ARGS}" ] && PARAMS="${PARAMS} ${JENKINS_ARGS}"

    if [ "${JENKINS_ENABLE_ACCESS_LOG}" = "yes" ]; then
        PARAMS="${PARAMS} --accessLoggerClassName=winstone.accesslog.SimpleAccessLogger --simpleAccessLogger.format=combined --simpleAccessLogger.file=${JENKINS_LOGDIR}/access_log"
    fi

    ebegin "Starting ${SVCNAME}"
    start-stop-daemon --start --quiet --background \
        --make-pidfile --pidfile ${JENKINS_PIDFILE} \
        --chuid ${RUN_AS} \
        --exec "${COMMAND}" -- ${JAVA_PARAMS} ${PARAMS}
    eend $?
}

stop() {
    ebegin "Stopping ${SVCNAME}"
    start-stop-daemon --stop --quiet --pidfile ${JENKINS_PIDFILE}
    eend $?
}
