Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2059D243BAC
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 13 Aug 2020 16:38:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1k6EN9-00078N-Tc
	for lists+kgdb-bugreport@lfdr.de; Thu, 13 Aug 2020 14:38:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1k6EN9-00078G-7I
 for kgdb-bugreport@lists.sourceforge.net; Thu, 13 Aug 2020 14:38:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=y6e/nI0YX/Z0FZJ6qvQEpeo95aT0kvFqQguxS7NKbAA=; b=Mu461O8FKgm7s7Gb6BfNSMWqSX
 /fRj7rDmYhAiA8hovDdYNoAsN0Jx7wPCeo+S9h/zAfy6PJcaDtUc8EXpTAkNs8S3Yih3Gdv1ejSYa
 U8YM4ZOuXYeDRiJrOE0hmfXfNnNAr0kXnnQlD/EC7htS1n2AYF0cbRDRaAxZ9zRf7Te0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=y6e/nI0YX/Z0FZJ6qvQEpeo95aT0kvFqQguxS7NKbAA=; b=BYcYU0lMsrmJdD168jpmFN+v8x
 LeRvQmCMhsnRCQ2DVvYSJn4R+GiDsF9ClwiSb0QkN5/89T55bSALcTuz91+BghV3+d1j2+999SZ2v
 09BlD+xSHHb9H3hgzODBOzuCBqVe3WhdWpU0JM6BCE7+xVzK8mYYXppsUgPlXuNBkhHE=;
Received: from mail-vk1-f196.google.com ([209.85.221.196])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1k6EN5-005EkU-H0
 for kgdb-bugreport@lists.sourceforge.net; Thu, 13 Aug 2020 14:38:27 +0000
Received: by mail-vk1-f196.google.com with SMTP id r197so1303407vkf.13
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 13 Aug 2020 07:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=y6e/nI0YX/Z0FZJ6qvQEpeo95aT0kvFqQguxS7NKbAA=;
 b=UiI7Xafr19bNrPmU8TEItSoYfoynx+8eUIqrC4pf6rjUTAZP5Rv3EWFear/qC7Z4ho
 0J+zH1Z0Fqc5BkcXT10PVJwDigdH4q0eUsLvyNuNac3xaDKHKZ6CdkKXHBBgYz2loPGu
 9H5gz+nvWgSfpQtiOSxHJM67YIMn+Sm9lb9ak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y6e/nI0YX/Z0FZJ6qvQEpeo95aT0kvFqQguxS7NKbAA=;
 b=ODTKyfIXCfs8ipBgxfsbinPoar3nuiRUR04b+w43WWORDsITOoG721ILEpDhG9hwIT
 htX6n1WCZh7yvcDMmrXNvZ7iq6vhH/kug3fNF3xtdtTFblJCJK8Yl2NRukRLZJMEOWWz
 CV+Cu92uSthQhWzvpPbCC+YAxbrQXWfxEeBZYpIqE9KofPJteERWRz71BG42MprX+Too
 TbQuUySVBOMdmwpo1YTNXLW22kU0NfxromPTgmkVQ32zAis5UBjmYJnNk56+WAM0TZzO
 uYKbzxJSPuFfiRPntba7ja4Hy2k4kYD4OCMZ9q5Qrao8ZJ564/PwsZyxvzLYsMuvVxmC
 XKtw==
X-Gm-Message-State: AOAM531bYZG6k9BvJXogxnbfsFItXVF3mbZK5ITl2U11HNg9mX880MnK
 vPvpBqCpITdM+FxlJ+uaPkEr8vhmlKk=
X-Google-Smtp-Source: ABdhPJyjVS2O9w0/QRxlJWBtsH32aYTSmB9W79d5haHl8MLarqK4y5u5vkcpE3a4RDeyMFzGQz6ycw==
X-Received: by 2002:a1f:60d1:: with SMTP id u200mr3566716vkb.47.1597329490003; 
 Thu, 13 Aug 2020 07:38:10 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com.
 [209.85.222.48])
 by smtp.gmail.com with ESMTPSA id m19sm737559vsj.34.2020.08.13.07.38.09
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Aug 2020 07:38:09 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id e20so1707155uav.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 13 Aug 2020 07:38:09 -0700 (PDT)
X-Received: by 2002:ab0:37d3:: with SMTP id e19mr3486210uav.64.1597329488557; 
 Thu, 13 Aug 2020 07:38:08 -0700 (PDT)
MIME-Version: 1.0
References: <1595333413-30052-1-git-send-email-sumit.garg@linaro.org>
 <1595333413-30052-3-git-send-email-sumit.garg@linaro.org>
 <CAD=FV=XUNqun3d+C_7GpgntGWRXwLSLnXKStLUz8iqZoGKu8zg@mail.gmail.com>
 <CAFA6WYNq-Z5WD=AqJn2_DEg0F6G1CYte2y5Snc964vsgCnr0Bw@mail.gmail.com>
In-Reply-To: <CAFA6WYNq-Z5WD=AqJn2_DEg0F6G1CYte2y5Snc964vsgCnr0Bw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 13 Aug 2020 07:37:57 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vu3PGSUzargD-6e2XOw=Eh7CZaQ_+a09dr8SR1T8eE2g@mail.gmail.com>
Message-ID: <CAD=FV=Vu3PGSUzargD-6e2XOw=Eh7CZaQ_+a09dr8SR1T8eE2g@mail.gmail.com>
To: Sumit Garg <sumit.garg@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.196 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.196 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1k6EN5-005EkU-H0
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

Hi,

On Thu, Aug 13, 2020 at 7:19 AM Sumit Garg <sumit.garg@linaro.org> wrote:
>
> On Thu, 13 Aug 2020 at 05:29, Doug Anderson <dianders@chromium.org> wrote:
> >
> > Hi,
> >
> > On Tue, Jul 21, 2020 at 5:11 AM Sumit Garg <sumit.garg@linaro.org> wrote:
> > >
> > > Add NMI framework APIs in serial core which can be leveraged by serial
> > > drivers to have NMI driven serial transfers. These APIs are kept under
> > > CONFIG_CONSOLE_POLL as currently kgdb initializing uart in polling mode
> > > is the only known user to enable NMI driven serial port.
> > >
> > > The general idea is to intercept RX characters in NMI context, if those
> > > are specific to magic sysrq then allow corresponding handler to run in
> > > NMI context. Otherwise defer all other RX and TX operations to IRQ work
> > > queue in order to run those in normal interrupt context.
> > >
> > > Also, since magic sysrq entry APIs will need to be invoked from NMI
> > > context, so make those APIs NMI safe via deferring NMI unsafe work to
> > > IRQ work queue.
> > >
> > > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> > > ---
> > >  drivers/tty/serial/serial_core.c | 120 ++++++++++++++++++++++++++++++++++++++-
> > >  include/linux/serial_core.h      |  67 ++++++++++++++++++++++
> > >  2 files changed, 185 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/tty/serial/serial_core.c b/drivers/tty/serial/serial_core.c
> > > index 57840cf..6342e90 100644
> > > --- a/drivers/tty/serial/serial_core.c
> > > +++ b/drivers/tty/serial/serial_core.c
> > > @@ -3181,8 +3181,14 @@ static bool uart_try_toggle_sysrq(struct uart_port *port, unsigned int ch)
> > >                 return true;
> > >         }
> > >
> > > +#ifdef CONFIG_CONSOLE_POLL
> > > +       if (in_nmi())
> > > +               irq_work_queue(&port->nmi_state.sysrq_toggle_work);
> > > +       else
> > > +               schedule_work(&sysrq_enable_work);
> > > +#else
> > >         schedule_work(&sysrq_enable_work);
> > > -
> > > +#endif
> >
> > It should be a very high bar to have #ifdefs inside functions.  I
> > don't think this meets it.  Instead maybe something like this
> > (untested and maybe slightly wrong syntax, but hopefully makes
> > sense?):
> >
> > Outside the function:
> >
> > #ifdef CONFIG_CONSOLE_POLL
> > #define queue_port_nmi_work(port, work_type)
> > irq_work_queue(&port->nmi_state.work_type)
> > #else
> > #define queue_port_nmi_work(port, work_type)
> > #endif
> >
> > ...and then:
> >
> > if (IS_ENABLED(CONFIG_CONSOLE_POLL) && in_nmi())
> >   queue_port_nmi_work(port, sysrq_toggle_work);
> > else
> >   schedule_work(&sysrq_enable_work);
> >
> > ---
> >
> > The whole double-hopping is really quite annoying.  I guess
> > schedule_work() can't be called from NMI context but can be called
> > from IRQ context?  So you need to first transition from NMI context to
> > IRQ context and then go and schedule the work?  Almost feels like we
> > should just fix schedule_work() to do this double-hop for you if
> > called from NMI context.  Seems like you could even re-use the list
> > pointers in the work_struct to keep the queue of people who need to be
> > scheduled from the next irq_work?  Worst case it seems like you could
> > add a schedule_work_nmi() that would do all the hoops for you.  ...but
> > I also know very little about NMI so maybe I'm being naive.
> >
>
> Thanks for this suggestion and yes indeed we could make
> schedule_work() NMI safe and in turn get rid of all this #ifdefs. Have
> a look at below changes:
>
> diff --git a/include/linux/workqueue.h b/include/linux/workqueue.h
> index 26de0ca..1daf1b4 100644
> --- a/include/linux/workqueue.h
> +++ b/include/linux/workqueue.h
> @@ -14,6 +14,7 @@
>  #include <linux/atomic.h>
>  #include <linux/cpumask.h>
>  #include <linux/rcupdate.h>
> +#include <linux/irq_work.h>
>
>  struct workqueue_struct;
>
> @@ -106,6 +107,7 @@ struct work_struct {
>  #ifdef CONFIG_LOCKDEP
>         struct lockdep_map lockdep_map;
>  #endif
> +       struct irq_work iw;

Hrm, I was thinking you could just have a single queue per CPU then
you don't need to add all this extra data to every single "struct
work_struct".  I was thinking you could use the existing list node in
the "struct work_struct" to keep track of the list of things.  ...but
maybe my idea this isn't actually valid because the linked list might
be in use if we're scheduling work that's already pending / running?

In any case, I worry that people won't be happy with the extra
overhead per "struct work_struct".  Can we reduce it at all?  It still
does feel like you could get by with a single global queue and thus
you wouldn't need to store the function pointer and flags with every
"struct work_struct", right?  So all you'd need is a single pointer
for the linked list?  I haven't actually tried implementing this,
though, so I could certainly be wrong.


-Doug


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
