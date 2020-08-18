Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4607D2485EC
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 18 Aug 2020 15:18:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1k81Vw-0005K4-2B
	for lists+kgdb-bugreport@lfdr.de; Tue, 18 Aug 2020 13:18:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1k81Vu-0005JY-PN
 for kgdb-bugreport@lists.sourceforge.net; Tue, 18 Aug 2020 13:18:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yDDil0AUbZ0wmokmM/QHNHE+fyW15U6tmDP5zuUGqO4=; b=MMBwtHWf6sNOmcU/pBtymn74Ye
 TSaO9MJv5+/y4+cal/1RbkMPEuYxdLViraojldofbNzJvxZ5UYlg2LZCCavi4qJqwhJeAKNao6jiv
 cT3jARfDzTc/kE0ztBCi/KUwm0snbHia+l1fC/+a1P5/YEQ9c9KlUsPchfmZUVwrOaCI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yDDil0AUbZ0wmokmM/QHNHE+fyW15U6tmDP5zuUGqO4=; b=JQMeD0a+Z/+DBUJyCx9hh1Svaz
 JVn+5XpwZ0Cd2iid9ysRQIeCP6n9mzAm9CX57V4BsggYMRkbnToLyW1YD1/3nZ+QSrc59yMHymOuh
 y1iuSF1pA3E9ya00yk9Euh7lFrVOXnNzdhnojeXU3jmgeCT6ioL8Go7MI3XEmQvpRwkE=;
Received: from mail-lj1-f194.google.com ([209.85.208.194])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1k81Vp-00FH13-0X
 for kgdb-bugreport@lists.sourceforge.net; Tue, 18 Aug 2020 13:18:54 +0000
Received: by mail-lj1-f194.google.com with SMTP id g6so21340274ljn.11
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 18 Aug 2020 06:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yDDil0AUbZ0wmokmM/QHNHE+fyW15U6tmDP5zuUGqO4=;
 b=hPUCTqXSRTJbtoSpUcqVa72Pi616CqOCXEesCSvBgHZnk6f8IumMxFDDzZfuIblroK
 ejDxDGB38/9/NmxAtDbFkRlfCKiXMzjfqVUAFDoc7emGmzJgQrizkrwRxDgmfXzb/fcD
 /XY5L0L1PlPbTdt52PGQBV7bp+JNs+Dy/fwr25FIyEq0xbwV06R34HZCVX4HN4/BjWE9
 It80EGd8AgS/6a+Cs4TztyLGpRjmQK0mLeyLikA6hlAbroVZpCZmM7X/IAeVHlt+O4Hr
 BCEzg06q6o/JDgAQsmVEybV8jWEkrV14oasnDTEeXktQAIrOC+TP1XnhFNBeRdQ/f9EI
 AmtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yDDil0AUbZ0wmokmM/QHNHE+fyW15U6tmDP5zuUGqO4=;
 b=kv5M1HmYM39UzMcfMct7HcOoIG/95q+yqnPfGUftiP8Sae3RirnGTCLglAOdoO8JSR
 pPMUf4PNwi1T3ueoaT6LwMt6KxgTEwD7IZZfn+8IE5WS/z6s3O3pyO1AXXm8GCcyFPLN
 egYYz7XXROwZxDhZwI/c4A2+9Y1ACnoSwySZ/YkKhZ+D6bDIZzcVdv7hbz+8svK6EF4a
 waf/Ks8/Yl2U8E848eh+N53rwaOg0Mf7q3bnugMi+Njrh+AVmgJ4Jn25T2TE3GQPLjiu
 zzE4lfN4epM72w40gMR4+awXFz5gfl5IJPq0zoM3ghU5RFYwv2Moq98ak3gvD7+zFYfW
 ndTA==
X-Gm-Message-State: AOAM530yfJtEd/VfEg1ABF/36hoZLBk6HedpXeH8ViEevIfv+eRQKLOh
 yQhf8/ypCgh+W3uSOTrNXewtjA3IzUM4ftg49J0ePw==
X-Google-Smtp-Source: ABdhPJwSmkycWJtZ2n0vto4Q7YpdHzTXmjky1pIKMelRyq/iUrhxnCPuEg+PkYeruBbJ1j1MGwbDkxYZ63gkD3Fr8HA=
X-Received: by 2002:a05:651c:294:: with SMTP id
 b20mr9143135ljo.4.1597756722365; 
 Tue, 18 Aug 2020 06:18:42 -0700 (PDT)
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
 <CAFA6WYOww8T7fmP-LtzS-EXG0iBbKEUOS5KrUU_7i+yqd_rFfQ@mail.gmail.com>
 <20200817143222.x524v6xqw5hvzvjs@holly.lan>
In-Reply-To: <20200817143222.x524v6xqw5hvzvjs@holly.lan>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Tue, 18 Aug 2020 18:48:30 +0530
Message-ID: <CAFA6WYO_tBUSNnuDU4yvphUb3-f7oc2GHFTTjbX3=963p=iePQ@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.194 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.194 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1k81Vp-00FH13-0X
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

On Mon, 17 Aug 2020 at 20:02, Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> On Mon, Aug 17, 2020 at 07:53:55PM +0530, Sumit Garg wrote:
> > On Mon, 17 Aug 2020 at 19:27, Doug Anderson <dianders@chromium.org> wrote:
> > >
> > > Hi,
> > >
> > > On Mon, Aug 17, 2020 at 5:27 AM Sumit Garg <sumit.garg@linaro.org> wrote:
> > > >
> > > > Thanks for your suggestion, irq_work_schedule() looked even better
> > > > without any overhead, see below:
> > > >
> > > > diff --git a/include/linux/irq_work.h b/include/linux/irq_work.h
> > > > index 3082378..1eade89 100644
> > > > --- a/include/linux/irq_work.h
> > > > +++ b/include/linux/irq_work.h
> > > > @@ -3,6 +3,7 @@
> > > >  #define _LINUX_IRQ_WORK_H
> > > >
> > > >  #include <linux/smp_types.h>
> > > > +#include <linux/workqueue.h>
> > > >
> > > >  /*
> > > >   * An entry can be in one of four states:
> > > > @@ -24,6 +25,11 @@ struct irq_work {
> > > >         void (*func)(struct irq_work *);
> > > >  };
> > > >
> > > > +struct irq_work_schedule {
> > > > +       struct irq_work work;
> > > > +       struct work_struct *sched_work;
> > > > +};
> > > > +
> > > >  static inline
> > > >  void init_irq_work(struct irq_work *work, void (*func)(struct irq_work *))
> > > >  {
> > > >  {
> > > > @@ -39,6 +45,7 @@ void init_irq_work(struct irq_work *work, void
> > > > (*func)(struct irq_work *))
> > > >
> > > >  bool irq_work_queue(struct irq_work *work);
> > > >  bool irq_work_queue_on(struct irq_work *work, int cpu);
> > > > +bool irq_work_schedule(struct work_struct *sched_work);
> > > >
> > > >  void irq_work_tick(void);
> > > >  void irq_work_sync(struct irq_work *work);
> > > > diff --git a/kernel/irq_work.c b/kernel/irq_work.c
> > > > index eca8396..3880316 100644
> > > > --- a/kernel/irq_work.c
> > > > +++ b/kernel/irq_work.c
> > > > @@ -24,6 +24,8 @@
> > > >  static DEFINE_PER_CPU(struct llist_head, raised_list);
> > > >  static DEFINE_PER_CPU(struct llist_head, lazy_list);
> > > >
> > > > +static struct irq_work_schedule irq_work_sched;
> > > > +
> > > >  /*
> > > >   * Claim the entry so that no one else will poke at it.
> > > >   */
> > > > @@ -79,6 +81,25 @@ bool irq_work_queue(struct irq_work *work)
> > > >  }
> > > >  EXPORT_SYMBOL_GPL(irq_work_queue);
> > > >
> > > > +static void irq_work_schedule_fn(struct irq_work *work)
> > > > +{
> > > > +       struct irq_work_schedule *irq_work_sched =
> > > > +               container_of(work, struct irq_work_schedule, work);
> > > > +
> > > > +       if (irq_work_sched->sched_work)
> > > > +               schedule_work(irq_work_sched->sched_work);
> > > > +}
> > > > +
> > > > +/* Schedule work via irq work queue */
> > > > +bool irq_work_schedule(struct work_struct *sched_work)
> > > > +{
> > > > +       init_irq_work(&irq_work_sched.work, irq_work_schedule_fn);
> > > > +       irq_work_sched.sched_work = sched_work;
> > > > +
> > > > +       return irq_work_queue(&irq_work_sched.work);
> > > > +}
> > > > +EXPORT_SYMBOL_GPL(irq_work_schedule);
> > >
> > > Wait, howzat work?  There's a single global variable that you stash
> > > the "sched_work" into with no locking?  What if two people schedule
> > > work at the same time?
> >
> > This API is intended to be invoked from NMI context only, so I think
> > there will be a single user at a time.
>
> How can you possibly know that?

I guess here you are referring to NMI nesting, correct?

Anyway, I am going to shift to another implementation as mentioned in
the other thread.

-Sumit

>
> This is library code, not a helper in a driver.
>
>
> Daniel.
>
>
> > And we can make that explicit
> > as well:
> >
> > +/* Schedule work via irq work queue */
> > +bool irq_work_schedule(struct work_struct *sched_work)
> > +{
> > +       if (in_nmi()) {
> > +               init_irq_work(&irq_work_sched.work, irq_work_schedule_fn);
> > +               irq_work_sched.sched_work = sched_work;
> > +
> > +               return irq_work_queue(&irq_work_sched.work);
> > +       }
> > +
> > +       return false;
> > +}
> > +EXPORT_SYMBOL_GPL(irq_work_schedule);
> >
> > -Sumit
> >
> > >
> > > -Doug


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
