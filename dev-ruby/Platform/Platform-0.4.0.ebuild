# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/ruby-progressbar/ruby-progressbar-0.0.10.ebuild,v 1.2 2011/10/22 12:25:13 graaff Exp $

EAPI=3

USE_RUBY="ruby18 ruby19 ree18 jruby rbx"

RUBY_FAKEGEM_TASK_TEST="none"
RUBY_FAKEGEM_TASK_DOC=""

# RUBY_FAKEGEM_EXTRADOC="README.md"
# RUBY_FAKEGEM_EXTRAINSTALL="ChangeLog LICENSE README.en.rd README.ja.rd test"

inherit ruby-fakegem

DESCRIPTION="Hopefully robust platform sensing"
HOMEPAGE="http://rubyforge.org/projects/platform/"

LICENSE="|| ( Ruby GPL-2 )"
SLOT="0"
KEYWORDS="~x64-macos ~x86-macos"

IUSE=""
