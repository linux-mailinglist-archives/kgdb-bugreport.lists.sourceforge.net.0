Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5BC24684E
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 17 Aug 2020 16:24:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1k7g3k-0000ws-En
	for lists+kgdb-bugreport@lfdr.de; Mon, 17 Aug 2020 14:24:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1k7g3i-0000wk-MR
 for kgdb-bugreport@lists.sourceforge.net; Mon, 17 Aug 2020 14:24:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oU7e+jIr/cI/ou5kHSSsfha06PmR4hz2KnNYeE0ncyg=; b=fFLkN4GTdlo+iuXThKLVsqnqJV
 8uZIZ8EZdkmL80ECdvEUSR3Ka8D9/24OYjrE0oe2Fb2x12FHaR5Uit6AArtFNpwDYYH7EYnjdoSx6
 eukeSPK5wDPmoEHVKona4/7cEQIgFXNapbVmBSj3pg4mxbiXLOmR1B2tU/vvpcDAOPQU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oU7e+jIr/cI/ou5kHSSsfha06PmR4hz2KnNYeE0ncyg=; b=UXT6NqI2gZ23GHE7feLKaO1oQL
 Xn5MTWIufnzu8aFJkPv4zrLe3YgvgRluvpz7V0UP+c+TjSx7W5LJtRkogHif1abZppkTwlpy+r6RH
 VSz4q2bB7bojuRvuHHKMQBkCSNZbLqgD/Pe9FFvJAFUeemBJeySMnEWftf5bx059q4hg=;
Received: from mail-lj1-f196.google.com ([209.85.208.196])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1k7g3g-00EI5U-Js
 for kgdb-bugreport@lists.sourceforge.net; Mon, 17 Aug 2020 14:24:22 +0000
Received: by mail-lj1-f196.google.com with SMTP id v9so17697522ljk.6
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 17 Aug 2020 07:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oU7e+jIr/cI/ou5kHSSsfha06PmR4hz2KnNYeE0ncyg=;
 b=EiPVoknUJcywffhSmPfzdZX8frrHNh4TAkgBe9sRQg3aMFUAzaAs2xuI7sPHuBYHoB
 nHj9iUvWbWAxExZAwF+zDwOjmhRgHvPsIGHZEWfKE0QIEXr5q7wH8wsfNinfWGErSQFI
 I2SaKX/XfpzOgiGFuDP2S+VJixH2ZWk27E5fDzpPZFfMTpP5S5l/WAFdODRP93oiMe7/
 fCAk7F5bKrO0MdBpTrTpwRmhCAvdu08zqb9Khk2U+fbXYaWwxo41vQZHzaQLskGEteZv
 JuP6grRSg6wimPHpZclWJJrhJmO+BjBhUBhzo6s8vu8nw+LGp8/sjVpC/6HuHj7TDfGo
 habw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oU7e+jIr/cI/ou5kHSSsfha06PmR4hz2KnNYeE0ncyg=;
 b=jAs3UPJ3idNMFUR4rOca4FO0yZNnc8bvOVwPyrPGuaJE2+mae7vI1wIE25we29D4lC
 8s/7jL6UB4d2YLNGuvaQDuQi63p+4dbMoowMZKYwIPQargl/fR4ahCqvjLCduFMJYgxx
 efGOxunncxlVeXLRwa1javncBa+SjghOllzZLUKrQGJpw0OhqM/dD5Ufhydq4Tx47s2k
 08G1qbBd5bgNEFk6wUZ66Gz2FWzkWVZGhKPyUkHvskMFGR0UmcE9yYtCwF/6UKqYMLPm
 2wx62c54lhSpDz6+JI/K0bOI8rVINS/saSr6cINn/p4kfVr4zV6LQ3zElZ8jF1h8M0Ml
 HJMQ==
X-Gm-Message-State: AOAM530MGGSFGTs4GjYIHgywSpxzZ7IE2CpaD2APk1a81k96adsMMDXF
 Oyn/LyrAWewxuinvhIp1xeRSeABnKI3/UTvdILSI6Q==
X-Google-Smtp-Source: ABdhPJzyYSgkPBQJajdoF5LqQQKz259BV4J6EumeZ8VPZ3rX9VyL6FgcFUgPSlYGKcwOcGR3OcWBpP+o0QJ6FOC/zXg=
X-Received: by 2002:a2e:3202:: with SMTP id y2mr7902509ljy.30.1597674246644;
 Mon, 17 Aug 2020 07:24:06 -0700 (PDT)
MIME-Version: 1.0
References: <1595333413-30052-1-git-send-email-sumit.garg@linaro.org>
 <1595333413-30052-3-git-send-email-sumit.garg@linaro.org>
 <CAD=FV=XUNqun3d+C_7GpgntGWRXwLSLnXKStLUz8iqZoGKu8zg@mail.gmail.com>
 <CAFA6WYNq-Z5WD=AqJn2_DEg0F6G1CYte2y5Snc964vsgCnr0Bw@mail.gmail.com>
 <CAD=FV=Vu3PGSUzargD-6e2XOw=Eh7CZaQ_+a09dr8SR1T8eE2g@mail.gmail.com>
 <CAFA6WYPJ_w+R15NRKK5BzZtTxKq8Gh_mGswuYbW0cYZoBYLhxw@mail.gmail.com>
 <20200814141322.lffebtamfjt2qrym@holly.lan>
 <CAFA6WYNAdELYCoOVQokgLNKhOYF9QK85UidgvyFfo4wsSNwKXw@mail.gmail.com>
 <CAD=FV=WiZi18zBwx9J0sKLdCqMCvxuQ=U0m21yNqhtaBfZEqzA@mail.gmail.com>
In-Reply-To: <CAD=FV=WiZi18zBwx9J0sKLdCqMCvxuQ=U0m21yNqhtaBfZEqzA@mail.gmail.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Mon, 17 Aug 2020 19:53:55 +0530
Message-ID: <CAFA6WYOww8T7fmP-LtzS-EXG0iBbKEUOS5KrUU_7i+yqd_rFfQ@mail.gmail.com>
To: Doug Anderson <dianders@chromium.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.196 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.196 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1k7g3g-00EI5U-Js
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

On Mon, 17 Aug 2020 at 19:27, Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Mon, Aug 17, 2020 at 5:27 AM Sumit Garg <sumit.garg@linaro.org> wrote:
> >
> > Thanks for your suggestion, irq_work_schedule() looked even better
> > without any overhead, see below:
> >
> > diff --git a/include/linux/irq_work.h b/include/linux/irq_work.h
> > index 3082378..1eade89 100644
> > --- a/include/linux/irq_work.h
> > +++ b/include/linux/irq_work.h
> > @@ -3,6 +3,7 @@
> >  #define _LINUX_IRQ_WORK_H
> >
> >  #include <linux/smp_types.h>
> > +#include <linux/workqueue.h>
> >
> >  /*
> >   * An entry can be in one of four states:
> > @@ -24,6 +25,11 @@ struct irq_work {
> >         void (*func)(struct irq_work *);
> >  };
> >
> > +struct irq_work_schedule {
> > +       struct irq_work work;
> > +       struct work_struct *sched_work;
> > +};
> > +
> >  static inline
> >  void init_irq_work(struct irq_work *work, void (*func)(struct irq_work *))
> >  {
> >  {
> > @@ -39,6 +45,7 @@ void init_irq_work(struct irq_work *work, void
> > (*func)(struct irq_work *))
> >
> >  bool irq_work_queue(struct irq_work *work);
> >  bool irq_work_queue_on(struct irq_work *work, int cpu);
> > +bool irq_work_schedule(struct work_struct *sched_work);
> >
> >  void irq_work_tick(void);
> >  void irq_work_sync(struct irq_work *work);
> > diff --git a/kernel/irq_work.c b/kernel/irq_work.c
> > index eca8396..3880316 100644
> > --- a/kernel/irq_work.c
> > +++ b/kernel/irq_work.c
> > @@ -24,6 +24,8 @@
> >  static DEFINE_PER_CPU(struct llist_head, raised_list);
> >  static DEFINE_PER_CPU(struct llist_head, lazy_list);
> >
> > +static struct irq_work_schedule irq_work_sched;
> > +
> >  /*
> >   * Claim the entry so that no one else will poke at it.
> >   */
> > @@ -79,6 +81,25 @@ bool irq_work_queue(struct irq_work *work)
> >  }
> >  EXPORT_SYMBOL_GPL(irq_work_queue);
> >
> > +static void irq_work_schedule_fn(struct irq_work *work)
> > +{
> > +       struct irq_work_schedule *irq_work_sched =
> > +               container_of(work, struct irq_work_schedule, work);
> > +
> > +       if (irq_work_sched->sched_work)
> > +               schedule_work(irq_work_sched->sched_work);
> > +}
> > +
> > +/* Schedule work via irq work queue */
> > +bool irq_work_schedule(struct work_struct *sched_work)
> > +{
> > +       init_irq_work(&irq_work_sched.work, irq_work_schedule_fn);
> > +       irq_work_sched.sched_work = sched_work;
> > +
> > +       return irq_work_queue(&irq_work_sched.work);
> > +}
> > +EXPORT_SYMBOL_GPL(irq_work_schedule);
>
> Wait, howzat work?  There's a single global variable that you stash
> the "sched_work" into with no locking?  What if two people schedule
> work at the same time?

This API is intended to be invoked from NMI context only, so I think
there will be a single user at a time. And we can make that explicit
as well:

+/* Schedule work via irq work queue */
+bool irq_work_schedule(struct work_struct *sched_work)
+{
+       if (in_nmi()) {
+               init_irq_work(&irq_work_sched.work, irq_work_schedule_fn);
+               irq_work_sched.sched_work = sched_work;
+
+               return irq_work_queue(&irq_work_sched.work);
+       }
+
+       return false;
+}
+EXPORT_SYMBOL_GPL(irq_work_schedule);

-Sumit

>
> -Doug


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
