Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE839E47F8
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  4 Dec 2024 23:37:18 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1tIxzg-00081u-Qg
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 04 Dec 2024 22:37:16 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <rdunlap@infradead.org>) id 1tIxzc-00081Q-K1
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 04 Dec 2024 22:37:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=u8qbnsGP9NFtkMH+s5X60nr73aUy5sVw5uUZ2Liwlgg=; b=AXHAwoYEweHLUDPTPtcS9NiJFb
 wMdtRGZhYTazOMAHCYqSba3mN7iQc6cS3AYyIeZKjtxH9p883DHaC+tTWANTs9I5/J5DZwOGnkcuU
 WZ0aXQRk25HzY9DQn8A+TEYjgD9y+Mjx/GYqwu7JFkH3NGTZKkgcKEy19ZaHM1U3ID9I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=u8qbnsGP9NFtkMH+s5X60nr73aUy5sVw5uUZ2Liwlgg=; b=G
 bfGabo8LhD1Le/1zNSBiT0JMGrRKDHtvZ2f5d5SXAFBCMShbj1UKG6tsQA7CCDtdXkASTap9nDPuX
 WwbxxJ/Mm5RRDrcWSMtT2qIcg92MFl31EvlxLTciQ3cxckpKdOLkzSVZfx+dHBpR45zTv0CFFsGp5
 wTyPnhNPs4s6XCBQ=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tIxza-0002dS-FO for kgdb-bugreport@lists.sourceforge.net;
 Wed, 04 Dec 2024 22:37:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=u8qbnsGP9NFtkMH+s5X60nr73aUy5sVw5uUZ2Liwlgg=; b=fWSY74hJyxX7HFxQzaWiyMTukm
 nq4RkrIAg50eh3k4Ei3S5EmnI6md+ZIzA/qTW1eAwAdjBUyRSD0nY/895j4nv0ufQJBnHnG6A6iCg
 egoS5tTmp5bn3dPaHecC5FVIwetCEleXTskc5Lc8Y6+2MAe/Mo+VlWdJ2Grx2/LP6eyILGxBTjhcD
 hhSOpX601BYly8HjAYJzW4iUPp1ezLtIogubGWvgbv7nn6XXWNm8XNuAI9MH7iD00gBQn8P9nBZpg
 us8Mvw0Vg8W0brrkgfQP7ivlWvrW+0mhEg4zz1hY6VmiFqu8xxQl2kU3mgIbgiEj99ePAmqqb98TT
 A67Xpl2Q==;
Received: from [50.53.2.24] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
 id 1tIxgX-0000000E0LX-2tF2; Wed, 04 Dec 2024 22:17:29 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-doc@vger.kernel.org
Date: Wed,  4 Dec 2024 14:17:20 -0800
Message-ID: <20241204221720.66146-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Move gdb and kgdb debugging documentation to the dedicated
 debugging directory (Documentation/process/debugging/). Adjust the index.rst
 files to follow the file movement. Update location of kgdb.rst i [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [198.137.202.133 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [198.137.202.133 listed in sa-accredit.habeas.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1tIxza-0002dS-FO
Subject: [Kgdb-bugreport] [PATCH] Documentation: move dev-tools debugging
 files to process/debugging/
X-BeenThere: kgdb-bugreport@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: kgdb bugs suggestions <kgdb-bugreport.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/kgdb-bugreport>, 
 <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=kgdb-bugreport>
List-Post: <mailto:kgdb-bugreport@lists.sourceforge.net>
List-Help: <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport>, 
 <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=subscribe>
Cc: Sebastian Fricke <sebastian.fricke@collabora.com>,
 Jonathan Corbet <corbet@lwn.net>, kgdb-bugreport@lists.sourceforge.net,
 Randy Dunlap <rdunlap@infradead.org>, Daniel Thompson <danielt@kernel.org>,
 workflows@vger.kernel.org, Jason Wessel <jason.wessel@windriver.com>,
 linux-debuggers@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Move gdb and kgdb debugging documentation to the dedicated
debugging directory (Documentation/process/debugging/).
Adjust the index.rst files to follow the file movement.
Update location of kgdb.rst in MAINTAINERS file.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Sebastian Fricke <sebastian.fricke@collabora.com>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: workflows@vger.kernel.org
Cc: Jason Wessel <jason.wessel@windriver.com>
Cc: Daniel Thompson <danielt@kernel.org>
Cc: Douglas Anderson <dianders@chromium.org>
Cc: linux-debuggers@vger.kernel.org
Cc: kgdb-bugreport@lists.sourceforge.net
---
 Documentation/dev-tools/index.rst                                       | 2 --
 Documentation/{dev-tools => process/debugging}/gdb-kernel-debugging.rst | 0
 Documentation/process/debugging/index.rst                               | 2 ++
 Documentation/{dev-tools => process/debugging}/kgdb.rst                 | 0
 MAINTAINERS                                                             | 2 +-
 5 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/dev-tools/index.rst b/Documentation/dev-tools/index.rst
index 3c0ac08b2709..c1e73e75f551 100644
--- a/Documentation/dev-tools/index.rst
+++ b/Documentation/dev-tools/index.rst
@@ -27,8 +27,6 @@ Documentation/dev-tools/testing-overview.rst
    kmemleak
    kcsan
    kfence
-   gdb-kernel-debugging
-   kgdb
    kselftest
    kunit/index
    ktap
diff --git a/Documentation/dev-tools/gdb-kernel-debugging.rst b/Documentation/process/debugging/gdb-kernel-debugging.rst
similarity index 100%
rename from Documentation/dev-tools/gdb-kernel-debugging.rst
rename to Documentation/process/debugging/gdb-kernel-debugging.rst
diff --git a/Documentation/process/debugging/index.rst b/Documentation/process/debugging/index.rst
index f6e4a00dfee3..bc4a816e3d32 100644
--- a/Documentation/process/debugging/index.rst
+++ b/Documentation/process/debugging/index.rst
@@ -12,6 +12,8 @@ general guides
 
    driver_development_debugging_guide
    userspace_debugging_guide
+   gdb-kernel-debugging
+   kgdb
 
 .. only::  subproject and html
 
diff --git a/Documentation/dev-tools/kgdb.rst b/Documentation/process/debugging/kgdb.rst
similarity index 100%
rename from Documentation/dev-tools/kgdb.rst
rename to Documentation/process/debugging/kgdb.rst
diff --git a/MAINTAINERS b/MAINTAINERS
index 1e930c7a58b1..1753fe792d04 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12809,7 +12809,7 @@ L:	kgdb-bugreport@lists.sourceforge.net
 S:	Maintained
 W:	http://kgdb.wiki.kernel.org/
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/jwessel/kgdb.git
-F:	Documentation/dev-tools/kgdb.rst
+F:	Documentation/process/debugging/kgdb.rst
 F:	drivers/misc/kgdbts.c
 F:	drivers/tty/serial/kgdboc.c
 F:	include/linux/kdb.h


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
