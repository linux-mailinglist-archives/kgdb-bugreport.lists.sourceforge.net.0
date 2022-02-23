Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D5C4C122F
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 23 Feb 2022 13:03:22 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1nMqMb-0005fD-HV
	for lists+kgdb-bugreport@lfdr.de; Wed, 23 Feb 2022 12:03:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <christophe.leroy@csgroup.eu>) id 1nMqMa-0005f7-5H
 for kgdb-bugreport@lists.sourceforge.net; Wed, 23 Feb 2022 12:03:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=im9M80SprV1m5rCeUBKQiF6Dd3FbpqNJbafPh+uWy1Y=; b=I0mnPH7oJ0baWaDK9dTv9PtIRJ
 VXDikm7Hd1XHcCx2K5Q+BAjttO0zRKpvXG8+wA1GvZdapHx+PAtVEGN1oj6h25jX2uczifA9jpUct
 L0JnsyMVwRRlHbQ/VSVQRC/r+doWKnhsA2r54o6X88Q/odlJ120eUAnzdL6xj67mFBuA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=im9M80SprV1m5rCeUBKQiF6Dd3FbpqNJbafPh+uWy1Y=; b=g
 mF8OROJAt7tzskPvugGw+9nJKSiMPE9bua+JvK3wo//SNSyHwwemrtyIw0IY4LVWCHC9PtR1UMk/m
 I01yuK3KUliiN2jYnkPXC7hPR31tVKC2jRPKtQaM8VKViePUqvs7xPW93CQspMCxUUc6ly0mkoqyR
 B2Xviw5wELocNmuk=;
Received: from pegase2.c-s.fr ([93.17.235.10])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nMqMW-0001a6-C9
 for kgdb-bugreport@lists.sourceforge.net; Wed, 23 Feb 2022 12:03:17 +0000
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4K3ZRH0zw5z9sSp;
 Wed, 23 Feb 2022 13:02:35 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fdRTHS91z5Eb; Wed, 23 Feb 2022 13:02:35 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4K3ZRC1vpFz9sSZ;
 Wed, 23 Feb 2022 13:02:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 322AE8B778;
 Wed, 23 Feb 2022 13:02:31 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 1iYLXu2sbge3; Wed, 23 Feb 2022 13:02:31 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.7.201])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C57C48B77C;
 Wed, 23 Feb 2022 13:02:30 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 21NC2Kpc1148173
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Wed, 23 Feb 2022 13:02:21 +0100
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 21NC2JkP1148171;
 Wed, 23 Feb 2022 13:02:19 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Luis Chamberlain <mcgrof@kernel.org>, Aaron Tomlin <atomlin@redhat.com>
Date: Wed, 23 Feb 2022 13:02:10 +0100
Message-Id: <cover.1645607143.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1645617734; l=2137; s=20211009;
 h=from:subject:message-id; bh=5pa1UQ3HwyDZehywSQbAA8grWbJFM4jhq6fIuvgQR1I=;
 b=jJdm2BkQa9gEif7ktMD48MnhsQfgiuYZWvlcjGqSQAFNn+F4jLeHP92Z3FVUqVGswk4EzrSMHpf7
 NMKzfvJiAla9UWgpQe57Sbh0hIA1WZxEqiQX3SY3RU2XBwRh4Nj1
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519;
 pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This series applies on top of my series "miscellanuous
 cleanups"
 v4. This series allow architectures to request having modules data in vmalloc
 area instead of module area. This is required on powerpc book3s/32 in order
 to set data non executable, because it is not possible to set executability
 on page basis, this is done per 256 Mbytes segments. The module area has
 exec [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nMqMW-0001a6-C9
Subject: [Kgdb-bugreport] [PATCH v6 0/6] Allocate module text and data
 separately
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
Cc: linux-arch@vger.kernel.org, kgdb-bugreport@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>,
 linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 linux-modules@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

This series applies on top of my series "miscellanuous cleanups" v4.


This series allow architectures to request having modules data in
vmalloc area instead of module area.

This is required on powerpc book3s/32 in order to set data non
executable, because it is not possible to set executability on page
basis, this is done per 256 Mbytes segments. The module area has exec
right, vmalloc area has noexec. Without this change module data
remains executable regardless of CONFIG_STRICT_MODULES_RWX.

This can also be useful on other powerpc/32 in order to maximize the
chance of code being close enough to kernel core to avoid branch
trampolines.

Changes in v6:
- Rebased on top of my series "miscellanuous cleanups" v4

Changes in v5:
- Rebased on top of Aaron's series "module: core code clean up" v8

Changes in v4:
- Rebased on top of Aaron's series "module: core code clean up" v6

Changes in v3:
- Fixed the tree for data_layout at one place (Thanks Miroslav)
- Moved removal of module_addr_min/module_addr_max macro out of patch 1 in a new patch at the end of the series to reduce churn.

Changes in v2:
- Dropped first two patches which are not necessary. They may be added back later as a follow-up series.
- Fixed the printks in GDB

Christophe Leroy (6):
  module: Always have struct mod_tree_root
  module: Prepare for handling several RB trees
  module: Introduce data_layout
  module: Add CONFIG_ARCH_WANTS_MODULES_DATA_IN_VMALLOC
  module: Remove module_addr_min and module_addr_max
  powerpc: Select ARCH_WANTS_MODULES_DATA_IN_VMALLOC on book3s/32 and
    8xx

 arch/Kconfig                |   6 +++
 arch/powerpc/Kconfig        |   1 +
 include/linux/module.h      |   8 +++
 kernel/debug/kdb/kdb_main.c |  10 +++-
 kernel/module/internal.h    |  13 +++--
 kernel/module/kallsyms.c    |  18 +++----
 kernel/module/main.c        | 103 +++++++++++++++++++++++++++---------
 kernel/module/procfs.c      |   8 ++-
 kernel/module/strict_rwx.c  |  11 ++--
 kernel/module/tree_lookup.c |  28 ++++++----
 10 files changed, 150 insertions(+), 56 deletions(-)

-- 
2.34.1



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
