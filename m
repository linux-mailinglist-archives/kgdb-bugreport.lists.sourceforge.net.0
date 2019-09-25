Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 451EABE620
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 25 Sep 2019 22:08:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1iDDaZ-0000OH-2C
	for lists+kgdb-bugreport@lfdr.de; Wed, 25 Sep 2019 20:08:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1iDDaX-0000O1-Hb
 for kgdb-bugreport@lists.sourceforge.net; Wed, 25 Sep 2019 20:08:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YRt/eEJ29XhNKtyI1qPJ2Nb4RWiKnBfQoOt31k2/Z4s=; b=Lc3ZEGHfcWKFjq3ZreB4okAgBO
 L+T+o99rMw63pofiHDKAbllg8kURJtu79hllv94k2pMHBFfSBqmBpH2VWB68mUzoRQ+mo4ZQOoojh
 XSzxIfTKlgfH5Y1IsJRFrEv+5982ZV31AmTXm5c+eJQcTGaO34do+f0YCW8VXxYYk66E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YRt/eEJ29XhNKtyI1qPJ2Nb4RWiKnBfQoOt31k2/Z4s=; b=kOjkORXbopmtFIKh10MDw6kn1H
 i4QwrTTVBiFHev065FaqFVJLwCYCKGGCSYWUkysUWxbLVpI23iPmsSUDhJr9t7nhIpgTkrgYAIgSM
 VlU2X1riPHYSvrHILQgCB7jBPh+9Qj3F2JXt+5VZbepEyAUbdOAn3KAU35NZiEUYvnxg=;
Received: from mail-pf1-f193.google.com ([209.85.210.193])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iDDaW-006gYq-2K
 for kgdb-bugreport@lists.sourceforge.net; Wed, 25 Sep 2019 20:08:37 +0000
Received: by mail-pf1-f193.google.com with SMTP id q5so27588pfg.13
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 25 Sep 2019 13:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YRt/eEJ29XhNKtyI1qPJ2Nb4RWiKnBfQoOt31k2/Z4s=;
 b=mvymCA6AIlDSmZ98IG9iMxIgvZsncwKTDeN77JJWZZHOAshG9W85FTpVLwDDadzYQI
 zcZ3NeUXHTFlxGv5z2kxk5S/U91yYigT/8nlgfxWpkoR01v9I0RfGbOXYoX+NATtdPd7
 wZb5MNKvn0Bluq6+BasmMQUShLZkQQw+NdZQE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YRt/eEJ29XhNKtyI1qPJ2Nb4RWiKnBfQoOt31k2/Z4s=;
 b=OvJfL9f6eou+JTzwJF7h/scdTvchHhdpptai/+UDY6k5SGdAhnJlzWh7omY2S2IgOh
 fQP/qnwUeb96s2Kh3Wq5ZAVD/C+vrVE3LHhftIsOhgffB7Xnw3FyUk8WF1BL7QELykFn
 m9UYE13ZHwGNTSHmzX3zgVQ3Il8vmL4pi7dbzmAbqoeu8k81e8fI1zmAphkVZgpegQuQ
 TJXoEY8HwGFVI3GI6DarFVeMh8TsZM9Z32brqrgsvXn5XzO+XGVDT74WcbH/Ef47cOL+
 x8KByfFibRdTJZbEEyo6F5Zwd//wnGNYkxGPHl3BuBrHM/XZ8mt9gkPrULLJI04s0Qxc
 yFFA==
X-Gm-Message-State: APjAAAVa1M2SBCBg8sQrDJ4VjzyTDhh8WHMoHJJduUg673ztRsT9Or/P
 9RIi+06LH1xoxuAnyFjd6zxY3O6jUqY=
X-Google-Smtp-Source: APXvYqwHCU7VIXvdQR2iZggvDKwvnxx7yxqiC1zNImVIOaOqVwGEcVg+tDTfBUR2WryxgLvIrKYP4g==
X-Received: by 2002:a62:583:: with SMTP id 125mr338507pff.69.1569441773971;
 Wed, 25 Sep 2019 13:02:53 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id d76sm458113pga.80.2019.09.25.13.02.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2019 13:02:53 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 Daniel Thompson <daniel.thompson@linaro.org>
Date: Wed, 25 Sep 2019 13:02:20 -0700
Message-Id: <20190925125811.v3.4.I2cbda6675dcce5ec366e3436bb964b3ab22a4309@changeid>
X-Mailer: git-send-email 2.23.0.351.gc4317032e6-goog
In-Reply-To: <20190925200220.157670-1-dianders@chromium.org>
References: <20190925200220.157670-1-dianders@chromium.org>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.193 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.193 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1iDDaW-006gYq-2K
Subject: [Kgdb-bugreport] [PATCH v3 4/4] kdb: Fix stack crawling on
 'running' CPUs that aren't the master
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

Changes in v3:
- Use exception state instead of new dbg_slave_dumpstack_cpu var.
- Move horror to debug core, cleaning up control flow.
- Avoid need for timeout by only waiting for CPUs marked as slaves.

Changes in v2:
- Totally new approach; now arch agnostic.

 kernel/debug/debug_core.c | 34 ++++++++++++++++++++++++++++++++++
 kernel/debug/debug_core.h |  2 ++
 kernel/debug/kdb/kdb_bt.c | 19 +++++++------------
 3 files changed, 43 insertions(+), 12 deletions(-)

diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
index 10f1187b3907..5456e09d9354 100644
--- a/kernel/debug/debug_core.c
+++ b/kernel/debug/debug_core.c
@@ -441,6 +441,37 @@ int dbg_remove_all_break(void)
 	return 0;
 }
 
+#ifdef CONFIG_KGDB_KDB
+void kdb_dump_stack_on_cpu(int cpu)
+{
+	if (cpu == raw_smp_processor_id()) {
+		dump_stack();
+		return;
+	}
+
+	if (!(kgdb_info[cpu].exception_state & DCPU_IS_SLAVE)) {
+		kdb_printf("ERROR: Task on cpu %d didn't stop in the debugger\n",
+			   cpu);
+		return;
+	}
+
+	/*
+	 * In general, architectures don't support dumping the stack of a
+	 * "running" process that's not the current one.  From the point of
+	 * view of the Linux, kernel processes that are looping in the kgdb
+	 * slave loop are still "running".  There's also no API (that actually
+	 * works across all architectures) that can do a stack crawl based
+	 * on registers passed as a parameter.
+	 *
+	 * Solve this conundrum by asking slave CPUs to do the backtrace
+	 * themselves.
+	 */
+	kgdb_info[cpu].exception_state |= DCPU_WANT_BT;
+	while (kgdb_info[cpu].exception_state & DCPU_WANT_BT)
+		cpu_relax();
+}
+#endif
+
 /*
  * Return true if there is a valid kgdb I/O module.  Also if no
  * debugger is attached a message can be printed to the console about
@@ -580,6 +611,9 @@ static int kgdb_cpu_enter(struct kgdb_state *ks, struct pt_regs *regs,
 				atomic_xchg(&kgdb_active, cpu);
 				break;
 			}
+		} else if (kgdb_info[cpu].exception_state & DCPU_WANT_BT) {
+			dump_stack();
+			kgdb_info[cpu].exception_state &= ~DCPU_WANT_BT;
 		} else if (kgdb_info[cpu].exception_state & DCPU_IS_SLAVE) {
 			if (!raw_spin_is_locked(&dbg_slave_lock))
 				goto return_normal;
diff --git a/kernel/debug/debug_core.h b/kernel/debug/debug_core.h
index 804b0fe5a0ba..cd22b5f68831 100644
--- a/kernel/debug/debug_core.h
+++ b/kernel/debug/debug_core.h
@@ -33,6 +33,7 @@ struct kgdb_state {
 #define DCPU_WANT_MASTER 0x1 /* Waiting to become a master kgdb cpu */
 #define DCPU_NEXT_MASTER 0x2 /* Transition from one master cpu to another */
 #define DCPU_IS_SLAVE    0x4 /* Slave cpu enter exception */
+#define DCPU_WANT_BT     0x8 /* Slave cpu should backtrace then clear flag */
 
 struct debuggerinfo_struct {
 	void			*debuggerinfo;
@@ -75,6 +76,7 @@ extern int kdb_stub(struct kgdb_state *ks);
 extern int kdb_parse(const char *cmdstr);
 extern int kdb_common_init_state(struct kgdb_state *ks);
 extern int kdb_common_deinit_state(void);
+extern void kdb_dump_stack_on_cpu(int cpu);
 #else /* ! CONFIG_KGDB_KDB */
 static inline int kdb_stub(struct kgdb_state *ks)
 {
diff --git a/kernel/debug/kdb/kdb_bt.c b/kernel/debug/kdb/kdb_bt.c
index d9af139f9a31..0e94efe07b72 100644
--- a/kernel/debug/kdb/kdb_bt.c
+++ b/kernel/debug/kdb/kdb_bt.c
@@ -22,20 +22,15 @@
 static void kdb_show_stack(struct task_struct *p, void *addr)
 {
 	int old_lvl = console_loglevel;
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
-	} else {
-		show_stack(p, NULL);
-	}
+
+	if (!addr && kdb_task_has_cpu(p))
+		kdb_dump_stack_on_cpu(kdb_process_cpu(p));
+	else
+		show_stack(p, addr);
+
 	console_loglevel = old_lvl;
 	kdb_trap_printk--;
 }
-- 
2.23.0.351.gc4317032e6-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
