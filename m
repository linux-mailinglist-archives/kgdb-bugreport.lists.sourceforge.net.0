Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D5970A960
	for <lists+kgdb-bugreport@lfdr.de>; Sat, 20 May 2023 18:55:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1q0PrW-0005XF-6E
	for lists+kgdb-bugreport@lfdr.de;
	Sat, 20 May 2023 16:55:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1q03tc-00029K-UT
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 19 May 2023 17:28:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fNhCL1Huez0uTcL8SW38wDXgmNTYe9rvFeaGt7OObeE=; b=X3ZHfG+hltJPZ+lqZzluOqpOtl
 QDBtQeng9HMRxUf7+weNmGTt/C0gsLkBMQbNi0jeBqEOkDwhXPwX3D9y3ZE7YrH7IR6JDnCg6N17v
 YXo32hLsPpA5nYz1c5fuN3Tji8Pgg3rfvzPQ5qKRNaKvJ+V8ArIfe294BMlD3DKEsts8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fNhCL1Huez0uTcL8SW38wDXgmNTYe9rvFeaGt7OObeE=; b=IVkUV/pwPO6Sfpv8hUaH8UknbQ
 kvvJ97Vx1BS59LK3r8C7uu8UGA/VcxFJjBXDvKJzjDFs+Q/n6ePMm2iz+Qa5VJtLZx/kBarUYm1d6
 0fTgSe075o/sl3ZyW0Nbl1v4hKeGjtHX13Ve5iv7MJOhjzygmZZcrG15hzllSsc6pKzM=;
Received: from mail-qt1-f172.google.com ([209.85.160.172])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q03tb-00DYCC-HY for kgdb-bugreport@lists.sourceforge.net;
 Fri, 19 May 2023 17:28:05 +0000
Received: by mail-qt1-f172.google.com with SMTP id
 d75a77b69052e-3f4ef2880fcso35497561cf.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 19 May 2023 10:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1684517277; x=1687109277;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fNhCL1Huez0uTcL8SW38wDXgmNTYe9rvFeaGt7OObeE=;
 b=G1THYChjfxq3zs07k2u0JzefXmd/ZoN0gSORMj3AgzagYrYe26d5SFnhGePpOx2H4A
 LJF99INe93TihtomPqQQi2Cw2WnPuvULQ5eaC3z1p5eSxzVyd1jZm4Y3BLu/ojVqR0iP
 5c7eTBIC1glqO2A3w4pUYrqkkqpLjzNwCXEng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684517277; x=1687109277;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fNhCL1Huez0uTcL8SW38wDXgmNTYe9rvFeaGt7OObeE=;
 b=Nlkd4rIYPkbdn70lxnjdLwDjFavtkFwgXtI2UpFYdC1sUsZb4zLrmffuOQ+Swbwlba
 7PGyP3GpzXzwWUOAD9SNhlEJRXPWYHN+rjOa3M2+cB2lhAcrYZyA3fpCSXFpyT0fj2Eu
 GkXOxVuZ/n2eyJBu+Qn6SlplEhaYki/1NQp5Dl0F5BnLokNwlxKSz2LU5hTRjkc8/8pX
 nXk4XGGj0IMOpPvWo1YyONc24o1wpxWcawPmeAzM4IFg7PqoMXO6Zg2JgKnCg5QXJ0Xj
 CCBQHpS4GYbweya5CFfGtjpvhyDvcpgL977p8VxzyBTg7ukxD35SDVQ3CiuEO+5q+8z2
 AU1w==
X-Gm-Message-State: AC+VfDwTCiZrb/gmGCBDWP9KWLMPY7Z0H6CZtFQwqe05A5OF9cgQDLxa
 rxTmc57nSQYEeyVkMGSeXi79e2fD7MVeAA4iTh4=
X-Google-Smtp-Source: ACHHUZ47UO7H7vKVliZ0X4KGmqcy5S/0HcN/HZXZb72n0w2ePUZMd48yQA/ampwFoC0q6hJBZ/47tQ==
X-Received: by 2002:a17:90a:c503:b0:253:41b8:13d6 with SMTP id
 k3-20020a17090ac50300b0025341b813d6mr2749539pjt.21.1684516877257; 
 Fri, 19 May 2023 10:21:17 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:9b89:2dd0:d160:429d])
 by smtp.gmail.com with ESMTPSA id
 gj19-20020a17090b109300b0024e4f169931sm1763835pjb.2.2023.05.19.10.21.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 May 2023 10:21:16 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Petr Mladek <pmladek@suse.com>, Andrew Morton <akpm@linux-foundation.org>
Date: Fri, 19 May 2023 10:18:37 -0700
Message-ID: <20230519101840.v5.13.I847d9ec852449350997ba00401d2462a9cb4302b@changeid>
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
 Content preview:  The fact that there watchdog_hardlockup_enable(),
 watchdog_hardlockup_disable(), 
 and watchdog_hardlockup_probe() are declared __weak means that the configured
 hardlockup detector can define non-weak v [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.160.172 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.160.172 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q03tb-00DYCC-HY
Subject: [Kgdb-bugreport] [PATCH v5 13/18] watchdog/hardlockup: Have the
 perf hardlockup use __weak functions more cleanly
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

The fact that there watchdog_hardlockup_enable(),
watchdog_hardlockup_disable(), and watchdog_hardlockup_probe() are
declared __weak means that the configured hardlockup detector can
define non-weak versions of those functions if it needs to. Instead of
doing this, the perf hardlockup detector hooked itself into the
default __weak implementation, which was a bit awkward. Clean this up.

From comments, it looks as if the original design was done because the
__weak function were expected to implemented by the architecture and
not by the configured hardlockup detector. This got awkward when we
tried to add the buddy lockup detector which was not arch-specific but
wanted to hook into those same functions.

This is not expected to have any functional impact.

Reviewed-by: Petr Mladek <pmladek@suse.com>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v4)

Changes in v4:
- ("Have the perf hardlockup use __weak ...") new for v4.

 include/linux/nmi.h    | 10 ----------
 kernel/watchdog.c      | 30 ++++++++++++++++++------------
 kernel/watchdog_perf.c | 20 ++++++++++++++------
 3 files changed, 32 insertions(+), 28 deletions(-)

diff --git a/include/linux/nmi.h b/include/linux/nmi.h
index 83076bf70ce8..c216e8a1be1f 100644
--- a/include/linux/nmi.h
+++ b/include/linux/nmi.h
@@ -103,21 +103,11 @@ static inline void arch_touch_nmi_watchdog(void) { }
 #if defined(CONFIG_HARDLOCKUP_DETECTOR_PERF)
 extern void hardlockup_detector_perf_stop(void);
 extern void hardlockup_detector_perf_restart(void);
-extern void hardlockup_detector_perf_disable(void);
-extern void hardlockup_detector_perf_enable(void);
 extern void hardlockup_detector_perf_cleanup(void);
-extern int hardlockup_detector_perf_init(void);
 #else
 static inline void hardlockup_detector_perf_stop(void) { }
 static inline void hardlockup_detector_perf_restart(void) { }
-static inline void hardlockup_detector_perf_disable(void) { }
-static inline void hardlockup_detector_perf_enable(void) { }
 static inline void hardlockup_detector_perf_cleanup(void) { }
-# if !defined(CONFIG_HAVE_NMI_WATCHDOG)
-static inline int hardlockup_detector_perf_init(void) { return -ENODEV; }
-# else
-static inline int hardlockup_detector_perf_init(void) { return 0; }
-# endif
 #endif
 
 void watchdog_hardlockup_stop(void);
diff --git a/kernel/watchdog.c b/kernel/watchdog.c
index 31548c0ae874..08ce046f636d 100644
--- a/kernel/watchdog.c
+++ b/kernel/watchdog.c
@@ -187,27 +187,33 @@ static inline void watchdog_hardlockup_kick(void) { }
 #endif /* !CONFIG_HARDLOCKUP_DETECTOR_PERF */
 
 /*
- * These functions can be overridden if an architecture implements its
- * own hardlockup detector.
+ * These functions can be overridden based on the configured hardlockdup detector.
  *
  * watchdog_hardlockup_enable/disable can be implemented to start and stop when
- * softlockup watchdog start and stop. The arch must select the
+ * softlockup watchdog start and stop. The detector must select the
  * SOFTLOCKUP_DETECTOR Kconfig.
  */
-void __weak watchdog_hardlockup_enable(unsigned int cpu)
-{
-	hardlockup_detector_perf_enable();
-}
+void __weak watchdog_hardlockup_enable(unsigned int cpu) { }
 
-void __weak watchdog_hardlockup_disable(unsigned int cpu)
-{
-	hardlockup_detector_perf_disable();
-}
+void __weak watchdog_hardlockup_disable(unsigned int cpu) { }
 
 /* Return 0, if a hardlockup watchdog is available. Error code otherwise */
 int __weak __init watchdog_hardlockup_probe(void)
 {
-	return hardlockup_detector_perf_init();
+	/*
+	 * If CONFIG_HAVE_NMI_WATCHDOG is defined then an architecture
+	 * is assumed to have the hard watchdog available and we return 0.
+	 */
+	if (IS_ENABLED(CONFIG_HAVE_NMI_WATCHDOG))
+		return 0;
+
+	/*
+	 * Hardlockup detectors other than those using CONFIG_HAVE_NMI_WATCHDOG
+	 * are required to implement a non-weak version of this probe function
+	 * to tell whether they are available. If they don't override then
+	 * we'll return -ENODEV.
+	 */
+	return -ENODEV;
 }
 
 /**
diff --git a/kernel/watchdog_perf.c b/kernel/watchdog_perf.c
index 9e6042a892b3..349fcd4d2abc 100644
--- a/kernel/watchdog_perf.c
+++ b/kernel/watchdog_perf.c
@@ -132,10 +132,14 @@ static int hardlockup_detector_event_create(void)
 }
 
 /**
- * hardlockup_detector_perf_enable - Enable the local event
+ * watchdog_hardlockup_enable - Enable the local event
+ *
+ * @cpu: The CPU to enable hard lockup on.
  */
-void hardlockup_detector_perf_enable(void)
+void watchdog_hardlockup_enable(unsigned int cpu)
 {
+	WARN_ON_ONCE(cpu != smp_processor_id());
+
 	if (hardlockup_detector_event_create())
 		return;
 
@@ -147,12 +151,16 @@ void hardlockup_detector_perf_enable(void)
 }
 
 /**
- * hardlockup_detector_perf_disable - Disable the local event
+ * watchdog_hardlockup_disable - Disable the local event
+ *
+ * @cpu: The CPU to enable hard lockup on.
  */
-void hardlockup_detector_perf_disable(void)
+void watchdog_hardlockup_disable(unsigned int cpu)
 {
 	struct perf_event *event = this_cpu_read(watchdog_ev);
 
+	WARN_ON_ONCE(cpu != smp_processor_id());
+
 	if (event) {
 		perf_event_disable(event);
 		this_cpu_write(watchdog_ev, NULL);
@@ -227,9 +235,9 @@ void __init hardlockup_detector_perf_restart(void)
 }
 
 /**
- * hardlockup_detector_perf_init - Probe whether NMI event is available at all
+ * watchdog_hardlockup_probe - Probe whether NMI event is available at all
  */
-int __init hardlockup_detector_perf_init(void)
+int __init watchdog_hardlockup_probe(void)
 {
 	int ret = hardlockup_detector_event_create();
 
-- 
2.40.1.698.g37aff9b760-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
