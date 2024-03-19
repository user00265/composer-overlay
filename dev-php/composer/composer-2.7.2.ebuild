# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

inherit verify-sig

DESCRIPTION="A Dependency Manager for PHP"
HOMEPAGE="https://getcomposer.org/"
SRC_URI="https://getcomposer.org/download/${PV}/composer.phar
  verify-sig? ( https://getcomposer.org/download/${PV}/composer.phar.asc )"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 ~arm64 x86"

BDEPEND="
  verify-sig? ( sec-keys/openpgp-keys-packagist )"

VERIFY_SIG_OPENPGP_KEY_PATH="${BROOT}/usr/share/openpgp-keys/packagist.com.asc"

RDEPEND="dev-lang/php:*[curl]"

S="${DISTDIR}"

src_unpack() {
    if use verify-sig; then
        verify-sig_verify_detached "${DISTDIR}"/${PN}.phar{,.asc}
    fi

    default
}

src_install() {
	into /usr
	newbin composer.phar composer
}
