Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8C02A29FF
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  2 Nov 2020 12:54:10 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kZYPZ-00060l-9Y
	for lists+kgdb-bugreport@lfdr.de; Mon, 02 Nov 2020 11:54:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1kZYPX-00060O-5M
 for kgdb-bugreport@lists.sourceforge.net; Mon, 02 Nov 2020 11:54:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JyvPCaqqbOYfCXpYx0pOVqmUQ12hYhEPEwMON22pNjk=; b=PirFvgHgfYkz4ZQ9D/HJ1/JAA3
 bKSvAD3CjaMfX4Xf3Vcwo7OU2tbIbJyERGH7qGF2z4Nr/sVqq9+y9X63ATenRRDjMsVoCqWUduUFq
 OgQRVYqLEbqcA5NAMmvDON9cIiexYqk3GkKiiGniYBm/EdOmuhh6zLcXKT6u1uOezoWo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JyvPCaqqbOYfCXpYx0pOVqmUQ12hYhEPEwMON22pNjk=; b=BU5KWadWLkRgdT+T3UblwEJo47
 ZayOC2JD6QtNJQjdaZ6c2+RVXXY015BlyQRT+AZgBAfYn4WSmMzUNzs3xKadn6VVQLYlzrkWOSlCq
 R+knV0jnVhSXw6yZDRafhNEv8vHYdLDCPTO6oiCiJSZZu6Lcla0m/DQPw9hOOn+nsINs=;
Received: from mail-oi1-f194.google.com ([209.85.167.194])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kZYPM-00GH8i-Rb
 for kgdb-bugreport@lists.sourceforge.net; Mon, 02 Nov 2020 11:54:07 +0000
Received: by mail-oi1-f194.google.com with SMTP id m143so5038135oig.7
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 02 Nov 2020 03:53:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=JyvPCaqqbOYfCXpYx0pOVqmUQ12hYhEPEwMON22pNjk=;
 b=uCcmpbkowm5jgVzKL5iyPFHUhu/8J3iCv9LXeYwdXeL0hGI1Lcu7XVewGbCxodYOqi
 Uf67FbBxpsW5SKTmkpPHTDL0w4EiYZX7WMblNDDAm4+FSg4Hs+wZ9Sz70B3pUHPF0oQn
 44q18yg4+jIlgmULBSgTvbTsnwRC7b+YmVZjZXlDoYyc85PDhTsi+645DPsajTudK96v
 mNa/J+dBSFYD1BopcjX4zTxQY5Om0JD0iUcYMz9arNALeRncogCniUb1qlIj+sC1q+2m
 7DmOPf0nu6RNqv7qF4L0V8P1R/n2xF3qKsCA1IbccTPBH7b0sTq75OoLX8vrU91wvE4Q
 bFww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=JyvPCaqqbOYfCXpYx0pOVqmUQ12hYhEPEwMON22pNjk=;
 b=guw+OsJodaYCyDCnE8SY+V2QpexNkYFE9Q1sAtmk7BRT5eH1d0lxVGhiHsxfQirHgF
 ZolflinBt7ro/rlUMaN1eUX4XJhwE/cGSG6GHDG7HSQYIj3W0oP0yy+v/Or6w3HtV9cg
 l+vQ7+AuKtHhRLPiv2IFLeT4+E1/QViO2CL9FhqRqjRqMBATwxcrVNtLtSnKPOJx/U5J
 lAP2oqH/oGEPW1jHzY8VddNYoUMqTpGvzKgicuLN8FKvgBpM1PZrUARJNTrFrXtC9ItC
 +igKsjuSoYNiFo6FGDZX3hDZ4leixAm3xZ8NO9k4hT2NWdzWc1EC2ULwRrGZEJBM0dDx
 m2bQ==
X-Gm-Message-State: AOAM532sSJ/ia5MSBqIe+5Q7XM3is2Gurkuw0j7q32s4F9SrJsDecsSK
 1OGsyPMTuBYzkwRxqPUnocZr9fAHG7g5lw==
X-Google-Smtp-Source: ABdhPJxya51ixKRZ4J+w5F3LFYNiyvEMS5yCU1E+CoRLMD+YzEfvZmLOlP27VhF4kmnTj0B5cnUOLQ==
X-Received: by 2002:a17:90b:111:: with SMTP id
 p17mr17762114pjz.159.1604317600138; 
 Mon, 02 Nov 2020 03:46:40 -0800 (PST)
Received: from localhost.localdomain ([122.173.169.225])
 by smtp.gmail.com with ESMTPSA id y5sm14276184pfq.79.2020.11.02.03.46.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 02 Nov 2020 03:46:39 -0800 (PST)
From: Sumit Garg <sumit.garg@linaro.org>
To: maz@kernel.org, catalin.marinas@arm.com, will@kernel.org,
 daniel.thompson@linaro.org
Date: Mon,  2 Nov 2020 17:14:47 +0530
Message-Id: <1604317487-14543-8-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1604317487-14543-1-git-send-email-sumit.garg@linaro.org>
References: <1604317487-14543-1-git-send-email-sumit.garg@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.194 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.194 listed in wl.mailspike.net]
X-Headers-End: 1kZYPM-00GH8i-Rb
Subject: [Kgdb-bugreport] [PATCH v7 7/7] arm64: kgdb: Roundup cpus using IPI
 as NMI
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
Cc: mark.rutland@arm.com, tsbogend@alpha.franken.de,
 linux-kernel@vger.kernel.org, jason@lakedaemon.net, ito-yuichi@fujitsu.com,
 mpe@ellerman.id.au, x86@kernel.org, linux@armlinux.org.uk, mingo@redhat.com,
 bp@alien8.de, julien.thierry.kdev@gmail.com, jason.wessel@windriver.com,
 kgdb-bugreport@lists.sourceforge.net, tglx@linutronix.de,
 msys.mizuma@gmail.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

arm64 platforms with GICv3 or later supports pseudo NMIs which can be
leveraged to roundup CPUs which are stuck in hard lockup state with
interrupts disabled that wouldn't be possible with a normal IPI.

So instead switch to roundup CPUs using IPI turned as NMI. And in
case a particular arm64 platform doesn't supports pseudo NMIs,
it will switch back to default kgdb CPUs roundup mechanism.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---
 arch/arm64/kernel/ipi_nmi.c |  5 +++++
 arch/arm64/kernel/kgdb.c    | 18 ++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/arch/arm64/kernel/ipi_nmi.c b/arch/arm64/kernel/ipi_nmi.c
index 597dcf7..898d69c 100644
--- a/arch/arm64/kernel/ipi_nmi.c
+++ b/arch/arm64/kernel/ipi_nmi.c
@@ -8,6 +8,7 @@
 
 #include <linux/interrupt.h>
 #include <linux/irq.h>
+#include <linux/kgdb.h>
 #include <linux/nmi.h>
 #include <linux/smp.h>
 
@@ -45,10 +46,14 @@ bool arch_trigger_cpumask_backtrace(const cpumask_t *mask, bool exclude_self)
 static irqreturn_t ipi_nmi_handler(int irq, void *data)
 {
 	irqreturn_t ret = IRQ_NONE;
+	unsigned int cpu = smp_processor_id();
 
 	if (nmi_cpu_backtrace(get_irq_regs()))
 		ret = IRQ_HANDLED;
 
+	if (!kgdb_nmicallback(cpu, get_irq_regs()))
+		ret = IRQ_HANDLED;
+
 	return ret;
 }
 
diff --git a/arch/arm64/kernel/kgdb.c b/arch/arm64/kernel/kgdb.c
index 1a157ca3..371b176 100644
--- a/arch/arm64/kernel/kgdb.c
+++ b/arch/arm64/kernel/kgdb.c
@@ -17,6 +17,7 @@
 
 #include <asm/debug-monitors.h>
 #include <asm/insn.h>
+#include <asm/nmi.h>
 #include <asm/traps.h>
 
 struct dbg_reg_def_t dbg_reg_def[DBG_MAX_REG_NUM] = {
@@ -353,3 +354,20 @@ int kgdb_arch_remove_breakpoint(struct kgdb_bkpt *bpt)
 	return aarch64_insn_write((void *)bpt->bpt_addr,
 			*(u32 *)bpt->saved_instr);
 }
+
+void kgdb_roundup_cpus(void)
+{
+	struct cpumask mask;
+
+	if (!arm64_supports_nmi()) {
+		kgdb_smp_call_nmi_hook();
+		return;
+	}
+
+	cpumask_copy(&mask, cpu_online_mask);
+	cpumask_clear_cpu(raw_smp_processor_id(), &mask);
+	if (cpumask_empty(&mask))
+		return;
+
+	arm64_send_nmi(&mask);
+}
-- 
2.7.4



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
