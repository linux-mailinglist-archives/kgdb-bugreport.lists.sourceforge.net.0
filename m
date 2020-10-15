Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6005B28E9AB
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 15 Oct 2020 03:16:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kSrsb-0000AM-4u
	for lists+kgdb-bugreport@lfdr.de; Thu, 15 Oct 2020 01:16:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <msys.mizuma@gmail.com>) id 1kSrsZ-0000AB-B9
 for kgdb-bugreport@lists.sourceforge.net; Thu, 15 Oct 2020 01:16:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tVdoKNi6CDA3oy1vcQG9KtgdbV05kDOzZC+L7q8Ac3k=; b=a3Tb7UPSZF5kToCERmsNIU1GpB
 W/kRRA9Gd8MbXKQ0yzRDB6n7/zPdqtqAwyeQvTmgaxkLAQDTUR88i1i+38NTn3LFRO0qYazaa0/mX
 ohC/ouVakrIoL4dz2K0SeuQZVWaDTWKGytdYLR0TTZxWpLHnm6adCK+fU9hfplp0uQPo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tVdoKNi6CDA3oy1vcQG9KtgdbV05kDOzZC+L7q8Ac3k=; b=T7xvU1XHcRHZn4lZDh1OBP00R+
 8aXj7eUCQPtiG8BoeK67lpp/ellJGYV2cUEbf3nUtS3dmwMpMSBAJKJOcynxCEMcills1jldoKfkK
 c7b+7w4rGahUo6OqP27HOLig13h4xwjVhqnwVZ/kp8mEYv1ZnSkYgLY+UxIEXvGM8mFc=;
Received: from mail-io1-f65.google.com ([209.85.166.65])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kSrsS-00AyTH-8u
 for kgdb-bugreport@lists.sourceforge.net; Thu, 15 Oct 2020 01:16:27 +0000
Received: by mail-io1-f65.google.com with SMTP id q9so2240524iow.6
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 14 Oct 2020 18:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=tVdoKNi6CDA3oy1vcQG9KtgdbV05kDOzZC+L7q8Ac3k=;
 b=IGDdXD8rRTcME1ZCmTTfJ4lQaP4iI1mFbqYpnWxCGvVGVaYgLhflPiiAS9MIFJ+rLN
 8u6s/43uMEnOXFaKOCsAQBfnKoYZpRxUxvRCECUmiSnOaGR0fDd04xHgevlJx3rtyKZp
 C+YGRVnuxcN/K4EfNaaxmbzvEO6dgwYDNcoiwphItBMXzvOZIC/FV4qlMZ7MdXqwg0m9
 2r7Gn1cd0ZiDSGqJ/PelTaaAngsrOYH5EVGs4MKtqBdpx/wqEA2URnzWgTavNZ/gTplw
 JlMpGhasb6wfHGAfvZofpSXwf92cHfFCmmTf350iMdFsz2OlczvyCtel4j34j+moNgok
 e32Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=tVdoKNi6CDA3oy1vcQG9KtgdbV05kDOzZC+L7q8Ac3k=;
 b=CY0WOMS7BbVeMw5r7eVWiivBeJZeSgqi6gV/kcgayuNJ+TrZ8DwUQmaxRuR6bXsySg
 6peWJhhqDDoYfZX3Yiaoo5ohZ179LnmRfdcT2AOxA7PLSWwRcdR1eW6Qkes3Z9gTB9Et
 VpLUL/IIgJbuQXmbhlYahNQIkEvIKfQyvg/nBUT7duCJlwjwlqVzrCZKQTBcX4JU1Izv
 5dqFrZA7lv2H4pD02KedzTPMn/RLyC+4YAsEr8+ijBagLPqNgakYLAy26S/8F9/Iaixd
 sf50eBFNGpT7lMdpB1RWgpnlaXvenz4e2P42ocQgsKm+L9OTnoEFS1Bt4386ERSmfNCt
 GJ2A==
X-Gm-Message-State: AOAM533bZ13eUq7finX9g4phJQoa64lQFFUfwUAevNq+5CBjHMCvWGf3
 3uGFL6yEdWhd5IoMO8nQ7w==
X-Google-Smtp-Source: ABdhPJyzjy0u4JM0XQEC75drvBuz4Tg9Dl1F4JxQlCjD8m3vu+7kP8DfjFUkkFR7mIXnXbn2t/v1vw==
X-Received: by 2002:a05:6638:1189:: with SMTP id
 f9mr1805122jas.10.1602724567593; 
 Wed, 14 Oct 2020 18:16:07 -0700 (PDT)
Received: from gabell
 (209-6-122-159.s2973.c3-0.arl-cbr1.sbo-arl.ma.cable.rcncustomer.com.
 [209.6.122.159])
 by smtp.gmail.com with ESMTPSA id r204sm1408693iod.25.2020.10.14.18.16.05
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 14 Oct 2020 18:16:06 -0700 (PDT)
Date: Wed, 14 Oct 2020 21:16:04 -0400
From: Masayoshi Mizuma <msys.mizuma@gmail.com>
To: Sumit Garg <sumit.garg@linaro.org>
Message-ID: <20201015011604.ixmx2e2cbn5zsu5j@gabell>
References: <1602673931-28782-1-git-send-email-sumit.garg@linaro.org>
 <1602673931-28782-3-git-send-email-sumit.garg@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1602673931-28782-3-git-send-email-sumit.garg@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.166.65 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (msys.mizuma[at]gmail.com)
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
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.65 listed in wl.mailspike.net]
X-Headers-End: 1kSrsS-00AyTH-8u
Subject: Re: [Kgdb-bugreport] [PATCH v5 2/5] irqchip/gic-v3: Enable support
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
Cc: mark.rutland@arm.com, daniel.thompson@linaro.org, ito-yuichi@fujitsu.com,
 jason@lakedaemon.net, maz@kernel.org, jason.wessel@windriver.com,
 linux-kernel@vger.kernel.org, julien.thierry.kdev@gmail.com,
 catalin.marinas@arm.com, kgdb-bugreport@lists.sourceforge.net,
 tglx@linutronix.de, will@kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Wed, Oct 14, 2020 at 04:42:08PM +0530, Sumit Garg wrote:
> Add support to handle SGIs as regular NMIs. As SGIs or IPIs defaults to a
> special flow handler: handle_percpu_devid_fasteoi_ipi(), so skip NMI
> handler update in case of SGIs.
> 
> Also, enable NMI support prior to gic_smp_init() as allocation of SGIs
> as IRQs/NMIs happen as part of this routine.
> 
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> ---
>  drivers/irqchip/irq-gic-v3.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
> index 16fecc0..5efc865 100644
> --- a/drivers/irqchip/irq-gic-v3.c
> +++ b/drivers/irqchip/irq-gic-v3.c
> @@ -477,6 +477,11 @@ static int gic_irq_nmi_setup(struct irq_data *d)
>  	if (WARN_ON(gic_irq(d) >= 8192))
>  		return -EINVAL;
>  
> +	if (get_intid_range(d) == SGI_RANGE) {
> +		gic_irq_set_prio(d, GICD_INT_NMI_PRI);
> +		return 0;
> +	}
> +
>  	/* desc lock should already be held */
>  	if (gic_irq_in_rdist(d)) {
>  		u32 idx = gic_get_ppi_index(d);
> @@ -514,6 +519,11 @@ static void gic_irq_nmi_teardown(struct irq_data *d)
>  	if (WARN_ON(gic_irq(d) >= 8192))
>  		return;
>  
> +	if (get_intid_range(d) == SGI_RANGE) {
> +		gic_irq_set_prio(d, GICD_INT_DEF_PRI);
> +		return;
> +	}
> +
>  	/* desc lock should already be held */
>  	if (gic_irq_in_rdist(d)) {
>  		u32 idx = gic_get_ppi_index(d);
> @@ -1708,6 +1718,7 @@ static int __init gic_init_bases(void __iomem *dist_base,
>  
>  	gic_dist_init();
>  	gic_cpu_init();
> +	gic_enable_nmi_support();
>  	gic_smp_init();
>  	gic_cpu_pm_init();
>  
> @@ -1719,8 +1730,6 @@ static int __init gic_init_bases(void __iomem *dist_base,
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
