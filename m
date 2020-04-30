Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C0E1BF13B
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 30 Apr 2020 09:20:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jU3VC-00044I-3t
	for lists+kgdb-bugreport@lfdr.de; Thu, 30 Apr 2020 07:20:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1jU3V9-000446-RX
 for kgdb-bugreport@lists.sourceforge.net; Thu, 30 Apr 2020 07:20:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sZr1+3vRqE2FhkSDX5CtrXLEsRTbr/eXU3dnq5Mc93U=; b=DiUqo+RKLxgpkeveCJreS9haza
 06V2nfgBThGhngq9dmlXvXR1Q6+wFXR68JlVUCNzO1W6+dpqf75itOUTdFtfcGnccl5BNNU2QQSP8
 hsWBHgcUtmyQvt2/GD2qnM7ByU6wT/gcr/mGWsSKG7UlFocZMSidQzuaW8IOPtX7ItrU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sZr1+3vRqE2FhkSDX5CtrXLEsRTbr/eXU3dnq5Mc93U=; b=UKza/b9KT6giMCUOIo27QcVdae
 hDkssSiaJL3tQ2ShFhavEFWu5HW+r6iWUdl1/zhqhGR3rbpYPCENBJRBzy/IT7NM/X0e5uCRkWquw
 exardY9uPEEsj0XUCp3rYWrd+MCk4CgM1HYpHbTAlHG4hqvll3s1Hx/Sl0DOFH5dXsD0=;
Received: from mail-lj1-f195.google.com ([209.85.208.195])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jU3V4-00H36L-LR
 for kgdb-bugreport@lists.sourceforge.net; Thu, 30 Apr 2020 07:20:55 +0000
Received: by mail-lj1-f195.google.com with SMTP id y4so5323586ljn.7
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 30 Apr 2020 00:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sZr1+3vRqE2FhkSDX5CtrXLEsRTbr/eXU3dnq5Mc93U=;
 b=VfgVR9kKpczFIeN8+LnvP75Wr/OHUdd2lCZEgYm3svO+8+riMTwzBRxO3Cq9J/TmLy
 ChH42dOaLXAXEjr5NC5/1e8eDGNWYtF6C0jm+iiDKuZkbZQPWzgw7D3QEc//FdP1Jsf6
 4666lNVgzk7UM9nzTjLN0iJ+ibaKAS3FF48QAuNBMS7GvyxtQqRiGa42vUoO1TIWK4gT
 iQkBiiMKb0BIJStddAjAiqa0Z/KOZSANm/AiLNWfKVkVCqHX9I5BMPlA6jCtli3TGAkr
 brC3qTzapu8AcZ/0uZv78PL84nfqYZkh7DV5N5duQi/Y91l4Mxab5cIqLrjZh7Z4JuFw
 +0sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sZr1+3vRqE2FhkSDX5CtrXLEsRTbr/eXU3dnq5Mc93U=;
 b=RO6WkiTVZ+IW/qSjUQNID0ascfByxFHqPU237csbQ5lNypVMjBAfj/23Y4ZSlwIiGS
 FOXCKMUJyRkHXH1jLged8gDwEIXeZJDl/8mRnKirf0rrtIf29cTm+hTcULV26zc7chUS
 +b0Mc5tPv+P4gC0nVdPRS/n8EtCuOPfEVSFCUwzQzO1ByQvvKC4hSlrFIx1ZVh60nqcP
 k6oBaxHGWFdu2ZSb8xeJ3ubRlfgHaxO8bEGaBbhofFDcvIL0esJaIfRxhbS3SEuNy++F
 uXjt5jAQz2Ns88Nwv9TRPF8zb16au+H+6JM1c5wmZdYU/K36PjDSgfxRi4y9OIJsf2qx
 DbJg==
X-Gm-Message-State: AGi0PubKe2vGKqf3U3mSm2+MEwE85qVlMtGLmJqeERKnoDFcwXIvuBFJ
 9H2sIyCJ0xtpy7sD1mRr3isKJCMpb900JJ88IkpZMw==
X-Google-Smtp-Source: APiQypK4Y04DV3XhNEdb66Dsm96rNOrnM5vyzC6FyLQ9pLxPdGP3mKpGyotMazaX8TgXg6B+lWsEIipHmTHJXN1XPRQ=
X-Received: by 2002:a2e:a365:: with SMTP id i5mr1242958ljn.293.1588231241153; 
 Thu, 30 Apr 2020 00:20:41 -0700 (PDT)
MIME-Version: 1.0
References: <1587726554-32018-1-git-send-email-sumit.garg@linaro.org>
 <1587726554-32018-3-git-send-email-sumit.garg@linaro.org>
 <20200425112950.3a4815b6@why>
 <6fd3d96181ec53f735ef1b6a79d28da1@kernel.org>
 <CAFA6WYPNNNZeX5zpadayfiZ7P_mHmiREpUd5LZ3Jp+TjGVqoEw@mail.gmail.com>
 <ac57cb4bbb6507ee98f199d68a514503@kernel.org>
In-Reply-To: <ac57cb4bbb6507ee98f199d68a514503@kernel.org>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Thu, 30 Apr 2020 12:50:28 +0530
Message-ID: <CAFA6WYMheJxeKVC_YWN9owNJhcWTBsaOCvZXxq=GVj5ROJ0cvg@mail.gmail.com>
To: Marc Zyngier <maz@kernel.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.195 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.195 listed in wl.mailspike.net]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jU3V4-00H36L-LR
Subject: Re: [Kgdb-bugreport] [RFC Patch v1 2/4] irqchip/gic-v3: Add support
 to handle SGI as pseudo NMI
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
 Jason Cooper <jason@lakedaemon.net>, Catalin Marinas <catalin.marinas@arm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 julien.thierry.kdev@gmail.com, Jason Wessel <jason.wessel@windriver.com>,
 kgdb-bugreport@lists.sourceforge.net, Thomas Gleixner <tglx@linutronix.de>,
 Will Deacon <will@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi Marc,

On Wed, 29 Apr 2020 at 13:53, Marc Zyngier <maz@kernel.org> wrote:
>
> Hi Sumit,
>
> On 2020-04-28 15:11, Sumit Garg wrote:
> > Hi Marc,
> >
> > Thanks for your comments and apologies for my delayed response as I
> > was exploring ideas that you have shared.
> >
> > On Sat, 25 Apr 2020 at 20:02, Marc Zyngier <maz@kernel.org> wrote:
> >>
> >> On 2020-04-25 11:29, Marc Zyngier wrote:
> >> > On Fri, 24 Apr 2020 16:39:12 +0530
> >> > Sumit Garg <sumit.garg@linaro.org> wrote:
> >> >
> >> > Hi Sumit,
> >> >
> >> >> With pseudo NMIs enabled, interrupt controller can be configured to
> >> >> deliver SGI as a pseudo NMI. So add corresponding handling for SGIs.
> >> >>
> >> >> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> >> >> ---
> >> >>  drivers/irqchip/irq-gic-v3.c | 22 +++++++++++++++++-----
> >> >>  1 file changed, 17 insertions(+), 5 deletions(-)
> >> >>
> >> >> diff --git a/drivers/irqchip/irq-gic-v3.c
> >> >> b/drivers/irqchip/irq-gic-v3.c
> >> >> index d7006ef..be361bf 100644
> >> >> --- a/drivers/irqchip/irq-gic-v3.c
> >> >> +++ b/drivers/irqchip/irq-gic-v3.c
> >> >> @@ -609,17 +609,29 @@ static inline void gic_handle_nmi(u32 irqnr,
> >> >> struct pt_regs *regs)
> >> >>      if (irqs_enabled)
> >> >>              nmi_enter();
> >> >>
> >> >> -    if (static_branch_likely(&supports_deactivate_key))
> >> >> -            gic_write_eoir(irqnr);
> >> >>      /*
> >> >>       * Leave the PSR.I bit set to prevent other NMIs to be
> >> >>       * received while handling this one.
> >> >>       * PSR.I will be restored when we ERET to the
> >> >>       * interrupted context.
> >> >>       */
> >> >> -    err = handle_domain_nmi(gic_data.domain, irqnr, regs);
> >> >> -    if (err)
> >> >> -            gic_deactivate_unhandled(irqnr);
> >> >> +    if (likely(irqnr > 15)) {
> >> >> +            if (static_branch_likely(&supports_deactivate_key))
> >> >> +                    gic_write_eoir(irqnr);
> >> >> +
> >> >> +            err = handle_domain_nmi(gic_data.domain, irqnr, regs);
> >> >> +            if (err)
> >> >> +                    gic_deactivate_unhandled(irqnr);
> >> >> +    } else {
> >> >> +            gic_write_eoir(irqnr);
> >> >> +            if (static_branch_likely(&supports_deactivate_key))
> >> >> +                    gic_write_dir(irqnr);
> >> >> +#ifdef CONFIG_SMP
> >> >> +            handle_IPI(irqnr, regs);
> >> >> +#else
> >> >> +            WARN_ONCE(true, "Unexpected SGI received!\n");
> >> >> +#endif
> >> >> +    }
> >> >>
> >> >>      if (irqs_enabled)
> >> >>              nmi_exit();
> >> >
> >> > If there is one thing I would like to avoid, it is to add more ugly
> >> > hacks to the way we handle SGIs. There is very little reason why SGIs
> >> > should be handled differently from all other interrupts. They have the
> >> > same properties, and it is only because of the 32bit legacy that we
> >> > deal
> >> > with them in such a cumbersome way. Nothing that we cannot fix though.
> >> >
> >> > What I would really like to see is first a conversion of the SGIs to
> >> > normal, full fat interrupts. These interrupts can then be configured as
> >> > NMI using the normal API.
> >> >
> >> > I think Julien had something along these lines (or was that limited to
> >> > the PMU?). Otherwise, I'll happily help you with that.
> >>
> >> OK, to give you an idea of what I am after, here's a small series[1]
> >> that
> >> can be used as a base (it has been booted exactly *once* on a model,
> >> and
> >> is thus absolutely perfect ;-).
> >
> > Thanks for this series. I have re-based my patch-set on top of this
> > series [1] and just dropped this patch #2. It works fine for me.
>
> I just had a look.
>
> "irqchip/gic-v3: Enable arch specific IPI as pseudo NMI" is still done
> the wrong way, I'm afraid. You directly poke into the GIC configuration,
> which isn't acceptable, as you leave the rest of the kernel completely
> unaware that this is a NMI. You should make the interrupt a NMI as it
> is being configured in gic_smp_init(), calling request_nmi() at this
> stage.

Sure, I will try to follow your suggestion. But I think it's better to
first generalize the base IPI allocation scheme.

>
> >>
> >> There is still a bit of work to be able to actually request a SGI
> >> (they
> >> are hard-wired as chained interrupts so far, as this otherwise changes
> >> the output of /proc/interrupts, among other things), but you will
> >> hopefully see what I'm aiming for.
> >
> > I was exploring this idea: "request a SGI". I guess here you meant to
> > request a new SGI as a normal NMI/IRQ via common APIs such as
> > request_percpu_nmi() or request_percpu_irq() rather than statically
> > adding a new IPI as per this patch [2], correct? If yes, then I have
> > following follow up queries:
> >
> > 1. Do you envision any drivers to use SGIs in a similar manner as they
> > use SPIs or PPIs?
>
> No. SGIs are already pretty much all allocated for the kernel's internal
> needs and once we allocate an additional one for this KGDB feature,
> we're out of non-secure SGIs. We could start a multiplexing scheme to
> overcome this, but the kernel already has plenty of other mechanisms
> for internal communication. After all, why would you need anything more
> than smp_call_function()?
>
> The single use case I can imagine is that you'd want to signal a CPU
> that isn't running Linux. This would require a lot more work than
> just an interrupt, and is out of scope for the time being.

Thanks for the clarification.

>
> > 2. How do you envision allocation of SGIs as currently they are
> > hardcoded in an arch specific file (like arch/arm64/kernel/smp.c
> > +794)?
>
> What I would like is for the arch code to request these interrupts as
> normal interrupts, for which there is one problem to solve: how do you
> find out about the Linux IRQ number for a given IPI. Or rather, how
> do you get rid of the requirement to have IPI numbers at all and just
> say "give me a per-cpu interrupt that I can use as an IPI, and by the
> way here's the handler you can call".

I think what you are looking for here is something that could be
sufficed via enabling "CONFIG_GENERIC_IRQ_IPI" framework for arm64/arm
architectures. It's currently used for mips architecture. Looking at
its implementation, I think it should be possible to hook up SGIs
under new IPI irq_domain for GICv2/v3.

So with this framework we should be able to dynamically allocate IPIs
and use common APIs such as request_irq()/request_nmi() to tell IPI
specific handlers.

If this approach looks sane to you then I can start working on a PoC
implementation for arm64.

>
> And I insist: this is only for the arch code. Nothing else.
>

Makes sense.

> > 3. AFAIK, the major difference among SGIs and SPIs or PPIs is the
> > trigger method where SGIs are software triggered and SPIs or PPIs are
> > hardware triggered. And I couldn't find a generalized method across
> > architectures to invoke SGIs. So how do you envision drivers to invoke
> > SGIs in an architecture agnostic manner?
>
> Well, SGIs are not architecture agnostic. They are fundamentally part of
> the GIC architecture, which only exists for the two ARM architectures.
>
> SGIs are not a general purpose mechanism. IPIs are, and we have services
> on top of IPIs, such as invoking a function on a remote CPU. What else
> do you need?

Yeah that was mine understanding as well. But I was just clarifying if
you have any further use-cases in mind for IPIs.

-Sunit

>
> Thanks,
>
>           M.
> --
> Jazz is not dead. It just smells funny...


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
