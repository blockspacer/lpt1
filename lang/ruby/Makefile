# $NetBSD: Makefile,v 1.64 2019/11/03 19:04:06 rillig Exp $

DISTNAME=	# empty
PKGNAME=	ruby-${RUBY_VERSION}
CATEGORIES=	lang ruby
MASTER_SITES=	# empty
DISTFILES=	# empty

MAINTAINER=	taca@NetBSD.org
HOMEPAGE=	http://www.ruby-lang.org/en/
COMMENT=	Wrapper package for Ruby programming language

CONFLICTS=	pkg_alternatives-[0-9]*

NO_CONFIGURE=	yes
NO_BUILD=	yes

.include "../../lang/ruby/rubyversion.mk"

DEPENDS+=	${RUBY_BASE}>=${RUBY_VERSION}:${RUBY_SRCDIR}

RUBY_COMMANDS=	erb gem irb rake ruby testrb

INSTALLATION_DIRS=	bin ${PKGMANDIR}/man1
CHECK_INTERPRETER_SKIP=	bin/* ${PKGMANDIR}/man1/ruby.1

.if ${RUBY_NAME} == "ruby"
GENERATE_PLIST+=	${ECHO} "@comment This plist intentionally left empty";
.else
.  for f in ${RUBY_COMMANDS}
GENERATE_PLIST+=	${ECHO} bin/${f};
.  endfor
GENERATE_PLIST+=	${ECHO} man/man1/ruby.1;
.endif

do-install:
.if ${RUBY_NAME} != "ruby"
.  for f in ${RUBY_COMMANDS}
	${LN} -sf ${f}${RUBY_SUFFIX} ${DESTDIR}${PREFIX}/bin/${f}
.  endfor
	${LN} -sf ${RUBY_NAME}.1 ${DESTDIR}${PREFIX}/${PKGMANDIR}/man1/ruby.1
.endif

.include "../../mk/bsd.pkg.mk"
