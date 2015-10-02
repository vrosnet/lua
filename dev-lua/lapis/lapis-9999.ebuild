# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: This ebuild is from Lua overlay; Bumped by mva; $

EAPI="5"

VCS="git-r3"
inherit lua

DESCRIPTION="A web framework for Lua/MoonScript."
HOMEPAGE="https://github.com/leafo/lapis"
SRC_URI=""

EGIT_REPO_URI="https://github.com/leafo/lapis"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE="doc moonscript"

RDEPEND="
	moonscript? ( dev-lua/moonscript )
	dev-lua/ansicolors
	dev-lua/luasocket
	dev-lua/luacrypto
	dev-lua/lua-cjson
	dev-lua/lpeg
	dev-lua/rds-parser
	dev-lua/resty-upload
"
DEPEND="
	${RDEPEND}
"

DOCS=( docs/. README.md )

all_lua_prepare() {
	use moonscript || find "${S}" -type -name '*.moon' -delete
}

each_lua_compile() {
	use moonscript && emake build
}

each_lua_install() {
	use moonscript && dolua lapis.moon
	dolua lapis
}

all_lua_install() {
	dobin bin/lapis
}
