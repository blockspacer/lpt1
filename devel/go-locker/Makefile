# $NetBSD: Makefile,v 1.12 2020/01/10 13:32:21 bsiegert Exp $

DISTNAME=	locker-0.0.0.20171007
PKGNAME=	go-${DISTNAME}
PKGREVISION=	11
MASTER_SITES=	${MASTER_SITE_GITHUB:=BurntSushi/}
CATEGORIES=	devel
GITHUB_PROJECT=	locker
GITHUB_TAG=	a6e239ea1c69bff1cfdb20c4b73dadf52f784b6a

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/BurntSushi/locker
COMMENT=	Golang package using named read/write locks
LICENSE=	public-domain

GO_DIST_BASE=	locker-${GITHUB_TAG}
GO_SRCPATH=	github.com/BurntSushi/locker

.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
