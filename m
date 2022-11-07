Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C283B61ED58
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  7 Nov 2022 09:48:04 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1orxnX-000517-GW
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 07 Nov 2022 08:48:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1orxnN-00050l-MY
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 07 Nov 2022 08:47:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uFwkIA+hpXfr5X8ZQSucgd5/1QNkOR9JRiXi9mJSFas=; b=Jo0ubgDPDdLlsX4/rREoQsQqpg
 dJw52tm48XMluwSe9ZZTho5Yyj+lDjnt6UZFP7HvX2OiPYBfg/02p4CrWnfVlJrmTN15akOwq9dF8
 AOkdUWzvJeC/CEmc9Pu4f/GlQBgnworWokDb97cwdjBtDoQ2KsHUigavaUpmaO5TqFiw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uFwkIA+hpXfr5X8ZQSucgd5/1QNkOR9JRiXi9mJSFas=; b=mcXJcBZAo0zjX8sZwsydYAOKB9
 FVFJTrxqhuiORGm47zPx74FwXP5M9Z0tMGDfffBP+nIuiKtgFj6ATpsjijMHH3kGaksjKLH95fKJL
 hugrxtYXAWVlti22QBZf6brvO3dOXCCH6z/NSSkThMfAO2qqiZnDFthFdbn71zOtMaBQ=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1orxnM-00Es94-1k for kgdb-bugreport@lists.sourceforge.net;
 Mon, 07 Nov 2022 08:47:53 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id B871722453;
 Mon,  7 Nov 2022 08:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1667810860; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uFwkIA+hpXfr5X8ZQSucgd5/1QNkOR9JRiXi9mJSFas=;
 b=eZwujpWyIOaAy0UYMyza2lX7QA78jpGKxfHk1fRaxsXE8fwqguK1mQwDULKSazmwqaQXX2
 uBbL1xmlg+cHjXsP311tnDEoivhxnXrLtVIJK3xfSuROzdF79N6UrHWBo6tOh0/dups3Ko
 93c0iG4nvmF/4X7W8OULty2Go+EpiUQ=
Received: from suse.cz (unknown [10.100.201.202])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 991672C141;
 Mon,  7 Nov 2022 08:47:38 +0000 (UTC)
Date: Mon, 7 Nov 2022 09:47:38 +0100
To: John Ogness <john.ogness@linutronix.de>
Message-ID: <Y2jGKnSw02QLecx+@alley>
References: <20221019145600.1282823-1-john.ogness@linutronix.de>
 <20221019145600.1282823-13-john.ogness@linutronix.de>
 <CAD=FV=VFxKL=sOMdhyHrgy2JOtzKJdOe4euwZRRAK7P-rNVjuQ@mail.gmail.com>
 <CAD=FV=WF2S9wQ6uR+VKU4EfDTVd0JnKkuU3Wyfo6P8E_FouebQ@mail.gmail.com>
 <87czagf8hf.fsf@jogness.linutronix.de>
 <87bkpm7kp8.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87bkpm7kp8.fsf@jogness.linutronix.de>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri 2022-11-04 17:29:15,
 John Ogness wrote: > On 2022-10-24, 
 Doug Anderson <dianders@chromium.org> wrote: > > It actually only holds
 console_list_lock()
 even at the end of the > > series. Still, it [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.28 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1orxnM-00Es94-1k
Subject: Re: [Kgdb-bugreport] [PATCH printk v2 12/38] tty: serial: kgdboc:
 use console_is_enabled()
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <senozhatsky@chromium.org>, linux-serial@vger.kernel.org,
 Jason Wessel <jason.wessel@windriver.com>,
 kgdb-bugreport@lists.sourceforge.net, Thomas Gleixner <tglx@linutronix.de>,
 Jiri Slaby <jirislaby@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Fri 2022-11-04 17:29:15, John Ogness wrote:
> On 2022-10-24, Doug Anderson <dianders@chromium.org> wrote:
> > It actually only holds console_list_lock() even at the end of the
> > series. Still, it seems weird that we're declaring the `data_race` on
> > CON_ENABLED but not CON_BOOT ?
> 
> For my upcoming v3 I decided to drop this patch and will keep the
> existing direct reading of @flags. Instead of this patch, for v3 the
> comment will additionally mention why @flags is allowed to be directly
> read:
> 
> /*
>  * Hold the console_lock to guarantee that no consoles are
              ^^^^^^^^^^^^
>  * unregistered until the kgdboc_earlycon setup is complete.

My understanding is that this is synchronized by console_list_lock.
Or do I miss something?

>  * Trapping the exit() callback relies on exit() not being
>  * called until the trap is setup. This also allows safe
>  * traversal of the console list and race-free reading of @flags.
>  */

Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
