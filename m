Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 293E2246859
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 17 Aug 2020 16:29:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1k7g8B-0007oM-4T
	for lists+kgdb-bugreport@lfdr.de; Mon, 17 Aug 2020 14:28:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1k7g89-0007oE-6n
 for kgdb-bugreport@lists.sourceforge.net; Mon, 17 Aug 2020 14:28:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jZBiiEEprcZxIoS7kLgkj8BI5NaODguV/9YEt0JNbrs=; b=bhtGWquth9T1Lei/ewzjJgLGis
 2KAuq7es8B1auSkl9//ihplmjAvmSkXpEpgn+NcKPpAJ+6+GN01ywmqSjZiWqIB+gkuRUQWw7C4XB
 f2Hl2KL1FA/pBkJS0HPSVXjiCA7WJrq5rBgc59I6eRor7e8k8l1Rt+yC/aHOeys9+QQ8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jZBiiEEprcZxIoS7kLgkj8BI5NaODguV/9YEt0JNbrs=; b=f6H13ZxP/ol9F/1xDExZ0JzjP6
 BrMZkzTx2lokrENhsX56aZ8Xn0lZybWW0F53uOFVwg9b3FMGbRJKyLEu89b4pfKSELvKDVHNVH5gx
 Gdw/txjFFuPpm1VOQtdXcA/Dx88JJdh9AjU5m/I6Iv6sOVG0M+INibT7SNNFLwN/bda0=;
Received: from mail-wr1-f67.google.com ([209.85.221.67])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1k7g87-00AKVi-2P
 for kgdb-bugreport@lists.sourceforge.net; Mon, 17 Aug 2020 14:28:57 +0000
Received: by mail-wr1-f67.google.com with SMTP id r15so5309700wrp.13
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 17 Aug 2020 07:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=jZBiiEEprcZxIoS7kLgkj8BI5NaODguV/9YEt0JNbrs=;
 b=oi/1F0NoccxfISqtDM6MCAbKxX1wHsT+Slj0IB4Uht85/OVJZc4/mTtfWQlRQcucuQ
 tOl36e9Vrw9wpUkFo5sC/oUXQP6pw86tsAWPFs6z1WWJxNGsnjxmfih61u11BS2Pt9k3
 9gphW+/L2Cu14UEtt4gzsopSH3RoMARg3SSrnGYuaqs3dsHaGZLrXHVxVjPBLd78B9/+
 XFZliSYdHkwh/57J+ONt72l6BIJTAptctPtfnJeoe3K3Bx6+CDYoi2l/2OJJN55Nib+G
 FMQ7CDXrX4BYj61lntcDk3NF0tBC8Y2NEHW8jJE5elBDHA8YHQEprW5UAcSIY9UtT95t
 SG1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jZBiiEEprcZxIoS7kLgkj8BI5NaODguV/9YEt0JNbrs=;
 b=UpHOqzb/j/pTgwzOUzo3ZE2TELx2Di3yPDeKDYZasOwk6aZCcCtDHsfPYuRXFJJA9X
 7WeUwHUbglwHcl30c6BZcIWt+ssnEt85BMLuu/ra3BVOKTpAzDKMJs2k1kRC975QlL4V
 OEs6RH/Qqo3G1JHpGLog686Yse8AjFSapgWvzsbIckNcc6dHwmwgrGhnleGrdVc/PShk
 2p6VKTxrhwojbiDK/iuWV29k2S9gqMxRxqCou4ta0RTR0g587BBBIM7YKjQVvP7nkkvB
 1uzqbJI03FV0bcRKhFHC2YWgFz6kd+c5pjm41HEHRmaEUCjsNY2OcmO3sWobkGTxkqhB
 i8Yw==
X-Gm-Message-State: AOAM531tB4l5Fi88PxwcfHAibTKMKdYHP995X1ttgSK2N+hWx9nCWmAO
 xMnfvVb+XOotPjfqBi1E2aEWoQ==
X-Google-Smtp-Source: ABdhPJx14fi62OgyZfj8zMYJ1zd8/0R74mqVq42SMxYWCi217PiFrf2gqQGokK2QCtnUYWulLtPC3w==
X-Received: by 2002:adf:f007:: with SMTP id j7mr14748884wro.195.1597674528714; 
 Mon, 17 Aug 2020 07:28:48 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id n5sm30089028wrx.22.2020.08.17.07.28.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 07:28:48 -0700 (PDT)
Date: Mon, 17 Aug 2020 15:28:46 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Sumit Garg <sumit.garg@linaro.org>
Message-ID: <20200817142846.mm46yy62illrewbq@holly.lan>
References: <1595333413-30052-1-git-send-email-sumit.garg@linaro.org>
 <1595333413-30052-3-git-send-email-sumit.garg@linaro.org>
 <CAD=FV=XUNqun3d+C_7GpgntGWRXwLSLnXKStLUz8iqZoGKu8zg@mail.gmail.com>
 <CAFA6WYNq-Z5WD=AqJn2_DEg0F6G1CYte2y5Snc964vsgCnr0Bw@mail.gmail.com>
 <CAD=FV=Vu3PGSUzargD-6e2XOw=Eh7CZaQ_+a09dr8SR1T8eE2g@mail.gmail.com>
 <CAFA6WYPJ_w+R15NRKK5BzZtTxKq8Gh_mGswuYbW0cYZoBYLhxw@mail.gmail.com>
 <20200814141322.lffebtamfjt2qrym@holly.lan>
 <CAFA6WYNAdELYCoOVQokgLNKhOYF9QK85UidgvyFfo4wsSNwKXw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFA6WYNAdELYCoOVQokgLNKhOYF9QK85UidgvyFfo4wsSNwKXw@mail.gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.67 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.67 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1k7g87-00AKVi-2P
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

On Mon, Aug 17, 2020 at 05:57:03PM +0530, Sumit Garg wrote:
> On Fri, 14 Aug 2020 at 19:43, Daniel Thompson
> <daniel.thompson@linaro.org> wrote:
> > On Fri, Aug 14, 2020 at 04:47:11PM +0530, Sumit Garg wrote:
> > Does it look better if you create a new type to map the two structures
> > together. Alternatively are there enough existing use-cases to want to
> > extend irq_work_queue() with irq_work_schedule() or something similar?
> >
> 
> Thanks for your suggestion, irq_work_schedule() looked even better
> without any overhead, see below:
> 
> diff --git a/include/linux/irq_work.h b/include/linux/irq_work.h
> index 3082378..1eade89 100644
> --- a/include/linux/irq_work.h
> +++ b/include/linux/irq_work.h
> @@ -3,6 +3,7 @@
>  #define _LINUX_IRQ_WORK_H
> 
>  #include <linux/smp_types.h>
> +#include <linux/workqueue.h>
> 
>  /*
>   * An entry can be in one of four states:
> @@ -24,6 +25,11 @@ struct irq_work {
>         void (*func)(struct irq_work *);
>  };
> 
> +struct irq_work_schedule {
> +       struct irq_work work;
> +       struct work_struct *sched_work;
> +};
> +
>  static inline
>  void init_irq_work(struct irq_work *work, void (*func)(struct irq_work *))
>  {
>  {
> @@ -39,6 +45,7 @@ void init_irq_work(struct irq_work *work, void
> (*func)(struct irq_work *))
> 
>  bool irq_work_queue(struct irq_work *work);
>  bool irq_work_queue_on(struct irq_work *work, int cpu);
> +bool irq_work_schedule(struct work_struct *sched_work);
> 
>  void irq_work_tick(void);
>  void irq_work_sync(struct irq_work *work);
> diff --git a/kernel/irq_work.c b/kernel/irq_work.c
> index eca8396..3880316 100644
> --- a/kernel/irq_work.c
> +++ b/kernel/irq_work.c
> @@ -24,6 +24,8 @@
>  static DEFINE_PER_CPU(struct llist_head, raised_list);
>  static DEFINE_PER_CPU(struct llist_head, lazy_list);
> 
> +static struct irq_work_schedule irq_work_sched;
> +
>  /*
>   * Claim the entry so that no one else will poke at it.
>   */
> @@ -79,6 +81,25 @@ bool irq_work_queue(struct irq_work *work)
>  }
>  EXPORT_SYMBOL_GPL(irq_work_queue);
> 
> +static void irq_work_schedule_fn(struct irq_work *work)
> +{
> +       struct irq_work_schedule *irq_work_sched =
> +               container_of(work, struct irq_work_schedule, work);
> +
> +       if (irq_work_sched->sched_work)
> +               schedule_work(irq_work_sched->sched_work);
> +}
> +
> +/* Schedule work via irq work queue */
> +bool irq_work_schedule(struct work_struct *sched_work)
> +{
> +       init_irq_work(&irq_work_sched.work, irq_work_schedule_fn);
> +       irq_work_sched.sched_work = sched_work;
> +
> +       return irq_work_queue(&irq_work_sched.work);
> +}
> +EXPORT_SYMBOL_GPL(irq_work_schedule);
> +

This is irredeemably broken.

Even if we didn't care about dropping events (which we do) then when you
overwrite irq_work_sched with a copy of another work_struct, either of
which could currently be enqueued somewhere, then you will cause some
very nasty corruption.


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
