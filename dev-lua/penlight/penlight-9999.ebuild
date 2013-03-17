# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: This ebuild is from Lua overlay; Bumped by mva; $

EAPI="5"

inherit eutils git-2

DESCRIPTION="A set of pure Lua libraries focusing on input data handling, functional programming and OS path management."
HOMEPAGE="https://github.com/stevedonovan/Penlight"
SRC_URI=""

EGIT_REPO_URI="https://github.com/stevedonovan/Penlight git://github.com/stevedonovan/Penlight"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE="doc examples test luajit"

# TODO: Lua 5.2 handling

RDEPEND="
	|| ( virtual/lua dev-lang/luajit:2 =dev-lang/lua-5.1* )
	doc? ( dev-lua/luadoc )
	virtual/pkgconfig
"
DEPEND="${RDEPEND}"

src_test() {
	# TODO LuaJIT handling
	lua run.lua tests
}

src_install() {
	local lua=lua;
	use luajit && lua=luajit
	dodoc README.txt CHANGES.txt || die "dodoc failed"
	use doc && (
		cd docs
		dodoc -r manual
#doesn't work ATM
#		luadoc . -d html
#		dohtml -r html/*
	)
	insinto "$($(tc-getPKG_CONFIG) --variable INSTALL_LMOD ${lua})"
	doins -r lua/pl
}