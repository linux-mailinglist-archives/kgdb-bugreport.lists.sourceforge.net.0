Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D63E7942B7
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  6 Sep 2023 20:05:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1qdwtt-0000mb-Bw
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 06 Sep 2023 18:05:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1qdv2j-0000Hf-0g
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 06 Sep 2023 16:06:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9AStTiUn2wkKE7iLM15Ptbf7v9P7cN3w/9Lr/OinoUk=; b=G1qC47LdXVAwWFrqpsbYVgMpO7
 7GupZXSv0XphI8SkRrRD2N2voVVusleMGuklJybAy6+vhVEASHJAOSsT2VXG2vEU2D1HCXL5fFK34
 ZIYwektU7AYXylaZCbyTaE5uPjHQYNGo/aXfsAYrHAL7eTIpw6AlgOuha/9riaJyBud4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9AStTiUn2wkKE7iLM15Ptbf7v9P7cN3w/9Lr/OinoUk=; b=bAwAVCQaWXG12l8gt6nPQNSUjH
 ejVlpvCcYuFRlIErHYQmrtsfjZ5nPckzsGicwTXGIq+lNWxJzy2K7ydUmM9LB2scb//DzfkrdFzVj
 YXKj0/zb/osxfM0IEu6v1pcAs2cI2QZd83yMfD8gRHlobUT65SFc+LF9C6G+l77umUNc=;
Received: from mail-pl1-f171.google.com ([209.85.214.171])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qdv2f-0003zW-3w for kgdb-bugreport@lists.sourceforge.net;
 Wed, 06 Sep 2023 16:06:12 +0000
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-1bf078d5f33so30445295ad.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 06 Sep 2023 09:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1694016363; x=1694621163;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9AStTiUn2wkKE7iLM15Ptbf7v9P7cN3w/9Lr/OinoUk=;
 b=WViuAz9bY9G96kiA3vk3AURuYDprJBXy2zsIZ7cjyHd+f8Ml/VIJ0Jd9Oswstc9071
 i9tPonB3P8ZB0aDw5hRqvIeFO2HNlVye+6rRBsShmXEbdL48iVhWMzCUxhLgXj4/gVd5
 WdnZgwjhxvSJrW+LvgClh83Fhjk+I4oaufhUI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694016363; x=1694621163;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9AStTiUn2wkKE7iLM15Ptbf7v9P7cN3w/9Lr/OinoUk=;
 b=Rv8Pv1BIPSG9v+Ss7YvNdYMCK9/5uvUg3Eb8SwrypQRHIgbI8L/6bx653MzLi15pNb
 Xr216ALmfWRm9oFBCx9XiByc7URCKsVoiPARYn2FazoZ0i/pyk72JcjFcKWRz1TWVaUD
 Anb3uT2dDXOODCLkRrzFEF4cXuP2pDuuI0NYIEgzBoiSUSowSaaaOOPFWzJFsDlTF0PS
 /Prmn7dXhug+IC6i/NGJHtSeeh7dnd3cDpyq0akQr+F4BdR0EIE8UDD5R7NJOdOoMo/R
 jTsDbdcJQwpxUS0IXEEHt9/Dl+UciHhku5imHxSRR3/XP0pCxtu1BDz39BDp4QMX4XVo
 sC0g==
X-Gm-Message-State: AOJu0Yzyfnde1Po9Zjl38/GgkjXoNcj/Ki3zwRG4XhqiqYrpc2rCOP/I
 ou8lQx6VgYaHYWP323iyHsEkqg==
X-Google-Smtp-Source: AGHT+IHvnL/4JaRFUJ+xW/5TxV7a56fOHoi2Ui181sO6LOlIeDV0WX7gAscP3gPGe2rpmUXdId80sQ==
X-Received: by 2002:a17:902:ea01:b0:1bf:205e:fe5d with SMTP id
 s1-20020a170902ea0100b001bf205efe5dmr20963955plg.7.1694016363355; 
 Wed, 06 Sep 2023 09:06:03 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:4a07:e00a:fdae:750b])
 by smtp.gmail.com with ESMTPSA id
 ju19-20020a170903429300b001b8c689060dsm11338859plb.28.2023.09.06.09.06.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Sep 2023 09:06:02 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Sumit Garg <sumit.garg@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Marc Zyngier <maz@kernel.org>
Date: Wed,  6 Sep 2023 09:02:56 -0700
Message-ID: <20230906090246.v13.1.I1223c11c88937bd0cbd9b086d4ef216985797302@changeid>
X-Mailer: git-send-email 2.42.0.283.g2d96d420d3-goog
In-Reply-To: <20230906160505.2431857-1-dianders@chromium.org>
References: <20230906160505.2431857-1-dianders@chromium.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  As of commit 6abbd6988971 ("irqchip/gic, gic-v3: Make SGIs
 use handle_percpu_devid_irq()") SGIs are treated the same as PPIs/EPPIs and
 use handle_percpu_devid_irq() by default. Unfortunately, handle_p [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.171 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.214.171 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qdv2f-0003zW-3w
Subject: [Kgdb-bugreport] [PATCH v13 1/7] irqchip/gic-v3: Enable support for
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
Cc: ito-yuichi@fujitsu.com, linux-kernel@vger.kernel.org,
 Lecopzer Chen <lecopzer.chen@mediatek.com>,
 Peter Zijlstra <peterz@infradead.org>, kgdb-bugreport@lists.sourceforge.net,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Stephane Eranian <eranian@google.com>, Stephen Boyd <swboyd@chromium.org>,
 linux-perf-users@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 Chen-Yu Tsai <wenst@chromium.org>,
 Tomohiro Misono <misono.tomohiro@fujitsu.com>,
 Thomas Gleixner <tglx@linutronix.de>, Masayoshi Mizuma <msys.mizuma@gmail.com>,
 Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

As of commit 6abbd6988971 ("irqchip/gic, gic-v3: Make SGIs use
handle_percpu_devid_irq()") SGIs are treated the same as PPIs/EPPIs
and use handle_percpu_devid_irq() by default. Unfortunately,
handle_percpu_devid_irq() isn't NMI safe, and so to run in an NMI
context those should use handle_percpu_devid_fasteoi_nmi().

In order to accomplish this, we just have to make room for SGIs in the
array of refcounts that keeps track of which interrupts are set as
NMI. We also rename the array and create a new indexing scheme that
accounts for SGIs.

Also, enable NMI support prior to gic_smp_init() as allocation of SGIs
as IRQs/NMIs happen as part of this routine.

Co-developed-by: Sumit Garg <sumit.garg@linaro.org>
Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
Acked-by: Mark Rutland <mark.rutland@arm.com>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
I'll note that this change is a little more black magic to me than
others in this series. I don't have a massive amounts of familiarity
with all the moving parts of gic-v3, so I mostly just followed Mark
Rutland's advice [1].

As per discussion [2], the hope is that this patch could get Acked by
Marc Zyngier and then land through the arm64 tree. If this isn't a
good idea for some reason, I'd love suggestions for alternate ways for
this series to land.

[1] https://lore.kernel.org/r/ZNC-YRQopO0PaIIo@FVFF77S0Q05N.cambridge.arm.com
[2] https://lore.kernel.org/r/ZPC1nUw3qKWrC85l@FVFF77S0Q05N.cambridge.arm.com

Changes in v13:
- s/_idx/_index/ on the patch to make function names consistent.

Changes in v12:
- Added a comment about why we account for 16 SGIs when Linux uses 8.

Changes in v10:
- Rewrite as needed for 5.11+ as per Mark Rutland and Sumit.

 drivers/irqchip/irq-gic-v3.c | 59 +++++++++++++++++++++++++-----------
 1 file changed, 41 insertions(+), 18 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
index eedfa8e9f077..787ccc880b22 100644
--- a/drivers/irqchip/irq-gic-v3.c
+++ b/drivers/irqchip/irq-gic-v3.c
@@ -78,6 +78,13 @@ static DEFINE_STATIC_KEY_TRUE(supports_deactivate_key);
 #define GIC_LINE_NR	min(GICD_TYPER_SPIS(gic_data.rdists.gicd_typer), 1020U)
 #define GIC_ESPI_NR	GICD_TYPER_ESPIS(gic_data.rdists.gicd_typer)
 
+/*
+ * There are 16 SGIs, though we only actually use 8 in Linux. The other 8 SGIs
+ * are potentially stolen by the secure side. Some code, especially code dealing
+ * with hwirq IDs, is simplified by accounting for all 16.
+ */
+#define SGI_NR		16
+
 /*
  * The behaviours of RPR and PMR registers differ depending on the value of
  * SCR_EL3.FIQ, and the behaviour of non-secure priority registers of the
@@ -125,8 +132,8 @@ EXPORT_SYMBOL(gic_nonsecure_priorities);
 		__priority;						\
 	})
 
-/* ppi_nmi_refs[n] == number of cpus having ppi[n + 16] set as NMI */
-static refcount_t *ppi_nmi_refs;
+/* rdist_nmi_refs[n] == number of cpus having the rdist interrupt n set as NMI */
+static refcount_t *rdist_nmi_refs;
 
 static struct gic_kvm_info gic_v3_kvm_info __initdata;
 static DEFINE_PER_CPU(bool, has_rss);
@@ -519,9 +526,22 @@ static u32 __gic_get_ppi_index(irq_hw_number_t hwirq)
 	}
 }
 
-static u32 gic_get_ppi_index(struct irq_data *d)
+static u32 __gic_get_rdist_index(irq_hw_number_t hwirq)
+{
+	switch (__get_intid_range(hwirq)) {
+	case SGI_RANGE:
+	case PPI_RANGE:
+		return hwirq;
+	case EPPI_RANGE:
+		return hwirq - EPPI_BASE_INTID + 32;
+	default:
+		unreachable();
+	}
+}
+
+static u32 gic_get_rdist_index(struct irq_data *d)
 {
-	return __gic_get_ppi_index(d->hwirq);
+	return __gic_get_rdist_index(d->hwirq);
 }
 
 static int gic_irq_nmi_setup(struct irq_data *d)
@@ -545,11 +565,14 @@ static int gic_irq_nmi_setup(struct irq_data *d)
 
 	/* desc lock should already be held */
 	if (gic_irq_in_rdist(d)) {
-		u32 idx = gic_get_ppi_index(d);
+		u32 idx = gic_get_rdist_index(d);
 
-		/* Setting up PPI as NMI, only switch handler for first NMI */
-		if (!refcount_inc_not_zero(&ppi_nmi_refs[idx])) {
-			refcount_set(&ppi_nmi_refs[idx], 1);
+		/*
+		 * Setting up a percpu interrupt as NMI, only switch handler
+		 * for first NMI
+		 */
+		if (!refcount_inc_not_zero(&rdist_nmi_refs[idx])) {
+			refcount_set(&rdist_nmi_refs[idx], 1);
 			desc->handle_irq = handle_percpu_devid_fasteoi_nmi;
 		}
 	} else {
@@ -582,10 +605,10 @@ static void gic_irq_nmi_teardown(struct irq_data *d)
 
 	/* desc lock should already be held */
 	if (gic_irq_in_rdist(d)) {
-		u32 idx = gic_get_ppi_index(d);
+		u32 idx = gic_get_rdist_index(d);
 
 		/* Tearing down NMI, only switch handler for last NMI */
-		if (refcount_dec_and_test(&ppi_nmi_refs[idx]))
+		if (refcount_dec_and_test(&rdist_nmi_refs[idx]))
 			desc->handle_irq = handle_percpu_devid_irq;
 	} else {
 		desc->handle_irq = handle_fasteoi_irq;
@@ -1279,10 +1302,10 @@ static void gic_cpu_init(void)
 	rbase = gic_data_rdist_sgi_base();
 
 	/* Configure SGIs/PPIs as non-secure Group-1 */
-	for (i = 0; i < gic_data.ppi_nr + 16; i += 32)
+	for (i = 0; i < gic_data.ppi_nr + SGI_NR; i += 32)
 		writel_relaxed(~0, rbase + GICR_IGROUPR0 + i / 8);
 
-	gic_cpu_config(rbase, gic_data.ppi_nr + 16, gic_redist_wait_for_rwp);
+	gic_cpu_config(rbase, gic_data.ppi_nr + SGI_NR, gic_redist_wait_for_rwp);
 
 	/* initialise system registers */
 	gic_cpu_sys_reg_init();
@@ -1939,12 +1962,13 @@ static void gic_enable_nmi_support(void)
 		return;
 	}
 
-	ppi_nmi_refs = kcalloc(gic_data.ppi_nr, sizeof(*ppi_nmi_refs), GFP_KERNEL);
-	if (!ppi_nmi_refs)
+	rdist_nmi_refs = kcalloc(gic_data.ppi_nr + SGI_NR,
+				 sizeof(*rdist_nmi_refs), GFP_KERNEL);
+	if (!rdist_nmi_refs)
 		return;
 
-	for (i = 0; i < gic_data.ppi_nr; i++)
-		refcount_set(&ppi_nmi_refs[i], 0);
+	for (i = 0; i < gic_data.ppi_nr + SGI_NR; i++)
+		refcount_set(&rdist_nmi_refs[i], 0);
 
 	pr_info("Pseudo-NMIs enabled using %s ICC_PMR_EL1 synchronisation\n",
 		gic_has_relaxed_pmr_sync() ? "relaxed" : "forced");
@@ -2061,6 +2085,7 @@ static int __init gic_init_bases(phys_addr_t dist_phys_base,
 
 	gic_dist_init();
 	gic_cpu_init();
+	gic_enable_nmi_support();
 	gic_smp_init();
 	gic_cpu_pm_init();
 
@@ -2073,8 +2098,6 @@ static int __init gic_init_bases(phys_addr_t dist_phys_base,
 			gicv2m_init(handle, gic_data.domain);
 	}
 
-	gic_enable_nmi_support();
-
 	return 0;
 
 out_free:
-- 
2.42.0.283.g2d96d420d3-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
