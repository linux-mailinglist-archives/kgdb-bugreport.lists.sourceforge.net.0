Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6EF28C787
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 13 Oct 2020 05:23:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kSAuI-0004Jn-IJ
	for lists+kgdb-bugreport@lfdr.de; Tue, 13 Oct 2020 03:23:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <msys.mizuma@gmail.com>) id 1kSAuG-0004JZ-VI
 for kgdb-bugreport@lists.sourceforge.net; Tue, 13 Oct 2020 03:23:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8avc/64suYQeMp5GgzA5tmw2pJjaDuZSyAtFHq8gm34=; b=CgqekVXMzLZouNWymwcqmqDChF
 v2J9CTqcEpJkb333c47lEewf4l6ePjvT4gj3eJONitbjwKAKU4Aw/f8L/fZgScAjmG6kYJiPFB2Wi
 kASXfvrzhpC/fHQ9CR0/1MTBLlcJKHnWmNfYOhXg+ilfbIhS44YemXbXaCpII8Wfkp8k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8avc/64suYQeMp5GgzA5tmw2pJjaDuZSyAtFHq8gm34=; b=CbPPGIGMvgejzLv846sYU7Lo/a
 ACrdwXdsUYXt/L+lvKK8ujE41+8QG298FU2IVEBK+m17o3Bn5lhSdvnrKW+cX177H53b32nXiPUah
 DjjQkNE0YM04h1TLFXuY5dlM6ljihBtelX2aXtWQ1qaw/ZuKTJ36gJBDBwuRKBx4hOB4=;
Received: from mail-qk1-f195.google.com ([209.85.222.195])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kSAuC-00Cxaa-Jt
 for kgdb-bugreport@lists.sourceforge.net; Tue, 13 Oct 2020 03:23:20 +0000
Received: by mail-qk1-f195.google.com with SMTP id q63so19645845qkf.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 12 Oct 2020 20:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=8avc/64suYQeMp5GgzA5tmw2pJjaDuZSyAtFHq8gm34=;
 b=fVshXDeXRvRHKXbkyOJuRjmLohKcGDX7DDjrMtShzKZFXCDWpDYpbtuY+9/lW0oSzn
 v31Y9XdnWd7q2wMfv4McLozcmD21u7PQ+peYEDpsaxn+Nwf4on/ItmLJgoPxnggt+dSG
 4BmOONWVL5NGd5aeA1Co45HuViM2EoXkePxtaJnVYtuzKej4z68hlFlNZYGza2Kb6I6M
 KeM75AbjHbF4Cp4YlbCjsyYAQ/af4CxPjze0OrDmeo9gRqNmO12G1+FxnZja2YYiyJ3C
 Us6YNnhsANN9wHX6gdjni8JiDL6NZcg+9eDp6WcUXAVrAyaa6Z+hX2vukQUeJJy7uHPW
 enAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8avc/64suYQeMp5GgzA5tmw2pJjaDuZSyAtFHq8gm34=;
 b=f+ggfetggBDejOzxJOOiUsH++0YBp9GBH0MUXfKoM6aF0IYhOWsCNRWIlYcp9Nqe+M
 1tFPFywETTJ7AaS4yw3mLZOQR6ez0cNRTgo7InU/SyYzCCZ7hVCZlQ0hCxY5fbvA+ryv
 E3G+6cZokJlIhtsMSOckO1xaRLSOiP2qmvVRTdn7uBRF4/bKElhZHkngbbuK8BIdXbjz
 NRlYFHOo9JWwh3if4Uk62g6VUegLi89paIF4jssDbfPWBLmW4ssHcKmyK93EG8l/gy4J
 o+ElQfX/RM6Cq7nAUlECzIf/xF3jgDXcYhCwavqC1vJEnDQ/7CxlnHtHOwKEQgAx+VWk
 TExw==
X-Gm-Message-State: AOAM531hZonPSDK/lCKI6sT89cmWAuzFbL1bu2KE9HDh8iXttjNCbTJp
 GOsues9fd+InHycudlxfd55lqEcvWA==
X-Google-Smtp-Source: ABdhPJyHjdm9v8cbZa7XC7+SU1TiL3kuhYJVBffwraE+SqHVz0Unk73Y35kuNXvQXVMGxEraIGfRMw==
X-Received: by 2002:a05:620a:677:: with SMTP id
 a23mr2355679qkh.428.1602559383716; 
 Mon, 12 Oct 2020 20:23:03 -0700 (PDT)
Received: from gabell
 (209-6-122-159.s2973.c3-0.arl-cbr1.sbo-arl.ma.cable.rcncustomer.com.
 [209.6.122.159])
 by smtp.gmail.com with ESMTPSA id w45sm506123qtw.96.2020.10.12.20.23.02
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 12 Oct 2020 20:23:02 -0700 (PDT)
Date: Mon, 12 Oct 2020 23:23:00 -0400
From: Masayoshi Mizuma <msys.mizuma@gmail.com>
To: Sumit Garg <sumit.garg@linaro.org>
Message-ID: <20201013032300.djsxeasxaqbzjhzr@gabell>
References: <1599830924-13990-1-git-send-email-sumit.garg@linaro.org>
 <1599830924-13990-2-git-send-email-sumit.garg@linaro.org>
 <20201010015855.vksetnj4luft5enc@gabell>
 <877drypgqb.wl-maz@kernel.org>
 <20201010151307.vq74if4mndjn4nhm@gabell>
 <CAFA6WYOHs+yYvdR-6eQR3ZJPK8nF3sN0fbd8XsQ8pwGL63cdCQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFA6WYOHs+yYvdR-6eQR3ZJPK8nF3sN0fbd8XsQ8pwGL63cdCQ@mail.gmail.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (msys.mizuma[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.222.195 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.195 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kSAuC-00Cxaa-Jt
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <maz@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 julien.thierry.kdev@gmail.com, Catalin Marinas <catalin.marinas@arm.com>,
 kgdb-bugreport@lists.sourceforge.net, Thomas Gleixner <tglx@linutronix.de>,
 Will Deacon <will@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Mon, Oct 12, 2020 at 05:49:09PM +0530, Sumit Garg wrote:
> Hi Masa,
> 
> On Sat, 10 Oct 2020 at 20:43, Masayoshi Mizuma <msys.mizuma@gmail.com> wrote:
> >
> > On Sat, Oct 10, 2020 at 10:34:04AM +0100, Marc Zyngier wrote:
> > > On Sat, 10 Oct 2020 02:58:55 +0100,
> > > Masayoshi Mizuma <msys.mizuma@gmail.com> wrote:
> > >
> > > [...]
> > >
> > > > > +void ipi_nmi_setup(int cpu)
> > > > > +{
> > > > > + if (!ipi_desc)
> > > > > +         return;
> > > >
> > > > ipi_nmi_setup() may be called twice for CPU0:
> > > >
> > > >   set_smp_ipi_range => set_smp_ipi_nmi => ipi_nmi_setup
> > > >                     => ipi_setup => ipi_nmi_setup
> > > >
> > > > Actually, I got the following error message via the second ipi_nmi_setup():
> > > >
> > > >   GICv3: Pseudo-NMIs enabled using relaxed ICC_PMR_EL1 synchronisation
> > > >   GICv3: Cannot set NMI property of enabled IRQ 8
> > > >   genirq: Failed to setup NMI delivery: irq 8
> > > >
> 
> Ah, thanks for catching this which I missed during my testing.
> 
> > > > Why don't we have a check to prevent that? Like as:
> > > >
> > > >        if (cpumask_test_cpu(cpu, ipi_desc->percpu_enabled))
> > > >                return;
> > >
> > > That's definitely the wrong thing to do. prepare_nmi_setup() shouldn't
> > > be called twice, and papering over it isn't acceptable.
> >
> > Got it. How about moving ipi_nmi_setup() from ipi_setup() to
> > secondary_start_kernel() ? so that CPU0 can call ipi_nmi_setup() only
> > from set_smp_ipi_nmi().
> >
> > --- a/arch/arm64/kernel/smp.c
> > +++ b/arch/arm64/kernel/smp.c
> > @@ -245,6 +245,7 @@ asmlinkage notrace void secondary_start_kernel(void)
> >         notify_cpu_starting(cpu);
> >
> >         ipi_setup(cpu);
> > +       ipi_nmi_setup(cpu);
> >
> >         store_cpu_topology(cpu);
> >         numa_add_cpu(cpu);
> > @@ -966,8 +967,6 @@ static void ipi_setup(int cpu)
> >
> >         for (i = 0; i < nr_ipi; i++)
> >                 enable_percpu_irq(ipi_irq_base + i, 0);
> > -
> > -       ipi_nmi_setup(cpu);
> >  }
> >
> >  #ifdef CONFIG_HOTPLUG_CPU
> >
> 
> IMO, it would be more consistent to keep invocation of ipi_nmi_setup()
> from ipi_setup(). So let me remove other invocation from
> set_smp_ipi_nmi():
> 
> diff --git a/arch/arm64/kernel/ipi_nmi.c b/arch/arm64/kernel/ipi_nmi.c
> index d3aa430..000e457 100644
> --- a/arch/arm64/kernel/ipi_nmi.c
> +++ b/arch/arm64/kernel/ipi_nmi.c
> @@ -87,7 +87,4 @@ void __init set_smp_ipi_nmi(int ipi)
>         ipi_desc = irq_to_desc(ipi);
>         irq_set_status_flags(ipi, IRQ_HIDDEN);
>         ipi_id = ipi;
> -
> -       /* Setup the boot CPU immediately */
> -       ipi_nmi_setup(smp_processor_id());
>  }
> 
> Do let me know if this works for you?

Yes, make sense to me.

Thanks!
Masa


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
