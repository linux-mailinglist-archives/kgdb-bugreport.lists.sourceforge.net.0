Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C0EA666799F
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 12 Jan 2023 16:40:42 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1pFzh4-00040f-Bw
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 12 Jan 2023 15:40:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1pFzgt-000400-In
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 12 Jan 2023 15:40:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MnhE5SVciJ/SbPnM39oaaCSkXi4rJk4SInUK6g88A8I=; b=mYxSoRgnAkl3QmUdBDYUqnYbeu
 SousxbaG5nnaEBC31lJa0i62VBsYOcJ6d5qDc5exWE9aj6kh9adso9HxgLaebkXQRIiThdWC9K7sB
 IpY3FXM5QsX0eI4vqwPf1hQZLLeq5Mz3YSRxsaxwoHXi+macYkdw8ugiXhjmy4mdAaJI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MnhE5SVciJ/SbPnM39oaaCSkXi4rJk4SInUK6g88A8I=; b=g1tlj8V1PRAiP+15GsMWg9/kn3
 Ulhb22m96m1kPDMl7NQAZGldm0P0Ill/wtJVM3sOzXTUXdfR0aisYVoxY7BWSsknZiNOCqXf3RbDO
 AvnAMPx/nWBt7ZJbYrZy8V3Z6v01LkeIe24jNxrlEdPNMnmFGalBTygai8MDuXn9LqOw=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pFzgq-001Bzg-Po for kgdb-bugreport@lists.sourceforge.net;
 Thu, 12 Jan 2023 15:40:30 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 99CF1402C3;
 Thu, 12 Jan 2023 15:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1673538019; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MnhE5SVciJ/SbPnM39oaaCSkXi4rJk4SInUK6g88A8I=;
 b=gdU4kPBcKFOlGDDkfqP770eiIQG6FQMGlIw9Oyx/L1ICoITOsvbS/4bp/+fghEwhzlgHrr
 rYIo28C87h7Yus+MmP5RHkuVRzIWlMIMV9jCpyQKU0ahtsQoLgOW6HKgiWxkS00YaB1TI2
 qOMeWM9kS897ZqqcSJ5NOFhTmjCmIRA=
Received: from suse.cz (unknown [10.100.208.146])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 1B84C2C141;
 Thu, 12 Jan 2023 15:40:19 +0000 (UTC)
Date: Thu, 12 Jan 2023 16:40:16 +0100
To: John Ogness <john.ogness@linutronix.de>
Message-ID: <Y8Ap4B75PNy5/lHo@alley>
References: <20230111145110.1327831-1-john.ogness@linutronix.de>
 <Y77imoYMaZZZz28x@alley>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y77imoYMaZZZz28x@alley>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed 2023-01-11 17:23:55,
 Petr Mladek wrote: > On Wed 2023-01-11
 15:57:10, John Ogness wrote: > > Several mutexes are taken while setting
 up console serial ports. In > > particular, the tty_port->mu [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: suse.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.29 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1pFzgq-001Bzg-Po
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

On Wed 2023-01-11 17:23:55, Petr Mladek wrote:
> On Wed 2023-01-11 15:57:10, John Ogness wrote:
> > Several mutexes are taken while setting up console serial ports. In
> > particular, the tty_port->mutex and @console_mutex are taken:
> > 
> >   serial_pnp_probe
> >     serial8250_register_8250_port
> >       uart_add_one_port (locks tty_port->mutex)
> >         uart_configure_port
> >           register_console (locks @console_mutex)
> > 
> > In order to synchronize kgdb's tty_find_polling_driver() with
> > register_console(), commit 6193bc90849a ("tty: serial: kgdboc:
> > synchronize tty_find_polling_driver() and register_console()") takes
> > the @console_mutex. However, this leads to the following call chain
> > (with locking):
> > 
> >   platform_probe
> >     kgdboc_probe
> >       configure_kgdboc (locks @console_mutex)
> >         tty_find_polling_driver
> >           uart_poll_init (locks tty_port->mutex)
> >             uart_set_options
> > 
> > This is clearly deadlock potential due to the reverse lock ordering.
> 
> Great catch!
> 
> > Since uart_set_options() requires holding @console_mutex in order to
> > serialize early initialization of the serial-console lock, take the
> > @console_mutex in uart_poll_init() instead of configure_kgdboc().
> > 
> > Since configure_kgdboc() was using @console_mutex for safe traversal
> > of the console list, change it to use the SRCU iterator instead.
> > 
> > Add comments to uart_set_options() kerneldoc mentioning that it
> > requires holding @console_mutex (aka the console_list_lock).
> > 
> > Fixes: 6193bc90849a ("tty: serial: kgdboc: synchronize tty_find_polling_driver() and register_console()")
> > Signed-off-by: John Ogness <john.ogness@linutronix.de>
> 
> > --- a/drivers/tty/serial/kgdboc.c
> > +++ b/drivers/tty/serial/kgdboc.c
> > @@ -189,15 +190,6 @@ static int configure_kgdboc(void)
> >  	if (kgdboc_register_kbd(&cptr))
> >  		goto do_register;
> >  
> > -	/*
> > -	 * tty_find_polling_driver() can call uart_set_options()
> > -	 * (via poll_init) to configure the uart. Take the console_list_lock
> > -	 * in order to synchronize against register_console(), which can also
> > -	 * configure the uart via uart_set_options(). This also allows safe
> > -	 * traversal of the console list.
> > -	 */
> > -	console_list_lock();
> > -
> >  	p = tty_find_polling_driver(cptr, &tty_line);
> >  	if (!p) {
> >  		console_list_unlock();
> 
> This console_list_unlock() should be removed here as well.

This seems to be the only problem. Otherwise, the patch looks good to
me.

After removing the superfluous console_list_unlock():

Reviewed-by: Petr Mladek <pmladek@suse.com>

John, would you mind to send v2, please?

Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
