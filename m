Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C04572939FE
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 20 Oct 2020 13:23:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kUpji-0000lI-Ho
	for lists+kgdb-bugreport@lfdr.de; Tue, 20 Oct 2020 11:23:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1kUpjh-0000ko-5y
 for kgdb-bugreport@lists.sourceforge.net; Tue, 20 Oct 2020 11:23:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GfL1HsOsvMr/cKkvteB8+ldzo29UdQmctvEANksNGLg=; b=cP8dn7lTHk4hdYQszseTis0Kbt
 h0Ahogijax25CmVnt7xWiPTvtuf2vJArdqYwr3Nr1pkhx6WmUFZZwGSOdLKNWoLCJPYSdbialrJJ3
 n5bWD/Ye+xX3GnJfi3fZZyFLLh3ZEYgky2VXzYGtdv6Oq8Aorq3brYYsP6zr8k7qrK2g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GfL1HsOsvMr/cKkvteB8+ldzo29UdQmctvEANksNGLg=; b=j2v6yO9A7XfoVHKT4/ole8RyFM
 yQaK0t3Cqibs20H70ozikptNIwmC7zY0oVJcu0JyyiFsQA1Yi+1lD0sN6rdW62Ei1tky95n+V3BQ0
 4kQzqetYmp9F4yo9H8HpNK0ay0Dkabezk2zzNBsyKWRUtlc0tW4SUmbRU/AMBorR6CZQ=;
Received: from mail-lf1-f65.google.com ([209.85.167.65])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kUpjQ-00HElH-J6
 for kgdb-bugreport@lists.sourceforge.net; Tue, 20 Oct 2020 11:23:25 +0000
Received: by mail-lf1-f65.google.com with SMTP id v6so1591532lfa.13
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 20 Oct 2020 04:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GfL1HsOsvMr/cKkvteB8+ldzo29UdQmctvEANksNGLg=;
 b=rDXqJyw2mjh8lD8CeV68L9v5YPos74zRDXBlyQYZx5Lc93xQB68Ro8vvN649A2Tt/R
 e3HCiRo2x2JtgN0SvL9QWZMJ58DOkdRK7nhWXkXqJKCA49mT7TsLRnKjn6MCOkHbcF2e
 ah4s9+HAxkaXFfbZsgay3TvQ3MZ87kVLXGAwnPG4RIXJBmDU+Jpv/7fhDpc7vCZt+wfO
 25ZOvat7ofc7n2VDrFw1+kNphs1xRTPAU9m+sGht9rsH3hQx2SGaN+Ywyh3hCO21Is1E
 dpbcTNE5bru5EZWiZT1CtPjelid1pSlYmFZRNY70UU45sL6ZhX5RmrEIHjJ2ZJkjB1LA
 OIww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GfL1HsOsvMr/cKkvteB8+ldzo29UdQmctvEANksNGLg=;
 b=CHGsoGkqBlqhW6AGYr1W/mAH0bSFK5bTO8vIHBGJ3yCWqXW0iVN2Spq/qYwPRjcG29
 p6AdZvia+dORd572JITEKmdmhVol8fmKr+aima7DYZQpR/NivZQDyz1OFhkhHntC9/LN
 5z3mTUcYEBdVB0jGfXonm55WPyj4VOFz4g/8A4sk2xEu2MDfAsgnS/2w/a6a1UqJ66m1
 EqcNBESIGcIZ5GR9fCdZrEmLJmSee+CUL2NhNuNHBsqSxywmGT7dvQLRvr/G0EgiVLsC
 TrLlHt/jSn0JNEDKNVjoDiauzjavvWJkwUTv23KMFkFn6MR9DLb3KS4YAa4qoS7K4aba
 Lz+w==
X-Gm-Message-State: AOAM53204TnvFs/OEN7ars4ZEepnOcOhmtGFK+eJ2+/XIlKt/SoN4dfn
 kPe3/pe+3qgAxO6qPb99gWu336XUJQ3c3qIgTJR6mw==
X-Google-Smtp-Source: ABdhPJyAA5RrgQGCwwgK+Ibr64I6D7FSBwkGa2v/t9LXQygNoCpJV+P0Kipb/EkHpzpIUq857GiqhRGH4K/heQexid4=
X-Received: by 2002:a19:c88c:: with SMTP id y134mr714182lff.283.1603192974687; 
 Tue, 20 Oct 2020 04:22:54 -0700 (PDT)
MIME-Version: 1.0
References: <1602673931-28782-1-git-send-email-sumit.garg@linaro.org>
 <1602673931-28782-2-git-send-email-sumit.garg@linaro.org>
 <fbf6bfecf344a06af94e17ccabb817dd@kernel.org>
 <CAFA6WYPEw5x_3zDZSnkL23YjFWbF=VkUKefM6Ts46JLVaj2sDA@mail.gmail.com>
 <f3596e3ed70737d36f72056827d7d441@kernel.org>
In-Reply-To: <f3596e3ed70737d36f72056827d7d441@kernel.org>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Tue, 20 Oct 2020 16:52:43 +0530
Message-ID: <CAFA6WYMEJb0o+PMmvLh1wDhZ+M4rChP3a1cNNoEsoMS1kDWwKA@mail.gmail.com>
To: Marc Zyngier <maz@kernel.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.65 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.65 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kUpjQ-00HElH-J6
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

On Tue, 20 Oct 2020 at 15:38, Marc Zyngier <maz@kernel.org> wrote:
>
> On 2020-10-20 07:43, Sumit Garg wrote:
> > On Mon, 19 Oct 2020 at 17:07, Marc Zyngier <maz@kernel.org> wrote:
>
> [...]
>
> >> > +{
> >> > +     if (!ipi_desc)
> >> > +             return;
> >> > +
> >> > +     if (is_nmi) {
> >> > +             if (!prepare_percpu_nmi(ipi_id))
> >> > +                     enable_percpu_nmi(ipi_id, IRQ_TYPE_NONE);
> >> > +     } else {
> >> > +             enable_percpu_irq(ipi_id, IRQ_TYPE_NONE);
> >>
> >> I'm not keen on this. Normal IRQs can't reliably work, so why do you
> >> even bother with this?
> >
> > Yeah I agree but we need to support existing functionality for kgdb
> > roundup and sysrq backtrace using normal IRQs as well.
>
> When has this become a requirement? I don't really see the point in
> implementing something that is known not to work.
>

For kgdb:

Default implementation [1] uses smp_call_function_single_async() which
in turn will invoke IPI as a normal IRQ to roundup CPUs.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/kernel/debug/debug_core.c#n244

For sysrq backtrace:

Default implementation [2] fallbacks to smp_call_function() (IPI as a
normal IRQ) to print backtrace in case architecture doesn't provide
arch_trigger_cpumask_backtrace() hook.

[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/tty/sysrq.c#n250

So in general, IPI as a normal IRQ is still useful for debugging but
it can't debug a core which is stuck in deadlock with interrupts
disabled.

And since we choose override default implementations for pseudo NMI
support, we need to be backwards compatible for platforms which don't
possess pseudo NMI support.

-Sumit

>          M.
> --
> Jazz is not dead. It just smells funny...


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
