# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

DESCRIPTION="OpenPGP keys used by Packagist Conductors"
HOMEPAGE="https://packagist.com/"

SRC_URI="
	https://keys.openpgp.org/vks/v1/by-fingerprint/161DFBE342889F01DDAC4E61CBB3D576F2A0946F
		-> packagist-${PV}-161DFBE342889F01DDAC4E61CBB3D576F2A0946F.asc
"
S=${WORKDIR}

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~alpha amd64 ~arm ~arm64 ~hppa ~ia64 ~loong ~m68k ~mips ~ppc ~ppc64 ~riscv ~s390 ~sparc x86"

src_install() {
	local files=( ${A} )
	insinto /usr/share/openpgp-keys
	newins - packagist.com.asc < <(cat "${files[@]/#/${DISTDIR}/}" || die)
}
