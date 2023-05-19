Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C0470A95A
	for <lists+kgdb-bugreport@lfdr.de>; Sat, 20 May 2023 18:55:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1q0PrC-0004c2-Cu
	for lists+kgdb-bugreport@lfdr.de;
	Sat, 20 May 2023 16:55:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1q03s1-00084M-5F
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 19 May 2023 17:26:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BBw4uifuzwjtC1EJSKRNgzKWGRkSP/trxFy/VEab+1U=; b=lQwBeUMt+izFQ22uMT7lwdcoKu
 oVQ5ZOYm5Ppr9KA9R+uRn00/iqND21ikPQnMW9nPcWLOsucB6tHstOEOzE6UUciDUKUwBrJsU0bZV
 7xjxB2fhiBdKy04rC1qli5bR4FbrVAGSl4BUsNskNPt3z8PXoFXjiKwOePn7LERxEAPQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BBw4uifuzwjtC1EJSKRNgzKWGRkSP/trxFy/VEab+1U=; b=gvdA54tajaxiHRfD81qobWlcuG
 UN0O8/PbGeDBnhLXZusxhtVrq4qkFLpzNkXDWD/KM1KcIKksQnH63Ap1Ivx+6kHQwPZTddw/QxUD5
 9II8qLiClGbnN7kqJyxdi9tkvQ9MIeCTWn9dtY7qwI6uz57bkIQZHq3AGUjnNqIm3dOY=;
Received: from mail-oa1-f44.google.com ([209.85.160.44])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q03rx-00DY8w-BS for kgdb-bugreport@lists.sourceforge.net;
 Fri, 19 May 2023 17:26:25 +0000
Received: by mail-oa1-f44.google.com with SMTP id
 586e51a60fabf-19615d6ef9eso2770229fac.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 19 May 2023 10:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1684517175; x=1687109175;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BBw4uifuzwjtC1EJSKRNgzKWGRkSP/trxFy/VEab+1U=;
 b=lrWjaeuYDmqyKeGcE0hnX39V+WFjas8N1+69I4/6CEJnH8HGnM8OOSH9SrnPsW0Nyb
 JWNiLrMyHS3QN7m5QjZ2zkDCVfn2+0v2DpVqNwdv7twymhnITosz68GgTg5NbnzNRhkk
 U76BnJ94kzPnyvr1mCDZlioG79/GzAArnRzYc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684517175; x=1687109175;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BBw4uifuzwjtC1EJSKRNgzKWGRkSP/trxFy/VEab+1U=;
 b=B/uisw8pmqA4rCPuGIhl805AdDs3MprF33jEpAaHrC1vJM2v0USmJhTEyG5qQdzyXv
 GcQa+4k6zFh90S2oFVZrMC/iOzu0lk4PXxn7ye6z/cGT1zNF8jTbOV8ClRMxlE0ND+ep
 XTe9dzUCuvxTWC1PkgeYekQWIpsRHjrk1amVZS9VJFymCHM8RDglUL+kupGkxOnh7Giu
 rE+kz5a81sXlRT0aHc6npRgq2zXo7I2Cj0Go38v0BT7F2VG0h4KZ8TwAEts5R+tNvyqZ
 /RRsGMIwR03QFasUHj8bP0lmVkUct5egmPRs91zPNpWNvM+Sg4DPBvuUTrbplZCrJE4n
 JN4A==
X-Gm-Message-State: AC+VfDxytjyBo1VLT5F+K5IiiQqs/i1JA6rsJA9uJyP35AkHeVCw7EA8
 OsPRlZeXWJq8Br1M6YuC2DjFdP8em5kNdVxQ8Pc=
X-Google-Smtp-Source: ACHHUZ4TDRDg+n16F9FgO6fjA4fEHipyKz1sAvTzlrch+J4I3oFlt6TdHTXq6tF/PHzC+ANYmNfBhw==
X-Received: by 2002:a17:90a:f3c7:b0:249:748b:a232 with SMTP id
 ha7-20020a17090af3c700b00249748ba232mr2835727pjb.25.1684516864714; 
 Fri, 19 May 2023 10:21:04 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:9b89:2dd0:d160:429d])
 by smtp.gmail.com with ESMTPSA id
 gj19-20020a17090b109300b0024e4f169931sm1763835pjb.2.2023.05.19.10.21.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 May 2023 10:21:04 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Petr Mladek <pmladek@suse.com>, Andrew Morton <akpm@linux-foundation.org>
Date: Fri, 19 May 2023 10:18:33 -0700
Message-ID: <20230519101840.v5.9.I818492c326b632560b09f20d2608455ecf9d3650@changeid>
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
 Content preview:  These are tiny style changes: - Add a blank line before a
 "return". - Renames two globals to use the "watchdog_hardlockup" prefix. -
 Store processor id in "unsigned int" rather than "int". - Minor com [...]
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.160.44 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.160.44 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q03rx-00DY8w-BS
Subject: [Kgdb-bugreport] [PATCH v5 09/18] watchdog/hardlockup: Style
 changes to watchdog_hardlockup_check() / is_hardlockup()
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

These are tiny style changes:
- Add a blank line before a "return".
- Renames two globals to use the "watchdog_hardlockup" prefix.
- Store processor id in "unsigned int" rather than "int".
- Minor comment rewording.
- Use "else" rather than extra returns since it seemed more symmetric.

Reviewed-by: Petr Mladek <pmladek@suse.com>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v5:
- watchdog_hardlockup_dumped_stacks => watchdog_hardlockup_all_cpu_dumped
- watchdog_hardlockup_processed => watchdog_hardlockup_warned

Changes in v4:
- ("Style changes to watchdog_hardlockup_check ...") new for v4.

 kernel/watchdog.c | 32 +++++++++++++++-----------------
 1 file changed, 15 insertions(+), 17 deletions(-)

diff --git a/kernel/watchdog.c b/kernel/watchdog.c
index 12ce37d76e7d..169e5dffbc00 100644
--- a/kernel/watchdog.c
+++ b/kernel/watchdog.c
@@ -89,8 +89,8 @@ __setup("nmi_watchdog=", hardlockup_panic_setup);
 
 static DEFINE_PER_CPU(unsigned long, hrtimer_interrupts);
 static DEFINE_PER_CPU(unsigned long, hrtimer_interrupts_saved);
-static DEFINE_PER_CPU(bool, hard_watchdog_warn);
-static unsigned long hardlockup_allcpu_dumped;
+static DEFINE_PER_CPU(bool, watchdog_hardlockup_warned);
+static unsigned long watchdog_hardlockup_all_cpu_dumped;
 
 static bool is_hardlockup(void)
 {
@@ -100,6 +100,7 @@ static bool is_hardlockup(void)
 		return true;
 
 	__this_cpu_write(hrtimer_interrupts_saved, hrint);
+
 	return false;
 }
 
@@ -110,21 +111,20 @@ static void watchdog_hardlockup_kick(void)
 
 void watchdog_hardlockup_check(struct pt_regs *regs)
 {
-	/* check for a hardlockup
-	 * This is done by making sure our timer interrupt
-	 * is incrementing.  The timer interrupt should have
-	 * fired multiple times before we overflow'd.  If it hasn't
+	/*
+	 * Check for a hardlockup by making sure the CPU's timer
+	 * interrupt is incrementing. The timer interrupt should have
+	 * fired multiple times before we overflow'd. If it hasn't
 	 * then this is a good indication the cpu is stuck
 	 */
 	if (is_hardlockup()) {
-		int this_cpu = smp_processor_id();
+		unsigned int this_cpu = smp_processor_id();
 
-		/* only print hardlockups once */
-		if (__this_cpu_read(hard_watchdog_warn) == true)
+		/* Only print hardlockups once. */
+		if (__this_cpu_read(watchdog_hardlockup_warned))
 			return;
 
-		pr_emerg("Watchdog detected hard LOCKUP on cpu %d\n",
-			 this_cpu);
+		pr_emerg("Watchdog detected hard LOCKUP on cpu %d\n", this_cpu);
 		print_modules();
 		print_irqtrace_events(current);
 		if (regs)
@@ -137,18 +137,16 @@ void watchdog_hardlockup_check(struct pt_regs *regs)
 		 * generating interleaving traces
 		 */
 		if (sysctl_hardlockup_all_cpu_backtrace &&
-				!test_and_set_bit(0, &hardlockup_allcpu_dumped))
+		    !test_and_set_bit(0, &watchdog_hardlockup_all_cpu_dumped))
 			trigger_allbutself_cpu_backtrace();
 
 		if (hardlockup_panic)
 			nmi_panic(regs, "Hard LOCKUP");
 
-		__this_cpu_write(hard_watchdog_warn, true);
-		return;
+		__this_cpu_write(watchdog_hardlockup_warned, true);
+	} else {
+		__this_cpu_write(watchdog_hardlockup_warned, false);
 	}
-
-	__this_cpu_write(hard_watchdog_warn, false);
-	return;
 }
 
 #else /* CONFIG_HARDLOCKUP_DETECTOR_PERF */
-- 
2.40.1.698.g37aff9b760-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
