Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 434414ED93F
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 31 Mar 2022 14:05:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1nZtYH-0005Bx-1g
	for lists+kgdb-bugreport@lfdr.de; Thu, 31 Mar 2022 12:05:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <gregkh@linuxfoundation.org>) id 1nZtYF-0005Bq-4Y
 for kgdb-bugreport@lists.sourceforge.net; Thu, 31 Mar 2022 12:05:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:List-Id:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JgsWJ5sqPMEycwHBRYvCfBIoc+m8TXQgH0F6cKSEgfI=; b=ba9hqJ/gcqF2X3UOF5HSkpHPZX
 RGgBhsS2GDMsl1AP8EeyEIYXxiTMGkxnIHXnWPWwvthxlTq/omozIf1TiiHZ/c80E8GWZbWFnWa28
 2e5wpil6VU0x0S2pOL3R+JXe7YDnskMt07FGGgF3vBTuI4zLCIIEXovMYpas7R1B3XDw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:
 List-Id:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=JgsWJ5sqPMEycwHBRYvCfBIoc+m8TXQgH0F6cKSEgfI=; b=I
 /46SQ+6+6Tt65Zc9vvK+oLpyPpOMHMmJBB9gjBWt12loo420/10wbq213fgHyUYJq21DSuSu6jrjF
 lvl94kXiDpvrkMbUOgw1nC0707tgtorBNejxAOFOuAxJ3CnFixANPi91uRC3mdUmEp0KXu3rbR4CP
 tTSpwRtH5p3t0n+4=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nZtY8-000bgY-6T
 for kgdb-bugreport@lists.sourceforge.net; Thu, 31 Mar 2022 12:05:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id BECF6CE218F;
 Thu, 31 Mar 2022 11:49:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80358C340ED;
 Thu, 31 Mar 2022 11:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1648727376;
 bh=8dNzaa2veuXcruIo4BHbX7IUW49FDfmSrGfO7EqK99Y=;
 h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
 b=D2Vcr6eqqa80T74Ou19H+g3QWtonaVlniIaNVnplWQRyFXxCEdMc1qT7jmZGBhlYO
 LucfWBzEohAKHtE8H4rhFHWIaDEczzorenrkUi5XPx+Qxwyb9JxkqtMMRq8pie08B0
 hkZZT9qG5tSUcvsRp2G/1+dmqMpZpduqoTpz+NAw=
Date: Thu, 31 Mar 2022 13:49:32 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>
Message-ID: <YkWVTEG5oFO82GPL@kroah.com>
References: <20220331092235.3000787-1-hasegawa-hitomi@fujitsu.com>
 <20220331092235.3000787-2-hasegawa-hitomi@fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220331092235.3000787-2-hasegawa-hitomi@fujitsu.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Mar 31, 2022 at 06:22:35PM +0900, Hitomi Hasegawa
 wrote: > Enable diagnostic interrupts for the A64FX. > This is done using
 a pseudo-NMI. I do not understand what this driver is, sorry. Can you please
 provide more information in the changelog text for what this is, who would
 use it, and how it will be interacted with. 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.73.55 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nZtY8-000bgY-6T
Subject: Re: [Kgdb-bugreport] [PATCH v3 1/1] soc: fujitsu: Add A64FX
 diagnostic interrupt driver
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
Cc: daniel.thompson@linaro.org, arnd@arndb.de, peterz@infradead.org,
 catalin.marinas@arm.com, kgdb-bugreport@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, soc@kernel.org, linux-serial@vger.kernel.org,
 jason.wessel@windriver.com, olof@lixom.net, jirislaby@kernel.org,
 will@kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Thu, Mar 31, 2022 at 06:22:35PM +0900, Hitomi Hasegawa wrote:
> Enable diagnostic interrupts for the A64FX.
> This is done using a pseudo-NMI.

I do not understand what this driver is, sorry.  Can you please provide
more information in the changelog text for what this is, who would use
it, and how it will be interacted with.

> 
> Signed-off-by: Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>
> ---
>  MAINTAINERS                      |   5 +
>  drivers/soc/Kconfig              |   1 +
>  drivers/soc/Makefile             |   1 +
>  drivers/soc/fujitsu/Kconfig      |  13 +++
>  drivers/soc/fujitsu/Makefile     |   3 +
>  drivers/soc/fujitsu/a64fx-diag.c | 151 +++++++++++++++++++++++++++++++
>  6 files changed, 174 insertions(+)
>  create mode 100644 drivers/soc/fujitsu/Kconfig
>  create mode 100644 drivers/soc/fujitsu/Makefile
>  create mode 100644 drivers/soc/fujitsu/a64fx-diag.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index cd0f68d4a34a..dc35c81ba917 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -241,6 +241,11 @@ F:	include/trace/events/9p.h
>  F:	include/uapi/linux/virtio_9p.h
>  F:	net/9p/
>  
> +A64FX DIAG DRIVER
> +M:	Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>
> +S:	Supported
> +F:	drivers/soc/fujitsu/a64fx-diag.c
> +
>  A8293 MEDIA DRIVER
>  M:	Antti Palosaari <crope@iki.fi>
>  L:	linux-media@vger.kernel.org
> diff --git a/drivers/soc/Kconfig b/drivers/soc/Kconfig
> index a8562678c437..e10eb27e1e7e 100644
> --- a/drivers/soc/Kconfig
> +++ b/drivers/soc/Kconfig
> @@ -9,6 +9,7 @@ source "drivers/soc/atmel/Kconfig"
>  source "drivers/soc/bcm/Kconfig"
>  source "drivers/soc/canaan/Kconfig"
>  source "drivers/soc/fsl/Kconfig"
> +source "drivers/soc/fujitsu/Kconfig"
>  source "drivers/soc/imx/Kconfig"
>  source "drivers/soc/ixp4xx/Kconfig"
>  source "drivers/soc/litex/Kconfig"
> diff --git a/drivers/soc/Makefile b/drivers/soc/Makefile
> index adb30c2d4fea..b12b0b03ad47 100644
> --- a/drivers/soc/Makefile
> +++ b/drivers/soc/Makefile
> @@ -12,6 +12,7 @@ obj-$(CONFIG_SOC_CANAAN)	+= canaan/
>  obj-$(CONFIG_ARCH_DOVE)		+= dove/
>  obj-$(CONFIG_MACH_DOVE)		+= dove/
>  obj-y				+= fsl/
> +obj-y				+= fujitsu/
>  obj-$(CONFIG_ARCH_GEMINI)	+= gemini/
>  obj-y				+= imx/
>  obj-y				+= ixp4xx/
> diff --git a/drivers/soc/fujitsu/Kconfig b/drivers/soc/fujitsu/Kconfig
> new file mode 100644
> index 000000000000..b41cdac67637
> --- /dev/null
> +++ b/drivers/soc/fujitsu/Kconfig
> @@ -0,0 +1,13 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +menu "fujitsu SoC drivers"
> +
> +config A64FX_DIAG
> +	bool "A64FX diag driver"
> +	depends on ARM64

What about ACPI?  Shouldn't this code depend on that?

> +	help
> +	  Say Y here if you want to enable diag interrupt on A64FX.

What is A64FX?

> +	  This driver uses pseudo-NMI if available.

What does this mean?

> +
> +	  If unsure, say N.

No module?  Why not?

> +
> +endmenu
> diff --git a/drivers/soc/fujitsu/Makefile b/drivers/soc/fujitsu/Makefile
> new file mode 100644
> index 000000000000..945bc1c14ad0
> --- /dev/null
> +++ b/drivers/soc/fujitsu/Makefile
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +obj-$(CONFIG_A64FX_DIAG)	+= a64fx-diag.o
> diff --git a/drivers/soc/fujitsu/a64fx-diag.c b/drivers/soc/fujitsu/a64fx-diag.c
> new file mode 100644
> index 000000000000..c6f895cf8912
> --- /dev/null
> +++ b/drivers/soc/fujitsu/a64fx-diag.c
> @@ -0,0 +1,151 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * A64FX diag driver.

No copyright information?  Are you sure?

> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/interrupt.h>
> +#include <linux/irq.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/sysrq.h>
> +
> +#define A64FX_DIAG_IRQ 1
> +#define BMC_DIAG_INTERRUPT_STATUS_OFFSET (0x0044)
> +#define BMC_INTERRUPT_STATUS_MASK ((1U) << 31)

BIT()?

> +#define BMC_DIAG_INTERRUPT_ENABLE_OFFSET (0x0040)
> +#define BMC_INTERRUPT_ENABLE_MASK ((1U) << 31)

BIT()?

> +
> +struct a64fx_diag_priv {
> +	int irq;
> +	void __iomem *mmsc_reg_base;
> +	bool has_nmi;
> +};
> +
> +static irqreturn_t a64fx_diag_handler(int irq, void *dev_id)
> +{
> +	handle_sysrq('c');


Why is this calling this sysrq call?  From an interrupt?  Why?

And you are hard-coding "c", are you sure?

> +
> +	return IRQ_HANDLED;
> +}
> +
> +static void a64fx_diag_interrupt_clear(struct a64fx_diag_priv *priv)
> +{
> +	u32 mmsc;
> +	const void __iomem *diag_status_reg_addr;
> +
> +	diag_status_reg_addr = priv->mmsc_reg_base + BMC_DIAG_INTERRUPT_STATUS_OFFSET;
> +	mmsc = readl(diag_status_reg_addr);
> +	if (mmsc & BMC_INTERRUPT_STATUS_MASK)
> +		writel(BMC_INTERRUPT_STATUS_MASK, (void *)diag_status_reg_addr);

No need to wait for the write to complete?

You shouldn't have to cast diag_status_reg_addr, right?

> +}
> +
> +static void a64fx_diag_interrupt_enable(struct a64fx_diag_priv *priv)
> +{
> +	u32 mmsc;
> +	const void __iomem *diag_enable_reg_addr;
> +
> +	diag_enable_reg_addr = priv->mmsc_reg_base + BMC_DIAG_INTERRUPT_ENABLE_OFFSET;
> +	mmsc = readl(diag_enable_reg_addr);
> +	if (!(mmsc & BMC_INTERRUPT_ENABLE_MASK)) {
> +		mmsc |= BMC_INTERRUPT_STATUS_MASK;
> +		writel(mmsc, (void *)diag_enable_reg_addr);
> +	}
> +}
> +
> +static void a64fx_diag_interrupt_disable(struct a64fx_diag_priv *priv)
> +{
> +	u32 mmsc;
> +	const void __iomem *diag_enable_reg_addr;
> +
> +	diag_enable_reg_addr = priv->mmsc_reg_base + BMC_DIAG_INTERRUPT_ENABLE_OFFSET;
> +	mmsc = readl(diag_enable_reg_addr);
> +	if (mmsc & BMC_INTERRUPT_ENABLE_MASK) {
> +		mmsc &= ~BMC_INTERRUPT_ENABLE_MASK;
> +		writel(mmsc, (void *)diag_enable_reg_addr);
> +	}
> +}
> +
> +static int a64fx_diag_probe(struct platform_device *pdev)
> +{
> +	int ret;
> +	unsigned long irq_flags;
> +	struct device *dev = &pdev->dev;
> +	struct a64fx_diag_priv *priv;
> +
> +	priv = devm_kzalloc(dev, sizeof(struct a64fx_diag_priv), GFP_KERNEL);
> +	if (priv == NULL)
> +		return -ENOMEM;
> +
> +	priv->mmsc_reg_base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(priv->mmsc_reg_base))
> +		return PTR_ERR(priv->mmsc_reg_base);
> +
> +	priv->irq = platform_get_irq(pdev, A64FX_DIAG_IRQ);
> +	if (priv->irq < 0)
> +		return priv->irq;
> +
> +	platform_set_drvdata(pdev, priv);
> +
> +	a64fx_diag_interrupt_clear(priv);
> +	a64fx_diag_interrupt_enable(priv);
> +
> +	irq_flags = IRQF_PERCPU | IRQF_NOBALANCING | IRQF_NO_AUTOEN |
> +		   IRQF_NO_THREAD;
> +	ret = request_nmi(priv->irq, &a64fx_diag_handler, irq_flags,
> +			"a64fx_diag_nmi", NULL);
> +	if (ret) {
> +		ret = request_irq(priv->irq, &a64fx_diag_handler,
> +				irq_flags, "a64fx_diag_irq", NULL);
> +		if (ret) {
> +			dev_err(dev, "cannot register IRQ %d\n", ret);
> +			return ret;
> +		}
> +		enable_irq(priv->irq);
> +		priv->has_nmi = false;
> +		dev_info(dev, "registered for IRQ %d\n", priv->irq);
> +	} else {
> +		enable_nmi(priv->irq);
> +		priv->has_nmi = true;
> +		dev_info(dev, "registered for NMI %d\n", priv->irq);

When drivers are successful, they are quiet.  No need for the noise
here.

thanks,

greg k-h


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
