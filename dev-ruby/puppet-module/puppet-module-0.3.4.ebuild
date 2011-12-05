# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI=3

USE_RUBY="ruby18 ruby19 ree18 jruby rbx"

RUBY_FAKEGEM_TASK_TEST="none"
RUBY_FAKEGEM_TASK_DOC=""

RUBY_FAKEGEM_EXTRADOC="README.markdown CHANGES.markdown LICENSE VERSION"
RUBY_FAKEGEM_EXTRAINSTALL="Rakefile spec templates vendor"

inherit ruby-fakegem

DESCRIPTION="puppet-module tool creates, installs and searches for puppet modules"
HOMEPAGE="http://github.com/puppetlabs/puppet-module-tool"

LICENSE="|| ( Ruby GPL-2 )"
SLOT="0"
KEYWORDS="~x64-macos ~x86-macos"

DEPEND="app-admin/puppet
dev-ruby/facets
dev-ruby/multipart-post"

