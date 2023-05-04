Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A106F7909
	for <lists+kgdb-bugreport@lfdr.de>; Fri,  5 May 2023 00:22:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1puhLU-0007Hx-2M
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 04 May 2023 22:22:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1puhLS-0007Hq-F1
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 04 May 2023 22:22:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EpNx2mefmmTFSIK86nVDDorYanqvx1+R+XQHbD6HO+g=; b=B/k3sUG9sXBkQ9ZJeIKOQ0XnM3
 LzNPgSMTbWwQJfJutfzVCjDnbuMvmAuxM1izomnL7rKD0h4BhEPKBv47GYL4Reu8mcbhn5+YruDZM
 XTclhssLGapoRNpwfL9iD/jk4O7hadg7Dz3B6HV3MZlDiXR6BFNKJvyq7y8oI15zsp6M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EpNx2mefmmTFSIK86nVDDorYanqvx1+R+XQHbD6HO+g=; b=OoWT2C9KKSFNsvVaMUu2W6XdmV
 jQTkYL7k9JBOsTBt4CqC1+JdGqmyQ5HwfSt+BFIUdPgNOyCD981iTPkmQenbjydRrJ/kJ5pZQ5LsX
 l/wmJobPxfnnutDV8sKbbYtXTR7Hl1eOpwvccIa20niz5j1of8Nmu8KYDZjPVCjlxZYU=;
Received: from mail-oa1-f53.google.com ([209.85.160.53])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1puhLR-00ET44-He for kgdb-bugreport@lists.sourceforge.net;
 Thu, 04 May 2023 22:22:38 +0000
Received: by mail-oa1-f53.google.com with SMTP id
 586e51a60fabf-192a0aab7dfso914527fac.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 04 May 2023 15:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1683238952; x=1685830952;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EpNx2mefmmTFSIK86nVDDorYanqvx1+R+XQHbD6HO+g=;
 b=DC1GICH1qzS0SzGl5Ih8rnSSBsVjXrmKSsb3alKgPig9RB/OCQLKdk9iMqSMVwFmxp
 Uu1ujuXqF6mhaQ5zT+37vK9VRKZEI8ef40bAYc9ysvCUd3iHcHQWHmUksI77H2yti+HN
 kApxIZ9ZbfLAMTHkbSmY1rux1g1NelfCbbRjI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683238952; x=1685830952;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EpNx2mefmmTFSIK86nVDDorYanqvx1+R+XQHbD6HO+g=;
 b=d52Z15XCGXgtlCGsQO9RNG6rxLFHVcy78ZyISsMVTZr/dwMNFlyX0b1azPwvmQ8SRH
 mbEAned/VqcXcM+KNF4CiPtLPhNah13w4hsx2E7Am0qixOuSxLOk0S/Cu1MJPB1EFbSK
 jyyjlTs8ktYxlNZCQzbzJRKlS7FJg+yGDddJK1Lk5VxRiTazgCKwj2MhaltwlvqZ4W2a
 cDkpp8Lzu7IM0KgvxXgV1fv/DVB6eLWiLgMEStKTMy0rsflwjsdTkDP4guGQXKQ7WnVs
 QzcGdBultmBYAuvi0OpkdacqYevbH+i472XxKfV/MblcwUoBV994r15E5YK+qiMDIdrG
 o35A==
X-Gm-Message-State: AC+VfDxQYhQ06UqxukCkxpLbCUxpbg/jk+pe6Dg7PI8KaqA+dreKJwSG
 1E2fDAfEKGGrRnU4hCvx/y42NPT/gR9CJ4gjiGQ=
X-Google-Smtp-Source: ACHHUZ5AX06YNKlkJIQ1gYhAYjAuz3cGg3jKF0Ccmbxhyk2anQXzj3z0TcEAc0/o771Fvgq/6YT5Uw==
X-Received: by 2002:a05:6a00:2352:b0:63f:158a:6e7b with SMTP id
 j18-20020a056a00235200b0063f158a6e7bmr5043905pfj.6.1683238521355; 
 Thu, 04 May 2023 15:15:21 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:edf0:7321:6b9e:d5e7])
 by smtp.gmail.com with ESMTPSA id
 g26-20020aa7819a000000b006437c0edf9csm169615pfi.16.2023.05.04.15.15.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 15:15:20 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Petr Mladek <pmladek@suse.com>, Andrew Morton <akpm@linux-foundation.org>
Date: Thu,  4 May 2023 15:13:44 -0700
Message-ID: <20230504151100.v4.12.I847d9ec852449350997ba00401d2462a9cb4302b@changeid>
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
 Content preview:  The fact that there watchdog_hardlockup_enable(),
 watchdog_hardlockup_disable(), 
 and watchdog_hardlockup_probe() are declared __weak means that the configured
 hardlockup detector can define non-weak v [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.160.53 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.160.53 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1puhLR-00ET44-He
Subject: [Kgdb-bugreport] [PATCH v4 12/17] watchdog/hardlockup: Have the
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

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v4:
- ("Have the perf hardlockup use __weak ...") new for v4.

 include/linux/nmi.h    | 10 ----------
 kernel/watchdog.c      | 30 ++++++++++++++++++------------
 kernel/watchdog_perf.c | 20 ++++++++++++++------
 3 files changed, 32 insertions(+), 28 deletions(-)

diff --git a/include/linux/nmi.h b/include/linux/nmi.h
index 4ff48f189ab1..094a0e7ed97d 100644
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
index 8e11b2b69e2c..e21896a0a9d5 100644
--- a/kernel/watchdog.c
+++ b/kernel/watchdog.c
@@ -190,27 +190,33 @@ static inline void watchdog_hardlockup_interrupt_count(void) { }
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
index aadc52b79f5b..a55a6eab1b3a 100644
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
2.40.1.521.gf1e218fcd8-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
