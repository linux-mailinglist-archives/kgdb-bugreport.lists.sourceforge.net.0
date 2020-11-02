Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 709D12A29F9
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  2 Nov 2020 12:53:20 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kZYOl-0007qa-7z
	for lists+kgdb-bugreport@lfdr.de; Mon, 02 Nov 2020 11:53:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1kZYOj-0007qO-P9
 for kgdb-bugreport@lists.sourceforge.net; Mon, 02 Nov 2020 11:53:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8pOpPNam2BTL4szbnxJp4LS7vtJkYCW9OQ62wkxqSGo=; b=TECVyDobTpR4HVXEiI7o7TbNH0
 YLLPXoVdkEfa/BzXwx7CYJuVhvsthJMtmFowy7wdWmxrJ2zr10lekn5eglbTRg2Zl07AB264i1jJC
 7OIAvSU4sEB0LJIKyVTSIMK5GQGjydFFdrkU4ACeeyEX7YKd3ZdYMOcg5nZPMnj0vR60=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8pOpPNam2BTL4szbnxJp4LS7vtJkYCW9OQ62wkxqSGo=; b=RIyAN3A2v/Nptjwl0uZwB51+vQ
 sJbXuMVQyF6u7JF/rEPc4Yc+GXA9Z80agLQZuBDf8nBEFFF4SUmrv5/me9rdwA6MDk3PfqZ/zynrZ
 o6ji0T+I+XIGhhFWiHj+QAYfm3hgFcQSO473ygAqwEOoXzyEcuwDcSoE2pUP7lmt2r6Q=;
Received: from mail-oi1-f193.google.com ([209.85.167.193])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kZYOW-00GH7U-Sa
 for kgdb-bugreport@lists.sourceforge.net; Mon, 02 Nov 2020 11:53:17 +0000
Received: by mail-oi1-f193.google.com with SMTP id d9so8392986oib.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 02 Nov 2020 03:53:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=8pOpPNam2BTL4szbnxJp4LS7vtJkYCW9OQ62wkxqSGo=;
 b=YVW84JmDAp8DIjenSpzHBz73rPBLIFXlDsIDnEzlxzixQWBzr5oubMrEB0suStZQDA
 5u6FcZCH8rb7meD9z1wNrw22eNmKkh3xbRJmMpuejN6q8yErP4k0xoX3Gm7mNElk5dwo
 IpBqFT+p+1Yu0zC1WTwVvn3fcNkP0p7hLTpUCXn+z4h+j74HvR7GvqMCTfcEpU71h3iM
 lQq9D0AfCb5fCIHihCcJGevGeBlNDHbCIgPFT0G3YCr7VP39+goGdwX8dAbQGQsyd02H
 QK5fpZergbM89BpvkMNpkQzDgvXD4K3gCopYVu+qJ/nfsrOElciYmtrDgPaXhj4dFbT1
 vq5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=8pOpPNam2BTL4szbnxJp4LS7vtJkYCW9OQ62wkxqSGo=;
 b=ouhoew2WSralaQpBAzVOi6qDRB1rHJZXx0LI7YX7WfhfliZTn+Xo6K3T1FaEGClkx5
 AK6fvrk+gM0cf7AdD3ARtvjdnhL3hhRv4FhLVls6CIrDyTcji38Y0MoAZeDcdlAbhgwu
 cwnn2WN6c890WJO5yV3r5fT7ox5ZBPQHkzHnIoWIjCrfUDoz4iRRjVmuKKIjAKd1YBCX
 yTmYNodDqPGPffQqrY9W1Qj30hl0RlVsI9q8hS4HCrfFmFiqJs2/DupzFthRPlpwnyY2
 FUuJ1lmN/bgL/kOyg7168SH67XBAYfmRVULp12e0v4F1Xsr3UtzAZdp5Y1PE0sYs9PvB
 ehjg==
X-Gm-Message-State: AOAM532uHPmJ3KhCv/mO38iOpIU5btH5fSnabUNrokg3ysC8jSZ4zBnf
 Ook3DkpFV4pyP0DMB5utMfJB/oO60BoCOQ==
X-Google-Smtp-Source: ABdhPJwO3VPcjiMibXY/VqKjgGT4CpMVBqGEJct7m1nqiv5+M4BIMRRSqvYKD5zYQ9yu5ohzOtLOmA==
X-Received: by 2002:a17:90b:111:: with SMTP id
 p17mr17758894pjz.159.1604317558334; 
 Mon, 02 Nov 2020 03:45:58 -0800 (PST)
Received: from localhost.localdomain ([122.173.169.225])
 by smtp.gmail.com with ESMTPSA id y5sm14276184pfq.79.2020.11.02.03.45.50
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 02 Nov 2020 03:45:57 -0800 (PST)
From: Sumit Garg <sumit.garg@linaro.org>
To: maz@kernel.org, catalin.marinas@arm.com, will@kernel.org,
 daniel.thompson@linaro.org
Date: Mon,  2 Nov 2020 17:14:42 +0530
Message-Id: <1604317487-14543-3-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1604317487-14543-1-git-send-email-sumit.garg@linaro.org>
References: <1604317487-14543-1-git-send-email-sumit.garg@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.193 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.193 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kZYOW-00GH7U-Sa
Subject: [Kgdb-bugreport] [PATCH v7 2/7] irqchip/gic-v3: Enable support for
 SGIs to act as NMIs
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

Add support to handle SGIs as pseudo NMIs. As SGIs or IPIs default to a
special flow handler: handle_percpu_devid_fasteoi_ipi(), so skip NMI
handler update in case of SGIs.

Also, enable NMI support prior to gic_smp_init() as allocation of SGIs
as IRQs/NMIs happen as part of this routine.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---
 drivers/irqchip/irq-gic-v3.c | 29 +++++++++++++++++++++--------
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
index 16fecc0..7010ae2 100644
--- a/drivers/irqchip/irq-gic-v3.c
+++ b/drivers/irqchip/irq-gic-v3.c
@@ -461,6 +461,7 @@ static u32 gic_get_ppi_index(struct irq_data *d)
 static int gic_irq_nmi_setup(struct irq_data *d)
 {
 	struct irq_desc *desc = irq_to_desc(d->irq);
+	u32 idx;
 
 	if (!gic_supports_nmi())
 		return -EINVAL;
@@ -478,16 +479,22 @@ static int gic_irq_nmi_setup(struct irq_data *d)
 		return -EINVAL;
 
 	/* desc lock should already be held */
-	if (gic_irq_in_rdist(d)) {
-		u32 idx = gic_get_ppi_index(d);
+	switch (get_intid_range(d)) {
+	case SGI_RANGE:
+		break;
+	case PPI_RANGE:
+	case EPPI_RANGE:
+		idx = gic_get_ppi_index(d);
 
 		/* Setting up PPI as NMI, only switch handler for first NMI */
 		if (!refcount_inc_not_zero(&ppi_nmi_refs[idx])) {
 			refcount_set(&ppi_nmi_refs[idx], 1);
 			desc->handle_irq = handle_percpu_devid_fasteoi_nmi;
 		}
-	} else {
+		break;
+	default:
 		desc->handle_irq = handle_fasteoi_nmi;
+		break;
 	}
 
 	gic_irq_set_prio(d, GICD_INT_NMI_PRI);
@@ -498,6 +505,7 @@ static int gic_irq_nmi_setup(struct irq_data *d)
 static void gic_irq_nmi_teardown(struct irq_data *d)
 {
 	struct irq_desc *desc = irq_to_desc(d->irq);
+	u32 idx;
 
 	if (WARN_ON(!gic_supports_nmi()))
 		return;
@@ -515,14 +523,20 @@ static void gic_irq_nmi_teardown(struct irq_data *d)
 		return;
 
 	/* desc lock should already be held */
-	if (gic_irq_in_rdist(d)) {
-		u32 idx = gic_get_ppi_index(d);
+	switch (get_intid_range(d)) {
+	case SGI_RANGE:
+		break;
+	case PPI_RANGE:
+	case EPPI_RANGE:
+		idx = gic_get_ppi_index(d);
 
 		/* Tearing down NMI, only switch handler for last NMI */
 		if (refcount_dec_and_test(&ppi_nmi_refs[idx]))
 			desc->handle_irq = handle_percpu_devid_irq;
-	} else {
+		break;
+	default:
 		desc->handle_irq = handle_fasteoi_irq;
+		break;
 	}
 
 	gic_irq_set_prio(d, GICD_INT_DEF_PRI);
@@ -1708,6 +1722,7 @@ static int __init gic_init_bases(void __iomem *dist_base,
 
 	gic_dist_init();
 	gic_cpu_init();
+	gic_enable_nmi_support();
 	gic_smp_init();
 	gic_cpu_pm_init();
 
@@ -1719,8 +1734,6 @@ static int __init gic_init_bases(void __iomem *dist_base,
 			gicv2m_init(handle, gic_data.domain);
 	}
 
-	gic_enable_nmi_support();
-
 	return 0;
 
 out_free:
-- 
2.7.4



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
