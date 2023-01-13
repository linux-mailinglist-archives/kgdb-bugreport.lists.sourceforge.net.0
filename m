Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 265C36692A7
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 13 Jan 2023 10:14:21 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1pGG8i-0001tQ-OU
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 13 Jan 2023 09:14:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1pGG8e-0001tJ-IP
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 13 Jan 2023 09:14:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=22DFHnDxPptAxbZRoG0bfrp/Xo+pGFjmLGSMAbfetfs=; b=hR7TMD+7x/qFaX04QjkU2cgmvn
 MO3Nuzjof/dnz/XtOmc8p06wR0qRpAOXAW3iZjqAO66wbAK4lxY8bg8Rx816hQOZnj9dZqW6/oZEV
 U+/iDXTQDTyMVvK/vc094XCUhUWfZJkHKcsTA3VbxLnlBNjAlaz7UhwU4KvWZYg6UjAE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=22DFHnDxPptAxbZRoG0bfrp/Xo+pGFjmLGSMAbfetfs=; b=jSyQ8fJ2Hje2CQy9JMGXuq5Tmi
 aN8MpXVddu5SUsW5gdttj8YRnCaHLcxpD9cqk8qDyANddppj7Vyor/E/K6pCT+hF/r4aJFkkjL5he
 ZEXBkk8dwdIumbxRaBFLyq1BCagSm31/mGxVCn3arc3KXEdv6WsvASi2I/ZUcvlPUaSY=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pGG8Y-002GZm-Jk for kgdb-bugreport@lists.sourceforge.net;
 Fri, 13 Jan 2023 09:14:15 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id D131B4ECED;
 Fri, 13 Jan 2023 09:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1673601240; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=22DFHnDxPptAxbZRoG0bfrp/Xo+pGFjmLGSMAbfetfs=;
 b=OeKmqSXK6BMh1+XSb4Yht+FwtZ3vbNAUYn424dWwVqnXft2E2H2qY4xnZSv22j+3Fcid6W
 qxBw9EAKsq2DQhg2mMhVMuPEGYRmGDmvhiXWmQmur3NNywDeUBr0Dmd35RlipU3MLxMox7
 9MDbEt0p7ut324nkAcMAKEvRCh42KMQ=
Received: from suse.cz (unknown [10.100.201.202])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 576AB2C141;
 Fri, 13 Jan 2023 09:14:00 +0000 (UTC)
Date: Fri, 13 Jan 2023 10:13:59 +0100
To: John Ogness <john.ogness@linutronix.de>
Message-ID: <Y8Eg1wDOOkSCAh2E@alley>
References: <20230112161213.1434854-1-john.ogness@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230112161213.1434854-1-john.ogness@linutronix.de>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu 2023-01-12 17:18:13,
 John Ogness wrote: > Several mutexes
 are taken while setting up console serial ports. In > particular,
 the tty_port->mutex
 and @console_mutex are taken: > > serial_pnp_prob [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.28 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1pGG8Y-002GZm-Jk
Subject: Re: [Kgdb-bugreport] [PATCH v2] tty: serial: kgdboc: fix mutex
 locking order for configure_kgdboc()
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

On Thu 2023-01-12 17:18:13, John Ogness wrote:
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
> 
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
> Reviewed-by: Petr Mladek <pmladek@suse.com>

JFYI, the patch has been committed into printk/linux.git,
branch rework/console-list-lock.

I am going to give it few days in linux-next. If there is no problem
I will send a pull request for 6.2-rc5 later the following week.

Please, let me known if you have another preference.

Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
