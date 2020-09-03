Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8213525C11C
	for <lists+kgdb-bugreport@lfdr.de>; Thu,  3 Sep 2020 14:37:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kDoUh-00077N-OH
	for lists+kgdb-bugreport@lfdr.de; Thu, 03 Sep 2020 12:37:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1kDoUg-000777-94
 for kgdb-bugreport@lists.sourceforge.net; Thu, 03 Sep 2020 12:37:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kqVh90gZA+Jv+sQxaZ1mzbNqmtA+iD77lIe6xdCdvDA=; b=WryrnDAC7R69TaNRBrhrDlEAnZ
 cSmUIVY36JEbqmbtXGr6u9sgLhO+mpCWbinSKjP6CfM4aLyytkIozCZGemQtV7RRFfvbxdi+y5p5I
 tQzzGvniomLVQIIuXxD/9cVLA5A/6Y6qQNq6PVDt7CHnS0rwQN68UNEmELoGk1CMCgkE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kqVh90gZA+Jv+sQxaZ1mzbNqmtA+iD77lIe6xdCdvDA=; b=X22G+bhHYP85hyA2/TJAdFSs40
 Bo7qGWG3oLWH4tW0sNwQZn8N59uQjxrZNhRlvxm4ajI4DOxvRC5xwaMwdjwVxYC6PnOV8buLtAlY+
 19SdIRd3KTDs42oRITtD6LQXu+XRU1aYoaYa5gWxt4HLj1HeexUsUK/cod5FzuNaHiEg=;
Received: from mail-pg1-f195.google.com ([209.85.215.195])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kDoUa-00AVt6-IU
 for kgdb-bugreport@lists.sourceforge.net; Thu, 03 Sep 2020 12:37:34 +0000
Received: by mail-pg1-f195.google.com with SMTP id p37so2037840pgl.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 03 Sep 2020 05:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=kqVh90gZA+Jv+sQxaZ1mzbNqmtA+iD77lIe6xdCdvDA=;
 b=ZrKBu1JhDqa2E6DWCiORaYi2MHc650K/DlmYKis/qZYjWXXy6O+yn0bP6TzIzsFBSm
 euxbxOw6IhVyzcAW8Vg3CiZLCvCk3y+3OPvMHWw5RBKjrPdfM6xu/rqNc8R2NLafIsih
 PAvlVMhgYWUB6A0ZSUT/CM7hHt+s3sfhx0dBkWYjvktZgVl+5nkLfmMY8VKHP4DnGpQ2
 sK/R6N2wlyYaKb/BxxT0IkjO9QEoKIQ4C72kgiwS2cWKnj7odSv2/WeCxtlsxpyaiDih
 3IrOJGvYyomi7nArQs1weOdsUN/13cCauS5AEJoB5Sximm3RWvnsUGOUrGAHd+Zh0Mc7
 9wNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=kqVh90gZA+Jv+sQxaZ1mzbNqmtA+iD77lIe6xdCdvDA=;
 b=d6UIRnDk3en6hZ+PlFsFlnGzQPfzWGgwC/oIGVdNokXTTviXEXCv6ivGLLhgByFtlP
 9RXpW6LC0BwQrZNjVc1w9TJizAxlxehN6ebsGyBQuIe+R47a5Dad3AGBQfxCsNleYb8j
 0LDw1PKZNElZvffcmYJjrHCK9ruqlf3dVmFaB2sMHRlNxxxkoJmXVePJyfIRDKmc9Oy4
 t5LmB3Ai/1LV956psf/UeIpmMNydgmPtcBJg7P10DUvUYwvNQnANUO7Hzduc00CHYqh5
 H/coUrSofHIZbs46PPhzwF6sPYI0rHEbLb8b4j6wr5c92NAkKleYpdzF3YW7duqUJE+D
 z7fQ==
X-Gm-Message-State: AOAM533AjT3Yl3AYC3kNp664IDUGWb+PLAWT0y8N+D9ONpmwUDyfBHA3
 9x7o0hyVq8+6Voftfb7yfEO8plY2K/rMMw==
X-Google-Smtp-Source: ABdhPJxdTtirKYDBW9CeUl6CQDwTBIH7Lx0gi0PsvFrbdxpYkigdH3s+GR3erecKM5HMZcA9+JJmag==
X-Received: by 2002:aa7:90c4:: with SMTP id k4mr3398751pfk.79.1599134755991;
 Thu, 03 Sep 2020 05:05:55 -0700 (PDT)
Received: from localhost.localdomain ([117.210.209.248])
 by smtp.gmail.com with ESMTPSA id s1sm2922022pgh.47.2020.09.03.05.05.48
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 03 Sep 2020 05:05:55 -0700 (PDT)
From: Sumit Garg <sumit.garg@linaro.org>
To: maz@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org
Date: Thu,  3 Sep 2020 17:35:10 +0530
Message-Id: <1599134712-30923-3-git-send-email-sumit.garg@linaro.org>
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
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.195 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.195 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kDoUa-00AVt6-IU
Subject: [Kgdb-bugreport] [PATCH v3 2/4] irqchip/gic-v3: Enable support for
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
Cc: daniel.thompson@linaro.org, jason@lakedaemon.net,
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
