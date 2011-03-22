# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI="2"
SUPPORT_PYTHON_ABIS="1"

inherit distutils eutils

DESCRIPTION="A python based cucumber clone as noseplugin"
HOMEPAGE="http://http://github.com/rlisagor/freshen"
# This should change into something more stable as soon as the author creates a
# tag
SRC_URI="http://github.com/downloads/ramonvanalteren/freshen/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86-macos ~x64-macos"
IUSE=""

RDEPEND="dev-python/setuptools dev-python/nose >=dev-python/pyparsing-1.5"
DEPEND="${RDEPEND}"
RESTRICT_PYTHON_ABIS="3.*"

src_prepare() {
	distutils_src_prepare
}

src_compile() {
	distutils_src_compile
}

src_install() {
	distutils_src_install --install-data "${EPREFIX}/usr/share"
}
