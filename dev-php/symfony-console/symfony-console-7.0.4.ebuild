# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

DESCRIPTION="Subtree split of the Symfony Console Component"
HOMEPAGE="https://github.com/symfony/console"
SRC_URI="https://github.com/symfony/console/archive/v${PV}.tar.gz
	-> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 ~arm64 x86"

RDEPEND="
	dev-lang/php:*
	dev-php/fedora-autoloader
	>=dev-php/psr-log-1.0.2
	>=dev-php/symfony-event-dispatcher-6.4.0
	>=dev-php/symfony-process-6.4.0"

S="${WORKDIR}/console-${PV}"

src_install() {
	insinto "/usr/share/php/Symfony/Component/Console"
	doins -r Attribute/ CI/ Command/ CommandLoader/ Completion/ DataCollector/ Debug/ \
	DependencyInjection/ Descriptor/ Event/ EventListener/ Exception/ Formatter/ \
	Helper/ Input/ Logger/ Messenger/ Output/ Question/ Resources/ SignalRegistry/ \
	Style/ Tester/

	doins *.php "${FILESDIR}"/autoload.php

	dodoc CHANGELOG.md README.md
}
