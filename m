Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D63E32485A4
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 18 Aug 2020 15:06:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1k81Js-0001IN-KS
	for lists+kgdb-bugreport@lfdr.de; Tue, 18 Aug 2020 13:06:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1k81Jr-0001Hv-Nz
 for kgdb-bugreport@lists.sourceforge.net; Tue, 18 Aug 2020 13:06:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IhGt4f9jByBxwiS5kZbnVsZb64Dpn4S8Zrl+tXBABko=; b=PLGbo++hbO2H6AsB9MmeZZPgik
 12TBeNzPFZZOOwovIJBvjmj3Z0ejDUlL8TgXXURKCl1UDbITpRh2IJO6vGfy4FC32Kr+/3tYnc7qK
 ryXOlU4Y1e0PfGFYogiNOH3RhSJ0Jc4Yc8Bwt8jqdpkOSS5LnvjTOc3eLHfeen1UqMEM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IhGt4f9jByBxwiS5kZbnVsZb64Dpn4S8Zrl+tXBABko=; b=iWyKtiWIJ54DiYhq+WNEp35xv1
 XRwtKXpPD1NZk0XKtj9glmbqwQqAboHAAAGVCkPfOYsXlhtNezVi/eJSjVPSipK3u5ilAt2mxyyLe
 EIj6yi9JSm29KNjTs3jRqHio5CVucIrjTlEQv5SM/9jaiGFZOhFRDclv3b2CTd3kOrVM=;
Received: from mail-lf1-f65.google.com ([209.85.167.65])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1k81Jn-00BQWo-8v
 for kgdb-bugreport@lists.sourceforge.net; Tue, 18 Aug 2020 13:06:27 +0000
Received: by mail-lf1-f65.google.com with SMTP id x24so10155566lfe.11
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 18 Aug 2020 06:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IhGt4f9jByBxwiS5kZbnVsZb64Dpn4S8Zrl+tXBABko=;
 b=PIGPhufEWcQqajAr9EkyMc04aTgLdkSS0SFgGl+mr7c09WYImutC9/kVv/NW1WYO9u
 t0j9aC1fUyT0tLB+/4rwao9XGGpMZYNDwQgd9bh2J2lB5mIvKnxtxubZl3113WG1o0bU
 Cf0+cB35X6H/TCOYi5aTF4x9OshcbUZMf0VNplQRedQpYfxQzjX4fPkTU9YKpINiGQSA
 87TKCNoY9QA8uzYiFI4VygCo2EsFFYVDQTOFV7uRJwuSrDNpd3nj9+1R+qFMu7g0KOXH
 LwnfDVY2oN1dFLbIijBZxqSJan4TwqGS6Og70I7lSjgR2lfzV9gJBaqwIn2nDf6czUe9
 pHPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IhGt4f9jByBxwiS5kZbnVsZb64Dpn4S8Zrl+tXBABko=;
 b=S4FhLdMgVQxsTqlc0oSLRXjK1APZToBBys6OC2QabqoiNJAt8r8BMyL092N1hvAhqU
 TbifpVVEceAyT2EGg7m7N/NgMkCq1uA4er1sa7DaP/qHMp1lihtXUAWIBNfct/a2ClYN
 mSDfZA3j9Rjc2CMRoMk0nd/Hb+7VucRdJeL+TWQ86UKVy5FIR6P/TrjXmYWsXtPSqMOA
 R2w3PPkgBImy/rNPJ75gie/dsm8Ir2N8ugLoagH3lethYl+yGyaZwQww/arZjd6z62br
 CaBB6GS8cFDNzdRcIsxYwIyoz8kM0DZdHLD5lH6xF56uFHYRJPWbCG+tTKAmrZ9Ldyjg
 7YeA==
X-Gm-Message-State: AOAM530AzXf7Zw3UFF0wJ45H0TLZSzH434mPw4so0WJ5U8Rv3uMysFDV
 TnZy7UflwqANaN8Hx3swPMY2DPneoZh8v1mjBTQeBw==
X-Google-Smtp-Source: ABdhPJwoM8HXLERjKwax9uz3rzah+nFl76bythIgAGWCLdMJLlIoYib4VNFwjf2uK+BA0fDXa3JcGGhLUUXCgT4XDuQ=
X-Received: by 2002:a19:803:: with SMTP id 3mr9802322lfi.15.1597755976518;
 Tue, 18 Aug 2020 06:06:16 -0700 (PDT)
MIME-Version: 1.0
References: <1595333413-30052-1-git-send-email-sumit.garg@linaro.org>
 <1595333413-30052-3-git-send-email-sumit.garg@linaro.org>
 <CAD=FV=XUNqun3d+C_7GpgntGWRXwLSLnXKStLUz8iqZoGKu8zg@mail.gmail.com>
 <CAFA6WYNq-Z5WD=AqJn2_DEg0F6G1CYte2y5Snc964vsgCnr0Bw@mail.gmail.com>
 <CAD=FV=Vu3PGSUzargD-6e2XOw=Eh7CZaQ_+a09dr8SR1T8eE2g@mail.gmail.com>
 <CAFA6WYPJ_w+R15NRKK5BzZtTxKq8Gh_mGswuYbW0cYZoBYLhxw@mail.gmail.com>
 <20200814141322.lffebtamfjt2qrym@holly.lan>
 <CAFA6WYNAdELYCoOVQokgLNKhOYF9QK85UidgvyFfo4wsSNwKXw@mail.gmail.com>
 <20200817142846.mm46yy62illrewbq@holly.lan>
In-Reply-To: <20200817142846.mm46yy62illrewbq@holly.lan>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Tue, 18 Aug 2020 18:36:04 +0530
Message-ID: <CAFA6WYOWHgmYYt=KGXDh2hKiuy_rQbJfi279ev0+s-Qh7L21kA@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.65 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.65 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1k81Jn-00BQWo-8v
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

On Mon, 17 Aug 2020 at 19:58, Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> On Mon, Aug 17, 2020 at 05:57:03PM +0530, Sumit Garg wrote:
> > On Fri, 14 Aug 2020 at 19:43, Daniel Thompson
> > <daniel.thompson@linaro.org> wrote:
> > > On Fri, Aug 14, 2020 at 04:47:11PM +0530, Sumit Garg wrote:
> > > Does it look better if you create a new type to map the two structures
> > > together. Alternatively are there enough existing use-cases to want to
> > > extend irq_work_queue() with irq_work_schedule() or something similar?
> > >
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
> > +
>
> This is irredeemably broken.
>
> Even if we didn't care about dropping events (which we do) then when you
> overwrite irq_work_sched with a copy of another work_struct, either of
> which could currently be enqueued somewhere, then you will cause some
> very nasty corruption.
>

Okay, I see your point. I think there isn't a way to avoid caller
specific struct such as:

struct nmi_queuable_work_struct {
  struct work_struct work;
  struct irq_work iw;
};

So in that case will shift to approach as suggested by Doug to rather
have a new nmi_schedule_work() API.

-Sumit

>
> Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
