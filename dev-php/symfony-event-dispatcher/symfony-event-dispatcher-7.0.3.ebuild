# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

DESCRIPTION="Symfony EventDispatcher Component"
HOMEPAGE="https://github.com/symfony/event-dispatcher"
SRC_URI="https://github.com/symfony/event-dispatcher/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 ~arm64 x86"

RDEPEND="
	dev-lang/php:*
	dev-php/fedora-autoloader
	>=dev-php/symfony-dependency-injection-2.1.0"

S="${WORKDIR}/event-dispatcher-${PV}"

src_install() {
	insinto "/usr/share/php/Symfony/Component/EventDispatcher"
	doins -r Attribute/ Debug/ DependencyInjection/
	doins *.php "${FILESDIR}"/autoload.php

	dodoc CHANGELOG.md README.md
}
