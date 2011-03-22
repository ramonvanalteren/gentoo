# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI="2"
SUPPORT_PYTHON_ABIS="1"

inherit distutils eutils

DESCRIPTION="A python based cucumber clone"
HOMEPAGE="http://lettuce.it/"
SRC_URI="http://github.com/downloads/gabrielfalcao/${PN}/tarball/${PV}"
#http://github.com/gabrielfalcao/lettuce/tarball/0.1.13

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~x86-macos ~x64-macos"
IUSE=""

RDEPEND="dev-python/setuptools"
DEPEND="${RDEPEND}"
RESTRICT_PYTHON_ABIS="3.*"

src_prepare() {
	distutils_src_prepare
}

src_compile() {
	distutils_src_compile
}

src_install() {
	distutils_src_install --install-data "/usr/share"
}
