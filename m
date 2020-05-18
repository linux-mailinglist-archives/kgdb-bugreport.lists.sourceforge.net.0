Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 498841D73D8
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 18 May 2020 11:22:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jabyC-0003xW-46
	for lists+kgdb-bugreport@lfdr.de; Mon, 18 May 2020 09:22:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <pmladek@suse.com>) id 1jabyA-0003xN-KN
 for kgdb-bugreport@lists.sourceforge.net; Mon, 18 May 2020 09:21:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZueAEjSGKqhhMzmsFoHnCLutslghOODb4Bw2qdEvhZo=; b=LgR6FGU4di7yerIREGnRPETcGr
 aihBPjmhDIWsf64ut+fS0jcLj81Kh0OS3wN+iYD++han4h4gwlKHJHQ9Uxic/0mCpfDcjmiyUpPcN
 wNOsp+xohHS8oKumucdnxGAOkzbA1GuYtVsJse2NETimMqkGhl/yEHwa0x87KKnNGwDI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZueAEjSGKqhhMzmsFoHnCLutslghOODb4Bw2qdEvhZo=; b=Jv3Ssp9V9XkhoYK1+hHsavohD3
 kxujrJ6bdOhRMK55mu7DbY5iPC6NlUOh84aLT0IFYcw/1xg9OMHFC5cTxL5uQoUzrodzTm/ugoCZM
 6afjStGPQe530dE19aiySQstH9X0m8d+dYtUs+6XgCZK7IFvPxiw4JWOfOxPNB8HXrF0=;
Received: from mx2.suse.de ([195.135.220.15])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jaby8-00GdTz-7d
 for kgdb-bugreport@lists.sourceforge.net; Mon, 18 May 2020 09:21:58 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7A7F2AF57;
 Mon, 18 May 2020 09:21:44 +0000 (UTC)
Date: Mon, 18 May 2020 11:21:39 +0200
From: Petr Mladek <pmladek@suse.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
Message-ID: <20200518092139.GK7340@linux-b0ei>
References: <1589273314-12060-1-git-send-email-sumit.garg@linaro.org>
 <20200512142533.ta4uejwmq5gchtlx@holly.lan>
 <CAFA6WYOV7oPbYE=9fXueYMacb5wv0r9T6F8tmECt-Eafe-fctw@mail.gmail.com>
 <20200514084230.GO17734@linux-b0ei>
 <CAFA6WYPSsgdAB-wJC0e2YkVkW0XsqQsu5wrn4iB4M-cwvS7z2g@mail.gmail.com>
 <20200515085021.GS17734@linux-b0ei>
 <20200515103308.GD42471@jagdpanzerIV.localdomain>
 <20200515134806.5cw4xxnxw7k3223l@holly.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200515134806.5cw4xxnxw7k3223l@holly.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [195.135.220.15 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jaby8-00GdTz-7d
Subject: Re: [Kgdb-bugreport] [PATCH] printk/kdb: Redirect printk messages
 into kdb in any context
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
Cc: John Ogness <john.ogness@linutronix.de>, Arnd Bergmann <arnd@arndb.de>,
 Peter Zijlstra <peterz@infradead.org>, kgdb-bugreport@lists.sourceforge.net,
 Steven Rostedt <rostedt@goodmis.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Jason Wessel <jason.wessel@windriver.com>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Fri 2020-05-15 14:48:06, Daniel Thompson wrote:
> On Fri, May 15, 2020 at 07:33:08PM +0900, Sergey Senozhatsky wrote:
> > On (20/05/15 10:50), Petr Mladek wrote:
> > > kdb is able to stop kernel even in NMI context where printk() is redirected
> > > to the printk_safe() lockless variant. Move the check and redirect to kdb
> > > even in this case.
> > 
> > Can I please have some context what problem does this solve?
> > I can see that vkdb_printf() calls into console drivers:
> > 
> > 	for_each_console(c) {
> > 		c->write(c, cp, retlen - (cp - kdb_buffer));
> > 		touch_nmi_watchdog();
> > 	}
> > 
> > Is this guaranteed that we never execute this path from NMI?

Good question!

> Absolutely not.
> 
> The execution context for kdb is pretty much unique... we are running a
> debug mode with all CPUs parked in a holding loop with interrupts
> disabled. One CPU is at an unknown exception state and the others are
> either handling an IRQ or NMI depending on architecture[1].

This is similar to the situation in panic() when other CPUs are
stopped. It is more safe when the CPUs are stopped using IRQ.
There is higher danger of a deadlock when NMI is used.

bust_spinlock() is used in panic() to increase the chance to go over
the deadlock and actually see the messages. It is not enough when
more locks are used by the console (VT/TTY is good example). And
it is not guaranteed that the console will still work after
the hack is disabled by bust_spinlocks(0).


> However there are a number of factors that IMHO weigh in favour of
> allowing kdb to intercept here.
> 
> 1. kgdb/kdb are designed to work from NMI, modulo the bugs that are
>    undoubtedly present.

There is definitely a risk of deadlock when console drivers are called
by KDB. There are plans to create some lockless console drivers to
handle panic(). It might be usable in KDB as well.

The question is what are the expectations of KDB users. How often does
it happen that KDB does not work or that the system does not longer
work when continue is called in KDB?


> 2. A synchronous breakpoint (including an implicit breakpoint-on-oops)
>    from any code that executes with irqs disabled will exhibit most of
>    the same problems as an NMI but without waking up all the NMI logic.

Makes sense.


> 3. kdb_trap_printk is only set for *very* narrow time intervals by the
>    debug master (the single CPU in the system that is *not* in a
>    holding loop). Thus in all cases the system has already successfully
>    executed kdb_printf() several times before we ever call the printk()
>    interception code.
>
>    Or put another way, even if we did tickle a bug speculated about in
>    #1, it won't be the call to printk() that triggers it; we'd never
>    get that far!

Good point. I would say that this patch will not make the situation
worse. The code is called when KDB already uses consoles. It is just
a trick how to use existing code to print even more messages in
KDB context.

> 
> > If so, can this please be added to the commit message? A more
> > detailed commit message will help a lot.

What about?

"KDB has to get messages on consoles even when the system is stopped.
It uses kdb_printf() internally and calls console drivers on its own.

It uses a hack to reuse an existing code. It sets "kdb_trap_printk"
global variable to redirect even the normal printk() into the
kdb_printf() variant.

The variable "kdb_trap_printk" is checked in printk_default() and
it is ignored when printk is redirected to printk_safe in NMI context.
Solve this by moving the check into printk_func().

It is obvious that it is not fully safe. But it does not make things
worse. The console drivers are already called in this context by
kdb_printf() direct calls."

> I suspect Petr might prefer any future flames about kdb_printf() to be
> pointed at me rather than him ;-) so if adding anything to the commit
> message then I'd suggest it be based on the reasoning in #3 above.

This is fair :-)

Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
