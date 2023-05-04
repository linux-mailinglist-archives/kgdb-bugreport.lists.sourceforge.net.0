Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4BD6F78FB
	for <lists+kgdb-bugreport@lfdr.de>; Fri,  5 May 2023 00:21:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1puhJw-0004lg-ML
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 04 May 2023 22:21:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1puhJv-0004lZ-On
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 04 May 2023 22:21:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Qs9dVqDn19dbFuBLpnSq6u/1X9XncQ7793Pg3nTbXSY=; b=SaSW1wPWqfxRJ/ZHtq0vRpEuyj
 G76aCnxqWhr+JccZA4sjnaAa9blOnrrZ0r+VJpf1GBo+h6hUw9DP90K2d68VS6Zlz8049No7BhZzh
 o4OOgAKUrV4PfvH10P6a2vTe7zI6keLZ+U3AYNdr/M/xe3tMFPG99zSW3ZmwpCCyYX6A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Qs9dVqDn19dbFuBLpnSq6u/1X9XncQ7793Pg3nTbXSY=; b=URl4q/cAXWYHQpoPWJO2cMtaWM
 +f5kQ4y+NW9HaRIIteYFAnP7Wso6UN6+O+rbLh7wnsKjdw/Wal4yc1n1+CIDoHhm2OVAhtyj2yS48
 qNO4kR/EQXldLIguBd6jbjgULHzimOt/EyFwgdBzDBQkyV7X5IpYjIKfgLrcQamWKJe0=;
Received: from mail-qk1-f172.google.com ([209.85.222.172])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1puhJu-00ESvH-Ix for kgdb-bugreport@lists.sourceforge.net;
 Thu, 04 May 2023 22:21:04 +0000
Received: by mail-qk1-f172.google.com with SMTP id
 af79cd13be357-74cebbb7bc5so92460985a.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 04 May 2023 15:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1683238856; x=1685830856;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Qs9dVqDn19dbFuBLpnSq6u/1X9XncQ7793Pg3nTbXSY=;
 b=aPmKeOmqpEPpQVyJy9Fwbf0FpzGZlNtsPHdg2SBsVmtueLIC3A42fwOHWufm6iuNTt
 WaZZAlPPNKmHqVQBmMdKa8UH/p3ExECqY0hi8joJfnnloV83gGQl1aLtUTOT4KRGTWQN
 tgaS7qDSdd8JKh4N85bKnZmubooLbiumL0muQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683238856; x=1685830856;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Qs9dVqDn19dbFuBLpnSq6u/1X9XncQ7793Pg3nTbXSY=;
 b=dBwKSt6ETzU2fmtSdciO+j1cmn8DzoEE9aEOlCKZbKc9P+5ir689c6qcPmiXLdOKyS
 eBOLz75HeWvULrn6Noj/KNPFnSH0Dxe+7qIB71HzwrY59Z5hnWy2+KBujZNfzh5acrHU
 c3YeP5kRZz7/xXX4/1vldbsPpRaHDsNk9EaWD4cF+BumFRcdgr5DBlodeE5uv72H+GMl
 +pvT51mRLvFODfO5EZaUDMSTTH5Zs+FLaViUksH4MaWXXJKL3c08OYdKyZHB1aoHTPoS
 b/4Eyto6w7F/LVHzaWaY+p82FG6g9vdowswexnb+VU8kjgYhyl00p41NMYl+fyR6bVu9
 JxdQ==
X-Gm-Message-State: AC+VfDw+zk/jNJfJ5oOuErzxx9UcK4/8MDqNuSGVUMceC3i7I27NezUm
 5EwgnPNcjHzOVUdWHSFm4rCnDtsOZzvchMhaBbI=
X-Google-Smtp-Source: ACHHUZ4Ssrt4fd2DGpbw/dz7xZl+zekrUKqrX4nrV4w3MwOPjKkeowMi5feC+Af+mzM8p4SVwo3IHQ==
X-Received: by 2002:a05:6a00:2284:b0:643:9b40:103e with SMTP id
 f4-20020a056a00228400b006439b40103emr1621714pfe.30.1683238512076; 
 Thu, 04 May 2023 15:15:12 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:edf0:7321:6b9e:d5e7])
 by smtp.gmail.com with ESMTPSA id
 g26-20020aa7819a000000b006437c0edf9csm169615pfi.16.2023.05.04.15.15.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 15:15:11 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Petr Mladek <pmladek@suse.com>, Andrew Morton <akpm@linux-foundation.org>
Date: Thu,  4 May 2023 15:13:41 -0700
Message-ID: <20230504151100.v4.9.I3a7d4dd8c23ac30ee0b607d77feb6646b64825c0@changeid>
X-Mailer: git-send-email 2.40.1.521.gf1e218fcd8-goog
In-Reply-To: <20230504221349.1535669-1-dianders@chromium.org>
References: <20230504221349.1535669-1-dianders@chromium.org>
MIME-Version: 1.0
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  In preparation for the buddy hardlockup detector where the
 CPU checking for lockup might not be the currently running CPU, add a "cpu"
 parameter to watchdog_hardlockup_check(). Signed-off-by: Douglas Anderson
 <dianders@chromium.org> --- 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.172 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.222.172 listed in list.dnswl.org]
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1puhJu-00ESvH-Ix
Subject: [Kgdb-bugreport] [PATCH v4 09/17] watchdog/hardlockup: Add a "cpu"
 param to watchdog_hardlockup_check()
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

In preparation for the buddy hardlockup detector where the CPU
checking for lockup might not be the currently running CPU, add a
"cpu" parameter to watchdog_hardlockup_check().

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v4:
- ("Add a "cpu" param to watchdog_hardlockup_check()") new for v4.

 include/linux/nmi.h    |  2 +-
 kernel/watchdog.c      | 47 ++++++++++++++++++++++++++++--------------
 kernel/watchdog_perf.c |  2 +-
 3 files changed, 33 insertions(+), 18 deletions(-)

diff --git a/include/linux/nmi.h b/include/linux/nmi.h
index c6cb9bc5dc80..2c9ea1ba285c 100644
--- a/include/linux/nmi.h
+++ b/include/linux/nmi.h
@@ -88,7 +88,7 @@ static inline void hardlockup_detector_disable(void) {}
 #endif
 
 #if defined(CONFIG_HARDLOCKUP_DETECTOR_PERF)
-void watchdog_hardlockup_check(struct pt_regs *regs);
+void watchdog_hardlockup_check(unsigned int cpu, struct pt_regs *regs);
 #endif
 
 #if defined(CONFIG_HAVE_NMI_WATCHDOG) || defined(CONFIG_HARDLOCKUP_DETECTOR)
diff --git a/kernel/watchdog.c b/kernel/watchdog.c
index f46669c1671d..367bea0167a5 100644
--- a/kernel/watchdog.c
+++ b/kernel/watchdog.c
@@ -92,14 +92,14 @@ static DEFINE_PER_CPU(unsigned long, hrtimer_interrupts_saved);
 static DEFINE_PER_CPU(bool, watchdog_hardlockup_processed);
 static unsigned long watchdog_hardlockup_dumped_stacks;
 
-static bool watchdog_hardlockup_is_lockedup(void)
+static bool watchdog_hardlockup_is_lockedup(unsigned int cpu)
 {
-	unsigned long hrint = __this_cpu_read(hrtimer_interrupts);
+	unsigned long hrint = per_cpu(hrtimer_interrupts, cpu);
 
-	if (__this_cpu_read(hrtimer_interrupts_saved) == hrint)
+	if (per_cpu(hrtimer_interrupts_saved, cpu) == hrint)
 		return true;
 
-	__this_cpu_write(hrtimer_interrupts_saved, hrint);
+	per_cpu(hrtimer_interrupts_saved, cpu) = hrint;
 
 	return false;
 }
@@ -109,7 +109,7 @@ static void watchdog_hardlockup_interrupt_count(void)
 	__this_cpu_inc(hrtimer_interrupts);
 }
 
-void watchdog_hardlockup_check(struct pt_regs *regs)
+void watchdog_hardlockup_check(unsigned int cpu, struct pt_regs *regs)
 {
 	/*
 	 * Check for a hardlockup by making sure the CPU's timer
@@ -117,35 +117,50 @@ void watchdog_hardlockup_check(struct pt_regs *regs)
 	 * fired multiple times before we overflow'd. If it hasn't
 	 * then this is a good indication the cpu is stuck
 	 */
-	if (watchdog_hardlockup_is_lockedup()) {
+	if (watchdog_hardlockup_is_lockedup(cpu)) {
 		unsigned int this_cpu = smp_processor_id();
+		struct cpumask backtrace_mask = *cpu_online_mask;
 
 		/* Only handle hardlockups once. */
-		if (__this_cpu_read(watchdog_hardlockup_processed))
+		if (per_cpu(watchdog_hardlockup_processed, cpu))
 			return;
 
-		pr_emerg("Watchdog detected hard LOCKUP on cpu %d\n", this_cpu);
+		pr_emerg("Watchdog detected hard LOCKUP on cpu %d\n", cpu);
 		print_modules();
 		print_irqtrace_events(current);
-		if (regs)
+		if (regs) {
 			show_regs(regs);
-		else
-			dump_stack();
+			cpumask_clear_cpu(cpu, &backtrace_mask);
+		} else {
+			/*
+			 * If the locked up CPU is different than the CPU we're
+			 * running on then we'll try to backtrace the CPU that
+			 * locked up and then exclude it from later backtraces.
+			 * If that fails or if we're running on the locked up
+			 * CPU, just do a normal backtrace.
+			 */
+			if (cpu != this_cpu && trigger_single_cpu_backtrace(cpu)) {
+				cpumask_clear_cpu(cpu, &backtrace_mask);
+			} else {
+				dump_stack();
+				cpumask_clear_cpu(this_cpu, &backtrace_mask);
+			}
+		}
 
 		/*
-		 * Perform all-CPU dump only once to avoid multiple hardlockups
-		 * generating interleaving traces
+		 * Perform multi-CPU dump only once to avoid multiple
+		 * hardlockups generating interleaving traces
 		 */
 		if (sysctl_hardlockup_all_cpu_backtrace &&
 		    !test_and_set_bit(0, &watchdog_hardlockup_dumped_stacks))
-			trigger_allbutself_cpu_backtrace();
+			trigger_cpumask_backtrace(&backtrace_mask);
 
 		if (hardlockup_panic)
 			nmi_panic(regs, "Hard LOCKUP");
 
-		__this_cpu_write(watchdog_hardlockup_processed, true);
+		per_cpu(watchdog_hardlockup_processed, cpu) = true;
 	} else {
-		__this_cpu_write(watchdog_hardlockup_processed, false);
+		per_cpu(watchdog_hardlockup_processed, cpu) = false;
 	}
 }
 
diff --git a/kernel/watchdog_perf.c b/kernel/watchdog_perf.c
index 5f3651b87ee7..9be90b2a2ea7 100644
--- a/kernel/watchdog_perf.c
+++ b/kernel/watchdog_perf.c
@@ -120,7 +120,7 @@ static void watchdog_overflow_callback(struct perf_event *event,
 	if (!watchdog_check_timestamp())
 		return;
 
-	watchdog_hardlockup_check(regs);
+	watchdog_hardlockup_check(smp_processor_id(), regs);
 }
 
 static int hardlockup_detector_event_create(void)
-- 
2.40.1.521.gf1e218fcd8-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
