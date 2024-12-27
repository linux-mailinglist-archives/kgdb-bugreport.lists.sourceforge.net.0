Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3429FD148
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 27 Dec 2024 08:29:47 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1tR4n4-0005jy-Gt
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 27 Dec 2024 07:29:46 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <rppt@kernel.org>) id 1tR4n2-0005jc-8m
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 27 Dec 2024 07:29:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bhAs81WsdmaB1BC5mVN5DKU+/2vSD1EVP4twaFT9Vd4=; b=jzXgm3eL9VuXpqmuZkiRM73mGE
 +PcTIrmjBlp4ZpfOMRwe2CbXj42jK8P9+5WMwuTbehXjncRlQ+pWPSIxcz7WK88IRC0+mZ73awtS3
 qgkVhlp3rWMfI3UvIltKJ7zch8rq7KkJS78TBNbrGabcQoMGGoq/4CZe8RR1pCnOvgSg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bhAs81WsdmaB1BC5mVN5DKU+/2vSD1EVP4twaFT9Vd4=; b=UdiUappthSHLoBlNWh2rTTWcd9
 SCGFA3h9V1muRODnG9FjdmS2D0b+iFep5C/FiCNqXmeBxiQC5Y1rzOmwjWheX4bi7haFz6o/i5wjG
 zRCk/wUP4XpTMDgIxxGiWPMAXn8cohAD/Y8GiJ7GJSyJhXByDsq7KQ5+wvPNTbiiGSrI=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tR4n0-0007Hl-Py for kgdb-bugreport@lists.sourceforge.net;
 Fri, 27 Dec 2024 07:29:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 40680A411C6;
 Fri, 27 Dec 2024 07:27:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED23AC4CEDE;
 Fri, 27 Dec 2024 07:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1735284576;
 bh=FmTrET8nL2UmyRc6aQAH2J1SgS8cwR3X1MoKmnTcl78=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ScuKV2kD6qnanPStFqpYQm0FgQDVh0DLb3NJ4mtpO81hTHINYHF0xekTtwDQfutNa
 5HKFQzwtfQTvNvihXCd5kB4OjdDHB0EgoIFx02GxxN3l+EmLdLZCev+8FpmEu9CC4k
 eMT9y14Y+PeB1o2Tfc/girl/nvsZSOezNPfNaMWFzyJZUyEKRLnNC7r43j4jRHie3x
 /okfVqQiHOWC+vCecEU5ddItPuJAZnoPoFpdYKjuRTORzV98ljXX49DwlOe+fDP1f0
 KYHcHr1ZIK6uxPwndLMeq8O6yIz3Hp7YubMI/Xsj65vbvOwrCzxasJFI+iE6G6/Qwt
 XiyJ1o1+qm82Q==
To: Andrew Morton <akpm@linux-foundation.org>
Date: Fri, 27 Dec 2024 09:28:22 +0200
Message-ID: <20241227072825.1288491-6-rppt@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241227072825.1288491-1-rppt@kernel.org>
References: <20241227072825.1288491-1-rppt@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -2.6 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: "Mike Rapoport (Microsoft)" <rppt@kernel.org> In order
 to use execmem's API for temporal remapping of the memory allocated from
 ROX cache as writable, there is a need to distinguish between the state when
 the module is being formed and the state [...] 
 Content analysis details:   (-2.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tR4n0-0007Hl-Py
Subject: [Kgdb-bugreport] [PATCH 5/8] module: introduce MODULE_STATE_GONE
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

In order to use execmem's API for temporal remapping of the memory
allocated from ROX cache as writable, there is a need to distinguish
between the state when the module is being formed and the state when it is
deconstructed and freed so that when module_memory_free() is called from
error paths during module loading it could restore ROX mappings.

Replace open coded checks for MODULE_STATE_UNFORMED with a helper
function module_is_formed() and add a new MODULE_STATE_GONE that will be
set when the module is deconstructed and freed.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 include/linux/module.h                        |  6 ++++++
 kernel/module/kallsyms.c                      |  8 ++++----
 kernel/module/kdb.c                           |  2 +-
 kernel/module/main.c                          | 19 +++++++++----------
 kernel/module/procfs.c                        |  2 +-
 kernel/tracepoint.c                           |  2 ++
 lib/kunit/test.c                              |  2 ++
 samples/livepatch/livepatch-callbacks-demo.c  |  1 +
 .../test_modules/test_klp_callbacks_demo.c    |  1 +
 .../test_modules/test_klp_callbacks_demo2.c   |  1 +
 .../livepatch/test_modules/test_klp_state.c   |  1 +
 .../livepatch/test_modules/test_klp_state2.c  |  1 +
 12 files changed, 30 insertions(+), 16 deletions(-)

diff --git a/include/linux/module.h b/include/linux/module.h
index 94acbacdcdf1..bd8cf93d32c8 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -320,6 +320,7 @@ enum module_state {
 	MODULE_STATE_COMING,	/* Full formed, running module_init. */
 	MODULE_STATE_GOING,	/* Going away. */
 	MODULE_STATE_UNFORMED,	/* Still setting it up. */
+	MODULE_STATE_GONE,	/* Deconstructing and freeing. */
 };
 
 struct mod_tree_node {
@@ -620,6 +621,11 @@ static inline bool module_is_coming(struct module *mod)
         return mod->state == MODULE_STATE_COMING;
 }
 
+static inline bool module_is_formed(struct module *mod)
+{
+	return mod->state < MODULE_STATE_UNFORMED;
+}
+
 struct module *__module_text_address(unsigned long addr);
 struct module *__module_address(unsigned long addr);
 bool is_module_address(unsigned long addr);
diff --git a/kernel/module/kallsyms.c b/kernel/module/kallsyms.c
index bf65e0c3c86f..daf9a9b3740f 100644
--- a/kernel/module/kallsyms.c
+++ b/kernel/module/kallsyms.c
@@ -361,7 +361,7 @@ int lookup_module_symbol_name(unsigned long addr, char *symname)
 
 	preempt_disable();
 	list_for_each_entry_rcu(mod, &modules, list) {
-		if (mod->state == MODULE_STATE_UNFORMED)
+		if (!module_is_formed(mod))
 			continue;
 		if (within_module(addr, mod)) {
 			const char *sym;
@@ -389,7 +389,7 @@ int module_get_kallsym(unsigned int symnum, unsigned long *value, char *type,
 	list_for_each_entry_rcu(mod, &modules, list) {
 		struct mod_kallsyms *kallsyms;
 
-		if (mod->state == MODULE_STATE_UNFORMED)
+		if (!module_is_formed(mod))
 			continue;
 		kallsyms = rcu_dereference_sched(mod->kallsyms);
 		if (symnum < kallsyms->num_symtab) {
@@ -441,7 +441,7 @@ static unsigned long __module_kallsyms_lookup_name(const char *name)
 	list_for_each_entry_rcu(mod, &modules, list) {
 		unsigned long ret;
 
-		if (mod->state == MODULE_STATE_UNFORMED)
+		if (!module_is_formed(mod))
 			continue;
 		ret = __find_kallsyms_symbol_value(mod, name);
 		if (ret)
@@ -484,7 +484,7 @@ int module_kallsyms_on_each_symbol(const char *modname,
 	list_for_each_entry(mod, &modules, list) {
 		struct mod_kallsyms *kallsyms;
 
-		if (mod->state == MODULE_STATE_UNFORMED)
+		if (!module_is_formed(mod))
 			continue;
 
 		if (modname && strcmp(modname, mod->name))
diff --git a/kernel/module/kdb.c b/kernel/module/kdb.c
index 995c32d3698f..14f14700ffc2 100644
--- a/kernel/module/kdb.c
+++ b/kernel/module/kdb.c
@@ -23,7 +23,7 @@ int kdb_lsmod(int argc, const char **argv)
 
 	kdb_printf("Module                  Size  modstruct     Used by\n");
 	list_for_each_entry(mod, &modules, list) {
-		if (mod->state == MODULE_STATE_UNFORMED)
+		if (!module_is_formed(mod))
 			continue;
 
 		kdb_printf("%-20s%8u", mod->name, mod->mem[MOD_TEXT].size);
diff --git a/kernel/module/main.c b/kernel/module/main.c
index 5399c182b3cb..ad8ef20c120f 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -153,7 +153,7 @@ EXPORT_SYMBOL(unregister_module_notifier);
  */
 static inline int strong_try_module_get(struct module *mod)
 {
-	BUG_ON(mod && mod->state == MODULE_STATE_UNFORMED);
+	BUG_ON(mod && !module_is_formed(mod));
 	if (mod && mod->state == MODULE_STATE_COMING)
 		return -EBUSY;
 	if (try_module_get(mod))
@@ -361,7 +361,7 @@ bool find_symbol(struct find_symbol_arg *fsa)
 			  GPL_ONLY },
 		};
 
-		if (mod->state == MODULE_STATE_UNFORMED)
+		if (!module_is_formed(mod))
 			continue;
 
 		for (i = 0; i < ARRAY_SIZE(arr); i++)
@@ -386,7 +386,7 @@ struct module *find_module_all(const char *name, size_t len,
 
 	list_for_each_entry_rcu(mod, &modules, list,
 				lockdep_is_held(&module_mutex)) {
-		if (!even_unformed && mod->state == MODULE_STATE_UNFORMED)
+		if (!even_unformed && !module_is_formed(mod))
 			continue;
 		if (strlen(mod->name) == len && !memcmp(mod->name, name, len))
 			return mod;
@@ -457,7 +457,7 @@ bool __is_module_percpu_address(unsigned long addr, unsigned long *can_addr)
 	preempt_disable();
 
 	list_for_each_entry_rcu(mod, &modules, list) {
-		if (mod->state == MODULE_STATE_UNFORMED)
+		if (!module_is_formed(mod))
 			continue;
 		if (!mod->percpu_size)
 			continue;
@@ -1326,7 +1326,7 @@ static void free_module(struct module *mod)
 	 * that noone uses it while it's being deconstructed.
 	 */
 	mutex_lock(&module_mutex);
-	mod->state = MODULE_STATE_UNFORMED;
+	mod->state = MODULE_STATE_GONE;
 	mutex_unlock(&module_mutex);
 
 	/* Arch-specific cleanup. */
@@ -3048,8 +3048,7 @@ static int module_patient_check_exists(const char *name,
 	if (old == NULL)
 		return 0;
 
-	if (old->state == MODULE_STATE_COMING ||
-	    old->state == MODULE_STATE_UNFORMED) {
+	if (old->state == MODULE_STATE_COMING || !module_is_formed(old)) {
 		/* Wait in case it fails to load. */
 		mutex_unlock(&module_mutex);
 		err = wait_event_interruptible(module_wq,
@@ -3608,7 +3607,7 @@ char *module_flags(struct module *mod, char *buf, bool show_state)
 {
 	int bx = 0;
 
-	BUG_ON(mod->state == MODULE_STATE_UNFORMED);
+	BUG_ON(!module_is_formed(mod));
 	if (!mod->taints && !show_state)
 		goto out;
 	if (mod->taints ||
@@ -3702,7 +3701,7 @@ struct module *__module_address(unsigned long addr)
 	mod = mod_find(addr, &mod_tree);
 	if (mod) {
 		BUG_ON(!within_module(addr, mod));
-		if (mod->state == MODULE_STATE_UNFORMED)
+		if (!module_is_formed(mod))
 			mod = NULL;
 	}
 	return mod;
@@ -3756,7 +3755,7 @@ void print_modules(void)
 	/* Most callers should already have preempt disabled, but make sure */
 	preempt_disable();
 	list_for_each_entry_rcu(mod, &modules, list) {
-		if (mod->state == MODULE_STATE_UNFORMED)
+		if (!module_is_formed(mod))
 			continue;
 		pr_cont(" %s%s", mod->name, module_flags(mod, buf, true));
 	}
diff --git a/kernel/module/procfs.c b/kernel/module/procfs.c
index 0a4841e88adb..2c617e6f8bc0 100644
--- a/kernel/module/procfs.c
+++ b/kernel/module/procfs.c
@@ -79,7 +79,7 @@ static int m_show(struct seq_file *m, void *p)
 	unsigned int size;
 
 	/* We always ignore unformed modules. */
-	if (mod->state == MODULE_STATE_UNFORMED)
+	if (!module_is_formed(mod))
 		return 0;
 
 	size = module_total_size(mod);
diff --git a/kernel/tracepoint.c b/kernel/tracepoint.c
index 1848ce7e2976..e94247afb2c6 100644
--- a/kernel/tracepoint.c
+++ b/kernel/tracepoint.c
@@ -668,6 +668,8 @@ static int tracepoint_module_notify(struct notifier_block *self,
 		break;
 	case MODULE_STATE_UNFORMED:
 		break;
+	case MODULE_STATE_GONE:
+		break;
 	}
 	return notifier_from_errno(ret);
 }
diff --git a/lib/kunit/test.c b/lib/kunit/test.c
index 089c832e3cdb..54eaed92a2d3 100644
--- a/lib/kunit/test.c
+++ b/lib/kunit/test.c
@@ -836,6 +836,8 @@ static int kunit_module_notify(struct notifier_block *nb, unsigned long val,
 		break;
 	case MODULE_STATE_UNFORMED:
 		break;
+	case MODULE_STATE_GONE:
+		break;
 	}
 
 	return 0;
diff --git a/samples/livepatch/livepatch-callbacks-demo.c b/samples/livepatch/livepatch-callbacks-demo.c
index 11c3f4357812..324bddaef9a6 100644
--- a/samples/livepatch/livepatch-callbacks-demo.c
+++ b/samples/livepatch/livepatch-callbacks-demo.c
@@ -93,6 +93,7 @@ static const char *const module_state[] = {
 	[MODULE_STATE_COMING]	= "[MODULE_STATE_COMING] Full formed, running module_init",
 	[MODULE_STATE_GOING]	= "[MODULE_STATE_GOING] Going away",
 	[MODULE_STATE_UNFORMED]	= "[MODULE_STATE_UNFORMED] Still setting it up",
+	[MODULE_STATE_GONE]	= "[MODULE_STATE_GONE] Deconstructing and freeing",
 };
 
 static void callback_info(const char *callback, struct klp_object *obj)
diff --git a/tools/testing/selftests/livepatch/test_modules/test_klp_callbacks_demo.c b/tools/testing/selftests/livepatch/test_modules/test_klp_callbacks_demo.c
index 3fd8fe1cd1cc..8435e3254f85 100644
--- a/tools/testing/selftests/livepatch/test_modules/test_klp_callbacks_demo.c
+++ b/tools/testing/selftests/livepatch/test_modules/test_klp_callbacks_demo.c
@@ -16,6 +16,7 @@ static const char *const module_state[] = {
 	[MODULE_STATE_COMING]	= "[MODULE_STATE_COMING] Full formed, running module_init",
 	[MODULE_STATE_GOING]	= "[MODULE_STATE_GOING] Going away",
 	[MODULE_STATE_UNFORMED]	= "[MODULE_STATE_UNFORMED] Still setting it up",
+	[MODULE_STATE_GONE]	= "[MODULE_STATE_GONE] Deconstructing and freeing",
 };
 
 static void callback_info(const char *callback, struct klp_object *obj)
diff --git a/tools/testing/selftests/livepatch/test_modules/test_klp_callbacks_demo2.c b/tools/testing/selftests/livepatch/test_modules/test_klp_callbacks_demo2.c
index 5417573e80af..78c1fff5d977 100644
--- a/tools/testing/selftests/livepatch/test_modules/test_klp_callbacks_demo2.c
+++ b/tools/testing/selftests/livepatch/test_modules/test_klp_callbacks_demo2.c
@@ -16,6 +16,7 @@ static const char *const module_state[] = {
 	[MODULE_STATE_COMING]	= "[MODULE_STATE_COMING] Full formed, running module_init",
 	[MODULE_STATE_GOING]	= "[MODULE_STATE_GOING] Going away",
 	[MODULE_STATE_UNFORMED]	= "[MODULE_STATE_UNFORMED] Still setting it up",
+	[MODULE_STATE_GONE]	= "[MODULE_STATE_GONE] Deconstructing and freeing",
 };
 
 static void callback_info(const char *callback, struct klp_object *obj)
diff --git a/tools/testing/selftests/livepatch/test_modules/test_klp_state.c b/tools/testing/selftests/livepatch/test_modules/test_klp_state.c
index 57a4253acb01..bdebf1d24c98 100644
--- a/tools/testing/selftests/livepatch/test_modules/test_klp_state.c
+++ b/tools/testing/selftests/livepatch/test_modules/test_klp_state.c
@@ -18,6 +18,7 @@ static const char *const module_state[] = {
 	[MODULE_STATE_COMING]	= "[MODULE_STATE_COMING] Full formed, running module_init",
 	[MODULE_STATE_GOING]	= "[MODULE_STATE_GOING] Going away",
 	[MODULE_STATE_UNFORMED]	= "[MODULE_STATE_UNFORMED] Still setting it up",
+	[MODULE_STATE_GONE]	= "[MODULE_STATE_GONE] Deconstructing and freeing",
 };
 
 static void callback_info(const char *callback, struct klp_object *obj)
diff --git a/tools/testing/selftests/livepatch/test_modules/test_klp_state2.c b/tools/testing/selftests/livepatch/test_modules/test_klp_state2.c
index c978ea4d5e67..1a55f84a8eb3 100644
--- a/tools/testing/selftests/livepatch/test_modules/test_klp_state2.c
+++ b/tools/testing/selftests/livepatch/test_modules/test_klp_state2.c
@@ -18,6 +18,7 @@ static const char *const module_state[] = {
 	[MODULE_STATE_COMING]	= "[MODULE_STATE_COMING] Full formed, running module_init",
 	[MODULE_STATE_GOING]	= "[MODULE_STATE_GOING] Going away",
 	[MODULE_STATE_UNFORMED]	= "[MODULE_STATE_UNFORMED] Still setting it up",
+	[MODULE_STATE_GONE]	= "[MODULE_STATE_GONE] Deconstructing and freeing",
 };
 
 static void callback_info(const char *callback, struct klp_object *obj)
-- 
2.45.2



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
