Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C69D6F790F
	for <lists+kgdb-bugreport@lfdr.de>; Fri,  5 May 2023 00:23:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1puhMN-0004oO-4d
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 04 May 2023 22:23:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1puhML-0004oH-Ma
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 04 May 2023 22:23:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RCs/9iBvrEyNVZzCTd/A2GImby0Xt44Wx/SBN2PNOfk=; b=Ua7wYBPeU71ByKs2OWUtMrPjgW
 Ie4XQGvMX35eaFvA93WWEBqd8XZ7+DmazLfbbOTuhnU4BXx96MC2ISolTFW+jdXAVir209TWGXipp
 SbxgJWXTcwvOhrJFqWP7AufeZM0cexKfciVTTMiGXQY9cC1kyqINSkRGDAdYrgb1+XMU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RCs/9iBvrEyNVZzCTd/A2GImby0Xt44Wx/SBN2PNOfk=; b=IQFL/ohT6ZbxYu/fJaFJSGj2Bm
 It+DdQhtPLnpoGrMI1EyuSOc2KZU/AfHEvoqmYJxx0Vs65U16keLltIyT5qg7OIgaJRV3UnYT+UPO
 cYv/xM9mGhkGY7Ow/ZkcctyHeJ5Ge57xLEAbZEGlinpQTeygqwwxWk24S/BsVunYN80w=;
Received: from mail-yw1-f178.google.com ([209.85.128.178])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1puhML-0005aC-SJ for kgdb-bugreport@lists.sourceforge.net;
 Thu, 04 May 2023 22:23:34 +0000
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-55a10577911so15392487b3.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 04 May 2023 15:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1683239008; x=1685831008;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RCs/9iBvrEyNVZzCTd/A2GImby0Xt44Wx/SBN2PNOfk=;
 b=Kmk10me8K9sI/tTbbndFXzvBglH9/6TU2a3AYfjd5aSfJjHRVD2kBT0RGVxIfuiNo2
 auTWGbuPk5RrDCX5hzqqdmIstAVixIInYntF6dYw7nhc9wYfFFOLJP1HMUptMkpPG15X
 B0F6NTLPlv2LMgxhsJflNv4ZRXNn1nIZ+dJA0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683239008; x=1685831008;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RCs/9iBvrEyNVZzCTd/A2GImby0Xt44Wx/SBN2PNOfk=;
 b=bIchrqByjPc4Mdx6BatQrZ3mJu3WY2ZiGAimoFghft9Suknc5DMutNVaqE53QyGCTD
 uQMNdjdxnrxiAMYydjpV9pLiz2W/epuPELf1Ot1ytx+xrHDtNXOStMkKDbHdbT1hTUGK
 FR+gQts8pdB7Gw5mO4GS16O+xlVbaZjiEBMohaaZi1i3Lw+2SNlAQmrLhYPeHLji1iim
 /XXOFSekC5E7FS3y7G8RKcDMyBBiGqOEVWDcQGgyVfDyrIjK6vMDz9mjfsQ3xrWL4cyJ
 9mHFZqE7oi7OC6EetYoyYC8ZYCdIicxRVO4luwuVKt86RazKnL6ueA9+jNmmVVh8dhJj
 FDdA==
X-Gm-Message-State: AC+VfDxXnDdrwLlfBE0l+oNatdv3s23OCsghTl0BJfr8uJ/Qq6pMErxo
 E4pFDBYqJ8runQzPZRepWumQJ/g1kiMtVZrywBU=
X-Google-Smtp-Source: ACHHUZ4bjw0v8Xh/Woiy1NQGEjRjWjT2i7Xc46n+u6XewoR1B1k66XrwvIaSaiBkKMffZjH8lkWATQ==
X-Received: by 2002:a05:6a00:c94:b0:643:cb0:2bbe with SMTP id
 a20-20020a056a000c9400b006430cb02bbemr4970419pfv.15.1683238534258; 
 Thu, 04 May 2023 15:15:34 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:edf0:7321:6b9e:d5e7])
 by smtp.gmail.com with ESMTPSA id
 g26-20020aa7819a000000b006437c0edf9csm169615pfi.16.2023.05.04.15.15.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 15:15:33 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Petr Mladek <pmladek@suse.com>, Andrew Morton <akpm@linux-foundation.org>
Date: Thu,  4 May 2023 15:13:48 -0700
Message-ID: <20230504151100.v4.16.Ia9d02578e89c3f44d3cb12eec8b0176603c8ab2f@changeid>
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
 Content preview:  From: Lecopzer Chen <lecopzer.chen@mediatek.com> Set safe
 maximum CPU frequency to 5 GHz in case a particular platform doesn't implement
 cpufreq driver. Although, architecture doesn't put any restrictions on maximum
 frequency but 5 GHz seems to be s [...] 
 Content analysis details:   (-0.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.178 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.128.178 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1puhML-0005aC-SJ
Subject: [Kgdb-bugreport] [PATCH v4 16/17] arm64: add
 hw_nmi_get_sample_period for preparation of lockup detector
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

Set safe maximum CPU frequency to 5 GHz in case a particular platform
doesn't implement cpufreq driver.
Although, architecture doesn't put any restrictions on
maximum frequency but 5 GHz seems to be safe maximum given the available
Arm CPUs in the market which are clocked much less than 5 GHz.

On the other hand, we can't make it much higher as it would lead to
a large hard-lockup detection timeout on parts which are running
slower (eg. 1GHz on Developerbox) and doesn't possess a cpufreq driver.

Co-developed-by: Sumit Garg <sumit.garg@linaro.org>
Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
Co-developed-by: Pingfan Liu <kernelfans@gmail.com>
Signed-off-by: Pingfan Liu <kernelfans@gmail.com>
Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
I yanked this patch from the mailing lists [1] into my series just to
make it easier to avoid conflicts between my series and the one adding
the arm64 perf hardlockup detector, in case someone wanted to test
them both together.

The only change I made here was to remove an extra blank line that
checkpatch complained about.

As mentioned in the cover letter, I'm not really expecting this patch
to land together with the patches for the buddy detector. I included
it with my series simply for convenience of testing both series
together.

NOTE: the previous patch posted by Lecopzer pointed to Sumit's
patch [2] in the commit text but provided no context. I moved it to
this "after the cut" note.

[1] https://lore.kernel.org/r/20220903093415.15850-6-lecopzer.chen@mediatek.com/
[2] http://lore.kernel.org/linux-arm-kernel/1610712101-14929-1-git-send-email-sumit.garg@linaro.org

Changes in v4:
- Pulled ("add hw_nmi_get_sample_period for ...") into my series for v4.

 arch/arm64/kernel/Makefile       |  1 +
 arch/arm64/kernel/watchdog_hld.c | 24 ++++++++++++++++++++++++
 2 files changed, 25 insertions(+)
 create mode 100644 arch/arm64/kernel/watchdog_hld.c

diff --git a/arch/arm64/kernel/Makefile b/arch/arm64/kernel/Makefile
index ceba6792f5b3..f8e2645406a4 100644
--- a/arch/arm64/kernel/Makefile
+++ b/arch/arm64/kernel/Makefile
@@ -46,6 +46,7 @@ obj-$(CONFIG_MODULES)			+= module.o
 obj-$(CONFIG_ARM64_MODULE_PLTS)		+= module-plts.o
 obj-$(CONFIG_PERF_EVENTS)		+= perf_regs.o perf_callchain.o
 obj-$(CONFIG_HW_PERF_EVENTS)		+= perf_event.o
+obj-$(CONFIG_HARDLOCKUP_DETECTOR_PERF)	+= watchdog_hld.o
 obj-$(CONFIG_HAVE_HW_BREAKPOINT)	+= hw_breakpoint.o
 obj-$(CONFIG_CPU_PM)			+= sleep.o suspend.o
 obj-$(CONFIG_CPU_IDLE)			+= cpuidle.o
diff --git a/arch/arm64/kernel/watchdog_hld.c b/arch/arm64/kernel/watchdog_hld.c
new file mode 100644
index 000000000000..2401eb1b7e55
--- /dev/null
+++ b/arch/arm64/kernel/watchdog_hld.c
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <linux/cpufreq.h>
+
+/*
+ * Safe maximum CPU frequency in case a particular platform doesn't implement
+ * cpufreq driver. Although, architecture doesn't put any restrictions on
+ * maximum frequency but 5 GHz seems to be safe maximum given the available
+ * Arm CPUs in the market which are clocked much less than 5 GHz. On the other
+ * hand, we can't make it much higher as it would lead to a large hard-lockup
+ * detection timeout on parts which are running slower (eg. 1GHz on
+ * Developerbox) and doesn't possess a cpufreq driver.
+ */
+#define SAFE_MAX_CPU_FREQ	5000000000UL // 5 GHz
+u64 hw_nmi_get_sample_period(int watchdog_thresh)
+{
+	unsigned int cpu = smp_processor_id();
+	unsigned long max_cpu_freq;
+
+	max_cpu_freq = cpufreq_get_hw_max_freq(cpu) * 1000UL;
+	if (!max_cpu_freq)
+		max_cpu_freq = SAFE_MAX_CPU_FREQ;
+
+	return (u64)max_cpu_freq * watchdog_thresh;
+}
-- 
2.40.1.521.gf1e218fcd8-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
