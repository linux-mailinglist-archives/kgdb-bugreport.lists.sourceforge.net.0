Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B27B441FCC
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  1 Nov 2021 19:09:04 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1mhbjz-0008Lt-4z
	for lists+kgdb-bugreport@lfdr.de; Mon, 01 Nov 2021 18:09:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <daniel.thompson@linaro.org>) id 1mhbjx-0008Lb-52
 for kgdb-bugreport@lists.sourceforge.net; Mon, 01 Nov 2021 18:09:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4fvlj04P3TZ4ZUlAQBEQ3+W+OFwhH5yPMr1dZ8HfdcU=; b=nKBiTJIaJ9IwZJoyPf7gFS8ZhH
 +KhhwtXBuJZuQlAGYvnC+Z8H7FJUaVPzXnk7vEtpKNV8Qr/6PWxmAJWLk9Ie0YwZlAGBjihgwR3Rs
 cJ2FyEpuFohsp5n2vDTsQAPBTzRCerhLToi7b3y5/Xs+TXDnwH/oRRzRWDgk0JLIoAMY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=4fvlj04P3TZ4ZUlAQBEQ3+W+OFwhH5yPMr1dZ8HfdcU=; b=X
 8pydtLf6wjoRyWRAtUNsppB1hbzG/oRrOLZmXNgZBcHGHds2kR7s0quLewn30MFj/nb4/QHYLuDTX
 WN2rXP6oM09612uOWG0km3gEZis55MPSgiuS9oD/D7A2yWr7Z1qZ8YKtGZbpRAB0pGJef0dtFWfZa
 rIFlo8IPumSgTfnM=;
Received: from mail-wm1-f43.google.com ([209.85.128.43])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1mhbjs-00CVSi-SJ
 for kgdb-bugreport@lists.sourceforge.net; Mon, 01 Nov 2021 18:09:01 +0000
Received: by mail-wm1-f43.google.com with SMTP id
 f7-20020a1c1f07000000b0032ee11917ceso521356wmf.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 01 Nov 2021 11:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4fvlj04P3TZ4ZUlAQBEQ3+W+OFwhH5yPMr1dZ8HfdcU=;
 b=o6leZNOaT6toyqIZDEaxPU9UDokVlgAC+qajPmzjMNc63rv5nn4Z1D0FkA5q8aqs+D
 U3Tdr1G6JSUEdA9AnGXODn+k84MsF7xGVfdLRtjdXGUyrCZLdLo01Vt+wuBpyfrIerGY
 gYkmHgslAj3lPwEXtO8NxTDrtcVg7BLytHOTOMSO7sxmoYolmjNfQsvaIetsfU3iOiI6
 mgNjX26aWGrtywl0c1gQUtpwLPgvdHrMlBcdjHvn1dZTkMsL6hYgUi8zenSzMD1kSNN6
 Y19Bn4+ydYmwxuh9gyzUt0jKq6VQn+tmEA2NieQMfi9D4wtsFA12Pgwar2wJQg59O7rS
 btkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4fvlj04P3TZ4ZUlAQBEQ3+W+OFwhH5yPMr1dZ8HfdcU=;
 b=LR2rltGOzyfVa2aQdMXbFU6eumKpzokhM12ZVrRa48953d+KbbGcxWOv/liGbQW6Ao
 bDiQxa4VFagNgDZDoV/4EHG8sA1Ks8IRWRPD8fpyUuQLIqqFQ9AH9o08ZHp5sLelFnfe
 hSv2DNtdhppF7aY23MOMzjjj7MI/1D3YVmi07y0RwZwt47KOfr6U1eDot20uEdhMZrpR
 Tr2Fp0rcs8MK7nXF60EZJ/irRijnhlUQDcNzTn9reVbAIdDjJlgdBPrvYdyxRavbYkxe
 /sk6DTPZ4Oj4BQj467T605DtS68gji3WAIRzGSYDsTXGDVlqWPvxfhQR2YUil142N981
 uW4w==
X-Gm-Message-State: AOAM530JnErh8Ga0gME90a/BAKyfF7yF5JD+Gh5L23yUuiP6MK/UsPJE
 5XsFH2s8SYvTjRQlLq+stWdB2ftSloX3IuBD
X-Google-Smtp-Source: ABdhPJx4keFuWInWm9DhDw77jY0HFdj5r7uMS652bmxEsiBfVRBTPbpZQhkO3aa8sF77m3Q3C2q5DA==
X-Received: by 2002:a05:600c:2118:: with SMTP id
 u24mr436393wml.0.1635788649414; 
 Mon, 01 Nov 2021 10:44:09 -0700 (PDT)
Received: from wychelm.lan
 (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id x8sm14495052wrw.6.2021.11.01.10.44.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 10:44:08 -0700 (PDT)
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Jason Wessel <jason.wessel@windriver.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Douglas Anderson <dianders@chromium.org>
Date: Mon,  1 Nov 2021 17:43:44 +0000
Message-Id: <20211101174344.3220974-1-daniel.thompson@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Currently kdb contains some open-coded routines to generate
 a summary character for each task. This code currently issues warnings, is
 almost certainly broken and won't make sense to any kernel dev wh [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.128.43 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.43 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1mhbjs-00CVSi-SJ
Subject: [Kgdb-bugreport] [PATCH v3] kdb: Adopt scheduler's task
 classification
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
Cc: kgdb-bugreport@lists.sourceforge.net, Xiang wangx <wangxiang@cdjrlc.com>,
 linux-kernel@vger.kernel.org, patches@linaro.org,
 jing yangyang <jing.yangyang@zte.com.cn>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Currently kdb contains some open-coded routines to generate a summary
character for each task. This code currently issues warnings, is
almost certainly broken and won't make sense to any kernel dev who
has ever used /proc to examine task states.

Fix both the warning and the potential for confusion by adopting the
scheduler's task classification. Whilst doing this we also simplify the
filtering by using mask strings directly (which means we don't have to
guess all the characters the scheduler might give us).

Unfortunately we can't quite match the scheduler classification completely.
We add four extra states: - for idle loops and i, m and s sleeping system
daemons (which means kthreads in one of the I, M and S states). These
extra states are used to manage the filters for tools to make the output
of ps and bta less noisy.

Note: The Fixes below is the last point the original dubious code was
      moved; it was not introduced by that patch. However it gives us
      the last point to which this patch can be easily backported.
      Happily that should be enough to cover the introduction of
      CONFIG_WERROR!

Fixes: 2f064a59a11f ("sched: Change task_struct::state")
Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
---

Notes:
    v3:
    - Fix the uninitialized cpu variable (Doug and 0-day CI bot)
    - Added a Fixes: (Doug)
    - Changed "state I" -> "state -" and "state M" to "state [ism]"
    
    v2:
    - Fix the typos in the description (Doug)
    - Stop trying to bend to world so I can keep 'I' exactly as
      it was before. Instead we now replace 'I' with '-' and
      fully adopt the scheduler description of tasks. kdb
      it an interactive tool, not ABI so this is OK. (Doug)
    - Don't try to enumerate all possible letters in the
      comments and help. You can learn what to filter from
      the output of ps anyway, (Doug)
    - Fix the sleeping system daemon stuff.

 kernel/debug/kdb/kdb_bt.c      |  14 ++--
 kernel/debug/kdb/kdb_main.c    |  35 +++++-----
 kernel/debug/kdb/kdb_private.h |   4 +-
 kernel/debug/kdb/kdb_support.c | 118 +++++++--------------------------
 4 files changed, 51 insertions(+), 120 deletions(-)

diff --git a/kernel/debug/kdb/kdb_bt.c b/kernel/debug/kdb/kdb_bt.c
index 1f9f0e47aeda..3368a2d15d73 100644
--- a/kernel/debug/kdb/kdb_bt.c
+++ b/kernel/debug/kdb/kdb_bt.c
@@ -74,7 +74,7 @@ static void kdb_show_stack(struct task_struct *p, void *addr)
  */

 static int
-kdb_bt1(struct task_struct *p, unsigned long mask, bool btaprompt)
+kdb_bt1(struct task_struct *p, const char *mask, bool btaprompt)
 {
 	char ch;

@@ -120,7 +120,7 @@ kdb_bt_cpu(unsigned long cpu)
 		return;
 	}

-	kdb_bt1(kdb_tsk, ~0UL, false);
+	kdb_bt1(kdb_tsk, "A", false);
 }

 int
@@ -138,8 +138,8 @@ kdb_bt(int argc, const char **argv)
 	if (strcmp(argv[0], "bta") == 0) {
 		struct task_struct *g, *p;
 		unsigned long cpu;
-		unsigned long mask = kdb_task_state_string(argc ? argv[1] :
-							   NULL);
+		const char *mask = argc ? argv[1] : kdbgetenv("PS");
+
 		if (argc == 0)
 			kdb_ps_suppressed();
 		/* Run the active tasks first */
@@ -167,7 +167,7 @@ kdb_bt(int argc, const char **argv)
 			return diag;
 		p = find_task_by_pid_ns(pid, &init_pid_ns);
 		if (p)
-			return kdb_bt1(p, ~0UL, false);
+			return kdb_bt1(p, "A", false);
 		kdb_printf("No process with pid == %ld found\n", pid);
 		return 0;
 	} else if (strcmp(argv[0], "btt") == 0) {
@@ -176,7 +176,7 @@ kdb_bt(int argc, const char **argv)
 		diag = kdbgetularg((char *)argv[1], &addr);
 		if (diag)
 			return diag;
-		return kdb_bt1((struct task_struct *)addr, ~0UL, false);
+		return kdb_bt1((struct task_struct *)addr, "A", false);
 	} else if (strcmp(argv[0], "btc") == 0) {
 		unsigned long cpu = ~0;
 		if (argc > 1)
@@ -212,7 +212,7 @@ kdb_bt(int argc, const char **argv)
 			kdb_show_stack(kdb_current_task, (void *)addr);
 			return 0;
 		} else {
-			return kdb_bt1(kdb_current_task, ~0UL, false);
+			return kdb_bt1(kdb_current_task, "A", false);
 		}
 	}

diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
index fa6deda894a1..60862af3d27a 100644
--- a/kernel/debug/kdb/kdb_main.c
+++ b/kernel/debug/kdb/kdb_main.c
@@ -2203,8 +2203,8 @@ static void kdb_cpu_status(void)
 			state = 'D';	/* cpu is online but unresponsive */
 		} else {
 			state = ' ';	/* cpu is responding to kdb */
-			if (kdb_task_state_char(KDB_TSK(i)) == 'I')
-				state = 'I';	/* idle task */
+			if (kdb_task_state_char(KDB_TSK(i)) == '-')
+				state = '-';	/* idle task */
 		}
 		if (state != prev_state) {
 			if (prev_state != '?') {
@@ -2271,37 +2271,30 @@ static int kdb_cpu(int argc, const char **argv)
 void kdb_ps_suppressed(void)
 {
 	int idle = 0, daemon = 0;
-	unsigned long mask_I = kdb_task_state_string("I"),
-		      mask_M = kdb_task_state_string("M");
 	unsigned long cpu;
 	const struct task_struct *p, *g;
 	for_each_online_cpu(cpu) {
 		p = kdb_curr_task(cpu);
-		if (kdb_task_state(p, mask_I))
+		if (kdb_task_state(p, "-"))
 			++idle;
 	}
 	for_each_process_thread(g, p) {
-		if (kdb_task_state(p, mask_M))
+		if (kdb_task_state(p, "ims"))
 			++daemon;
 	}
 	if (idle || daemon) {
 		if (idle)
-			kdb_printf("%d idle process%s (state I)%s\n",
+			kdb_printf("%d idle process%s (state -)%s\n",
 				   idle, idle == 1 ? "" : "es",
 				   daemon ? " and " : "");
 		if (daemon)
-			kdb_printf("%d sleeping system daemon (state M) "
+			kdb_printf("%d sleeping system daemon (state [ism]) "
 				   "process%s", daemon,
 				   daemon == 1 ? "" : "es");
 		kdb_printf(" suppressed,\nuse 'ps A' to see all.\n");
 	}
 }

-/*
- * kdb_ps - This function implements the 'ps' command which shows a
- *	list of the active processes.
- *		ps [DRSTCZEUIMA]   All processes, optionally filtered by state
- */
 void kdb_ps1(const struct task_struct *p)
 {
 	int cpu;
@@ -2330,17 +2323,25 @@ void kdb_ps1(const struct task_struct *p)
 	}
 }

+/*
+ * kdb_ps - This function implements the 'ps' command which shows a
+ *	    list of the active processes.
+ *
+ * ps [<state_chars>]   Show processes, optionally selecting only those whose
+ *                      state character is found in <state_chars>.
+ */
 static int kdb_ps(int argc, const char **argv)
 {
 	struct task_struct *g, *p;
-	unsigned long mask, cpu;
+	const char *mask;
+	unsigned long cpu;

 	if (argc == 0)
 		kdb_ps_suppressed();
 	kdb_printf("%-*s      Pid   Parent [*] cpu State %-*s Command\n",
 		(int)(2*sizeof(void *))+2, "Task Addr",
 		(int)(2*sizeof(void *))+2, "Thread");
-	mask = kdb_task_state_string(argc ? argv[1] : NULL);
+	mask = argc ? argv[1] : kdbgetenv("PS");
 	/* Run the active tasks first */
 	for_each_online_cpu(cpu) {
 		if (KDB_FLAG(CMD_INTERRUPT))
@@ -2742,8 +2743,8 @@ static kdbtab_t maintab[] = {
 	},
 	{	.name = "bta",
 		.func = kdb_bt,
-		.usage = "[D|R|S|T|C|Z|E|U|I|M|A]",
-		.help = "Backtrace all processes matching state flag",
+		.usage = "[<state_chars>|A]",
+		.help = "Backtrace all processes matching whose state matches",
 		.flags = KDB_ENABLE_INSPECT,
 	},
 	{	.name = "btc",
diff --git a/kernel/debug/kdb/kdb_private.h b/kernel/debug/kdb/kdb_private.h
index 629590084a0d..0d2f9feea0a4 100644
--- a/kernel/debug/kdb/kdb_private.h
+++ b/kernel/debug/kdb/kdb_private.h
@@ -190,10 +190,8 @@ extern char kdb_grep_string[];
 extern int kdb_grep_leading;
 extern int kdb_grep_trailing;
 extern char *kdb_cmds[];
-extern unsigned long kdb_task_state_string(const char *);
 extern char kdb_task_state_char (const struct task_struct *);
-extern unsigned long kdb_task_state(const struct task_struct *p,
-				    unsigned long mask);
+extern bool kdb_task_state(const struct task_struct *p, const char *mask);
 extern void kdb_ps_suppressed(void);
 extern void kdb_ps1(const struct task_struct *p);
 extern void kdb_send_sig(struct task_struct *p, int sig);
diff --git a/kernel/debug/kdb/kdb_support.c b/kernel/debug/kdb/kdb_support.c
index 7507d9a8dc6a..df2bface866e 100644
--- a/kernel/debug/kdb/kdb_support.c
+++ b/kernel/debug/kdb/kdb_support.c
@@ -24,6 +24,7 @@
 #include <linux/uaccess.h>
 #include <linux/kdb.h>
 #include <linux/slab.h>
+#include <linux/ctype.h>
 #include "kdb_private.h"

 /*
@@ -473,82 +474,7 @@ int kdb_putword(unsigned long addr, unsigned long word, size_t size)
 	return diag;
 }

-/*
- * kdb_task_state_string - Convert a string containing any of the
- *	letters DRSTCZEUIMA to a mask for the process state field and
- *	return the value.  If no argument is supplied, return the mask
- *	that corresponds to environment variable PS, DRSTCZEU by
- *	default.
- * Inputs:
- *	s	String to convert
- * Returns:
- *	Mask for process state.
- * Notes:
- *	The mask folds data from several sources into a single long value, so
- *	be careful not to overlap the bits.  TASK_* bits are in the LSB,
- *	special cases like UNRUNNABLE are in the MSB.  As of 2.6.10-rc1 there
- *	is no overlap between TASK_* and EXIT_* but that may not always be
- *	true, so EXIT_* bits are shifted left 16 bits before being stored in
- *	the mask.
- */
-
-/* unrunnable is < 0 */
-#define UNRUNNABLE	(1UL << (8*sizeof(unsigned long) - 1))
-#define RUNNING		(1UL << (8*sizeof(unsigned long) - 2))
-#define IDLE		(1UL << (8*sizeof(unsigned long) - 3))
-#define DAEMON		(1UL << (8*sizeof(unsigned long) - 4))

-unsigned long kdb_task_state_string(const char *s)
-{
-	long res = 0;
-	if (!s) {
-		s = kdbgetenv("PS");
-		if (!s)
-			s = "DRSTCZEU";	/* default value for ps */
-	}
-	while (*s) {
-		switch (*s) {
-		case 'D':
-			res |= TASK_UNINTERRUPTIBLE;
-			break;
-		case 'R':
-			res |= RUNNING;
-			break;
-		case 'S':
-			res |= TASK_INTERRUPTIBLE;
-			break;
-		case 'T':
-			res |= TASK_STOPPED;
-			break;
-		case 'C':
-			res |= TASK_TRACED;
-			break;
-		case 'Z':
-			res |= EXIT_ZOMBIE << 16;
-			break;
-		case 'E':
-			res |= EXIT_DEAD << 16;
-			break;
-		case 'U':
-			res |= UNRUNNABLE;
-			break;
-		case 'I':
-			res |= IDLE;
-			break;
-		case 'M':
-			res |= DAEMON;
-			break;
-		case 'A':
-			res = ~0UL;
-			break;
-		default:
-			  kdb_func_printf("unknown flag '%c' ignored\n", *s);
-			  break;
-		}
-		++s;
-	}
-	return res;
-}

 /*
  * kdb_task_state_char - Return the character that represents the task state.
@@ -559,7 +485,6 @@ unsigned long kdb_task_state_string(const char *s)
  */
 char kdb_task_state_char (const struct task_struct *p)
 {
-	unsigned int p_state;
 	unsigned long tmp;
 	char state;
 	int cpu;
@@ -568,25 +493,18 @@ char kdb_task_state_char (const struct task_struct *p)
 	    copy_from_kernel_nofault(&tmp, (char *)p, sizeof(unsigned long)))
 		return 'E';

-	cpu = kdb_process_cpu(p);
-	p_state = READ_ONCE(p->__state);
-	state = (p_state == 0) ? 'R' :
-		(p_state < 0) ? 'U' :
-		(p_state & TASK_UNINTERRUPTIBLE) ? 'D' :
-		(p_state & TASK_STOPPED) ? 'T' :
-		(p_state & TASK_TRACED) ? 'C' :
-		(p->exit_state & EXIT_ZOMBIE) ? 'Z' :
-		(p->exit_state & EXIT_DEAD) ? 'E' :
-		(p_state & TASK_INTERRUPTIBLE) ? 'S' : '?';
+	state = task_state_to_char((struct task_struct *) p);
+
 	if (is_idle_task(p)) {
 		/* Idle task.  Is it really idle, apart from the kdb
 		 * interrupt? */
+		cpu = kdb_process_cpu(p);
 		if (!kdb_task_has_cpu(p) || kgdb_info[cpu].irq_depth == 1) {
 			if (cpu != kdb_initial_cpu)
-				state = 'I';	/* idle task */
+				state = '-';	/* idle task */
 		}
-	} else if (!p->mm && state == 'S') {
-		state = 'M';	/* sleeping system daemon */
+	} else if (!p->mm && strchr("IMS", state)) {
+		state = tolower(state);		/* sleeping system daemon */
 	}
 	return state;
 }
@@ -596,14 +514,28 @@ char kdb_task_state_char (const struct task_struct *p)
  *	given by the mask.
  * Inputs:
  *	p	struct task for the process
- *	mask	mask from kdb_task_state_string to select processes
+ *	mask	set of characters used to select processes; both NULL
+ *	        and the empty string mean adopt a default filter, which
+ *	        is to suppress sleeping system daemons and the idle tasks
  * Returns:
  *	True if the process matches at least one criteria defined by the mask.
  */
-unsigned long kdb_task_state(const struct task_struct *p, unsigned long mask)
+bool kdb_task_state(const struct task_struct *p, const char *mask)
 {
-	char state[] = { kdb_task_state_char(p), '\0' };
-	return (mask & kdb_task_state_string(state)) != 0;
+	char state = kdb_task_state_char(p);
+
+	/* If there is no mask, then we will filter code that runs when the
+	 * scheduler is idling and any system daemons that are currently
+	 * sleeping.
+	 */
+	if (!mask || mask[0] == '\0')
+		return !strchr("-ims", state);
+
+	/* A is a special case that matches all states */
+	if (strchr(mask, 'A'))
+		return true;
+
+	return strchr(mask, state);
 }

 /* Maintain a small stack of kdb_flags to allow recursion without disturbing

base-commit: 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f
--
2.31.1



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
