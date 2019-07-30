Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B06B7B597
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 31 Jul 2019 00:18:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1hsaRz-0006TU-Np
	for lists+kgdb-bugreport@lfdr.de; Tue, 30 Jul 2019 22:18:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1hsaRx-0006TD-Nx
 for kgdb-bugreport@lists.sourceforge.net; Tue, 30 Jul 2019 22:18:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sxiBOB7zsr4sYYglcbcr65xES486R1b5ubVrYLCx9MI=; b=YPY9Ctbqc29dgDtwht9VLwV5JO
 uoETG52N0evdDfbjKEYZA+lOhJDsF1vVBSjGckK+DgWEdP5D8Hxvhg3kjzRod4lL8d6yjrtpslOeg
 BYeQbIcAUtO2cta5hcqqKFmQNlFyBvWIq5OhSLhDsFgfV3GL2hnQe8eksWbxHrpgZFkA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=sxiBOB7zsr4sYYglcbcr65xES486R1b5ubVrYLCx9MI=; b=j
 K7lhbf5qFZ2fGNpoUsimqzOf5uy+H/KW16T7i3kjBZ27m9UV+E0o0Lo68ehFb80UK/LFKTpjuj4MY
 7tejrNS+e9rpcl6NHouGuPp5pb65TpmEsMOcPD6RLmHqtTk6b5vkNzvVVz+MaF322JKn4Zqjwxxu6
 w13PGVkwkvblrRjs=;
Received: from mail-pf1-f196.google.com ([209.85.210.196])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hsaRw-001eD8-4S
 for kgdb-bugreport@lists.sourceforge.net; Tue, 30 Jul 2019 22:18:29 +0000
Received: by mail-pf1-f196.google.com with SMTP id u14so30580401pfn.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 30 Jul 2019 15:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sxiBOB7zsr4sYYglcbcr65xES486R1b5ubVrYLCx9MI=;
 b=cuH0cvj7FQ+GpEQKL8ugXdx3wyPTXJSpKN9VZSQy/NOZUhCpj/MnEoPIYQWDumfepk
 SXkr29or2GlRyB6D4kGxSM5fqCA0aYmYiF/zHTR6cQuZg5AWtLGfuH6/GuQcHnzL+LZq
 eG4FGz9exx6D+FI7ZOtIl1H9t+gUwZ+JC/XcU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sxiBOB7zsr4sYYglcbcr65xES486R1b5ubVrYLCx9MI=;
 b=uidvt7NEC2+wY7QBKuN3V1U/riDNH3Z36UJugAh9h0gtSh3CPoMC4I5hb1tyis8aZ2
 N4AUEkznExVEB4UTNlWqdatFRPOoklqiVyJMsE9OpQdbErBQtZMBomdL6M96VYqLJELY
 +65ejZ1YkgvSL+M/vPH/LboMrkvvqmrgridKic/car+/Hv5n8ukjaAIetSEh6wlev+vq
 DmiXvgCu36HBnCvPOe6+VvJTH6IKyq8aVx/puLjrWEjwdlrRXNO32o8i8oi9V6/E73Yh
 PQxEqqp7S6qEcRrVxYt3WkuBIlFfO76KqygIndJX13zuqy06dud+b8846Fx2gnrn7LnB
 5tpg==
X-Gm-Message-State: APjAAAXTrU+HCL24jVQjAyZKJ5lsrlZ4ZjFZ/iEMElGfABXzNpJFQ/wP
 s0ioAlM1wTe619+jBD+JpTWhWw==
X-Google-Smtp-Source: APXvYqwqDLmwcsVdJQqAK5+voPBrSQMRxT/BTbm6YQUKW/crdO6p9v7vxNjvrFFCLR1wwUrOngXA+g==
X-Received: by 2002:a63:dd16:: with SMTP id t22mr79512317pgg.140.1564525102190; 
 Tue, 30 Jul 2019 15:18:22 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id u7sm58455696pfm.96.2019.07.30.15.18.21
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 30 Jul 2019 15:18:21 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 Daniel Thompson <daniel.thompson@linaro.org>
Date: Tue, 30 Jul 2019 15:18:00 -0700
Message-Id: <20190730221800.28326-1-dianders@chromium.org>
X-Mailer: git-send-email 2.22.0.709.g102302147b-goog
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.196 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.196 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1hsaRw-001eD8-4S
Subject: [Kgdb-bugreport] [PATCH] arm64: debug: Make 'btc' and similar work
 in kdb
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
 Mark Rutland <mark.rutland@arm.com>, kgdb-bugreport@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

In kdb when you do 'btc' (back trace on CPU) it doesn't give you the
right info.  This can be seen by this:

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

In this patch I fix the problems by stashing the "pt_regs" into the
"cpu_context" when a CPU enters the debugger.  Now all the normal stack
crawling code will be able to find it.  This is possible because:
* When a task is "running" nobody else is using the "cpu_context"
* The task isn't really "running" (it's in the debugger) so there are
  actually some sane registers to save.

This patch works without any extra kgdb API changes by just
implementing the weak kgdb_call_nmi_hook().  I don't try to address
the existing caveat in kgdb_call_nmi_hook() around pt_regs, so I copy
the comment from the generic code.

After this patch the same test shows much more sane stack crawls.  The
idle tasks now show:

Stack traceback for pid 0
0xffffffc0f175b040        0        0  1    3   I  0xffffffc0f175ba30  swapper/3
Call trace:
 cpuidle_enter_state+0x284/0x428
 cpuidle_enter+0x38/0x4c
 do_idle+0x168/0x29c
 cpu_startup_entry+0x24/0x28
 secondary_start_kernel+0x140/0x14c

...and the locked task:

Stack traceback for pid 1603
0xffffffc0d98c7040     1603      724  1    4   R  0xffffffc0d98c7a30  bash
Call trace:
 lkdtm_SOFTLOCKUP+0x1c/0x24
 lkdtm_do_action+0x24/0x44
 direct_entry+0x130/0x178
 full_proxy_write+0x60/0xb4
 __vfs_write+0x54/0x18c
 vfs_write+0xcc/0x174
 ksys_write+0x7c/0xe4
 __arm64_sys_write+0x20/0x2c
 el0_svc_common+0x9c/0x14c
 el0_svc_compat_handler+0x28/0x34
 el0_svc_compat+0x8/0x10

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 arch/arm64/kernel/kgdb.c | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/kernel/kgdb.c b/arch/arm64/kernel/kgdb.c
index 43119922341f..b666210fbc75 100644
--- a/arch/arm64/kernel/kgdb.c
+++ b/arch/arm64/kernel/kgdb.c
@@ -148,6 +148,45 @@ sleeping_thread_to_gdb_regs(unsigned long *gdb_regs, struct task_struct *task)
 	gdb_regs[32] = cpu_context->pc;
 }
 
+void kgdb_call_nmi_hook(void *ignored)
+{
+	struct pt_regs *regs;
+
+	/*
+	 * NOTE: get_irq_regs() is supposed to get the registers from
+	 * before the IPI interrupt happened and so is supposed to
+	 * show where the processor was.  In some situations it's
+	 * possible we might be called without an IPI, so it might be
+	 * safer to figure out how to make kgdb_breakpoint() work
+	 * properly here.
+	 */
+	regs = get_irq_regs();
+
+	/*
+	 * Some commands (like 'btc') assume that they can find info about
+	 * a task in the 'cpu_context'.  Unfortunately that's only valid
+	 * for sleeping tasks.  ...but let's make it work anyway by just
+	 * writing the registers to the right place.  This is safe because
+	 * nobody else is using the 'cpu_context' for a running task.
+	 */
+	current->thread.cpu_context.x19 = regs->regs[19];
+	current->thread.cpu_context.x20 = regs->regs[20];
+	current->thread.cpu_context.x21 = regs->regs[21];
+	current->thread.cpu_context.x22 = regs->regs[22];
+	current->thread.cpu_context.x23 = regs->regs[23];
+	current->thread.cpu_context.x24 = regs->regs[24];
+	current->thread.cpu_context.x25 = regs->regs[25];
+	current->thread.cpu_context.x26 = regs->regs[26];
+	current->thread.cpu_context.x27 = regs->regs[27];
+	current->thread.cpu_context.x28 = regs->regs[28];
+	current->thread.cpu_context.fp = regs->regs[29];
+
+	current->thread.cpu_context.sp = regs->sp;
+	current->thread.cpu_context.pc = regs->pc;
+
+	kgdb_nmicallback(raw_smp_processor_id(), regs);
+}
+
 void kgdb_arch_set_pc(struct pt_regs *regs, unsigned long pc)
 {
 	regs->pc = pc;
-- 
2.22.0.709.g102302147b-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
