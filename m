Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DCEFA52EE95
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 20 May 2022 16:59:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1ns46Y-00022s-2O
	for lists+kgdb-bugreport@lfdr.de; Fri, 20 May 2022 14:59:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jirislaby@gmail.com>) id 1nog8k-0004fI-ON
 for kgdb-bugreport@lists.sourceforge.net; Wed, 11 May 2022 06:48:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=d0+VSEkVTN5UKp/1tlZfodLf5D5A+zx04J2EOUOCF00=; b=VjJCxb6C2nMDqmNQXW49jmue+U
 RRzRtXrc7ZSFpuvnLfDqj7z5J6z9X0ElV4p2IictBuZDyQW5IlaZeo59TPIjMyQZnBSEAD+B+N6FC
 v55QVyccBPfa1NeYweCEtFU8ptU7e78zEK6kd99SzgYRWT5PJNqMUcJHM1HVbBxI/kZs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=d0+VSEkVTN5UKp/1tlZfodLf5D5A+zx04J2EOUOCF00=; b=dJhu+8YKNyt2Kefgvvy7cS8VCz
 XB45+2iAM6sWyhmNW9AfkzQyN0gQXhUJYbLR2B65QF7fBTF4MiNiQQrGi9X05mBDx1QbOiqOnxeG3
 K51bF360xEtKOMZfn2TWs6xyIXgD+Z+EcIMbk2f5Yt0fZoJKzETcvP+H6LQJ16qzPv0g=;
Received: from mail-wm1-f46.google.com ([209.85.128.46])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nog8d-008Xw9-QN
 for kgdb-bugreport@lists.sourceforge.net; Wed, 11 May 2022 06:48:05 +0000
Received: by mail-wm1-f46.google.com with SMTP id k126so605083wme.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 10 May 2022 23:47:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=d0+VSEkVTN5UKp/1tlZfodLf5D5A+zx04J2EOUOCF00=;
 b=loJf73Zn3QXp08oaN9nEudWUN/1gmK23eZvQL8+lH1AHhuAhApDSzfNGZ53i4uwHPH
 wMy9eGsdQ6nSVOGfvwxTOQg5ckkU8WhSwCsJNpkLgDr9oQjS0VPnd2cg9lIxhdVxMFdL
 joz0OD6kyyNWe3ftQsqavY1hjkfTBi7JcVBp9NBQfj4rRC4DAHtaVu0lYSP/T+nHGLcH
 XDR3FOygj7I8z/zdEk2iQf0fth0eA6HZZtzRxj1R0F2XA/kyXK70e77YTqUYmjVARUs9
 /jUmbDEFsTN781XuEQzHz4FKg4ulPFP21unkLYiRj7ChcpW6fQ5yjuyzE10MQ8aVjihI
 D1pw==
X-Gm-Message-State: AOAM532lUm1WqHJ7bWLjj8zrLpdt7AHIVzR21yL5GCKnPUG84CJQdV4P
 Y3l3PMMWfTEiD1hql25JkY0=
X-Google-Smtp-Source: ABdhPJzpnoc2OQxaCLNzOlLY2Q6PMGILiG41ZK3gGqRANQoSQNuIjjpR7zhzwOg/QpERIZ7XiCnJ5Q==
X-Received: by 2002:a05:600c:6021:b0:394:56be:18e with SMTP id
 az33-20020a05600c602100b0039456be018emr3207844wmb.86.1652251672631; 
 Tue, 10 May 2022 23:47:52 -0700 (PDT)
Received: from ?IPV6:2a0b:e7c0:0:107::70f? ([2a0b:e7c0:0:107::70f])
 by smtp.gmail.com with ESMTPSA id
 m36-20020a05600c3b2400b003942a244edbsm1446971wms.32.2022.05.10.23.47.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 May 2022 23:47:52 -0700 (PDT)
Message-ID: <48cfa0b3-0424-81bd-ac6a-d631184b71b7@kernel.org>
Date: Wed, 11 May 2022 08:47:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>,
 linux-arm-kernel@lists.infradead.org, soc@kernel.org,
 linux-serial@vger.kernel.org, sumit.garg@linaro.org
References: <20220511062113.2645747-1-hasegawa-hitomi@fujitsu.com>
 <20220511062113.2645747-2-hasegawa-hitomi@fujitsu.com>
From: Jiri Slaby <jirislaby@kernel.org>
In-Reply-To: <20220511062113.2645747-2-hasegawa-hitomi@fujitsu.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 11. 05. 22, 8:21,
 Hitomi Hasegawa wrote: > Enable diagnostic
 interrupts for the Fujitsu A64FX. > > Register the NMI/IRQ corresponding
 to the A64FX's device definition > dedicated to diagnostic inte [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.128.46 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [jirislaby[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.46 listed in wl.mailspike.net]
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and
 EnvelopeFrom freemail headers are different
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.7 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1nog8d-008Xw9-QN
X-Mailman-Approved-At: Fri, 20 May 2022 14:59:49 +0000
Subject: Re: [Kgdb-bugreport] [PATCH v4 1/1] soc: fujitsu: Add A64FX
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
Cc: daniel.thompson@linaro.org, arnd@arndb.de, gregkh@linuxfoundation.org,
 peterz@infradead.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org,
 jason.wessel@windriver.com, olof@lixom.net, will@kernel.org,
 kgdb-bugreport@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On 11. 05. 22, 8:21, Hitomi Hasegawa wrote:
> Enable diagnostic interrupts for the Fujitsu A64FX.
> 
> Register the NMI/IRQ corresponding to the A64FX's device definition
> dedicated to diagnostic interrupts, so that when this interrupt is
> sent using the BMC, it causes a panic. This can be used to obtain
> a kernel dump.
> 
> Signed-off-by: Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>

Hi,

I'm not sure why you cc linux-serial, but anyway, comments below :).

> --- /dev/null
> +++ b/drivers/soc/fujitsu/a64fx-diag.c
> @@ -0,0 +1,155 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * A64FX diag driver.
> + * Copyright (c) 2022 Fujitsu Ltd.
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/interrupt.h>
> +#include <linux/irq.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +
> +#define A64FX_DIAG_IRQ 1
> +#define BMC_DIAG_INTERRUPT_STATUS_OFFSET (0x0044)
> +#define BMC_DIAG_INTERRUPT_ENABLE_OFFSET (0x0040)
> +#define BMC_DIAG_INTERRUPT_MASK BIT(31)
> +
> +struct a64fx_diag_priv {
> +	int irq;
> +	void __iomem *mmsc_reg_base;
> +	bool has_nmi;

There are unnecessary holes in the struct. If you reorder it, you drop 
some alignment. Like: pointer, int, bool.

> +};
> +
> +static irqreturn_t a64fx_diag_handler_nmi(int irq, void *dev_id)
> +{
> +	nmi_panic(NULL, "a64fx_diag: interrupt received\n");
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static irqreturn_t a64fx_diag_handler_irq(int irq, void *dev_id)
> +{
> +	panic("a64fx_diag: interrupt received\n");
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static void a64fx_diag_interrupt_clear(struct a64fx_diag_priv *priv)
> +{
> +	u32 mmsc;
> +	void __iomem *diag_status_reg_addr;

I'm not sure what soc/ maintainers prefer, but inverted xmas tree would 
look/read better.

> +
> +	diag_status_reg_addr = priv->mmsc_reg_base + BMC_DIAG_INTERRUPT_STATUS_OFFSET;
> +	mmsc = readl(diag_status_reg_addr);
> +	if (mmsc & BMC_DIAG_INTERRUPT_MASK)
> +		writel(BMC_DIAG_INTERRUPT_MASK, diag_status_reg_addr);
> +}
> +
> +static void a64fx_diag_interrupt_enable(struct a64fx_diag_priv *priv)
> +{
> +	u32 mmsc;
> +	void __iomem *diag_enable_reg_addr;
> +
> +	diag_enable_reg_addr = priv->mmsc_reg_base + BMC_DIAG_INTERRUPT_ENABLE_OFFSET;
> +	mmsc = readl(diag_enable_reg_addr);
> +	if (!(mmsc & BMC_DIAG_INTERRUPT_MASK)) {
> +		mmsc |= BMC_DIAG_INTERRUPT_MASK;
> +		writel(mmsc, diag_enable_reg_addr);
> +	}
> +}
> +
> +static void a64fx_diag_interrupt_disable(struct a64fx_diag_priv *priv)
> +{
> +	u32 mmsc;
> +	void __iomem *diag_enable_reg_addr;
> +
> +	diag_enable_reg_addr = priv->mmsc_reg_base + BMC_DIAG_INTERRUPT_ENABLE_OFFSET;
> +	mmsc = readl(diag_enable_reg_addr);
> +	if (mmsc & BMC_DIAG_INTERRUPT_MASK) {
> +		mmsc &= ~BMC_DIAG_INTERRUPT_MASK;
> +		writel(mmsc, diag_enable_reg_addr);
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

Don't we prefer sizeof(*priv)?

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
> +	ret = request_nmi(priv->irq, &a64fx_diag_handler_nmi, irq_flags,
> +			"a64fx_diag_nmi", NULL);
> +	if (ret) {
> +		ret = request_irq(priv->irq, &a64fx_diag_handler_irq,
> +				irq_flags, "a64fx_diag_irq", NULL);
> +		if (ret) {
> +			dev_err(dev, "cannot register IRQ %d\n", ret);

No a64fx_diag_interrupt_disable()?

> +			return ret;
> +		}
> +		enable_irq(priv->irq);

Hmm...

> +		priv->has_nmi = false;

No need to set zeroed priv member to zero.

> +	} else {
> +		enable_nmi(priv->irq);

Provided the above, I don't immediatelly see, what's the purpose of 
IRQF_NO_AUTOEN then?

> +		priv->has_nmi = true;
> +	}
> +
> +	return 0;
> +}
> +
> +static int __exit a64fx_diag_remove(struct platform_device *pdev)

Is __exit appropriate here at all -- I doubt that.

> +{
> +	struct a64fx_diag_priv *priv = platform_get_drvdata(pdev);
> +
> +	a64fx_diag_interrupt_disable(priv);
> +	a64fx_diag_interrupt_clear(priv);
> +
> +	if (priv->has_nmi)
> +		free_nmi(priv->irq, NULL);
> +	else
> +		free_irq(priv->irq, NULL);
> +
> +	return 0;
> +}
> +
> +static const struct acpi_device_id a64fx_diag_acpi_match[] = {
> +	{ "FUJI2007", 0 },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(acpi, a64fx_diag_acpi_match);
> +
> +
> +static struct platform_driver a64fx_diag_driver = {
> +	.driver = {
> +		.name = "a64fx_diag_driver",
> +		.acpi_match_table = ACPI_PTR(a64fx_diag_acpi_match),
> +	},
> +	.probe = a64fx_diag_probe,
> +	.remove = a64fx_diag_remove,
> +};
> +
> +module_platform_driver(a64fx_diag_driver);
> +
> +MODULE_LICENSE("GPL v2");
> +MODULE_AUTHOR("Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>");
> +MODULE_DESCRIPTION("A64FX diag driver");


-- 
js
suse labs


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
