Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A853028DFAD
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 14 Oct 2020 13:13:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kSeia-0004rq-Dt
	for lists+kgdb-bugreport@lfdr.de; Wed, 14 Oct 2020 11:13:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1kSeiY-0004rh-PT
 for kgdb-bugreport@lists.sourceforge.net; Wed, 14 Oct 2020 11:13:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SKgoeb2sQC7EsxoClVm7L3B4m5FY4cggAP6CyWZ0QJ4=; b=F/Z5MFnvgwnlgglR2gwdwuyfpn
 FXwBpgF3RayDc8TviHw7COnJB+OoxUGDAaj79fFBk0zQP/qOzW6e+fzf+fWY/JVodHonpwXS3/KBD
 V3KqmRsUJvsqP/UcHF+NJLM3kh1uxcsLXTatBDOCv89pnS7meIwHH4fkvMNlLawFYngo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SKgoeb2sQC7EsxoClVm7L3B4m5FY4cggAP6CyWZ0QJ4=; b=Bcw1qBAjoIpTfcOOx+zEO+m4/I
 6jnphjPNP52GzO0N40vWLDCv0+fdEaY4aluPARWS8Q8kqVcBSdaJ50CmzRt1EHOel6fWia4hvkq+O
 RyualgSrVeEg2toZc0R7WSGyMRZevmITs9lwkn7bYUNWxKokGF13fW2lUU+6GpyhC+9o=;
Received: from mail-pg1-f193.google.com ([209.85.215.193])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kSeiM-00F58w-7y
 for kgdb-bugreport@lists.sourceforge.net; Wed, 14 Oct 2020 11:13:14 +0000
Received: by mail-pg1-f193.google.com with SMTP id f5so1767016pgb.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 14 Oct 2020 04:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=SKgoeb2sQC7EsxoClVm7L3B4m5FY4cggAP6CyWZ0QJ4=;
 b=MMQn1HxAw/5HZN6E99ENJxg+pIPfiiKZv5G5Rl2fkTznbb5Dj8uynfA8lYT7tDLiZ7
 Ay8vBQvah6h4kxUV1R1aZ9oEkvKGj/bzq82P2YdtNeBcvvyNU6Mfq5vBCmGJkHLw9JEB
 DXPYph8KS9RzenPcuN5hjykrPD7W4PaFqVZitmYZI75OTsrIgroCRkF4/YdMi+cHcWLm
 ocPAwexfm0MAO8Dg7X6zSsb2WleF7rmz3j2i9DnH2bM9zUYRdi/CrkwBnuDcjkrnMoHi
 u/BwCXEpHRMqLX6FpyiJeO/bhtzozc5oQorwcwenTeLWenwMjk4FXaZaBJSzyDEn4E1G
 hPrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=SKgoeb2sQC7EsxoClVm7L3B4m5FY4cggAP6CyWZ0QJ4=;
 b=Nwefb6aaKikprhBKG/V5xam7HWpJpb1HCjLex4JlJ5PRtkkl9FfCqIcb6jHshy82qN
 ew3MpxG3MlP0vtxkcaLD9dmhst4IOwd040vpgWi8SM/Km5CEXVsnEe5BTryxWdHMKXgb
 nzjDqbeIr+5zoBsu9UyH0ksOtOAsA+jH7RHUfKEYjOQLrHJz1Ec1mpPQ5HQtNggKad/8
 PVtyjBYV8+7RNRiDwxFxh3xz6DtWVDxoGyEUAjCTVgR99f5AakPqad9Bqymd5wbXskJJ
 /nXZ/kJ2nWDHQ7qY0OYFIaVEyegoQKlIdmEWZYJLg83Vo8JIkcsWJ5tlkkMKlGlrxKaL
 Pdgg==
X-Gm-Message-State: AOAM533orppv/ZGVqFL/zZPK9EVHr7s/to1b1HMTVAzi+RL5MpuET2gu
 Pa4JCILV15nbcW+NEjHEgojPJw==
X-Google-Smtp-Source: ABdhPJwvoPqSTeDCjNjszJCXG1jgM+7fBedU3mgHJpvhE8Qr2Y4Y8e/gDZVOKFSpCznoGmJn4ALIyg==
X-Received: by 2002:a63:e44b:: with SMTP id i11mr3523192pgk.431.1602673976593; 
 Wed, 14 Oct 2020 04:12:56 -0700 (PDT)
Received: from localhost.localdomain ([117.252.65.235])
 by smtp.gmail.com with ESMTPSA id f21sm3060102pfk.169.2020.10.14.04.12.49
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 14 Oct 2020 04:12:55 -0700 (PDT)
From: Sumit Garg <sumit.garg@linaro.org>
To: maz@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org
Date: Wed, 14 Oct 2020 16:42:08 +0530
Message-Id: <1602673931-28782-3-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1602673931-28782-1-git-send-email-sumit.garg@linaro.org>
References: <1602673931-28782-1-git-send-email-sumit.garg@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.193 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kSeiM-00F58w-7y
Subject: [Kgdb-bugreport] [PATCH v5 2/5] irqchip/gic-v3: Enable support for
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
Cc: mark.rutland@arm.com, daniel.thompson@linaro.org, jason@lakedaemon.net,
 kgdb-bugreport@lists.sourceforge.net, ito-yuichi@fujitsu.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 jason.wessel@windriver.com, tglx@linutronix.de, msys.mizuma@gmail.com,
 julien.thierry.kdev@gmail.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Add support to handle SGIs as regular NMIs. As SGIs or IPIs defaults to a
special flow handler: handle_percpu_devid_fasteoi_ipi(), so skip NMI
handler update in case of SGIs.

Also, enable NMI support prior to gic_smp_init() as allocation of SGIs
as IRQs/NMIs happen as part of this routine.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---
 drivers/irqchip/irq-gic-v3.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
index 16fecc0..5efc865 100644
--- a/drivers/irqchip/irq-gic-v3.c
+++ b/drivers/irqchip/irq-gic-v3.c
@@ -477,6 +477,11 @@ static int gic_irq_nmi_setup(struct irq_data *d)
 	if (WARN_ON(gic_irq(d) >= 8192))
 		return -EINVAL;
 
+	if (get_intid_range(d) == SGI_RANGE) {
+		gic_irq_set_prio(d, GICD_INT_NMI_PRI);
+		return 0;
+	}
+
 	/* desc lock should already be held */
 	if (gic_irq_in_rdist(d)) {
 		u32 idx = gic_get_ppi_index(d);
@@ -514,6 +519,11 @@ static void gic_irq_nmi_teardown(struct irq_data *d)
 	if (WARN_ON(gic_irq(d) >= 8192))
 		return;
 
+	if (get_intid_range(d) == SGI_RANGE) {
+		gic_irq_set_prio(d, GICD_INT_DEF_PRI);
+		return;
+	}
+
 	/* desc lock should already be held */
 	if (gic_irq_in_rdist(d)) {
 		u32 idx = gic_get_ppi_index(d);
@@ -1708,6 +1718,7 @@ static int __init gic_init_bases(void __iomem *dist_base,
 
 	gic_dist_init();
 	gic_cpu_init();
+	gic_enable_nmi_support();
 	gic_smp_init();
 	gic_cpu_pm_init();
 
@@ -1719,8 +1730,6 @@ static int __init gic_init_bases(void __iomem *dist_base,
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
