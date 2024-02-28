# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

DESCRIPTION="Symfony Finder Component"
HOMEPAGE="https://github.com/symfony/finder"
SRC_URI="https://github.com/symfony/finder/archive/v${PV}.tar.gz -> symfony-finder-${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 ~arm64 x86"

RDEPEND="dev-lang/php:*
	dev-php/fedora-autoloader"

S="${WORKDIR}/finder-${PV}"

src_install() {
	insinto "/usr/share/php/Symfony/Component/Finder"
	doins -r Comparator/ Exception/ Iterator/
	doins *.php "${FILESDIR}"/autoload.php

	dodoc CHANGELOG.md README.md
}
