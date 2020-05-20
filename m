Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 415751DB158
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 20 May 2020 13:19:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jbMkZ-0004oH-31
	for lists+kgdb-bugreport@lfdr.de; Wed, 20 May 2020 11:19:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1jbMkX-0004nx-Hf
 for kgdb-bugreport@lists.sourceforge.net; Wed, 20 May 2020 11:19:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yX6L8WE/2wulIJ9zzHwHac/OpN/D9QY9ojqo7Mh/3mw=; b=f0u8sDvzNkC/LTvHRkz+tGV3j3
 zlq8/TmTzGhbbOkYnaQ0ZG6S45ieq/x37M4s2h1lnArTD83ue981F9+VYBNwkWWPnNwWWCK1cptv3
 3I5dqb8DLvkql8xqUtGSIUp04GHPL6YTzv5zk1a2eKEC1tHMt1jfEB1ATol8zwbXHUGM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yX6L8WE/2wulIJ9zzHwHac/OpN/D9QY9ojqo7Mh/3mw=; b=T8/xUomg82wb3oT5yArk7kWnMG
 PBRNwR6yScnh/1ZVxEDxezxRNb7maew8SEcklinCACiP1vDg6AmRevQ8uP7gNQAhJcMwntpJkGWpM
 KcCHE44Tzfd3xcABST+Gzf6V2WTOLjedhaarpini3ha5cV2TCbzUk3LeefGA63I+pO1k=;
Received: from mail-oi1-f196.google.com ([209.85.167.196])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jbMkV-008tgh-65
 for kgdb-bugreport@lists.sourceforge.net; Wed, 20 May 2020 11:19:01 +0000
Received: by mail-oi1-f196.google.com with SMTP id j145so2593753oib.5
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 20 May 2020 04:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=yX6L8WE/2wulIJ9zzHwHac/OpN/D9QY9ojqo7Mh/3mw=;
 b=egwaEsnbY6AeyS96dO0hGfkxr/9sazC/TRAuJtiKxLcMasIkKn3431qFi4aKu8PyZy
 zA+K2sbl6vAxNVwL9+KW7XZ6wDYR0TzfCEIX9eF4LrQXw6fMVz9bXjVDFxUoh1Awjccn
 ikb16VFGIwZvdaIOWKt4pgIEZT6ajVQzfP7WI2ZTnNIVJZCp5DG8DKNGNTvC4VTRynVq
 5oD1hCIlADqJ8xlYek0oUenVOv++9LauUwQ9ImiMD6NjhqZAfkNSzAItZBGBgnIpAekq
 GXtOXwG57Y9VE31yfVzj2gBoGkiuh6+l8qxBEZcJ3Ymt5wWomn20SbsZKRngQKiep0rj
 icKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=yX6L8WE/2wulIJ9zzHwHac/OpN/D9QY9ojqo7Mh/3mw=;
 b=bkiZy82DXrV5Bf7J7bYxD4rS4DcaBvfjABgJnwQmR+5IxHKuCajicLMFKgPXW976SK
 sskqa6wSW2wLobV5Tb6X0G6rdWyKvSG7EFQ3YYaC/GQVKfEeFLwL1SCvTHclPO4aRjhr
 afc0mKJLM9GuKsBucUVyP0IyKx1jxntSbtRuQVZkwzMjHiINUP/Ci7Jgeixij3rmmHN5
 zANgqwyTIGQ6lfiBfmW5T13BhvI7N3loIr+QMGHpEhmVY0ELvOVV9SkGZhpGNYqoSnHy
 YV27NuuEjSKUPacNgR2gZaZBHED2U2kAjZj4vMLpefmNBMyg6PUIOpXXAryGwiOKF1Nc
 lAug==
X-Gm-Message-State: AOAM531dSwoQflAm1y0Wi4tUWoR7yQiGqag9LiB2uKQMmi1Cw1m5afqd
 T0hKyBWrlWInwGqqhF9lKvlZv3uF/pY=
X-Google-Smtp-Source: ABdhPJzUpGV1y7deDtZi57sfC8WyhNh7TcidlxseCMF5t7wpivc/pdczLuxnyS0XLzXoczy4erEZ3Q==
X-Received: by 2002:a17:90b:110d:: with SMTP id
 gi13mr4537270pjb.131.1589973202196; 
 Wed, 20 May 2020 04:13:22 -0700 (PDT)
Received: from localhost.localdomain ([117.252.68.136])
 by smtp.gmail.com with ESMTPSA id q134sm2044974pfc.143.2020.05.20.04.13.15
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 20 May 2020 04:13:21 -0700 (PDT)
From: Sumit Garg <sumit.garg@linaro.org>
To: linux-arm-kernel@lists.infradead.org
Date: Wed, 20 May 2020 16:41:55 +0530
Message-Id: <1589973115-14757-5-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1589973115-14757-1-git-send-email-sumit.garg@linaro.org>
References: <1589973115-14757-1-git-send-email-sumit.garg@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.196 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.196 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jbMkV-008tgh-65
Subject: [Kgdb-bugreport] [PATCH v2 4/4] arm64: kgdb: Round up cpus using
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

arm64 platforms with GICv3 or later supports pseudo NMIs which can be
leveraged to round up CPUs which are stuck in hard lockup state with
interrupts disabled that wouldn't be possible with a normal IPI.

So instead switch to round up CPUs using IPI_CALL_NMI_FUNC. And in
case a particular arm64 platform doesn't supports pseudo NMIs,
IPI_CALL_NMI_FUNC will act as a normal IPI which maintains existing
kgdb functionality.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---
 arch/arm64/include/asm/kgdb.h |  8 ++++++++
 arch/arm64/kernel/kgdb.c      | 21 +++++++++++++++++++++
 arch/arm64/kernel/smp.c       |  3 ++-
 3 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/kgdb.h b/arch/arm64/include/asm/kgdb.h
index 21fc85e..6f3d3af 100644
--- a/arch/arm64/include/asm/kgdb.h
+++ b/arch/arm64/include/asm/kgdb.h
@@ -24,6 +24,14 @@ static inline void arch_kgdb_breakpoint(void)
 extern void kgdb_handle_bus_error(void);
 extern int kgdb_fault_expected;
 
+#ifdef CONFIG_KGDB
+extern void ipi_kgdb_nmicallback(int cpu, void *regs);
+#else
+static inline void ipi_kgdb_nmicallback(int cpu, void *regs)
+{
+}
+#endif
+
 #endif /* !__ASSEMBLY__ */
 
 /*
diff --git a/arch/arm64/kernel/kgdb.c b/arch/arm64/kernel/kgdb.c
index 4311992..ee932ba 100644
--- a/arch/arm64/kernel/kgdb.c
+++ b/arch/arm64/kernel/kgdb.c
@@ -14,6 +14,7 @@
 #include <linux/kgdb.h>
 #include <linux/kprobes.h>
 #include <linux/sched/task_stack.h>
+#include <linux/smp.h>
 
 #include <asm/debug-monitors.h>
 #include <asm/insn.h>
@@ -353,3 +354,23 @@ int kgdb_arch_remove_breakpoint(struct kgdb_bkpt *bpt)
 	return aarch64_insn_write((void *)bpt->bpt_addr,
 			*(u32 *)bpt->saved_instr);
 }
+
+void ipi_kgdb_nmicallback(int cpu, void *regs)
+{
+	if (atomic_read(&kgdb_active) != -1)
+		kgdb_nmicallback(cpu, regs);
+}
+
+#ifdef CONFIG_SMP
+void kgdb_roundup_cpus(void)
+{
+	struct cpumask mask;
+
+	cpumask_copy(&mask, cpu_online_mask);
+	cpumask_clear_cpu(raw_smp_processor_id(), &mask);
+	if (cpumask_empty(&mask))
+		return;
+
+	arch_send_call_nmi_func_ipi_mask(&mask);
+}
+#endif
diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index c5e42a1..3baace7 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -31,6 +31,7 @@
 #include <linux/of.h>
 #include <linux/irq_work.h>
 #include <linux/kexec.h>
+#include <linux/kgdb.h>
 #include <linux/kvm_host.h>
 
 #include <asm/alternative.h>
@@ -958,7 +959,7 @@ static void do_handle_IPI(int ipinr)
 #endif
 
 	case IPI_CALL_NMI_FUNC:
-		/* nop, IPI handlers for special features can be added here. */
+		ipi_kgdb_nmicallback(cpu, get_irq_regs());
 		break;
 
 	default:
-- 
2.7.4



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
