Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C4970A957
	for <lists+kgdb-bugreport@lfdr.de>; Sat, 20 May 2023 18:55:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1q0PrA-0005UD-Ua
	for lists+kgdb-bugreport@lfdr.de;
	Sat, 20 May 2023 16:55:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1q03mu-00026O-0L
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 19 May 2023 17:21:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=c2pZ/r5SeHFXOp7Ja/58zWTa7i5IGy6MZWBDd9oaxl8=; b=ghjqShg7/QW6ei4xfbankMxvht
 61zNoqxbN/odQXs4w1Rwzcd2utH9wk4MS+2DIk0PeR+QJ/fw1vx6SazwWtTSmJ0bTiIiX2N0Y/lxg
 aeE7IjBc4h1CNL60PYUZMpUzvs9V7Y9LL1V2wBP21fMa9aTendYvcQneqOJOOJVyI/JI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=c2pZ/r5SeHFXOp7Ja/58zWTa7i5IGy6MZWBDd9oaxl8=; b=BdPPZU37xbsY17Idj7/QMI9C6A
 2tuULPRw4gLrxZ/alnZJD3qXKDH2zNj04Jp58J1iRUoYxJ22FJFdQcxE9e7OZHHn5moXhvlxFPx0t
 P59HTMAa9fSgnVBbyvOULlWtf0ZRN09dbtkFenS4c/0D6TYrWfX0Jql68pWvE8Qas8L8=;
Received: from mail-pg1-f170.google.com ([209.85.215.170])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q03mt-00DXt9-FS for kgdb-bugreport@lists.sourceforge.net;
 Fri, 19 May 2023 17:21:08 +0000
Received: by mail-pg1-f170.google.com with SMTP id
 41be03b00d2f7-53467c2486cso2254104a12.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 19 May 2023 10:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1684516862; x=1687108862;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c2pZ/r5SeHFXOp7Ja/58zWTa7i5IGy6MZWBDd9oaxl8=;
 b=ilDuCWthPOZFKtCt3zIf5m+QHYxhL0PTxdcW95Z7gg00USsiUeQGowTgIWPEH/Y33c
 Ik/fn/jfykHY8iDzsHbZ6NpVZo6Xk3e2y5yTqmdCNxluLu9AGXjZkhh5f44uskA/GzHn
 u1LDd0tSIk5PEeZ5ZBUo0udHktvUN+nNujoAY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684516862; x=1687108862;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c2pZ/r5SeHFXOp7Ja/58zWTa7i5IGy6MZWBDd9oaxl8=;
 b=KDWfpDH70djZpmpdfp0BPfviH0nTeHF09JmeikUSX7xGpdHTg9lOB5Rxx57VZHxNLI
 14Iv7lV1Hiwbv9whnbWAV7nXftMq4CF27VcGDh9DUawP8mLmZXXRjquZgD9eqSLfiUNp
 xUDh5y8+K15QKUUKZK1NVkbo2gwExc1IZYTWiK+INxLPRkTyALZmLAKGorCPpKTsyRnE
 diuZApDMRXw1N4PjI7WOl2ceI+1ofmO30zHSxjRYyRjM8S4EXFeY0n+nrVNBvRO8OOxs
 Zw/r3pr9Y9fFiFeu87AUC5Es8y/DQO7wzBq7Nyp14N6L+lvKJFmkv/b0KltoEqAVyiqK
 Akhw==
X-Gm-Message-State: AC+VfDwsz+opTv/jegYEow1r6wN+3PLg+ArtvKyQJRIFfqkYw6+3cnC1
 Eox3/Z/bys43WaanwVZQiwGVmg==
X-Google-Smtp-Source: ACHHUZ4lM/dJKhnKU2Q+wZoGGBEPwvMjh0/mPYxex4mimbWoRZLpedLg4Xy78zBGg+bnhybRG/+l1Q==
X-Received: by 2002:a17:90a:898f:b0:247:eae:1787 with SMTP id
 v15-20020a17090a898f00b002470eae1787mr2835153pjn.36.1684516861870; 
 Fri, 19 May 2023 10:21:01 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:9b89:2dd0:d160:429d])
 by smtp.gmail.com with ESMTPSA id
 gj19-20020a17090b109300b0024e4f169931sm1763835pjb.2.2023.05.19.10.20.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 May 2023 10:21:01 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Petr Mladek <pmladek@suse.com>, Andrew Morton <akpm@linux-foundation.org>
Date: Fri, 19 May 2023 10:18:32 -0700
Message-ID: <20230519101840.v5.8.Id4133d3183e798122dc3b6205e7852601f289071@changeid>
X-Mailer: git-send-email 2.40.1.698.g37aff9b760-goog
In-Reply-To: <20230519101840.v5.18.Ia44852044cdcb074f387e80df6b45e892965d4a1@changeid>
References: <20230519101840.v5.18.Ia44852044cdcb074f387e80df6b45e892965d4a1@changeid>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The perf hardlockup detector works by looking at interrupt
 counts and seeing if they change from run to run. The interrupt counts are
 managed by the common watchdog code via its watchdog_timer_fn(). Currently
 the API between the perf detector and the common code is a function:
 is_hardlockup().
 When the hard lockup detector sees that function return true then it handles
 printing out debug info and [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.170 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.215.170 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q03mt-00DXt9-FS
Subject: [Kgdb-bugreport] [PATCH v5 08/18] watchdog/hardlockup: Move perf
 hardlockup checking/panic to common watchdog.c
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>,
 ito-yuichi@fujitsu.com, Lecopzer Chen <lecopzer.chen@mediatek.com>,
 kgdb-bugreport@lists.sourceforge.net, ricardo.neri@intel.com,
 Stephane Eranian <eranian@google.com>, Guenter Roeck <groeck@chromium.org>,
 sparclinux@vger.kernel.org, Will Deacon <will@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Andi Kleen <ak@linux.intel.com>,
 Marc Zyngier <maz@kernel.org>, christophe.leroy@csgroup.eu,
 Chen-Yu Tsai <wens@csie.org>, Matthias Kaehlcke <mka@chromium.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Masayoshi Mizuma <msys.mizuma@gmail.com>, ravi.v.shankar@intel.com,
 Tzung-Bi Shih <tzungbi@chromium.org>, npiggin@gmail.com,
 Stephen Boyd <swboyd@chromium.org>, Pingfan Liu <kernelfans@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

The perf hardlockup detector works by looking at interrupt counts and
seeing if they change from run to run. The interrupt counts are
managed by the common watchdog code via its watchdog_timer_fn().

Currently the API between the perf detector and the common code is a
function: is_hardlockup(). When the hard lockup detector sees that
function return true then it handles printing out debug info and
inducing a panic if necessary.

Let's change the API a little bit in preparation for the buddy
hardlockup detector. The buddy hardlockup detector wants to print
nearly the same debug info and have nearly the same panic
behavior. That means we want to move all that code to the common
file. For now, the code in the common file will only be there if the
perf hardlockup detector is enabled, but eventually it will be
selected by a common config.

Right now, this _just_ moves the code from the perf detector file to
the common file and changes the names. It doesn't make the changes
that the buddy hardlockup detector will need and doesn't do any style
cleanups. A future patch will do cleanup to make it more obvious what
changed.

With the above, we no longer have any callers of is_hardlockup()
outside of the "watchdog.c" file, so we can remove it from the header,
make it static, and move it to the same "#ifdef" block as our new
watchdog_hardlockup_check(). While doing this, it can be noted that
even if no hardlockup detectors were configured the existing code used
to still have the code for counting/checking "hrtimer_interrupts" even
if the perf hardlockup detector wasn't configured. We didn't need to
do that, so move all the "hrtimer_interrupts" counting to only be
there if the perf hardlockup detector is configured as well.

This change is expected to be a no-op.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v5:
- watchdog_hardlockup_interrupt_count() => watchdog_hardlockup_kick()
- watchdog_hardlockup_is_lockedup() => is_hardlockup()

Changes in v4:
- ("Move perf hardlockup checking/panic ...") new for v4.

 include/linux/nmi.h    |  5 ++-
 kernel/watchdog.c      | 93 +++++++++++++++++++++++++++++++++---------
 kernel/watchdog_perf.c | 42 +------------------
 3 files changed, 78 insertions(+), 62 deletions(-)

diff --git a/include/linux/nmi.h b/include/linux/nmi.h
index fafab128f37e..0c62c1bf0a71 100644
--- a/include/linux/nmi.h
+++ b/include/linux/nmi.h
@@ -15,7 +15,6 @@
 void lockup_detector_init(void);
 void lockup_detector_soft_poweroff(void);
 void lockup_detector_cleanup(void);
-bool is_hardlockup(void);
 
 extern int watchdog_user_enabled;
 extern int nmi_watchdog_user_enabled;
@@ -88,6 +87,10 @@ extern unsigned int hardlockup_panic;
 static inline void hardlockup_detector_disable(void) {}
 #endif
 
+#if defined(CONFIG_HARDLOCKUP_DETECTOR_PERF)
+void watchdog_hardlockup_check(struct pt_regs *regs);
+#endif
+
 #if defined(CONFIG_HAVE_NMI_WATCHDOG) || defined(CONFIG_HARDLOCKUP_DETECTOR)
 # define NMI_WATCHDOG_SYSCTL_PERM	0644
 #else
diff --git a/kernel/watchdog.c b/kernel/watchdog.c
index c705a18b26bf..12ce37d76e7d 100644
--- a/kernel/watchdog.c
+++ b/kernel/watchdog.c
@@ -85,6 +85,78 @@ __setup("nmi_watchdog=", hardlockup_panic_setup);
 
 #endif /* CONFIG_HARDLOCKUP_DETECTOR */
 
+#if defined(CONFIG_HARDLOCKUP_DETECTOR_PERF)
+
+static DEFINE_PER_CPU(unsigned long, hrtimer_interrupts);
+static DEFINE_PER_CPU(unsigned long, hrtimer_interrupts_saved);
+static DEFINE_PER_CPU(bool, hard_watchdog_warn);
+static unsigned long hardlockup_allcpu_dumped;
+
+static bool is_hardlockup(void)
+{
+	unsigned long hrint = __this_cpu_read(hrtimer_interrupts);
+
+	if (__this_cpu_read(hrtimer_interrupts_saved) == hrint)
+		return true;
+
+	__this_cpu_write(hrtimer_interrupts_saved, hrint);
+	return false;
+}
+
+static void watchdog_hardlockup_kick(void)
+{
+	__this_cpu_inc(hrtimer_interrupts);
+}
+
+void watchdog_hardlockup_check(struct pt_regs *regs)
+{
+	/* check for a hardlockup
+	 * This is done by making sure our timer interrupt
+	 * is incrementing.  The timer interrupt should have
+	 * fired multiple times before we overflow'd.  If it hasn't
+	 * then this is a good indication the cpu is stuck
+	 */
+	if (is_hardlockup()) {
+		int this_cpu = smp_processor_id();
+
+		/* only print hardlockups once */
+		if (__this_cpu_read(hard_watchdog_warn) == true)
+			return;
+
+		pr_emerg("Watchdog detected hard LOCKUP on cpu %d\n",
+			 this_cpu);
+		print_modules();
+		print_irqtrace_events(current);
+		if (regs)
+			show_regs(regs);
+		else
+			dump_stack();
+
+		/*
+		 * Perform all-CPU dump only once to avoid multiple hardlockups
+		 * generating interleaving traces
+		 */
+		if (sysctl_hardlockup_all_cpu_backtrace &&
+				!test_and_set_bit(0, &hardlockup_allcpu_dumped))
+			trigger_allbutself_cpu_backtrace();
+
+		if (hardlockup_panic)
+			nmi_panic(regs, "Hard LOCKUP");
+
+		__this_cpu_write(hard_watchdog_warn, true);
+		return;
+	}
+
+	__this_cpu_write(hard_watchdog_warn, false);
+	return;
+}
+
+#else /* CONFIG_HARDLOCKUP_DETECTOR_PERF */
+
+static inline void watchdog_hardlockup_kick(void) { }
+
+#endif /* !CONFIG_HARDLOCKUP_DETECTOR_PERF */
+
 /*
  * These functions can be overridden if an architecture implements its
  * own hardlockup detector.
@@ -176,8 +248,6 @@ static DEFINE_PER_CPU(unsigned long, watchdog_touch_ts);
 static DEFINE_PER_CPU(unsigned long, watchdog_report_ts);
 static DEFINE_PER_CPU(struct hrtimer, watchdog_hrtimer);
 static DEFINE_PER_CPU(bool, softlockup_touch_sync);
-static DEFINE_PER_CPU(unsigned long, hrtimer_interrupts);
-static DEFINE_PER_CPU(unsigned long, hrtimer_interrupts_saved);
 static unsigned long soft_lockup_nmi_warn;
 
 static int __init nowatchdog_setup(char *str)
@@ -312,22 +382,6 @@ static int is_softlockup(unsigned long touch_ts,
 }
 
 /* watchdog detector functions */
-bool is_hardlockup(void)
-{
-	unsigned long hrint = __this_cpu_read(hrtimer_interrupts);
-
-	if (__this_cpu_read(hrtimer_interrupts_saved) == hrint)
-		return true;
-
-	__this_cpu_write(hrtimer_interrupts_saved, hrint);
-	return false;
-}
-
-static void watchdog_interrupt_count(void)
-{
-	__this_cpu_inc(hrtimer_interrupts);
-}
-
 static DEFINE_PER_CPU(struct completion, softlockup_completion);
 static DEFINE_PER_CPU(struct cpu_stop_work, softlockup_stop_work);
 
@@ -358,8 +412,7 @@ static enum hrtimer_restart watchdog_timer_fn(struct hrtimer *hrtimer)
 	if (!watchdog_enabled)
 		return HRTIMER_NORESTART;
 
-	/* kick the hardlockup detector */
-	watchdog_interrupt_count();
+	watchdog_hardlockup_kick();
 
 	/* kick the softlockup detector */
 	if (completion_done(this_cpu_ptr(&softlockup_completion))) {
diff --git a/kernel/watchdog_perf.c b/kernel/watchdog_perf.c
index 8b8015758ea5..04415812d079 100644
--- a/kernel/watchdog_perf.c
+++ b/kernel/watchdog_perf.c
@@ -20,13 +20,11 @@
 #include <asm/irq_regs.h>
 #include <linux/perf_event.h>
 
-static DEFINE_PER_CPU(bool, hard_watchdog_warn);
 static DEFINE_PER_CPU(bool, watchdog_nmi_touch);
 static DEFINE_PER_CPU(struct perf_event *, watchdog_ev);
 static DEFINE_PER_CPU(struct perf_event *, dead_event);
 static struct cpumask dead_events_mask;
 
-static unsigned long hardlockup_allcpu_dumped;
 static atomic_t watchdog_cpus = ATOMIC_INIT(0);
 
 notrace void arch_touch_nmi_watchdog(void)
@@ -122,45 +120,7 @@ static void watchdog_overflow_callback(struct perf_event *event,
 		return;
 	}
 
-	/* check for a hardlockup
-	 * This is done by making sure our timer interrupt
-	 * is incrementing.  The timer interrupt should have
-	 * fired multiple times before we overflow'd.  If it hasn't
-	 * then this is a good indication the cpu is stuck
-	 */
-	if (is_hardlockup()) {
-		int this_cpu = smp_processor_id();
-
-		/* only print hardlockups once */
-		if (__this_cpu_read(hard_watchdog_warn) == true)
-			return;
-
-		pr_emerg("Watchdog detected hard LOCKUP on cpu %d\n",
-			 this_cpu);
-		print_modules();
-		print_irqtrace_events(current);
-		if (regs)
-			show_regs(regs);
-		else
-			dump_stack();
-
-		/*
-		 * Perform all-CPU dump only once to avoid multiple hardlockups
-		 * generating interleaving traces
-		 */
-		if (sysctl_hardlockup_all_cpu_backtrace &&
-				!test_and_set_bit(0, &hardlockup_allcpu_dumped))
-			trigger_allbutself_cpu_backtrace();
-
-		if (hardlockup_panic)
-			nmi_panic(regs, "Hard LOCKUP");
-
-		__this_cpu_write(hard_watchdog_warn, true);
-		return;
-	}
-
-	__this_cpu_write(hard_watchdog_warn, false);
-	return;
+	watchdog_hardlockup_check(regs);
 }
 
 static int hardlockup_detector_event_create(void)
-- 
2.40.1.698.g37aff9b760-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
