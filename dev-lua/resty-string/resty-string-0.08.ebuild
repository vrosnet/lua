# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: This ebuild is from Lua overlay; Bumped by mva; $

EAPI="5"

inherit eutils toolchain-funcs

DESCRIPTION="String utilities and common hash functions for ngx_lua and LuaJIT"
HOMEPAGE="https://github.com/agentzh/lua-${PN}"
SRC_URI="https://github.com/agentzh/lua-${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="x86 amd64"
IUSE=""

RDEPEND="
	dev-lang/luajit:2
	www-servers/nginx[nginx_modules_http_lua]
	dev-libs/openssl
"
DEPEND="
	${RDEPEND}
	dev-util/pkgconfig
"

S="${WORKDIR}/lua-${P}"

src_prepare() {
	local lua=luajit;

	sed -r \
		-e "1,6s#(PREFIX).*#\1=/usr#" \
		-e "1,6s#(LUA_LIB_DIR).*#\1=$($(tc-getPKG_CONFIG) --variable INSTALL_LMOD ${lua})#" \
		-e "1,6s#(LUA_INCLUDE_DIR).*#\1=$($(tc-getPKG_CONFIG) --variable includedir ${lua})#" \
		-i Makefile
}