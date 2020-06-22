Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6E7203BA7
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 22 Jun 2020 17:56:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jnOoQ-0001sC-Sw
	for lists+kgdb-bugreport@lfdr.de; Mon, 22 Jun 2020 15:56:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1jnOoQ-0001s3-8Y
 for kgdb-bugreport@lists.sourceforge.net; Mon, 22 Jun 2020 15:56:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kSMspTFGxKNsReoFaFuGJU3LuXpebLrE7bbL0ZZt+X8=; b=d+x+5/DH2YNH5+SnIOQjvJOEMH
 gAY/lHOQS9pF4NIxWeiEyDERlL3OD4Abq0I9SNbu+VynEpAIqXMZ2v+4MBrucCvgopsPGWOE2HZs5
 k1T/S7la3T7Dc306xuOaTPZtSTbR/XSB3xndfTogfKfUrKXzyoNkiV3V2+acO8GsJmcA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kSMspTFGxKNsReoFaFuGJU3LuXpebLrE7bbL0ZZt+X8=; b=HeNbcgt52gO2WtnDikZvJjyYEy
 t3KCaIPaprDzCZQXn47Uen6PBUwJYjWnFK4R3vd8XECQgFOU//v2P3kNeBFyK/+Rrq4OV11Y4rjKD
 Nfv41IpFc/wEw5tA00K0/RKCwwHW4uhVyX65oXtEU0sp7hXepVNsKVaFK1lAC/QY8RLw=;
Received: from mail-wr1-f67.google.com ([209.85.221.67])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jnOoL-00C4hd-RV
 for kgdb-bugreport@lists.sourceforge.net; Mon, 22 Jun 2020 15:56:46 +0000
Received: by mail-wr1-f67.google.com with SMTP id l11so17245527wru.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 22 Jun 2020 08:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=kSMspTFGxKNsReoFaFuGJU3LuXpebLrE7bbL0ZZt+X8=;
 b=GXv2ZNEabhbhSf7vXvuVC7lyGiiOvUukOmdBQvekLZ+qdVz/B7mzEhE04wmtCu7H94
 qIYOIUGV8F0dtRgrSLsr5rKqVlXaYQeBBZrf9wZ9PJN6A9Nc0s2NntSKKdDrCaAXsiPO
 gVRzXm592POsuRnrI3XFZcTrUI1TNYtkaMy8bYiGeIXhsa1o9OU7zUjkuC8AWYv5l6UL
 2u2zSVTcVV8UJaFoj1wyD6ulvLAYuXpFag7UrU8M8CwMng4DJf9jLc2eIqyYQHcrX4ki
 7U28cjIKDC29qqaXZxSSwbAS4nbEHpM0OBtChPCL6D+4OID6G3V3HXXXg7paO8R3kaoo
 ZEjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kSMspTFGxKNsReoFaFuGJU3LuXpebLrE7bbL0ZZt+X8=;
 b=DSnf/v5LSpKL0R0oAgwo4erttv96H2ZTxRYMJCrW5+vRyaVOGmpqyD+C8f9qlfBpM+
 x4FdMrkHj9gDr71sIiuwS07MDzXdq2xTijBerNv2C5+YP0cUYGQ26+qif1WKADGYVebG
 dkPL3UTVCQi1Asjpa873x1xIl89QTA9X4jZvAZ5lzeQ6M+QqGiQUhE9n+IDuBE1gUyiI
 5JGU2fT1AzHD/8vovPZajQzY1HUN8rt34nGVMHzuTzLah2aoyk3D2US3HJ+i36lxIwkm
 s507c3M7rUhs3fQ5lDrqn230/ISauR7U8AS46J7p3WYHcN/pvK6oUc9chsfYGLSz+8Sh
 ZfFA==
X-Gm-Message-State: AOAM531+KmZ6Zk0nKSggjhWg2QmG9ZE/Aquim+j2IZSP77vd+7OrdCF9
 0ekbsYZOHNU+kvh01DARQPAz2A==
X-Google-Smtp-Source: ABdhPJxxJgkt35ckzF3UHxiybAvxxwtheduC5J/trxrNa8yKhlixDpRotx+E7cZGBlOIIJi0HzSYDA==
X-Received: by 2002:adf:f34e:: with SMTP id e14mr19735827wrp.299.1592841387421; 
 Mon, 22 Jun 2020 08:56:27 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id n8sm15375134wrj.44.2020.06.22.08.56.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jun 2020 08:56:26 -0700 (PDT)
Date: Mon, 22 Jun 2020 16:56:24 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Sumit Garg <sumit.garg@linaro.org>
Message-ID: <20200622155624.he2vs2r3e5yzf3sl@holly.lan>
References: <1592835984-28613-1-git-send-email-sumit.garg@linaro.org>
 <1592835984-28613-3-git-send-email-sumit.garg@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1592835984-28613-3-git-send-email-sumit.garg@linaro.org>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.67 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.67 listed in wl.mailspike.net]
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
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jnOoL-00C4hd-RV
Subject: Re: [Kgdb-bugreport] [PATCH 2/7] tty: serial: Add poll_get_irq() to
 the polling interface
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

On Mon, Jun 22, 2020 at 07:56:19PM +0530, Sumit Garg wrote:
> From: Daniel Thompson <daniel.thompson@linaro.org>

Sumit, to some extent this mail is me yelling at myself two years ago
although, in my defence, at the time I choose not to post it because I
knew it wasn't right.

I'm a bit concerned to see the TODO: comment critiquing this interface
being removed (from patch 3) without this patch being changed to
address that comment.


> Add new API: poll_get_irq() to the polling interface in order for user
> of polling interface to retrieve allocated IRQ corresponding to
> underlying serial device.
> 
> Although, serial interface still works in polling mode but interrupt
> associated with serial device can be leveraged for special purposes like
> debugger(kgdb) entry.
> 
> Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> ---
>  drivers/tty/serial/serial_core.c | 18 ++++++++++++++++++
>  include/linux/serial_core.h      |  1 +
>  include/linux/tty_driver.h       |  1 +
>  3 files changed, 20 insertions(+)
> 
> diff --git a/drivers/tty/serial/serial_core.c b/drivers/tty/serial/serial_core.c
> index 66a5e2f..1bb033c 100644
> --- a/drivers/tty/serial/serial_core.c
> +++ b/drivers/tty/serial/serial_core.c
> @@ -2470,6 +2470,23 @@ static void uart_poll_put_char(struct tty_driver *driver, int line, char ch)
>  	port->ops->poll_put_char(port, ch);
>  	uart_port_deref(port);
>  }
> +
> +static int uart_poll_get_irq(struct tty_driver *driver, int line)
> +{
> +	struct uart_driver *drv = driver->driver_state;
> +	struct uart_state *state = drv->state + line;
> +	struct uart_port *port;
> +	int ret = -ENODEV;
> +
> +	port = uart_port_ref(state);
> +	if (port && port->ops->poll_get_irq) {
> +		ret = port->ops->poll_get_irq(port);
> +		uart_port_deref(port);
> +	}
> +
> +	return ret;
> +}
> +
>  #endif
>  
>  static const struct tty_operations uart_ops = {
> @@ -2505,6 +2522,7 @@ static const struct tty_operations uart_ops = {
>  	.poll_init	= uart_poll_init,
>  	.poll_get_char	= uart_poll_get_char,
>  	.poll_put_char	= uart_poll_put_char,
> +	.poll_get_irq	= uart_poll_get_irq,

The TODO comments claimed this API was bogus because it doesn't permit
a free and that can cause interoperation problems with the real serial
driver. I'll cover some of that in a reply to patch 3 but for now.

Anyhow, for this patch, what are the expected semantics for
uart_poll_get_irq().

In particular how do they ensure correct interlocking with the real
serial driver underlying it (if kgdb_nmi is active on a serial port
then the underlying driver better not be active at the same time).


Daniel.


>  #endif
>  };
>  
> diff --git a/include/linux/serial_core.h b/include/linux/serial_core.h
> index 92f5eba..8b132e6 100644
> --- a/include/linux/serial_core.h
> +++ b/include/linux/serial_core.h
> @@ -78,6 +78,7 @@ struct uart_ops {
>  	int		(*poll_init)(struct uart_port *);
>  	void		(*poll_put_char)(struct uart_port *, unsigned char);
>  	int		(*poll_get_char)(struct uart_port *);
> +	int		(*poll_get_irq)(struct uart_port *);
>  #endif
>  };
>  
> diff --git a/include/linux/tty_driver.h b/include/linux/tty_driver.h
> index 3584462..d6da5c5 100644
> --- a/include/linux/tty_driver.h
> +++ b/include/linux/tty_driver.h
> @@ -295,6 +295,7 @@ struct tty_operations {
>  	int (*poll_init)(struct tty_driver *driver, int line, char *options);
>  	int (*poll_get_char)(struct tty_driver *driver, int line);
>  	void (*poll_put_char)(struct tty_driver *driver, int line, char ch);
> +	int (*poll_get_irq)(struct tty_driver *driver, int line);
>  #endif
>  	int (*proc_show)(struct seq_file *, void *);
>  } __randomize_layout;
> -- 
> 2.7.4
> 


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
