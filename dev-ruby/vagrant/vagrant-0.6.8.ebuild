# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

USE_RUBY="ruby18"

inherit ruby-fakegem

DESCRIPTION="Build and distribute virtualized development environments."
HOMEPAGE="http://vagrantup.com"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x64-macos"
IUSE=""

ruby_add_rdepend "=dev-ruby/archive-tar-minitar-0.5.2-r3
>=dev-ruby/erubis-2.6.6
>=dev-ruby/i18n-0.4.1
>=dev-ruby/json-1.4.6
>=dev-ruby/mario-0.0.6
>=dev-ruby/net-scp-1.0.3
>=dev-ruby/net-ssh-2.0.23
>=dev-ruby/thor-0.14.2
>=dev-ruby/virtualbox-0.7.6"
