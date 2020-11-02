Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F0A2A24B9
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  2 Nov 2020 07:19:24 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kZTBb-0003pY-Ci
	for lists+kgdb-bugreport@lfdr.de; Mon, 02 Nov 2020 06:19:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1kZTBa-0003pS-5s
 for kgdb-bugreport@lists.sourceforge.net; Mon, 02 Nov 2020 06:19:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iOizdv8Buv6FfQDjIz+DCkY2/qLkv4EBJXrU3sSnCWs=; b=gMQxw+X+GkVUscLqSZDK3GK1h4
 OtEqSM0I4ou5Nho+vt/wywsSjs4+wGZUEiCGFDVjB9vJ9bTohyVpbzFLTHQivIoERpvp3ednJ+7eG
 yhYdl7kLcemxa5/rQJ1Fl7DqYtQ/V23vIXsrc0qKdH2S86fStOfZXv3XtF25SgriUKuc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iOizdv8Buv6FfQDjIz+DCkY2/qLkv4EBJXrU3sSnCWs=; b=YtnWSUip/HuhvW14MOGRp93yGs
 fK9sgFhzMT8gqkLTLPfPJ4jxfw6/zh5EG3DgXUcmdApl0blpsXGITEB4taN+5gy2s1yMm1qGFLDHo
 +IntCmmkJnO4JqiiIoQ0uQzRU/Fdp+KmCHVzUp7dcpEhG7HonmM84ilyZpZfqqbV2tGs=;
Received: from mail-lf1-f66.google.com ([209.85.167.66])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kZTBT-0060KR-Gd
 for kgdb-bugreport@lists.sourceforge.net; Mon, 02 Nov 2020 06:19:22 +0000
Received: by mail-lf1-f66.google.com with SMTP id k14so713894lfg.7
 for <kgdb-bugreport@lists.sourceforge.net>;
 Sun, 01 Nov 2020 22:19:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iOizdv8Buv6FfQDjIz+DCkY2/qLkv4EBJXrU3sSnCWs=;
 b=yC26OzffaiSXuxD3Yv3sgbPJK3Y6JOG5O1docyb2L7i9Fusu3SZVvPjm1SFL6QmlQo
 gKg8kmbm+baIFlSZGvEojmKv/moocE3VvivuOLidCzkhuTl81R+xiTcW0wN9w4zUEyKk
 +NOg638xGq5V89dcOGjCepuD7f3H54SNnwkk0pvaXbSfBHPYlpDcU+2glYbbDnITAnRv
 dW8HjUa8iYuhhrd8V8NNa5vcffS0r6qI3yeFfQnJtGd/xuwDz66CsVIqzXt3COTZ/x+3
 lUsiJj8EzHi7IGwXAA2SqYvExzHB4sQ+MvmgCk9hJblZ3clBXKvK38cpazY5fXTxzPir
 yY1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iOizdv8Buv6FfQDjIz+DCkY2/qLkv4EBJXrU3sSnCWs=;
 b=n+jeJRfYy+orlEtrOew3sLmH9lmbgW9p+e+HcnrVZaR4+peaxD4vI+ferL40Zc9IyA
 qU3fQegY4LpRPoBiNVz2ZT0aoCaxJyuWihRfaf9SgbdDjAXmGK1XUf21ng1oyPUrASVH
 7eKyd0Yd5p31nAJ7ZdhU6+iap/uvSlMuPjRCZ9Smh839YPuRRVAJhbvEb4ZtXxf3N3p0
 E3j54G9JUe1vOmp/gMO7wUtHLpe22L6gH6cXvNyyU7a60osuIOfz5GLs5fdALB0UAY6Q
 ASqYtfMFXLYyfjB2GbZ1Ap/ulis4IdmeBpIHsrP+6wDYT7GgJeDKBqULLzBzQhlcZyJQ
 hXzQ==
X-Gm-Message-State: AOAM532rsjNgoxXnU6yW58qqQs51w/WQNxxWWBCaKUp2vh6tkDsmySfG
 6JOjh2XyA1yBJSBDUZJ0lC4gXBymf7EIs6/f7nqrPA==
X-Google-Smtp-Source: ABdhPJyKErojm2uwnAv6KZ5/QPOe9e59v8XvwLaZBI6MqngV7Fl1vO/+e/CfWbVp59RoX2NQQqTQh9W6XnQTuDGh3+I=
X-Received: by 2002:a19:e20f:: with SMTP id z15mr4551104lfg.273.1604297948806; 
 Sun, 01 Nov 2020 22:19:08 -0800 (PST)
MIME-Version: 1.0
References: <1603983387-8738-1-git-send-email-sumit.garg@linaro.org>
 <1603983387-8738-7-git-send-email-sumit.garg@linaro.org>
 <20201029152106.gj66mjnathsdqtoe@holly.lan>
In-Reply-To: <20201029152106.gj66mjnathsdqtoe@holly.lan>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Mon, 2 Nov 2020 11:48:53 +0530
Message-ID: <CAFA6WYOcCj=_G67QGN=8McHWvunoggN7tho9_VueH763U9K=_g@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.66 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.66 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kZTBT-0060KR-Gd
Subject: Re: [Kgdb-bugreport] [PATCH v6 6/7] kgdb: roundup: Allow runtime
 arch specific override
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
Cc: Mark Rutland <mark.rutland@arm.com>, tsbogend@alpha.franken.de,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jason Cooper <jason@lakedaemon.net>, ito-yuichi@fujitsu.com,
 Marc Zyngier <maz@kernel.org>, x86@kernel.org,
 Russell King - ARM Linux admin <linux@armlinux.org.uk>,
 Jason Wessel <jason.wessel@windriver.com>, mingo@redhat.com, bp@alien8.de,
 mpe@ellerman.id.au, Catalin Marinas <catalin.marinas@arm.com>,
 kgdb-bugreport@lists.sourceforge.net, Masayoshi Mizuma <msys.mizuma@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, julien.thierry.kdev@gmail.com,
 Will Deacon <will@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Thu, 29 Oct 2020 at 20:51, Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> On Thu, Oct 29, 2020 at 08:26:26PM +0530, Sumit Garg wrote:
> > Add a new API kgdb_arch_roundup_cpus() for a particular archichecture to
> > override default kgdb roundup and if it detects at runtime to not support
> > NMI roundup then it can fallback to default implementation using async
> > SMP cross-calls.
> >
> > Currently such an architecture example is arm64 supporting pseudo NMIs
> > feature which is only available on platforms which have support for GICv3
> > or later version.
> >
> > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> > ---
> >  arch/powerpc/kernel/kgdb.c |  3 ++-
> >  arch/sparc/kernel/smp_64.c |  3 ++-
> >  arch/x86/kernel/kgdb.c     |  6 ++++--
> >  include/linux/kgdb.h       |  5 +++--
> >  kernel/debug/debug_core.c  | 10 +++++++++-
> >  5 files changed, 20 insertions(+), 7 deletions(-)
> >
> > diff --git a/arch/powerpc/kernel/kgdb.c b/arch/powerpc/kernel/kgdb.c
> > index 4090802..126575d 100644
> > --- a/arch/powerpc/kernel/kgdb.c
> > +++ b/arch/powerpc/kernel/kgdb.c
> > @@ -125,9 +125,10 @@ static int kgdb_debugger_ipi(struct pt_regs *regs)
> >  }
> >
> >  #ifdef CONFIG_SMP
> > -void kgdb_roundup_cpus(void)
> > +bool kgdb_arch_roundup_cpus(void)
> >  {
> >       smp_send_debugger_break();
> > +     return true;
> >  }
> >  #endif
> >
> > diff --git a/arch/sparc/kernel/smp_64.c b/arch/sparc/kernel/smp_64.c
> > index e38d8bf..c459c83 100644
> > --- a/arch/sparc/kernel/smp_64.c
> > +++ b/arch/sparc/kernel/smp_64.c
> > @@ -1014,9 +1014,10 @@ void flush_dcache_page_all(struct mm_struct *mm, struct page *page)
> >  }
> >
> >  #ifdef CONFIG_KGDB
> > -void kgdb_roundup_cpus(void)
> > +bool kgdb_arch_roundup_cpus(void)
> >  {
> >       smp_cross_call(&xcall_kgdb_capture, 0, 0, 0);
> > +     return true;
> >  }
> >  #endif
> >
> > diff --git a/arch/x86/kernel/kgdb.c b/arch/x86/kernel/kgdb.c
> > index ff7878d..1b756d9 100644
> > --- a/arch/x86/kernel/kgdb.c
> > +++ b/arch/x86/kernel/kgdb.c
> > @@ -404,7 +404,8 @@ static void kgdb_disable_hw_debug(struct pt_regs *regs)
> >
> >  #ifdef CONFIG_SMP
> >  /**
> > - *   kgdb_roundup_cpus - Get other CPUs into a holding pattern
> > + *   kgdb_arch_roundup_cpus - Get other CPUs into a holding pattern
> > + *                            in an architectural specific manner
> >   *
> >   *   On SMP systems, we need to get the attention of the other CPUs
> >   *   and get them be in a known state.  This should do what is needed
> > @@ -414,9 +415,10 @@ static void kgdb_disable_hw_debug(struct pt_regs *regs)
> >   *
> >   *   On non-SMP systems, this is not called.
> >   */
> > -void kgdb_roundup_cpus(void)
> > +bool kgdb_arch_roundup_cpus(void)
> >  {
> >       apic_send_IPI_allbutself(NMI_VECTOR);
> > +     return true;
> >  }
> >  #endif
> >
> > diff --git a/include/linux/kgdb.h b/include/linux/kgdb.h
> > index 0d6cf64..f9db5b8 100644
> > --- a/include/linux/kgdb.h
> > +++ b/include/linux/kgdb.h
> > @@ -200,7 +200,8 @@ kgdb_arch_handle_qxfer_pkt(char *remcom_in_buffer,
> >  extern void kgdb_call_nmi_hook(void *ignored);
> >
> >  /**
> > - *   kgdb_roundup_cpus - Get other CPUs into a holding pattern
> > + *   kgdb_arch_roundup_cpus - Get other CPUs into a holding pattern
> > + *                            in an architectural specific manner
> >   *
> >   *   On SMP systems, we need to get the attention of the other CPUs
> >   *   and get them into a known state.  This should do what is needed
> > @@ -210,7 +211,7 @@ extern void kgdb_call_nmi_hook(void *ignored);
> >   *
> >   *   On non-SMP systems, this is not called.
> >   */
> > -extern void kgdb_roundup_cpus(void);
> > +extern bool kgdb_arch_roundup_cpus(void);
> >
> >  /**
> >   *   kgdb_arch_set_pc - Generic call back to the program counter
> > diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
> > index 1e75a89..27e401c 100644
> > --- a/kernel/debug/debug_core.c
> > +++ b/kernel/debug/debug_core.c
> > @@ -241,13 +241,21 @@ void __weak kgdb_call_nmi_hook(void *ignored)
> >  }
> >  NOKPROBE_SYMBOL(kgdb_call_nmi_hook);
> >
> > -void __weak kgdb_roundup_cpus(void)
> > +bool __weak kgdb_arch_roundup_cpus(void)
> > +{
> > +     return false;
>
> Do we really need to introduce all these boolean return values just to
> call a bit of library code when one of the architectures wants to
> fallback to a generic implementation?
>
> Why not something more like:
>
> void kgdb_smp_call_nmi_hook(void)
> {
>     /* original weak version of kgdb_roundup_cpus goes here */
> }
>
> void __weak kgdb_roundup_cpus(void)
> {
>     kgdb_smp_call_nmi_hook();
> }
>
> arm64 can now simply call the new library function if a fallback is needed.
>

Makes sense, I will use this approach instead.

> Note that same question applies to the backtrace changes...

In case of backtrace, there are already multiple APIs wrapping
arch_trigger_cpumask_backtrace() as follows:

- trigger_all_cpu_backtrace()
- trigger_allbutself_cpu_backtrace()
- trigger_cpumask_backtrace()
- trigger_single_cpu_backtrace()

And each of them already return a boolean and have corresponding
different fallback mechanisms. So we can't have a common fallback API
from arch specific code and instead need to extend that boolean return
to arch specific code that is implemented as part of patch #4.

If you do have any better ideas then do let me know.

-Sumit

>
>
> Daniel.
>
>
> > +}
> > +
> > +static void kgdb_roundup_cpus(void)
> >  {
> >       call_single_data_t *csd;
> >       int this_cpu = raw_smp_processor_id();
> >       int cpu;
> >       int ret;
> >
> > +     if (kgdb_arch_roundup_cpus())
> > +             return;
> > +
> >       for_each_online_cpu(cpu) {
> >               /* No need to roundup ourselves */
> >               if (cpu == this_cpu)
> > --
> > 2.7.4
> >


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
