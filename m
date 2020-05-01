Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D18281C12A8
	for <lists+kgdb-bugreport@lfdr.de>; Fri,  1 May 2020 15:12:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jUVT0-0000fh-Fi
	for lists+kgdb-bugreport@lfdr.de; Fri, 01 May 2020 13:12:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1jUVSy-0000fI-Tu
 for kgdb-bugreport@lists.sourceforge.net; Fri, 01 May 2020 13:12:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8Jgeb9V3DPGc3QB1JR0CXzxKdYexNkGLUlFPYO765RE=; b=h672A30tnNdx4LfG3KcnoUlReg
 oQGnXPgmRuy6UaciWTL/NEcdC7/KtxFR6DzoWCGaWinrRtai6AKP3xuWyqvy4McBdaz6ZByAJI4bG
 Mw3KNMzEmvun4QZnbv+1s3xolHPauFaBZ2I6rx5QBpsj6t1QkcWnuC36Np2cWkmVYizE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8Jgeb9V3DPGc3QB1JR0CXzxKdYexNkGLUlFPYO765RE=; b=Qr8Fnmdi43n108hNhlsqCsc5Vp
 SAf4K45bZjuSHFgBdj+NJZ6SiVrUG3vPhVKawUQlNuHGPraSJjZzDXmmhpjXRDpEaOQ8+gd3+Jknu
 px0J0vrSVOE3ea5WmQ5/vyVK8FSa5hZTewSfUKJhMCj6yhxrGHwXbmizbH4Bz1aNArQg=;
Received: from mail-ed1-f67.google.com ([209.85.208.67])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jUVSu-000u8Z-NZ
 for kgdb-bugreport@lists.sourceforge.net; Fri, 01 May 2020 13:12:32 +0000
Received: by mail-ed1-f67.google.com with SMTP id f12so7193329edn.12
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 01 May 2020 06:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8Jgeb9V3DPGc3QB1JR0CXzxKdYexNkGLUlFPYO765RE=;
 b=Ep/JYE+pXNaF2jDBd53wSJFYCpQyr+GZQGkKjYehGJpzYOwsHtjJZlCiDluROVGhw8
 mh0y6uE8ZL4CUWJgWsHM3ewNLXSOO++i0MpuBI1S1W3fOtozD29ktM3tYhfje1aoZFE8
 2NgwDDlnFIvZiBFRm/X5nnJlJqs1KzQjp3kTmtQgbI0JQpd0c2+jkoGJddsoJf0a/YwV
 RnfuLo16PjkI1r7eNAQS1o/p+9bkYrGw34GmcyjdbGFCZwfupVWHSTlHPLyKnZJ5SZda
 pXN6SwLDfEGQRp5wkl5g/Wbmr2BEq4rarHDo9SorHhCRB/TuRv9YAdyi/Ko1NKwYNvWb
 n+UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8Jgeb9V3DPGc3QB1JR0CXzxKdYexNkGLUlFPYO765RE=;
 b=P1ohXTmgH7Kpt13x9BOxc2O3I7Ir6tWRwyKTzARl7zefWyDQoowU4bN2sFa+/O1pz4
 H+isTOCseOjemqMXSUnRZKz0gqlWzu4hHEoK6toSAmwKPtqMBStLvupL+tcn2GxaHQlU
 kd38nPTq7Gi63BybPOrPGRbOXBtRJgU7R7zT7uxlfw1eXzdo0P0Tuj9GAPBLgqiBzN3O
 AoP3okKQ+XLwYjyVSUmuuBzMeU1jdUmTPHPVNJS5XnXULbZRVg3T+DXAY70HDbHJkx7E
 KPTXayCapT0I5ald7SI4PoxhgR8+1tmNDBX4sDFzBDlR1x5su4SQk39vaCbh4dELa++f
 olrQ==
X-Gm-Message-State: AGi0PubaxXeYsV9AJwFwMSIweNn39PXAvsnUC6333vMmDkOX0l5vJPho
 MuF+DYhnZO4Y47kjEfLXWiMtCgKiWFtWW6OgQTWy0J4ryxk=
X-Google-Smtp-Source: APiQypKEAjCb6B0XNCBmwsr3+hJz9uTjk/hiENuc+OVSOPzBEyb2sgOOC+CWTjNXaD8mUmyTD8sRDKY9Oj+2+JkX+3g=
X-Received: by 2002:ac2:4113:: with SMTP id b19mr2558877lfi.40.1588338235381; 
 Fri, 01 May 2020 06:03:55 -0700 (PDT)
MIME-Version: 1.0
References: <1587726554-32018-1-git-send-email-sumit.garg@linaro.org>
 <1587726554-32018-3-git-send-email-sumit.garg@linaro.org>
 <20200425112950.3a4815b6@why>
 <6fd3d96181ec53f735ef1b6a79d28da1@kernel.org>
 <CAFA6WYPNNNZeX5zpadayfiZ7P_mHmiREpUd5LZ3Jp+TjGVqoEw@mail.gmail.com>
 <ac57cb4bbb6507ee98f199d68a514503@kernel.org>
 <CAFA6WYMheJxeKVC_YWN9owNJhcWTBsaOCvZXxq=GVj5ROJ0cvg@mail.gmail.com>
 <20200430101322.420e4052@why>
 <CAFA6WYO+NGLfNkOah4YzXx5XuaDh=QtWHgnMBwwMFY1zRt15GQ@mail.gmail.com>
In-Reply-To: <CAFA6WYO+NGLfNkOah4YzXx5XuaDh=QtWHgnMBwwMFY1zRt15GQ@mail.gmail.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Fri, 1 May 2020 18:33:41 +0530
Message-ID: <CAFA6WYPxiwxpJitX7fCSESUvQSa9Dq89GwL4e3w33ooetV=ysw@mail.gmail.com>
To: Marc Zyngier <maz@kernel.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.67 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.67 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jUVSu-000u8Z-NZ
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

On Thu, 30 Apr 2020 at 17:43, Sumit Garg <sumit.garg@linaro.org> wrote:
>
> On Thu, 30 Apr 2020 at 14:43, Marc Zyngier <maz@kernel.org> wrote:
> >
> > On Thu, 30 Apr 2020 12:50:28 +0530
> > Sumit Garg <sumit.garg@linaro.org> wrote:
> >
> > > Hi Marc,
> > >
> > > On Wed, 29 Apr 2020 at 13:53, Marc Zyngier <maz@kernel.org> wrote:
> >
> > [...]
> >
> > > > What I would like is for the arch code to request these interrupts as
> > > > normal interrupts, for which there is one problem to solve: how do you
> > > > find out about the Linux IRQ number for a given IPI. Or rather, how
> > > > do you get rid of the requirement to have IPI numbers at all and just
> > > > say "give me a per-cpu interrupt that I can use as an IPI, and by the
> > > > way here's the handler you can call".
> > >
> > > I think what you are looking for here is something that could be
> > > sufficed via enabling "CONFIG_GENERIC_IRQ_IPI" framework for arm64/arm
> > > architectures. It's currently used for mips architecture. Looking at
> > > its implementation, I think it should be possible to hook up SGIs
> > > under new IPI irq_domain for GICv2/v3.
> > >
> > > So with this framework we should be able to dynamically allocate IPIs
> > > and use common APIs such as request_irq()/request_nmi() to tell IPI
> > > specific handlers.
> > >
> > > If this approach looks sane to you then I can start working on a PoC
> > > implementation for arm64.
> >
> > I can't say I'm keen. This IPI framework doesn't really work for the
> > GIC:
> >
> > - it requires a separate irqdomain to be able to guarantee that you
> >   allocate the hwirq in the SGI range. What is the point?
> > - it creates yet another level of indirection on IPI injection
> >
> > This framework was created to deal with two cases:
> > - systems that can't represent their IPI with a single hwirq spanning
> >   all the CPUs
> > - "accelerator cores" that don't run Linux
> >
> > The GIC architecture avoids the first point, and I don't even want to
> > think of the second one.
> >
> > Also, it doesn't solve the initial problem, which is to bootstrap the
> > whole thing. The IPI framework relies on an irqdomain to be created the
> > first place. This would mean teaching the arch code about the
> > intricacies of irqdomains, FW nodes and other terrible things. All
> > things which are better hidden in the GIC drivers (not to mention the
> > other horror stories that are the RPi-2/3 irqchip and the Huawei GIC
> > knock-off).
> >
> > What I have in mind is to replace the set_smp_cross_call() with
> > something that passes the required set of information (interrupt range,
> > at the very least). The only thing that I plan to reuse from the IPI
> > framework is the chip->ipi_send_mask() callback.
> >
>
> Fair enough, I will just pass the allocated interrupt range base
> instead of set_smp_cross_call() and use __ipi_send_mask() to invoke a
> particular IPI.

Thinking more about this, there seems to be multiple irqchip drivers
registering softirq API via set_smp_cross_call(). So we need to
introduce a new API instead of replacing set_smp_cross_call() under
"CONFIG_GENERIC_IRQ_IPI" macro until all drivers switch to IPIs as
full interrupts.

BTW, could we take up this generalization as follow-up work as it
seems to be independent of current IPI NMI work?

>
> And to request an arch specific IPI as NMI, will use
> arch_get_ipinr_nmi() and in turn use request_percpu_nmi() to turn that
> particular IPI as NMI.

I have updated the second patch [1] in my tree to incorporate these
changes. The updated commit log is as follows:

commit 25c96663126264ec758c49a4a01a9c285f4ccc61
Author: Sumit Garg <sumit.garg@linaro.org>
Date:   Wed Apr 22 16:29:59 2020 +0530

    irqchip/gic-v3: Setup arch specific IPI as pseudo NMI

    Add support to mark arch specific IPI as pseudo NMI. Currently its used
    to allow arm64 specific IPI_CALL_NMI_FUNC to be marked as pseudo NMI.

    Brief description of changes:
    - Update NMI setup/teardown routines for SGIs.
    - Enable NMI support prior to gic_smp_init().
    - Setup custom flow handler for SGI setup as NMI.
    - Request, prepare and enable arch specific IPI as per CPU NMI using
      common APIs.

    Signed-off-by: Sumit Garg <sumit.garg@linaro.org>

Please have a look and let me know if this is something you were looking for.

[1] https://git.linaro.org/people/sumit.garg/linux.git/commit/?h=kgdb-nmi&id=25c96663126264ec758c49a4a01a9c285f4ccc61

-Sumit

> > Thanks,
> >
> >         M.
> > --
> > Jazz is not dead. It just smells funny...


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
