# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

inherit jenkins-v2

DESCRIPTION="ssh-slaves plugin for jenkins"
SRC_URI="http://updates.jenkins-ci.org/download/plugins/${PN:8}/${PV}/${PN:8}.hpi"
HOMEPAGE="Http://www.hyves.nl"
LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86"
SLOT="0"
DEPEND="dev-util/jenkins-bin"
