Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C67C529EF2F
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 29 Oct 2020 16:06:27 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kY9VS-0005BJ-JL
	for lists+kgdb-bugreport@lfdr.de; Thu, 29 Oct 2020 15:06:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1kY9VR-0005B9-Lz
 for kgdb-bugreport@lists.sourceforge.net; Thu, 29 Oct 2020 15:06:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8pOpPNam2BTL4szbnxJp4LS7vtJkYCW9OQ62wkxqSGo=; b=Vc2OvzZJDx/oFWnOKcPh4Mdl5O
 aXlybFShr02Ekk5VJSxp3FW0eUbCO+IfTZZHAww/S8Bd1eQgKeEr+/80sg9UXYK6l73VBykPC+JIP
 5bgLGLjXal0FdmSoMuU97Tzc8Zg5/uluEr88HS3tqBj+3qQwoC9rLxj4Stc1BRkMuohk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8pOpPNam2BTL4szbnxJp4LS7vtJkYCW9OQ62wkxqSGo=; b=doRYUXfRX5xJ/KvDQirQsNUZz3
 4eToPkggKbPz5WQA8cGi8pRrvQBwC7e9hZlOZM+5xTi/mWzaMfkK7OZblZGRGp86Qk/Q/MIZcBKwv
 NLINII6yMP/Sixi+MvBJOMFkXEwNPYdEU4wOI6QQ+YabRa8UELWaYFWxqtQZVRDBf8jI=;
Received: from mail-qv1-f68.google.com ([209.85.219.68])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kY9VD-00BgrO-R9
 for kgdb-bugreport@lists.sourceforge.net; Thu, 29 Oct 2020 15:06:25 +0000
Received: by mail-qv1-f68.google.com with SMTP id ev17so1457105qvb.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 29 Oct 2020 08:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=8pOpPNam2BTL4szbnxJp4LS7vtJkYCW9OQ62wkxqSGo=;
 b=d4YEK6c+aXhdjFTqmGhY5o8SuZY7WS/1K0GQ7coVqZjtPIRNT31ygAkXKM+0b8Cz7J
 Z9CJ/SiroSskJaVVdglsaR8HhSB7ot1ghCZPKR6Afh7QxtFOKNoX0V86SKUGy0MaVUAh
 oD9LEiThc7e3P0cjKaqpm6I+usWW3anEnwx++BsIRCtKtifzZ/w6rQbvWjtYpodzZySD
 TpdZ2NA//D+0r92Qdo9qqzshvqhgItM9Eq/J6DUAPx2yWFUaPtigaKlQcjHnE5Lfq3qY
 m/ZwzFTzazI3Gn8Fod+uh5QKs8ZoY1E94tJeQfheL/SMYKT5ktXiLZvWeEXSyN7Hp3hi
 et4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=8pOpPNam2BTL4szbnxJp4LS7vtJkYCW9OQ62wkxqSGo=;
 b=FXLhfNKRzrvqxn1qqREla3wvVSFVLqT4FQu46/znih1mbUWZY5P61En4ME1TZ1352+
 q1N2vqdDLNgzpy9/YwMRViex+8MSTPvLtC6NLf/czKBdHMtUF8I0fRUyQ5iLCc3ipssC
 oFf0P7vh7vUE7Q7GN/P+P9vWMO7F7EiWz7mApahdQtJruZGBGjCEkCoDIBb6ZiRoaukK
 QOq2qDGMzs+5zdGhhDCaekYr37212lRWI3mfTx5JqLN04LSgZJzzA8muyx3gcXofB4jz
 8WZgdAEY9bb8Hglt6AJXeYfRG5q+tB/Th7zLri0D/V0DPCXeR0i1WRCl9xeOTFMkyU2n
 tm7Q==
X-Gm-Message-State: AOAM530uHJJrFWynlcBDJ/ICKqrJmIo32jrjaFI9gGIfqtJT4HFwyqTF
 hEVrVJ8EQvlboPn6gcSFcugcX/wedBklqw==
X-Google-Smtp-Source: ABdhPJwYY+sLvKRydFtz0q7pz4SlUKeWiDAtVfW3mm3RtKchc6SPXmugbyHmOESAVp4iW2TmjgIRSg==
X-Received: by 2002:a17:902:7249:b029:d6:4d:7d82 with SMTP id
 c9-20020a1709027249b02900d6004d7d82mr4522122pll.74.1603983503591; 
 Thu, 29 Oct 2020 07:58:23 -0700 (PDT)
Received: from localhost.localdomain ([117.252.71.231])
 by smtp.gmail.com with ESMTPSA id j11sm3085082pfc.64.2020.10.29.07.58.14
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 29 Oct 2020 07:58:22 -0700 (PDT)
From: Sumit Garg <sumit.garg@linaro.org>
To: maz@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org
Date: Thu, 29 Oct 2020 20:26:22 +0530
Message-Id: <1603983387-8738-3-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1603983387-8738-1-git-send-email-sumit.garg@linaro.org>
References: <1603983387-8738-1-git-send-email-sumit.garg@linaro.org>
X-Spam-Score: 1.4 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 1.5 RCVD_IN_SORBS_WEB      RBL: SORBS: sender is an abusable web server
 [117.252.71.231 listed in dnsbl.sorbs.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.219.68 listed in list.dnswl.org]
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
X-Headers-End: 1kY9VD-00BgrO-R9
Subject: [Kgdb-bugreport] [PATCH v6 2/7] irqchip/gic-v3: Enable support for
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
