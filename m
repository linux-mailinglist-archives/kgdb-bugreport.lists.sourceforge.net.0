Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2001BC0D2
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 28 Apr 2020 16:12:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jTQy8-0000aX-Uw
	for lists+kgdb-bugreport@lfdr.de; Tue, 28 Apr 2020 14:12:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1jTQy7-0000aQ-81
 for kgdb-bugreport@lists.sourceforge.net; Tue, 28 Apr 2020 14:12:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9t0tu6yYKzN35uBYTbFFPc0dS5Ew+chbn+hE8zcVYWQ=; b=DiYDlQT01auvVjxttUIynKeuPN
 N9EOKcQ/tR6zvlC3qpLRPgUwgFeXvbWTfjlCwhqU7PYwQ8FaU9fVTcSkl8Dn6kyQvzjqwpQj9Ne9B
 qYXHX5N6EUTBzNTQUanIWdhfrrhfme5qlb75kSrKBDzRQaLO0OefwOcHJd6TOTi9QMiU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9t0tu6yYKzN35uBYTbFFPc0dS5Ew+chbn+hE8zcVYWQ=; b=MANz8lzotKUOeZ1kTD2k1Tk3lq
 eXnrvXCCCkoSuw6c1bXkq8FFUqdtKmg853OCdTsavmuLCma5pOth/heXfF1DL6emmvn3GPxY8WkHU
 f/qRkajQPlb0De0a82TIyNQ3VWKj5YTT2BXyMHcmGiUl5dKTBIwBsc/S3qVCauA28hG4=;
Received: from mail-lj1-f196.google.com ([209.85.208.196])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jTQy2-002F0K-9q
 for kgdb-bugreport@lists.sourceforge.net; Tue, 28 Apr 2020 14:12:15 +0000
Received: by mail-lj1-f196.google.com with SMTP id e25so21649419ljg.5
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 28 Apr 2020 07:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9t0tu6yYKzN35uBYTbFFPc0dS5Ew+chbn+hE8zcVYWQ=;
 b=TyNk0pickYyy84k5NMTmvZ7WzQe7BnjIVvEcEofdf2pnFIF3UDagf9JUJ7ut92Rts+
 nXjwA9FP0UEvwZWuaI149nPEKt2yL8xUPonbQ9mtHTJjvMD/Ne/JMiOEcPscYQxC3BVd
 abFsVjRNuG1rglN1RNryTYcYXYInUM8AtHmY6EsqusqThuai3b1BiDUeb8DBaR3Mr8kf
 D9CZS48ljYs/GL52sBAI0g72KUUbAxeFaqGK+hw9/sGTqDJmNdX0D+nQKFKNj+3ua56o
 3qSpsNHTdHoduEWEIm2bb+bl32dw2mvf8MjPPX++HTjz3y89q2OJqYHsBwaDuCVI+U1T
 9/Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9t0tu6yYKzN35uBYTbFFPc0dS5Ew+chbn+hE8zcVYWQ=;
 b=pSCfbBcjaWvzESJMqFu1N1s1/nJxTdxrDHk9TyX9MarzPA/pAg6JIR/+08wLlvIPTd
 PCnSE9KzQD5bIrwK4dt5WE6OdL2ofg50XcHSodjxWwl0wzMqzSqzBGLwan1RJZpqnbVe
 1uIiRYM1jNe4xkYbms6a92VNKy6m91TZDTeT3tihSCp7bziGOLQ/0sH6xy2b9d+otmFc
 mjFTzGUNOwN5QowjRpzeEwde087q1btPuIIPhrdgLBaB+vnsnltBd4Mhkqq4B9+e9JdZ
 9v+T8PwhroKlnBLTwGmlYcfWkSY4XyESgYfpCr73KiYXSpB+3BQszK7/kcrNFbc7Lmkp
 yuAA==
X-Gm-Message-State: AGi0PuY9XvDN7UGVgoBKRDp8Uky3kd/QNOkPemf84YQL1eD7/4Z9FJ2t
 1KtILFJH8n2eyDt41q3p/kHskC9pZv56d+E/x0+0/A==
X-Google-Smtp-Source: APiQypLKjTvcl707sIjTA8Gi7R58xVWA0sIpl7IXDlKPS6s5Rejq4xHZpXS8mo+iRC6XTT0VWMqVNlDJbIp6fcMI3sI=
X-Received: by 2002:a2e:3809:: with SMTP id f9mr17881928lja.281.1588083123472; 
 Tue, 28 Apr 2020 07:12:03 -0700 (PDT)
MIME-Version: 1.0
References: <1587726554-32018-1-git-send-email-sumit.garg@linaro.org>
 <1587726554-32018-3-git-send-email-sumit.garg@linaro.org>
 <20200425112950.3a4815b6@why>
 <6fd3d96181ec53f735ef1b6a79d28da1@kernel.org>
In-Reply-To: <6fd3d96181ec53f735ef1b6a79d28da1@kernel.org>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Tue, 28 Apr 2020 19:41:50 +0530
Message-ID: <CAFA6WYPNNNZeX5zpadayfiZ7P_mHmiREpUd5LZ3Jp+TjGVqoEw@mail.gmail.com>
To: Marc Zyngier <maz@kernel.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.196 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.196 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jTQy2-002F0K-9q
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

Thanks for your comments and apologies for my delayed response as I
was exploring ideas that you have shared.

On Sat, 25 Apr 2020 at 20:02, Marc Zyngier <maz@kernel.org> wrote:
>
> On 2020-04-25 11:29, Marc Zyngier wrote:
> > On Fri, 24 Apr 2020 16:39:12 +0530
> > Sumit Garg <sumit.garg@linaro.org> wrote:
> >
> > Hi Sumit,
> >
> >> With pseudo NMIs enabled, interrupt controller can be configured to
> >> deliver SGI as a pseudo NMI. So add corresponding handling for SGIs.
> >>
> >> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> >> ---
> >>  drivers/irqchip/irq-gic-v3.c | 22 +++++++++++++++++-----
> >>  1 file changed, 17 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/drivers/irqchip/irq-gic-v3.c
> >> b/drivers/irqchip/irq-gic-v3.c
> >> index d7006ef..be361bf 100644
> >> --- a/drivers/irqchip/irq-gic-v3.c
> >> +++ b/drivers/irqchip/irq-gic-v3.c
> >> @@ -609,17 +609,29 @@ static inline void gic_handle_nmi(u32 irqnr,
> >> struct pt_regs *regs)
> >>      if (irqs_enabled)
> >>              nmi_enter();
> >>
> >> -    if (static_branch_likely(&supports_deactivate_key))
> >> -            gic_write_eoir(irqnr);
> >>      /*
> >>       * Leave the PSR.I bit set to prevent other NMIs to be
> >>       * received while handling this one.
> >>       * PSR.I will be restored when we ERET to the
> >>       * interrupted context.
> >>       */
> >> -    err = handle_domain_nmi(gic_data.domain, irqnr, regs);
> >> -    if (err)
> >> -            gic_deactivate_unhandled(irqnr);
> >> +    if (likely(irqnr > 15)) {
> >> +            if (static_branch_likely(&supports_deactivate_key))
> >> +                    gic_write_eoir(irqnr);
> >> +
> >> +            err = handle_domain_nmi(gic_data.domain, irqnr, regs);
> >> +            if (err)
> >> +                    gic_deactivate_unhandled(irqnr);
> >> +    } else {
> >> +            gic_write_eoir(irqnr);
> >> +            if (static_branch_likely(&supports_deactivate_key))
> >> +                    gic_write_dir(irqnr);
> >> +#ifdef CONFIG_SMP
> >> +            handle_IPI(irqnr, regs);
> >> +#else
> >> +            WARN_ONCE(true, "Unexpected SGI received!\n");
> >> +#endif
> >> +    }
> >>
> >>      if (irqs_enabled)
> >>              nmi_exit();
> >
> > If there is one thing I would like to avoid, it is to add more ugly
> > hacks to the way we handle SGIs. There is very little reason why SGIs
> > should be handled differently from all other interrupts. They have the
> > same properties, and it is only because of the 32bit legacy that we
> > deal
> > with them in such a cumbersome way. Nothing that we cannot fix though.
> >
> > What I would really like to see is first a conversion of the SGIs to
> > normal, full fat interrupts. These interrupts can then be configured as
> > NMI using the normal API.
> >
> > I think Julien had something along these lines (or was that limited to
> > the PMU?). Otherwise, I'll happily help you with that.
>
> OK, to give you an idea of what I am after, here's a small series[1]
> that
> can be used as a base (it has been booted exactly *once* on a model, and
> is thus absolutely perfect ;-).

Thanks for this series. I have re-based my patch-set on top of this
series [1] and just dropped this patch #2. It works fine for me.

>
> There is still a bit of work to be able to actually request a SGI (they
> are hard-wired as chained interrupts so far, as this otherwise changes
> the output of /proc/interrupts, among other things), but you will
> hopefully see what I'm aiming for.

I was exploring this idea: "request a SGI". I guess here you meant to
request a new SGI as a normal NMI/IRQ via common APIs such as
request_percpu_nmi() or request_percpu_irq() rather than statically
adding a new IPI as per this patch [2], correct? If yes, then I have
following follow up queries:

1. Do you envision any drivers to use SGIs in a similar manner as they
use SPIs or PPIs?
2. How do you envision allocation of SGIs as currently they are
hardcoded in an arch specific file (like arch/arm64/kernel/smp.c
+794)?
3. AFAIK, the major difference among SGIs and SPIs or PPIs is the
trigger method where SGIs are software triggered and SPIs or PPIs are
hardware triggered. And I couldn't find a generalized method across
architectures to invoke SGIs. So how do you envision drivers to invoke
SGIs in an architecture agnostic manner?

[1] https://git.linaro.org/people/sumit.garg/linux.git/?h=kgdb-nmi
[2] https://git.linaro.org/people/sumit.garg/linux.git/commit/?h=kgdb-nmi&id=fc89e5f395f89966110554a15ab0fa0f0d471132

-Sumit

>
> Thanks,
>
>          M.
>
> [1]
> https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git/log/?h=irq/gic-sgi
> --
> Jazz is not dead. It just smells funny...


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
