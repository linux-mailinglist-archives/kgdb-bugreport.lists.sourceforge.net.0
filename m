Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 910DB7AC81
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 30 Jul 2019 17:38:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1hsUCr-000437-AM
	for lists+kgdb-bugreport@lfdr.de; Tue, 30 Jul 2019 15:38:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <gregkh@linuxfoundation.org>) id 1hsUCq-000431-JE
 for kgdb-bugreport@lists.sourceforge.net; Tue, 30 Jul 2019 15:38:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sdsCicLmDsdJ3YBbz0feQqVotbm/VMWgwO4HC7HQ4sw=; b=JV2EpxtD0+YOHAt+gdj58kvH5A
 wFouEMBsro6PyqSfPsCRLLYK3Ecm7Ni4O76VrdPZ9Wgoj5bp9vBPcXfvF6Eis1nlge4GyZbNlld4s
 pbu7rvC/waAUrpcZES/iPKq6fA8yUfZ1JVW2qgRZ8n69WQAE7PoUULUsFVGExo7gShaY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sdsCicLmDsdJ3YBbz0feQqVotbm/VMWgwO4HC7HQ4sw=; b=mi/YTNmVSDQz0Yxk5Fx3ZvsGqY
 03fqUXn/kKDiQaXgDTYsQcJlP0S7+Zme/Nt8qzF75Yp+k4oKkIObAUmwYYJtQMtgRT8mFGFk+H+Y2
 v+K9utXVBmUVLa3l2ihSpxY2RF+V8FqVuZmMzKshIfUwK8O0FOqRcYPP7oTWMoyP+yeg=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hsUCo-004rjx-Kd
 for kgdb-bugreport@lists.sourceforge.net; Tue, 30 Jul 2019 15:38:28 +0000
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 854F72089E;
 Tue, 30 Jul 2019 15:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564501101;
 bh=UuPKdfs5BLdDE8f1jc0otSMWO5+pfZcQAJmf6u5hiO4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BUTZZdpnLH5oDMqskfndGqzfqGwHwNTj9ImZuvM0+vMz7og3LiqRye1ZOoK1HHTjC
 0pfepWhSgw6I3ofYY+MMKTKZs7lEojG/MukUlthhf66u67UyXJt4dvpTUJQejIonZK
 I2Tcm8gneESjxPlr2kqdrs3o3FFe5O1TAwGAry1A=
Date: Tue, 30 Jul 2019 17:38:18 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Doug Anderson <dianders@chromium.org>
Message-ID: <20190730153818.GA1025@kroah.com>
References: <20190725183551.169208-1-dianders@chromium.org>
 <20190726091630.GA20016@kroah.com>
 <CAD=FV=WVaksqBE4HBTMZwV1hv6_FJMmAqF+kWBpdfvsHQyRkSA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=FV=WVaksqBE4HBTMZwV1hv6_FJMmAqF+kWBpdfvsHQyRkSA@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hsUCo-004rjx-Kd
Subject: Re: [Kgdb-bugreport] [PATCH] kgdboc: disable the console lock when
 in kgdb
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
 kgdb-bugreport@lists.sourceforge.net,
 Jason Wessel <jason.wessel@windriver.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 LKML <linux-kernel@vger.kernel.org>, linux-serial@vger.kernel.org,
 Jiri Slaby <jslaby@suse.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Fri, Jul 26, 2019 at 09:19:21AM -0700, Doug Anderson wrote:
> Hi,
> 
> On Fri, Jul 26, 2019 at 2:16 AM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Thu, Jul 25, 2019 at 11:35:51AM -0700, Douglas Anderson wrote:
> > > After commit ddde3c18b700 ("vt: More locking checks") kdb / kgdb has
> > > become useless because my console is filled with spews of:
> > >
> > > WARNING: CPU: 0 PID: 0 at .../drivers/tty/vt/vt.c:3846 con_is_visible+0x50/0x74
> > > CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.3.0-rc1+ #48
> > > Hardware name: Rockchip (Device Tree)
> > > Backtrace:
> > > [<c020ce9c>] (dump_backtrace) from [<c020d188>] (show_stack+0x20/0x24)
> > > [<c020d168>] (show_stack) from [<c0a8fc14>] (dump_stack+0xb0/0xd0)
> > > [<c0a8fb64>] (dump_stack) from [<c0232c58>] (__warn+0xec/0x11c)
> > > [<c0232b6c>] (__warn) from [<c0232dc4>] (warn_slowpath_null+0x4c/0x58)
> > > [<c0232d78>] (warn_slowpath_null) from [<c06338a0>] (con_is_visible+0x50/0x74)
> > > [<c0633850>] (con_is_visible) from [<c0634078>] (con_scroll+0x108/0x1ac)
> > > [<c0633f70>] (con_scroll) from [<c0634160>] (lf+0x44/0x88)
> > > [<c063411c>] (lf) from [<c06363ec>] (vt_console_print+0x1a4/0x2bc)
> > > [<c0636248>] (vt_console_print) from [<c02f628c>] (vkdb_printf+0x420/0x8a4)
> > > [<c02f5e6c>] (vkdb_printf) from [<c02f6754>] (kdb_printf+0x44/0x60)
> > > [<c02f6714>] (kdb_printf) from [<c02fa6f4>] (kdb_main_loop+0xf4/0x6e0)
> > > [<c02fa600>] (kdb_main_loop) from [<c02fd5f0>] (kdb_stub+0x268/0x398)
> > > [<c02fd388>] (kdb_stub) from [<c02f3ba0>] (kgdb_cpu_enter+0x1f8/0x674)
> > > [<c02f39a8>] (kgdb_cpu_enter) from [<c02f4330>] (kgdb_handle_exception+0x1c4/0x1fc)
> > > [<c02f416c>] (kgdb_handle_exception) from [<c0210fe0>] (kgdb_compiled_brk_fn+0x30/0x3c)
> > > [<c0210fb0>] (kgdb_compiled_brk_fn) from [<c020d7ac>] (do_undefinstr+0x180/0x1a0)
> > > [<c020d62c>] (do_undefinstr) from [<c0201b44>] (__und_svc_finish+0x0/0x3c)
> > > ...
> > > [<c02f3224>] (kgdb_breakpoint) from [<c02f3310>] (sysrq_handle_dbg+0x58/0x6c)
> > > [<c02f32b8>] (sysrq_handle_dbg) from [<c062abf0>] (__handle_sysrq+0xac/0x154)
> > >
> > > Let's disable this warning when we're in kgdb to avoid the spew.  The
> > > whole system is stopped when we're in kgdb so we can't exactly wait
> > > for someone else to drop the lock.  Presumably the best we can do is
> > > to disable the warning and hope for the best.
> > >
> > > Fixes: ddde3c18b700 ("vt: More locking checks")
> > > Cc: Daniel Vetter <daniel.vetter@intel.com>
> > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > ---
> > >
> > >  drivers/tty/serial/kgdboc.c | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git a/drivers/tty/serial/kgdboc.c b/drivers/tty/serial/kgdboc.c
> > > index bfe5e9e034ec..c7d51b51898f 100644
> > > --- a/drivers/tty/serial/kgdboc.c
> > > +++ b/drivers/tty/serial/kgdboc.c
> > > @@ -277,10 +277,14 @@ static void kgdboc_pre_exp_handler(void)
> > >       /* Increment the module count when the debugger is active */
> > >       if (!kgdb_connected)
> > >               try_module_get(THIS_MODULE);
> > > +
> > > +     atomic_inc(&ignore_console_lock_warning);
> > >  }
> > >
> > >  static void kgdboc_post_exp_handler(void)
> > >  {
> > > +     atomic_dec(&ignore_console_lock_warning);
> > > +
> > >       /* decrement the module count when the debugger detaches */
> > >       if (!kgdb_connected)
> > >               module_put(THIS_MODULE);
> > > --
> > > 2.22.0.709.g102302147b-goog
> >
> > I have the following patch in my tree to go to Linus that I think might
> > fix this issue for you.  Can you test it instead?
> >
> > thanks,
> >
> > greg k-h
> >
> > -----------------
> >
> >
> > From 61d51456f35760a09e8aa1e6ddd247f1547015d3 Mon Sep 17 00:00:00 2001
> > From: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Date: Thu, 18 Jul 2019 10:09:03 +0200
> > Subject: [PATCH] vt: Grab console_lock around con_is_bound in show_bind
> >
> > Not really harmful not to, but also not harm in grabbing the lock. And
> > this shuts up a new WARNING I introduced in commit ddde3c18b700 ("vt:
> > More locking checks").
> >
> > Reported-by: Jens Remus <jremus@linux.ibm.com>
> > Cc: linux-kernel@vger.kernel.org
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: linux-fbdev@vger.kernel.org
> > Cc: linux-s390@vger.kernel.org
> > Cc: Nicolas Pitre <nicolas.pitre@linaro.org>
> > Cc: Martin Hostettler <textshell@uchuujin.de>
> > Cc: Adam Borowski <kilobyte@angband.pl>
> > Cc: Mikulas Patocka <mpatocka@redhat.com>
> > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Cc: Sam Ravnborg <sam@ravnborg.org>
> > Fixes: ddde3c18b700 ("vt: More locking checks")
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Tested-by: Jens Remus <jremus@linux.ibm.com>
> > Acked-by: Sam Ravnborg <sam@ravnborg.org>
> > Link: https://lore.kernel.org/r/20190718080903.22622-1-daniel.vetter@ffwll.ch
> > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > ---
> >  drivers/tty/vt/vt.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/tty/vt/vt.c b/drivers/tty/vt/vt.c
> > index ec92f36ab5c4..34aa39d1aed9 100644
> > --- a/drivers/tty/vt/vt.c
> > +++ b/drivers/tty/vt/vt.c
> > @@ -3771,7 +3771,11 @@ static ssize_t show_bind(struct device *dev, struct device_attribute *attr,
> >                          char *buf)
> >  {
> >         struct con_driver *con = dev_get_drvdata(dev);
> > -       int bind = con_is_bound(con->con);
> > +       int bind;
> > +
> > +       console_lock();
> > +       bind = con_is_bound(con->con);
> > +       console_unlock();
> >
> >         return snprintf(buf, PAGE_SIZE, "%i\n", bind);
> >  }
> 
> Thanks for checking.  I had actually noticed that patch (I searched
> the mailing lists for the short git hash of the commit that broke me
> and found it) and had decided it wouldn't fix my problems.
> Specifically I think it could only possibly fix things if the function
> show_bind() was somewhere in my stack trace.  ...and it isn't.
> 
> ...but after your message I decided to be extra super sure.  I tried:
> 
> 1. Going back to mainline commit 6789f873ed37 ("Merge tag 'pm-5.3-rc2'
> of git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm") and
> picking commit 61d51456f357 ("vt: Grab console_lock around
> con_is_bound in show_bind") from linuxnext.  It didn't fix my problem.
> 
> 2. Going to next-20190726.  It didn't fix my problem.
> 
> ...so indeed my patch addresses a different issue than the one you
> pointed to, even if both fix problems introduced by the same commit.

Thanks for testing, I'll go queue this up now.

greg k-h


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
