Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7D17CC17
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 31 Jul 2019 20:38:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1hstUJ-0000Vr-N9
	for lists+kgdb-bugreport@lfdr.de; Wed, 31 Jul 2019 18:38:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1hstUI-0000Vh-FO
 for kgdb-bugreport@lists.sourceforge.net; Wed, 31 Jul 2019 18:38:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zjtC8sWjZNJx0P6yMG+1aWsfMer3nnMRaqwuNWwAHUA=; b=BhBxzSQtq4ST8z1HWBVFp8jt3l
 sSTcziTyN0JMm6oUG4iQ1TKjMeqrNPm6HOW/ayI0GWhKC3L4eK2yWsNzzKQOyvNXS+bhj+SR0oHcx
 pSgKZb5iqRyCqxC+YXL6sL2v2iwW45lNLBZ/eQNqei1fM1Cvj6FDcHXmMu7T6RjhZBOw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=zjtC8sWjZNJx0P6yMG+1aWsfMer3nnMRaqwuNWwAHUA=; b=R
 Zke2coEOw0uFAd8nV4OuSIH+Su8A6xrU6hkzDgDX6/epXNRhC4TaeOEkxNuIccGnf1dY1C4GWQOga
 gp4FsGbuRB3T8kbw/HsJuMWNRjqP1dJiM3DIdl8kMtJiHvLQ6mMa2K3soVkFH8Ko4Xmw5yURQff70
 dIKOT+HMM+8FwJHs=;
Received: from mail-pg1-f194.google.com ([209.85.215.194])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hstUF-003pAZ-09
 for kgdb-bugreport@lists.sourceforge.net; Wed, 31 Jul 2019 18:38:10 +0000
Received: by mail-pg1-f194.google.com with SMTP id s1so26180372pgr.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 31 Jul 2019 11:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zjtC8sWjZNJx0P6yMG+1aWsfMer3nnMRaqwuNWwAHUA=;
 b=W6r6NVsSM3sfuwYaY4kLS85qQNfzYFtMTI130jGDvP1R+VuOuUwQtF64QwOqDNzNEt
 +DuF4HJThWpun+jqGczik3D9VNSKQCBCESg+3xiq8E8J1ZB2EhQaOgtof/TD83ybsb8D
 JqLs+CG/oEYkAQUr1z4npXyg6V7qU7Ftr6UBs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zjtC8sWjZNJx0P6yMG+1aWsfMer3nnMRaqwuNWwAHUA=;
 b=ovoyAagD3kA0Y/i/e0i1KqNgoOFelFWoQXJwnm8aX0l4jqPK1EeB2ZQIDRdasAW0+W
 CZVLj9Q47o0vZx9zesdywex4tINifeQpeeM8CCSn24AYFK5tpWoqGLLQ17/QCeVAfSBI
 X4RFA1HdLm3tmo7rbRmesXomc//gPCB1mEbeq9Nup8f8qswUMX+TW29NcAz95VpLwP5X
 DPAGAg8xcO7RpSauM6uFzvVHLv5df0d4dHmLtitFm+Ay2LnrN/+jEp0JWtI6NFE4NONU
 HXnYXDzac8SoyhkLGGLVWovE1XTOhz7QQLLvzAT4RUEBnHg1tOC6l5jjVn8eu3lrJ//a
 iFQA==
X-Gm-Message-State: APjAAAUziKXOi4qH0y+Xal5aKNId3opPCMdA3kawBdZpaIeBc1zXRg5+
 nya9gdV0pDxpR7pq96/NCwehsg==
X-Google-Smtp-Source: APXvYqz2lOY5ye/a8/v4SX9s061hy4NQdE6wREGK6sZ1cqPFLmnEgkpDzKvR/YCGdE18IDSL0nneVg==
X-Received: by 2002:aa7:8007:: with SMTP id j7mr48381112pfi.154.1564598281165; 
 Wed, 31 Jul 2019 11:38:01 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id u69sm91315929pgu.77.2019.07.31.11.38.00
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 31 Jul 2019 11:38:00 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 Daniel Thompson <daniel.thompson@linaro.org>
Date: Wed, 31 Jul 2019 11:37:32 -0700
Message-Id: <20190731183732.178134-1-dianders@chromium.org>
X-Mailer: git-send-email 2.22.0.770.g0f2c4a37fd-goog
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.194 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.194 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1hstUF-003pAZ-09
Subject: [Kgdb-bugreport] [PATCH v2] kdb: Fix stack crawling on 'running'
 CPUs that aren't the master
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

In kdb when you do 'btc' (back trace on CPU) it doesn't necessarily
give you the right info.  Specifically on many architectures
(including arm64, where I tested) you can't dump the stack of a
"running" process that isn't the process running on the current CPU.
This can be seen by this:

 echo SOFTLOCKUP > /sys/kernel/debug/provoke-crash/DIRECT
 # wait 2 seconds
 <sysrq>g

Here's what I see now on rk3399-gru-kevin.  I see the stack crawl for
the CPU that handled the sysrq but everything else just shows me stuck
in __switch_to() which is bogus:

======

[0]kdb> btc
btc: cpu status: Currently on cpu 0
Available cpus: 0, 1-3(I), 4, 5(I)
Stack traceback for pid 0
0xffffff801101a9c0        0        0  1    0   R  0xffffff801101b3b0 *swapper/0
Call trace:
 dump_backtrace+0x0/0x138
 ...
 kgdb_compiled_brk_fn+0x34/0x44
 ...
 sysrq_handle_dbg+0x34/0x5c
Stack traceback for pid 0
0xffffffc0f175a040        0        0  1    1   I  0xffffffc0f175aa30  swapper/1
Call trace:
 __switch_to+0x1e4/0x240
 0xffffffc0f65616c0
Stack traceback for pid 0
0xffffffc0f175d040        0        0  1    2   I  0xffffffc0f175da30  swapper/2
Call trace:
 __switch_to+0x1e4/0x240
 0xffffffc0f65806c0
Stack traceback for pid 0
0xffffffc0f175b040        0        0  1    3   I  0xffffffc0f175ba30  swapper/3
Call trace:
 __switch_to+0x1e4/0x240
 0xffffffc0f659f6c0
Stack traceback for pid 1474
0xffffffc0dde8b040     1474      727  1    4   R  0xffffffc0dde8ba30  bash
Call trace:
 __switch_to+0x1e4/0x240
 __schedule+0x464/0x618
 0xffffffc0dde8b040
Stack traceback for pid 0
0xffffffc0f17b0040        0        0  1    5   I  0xffffffc0f17b0a30  swapper/5
Call trace:
 __switch_to+0x1e4/0x240
 0xffffffc0f65dd6c0

===

The problem is that 'btc' eventually boils down to
  show_stack(task_struct, NULL);

...and show_stack() doesn't work for "running" CPUs because their
registers haven't been stashed.

On x86 things might work better (I haven't tested) because kdb has a
special case for x86 in kdb_show_stack() where it passes the stack
pointer to show_stack().  This wouldn't work on arm64 where the stack
crawling function seems needs the "fp" and "pc", not the "sp" which is
presumably why arm64's show_stack() function totally ignores the "sp"
parameter.

NOTE: we _can_ get a good stack dump for all the cpus if we manually
switch each one to the kdb master and do a back trace.  AKA:
  cpu 4
  bt
...will give the expected trace.  That's because now arm64's
dump_backtrace will now see that "tsk == current" and go through a
different path.

In this patch I fix the problems by catching a request to stack crawl
a task that's running on a CPU and then I ask that CPU to do the stack
crawl.

NOTE: this will (presumably) change what stack crawls are printed for
x86 machines.  Now kdb functions will show up in the stack crawl.
Presumably this is OK but if it's not we can go back and add a special
case for x86 again.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- Totally new approach; now arch agnostic.

 kernel/debug/debug_core.c |  5 +++++
 kernel/debug/debug_core.h |  1 +
 kernel/debug/kdb/kdb_bt.c | 44 ++++++++++++++++++++++++++++++---------
 3 files changed, 40 insertions(+), 10 deletions(-)

diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
index 5cc608de6883..a89c72714fe6 100644
--- a/kernel/debug/debug_core.c
+++ b/kernel/debug/debug_core.c
@@ -92,6 +92,8 @@ static int kgdb_use_con;
 bool dbg_is_early = true;
 /* Next cpu to become the master debug core */
 int dbg_switch_cpu;
+/* cpu number of slave we request a stack crawl of */
+int dbg_slave_dumpstack_cpu = -1;
 
 /* Use kdb or gdbserver mode */
 int dbg_kdb_mode = 1;
@@ -580,6 +582,9 @@ static int kgdb_cpu_enter(struct kgdb_state *ks, struct pt_regs *regs,
 				atomic_xchg(&kgdb_active, cpu);
 				break;
 			}
+		} else if (dbg_slave_dumpstack_cpu == cpu) {
+			dump_stack();
+			dbg_slave_dumpstack_cpu = -1;
 		} else if (kgdb_info[cpu].exception_state & DCPU_IS_SLAVE) {
 			if (!raw_spin_is_locked(&dbg_slave_lock))
 				goto return_normal;
diff --git a/kernel/debug/debug_core.h b/kernel/debug/debug_core.h
index b4a7c326d546..dca74d5caef2 100644
--- a/kernel/debug/debug_core.h
+++ b/kernel/debug/debug_core.h
@@ -62,6 +62,7 @@ extern int dbg_io_get_char(void);
 /* Switch from one cpu to another */
 #define DBG_SWITCH_CPU_EVENT -123456
 extern int dbg_switch_cpu;
+extern int dbg_slave_dumpstack_cpu;
 
 /* gdbstub interface functions */
 extern int gdb_serial_stub(struct kgdb_state *ks);
diff --git a/kernel/debug/kdb/kdb_bt.c b/kernel/debug/kdb/kdb_bt.c
index 7e2379aa0a1e..10095ae05826 100644
--- a/kernel/debug/kdb/kdb_bt.c
+++ b/kernel/debug/kdb/kdb_bt.c
@@ -10,6 +10,7 @@
  */
 
 #include <linux/ctype.h>
+#include <linux/delay.h>
 #include <linux/string.h>
 #include <linux/kernel.h>
 #include <linux/sched/signal.h>
@@ -22,20 +23,43 @@
 static void kdb_show_stack(struct task_struct *p, void *addr)
 {
 	int old_lvl = console_loglevel;
+	int time_left;
+	int cpu;
+
 	console_loglevel = CONSOLE_LOGLEVEL_MOTORMOUTH;
 	kdb_trap_printk++;
-	kdb_set_current_task(p);
-	if (addr) {
-		show_stack((struct task_struct *)p, addr);
-	} else if (kdb_current_regs) {
-#ifdef CONFIG_X86
-		show_stack(p, &kdb_current_regs->sp);
-#else
-		show_stack(p, NULL);
-#endif
+
+	if (!addr && kdb_task_has_cpu(p)) {
+		cpu = kdb_process_cpu(p);
+
+		if (cpu == raw_smp_processor_id()) {
+			dump_stack();
+			goto exit;
+		}
+
+		/*
+		 * In general architectures don't support dumping the stack
+		 * of a "running" process that's not the current one so if
+		 * we want to dump the stack of a running process that's not
+		 * the master then we'll set a global letting the slave
+		 * (which should be looping) know to dump its own stack.
+		 */
+		dbg_slave_dumpstack_cpu = cpu;
+		for (time_left = MSEC_PER_SEC; time_left; time_left--) {
+			udelay(1000);
+			if (dbg_slave_dumpstack_cpu == -1)
+				break;
+		}
+		if (dbg_slave_dumpstack_cpu != -1) {
+			kdb_printf("ERROR: Timeout dumping CPU %d stack\n",
+				   cpu);
+			dbg_slave_dumpstack_cpu = -1;
+		}
 	} else {
-		show_stack(p, NULL);
+		show_stack(p, addr);
 	}
+
+exit:
 	console_loglevel = old_lvl;
 	kdb_trap_printk--;
 }
-- 
2.22.0.770.g0f2c4a37fd-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
