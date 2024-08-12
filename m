Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B831394F604
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 12 Aug 2024 19:45:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1sdZ6q-0008Sy-Ir
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 12 Aug 2024 17:45:32 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <mail@florommel.de>) id 1sdZ6p-0008Sl-98
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 12 Aug 2024 17:45:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3PaCMr2PYVPqNUAyh3PaP3M6D5zxQw3SQSsHtgoyoYs=; b=hiEkfhYmGgutJZXgI2IpPyiK3e
 vhEBkpgaLlnjL+VXNM/B7u34deSMxiDRVMRetzn9nqdb6Vxqab2AuACbrwwl5FCFRXTHxZCdVXCQh
 FozkLFj0zwe+shhO93h3Bqz8+VbbOYjW/QoMHwbf6WTM4/Bji4kEbZ0xLONfhgObOZaY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3PaCMr2PYVPqNUAyh3PaP3M6D5zxQw3SQSsHtgoyoYs=; b=UlGRAbOCSR2RqgBkGI1LRMBrgU
 hSYYIRNgD6qpRCzJ4XCnvV+Vl9fSIQ+ZUhKOsEZ7TX5meCUiMAyvMxDLO2gRjtXBZjEBa6BPLwN6d
 wl0/t+0NvsbYan1/CvdKiMMCuVVBaLhO9oZPQRdtm74lHJkJ4iXUjWVDmzu5rpLVk6tg=;
Received: from read.uberspace.de ([185.26.156.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sdZ6o-0008H2-2n for kgdb-bugreport@lists.sourceforge.net;
 Mon, 12 Aug 2024 17:45:31 +0000
Received: (qmail 19575 invoked by uid 990); 12 Aug 2024 17:45:21 -0000
Authentication-Results: read.uberspace.de;
	auth=pass (plain)
Received: from unknown (HELO unkown) (::1)
 by read.uberspace.de (Haraka/3.0.1) with ESMTPSA;
 Mon, 12 Aug 2024 19:45:21 +0200
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
Date: Mon, 12 Aug 2024 19:43:36 +0200
Message-ID: <20240812174338.363838-2-mail@florommel.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240812174338.363838-1-mail@florommel.de>
References: <20240812174338.363838-1-mail@florommel.de>
MIME-Version: 1.0
X-Rspamd-Bar: ----
X-Rspamd-Report: REPLY(-4) SUSPICIOUS_RECIPS(1.5) MID_CONTAINS_FROM(1)
 MIME_GOOD(-0.1) BAYES_HAM(-2.999751) R_MISSING_CHARSET(0.5)
X-Rspamd-Score: -4.099751
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=florommel.de; s=uberspace; h=from:to:cc:subject:date;
 bh=8RV+PP8sYQd1tMJEbzZNDRlelpeGUX71LiVKe+Q840c=;
 b=SmC2XXRlE1cZrd+LZ9TdwYeiZCDUanumd9YD8C9amP0Zrn2hUOEX1NH1jT+2PxcTp4P8ptLpCt
 Ij4dsfkHLO5W3+MUp0P8+Tg1OLEE2FIIasA7R7XH/AmcYIMBarmk8CYSHqRUi8pctsWBSgugpkOE
 KMKVZiiZ9jXG2lNRvHoiRIDq8ACeaioisxL8x/EeXcRxsuKOGafRopZlLEdjOdc5KPQo0Cufu3xv
 Xo5M5W6iGmTPQ2o62QqgLICRdtw8ymFzDYt1dLwwxG/4X3ZQIq5aTaBi0ujCjK8XZwkqE/eEn+VS
 k950OJknORvBbwpeiwrX4vU5BKFYgxSwiLh3hgsyZKSiTFbH8DcKPLPiEeAqDxyS6xyGpwKrsUoD
 IuPWoSqkPw2smC2itKUm7YT/OqRwcs+hHGRw6ss5TzTpyepZuaOKBUf0JSxpKWysP/eb2vlhWHow
 20yQa4lDOhTDvGmczb9RiwRB/QIIGhl8koccWH4eM6D6E64g4SWEaMfSGJckuzRvcZhBUP6ZDaJj
 fqaNgE7CThokVoAnZkAYk8ixoAYbyMft3qQ4rAHAOq3B6uH27zgBfKIpMRMiksfFCAvVa192IYZ4
 Q4dyai0NlHP9Gpqw30Izf6y50jedikoqoo4TV4Z7QScwuZGF9vemGQqwkTprpk42KL2opjh0Ukk3
 U=
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
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
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [185.26.156.133 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1sdZ6o-0008H2-2n
Subject: [Kgdb-bugreport] [PATCH v2 1/2] x86/kgdb: convert early breakpoints
 to poke breakpoints
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
v2: Add missing stub implementation for kgdb_after_mark_readonly

A patch for this problem has already been proposed by Stefan Saecherl
and Lorena Kretzschmar [1].  Their solution is different from the one
I suggest here (it fixes the problem on removal, not "in advance").
Unfortunately, Lorena and Stefan's patch has not been accepted / the
conversation has fallen asleep.  One point of criticism concerned
possible problems with reused init code pages.  This should not be a
problem with my patch.
[1] https://lore.kernel.org/all/20201214141314.5717-1-stefan.saecherl@fau.de/

 arch/x86/kernel/kgdb.c    | 14 ++++++++++++++
 include/linux/kgdb.h      |  4 ++++
 init/main.c               |  1 +
 kernel/debug/debug_core.c |  7 ++++++-
 4 files changed, 25 insertions(+), 1 deletion(-)

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
index 76e891ee9e37..903bf833dca1 100644
--- a/include/linux/kgdb.h
+++ b/include/linux/kgdb.h
@@ -98,6 +98,8 @@ extern int dbg_set_reg(int regno, void *mem, struct pt_regs *regs);
 # define KGDB_MAX_BREAKPOINTS	1000
 #endif
 
+extern struct kgdb_bkpt kgdb_break[KGDB_MAX_BREAKPOINTS];
+
 #define KGDB_HW_BREAKPOINT	1
 
 /*
@@ -360,11 +362,13 @@ extern bool dbg_is_early;
 extern void __init dbg_late_init(void);
 extern void kgdb_panic(const char *msg);
 extern void kgdb_free_init_mem(void);
+extern void kgdb_after_mark_readonly(void);
 #else /* ! CONFIG_KGDB */
 #define in_dbg_master() (0)
 #define dbg_late_init()
 static inline void kgdb_panic(const char *msg) {}
 static inline void kgdb_free_init_mem(void) { }
+static inline void kgdb_after_mark_readonly(void) {}
 static inline int kgdb_nmicallback(int cpu, void *regs) { return 1; }
 #endif /* ! CONFIG_KGDB */
 #endif /* _KGDB_H_ */
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
