# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: This ebuild is from Lua overlay; Bumped by mva; $

EAPI="5"

VCS="mercurial"
LUA_COMPAT="lua51 luajit2"
inherit lua

DESCRIPTION="XMPP client library written in Lua."
HOMEPAGE="http://code.matthewwild.co.uk/"
EHG_REPO_URI="http://code.matthewwild.co.uk/${PN}/"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE="+examples"

RDEPEND="
	dev-lua/squish
	dev-lua/luasocket
	dev-lua/luaexpat
	dev-lua/luafilesystem
	virtual/lua[bit]
"
DEPEND="
	${RDEPEND}
"

EXAMPLES=( doc/. )

each_lua_compile() {
	squish --use-http
}

each_lua_install() {
	dolua verse.lua
}
