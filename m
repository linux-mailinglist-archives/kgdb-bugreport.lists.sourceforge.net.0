Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F9B246874
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 17 Aug 2020 16:32:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1k7gBg-0001Hi-5y
	for lists+kgdb-bugreport@lfdr.de; Mon, 17 Aug 2020 14:32:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1k7gBd-0001HS-IQ
 for kgdb-bugreport@lists.sourceforge.net; Mon, 17 Aug 2020 14:32:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4xCxql3rFXOrYwsJnruwiMml2YFmKU3isYfeanIkWcA=; b=Oh+NQBbck4W850sPBuQImuiuKi
 9rKGQRpCt5q29mzcBlHlPnyAn3VjKi54XJ4+qSPQRhdxi8Iu6miM3PbDV64rnTlIQm7MN9j7cv+nY
 UrPMSUaK+150FgUh64ufGCARp8PM73XjmF3IZqZyJunXkLOlNxJmrjY8AVy080R18lLk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4xCxql3rFXOrYwsJnruwiMml2YFmKU3isYfeanIkWcA=; b=DhGbZTk2BoZ6w6Gk9eeOzZ4DfJ
 cWOUBdzJXrqkjhIJt3jqmBHFqAwq4s+ZsdFCBwgQx7XPf1zMw7DWOodKXcnWqF7K4QxBMyRmZXm9V
 iF15DIIumIjQ3PM3YKWHJo0nowhukQSLRF071Xqn8JAV2sQNUrJPQBW9B8WcQPD9z11Q=;
Received: from mail-wr1-f68.google.com ([209.85.221.68])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1k7gBb-00EIJc-Ib
 for kgdb-bugreport@lists.sourceforge.net; Mon, 17 Aug 2020 14:32:33 +0000
Received: by mail-wr1-f68.google.com with SMTP id f1so15255835wro.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 17 Aug 2020 07:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=4xCxql3rFXOrYwsJnruwiMml2YFmKU3isYfeanIkWcA=;
 b=e2VC/nDUrcTrPiLe8Rsn9RLZlW4rcYA2Jl5mIjWssD4VC0ZsKSwazLp8W5LLAaUaQj
 phEwXCaxN15zdXIHVkVdQueXA7BSoUMC0zP4wxhkF81Dtcv5KDknoOUQjRfneCH/dG8i
 A0xmmSzTjChp0DTHg0RH9HZcD65eQFAjQE1SPdMLbebUyYnIzJbKT2cH4SwFYFHq9W9C
 QPdKnQp7eFbhQ0pEWFwCu033czTsTfQikLNWQ+0wf9674ynxvj/JUV+8zh1UaU4OLTO3
 w2ZoiM/l+X1VgEo0AWO+IdM8fY/IvnQpjF22RYs8pd/4Y5fUgXJaPyurEa7kKxZpGK5+
 R9Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4xCxql3rFXOrYwsJnruwiMml2YFmKU3isYfeanIkWcA=;
 b=DkaekHSOXnLlP7HxSCpdysWBztLRkl1uDj0dO6esWSE3cNAYVtCnjQ8K/VAk62NV9l
 GGfNmQHSs271g2AebLbdhf6QCKnAQjup6OKNO3WP1gV1RrF9An2yxTVQ+i18z8wcv4Mf
 JLMv3RVpqru9iWBtlN8ZEEMp3hwmyjwHvnckOKddT3cA30x19VxWF//g7+55ZQg82dhb
 8bRIl2j+1VeNMSH4O+SflnOCxy3kXTPmy4hWrZ2Z0i5h8kZNBKD/UZqP+khU7fwMyN92
 Z1L0q2EjypRukEW6y77UnPsB4IcxAlfWEa3okLRuY92wHq9pWquOZzRCUgm8vUvSRRKf
 UU4A==
X-Gm-Message-State: AOAM532M1wfRcDyA0T5788SqP51l+m72fiG/VR+L5Eg9IvA1/+kMbfcx
 OKLNJZ/7iE9A2EOS01kmF666WQ==
X-Google-Smtp-Source: ABdhPJwcWtkOmSHjWMaBZRj99E/tmhBdkQKcx9/iCQNmdDknYb0vfHpbcTwe6vVmWZ3/tTu3rSxwpQ==
X-Received: by 2002:adf:f48d:: with SMTP id l13mr15343611wro.43.1597674745210; 
 Mon, 17 Aug 2020 07:32:25 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id d23sm30698956wmd.27.2020.08.17.07.32.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 07:32:24 -0700 (PDT)
Date: Mon, 17 Aug 2020 15:32:22 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Sumit Garg <sumit.garg@linaro.org>
Message-ID: <20200817143222.x524v6xqw5hvzvjs@holly.lan>
References: <1595333413-30052-1-git-send-email-sumit.garg@linaro.org>
 <1595333413-30052-3-git-send-email-sumit.garg@linaro.org>
 <CAD=FV=XUNqun3d+C_7GpgntGWRXwLSLnXKStLUz8iqZoGKu8zg@mail.gmail.com>
 <CAFA6WYNq-Z5WD=AqJn2_DEg0F6G1CYte2y5Snc964vsgCnr0Bw@mail.gmail.com>
 <CAD=FV=Vu3PGSUzargD-6e2XOw=Eh7CZaQ_+a09dr8SR1T8eE2g@mail.gmail.com>
 <CAFA6WYPJ_w+R15NRKK5BzZtTxKq8Gh_mGswuYbW0cYZoBYLhxw@mail.gmail.com>
 <20200814141322.lffebtamfjt2qrym@holly.lan>
 <CAFA6WYNAdELYCoOVQokgLNKhOYF9QK85UidgvyFfo4wsSNwKXw@mail.gmail.com>
 <CAD=FV=WiZi18zBwx9J0sKLdCqMCvxuQ=U0m21yNqhtaBfZEqzA@mail.gmail.com>
 <CAFA6WYOww8T7fmP-LtzS-EXG0iBbKEUOS5KrUU_7i+yqd_rFfQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFA6WYOww8T7fmP-LtzS-EXG0iBbKEUOS5KrUU_7i+yqd_rFfQ@mail.gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.68 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.68 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1k7gBb-00EIJc-Ib
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

On Mon, Aug 17, 2020 at 07:53:55PM +0530, Sumit Garg wrote:
> On Mon, 17 Aug 2020 at 19:27, Doug Anderson <dianders@chromium.org> wrote:
> >
> > Hi,
> >
> > On Mon, Aug 17, 2020 at 5:27 AM Sumit Garg <sumit.garg@linaro.org> wrote:
> > >
> > > Thanks for your suggestion, irq_work_schedule() looked even better
> > > without any overhead, see below:
> > >
> > > diff --git a/include/linux/irq_work.h b/include/linux/irq_work.h
> > > index 3082378..1eade89 100644
> > > --- a/include/linux/irq_work.h
> > > +++ b/include/linux/irq_work.h
> > > @@ -3,6 +3,7 @@
> > >  #define _LINUX_IRQ_WORK_H
> > >
> > >  #include <linux/smp_types.h>
> > > +#include <linux/workqueue.h>
> > >
> > >  /*
> > >   * An entry can be in one of four states:
> > > @@ -24,6 +25,11 @@ struct irq_work {
> > >         void (*func)(struct irq_work *);
> > >  };
> > >
> > > +struct irq_work_schedule {
> > > +       struct irq_work work;
> > > +       struct work_struct *sched_work;
> > > +};
> > > +
> > >  static inline
> > >  void init_irq_work(struct irq_work *work, void (*func)(struct irq_work *))
> > >  {
> > >  {
> > > @@ -39,6 +45,7 @@ void init_irq_work(struct irq_work *work, void
> > > (*func)(struct irq_work *))
> > >
> > >  bool irq_work_queue(struct irq_work *work);
> > >  bool irq_work_queue_on(struct irq_work *work, int cpu);
> > > +bool irq_work_schedule(struct work_struct *sched_work);
> > >
> > >  void irq_work_tick(void);
> > >  void irq_work_sync(struct irq_work *work);
> > > diff --git a/kernel/irq_work.c b/kernel/irq_work.c
> > > index eca8396..3880316 100644
> > > --- a/kernel/irq_work.c
> > > +++ b/kernel/irq_work.c
> > > @@ -24,6 +24,8 @@
> > >  static DEFINE_PER_CPU(struct llist_head, raised_list);
> > >  static DEFINE_PER_CPU(struct llist_head, lazy_list);
> > >
> > > +static struct irq_work_schedule irq_work_sched;
> > > +
> > >  /*
> > >   * Claim the entry so that no one else will poke at it.
> > >   */
> > > @@ -79,6 +81,25 @@ bool irq_work_queue(struct irq_work *work)
> > >  }
> > >  EXPORT_SYMBOL_GPL(irq_work_queue);
> > >
> > > +static void irq_work_schedule_fn(struct irq_work *work)
> > > +{
> > > +       struct irq_work_schedule *irq_work_sched =
> > > +               container_of(work, struct irq_work_schedule, work);
> > > +
> > > +       if (irq_work_sched->sched_work)
> > > +               schedule_work(irq_work_sched->sched_work);
> > > +}
> > > +
> > > +/* Schedule work via irq work queue */
> > > +bool irq_work_schedule(struct work_struct *sched_work)
> > > +{
> > > +       init_irq_work(&irq_work_sched.work, irq_work_schedule_fn);
> > > +       irq_work_sched.sched_work = sched_work;
> > > +
> > > +       return irq_work_queue(&irq_work_sched.work);
> > > +}
> > > +EXPORT_SYMBOL_GPL(irq_work_schedule);
> >
> > Wait, howzat work?  There's a single global variable that you stash
> > the "sched_work" into with no locking?  What if two people schedule
> > work at the same time?
> 
> This API is intended to be invoked from NMI context only, so I think
> there will be a single user at a time.

How can you possibly know that?

This is library code, not a helper in a driver.


Daniel.


> And we can make that explicit
> as well:
> 
> +/* Schedule work via irq work queue */
> +bool irq_work_schedule(struct work_struct *sched_work)
> +{
> +       if (in_nmi()) {
> +               init_irq_work(&irq_work_sched.work, irq_work_schedule_fn);
> +               irq_work_sched.sched_work = sched_work;
> +
> +               return irq_work_queue(&irq_work_sched.work);
> +       }
> +
> +       return false;
> +}
> +EXPORT_SYMBOL_GPL(irq_work_schedule);
> 
> -Sumit
> 
> >
> > -Doug


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
