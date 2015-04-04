# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: This ebuild is from Lua overlay; Bumped by mva; $

EAPI="5"

inherit toolchain-funcs mercurial

DESCRIPTION="Lua Asynchronous HTTP Library."
HOMEPAGE="http://code.matthewwild.co.uk/"
EHG_REPO_URI="http://code.matthewwild.co.uk/${PN}/"

LICENSE="LGPL"
SLOT="0"
KEYWORDS=""
IUSE="luajit"

RDEPEND="
	virtual/lua[luajit=]
	dev-lua/squish
"
DEPEND="${RDEPEND}"

src_compile() {
	squish
}

src_install() {
	local lua=lua;
	use luajit && lua=luajit;
	insinto "$($(tc-getPKG_CONFIG) --variable INSTALL_LMOD ${lua})"
	doins yubikey.lua || die
}
