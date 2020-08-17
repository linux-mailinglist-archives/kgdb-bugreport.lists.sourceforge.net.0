Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F7B2467D7
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 17 Aug 2020 15:57:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1k7fdy-000887-Bm
	for lists+kgdb-bugreport@lfdr.de; Mon, 17 Aug 2020 13:57:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1k7fdx-000880-28
 for kgdb-bugreport@lists.sourceforge.net; Mon, 17 Aug 2020 13:57:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xdKYrohN8OlGDXEszWS+Ec7t39VpiibXfsuU/BXESmU=; b=CQW4w5fqmowAb2pYI10aDgqiQn
 7S5xJPBqeTDP2gbNS73CiT0xitu08xsJLvDeVcSwe5s+5Ap7fL8ZF879T4zgZgGdzMV6vOQsXiI+l
 zabEc3E/rswwODoROq2Utc2VmKqOVj/tzGv2L4xiDQacCSNgpY5uVIczUnmZNrMnIyRY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xdKYrohN8OlGDXEszWS+Ec7t39VpiibXfsuU/BXESmU=; b=brTQ8iO4Z32pBF8IutmnZAYm/U
 Sehj8LaCFBaVsWQZMRH/JqZTinUQaNSxE+tc4KDf/hedQX8w4yTvusxLxvrZHgHf+uwEWqqOytvb1
 g8zp40MKGpa8KDTzRkHJ32EGuicYlHZM4p2LF6e9qbcDGCz0W19weBh7drByjhNMbLJ8=;
Received: from mail-vs1-f68.google.com ([209.85.217.68])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1k7fdv-00AJBB-Ac
 for kgdb-bugreport@lists.sourceforge.net; Mon, 17 Aug 2020 13:57:45 +0000
Received: by mail-vs1-f68.google.com with SMTP id a127so1544308vsd.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 17 Aug 2020 06:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xdKYrohN8OlGDXEszWS+Ec7t39VpiibXfsuU/BXESmU=;
 b=ZKT/oHgXJeLaz2zSrpCOpcciOR4Mu1pqaSQj+Y449pXWXd5zG14b92RWlkzZCxWBO7
 yME6N7qJVHxW7bemEEpv63eiFnQiLjA0UKyEvL6CwHme89gvtDcenUq5X9ku6kYABH4m
 ad78O5beq8PPyCpELu1KKVgY+uZ0KpO9XYRLE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xdKYrohN8OlGDXEszWS+Ec7t39VpiibXfsuU/BXESmU=;
 b=PPGhkt8Sb8wWHmqmE1YzX0jhCIoSrCgHnpopRp06LOZ32d1r4361/dttKAOtVrXS4m
 1HuKv06SRBRmdLbmcBF9BaTlq2U78pJWgBxGUnEfByW7rrfWnabOqBEktdr7zANUMjAE
 OmBLXtGnEBF901LVhmerwdQIyLixmsKSBbtOEP4Id3SQCv2xGshQi6GdkRELC7PrEUIR
 XlAJI1d1MUJUB56grYWMUIBSbptoHMfENQDhtXNUWwvQstd/t3eDUZVf0kkYy5OAmtHj
 3Aphc6HQRD6bJ8hul00yGYgmCCIdNyqXGmr1EdbXFqSqK2ATplywmW/6Nl04mk66J3qx
 P3Fg==
X-Gm-Message-State: AOAM5314rFwumPP0CVSCx4AqLnPnPIMpoBDpO+99GXRRX9gw9zo276ik
 oJhvpvQKH9NWDq21HJxttZgVqwK/Um0frA==
X-Google-Smtp-Source: ABdhPJx1JZGmn2kLqqy85ffw+J/PSYyOTWpR0BJOmUBtdRRWMRxzNXFDFEobD2akHRw2MfG/dA2/ug==
X-Received: by 2002:a05:6102:72b:: with SMTP id
 u11mr8144770vsg.146.1597672656881; 
 Mon, 17 Aug 2020 06:57:36 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com.
 [209.85.217.42])
 by smtp.gmail.com with ESMTPSA id 1sm2305827uaq.1.2020.08.17.06.57.34
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Aug 2020 06:57:36 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id a1so8293853vsp.4
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 17 Aug 2020 06:57:34 -0700 (PDT)
X-Received: by 2002:a67:fd67:: with SMTP id h7mr7276952vsa.121.1597672654168; 
 Mon, 17 Aug 2020 06:57:34 -0700 (PDT)
MIME-Version: 1.0
References: <1595333413-30052-1-git-send-email-sumit.garg@linaro.org>
 <1595333413-30052-3-git-send-email-sumit.garg@linaro.org>
 <CAD=FV=XUNqun3d+C_7GpgntGWRXwLSLnXKStLUz8iqZoGKu8zg@mail.gmail.com>
 <CAFA6WYNq-Z5WD=AqJn2_DEg0F6G1CYte2y5Snc964vsgCnr0Bw@mail.gmail.com>
 <CAD=FV=Vu3PGSUzargD-6e2XOw=Eh7CZaQ_+a09dr8SR1T8eE2g@mail.gmail.com>
 <CAFA6WYPJ_w+R15NRKK5BzZtTxKq8Gh_mGswuYbW0cYZoBYLhxw@mail.gmail.com>
 <20200814141322.lffebtamfjt2qrym@holly.lan>
 <CAFA6WYNAdELYCoOVQokgLNKhOYF9QK85UidgvyFfo4wsSNwKXw@mail.gmail.com>
In-Reply-To: <CAFA6WYNAdELYCoOVQokgLNKhOYF9QK85UidgvyFfo4wsSNwKXw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 17 Aug 2020 06:57:22 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WiZi18zBwx9J0sKLdCqMCvxuQ=U0m21yNqhtaBfZEqzA@mail.gmail.com>
Message-ID: <CAD=FV=WiZi18zBwx9J0sKLdCqMCvxuQ=U0m21yNqhtaBfZEqzA@mail.gmail.com>
To: Sumit Garg <sumit.garg@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.217.68 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.217.68 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1k7fdv-00AJBB-Ac
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

On Mon, Aug 17, 2020 at 5:27 AM Sumit Garg <sumit.garg@linaro.org> wrote:
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

Wait, howzat work?  There's a single global variable that you stash
the "sched_work" into with no locking?  What if two people schedule
work at the same time?

-Doug


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
