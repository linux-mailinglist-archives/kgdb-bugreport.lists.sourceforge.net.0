Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EFCF70A94D
	for <lists+kgdb-bugreport@lfdr.de>; Sat, 20 May 2023 18:54:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1q0PqY-0006k7-O8
	for lists+kgdb-bugreport@lfdr.de;
	Sat, 20 May 2023 16:54:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1q03n3-0003nl-Is
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 19 May 2023 17:21:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IuTIR6+6K+hxxUnbYOqT244lVUkQITd3O6ucqubZZl4=; b=jf85VCiAJi0l+KP/7mqnqnhZWA
 v+NBf5RgeMxBR3MwDp/aYYlkZlgghRqurVTupzZKodej2vhEaVvP8zj1p1R27rfgYN2OHSACEhuRz
 B/ZWEl+gS6Gdeuws57pC0MTNzDy595z4olEHRbYYbOh+01NVng3uVqMCiFNAQD1IfPXA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IuTIR6+6K+hxxUnbYOqT244lVUkQITd3O6ucqubZZl4=; b=h6vtYpqRhag/4tMPMLIOihD5RP
 jKeeitd0dRnm37JPQ49dk3y+xKNdd/ogFDo+qOFxUECa5ihl4F+ehpkkAUATIsALg636vlORKIKPu
 dOdhBEANlStWS5oLPzQncHLHE5TM5O7yHpcrFw3hYTnG/jbWQVx9+nEJOcecd064oRfQ=;
Received: from mail-pl1-f170.google.com ([209.85.214.170])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q03n2-00DXtT-LW for kgdb-bugreport@lists.sourceforge.net;
 Fri, 19 May 2023 17:21:18 +0000
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-1ae58e4b295so22081875ad.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 19 May 2023 10:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1684516871; x=1687108871;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IuTIR6+6K+hxxUnbYOqT244lVUkQITd3O6ucqubZZl4=;
 b=CX33eL4GdlRvEhb7MRrK0HcpGqL14uaialqiwAf8d9nqYwj101HteFwTQXh3a2ruOf
 lhf5cbylszXdV2cL38Sy9TAJNoiBIz9POYMeDG2sKqgFReGRdJWhtFAIAZWTFwMsot5m
 qhaAjIgBIvHfv42zEE37qt4WUUod5wAV5uRIY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684516871; x=1687108871;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IuTIR6+6K+hxxUnbYOqT244lVUkQITd3O6ucqubZZl4=;
 b=b06+V2tkXNM+nFXA+0+366KxAie6l5LxV4RyKWZx8DWcyUouvon99Nw3o+QkC7rbQ/
 QV+tVq4q10Wi1NGxF7l6CwqTEnh9AnSEDpyIykxB9w7lS71lPHCnjbGsyHp0OyownzRR
 Vl6LSPXDam5r2eavcQHz5opqL6XC4lyqZ+aXO6vXtYpSToVzczRsq5YnKAlwvcYwVGn9
 JND183wQYOW/62ECotrMJDxrbl6CCJW1x7vDM8+5W1Z7riLii4eJAf/r44bGzgz0KGdP
 slRL2ymAP3cRE3AtVSLcvsOebQ8luckGx53SogIeGxsi7rhl94Tk0c5hBVb53i0onOtw
 tYdA==
X-Gm-Message-State: AC+VfDzoyrEM/ZDmcorcxFsaHBplaHm/mbvBpQCV/JLCCwMJMeehKDZG
 wBPKkj03JNYrZbDuLudMZwyVGE43cPvY4PfFYg8=
X-Google-Smtp-Source: ACHHUZ6ZU/Zv+5uWQsHIPpE4gUjVmcZg9+Jv3yXZssM4t7jGD7GgABZwIzSWfBu1QwcX6vPL39vSYQ==
X-Received: by 2002:a17:902:c945:b0:1a9:546c:1593 with SMTP id
 i5-20020a170902c94500b001a9546c1593mr4356324pla.14.1684516871096; 
 Fri, 19 May 2023 10:21:11 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:9b89:2dd0:d160:429d])
 by smtp.gmail.com with ESMTPSA id
 gj19-20020a17090b109300b0024e4f169931sm1763835pjb.2.2023.05.19.10.21.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 May 2023 10:21:10 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Petr Mladek <pmladek@suse.com>, Andrew Morton <akpm@linux-foundation.org>
Date: Fri, 19 May 2023 10:18:35 -0700
Message-ID: <20230519101840.v5.11.I00dfd6386ee00da25bf26d140559a41339b53e57@changeid>
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
 Content preview:  In preparation for the buddy hardlockup detector, which wants
 the same petting logic as the current perf hardlockup detector, move the
 code to watchdog.c. While doing this, rename the global variable [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.170 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.170 listed in wl.mailspike.net]
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
X-Headers-End: 1q03n2-00DXtT-LW
Subject: [Kgdb-bugreport] [PATCH v5 11/18] watchdog/hardlockup: Move perf
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

In preparation for the buddy hardlockup detector, which wants the same
petting logic as the current perf hardlockup detector, move the code
to watchdog.c. While doing this, rename the global variable to match
others nearby. As part of this change we have to change the code to
account for the fact that the CPU we're running on might be different
than the one we're checking.

Currently the code in watchdog.c is guarded by
CONFIG_HARDLOCKUP_DETECTOR_PERF, which makes this change seem
silly. However, a future patch will change this.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v5:
- Fixed wrong __this_cpu to per_cpu (oops).
- Move side effect (timestamp check ordering) to its own patch.
- watchdog_hardlockup_touch => watchdog_hardlockup_touched.

Changes in v4:
- ("Move perf hardlockup watchdog petting to watchdog.c") new for v4.

 include/linux/nmi.h    |  5 +++--
 kernel/watchdog.c      | 19 +++++++++++++++++++
 kernel/watchdog_perf.c | 19 -------------------
 3 files changed, 22 insertions(+), 21 deletions(-)

diff --git a/include/linux/nmi.h b/include/linux/nmi.h
index 92aa568c0c42..e286a2a1902d 100644
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
index 2552e224f76a..64d7d2a0a7df 100644
--- a/kernel/watchdog.c
+++ b/kernel/watchdog.c
@@ -90,8 +90,22 @@ __setup("nmi_watchdog=", hardlockup_panic_setup);
 static DEFINE_PER_CPU(atomic_t, hrtimer_interrupts);
 static DEFINE_PER_CPU(int, hrtimer_interrupts_saved);
 static DEFINE_PER_CPU(bool, watchdog_hardlockup_warned);
+static DEFINE_PER_CPU(bool, watchdog_hardlockup_touched);
 static unsigned long watchdog_hardlockup_all_cpu_dumped;
 
+notrace void arch_touch_nmi_watchdog(void)
+{
+	/*
+	 * Using __raw here because some code paths have
+	 * preemption enabled.  If preemption is enabled
+	 * then interrupts should be enabled too, in which
+	 * case we shouldn't have to worry about the watchdog
+	 * going off.
+	 */
+	raw_cpu_write(watchdog_hardlockup_touched, true);
+}
+EXPORT_SYMBOL(arch_touch_nmi_watchdog);
+
 static bool is_hardlockup(unsigned int cpu)
 {
 	int hrint = atomic_read(&per_cpu(hrtimer_interrupts, cpu));
@@ -116,6 +130,11 @@ static void watchdog_hardlockup_kick(void)
 
 void watchdog_hardlockup_check(unsigned int cpu, struct pt_regs *regs)
 {
+	if (per_cpu(watchdog_hardlockup_touched, cpu)) {
+		per_cpu(watchdog_hardlockup_touched, cpu) = false;
+		return;
+	}
+
 	/*
 	 * Check for a hardlockup by making sure the CPU's timer
 	 * interrupt is incrementing. The timer interrupt should have
diff --git a/kernel/watchdog_perf.c b/kernel/watchdog_perf.c
index 4e60e8023515..547917ebd5d3 100644
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
@@ -115,11 +101,6 @@ static void watchdog_overflow_callback(struct perf_event *event,
 	if (!watchdog_check_timestamp())
 		return;
 
-	if (__this_cpu_read(watchdog_nmi_touch) == true) {
-		__this_cpu_write(watchdog_nmi_touch, false);
-		return;
-	}
-
 	watchdog_hardlockup_check(smp_processor_id(), regs);
 }
 
-- 
2.40.1.698.g37aff9b760-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
