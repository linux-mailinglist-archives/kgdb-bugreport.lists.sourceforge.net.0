Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5919524665F
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 17 Aug 2020 14:29:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1k7eGV-00075F-5v
	for lists+kgdb-bugreport@lfdr.de; Mon, 17 Aug 2020 12:29:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1k7eGT-00074b-P3
 for kgdb-bugreport@lists.sourceforge.net; Mon, 17 Aug 2020 12:29:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kaS9QGr/CoVL2sSV275Tul/9GvZ4IxXLL+meMexP+eg=; b=cLjPZdqtum6FAH2wOEQ9lk9TOa
 ZN7PLpSvT3UUqwMhT/JkgWqc7NCfWl/1Gt2cSDRhl41zwXs4OR5lg5zcpH7IXul03q/QJqJJ1pUP/
 XWi1WmYi4MsoeghHDnr/DsnEsRdqL49B317aa9ODcUImNTX4C1s4VmV5I/My3MoBoWSE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kaS9QGr/CoVL2sSV275Tul/9GvZ4IxXLL+meMexP+eg=; b=hbuesuBNEospNt5pNMAM5o66r+
 GewapI/+z49a27HFsLEUS5c4iBf3BLeLNe7jWMImQHTKGeVmRyteCDLo3Vep2t0mx/0ZsuedtQMLY
 3i1oUwFc7Ao2PQrdgw4UOo4ZcbHbYXvYckiosJdQyCgXk7W2a3/SMfv0UBER4znfJjU4=;
Received: from mail-lj1-f196.google.com ([209.85.208.196])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1k7eGP-00H3hc-JW
 for kgdb-bugreport@lists.sourceforge.net; Mon, 17 Aug 2020 12:29:25 +0000
Received: by mail-lj1-f196.google.com with SMTP id h19so17234777ljg.13
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 17 Aug 2020 05:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kaS9QGr/CoVL2sSV275Tul/9GvZ4IxXLL+meMexP+eg=;
 b=JrkF1v5GRUEC2PkvtUTHwlReaCu7YQgc+YTXcxfj7rn/lcJVaYSnogIyX9TJnW3uwo
 88NNquO2upSOLuEi0fFBrL97SBHRI1GrNf9LEl0wUBsdO8Odnx5RmSKFb4nWHwCcjCTA
 kUpfEMpcTJj2GmlgUkuf/ExfqiL6+S6xWQXYwdO3X91RDW5IXmH6I5UBZ8HlYrMstETJ
 4Agk10IcnHSys3q2qkNUGniPWa9wK+/FcvK/SlhSrXuoL3136FFoZ4fAnRzdzCo7X9B9
 lbkFh4kCkKgk0RHiKm5wSkcnmNcXQp9t9oaSKpTWpO5x5jk+dFTI2B4hRRHF6uTA2E1j
 HKUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kaS9QGr/CoVL2sSV275Tul/9GvZ4IxXLL+meMexP+eg=;
 b=W35VqBigxGcZ0Km216agboHBEUj6br49LQMzGZKjY3R38PlNOjaEA9Pm7quq8gjO6S
 vOFE3G4D4CmNMIHD2MpDwel9Qht50nJVLL8MRpfJv7Z/BpJHwM1EisQhbA29ZC4g7663
 dE/Igj1YvQyOP116E1hCe16zbvXfOsc5GJ/0+gb2wOmzkcee1T/N3wk0jCZLuIhwOCM/
 t9OSw/vL3IQKgXdsEHarmJ2eJDribt1A3IvC6m4bwL3EaOTA2mfZZgl0crc0jX9P96Pg
 MieJKDoi/U91CeEzwtRnQTJtMFPJdW4S0YmtE9Nq1L/sXSkmCg8zmKJ+O11pvCeAV7tB
 M/CA==
X-Gm-Message-State: AOAM531o3Me/i/8GfjJ0x1Gz0kw58JuW663xEIdFHQL5DGlfpA//NGa6
 BjPhskf5NqDPYTtT4i8F+OsoymZK2EhFE5h5EZ6TJbnAgnA=
X-Google-Smtp-Source: ABdhPJxycajF68k7LfbWmGKMEmchQ5vYrDZoKIW7NZDRjvDhKjzMA+vUCrbjICqJuG9WgO/B1/FzG0EDVSoe2KCqce8=
X-Received: by 2002:a2e:b6cc:: with SMTP id m12mr6559788ljo.256.1597667354932; 
 Mon, 17 Aug 2020 05:29:14 -0700 (PDT)
MIME-Version: 1.0
References: <1595333413-30052-1-git-send-email-sumit.garg@linaro.org>
 <1595333413-30052-3-git-send-email-sumit.garg@linaro.org>
 <CAD=FV=XUNqun3d+C_7GpgntGWRXwLSLnXKStLUz8iqZoGKu8zg@mail.gmail.com>
 <CAFA6WYNq-Z5WD=AqJn2_DEg0F6G1CYte2y5Snc964vsgCnr0Bw@mail.gmail.com>
 <CAD=FV=Vu3PGSUzargD-6e2XOw=Eh7CZaQ_+a09dr8SR1T8eE2g@mail.gmail.com>
 <CAFA6WYPJ_w+R15NRKK5BzZtTxKq8Gh_mGswuYbW0cYZoBYLhxw@mail.gmail.com>
 <CAD=FV=XA91CcyGMHKmnMG4LD7HO1d65Fuq3nDWDH_NKPOh+n3Q@mail.gmail.com>
In-Reply-To: <CAD=FV=XA91CcyGMHKmnMG4LD7HO1d65Fuq3nDWDH_NKPOh+n3Q@mail.gmail.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Mon, 17 Aug 2020 17:59:03 +0530
Message-ID: <CAFA6WYMAza8bJtow3_+8PEeXgHFym-6CHt73ePi5tMnW-jr26g@mail.gmail.com>
To: Doug Anderson <dianders@chromium.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.196 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.196 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1k7eGP-00H3hc-JW
Subject: Re: [Kgdb-bugreport] [RFC 2/5] serial: core: Add framework to allow
 NMI aware serial drivers
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 LKML <linux-kernel@vger.kernel.org>, linux-serial@vger.kernel.org,
 Jiri Slaby <jslaby@suse.com>, kgdb-bugreport@lists.sourceforge.net,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Fri, 14 Aug 2020 at 20:14, Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Fri, Aug 14, 2020 at 4:17 AM Sumit Garg <sumit.garg@linaro.org> wrote:
> >
> > On Thu, 13 Aug 2020 at 20:08, Doug Anderson <dianders@chromium.org> wrote:
> > >
> > > Hi,
> > >
> > > On Thu, Aug 13, 2020 at 7:19 AM Sumit Garg <sumit.garg@linaro.org> wrote:
> > > >
> > > > On Thu, 13 Aug 2020 at 05:29, Doug Anderson <dianders@chromium.org> wrote:
> > > > >
> > > > > Hi,
> > > > >
> > > > > On Tue, Jul 21, 2020 at 5:11 AM Sumit Garg <sumit.garg@linaro.org> wrote:
> > > > > >
> > > > > > Add NMI framework APIs in serial core which can be leveraged by serial
> > > > > > drivers to have NMI driven serial transfers. These APIs are kept under
> > > > > > CONFIG_CONSOLE_POLL as currently kgdb initializing uart in polling mode
> > > > > > is the only known user to enable NMI driven serial port.
> > > > > >
> > > > > > The general idea is to intercept RX characters in NMI context, if those
> > > > > > are specific to magic sysrq then allow corresponding handler to run in
> > > > > > NMI context. Otherwise defer all other RX and TX operations to IRQ work
> > > > > > queue in order to run those in normal interrupt context.
> > > > > >
> > > > > > Also, since magic sysrq entry APIs will need to be invoked from NMI
> > > > > > context, so make those APIs NMI safe via deferring NMI unsafe work to
> > > > > > IRQ work queue.
> > > > > >
> > > > > > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> > > > > > ---
> > > > > >  drivers/tty/serial/serial_core.c | 120 ++++++++++++++++++++++++++++++++++++++-
> > > > > >  include/linux/serial_core.h      |  67 ++++++++++++++++++++++
> > > > > >  2 files changed, 185 insertions(+), 2 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/tty/serial/serial_core.c b/drivers/tty/serial/serial_core.c
> > > > > > index 57840cf..6342e90 100644
> > > > > > --- a/drivers/tty/serial/serial_core.c
> > > > > > +++ b/drivers/tty/serial/serial_core.c
> > > > > > @@ -3181,8 +3181,14 @@ static bool uart_try_toggle_sysrq(struct uart_port *port, unsigned int ch)
> > > > > >                 return true;
> > > > > >         }
> > > > > >
> > > > > > +#ifdef CONFIG_CONSOLE_POLL
> > > > > > +       if (in_nmi())
> > > > > > +               irq_work_queue(&port->nmi_state.sysrq_toggle_work);
> > > > > > +       else
> > > > > > +               schedule_work(&sysrq_enable_work);
> > > > > > +#else
> > > > > >         schedule_work(&sysrq_enable_work);
> > > > > > -
> > > > > > +#endif
> > > > >
> > > > > It should be a very high bar to have #ifdefs inside functions.  I
> > > > > don't think this meets it.  Instead maybe something like this
> > > > > (untested and maybe slightly wrong syntax, but hopefully makes
> > > > > sense?):
> > > > >
> > > > > Outside the function:
> > > > >
> > > > > #ifdef CONFIG_CONSOLE_POLL
> > > > > #define queue_port_nmi_work(port, work_type)
> > > > > irq_work_queue(&port->nmi_state.work_type)
> > > > > #else
> > > > > #define queue_port_nmi_work(port, work_type)
> > > > > #endif
> > > > >
> > > > > ...and then:
> > > > >
> > > > > if (IS_ENABLED(CONFIG_CONSOLE_POLL) && in_nmi())
> > > > >   queue_port_nmi_work(port, sysrq_toggle_work);
> > > > > else
> > > > >   schedule_work(&sysrq_enable_work);
> > > > >
> > > > > ---
> > > > >
> > > > > The whole double-hopping is really quite annoying.  I guess
> > > > > schedule_work() can't be called from NMI context but can be called
> > > > > from IRQ context?  So you need to first transition from NMI context to
> > > > > IRQ context and then go and schedule the work?  Almost feels like we
> > > > > should just fix schedule_work() to do this double-hop for you if
> > > > > called from NMI context.  Seems like you could even re-use the list
> > > > > pointers in the work_struct to keep the queue of people who need to be
> > > > > scheduled from the next irq_work?  Worst case it seems like you could
> > > > > add a schedule_work_nmi() that would do all the hoops for you.  ...but
> > > > > I also know very little about NMI so maybe I'm being naive.
> > > > >
> > > >
> > > > Thanks for this suggestion and yes indeed we could make
> > > > schedule_work() NMI safe and in turn get rid of all this #ifdefs. Have
> > > > a look at below changes:
> > > >
> > > > diff --git a/include/linux/workqueue.h b/include/linux/workqueue.h
> > > > index 26de0ca..1daf1b4 100644
> > > > --- a/include/linux/workqueue.h
> > > > +++ b/include/linux/workqueue.h
> > > > @@ -14,6 +14,7 @@
> > > >  #include <linux/atomic.h>
> > > >  #include <linux/cpumask.h>
> > > >  #include <linux/rcupdate.h>
> > > > +#include <linux/irq_work.h>
> > > >
> > > >  struct workqueue_struct;
> > > >
> > > > @@ -106,6 +107,7 @@ struct work_struct {
> > > >  #ifdef CONFIG_LOCKDEP
> > > >         struct lockdep_map lockdep_map;
> > > >  #endif
> > > > +       struct irq_work iw;
> > >
> > > Hrm, I was thinking you could just have a single queue per CPU then
> > > you don't need to add all this extra data to every single "struct
> > > work_struct".  I was thinking you could use the existing list node in
> > > the "struct work_struct" to keep track of the list of things.  ...but
> > > maybe my idea this isn't actually valid because the linked list might
> > > be in use if we're scheduling work that's already pending / running?
> > >
> > > In any case, I worry that people won't be happy with the extra
> > > overhead per "struct work_struct".  Can we reduce it at all?  It still
> > > does feel like you could get by with a single global queue and thus
> > > you wouldn't need to store the function pointer and flags with every
> > > "struct work_struct", right?  So all you'd need is a single pointer
> > > for the linked list?  I haven't actually tried implementing this,
> > > though, so I could certainly be wrong.
> >
> > Let me try to elaborate here:
> >
> > Here we are dealing with 2 different layers of deferring work, one is
> > irq_work (NMI safe) using "struct irq_work" and other is normal
> > workqueue (NMI unsafe) using "struct work_struct".
> >
> > So when we are in NMI context, the only option is to use irq_work to
> > defer work and need to pass reference to "struct irq_work". Now in
> > following irq_work function:
> >
> > +void queue_work_nmi(struct irq_work *iw)
> > +{
> > +       struct work_struct *work = container_of(iw, struct work_struct, iw);
> > +
> > +       queue_work(system_wq, work);
> > +}
> > +EXPORT_SYMBOL(queue_work_nmi);
> >
> > we can't find a reference to "struct work_struct" until there is 1:1
> > mapping with "struct irq_work". So we require a way to establish this
> > mapping and having "struct irq_work" as part of "struct work_struct"
> > tries to achieve that. If you have any better way to achieve this, I
> > can use that instead.
>
> So I guess the two options to avoid the overhead are:
>
> 1. Create a new struct:
>
> struct nmi_queuable_work_struct {
>   struct work_struct work;
>   struct irq_work iw;
> };
>
> Then the overhead is only needed for those that want this
> functionality.  Those people would need to use a variant
> nmi_schedule_work() which, depending on in_nmi(), would either
> schedule it directly or use the extra work.
>
> Looks like Daniel already responded and suggested this.
>
>
> 2. Something that duplicates the code of at least part of irq_work and
> therefore saves the need to store the function pointer.  Think of it
> this way: if you made a whole copy of irq_work that was hardcoded to
> just call the function you wanted then you wouldn't need to store a
> function pointer.  This is, of course, excessive.  I was trying to
> figure out if you could do less by only copying the NMI-safe
> linked-list manipulation, but this is probably impossible and not
> worth it anyway.
>

Thanks for your suggestions. I came up with an approach without any
overhead (see my reply to Daniel).

-Sumit

> -Doug


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
