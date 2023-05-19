Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E22C970A954
	for <lists+kgdb-bugreport@lfdr.de>; Sat, 20 May 2023 18:55:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1q0PrA-0004av-NM
	for lists+kgdb-bugreport@lfdr.de;
	Sat, 20 May 2023 16:55:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1q03n7-000806-5o
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 19 May 2023 17:21:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=f94FQQhuk0W8ENFpV9UCypsjvLdOQ9g+zyXXY2mlWzk=; b=FJP8D2BzH3Za61gMRwxwh7Gklz
 7lBDJz4Dqa0nY0ESPWWKzN5rgxnNz2L/8jPqjev7MVeboPN1wbG00a9dEZPtD52WfkmX+8PwaXQR4
 UwI92ltD6eeUEJleg0POpP/Xzb/5Cwpi1K1wqD4K+mej5LegQQPucCg8kdBPVGnzl98k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=f94FQQhuk0W8ENFpV9UCypsjvLdOQ9g+zyXXY2mlWzk=; b=HdMJklNu3pQSh/IcAwscZUZh4Y
 y/hoC/V3PSTOdn6n5Q2bq2MRd7Sur/jJ0JM7lSO/5gvrWg3CobrcLAFzFVC6qidDvhBzxYjZh2t/8
 XAPh4Amx9vMRI27WbLMhirVf2Qna0e1V37HFPOh143FoN2w4GqfL5HCZJhdZ6vJTrtnc=;
Received: from mail-pg1-f179.google.com ([209.85.215.179])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q03n6-00077V-3A for kgdb-bugreport@lists.sourceforge.net;
 Fri, 19 May 2023 17:21:21 +0000
Received: by mail-pg1-f179.google.com with SMTP id
 41be03b00d2f7-517ab9a4a13so3127941a12.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 19 May 2023 10:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1684516874; x=1687108874;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f94FQQhuk0W8ENFpV9UCypsjvLdOQ9g+zyXXY2mlWzk=;
 b=JL2/PG3WgWfKI0UYiyVdL+rFsaXP14TLuDaQc3hPyYxs0cjI7vIbjDnJRRzJjkhsq4
 Fk5Nat7xilJRD+ogI17JG2rYRHAeGGuMDuYnLmB3S1eeCPPc2r4sU7KjwlKYchm0Wxpq
 /tGf7lXlKlQvHp1BLl8/JTSsEspqZGp7w5c3c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684516874; x=1687108874;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f94FQQhuk0W8ENFpV9UCypsjvLdOQ9g+zyXXY2mlWzk=;
 b=ABIHxFSw5kMUqsr0IRuJy6jXNl7l5RS6eaCJ8yZ7kZS8XCfuy3YzFRx6oVG+AjitrN
 ueAMNpUm4nkrRPihQOBw2jWO1PZji+OW7WstNdEqNrRJvg0ADoYG9x41Vx6cl2h/LQCF
 vqWHp27LfbEYr9PgHQyfhqtqtoLpncsCxns42qK9X2HWoajbXQnNhT+w1ltwh4OeSCuI
 L6Y+4EKiF4KJD/6qPJ7fvINGfkKbgvo6gjhyJehIGxnv8zIouUU/8btWPJD9YS/SXM1L
 2dyPP0eY32CTk7Qki1H40xSZ5ZhpM/SkXZ8TGWt1YrQ0xaQTPjblvKoyT8VUONn/Qeck
 n6pw==
X-Gm-Message-State: AC+VfDzvdymng/AwGaCO60t2lyz7M0T2WbEwxFwA7eOhQw4cwxarGvoh
 AnWFpikBozN8dQF93IccB7qoHQ==
X-Google-Smtp-Source: ACHHUZ7QXnADT2QH8uhuwGLt+uuB41Zzc0S8z8jnbO9xbqCoPBEqWcUMZM+bsW3ucvUc4rrA/wRmHw==
X-Received: by 2002:a17:902:e842:b0:1ac:47fe:888 with SMTP id
 t2-20020a170902e84200b001ac47fe0888mr3702415plg.28.1684516874399; 
 Fri, 19 May 2023 10:21:14 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:9b89:2dd0:d160:429d])
 by smtp.gmail.com with ESMTPSA id
 gj19-20020a17090b109300b0024e4f169931sm1763835pjb.2.2023.05.19.10.21.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 May 2023 10:21:13 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Petr Mladek <pmladek@suse.com>, Andrew Morton <akpm@linux-foundation.org>
Date: Fri, 19 May 2023 10:18:36 -0700
Message-ID: <20230519101840.v5.12.I91f7277bab4bf8c0cb238732ed92e7ce7bbd71a6@changeid>
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
 Content preview: Do a search and replace of: - NMI_WATCHDOG_ENABLED =>
 WATCHDOG_HARDLOCKUP_ENABLED
 - SOFT_WATCHDOG_ENABLED => WATCHDOG_SOFTOCKUP_ENABLED - watchdog_nmi_ =>
 watchdog_hardlockup_ - nmi_watchdog_available [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.179 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.215.179 listed in list.dnswl.org]
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
X-Headers-End: 1q03n6-00077V-3A
Subject: [Kgdb-bugreport] [PATCH v5 12/18] watchdog/hardlockup: Rename some
 "NMI watchdog" constants/function
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

Do a search and replace of:
- NMI_WATCHDOG_ENABLED => WATCHDOG_HARDLOCKUP_ENABLED
- SOFT_WATCHDOG_ENABLED => WATCHDOG_SOFTOCKUP_ENABLED
- watchdog_nmi_ => watchdog_hardlockup_
- nmi_watchdog_available => watchdog_hardlockup_available
- nmi_watchdog_user_enabled => watchdog_hardlockup_user_enabled
- soft_watchdog_user_enabled => watchdog_softlockup_user_enabled
- NMI_WATCHDOG_DEFAULT => WATCHDOG_HARDLOCKUP_DEFAULT

Then update a few comments near where names were changed.

This is specifically to make it less confusing when we want to
introduce the buddy hardlockup detector, which isn't using NMIs. As
part of this, we sanitized a few names for consistency.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v5:
- Found a few more names / comments to change.
- Tried to make names more consistent as per v4 feedback.

Changes in v4:
- ("Rename some "NMI watchdog" constants/function ...") new for v4.

 arch/powerpc/include/asm/nmi.h            |   4 +-
 arch/powerpc/kernel/watchdog.c            |  12 +--
 arch/powerpc/platforms/pseries/mobility.c |   4 +-
 arch/sparc/kernel/nmi.c                   |   4 +-
 include/linux/nmi.h                       |  18 ++--
 kernel/watchdog.c                         | 113 +++++++++++-----------
 kernel/watchdog_perf.c                    |   2 +-
 7 files changed, 79 insertions(+), 78 deletions(-)

diff --git a/arch/powerpc/include/asm/nmi.h b/arch/powerpc/include/asm/nmi.h
index c3c7adef74de..43bfd4de868f 100644
--- a/arch/powerpc/include/asm/nmi.h
+++ b/arch/powerpc/include/asm/nmi.h
@@ -5,10 +5,10 @@
 #ifdef CONFIG_PPC_WATCHDOG
 extern void arch_touch_nmi_watchdog(void);
 long soft_nmi_interrupt(struct pt_regs *regs);
-void watchdog_nmi_set_timeout_pct(u64 pct);
+void watchdog_hardlockup_set_timeout_pct(u64 pct);
 #else
 static inline void arch_touch_nmi_watchdog(void) {}
-static inline void watchdog_nmi_set_timeout_pct(u64 pct) {}
+static inline void watchdog_hardlockup_set_timeout_pct(u64 pct) {}
 #endif
 
 #ifdef CONFIG_NMI_IPI
diff --git a/arch/powerpc/kernel/watchdog.c b/arch/powerpc/kernel/watchdog.c
index dbcc4a793f0b..edb2dd1f53eb 100644
--- a/arch/powerpc/kernel/watchdog.c
+++ b/arch/powerpc/kernel/watchdog.c
@@ -438,7 +438,7 @@ static enum hrtimer_restart watchdog_timer_fn(struct hrtimer *hrtimer)
 {
 	int cpu = smp_processor_id();
 
-	if (!(watchdog_enabled & NMI_WATCHDOG_ENABLED))
+	if (!(watchdog_enabled & WATCHDOG_HARDLOCKUP_ENABLED))
 		return HRTIMER_NORESTART;
 
 	if (!cpumask_test_cpu(cpu, &watchdog_cpumask))
@@ -479,7 +479,7 @@ static void start_watchdog(void *arg)
 		return;
 	}
 
-	if (!(watchdog_enabled & NMI_WATCHDOG_ENABLED))
+	if (!(watchdog_enabled & WATCHDOG_HARDLOCKUP_ENABLED))
 		return;
 
 	if (!cpumask_test_cpu(cpu, &watchdog_cpumask))
@@ -546,7 +546,7 @@ static void watchdog_calc_timeouts(void)
 	wd_timer_period_ms = watchdog_thresh * 1000 * 2 / 5;
 }
 
-void watchdog_nmi_stop(void)
+void watchdog_hardlockup_stop(void)
 {
 	int cpu;
 
@@ -554,7 +554,7 @@ void watchdog_nmi_stop(void)
 		stop_watchdog_on_cpu(cpu);
 }
 
-void watchdog_nmi_start(void)
+void watchdog_hardlockup_start(void)
 {
 	int cpu;
 
@@ -566,7 +566,7 @@ void watchdog_nmi_start(void)
 /*
  * Invoked from core watchdog init.
  */
-int __init watchdog_nmi_probe(void)
+int __init watchdog_hardlockup_probe(void)
 {
 	int err;
 
@@ -582,7 +582,7 @@ int __init watchdog_nmi_probe(void)
 }
 
 #ifdef CONFIG_PPC_PSERIES
-void watchdog_nmi_set_timeout_pct(u64 pct)
+void watchdog_hardlockup_set_timeout_pct(u64 pct)
 {
 	pr_info("Set the NMI watchdog timeout factor to %llu%%\n", pct);
 	WRITE_ONCE(wd_timeout_pct, pct);
diff --git a/arch/powerpc/platforms/pseries/mobility.c b/arch/powerpc/platforms/pseries/mobility.c
index 6f30113b5468..cd632ba9ebff 100644
--- a/arch/powerpc/platforms/pseries/mobility.c
+++ b/arch/powerpc/platforms/pseries/mobility.c
@@ -750,7 +750,7 @@ static int pseries_migrate_partition(u64 handle)
 		goto out;
 
 	if (factor)
-		watchdog_nmi_set_timeout_pct(factor);
+		watchdog_hardlockup_set_timeout_pct(factor);
 
 	ret = pseries_suspend(handle);
 	if (ret == 0) {
@@ -766,7 +766,7 @@ static int pseries_migrate_partition(u64 handle)
 		pseries_cancel_migration(handle, ret);
 
 	if (factor)
-		watchdog_nmi_set_timeout_pct(0);
+		watchdog_hardlockup_set_timeout_pct(0);
 
 out:
 	vas_migration_handler(VAS_RESUME);
diff --git a/arch/sparc/kernel/nmi.c b/arch/sparc/kernel/nmi.c
index 5dcf31f7e81f..9d9e29b75c43 100644
--- a/arch/sparc/kernel/nmi.c
+++ b/arch/sparc/kernel/nmi.c
@@ -282,7 +282,7 @@ __setup("nmi_watchdog=", setup_nmi_watchdog);
  * sparc specific NMI watchdog enable function.
  * Enables watchdog if it is not enabled already.
  */
-void watchdog_nmi_enable(unsigned int cpu)
+void watchdog_hardlockup_enable(unsigned int cpu)
 {
 	if (atomic_read(&nmi_active) == -1) {
 		pr_warn("NMI watchdog cannot be enabled or disabled\n");
@@ -303,7 +303,7 @@ void watchdog_nmi_enable(unsigned int cpu)
  * sparc specific NMI watchdog disable function.
  * Disables watchdog if it is not disabled already.
  */
-void watchdog_nmi_disable(unsigned int cpu)
+void watchdog_hardlockup_disable(unsigned int cpu)
 {
 	if (atomic_read(&nmi_active) == -1)
 		pr_warn_once("NMI watchdog cannot be enabled or disabled\n");
diff --git a/include/linux/nmi.h b/include/linux/nmi.h
index e286a2a1902d..83076bf70ce8 100644
--- a/include/linux/nmi.h
+++ b/include/linux/nmi.h
@@ -75,10 +75,10 @@ static inline void reset_hung_task_detector(void) { }
  * handled differently because its value is not boolean, and the lockup
  * detectors are 'suspended' while 'watchdog_thresh' is equal zero.
  */
-#define NMI_WATCHDOG_ENABLED_BIT   0
-#define SOFT_WATCHDOG_ENABLED_BIT  1
-#define NMI_WATCHDOG_ENABLED      (1 << NMI_WATCHDOG_ENABLED_BIT)
-#define SOFT_WATCHDOG_ENABLED     (1 << SOFT_WATCHDOG_ENABLED_BIT)
+#define WATCHDOG_HARDLOCKUP_ENABLED_BIT  0
+#define WATCHDOG_SOFTOCKUP_ENABLED_BIT   1
+#define WATCHDOG_HARDLOCKUP_ENABLED     (1 << WATCHDOG_HARDLOCKUP_ENABLED_BIT)
+#define WATCHDOG_SOFTOCKUP_ENABLED      (1 << WATCHDOG_SOFTOCKUP_ENABLED_BIT)
 
 #if defined(CONFIG_HARDLOCKUP_DETECTOR)
 extern void hardlockup_detector_disable(void);
@@ -120,11 +120,11 @@ static inline int hardlockup_detector_perf_init(void) { return 0; }
 # endif
 #endif
 
-void watchdog_nmi_stop(void);
-void watchdog_nmi_start(void);
-int watchdog_nmi_probe(void);
-void watchdog_nmi_enable(unsigned int cpu);
-void watchdog_nmi_disable(unsigned int cpu);
+void watchdog_hardlockup_stop(void);
+void watchdog_hardlockup_start(void);
+int watchdog_hardlockup_probe(void);
+void watchdog_hardlockup_enable(unsigned int cpu);
+void watchdog_hardlockup_disable(unsigned int cpu);
 
 void lockup_detector_reconfigure(void);
 
diff --git a/kernel/watchdog.c b/kernel/watchdog.c
index 64d7d2a0a7df..31548c0ae874 100644
--- a/kernel/watchdog.c
+++ b/kernel/watchdog.c
@@ -30,17 +30,17 @@
 static DEFINE_MUTEX(watchdog_mutex);
 
 #if defined(CONFIG_HARDLOCKUP_DETECTOR) || defined(CONFIG_HAVE_NMI_WATCHDOG)
-# define NMI_WATCHDOG_DEFAULT	1
+# define WATCHDOG_HARDLOCKUP_DEFAULT	1
 #else
-# define NMI_WATCHDOG_DEFAULT	0
+# define WATCHDOG_HARDLOCKUP_DEFAULT	0
 #endif
 
 unsigned long __read_mostly watchdog_enabled;
 int __read_mostly watchdog_user_enabled = 1;
-int __read_mostly nmi_watchdog_user_enabled = NMI_WATCHDOG_DEFAULT;
-int __read_mostly soft_watchdog_user_enabled = 1;
+int __read_mostly watchdog_hardlockup_user_enabled = WATCHDOG_HARDLOCKUP_DEFAULT;
+int __read_mostly watchdog_softlockup_user_enabled = 1;
 int __read_mostly watchdog_thresh = 10;
-static int __read_mostly nmi_watchdog_available;
+static int __read_mostly watchdog_hardlockup_available;
 
 struct cpumask watchdog_cpumask __read_mostly;
 unsigned long *watchdog_cpumask_bits = cpumask_bits(&watchdog_cpumask);
@@ -66,7 +66,7 @@ unsigned int __read_mostly hardlockup_panic =
  */
 void __init hardlockup_detector_disable(void)
 {
-	nmi_watchdog_user_enabled = 0;
+	watchdog_hardlockup_user_enabled = 0;
 }
 
 static int __init hardlockup_panic_setup(char *str)
@@ -76,9 +76,9 @@ static int __init hardlockup_panic_setup(char *str)
 	else if (!strncmp(str, "nopanic", 7))
 		hardlockup_panic = 0;
 	else if (!strncmp(str, "0", 1))
-		nmi_watchdog_user_enabled = 0;
+		watchdog_hardlockup_user_enabled = 0;
 	else if (!strncmp(str, "1", 1))
-		nmi_watchdog_user_enabled = 1;
+		watchdog_hardlockup_user_enabled = 1;
 	return 1;
 }
 __setup("nmi_watchdog=", hardlockup_panic_setup);
@@ -190,40 +190,40 @@ static inline void watchdog_hardlockup_kick(void) { }
  * These functions can be overridden if an architecture implements its
  * own hardlockup detector.
  *
- * watchdog_nmi_enable/disable can be implemented to start and stop when
+ * watchdog_hardlockup_enable/disable can be implemented to start and stop when
  * softlockup watchdog start and stop. The arch must select the
  * SOFTLOCKUP_DETECTOR Kconfig.
  */
-void __weak watchdog_nmi_enable(unsigned int cpu)
+void __weak watchdog_hardlockup_enable(unsigned int cpu)
 {
 	hardlockup_detector_perf_enable();
 }
 
-void __weak watchdog_nmi_disable(unsigned int cpu)
+void __weak watchdog_hardlockup_disable(unsigned int cpu)
 {
 	hardlockup_detector_perf_disable();
 }
 
-/* Return 0, if a NMI watchdog is available. Error code otherwise */
-int __weak __init watchdog_nmi_probe(void)
+/* Return 0, if a hardlockup watchdog is available. Error code otherwise */
+int __weak __init watchdog_hardlockup_probe(void)
 {
 	return hardlockup_detector_perf_init();
 }
 
 /**
- * watchdog_nmi_stop - Stop the watchdog for reconfiguration
+ * watchdog_hardlockup_stop - Stop the watchdog for reconfiguration
  *
  * The reconfiguration steps are:
- * watchdog_nmi_stop();
+ * watchdog_hardlockup_stop();
  * update_variables();
- * watchdog_nmi_start();
+ * watchdog_hardlockup_start();
  */
-void __weak watchdog_nmi_stop(void) { }
+void __weak watchdog_hardlockup_stop(void) { }
 
 /**
- * watchdog_nmi_start - Start the watchdog after reconfiguration
+ * watchdog_hardlockup_start - Start the watchdog after reconfiguration
  *
- * Counterpart to watchdog_nmi_stop().
+ * Counterpart to watchdog_hardlockup_stop().
  *
  * The following variables have been updated in update_variables() and
  * contain the currently valid configuration:
@@ -231,23 +231,23 @@ void __weak watchdog_nmi_stop(void) { }
  * - watchdog_thresh
  * - watchdog_cpumask
  */
-void __weak watchdog_nmi_start(void) { }
+void __weak watchdog_hardlockup_start(void) { }
 
 /**
  * lockup_detector_update_enable - Update the sysctl enable bit
  *
- * Caller needs to make sure that the NMI/perf watchdogs are off, so this
- * can't race with watchdog_nmi_disable().
+ * Caller needs to make sure that the hard watchdogs are off, so this
+ * can't race with watchdog_hardlockup_disable().
  */
 static void lockup_detector_update_enable(void)
 {
 	watchdog_enabled = 0;
 	if (!watchdog_user_enabled)
 		return;
-	if (nmi_watchdog_available && nmi_watchdog_user_enabled)
-		watchdog_enabled |= NMI_WATCHDOG_ENABLED;
-	if (soft_watchdog_user_enabled)
-		watchdog_enabled |= SOFT_WATCHDOG_ENABLED;
+	if (watchdog_hardlockup_available && watchdog_hardlockup_user_enabled)
+		watchdog_enabled |= WATCHDOG_HARDLOCKUP_ENABLED;
+	if (watchdog_softlockup_user_enabled)
+		watchdog_enabled |= WATCHDOG_SOFTOCKUP_ENABLED;
 }
 
 #ifdef CONFIG_SOFTLOCKUP_DETECTOR
@@ -288,7 +288,7 @@ __setup("nowatchdog", nowatchdog_setup);
 
 static int __init nosoftlockup_setup(char *str)
 {
-	soft_watchdog_user_enabled = 0;
+	watchdog_softlockup_user_enabled = 0;
 	return 1;
 }
 __setup("nosoftlockup", nosoftlockup_setup);
@@ -402,7 +402,7 @@ static int is_softlockup(unsigned long touch_ts,
 			 unsigned long period_ts,
 			 unsigned long now)
 {
-	if ((watchdog_enabled & SOFT_WATCHDOG_ENABLED) && watchdog_thresh){
+	if ((watchdog_enabled & WATCHDOG_SOFTOCKUP_ENABLED) && watchdog_thresh) {
 		/* Warn about unreasonable delays. */
 		if (time_after(now, period_ts + get_softlockup_thresh()))
 			return now - touch_ts;
@@ -537,7 +537,7 @@ static void watchdog_enable(unsigned int cpu)
 	complete(done);
 
 	/*
-	 * Start the timer first to prevent the NMI watchdog triggering
+	 * Start the timer first to prevent the hardlockup watchdog triggering
 	 * before the timer has a chance to fire.
 	 */
 	hrtimer_init(hrtimer, CLOCK_MONOTONIC, HRTIMER_MODE_REL_HARD);
@@ -547,9 +547,9 @@ static void watchdog_enable(unsigned int cpu)
 
 	/* Initialize timestamp */
 	update_touch_ts();
-	/* Enable the perf event */
-	if (watchdog_enabled & NMI_WATCHDOG_ENABLED)
-		watchdog_nmi_enable(cpu);
+	/* Enable the hardlockup detector */
+	if (watchdog_enabled & WATCHDOG_HARDLOCKUP_ENABLED)
+		watchdog_hardlockup_enable(cpu);
 }
 
 static void watchdog_disable(unsigned int cpu)
@@ -559,11 +559,11 @@ static void watchdog_disable(unsigned int cpu)
 	WARN_ON_ONCE(cpu != smp_processor_id());
 
 	/*
-	 * Disable the perf event first. That prevents that a large delay
-	 * between disabling the timer and disabling the perf event causes
-	 * the perf NMI to detect a false positive.
+	 * Disable the hardlockup detector first. That prevents that a large
+	 * delay between disabling the timer and disabling the hardlockup
+	 * detector causes a false positive.
 	 */
-	watchdog_nmi_disable(cpu);
+	watchdog_hardlockup_disable(cpu);
 	hrtimer_cancel(hrtimer);
 	wait_for_completion(this_cpu_ptr(&softlockup_completion));
 }
@@ -619,7 +619,7 @@ int lockup_detector_offline_cpu(unsigned int cpu)
 static void __lockup_detector_reconfigure(void)
 {
 	cpus_read_lock();
-	watchdog_nmi_stop();
+	watchdog_hardlockup_stop();
 
 	softlockup_stop_all();
 	set_sample_period();
@@ -627,7 +627,7 @@ static void __lockup_detector_reconfigure(void)
 	if (watchdog_enabled && watchdog_thresh)
 		softlockup_start_all();
 
-	watchdog_nmi_start();
+	watchdog_hardlockup_start();
 	cpus_read_unlock();
 	/*
 	 * Must be called outside the cpus locked section to prevent
@@ -668,9 +668,9 @@ static __init void lockup_detector_setup(void)
 static void __lockup_detector_reconfigure(void)
 {
 	cpus_read_lock();
-	watchdog_nmi_stop();
+	watchdog_hardlockup_stop();
 	lockup_detector_update_enable();
-	watchdog_nmi_start();
+	watchdog_hardlockup_start();
 	cpus_read_unlock();
 }
 void lockup_detector_reconfigure(void)
@@ -725,14 +725,14 @@ static void proc_watchdog_update(void)
 /*
  * common function for watchdog, nmi_watchdog and soft_watchdog parameter
  *
- * caller             | table->data points to      | 'which'
- * -------------------|----------------------------|--------------------------
- * proc_watchdog      | watchdog_user_enabled      | NMI_WATCHDOG_ENABLED |
- *                    |                            | SOFT_WATCHDOG_ENABLED
- * -------------------|----------------------------|--------------------------
- * proc_nmi_watchdog  | nmi_watchdog_user_enabled  | NMI_WATCHDOG_ENABLED
- * -------------------|----------------------------|--------------------------
- * proc_soft_watchdog | soft_watchdog_user_enabled | SOFT_WATCHDOG_ENABLED
+ * caller             | table->data points to            | 'which'
+ * -------------------|----------------------------------|-------------------------------
+ * proc_watchdog      | watchdog_user_enabled            | WATCHDOG_HARDLOCKUP_ENABLED |
+ *                    |                                  | WATCHDOG_SOFTOCKUP_ENABLED
+ * -------------------|----------------------------------|-------------------------------
+ * proc_nmi_watchdog  | watchdog_hardlockup_user_enabled | WATCHDOG_HARDLOCKUP_ENABLED
+ * -------------------|----------------------------------|-------------------------------
+ * proc_soft_watchdog | watchdog_softlockup_user_enabled | WATCHDOG_SOFTOCKUP_ENABLED
  */
 static int proc_watchdog_common(int which, struct ctl_table *table, int write,
 				void *buffer, size_t *lenp, loff_t *ppos)
@@ -764,7 +764,8 @@ static int proc_watchdog_common(int which, struct ctl_table *table, int write,
 int proc_watchdog(struct ctl_table *table, int write,
 		  void *buffer, size_t *lenp, loff_t *ppos)
 {
-	return proc_watchdog_common(NMI_WATCHDOG_ENABLED|SOFT_WATCHDOG_ENABLED,
+	return proc_watchdog_common(WATCHDOG_HARDLOCKUP_ENABLED |
+				    WATCHDOG_SOFTOCKUP_ENABLED,
 				    table, write, buffer, lenp, ppos);
 }
 
@@ -774,9 +775,9 @@ int proc_watchdog(struct ctl_table *table, int write,
 int proc_nmi_watchdog(struct ctl_table *table, int write,
 		      void *buffer, size_t *lenp, loff_t *ppos)
 {
-	if (!nmi_watchdog_available && write)
+	if (!watchdog_hardlockup_available && write)
 		return -ENOTSUPP;
-	return proc_watchdog_common(NMI_WATCHDOG_ENABLED,
+	return proc_watchdog_common(WATCHDOG_HARDLOCKUP_ENABLED,
 				    table, write, buffer, lenp, ppos);
 }
 
@@ -786,7 +787,7 @@ int proc_nmi_watchdog(struct ctl_table *table, int write,
 int proc_soft_watchdog(struct ctl_table *table, int write,
 			void *buffer, size_t *lenp, loff_t *ppos)
 {
-	return proc_watchdog_common(SOFT_WATCHDOG_ENABLED,
+	return proc_watchdog_common(WATCHDOG_SOFTOCKUP_ENABLED,
 				    table, write, buffer, lenp, ppos);
 }
 
@@ -854,7 +855,7 @@ static struct ctl_table watchdog_sysctls[] = {
 	},
 	{
 		.procname       = "nmi_watchdog",
-		.data		= &nmi_watchdog_user_enabled,
+		.data		= &watchdog_hardlockup_user_enabled,
 		.maxlen		= sizeof(int),
 		.mode		= NMI_WATCHDOG_SYSCTL_PERM,
 		.proc_handler   = proc_nmi_watchdog,
@@ -871,7 +872,7 @@ static struct ctl_table watchdog_sysctls[] = {
 #ifdef CONFIG_SOFTLOCKUP_DETECTOR
 	{
 		.procname       = "soft_watchdog",
-		.data		= &soft_watchdog_user_enabled,
+		.data		= &watchdog_softlockup_user_enabled,
 		.maxlen		= sizeof(int),
 		.mode		= 0644,
 		.proc_handler   = proc_soft_watchdog,
@@ -940,8 +941,8 @@ void __init lockup_detector_init(void)
 	cpumask_copy(&watchdog_cpumask,
 		     housekeeping_cpumask(HK_TYPE_TIMER));
 
-	if (!watchdog_nmi_probe())
-		nmi_watchdog_available = true;
+	if (!watchdog_hardlockup_probe())
+		watchdog_hardlockup_available = true;
 	lockup_detector_setup();
 	watchdog_sysctl_init();
 }
diff --git a/kernel/watchdog_perf.c b/kernel/watchdog_perf.c
index 547917ebd5d3..9e6042a892b3 100644
--- a/kernel/watchdog_perf.c
+++ b/kernel/watchdog_perf.c
@@ -215,7 +215,7 @@ void __init hardlockup_detector_perf_restart(void)
 
 	lockdep_assert_cpus_held();
 
-	if (!(watchdog_enabled & NMI_WATCHDOG_ENABLED))
+	if (!(watchdog_enabled & WATCHDOG_HARDLOCKUP_ENABLED))
 		return;
 
 	for_each_online_cpu(cpu) {
-- 
2.40.1.698.g37aff9b760-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
