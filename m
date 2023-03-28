Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7E66CC4E2
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 28 Mar 2023 17:10:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1phAxu-0002Hk-Qy
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 28 Mar 2023 15:10:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1phAxt-0002He-56
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 28 Mar 2023 15:10:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=J7qeg0GFz1ZJRgmxl9x8sxycF9AB5MggAXwN1oT3If0=; b=Ln6O01sw6pnzjGEXVYhS0/l66r
 ZkWCw7priIcfLl/Hybqbx1uTiskeZQPo4X7W08D5jVHcfsd3xaZ51vgJiXWmizRxjkoxT31Ynoq0N
 BpK5olcDoWsSuXaDlWtAvusQiYyb83FjLMuVgfiMivOxfmEVgP0f2qlA37updZbc4V8I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=J7qeg0GFz1ZJRgmxl9x8sxycF9AB5MggAXwN1oT3If0=; b=ThvDU2yEUyMbpWPoAHFmouI4eU
 /GdN9G4voH3XBMZZ0CZP319mir7C1fXJ6t3oJTqLZWv8U2I0tiJSRi2dDJBvikYQ3C3KApPjW+Dv7
 nhlBtp9K7zIC0P2SEwYJRl8FM1VuT9cC0AXqmMIGwLgbMXoxtD3O7VTbKio1BHM5kFjQ=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1phAxp-00037d-IS for kgdb-bugreport@lists.sourceforge.net;
 Tue, 28 Mar 2023 15:10:25 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 4BDAA1FD86;
 Tue, 28 Mar 2023 15:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1680016215; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=J7qeg0GFz1ZJRgmxl9x8sxycF9AB5MggAXwN1oT3If0=;
 b=My/k51tQYydUiJotUmioUM5T7ItvWH7XNP/9KkTNuidF9vQbDg6SwA+Gl3FHdHaCrKhvBx
 wlXbU2mWUG4HP0pEoLhafKjLu8e0ysCc87/WRryaSqooRB5zj3Y+Q2yL6Xzy1L9HmPCOe/
 0VduxhGei5VgNRbmlG36gF1FvHubPOw=
Received: from suse.cz (unknown [10.100.208.146])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id A2E3A2C141;
 Tue, 28 Mar 2023 15:10:13 +0000 (UTC)
Date: Tue, 28 Mar 2023 17:10:12 +0200
To: John Ogness <john.ogness@linutronix.de>
Message-ID: <ZCMDVKy1Ir0rvi5g@alley>
References: <20230302195618.156940-1-john.ogness@linutronix.de>
 <87wn3zsz5x.fsf@jogness.linutronix.de> <ZCLsuln0nHr7S9a5@alley>
 <87a5zxger3.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87a5zxger3.fsf@jogness.linutronix.de>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue 2023-03-28 16:03:36,
 John Ogness wrote: > On 2023-03-28, 
 Petr Mladek <pmladek@suse.com> wrote: > >> + if (!__serial8250_clear_IER(up,
 wctxt, &ier)) > >> + return false; > >> + > >> + if (consol [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.29 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1phAxp-00037d-IS
Subject: Re: [Kgdb-bugreport] locking API: was: [PATCH printk v1 00/18]
 serial: 8250: implement non-BKL console
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
Cc: kgdb-bugreport@lists.sourceforge.net,
 Lai Jiangshan <jiangshanlai@gmail.com>,
 Joel Fernandes <joel@joelfernandes.org>, Tiezhu Yang <yangtiezhu@loongson.cn>,
 Neeraj Upadhyay <quic_neeraju@quicinc.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Aaron Tomlin <atomlin@redhat.com>, "Paul E. McKenney" <paulmck@kernel.org>,
 Frederic Weisbecker <frederic@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 Josh Triplett <josh@joshtriplett.org>, Steven Rostedt <rostedt@goodmis.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 David Gow <davidgow@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 rcu@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, Sergey Senozhatsky <senozhatsky@chromium.org>,
 Luis Chamberlain <mcgrof@kernel.org>, tangmeng <tangmeng@uniontech.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Tue 2023-03-28 16:03:36, John Ogness wrote:
> On 2023-03-28, Petr Mladek <pmladek@suse.com> wrote:
> >> +	if (!__serial8250_clear_IER(up, wctxt, &ier))
> >> +		return false;
> >> +
> >> +	if (console_exit_unsafe(wctxt)) {
> >> +		can_print = atomic_print_line(up, wctxt);
> >> +		if (!can_print)
> >> +			atomic_console_reacquire(wctxt, &wctxt_init);
> >
> > I am trying to review the 9th patch adding console_can_proceed(),
> > console_enter_unsafe(), console_exit_unsafe() API. And I wanted
> > to see how the struct cons_write_context was actually used.
> 
> First off, I need to post the latest version of the 8250-POC patch. It
> is not officially part of this series and is still going through changes
> for the PREEMPT_RT tree. I will post the latest version directly after
> answering this email.

Sure. I know that it is just a kind of POC.

> > I am confused now. I do not understand the motivation for the extra
> > @wctxt_init copy and atomic_console_reacquire().
> 
> If an atomic context loses ownership while doing certain activities, it
> may need to re-acquire ownership in order to finish or cleanup what it
> started.

This sounds suspicious. If a console/writer context has lost the lock
then all shared/locked resources might already be used by the new
owner.

I would expect that the context could touch only non-shared resources after
loosing the lock.

If it re-acquires the lock then the shared resource might be in
another state. So, doing any further changes might be dangerous.

I could imagine that incrementing/decrementing some counter might
make sense but setting some value sounds strange.


> > Why do we need a copy?
> 
> When ownership is lost, the context is cleared. In order to re-acquire,
> an original copy of the context is needed. There is no technical reason
> to clear the context, so maybe the context should not be cleared after a
> takeover. Otherwise, many drivers will need to implement the "backup
> copy" solution.

It might make sense to clear values that are not longer valid, e.g.
some state values or .len of the buffer. But I would keep the values
that might still be needed to re-acquire the lock. It might be
needed when the context want to re-start the entire operation,

I guess that you wanted to clean the structure to catch potential
misuse. It makes some sense but the copying is really weird.

I think that we might/should add some paranoid checks into all
functions manipulating the shared state instead.


> > And why we need to reacquire it?
> 
> In this particular case the context has disabled interrupts. No other
> context will re-enable interrupts because the driver is implemented such
> that the one who disables is the one who enables. So this context must
> re-acquire ownership in order to re-enable interrupts.

My understanding is that the driver might lose the lock only
during hostile takeover. Is it safe to re-enable interrupts
in this case?

Well, it actually might make sense if the interrupts should
be enabled when the port is unused.

Well, I guess that they will get enabled by the other hostile
owner. It should leave the serial port in a good state when
it releases the lock a normal way.

Anyway, thanks a lot for the info. I still have to scratch my
head around this.

Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
