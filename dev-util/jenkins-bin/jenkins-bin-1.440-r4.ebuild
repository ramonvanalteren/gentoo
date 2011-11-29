inherit java-pkg-2 rpm

DESCRIPTION="Extensible continuous integration server"
HOMEPAGE="http://jenkins-ci.org/"
LICENSE="MIT"
# We are using rpm package here, because we want file with version.
SRC_URI="http://pkg.jenkins-ci.org/redhat/RPMS/noarch/jenkins-${PV}-1.1.noarch.rpm"
RESTRICT="mirror"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="media-fonts/dejavu"
RDEPEND="${DEPEND}
        >=virtual/jdk-1.5"

src_unpack() {
	rpm_src_unpack ${A}
}

pkg_setup() {
	enewgroup jenkins
	enewuser jenkins -1 /bin/false /usr/lib/jenkins jenkins
}

src_install() {
	S=${WORKDIR}

	keepdir /var/run/jenkins /var/log/jenkins /usr/lib/jenkins
	insinto "/usr/lib/jenkins"
	doins ${S}/usr/lib/jenkins/jenkins.war

	newinitd "${FILESDIR}/init-${PV}.sh" jenkins
	newconfd "${FILESDIR}/conf-${PV}" jenkins

	fowners jenkins:jenkins /var/run/jenkins /var/log/jenkins

}

pkg_postinst() {
	elog "Jenkins requires a JENKINS_HOME dir which is writeable for the jenkins user to run"
	elog "Please run config to setup the JENKINS_HOME dir in the default location."
	elog "Running emerge dev-util/jenkins-bin --config will setup the jenkins_home dir"
	elog "It will leave existing dirs alone."
}

pkg_config() {
	JENKINS_HOME=$(grep -E '^JENKINS_HOME' /etc/conf.d/jenkins \
		| sed -e 's/.*=\s*//' \
		| sed -e 's/"//g' \
		| tail -n1)
	einfo "Detected JENKINS_HOME in config: ${JENKINS_HOME}"
	if [[ -d "${JENKINS_HOME}" ]]; then
		einfo "Previous JENKINS_HOME dir found: ${JENKINS_HOME} not overwriting or changing it"
	else
		einfo "Creating jenkins home dir in ${JENKINS_HOME}"
		mkdir -p ${JENKINS_HOME}
		einfo "Setting ownership to jenkins user"
		chown -R jenkins:jenkins ${JENKINS_HOME}
	fi
}
