Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A325246654
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 17 Aug 2020 14:27:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1k7eEY-0006hP-T0
	for lists+kgdb-bugreport@lfdr.de; Mon, 17 Aug 2020 12:27:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1k7eEX-0006gq-Gz
 for kgdb-bugreport@lists.sourceforge.net; Mon, 17 Aug 2020 12:27:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kGNaJzjvB0G23O3m+g09oc7AaMHJR8rzuI+FZ8OzZho=; b=GuYr/1+CbGWsdKOGZTUegMmQDG
 a1D8iBWHk6e+2umg5R7GmZN4CrmKHiMpbsohUeRtk4/bKekw1NJFIIxSsc10O96cpEsCA6ak9NO5L
 qSOCSZWpkSKaF9gCVqY7dbzIqPgjulk8A7qhwcxtQa3mnEDNXJ2hrIJIyhKOjM9IYOf0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kGNaJzjvB0G23O3m+g09oc7AaMHJR8rzuI+FZ8OzZho=; b=Oiz0SrL4lUOWQI59oDT2cImV0t
 yawAVKcv9COqQaPjweTXz4WQzUaW31wCS4D4j7E5ong8R0U+Rcjm7/mF/FoHvX1/7Ysl6WWfGKJfL
 qi8NVNRBx8iEU6mp/mM7CiBqjcUJsRQyNMa8MW4VFgoO0ztS8HBawIcEUDyh/nUytZU8=;
Received: from mail-lj1-f194.google.com ([209.85.208.194])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1k7eET-00EE68-E1
 for kgdb-bugreport@lists.sourceforge.net; Mon, 17 Aug 2020 12:27:25 +0000
Received: by mail-lj1-f194.google.com with SMTP id w25so17207661ljo.12
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 17 Aug 2020 05:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kGNaJzjvB0G23O3m+g09oc7AaMHJR8rzuI+FZ8OzZho=;
 b=l+JYLWC1gaw8VNDmrmNAAtddkNB7uKAOuuqUIP0VLJ05s36eKqagQn7Fscj3rj8eql
 +GgvKhWtOnQzFAN/tyy9MZeq5+57ylMcQMJOM755Z6g6UTNgJcaYZhzl6PcXxMxW23Ie
 79NEVuCWKe9aFMiqR4xIvB+mRAAfs6bedEz1gyCzd7OAm/acEuOHVM8jlgvbNufTaXV9
 ukQhxX95BDRbcuM5dei10NSg0xwcEwNxX3qTBK/0Y1yM+ZJlPSeg4dPii3nyGcVSSwYV
 uvLkp+wsYTJ2T9O0RPhrUOeJB6sKfYTjHSlwo9s+QrAtpptsZELrAXdvDEPjSVJSsqIT
 1rmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kGNaJzjvB0G23O3m+g09oc7AaMHJR8rzuI+FZ8OzZho=;
 b=qA3sB9awLTNgXA3yjiJxXFbWvwkDH1TzLC6oJxFBJLOD3JIG/lAv85EM8uaYHoEB76
 ps3LdEjjZA8x5dy2mN93QF/bYcLNdws7BSJDdeP0fG6uHa5kBzQ4E/Hdqnb7VaIRwupC
 i/3N6uXZL5uW6NHiQuQBkOkTXwFCCQ1WYDdnPDZRSRsgHnfMVAwdJGKkymCcgNXb0cx5
 6erMz1NeeTpYE46Y+x9aGUpA3sFcv7icAf/NyezihCc3hr2xaUcLPATo6WIKLmZiPxwJ
 0ZzsGgS7w8JiMR/JCg2bB4uh74VzvYGlOJHHeBFeuEvCeRudUA+x8aD9eIM5fu9ZKKE8
 B9Pg==
X-Gm-Message-State: AOAM533kMU3lPXxP8eXseqK3QZBlnmcUs/ItK1aHNJGx8gC5Iyzrh2Xj
 MU9R/2o4Hu3bRwr9W8tDDtCYTvivbDFONgAGKlQ1Cg==
X-Google-Smtp-Source: ABdhPJxtJZS0JEiUqGDZr1SMgDDrLZBXKwTHfXS4aFhVrETusCociczvaeOKEW94hSszS0YwalvA8+zCH7r3ToYthfk=
X-Received: by 2002:a2e:9550:: with SMTP id t16mr6823311ljh.372.1597667234699; 
 Mon, 17 Aug 2020 05:27:14 -0700 (PDT)
MIME-Version: 1.0
References: <1595333413-30052-1-git-send-email-sumit.garg@linaro.org>
 <1595333413-30052-3-git-send-email-sumit.garg@linaro.org>
 <CAD=FV=XUNqun3d+C_7GpgntGWRXwLSLnXKStLUz8iqZoGKu8zg@mail.gmail.com>
 <CAFA6WYNq-Z5WD=AqJn2_DEg0F6G1CYte2y5Snc964vsgCnr0Bw@mail.gmail.com>
 <CAD=FV=Vu3PGSUzargD-6e2XOw=Eh7CZaQ_+a09dr8SR1T8eE2g@mail.gmail.com>
 <CAFA6WYPJ_w+R15NRKK5BzZtTxKq8Gh_mGswuYbW0cYZoBYLhxw@mail.gmail.com>
 <20200814141322.lffebtamfjt2qrym@holly.lan>
In-Reply-To: <20200814141322.lffebtamfjt2qrym@holly.lan>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Mon, 17 Aug 2020 17:57:03 +0530
Message-ID: <CAFA6WYNAdELYCoOVQokgLNKhOYF9QK85UidgvyFfo4wsSNwKXw@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.194 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.194 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1k7eET-00EE68-E1
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-serial@vger.kernel.org,
 Jiri Slaby <jslaby@suse.com>, kgdb-bugreport@lists.sourceforge.net,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Fri, 14 Aug 2020 at 19:43, Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> On Fri, Aug 14, 2020 at 04:47:11PM +0530, Sumit Garg wrote:
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
> Perhaps don't consider this to be "fixing schedule_work()" but providing
> an NMI-safe alternative to schedule_work().

Okay.

>
> Does it look better if you create a new type to map the two structures
> together. Alternatively are there enough existing use-cases to want to
> extend irq_work_queue() with irq_work_schedule() or something similar?
>

Thanks for your suggestion, irq_work_schedule() looked even better
without any overhead, see below:

diff --git a/include/linux/irq_work.h b/include/linux/irq_work.h
index 3082378..1eade89 100644
--- a/include/linux/irq_work.h
+++ b/include/linux/irq_work.h
@@ -3,6 +3,7 @@
 #define _LINUX_IRQ_WORK_H

 #include <linux/smp_types.h>
+#include <linux/workqueue.h>

 /*
  * An entry can be in one of four states:
@@ -24,6 +25,11 @@ struct irq_work {
        void (*func)(struct irq_work *);
 };

+struct irq_work_schedule {
+       struct irq_work work;
+       struct work_struct *sched_work;
+};
+
 static inline
 void init_irq_work(struct irq_work *work, void (*func)(struct irq_work *))
 {
 {
@@ -39,6 +45,7 @@ void init_irq_work(struct irq_work *work, void
(*func)(struct irq_work *))

 bool irq_work_queue(struct irq_work *work);
 bool irq_work_queue_on(struct irq_work *work, int cpu);
+bool irq_work_schedule(struct work_struct *sched_work);

 void irq_work_tick(void);
 void irq_work_sync(struct irq_work *work);
diff --git a/kernel/irq_work.c b/kernel/irq_work.c
index eca8396..3880316 100644
--- a/kernel/irq_work.c
+++ b/kernel/irq_work.c
@@ -24,6 +24,8 @@
 static DEFINE_PER_CPU(struct llist_head, raised_list);
 static DEFINE_PER_CPU(struct llist_head, lazy_list);

+static struct irq_work_schedule irq_work_sched;
+
 /*
  * Claim the entry so that no one else will poke at it.
  */
@@ -79,6 +81,25 @@ bool irq_work_queue(struct irq_work *work)
 }
 EXPORT_SYMBOL_GPL(irq_work_queue);

+static void irq_work_schedule_fn(struct irq_work *work)
+{
+       struct irq_work_schedule *irq_work_sched =
+               container_of(work, struct irq_work_schedule, work);
+
+       if (irq_work_sched->sched_work)
+               schedule_work(irq_work_sched->sched_work);
+}
+
+/* Schedule work via irq work queue */
+bool irq_work_schedule(struct work_struct *sched_work)
+{
+       init_irq_work(&irq_work_sched.work, irq_work_schedule_fn);
+       irq_work_sched.sched_work = sched_work;
+
+       return irq_work_queue(&irq_work_sched.work);
+}
+EXPORT_SYMBOL_GPL(irq_work_schedule);
+
 /*
  * Enqueue the irq_work @work on @cpu unless it's already pending
  * somewhere.

-Sumit

>
> Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
