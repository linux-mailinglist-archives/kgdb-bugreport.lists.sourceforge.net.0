Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 74EB11DB161
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 20 May 2020 13:20:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jbMlb-0004rW-8S
	for lists+kgdb-bugreport@lfdr.de; Wed, 20 May 2020 11:20:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1jbMlZ-0004rO-JH
 for kgdb-bugreport@lists.sourceforge.net; Wed, 20 May 2020 11:20:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ijhEJD7IduE0U1E8AnSJDUXoqHR53bJuCE3Hju6nI0s=; b=l/DHh6yVtC6G3Wt3Up8SiIHH9T
 8ndsVnA6nTQqPtF5hefzVoNy06RIwDLzhe6pKInaAgucj3otReYvbeeROKR0/C0hge2ptKqu730/Y
 /wimTBqt+DHErJuJ3nYlhtmN/dHuXzfzo5REBd93+u/eFjm6rPjG/4YGOcFO8F/PtqSw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ijhEJD7IduE0U1E8AnSJDUXoqHR53bJuCE3Hju6nI0s=; b=EGiAdDUibVaRrVcx9HwvCN4AuT
 sPRgMkKpqrk3Tfu2OAldOq/HycxBVA8nwo6NJWMP0G5ccuj5zgZ25ftlvwmU6jvEUOBvfqEH4pYd9
 M3+B1DRfcd/5o4aYFyVYTHxrqpAT/QIseltBfs+ZUy7XWrRN1P1XlZpgC8PiX4YOk6HQ=;
Received: from mail-oi1-f193.google.com ([209.85.167.193])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jbMlX-008tmB-Lu
 for kgdb-bugreport@lists.sourceforge.net; Wed, 20 May 2020 11:20:05 +0000
Received: by mail-oi1-f193.google.com with SMTP id o24so2615760oic.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 20 May 2020 04:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ijhEJD7IduE0U1E8AnSJDUXoqHR53bJuCE3Hju6nI0s=;
 b=aGADS/21PIt44tBDepA8z7JH39hjNazac7GxhdW+KNVWe0A3Hy/0c4bYlV9oSf3BvP
 LCgJNx3/hzoPEak3bXvFApjYrByfQNhAzTXG5QWGS0f9YWJQ/d5zIvHCql8pYNUeH5AB
 KwuWXI952vPjmL4r8O+gG2aHXkvWJj67H1moGsmx5H3+FDhMPIL4n8NFTGOiPj+uDX+P
 e7tbjJDHqLT/H61jYEE4EYXZCQLYRYrkiYnBD8YDRE0tRnAy8r/nOGBwUHcvbIPMWXDC
 JtFTEPl/aeX1mocEmBiGSRNvlcCmOhBfuctZV+oD7NuAApDIrmmWK7YDlqYAjPzUWdT+
 BN7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ijhEJD7IduE0U1E8AnSJDUXoqHR53bJuCE3Hju6nI0s=;
 b=e7xo8TNMSgyD9TQS7Wjt4IxU0X1T1OnzqqtIoygHoKQatis5+Q+kkDzXC2AGcZXLGx
 r9N0rwFz4IeZUJntpOuiMlEQFp3oo3YADnu6Xd3qYyrFFfubas3r/OWdN5OZ8dvWDtwa
 Ke9zdhTBSu4T9d2lWJ2yxqF5q1M7TGfOiO2LhVWtaE+V7FuHXECOA94Lv+7jjKyTTGpN
 1VUBoBxOpm0YBJyPfN8fHWuGQszp6uxhk6On2lV2808Bkbtwf4bPpaKXWuTX+QhGrswf
 AB2P1gQAOr1A1Mkzv1ntNjfENbBU8O7iqnNSMSXKxW702z3oa8k812Lp9wwwAu9xHjT5
 Eu+A==
X-Gm-Message-State: AOAM531C7gfEEdZyHf7hlJb2+tV/vfz+zaTALAnTzL/Y5grRNeUFoezE
 KbeS9QAQVB6f4C1qORlok0z6lujFRnQ=
X-Google-Smtp-Source: ABdhPJzNvSwUoGbq89C1ybvRuntAvjJr6uSw+V7BIYsslChvoR7r5VHqx1MN7bVP2u8IX7evwU3kkg==
X-Received: by 2002:a17:90a:2325:: with SMTP id
 f34mr4619400pje.91.1589973169271; 
 Wed, 20 May 2020 04:12:49 -0700 (PDT)
Received: from localhost.localdomain ([117.252.68.136])
 by smtp.gmail.com with ESMTPSA id q134sm2044974pfc.143.2020.05.20.04.12.42
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 20 May 2020 04:12:48 -0700 (PDT)
From: Sumit Garg <sumit.garg@linaro.org>
To: linux-arm-kernel@lists.infradead.org
Date: Wed, 20 May 2020 16:41:52 +0530
Message-Id: <1589973115-14757-2-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1589973115-14757-1-git-send-email-sumit.garg@linaro.org>
References: <1589973115-14757-1-git-send-email-sumit.garg@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.193 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.193 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jbMlX-008tmB-Lu
Subject: [Kgdb-bugreport] [PATCH v2 1/4] arm64: smp: Introduce a new IPI as
 IPI_CALL_NMI_FUNC
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
Cc: daniel.thompson@linaro.org, jason@lakedaemon.net, catalin.marinas@arm.com,
 jason.wessel@windriver.com, linux-kernel@vger.kernel.org, maz@kernel.org,
 kgdb-bugreport@lists.sourceforge.net, tglx@linutronix.de, will@kernel.org,
 julien.thierry.kdev@gmail.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Introduce a new inter processor interrupt as IPI_CALL_NMI_FUNC that
can be invoked to run special handlers in NMI context. One such handler
example is kgdb_nmicallback() which is invoked in order to round up CPUs
to enter kgdb context.

As currently pseudo NMIs are supported on specific arm64 platforms which
incorporates GICv3 or later version of interrupt controller. In case a
particular platform doesn't support pseudo NMIs, IPI_CALL_NMI_FUNC will
act as a normal IPI which can still be used to invoke special handlers.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---
 arch/arm64/include/asm/hardirq.h |  2 +-
 arch/arm64/include/asm/smp.h     |  1 +
 arch/arm64/kernel/smp.c          | 13 ++++++++++++-
 3 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/hardirq.h b/arch/arm64/include/asm/hardirq.h
index 87ad961..abaa23a 100644
--- a/arch/arm64/include/asm/hardirq.h
+++ b/arch/arm64/include/asm/hardirq.h
@@ -13,7 +13,7 @@
 #include <asm/kvm_arm.h>
 #include <asm/sysreg.h>
 
-#define NR_IPI	7
+#define NR_IPI	8
 
 typedef struct {
 	unsigned int __softirq_pending;
diff --git a/arch/arm64/include/asm/smp.h b/arch/arm64/include/asm/smp.h
index bec6ef0..b4602de 100644
--- a/arch/arm64/include/asm/smp.h
+++ b/arch/arm64/include/asm/smp.h
@@ -106,6 +106,7 @@ extern void secondary_entry(void);
 
 extern void arch_send_call_function_single_ipi(int cpu);
 extern void arch_send_call_function_ipi_mask(const struct cpumask *mask);
+extern void arch_send_call_nmi_func_ipi_mask(const struct cpumask *mask);
 
 #ifdef CONFIG_ARM64_ACPI_PARKING_PROTOCOL
 extern void arch_send_wakeup_ipi_mask(const struct cpumask *mask);
diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index d29823a..236784e 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -81,7 +81,8 @@ enum ipi_msg_type {
 	IPI_CPU_CRASH_STOP,
 	IPI_TIMER,
 	IPI_IRQ_WORK,
-	IPI_WAKEUP
+	IPI_WAKEUP,
+	IPI_CALL_NMI_FUNC
 };
 
 #ifdef CONFIG_HOTPLUG_CPU
@@ -802,6 +803,7 @@ static const char *ipi_types[NR_IPI] __tracepoint_string = {
 	S(IPI_TIMER, "Timer broadcast interrupts"),
 	S(IPI_IRQ_WORK, "IRQ work interrupts"),
 	S(IPI_WAKEUP, "CPU wake-up interrupts"),
+	S(IPI_CALL_NMI_FUNC, "NMI function call interrupts"),
 };
 
 static void smp_cross_call(const struct cpumask *target, unsigned int ipinr);
@@ -855,6 +857,11 @@ void arch_irq_work_raise(void)
 }
 #endif
 
+void arch_send_call_nmi_func_ipi_mask(const struct cpumask *mask)
+{
+	smp_cross_call(mask, IPI_CALL_NMI_FUNC);
+}
+
 static void local_cpu_stop(void)
 {
 	set_cpu_online(smp_processor_id(), false);
@@ -949,6 +956,10 @@ static void do_handle_IPI(int ipinr)
 		break;
 #endif
 
+	case IPI_CALL_NMI_FUNC:
+		/* nop, IPI handlers for special features can be added here. */
+		break;
+
 	default:
 		pr_crit("CPU%u: Unknown IPI message 0x%x\n", cpu, ipinr);
 		break;
-- 
2.7.4



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
