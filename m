Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E144E6058E0
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 20 Oct 2022 09:43:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1olQCk-00040z-MC
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 20 Oct 2022 07:43:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <gregkh@linuxfoundation.org>) id 1olQCg-00040e-J0
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 20 Oct 2022 07:42:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gaJMagPscRDDrY47nF1qDOGZCqWd/UKHpEre1+sj5Vk=; b=Ny8e1yrlC7eb4ey8LKoeL1Dq/v
 L79whQnAwI0zemeDFSpb277rPqdhFhNSIGmW2+8txxBldpZS8IavbP9VCbFHde1AC652z0XgF9syG
 XLryn1DpYwMZdFR7DjPh1x2oLjYZAsHjsVEAFik5XdlG/bgc4lPHZDc9zieuxoDzYDaM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gaJMagPscRDDrY47nF1qDOGZCqWd/UKHpEre1+sj5Vk=; b=UkqI7D41/Gyx6DUPMMoVSbovHs
 Vzq7B/txYCLgVEgJYO4JVNcviFyUYjKwgoeP9DGlk4Q2p1NAb/MZ6jFKc/qebpo84BrfMm1Usye6L
 N59x+HyZAFw260lLSOzZLWpSRzHIj6hqQj3MWuXTn+srqsLel1CzQSnlbETyQ4i0RkG8=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1olQCc-00AcPT-BG for kgdb-bugreport@lists.sourceforge.net;
 Thu, 20 Oct 2022 07:42:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E48AF61A3D;
 Thu, 20 Oct 2022 07:42:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44184C433C1;
 Thu, 20 Oct 2022 07:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1666251762;
 bh=xRdVE9aidjuImN/AuV60ZkxbXja2doJEERbOAXKZNRE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IbrjTATvAI5DDOIzrV+B3jYVi019tIBwGxApFj9ewolUMaoHhqheBqZ+7Dgj2bp3d
 t9tKajcmMeu9z9qkmQ9nqsk4DRHGyhPNwRWENrDnUsPM75hroToM1/6UvKVd5fES3o
 w0ceeG1qALz8GEaD0r5Ga0sWcmUruwDMLb5E0Vkk=
Date: Thu, 20 Oct 2022 09:42:39 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: John Ogness <john.ogness@linutronix.de>
Message-ID: <Y1D770/QciPCy3ds@kroah.com>
References: <20221019145600.1282823-1-john.ogness@linutronix.de>
 <20221019145600.1282823-23-john.ogness@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221019145600.1282823-23-john.ogness@linutronix.de>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Oct 19, 2022 at 05:01:44PM +0206, John Ogness wrote:
 > kgdboc_earlycon_init() uses the console_lock to ensure that no consoles
 > are unregistered until the kgdboc_earlycon is setup. This is ne [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linuxfoundation.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1olQCc-00AcPT-BG
Subject: Re: [Kgdb-bugreport] [PATCH printk v2 22/38] serial: kgdboc:
 document console_lock usage
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
 Daniel Thompson <daniel.thompson@linaro.org>,
 kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, linux-serial@vger.kernel.org,
 Jason Wessel <jason.wessel@windriver.com>,
 Thomas Gleixner <tglx@linutronix.de>, Jiri Slaby <jirislaby@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Wed, Oct 19, 2022 at 05:01:44PM +0206, John Ogness wrote:
> kgdboc_earlycon_init() uses the console_lock to ensure that no consoles
> are unregistered until the kgdboc_earlycon is setup. This is necessary
> because the trapping of the exit() callback assumes that the exit()
> callback is not called before the trap is setup.
> 
> Explicitly document this non-typical console_lock usage.
> 
> Signed-off-by: John Ogness <john.ogness@linutronix.de>
> ---
>  drivers/tty/serial/kgdboc.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/tty/serial/kgdboc.c b/drivers/tty/serial/kgdboc.c
> index e9d3f8c6e3dc..48000666789a 100644
> --- a/drivers/tty/serial/kgdboc.c
> +++ b/drivers/tty/serial/kgdboc.c
> @@ -545,6 +545,14 @@ static int __init kgdboc_earlycon_init(char *opt)
>  	 * Look for a matching console, or if the name was left blank just
>  	 * pick the first one we find.
>  	 */
> +
> +	/*
> +	 * Hold the console_lock to guarantee that no consoles are
> +	 * unregistered until the kgdboc_earlycon setup is complete.
> +	 * Trapping the exit() callback relies on exit() not being
> +	 * called until the trap is setup. This also allows safe
> +	 * traversal of the console list.
> +	 */
>  	console_lock();
>  	for_each_console(con) {
>  		if (con->write && con->read &&
> -- 
> 2.30.2
>

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
