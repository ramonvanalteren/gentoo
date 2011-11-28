# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

USE_RUBY="ruby18"

# RUBY_FAKEGEM_TASK_TEST="test"
RUBY_FAKEGEM_EXTRAINSTALL="Rakefile templates trials validation"

inherit ruby-fakegem

DESCRIPTION="Veewee is great"
HOMEPAGE="https://github.com/jedi4ever/veewee"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~x64-macos"
IUSE=""

ruby_add_rdepend ">=dev-ruby/bundler-1.0.0
>=dev-util/cucumber-1.0.2
>=dev-ruby/highline-1.6.1
>=dev-ruby/net-ssh-2.1.0
>=dev-ruby/popen4-0.1.2
dev-ruby/progressbar
>=dev-ruby/thor-0.14.6
>=dev-ruby/vagrant-0.8.0"
