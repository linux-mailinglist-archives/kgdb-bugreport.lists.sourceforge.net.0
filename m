Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 32ACE70A955
	for <lists+kgdb-bugreport@lfdr.de>; Sat, 20 May 2023 18:55:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1q0PrB-0000uM-0i
	for lists+kgdb-bugreport@lfdr.de;
	Sat, 20 May 2023 16:55:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1q03uf-0005hp-Tv
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 19 May 2023 17:29:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ofKCq2S0sG4HUWPTrK47G6OxIUEY0NpUnbveH+FrW0Q=; b=FEn4L72A7UYRxej4G0KdRdyQNb
 HBGzcFwkyda0bPsSx+47XSQU6qtj6AjCEEW2MMuu3tUzCDxl4XVEFvv4s3IWTf3Nbwj9lYa41jrIo
 kBgxEA7zVKt6DV5IbOUQribNxra8rYJpFWQ/6rXBmMQH7AF9f8/1/fMStWsR6wwhZBCs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ofKCq2S0sG4HUWPTrK47G6OxIUEY0NpUnbveH+FrW0Q=; b=dDYtvSEiHrTJY4AxDYQs0xKnNe
 A4JYwbC+sjEiK2OwtWJ112/OoVWmwGwPjOUP9PngoHA9bk4osc/ZcEmfMGBzbUv4NZn3Sy9PTDJXi
 SJ60dnB1JwVcgZqt4mCc91Vt8PnXOftW36+S0TDxTlAfLna0oCYVbXh90qSzpfFvqimE=;
Received: from mail-qt1-f178.google.com ([209.85.160.178])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q03ue-00DYEN-5n for kgdb-bugreport@lists.sourceforge.net;
 Fri, 19 May 2023 17:29:09 +0000
Received: by mail-qt1-f178.google.com with SMTP id
 d75a77b69052e-3f52d303bcdso35838851cf.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 19 May 2023 10:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1684517340; x=1687109340;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ofKCq2S0sG4HUWPTrK47G6OxIUEY0NpUnbveH+FrW0Q=;
 b=e2uLQM9K715V+goGK+3zNqEOD3d3aHU7C6j8UWPgQi9MHcfqZLnu3CRa+sGgD643np
 HhC6o8jzURvBwrmojrYCE61/vBdmPB3WyrdDqF7l/uXGobabSxboTSsBIhuKB9X58zEU
 wIKuhpB9udAOwNMJoI/gPX++NdtAX9JC/Khb8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684517340; x=1687109340;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ofKCq2S0sG4HUWPTrK47G6OxIUEY0NpUnbveH+FrW0Q=;
 b=ecdp6LvD1Sh57B07Zv9D1ntDoqVud2Q5JEUrDrl5qk32pLZFJbZ+nv5o5YUhVe3BXo
 TsbJ+tXRd6wSRFfTrdIZHyXodlTnls7CJsbyj6Umdeea842uHekQSBk1KMOT2oD3fMwH
 gqXCs+NnX8sqLSLwRQa8vu0TxY/sapK6GibQJUCyuyCXM0O2oQPxXQD8Y/TwjIUwvT5K
 RXBOVjsqeUFlwhij+Y0ke8MN1dKFjPzI7I8yp6tarB3XHlyFVbKpaQK0HFW54NExMEbC
 69cR4IVSV1xKKej+0HvGAUcqz0JHdadLW0r6DbeL8l6bfQ5kZMoVZNGAHBQDDfYMnX3o
 g0Ag==
X-Gm-Message-State: AC+VfDyTQQz6kDPaHeEEXp/wcpyG8tMlb9uYpvfrrgVLq9wIqBB9Fe3N
 hzntPhjq7gyu/NQu1H9v0EOPUPXU4XYtRxtm9Wc=
X-Google-Smtp-Source: ACHHUZ7fGH54d53wt7Qy3yd+9dOsRWtuxyqWrzI9KH6HBzcejmAdPhN2FZgql87OeZSuuRnqTNforg==
X-Received: by 2002:a17:90a:c503:b0:253:41b8:13d6 with SMTP id
 k3-20020a17090ac50300b0025341b813d6mr2750064pjt.21.1684516890703; 
 Fri, 19 May 2023 10:21:30 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:9b89:2dd0:d160:429d])
 by smtp.gmail.com with ESMTPSA id
 gj19-20020a17090b109300b0024e4f169931sm1763835pjb.2.2023.05.19.10.21.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 May 2023 10:21:29 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Petr Mladek <pmladek@suse.com>, Andrew Morton <akpm@linux-foundation.org>
Date: Fri, 19 May 2023 10:18:41 -0700
Message-ID: <20230519101840.v5.17.Ia9d02578e89c3f44d3cb12eec8b0176603c8ab2f@changeid>
X-Mailer: git-send-email 2.40.1.698.g37aff9b760-goog
In-Reply-To: <20230519101840.v5.18.Ia44852044cdcb074f387e80df6b45e892965d4a1@changeid>
References: <20230519101840.v5.18.Ia44852044cdcb074f387e80df6b45e892965d4a1@changeid>
MIME-Version: 1.0
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Lecopzer Chen <lecopzer.chen@mediatek.com> Set safe
 maximum CPU frequency to 5 GHz in case a particular platform doesn't implement
 cpufreq driver. Although, architecture doesn't put any restrictions on maximum
 frequency but 5 GHz seems to be s [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.160.178 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.160.178 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q03ue-00DYEN-5n
Subject: [Kgdb-bugreport] [PATCH v5 17/18] arm64: add
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

(no changes since v4)

Changes in v4:
- Pulled ("add hw_nmi_get_sample_period for ...") into my series for v4.

 arch/arm64/kernel/Makefile       |  1 +
 arch/arm64/kernel/watchdog_hld.c | 24 ++++++++++++++++++++++++
 2 files changed, 25 insertions(+)
 create mode 100644 arch/arm64/kernel/watchdog_hld.c

diff --git a/arch/arm64/kernel/Makefile b/arch/arm64/kernel/Makefile
index 7c2bb4e72476..cc22011ab66a 100644
--- a/arch/arm64/kernel/Makefile
+++ b/arch/arm64/kernel/Makefile
@@ -45,6 +45,7 @@ obj-$(CONFIG_FUNCTION_TRACER)		+= ftrace.o entry-ftrace.o
 obj-$(CONFIG_MODULES)			+= module.o
 obj-$(CONFIG_ARM64_MODULE_PLTS)		+= module-plts.o
 obj-$(CONFIG_PERF_EVENTS)		+= perf_regs.o perf_callchain.o
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
2.40.1.698.g37aff9b760-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
