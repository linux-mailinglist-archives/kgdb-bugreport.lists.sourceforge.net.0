Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1B694E8F7
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 12 Aug 2024 10:54:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1sdQom-0002VV-3L
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 12 Aug 2024 08:54:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <mail@florommel.de>) id 1sdIJo-0007po-Pe
 for kgdb-bugreport@lists.sourceforge.net;
 Sun, 11 Aug 2024 23:49:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bmUXI3m8yk2GbTtcmqUXxcUnvLlJuHBCYNaAlXAIZmE=; b=HOasHvkPIZ7Y9JF7+TxZwM5Fwe
 u9IEBW48ZrQVPn4Rs/ofuDISfvpOZU914lJJ/i/U9Wfqe4sCergqR2YWtFn23SSYp3J0tjsVuOr+0
 EJ5O0nEBxUNQdd+dRcxd/atzDX8j0WXpPqpyBAbOO3FLYVJOswBArUpEGOZztjE9nqVo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bmUXI3m8yk2GbTtcmqUXxcUnvLlJuHBCYNaAlXAIZmE=; b=fauxtEN6IHcTZgFalgKHptlmtH
 HlgBwbqHLBLx10w0aJtBjdO7QCulTyMX3Y6GlD0XSPsGyXdWGjOAWYawWh2zDsn1vtCH6QFsVJV6b
 PRpLOXtsuXuGgutoNYM/IjtKdFu+f96U86kV0veOREDlVm4QmadA6HahQJImqfr5Tc80=;
Received: from read.uberspace.de ([185.26.156.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sdIJm-0007F8-VE for kgdb-bugreport@lists.sourceforge.net;
 Sun, 11 Aug 2024 23:49:48 +0000
Received: (qmail 9061 invoked by uid 990); 11 Aug 2024 23:22:54 -0000
Authentication-Results: read.uberspace.de;
	auth=pass (plain)
Received: from unknown (HELO unkown) (::1)
 by read.uberspace.de (Haraka/3.0.1) with ESMTPSA;
 Mon, 12 Aug 2024 01:22:54 +0200
From: Florian Rommel <mail@florommel.de>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H . Peter Anvin" <hpa@zytor.com>,
 Jason Wessel <jason.wessel@windriver.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 Lorena Kretzschmar <qy15sije@cip.cs.fau.de>,
 Stefan Saecherl <stefan.saecherl@fau.de>,
 Peter Zijlstra <peterz@infradead.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Randy Dunlap <rdunlap@infradead.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 kgdb-bugreport@lists.sourceforge.net, x86@kernel.org,
 linux-kernel@vger.kernel.org
Date: Mon, 12 Aug 2024 01:22:07 +0200
Message-ID: <20240811232208.234261-2-mail@florommel.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240811232208.234261-1-mail@florommel.de>
References: <20240811232208.234261-1-mail@florommel.de>
MIME-Version: 1.0
X-Rspamd-Bar: ----
X-Rspamd-Report: REPLY(-4) SUSPICIOUS_RECIPS(1.5) MID_CONTAINS_FROM(1)
 MIME_GOOD(-0.1) BAYES_HAM(-2.999844) R_MISSING_CHARSET(0.5)
X-Rspamd-Score: -4.099844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=florommel.de; s=uberspace; h=from:to:cc:subject:date;
 bh=38KwpPi1+krdaAaOQLyfVYfixCNAVPls5Br2PNVF+HA=;
 b=v5FoRuiJxqJNSvjLIq8pQWukOpRs4IAkkhdvEjSJy3z3k55rr+fZGadcyRfo0f3PHouo50SrxL
 r4cCknCxCHfeLA5/T5/aetabNgUvURg8PUmKXCdZTjsEv9q/39GIBfMi0h99/QCV+ZRHqfLC6NY5
 IG1IALNUbvA8GG6g1G5Cq9BvSLvwJbFmXLKVaWrNph931tKbM1S7KFvK3v67hthnHg2DodR0KR/F
 lwyDmv2QEeZaL3O9BYKScJYRq/009ZPpK782pz4G/XAT005pTEzos6RCnA14CEjap9OhDFBixfYu
 l7UCFiP08a8dTt8vbpYIyFs2ViexWtxaHMUbnF+sbm1Bpx4XNq77VRkj2iXBrevAggI+rGpsbXgI
 RCNonZMrZi4hSofKZvlPJnwgLwEWgtL1RxwwhGbZ0nhS0x/HwrUeAbCGRtjO6mrz3MCd6hY7Y59j
 rFXKRehUVk7Tc4U+Z+d4B8RlD7DOabH1qvvdpYrKFZPddKCCNdsSD5MeDi8/3VdIkAf+wFEp/GdW
 dARDuoBgnqnHWUDoPbRmFF5f5y+xbj6R2gs89ReVUZk6TrsbUJjeTcA10iKEoxPDEG9h4FB9Bwtb
 x909/13uj+ppKzDqFN08XduTu0zfO+eX43uo1bFvYW2cI7LQTY0Kcgns3TESSr9aMLtA2aQbdwWs
 8=
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On x86, after booting, the kernel text is read-only. Then,
 KGDB has to use the text_poke mechanism to install software breakpoints.
 KGDB uses a special (x86-specific) breakpoint type for these kinds o [...]
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: florommel.de]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1sdIJm-0007F8-VE
X-Mailman-Approved-At: Mon, 12 Aug 2024 08:54:17 +0000
Subject: [Kgdb-bugreport] [PATCH 1/2] x86/kgdb: convert early breakpoints to
 poke breakpoints
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
Cc: Florian Rommel <mail@florommel.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On x86, after booting, the kernel text is read-only.  Then, KGDB has to
use the text_poke mechanism to install software breakpoints.  KGDB
uses a special (x86-specific) breakpoint type for these kinds of
breakpoints (BP_POKE_BREAKPOINT).  When removing a breakpoint, KGDB
always adheres to the breakpoint's original installment method, which is
determined by its type.

Before this fix, early (non-"poke") breakpoints could not be removed
after the kernel text was set as read-only since the original code
patching mechanism was no longer allowed to remove the breakpoints.
Eventually, this even caused the kernel to hang (loop between int3
instruction and the function kgdb_skipexception).

With this patch, we convert early breakpoints to "poke" breakpoints
after the kernel text has been made read-only.  This makes them
removable later.

Signed-off-by: Florian Rommel <mail@florommel.de>
---
A patch for this problem has already been proposed by Stefan Saecherl
and Lorena Kretzschmar [1].  Their solution is different from the one
I suggest here (it fixes the problem on removal, not "in advance").
Unfortunately, Lorena and Stefan's patch has not been accepted / the
conversation has fallen asleep.  One point of criticism concerned
possible problems with reused init code pages.  This should not be a
problem with my patch.
[1] https://lore.kernel.org/all/20201214141314.5717-1-stefan.saecherl@fau.de/

 arch/x86/kernel/kgdb.c    | 14 ++++++++++++++
 include/linux/kgdb.h      |  3 +++
 init/main.c               |  1 +
 kernel/debug/debug_core.c |  7 ++++++-
 4 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kernel/kgdb.c b/arch/x86/kernel/kgdb.c
index 9c9faa1634fb..64c332151af7 100644
--- a/arch/x86/kernel/kgdb.c
+++ b/arch/x86/kernel/kgdb.c
@@ -623,6 +623,20 @@ int kgdb_arch_init(void)
 	return retval;
 }
 
+void kgdb_after_mark_readonly(void)
+{
+	int i;
+
+	/* Convert all breakpoints in rodata to BP_POKE_BREAKPOINT. */
+	for (i = 0; i < KGDB_MAX_BREAKPOINTS; i++) {
+		if (kgdb_break[i].state != BP_UNDEFINED &&
+		    kgdb_break[i].type == BP_BREAKPOINT &&
+		    is_kernel_text(kgdb_break[i].bpt_addr)) {
+			kgdb_break[i].type = BP_POKE_BREAKPOINT;
+		}
+	}
+}
+
 static void kgdb_hw_overflow_handler(struct perf_event *event,
 		struct perf_sample_data *data, struct pt_regs *regs)
 {
diff --git a/include/linux/kgdb.h b/include/linux/kgdb.h
index 76e891ee9e37..c07855d388b5 100644
--- a/include/linux/kgdb.h
+++ b/include/linux/kgdb.h
@@ -98,6 +98,8 @@ extern int dbg_set_reg(int regno, void *mem, struct pt_regs *regs);
 # define KGDB_MAX_BREAKPOINTS	1000
 #endif
 
+extern struct kgdb_bkpt kgdb_break[KGDB_MAX_BREAKPOINTS];
+
 #define KGDB_HW_BREAKPOINT	1
 
 /*
@@ -360,6 +362,7 @@ extern bool dbg_is_early;
 extern void __init dbg_late_init(void);
 extern void kgdb_panic(const char *msg);
 extern void kgdb_free_init_mem(void);
+extern void kgdb_after_mark_readonly(void);
 #else /* ! CONFIG_KGDB */
 #define in_dbg_master() (0)
 #define dbg_late_init()
diff --git a/init/main.c b/init/main.c
index 206acdde51f5..33b6e092fed3 100644
--- a/init/main.c
+++ b/init/main.c
@@ -1441,6 +1441,7 @@ static void mark_readonly(void)
 		mark_rodata_ro();
 		debug_checkwx();
 		rodata_test();
+		kgdb_after_mark_readonly();
 	} else if (IS_ENABLED(CONFIG_STRICT_KERNEL_RWX)) {
 		pr_info("Kernel memory protection disabled.\n");
 	} else if (IS_ENABLED(CONFIG_ARCH_HAS_STRICT_KERNEL_RWX)) {
diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
index ce1bb2301c06..9dd6b69f1679 100644
--- a/kernel/debug/debug_core.c
+++ b/kernel/debug/debug_core.c
@@ -98,7 +98,7 @@ module_param(kgdbreboot, int, 0644);
  * Holds information about breakpoints in a kernel. These breakpoints are
  * added and removed by gdb.
  */
-static struct kgdb_bkpt		kgdb_break[KGDB_MAX_BREAKPOINTS] = {
+struct kgdb_bkpt		kgdb_break[KGDB_MAX_BREAKPOINTS] = {
 	[0 ... KGDB_MAX_BREAKPOINTS-1] = { .state = BP_UNDEFINED }
 };
 
@@ -452,6 +452,11 @@ void kgdb_free_init_mem(void)
 	}
 }
 
+void __weak kgdb_after_mark_readonly(void)
+{
+	/* Weak implementation, may be overridden by arch code */
+}
+
 #ifdef CONFIG_KGDB_KDB
 void kdb_dump_stack_on_cpu(int cpu)
 {
-- 
2.46.0



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
