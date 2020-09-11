Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 791AA266047
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 11 Sep 2020 15:29:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kGj7S-0002Je-8T
	for lists+kgdb-bugreport@lfdr.de; Fri, 11 Sep 2020 13:29:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1kGj7Q-0002JX-NW
 for kgdb-bugreport@lists.sourceforge.net; Fri, 11 Sep 2020 13:29:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kqVh90gZA+Jv+sQxaZ1mzbNqmtA+iD77lIe6xdCdvDA=; b=OgwmO6yIgy1rnN0JGiDxQWGxZj
 3/bg4iBGf3rlQu3BgOO205T0Ynw8U0wiepZmkzHvHRZZKUgApIy/O1dpI/+GELWL20i6KsvJRC+1R
 KfKt3avZCHFhIwlFhsdaucBNMFHRCPaO/ZMlN5mcGwQIEdc9+9f98F0Hh9XvWbhzxVRQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kqVh90gZA+Jv+sQxaZ1mzbNqmtA+iD77lIe6xdCdvDA=; b=U1aQrsgQL9nmoPE6kI8HciXWoN
 3YwaCxoD2cOQw1j6pQyiFPPWEXPCD7YkbheQiyBjBp1yVo2YfHF+A++oXo8+SErc04E/NGXRHwjnO
 KVZOTvx2l7MAcUspWJH5exwt5sJzKPQoOe+KnyvNC86hdidE83nMwJfG9A88nv9z1JP8=;
Received: from mail-pf1-f196.google.com ([209.85.210.196])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kGj7H-004UQo-MG
 for kgdb-bugreport@lists.sourceforge.net; Fri, 11 Sep 2020 13:29:36 +0000
Received: by mail-pf1-f196.google.com with SMTP id k15so7327410pfc.12
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 11 Sep 2020 06:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=kqVh90gZA+Jv+sQxaZ1mzbNqmtA+iD77lIe6xdCdvDA=;
 b=ICb2A4Q92/WBWM7cefZ5ElnS+BfqFA5z0dbBB4/9D+x61pUUrWW1TIJyG5l2OJJ2J5
 /b+lGtutItcjO/D7XmeVO8ZnVREF7WXLuAt2jwJvuvVcSsqEGPxbZ5u5LOpc00sQAHWj
 gfOC3DyGCrPI5E0Cm6J32sd1Nu8oGV5TOkQacP/WGNAa764VytHt7lu0brBvUxrFOvSa
 Pw5Mcyi2x9MbzUTws4bDmbU3LsDZxbaiPV+biUykE5780veIyiTyoc63274v3ZgtVsDG
 TyHyLH9q/0ALmh03yg/t0t0x4rf1uBE9MoH47bCmbU+IFZ52Te0Vqol1v32V9eODx1yV
 Smkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=kqVh90gZA+Jv+sQxaZ1mzbNqmtA+iD77lIe6xdCdvDA=;
 b=L0q0Y0hjahrPBUDlgxew/jjHGgdJULOz/3OpleZk7xdFQuoTn8FB2GxbSf42vi8o0p
 2qvyDtw3PA+rzhvMWggW6qLWBtP3Kx2oYimEfoxALnBOvOWjqrFPnm8YCttUtche01O5
 vsnw0RD2u9CqFDzNwy8oQAZcEkT+hj2BohBzYt1iXyKYFYN+sOmZ7rva5MiAvN5bHuw5
 qa/KBTPJJJltXE+hYH2iv3P+gIvvkF29HzEk6qO0RVOyRTqVKQRgwdmqWIlOEUKYKpsC
 zJJJ1ZAkJW/OSRIOeg5vHaubtbA6eBmAyHbQGB3FhWHXaEcjpvqeWj/DRc8fYU1xEnqs
 2JXg==
X-Gm-Message-State: AOAM533Zoy9MBwBageqhuqTfJF96yhPmok+5cR0tIFwQlR8MHP4NUrOV
 OpuYQuSBADFQotBImCqYu79POw==
X-Google-Smtp-Source: ABdhPJydCZ/jXrds01g38SygDtPX4ovyhhGVLoresFGxG+Fvj8jeLjcgon9C79eWnN9h7K1cLegzTg==
X-Received: by 2002:a17:902:760b:b029:d1:9be4:856b with SMTP id
 k11-20020a170902760bb02900d19be4856bmr2313328pll.1.1599830962073; 
 Fri, 11 Sep 2020 06:29:22 -0700 (PDT)
Received: from localhost.localdomain ([117.210.209.48])
 by smtp.gmail.com with ESMTPSA id e10sm557988pgb.45.2020.09.11.06.29.15
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 11 Sep 2020 06:29:21 -0700 (PDT)
From: Sumit Garg <sumit.garg@linaro.org>
To: maz@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org
Date: Fri, 11 Sep 2020 18:58:41 +0530
Message-Id: <1599830924-13990-3-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1599830924-13990-1-git-send-email-sumit.garg@linaro.org>
References: <1599830924-13990-1-git-send-email-sumit.garg@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.196 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.196 listed in wl.mailspike.net]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kGj7H-004UQo-MG
Subject: [Kgdb-bugreport] [PATCH v4 2/5] irqchip/gic-v3: Enable support for
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
 kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, jason.wessel@windriver.com,
 tglx@linutronix.de, julien.thierry.kdev@gmail.com
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
index 7170645..dfd8e03 100644
--- a/drivers/irqchip/irq-gic-v3.c
+++ b/drivers/irqchip/irq-gic-v3.c
@@ -476,6 +476,11 @@ static int gic_irq_nmi_setup(struct irq_data *d)
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
@@ -513,6 +518,11 @@ static void gic_irq_nmi_teardown(struct irq_data *d)
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
@@ -1666,6 +1676,7 @@ static int __init gic_init_bases(void __iomem *dist_base,
 
 	gic_dist_init();
 	gic_cpu_init();
+	gic_enable_nmi_support();
 	gic_smp_init();
 	gic_cpu_pm_init();
 
@@ -1677,8 +1688,6 @@ static int __init gic_init_bases(void __iomem *dist_base,
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
