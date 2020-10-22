Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0EE295DCC
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 22 Oct 2020 13:53:26 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kVZ9p-0006yr-BW
	for lists+kgdb-bugreport@lfdr.de; Thu, 22 Oct 2020 11:53:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1kVZ9n-0006yk-LC
 for kgdb-bugreport@lists.sourceforge.net; Thu, 22 Oct 2020 11:53:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/p1cdqDg3sSy4J66J5AdsRM0OOyUaw4jr+T+WwHHoBY=; b=mENxUcytmf75b1HFff1g0Jt9Ty
 f3k/TrB5mk+VITyqM5ZNfnZQoTPLl5M8nkMetsJaXMfBFNzEG5g4gdrES2jjwmVLYqlm+kkYPSbs+
 NjbXqMiXzTYuZn6XW98qXkcafCqathlfcfNSiad032rRv8Ae9ypTpUSvThKTcgyG5cIs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/p1cdqDg3sSy4J66J5AdsRM0OOyUaw4jr+T+WwHHoBY=; b=egBk5Iw93c3UHBhg1va/jXVOim
 7WyMr5eS50OYMoQZfLXUF+vYRl2ePEyiQiNcNE4Cw+uNZHPCvbB1ffwlqmN2CS5B0qtCRohhnMAOY
 MiteE9omPHKJ6yUuADJgs9zuFp2Uvy/Y/GxWpdtNvk8L+gjKb2volad731HABZcjglFo=;
Received: from mail-lj1-f193.google.com ([209.85.208.193])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kVZ9a-008cRg-Da
 for kgdb-bugreport@lists.sourceforge.net; Thu, 22 Oct 2020 11:53:23 +0000
Received: by mail-lj1-f193.google.com with SMTP id h20so1585382lji.9
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 22 Oct 2020 04:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/p1cdqDg3sSy4J66J5AdsRM0OOyUaw4jr+T+WwHHoBY=;
 b=bKKT7PqBzLn7aHCb3uqtSN7ClSWLctjRr5jOL1V1Mk6FBEBs4V8M+3ivstxhYVB+km
 UdUh3lr9wBDr+O6cNGPnFX3+WOMveHNChR4sQAjfZo+jbEMdg57wllMc9JSaUssILTxT
 qY0qsDLxrRgmnZQ8YJr6qJAjJs+AegWaH9elw74/70ATqrqbjDMt1itC66OP1Yzipr9y
 tgsZwaghjhMvOXSPpqQpzeuXWYcvyr/mkqBG9HdfhDbN+u8Nuex2rWlHAOqKVgktvzgv
 T6U2Ie7aT8SgxCNro7djwC6w5itZBjhDArQq7XsBthFokDd4bpGqKJOWR8LSxJ4b7ssw
 sZnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/p1cdqDg3sSy4J66J5AdsRM0OOyUaw4jr+T+WwHHoBY=;
 b=AOnfcx27HuLkM8knrli8JrctXL4d/JnaKBcgbXn36SwSc2L+YGcxbk5xpWxXt4IPjH
 ZJln8XdnqT74XYTrkO27LUtW6YrCYHCDvrBjCRAs1I8tfdVYyP+VkWEUEZoAWwsrABO4
 8ZyejaxU4G5A78huXjJ09eo8MuSbrVab24RiLwa0vet9YN037VPnsyKq1tB/ab9WdQNu
 iEtAi+wUIXnLVUN6LhTH+VXUNDZunZNbLeJWCQdJL3sjNZuE72G5l7/eaAYaSOIo1Z5d
 lWv9UQ+ktx0CF+RW4AugUo1M7ko6LMexCmbAtWz7w0fQtSC1zVnDvKNrV1jI9uZOlw+R
 IymA==
X-Gm-Message-State: AOAM532HwDQBe+bYizX8Z6Oi77VrjrM+5fH5p9ISX9RhJ8+Guz8MFoxT
 aakpy4PkLKqLvtWD9cjgqL1E2EP/mvB0exDJ0LaJXA==
X-Google-Smtp-Source: ABdhPJy6WmhVH6MPUajsCzsGwwHuyX/WPScvir7ZQSEHe3QGmI/bVeWlm+z9NRu1UrsTMbm1RFBeBcndxA+vuWHf7RI=
X-Received: by 2002:a2e:808a:: with SMTP id i10mr775733ljg.427.1603367583805; 
 Thu, 22 Oct 2020 04:53:03 -0700 (PDT)
MIME-Version: 1.0
References: <1602673931-28782-1-git-send-email-sumit.garg@linaro.org>
 <1602673931-28782-2-git-send-email-sumit.garg@linaro.org>
 <fbf6bfecf344a06af94e17ccabb817dd@kernel.org>
 <CAFA6WYPEw5x_3zDZSnkL23YjFWbF=VkUKefM6Ts46JLVaj2sDA@mail.gmail.com>
 <f3596e3ed70737d36f72056827d7d441@kernel.org>
 <CAFA6WYMEJb0o+PMmvLh1wDhZ+M4rChP3a1cNNoEsoMS1kDWwKA@mail.gmail.com>
 <1d41e0e4e6ee6c794b83d2c75c3748da@kernel.org>
In-Reply-To: <1d41e0e4e6ee6c794b83d2c75c3748da@kernel.org>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Thu, 22 Oct 2020 17:22:52 +0530
Message-ID: <CAFA6WYOr5g1VLpHJtS5WCE1x_Xe6g9FQPSXOwiC1Ew5rKJyRwQ@mail.gmail.com>
To: Marc Zyngier <maz@kernel.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.193 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.193 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kVZ9a-008cRg-Da
Subject: Re: [Kgdb-bugreport] [PATCH v5 1/5] arm64: Add framework to turn
 IPI as NMI
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jason Cooper <jason@lakedaemon.net>, Catalin Marinas <catalin.marinas@arm.com>,
 ito-yuichi@fujitsu.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 julien.thierry.kdev@gmail.com, Jason Wessel <jason.wessel@windriver.com>,
 kgdb-bugreport@lists.sourceforge.net, Thomas Gleixner <tglx@linutronix.de>,
 Masayoshi Mizuma <msys.mizuma@gmail.com>, Will Deacon <will@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Wed, 21 Oct 2020 at 15:57, Marc Zyngier <maz@kernel.org> wrote:
>
> On 2020-10-20 12:22, Sumit Garg wrote:
> > On Tue, 20 Oct 2020 at 15:38, Marc Zyngier <maz@kernel.org> wrote:
> >>
> >> On 2020-10-20 07:43, Sumit Garg wrote:
> >> > On Mon, 19 Oct 2020 at 17:07, Marc Zyngier <maz@kernel.org> wrote:
> >>
> >> [...]
> >>
> >> >> > +{
> >> >> > +     if (!ipi_desc)
> >> >> > +             return;
> >> >> > +
> >> >> > +     if (is_nmi) {
> >> >> > +             if (!prepare_percpu_nmi(ipi_id))
> >> >> > +                     enable_percpu_nmi(ipi_id, IRQ_TYPE_NONE);
> >> >> > +     } else {
> >> >> > +             enable_percpu_irq(ipi_id, IRQ_TYPE_NONE);
> >> >>
> >> >> I'm not keen on this. Normal IRQs can't reliably work, so why do you
> >> >> even bother with this?
> >> >
> >> > Yeah I agree but we need to support existing functionality for kgdb
> >> > roundup and sysrq backtrace using normal IRQs as well.
> >>
> >> When has this become a requirement? I don't really see the point in
> >> implementing something that is known not to work.
> >>
> >
> > For kgdb:
> >
> > Default implementation [1] uses smp_call_function_single_async() which
> > in turn will invoke IPI as a normal IRQ to roundup CPUs.
> >
> > [1]
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/kernel/debug/debug_core.c#n244
> >
> > For sysrq backtrace:
> >
> > Default implementation [2] fallbacks to smp_call_function() (IPI as a
> > normal IRQ) to print backtrace in case architecture doesn't provide
> > arch_trigger_cpumask_backtrace() hook.
> >
> > [2]
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/tty/sysrq.c#n250
> >
> > So in general, IPI as a normal IRQ is still useful for debugging but
> > it can't debug a core which is stuck in deadlock with interrupts
> > disabled.
>
> And that's not something we implement today for good reasons:
> it *cannot* work reliably. What changed that we all of a sudden need it?
>
> > And since we choose override default implementations for pseudo NMI
> > support, we need to be backwards compatible for platforms which don't
> > possess pseudo NMI support.
>
> No. There is nothing to be "backward compatible" with, because
> - this isn't a userspace visible feature
> - *it doesn't work*
>
> So please drop this non-feature from this series.
>

Okay, fair enough. I will drop support for new IPI being normal IRQ
and instead update sysrq backtrace and kgdb roundup frameworks to use
existing cross-calls stuff in case a platform doesn't possess pseudo
NMI support.

-Sumit

>          M.
> --
> Jazz is not dead. It just smells funny...


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
