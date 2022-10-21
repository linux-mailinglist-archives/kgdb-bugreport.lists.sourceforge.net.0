Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D00607A27
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 21 Oct 2022 17:10:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1olteu-0006oW-Ex
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 21 Oct 2022 15:10:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1oltec-0006nn-DZ
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 21 Oct 2022 15:09:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=D2cmZ6BvHBYBb6ewKQViyHi8KNoqJ4RJeLxFa1jRfPU=; b=UT+AzrBWD8NEWEuhpcHyGgwgKm
 frlFYk8oZ17nhePZa+VEto7H26VcY1gqlH+mcSRqiR/M1Aw+OTVgdWgvWPkVAsxiXBn0DroNN1erP
 r+43yL6kgiv2oNgt0fMpkslKyxlFH9FN7Zi0MAyXJ0+mMbbFj2gQ65ZG2queYedgEt+g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=D2cmZ6BvHBYBb6ewKQViyHi8KNoqJ4RJeLxFa1jRfPU=; b=UugAruWx6QOEIOSZCKEoeADlqj
 +KYqy5rpR/RKcDwqPLPlprGlJM3G55rBnmePxtCNeZBgFp/XFYHWHgClF3EN2F4Ff3d+czFMVFQwS
 366XmtD3UXDFObD/sCJhZ3nh/lGovdwjKsawGO+t5kEHcPJQhsUPmIJkppNPpSeY4bP8=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1olteR-0003Yg-PP for kgdb-bugreport@lists.sourceforge.net;
 Fri, 21 Oct 2022 15:09:36 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 44CB621AC3;
 Fri, 21 Oct 2022 15:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1666364966; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=D2cmZ6BvHBYBb6ewKQViyHi8KNoqJ4RJeLxFa1jRfPU=;
 b=Z64rxAKDBG/TanlPIBnuQFWm/LX0xgg8bMR9dvDfTuLSMLDAR3+SUqOUHGVFVCf/uVI24I
 kV9RAoggTaweiqxTo5EH8RKHNMsrJn3elumj0N3Vc8VtltOGywUpSyBPeNClBFEdkL5gW2
 myMpVZpXF60Gl0Vtf54IlRCCU57GDaA=
Received: from suse.cz (unknown [10.100.201.202])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 24A8A2C141;
 Fri, 21 Oct 2022 15:09:25 +0000 (UTC)
Date: Fri, 21 Oct 2022 17:09:24 +0200
To: John Ogness <john.ogness@linutronix.de>
Message-ID: <Y1K2JP6LIf8H2Ub5@alley>
References: <20221019145600.1282823-1-john.ogness@linutronix.de>
 <20221019145600.1282823-22-john.ogness@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221019145600.1282823-22-john.ogness@linutronix.de>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed 2022-10-19 17:01:43, John Ogness wrote: > Use srcu
 console list iteration for safe console list traversal. > > Note that
 configure_kgdboc()
 still requires the console_lock in > order to ensure [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.28 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1olteR-0003Yg-PP
Subject: Re: [Kgdb-bugreport] [PATCH printk v2 21/38] serial: kgdboc: use
 srcu console list iterator
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

On Wed 2022-10-19 17:01:43, John Ogness wrote:
> Use srcu console list iteration for safe console list traversal.
>
> Note that configure_kgdboc() still requires the console_lock in
> order to ensure that no console is in its write() callback when
> its direct() callback is called. Add comments to clarify this.

s/direct()/device()/

Do you know about such requirements or is it just
a conservative approach, please?

I ask because the comment in the code says "may assume".


Anyway, this would deserve a comment why the SRCU list iteration is
needed even when console_lock() is needed as well.

The reason is that further patches are going to synchronize
console_list manipulation with another lock and console_lock()
will be used only to serialize accessing con->write() callbacks.

Best Regards,
Petr

> Signed-off-by: John Ogness <john.ogness@linutronix.de>
> ---
>  drivers/tty/serial/kgdboc.c | 21 ++++++++++++++++++---
>  1 file changed, 18 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/tty/serial/kgdboc.c b/drivers/tty/serial/kgdboc.c
> index b17aa7e49894..e9d3f8c6e3dc 100644
> --- a/drivers/tty/serial/kgdboc.c
> +++ b/drivers/tty/serial/kgdboc.c
> @@ -171,6 +171,7 @@ static int configure_kgdboc(void)
>  	int err = -ENODEV;
>  	char *cptr = config;
>  	struct console *cons;
> +	int cookie;
>  
>  	if (!strlen(config) || isspace(config[0])) {
>  		err = 0;
> @@ -193,8 +194,14 @@ static int configure_kgdboc(void)
>  	if (!p)
>  		goto noconfig;
>  
> +	/*
> +	 * Stop console printing because the device() callback may
> +	 * assume the console is not within its write() callback.
> +	 */
>  	console_lock();
> -	for_each_console(cons) {
> +
> +	cookie = console_srcu_read_lock();
> +	for_each_console_srcu(cons) {
>  		int idx;
>  		if (cons->device && cons->device(cons, &idx) == p &&
>  		    idx == tty_line) {
> @@ -202,6 +209,8 @@ static int configure_kgdboc(void)
>  			break;
>  		}
>  	}
> +	console_srcu_read_unlock(cookie);
> +
>  	console_unlock();
>  
>  	kgdb_tty_driver = p;
> @@ -451,6 +460,7 @@ static void kgdboc_earlycon_pre_exp_handler(void)
>  {
>  	struct console *con;
>  	static bool already_warned;
> +	int cookie;
>  
>  	if (already_warned)
>  		return;
> @@ -463,9 +473,14 @@ static void kgdboc_earlycon_pre_exp_handler(void)
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
>  
>  	already_warned = true;
>  	pr_warn("kgdboc_earlycon is still using bootconsole\n");
> -- 
> 2.30.2


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
