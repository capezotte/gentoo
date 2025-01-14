# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit desktop git-r3 meson toolchain-funcs

DESCRIPTION="Image viewers for the framebuffer console (fbi) and X11 (ida)"
HOMEPAGE="https://www.kraxel.org/blog/linux/fbida/"
EGIT_REPO_URI="https://git.kraxel.org/git/fbida"
SRC_URI="
	mirror://gentoo/ida.png.bz2
"
LICENSE="GPL-2 IJG"
SLOT="0"
KEYWORDS=""

CDEPEND="
	!media-gfx/fbi
	>=media-libs/fontconfig-2.2
	>=media-libs/freetype-2.0
	>=x11-libs/motif-2.3:0[xft]
	app-text/poppler[cairo]
	media-libs/giflib:=
	media-libs/libepoxy
	media-libs/libexif
	media-libs/libjpeg-turbo:=
	media-libs/libpng:=
	media-libs/libwebp:=
	media-libs/mesa[X(+)]
	media-libs/tiff:=
	net-misc/curl
	virtual/ttf-fonts
	x11-libs/cairo[opengl]
	x11-libs/libX11
	x11-libs/libXpm
	x11-libs/libXt
	x11-libs/libdrm
	x11-libs/libxkbcommon
	x11-libs/pixman
"
DEPEND="
	${CDEPEND}
	x11-base/xorg-proto
"
RDEPEND="
	${CDEPEND}
"
PATCHES=(
	"${FILESDIR}"/ida-desktop.patch
	"${FILESDIR}"/${PN}-2.10-giflib-4.2.patch
	"${FILESDIR}"/${PN}-2.14-cpp.patch
)

src_unpack() {
	unpack ${A}
	git-r3_src_unpack
}

src_prepare() {
	default

	# upstream omission?
	echo ${PV} > VERSION

	tc-export CC CPP
}

src_install() {
	meson_src_install

	dodoc Changes README.{ida,md} TODO

	doicon "${WORKDIR}"/ida.png
	domenu desktop/ida.desktop
}
