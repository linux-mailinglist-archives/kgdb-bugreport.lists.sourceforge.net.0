Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8931C38CC
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  4 May 2020 14:02:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jVZnb-0000kR-4l
	for lists+kgdb-bugreport@lfdr.de; Mon, 04 May 2020 12:02:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1jVZna-0000kB-1x
 for kgdb-bugreport@lists.sourceforge.net; Mon, 04 May 2020 12:02:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Gs1xFmz+UQYje3/SUc1v/efQgEXN1iSiEOtB3UyExs4=; b=PAR+B7rpXeDij7LGQZyrPs/a8v
 JKB2H91SJoRdQKMccqW5qztXSXHqF0pf4rXtdeheTHYklSnAOfYdgxLNZr8MmqTmScqKcebCk6f2P
 3Q4aPd6OoQkH246bwUlChocMmVPDWCpvE4RPCDXyC5J1lvDIl9p+mhXF+40OY+eYxRns=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Gs1xFmz+UQYje3/SUc1v/efQgEXN1iSiEOtB3UyExs4=; b=eV/dUjQpAMftrzANOkKNs6JZ33
 MnYfH38F20xBzLOleXN+jxZoeY13Yj3Ref1syTXSWt57pLBhMy54vuSDOCOrw8M6GN2WkdLuT+6Cu
 7A2AmDMwYrY5IkUHhIp+qZ0TwYo1HqMp/YxdDwk1BHze2A/huC+5eT7Dz99SlRvFQotE=;
Received: from mail-wr1-f66.google.com ([209.85.221.66])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jVZnV-006iUa-Jp
 for kgdb-bugreport@lists.sourceforge.net; Mon, 04 May 2020 12:02:13 +0000
Received: by mail-wr1-f66.google.com with SMTP id f13so20541483wrm.13
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 04 May 2020 05:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Gs1xFmz+UQYje3/SUc1v/efQgEXN1iSiEOtB3UyExs4=;
 b=Fl/W5MFN8DSWpViiz3IyhXwTpVMRhy6AlYeDekcWA2Ltc7Lu+qyw1BD2deXrCzXtR8
 Mu4LcreMgqQiD+ELQdJ4k+F92j9aVUTpv09kwZlOEKtmC2BBCWDO0kdPtXDPXPIsWMUV
 Sq9YqZoktFk0sS+IFHhiB69/k0YsUH0Uh5mL+ZbPVOOed0wnI+3RDkXSRqAdu1TVFTAE
 gZFvlg+vDS+PGkqzBiVcywpMym3Ez4YZ5jlew8IYKvMfJUTJEXD//S24uCqwTY+3JQXk
 aVy92IdBdFYVAwyVEI1XANYFil4ifFzc+68lrH18fE54Q48dTo6ZuQK49PGwWwbP94LV
 Q+gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Gs1xFmz+UQYje3/SUc1v/efQgEXN1iSiEOtB3UyExs4=;
 b=DewRgZZ9CjrVB63Zyi+q+0VDhnuYqXxcsUiaG5VluS8bktDynTNhIoygv27XS9A32W
 ymSIzWCprQ9ZPD5/+Y19Nk/bKlreW5lAULcj+YQRhUSAPQPgEsoxNjuMnPc2nLvohyx7
 BFF8q/tTeIxKFOJoQa8h/5s5e+qNT0xlYNGWRckPLu+3bBlNgoZ5MWYVstVUcjkU0U+s
 l9rY6HKlEisaYO09I+MXL+xvKsBEVNJolHNr5L+dMImjjDcq7bZIJeF3X9qFoZ1/lCiZ
 cDxj0bA9sttU6INV8nnooMrXDwzcCqu/BeU3EGsCWC/eTeJTANoUs/XOFdMCTFFyh+6m
 Xwmw==
X-Gm-Message-State: AGi0Pub4BblCOC4MLAgccBO923RYng5QHFCLJlGwz+TCBXE+E/XGZ8hM
 OJKn7GxBpcf/iqJ7lAzn+JCz/jcgAuMp+Q==
X-Google-Smtp-Source: APiQypJegcKZF/wweQ1RYqZk0HgHdf1LG8GEMgO8/vhPHmxPS+9FXmlsw+ezmIS+Gv8y0QK3+eOHbw==
X-Received: by 2002:a5d:658e:: with SMTP id q14mr19745201wru.92.1588593223069; 
 Mon, 04 May 2020 04:53:43 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id b22sm12935177wmj.1.2020.05.04.04.53.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2020 04:53:41 -0700 (PDT)
Date: Mon, 4 May 2020 12:53:39 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Doug Anderson <dianders@chromium.org>
Message-ID: <20200504115339.ndi3n4evklzidvb5@holly.lan>
References: <20200430095819.1.Id37f71c69eb21747b9d9e2c7c242be130814b362@changeid>
 <20200501114943.ioetuxe24gi27bll@holly.lan>
 <20200501133202.GA2402281@wychelm.lan>
 <CAD=FV=WKKCkr1va9S+ygL7XuOvSm12-qw4dCSo=FBtyXx4JvhQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=FV=WKKCkr1va9S+ygL7XuOvSm12-qw4dCSo=FBtyXx4JvhQ@mail.gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.66 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.66 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jVZnV-006iUa-Jp
Subject: Re: [Kgdb-bugreport] [PATCH] kgdboc: Be a bit more robust about
 handling earlycon leaving
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 kgdb-bugreport@lists.sourceforge.net,
 Jason Wessel <jason.wessel@windriver.com>, LKML <linux-kernel@vger.kernel.org>,
 linux-serial@vger.kernel.org, Jiri Slaby <jslaby@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Fri, May 01, 2020 at 10:36:14AM -0700, Doug Anderson wrote:
> Hi,
> 
> On Fri, May 1, 2020 at 6:32 AM Daniel Thompson
> <daniel.thompson@linaro.org> wrote:
> >
> > On Fri, May 01, 2020 at 12:49:43PM +0100, Daniel Thompson wrote:
> > > On Thu, Apr 30, 2020 at 09:59:09AM -0700, Douglas Anderson wrote:
> > > > The original implementation of kgdboc_earlycon included a comment
> > > > about how it was impossible to get notified about the boot console
> > > > going away without making changes to the Linux core.  Since folks
> > > > often don't want to change the Linux core for kgdb's purposes, the
> > > > kgdboc_earlycon implementation did a bit of polling to figure out when
> > > > the boot console went away.
> > > >
> > > > It turns out, though, that it is possible to get notified about the
> > > > boot console going away.  The solution is either clever or a hack
> > > > depending on your viewpoint.  ...or, perhaps, a clever hack.  All we
> > > > need to do is head-patch the "exit" routine of the boot console.  We
> > > > know that "struct console" must be writable because it has a "next"
> > > > pointer in it, so we can just put our own exit routine in, do our
> > > > stuff, and then call back to the original.
> > >
> > > I think I'm in the hack camp on this one!
> > >
> > >
> > > > This works great to get notified about the boot console going away.
> > > > The (slight) problem is that in the context of the boot console's exit
> > > > routine we can't call tty_find_polling_driver().
> > >
> > > I presume this is something to do with the tty_mutex?
> > > > We solve this by
> > > > kicking off some work on the system_wq when we get notified and this
> > > > works pretty well.
> > >
> > > There are some problems with the workqueue approach.
> >
> > ... so did a couple of experiments to avoid the workqueue.
> >
> > It occured to me that, since we have interfered with deinit() then the
> > console hasn't actually been uninitialized meaning we could still use it.
> > This does exposes us to risks similar to keep_bootcon but in exchange
> > there is no window where kgdb is broken (and no need to panic).
> >
> > My prototype is minimal but I did wonder about ripping out all the
> > code to defend against removal of the earlycon and simply keep the
> > earlycon around until a new kgdbio handler is installed.
> 
> It took me a little while, but I finally see what you're saying.
> You're saying that we keep calling into the boot console even though
> it's no longer in the list of consoles.  Then we temporarily disable
> the boot console's exit routine until kgdb_earlycon() is done.  (side
> note: the exit routine was recently added and probably most consoles
> don't use it).

Certainly none of the devices with a read() method have an exit().


> OK, that doesn't seem totally insane.  It actually works OK for you?

I tested on qemu/x86-64 (8250) and qemu/arm64 (pl011). In both cases it
works well.


> It's probably at least worth a warning in the log if we detect that
> we're using the boot console and it's not in the console list anymore.
> Then if kgdb starts misbehaving someone might have a clue.

Yes, I'll add that.


> If your solution is OK we might also want to remove the call to
> cleanup_earlycon_if_invalid() in configure_kgdboc() too.

That's what I thought, yes. Although it might be best to handle that
by ripping it out of the original patch set.


> I think you might win the "hackiest solution" prize, but your solution
> definitely does seem better because I can't think of any other good
> way to handle people whose consoles register a long time before their
> tty.  ;-)

That's not a prize I was especially anxious to win...

However the results seem quite pleasing from a user point of view:
*if* we hit a breakpoint then the system really will be leaving no
stone unturned in its attempt to have talk (and listen) to the user.

If we want things to avoid hacking at the console structure  we could
provide a direct function call API from earlycon to kgdboc so we limit
earlycon_kgdboc so it can *only* attach to the earlycon (and either
defer the exit() or leave a comment in earlycon so that if exit() were
ever added it doesn't break kgdboc).


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
