Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A61F0784C12
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 22 Aug 2023 23:31:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1qYYxv-0005Mn-EP
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 22 Aug 2023 21:31:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1qYYxt-0005Mg-K1
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 22 Aug 2023 21:31:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=P5gCGegQW5oGbMQ/BTeF2BnmDhxlWa9PqRY9ItnmdA4=; b=P2+jEUKl3zxa2AWZy5yGYGOGCI
 Zl/JsR7/mapI27OipMgOfOPXDLPjl6ei8AZjeq3T/n5DZsa3bop8iLQjQ/mGpJccoOBloDLiPruVq
 wujP0KbLS4kM1ALJvUeMWE9MiNpKxm5AKafQ0rFbMv57De0Y1fYc29BhJjZDm5Z+NCQ0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=P5gCGegQW5oGbMQ/BTeF2BnmDhxlWa9PqRY9ItnmdA4=; b=BUiSVKYVzVB9naSXB6brOrJGOb
 T4mr7CeIwg9NO8jACitmYoKWyPrC6m3xCyFEG5dCe9DX7d4f6xboieLm+DTbRNT+llgqWh3f7Neje
 kCTDH9HzqM8RrwnI5raeIxgBdJDpEv92F/W/T7NlDCS4e17aKwfG4JoIcfO4u1Zeiac0=;
Received: from mail-pl1-f174.google.com ([209.85.214.174])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qYYxq-00Cf6K-Rj for kgdb-bugreport@lists.sourceforge.net;
 Tue, 22 Aug 2023 21:31:06 +0000
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-1bbc87ded50so33055005ad.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 22 Aug 2023 14:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1692739857; x=1693344657;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P5gCGegQW5oGbMQ/BTeF2BnmDhxlWa9PqRY9ItnmdA4=;
 b=i2j2emfnK5XP7t+5MPqLiRHwEldyIx58mwxs8qZCGbml5ejZ6JH7+3EA7zApwPx7Xp
 DKzJZt+j4/BQ260X/yfDtcOiRK549Q7XtaY8dwyRKZzevzWXRbEs0+J82fq0ifmhegao
 Q+N6UM9e5wW7FSXIc832M2QlxQB51Qtz5z/vA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692739857; x=1693344657;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P5gCGegQW5oGbMQ/BTeF2BnmDhxlWa9PqRY9ItnmdA4=;
 b=lqJ+r0K4Q52XIibgEprUTM+E/csG24R0LXDVHcgZa6S/rjPNRa0UlwR92I44dt9jvb
 CFq9iQw8ee1SD/dliqV96eHgLTKco1QHiIk/R6GzejUtGdnVA6b9+oZdxuSC1tBYOI+R
 QepKzrUh3bH/DVVDVIA2qbLLJfUZi8ubercM5XGMK6/3r7zoXTdB7t8ALaoFYq8Y2Z1J
 Pj8rnw+UjNgl3U1m99ZgUT3/YSqghl1Yx0UvN3e0YsO+xXfRpp88CBsIR6hYoWYHpm6I
 CJbQU0+/POv4MTM0TxEKBPIpibECQq1mvAJOou5f3kHgVc3EsZdnUJ8oLVJPp2sP1b5c
 Y8lQ==
X-Gm-Message-State: AOJu0YyZl7gBw2HQHW/L9oJHyZ1/DpbmUx0CjWifKtyHv8iewdK+1g6P
 6U3MJz9W7u9RJrUcAUmRdvNo3hEJd9eG9Q5qUkoSTP42
X-Google-Smtp-Source: AGHT+IHzEMJvwLDxrbrpnP1PL0V1S39JCggLWYRvJ4nQH33U88JSDAsszYF9eNIHgI3tAnb1soYQPw==
X-Received: by 2002:a17:903:41cc:b0:1af:aafb:64c8 with SMTP id
 u12-20020a17090341cc00b001afaafb64c8mr8892237ple.21.1692739857271; 
 Tue, 22 Aug 2023 14:30:57 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:83f0:2bc5:38c4:a9de])
 by smtp.gmail.com with ESMTPSA id
 t7-20020a170902e84700b001befac3b3cbsm9451475plg.290.2023.08.22.14.30.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Aug 2023 14:30:56 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Sumit Garg <sumit.garg@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Marc Zyngier <maz@kernel.org>
Date: Tue, 22 Aug 2023 14:27:01 -0700
Message-ID: <20230822142644.v10.6.I2ef26d1b3bfbed2d10a281942b0da7d9854de05e@changeid>
X-Mailer: git-send-email 2.42.0.rc1.204.g551eb34607-goog
In-Reply-To: <20230822212927.249645-1-dianders@chromium.org>
References: <20230822212927.249645-1-dianders@chromium.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Up until now we've been using the generic (weak)
 implementation
 for kgdb_roundup_cpus() when using kgdb on arm64. Let's move to a custom
 one. The advantage here is that, when pseudo-NMI is enabled on [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.174 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.174 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1qYYxq-00Cf6K-Rj
Subject: [Kgdb-bugreport] [PATCH v10 6/6] arm64: kgdb: Implement
 kgdb_roundup_cpus() to enable pseudo-NMI roundup
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
Cc: Valentin Schneider <vschneid@redhat.com>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 D Scott Phillips <scott@os.amperecomputing.com>,
 Lecopzer Chen <lecopzer.chen@mediatek.com>,
 Peter Zijlstra <peterz@infradead.org>, kgdb-bugreport@lists.sourceforge.net,
 Josh Poimboeuf <jpoimboe@kernel.org>, ito-yuichi@fujitsu.com,
 linux-kernel@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
 linux-perf-users@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 Thomas Gleixner <tglx@linutronix.de>, Masayoshi Mizuma <msys.mizuma@gmail.com>,
 Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Up until now we've been using the generic (weak) implementation for
kgdb_roundup_cpus() when using kgdb on arm64. Let's move to a custom
one. The advantage here is that, when pseudo-NMI is enabled on a
device, we'll be able to round up CPUs using pseudo-NMI. This allows
us to debug CPUs that are stuck with interrupts disabled. If
pseudo-NMIs are not enabled then we'll fallback to just using an IPI,
which is still slightly better than the generic implementation since
it avoids the potential situation described in the generic
kgdb_call_nmi_hook().

Co-developed-by: Sumit Garg <sumit.garg@linaro.org>
Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
I debated whether this should be in "arch/arm64/kernel/smp.c" or if I
should try to find a way for it to go into "arch/arm64/kernel/kgdb.c".
In the end this is so little code that it didn't seem worth it to find
a way to export the IPI defines or to otherwise come up with some API
between kgdb.c and smp.c. If someone has strong feelings and wants
this to change, please shout and give details of your preferred
solution.

FWIW, it seems like ~half the other platforms put this in "smp.c" with
an ifdef for KGDB and the other half put it in "kgdb.c" with an ifdef
for SMP. :-P

Changes in v10:
- Don't allocate the cpumask on the stack; just iterate.
- Moved kgdb calls to smp.c to avoid needing to export IPI info.
- kgdb now has its own IPI.

Changes in v9:
- Remove fallback for when debug IPI isn't available.
- Renamed "NMI IPI" to "debug IPI" since it might not be backed by NMI.

 arch/arm64/kernel/smp.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index c51d54019f5f..5ee6b69b4360 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -32,6 +32,7 @@
 #include <linux/irq_work.h>
 #include <linux/kernel_stat.h>
 #include <linux/kexec.h>
+#include <linux/kgdb.h>
 #include <linux/kvm_host.h>
 #include <linux/nmi.h>
 
@@ -75,10 +76,11 @@ enum ipi_msg_type {
 	IPI_IRQ_WORK,
 	NR_IPI,
 	/*
-	 * CPU_BACKTRACE is special and not included in NR_IPI
+	 * CPU_BACKTRACE and KGDB_ROUNDUP are special and not included in NR_IPI
 	 * or tracable with trace_ipi_*
 	 */
 	IPI_CPU_BACKTRACE = NR_IPI,
+	IPI_KGDB_ROUNDUP,
 	MAX_IPI
 };
 
@@ -868,6 +870,22 @@ void arch_trigger_cpumask_backtrace(const cpumask_t *mask, int exclude_cpu)
 	nmi_trigger_cpumask_backtrace(mask, exclude_cpu, arm64_backtrace_ipi);
 }
 
+#ifdef CONFIG_KGDB
+void kgdb_roundup_cpus(void)
+{
+	int this_cpu = raw_smp_processor_id();
+	int cpu;
+
+	for_each_online_cpu(cpu) {
+		/* No need to roundup ourselves */
+		if (cpu == this_cpu)
+			continue;
+
+		__ipi_send_single(ipi_desc[IPI_KGDB_ROUNDUP], cpu);
+	}
+}
+#endif
+
 /*
  * Main handler for inter-processor interrupts
  */
@@ -919,6 +937,10 @@ static void do_handle_IPI(int ipinr)
 		nmi_cpu_backtrace(get_irq_regs());
 		break;
 
+	case IPI_KGDB_ROUNDUP:
+		kgdb_nmicallback(cpu, get_irq_regs());
+		break;
+
 	default:
 		pr_crit("CPU%u: Unknown IPI message 0x%x\n", cpu, ipinr);
 		break;
@@ -949,6 +971,7 @@ static bool ipi_should_be_nmi(enum ipi_msg_type ipi)
 	case IPI_CPU_STOP:
 	case IPI_CPU_CRASH_STOP:
 	case IPI_CPU_BACKTRACE:
+	case IPI_KGDB_ROUNDUP:
 		return true;
 	default:
 		return false;
-- 
2.42.0.rc1.204.g551eb34607-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
