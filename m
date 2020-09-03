Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B10025C113
	for <lists+kgdb-bugreport@lfdr.de>; Thu,  3 Sep 2020 14:34:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kDoS5-0006mt-1e
	for lists+kgdb-bugreport@lfdr.de; Thu, 03 Sep 2020 12:34:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1kDoS4-0006mh-37
 for kgdb-bugreport@lists.sourceforge.net; Thu, 03 Sep 2020 12:34:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6rT3Oq3fCAt3C31zNixC41u1K5vlck9GLS8EDOYTmew=; b=Y91tfwUqro4IVHhnv+bNMrerx2
 H65W2a6d2seA/lvy3B7KrDsqGCtGHT/BPDo2WPzxt8Pi0VH4OprD5Sn8abbEsW32CsNHTp0CS+Buz
 qij6qdDO1NkFx9/5h/NMU3R9j+WRU2lPgDkBiyqc10hAGguq5KBa9k88rmQlH3Vdqj9I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6rT3Oq3fCAt3C31zNixC41u1K5vlck9GLS8EDOYTmew=; b=nBJHh5Pk9dSMFEx/xMPJ+xFTh3
 15K0mNyOSDimRgwjmo9B0Vj+gcgRNUroTS7MzWCdncki67++jZqWpnoV9//cKc74nnqCtTvu57r3R
 QRJ948JPVEQJ4eV3lpTBpLtVripjRs9PaRlS2etZ1uct5zD/y/ZHMNiHthti56XVNyXc=;
Received: from mail-il1-f194.google.com ([209.85.166.194])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kDoRy-00BOTT-UK
 for kgdb-bugreport@lists.sourceforge.net; Thu, 03 Sep 2020 12:34:52 +0000
Received: by mail-il1-f194.google.com with SMTP id b17so2329997ilh.4
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 03 Sep 2020 05:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=6rT3Oq3fCAt3C31zNixC41u1K5vlck9GLS8EDOYTmew=;
 b=vWyyppW7hpygvE/IkGGf/gUhETTigprQq6UV1DJ8NWDb0v+mRfJtrPiVVREDvTmBLE
 9wbVYxBwL7yziCp3zIGYydYwRUYaBmUoWla/7w6E6i7WekurGkRwFVOgFAzuX4EsdWK7
 SgBKTIy7EM9aXrk2pWefgyzvaHDSHZqiySbVvBukeOU9l09HsqE+QVe9pa2IW5Gd3RcA
 0N9szfLficZOOZaiT0Qzu0ekzkT7ttJz62H81vng9XHHjh762SLxUQzRLjfuQmZEa+mw
 v01MFTpWgVsZStU4//S/zrx2uL8iDLqzxfbPuBGKVITP0EfjiLk7cxCHzzs/rYzrKLm5
 mAbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=6rT3Oq3fCAt3C31zNixC41u1K5vlck9GLS8EDOYTmew=;
 b=piFNlEWpH2bOcqhoU4olwbxAL92eUp+OVlKTXFEAC44gZrds4hZNZxMDTHktffsUKz
 lA0SXLdQEjhkpK4TWWBBU6kZSHC/o+Y8Spr3W5VkYkFIiBFw8KcMi8kMCI9SQ4B/CSIa
 JT3Zu0v9if+ibp2w5FPasbWRdayTv6Qp9S70RUfBNOnmZi9a94CEz3tfumPFUDPYfDCE
 Wv2F3UJxmlH3WRpF6r2XhD/vPDG01yLr2ZgoHwUYCFZMHaanVJdKuXly0q3F2rb0YUZq
 ZO8rBABi3+RbrHm6/xgg5g6I5ISWwToZ51eJmyCb6l+3m/BAQicOxQ15G1Lk7n7j2m7E
 rKbg==
X-Gm-Message-State: AOAM532HkSGq2uBw7Y9OWm1+DiA8PWUM/UqpNg3igaht3qEACGkX0KU0
 HowFeu9TdXR4IqbBBKVxvlmanORDAxs3QQ==
X-Google-Smtp-Source: ABdhPJxmXC2UZJ7VbILNUGeZ4ZMRSdONwYc1dH1QIufwvZKqDdpG8ds3OWY7AMUfJZYq3qtbgunWWw==
X-Received: by 2002:a63:4503:: with SMTP id s3mr2696201pga.119.1599134770782; 
 Thu, 03 Sep 2020 05:06:10 -0700 (PDT)
Received: from localhost.localdomain ([117.210.209.248])
 by smtp.gmail.com with ESMTPSA id s1sm2922022pgh.47.2020.09.03.05.06.03
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 03 Sep 2020 05:06:10 -0700 (PDT)
From: Sumit Garg <sumit.garg@linaro.org>
To: maz@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org
Date: Thu,  3 Sep 2020 17:35:12 +0530
Message-Id: <1599134712-30923-5-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1599134712-30923-1-git-send-email-sumit.garg@linaro.org>
References: <1599134712-30923-1-git-send-email-sumit.garg@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.166.194 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.194 listed in wl.mailspike.net]
X-Headers-End: 1kDoRy-00BOTT-UK
Subject: [Kgdb-bugreport] [PATCH v3 4/4] arm64: kgdb: Round up cpus using
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
Cc: daniel.thompson@linaro.org, jason@lakedaemon.net,
 kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, jason.wessel@windriver.com,
 tglx@linutronix.de, julien.thierry.kdev@gmail.com
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
index 1a157ca3..3a8ed97 100644
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
index 572f8f5..b4760d3 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -32,6 +32,7 @@
 #include <linux/irq_work.h>
 #include <linux/kernel_stat.h>
 #include <linux/kexec.h>
+#include <linux/kgdb.h>
 #include <linux/kvm_host.h>
 
 #include <asm/alternative.h>
@@ -941,7 +942,7 @@ static void do_handle_IPI(int ipinr)
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
