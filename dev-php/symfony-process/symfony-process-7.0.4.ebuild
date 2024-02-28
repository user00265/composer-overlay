# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

DESCRIPTION="Symfony Process Component"
HOMEPAGE="https://github.com/symfony/process"
SRC_URI="https://github.com/symfony/process/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 ~arm64 x86"

RDEPEND="
	dev-lang/php:*
	dev-php/fedora-autoloader"

S="${WORKDIR}/process-${PV}"

src_install() {
	insinto "/usr/share/php/Symfony/Component/Process"

	doins -r Exception/ Messenger/ Pipes/ ExecutableFinder.php InputStream.php \
	LICENSE PhpExecutableFinder.php PhpProcess.php PhpSubprocess.php Process.php \
	ProcessUtils.php "${FILESDIR}"/autoload.php

	dodoc CHANGELOG.md README.md
}
