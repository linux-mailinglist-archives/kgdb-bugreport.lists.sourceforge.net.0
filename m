Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ACFCA4BFB7D
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 22 Feb 2022 16:00:51 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1nMWep-0002Ql-Fn
	for lists+kgdb-bugreport@lfdr.de; Tue, 22 Feb 2022 15:00:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <christophe.leroy@csgroup.eu>) id 1nMWen-0002Qf-UA
 for kgdb-bugreport@lists.sourceforge.net; Tue, 22 Feb 2022 15:00:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+/GnzMFsOfgSwnOs9jSq0bvgRBQZVFqN9YEsTfyn9IY=; b=HOF+ouWgVLH+0fe9q5NmptX6AF
 WzP3Cqc5SZDmCjyN2zHb6emhfpcWjfDSjPo6DyDfxXt9A1p/lgCW9Eodq5827YyvEzdVX38q4PDJv
 g69bvc5iVQ1QIQt4XrpWlqYh+JhaEnW6votK2MDWkoUJW0hneb+pwpFmAbkrwJpSik0Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+/GnzMFsOfgSwnOs9jSq0bvgRBQZVFqN9YEsTfyn9IY=; b=bg3FVjHolDnUcFGuha6wKi3Mu0
 zCWObz8BnNsOTZ3L8uDctRXKCJ6PmohOmTzeV5rtQlAQMsxNZla6idx7aFBM5FFfc1WiQ8fl70xN9
 tmmyJS7BI4MajKUdfxNsNBMQElpsyKeOSSeiL5YyZAGKIG+Be3vqLCShmY6LONr/D1F4=;
Received: from pegase2.c-s.fr ([93.17.235.10])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nMWel-00BOrY-Iv
 for kgdb-bugreport@lists.sourceforge.net; Tue, 22 Feb 2022 15:00:48 +0000
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4K32RF1vXMz9sSX;
 Tue, 22 Feb 2022 16:00:41 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aHsBMPXbzwiE; Tue, 22 Feb 2022 16:00:41 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4K32RF16bkz9sSP;
 Tue, 22 Feb 2022 16:00:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 15D7D8B783;
 Tue, 22 Feb 2022 16:00:41 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Rfqs5P2jSmQ5; Tue, 22 Feb 2022 16:00:41 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.7.78])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BB7CB8B764;
 Tue, 22 Feb 2022 16:00:40 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 21MF0VhI1087063
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 22 Feb 2022 16:00:31 +0100
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 21MF0V8O1087062;
 Tue, 22 Feb 2022 16:00:31 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Luis Chamberlain <mcgrof@kernel.org>, Aaron Tomlin <atomlin@redhat.com>
Date: Tue, 22 Feb 2022 16:00:18 +0100
Message-Id: <c9584f48abce748e62e65e6757ceb23800f15380.1645541930.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1645541930.git.christophe.leroy@csgroup.eu>
References: <cover.1645541930.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1645542019; l=1894; s=20211009;
 h=from:subject:message-id; bh=LdQW7knw8SonM6V3x5dRanGW0RmzQuevemJoFaoAVWs=;
 b=Gf7wC7QYemkicc/NhrBdTVD+qjc4lnhJtPWXAc0YJAgZbJFTXdX6gN0m5lURY+4t4MD8nfsJoIVg
 SGmcTtOhARaEy/nlBipLNhQMxcFRT4kiZqtuWEy4h3O5bzlknr5V
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519;
 pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  In order to separate text and data, we need to setup two rb
 trees. This means that struct mod_tree_root is required even without
 MODULES_TREE_LOOKUP.
 Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu> ---
 kernel/module/internal.h
 | 4 +++- kernel/module/main.c | 5 ----- 2 files changed, 3 insertions(+),
 6 deletions(-) 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nMWel-00BOrY-Iv
Subject: [Kgdb-bugreport] [PATCH v5 1/6] module: Always have struct
 mod_tree_root
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

In order to separate text and data, we need to setup
two rb trees.

This means that struct mod_tree_root is required even without
MODULES_TREE_LOOKUP.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 kernel/module/internal.h | 4 +++-
 kernel/module/main.c     | 5 -----
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/kernel/module/internal.h b/kernel/module/internal.h
index 3fc139d5074b..743b598e7cc2 100644
--- a/kernel/module/internal.h
+++ b/kernel/module/internal.h
@@ -143,15 +143,17 @@ static inline void module_decompress_cleanup(struct load_info *info)
 }
 #endif
 
-#ifdef CONFIG_MODULES_TREE_LOOKUP
 struct mod_tree_root {
+#ifdef CONFIG_MODULES_TREE_LOOKUP
 	struct latch_tree_root root;
+#endif
 	unsigned long addr_min;
 	unsigned long addr_max;
 };
 
 extern struct mod_tree_root mod_tree;
 
+#ifdef CONFIG_MODULES_TREE_LOOKUP
 void mod_tree_insert(struct module *mod);
 void mod_tree_remove_init(struct module *mod);
 void mod_tree_remove(struct module *mod);
diff --git a/kernel/module/main.c b/kernel/module/main.c
index 0749afdc34b5..3b75cb97f8c2 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -74,7 +74,6 @@ static void do_free_init(struct work_struct *w);
 static DECLARE_WORK(init_free_wq, do_free_init);
 static LLIST_HEAD(init_free_list);
 
-#ifdef CONFIG_MODULES_TREE_LOOKUP
 struct mod_tree_root mod_tree __cacheline_aligned = {
 	.addr_min = -1UL,
 };
@@ -82,10 +81,6 @@ struct mod_tree_root mod_tree __cacheline_aligned = {
 #define module_addr_min mod_tree.addr_min
 #define module_addr_max mod_tree.addr_max
 
-#else /* !CONFIG_MODULES_TREE_LOOKUP */
-static unsigned long module_addr_min = -1UL, module_addr_max;
-#endif /* CONFIG_MODULES_TREE_LOOKUP */
-
 struct symsearch {
 	const struct kernel_symbol *start, *stop;
 	const s32 *crcs;
-- 
2.34.1



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
