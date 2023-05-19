Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D21D170A94F
	for <lists+kgdb-bugreport@lfdr.de>; Sat, 20 May 2023 18:55:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1q0Pr9-0000tC-ME
	for lists+kgdb-bugreport@lfdr.de;
	Sat, 20 May 2023 16:54:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1q03n1-0005bV-3Z
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 19 May 2023 17:21:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ie3WjW8dWxj5WOSXB5283RQPy/3pGkianoLx2tVNmSE=; b=PgJXy2i8HFOa+x/VyiNYiIMYRp
 lUKri0rXPmGOt/bKs1sJgCDNTm5hSIXZl9AkQf4Cwkx7s9LXkxSTAGOFd+DSPQYSzUjg301fbWhSK
 bHTCmU2Cn9sMV4a2AC7CwyNRk4cDfjxwucsKd9hRRVj8cLaFvThgg4c4N2euYoaMeNlI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ie3WjW8dWxj5WOSXB5283RQPy/3pGkianoLx2tVNmSE=; b=AMt1kw6rfrCU6TK9da0EeSTA6s
 flcNN6YY2C8q5mPv/MHcv9mBFlBWIUQBmnkvN4UBOvCVNX9jun1eIol3bP+PiRdHMb53di2KPeQdY
 giHYa9CTtBcK/fqgLzzQm4cx2jKLtSDjO+bQb0jQQdXrYp0w2hrc3EBwclmoidy2PuQw=;
Received: from mail-pl1-f178.google.com ([209.85.214.178])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q03mz-00DXtM-DL for kgdb-bugreport@lists.sourceforge.net;
 Fri, 19 May 2023 17:21:15 +0000
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-1ae408f4d1aso28006755ad.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 19 May 2023 10:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1684516868; x=1687108868;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ie3WjW8dWxj5WOSXB5283RQPy/3pGkianoLx2tVNmSE=;
 b=YFzuFJ4eWMAMLZhwqw3DBL6QSzTZYYa5+5StBECaLdL4G4pigB8ofT1gcUdimpiEex
 TUDIfFVtwz5+KlRL7JQHT2da3WMxmdqENRL5ms2CGY+2q3hdCV2Nt79wd9AtATEzbUlN
 2n+bREyXkWhUEo1Yo+8a9WsEEPMByfDapf0rA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684516868; x=1687108868;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ie3WjW8dWxj5WOSXB5283RQPy/3pGkianoLx2tVNmSE=;
 b=Z1aoBtcdW4SgcWdyMrMqTgRyoh/WoJYCBQqdZOWvuBsVSHbtZFsCHW535D2vpN2epR
 uq7YK5SxBM2CONM896le7wJpF59FRJW0ekGv98pcSKZ+30PcNA0v66CJ6LaQt2narUmC
 PzIAZ/SSWwhmAyXGTJY2OeD6Ikq0hyQ/YEwwcr1c50uaF4X8G/BRJWrznQr6wn45NhKS
 v5dwV1mX6L7jVOXfbSByD1QeTBxbn9A8j40SD1C2Z2oJbhZ5nf4/3KXGNiWBSRidvCMy
 Fi6XkgupXGOmzMOV0XOR875ycqv2qWgAqmvhxlWYxbA/auWlYditbI5HLoqK3UHCoK8X
 Hhdg==
X-Gm-Message-State: AC+VfDwHSBYJ62fOjdGmR4yudHC3ZSfPO+Lan4kQeAQ96iyKYH9Ix2rn
 7alIPMSyL7aPuT/ji4B5qlf7tg==
X-Google-Smtp-Source: ACHHUZ7ATOZ4rrYyAkhTlLlxcJ+5wIJmhvaJz9egSunvv+DUCDA9ft5dxcoQbbZfEUNE16sB4U4I0A==
X-Received: by 2002:a17:903:2343:b0:1ae:bf5:7a7 with SMTP id
 c3-20020a170903234300b001ae0bf507a7mr3990597plh.35.1684516867869; 
 Fri, 19 May 2023 10:21:07 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:9b89:2dd0:d160:429d])
 by smtp.gmail.com with ESMTPSA id
 gj19-20020a17090b109300b0024e4f169931sm1763835pjb.2.2023.05.19.10.21.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 May 2023 10:21:07 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Petr Mladek <pmladek@suse.com>, Andrew Morton <akpm@linux-foundation.org>
Date: Fri, 19 May 2023 10:18:34 -0700
Message-ID: <20230519101840.v5.10.I3a7d4dd8c23ac30ee0b607d77feb6646b64825c0@changeid>
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
 Content preview:  In preparation for the buddy hardlockup detector where the
 CPU checking for lockup might not be the currently running CPU, add a "cpu"
 parameter to watchdog_hardlockup_check(). As part of this change,
 make hrtimer_interrupts
 an atomic_t since now the CPU incrementing the value and the CPU reading
 the value might be different. Technially this could also be done with just
 READ [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.178 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.178 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q03mz-00DXtM-DL
Subject: [Kgdb-bugreport] [PATCH v5 10/18] watchdog/hardlockup: Add a "cpu"
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

In preparation for the buddy hardlockup detector where the CPU
checking for lockup might not be the currently running CPU, add a
"cpu" parameter to watchdog_hardlockup_check().

As part of this change, make hrtimer_interrupts an atomic_t since now
the CPU incrementing the value and the CPU reading the value might be
different. Technially this could also be done with just READ_ONCE and
WRITE_ONCE, but atomic_t feels a little cleaner in this case.

While hrtimer_interrupts is made atomic_t, we change
hrtimer_interrupts_saved from "unsigned long" to "int". The "int" is
needed to match the data type backing atomic_t for hrtimer_interrupts.
Even if this changes us from 64-bits to 32-bits (which I don't think
is true for most compilers), it doesn't really matter. All we ever do
is increment it every few seconds and compare it to an old value so
32-bits is fine (even 16-bits would be). The "signed" vs "unsigned"
also doesn't matter for simple equality comparisons.

hrtimer_interrupts_saved is _not_ switched to atomic_t nor even
accessed with READ_ONCE / WRITE_ONCE. The hrtimer_interrupts_saved is
always consistently accessed with the same CPU. NOTE: with the
upcoming "buddy" detector there is one special case. When a CPU goes
offline/online then we can change which CPU is the one to consistently
access a given instance of hrtimer_interrupts_saved. We still can't
end up with a partially updated hrtimer_interrupts_saved, however,
because we end up petting all affected CPUs to make sure the new and
old CPU can't end up somehow read/write hrtimer_interrupts_saved at
the same time.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v5:
- Don't dump stack on the buddy CPU if we fail to backtrace the hung CPU.
- Use atomic_t for hrtimer_interrupts.

Changes in v4:
- ("Add a "cpu" param to watchdog_hardlockup_check()") new for v4.

 include/linux/nmi.h    |  2 +-
 kernel/watchdog.c      | 52 ++++++++++++++++++++++++++----------------
 kernel/watchdog_perf.c |  2 +-
 3 files changed, 34 insertions(+), 22 deletions(-)

diff --git a/include/linux/nmi.h b/include/linux/nmi.h
index 0c62c1bf0a71..92aa568c0c42 100644
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
index 169e5dffbc00..2552e224f76a 100644
--- a/kernel/watchdog.c
+++ b/kernel/watchdog.c
@@ -87,29 +87,34 @@ __setup("nmi_watchdog=", hardlockup_panic_setup);
 
 #if defined(CONFIG_HARDLOCKUP_DETECTOR_PERF)
 
-static DEFINE_PER_CPU(unsigned long, hrtimer_interrupts);
-static DEFINE_PER_CPU(unsigned long, hrtimer_interrupts_saved);
+static DEFINE_PER_CPU(atomic_t, hrtimer_interrupts);
+static DEFINE_PER_CPU(int, hrtimer_interrupts_saved);
 static DEFINE_PER_CPU(bool, watchdog_hardlockup_warned);
 static unsigned long watchdog_hardlockup_all_cpu_dumped;
 
-static bool is_hardlockup(void)
+static bool is_hardlockup(unsigned int cpu)
 {
-	unsigned long hrint = __this_cpu_read(hrtimer_interrupts);
+	int hrint = atomic_read(&per_cpu(hrtimer_interrupts, cpu));
 
-	if (__this_cpu_read(hrtimer_interrupts_saved) == hrint)
+	if (per_cpu(hrtimer_interrupts_saved, cpu) == hrint)
 		return true;
 
-	__this_cpu_write(hrtimer_interrupts_saved, hrint);
+	/*
+	 * NOTE: we don't need any fancy atomic_t or READ_ONCE/WRITE_ONCE
+	 * for hrtimer_interrupts_saved. hrtimer_interrupts_saved is
+	 * written/read by a single CPU.
+	 */
+	per_cpu(hrtimer_interrupts_saved, cpu) = hrint;
 
 	return false;
 }
 
 static void watchdog_hardlockup_kick(void)
 {
-	__this_cpu_inc(hrtimer_interrupts);
+	atomic_inc(raw_cpu_ptr(&hrtimer_interrupts));
 }
 
-void watchdog_hardlockup_check(struct pt_regs *regs)
+void watchdog_hardlockup_check(unsigned int cpu, struct pt_regs *regs)
 {
 	/*
 	 * Check for a hardlockup by making sure the CPU's timer
@@ -117,35 +122,42 @@ void watchdog_hardlockup_check(struct pt_regs *regs)
 	 * fired multiple times before we overflow'd. If it hasn't
 	 * then this is a good indication the cpu is stuck
 	 */
-	if (is_hardlockup()) {
+	if (is_hardlockup(cpu)) {
 		unsigned int this_cpu = smp_processor_id();
+		struct cpumask backtrace_mask = *cpu_online_mask;
 
 		/* Only print hardlockups once. */
-		if (__this_cpu_read(watchdog_hardlockup_warned))
+		if (per_cpu(watchdog_hardlockup_warned, cpu))
 			return;
 
-		pr_emerg("Watchdog detected hard LOCKUP on cpu %d\n", this_cpu);
+		pr_emerg("Watchdog detected hard LOCKUP on cpu %d\n", cpu);
 		print_modules();
 		print_irqtrace_events(current);
-		if (regs)
-			show_regs(regs);
-		else
-			dump_stack();
+		if (cpu == this_cpu) {
+			if (regs)
+				show_regs(regs);
+			else
+				dump_stack();
+			cpumask_clear_cpu(cpu, &backtrace_mask);
+		} else {
+			if (trigger_single_cpu_backtrace(cpu))
+				cpumask_clear_cpu(cpu, &backtrace_mask);
+		}
 
 		/*
-		 * Perform all-CPU dump only once to avoid multiple hardlockups
-		 * generating interleaving traces
+		 * Perform multi-CPU dump only once to avoid multiple
+		 * hardlockups generating interleaving traces
 		 */
 		if (sysctl_hardlockup_all_cpu_backtrace &&
 		    !test_and_set_bit(0, &watchdog_hardlockup_all_cpu_dumped))
-			trigger_allbutself_cpu_backtrace();
+			trigger_cpumask_backtrace(&backtrace_mask);
 
 		if (hardlockup_panic)
 			nmi_panic(regs, "Hard LOCKUP");
 
-		__this_cpu_write(watchdog_hardlockup_warned, true);
+		per_cpu(watchdog_hardlockup_warned, cpu) = true;
 	} else {
-		__this_cpu_write(watchdog_hardlockup_warned, false);
+		per_cpu(watchdog_hardlockup_warned, cpu) = false;
 	}
 }
 
diff --git a/kernel/watchdog_perf.c b/kernel/watchdog_perf.c
index 04415812d079..4e60e8023515 100644
--- a/kernel/watchdog_perf.c
+++ b/kernel/watchdog_perf.c
@@ -120,7 +120,7 @@ static void watchdog_overflow_callback(struct perf_event *event,
 		return;
 	}
 
-	watchdog_hardlockup_check(regs);
+	watchdog_hardlockup_check(smp_processor_id(), regs);
 }
 
 static int hardlockup_detector_event_create(void)
-- 
2.40.1.698.g37aff9b760-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
