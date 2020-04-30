Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CDDC91BF8E4
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 30 Apr 2020 15:06:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jU8td-0003Ym-KW
	for lists+kgdb-bugreport@lfdr.de; Thu, 30 Apr 2020 13:06:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1jU8tc-0003Yf-Nx
 for kgdb-bugreport@lists.sourceforge.net; Thu, 30 Apr 2020 13:06:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yoeiwlW47gmLywsOiQtPAE+BLkFaEXPfv/CcedEMo0A=; b=LL0Ea4QMOYh4AI9Zoh+EDI9oJW
 bKN3HspskjMPM9KAM38VOKZKRAqRqGbjIAPtrZQHdxbkqlSBKvCvLUn4CvbJHez0BjpiDQSg+YYVF
 pTS/lg4iLKL3oR5TuUI6ilomBKedi3ZQorSGM7j4fnNI0unLloT1/zAT8wj9+v93Ox2E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yoeiwlW47gmLywsOiQtPAE+BLkFaEXPfv/CcedEMo0A=; b=TiIv2UJewEthOXNyguMZdtu8PC
 B4WD9TTR9d7A1K5F/JBMK3TPrIcEZW0dskk4EO9Y+P/5kSsBg/RjCCAzN7w8EWtJgs2MIFeTiTOxT
 q4tUEegQAgzmANT1GqC5pQOy0BiZkvJmJLbAos78ExUdfeStJzOMAGJQe0wYg7D/80Ps=;
Received: from mail-lj1-f173.google.com ([209.85.208.173])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jU8tY-005FhX-0k
 for kgdb-bugreport@lists.sourceforge.net; Thu, 30 Apr 2020 13:06:32 +0000
Received: by mail-lj1-f173.google.com with SMTP id h4so6366306ljg.12
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 30 Apr 2020 06:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yoeiwlW47gmLywsOiQtPAE+BLkFaEXPfv/CcedEMo0A=;
 b=dBJrTKuq/SFqvsQRbkobYYD98E85yyKcrd9m+8aU8XQsZe9qZ4X3mboJ4YAStQGCSe
 P+gw90exxtyuQ+xUnKPv2uPJUukjiRRy9FsMM6ZESi54vVlyqNkiuueBXFXaEA+p2BOx
 kea0VHcA4BCDM5e0RydFHUESpaYzlZtUpyNXaH8uzi90pA9n9qbLgycjFafZayXSQoG6
 SQE9u4XUwAUyNzpljPgQk122jmjjie0LBRRy4kjw5WsQC8saX6p04NfwH1LiqEE9yp6X
 FWfhEMGJZZ9J/ODkOI51KV8YAvWFKqM078K9NHUzJzCTypO0tdZDb7NTW7NsRqKeiTgH
 yzQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yoeiwlW47gmLywsOiQtPAE+BLkFaEXPfv/CcedEMo0A=;
 b=TrrLoKQrQKFOC6nbgtaF25goN9NdKUilBFynyhL5IMH3eUctXcAhF9oP/6+4AFtKqo
 sCYn8S1JPMssgi6n2rssRzDDo+CpRrguIWJuiiqwujrzxDBqNF12tkOOujR/uc4NjngU
 mP+Y1xwZFVm4TVXO+tMhavTPukxCxwMXrJ/RS44pwsjAaHPbOzonfa1W/4G362n7x8SS
 O63qKfOHoekw9TpdFqfzwTDlQihJv+GXp0i+nvJKcqmLCidY/Ze/EqlJc7R41fAeP/TK
 3AuR9B0vXJiXbP7hp7Ap3hTFwrRJeV7CRBJg2DsR5bNv5RvnmxX+6ysHQD6/nv5SiUFw
 HBPA==
X-Gm-Message-State: AGi0PuYmDWGF/r5E//n2hVCReN2CxqYMnoKfYTM3m1EBTw1+rbU5nyXN
 A2SunwJmd1WL1Ugte/nqGfXUIpgy+oybqE6uyTyYwPiI304=
X-Google-Smtp-Source: APiQypIIPUadX74iZ/bCIqJG4Vsa3NMnxmkI+UwH+e41amhBTK/XrBg+ktI/Ar3uSdlHbEz4HG6H/aHz5MJH+jCDZWI=
X-Received: by 2002:ac2:4113:: with SMTP id b19mr2009647lfi.40.1588248813839; 
 Thu, 30 Apr 2020 05:13:33 -0700 (PDT)
MIME-Version: 1.0
References: <1587726554-32018-1-git-send-email-sumit.garg@linaro.org>
 <1587726554-32018-3-git-send-email-sumit.garg@linaro.org>
 <20200425112950.3a4815b6@why>
 <6fd3d96181ec53f735ef1b6a79d28da1@kernel.org>
 <CAFA6WYPNNNZeX5zpadayfiZ7P_mHmiREpUd5LZ3Jp+TjGVqoEw@mail.gmail.com>
 <ac57cb4bbb6507ee98f199d68a514503@kernel.org>
 <CAFA6WYMheJxeKVC_YWN9owNJhcWTBsaOCvZXxq=GVj5ROJ0cvg@mail.gmail.com>
 <20200430101322.420e4052@why>
In-Reply-To: <20200430101322.420e4052@why>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Thu, 30 Apr 2020 17:43:21 +0530
Message-ID: <CAFA6WYO+NGLfNkOah4YzXx5XuaDh=QtWHgnMBwwMFY1zRt15GQ@mail.gmail.com>
To: Marc Zyngier <maz@kernel.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.173 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.173 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jU8tY-005FhX-0k
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

On Thu, 30 Apr 2020 at 14:43, Marc Zyngier <maz@kernel.org> wrote:
>
> On Thu, 30 Apr 2020 12:50:28 +0530
> Sumit Garg <sumit.garg@linaro.org> wrote:
>
> > Hi Marc,
> >
> > On Wed, 29 Apr 2020 at 13:53, Marc Zyngier <maz@kernel.org> wrote:
>
> [...]
>
> > > What I would like is for the arch code to request these interrupts as
> > > normal interrupts, for which there is one problem to solve: how do you
> > > find out about the Linux IRQ number for a given IPI. Or rather, how
> > > do you get rid of the requirement to have IPI numbers at all and just
> > > say "give me a per-cpu interrupt that I can use as an IPI, and by the
> > > way here's the handler you can call".
> >
> > I think what you are looking for here is something that could be
> > sufficed via enabling "CONFIG_GENERIC_IRQ_IPI" framework for arm64/arm
> > architectures. It's currently used for mips architecture. Looking at
> > its implementation, I think it should be possible to hook up SGIs
> > under new IPI irq_domain for GICv2/v3.
> >
> > So with this framework we should be able to dynamically allocate IPIs
> > and use common APIs such as request_irq()/request_nmi() to tell IPI
> > specific handlers.
> >
> > If this approach looks sane to you then I can start working on a PoC
> > implementation for arm64.
>
> I can't say I'm keen. This IPI framework doesn't really work for the
> GIC:
>
> - it requires a separate irqdomain to be able to guarantee that you
>   allocate the hwirq in the SGI range. What is the point?
> - it creates yet another level of indirection on IPI injection
>
> This framework was created to deal with two cases:
> - systems that can't represent their IPI with a single hwirq spanning
>   all the CPUs
> - "accelerator cores" that don't run Linux
>
> The GIC architecture avoids the first point, and I don't even want to
> think of the second one.
>
> Also, it doesn't solve the initial problem, which is to bootstrap the
> whole thing. The IPI framework relies on an irqdomain to be created the
> first place. This would mean teaching the arch code about the
> intricacies of irqdomains, FW nodes and other terrible things. All
> things which are better hidden in the GIC drivers (not to mention the
> other horror stories that are the RPi-2/3 irqchip and the Huawei GIC
> knock-off).
>
> What I have in mind is to replace the set_smp_cross_call() with
> something that passes the required set of information (interrupt range,
> at the very least). The only thing that I plan to reuse from the IPI
> framework is the chip->ipi_send_mask() callback.
>

Fair enough, I will just pass the allocated interrupt range base
instead of set_smp_cross_call() and use __ipi_send_mask() to invoke a
particular IPI.

And to request an arch specific IPI as NMI, will use
arch_get_ipinr_nmi() and in turn use request_percpu_nmi() to turn that
particular IPI as NMI.

Is there anything that I missed here?

-Sumit

> Thanks,
>
>         M.
> --
> Jazz is not dead. It just smells funny...


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
