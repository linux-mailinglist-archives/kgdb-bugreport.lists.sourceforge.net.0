Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B121E624570
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 10 Nov 2022 16:18:37 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1ot9K8-00006c-F4
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 10 Nov 2022 15:18:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daniel.thompson@linaro.org>) id 1ot9Jv-00005f-Kg
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 10 Nov 2022 15:18:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TnbvJ2aNd/N4qPmGQHgGv1wyv/KitPYgnCYQxHNl5yc=; b=iSIH28j/YqPub0li/ZBS3v3AeB
 a0PmPkhUGCKTdIHbk4WcGgDyk5F64xpOfoq5qrpKrxEoF4Zjzc/mObRmrCsGtM010KIntLHQWICEl
 NaWya02xRKfM4rFTS9hzs2+W2mKTmBy/syb0PRJNca2rFswy3mnGUBPw+TcsbaJ4rtNs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TnbvJ2aNd/N4qPmGQHgGv1wyv/KitPYgnCYQxHNl5yc=; b=eL6FzqXoCMVtz2O1igFzlhzsGs
 g0e8JNyTwQNhfZe1IHcZhnQim8xzGa11nvOsKz9CVIFMIK57e6IytW6U5JPn8EVGYdSg73pgXntXH
 9ezY8HwEuk3PaB91dy6ZLjcMIalyGy9l+VL1bd7tyWreSwTKPgozJ/hy62WKV1Uciljk=;
Received: from mail-ed1-f52.google.com ([209.85.208.52])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1ot9Jp-003F41-RO for kgdb-bugreport@lists.sourceforge.net;
 Thu, 10 Nov 2022 15:18:21 +0000
Received: by mail-ed1-f52.google.com with SMTP id i21so3549233edj.10
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 10 Nov 2022 07:18:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=TnbvJ2aNd/N4qPmGQHgGv1wyv/KitPYgnCYQxHNl5yc=;
 b=STUtE1y18DQBqcdpzuDwOSXPZ13/gNh8YkjwWCd0EFji3vWoV/Q+siSjXq5bjNysOx
 4cH5Vj08sKiHa1oI3ngPSGWGkVHv4tZvyT2HHNxyvcwyj42mHxHoVf91t0h8ltJngJnQ
 X6pmsLISMzLboUUe+d6BnTe8xP0CxeH666LWdMTWW5fEtSfLzZ85Y26ngYBd7isEVvI9
 ZXd0yXZYIpSUrv3FTKYfuXvQ/eiB6mNRg/q2w5tkVvPZilPVIKX9qT7QLimsXe2Fy1mv
 5ET5ZbciqYjlEZ7powNKjcY/I17J2fqkefvtJ6Np7IcJ3AuVBzCr2AXLs1XYT1KsUyUy
 hfxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TnbvJ2aNd/N4qPmGQHgGv1wyv/KitPYgnCYQxHNl5yc=;
 b=o9P/mGud0FZPP0Gz7VHCXY7hTMLhaJmOZp/QrfvIw76PIkz0ta89wAi4c2h9HHxyRX
 +rGgFwovWXfO+0oEezASrgMjDZiHt9ycy1zZ+W75xCmlRkhXFYWyzk/vd4AcGXkoh1Cx
 UK/HQn2a+xNac6r36gav7ky7uZAQDX2Orb/ByjKLqPA+kum399YMu5UqS8cG8hofZPs9
 2rZoIDnz4S8Trjavt99diIiXiQ7hOdfmD00siFmWGKoH0NOJMewsSDXP6xxXxuffIwLt
 ZQ4tXnQDqiA6kc4lebeUTzLGxNewzfJQNv6tE/IEeT+242Sf9ukxtqVYEmems+O44/5p
 +fnA==
X-Gm-Message-State: ACrzQf2a2Ca9pbAKN8ezjKp1iYxDLlm/8sfz+pznlIrfCCPmbktlktrd
 FDqMw4J0YwBep5lgONgV0NAvVA==
X-Google-Smtp-Source: AMsMyM7A2A2Tt1JxgZ82rllwHec1SazSu8WJQM2KYh7x6hVkjuwcr8WdaWIGdmbf3PCd/TlGC6P+UA==
X-Received: by 2002:a50:ef17:0:b0:45b:4a4b:478c with SMTP id
 m23-20020a50ef17000000b0045b4a4b478cmr2414848eds.317.1668093491324; 
 Thu, 10 Nov 2022 07:18:11 -0800 (PST)
Received: from frostfish ([82.132.184.39]) by smtp.gmail.com with ESMTPSA id
 l22-20020aa7cad6000000b0045b4b67156fsm8561373edt.45.2022.11.10.07.18.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 07:18:10 -0800 (PST)
Date: Thu, 10 Nov 2022 15:18:07 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: John Ogness <john.ogness@linutronix.de>
Message-ID: <Y20WLyrLgu8q4kyB@frostfish>
References: <20221107141638.3790965-1-john.ogness@linutronix.de>
 <20221107141638.3790965-39-john.ogness@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221107141638.3790965-39-john.ogness@linutronix.de>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Nov 07, 2022 at 03:22:36PM +0106, John Ogness wrote:
 > kgdboc_earlycon_init() uses the console_lock to ensure that no consoles
 > are unregistered until the kgdboc_earlycon is setup. The consol [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.52 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.208.52 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1ot9Jp-003F41-RO
Subject: Re: [Kgdb-bugreport] [PATCH printk v3 38/40] tty: serial: kgdboc:
 use console_list_lock to trap exit
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

On Mon, Nov 07, 2022 at 03:22:36PM +0106, John Ogness wrote:
> kgdboc_earlycon_init() uses the console_lock to ensure that no consoles
> are unregistered until the kgdboc_earlycon is setup. The console_list_lock
> should be used instead because list synchronization responsibility will
> be removed from the console_lock in a later change.
> 
> Signed-off-by: John Ogness <john.ogness@linutronix.de>

I've not looked at the other patches in the series to understand the
future tense here (e.g. why we need intermediate patches like this one).

However I've no objections to the change so:
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.


> ---
>  drivers/tty/serial/kgdboc.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/tty/serial/kgdboc.c b/drivers/tty/serial/kgdboc.c
> index 8c2b7ccdfebf..a3ed9b34e2ab 100644
> --- a/drivers/tty/serial/kgdboc.c
> +++ b/drivers/tty/serial/kgdboc.c
> @@ -558,13 +558,13 @@ static int __init kgdboc_earlycon_init(char *opt)
>  	 */
>  
>  	/*
> -	 * Hold the console_lock to guarantee that no consoles are
> +	 * Hold the console_list_lock to guarantee that no consoles are
>  	 * unregistered until the kgdboc_earlycon setup is complete.
>  	 * Trapping the exit() callback relies on exit() not being
>  	 * called until the trap is setup. This also allows safe
>  	 * traversal of the console list and race-free reading of @flags.
>  	 */
> -	console_lock();
> +	console_list_lock();
>  	for_each_console(con) {
>  		if (con->write && con->read &&
>  		    (con->flags & (CON_BOOT | CON_ENABLED)) &&
> @@ -606,7 +606,7 @@ static int __init kgdboc_earlycon_init(char *opt)
>  	}
>  
>  unlock:
> -	console_unlock();
> +	console_list_unlock();
>  
>  	/* Non-zero means malformed option so we always return zero */
>  	return 0;
> -- 
> 2.30.2
> 


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
