Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C92C3951704
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 14 Aug 2024 10:52:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1se9kQ-00073t-Uf
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 14 Aug 2024 08:52:50 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <mail@florommel.de>) id 1se9kP-00073j-3r
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 14 Aug 2024 08:52:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PHZn7hBqhQ9W3QpKqPU5Lf2tB73ZQYU2MQaHRx3pkp8=; b=QAqg4Mvect5gLmS1XQciYVteyc
 Lpv2iSfTVwUNzpWl5D6KuE/1GrvPhXEsl7lQO6K2eiwYjuTILGq6Wac2oKkqspL8p4qbqmmyjSIwK
 Ft4G6THkc5f3pId/1FU0MK1nguGgJMBbSntXsZYtpcio45KLf4+y5IJcaSKO9J/ONMj8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PHZn7hBqhQ9W3QpKqPU5Lf2tB73ZQYU2MQaHRx3pkp8=; b=b03n2qBdsIjsmOdW0dM9rfFwd8
 MWClOoRKLdc+KRZRP76KvXu7VBvMt+twpk2shQSao5qMmz7ApaK6ak4lfptEiHxtQFtIC7Qpa2oU4
 B2uljkRpqe5GLwUuu0VCzhCXo4o1tXFZYpwYqr6G4LyV4WNtO6kgtwrlMC5o9prSOgPE=;
Received: from read.uberspace.de ([185.26.156.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1se9kN-00085n-Hp for kgdb-bugreport@lists.sourceforge.net;
 Wed, 14 Aug 2024 08:52:49 +0000
Received: (qmail 18519 invoked by uid 990); 14 Aug 2024 08:52:35 -0000
Authentication-Results: read.uberspace.de;
	auth=pass (plain)
Received: from unknown (HELO unkown) (::1)
 by read.uberspace.de (Haraka/3.0.1) with ESMTPSA;
 Wed, 14 Aug 2024 10:52:35 +0200
From: Florian Rommel <mail@florommel.de>
To: Thomas Gleixner <tglx@linutronix.de>,
 Daniel Thompson <daniel.thompson@linaro.org>
Date: Wed, 14 Aug 2024 10:51:41 +0200
Message-ID: <20240814085141.171564-1-mail@florommel.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <87wmkkpf5v.ffs@tglx>
References: <87wmkkpf5v.ffs@tglx>
MIME-Version: 1.0
X-Rspamd-Bar: /
X-Rspamd-Report: SUSPICIOUS_RECIPS(1.5) BAYES_HAM(-2.998549)
 MID_CONTAINS_FROM(1) MIME_GOOD(-0.1) R_MISSING_CHARSET(0.5)
X-Rspamd-Score: -0.098549
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=florommel.de; s=uberspace; h=from:to:cc:subject:date;
 bh=VtfiUuMXenuWNAXIoZBKbUbOReRzsrPylqGtkuxcw1Y=;
 b=Tn8BuF/bdNtBWz5NzWM5EnbZyVq55TjTiZbVKX+Qn/z6rwj/L4L4le0oDeou83bKlooeoRPiVP
 ad0E779lFp3RCUjI84ZBORu/WdpUBdlAi+1d/OnJnFWWd9+8nEatsWI5q1zqk7BaosiDT3AU9Awc
 MDumtJHMP9oHH8wles6kcn+WIePzb0IJdLIYmpuH0xSFXq1RQqkrVB+t0P2zc9lTWFxuQB7A8wgT
 7VHj9eHIhYnynFhj01B1rU5nkK8ezGNb+QUmymqHaJgHWlSORjyhQSJRTfCEzP0UxDbYZGJxr8jq
 jNwRLR344EZpZ6UVub8wdIC2q7ArxZDJrpByZ1ag35N0wjQ5fCedz2Y/bmUZXbsywSkCcKnwNwF4
 7CwH/LGkDyFOh9RBXPDZUAuBsCm4JN80iADyrsZNasxSFXF60xP0a3u6IjdfsTJ6YEPrkRrM8WoB
 zB8kLFSAVwrcLVKfhD5fmkccUANV9P7NIzt8kZy8+g6lLntsnJoEZJeLsWgnSyaRDVEl0YsT6Xh6
 GamOnUlxqkW9x21l7Q0Yy39FPlvejVSPQQ8v1q+PxSQMS9jSZIV65GW3avBCbNryosKQPpvhzJhV
 EI9vZb++Jti8QpDx2O8IC7f4yAflBRnN/20t1SQkteALAIimyArlDxn4fFnj5ThE5G8imzkQ/gGP
 c=
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Experimental implementation of Thomas' trampoline idea. Link:
 https://lore.kernel.org/all/87wmkkpf5v.ffs@tglx/ Every breakpoint gets a
 trampoline entry containing the original instruction (with a corrected
 displacement
 if necessary) and a jump back into the function to the logically subsequent
 instruction. Wit [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [185.26.156.133 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: florommel.de]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [185.26.156.133 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [185.26.156.133 listed in bl.score.senderscore.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1se9kN-00085n-Hp
Subject: [Kgdb-bugreport] [PATCH WIP] x86/kgdb: trampolines for shadowed
 instructions
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
Cc: x86@kernel.org, Randy Dunlap <rdunlap@infradead.org>,
 "H . Peter Anvin" <hpa@zytor.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Peter Zijlstra <peterz@infradead.org>, kgdb-bugreport@lists.sourceforge.net,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, linux-kernel@vger.kernel.org,
 Lorena Kretzschmar <qy15sije@cip.cs.fau.de>, Kees Cook <kees@kernel.org>,
 Florian Rommel <mail@florommel.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Masami Hiramatsu <mhiramat@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Andrew Morton <akpm@linux-foundation.org>,
 Stefan Saecherl <stefan.saecherl@fau.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Experimental implementation of Thomas' trampoline idea.
Link: https://lore.kernel.org/all/87wmkkpf5v.ffs@tglx/

Every breakpoint gets a trampoline entry containing the original
instruction (with a corrected displacement if necessary) and a jump
back into the function to the logically subsequent instruction.
With this, KGDB can skip a still present debug trap for a removed
breakpoint by routing the control flow through the trampoline.

In this experimental implementation, the actual removal of the debug
trap instructions is completely disabled. So, all trap instructions
planted by KGDB currently remain in the code, and KGDB will skip all
these breakpoints through the trampolines when they are in the removed
state. There is not yet a dedicated breakpoint state for the
to-be-removed-but-still-present breakpoints.

Inspect the trampolines via:
(gdb) x/16i kgdb_trampoline_page

Signed-off-by: Florian Rommel <mail@florommel.de>
---
I have been experimenting a bit with Thomas' idea of the trampoline
approach. It seems to work so far but of course has a lot of rough
edges.

I am stuck for now, as I am not sure about the best way to implement
the safe context where KGDB finally removes the int3 instructions.
Maybe, this is useful.. at least it was a fun ride.

 arch/x86/kernel/kgdb.c    | 128 +++++++++++++++++++++++++++++++++-----
 include/linux/kgdb.h      |   2 +
 kernel/debug/debug_core.c |  12 ++++
 3 files changed, 128 insertions(+), 14 deletions(-)

diff --git a/arch/x86/kernel/kgdb.c b/arch/x86/kernel/kgdb.c
index 9c9faa1634fb..e09090f14894 100644
--- a/arch/x86/kernel/kgdb.c
+++ b/arch/x86/kernel/kgdb.c
@@ -35,6 +35,7 @@
 #include <linux/hw_breakpoint.h>
 #include <linux/uaccess.h>
 #include <linux/memory.h>
+#include <linux/execmem.h>
 
 #include <asm/text-patching.h>
 #include <asm/debugreg.h>
@@ -42,6 +43,11 @@
 #include <asm/apic.h>
 #include <asm/nmi.h>
 #include <asm/switch_to.h>
+#include <asm/insn.h>
+#include <asm/set_memory.h>
+
+static void *kgdb_trampoline_page;
+static void *kgdb_trampoline_page_curr_slot;
 
 struct dbg_reg_def_t dbg_reg_def[DBG_MAX_REG_NUM] =
 {
@@ -402,6 +408,60 @@ static void kgdb_disable_hw_debug(struct pt_regs *regs)
 	}
 }
 
+static int kgdb_init_trampolines(void)
+{
+	/* FIXME: We should reserve enough space for all breakpoints
+	   or make the trampoline table dynamic somehow.. */
+	/* FIXME: Currently borrowing EXECMEM_KPROBES */
+	kgdb_trampoline_page = execmem_alloc(EXECMEM_KPROBES, PAGE_SIZE);
+	if (!kgdb_trampoline_page)
+		return 1;
+	memset(kgdb_trampoline_page, INT3_INSN_OPCODE, PAGE_SIZE);
+	set_memory_rox((unsigned long)kgdb_trampoline_page, 1);
+	kgdb_trampoline_page_curr_slot = kgdb_trampoline_page;
+	return 0;
+}
+
+static int kgdb_make_trampoline(struct kgdb_bkpt *bpt, void *orig_insn)
+{
+	void *kernel_addr, *slot_addr, *jmp_addr, *jmp_code;
+	int slot_size;
+	struct insn insn;
+	u8 insn_buff[MAX_INSN_SIZE + JMP32_INSN_SIZE];
+
+	if (WARN_ON(insn_decode_kernel(&insn, orig_insn)))
+		return -EINVAL;
+
+	slot_size = insn.length + JMP32_INSN_SIZE;
+
+	if (!bpt->trampoline) {
+		/* FIXME: Not enough space for all possible breakpoints */
+		if (kgdb_trampoline_page_curr_slot + slot_size
+		    > kgdb_trampoline_page + PAGE_SIZE)
+			return -ENOSPC;
+
+		bpt->trampoline = kgdb_trampoline_page_curr_slot;
+		kgdb_trampoline_page_curr_slot += slot_size;
+	}
+
+	kernel_addr = (void *)bpt->bpt_addr;
+	slot_addr = bpt->trampoline;
+	jmp_addr = slot_addr + insn.length;
+	jmp_code = text_gen_insn(JMP32_INSN_OPCODE, jmp_addr,
+				 kernel_addr + insn.length);
+
+	memcpy(insn_buff, kernel_addr, insn.length);
+	memcpy(insn_buff + insn.length, jmp_code, JMP32_INSN_SIZE);
+	apply_relocation(insn_buff, slot_addr, insn.length,
+			 kernel_addr, insn.length);
+
+	if (mutex_is_locked(&text_mutex))
+		return -EBUSY;
+	text_poke_kgdb(slot_addr, insn_buff, insn.length + JMP32_INSN_SIZE);
+
+	return 0;
+}
+
 #ifdef CONFIG_SMP
 /**
  *	kgdb_roundup_cpus - Get other CPUs into a holding pattern
@@ -598,6 +658,10 @@ int kgdb_arch_init(void)
 {
 	int retval;
 
+	retval = kgdb_init_trampolines();
+	if (retval)
+		goto out;
+
 	retval = register_die_notifier(&kgdb_notifier);
 	if (retval)
 		goto out;
@@ -708,11 +772,18 @@ void kgdb_arch_exit(void)
  */
 int kgdb_skipexception(int exception, struct pt_regs *regs)
 {
-	if (exception == 3 && kgdb_isremovedbreak(regs->ip - 1)) {
-		regs->ip -= 1;
-		return 1;
+	struct kgdb_bkpt *bp;
+
+	if (exception != 3)
+		return false;
+
+	bp = kgdb_get_removedbreak(regs->ip - 1);
+	if (bp) {
+		regs->ip = (unsigned long)bp->trampoline;
+		return true;
 	}
-	return 0;
+
+	return false;
 }
 
 unsigned long kgdb_arch_pc(int exception, struct pt_regs *regs)
@@ -730,12 +801,33 @@ void kgdb_arch_set_pc(struct pt_regs *regs, unsigned long ip)
 int kgdb_arch_set_breakpoint(struct kgdb_bkpt *bpt)
 {
 	int err;
+	char orig_insn[MAX_INSN_SIZE];
 
 	bpt->type = BP_BREAKPOINT;
-	err = copy_from_kernel_nofault(bpt->saved_instr, (char *)bpt->bpt_addr,
-				BREAK_INSTR_SIZE);
+
+	/*
+	 * FIXME: Currently, debug traps are not removed, so all logically
+	 * removed breakpoints are still there.
+	 * For now, abort if the trampoline is already present.
+	 * Later, we should use a dedicated breakpoint state to signal this.
+	 */
+	if (bpt->trampoline) {
+		bpt->type = BP_POKE_BREAKPOINT;
+		return 0;
+	}
+
+	/* FIXME: What if we cannot read all of MAX_INSN_SIZE */
+	err = copy_from_kernel_nofault(orig_insn, (char *)bpt->bpt_addr,
+				       MAX_INSN_SIZE);
 	if (err)
 		return err;
+
+	memcpy(bpt->saved_instr, orig_insn, BREAK_INSTR_SIZE);
+
+	err = kgdb_make_trampoline(bpt, orig_insn);
+	if (err)
+		return err;
+
 	err = copy_to_kernel_nofault((char *)bpt->bpt_addr,
 				 arch_kgdb_ops.gdb_bpt_instr, BREAK_INSTR_SIZE);
 	if (!err)
@@ -755,16 +847,11 @@ int kgdb_arch_set_breakpoint(struct kgdb_bkpt *bpt)
 
 int kgdb_arch_remove_breakpoint(struct kgdb_bkpt *bpt)
 {
+	/* FIXME: Do not mess with early breakpoints for now */
 	if (bpt->type != BP_POKE_BREAKPOINT)
 		goto knl_write;
-	/*
-	 * It is safe to call text_poke_kgdb() because normal kernel execution
-	 * is stopped on all cores, so long as the text_mutex is not locked.
-	 */
-	if (mutex_is_locked(&text_mutex))
-		goto knl_write;
-	text_poke_kgdb((void *)bpt->bpt_addr, bpt->saved_instr,
-		       BREAK_INSTR_SIZE);
+
+	/* FIXME: Removal is not necessary anymore.. for now */
 	return 0;
 
 knl_write:
@@ -772,6 +859,19 @@ int kgdb_arch_remove_breakpoint(struct kgdb_bkpt *bpt)
 				  (char *)bpt->saved_instr, BREAK_INSTR_SIZE);
 }
 
+int kgdb_validate_break_address(unsigned long addr)
+{
+	if (kgdb_within_blocklist(addr))
+		return -EINVAL;
+
+	/*
+	 * With breakpoint trampolines, there is no need to further validate
+	 * setting and removal of breakpoints.
+	 */
+
+	return 0;
+}
+
 const struct kgdb_arch arch_kgdb_ops = {
 	/* Breakpoint instruction: */
 	.gdb_bpt_instr		= { 0xcc },
diff --git a/include/linux/kgdb.h b/include/linux/kgdb.h
index 76e891ee9e37..19c2d8ee8124 100644
--- a/include/linux/kgdb.h
+++ b/include/linux/kgdb.h
@@ -79,6 +79,7 @@ struct kgdb_bkpt {
 	unsigned char		saved_instr[BREAK_INSTR_SIZE];
 	enum kgdb_bptype	type;
 	enum kgdb_bpstate	state;
+	void			*trampoline;
 };
 
 struct dbg_reg_def_t {
@@ -324,6 +325,7 @@ extern int kgdb_hex2long(char **ptr, unsigned long *long_val);
 extern char *kgdb_mem2hex(char *mem, char *buf, int count);
 extern int kgdb_hex2mem(char *buf, char *mem, int count);
 
+extern struct kgdb_bkpt *kgdb_get_removedbreak(unsigned long addr);
 extern int kgdb_isremovedbreak(unsigned long addr);
 extern int kgdb_has_hit_break(unsigned long addr);
 
diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
index ce1bb2301c06..60bc63d1000a 100644
--- a/kernel/debug/debug_core.c
+++ b/kernel/debug/debug_core.c
@@ -393,6 +393,18 @@ int dbg_remove_sw_break(unsigned long addr)
 	return -ENOENT;
 }
 
+struct kgdb_bkpt *kgdb_get_removedbreak(unsigned long addr)
+{
+	int i;
+
+	for (i = 0; i < KGDB_MAX_BREAKPOINTS; i++) {
+		if ((kgdb_break[i].state == BP_REMOVED) &&
+		    (kgdb_break[i].bpt_addr == addr))
+			return &kgdb_break[i];
+	}
+	return NULL;
+}
+
 int kgdb_isremovedbreak(unsigned long addr)
 {
 	int i;
-- 
2.46.0



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
