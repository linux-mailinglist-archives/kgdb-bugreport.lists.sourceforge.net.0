Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C816F790D
	for <lists+kgdb-bugreport@lfdr.de>; Fri,  5 May 2023 00:23:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1puhML-0007Ii-Dn
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 04 May 2023 22:23:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1puhMK-0007Ic-TL
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 04 May 2023 22:23:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Cb+ov5fy8GT79FMmcyf1ZMUm58eKGi3E0UeboMl9k0k=; b=HZDkHCOBH2nMxwM0/V0MIhDCz2
 2sARG3McoDVKnt1Zl+XsOJzDerzqj9JFuK4fb3zC05HatPSQRIOPatSh3m15LcNYi3ccbEKAtG/ET
 Evc0WMBEySrx2wsTxXSvQM5wsrAtbjRdAsPcXT6klqIZiCMpFE8wo8ez6kFMLpWx4U+0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Cb+ov5fy8GT79FMmcyf1ZMUm58eKGi3E0UeboMl9k0k=; b=NMHC/wfljzqOn+zCZsPjRbiYP9
 BJA5dU385DAs4NOwbmv+5qB9CZYVqBYzLA2kUME/QPTNFW/akgndkpxszCqzBAw5PZVUdTfA6tMzb
 l9ViCED5jzfk00lEgpTxX9snt+FM/sgFg7ods68t+Tob/Z9glLbWisGKY4q9t+n3ecA0=;
Received: from mail-oa1-f41.google.com ([209.85.160.41])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1puhMH-0005Zv-G0 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 04 May 2023 22:23:32 +0000
Received: by mail-oa1-f41.google.com with SMTP id
 586e51a60fabf-19288cce249so877193fac.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 04 May 2023 15:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1683239004; x=1685831004;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Cb+ov5fy8GT79FMmcyf1ZMUm58eKGi3E0UeboMl9k0k=;
 b=ZzH/h8RcpS7TUQXH0JoPGcMWbAz8MjIqvUIjKUl/nkffx/T1w1qgEpO+FsHdmg/iug
 /BZ7zZzIomZoS8lS1gyzrhoJtJuP+EqrX0MFB9p6dbrJn8NUdmkAfls5Upta1iSxIMpf
 cFPjuAiGoayYgxxOyboRAIHL1qBRBN4Kee72Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683239004; x=1685831004;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Cb+ov5fy8GT79FMmcyf1ZMUm58eKGi3E0UeboMl9k0k=;
 b=L/A2ZEjolYrIqfM3v4Zj0kXO5efa/wY+n8C/NVS0XrN8mN3YIojgJ4lWzGtP7HyCkm
 55TD1n5Ir026CZ1wwB61jTzLFTsJ8x2NQSvOhEHn1x/9zpMvxDAs4YFO7+AlVP5mavs4
 YG8qjPxIOM0X0wawqVX7eeK6rCwiuhAnjLupKZiA6h57MyKw9Dtl7q7FxCUUnJvSUPie
 9oCE5d0r+xiwpN77Q5+E3jBBcF2tgYjBcFP9OpfjeCOuG4b/KfaNx/OUllIQ7DptD+jS
 /MeOpi6kg7tDpXdJT+KO62+e+/o6Hl7hlAU0QNfLSIP3cXDoen9yn1cMSatSUpWN5xZD
 juug==
X-Gm-Message-State: AC+VfDzum9qth1YORKqi29rhOCkZmlaavukaOh7fcZqLJJ9ElkAcClnv
 VR0CFg6Hu2rTC0d3fhBLxXEdfJZj6JAMFCGBPRQ=
X-Google-Smtp-Source: ACHHUZ4X6wdGMyW/UcCstp1VEpR79rnk9KRzJXDwHbVx8n04QbMhxm2ST+x4EIRRDKqxPh/P32rORQ==
X-Received: by 2002:a05:6a00:80f:b0:5a8:8535:18b with SMTP id
 m15-20020a056a00080f00b005a88535018bmr4857970pfk.11.1683238531276; 
 Thu, 04 May 2023 15:15:31 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:edf0:7321:6b9e:d5e7])
 by smtp.gmail.com with ESMTPSA id
 g26-20020aa7819a000000b006437c0edf9csm169615pfi.16.2023.05.04.15.15.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 15:15:30 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Petr Mladek <pmladek@suse.com>, Andrew Morton <akpm@linux-foundation.org>
Date: Thu,  4 May 2023 15:13:47 -0700
Message-ID: <20230504151100.v4.15.If4ad5dd5d09fb1309cebf8bcead4b6a5a7758ca7@changeid>
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
 Content preview: From: Lecopzer Chen <lecopzer.chen@mediatek.com> When
 lockup_detector_init()->watchdog_hardlockup_probe(), 
 PMU may be not ready yet. E.g. on arm64,
 PMU is not ready until device_initcall(armv8_pmu_driver_init).
 And it is deeply integrated with the d [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.160.41 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.160.41 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1puhMH-0005Zv-G0
Subject: [Kgdb-bugreport] [PATCH v4 15/17] watchdog/perf: Adapt the
 watchdog_perf interface for async model
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

From: Lecopzer Chen <lecopzer.chen@mediatek.com>

When lockup_detector_init()->watchdog_hardlockup_probe(), PMU may be
not ready yet. E.g. on arm64, PMU is not ready until
device_initcall(armv8_pmu_driver_init).  And it is deeply integrated
with the driver model and cpuhp. Hence it is hard to push this
initialization before smp_init().

But it is easy to take an opposite approach and try to initialize
the watchdog once again later.
The delayed probe is called using workqueues. It need to allocate
memory and must be proceed in a normal context.
The delayed probe is able to use if watchdog_hardlockup_probe() returns
non-zero which means the return code returned when PMU is not ready yet.

Provide an API - lockup_detector_retry_init() for anyone who needs
to delayed init lockup detector if they had ever failed at
lockup_detector_init().

The original assumption is: nobody should use delayed probe after
lockup_detector_check() which has __init attribute.
That is, anyone uses this API must call between lockup_detector_init()
and lockup_detector_check(), and the caller must have __init attribute

Reviewed-by: Petr Mladek <pmladek@suse.com>
Co-developed-by: Pingfan Liu <kernelfans@gmail.com>
Signed-off-by: Pingfan Liu <kernelfans@gmail.com>
Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
Suggested-by: Petr Mladek <pmladek@suse.com>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
I yanked this patch from the mailing lists [1] into my series just to
make it easier to avoid conflicts between my series and the one adding
the arm64 perf hardlockup detector, in case someone wanted to test
them both together.

As part of making this match with my series, I resolved a few
conflicts and did a few renames. I also fixed the kernel test robot
yell [2] by providing a dummy implementation of the retry function if
CONFIG_LOCKUP_DETECTOR wasn't defined. That led me to move the
definition of the function and sanitize the name of the function to
match others around it.

This patch makes less sense without the patches to add support for the
arm64 perf hardlockup detector. Thus, I've put it at the end of the
series.

I removed the "kernel test robot" tag since that didn't really make
sense. Presumably the robot found a problem on a previous version of
the patch, but that's not normally a reason to add the Reported-by.

[1] https://lore.kernel.org/r/20220903093415.15850-5-lecopzer.chen@mediatek.com/
[2] https://lore.kernel.org/r/202209050639.jDaWd49E-lkp@intel.com/

Changes in v4:
- Pulled ("Adapt the watchdog_hld interface ...") into my series for v4.

 include/linux/nmi.h |  2 ++
 kernel/watchdog.c   | 67 ++++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 68 insertions(+), 1 deletion(-)

diff --git a/include/linux/nmi.h b/include/linux/nmi.h
index 9caea5ba494d..3cacc5fc16b9 100644
--- a/include/linux/nmi.h
+++ b/include/linux/nmi.h
@@ -13,6 +13,7 @@
 
 #ifdef CONFIG_LOCKUP_DETECTOR
 void lockup_detector_init(void);
+void lockup_detector_retry_init(void);
 void lockup_detector_soft_poweroff(void);
 void lockup_detector_cleanup(void);
 
@@ -34,6 +35,7 @@ extern int sysctl_hardlockup_all_cpu_backtrace;
 
 #else /* CONFIG_LOCKUP_DETECTOR */
 static inline void lockup_detector_init(void) { }
+static inline void lockup_detector_retry_init(void) { }
 static inline void lockup_detector_soft_poweroff(void) { }
 static inline void lockup_detector_cleanup(void) { }
 #endif /* !CONFIG_LOCKUP_DETECTOR */
diff --git a/kernel/watchdog.c b/kernel/watchdog.c
index 678d55172ef4..55471634d932 100644
--- a/kernel/watchdog.c
+++ b/kernel/watchdog.c
@@ -211,7 +211,13 @@ void __weak watchdog_hardlockup_enable(unsigned int cpu) { }
 
 void __weak watchdog_hardlockup_disable(unsigned int cpu) { }
 
-/* Return 0, if a hardlockup watchdog is available. Error code otherwise */
+/*
+ * Watchdog-detector specific API.
+ *
+ * Return 0 when hardlockup watchdog is available, negative value otherwise.
+ * Note that the negative value means that a delayed probe might
+ * succeed later.
+ */
 int __weak __init watchdog_hardlockup_probe(void)
 {
 	/*
@@ -957,6 +963,62 @@ static void __init watchdog_sysctl_init(void)
 #define watchdog_sysctl_init() do { } while (0)
 #endif /* CONFIG_SYSCTL */
 
+static void __init lockup_detector_delay_init(struct work_struct *work);
+static bool allow_lockup_detector_init_retry __initdata;
+
+static struct work_struct detector_work __initdata =
+		__WORK_INITIALIZER(detector_work, lockup_detector_delay_init);
+
+static void __init lockup_detector_delay_init(struct work_struct *work)
+{
+	int ret;
+
+	ret = watchdog_hardlockup_probe();
+	if (ret) {
+		pr_info("Delayed init of the lockup detector failed: %d\n", ret);
+		pr_info("Hard watchdog permanently disabled\n");
+		return;
+	}
+
+	allow_lockup_detector_init_retry = false;
+
+	nmi_watchdog_available = true;
+	lockup_detector_setup();
+}
+
+/*
+ * lockup_detector_retry_init - retry init lockup detector if possible.
+ *
+ * Retry hardlockup detector init. It is useful when it requires some
+ * functionality that has to be initialized later on a particular
+ * platform.
+ */
+void __init lockup_detector_retry_init(void)
+{
+	/* Must be called before late init calls */
+	if (!allow_lockup_detector_init_retry)
+		return;
+
+	schedule_work(&detector_work);
+}
+
+/*
+ * Ensure that optional delayed hardlockup init is proceed before
+ * the init code and memory is freed.
+ */
+static int __init lockup_detector_check(void)
+{
+	/* Prevent any later retry. */
+	allow_lockup_detector_init_retry = false;
+
+	/* Make sure no work is pending. */
+	flush_work(&detector_work);
+
+	return 0;
+
+}
+late_initcall_sync(lockup_detector_check);
+
 void __init lockup_detector_init(void)
 {
 	if (tick_nohz_full_enabled())
@@ -967,6 +1029,9 @@ void __init lockup_detector_init(void)
 
 	if (!watchdog_hardlockup_probe())
 		nmi_watchdog_available = true;
+	else
+		allow_lockup_detector_init_retry = true;
+
 	lockup_detector_setup();
 	watchdog_sysctl_init();
 }
-- 
2.40.1.521.gf1e218fcd8-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
