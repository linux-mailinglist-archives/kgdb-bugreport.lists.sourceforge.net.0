Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB502A2F7E
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  2 Nov 2020 17:17:28 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kZcWN-0005J2-J1
	for lists+kgdb-bugreport@lfdr.de; Mon, 02 Nov 2020 16:17:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <msys.mizuma@gmail.com>) id 1kZcWM-0005It-7l
 for kgdb-bugreport@lists.sourceforge.net; Mon, 02 Nov 2020 16:17:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YeEey2vkBTNmp8sl+JT7BFlPeTSJgF0pPyztQBHkjgU=; b=aHhVz0e8LievxfYxHRzii6Uhw4
 wIKYUfWjj45Ia9Iv+cmUPYYNwL9oyPvTImMnJ1siAgM3Y5+zOWOZ0CBZS0pzJFxhlNAEqbviJp1Ps
 bgbaYgvhSw59G9NaLJPKtapbmNh4f9t/p/ANIzGWaFaHSnJCDwC3uYahVOYmLs2aRHk0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YeEey2vkBTNmp8sl+JT7BFlPeTSJgF0pPyztQBHkjgU=; b=ENXsBqu+UxYp3ox/rIfoIQRFbF
 U5/TSwNvngHw+czF20pzAJT6OSphKne33iZW1MeRH1hKk4AZ0V98GaU5rgpxFsWWEIW4YO5CWQp4x
 HrzoxzKk5YehlpGxQdLZpVzhE9K0YnRZePrZnRs32wiHOGcdVGywsoXqZDEdk0w2H+8Q=;
Received: from mail-qv1-f65.google.com ([209.85.219.65])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kZcWB-00GUoL-UD
 for kgdb-bugreport@lists.sourceforge.net; Mon, 02 Nov 2020 16:17:26 +0000
Received: by mail-qv1-f65.google.com with SMTP id t20so6344293qvv.8
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 02 Nov 2020 08:17:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=YeEey2vkBTNmp8sl+JT7BFlPeTSJgF0pPyztQBHkjgU=;
 b=cADYsIgm7vmYEaWL0V7aONlTnr7fawBMY5eDc+08xjg9CnKskh8Zhjtzeip4GGgEy1
 0ofmzTPtjWSI4oovnj3xQiqaEFd211XER6siB2eOlPi9M38d6oe/6YgdItmqrnL1T5QA
 N3k86hXDOcCkb8YquvPE0ocSoPysRQqqE/Ol9zjr9MZXjDwT2dlYz40YXmRulKGYzdcz
 Dd824lDFfi3Fz3Q2foAvvGT7m414yjQScJL9xFZ0eVgbKBg3S38CaosbSj1z2RcX2bDY
 JI814zdEdX/zDzwQ2KOo66SPdD5pFzFslaqkdzbbdBpxUP2wpfBseoHdygzJffY4SjsJ
 y6ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YeEey2vkBTNmp8sl+JT7BFlPeTSJgF0pPyztQBHkjgU=;
 b=uKlnJ2I5HOfxvdNfzIdjPLtT0bKtCa6ZwlV5zTIxy83862HUXXz+DoSYubLvujewD2
 GJWCSgOL76udwW/GFBtZlPWaG0eTkiyBp3iA47ax9xhCKQEXe26bmc0q/H9A260ah9/7
 XmhMN99mW3qL/vUdWJ+otyzXMpWepWpmlMYQvB4vHVAVQNdI2h/z2DKcDFBaKtfCYo+1
 fjy+L/xxa5oUoHIn2QoqaRem7/AeqxJzrbWWl2QJxv7vUGx/M0tCGQkoNAvz7YPCfVfv
 iTmWXBR2j21pNKEu6yp/mhUf9hXC+uqRwoHAYZyEbHuLCroPb268+adfSUtii9EK0CPN
 N4FQ==
X-Gm-Message-State: AOAM5338hNBr3SFpAK+R5nhr5RGBmew5ZSXvSF78sJmN42oMwXvQl/By
 ekMA2TqI2+n15WbHIS3BrQ==
X-Google-Smtp-Source: ABdhPJz4HEYQmREMM2lRBxTpTBosLijiIh6hDzV+KakGyEepCDW7g7H/fyol1LOnYxiWseehdxuUBw==
X-Received: by 2002:a0c:b207:: with SMTP id x7mr22781268qvd.39.1604333829522; 
 Mon, 02 Nov 2020 08:17:09 -0800 (PST)
Received: from gabell
 (209-6-122-159.s2973.c3-0.arl-cbr1.sbo-arl.ma.cable.rcncustomer.com.
 [209.6.122.159])
 by smtp.gmail.com with ESMTPSA id i18sm8187020qtv.38.2020.11.02.08.17.07
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 02 Nov 2020 08:17:08 -0800 (PST)
Date: Mon, 2 Nov 2020 11:17:06 -0500
From: Masayoshi Mizuma <msys.mizuma@gmail.com>
To: Sumit Garg <sumit.garg@linaro.org>
Message-ID: <20201102161706.xfqdsro7q7k65ybb@gabell>
References: <1604317487-14543-1-git-send-email-sumit.garg@linaro.org>
 <1604317487-14543-3-git-send-email-sumit.garg@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1604317487-14543-3-git-send-email-sumit.garg@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.219.65 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (msys.mizuma[at]gmail.com)
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.65 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kZcWB-00GUoL-UD
Subject: Re: [Kgdb-bugreport] [PATCH v7 2/7] irqchip/gic-v3: Enable support
 for SGIs to act as NMIs
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
 maz@kernel.org, x86@kernel.org, linux@armlinux.org.uk,
 jason.wessel@windriver.com, mingo@redhat.com, bp@alien8.de, mpe@ellerman.id.au,
 catalin.marinas@arm.com, kgdb-bugreport@lists.sourceforge.net,
 tglx@linutronix.de, julien.thierry.kdev@gmail.com, will@kernel.org,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Mon, Nov 02, 2020 at 05:14:42PM +0530, Sumit Garg wrote:
> Add support to handle SGIs as pseudo NMIs. As SGIs or IPIs default to a
> special flow handler: handle_percpu_devid_fasteoi_ipi(), so skip NMI
> handler update in case of SGIs.
> 
> Also, enable NMI support prior to gic_smp_init() as allocation of SGIs
> as IRQs/NMIs happen as part of this routine.
> 
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> ---
>  drivers/irqchip/irq-gic-v3.c | 29 +++++++++++++++++++++--------
>  1 file changed, 21 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
> index 16fecc0..7010ae2 100644
> --- a/drivers/irqchip/irq-gic-v3.c
> +++ b/drivers/irqchip/irq-gic-v3.c
> @@ -461,6 +461,7 @@ static u32 gic_get_ppi_index(struct irq_data *d)
>  static int gic_irq_nmi_setup(struct irq_data *d)
>  {
>  	struct irq_desc *desc = irq_to_desc(d->irq);
> +	u32 idx;
>  
>  	if (!gic_supports_nmi())
>  		return -EINVAL;
> @@ -478,16 +479,22 @@ static int gic_irq_nmi_setup(struct irq_data *d)
>  		return -EINVAL;
>  
>  	/* desc lock should already be held */
> -	if (gic_irq_in_rdist(d)) {
> -		u32 idx = gic_get_ppi_index(d);
> +	switch (get_intid_range(d)) {
> +	case SGI_RANGE:
> +		break;
> +	case PPI_RANGE:
> +	case EPPI_RANGE:
> +		idx = gic_get_ppi_index(d);
>  
>  		/* Setting up PPI as NMI, only switch handler for first NMI */
>  		if (!refcount_inc_not_zero(&ppi_nmi_refs[idx])) {
>  			refcount_set(&ppi_nmi_refs[idx], 1);
>  			desc->handle_irq = handle_percpu_devid_fasteoi_nmi;
>  		}
> -	} else {
> +		break;
> +	default:
>  		desc->handle_irq = handle_fasteoi_nmi;
> +		break;
>  	}
>  
>  	gic_irq_set_prio(d, GICD_INT_NMI_PRI);
> @@ -498,6 +505,7 @@ static int gic_irq_nmi_setup(struct irq_data *d)
>  static void gic_irq_nmi_teardown(struct irq_data *d)
>  {
>  	struct irq_desc *desc = irq_to_desc(d->irq);
> +	u32 idx;
>  
>  	if (WARN_ON(!gic_supports_nmi()))
>  		return;
> @@ -515,14 +523,20 @@ static void gic_irq_nmi_teardown(struct irq_data *d)
>  		return;
>  
>  	/* desc lock should already be held */
> -	if (gic_irq_in_rdist(d)) {
> -		u32 idx = gic_get_ppi_index(d);
> +	switch (get_intid_range(d)) {
> +	case SGI_RANGE:
> +		break;
> +	case PPI_RANGE:
> +	case EPPI_RANGE:
> +		idx = gic_get_ppi_index(d);
>  
>  		/* Tearing down NMI, only switch handler for last NMI */
>  		if (refcount_dec_and_test(&ppi_nmi_refs[idx]))
>  			desc->handle_irq = handle_percpu_devid_irq;
> -	} else {
> +		break;
> +	default:
>  		desc->handle_irq = handle_fasteoi_irq;
> +		break;
>  	}
>  
>  	gic_irq_set_prio(d, GICD_INT_DEF_PRI);
> @@ -1708,6 +1722,7 @@ static int __init gic_init_bases(void __iomem *dist_base,
>  
>  	gic_dist_init();
>  	gic_cpu_init();
> +	gic_enable_nmi_support();
>  	gic_smp_init();
>  	gic_cpu_pm_init();
>  
> @@ -1719,8 +1734,6 @@ static int __init gic_init_bases(void __iomem *dist_base,
>  			gicv2m_init(handle, gic_data.domain);
>  	}
>  
> -	gic_enable_nmi_support();
> -
>  	return 0;
>  
>  out_free:
> -- 

Looks good to me. Please feel free to add:

	Reviewed-by: Masayoshi Mizuma <m.mizuma@jp.fujitsu.com>

Thanks!
Masa


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
