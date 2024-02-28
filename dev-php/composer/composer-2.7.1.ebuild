# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

DESCRIPTION="Dependency Manager for PHP"
HOMEPAGE="https://github.com/composer/composer"
SRC_URI="https://github.com/${PN}/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 ~arm64 x86"

BDEPEND="dev-php/theseer-Autoload"

RDEPEND="dev-lang/php:*[curl]
	>=dev-php/ca-bundle-1.0
	dev-php/fedora-autoloader
	>=dev-php/jsonlint-1.4
	>=dev-php/json-schema-5.2.11
	>=dev-php/metadata-minifier-1.0
	>=dev-php/phar-utils-1.2
	>=dev-php/psr-log-1.0
	>=dev-php/reactphp-promise-2.8
	>=dev-php/semver-3.2.5
	>=dev-php/spdx-licenses-1.5.7
	>=dev-php/symfony-console-5.4.11
	>=dev-php/symfony-filesystem-5.4
	>=dev-php/symfony-finder-5.4
	>=dev-php/symfony-process-5.4
	>=dev-php/xdebug-handler-2.0.2"

src_prepare() {
	default

	mkdir vendor || die

	phpab \
		--output vendor/autoload.php \
		--template "${FILESDIR}"/autoload.php.tpl \
		--basedir src \
		src \
		|| die

	cat >> vendor/autoload.php <<EOF || die "failed to extend autoload.php"

// Dependencies
\Fedora\Autoloader\Dependencies::required([
	'/usr/share/php/Composer/CaBundle/autoload.php',
	'/usr/share/php/Composer/MetadataMinifier/autoload.php',
	'/usr/share/php/Composer/Semver/autoload.php',
	'/usr/share/php/Composer/Spdx/autoload.php',
	'/usr/share/php/Composer/XdebugHandler/autoload.php',
	'/usr/share/php/JsonSchema/autoload.php',
	'/usr/share/php/Psr/Log/autoload.php',
	'/usr/share/php/Seld/JsonLint/autoload.php',
	'/usr/share/php/Seld/PharUtils/autoload.php',
	'/usr/share/php/Symfony/Component/Console/autoload.php',
	'/usr/share/php/Symfony/Component/Filesystem/autoload.php',
	'/usr/share/php/Symfony/Component/Finder/autoload.php',
	'/usr/share/php/Symfony/Component/Process/autoload.php',
	'/usr/share/php/React/Promise/autoload.php'
]);
EOF
}

src_install() {
	insinto "/usr/share/${PN}"

	# Composer expects the LICENSE file to be there, and the
	# easiest thing to do is to give it what it wants.
	doins -r LICENSE res src vendor

	exeinto "/usr/share/${PN}/bin"
	doexe "bin/${PN}"
	dosym "../share/${PN}/bin/${PN}" "/usr/bin/${PN}"

	dodoc CHANGELOG.md README.md doc/*.md
	dodoc -r doc/articles doc/faqs
}
