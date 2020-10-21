Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 464E42947C2
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 21 Oct 2020 07:22:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kV6a6-0000y1-2M
	for lists+kgdb-bugreport@lfdr.de; Wed, 21 Oct 2020 05:22:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1kV6a4-0000xt-DN
 for kgdb-bugreport@lists.sourceforge.net; Wed, 21 Oct 2020 05:22:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7iRfYHshncZxuEZuIuMxuQoZjVRgSMU4DFKkAcLgNbA=; b=AW+raIr+no6MA/4w5ZGMKwe7fK
 IjDfra/H15xursB/jaRkjGRX82vmewishuFyHkhEdAye2rtFyEmdbOSgYimLnCRsXIgCBgic2vk2P
 0wUNEhIONEF4GWT911zgcgVfpod3ginCTBnJf0DXC4W7eYFgPrIdqlcNKA0M9LoisXrw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7iRfYHshncZxuEZuIuMxuQoZjVRgSMU4DFKkAcLgNbA=; b=gfaPo70/GsUOHRKUD3uDNIMa6j
 391D8uECE1uooAhwtX9vjCLlxCOHEYZnR3uIU30B4TkyZHd3iMqAiJ69hNF9/HP75TemKuz9GTbC6
 jslhN9qYuM1bS5rY9ISo43tgT1CIxgVD3MycKvLxuKH9rSbux9YtbG+rtub+xmu6KXRU=;
Received: from mail-lf1-f65.google.com ([209.85.167.65])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kV6Zw-000hC1-Fe
 for kgdb-bugreport@lists.sourceforge.net; Wed, 21 Oct 2020 05:22:35 +0000
Received: by mail-lf1-f65.google.com with SMTP id z2so1408492lfr.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 20 Oct 2020 22:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7iRfYHshncZxuEZuIuMxuQoZjVRgSMU4DFKkAcLgNbA=;
 b=XkQOesCgXddwoVsTjSBMFCndrNkCOBtPClB6oUhGpFk5oLPNoQR/zfobTxnfpGPHVR
 NdZgotMP1MmX4+/NXiZStkEdNrupXd0+/VwkFVerNhPdq6luzFevAmi94H8n9K4QorSA
 TBHm+jkPcAZlzFg5sEcwRfLimwGfAzIGizjyz6koxX4F+t5BolAOSh1vhn1Ki2ljlQZ0
 9dBiRv0hCczBImGDjn6kXga6PmMkIZhggnAmp1CeQyhYZfFti9KsYY0Z0kT7Gds1tRQj
 qXEknLqg21jXQzee7u1d5xHJlI2nMZMuJNiD2w48f/RNfiSsGImps/3+HfF9zo8DJ+Zp
 vvkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7iRfYHshncZxuEZuIuMxuQoZjVRgSMU4DFKkAcLgNbA=;
 b=bHbdrluAavYJ02np/YW/JgUQgC2rJnNtcFVJMbsC8manpQicrGAA7qEbnfRhfNy8bR
 1e8X03vZqbnKJrybu8hLix4C5WLyPLiFTJCXPPvU6x0iHaPs6Wfmb2NdKVB5e5o8dlU7
 m61z9qc4/Rz2Gcr7pUn25C709qCd/mKDYYOuKnHhJLZcqtNvGstWvh8696wrdZCJ01/p
 cXPhK8L6o+rSU/DOK6nDKyTmTtn8do1mrohPOavg53wzP7HZqYZqgIGGOa8apf15oLZS
 pm8xULN2AderWLGrXmNzJ6lxZ2Avjknn918zQR5vu8nOoL47pmZcQhx3TIwRs9xNvtUn
 Yflg==
X-Gm-Message-State: AOAM533o3UXpq5pNBwP/IQOASM7EUIprWDr9KD9Jr4vaS8ke6qeOWNIg
 QjmTnq+QfkyyfBor4459ItB6biBZ2BzKaDrwyfz8wg==
X-Google-Smtp-Source: ABdhPJxV4nB04nApkulAMMx6rMpKdEqbco++Jukt4XOOgihXfek9zsCf9m9tj9VYpY1tvFKYfCKC02F7XgD0Z60wRXw=
X-Received: by 2002:ac2:50d0:: with SMTP id h16mr534128lfm.445.1603257741847; 
 Tue, 20 Oct 2020 22:22:21 -0700 (PDT)
MIME-Version: 1.0
References: <1602673931-28782-1-git-send-email-sumit.garg@linaro.org>
 <1602673931-28782-2-git-send-email-sumit.garg@linaro.org>
 <fbf6bfecf344a06af94e17ccabb817dd@kernel.org>
 <CAFA6WYPEw5x_3zDZSnkL23YjFWbF=VkUKefM6Ts46JLVaj2sDA@mail.gmail.com>
 <f3596e3ed70737d36f72056827d7d441@kernel.org>
 <CAFA6WYMEJb0o+PMmvLh1wDhZ+M4rChP3a1cNNoEsoMS1kDWwKA@mail.gmail.com>
 <20201020122535.paym32gksuhcqtwq@holly.lan>
 <abe358694e06a6076fb5838d1231eee6@kernel.org>
In-Reply-To: <abe358694e06a6076fb5838d1231eee6@kernel.org>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Wed, 21 Oct 2020 10:52:10 +0530
Message-ID: <CAFA6WYNG3EMuDSkp7P9s7_pfw0jAC+-CZcH6f6sRnpvLsyQE6Q@mail.gmail.com>
To: Marc Zyngier <maz@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.65 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.65 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kV6Zw-000hC1-Fe
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
Cc: Mark Rutland <mark.rutland@arm.com>, Jason Cooper <jason@lakedaemon.net>,
 Catalin Marinas <catalin.marinas@arm.com>, ito-yuichi@fujitsu.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 julien.thierry.kdev@gmail.com, Jason Wessel <jason.wessel@windriver.com>,
 kgdb-bugreport@lists.sourceforge.net, Thomas Gleixner <tglx@linutronix.de>,
 Masayoshi Mizuma <msys.mizuma@gmail.com>, Will Deacon <will@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Tue, 20 Oct 2020 at 18:02, Marc Zyngier <maz@kernel.org> wrote:
>
> On 2020-10-20 13:25, Daniel Thompson wrote:
> > On Tue, Oct 20, 2020 at 04:52:43PM +0530, Sumit Garg wrote:
>
> [...]
>
> >> So in general, IPI as a normal IRQ is still useful for debugging but
> >> it can't debug a core which is stuck in deadlock with interrupts
> >> disabled.
> >>
> >> And since we choose override default implementations for pseudo NMI
> >> support, we need to be backwards compatible for platforms which don't
> >> possess pseudo NMI support.
> >
> > Do the fallback implementations require a new IPI? The fallbacks
> > could rely on existing mechanisms such as the smp_call_function
> > family.
>
> Indeed. I'd be worried of using that mechanism for NMIs, but normal
> IPIs should stick to the normal cross-call stuff.

Yes, the fallback implementations could rely on existing cross-call
stuff but current framework only allows this fallback choice at
compile time and to make this choice at runtime, we need additional
framework changes like allowing arch_trigger_cpumask_backtrace() to
return a boolean in order to switch to fallback mode, similar would be
the case for kgdb.

I think this should be doable but I am still not sure regarding the
advantages of using existing IPI vs new IPI (which we will already use
in case of pseudo NMI support) as normal IRQ.

>
> The jury is still out on why this is a good idea, given that it
> doesn't work in the only interesting case (deadlocked CPUs).

I think CPU soft-lockups (interrupts enabled) is an interesting case
to debug as well.

-Sumit

>
>           M.
> --
> Jazz is not dead. It just smells funny...


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
