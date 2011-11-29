inherit eutils

EXPORT_FUNCTIONS pkg_setup src_install

LICENSE="LGPL-2"

S="${DISTDIR}"

jenkins-v2_pkg_setup() {
	JENKINS_HOME=$(grep -E '^JENKINS_HOME' /etc/conf.d/jenkins \
		| sed -e 's/.*=\s*.//' \
		| sed -e 's/"//g' \
		| tail -n1)
	JENKINS_PLUGINS=${JENKINS_HOME}/plugins
}

jenkins-v2_src_install() {
	insinto "${JENKINS_PLUGINS}"
	doins ${S}/${PN##jenkins-}.hpi || die "installing files"
}
