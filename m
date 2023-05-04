Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A42D6F78FF
	for <lists+kgdb-bugreport@lfdr.de>; Fri,  5 May 2023 00:21:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1puhKG-0004mE-6n
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 04 May 2023 22:21:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1puhKE-0004m8-E0
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 04 May 2023 22:21:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xpsfA6UKB47krdPEGD/PrzVbXvpRWznF4QQZA2MqbCU=; b=R3ROo4nkrkobwDqsnEJdXpSWkI
 MIq80X3bTBYW9Jn7p5KYcNjAFJkogTpcmyqfRAb9PWL4x2uULV71kP3qcojaOgOXL3gRNEU7wInhY
 cNEzIW72MAEwAc+coUOgS1FIqVcGuAjRgNrdUwashLbgER9mSzGLidIhL/2QQOIJlVeA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xpsfA6UKB47krdPEGD/PrzVbXvpRWznF4QQZA2MqbCU=; b=mjc6wSE/DprdW9WSht0Azkey0Z
 IKZyKzocCnbf+rmUj/UBNGwsPGdAoRokStO4xAB42ymuz2FN9p+dUs3GJeOFp90aOmGA/lt3Thkgv
 ac4dIgx9jDdIMvUwL97L0v9UvG2iLdifhNWta80+kwWCXuxW4w2DtNp4TQnwEAZ29AH8=;
Received: from mail-oa1-f52.google.com ([209.85.160.52])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1puhKE-00ESxF-EM for kgdb-bugreport@lists.sourceforge.net;
 Thu, 04 May 2023 22:21:23 +0000
Received: by mail-oa1-f52.google.com with SMTP id
 586e51a60fabf-1929818d7faso13942911fac.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 04 May 2023 15:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1683238877; x=1685830877;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xpsfA6UKB47krdPEGD/PrzVbXvpRWznF4QQZA2MqbCU=;
 b=BmJZkxWH+kAyTDpqvDn3VTzUsgYpcOqdk9z2UyKGx25hXA0IbPxRhEYrS2F5UA/XhD
 EVEqjqEtAwbTeEvMSDwhgK29D/ffgikNN7TyDVh3GjDtz/0EBsIsBnnFqb6soBSRJ7B0
 URpZAtiZvgCVmZJjF9l+pS26o3OwHrJciZXTQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683238877; x=1685830877;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xpsfA6UKB47krdPEGD/PrzVbXvpRWznF4QQZA2MqbCU=;
 b=DHSGSJLyqYMoVrJd3wCdCLdBPGWK5vg5Boq1uvcE4fbyuRnxHWNI5LxPFlBn6spe8J
 GgD2M8JZ7zyy9uFvGzcviMmpTCoJcSX/bEdwhhFp7A4qsXMnrdvrjOBrkeMgN5EC9EUZ
 nC236BYf2FMtX4Jlw4g+RoMr4WyUlV2HGgvPXhKGQBkurAnXaHlvQIU8RJRNU4nGv5TT
 iNg2BMJhXF1txNASr/UXusvm9k5PQ+pL4v4kdkD1SDgOeV2JrGQj1Hk4nI8ZqR0BMLX7
 39m+jSdZKN1CkUqx0daaNrIb3HaXm8XKulqg55r/ejlUJi8l2OU9wqPYHdkSvu8AA9qQ
 OQ7A==
X-Gm-Message-State: AC+VfDzXtRrB35iWLzA1gWiFKvVCSXvpZ3S9lw46CVW0e5ZgFnkCm627
 631vMKwGAF7KRo8hstplPhYUQXCUESEJYSEifXk=
X-Google-Smtp-Source: ACHHUZ64Z5QeW0ZZuBfj8VjVBHEXIEO7+gyHgZ2DgxLg3p6tdlwuBFv++p3xyyGQU6N9iOTo3WaeRQ==
X-Received: by 2002:a05:6a20:938b:b0:f2:2185:8575 with SMTP id
 x11-20020a056a20938b00b000f221858575mr3718625pzh.23.1683238505737; 
 Thu, 04 May 2023 15:15:05 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:edf0:7321:6b9e:d5e7])
 by smtp.gmail.com with ESMTPSA id
 g26-20020aa7819a000000b006437c0edf9csm169615pfi.16.2023.05.04.15.15.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 15:15:04 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Petr Mladek <pmladek@suse.com>, Andrew Morton <akpm@linux-foundation.org>
Date: Thu,  4 May 2023 15:13:39 -0700
Message-ID: <20230504151100.v4.7.Id4133d3183e798122dc3b6205e7852601f289071@changeid>
X-Mailer: git-send-email 2.40.1.521.gf1e218fcd8-goog
In-Reply-To: <20230504221349.1535669-1-dianders@chromium.org>
References: <20230504221349.1535669-1-dianders@chromium.org>
MIME-Version: 1.0
X-Spam-Score: -0.4 (/)
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
 Content analysis details:   (-0.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.160.52 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.160.52 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1puhKE-00ESxF-EM
Subject: [Kgdb-bugreport] [PATCH v4 07/17] watchdog/hardlockup: Move perf
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
 Randy Dunlap <rdunlap@infradead.org>,
 Lecopzer Chen <lecopzer.chen@mediatek.com>,
 kgdb-bugreport@lists.sourceforge.net, ricardo.neri@intel.com,
 Stephane Eranian <eranian@google.com>, Guenter Roeck <groeck@chromium.org>,
 sparclinux@vger.kernel.org, Will Deacon <will@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Andi Kleen <ak@linux.intel.com>,
 mpe@ellerman.id.au, christophe.leroy@csgroup.eu, Chen-Yu Tsai <wens@csie.org>,
 Matthias Kaehlcke <mka@chromium.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Masayoshi Mizuma <msys.mizuma@gmail.com>, ravi.v.shankar@intel.com,
 Tzung-Bi Shih <tzungbi@chromium.org>, npiggin@gmail.com,
 Stephen Boyd <swboyd@chromium.org>, Pingfan Liu <kernelfans@gmail.com>,
 linux-arm-kernel@lists.infradead.org, ito-yuichi@fujitsu.com,
 linux-perf-users@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
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
make it static, move it to the same "#ifdef" block as our new
watchdog_hardlockup_check(), and rename it to make it obvious it's
just for hardlockup detectors. While doing this, it can be noted that
even if no hardlockup detectors were configured the existing code used
to still have the code for counting/checking "hrtimer_interrupts" even
if the perf hardlockup detector wasn't configured. We didn't need to
do that, so move all the "hrtimer_interrupts" counting to only be
there if the perf hardlockup detector is configured as well.

This change is expected to be a no-op.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v4:
- ("Move perf hardlockup checking/panic ...") new for v4.

 include/linux/nmi.h    |  5 ++-
 kernel/watchdog.c      | 92 +++++++++++++++++++++++++++++++++---------
 kernel/watchdog_perf.c | 42 +------------------
 3 files changed, 78 insertions(+), 61 deletions(-)

diff --git a/include/linux/nmi.h b/include/linux/nmi.h
index 35d09d70f394..c6cb9bc5dc80 100644
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
index c705a18b26bf..2d319cdf64b9 100644
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
+static bool watchdog_hardlockup_is_lockedup(void)
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
+static void watchdog_hardlockup_interrupt_count(void)
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
+	if (watchdog_hardlockup_is_lockedup()) {
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
+static inline void watchdog_hardlockup_interrupt_count(void) { }
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
 
@@ -359,7 +413,7 @@ static enum hrtimer_restart watchdog_timer_fn(struct hrtimer *hrtimer)
 		return HRTIMER_NORESTART;
 
 	/* kick the hardlockup detector */
-	watchdog_interrupt_count();
+	watchdog_hardlockup_interrupt_count();
 
 	/* kick the softlockup detector */
 	if (completion_done(this_cpu_ptr(&softlockup_completion))) {
diff --git a/kernel/watchdog_perf.c b/kernel/watchdog_perf.c
index c3d8ceb149da..5f3651b87ee7 100644
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
 	if (!watchdog_check_timestamp())
 		return;
 
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
2.40.1.521.gf1e218fcd8-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
