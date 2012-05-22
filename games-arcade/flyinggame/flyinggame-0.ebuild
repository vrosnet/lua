# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: This ebuild is from Lua overlay; Bumped by mva; $

EAPI="3"

inherit eutils games

DESCRIPTION="A game prototype by Maurice (mari0 author)"
HOMEPAGE="http://stabyourself.net/other/"
SRC_URI="http://stabyourself.net/dl.php?file=${PN}/${PN}.love -> ${P}.zip"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
RESTRICT=""

DEPEND=">=games-engines/love-0.8.0"
RDEPEND="${DEPEND}"

S="${WORKDIR}"

src_install() {
	insinto "/usr/share/games/love/${P}"
	doins -r .
	games_make_wrapper "${PN}" "love /usr/share/games/love/${P}"
}