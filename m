Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9142D522C6D
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 11 May 2022 08:37:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1nofyY-0005cW-NY
	for lists+kgdb-bugreport@lfdr.de; Wed, 11 May 2022 06:37:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <hasegawa-hitomi@fujitsu.com>) id 1nofyX-0005cQ-31
 for kgdb-bugreport@lists.sourceforge.net; Wed, 11 May 2022 06:37:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rJNVR55VDTxZhWSd2gTb6ORUqpN8QfWk15j9wyUheHQ=; b=Ge5q/qJ3EfBG4Pu7OokgN/LL53
 R+F5oeExmVcaoeuKOlVKGvSbMKLToTEc2Bk/wys96boJJVUqL/fguI6JgRawIulH0dQRnnYDt//d0
 f/C0pgS+gT3gMEeKomYbooVqdsrICXbLJFm3F8UE/aAGsBtlzKRUD9E03odiAp1Nc/uA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rJNVR55VDTxZhWSd2gTb6ORUqpN8QfWk15j9wyUheHQ=; b=V79cOV9NJrVXqkVjoY0XRYne/2
 ZPI6eRpvH4V4LjtyIn6/zc2VnMJkwEYigxJbrmUyv4n60Pw1BpSWX5XEN28Z8znYbyLPto0ep0wXQ
 H02v1frQAMvghkX2mml16I/kbV+Thc/wkA53+48M0RSfsVGw4XEZh0EU8DkDHArA84Jk=;
Received: from esa7.hc1455-7.c3s2.iphmx.com ([139.138.61.252])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nofyW-008XSO-BP
 for kgdb-bugreport@lists.sourceforge.net; Wed, 11 May 2022 06:37:33 +0000
X-IronPort-AV: E=McAfee;i="6400,9594,10343"; a="51186271"
X-IronPort-AV: E=Sophos;i="5.91,216,1647270000"; d="scan'208";a="51186271"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
 by esa7.hc1455-7.c3s2.iphmx.com with ESMTP; 11 May 2022 15:21:42 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com
 [192.168.83.66])
 by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id BF4AEC9441
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 11 May 2022 15:21:41 +0900 (JST)
Received: from oym-om1.fujitsu.com (oym-om1.o.css.fujitsu.com [10.85.58.161])
 by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id EDF6114183
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 11 May 2022 15:21:40 +0900 (JST)
Received: from cn-r05-10.example.com (n3235113.np.ts.nmh.cs.fujitsu.co.jp
 [10.123.235.113])
 by oym-om1.fujitsu.com (Postfix) with ESMTP id BB1A740487FA4;
 Wed, 11 May 2022 15:21:40 +0900 (JST)
From: Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>
To: linux-arm-kernel@lists.infradead.org, soc@kernel.org,
 linux-serial@vger.kernel.org, sumit.garg@linaro.org
Date: Wed, 11 May 2022 15:21:13 +0900
Message-Id: <20220511062113.2645747-2-hasegawa-hitomi@fujitsu.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220511062113.2645747-1-hasegawa-hitomi@fujitsu.com>
References: <20220511062113.2645747-1-hasegawa-hitomi@fujitsu.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Enable diagnostic interrupts for the Fujitsu A64FX. Register
 the NMI/IRQ corresponding to the A64FX's device definition dedicated to
 diagnostic
 interrupts, so that when this interrupt is sent using the BMC, it causes
 a panic. This can be used to obtain [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
 low trust [139.138.61.252 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.7 SPF_NEUTRAL            SPF: sender does not match SPF record (neutral)
X-Headers-End: 1nofyW-008XSO-BP
Subject: [Kgdb-bugreport] [PATCH v4 1/1] soc: fujitsu: Add A64FX diagnostic
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

Enable diagnostic interrupts for the Fujitsu A64FX.

Register the NMI/IRQ corresponding to the A64FX's device definition
dedicated to diagnostic interrupts, so that when this interrupt is
sent using the BMC, it causes a panic. This can be used to obtain
a kernel dump.

Signed-off-by: Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>
---
 MAINTAINERS                      |   5 +
 drivers/soc/Kconfig              |   1 +
 drivers/soc/Makefile             |   1 +
 drivers/soc/fujitsu/Kconfig      |  13 +++
 drivers/soc/fujitsu/Makefile     |   3 +
 drivers/soc/fujitsu/a64fx-diag.c | 155 +++++++++++++++++++++++++++++++
 6 files changed, 178 insertions(+)
 create mode 100644 drivers/soc/fujitsu/Kconfig
 create mode 100644 drivers/soc/fujitsu/Makefile
 create mode 100644 drivers/soc/fujitsu/a64fx-diag.c

diff --git a/MAINTAINERS b/MAINTAINERS
index cd0f68d4a34a..dc35c81ba917 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -241,6 +241,11 @@ F:	include/trace/events/9p.h
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
index a8562678c437..e10eb27e1e7e 100644
--- a/drivers/soc/Kconfig
+++ b/drivers/soc/Kconfig
@@ -9,6 +9,7 @@ source "drivers/soc/atmel/Kconfig"
 source "drivers/soc/bcm/Kconfig"
 source "drivers/soc/canaan/Kconfig"
 source "drivers/soc/fsl/Kconfig"
+source "drivers/soc/fujitsu/Kconfig"
 source "drivers/soc/imx/Kconfig"
 source "drivers/soc/ixp4xx/Kconfig"
 source "drivers/soc/litex/Kconfig"
diff --git a/drivers/soc/Makefile b/drivers/soc/Makefile
index adb30c2d4fea..b12b0b03ad47 100644
--- a/drivers/soc/Makefile
+++ b/drivers/soc/Makefile
@@ -12,6 +12,7 @@ obj-$(CONFIG_SOC_CANAAN)	+= canaan/
 obj-$(CONFIG_ARCH_DOVE)		+= dove/
 obj-$(CONFIG_MACH_DOVE)		+= dove/
 obj-y				+= fsl/
+obj-y				+= fujitsu/
 obj-$(CONFIG_ARCH_GEMINI)	+= gemini/
 obj-y				+= imx/
 obj-y				+= ixp4xx/
diff --git a/drivers/soc/fujitsu/Kconfig b/drivers/soc/fujitsu/Kconfig
new file mode 100644
index 000000000000..e05c40725922
--- /dev/null
+++ b/drivers/soc/fujitsu/Kconfig
@@ -0,0 +1,13 @@
+# SPDX-License-Identifier: GPL-2.0-only
+menu "fujitsu SoC drivers"
+
+config A64FX_DIAG
+	tristate "A64FX diag driver"
+	depends on ARM64
+	depends on ACPI
+	help
+	  Say Y here if you want to enable diag interrupt on Fujitsu A64FX.
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
index 000000000000..0776c6de88c2
--- /dev/null
+++ b/drivers/soc/fujitsu/a64fx-diag.c
@@ -0,0 +1,155 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * A64FX diag driver.
+ * Copyright (c) 2022 Fujitsu Ltd.
+ */
+
+#include <linux/acpi.h>
+#include <linux/interrupt.h>
+#include <linux/irq.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+
+#define A64FX_DIAG_IRQ 1
+#define BMC_DIAG_INTERRUPT_STATUS_OFFSET (0x0044)
+#define BMC_DIAG_INTERRUPT_ENABLE_OFFSET (0x0040)
+#define BMC_DIAG_INTERRUPT_MASK BIT(31)
+
+struct a64fx_diag_priv {
+	int irq;
+	void __iomem *mmsc_reg_base;
+	bool has_nmi;
+};
+
+static irqreturn_t a64fx_diag_handler_nmi(int irq, void *dev_id)
+{
+	nmi_panic(NULL, "a64fx_diag: interrupt received\n");
+
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t a64fx_diag_handler_irq(int irq, void *dev_id)
+{
+	panic("a64fx_diag: interrupt received\n");
+
+	return IRQ_HANDLED;
+}
+
+static void a64fx_diag_interrupt_clear(struct a64fx_diag_priv *priv)
+{
+	u32 mmsc;
+	void __iomem *diag_status_reg_addr;
+
+	diag_status_reg_addr = priv->mmsc_reg_base + BMC_DIAG_INTERRUPT_STATUS_OFFSET;
+	mmsc = readl(diag_status_reg_addr);
+	if (mmsc & BMC_DIAG_INTERRUPT_MASK)
+		writel(BMC_DIAG_INTERRUPT_MASK, diag_status_reg_addr);
+}
+
+static void a64fx_diag_interrupt_enable(struct a64fx_diag_priv *priv)
+{
+	u32 mmsc;
+	void __iomem *diag_enable_reg_addr;
+
+	diag_enable_reg_addr = priv->mmsc_reg_base + BMC_DIAG_INTERRUPT_ENABLE_OFFSET;
+	mmsc = readl(diag_enable_reg_addr);
+	if (!(mmsc & BMC_DIAG_INTERRUPT_MASK)) {
+		mmsc |= BMC_DIAG_INTERRUPT_MASK;
+		writel(mmsc, diag_enable_reg_addr);
+	}
+}
+
+static void a64fx_diag_interrupt_disable(struct a64fx_diag_priv *priv)
+{
+	u32 mmsc;
+	void __iomem *diag_enable_reg_addr;
+
+	diag_enable_reg_addr = priv->mmsc_reg_base + BMC_DIAG_INTERRUPT_ENABLE_OFFSET;
+	mmsc = readl(diag_enable_reg_addr);
+	if (mmsc & BMC_DIAG_INTERRUPT_MASK) {
+		mmsc &= ~BMC_DIAG_INTERRUPT_MASK;
+		writel(mmsc, diag_enable_reg_addr);
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
+	ret = request_nmi(priv->irq, &a64fx_diag_handler_nmi, irq_flags,
+			"a64fx_diag_nmi", NULL);
+	if (ret) {
+		ret = request_irq(priv->irq, &a64fx_diag_handler_irq,
+				irq_flags, "a64fx_diag_irq", NULL);
+		if (ret) {
+			dev_err(dev, "cannot register IRQ %d\n", ret);
+			return ret;
+		}
+		enable_irq(priv->irq);
+		priv->has_nmi = false;
+	} else {
+		enable_nmi(priv->irq);
+		priv->has_nmi = true;
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
