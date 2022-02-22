Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1624BFB85
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 22 Feb 2022 16:01:39 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1nMWfb-0004Gh-6w
	for lists+kgdb-bugreport@lfdr.de; Tue, 22 Feb 2022 15:01:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <christophe.leroy@csgroup.eu>) id 1nMWfa-0004GS-1B
 for kgdb-bugreport@lists.sourceforge.net; Tue, 22 Feb 2022 15:01:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3AjseNXCeD0uEz8bNH2pgtrYOfy+oDfIuD6dnRwA8Mk=; b=bn3SpdGSB4N2+xBDiJEDGtuzCI
 Ea9iogUypOQ0Lc0Lm4qVAVdk/XPiLn3LmRzo7Xc9yH2ZODU65QN2HZq8o+2tbL+rdlAEF5fEnuNe3
 Fx4H5QnAgW7fMzmuNHTdhPfGkzGCiMN/IvZbOSOgdnWkzUO8i2VxNODnQGkZDYdHfW/M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3AjseNXCeD0uEz8bNH2pgtrYOfy+oDfIuD6dnRwA8Mk=; b=IlQ0v+eV0bi3eXLkrHodTTKQBI
 WtIonjYvLg1DqY2LkBEU9eqtKWW2YVYcbJqZXaN8+xID24nXy8r4ukMcQFT6sPz5T8mveCeT2/ajk
 qH5BwvjlC9Y5HoLuyA04P+g0sIzUTs/4JjwW52cH0V6VbMHIwMuVICF/jZ4eQoAzKgT0=;
Received: from pegase2.c-s.fr ([93.17.235.10])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nMWfT-0004YC-Dh
 for kgdb-bugreport@lists.sourceforge.net; Tue, 22 Feb 2022 15:01:36 +0000
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4K32RL0vjgz9sSh;
 Tue, 22 Feb 2022 16:00:46 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9eYGarSmxfDO; Tue, 22 Feb 2022 16:00:46 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4K32RF3BdPz9sSm;
 Tue, 22 Feb 2022 16:00:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5D5758B779;
 Tue, 22 Feb 2022 16:00:41 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id NofCSKp4xH38; Tue, 22 Feb 2022 16:00:41 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.7.78])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C38648B77A;
 Tue, 22 Feb 2022 16:00:40 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 21MF0VIk1087068
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 22 Feb 2022 16:00:31 +0100
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 21MF0Vfo1087067;
 Tue, 22 Feb 2022 16:00:31 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Luis Chamberlain <mcgrof@kernel.org>, Aaron Tomlin <atomlin@redhat.com>
Date: Tue, 22 Feb 2022 16:00:19 +0100
Message-Id: <5211de4d8e10c11cae25aa75c5412ab39ba4a32e.1645541930.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1645541930.git.christophe.leroy@csgroup.eu>
References: <cover.1645541930.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1645542019; l=4776; s=20211009;
 h=from:subject:message-id; bh=RJovauv+wsApvJwnNWYWLpUCjAtXnivI97HGCsNugkw=;
 b=Gcvf145nRHzdfSD677aqrzmKiT3yB8z3I8punYMeMXzz0DrM7Yv0PEEeDY5/7oYXc913DqKs8cLS
 Z2wZ0s6DCkfi2a2so6CLE0Glu9UU5ugu9rotmBHORrOTnasO+zOW
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
 trees. Modify functions to give the tree as a parameter. Signed-off-by:
 Christophe
 Leroy <christophe.leroy@csgroup.eu> --- kernel/module/internal.h | 4 ++--
 kernel/module/main.c | 16 ++++++++-------- kernel/module/tree_lookup.c |
 20 ++++++++++ 3 f [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nMWfT-0004YC-Dh
Subject: [Kgdb-bugreport] [PATCH v5 2/6] module: Prepare for handling
 several RB trees
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

Modify functions to give the tree as a parameter.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 kernel/module/internal.h    |  4 ++--
 kernel/module/main.c        | 16 ++++++++--------
 kernel/module/tree_lookup.c | 20 ++++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/kernel/module/internal.h b/kernel/module/internal.h
index 743b598e7cc2..99a5be36190c 100644
--- a/kernel/module/internal.h
+++ b/kernel/module/internal.h
@@ -157,13 +157,13 @@ extern struct mod_tree_root mod_tree;
 void mod_tree_insert(struct module *mod);
 void mod_tree_remove_init(struct module *mod);
 void mod_tree_remove(struct module *mod);
-struct module *mod_find(unsigned long addr);
+struct module *mod_find(unsigned long addr, struct mod_tree_root *tree);
 #else /* !CONFIG_MODULES_TREE_LOOKUP */
 
 static inline void mod_tree_insert(struct module *mod) { }
 static inline void mod_tree_remove_init(struct module *mod) { }
 static inline void mod_tree_remove(struct module *mod) { }
-static inline struct module *mod_find(unsigned long addr)
+static inline struct module *mod_find(unsigned long addr, struct mod_tree_root *tree)
 {
 	struct module *mod;
 
diff --git a/kernel/module/main.c b/kernel/module/main.c
index 3b75cb97f8c2..c0b961e02909 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -91,22 +91,22 @@ struct symsearch {
  * Bounds of module text, for speeding up __module_address.
  * Protected by module_mutex.
  */
-static void __mod_update_bounds(void *base, unsigned int size)
+static void __mod_update_bounds(void *base, unsigned int size, struct mod_tree_root *tree)
 {
 	unsigned long min = (unsigned long)base;
 	unsigned long max = min + size;
 
-	if (min < module_addr_min)
-		module_addr_min = min;
-	if (max > module_addr_max)
-		module_addr_max = max;
+	if (min < tree->addr_min)
+		tree->addr_min = min;
+	if (max > tree->addr_max)
+		tree->addr_max = max;
 }
 
 static void mod_update_bounds(struct module *mod)
 {
-	__mod_update_bounds(mod->core_layout.base, mod->core_layout.size);
+	__mod_update_bounds(mod->core_layout.base, mod->core_layout.size, &mod_tree);
 	if (mod->init_layout.size)
-		__mod_update_bounds(mod->init_layout.base, mod->init_layout.size);
+		__mod_update_bounds(mod->init_layout.base, mod->init_layout.size, &mod_tree);
 }
 
 static void module_assert_mutex_or_preempt(void)
@@ -3051,7 +3051,7 @@ struct module *__module_address(unsigned long addr)
 
 	module_assert_mutex_or_preempt();
 
-	mod = mod_find(addr);
+	mod = mod_find(addr, &mod_tree);
 	if (mod) {
 		BUG_ON(!within_module(addr, mod));
 		if (mod->state == MODULE_STATE_UNFORMED)
diff --git a/kernel/module/tree_lookup.c b/kernel/module/tree_lookup.c
index 0bc4ec3b22ce..995fe68059db 100644
--- a/kernel/module/tree_lookup.c
+++ b/kernel/module/tree_lookup.c
@@ -61,14 +61,14 @@ static const struct latch_tree_ops mod_tree_ops = {
 	.comp = mod_tree_comp,
 };
 
-static noinline void __mod_tree_insert(struct mod_tree_node *node)
+static noinline void __mod_tree_insert(struct mod_tree_node *node, struct mod_tree_root *tree)
 {
-	latch_tree_insert(&node->node, &mod_tree.root, &mod_tree_ops);
+	latch_tree_insert(&node->node, &tree->root, &mod_tree_ops);
 }
 
-static void __mod_tree_remove(struct mod_tree_node *node)
+static void __mod_tree_remove(struct mod_tree_node *node, struct mod_tree_root *tree)
 {
-	latch_tree_erase(&node->node, &mod_tree.root, &mod_tree_ops);
+	latch_tree_erase(&node->node, &tree->root, &mod_tree_ops);
 }
 
 /*
@@ -80,28 +80,28 @@ void mod_tree_insert(struct module *mod)
 	mod->core_layout.mtn.mod = mod;
 	mod->init_layout.mtn.mod = mod;
 
-	__mod_tree_insert(&mod->core_layout.mtn);
+	__mod_tree_insert(&mod->core_layout.mtn, &mod_tree);
 	if (mod->init_layout.size)
-		__mod_tree_insert(&mod->init_layout.mtn);
+		__mod_tree_insert(&mod->init_layout.mtn, &mod_tree);
 }
 
 void mod_tree_remove_init(struct module *mod)
 {
 	if (mod->init_layout.size)
-		__mod_tree_remove(&mod->init_layout.mtn);
+		__mod_tree_remove(&mod->init_layout.mtn, &mod_tree);
 }
 
 void mod_tree_remove(struct module *mod)
 {
-	__mod_tree_remove(&mod->core_layout.mtn);
+	__mod_tree_remove(&mod->core_layout.mtn, &mod_tree);
 	mod_tree_remove_init(mod);
 }
 
-struct module *mod_find(unsigned long addr)
+struct module *mod_find(unsigned long addr, struct mod_tree_root *tree)
 {
 	struct latch_tree_node *ltn;
 
-	ltn = latch_tree_find((void *)addr, &mod_tree.root, &mod_tree_ops);
+	ltn = latch_tree_find((void *)addr, &tree->root, &mod_tree_ops);
 	if (!ltn)
 		return NULL;
 
-- 
2.34.1



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
