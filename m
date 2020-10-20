Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8043B293B81
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 20 Oct 2020 14:26:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kUqiI-0004BX-9o
	for lists+kgdb-bugreport@lfdr.de; Tue, 20 Oct 2020 12:26:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1kUqiH-0004BH-Da
 for kgdb-bugreport@lists.sourceforge.net; Tue, 20 Oct 2020 12:26:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3072bhtqw85ZZ5q7Kctyban1EX+IQGqUQ7FPQjYg1z4=; b=cV+nnhNSSXHK4L0iJPTTSBonW9
 Skscgy/m7HVwzrzzf0hsSnbGueKvNxQs3Da0OXadDj5X8oWOPv22Snx7+Ii2e7yvxE4i8790bHvLe
 wetwt/7VLr6rIxV4soPK9p+ZyDOq2n12RwZlPav/Ggl5CZW/XU+3MWIuwFh1Xl/lZ+Cg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3072bhtqw85ZZ5q7Kctyban1EX+IQGqUQ7FPQjYg1z4=; b=jcncblqEoPo2i9fUPYvgTJAtSM
 s1jJX91uyZihN/xzovWFbtTL1GYEoeLWU7MR8tkn7Z8WemSEsqqLRCFYL989i3aqyAlPXZmAUlqdl
 w4lJwVvQn1OiWOceaj/z5ZAP1LQvgUL40PZ3mhn+BgM0Wptkhy/qrXp6/HbNRRac9xNk=;
Received: from mail-wm1-f67.google.com ([209.85.128.67])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kUqi8-00HIuK-0x
 for kgdb-bugreport@lists.sourceforge.net; Tue, 20 Oct 2020 12:26:01 +0000
Received: by mail-wm1-f67.google.com with SMTP id c77so1575610wmd.4
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 20 Oct 2020 05:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=3072bhtqw85ZZ5q7Kctyban1EX+IQGqUQ7FPQjYg1z4=;
 b=wHX2QGknolq+aCKeuj9TVr+qoMxLXBjgtUghPnFszojrsW6EbHc/uowWZr3oiQOZTF
 wjj9SooPyLN4foolShHgoIU2Q0GySZDa5dv2BW8l21yX96A/9E5/k3OkANImPibS1JcH
 6KD4pO3CacnW64Re+l4bsoTJRDdfvpDYMWmoq2recYkWijVKuGWxmYmDJWrW0L+h5Ewv
 mkDfIdFx/pREKABAM+ROXjidtORbC3FSPmjaxRt790Qq8su4y3VMtXlkYqC0AY7s5NYf
 5fJ/6vD/5hRywuOIrq/quCtoMLWNY9AIK5nSc3sHeHpf3sUabKHwHBke+muGJJAfA2MA
 HycA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3072bhtqw85ZZ5q7Kctyban1EX+IQGqUQ7FPQjYg1z4=;
 b=hy+xiooe6K5yF7dd9jr9SpdUOh4qkBScjifekv8xJN9nja3oEfvkYO0SLZ0LGcHKK+
 hw7MvZ2/01Zt8Uz2k2/TqqdmqaMX/vzjF+X7YQytjUyIy+p/0IBzhzex89xrmBNZFrAc
 8nKB+EXQfnY7DNTnCzcHpp8vZdWjBXMr8kbRiHKuqqSm3hENJ2rcBYh0/Pdg6HU6e3GK
 hNozhU0tsB4rNYJND9OjJf/RISVjsoBAfYFCE6KwBm4ftDdA+Ry9b2o1SyZEqwm5Z6uq
 DGUNfIU18RIhYBPscik/81ErX5WM6KhwStqg75c/6NAoQ3C9HxSH7YaWCeMJ3dkEmAM7
 iqBw==
X-Gm-Message-State: AOAM533V5cQ7eu0cmXLlmMGKYxHm5jl0MJOaDqnhD0PNq8CDV79CY8hq
 eGnm1HBt0O7lhHM5shVwMj8WDw==
X-Google-Smtp-Source: ABdhPJzP1NmHjrHQMM7HL0GJ31rTvRXR+Qg05Vlyi4JFfNOui5H76szu2fy1qjFZmseIDVS6BOU98g==
X-Received: by 2002:a1c:de8a:: with SMTP id v132mr860371wmg.173.1603196737971; 
 Tue, 20 Oct 2020 05:25:37 -0700 (PDT)
Received: from holly.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id z11sm2739295wrh.70.2020.10.20.05.25.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2020 05:25:37 -0700 (PDT)
Date: Tue, 20 Oct 2020 13:25:35 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Sumit Garg <sumit.garg@linaro.org>
Message-ID: <20201020122535.paym32gksuhcqtwq@holly.lan>
References: <1602673931-28782-1-git-send-email-sumit.garg@linaro.org>
 <1602673931-28782-2-git-send-email-sumit.garg@linaro.org>
 <fbf6bfecf344a06af94e17ccabb817dd@kernel.org>
 <CAFA6WYPEw5x_3zDZSnkL23YjFWbF=VkUKefM6Ts46JLVaj2sDA@mail.gmail.com>
 <f3596e3ed70737d36f72056827d7d441@kernel.org>
 <CAFA6WYMEJb0o+PMmvLh1wDhZ+M4rChP3a1cNNoEsoMS1kDWwKA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFA6WYMEJb0o+PMmvLh1wDhZ+M4rChP3a1cNNoEsoMS1kDWwKA@mail.gmail.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.67 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.67 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kUqi8-00HIuK-0x
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
Cc: Mark Rutland <mark.rutland@arm.com>, ito-yuichi@fujitsu.com,
 Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <maz@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 julien.thierry.kdev@gmail.com, Catalin Marinas <catalin.marinas@arm.com>,
 kgdb-bugreport@lists.sourceforge.net, Thomas Gleixner <tglx@linutronix.de>,
 Masayoshi Mizuma <msys.mizuma@gmail.com>, Will Deacon <will@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Tue, Oct 20, 2020 at 04:52:43PM +0530, Sumit Garg wrote:
> On Tue, 20 Oct 2020 at 15:38, Marc Zyngier <maz@kernel.org> wrote:
> >
> > On 2020-10-20 07:43, Sumit Garg wrote:
> > > On Mon, 19 Oct 2020 at 17:07, Marc Zyngier <maz@kernel.org> wrote:
> >
> > [...]
> >
> > >> > +{
> > >> > +     if (!ipi_desc)
> > >> > +             return;
> > >> > +
> > >> > +     if (is_nmi) {
> > >> > +             if (!prepare_percpu_nmi(ipi_id))
> > >> > +                     enable_percpu_nmi(ipi_id, IRQ_TYPE_NONE);
> > >> > +     } else {
> > >> > +             enable_percpu_irq(ipi_id, IRQ_TYPE_NONE);
> > >>
> > >> I'm not keen on this. Normal IRQs can't reliably work, so why do you
> > >> even bother with this?
> > >
> > > Yeah I agree but we need to support existing functionality for kgdb
> > > roundup and sysrq backtrace using normal IRQs as well.
> >
> > When has this become a requirement? I don't really see the point in
> > implementing something that is known not to work.
> >
> 
> For kgdb:
> 
> Default implementation [1] uses smp_call_function_single_async() which
> in turn will invoke IPI as a normal IRQ to roundup CPUs.
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/kernel/debug/debug_core.c#n244
> 
> For sysrq backtrace:
> 
> Default implementation [2] fallbacks to smp_call_function() (IPI as a
> normal IRQ) to print backtrace in case architecture doesn't provide
> arch_trigger_cpumask_backtrace() hook.
> 
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/tty/sysrq.c#n250
> 
> So in general, IPI as a normal IRQ is still useful for debugging but
> it can't debug a core which is stuck in deadlock with interrupts
> disabled.
> 
> And since we choose override default implementations for pseudo NMI
> support, we need to be backwards compatible for platforms which don't
> possess pseudo NMI support.

Do the fallback implementations require a new IPI? The fallbacks
could rely on existing mechanisms such as the smp_call_function
family.


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
