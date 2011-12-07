# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI=3

USE_RUBY="ruby18" 

RUBY_FAKEGEM_TASK_TEST="none"
RUBY_FAKEGEM_TASK_DOC=""

RUBY_FAKEGEM_EXTRADOC="README.md LICENSE"
RUBY_FAKEGEM_EXTRAINSTALL="LICENSE README.md Rakefile spec"

inherit ruby-fakegem

DESCRIPTION="Ensure your Puppet manifests conform with the Puppetlabs style guide"
HOMEPAGE="http://github.com/rodjek/puppet-lint"

LICENSE="|| ( Ruby GPL-2 )"
SLOT="0"
KEYWORDS="~x64-macos ~x86-macos ~amd64 ~x86"
RDEPEND="app-admin/puppet"
DEPEND="${RDEPEND}"
