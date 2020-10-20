Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8E12935B1
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 20 Oct 2020 09:25:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kUm1P-0006My-QL
	for lists+kgdb-bugreport@lfdr.de; Tue, 20 Oct 2020 07:25:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1kUm1O-0006Mp-8v
 for kgdb-bugreport@lists.sourceforge.net; Tue, 20 Oct 2020 07:25:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uFAymQB2VOJ4KqiBW6CIIX7WVz/95SQLzKrOC+AcK7M=; b=EgSj1kHprcEffvYanFLwuvaOcH
 EBZbX8QWKJ95gK1YdVsu6Pcn+Xh3nOBR8YDPJ0pgceR+H8WpJc5rZ0Ll7lKwPRZA48ZXdbo9Zuj7d
 ZJvdU4a8FCkiXGK4/P7e0e91hsxTigD8gwXEion9//ivv9CIjXjs0kbbriGv1bx56H3I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uFAymQB2VOJ4KqiBW6CIIX7WVz/95SQLzKrOC+AcK7M=; b=SYF6YF5jvGzDfqgd8AdABrTYOg
 XwqJJId/F+oClwXvGXcv4tlWj1iwQu47qpyNof9d+FpV/xgHEVB9l/+ynixiF52pL5Gb0wZAsEjYu
 K0y7s7SVSrmtKdqQ4Fjv+6cnaCPpLWAIvPoZKJePoV23E2sHAYW4gvAn4SRcTlXa6u88=;
Received: from mail-lj1-f195.google.com ([209.85.208.195])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kUm1A-0055Br-2A
 for kgdb-bugreport@lists.sourceforge.net; Tue, 20 Oct 2020 07:25:25 +0000
Received: by mail-lj1-f195.google.com with SMTP id a5so892904ljj.11
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 20 Oct 2020 00:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uFAymQB2VOJ4KqiBW6CIIX7WVz/95SQLzKrOC+AcK7M=;
 b=UU9fv3TX1Idl0ZF5nRqwPtZqh2KrQur59xb/KO68AV619Hi683xOkZPqV0DprRVr9C
 pcLP4tpdvcQwwnmg6vA1E4KUlU7e4Rlb8/cTOIOxTCgwcnYUlnUsmM50q0X22F+09m3g
 lYA0iwCXt64o8BKSbCRA+tSSFePqB+k+zXChXsNCo51epWTnXUwj3swFHL/Po7/+2j6I
 3p0fM71PSmHp7FSRXep/2DPiMfanrUXBLnoCebm4iyn2uwonBI8CLRSDhezsFpH11bSG
 o57k44SMRg+fbmJGatt68vRgwCRnnlAAuViJSOZbK+3tgeDB8pH1EeMdCH4jETlJbwTm
 /+Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uFAymQB2VOJ4KqiBW6CIIX7WVz/95SQLzKrOC+AcK7M=;
 b=aWC9pV9IJ6YHMQ1SEeXhLp7F5C4A61kgnH4WB0CAzwH9DnS9DNZmuJMsFYQLoomsfv
 dtFziqt6YmeJbUk6EU4JG1rt0RzD/h++ZDCzHDs+FvH8iNtYTVqznQREFQESA2QNpbFN
 ZGfrxUGotK+iR/W68Tvy7XyA7Ujy7qqBn3nLdJf0bD31WJW4goj4JOWeywQW7bIM75sc
 6vId1FTHhO6zZrfvv2aA1HpxQ4FIswfvLtiy3hlEmFd4sCDhrqED858UslJqaHCU4Qc7
 lCOHdg93wdvRk++Icnr+pTqcpzr3I/yqMYSelUe57iCfdrS8+yABmjrdak6LuXKTqvK0
 pnsQ==
X-Gm-Message-State: AOAM5324qudzAxdvIAS1r0LNR/HB/UYUW8OAzXVuo+R0Z0qvE6POXJF0
 YgMKjFP183yAIehRb2ort3j8qEgpTEal4S6fKKOGg/gvIAE=
X-Google-Smtp-Source: ABdhPJzICliDiG4TEYZv/LnXNOTyuv/fLxshlpvP4WJfDe5kyAJCZ1j6frOcxjozui1tsGRvMnuCxXV16CPYd6o/To8=
X-Received: by 2002:a2e:9a9a:: with SMTP id p26mr537984lji.4.1603178705428;
 Tue, 20 Oct 2020 00:25:05 -0700 (PDT)
MIME-Version: 1.0
References: <1602673931-28782-1-git-send-email-sumit.garg@linaro.org>
 <1602673931-28782-3-git-send-email-sumit.garg@linaro.org>
 <294754db12f4cd8a8ec9329a44e1cf02@kernel.org>
In-Reply-To: <294754db12f4cd8a8ec9329a44e1cf02@kernel.org>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Tue, 20 Oct 2020 12:54:53 +0530
Message-ID: <CAFA6WYNAVsYTLtzHQvnJOTKG5E4iUo6FNTCQ8zHzg3_hm42kOA@mail.gmail.com>
To: Marc Zyngier <maz@kernel.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.195 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.195 listed in list.dnswl.org]
X-Headers-End: 1kUm1A-0055Br-2A
Subject: Re: [Kgdb-bugreport] [PATCH v5 2/5] irqchip/gic-v3: Enable support
 for SGIs to act as NMIs
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

On Mon, 19 Oct 2020 at 17:37, Marc Zyngier <maz@kernel.org> wrote:
>
> On 2020-10-14 12:12, Sumit Garg wrote:
> > Add support to handle SGIs as regular NMIs. As SGIs or IPIs defaults to
> > a
>
> There is nothing "regular" about NMIs.

Okay, will do s/regular/pseudo/.

> Drop "or IPIs".
> s/defaults/default/
>

Ack.

> > special flow handler: handle_percpu_devid_fasteoi_ipi(), so skip NMI
> > handler update in case of SGIs.
> >
> > Also, enable NMI support prior to gic_smp_init() as allocation of SGIs
> > as IRQs/NMIs happen as part of this routine.
> >
> > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> > ---
> >  drivers/irqchip/irq-gic-v3.c | 13 +++++++++++--
> >  1 file changed, 11 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/irqchip/irq-gic-v3.c
> > b/drivers/irqchip/irq-gic-v3.c
> > index 16fecc0..5efc865 100644
> > --- a/drivers/irqchip/irq-gic-v3.c
> > +++ b/drivers/irqchip/irq-gic-v3.c
> > @@ -477,6 +477,11 @@ static int gic_irq_nmi_setup(struct irq_data *d)
> >       if (WARN_ON(gic_irq(d) >= 8192))
> >               return -EINVAL;
> >
> > +     if (get_intid_range(d) == SGI_RANGE) {
> > +             gic_irq_set_prio(d, GICD_INT_NMI_PRI);
> > +             return 0;
> > +     }
> > +
>
> Please follow the existing control flow, or rework it to be organised by
> range.

Okay.

>
> >       /* desc lock should already be held */
> >       if (gic_irq_in_rdist(d)) {
> >               u32 idx = gic_get_ppi_index(d);
> > @@ -514,6 +519,11 @@ static void gic_irq_nmi_teardown(struct irq_data
> > *d)
> >       if (WARN_ON(gic_irq(d) >= 8192))
> >               return;
> >
> > +     if (get_intid_range(d) == SGI_RANGE) {
> > +             gic_irq_set_prio(d, GICD_INT_DEF_PRI);
> > +             return;
> > +     }
>
> Same here.

Okay.

-Sumit

>
> > +
> >       /* desc lock should already be held */
> >       if (gic_irq_in_rdist(d)) {
> >               u32 idx = gic_get_ppi_index(d);
> > @@ -1708,6 +1718,7 @@ static int __init gic_init_bases(void __iomem
> > *dist_base,
> >
> >       gic_dist_init();
> >       gic_cpu_init();
> > +     gic_enable_nmi_support();
> >       gic_smp_init();
> >       gic_cpu_pm_init();
> >
> > @@ -1719,8 +1730,6 @@ static int __init gic_init_bases(void __iomem
> > *dist_base,
> >                       gicv2m_init(handle, gic_data.domain);
> >       }
> >
> > -     gic_enable_nmi_support();
> > -
> >       return 0;
> >
> >  out_free:
>
> Thanks,
>
>          M.
> --
> Jazz is not dead. It just smells funny...


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
