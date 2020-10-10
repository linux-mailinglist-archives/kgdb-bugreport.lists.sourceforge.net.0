Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A76328B1E0
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 12 Oct 2020 11:59:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kRucP-0003xB-44
	for lists+kgdb-bugreport@lfdr.de; Mon, 12 Oct 2020 09:59:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <msys.mizuma@gmail.com>) id 1kRGYv-0003Nz-Nv
 for kgdb-bugreport@lists.sourceforge.net; Sat, 10 Oct 2020 15:13:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lWT2SsVQSkhdJyfkAWZyX8rdrMN1tcpW6dkwA0/22aY=; b=alL48kuD73RAs9MCsOp8QpWleC
 DvPzoUPnn68doIVjG+1bNwI5mikv8+XH8eYMpLQv7+yK8tPfK41mGsfRqfxN8u/RCVbk64eNx6eEq
 Z1GjBm1jpyxCPgzIgU3ypyLH6UnmPDkM384OZxhi9rVhZF8sgrA0EUiypRE2cZbvOGi0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lWT2SsVQSkhdJyfkAWZyX8rdrMN1tcpW6dkwA0/22aY=; b=Wcf+3fxvt9aSt50pI4Q6R/PSvT
 w0Ht6ddmwgkBJa9SlsUQD8eJuXDQt/oYjT8OCpTksPHrZTKJU0ZovtKz16QUzvKb4MBBNArY8DPLZ
 cp1LYj6uesEAmKRcBPHLbsC8CWpUz0ggH8aadW0QuUVjlC3mnvIC16fBiF4tJwWXgsaY=;
Received: from mail-qv1-f66.google.com ([209.85.219.66])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kRGYl-005Hh1-Hp
 for kgdb-bugreport@lists.sourceforge.net; Sat, 10 Oct 2020 15:13:33 +0000
Received: by mail-qv1-f66.google.com with SMTP id j3so6268204qvi.7
 for <kgdb-bugreport@lists.sourceforge.net>;
 Sat, 10 Oct 2020 08:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=lWT2SsVQSkhdJyfkAWZyX8rdrMN1tcpW6dkwA0/22aY=;
 b=mi0A/UJElRKcu8tnBoIW+XFAtoXQrRjhtDeZfR7OQYizIhW8ln5R6MObl8lBq9aRJQ
 zB1iROhYbuzmgdLaMwPN0Zwocpq6NRZdHlwOzHQK1jXlWPy3BCe2L8JVZp8Vtn+ZRoJy
 N3N2TDRwXq8k+Hwi8VZ0Su8tWv+k8wDQlBXeWrbB10pzdmikRFHnSHFJV67/8knrsdtJ
 IkNPGKlqmJSDyfY5JsdCsDLo0OG8DfqOeE5a2+odEeoo1s/W02qVuLRMInpJBWTEkyQA
 qPoCeUYBuu4jvm6T+DX5qPnBg28cZcCA5X/WLqEGIO8MLZqRaO8WXCBNrrzTe7r3Je8U
 to1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=lWT2SsVQSkhdJyfkAWZyX8rdrMN1tcpW6dkwA0/22aY=;
 b=MjPvMbPgPatCbpIFVV/qtmNrENiI1yXJ6uSZQopDQKQsdpSvs2WT8O+tN/pqXySYAK
 09zzDC4jDAD+jrLfhcVFgY+YRYSMTrbvPnPZQw1Et/S+tj/uDu71IAWzYb3+F6CaWpXJ
 gWmzhxJ4wvhN+43nwpRqWKewycyztfPiU5xFJyTcxlVjI95sD3A1m/k2OEnfh/njyqfw
 tUKZsO3ROC9Xd9A1exl4OOPeGMle76nwyK9FQdM0uAChoEWnda7+om2GcVdfD8s7TTOK
 igPXnC3lPQHRr6L9qVKvFWOd7ToTuDbZ/FemwD6sGe/bNGsKDxrlChc3LQfy6bSE9zAu
 /g3g==
X-Gm-Message-State: AOAM533pAiNoNHamwaiEckzXUsl3YoSMrEtsrotm4ikTzVLK6yHKOqBj
 dlmzy/JN8VSs6nuf57MZ1Q==
X-Google-Smtp-Source: ABdhPJygoiafgSWlYFFEBhUARW9eM/Lxs15jEjz8nDjU+zjPhzZ3/rZjGb1YtwjUjhhu8NJAw/kL2w==
X-Received: by 2002:a0c:eac3:: with SMTP id y3mr18472356qvp.57.1602342790619; 
 Sat, 10 Oct 2020 08:13:10 -0700 (PDT)
Received: from gabell
 (209-6-122-159.s2973.c3-0.arl-cbr1.sbo-arl.ma.cable.rcncustomer.com.
 [209.6.122.159])
 by smtp.gmail.com with ESMTPSA id p3sm8397082qkj.113.2020.10.10.08.13.08
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 10 Oct 2020 08:13:09 -0700 (PDT)
Date: Sat, 10 Oct 2020 11:13:07 -0400
From: Masayoshi Mizuma <msys.mizuma@gmail.com>
To: Marc Zyngier <maz@kernel.org>
Message-ID: <20201010151307.vq74if4mndjn4nhm@gabell>
References: <1599830924-13990-1-git-send-email-sumit.garg@linaro.org>
 <1599830924-13990-2-git-send-email-sumit.garg@linaro.org>
 <20201010015855.vksetnj4luft5enc@gabell>
 <877drypgqb.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <877drypgqb.wl-maz@kernel.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (msys.mizuma[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.219.66 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.66 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kRGYl-005Hh1-Hp
X-Mailman-Approved-At: Mon, 12 Oct 2020 09:59:48 +0000
Subject: Re: [Kgdb-bugreport] [PATCH v4 1/5] arm64: Add framework to turn
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
Cc: mark.rutland@arm.com, daniel.thompson@linaro.org, jason@lakedaemon.net,
 catalin.marinas@arm.com, jason.wessel@windriver.com,
 linux-kernel@vger.kernel.org, julien.thierry.kdev@gmail.com,
 kgdb-bugreport@lists.sourceforge.net, tglx@linutronix.de, will@kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Sat, Oct 10, 2020 at 10:34:04AM +0100, Marc Zyngier wrote:
> On Sat, 10 Oct 2020 02:58:55 +0100,
> Masayoshi Mizuma <msys.mizuma@gmail.com> wrote:
> 
> [...]
> 
> > > +void ipi_nmi_setup(int cpu)
> > > +{
> > > +	if (!ipi_desc)
> > > +		return;
> > 
> > ipi_nmi_setup() may be called twice for CPU0:
> > 
> >   set_smp_ipi_range => set_smp_ipi_nmi => ipi_nmi_setup
> >                     => ipi_setup => ipi_nmi_setup
> > 
> > Actually, I got the following error message via the second ipi_nmi_setup():
> > 
> >   GICv3: Pseudo-NMIs enabled using relaxed ICC_PMR_EL1 synchronisation
> >   GICv3: Cannot set NMI property of enabled IRQ 8
> >   genirq: Failed to setup NMI delivery: irq 8
> > 
> > Why don't we have a check to prevent that? Like as:
> > 
> >        if (cpumask_test_cpu(cpu, ipi_desc->percpu_enabled))
> >                return;
> 
> That's definitely the wrong thing to do. prepare_nmi_setup() shouldn't
> be called twice, and papering over it isn't acceptable.

Got it. How about moving ipi_nmi_setup() from ipi_setup() to
secondary_start_kernel() ? so that CPU0 can call ipi_nmi_setup() only
from set_smp_ipi_nmi().

--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -245,6 +245,7 @@ asmlinkage notrace void secondary_start_kernel(void)
        notify_cpu_starting(cpu);
 
        ipi_setup(cpu);
+       ipi_nmi_setup(cpu);
 
        store_cpu_topology(cpu);
        numa_add_cpu(cpu);
@@ -966,8 +967,6 @@ static void ipi_setup(int cpu)
 
        for (i = 0; i < nr_ipi; i++)
                enable_percpu_irq(ipi_irq_base + i, 0);
-
-       ipi_nmi_setup(cpu);
 }
 
 #ifdef CONFIG_HOTPLUG_CPU

Thanks,
Masa


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
