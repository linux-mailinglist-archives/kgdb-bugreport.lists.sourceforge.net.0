Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 058CC4CD399
	for <lists+kgdb-bugreport@lfdr.de>; Fri,  4 Mar 2022 12:38:04 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1nQ6G3-0001Rt-OH
	for lists+kgdb-bugreport@lfdr.de; Fri, 04 Mar 2022 11:38:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <hasegawa-hitomi@fujitsu.com>) id 1nQ1wY-0001NE-Po
 for kgdb-bugreport@lists.sourceforge.net; Fri, 04 Mar 2022 07:01:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GIElpoyF1KKhTQAbAclZSAj1a5MrDNAswxFeybeDjJw=; b=HBm/EkN6vrgCchK8SY0lj/c1XK
 dUjfyv2N/19K8VSMey3/ZF4GycS7rtT7DmmMbdor9T8QyLn28rP3on3Iq5nXQvIO6KnHhjy2pdGnP
 mbphTFS7RE9JIuBDNk9tqAhQouEAe2SLHgzXAy6UnERrm2H2dEPiNcC7lnfFySjR94Oc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GIElpoyF1KKhTQAbAclZSAj1a5MrDNAswxFeybeDjJw=; b=RXKR8HicJLYZ4vPA0gU/rkLVol
 gzHlku+Hau3LicJehnMHURo0xDd9mUJLtZc/FDeAF9vBL+hKgcehpSfLV6vJ3p++RPXlf8BMPjedJ
 Oo9rmGZ9njIhC1tz771cRuwBqSoLN8oYLozZrfiYlGRVWAzcB1aoLyHMAvSbNwg6QC80=;
Received: from esa12.hc1455-7.c3s2.iphmx.com ([139.138.37.100])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nQ1wV-0003TF-NM
 for kgdb-bugreport@lists.sourceforge.net; Fri, 04 Mar 2022 07:01:36 +0000
IronPort-SDR: /EPDf2Igg1othWLxDkwdPIBUGLKN7rshvRId+dcdDLfzqT3ckr5QaFaV2WAyITafDO/eo11vlt
 Hva90VVCV6ZF6c4VMdIwRvo4ApX3NIhBTb7CD1f1Uae/uBp0derlJHPohBfK4Gwqqzg3pM4ETn
 nka6+vWeK5AETEml+y1DMYg59tczBzCD+6wSkRHhWjt3a9Zwc9d/bwij2q3uicX1CKE8zvWzgM
 eyIrTOzpEgQJZohw+nfYcepglh+55gHJqTGdOT7qqM1oJMA+M51aKXzo7F/l7J9Xt0dD9rb3Na
 66fD28BXmCQSdzMpsSNI+mtY
X-IronPort-AV: E=McAfee;i="6200,9189,10275"; a="44773122"
X-IronPort-AV: E=Sophos;i="5.90,154,1643641200"; d="scan'208";a="44773122"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
 by esa12.hc1455-7.c3s2.iphmx.com with ESMTP; 04 Mar 2022 15:45:52 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com
 [192.168.87.60])
 by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id EB603E902C
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri,  4 Mar 2022 15:45:51 +0900 (JST)
Received: from yto-om2.fujitsu.com (yto-om2.o.css.fujitsu.com [10.128.89.163])
 by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1730DD97F3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri,  4 Mar 2022 15:45:51 +0900 (JST)
Received: from cn-r05-10.example.com (n3235113.np.ts.nmh.cs.fujitsu.co.jp
 [10.123.235.113])
 by yto-om2.fujitsu.com (Postfix) with ESMTP id 838674007DEED;
 Fri,  4 Mar 2022 15:45:50 +0900 (JST)
From: Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>
To: linux-arm-kernel@lists.infradead.org, soc@kernel.org,
 linux-serial@vger.kernel.org, sumit.garg@linaro.org
Date: Fri,  4 Mar 2022 15:43:24 +0900
Message-Id: <20220304064324.331217-3-hasegawa-hitomi@fujitsu.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220304064324.331217-1-hasegawa-hitomi@fujitsu.com>
References: <20220304064324.331217-1-hasegawa-hitomi@fujitsu.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Spam-Score: -1.6 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Enable diagnostic interrupts for the A64FX. This is done
 using
 a pseudo-NMI. Signed-off-by: Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>
 --- MAINTAINERS | 5 + drivers/soc/Kconfig | 1 + drivers/soc/Makefile | 1
 + drivers/soc/fujitsu/Kconfig | 13 +++ drivers/soc/fujitsu/Makefil [...] 
 Content analysis details:   (-1.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [139.138.37.100 listed in list.dnswl.org]
 0.7 SPF_NEUTRAL            SPF: sender does not match SPF record (neutral)
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
X-Headers-End: 1nQ1wV-0003TF-NM
X-Mailman-Approved-At: Fri, 04 Mar 2022 11:38:02 +0000
Subject: [Kgdb-bugreport] [PATCH v2 2/2] soc: fujitsu: Add A64FX diagnostic
 interrupt driver
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
Cc: hasegawa-hitomi@fujitsu.com, daniel.thompson@linaro.org, arnd@arndb.de,
 will@kernel.org, peterz@infradead.org, catalin.marinas@arm.com,
 jason.wessel@windriver.com, linux-kernel@vger.kernel.org,
 gregkh@linuxfoundation.org, olof@lixom.net, jirislaby@kernel.org,
 kgdb-bugreport@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Enable diagnostic interrupts for the A64FX.
This is done using a pseudo-NMI.

Signed-off-by: Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>
---
 MAINTAINERS                      |   5 +
 drivers/soc/Kconfig              |   1 +
 drivers/soc/Makefile             |   1 +
 drivers/soc/fujitsu/Kconfig      |  13 +++
 drivers/soc/fujitsu/Makefile     |   3 +
 drivers/soc/fujitsu/a64fx-diag.c | 151 +++++++++++++++++++++++++++++++
 6 files changed, 174 insertions(+)
 create mode 100644 drivers/soc/fujitsu/Kconfig
 create mode 100644 drivers/soc/fujitsu/Makefile
 create mode 100644 drivers/soc/fujitsu/a64fx-diag.c

diff --git a/MAINTAINERS b/MAINTAINERS
index dd36acc87ce6..e9663fa92a52 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -239,6 +239,11 @@ F:	include/trace/events/9p.h
 F:	include/uapi/linux/virtio_9p.h
 F:	net/9p/
 
+A64FX DIAG DRIVER
+M:	Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>
+S:	Supported
+F:	drivers/soc/fujitsu/a64fx-diag.c
+
 A8293 MEDIA DRIVER
 M:	Antti Palosaari <crope@iki.fi>
 L:	linux-media@vger.kernel.org
diff --git a/drivers/soc/Kconfig b/drivers/soc/Kconfig
index e8a30c4c5aec..0405ff0b3be6 100644
--- a/drivers/soc/Kconfig
+++ b/drivers/soc/Kconfig
@@ -8,6 +8,7 @@ source "drivers/soc/atmel/Kconfig"
 source "drivers/soc/bcm/Kconfig"
 source "drivers/soc/canaan/Kconfig"
 source "drivers/soc/fsl/Kconfig"
+source "drivers/soc/fujitsu/Kconfig"
 source "drivers/soc/imx/Kconfig"
 source "drivers/soc/ixp4xx/Kconfig"
 source "drivers/soc/litex/Kconfig"
diff --git a/drivers/soc/Makefile b/drivers/soc/Makefile
index a05e9fbcd3e0..86596405a39c 100644
--- a/drivers/soc/Makefile
+++ b/drivers/soc/Makefile
@@ -11,6 +11,7 @@ obj-$(CONFIG_SOC_CANAAN)	+= canaan/
 obj-$(CONFIG_ARCH_DOVE)		+= dove/
 obj-$(CONFIG_MACH_DOVE)		+= dove/
 obj-y				+= fsl/
+obj-y				+= fujitsu/
 obj-$(CONFIG_ARCH_GEMINI)	+= gemini/
 obj-y				+= imx/
 obj-y				+= ixp4xx/
diff --git a/drivers/soc/fujitsu/Kconfig b/drivers/soc/fujitsu/Kconfig
new file mode 100644
index 000000000000..b41cdac67637
--- /dev/null
+++ b/drivers/soc/fujitsu/Kconfig
@@ -0,0 +1,13 @@
+# SPDX-License-Identifier: GPL-2.0-only
+menu "fujitsu SoC drivers"
+
+config A64FX_DIAG
+	bool "A64FX diag driver"
+	depends on ARM64
+	help
+	  Say Y here if you want to enable diag interrupt on A64FX.
+	  This driver uses pseudo-NMI if available.
+
+	  If unsure, say N.
+
+endmenu
diff --git a/drivers/soc/fujitsu/Makefile b/drivers/soc/fujitsu/Makefile
new file mode 100644
index 000000000000..945bc1c14ad0
--- /dev/null
+++ b/drivers/soc/fujitsu/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-$(CONFIG_A64FX_DIAG)	+= a64fx-diag.o
diff --git a/drivers/soc/fujitsu/a64fx-diag.c b/drivers/soc/fujitsu/a64fx-diag.c
new file mode 100644
index 000000000000..c6f895cf8912
--- /dev/null
+++ b/drivers/soc/fujitsu/a64fx-diag.c
@@ -0,0 +1,151 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * A64FX diag driver.
+ */
+
+#include <linux/acpi.h>
+#include <linux/interrupt.h>
+#include <linux/irq.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/sysrq.h>
+
+#define A64FX_DIAG_IRQ 1
+#define BMC_DIAG_INTERRUPT_STATUS_OFFSET (0x0044)
+#define BMC_INTERRUPT_STATUS_MASK ((1U) << 31)
+#define BMC_DIAG_INTERRUPT_ENABLE_OFFSET (0x0040)
+#define BMC_INTERRUPT_ENABLE_MASK ((1U) << 31)
+
+struct a64fx_diag_priv {
+	int irq;
+	void __iomem *mmsc_reg_base;
+	bool has_nmi;
+};
+
+static irqreturn_t a64fx_diag_handler(int irq, void *dev_id)
+{
+	handle_sysrq('c');
+
+	return IRQ_HANDLED;
+}
+
+static void a64fx_diag_interrupt_clear(struct a64fx_diag_priv *priv)
+{
+	u32 mmsc;
+	const void __iomem *diag_status_reg_addr;
+
+	diag_status_reg_addr = priv->mmsc_reg_base + BMC_DIAG_INTERRUPT_STATUS_OFFSET;
+	mmsc = readl(diag_status_reg_addr);
+	if (mmsc & BMC_INTERRUPT_STATUS_MASK)
+		writel(BMC_INTERRUPT_STATUS_MASK, (void *)diag_status_reg_addr);
+}
+
+static void a64fx_diag_interrupt_enable(struct a64fx_diag_priv *priv)
+{
+	u32 mmsc;
+	const void __iomem *diag_enable_reg_addr;
+
+	diag_enable_reg_addr = priv->mmsc_reg_base + BMC_DIAG_INTERRUPT_ENABLE_OFFSET;
+	mmsc = readl(diag_enable_reg_addr);
+	if (!(mmsc & BMC_INTERRUPT_ENABLE_MASK)) {
+		mmsc |= BMC_INTERRUPT_STATUS_MASK;
+		writel(mmsc, (void *)diag_enable_reg_addr);
+	}
+}
+
+static void a64fx_diag_interrupt_disable(struct a64fx_diag_priv *priv)
+{
+	u32 mmsc;
+	const void __iomem *diag_enable_reg_addr;
+
+	diag_enable_reg_addr = priv->mmsc_reg_base + BMC_DIAG_INTERRUPT_ENABLE_OFFSET;
+	mmsc = readl(diag_enable_reg_addr);
+	if (mmsc & BMC_INTERRUPT_ENABLE_MASK) {
+		mmsc &= ~BMC_INTERRUPT_ENABLE_MASK;
+		writel(mmsc, (void *)diag_enable_reg_addr);
+	}
+}
+
+static int a64fx_diag_probe(struct platform_device *pdev)
+{
+	int ret;
+	unsigned long irq_flags;
+	struct device *dev = &pdev->dev;
+	struct a64fx_diag_priv *priv;
+
+	priv = devm_kzalloc(dev, sizeof(struct a64fx_diag_priv), GFP_KERNEL);
+	if (priv == NULL)
+		return -ENOMEM;
+
+	priv->mmsc_reg_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(priv->mmsc_reg_base))
+		return PTR_ERR(priv->mmsc_reg_base);
+
+	priv->irq = platform_get_irq(pdev, A64FX_DIAG_IRQ);
+	if (priv->irq < 0)
+		return priv->irq;
+
+	platform_set_drvdata(pdev, priv);
+
+	a64fx_diag_interrupt_clear(priv);
+	a64fx_diag_interrupt_enable(priv);
+
+	irq_flags = IRQF_PERCPU | IRQF_NOBALANCING | IRQF_NO_AUTOEN |
+		   IRQF_NO_THREAD;
+	ret = request_nmi(priv->irq, &a64fx_diag_handler, irq_flags,
+			"a64fx_diag_nmi", NULL);
+	if (ret) {
+		ret = request_irq(priv->irq, &a64fx_diag_handler,
+				irq_flags, "a64fx_diag_irq", NULL);
+		if (ret) {
+			dev_err(dev, "cannot register IRQ %d\n", ret);
+			return ret;
+		}
+		enable_irq(priv->irq);
+		priv->has_nmi = false;
+		dev_info(dev, "registered for IRQ %d\n", priv->irq);
+	} else {
+		enable_nmi(priv->irq);
+		priv->has_nmi = true;
+		dev_info(dev, "registered for NMI %d\n", priv->irq);
+	}
+
+	return 0;
+}
+
+static int __exit a64fx_diag_remove(struct platform_device *pdev)
+{
+	struct a64fx_diag_priv *priv = platform_get_drvdata(pdev);
+
+	a64fx_diag_interrupt_disable(priv);
+	a64fx_diag_interrupt_clear(priv);
+
+	if (priv->has_nmi)
+		free_nmi(priv->irq, NULL);
+	else
+		free_irq(priv->irq, NULL);
+
+	return 0;
+}
+
+static const struct acpi_device_id a64fx_diag_acpi_match[] = {
+	{ "FUJI2007", 0 },
+	{ },
+};
+MODULE_DEVICE_TABLE(acpi, a64fx_diag_acpi_match);
+
+
+static struct platform_driver a64fx_diag_driver = {
+	.driver = {
+		.name = "a64fx_diag_driver",
+		.acpi_match_table = ACPI_PTR(a64fx_diag_acpi_match),
+	},
+	.probe = a64fx_diag_probe,
+	.remove = a64fx_diag_remove,
+};
+
+module_platform_driver(a64fx_diag_driver);
+
+MODULE_LICENSE("GPL v2");
+MODULE_AUTHOR("Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>");
+MODULE_DESCRIPTION("A64FX diag driver");
-- 
2.27.0



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
