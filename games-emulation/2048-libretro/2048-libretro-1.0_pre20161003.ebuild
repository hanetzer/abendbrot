# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit libretro-core

DESCRIPTION="libretro implementation of 2048. (Puzzle game)"
HOMEPAGE="https://github.com/libretro/libretro-2048"
SRC_URI="https://github.com/libretro/libretro-2048/archive/142fbf4803a52d921a67f97583172b6dbb19d274.tar.gz -> ${P}.tar.gz"
RESTRICT="primaryuri"

S="${WORKDIR}/libretro-2048-142fbf4803a52d921a67f97583172b6dbb19d274"

if [[ ${PV} == 9999 ]]; then
	EGIT_REPO_URI="https://github.com/libretro/libretro-2048.git"
	KEYWORDS=""
else
	KEYWORDS="amd64 x86"
fi

LICENSE="GPL-2"
SLOT="0"
IUSE="debug"

DEPEND=""
RDEPEND="${DEPEND}
		games-emulation/libretro-info"

src_compile() {
	filter-flags -O*
	emake $(usex debug "DEBUG=1" "") -f Makefile.libretro || die "emake failed"
}