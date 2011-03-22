# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI="2"
SUPPORT_PYTHON_ABIS="1"

inherit distutils eutils versionator

DESCRIPTION="A python based cucumber clone"
HOMEPAGE="http://lettuce.it/"
SRC_URI="https://github.com/gabrielfalcao/${PN}/tarball/${PV} -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~x86-macos ~x64-macos"
IUSE=""

RDEPEND="dev-python/setuptools"
DEPEND="${RDEPEND}"
RESTRICT_PYTHON_ABIS="3.*"

src_unpack() {
	unpack ${A}
	mv *-${PN}-* "${S}"
}

src_install() {
	distutils_src_install --install-data "/usr/share"
}
