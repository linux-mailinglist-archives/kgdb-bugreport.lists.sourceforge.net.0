Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A21ED6F78FE
	for <lists+kgdb-bugreport@lfdr.de>; Fri,  5 May 2023 00:21:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1puhKC-0007Gt-F5
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 04 May 2023 22:21:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1puhKB-0007Gn-1g
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 04 May 2023 22:21:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TUknF6ajnI+moT8P8i/ZCNk2tv65O4bG3/LdBCmIAIk=; b=e6/9fU6Bf+om72CFLxXjgmHlga
 bUAkgy4g7K6SM0+EbArlfXzNSd52fhrzenfXAD86ASmTnA9SvpqpGjprklsUnrm+N68UTRw1dntoH
 39mLLLhcq1F5xxXx9x3rZikNbBJT71jCrQXIIX9Ztbq7V0lBW1mw03P2jwfy/8vd4Xq0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TUknF6ajnI+moT8P8i/ZCNk2tv65O4bG3/LdBCmIAIk=; b=MytklzjIpK0hWkHa/8x2IpXHFb
 O0UcsFFGvHaQdf+SzlmpQxIWkjr+XGBs/sWLMs55Ribeoj558z1xbMQ0kAWgSixO3+fbcKHG2pmn3
 t4b2JtXXr7Qkk2m920slaHwKe1Mw9FNsRbVh27bN4Xv6yt+bFSZKuenea184X/XogytM=;
Received: from mail-il1-f172.google.com ([209.85.166.172])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1puhK7-00ESwe-A3 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 04 May 2023 22:21:18 +0000
Received: by mail-il1-f172.google.com with SMTP id
 e9e14a558f8ab-3312db0e0cdso7979425ab.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 04 May 2023 15:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1683238869; x=1685830869;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TUknF6ajnI+moT8P8i/ZCNk2tv65O4bG3/LdBCmIAIk=;
 b=LYBT+/cG1bFlcPEAigxYoihtZh5Oi3wSrmkaUVt7KQDM/+3jD4e6EurjmT9BklFE39
 nQTUONHw95cXJpG48KkZ2joFqrZvtwYpj+ZKqUaXo6p85xHVM+A1qUwFCSK0dmtyjRrJ
 PFC7HXvEfRCTwT1KWZFdyJbacxWKkqpGQ8mN4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683238869; x=1685830869;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TUknF6ajnI+moT8P8i/ZCNk2tv65O4bG3/LdBCmIAIk=;
 b=Ch+m3VMJS2lnc3kAoPtNtS3mMhKHYtNHb8jDOBmN2lOnNJVKib6b/J6LHJ5v7qbJED
 nbiZ+FN9iNzPOqVUjZEOkPspnGwYCwVuexQxybncTLvnUnj+d36C7tu6TWaOosx3RXhT
 ldN+3KMki2o44JnB5l6ERlyHQ5P70xbizjwM5eiwgsV0hXlEWthDYUXu87zviBAX3/Ru
 cWv2bRZivz1bxRacn73t4gy9lIU2Q9tJOHVZAu9Kg0L4MYmua8P8zbL9jCR66mO+kDUU
 MwXflQT6vromkiEgcAOC7l07xVjwSxC5JxDXPqscyjcUow4ev0Dxm7jokcaKaCwW6IRY
 qP7w==
X-Gm-Message-State: AC+VfDwEsxxxhcmFCRnLPyhNl/ftMQZKdLDyddwREEoqGjdXDOQifCdP
 gf3Fdq7z46PrpR641BJP74hRAFrtrF3ZDM77EZQ=
X-Google-Smtp-Source: ACHHUZ74QoZiaoJdwRc3XVsG97oTLnm9/4CdtL0i/W46ZYWiOKXfp/f5jJlYmEEJ5QQG/1COaksDoQ==
X-Received: by 2002:a05:6a00:1954:b0:63b:7ae0:fde9 with SMTP id
 s20-20020a056a00195400b0063b7ae0fde9mr4369313pfk.20.1683238515243; 
 Thu, 04 May 2023 15:15:15 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:edf0:7321:6b9e:d5e7])
 by smtp.gmail.com with ESMTPSA id
 g26-20020aa7819a000000b006437c0edf9csm169615pfi.16.2023.05.04.15.15.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 15:15:14 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Petr Mladek <pmladek@suse.com>, Andrew Morton <akpm@linux-foundation.org>
Date: Thu,  4 May 2023 15:13:42 -0700
Message-ID: <20230504151100.v4.10.I00dfd6386ee00da25bf26d140559a41339b53e57@changeid>
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
 Content preview:  In preparation for the buddy hardlockup detector, which wants
 the same petting logic as the current perf hardlockup detector, move the
 code to watchdog.c. While doing this, rename the global variable [...] 
 Content analysis details:   (-0.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.172 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.172 listed in wl.mailspike.net]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1puhK7-00ESwe-A3
Subject: [Kgdb-bugreport] [PATCH v4 10/17] watchdog/hardlockup: Move perf
 hardlockup watchdog petting to watchdog.c
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

In preparation for the buddy hardlockup detector, which wants the same
petting logic as the current perf hardlockup detector, move the code
to watchdog.c. While doing this, rename the global variable to match
others nearby. The arch_touch_nmi_watchdog() function is not renamed
since that is exported with "EXPORT_SYMBOL" and is thus ABI.

Currently the code in watchdog.c is guarded by
CONFIG_HARDLOCKUP_DETECTOR_PERF, which makes this change seem
silly. However, a future patch will change this.

NOTE: there is a slight side effect to this change, though from code
analysis I believe it to be a beneficial one. Specifically the perf
hardlockup detector will now do check the "timestamp" before clearing
any watchdog pets. Previously the order was reversed. With the old
order if the watchdog perf event was firing super fast then it would
also be clearing existing watchdog pets super fast. The new behavior
of handling super-fast perf before clearing watchdog pets seems
better.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v4:
- ("Move perf hardlockup watchdog petting to watchdog.c") new for v4.

 include/linux/nmi.h    |  5 +++--
 kernel/watchdog.c      | 19 +++++++++++++++++++
 kernel/watchdog_perf.c | 19 -------------------
 3 files changed, 22 insertions(+), 21 deletions(-)

diff --git a/include/linux/nmi.h b/include/linux/nmi.h
index 2c9ea1ba285c..94ff84e1c8ec 100644
--- a/include/linux/nmi.h
+++ b/include/linux/nmi.h
@@ -88,7 +88,10 @@ static inline void hardlockup_detector_disable(void) {}
 #endif
 
 #if defined(CONFIG_HARDLOCKUP_DETECTOR_PERF)
+void arch_touch_nmi_watchdog(void);
 void watchdog_hardlockup_check(unsigned int cpu, struct pt_regs *regs);
+#elif !defined(CONFIG_HAVE_NMI_WATCHDOG)
+static inline void arch_touch_nmi_watchdog(void) { }
 #endif
 
 #if defined(CONFIG_HAVE_NMI_WATCHDOG) || defined(CONFIG_HARDLOCKUP_DETECTOR)
@@ -98,7 +101,6 @@ void watchdog_hardlockup_check(unsigned int cpu, struct pt_regs *regs);
 #endif
 
 #if defined(CONFIG_HARDLOCKUP_DETECTOR_PERF)
-extern void arch_touch_nmi_watchdog(void);
 extern void hardlockup_detector_perf_stop(void);
 extern void hardlockup_detector_perf_restart(void);
 extern void hardlockup_detector_perf_disable(void);
@@ -113,7 +115,6 @@ static inline void hardlockup_detector_perf_enable(void) { }
 static inline void hardlockup_detector_perf_cleanup(void) { }
 # if !defined(CONFIG_HAVE_NMI_WATCHDOG)
 static inline int hardlockup_detector_perf_init(void) { return -ENODEV; }
-static inline void arch_touch_nmi_watchdog(void) {}
 # else
 static inline int hardlockup_detector_perf_init(void) { return 0; }
 # endif
diff --git a/kernel/watchdog.c b/kernel/watchdog.c
index 367bea0167a5..9c17090611f2 100644
--- a/kernel/watchdog.c
+++ b/kernel/watchdog.c
@@ -90,8 +90,22 @@ __setup("nmi_watchdog=", hardlockup_panic_setup);
 static DEFINE_PER_CPU(unsigned long, hrtimer_interrupts);
 static DEFINE_PER_CPU(unsigned long, hrtimer_interrupts_saved);
 static DEFINE_PER_CPU(bool, watchdog_hardlockup_processed);
+static DEFINE_PER_CPU(bool, watchdog_hardlockup_touch);
 static unsigned long watchdog_hardlockup_dumped_stacks;
 
+notrace void arch_touch_nmi_watchdog(void)
+{
+	/*
+	 * Using __raw here because some code paths have
+	 * preemption enabled.  If preemption is enabled
+	 * then interrupts should be enabled too, in which
+	 * case we shouldn't have to worry about the watchdog
+	 * going off.
+	 */
+	raw_cpu_write(watchdog_hardlockup_touch, true);
+}
+EXPORT_SYMBOL(arch_touch_nmi_watchdog);
+
 static bool watchdog_hardlockup_is_lockedup(unsigned int cpu)
 {
 	unsigned long hrint = per_cpu(hrtimer_interrupts, cpu);
@@ -111,6 +125,11 @@ static void watchdog_hardlockup_interrupt_count(void)
 
 void watchdog_hardlockup_check(unsigned int cpu, struct pt_regs *regs)
 {
+	if (__this_cpu_read(watchdog_hardlockup_touch)) {
+		__this_cpu_write(watchdog_hardlockup_touch, false);
+		return;
+	}
+
 	/*
 	 * Check for a hardlockup by making sure the CPU's timer
 	 * interrupt is incrementing. The timer interrupt should have
diff --git a/kernel/watchdog_perf.c b/kernel/watchdog_perf.c
index 9be90b2a2ea7..547917ebd5d3 100644
--- a/kernel/watchdog_perf.c
+++ b/kernel/watchdog_perf.c
@@ -20,26 +20,12 @@
 #include <asm/irq_regs.h>
 #include <linux/perf_event.h>
 
-static DEFINE_PER_CPU(bool, watchdog_nmi_touch);
 static DEFINE_PER_CPU(struct perf_event *, watchdog_ev);
 static DEFINE_PER_CPU(struct perf_event *, dead_event);
 static struct cpumask dead_events_mask;
 
 static atomic_t watchdog_cpus = ATOMIC_INIT(0);
 
-notrace void arch_touch_nmi_watchdog(void)
-{
-	/*
-	 * Using __raw here because some code paths have
-	 * preemption enabled.  If preemption is enabled
-	 * then interrupts should be enabled too, in which
-	 * case we shouldn't have to worry about the watchdog
-	 * going off.
-	 */
-	raw_cpu_write(watchdog_nmi_touch, true);
-}
-EXPORT_SYMBOL(arch_touch_nmi_watchdog);
-
 #ifdef CONFIG_HARDLOCKUP_CHECK_TIMESTAMP
 static DEFINE_PER_CPU(ktime_t, last_timestamp);
 static DEFINE_PER_CPU(unsigned int, nmi_rearmed);
@@ -112,11 +98,6 @@ static void watchdog_overflow_callback(struct perf_event *event,
 	/* Ensure the watchdog never gets throttled */
 	event->hw.interrupts = 0;
 
-	if (__this_cpu_read(watchdog_nmi_touch) == true) {
-		__this_cpu_write(watchdog_nmi_touch, false);
-		return;
-	}
-
 	if (!watchdog_check_timestamp())
 		return;
 
-- 
2.40.1.521.gf1e218fcd8-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
