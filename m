Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 699C0668A80
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 13 Jan 2023 05:01:07 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1pGBFa-0003Nb-Rz
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 13 Jan 2023 04:01:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <senozhatsky@chromium.org>) id 1pGBFZ-0003NV-VL
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 13 Jan 2023 04:01:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kOmM1boioYg8LFtWAWs33j4bBuyb4KtgIsQ+w3Q1Nec=; b=kat+RYSPgprD+PpQWWFw+Q7hzH
 2X3q4kFwzAjAFCgIiZamIs+sv47bxEntldj3Y/7vccqqo8MY7EKYzu/An1XNknFJxIOag7JKvMOPq
 a0p8jlNQqTOEiVTtJieq3Cen2XIwL56VABDVuXJrgSRoxO0Zt08vHqHPtDlU0vVHZJBs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kOmM1boioYg8LFtWAWs33j4bBuyb4KtgIsQ+w3Q1Nec=; b=ftYmoDkfnfLWqMAbN+6H7DEiEU
 /dMhdciXQwP8mS0NneEA0YsO8WiD9sMLmq8e90luPEtYEI0lEcpj8VJV+I6y6oW3xVokRvziD2iH8
 pMT4IBP4vOgYFVTIgx4Wf9DNh+cwzwcHjZajaC1RGj6SGeHfQZtrakQ0oFKx0pEhOWkw=;
Received: from mail-oa1-f43.google.com ([209.85.160.43])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pGBFU-001uYk-RT for kgdb-bugreport@lists.sourceforge.net;
 Fri, 13 Jan 2023 04:01:05 +0000
Received: by mail-oa1-f43.google.com with SMTP id
 586e51a60fabf-15eec491b40so165140fac.12
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 12 Jan 2023 20:01:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=kOmM1boioYg8LFtWAWs33j4bBuyb4KtgIsQ+w3Q1Nec=;
 b=Ms+uSdJMIWu+6/rPfkBxkXAr7MPZBipnJfzVJqCmg773hVvxRx+OKl/7d0nRAxXsTX
 oJrqG0gxih/ylYXorRI2xrOT6BC9zp2wrZANpID7nHNl7KGadbiX7PDfPfrpxIEmncPH
 +KS+1pR7XE/gs4blQKXKoaKeorMh34AzE1BA8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kOmM1boioYg8LFtWAWs33j4bBuyb4KtgIsQ+w3Q1Nec=;
 b=mUe+S43wFuLhwre1Rvc/rt/enKqm/tqSkWxlyLT4Z9eg2sWzYNyCyx7k/cCu/HrVZi
 EUQI7v+K3Bmr8f57SyZKc97WhYRjcIUzznxd+fMZQ8rO2BRCfoZNCF7BBIDiDFq8J1ab
 D5s3ss6hYoE/wFye4hT/JDe5lltn5efxtHhcYmHfhyiZKRlxRe1DNnK3uXTICXMMpfnS
 E8bMkCtP+3m5rzKjxBdWrdptCLiK2GHlP9n2i1cXE9819rWHncRqFoymKU+VgGPwkIYr
 tcgAH4l35xNLKD+pcxGc/A+m4UI3SJVEICg5FVBLnpXopkpre/49nwu+GiXbCjgfvfDM
 fOog==
X-Gm-Message-State: AFqh2kojFjwhKDgpe2cSs20FIrHaQ4LIb3XdR8mG3GyNZpX3j/S28dkM
 0+sPp5LWzewzxcGA5kEDhMSTpszGyUZP6MKG
X-Google-Smtp-Source: AMrXdXtDHCAjBbBXjeoIpHmcmPAFTDOvNbFwRTgswr8/FoRJEOP33+VktonH7fugm95/k2TxfeSk3A==
X-Received: by 2002:a62:e703:0:b0:577:7cfb:a896 with SMTP id
 s3-20020a62e703000000b005777cfba896mr8682396pfh.31.1673577167232; 
 Thu, 12 Jan 2023 18:32:47 -0800 (PST)
Received: from google.com (KD124209188001.ppp-bb.dion.ne.jp. [124.209.188.1])
 by smtp.gmail.com with ESMTPSA id
 y22-20020aa78f36000000b00562677968aesm12568828pfr.72.2023.01.12.18.32.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jan 2023 18:32:46 -0800 (PST)
Date: Fri, 13 Jan 2023 11:32:41 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Petr Mladek <pmladek@suse.com>
Message-ID: <Y8DCyU0v0OUqArab@google.com>
References: <20230111145110.1327831-1-john.ogness@linutronix.de>
 <Y77imoYMaZZZz28x@alley> <Y8Ap4B75PNy5/lHo@alley>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y8Ap4B75PNy5/lHo@alley>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On (23/01/12 16:40), Petr Mladek wrote: > On Wed 2023-01-11
 17:23:55, Petr Mladek wrote: > > On Wed 2023-01-11 15:57:10, John Ogness
 wrote: > > > Several mutexes are taken while setting up console ser [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.160.43 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.160.43 listed in wl.mailspike.net]
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pGBFU-001uYk-RT
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 John Ogness <john.ogness@linutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, linux-serial@vger.kernel.org,
 Jason Wessel <jason.wessel@windriver.com>,
 kgdb-bugreport@lists.sourceforge.net, Thomas Gleixner <tglx@linutronix.de>,
 Jiri Slaby <jirislaby@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On (23/01/12 16:40), Petr Mladek wrote:
> On Wed 2023-01-11 17:23:55, Petr Mladek wrote:
> > On Wed 2023-01-11 15:57:10, John Ogness wrote:
> > > Several mutexes are taken while setting up console serial ports. In
> > > particular, the tty_port->mutex and @console_mutex are taken:
> > > 
> > >   serial_pnp_probe
> > >     serial8250_register_8250_port
> > >       uart_add_one_port (locks tty_port->mutex)
> > >         uart_configure_port
> > >           register_console (locks @console_mutex)
> > > 
> > > In order to synchronize kgdb's tty_find_polling_driver() with
> > > register_console(), commit 6193bc90849a ("tty: serial: kgdboc:
> > > synchronize tty_find_polling_driver() and register_console()") takes
> > > the @console_mutex. However, this leads to the following call chain
> > > (with locking):
> > > 
> > >   platform_probe
> > >     kgdboc_probe
> > >       configure_kgdboc (locks @console_mutex)
> > >         tty_find_polling_driver
> > >           uart_poll_init (locks tty_port->mutex)
> > >             uart_set_options
> > > 
> > > This is clearly deadlock potential due to the reverse lock ordering.
[..]
> > > -	console_list_lock();
> > > -
> > >  	p = tty_find_polling_driver(cptr, &tty_line);
> > >  	if (!p) {
> > >  		console_list_unlock();
> > 
> > This console_list_unlock() should be removed here as well.
> 
> This seems to be the only problem. Otherwise, the patch looks good to
> me.

Good catch.

Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
