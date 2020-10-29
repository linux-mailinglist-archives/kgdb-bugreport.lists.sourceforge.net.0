Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A973829EEFD
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 29 Oct 2020 15:59:21 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kY9Oa-0004hQ-FG
	for lists+kgdb-bugreport@lfdr.de; Thu, 29 Oct 2020 14:59:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1kY9OY-0004hH-Sg
 for kgdb-bugreport@lists.sourceforge.net; Thu, 29 Oct 2020 14:59:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=63fCD7b9c39BMwHAue5Fl+YEtHFG3eKfVilw8x2/rAA=; b=m7HJ0YWlFRarpZQXHptaz1cX+k
 Tp6fFwQsJFrSHcGCQr9SMeSDkz+KCfP1azdYr8nbirH84lut75KZb7R63IfBuBdCXGlVbpc5D5OIH
 zWI7SGe7qDF0RSt52nb4DX2h5wS15gAVamJPTaZoEFmvG7ftpKdwgjXpgunBLC2yAKqk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=63fCD7b9c39BMwHAue5Fl+YEtHFG3eKfVilw8x2/rAA=; b=Iy4TLGSnkRizLSknwF2GmwL3je
 3hdvnhXh//0WTfDGZHXbYS/3V8xmD7iu5tIBShLpDOy3Id0df8dSvw05osPTBiQNYKjS/1QAMGb8K
 Oq8ShcSgolla7nJrNWwRJODamQgfWCw53qFjymPC2VqoQv+kyN/Dq2pui6pJ7TqZNivQ=;
Received: from mail-pg1-f196.google.com ([209.85.215.196])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kY9OF-00BgQe-Oc
 for kgdb-bugreport@lists.sourceforge.net; Thu, 29 Oct 2020 14:59:18 +0000
Received: by mail-pg1-f196.google.com with SMTP id h6so2554730pgk.4
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 29 Oct 2020 07:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=63fCD7b9c39BMwHAue5Fl+YEtHFG3eKfVilw8x2/rAA=;
 b=kj3iNPCNr2+M9wcLse6ZQ21oBMHYl72Qc/zJOgpvoUZZqUK4+1MCHZUsaeGS6ui0Cw
 NKMYgFNZDZEEj26ihm97tZCqaNTMiwt8L2gI8RVYyN+frDClvcpXVMJFqKb05BxLkC7G
 pA0NV8O4+fz/AgT5Lsyvp1Hiy6smYo9cDdacpYTYMV336wKhX1U6gCN05GCtvtBbrP3+
 +32FuTSbVwYNzjs7SVRxQFtex1r2DZw/dc7+kq04dEPh84eVNDJmESv2i2upZTMFosJ/
 ALonraRZR/qVAXbwtRieM5V+r2Zwg6rgyGAGcYRou7223Z1UXYNR9wAKUSLXL6Mjz2if
 g6MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=63fCD7b9c39BMwHAue5Fl+YEtHFG3eKfVilw8x2/rAA=;
 b=WE/cJXWSx7FmtPhcyIRs5Xokfov6KA6eccNIsbzGFFoTQ9zoc/It855Lune68UTl4i
 Ur8sJ7vPWYSO5Hchqqw7w8bwol01BxQZDzTEvLK7nmZcHSmRDkmHVsHOlbSWqt8z59xS
 6LX8vCCy4PxnHc076CJEzZKfa3ADDJARmWYW5qoYwRJoB6xHHpSZr0Bdsi0S1huLr9Bv
 lNywOmEUF9g1x4pxSqhXVZvfHtOLly4Y6Qy6/Fo+BkoDDi5CptMFFbDtyBUO75xIBXC2
 69CZr342A3j02D6XyRAap/q/WMI36ONM1bI7fRrT79pteg6mfeL/iwaw6ZyuHXBTKu5y
 Obbg==
X-Gm-Message-State: AOAM533p9vN9AXDiYZNHS090vjYxWaBhQEOOTZCqS+c+oyFEYTCenJnt
 90sENLAKWAsZOIrF78BT8lIbCA==
X-Google-Smtp-Source: ABdhPJw17SGDkWifbE7fvN8UeDKNxr6nOnVarhxUncUj/mUYxJzpJE6WxXsesAZ4m34FfWUD2Yt8kQ==
X-Received: by 2002:a17:90a:b30b:: with SMTP id
 d11mr152257pjr.163.1603983534301; 
 Thu, 29 Oct 2020 07:58:54 -0700 (PDT)
Received: from localhost.localdomain ([117.252.71.231])
 by smtp.gmail.com with ESMTPSA id j11sm3085082pfc.64.2020.10.29.07.58.44
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 29 Oct 2020 07:58:53 -0700 (PDT)
From: Sumit Garg <sumit.garg@linaro.org>
To: maz@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org
Date: Thu, 29 Oct 2020 20:26:25 +0530
Message-Id: <1603983387-8738-6-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1603983387-8738-1-git-send-email-sumit.garg@linaro.org>
References: <1603983387-8738-1-git-send-email-sumit.garg@linaro.org>
X-Spam-Score: 1.4 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 1.5 RCVD_IN_SORBS_WEB      RBL: SORBS: sender is an abusable web server
 [117.252.71.231 listed in dnsbl.sorbs.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.196 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.196 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kY9OF-00BgQe-Oc
Subject: [Kgdb-bugreport] [PATCH v6 5/7] arm64: ipi_nmi: Add support for NMI
 backtrace
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
Cc: mark.rutland@arm.com, daniel.thompson@linaro.org, tsbogend@alpha.franken.de,
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

Enable NMI backtrace support on arm64 using IPI turned as an NMI
leveraging pseudo NMIs support. It is now possible for users to get a
backtrace of a CPU stuck in hard-lockup using magic SYSRQ.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---
 arch/arm64/include/asm/irq.h |  6 ++++++
 arch/arm64/kernel/ipi_nmi.c  | 18 ++++++++++++++++--
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/irq.h b/arch/arm64/include/asm/irq.h
index b2b0c64..ef018a8 100644
--- a/arch/arm64/include/asm/irq.h
+++ b/arch/arm64/include/asm/irq.h
@@ -6,6 +6,12 @@
 
 #include <asm-generic/irq.h>
 
+#ifdef CONFIG_SMP
+extern bool arch_trigger_cpumask_backtrace(const cpumask_t *mask,
+					   bool exclude_self);
+#define arch_trigger_cpumask_backtrace arch_trigger_cpumask_backtrace
+#endif
+
 struct pt_regs;
 
 static inline int nr_legacy_irqs(void)
diff --git a/arch/arm64/kernel/ipi_nmi.c b/arch/arm64/kernel/ipi_nmi.c
index a945dcf..597dcf7 100644
--- a/arch/arm64/kernel/ipi_nmi.c
+++ b/arch/arm64/kernel/ipi_nmi.c
@@ -8,6 +8,7 @@
 
 #include <linux/interrupt.h>
 #include <linux/irq.h>
+#include <linux/nmi.h>
 #include <linux/smp.h>
 
 #include <asm/nmi.h>
@@ -31,11 +32,24 @@ void arm64_send_nmi(cpumask_t *mask)
 	__ipi_send_mask(ipi_nmi_desc, mask);
 }
 
+bool arch_trigger_cpumask_backtrace(const cpumask_t *mask, bool exclude_self)
+{
+	if (!ipi_nmi_desc)
+		return false;
+
+	nmi_trigger_cpumask_backtrace(mask, exclude_self, arm64_send_nmi);
+
+	return true;
+}
+
 static irqreturn_t ipi_nmi_handler(int irq, void *data)
 {
-	/* nop, NMI handlers for special features can be added here. */
+	irqreturn_t ret = IRQ_NONE;
+
+	if (nmi_cpu_backtrace(get_irq_regs()))
+		ret = IRQ_HANDLED;
 
-	return IRQ_NONE;
+	return ret;
 }
 
 void dynamic_ipi_setup(int cpu)
-- 
2.7.4



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
