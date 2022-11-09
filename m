Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D888162263F
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  9 Nov 2022 10:06:52 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1osh2p-0000uL-K0
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 09 Nov 2022 09:06:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daniel.thompson@linaro.org>) id 1osh2k-0000uA-OK
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 09 Nov 2022 09:06:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/Pjmzpa2+Wkg5tUF7TzZe/ozyOO+Z8mEPUUrHJ0Z2v8=; b=JL5/F4j6tgWkHXI4xdKWaxv3Nm
 uHR/2DFwIwwh7YA76PRSwcGYRdIv7N4K4mWdnVaz+nNBr5b1iK1dbeQJOa8pRA6Rma7uVdpfUjuxs
 txp2crsUwEYsI8/XZCflv6gaVBcImfXc/Jycs9MrrD7bGTcNk/WcRS1sbM94TNt8vrIw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/Pjmzpa2+Wkg5tUF7TzZe/ozyOO+Z8mEPUUrHJ0Z2v8=; b=Z4WQHXMprjqhGp1ZAUcY3UtsQb
 ieYdavD7ZRXWjfSiPTmwfz0zbQ68pfHxTspiIuMi/WDXYRSiNIcUhjUFGUzCNScQmTi8Pt/u46qYi
 dXsflr8qRh/isaYJeO8Lee+HdDmiw2NFFCKMAJZi11AOocQb+nDMhNf/rfoQ4SFyBlbs=;
Received: from mail-wm1-f43.google.com ([209.85.128.43])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1osh2e-0000lr-Id for kgdb-bugreport@lists.sourceforge.net;
 Wed, 09 Nov 2022 09:06:44 +0000
Received: by mail-wm1-f43.google.com with SMTP id
 a11-20020a05600c2d4b00b003cf6f5fd9f1so797265wmg.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 09 Nov 2022 01:06:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=/Pjmzpa2+Wkg5tUF7TzZe/ozyOO+Z8mEPUUrHJ0Z2v8=;
 b=O9hvm8JDUV9x2jKaGrEXqSJrzjVf63iU3NV3UY8vAwFC4YiP216OcnELhIuKmLq7wC
 awmdUhsQEPpaYXuOXLYXoaFBd7dOPZh1emxki5EOxdgw6wbxA2IRbDz2q0yTY/H/USu2
 xsr9obCAncgFnizU6BGbj8JMEqyHI4k51ZryNwsLYqAqj9aescXWrLYXlMiOfGJ323CB
 goAytNR+IpwmHc+oedvkrs/IQOx7l16vZ4RFE/bBwI8zOlIeNADNL7gf+sEf96Ouhueq
 dUW58nhyszvjqfdBHSKJs8D6lNyNWLjUTpkw1XC3mQ6BhRab7zIw+ZrPp0sl9+hRGj2R
 og9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/Pjmzpa2+Wkg5tUF7TzZe/ozyOO+Z8mEPUUrHJ0Z2v8=;
 b=zWt0SEnDe41i2WX2/p203UgjHHAZwc8fglCbYrb/tQEQdVfxaftfQokYQyfSzP093V
 3LOjkJzTQ1kwqb26ZhcQOj2ea0fN+yQABeEy8u6gq/7TKfyQAoHGdlfUM+ooEFAFz24t
 68iDsvQzZjzBSQTjrk3q31K+w4AqlUTZoRaADOPFjjoDHSxcfpnr53nuEr3pni86aCiR
 +ePON7Fc5CnH/+N90jIDFUrw6hoTjXei6TCuxYDdJ8D5FI/z2UgbVy7vlAENZ8RV/1iL
 k51/Wiudec8X5Th4NXA47343Xu274xOonJIV+eB1cHZBx37oOsxi2jotd2+l2kUFZGA6
 6VwA==
X-Gm-Message-State: ACrzQf0YGaFJkG2AXsMq6Y7EUe3AzXdPN41lHC/+S7BhQXCpvHt0rmLh
 73IS5hbCGl/6aUi2cWFZ1y5N3Q==
X-Google-Smtp-Source: AMsMyM49i60Ob39TBkwfhUEZqRP9HkqUXUcmGafKbG87L17B6OxTNZ5yXqhPDGLQA8aICC+gY8eeHQ==
X-Received: by 2002:a05:600c:54ca:b0:3cf:8e5d:7146 with SMTP id
 iw10-20020a05600c54ca00b003cf8e5d7146mr22196642wmb.191.1667984794183; 
 Wed, 09 Nov 2022 01:06:34 -0800 (PST)
Received: from ash.lan ([167.98.0.196]) by smtp.gmail.com with ESMTPSA id
 bu12-20020a056000078c00b0023655e51c33sm13114552wrb.4.2022.11.09.01.06.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Nov 2022 01:06:33 -0800 (PST)
Date: Wed, 9 Nov 2022 09:06:31 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: John Ogness <john.ogness@linutronix.de>
Message-ID: <20221109090631.wbtar2ho45x5yanl@ash.lan>
References: <20221107141638.3790965-1-john.ogness@linutronix.de>
 <20221107141638.3790965-37-john.ogness@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221107141638.3790965-37-john.ogness@linutronix.de>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Nov 07, 2022 at 03:22:34PM +0106, John Ogness wrote:
 > configure_kgdboc() uses the console_lock for console list iteration. Use
 > the console_list_lock instead because list synchronization res [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.43 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.128.43 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1osh2e-0000lr-Id
Subject: Re: [Kgdb-bugreport] [PATCH printk v3 36/40] tty: serial: kgdboc:
 use console_list_lock for list traversal
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
Cc: Petr Mladek <pmladek@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, linux-serial@vger.kernel.org,
 Jason Wessel <jason.wessel@windriver.com>,
 kgdb-bugreport@lists.sourceforge.net, Thomas Gleixner <tglx@linutronix.de>,
 Jiri Slaby <jirislaby@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Mon, Nov 07, 2022 at 03:22:34PM +0106, John Ogness wrote:
> configure_kgdboc() uses the console_lock for console list iteration. Use
> the console_list_lock instead because list synchronization responsibility
> will be removed from the console_lock in a later change.
>
> The SRCU iterator could have been used here, but a later change will
> relocate the locking of the console_list_lock to also provide
> synchronization against register_console().
>
> Note, the console_lock is still needed to serialize the device()
> callback with other console operations.
>
> Signed-off-by: John Ogness <john.ogness@linutronix.de>
> ---
>  drivers/tty/serial/kgdboc.c | 22 ++++++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/tty/serial/kgdboc.c b/drivers/tty/serial/kgdboc.c
> index 5be381003e58..82b4b4d67823 100644
> --- a/drivers/tty/serial/kgdboc.c
> +++ b/drivers/tty/serial/kgdboc.c
> @@ -451,6 +463,7 @@ static void kgdboc_earlycon_pre_exp_handler(void)
>  {
>  	struct console *con;
>  	static bool already_warned;
> +	int cookie;
>
>  	if (already_warned)
>  		return;
> @@ -463,9 +476,14 @@ static void kgdboc_earlycon_pre_exp_handler(void)
>  	 * serial drivers might be OK with this, print a warning once per
>  	 * boot if we detect this case.
>  	 */
> -	for_each_console(con)
> +	cookie = console_srcu_read_lock();
> +	for_each_console_srcu(con) {
>  		if (con == kgdboc_earlycon_io_ops.cons)
> -			return;
> +			break;
> +	}
> +	console_srcu_read_unlock(cookie);
> +	if (con)
> +		return;

This change isn't mentioned in the patch description.


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
