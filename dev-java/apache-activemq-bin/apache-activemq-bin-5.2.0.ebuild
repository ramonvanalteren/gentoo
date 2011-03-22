# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="The most popular and powerful open source Message Broker and Enterprise Integration Patterns provider."
HOMEPAGE="http://activemq.apache.org/"

MY_PN="${PN/-bin/}"
MY_SPN="${MY_PN/apache-/}"
SRC_URI="http://www.apache.org/dist/activemq/${MY_PN}/${PV}/${MY_PN}-${PV}-bin.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE="doc example"

S="${WORKDIR}/${MY_PN}-${PV}"

RDEPEND=">=virtual/jre-1.5
	${COMMON_DEP}"
DEPEND=">=virtual/jdk-1.5
	${COMMON_DEP}"

src_install() {
	insinto /opt/apache-activemq/
	doins -r bin || die
	doins -r conf || die
	doins -r lib || die
	doins -r data || die
	doins -r webapps || die
	if use doc ; then
		doins -r docs || die
	fi
	if use example ; then
		doins -r example || die
	fi

	newinitd "${FILESDIR}/${MY_SPN}.init" ${MY_SPN} || die "Inserting init.d-file failed"
	newconfd "${FILESDIR}/${MY_SPN}.conf" ${MY_SPN} || die "Inserting conf.d-file failed"

}

