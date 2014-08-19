# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI=5

USE_RUBY="ruby18 ruby19"

RUBY_FAKEGEM_TASK_TEST="none"
RUBY_FAKEGEM_TASK_DOC=""

RUBY_FAKEGEM_EXTRADOC="README.markdown LICENSE"
RUBY_FAKEGEM_EXTRAINSTALL="LICENSE README.markdown Rakefile spec"

inherit ruby-fakegem

DESCRIPTION="A set of shared spec helpers specific to Puppetlabs projects"
HOMEPAGE="https://github.com/puppetlabs/puppetlabs_spec_helper"

LICENSE="|| ( Ruby GPL-2 )"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~x64-macos ~x86-macos"
RDEPEND="app-admin/puppet"
DEPEND="${RDEPEND}
dev-ruby/rspec"
