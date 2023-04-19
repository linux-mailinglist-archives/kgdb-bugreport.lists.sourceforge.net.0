Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C786E85DD
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 20 Apr 2023 01:24:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1ppH9b-00046F-I5
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 19 Apr 2023 23:23:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1ppH9b-000468-2M
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 19 Apr 2023 23:23:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Yb6/i5wvA5aqg7D8OxOUWOO0Hm18poXHV7fpSzZnAys=; b=Mj5lLV6AilFQoZacMNwPtT/gvj
 /+cVYY/EzP2QSLUjO2ttJ744R6DWbs6jllAtLlC7pw93jxkTawWNnIeazUx5SaPVE5kpLU0InZ64V
 VAVLG8J6c8XHwBGKV0lna1fSvSUoDj/8QCEgKlNb5FXI0RnmJGON8BJ8g+V9H679qfuA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Yb6/i5wvA5aqg7D8OxOUWOO0Hm18poXHV7fpSzZnAys=; b=LfkhuyDNrPV60yvRURqa/MKcOw
 AYGu040ngBRDaxLZRVlJWOggYbMI9tZZvURjcL3Zmos5V9ag6TXW4AdWlZL1P/Pg4xKu6/HIxD1Eb
 TV0nJPLe+87pW07XS38i1IwZ86tP557AvKysO3C/HxycQgVeHQ3+QaZyL+L6R6OdqNeQ=;
Received: from mail-qv1-f48.google.com ([209.85.219.48])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1ppH9a-00D6qb-G9 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 19 Apr 2023 23:23:59 +0000
Received: by mail-qv1-f48.google.com with SMTP id
 6a1803df08f44-5eefa0a5561so940776d6.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 19 Apr 2023 16:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1681946632; x=1684538632;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Yb6/i5wvA5aqg7D8OxOUWOO0Hm18poXHV7fpSzZnAys=;
 b=UAFTmWy8F9xxqrLIV7qKeEfzPqPcHJ3Llnz1/mLCZGpiuyl1GvAn+TpCZVqFXqqPtu
 aWcwxhKTV15FURKVs0s390OoECqMBFrCHr8k5Ltet2XX+PkGd2gIaSCEhYW+pz2azTrb
 S1hybemqukOUrbuNEr7xkVPbdRjOguhrf28Pg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681946632; x=1684538632;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Yb6/i5wvA5aqg7D8OxOUWOO0Hm18poXHV7fpSzZnAys=;
 b=X7JjoiIofYxF4lmetr5SpyB2DB/Cq1oc/WxzI3SDSjtz/Ad+9IN+N8gdU2lIesujt2
 oSBGMtFCH80fPL8y7Tl7R5iUwWOelpc2wKs7t2hrpE2Hq0MNUqMdbKpGDeOqfoR70zUf
 fE2IIbtMI4t93BuuGnVIqSNHeV3QX6uTMKB+Xsj984ewE2JqoFh4LdqSzkIE0QDqKEE/
 LDU6/2oq3Xo8syCc+WFKLV3ArXgRXoZTNAz6dQyyKc7Td4/IJZPuQKoRPV2VNNShdTkv
 eRoo0qwTByIVVvBTvh6Zzu3ZdDjfR18PiyiZkpI0dYqpa3CqUwSOs8BP0jmXX1c3OvAH
 AyZw==
X-Gm-Message-State: AAQBX9dRPCEIPkybzdOsOkfkT8fsY3ItMt45zyrMiaQbq9IU2gH4AG7I
 Y9zA86CX3ig4ifuRUoiMydGKVcDFHTqs7NIFqFE=
X-Google-Smtp-Source: AKy350bC/5PM+ohv9/mlWqv8/0FC6IWAoMFnR21tmHI/E3Ye/uJYm0ouOTrfyEROhwU6t4EAkcC5kQ==
X-Received: by 2002:a05:6a20:3c8d:b0:ee:6c12:6c95 with SMTP id
 b13-20020a056a203c8d00b000ee6c126c95mr232937pzj.21.1681945030329; 
 Wed, 19 Apr 2023 15:57:10 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:8b1:fa03:670e:b784])
 by smtp.gmail.com with ESMTPSA id
 h15-20020a17090aea8f00b00246ea338c96sm1847101pjz.53.2023.04.19.15.57.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 15:57:09 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Sumit Garg <sumit.garg@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Date: Wed, 19 Apr 2023 15:55:58 -0700
Message-ID: <20230419155341.v8.4.I3929b13cb2fab48772537aa308cd89e6f8a6753c@changeid>
X-Mailer: git-send-email 2.40.0.634.g4ca3ef3211-goog
In-Reply-To: <20230419225604.21204-1-dianders@chromium.org>
References: <20230419225604.21204-1-dianders@chromium.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Sumit Garg <sumit.garg@linaro.org> Add a boolean return
 to arch_trigger_cpumask_backtrace() to support a use-case where a particular
 architecture detects at runtime if it supports NMI backtrace or it would
 like to fallback to default i [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.219.48 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.48 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ppH9a-00D6qb-G9
Subject: [Kgdb-bugreport] [PATCH v8 04/10] nmi: backtrace: Allow runtime
 arch specific override
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Huacai Chen <chenhuacai@kernel.org>,
 Jinyang He <hejinyang@loongson.cn>, Lecopzer Chen <lecopzer.chen@mediatek.com>,
 Peter Zijlstra <peterz@infradead.org>, kgdb-bugreport@lists.sourceforge.net,
 Dave Hansen <dave.hansen@linux.intel.com>, Qing Zhang <zhangqing@loongson.cn>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Guo Ren <guoren@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 sparclinux@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>,
 Gaosheng Cui <cuigaosheng1@huawei.com>, Michael Ellerman <mpe@ellerman.id.au>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Russell King <linux@armlinux.org.uk>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Ard Biesheuvel <ardb@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Ingo Molnar <mingo@redhat.com>, "Darrick J. Wong" <djwong@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, Masayoshi Mizuma <msys.mizuma@gmail.com>,
 Kees Cook <keescook@chromium.org>, "Paul E. McKenney" <paulmck@kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>, Stephen Boyd <swboyd@chromium.org>,
 loongarch@lists.linux.dev,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 Jianmin Lv <lvjianmin@loongson.cn>, Borislav Petkov <bp@alien8.de>,
 Ben Dooks <ben-linux@fluff.org>, Thomas Gleixner <tglx@linutronix.de>,
 Laurent Dufour <ldufour@linux.ibm.com>, linux-arm-kernel@lists.infradead.org,
 x86@kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-mips@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 ito-yuichi@fujitsu.com, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 "Gautham R. Shenoy" <gautham.shenoy@amd.com>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

From: Sumit Garg <sumit.garg@linaro.org>

Add a boolean return to arch_trigger_cpumask_backtrace() to support a
use-case where a particular architecture detects at runtime if it supports
NMI backtrace or it would like to fallback to default implementation using
SMP cross-calls.

Currently such an architecture example is arm64 supporting pseudo NMIs
feature which is only available on platforms which have support for GICv3
or later version.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
Tested-by: Chen-Yu Tsai <wens@csie.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v8:
- Add loongarch support, too

 arch/arm/include/asm/irq.h       |  2 +-
 arch/arm/kernel/smp.c            |  3 ++-
 arch/loongarch/include/asm/irq.h |  2 +-
 arch/loongarch/kernel/process.c  |  3 ++-
 arch/mips/include/asm/irq.h      |  2 +-
 arch/mips/kernel/process.c       |  3 ++-
 arch/powerpc/include/asm/nmi.h   |  2 +-
 arch/powerpc/kernel/stacktrace.c |  3 ++-
 arch/sparc/include/asm/irq_64.h  |  2 +-
 arch/sparc/kernel/process_64.c   |  4 +++-
 arch/x86/include/asm/irq.h       |  2 +-
 arch/x86/kernel/apic/hw_nmi.c    |  3 ++-
 include/linux/nmi.h              | 12 ++++--------
 13 files changed, 23 insertions(+), 20 deletions(-)

diff --git a/arch/arm/include/asm/irq.h b/arch/arm/include/asm/irq.h
index a7c2337b0c7d..e6b62c7d6f0e 100644
--- a/arch/arm/include/asm/irq.h
+++ b/arch/arm/include/asm/irq.h
@@ -32,7 +32,7 @@ void init_IRQ(void);
 #ifdef CONFIG_SMP
 #include <linux/cpumask.h>
 
-extern void arch_trigger_cpumask_backtrace(const cpumask_t *mask,
+extern bool arch_trigger_cpumask_backtrace(const cpumask_t *mask,
 					   bool exclude_self);
 #define arch_trigger_cpumask_backtrace arch_trigger_cpumask_backtrace
 #endif
diff --git a/arch/arm/kernel/smp.c b/arch/arm/kernel/smp.c
index 0b8c25763adc..acb97d9219b1 100644
--- a/arch/arm/kernel/smp.c
+++ b/arch/arm/kernel/smp.c
@@ -849,7 +849,8 @@ static void raise_nmi(cpumask_t *mask)
 	__ipi_send_mask(ipi_desc[IPI_CPU_BACKTRACE], mask);
 }
 
-void arch_trigger_cpumask_backtrace(const cpumask_t *mask, bool exclude_self)
+bool arch_trigger_cpumask_backtrace(const cpumask_t *mask, bool exclude_self)
 {
 	nmi_trigger_cpumask_backtrace(mask, exclude_self, raise_nmi);
+	return true;
 }
diff --git a/arch/loongarch/include/asm/irq.h b/arch/loongarch/include/asm/irq.h
index a115e8999c69..c7a152d6bf0c 100644
--- a/arch/loongarch/include/asm/irq.h
+++ b/arch/loongarch/include/asm/irq.h
@@ -40,7 +40,7 @@ void spurious_interrupt(void);
 #define NR_IRQS_LEGACY 16
 
 #define arch_trigger_cpumask_backtrace arch_trigger_cpumask_backtrace
-void arch_trigger_cpumask_backtrace(const struct cpumask *mask, bool exclude_self);
+bool arch_trigger_cpumask_backtrace(const struct cpumask *mask, bool exclude_self);
 
 #define MAX_IO_PICS 2
 #define NR_IRQS	(64 + (256 * MAX_IO_PICS))
diff --git a/arch/loongarch/kernel/process.c b/arch/loongarch/kernel/process.c
index fa2443c7afb2..8f7f818f5c4e 100644
--- a/arch/loongarch/kernel/process.c
+++ b/arch/loongarch/kernel/process.c
@@ -339,9 +339,10 @@ static void raise_backtrace(cpumask_t *mask)
 	}
 }
 
-void arch_trigger_cpumask_backtrace(const cpumask_t *mask, bool exclude_self)
+bool arch_trigger_cpumask_backtrace(const cpumask_t *mask, bool exclude_self)
 {
 	nmi_trigger_cpumask_backtrace(mask, exclude_self, raise_backtrace);
+	return true;
 }
 
 #ifdef CONFIG_64BIT
diff --git a/arch/mips/include/asm/irq.h b/arch/mips/include/asm/irq.h
index 44f9824c1d8c..daf16173486a 100644
--- a/arch/mips/include/asm/irq.h
+++ b/arch/mips/include/asm/irq.h
@@ -77,7 +77,7 @@ extern int cp0_fdc_irq;
 
 extern int get_c0_fdc_int(void);
 
-void arch_trigger_cpumask_backtrace(const struct cpumask *mask,
+bool arch_trigger_cpumask_backtrace(const struct cpumask *mask,
 				    bool exclude_self);
 #define arch_trigger_cpumask_backtrace arch_trigger_cpumask_backtrace
 
diff --git a/arch/mips/kernel/process.c b/arch/mips/kernel/process.c
index 093dbbd6b843..7d538571830a 100644
--- a/arch/mips/kernel/process.c
+++ b/arch/mips/kernel/process.c
@@ -750,9 +750,10 @@ static void raise_backtrace(cpumask_t *mask)
 	}
 }
 
-void arch_trigger_cpumask_backtrace(const cpumask_t *mask, bool exclude_self)
+bool arch_trigger_cpumask_backtrace(const cpumask_t *mask, bool exclude_self)
 {
 	nmi_trigger_cpumask_backtrace(mask, exclude_self, raise_backtrace);
+	return true;
 }
 
 int mips_get_process_fp_mode(struct task_struct *task)
diff --git a/arch/powerpc/include/asm/nmi.h b/arch/powerpc/include/asm/nmi.h
index c3c7adef74de..135f65adcf63 100644
--- a/arch/powerpc/include/asm/nmi.h
+++ b/arch/powerpc/include/asm/nmi.h
@@ -12,7 +12,7 @@ static inline void watchdog_nmi_set_timeout_pct(u64 pct) {}
 #endif
 
 #ifdef CONFIG_NMI_IPI
-extern void arch_trigger_cpumask_backtrace(const cpumask_t *mask,
+extern bool arch_trigger_cpumask_backtrace(const cpumask_t *mask,
 					   bool exclude_self);
 #define arch_trigger_cpumask_backtrace arch_trigger_cpumask_backtrace
 #endif
diff --git a/arch/powerpc/kernel/stacktrace.c b/arch/powerpc/kernel/stacktrace.c
index 5de8597eaab8..0fee4bded7ba 100644
--- a/arch/powerpc/kernel/stacktrace.c
+++ b/arch/powerpc/kernel/stacktrace.c
@@ -221,8 +221,9 @@ static void raise_backtrace_ipi(cpumask_t *mask)
 	}
 }
 
-void arch_trigger_cpumask_backtrace(const cpumask_t *mask, bool exclude_self)
+bool arch_trigger_cpumask_backtrace(const cpumask_t *mask, bool exclude_self)
 {
 	nmi_trigger_cpumask_backtrace(mask, exclude_self, raise_backtrace_ipi);
+	return true;
 }
 #endif /* defined(CONFIG_PPC_BOOK3S_64) && defined(CONFIG_NMI_IPI) */
diff --git a/arch/sparc/include/asm/irq_64.h b/arch/sparc/include/asm/irq_64.h
index 154df2cf19f4..00a0051a9da0 100644
--- a/arch/sparc/include/asm/irq_64.h
+++ b/arch/sparc/include/asm/irq_64.h
@@ -87,7 +87,7 @@ static inline unsigned long get_softint(void)
 	return retval;
 }
 
-void arch_trigger_cpumask_backtrace(const struct cpumask *mask,
+bool arch_trigger_cpumask_backtrace(const struct cpumask *mask,
 				    bool exclude_self);
 #define arch_trigger_cpumask_backtrace arch_trigger_cpumask_backtrace
 
diff --git a/arch/sparc/kernel/process_64.c b/arch/sparc/kernel/process_64.c
index 91c2b8124527..f9aea1df3adf 100644
--- a/arch/sparc/kernel/process_64.c
+++ b/arch/sparc/kernel/process_64.c
@@ -236,7 +236,7 @@ static void __global_reg_poll(struct global_reg_snapshot *gp)
 	}
 }
 
-void arch_trigger_cpumask_backtrace(const cpumask_t *mask, bool exclude_self)
+bool arch_trigger_cpumask_backtrace(const cpumask_t *mask, bool exclude_self)
 {
 	struct thread_info *tp = current_thread_info();
 	struct pt_regs *regs = get_irq_regs();
@@ -291,6 +291,8 @@ void arch_trigger_cpumask_backtrace(const cpumask_t *mask, bool exclude_self)
 	memset(global_cpu_snapshot, 0, sizeof(global_cpu_snapshot));
 
 	spin_unlock_irqrestore(&global_cpu_snapshot_lock, flags);
+
+	return true;
 }
 
 #ifdef CONFIG_MAGIC_SYSRQ
diff --git a/arch/x86/include/asm/irq.h b/arch/x86/include/asm/irq.h
index 768aa234cbb4..f731638cc38e 100644
--- a/arch/x86/include/asm/irq.h
+++ b/arch/x86/include/asm/irq.h
@@ -43,7 +43,7 @@ extern void init_ISA_irqs(void);
 extern void __init init_IRQ(void);
 
 #ifdef CONFIG_X86_LOCAL_APIC
-void arch_trigger_cpumask_backtrace(const struct cpumask *mask,
+bool arch_trigger_cpumask_backtrace(const struct cpumask *mask,
 				    bool exclude_self);
 
 #define arch_trigger_cpumask_backtrace arch_trigger_cpumask_backtrace
diff --git a/arch/x86/kernel/apic/hw_nmi.c b/arch/x86/kernel/apic/hw_nmi.c
index 34a992e275ef..e7dcd28bc824 100644
--- a/arch/x86/kernel/apic/hw_nmi.c
+++ b/arch/x86/kernel/apic/hw_nmi.c
@@ -34,10 +34,11 @@ static void nmi_raise_cpu_backtrace(cpumask_t *mask)
 	apic->send_IPI_mask(mask, NMI_VECTOR);
 }
 
-void arch_trigger_cpumask_backtrace(const cpumask_t *mask, bool exclude_self)
+bool arch_trigger_cpumask_backtrace(const cpumask_t *mask, bool exclude_self)
 {
 	nmi_trigger_cpumask_backtrace(mask, exclude_self,
 				      nmi_raise_cpu_backtrace);
+	return true;
 }
 
 static int nmi_cpu_backtrace_handler(unsigned int cmd, struct pt_regs *regs)
diff --git a/include/linux/nmi.h b/include/linux/nmi.h
index 048c0b9aa623..7d8a77cd1e03 100644
--- a/include/linux/nmi.h
+++ b/include/linux/nmi.h
@@ -145,26 +145,22 @@ static inline void touch_nmi_watchdog(void)
 #ifdef arch_trigger_cpumask_backtrace
 static inline bool trigger_all_cpu_backtrace(void)
 {
-	arch_trigger_cpumask_backtrace(cpu_online_mask, false);
-	return true;
+	return arch_trigger_cpumask_backtrace(cpu_online_mask, false);
 }
 
 static inline bool trigger_allbutself_cpu_backtrace(void)
 {
-	arch_trigger_cpumask_backtrace(cpu_online_mask, true);
-	return true;
+	return arch_trigger_cpumask_backtrace(cpu_online_mask, true);
 }
 
 static inline bool trigger_cpumask_backtrace(struct cpumask *mask)
 {
-	arch_trigger_cpumask_backtrace(mask, false);
-	return true;
+	return arch_trigger_cpumask_backtrace(mask, false);
 }
 
 static inline bool trigger_single_cpu_backtrace(int cpu)
 {
-	arch_trigger_cpumask_backtrace(cpumask_of(cpu), false);
-	return true;
+	return arch_trigger_cpumask_backtrace(cpumask_of(cpu), false);
 }
 
 /* generic implementation */
-- 
2.40.0.634.g4ca3ef3211-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
