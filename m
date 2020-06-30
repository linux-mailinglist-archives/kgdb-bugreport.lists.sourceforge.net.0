Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2165920EE10
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 30 Jun 2020 08:09:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jq9Sm-0005kd-UG
	for lists+kgdb-bugreport@lfdr.de; Tue, 30 Jun 2020 06:09:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1jq9Sl-0005kW-Li
 for kgdb-bugreport@lists.sourceforge.net; Tue, 30 Jun 2020 06:09:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oXdK77lNUDusP4FRYvdXH3nYySFezAr/kCJUG+LcUW0=; b=OFHVsoM6BBiodPpIqwx0JYJTtT
 kV9+Ayp5+mNvq+5IYg64ZIlOlTNCYgWrOUe+LvOYrvuCBsnYUYOdwwyavVA5MoDF+7krbhYk5/lFV
 8SdYf3VDeadMBLB+mKpDSoymogXArUQ5Pa3Eu88Mb0gtnolB5OWQNKk6WXKaSlR/mGtk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oXdK77lNUDusP4FRYvdXH3nYySFezAr/kCJUG+LcUW0=; b=Y426hIGTxm7IPOrtSEEiC04DcW
 6paGM6umywRQuRCIgQ6P7MRna7jaRzlKUfvEB10usPSlwWazAnEARiZurnayTciy8mxHkxxiySzxY
 YL5VBpx3EgBFcV3I5Hs9TrGvuzAKvLzJJcR9OiFbRvfi1X33yXFyZhsBDgOMJDeXBKMU=;
Received: from mail-lj1-f193.google.com ([209.85.208.193])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jq9Se-002g4P-GM
 for kgdb-bugreport@lists.sourceforge.net; Tue, 30 Jun 2020 06:09:47 +0000
Received: by mail-lj1-f193.google.com with SMTP id s1so21051160ljo.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 29 Jun 2020 23:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oXdK77lNUDusP4FRYvdXH3nYySFezAr/kCJUG+LcUW0=;
 b=iAxzF4vBzuBy0/QV3Nn58POBTjf+maM2qt0XPp0Y6h50d25HA4S9XvpIUfJiPPhbhV
 D+uMUz/PcSm9lSCHw1/o2uqHnEwe8wPi4R1SVYqgaJ7azdV6deOAbn/7JtebqwMrXjLx
 8gciILyd77r8Yu4p2rL7WWrYX2ER6TW7hG8lmqyYJKNtBO9y3MSroxZ5spO/KDHfkE8E
 Gu61IplfvgRt1qmiHql3GAjY3x7WfLhGmyy8xWGEcqD7TmMRDAGTL7bL3/G7i1i0s5iI
 Q8yFph+iocF9bL2ACgKCh6vIhFFJ6Zqe1NIIwIayP1h1n7fCYdzXK5XgxWdnW3fGmbLk
 WC9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oXdK77lNUDusP4FRYvdXH3nYySFezAr/kCJUG+LcUW0=;
 b=W/5CkIZQlAaKW3vimWMBp9mJBTJO/AlcbhBHSOg5aOPsjimdCdq3+vbvQUXkq9og4q
 KJLoxdTohuuVpA8DGGNTSbbY5zxHvSJ3TNZgb5HnP4fBGelsMbOvgLYcjlpXPv8P1N98
 qxPbOO/l+XIIpdIbb/L1dwg6mx7zZVX7lsycsKe0BhIuX8eQNQMgRB0APKtL4joZY1Wr
 +URrZU/zjCQu+Lay/CU+L68QsNGBCDCV6uLH29suaEIYUHlKUxqZRCXwzRkPPxFbTTuU
 UpctQfNSYgN/PvNVXWe49n3CXJuWRCK98GFRnvNmjP0Yt8dTNg5Ul/wsHOnfrAywqt6m
 5KNw==
X-Gm-Message-State: AOAM530dSZh0SrRrqgmRrZ5iBF+Dxgcn3EG4a/uw1JwSAZpjgnrceZ5g
 Qz2XB0OYV7mFzBEVyPO+fAG87entvzrKwMNSaIzLLQ==
X-Google-Smtp-Source: ABdhPJxWXOrxS/lf4Xen8LBgZNkcQ0tSmdYWmZef4sjTUy3Y+VbgDi2Tel4l2BAvFo3ICLI2Ypj8KLp0sHCPWQ0rdbg=
X-Received: by 2002:a2e:740d:: with SMTP id p13mr9129454ljc.372.1593497373796; 
 Mon, 29 Jun 2020 23:09:33 -0700 (PDT)
MIME-Version: 1.0
References: <1592835984-28613-1-git-send-email-sumit.garg@linaro.org>
 <1592835984-28613-4-git-send-email-sumit.garg@linaro.org>
 <20200622160300.avgfhnfkpqzqqtsr@holly.lan>
 <CAFA6WYOmQT-OQvjpy1pVPq2mx5S264bJPd-XfwnDY2BjeoWekg@mail.gmail.com>
 <20200623105934.wvyidi3xgqgd35af@holly.lan>
 <CAD=FV=XHZT9ud0Ze1pDvz-kQy7FMFzd9T6+jM5URt1k5BwQ15g@mail.gmail.com>
 <20200629114501.7aq547dzo6o2abrt@holly.lan>
In-Reply-To: <20200629114501.7aq547dzo6o2abrt@holly.lan>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Tue, 30 Jun 2020 11:39:21 +0530
Message-ID: <CAFA6WYN3iAON1m9RMVs6W8Vi0bw0=2az-czLo+6QeavFKdDD-w@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>,
 Doug Anderson <dianders@chromium.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.193 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.193 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jq9Se-002g4P-GM
Subject: Re: [Kgdb-bugreport] [PATCH 3/7] kgdb: Add request_nmi() to the io
 ops table for kgdboc
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
 Jason Wessel <jason.wessel@windriver.com>,
 Russell King - ARM Linux admin <linux@armlinux.org.uk>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-serial@vger.kernel.org, Jiri Slaby <jslaby@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Mon, 29 Jun 2020 at 17:15, Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> On Fri, Jun 26, 2020 at 12:44:15PM -0700, Doug Anderson wrote:
> > Hi,
> >
> > On Tue, Jun 23, 2020 at 3:59 AM Daniel Thompson
> > <daniel.thompson@linaro.org> wrote:
> > >
> > > On Tue, Jun 23, 2020 at 02:07:47PM +0530, Sumit Garg wrote:
> > > > On Mon, 22 Jun 2020 at 21:33, Daniel Thompson
> > > > <daniel.thompson@linaro.org> wrote:
> > > > > > +     irq_set_status_flags(irq, IRQ_NOAUTOEN);
> > > > > > +     res = request_nmi(irq, fn, IRQF_PERCPU, "kgdboc", dev_id);
> > > > >
> > > > > Why do we need IRQF_PERCPU here. A UART interrupt is not normally
> > > > > per-cpu?
> > > > >
> > > >
> > > > Have a look at this comment [1] and corresponding check in
> > > > request_nmi(). So essentially yes UART interrupt is not normally
> > > > per-cpu but in order to make it an NMI, we need to request it in
> > > > per-cpu mode.
> > > >
> > > > [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/kernel/irq/manage.c#n2112
> > >
> > > Thanks! This is clear.
> > >
> > > > > > +     if (res) {
> > > > > > +             res = request_irq(irq, fn, IRQF_SHARED, "kgdboc", dev_id);
> > > > >
> > > > > IRQF_SHARED?
> > > > >
> > > > > Currrently there is nothing that prevents concurrent activation of
> > > > > ttyNMI0 and the underlying serial driver. Using IRQF_SHARED means it
> > > > > becomes possible for both drivers to try to service the same interrupt.
> > > > > That risks some rather "interesting" problems.
> > > > >
> > > >
> > > > Could you elaborate more on "interesting" problems?
> > >
> > > Er... one of the serial drivers we have allowed the userspace to open
> > > will, at best, be stone dead and not passing any characters.
> > >
> > >
> > > > BTW, I noticed one more problem with this patch that is IRQF_SHARED
> > > > doesn't go well with IRQ_NOAUTOEN status flag. Earlier I tested it
> > > > with auto enable set.
> > > >
> > > > But if we agree that both shouldn't be active at the same time due to
> > > > some real problems(?) then I can rid of IRQF_SHARED as well. Also, I
> > > > think we should unregister underlying tty driver (eg. /dev/ttyAMA0) as
> > > > well as otherwise it would provide a broken interface to user-space.
> > >
> > > I don't have a particular strong opinion on whether IRQF_SHARED is
> > > correct or not correct since I think that misses the point.
> > >
> > > Firstly, using IRQF_SHARED shows us that there is no interlocking
> > > between kgdb_nmi and the underlying serial driver. That probably tells
> > > us about the importance of the interlock than about IRQF_SHARED.
> > >
> > > To some extent I'm also unsure that kgdb_nmi could ever actually know
> > > the correct flags to use in all cases (that was another reason for the
> > > TODO comment about poll_get_irq() being a bogus API).
> >
> > I do wonder a little bit if the architecture of the "kgdb_nmi_console"
> > should change.  I remember looking at it in the past and thinking it a
> > little weird that if I wanted to get it to work I'd need to change my
> > "console=" command line to go through this new driver and (I guess)
> > change the agetty I have running on my serial port to point to
> > ttyNMI0.  Is that how it's supposed to work?  Then if I want to do a
> > build without kgdb then I need to go in and change my agetty to point
> > back at my normal serial port?
> >
> > It kinda feels like a better way to much of what the driver does would be to:
> >
> > 1. Allow kgdb to sniff incoming serial bytes on a port and look for
> > its characters.  We already have this feature in the kernel to a small
> > extent for sniffing a break / sysrq character.
> >
> > 2. If userspace doesn't happen to have the serial port open then
> > ideally we could open the port (using all the standard APIs that
> > already exist) from in the kernel and just throw away all the bytes
> > (since we already sniffed them).  As soon as userspace tried to open
> > the port when it would get ownership and if userspace ever closed the
> > port then we'd start reading / throwing away bytes again.
> >
> > If we had a solution like that:
> >
> > a) No serial drivers would need to change.
> >
> > b) No kernel command line parameters would need to change.
> >
> > Obviously that solution wouldn't magically get you an NMI, though.
> > For that I'd presume the right answer would be to add a parameter for
> > each serial driver that can support it to run its rx interrupt in NMI
> > mode.
>

Thanks Doug for the suggestions.

> ... or allow modal changes to the uart driver when kgdboc comes up?
>
> We already allow UART drivers to de-optimize themselves and use
> different code paths when polling is enabled so its not totally crazy
> ;-).
>
>
> > Of course, perhaps I'm just confused and crazy and the above is a
> > really bad idea.
>
> Thanks for bringing this up.
>
> Sumit and I were chatting last week and our discussion went in a similar
> direction (I think not exactly the same which is why it is good to
> see your thoughts too).
>
> Personally I think it comes down to how intrusive adding NMI support is
> to serial drivers. kgdb_nmi is rather hacky and feels a bit odd to
> enable. It is clearly intended to avoid almost all changes to the UART
> driver. On our side we have been wondering whether the serial core can
> add helpers to make it easy for a serial driver to implement an simple,
> safe but not optimal NMI implementation. Making it easy to have
> safety-first might make NMI more palatable.
>

I am currently working on a PoC in this direction and hopeful to come
up with least intrusive NMI support to serial drivers.

>
> > Speaking of confused: is there actually any way to use the existing
> > kgdb NMI driver (CONFIG_SERIAL_KGDB_NMI) in mainline without out of
> > tree patches?  When I looked before I assumed it was just me that was
> > outta luck because I didn't have NMI at the time, but I just did some
> > grepping and I can't find anyplace in mainline where
> > "arch_kgdb_ops.enable_nmi" would not be NULL.  Did I miss it, or do we
> > need out-of-tree patches to enable this?
>
> Out-of-tree...

Yeah and this patch-set derived from Daniel's work was one of them.

>
> If, after looking at other approaches, we do all agree to nuke kgdb_nmi
> then there shouldn't be much impediment (nor that many tears).
>

Makes sense.

-Sumit

>
> Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
