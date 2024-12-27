Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC4C9FD14E
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 27 Dec 2024 08:30:00 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1tR4nI-0004vF-98
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 27 Dec 2024 07:29:59 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <rppt@kernel.org>) id 1tR4nH-0004v9-8r
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 27 Dec 2024 07:29:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=c9js65l60Su315uXAlOqXw9A8MNZmLUOrzYiZK6HhTI=; b=AQ+DFhEPKL3dnmBJCwq8LG/eqE
 vo5IW4HQ8M2LLymc59QYItXmdXwaTOm0cFBe/R9NENad/xcmt225trgqim7iTenYuidCRYibypBu2
 avL2gvEMpmE12tGX+N/O1uwUeVWH1tQnoRlwbiRLu56IvOoQNIU8xaVaNS9nlAbqoo3M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=c9js65l60Su315uXAlOqXw9A8MNZmLUOrzYiZK6HhTI=; b=e6n8Ko0+ixR/FwEJkfaEvdWRs7
 Rm4E/wEVV7VSjcF01/1HmQsERMm63bbkwORo8PE8lo3re8RBgv+p5wnVJySnLKQUKPFQHidkTZ3ej
 muCG6+Iqq773vRDUmqighs7F4lPYVRAYz/0eGqa2Sa+DTPtQ9Orn8YBKmJLe7+Ww+PGE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tR4nF-0007Ip-Qg for kgdb-bugreport@lists.sourceforge.net;
 Fri, 27 Dec 2024 07:29:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id ADE7C5C5F22;
 Fri, 27 Dec 2024 07:29:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 425F4C4CEE4;
 Fri, 27 Dec 2024 07:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1735284587;
 bh=0UxQHTn4TxkT8qmjfGtdSjB+pNz0UnZkmPm8yiWN9mY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ityZElnHqm6bnzepLB2TjYY5Xw64scud99fphM4K1mtbmfOR9sgV+ui9VzMP5Bbrd
 WAsiuLhOTqNxEV4obo+fmG4IgxNkKoWkqPjI3gSKxnUHKdT5J9R58acZhaIp7+Zoa+
 I3hnWpS9JE8LSapQsx5idWBVzDKgY0bKdy/omyG9hpXcSvQanUQqiU9X63K9Bu8r/A
 TMhqPCdTXSdJrA99yKZehHNw3bS5RBVbLpEZXDIK1C0BaXf+rf5+PHWbcjQ8HNcSHm
 ojXoSIADD6lPcFlN/NUt/6bZKQvoa/h7bQh85wHb568JsA8kAl0Az4krpLGHtHwzGP
 QoEU6y2Lsn3CQ==
To: Andrew Morton <akpm@linux-foundation.org>
Date: Fri, 27 Dec 2024 09:28:23 +0200
Message-ID: <20241227072825.1288491-7-rppt@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241227072825.1288491-1-rppt@kernel.org>
References: <20241227072825.1288491-1-rppt@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: "Mike Rapoport (Microsoft)" <rppt@kernel.org> Instead
 of using writable copy for module text sections, temporarily remap the memory
 allocated from execmem's ROX cache as writable and restore its ROX permissions
 after the module is formed. 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tR4nF-0007Ip-Qg
Subject: [Kgdb-bugreport] [PATCH 6/8] modules: switch to execmem API for
 remapping as RW and restoring ROX
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
From: Mike Rapoport via Kgdb-bugreport <kgdb-bugreport@lists.sourceforge.net>
Reply-To: Mike Rapoport <rppt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Andy Lutomirski <luto@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, kgdb-bugreport@lists.sourceforge.net,
 Dave Hansen <dave.hansen@linux.intel.com>, Rae Moar <rmoar@google.com>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Brendan Higgins <brendan.higgins@linux.dev>, linux-kselftest@vger.kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, live-patching@vger.kernel.org,
 Miroslav Benes <mbenes@suse.cz>, Shuah Khan <shuah@kernel.org>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Joe Lawrence <joe.lawrence@redhat.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Richard Weinberger <richard@nod.at>, x86@kernel.org,
 Ingo Molnar <mingo@redhat.com>, Daniel Thompson <danielt@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>, linux-trace-kernel@vger.kernel.org,
 Petr Mladek <pmladek@suse.com>, Petr Pavlu <petr.pavlu@suse.com>,
 Jiri Kosina <jikos@kernel.org>, linux-um@lists.infradead.org,
 Steven Rostedt <rostedt@goodmis.org>, Daniel Gomez <da.gomez@samsung.com>,
 Borislav Petkov <bp@alien8.de>, David Gow <davidgow@google.com>,
 Thomas Gleixner <tglx@linutronix.de>, Josh Poimboeuf <jpoimboe@kernel.org>,
 kunit-dev@googlegroups.com, Song Liu <song@kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>, linux-modules@vger.kernel.org,
 Johannes Berg <johannes@sipsolutions.net>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

Instead of using writable copy for module text sections, temporarily remap
the memory allocated from execmem's ROX cache as writable and restore its
ROX permissions after the module is formed.

This will allow removing nasty games with writable copy in alternatives
patching on x86.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 include/linux/module.h       |  7 +---
 include/linux/moduleloader.h |  4 ---
 kernel/module/main.c         | 67 ++++++------------------------------
 kernel/module/strict_rwx.c   |  9 ++---
 4 files changed, 17 insertions(+), 70 deletions(-)

diff --git a/include/linux/module.h b/include/linux/module.h
index bd8cf93d32c8..e9fc9d1fa476 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -368,7 +368,6 @@ enum mod_mem_type {
 
 struct module_memory {
 	void *base;
-	void *rw_copy;
 	bool is_rox;
 	unsigned int size;
 
@@ -775,13 +774,9 @@ static inline bool is_livepatch_module(struct module *mod)
 
 void set_module_sig_enforced(void);
 
-void *__module_writable_address(struct module *mod, void *loc);
-
 static inline void *module_writable_address(struct module *mod, void *loc)
 {
-	if (!IS_ENABLED(CONFIG_ARCH_HAS_EXECMEM_ROX) || !mod)
-		return loc;
-	return __module_writable_address(mod, loc);
+	return loc;
 }
 
 #else /* !CONFIG_MODULES... */
diff --git a/include/linux/moduleloader.h b/include/linux/moduleloader.h
index 1f5507ba5a12..e395461d59e5 100644
--- a/include/linux/moduleloader.h
+++ b/include/linux/moduleloader.h
@@ -108,10 +108,6 @@ int module_finalize(const Elf_Ehdr *hdr,
 		    const Elf_Shdr *sechdrs,
 		    struct module *mod);
 
-int module_post_finalize(const Elf_Ehdr *hdr,
-			 const Elf_Shdr *sechdrs,
-			 struct module *mod);
-
 #ifdef CONFIG_MODULES
 void flush_module_init_free_work(void);
 #else
diff --git a/kernel/module/main.c b/kernel/module/main.c
index ad8ef20c120f..ee6b46e753a0 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -1221,18 +1221,6 @@ void __weak module_arch_freeing_init(struct module *mod)
 {
 }
 
-void *__module_writable_address(struct module *mod, void *loc)
-{
-	for_class_mod_mem_type(type, text) {
-		struct module_memory *mem = &mod->mem[type];
-
-		if (loc >= mem->base && loc < mem->base + mem->size)
-			return loc + (mem->rw_copy - mem->base);
-	}
-
-	return loc;
-}
-
 static int module_memory_alloc(struct module *mod, enum mod_mem_type type)
 {
 	unsigned int size = PAGE_ALIGN(mod->mem[type].size);
@@ -1250,21 +1238,15 @@ static int module_memory_alloc(struct module *mod, enum mod_mem_type type)
 	if (!ptr)
 		return -ENOMEM;
 
-	mod->mem[type].base = ptr;
-
 	if (execmem_is_rox(execmem_type)) {
-		ptr = vzalloc(size);
+		int err = execmem_make_temp_rw(ptr, size);
 
-		if (!ptr) {
-			execmem_free(mod->mem[type].base);
+		if (err) {
+			execmem_free(ptr);
 			return -ENOMEM;
 		}
 
-		mod->mem[type].rw_copy = ptr;
 		mod->mem[type].is_rox = true;
-	} else {
-		mod->mem[type].rw_copy = mod->mem[type].base;
-		memset(mod->mem[type].base, 0, size);
 	}
 
 	/*
@@ -1280,6 +1262,9 @@ static int module_memory_alloc(struct module *mod, enum mod_mem_type type)
 	 */
 	kmemleak_not_leak(ptr);
 
+	memset(ptr, 0, size);
+	mod->mem[type].base = ptr;
+
 	return 0;
 }
 
@@ -1287,8 +1272,8 @@ static void module_memory_free(struct module *mod, enum mod_mem_type type)
 {
 	struct module_memory *mem = &mod->mem[type];
 
-	if (mem->is_rox)
-		vfree(mem->rw_copy);
+	if (mod->state == MODULE_STATE_UNFORMED && mem->is_rox)
+		execmem_restore_rox(mem->base, mem->size);
 
 	execmem_free(mem->base);
 }
@@ -2561,7 +2546,6 @@ static int move_module(struct module *mod, struct load_info *info)
 	for_each_mod_mem_type(type) {
 		if (!mod->mem[type].size) {
 			mod->mem[type].base = NULL;
-			mod->mem[type].rw_copy = NULL;
 			continue;
 		}
 
@@ -2578,7 +2562,6 @@ static int move_module(struct module *mod, struct load_info *info)
 		void *dest;
 		Elf_Shdr *shdr = &info->sechdrs[i];
 		const char *sname;
-		unsigned long addr;
 
 		if (!(shdr->sh_flags & SHF_ALLOC))
 			continue;
@@ -2599,14 +2582,12 @@ static int move_module(struct module *mod, struct load_info *info)
 				ret = PTR_ERR(dest);
 				goto out_err;
 			}
-			addr = (unsigned long)dest;
 			codetag_section_found = true;
 		} else {
 			enum mod_mem_type type = shdr->sh_entsize >> SH_ENTSIZE_TYPE_SHIFT;
 			unsigned long offset = shdr->sh_entsize & SH_ENTSIZE_OFFSET_MASK;
 
-			addr = (unsigned long)mod->mem[type].base + offset;
-			dest = mod->mem[type].rw_copy + offset;
+			dest = mod->mem[type].base + offset;
 		}
 
 		if (shdr->sh_type != SHT_NOBITS) {
@@ -2629,7 +2610,7 @@ static int move_module(struct module *mod, struct load_info *info)
 		 * users of info can keep taking advantage and using the newly
 		 * minted official memory area.
 		 */
-		shdr->sh_addr = addr;
+		shdr->sh_addr = (unsigned long)dest;
 		pr_debug("\t0x%lx 0x%.8lx %s\n", (long)shdr->sh_addr,
 			 (long)shdr->sh_size, info->secstrings + shdr->sh_name);
 	}
@@ -2782,17 +2763,8 @@ int __weak module_finalize(const Elf_Ehdr *hdr,
 	return 0;
 }
 
-int __weak module_post_finalize(const Elf_Ehdr *hdr,
-				const Elf_Shdr *sechdrs,
-				struct module *me)
-{
-	return 0;
-}
-
 static int post_relocation(struct module *mod, const struct load_info *info)
 {
-	int ret;
-
 	/* Sort exception table now relocations are done. */
 	sort_extable(mod->extable, mod->extable + mod->num_exentries);
 
@@ -2804,24 +2776,7 @@ static int post_relocation(struct module *mod, const struct load_info *info)
 	add_kallsyms(mod, info);
 
 	/* Arch-specific module finalizing. */
-	ret = module_finalize(info->hdr, info->sechdrs, mod);
-	if (ret)
-		return ret;
-
-	for_each_mod_mem_type(type) {
-		struct module_memory *mem = &mod->mem[type];
-
-		if (mem->is_rox) {
-			if (!execmem_update_copy(mem->base, mem->rw_copy,
-						 mem->size))
-				return -ENOMEM;
-
-			vfree(mem->rw_copy);
-			mem->rw_copy = NULL;
-		}
-	}
-
-	return module_post_finalize(info->hdr, info->sechdrs, mod);
+	return module_finalize(info->hdr, info->sechdrs, mod);
 }
 
 /* Call module constructors. */
diff --git a/kernel/module/strict_rwx.c b/kernel/module/strict_rwx.c
index 239e5013359d..ce47b6346f27 100644
--- a/kernel/module/strict_rwx.c
+++ b/kernel/module/strict_rwx.c
@@ -9,6 +9,7 @@
 #include <linux/mm.h>
 #include <linux/vmalloc.h>
 #include <linux/set_memory.h>
+#include <linux/execmem.h>
 #include "internal.h"
 
 static int module_set_memory(const struct module *mod, enum mod_mem_type type,
@@ -32,12 +33,12 @@ static int module_set_memory(const struct module *mod, enum mod_mem_type type,
 int module_enable_text_rox(const struct module *mod)
 {
 	for_class_mod_mem_type(type, text) {
+		const struct module_memory *mem = &mod->mem[type];
 		int ret;
 
-		if (mod->mem[type].is_rox)
-			continue;
-
-		if (IS_ENABLED(CONFIG_STRICT_MODULE_RWX))
+		if (mem->is_rox)
+			ret = execmem_restore_rox(mem->base, mem->size);
+		else if (IS_ENABLED(CONFIG_STRICT_MODULE_RWX))
 			ret = module_set_memory(mod, type, set_memory_rox);
 		else
 			ret = module_set_memory(mod, type, set_memory_x);
-- 
2.45.2



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
