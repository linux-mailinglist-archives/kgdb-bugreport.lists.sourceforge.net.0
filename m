Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3296663BE
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 11 Jan 2023 20:28:19 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1pFgln-0007Da-8s
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 11 Jan 2023 19:28:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1pFglk-0007DN-Nv
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 11 Jan 2023 19:28:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=B1LPsn+UgdaSd6bRvRcaJ0uMddyjKGSwwy0jj+RkHME=; b=lTnOaxshaRb3Wwo9PAUDNB6mCN
 cIW7GatMsky3FdcIJ53bhmHTyxPU5ZrP8mNS0/t3IGCsHUycguOI4x1cgIL+FDyetWQviWkuK+kWX
 X8nrgA5n5otzjuOXmMk8XjaEkN0FGUMlZz0WwERu28BJj2V5eq+DSSXuQgQdMWVnG7vU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=B1LPsn+UgdaSd6bRvRcaJ0uMddyjKGSwwy0jj+RkHME=; b=jEah9+hPS6iL15CAkxfwua5WE5
 lT05xJRR3PY0nVpUN6+O/eWU92VJSxJqzQDE79m4Rl9eOjxpPg8t23vBzidcqVvUWALEzEr02VX7H
 zKNCdNOiKktVGyyBjvIG/glH4aAHEiwp9aYPdPU3vzTsE6mhMctlgKAQSXFqsZQpW60Y=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pFgli-0002q1-UJ for kgdb-bugreport@lists.sourceforge.net;
 Wed, 11 Jan 2023 19:28:15 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 0B25C220DC;
 Wed, 11 Jan 2023 16:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1673454235; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=B1LPsn+UgdaSd6bRvRcaJ0uMddyjKGSwwy0jj+RkHME=;
 b=OpC/m2rfxOdfKE4y4JwM7fpNTjhU7kUuXTiO73um24Md9qZ32k8qAkPaufEQk7g2rH+9rT
 4wDatTjmcaKLRYlGXrMrWkeJmzHTBw43K92JPJqNeec+/A20z3cGhuHIzYbvJPqDXE+g5F
 4FhLEYBzFmJiohJRAZw4SWvsgd7LI2k=
Received: from suse.cz (unknown [10.100.201.202])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 6D86A2C142;
 Wed, 11 Jan 2023 16:23:54 +0000 (UTC)
Date: Wed, 11 Jan 2023 17:23:54 +0100
To: John Ogness <john.ogness@linutronix.de>
Message-ID: <Y77imoYMaZZZz28x@alley>
References: <20230111145110.1327831-1-john.ogness@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230111145110.1327831-1-john.ogness@linutronix.de>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed 2023-01-11 15:57:10,
 John Ogness wrote: > Several mutexes
 are taken while setting up console serial ports. In > particular,
 the tty_port->mutex
 and @console_mutex are taken: > > serial_pnp_prob [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.28 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: suse.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1pFgli-0002q1-UJ
Subject: Re: [Kgdb-bugreport] [PATCH] tty: serial: kgdboc: fix mutex locking
 order for configure_kgdboc()
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
From: Petr Mladek via Kgdb-bugreport <kgdb-bugreport@lists.sourceforge.net>
Reply-To: Petr Mladek <pmladek@suse.com>
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, linux-serial@vger.kernel.org,
 Jason Wessel <jason.wessel@windriver.com>,
 kgdb-bugreport@lists.sourceforge.net, Thomas Gleixner <tglx@linutronix.de>,
 Jiri Slaby <jirislaby@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Wed 2023-01-11 15:57:10, John Ogness wrote:
> Several mutexes are taken while setting up console serial ports. In
> particular, the tty_port->mutex and @console_mutex are taken:
> 
>   serial_pnp_probe
>     serial8250_register_8250_port
>       uart_add_one_port (locks tty_port->mutex)
>         uart_configure_port
>           register_console (locks @console_mutex)
> 
> In order to synchronize kgdb's tty_find_polling_driver() with
> register_console(), commit 6193bc90849a ("tty: serial: kgdboc:
> synchronize tty_find_polling_driver() and register_console()") takes
> the @console_mutex. However, this leads to the following call chain
> (with locking):
> 
>   platform_probe
>     kgdboc_probe
>       configure_kgdboc (locks @console_mutex)
>         tty_find_polling_driver
>           uart_poll_init (locks tty_port->mutex)
>             uart_set_options
> 
> This is clearly deadlock potential due to the reverse lock ordering.

Great catch!

> Since uart_set_options() requires holding @console_mutex in order to
> serialize early initialization of the serial-console lock, take the
> @console_mutex in uart_poll_init() instead of configure_kgdboc().
> 
> Since configure_kgdboc() was using @console_mutex for safe traversal
> of the console list, change it to use the SRCU iterator instead.
> 
> Add comments to uart_set_options() kerneldoc mentioning that it
> requires holding @console_mutex (aka the console_list_lock).
> 
> Fixes: 6193bc90849a ("tty: serial: kgdboc: synchronize tty_find_polling_driver() and register_console()")
> Signed-off-by: John Ogness <john.ogness@linutronix.de>

> --- a/drivers/tty/serial/kgdboc.c
> +++ b/drivers/tty/serial/kgdboc.c
> @@ -189,15 +190,6 @@ static int configure_kgdboc(void)
>  	if (kgdboc_register_kbd(&cptr))
>  		goto do_register;
>  
> -	/*
> -	 * tty_find_polling_driver() can call uart_set_options()
> -	 * (via poll_init) to configure the uart. Take the console_list_lock
> -	 * in order to synchronize against register_console(), which can also
> -	 * configure the uart via uart_set_options(). This also allows safe
> -	 * traversal of the console list.
> -	 */
> -	console_list_lock();
> -
>  	p = tty_find_polling_driver(cptr, &tty_line);
>  	if (!p) {
>  		console_list_unlock();

This console_list_unlock() should be removed here as well.

Best Regards,
Petr

PS: I still have to double check all the dependencies. I think that I need
to do it with a fresh head tomorrow.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
