Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E6B6248EA
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 10 Nov 2022 19:00:54 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1otBrB-0006E9-4D
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 10 Nov 2022 18:00:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1otBr6-0006E2-IA
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 10 Nov 2022 18:00:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AWcSmvtAAd5nshpVmK+tjYCHfPfNH63I2RCJ9fpekb0=; b=AWbTmXDzSIJXKqXZpeiMgE0tji
 aLAvRRQ8X4foV/mPgCY0AQQ7foqKSz/PCFGiG6TrLWGOMAsQUqxzaWCAb/XGvoV7o8RhlKwpmKjRs
 zM3RFyXAQF28Mva9rTGsOTOX17IPJ7ll159UJDzsMXwanORfkVQ1E3e9TtozIg8+gOeU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AWcSmvtAAd5nshpVmK+tjYCHfPfNH63I2RCJ9fpekb0=; b=N5l9a/lPCOEyATSqKjpKPaOEjl
 IzC+mEtUbcwsroMWRJnrWArI2wyKdDgtZv7XzbGwLRsd7b/iH+zVV/1c3Vp5R60CWdiCapytDx944
 4Lnhhpztqiyip/NzI5vV0W7Ip3+z7kxJ7HsrmbmwXYsT9PXTGmb6wgrOXGLFxA+Lg5aA=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1otBqy-0001u7-HQ for kgdb-bugreport@lists.sourceforge.net;
 Thu, 10 Nov 2022 18:00:48 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 324AD1FF97;
 Thu, 10 Nov 2022 18:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1668103230; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AWcSmvtAAd5nshpVmK+tjYCHfPfNH63I2RCJ9fpekb0=;
 b=pnPpVVewxH0PjRciuCOtuB7hb5Th2mXdC1dbLBfyijTO/9Ag9YMDi0fwiQCbd8TGLh+t6F
 OOJ9FnNP4GZJwiUoYv9iPblTq37t40B7oMb6i5hms49C1ZBPUBRWJRba7rDctwvdYF7O2A
 LzXlIrGoNkzOWLAwzSOfl2YEV0pyJWc=
Received: from suse.cz (unknown [10.100.208.146])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id A5F582C142;
 Thu, 10 Nov 2022 18:00:29 +0000 (UTC)
Date: Thu, 10 Nov 2022 19:00:29 +0100
To: John Ogness <john.ogness@linutronix.de>
Message-ID: <Y208PUz/fotmi8/R@alley>
References: <20221107141638.3790965-1-john.ogness@linutronix.de>
 <20221107141638.3790965-37-john.ogness@linutronix.de>
 <20221109090631.wbtar2ho45x5yanl@ash.lan>
 <87tu388nsk.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87tu388nsk.fsf@jogness.linutronix.de>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed 2022-11-09 10:50:43,
 John Ogness wrote: > On 2022-11-09, 
 Daniel Thompson <daniel.thompson@linaro.org> wrote: > >> @@ -463,9 +476,14
 @@ static void kgdboc_earlycon_pre_exp_handler(void) > >> * s [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.29 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1otBqy-0001u7-HQ
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

On Wed 2022-11-09 10:50:43, John Ogness wrote:
> On 2022-11-09, Daniel Thompson <daniel.thompson@linaro.org> wrote:
> >> @@ -463,9 +476,14 @@ static void kgdboc_earlycon_pre_exp_handler(void)
> >>  	 * serial drivers might be OK with this, print a warning once per
> >>  	 * boot if we detect this case.
> >>  	 */
> >> -	for_each_console(con)
> >> +	cookie = console_srcu_read_lock();
> >> +	for_each_console_srcu(con) {
> >>  		if (con == kgdboc_earlycon_io_ops.cons)
> >> -			return;
> >> +			break;
> >> +	}
> >> +	console_srcu_read_unlock(cookie);
> >> +	if (con)
> >> +		return;
> >
> > This change isn't mentioned in the patch description.
> 
> I will move this change into its own separate patch.
> 
>     tty: serial: kgdboc: use srcu console list iterator
> 
>     Use srcu console list iteration for safe console list traversal.

Yes, split it please :-) Anyway, both changes look good to me.

Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
