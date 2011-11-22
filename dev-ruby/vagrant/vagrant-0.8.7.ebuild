# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

USE_RUBY="ruby18"

RUBY_FAKEGEM_TASK_TEST="test"
RUBY_FAKEGEM_EXTRAINSTALL="test templates contrib keys config Rakefile README.md CHANGELOG.md LICENSE"

inherit ruby-fakegem

DESCRIPTION="Vagrant is a tool for building and distributing virtualized development environments."
HOMEPAGE="http://vagrantup.com"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x64-macos"
IUSE=""

ruby_add_rdepend "=dev-ruby/archive-tar-minitar-0.5.2-r3
>=dev-ruby/erubis-2.7.0
>=dev-ruby/i18n-0.6.0
>=dev-ruby/json-1.5.1
>=dev-ruby/mario-0.0.6
>=dev-ruby/net-scp-1.0.4
>=dev-ruby/net-ssh-2.1.4
>=dev-ruby/thor-0.14.6
>=dev-ruby/virtualbox-0.9.1"
