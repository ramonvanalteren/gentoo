# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

USE_RUBY="ruby18"

inherit ruby-fakegem

DESCRIPTION="Create and modify virtual machines in VirtualBox using pure ruby"
HOMEPAGE="http://github.com/mitchellh/virtualbox"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x64-macos"
IUSE=""

ruby_add_rdepend ">=dev-ruby/ffi-1.0.9"
