# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="JPEG image to ASCII art converter"
HOMEPAGE="https://github.com/Talinx/jp2a/"
SRC_URI="https://github.com/Talinx/jp2a/releases/download/v${PV}/jp2a-${PV}.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ia64 ~ppc ~ppc64 ~sparc ~x86 ~x64-macos ~x64-solaris"
IUSE="curl"

RDEPEND="sys-libs/ncurses
	virtual/jpeg
	curl? ( net-misc/curl )"
DEPEND="${RDEPEND}"

src_configure() {
	econf "$(use_enable curl)"
}
