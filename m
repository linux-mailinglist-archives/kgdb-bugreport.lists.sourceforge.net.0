Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BFFC91BD72B
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 29 Apr 2020 10:23:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jTi0H-0000LO-Jh
	for lists+kgdb-bugreport@lfdr.de; Wed, 29 Apr 2020 08:23:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <maz@kernel.org>) id 1jTi0G-0000LB-Rg
 for kgdb-bugreport@lists.sourceforge.net; Wed, 29 Apr 2020 08:23:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-ID:References:In-Reply-To:Subject:Cc:To:
 From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:Sender:Reply-To
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=o7ukgnSCeViuUA9cE3rI4haSNCh4jlrSvYoXmDa6LdE=; b=XMJMshBJGKO3GTDsi/2WW0J+8F
 427OOjnmKOnXWBrjK8VELjg5YdxZan3gD1QynWjVlVboEZNA8i/MOcvqSKWDR+gMpwvrqjhcoL/IS
 yDKJ08wFf7g3Y0/qAd9skF5k8tVcS+Wif1udA9CxNRte68dab0KeVmhhAOdUevRMqHdg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=o7ukgnSCeViuUA9cE3rI4haSNCh4jlrSvYoXmDa6LdE=; b=CLNl/OjfdrMG3vgx0MCoV1X4Gh
 oDsyQ5EQwWHEOOQb0kpHaT7Q2nPo4KFrVs/YA8tJbJ+Q/PzrnkC0yqv6pRmOHe/WF1BsZ7hQ9ojcC
 XO1OkgALKp6dH2p7Du1FFofqYFTMYftQEvZMFdwRrAPDsoBfapwR660XBVU66ckPKXkQ=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jTi0F-00G0HI-Fg
 for kgdb-bugreport@lists.sourceforge.net; Wed, 29 Apr 2020 08:23:36 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CFE0F2083B;
 Wed, 29 Apr 2020 08:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588148610;
 bh=0UVv0Dm6NAErwc46CCRtkpaSdr1MlLFvEVwXEGbstNA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=aoLDgHdyIr+7W5xjns+neFIwh9hDaeAV6+CyFVferesQpAFjCj0WnD1g+EpqRxgLr
 FdtauSNQC/wUywx9rIB7VqSy9flTvXwa5TK2V8DtppAObzKxeGnHjX/RcHjTIRU5hP
 z+3pVZemfC5CO5EY9/MPNz6kQ7cfs+0vbvHBrBlo=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <maz@kernel.org>)
 id 1jTi08-007e8O-7P; Wed, 29 Apr 2020 09:23:28 +0100
MIME-Version: 1.0
Date: Wed, 29 Apr 2020 09:23:28 +0100
From: Marc Zyngier <maz@kernel.org>
To: Sumit Garg <sumit.garg@linaro.org>
In-Reply-To: <CAFA6WYPNNNZeX5zpadayfiZ7P_mHmiREpUd5LZ3Jp+TjGVqoEw@mail.gmail.com>
References: <1587726554-32018-1-git-send-email-sumit.garg@linaro.org>
 <1587726554-32018-3-git-send-email-sumit.garg@linaro.org>
 <20200425112950.3a4815b6@why> <6fd3d96181ec53f735ef1b6a79d28da1@kernel.org>
 <CAFA6WYPNNNZeX5zpadayfiZ7P_mHmiREpUd5LZ3Jp+TjGVqoEw@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <ac57cb4bbb6507ee98f199d68a514503@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: sumit.garg@linaro.org, daniel.thompson@linaro.org,
 jason@lakedaemon.net, catalin.marinas@arm.com, dianders@chromium.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 jason.wessel@windriver.com, kgdb-bugreport@lists.sourceforge.net,
 tglx@linutronix.de, will@kernel.org, julien.thierry.kdev@gmail.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1jTi0F-00G0HI-Fg
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi Sumit,

On 2020-04-28 15:11, Sumit Garg wrote:
> Hi Marc,
> 
> Thanks for your comments and apologies for my delayed response as I
> was exploring ideas that you have shared.
> 
> On Sat, 25 Apr 2020 at 20:02, Marc Zyngier <maz@kernel.org> wrote:
>> 
>> On 2020-04-25 11:29, Marc Zyngier wrote:
>> > On Fri, 24 Apr 2020 16:39:12 +0530
>> > Sumit Garg <sumit.garg@linaro.org> wrote:
>> >
>> > Hi Sumit,
>> >
>> >> With pseudo NMIs enabled, interrupt controller can be configured to
>> >> deliver SGI as a pseudo NMI. So add corresponding handling for SGIs.
>> >>
>> >> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
>> >> ---
>> >>  drivers/irqchip/irq-gic-v3.c | 22 +++++++++++++++++-----
>> >>  1 file changed, 17 insertions(+), 5 deletions(-)
>> >>
>> >> diff --git a/drivers/irqchip/irq-gic-v3.c
>> >> b/drivers/irqchip/irq-gic-v3.c
>> >> index d7006ef..be361bf 100644
>> >> --- a/drivers/irqchip/irq-gic-v3.c
>> >> +++ b/drivers/irqchip/irq-gic-v3.c
>> >> @@ -609,17 +609,29 @@ static inline void gic_handle_nmi(u32 irqnr,
>> >> struct pt_regs *regs)
>> >>      if (irqs_enabled)
>> >>              nmi_enter();
>> >>
>> >> -    if (static_branch_likely(&supports_deactivate_key))
>> >> -            gic_write_eoir(irqnr);
>> >>      /*
>> >>       * Leave the PSR.I bit set to prevent other NMIs to be
>> >>       * received while handling this one.
>> >>       * PSR.I will be restored when we ERET to the
>> >>       * interrupted context.
>> >>       */
>> >> -    err = handle_domain_nmi(gic_data.domain, irqnr, regs);
>> >> -    if (err)
>> >> -            gic_deactivate_unhandled(irqnr);
>> >> +    if (likely(irqnr > 15)) {
>> >> +            if (static_branch_likely(&supports_deactivate_key))
>> >> +                    gic_write_eoir(irqnr);
>> >> +
>> >> +            err = handle_domain_nmi(gic_data.domain, irqnr, regs);
>> >> +            if (err)
>> >> +                    gic_deactivate_unhandled(irqnr);
>> >> +    } else {
>> >> +            gic_write_eoir(irqnr);
>> >> +            if (static_branch_likely(&supports_deactivate_key))
>> >> +                    gic_write_dir(irqnr);
>> >> +#ifdef CONFIG_SMP
>> >> +            handle_IPI(irqnr, regs);
>> >> +#else
>> >> +            WARN_ONCE(true, "Unexpected SGI received!\n");
>> >> +#endif
>> >> +    }
>> >>
>> >>      if (irqs_enabled)
>> >>              nmi_exit();
>> >
>> > If there is one thing I would like to avoid, it is to add more ugly
>> > hacks to the way we handle SGIs. There is very little reason why SGIs
>> > should be handled differently from all other interrupts. They have the
>> > same properties, and it is only because of the 32bit legacy that we
>> > deal
>> > with them in such a cumbersome way. Nothing that we cannot fix though.
>> >
>> > What I would really like to see is first a conversion of the SGIs to
>> > normal, full fat interrupts. These interrupts can then be configured as
>> > NMI using the normal API.
>> >
>> > I think Julien had something along these lines (or was that limited to
>> > the PMU?). Otherwise, I'll happily help you with that.
>> 
>> OK, to give you an idea of what I am after, here's a small series[1]
>> that
>> can be used as a base (it has been booted exactly *once* on a model, 
>> and
>> is thus absolutely perfect ;-).
> 
> Thanks for this series. I have re-based my patch-set on top of this
> series [1] and just dropped this patch #2. It works fine for me.

I just had a look.

"irqchip/gic-v3: Enable arch specific IPI as pseudo NMI" is still done
the wrong way, I'm afraid. You directly poke into the GIC configuration,
which isn't acceptable, as you leave the rest of the kernel completely
unaware that this is a NMI. You should make the interrupt a NMI as it
is being configured in gic_smp_init(), calling request_nmi() at this 
stage.

>> 
>> There is still a bit of work to be able to actually request a SGI 
>> (they
>> are hard-wired as chained interrupts so far, as this otherwise changes
>> the output of /proc/interrupts, among other things), but you will
>> hopefully see what I'm aiming for.
> 
> I was exploring this idea: "request a SGI". I guess here you meant to
> request a new SGI as a normal NMI/IRQ via common APIs such as
> request_percpu_nmi() or request_percpu_irq() rather than statically
> adding a new IPI as per this patch [2], correct? If yes, then I have
> following follow up queries:
> 
> 1. Do you envision any drivers to use SGIs in a similar manner as they
> use SPIs or PPIs?

No. SGIs are already pretty much all allocated for the kernel's internal
needs and once we allocate an additional one for this KGDB feature,
we're out of non-secure SGIs. We could start a multiplexing scheme to
overcome this, but the kernel already has plenty of other mechanisms
for internal communication. After all, why would you need anything more
than smp_call_function()?

The single use case I can imagine is that you'd want to signal a CPU
that isn't running Linux. This would require a lot more work than
just an interrupt, and is out of scope for the time being.

> 2. How do you envision allocation of SGIs as currently they are
> hardcoded in an arch specific file (like arch/arm64/kernel/smp.c
> +794)?

What I would like is for the arch code to request these interrupts as
normal interrupts, for which there is one problem to solve: how do you
find out about the Linux IRQ number for a given IPI. Or rather, how
do you get rid of the requirement to have IPI numbers at all and just
say "give me a per-cpu interrupt that I can use as an IPI, and by the
way here's the handler you can call".

And I insist: this is only for the arch code. Nothing else.

> 3. AFAIK, the major difference among SGIs and SPIs or PPIs is the
> trigger method where SGIs are software triggered and SPIs or PPIs are
> hardware triggered. And I couldn't find a generalized method across
> architectures to invoke SGIs. So how do you envision drivers to invoke
> SGIs in an architecture agnostic manner?

Well, SGIs are not architecture agnostic. They are fundamentally part of
the GIC architecture, which only exists for the two ARM architectures.

SGIs are not a general purpose mechanism. IPIs are, and we have services
on top of IPIs, such as invoking a function on a remote CPU. What else
do you need?

Thanks,

          M.
-- 
Jazz is not dead. It just smells funny...


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
