Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B43203C08
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 22 Jun 2020 18:03:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jnOug-0000bM-KT
	for lists+kgdb-bugreport@lfdr.de; Mon, 22 Jun 2020 16:03:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1jnOuf-0000bF-J4
 for kgdb-bugreport@lists.sourceforge.net; Mon, 22 Jun 2020 16:03:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=G7tyEQo0BCpuFpa+wLLnML4BSViFafq4hYNcPsQY6yA=; b=cd531a+hdcjHYe3CbKrm51AhcQ
 r3fp5M+mwRJQ05PuwLQIcSPrEII5279i42v3dXuSFiS0ogt5/w9OaSylBZFUAVjWS2QPkkFhhDewD
 JxaBdYaNyHmuBKpNlWg4ZrjKmD29LhXGlBf0jyBkwu2EN5LnPpHvKYExqoopbGKYyQrA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=G7tyEQo0BCpuFpa+wLLnML4BSViFafq4hYNcPsQY6yA=; b=eAxbBT3ba+bPVJTiDdz+oh9b3H
 3drpsVYU7MsuUucv8r2EKaF95wFh/iGTveotaEel+ck5QQgoPdP8kZAq2/0l5Qi0YP3Z9depnFi+e
 0wz5zxeoMOH+HjolMuz/Bfc+IYHQZfZLSBPn9Fx0EKbCrSmgNt0JI9N/XbN4JgTfrpU8=;
Received: from mail-wm1-f66.google.com ([209.85.128.66])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jnOub-00F5BL-4j
 for kgdb-bugreport@lists.sourceforge.net; Mon, 22 Jun 2020 16:03:13 +0000
Received: by mail-wm1-f66.google.com with SMTP id y20so104245wmi.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 22 Jun 2020 09:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=G7tyEQo0BCpuFpa+wLLnML4BSViFafq4hYNcPsQY6yA=;
 b=OFzgfBlwCkrOzvIyVR98+1/FXds75qvrmXjxqkeiZis2MHuM8t8xekOzHXDkzHuUqC
 /Um6dZ6t4Srg/Fp14boWWHax79dKiFmIXrhDSdg8YDHvC8v2X46ysLHrIqLc49O3yk9v
 g4GxaTx1Hr78vxDccYzfFtECXgXqX1pOyPLoVzuHjWHax5i8FNFSYgOjRmkBoSzvoPVx
 XED1CZ5vMKFHce07Ux4WKGnUSF5k2sMmuddM43Ab1B4iGGnPLHMWo4w5jJUdbh43V0nD
 vSTgBCy/aJDKy9zjT6fEMZ1n9SGFXHZd5sC9LdGsI7hzu2crXDasuj1vY44cIQm7vTNE
 sCmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=G7tyEQo0BCpuFpa+wLLnML4BSViFafq4hYNcPsQY6yA=;
 b=LkVEdQQxr7ymRpy1X61XZkwhy6oDUWwVUxSONMANzc6F78YY79t8TPcXCpVgNO+w6B
 1KhGK2xXzx/GqwUF7RMDKSp+Gn1TR6k8U78M0vw1u8fJfeQiYvMKUsSQZr1Gy8aWm6/7
 jOytYv4t2NZFrOOcmOtv0O/SS/Ne2zdclh8SpLLdtfkLWpZ0FOEtpo6d+Dno/4twCfwZ
 CGjGv82lDWNdXAGetdxDFNQyxvWMPrBIxw2G1csu0Lxod7mFHPymUiyp5j0OME0QlRtM
 2ITNas6tvY7pMfMLxkNDyaTg+ti+ThaDueghgryF4BzZBZIypuYfbBEH4G/MOvBTa4ew
 9yhg==
X-Gm-Message-State: AOAM531KPlJTY8IS/5XEUhyZ7jP/lKo2uPeMj7RPhzwl1cch68YSaxNH
 62gtfCbK/PxWn1whiVDhg7UpxA==
X-Google-Smtp-Source: ABdhPJwTHUBPzo//TrGs0VsDrKoOp6hfyS3KNMezVrR1B8EvnSENYTaLkUxTvt8cK17P23kZv45cqA==
X-Received: by 2002:a05:600c:2201:: with SMTP id
 z1mr18818319wml.70.1592841782682; 
 Mon, 22 Jun 2020 09:03:02 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id j18sm18502577wrn.59.2020.06.22.09.03.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jun 2020 09:03:02 -0700 (PDT)
Date: Mon, 22 Jun 2020 17:03:00 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Sumit Garg <sumit.garg@linaro.org>
Message-ID: <20200622160300.avgfhnfkpqzqqtsr@holly.lan>
References: <1592835984-28613-1-git-send-email-sumit.garg@linaro.org>
 <1592835984-28613-4-git-send-email-sumit.garg@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1592835984-28613-4-git-send-email-sumit.garg@linaro.org>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.66 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.66 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jnOub-00F5BL-4j
Subject: Re: [Kgdb-bugreport] [PATCH 3/7] kgdb: Add request_nmi() to the io
 ops table for kgdboc
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
Cc: gregkh@linuxfoundation.org, kgdb-bugreport@lists.sourceforge.net,
 jason.wessel@windriver.com, linux@armlinux.org.uk,
 linux-serial@vger.kernel.org, jslaby@suse.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Mon, Jun 22, 2020 at 07:56:20PM +0530, Sumit Garg wrote:
> From: Daniel Thompson <daniel.thompson@linaro.org>
> 
> Add request_nmi() callback to install a non-maskable interrupt handler
> corresponding to IRQ retrieved from polling interface. If NMI handler
> installation fails due to missing support from underlying irqchip driver
> then fallback to install it as normal interrupt handler.
> 
> Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
> Co-developed-by: Sumit Garg <sumit.garg@linaro.org>
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> ---
>  drivers/tty/serial/kgdboc.c | 35 +++++++++++++++++++++++++++++++++++
>  include/linux/kgdb.h        |  7 +++++++
>  2 files changed, 42 insertions(+)
> 
> diff --git a/drivers/tty/serial/kgdboc.c b/drivers/tty/serial/kgdboc.c
> index 84ffede..263afae 100644
> --- a/drivers/tty/serial/kgdboc.c
> +++ b/drivers/tty/serial/kgdboc.c
> @@ -19,6 +19,9 @@
>  #include <linux/console.h>
>  #include <linux/vt_kern.h>
>  #include <linux/input.h>
> +#include <linux/interrupt.h>
> +#include <linux/irq.h>
> +#include <linux/irqdesc.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
>  #include <linux/serial_core.h>
> @@ -390,12 +393,44 @@ static void kgdboc_post_exp_handler(void)
>  	kgdboc_restore_input();
>  }
>  
> +static int kgdb_tty_irq;
> +
> +static int kgdboc_request_nmi(irq_handler_t fn, void *dev_id)
> +{
> +	int irq, res;
> +
> +	/* Better to avoid double allocation in the tty driver! */
> +	if (kgdb_tty_irq)
> +		return 0;
> +
> +	if (!kgdb_tty_driver->ops->poll_get_irq)
> +		return -ENODEV;
> +
> +	irq =
> +	    kgdb_tty_driver->ops->poll_get_irq(kgdb_tty_driver, kgdb_tty_line);
> +	if (irq <= 0)
> +		return irq ? irq : -ENODEV;
> +
> +	irq_set_status_flags(irq, IRQ_NOAUTOEN);
> +	res = request_nmi(irq, fn, IRQF_PERCPU, "kgdboc", dev_id);

Why do we need IRQF_PERCPU here. A UART interrupt is not normally
per-cpu?


> +	if (res) {
> +		res = request_irq(irq, fn, IRQF_SHARED, "kgdboc", dev_id);

IRQF_SHARED?

Currrently there is nothing that prevents concurrent activation of
ttyNMI0 and the underlying serial driver. Using IRQF_SHARED means it
becomes possible for both drivers to try to service the same interrupt.
That risks some rather "interesting" problems.


Daniel.


> +		WARN_ON(res);
> +	}
> +
> +	enable_irq(irq);
> +
> +	kgdb_tty_irq = irq;
> +	return 0;
> +}
> +
>  static struct kgdb_io kgdboc_io_ops = {
>  	.name			= "kgdboc",
>  	.read_char		= kgdboc_get_char,
>  	.write_char		= kgdboc_put_char,
>  	.pre_exception		= kgdboc_pre_exp_handler,
>  	.post_exception		= kgdboc_post_exp_handler,
> +	.request_nmi		= kgdboc_request_nmi,
>  };
>  
>  #if IS_BUILTIN(CONFIG_KGDB_SERIAL_CONSOLE)
> diff --git a/include/linux/kgdb.h b/include/linux/kgdb.h
> index 529116b..b32b044 100644
> --- a/include/linux/kgdb.h
> +++ b/include/linux/kgdb.h
> @@ -16,6 +16,7 @@
>  #include <linux/linkage.h>
>  #include <linux/init.h>
>  #include <linux/atomic.h>
> +#include <linux/interrupt.h>
>  #ifdef CONFIG_HAVE_ARCH_KGDB
>  #include <asm/kgdb.h>
>  #endif
> @@ -276,6 +277,10 @@ struct kgdb_arch {
>   * the I/O driver.
>   * @post_exception: Pointer to a function that will do any cleanup work
>   * for the I/O driver.
> + * @request_nmi: Pointer to a function that can install an non-maskable
> + * interrupt handler that will be called when a character is pending and that
> + * can be cleared by calling @read_char until it returns NO_POLL_CHAR. If NMI
> + * installation fails then fallback to install normal interrupt handler.
>   * @cons: valid if the I/O device is a console; else NULL.
>   */
>  struct kgdb_io {
> @@ -287,6 +292,8 @@ struct kgdb_io {
>  	void			(*deinit) (void);
>  	void			(*pre_exception) (void);
>  	void			(*post_exception) (void);
> +	int			(*request_nmi)(irq_handler_t nmi_handler,
> +					       void *dev_id);
>  	struct console		*cons;
>  };
>  
> -- 
> 2.7.4
> 


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
