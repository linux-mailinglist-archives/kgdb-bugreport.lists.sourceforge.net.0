Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E44D52A26D2
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  2 Nov 2020 10:19:27 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kZVzq-0000J7-Ms
	for lists+kgdb-bugreport@lfdr.de; Mon, 02 Nov 2020 09:19:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1kZVzp-0000Ie-Ub
 for kgdb-bugreport@lists.sourceforge.net; Mon, 02 Nov 2020 09:19:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lJEHmFBd3cbPOId3itPZgdyXvG8tbcQnOFRnmR4UTeM=; b=kAivyEG4rWfE98KE4rvvlSM8OZ
 ZlKI/wcHL33Jp6MAMeEFlBsIzfH2ctvJLQYam7NbvfabwQk0JjAUozdWTIu/MKhAcMsG7xpWGUY/Q
 9tGHxVzfmVC5B4vhkNUQODBrKHILDMsUqzad8gwQJtYxCVShzZL+g+aa75L9V3c3EKiU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lJEHmFBd3cbPOId3itPZgdyXvG8tbcQnOFRnmR4UTeM=; b=Qw5TQWmKH4Wf1e0jw2CHf/UqYi
 DOVTngO4VkzvIpPAbAe4w5Q/yfUyXX6vnYsbDRyiJ4UvtHLKcq7tJy0dRbgeVXG8ibocUZqgLnhM3
 6l9ePbwDv8iKXKsPVKmVjn6e86GgXC87KTwB/xbV4rN3T+q8O7ka6T8UbIGOK3SJjCF0=;
Received: from mail-wr1-f67.google.com ([209.85.221.67])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kZVzi-00G9Eg-89
 for kgdb-bugreport@lists.sourceforge.net; Mon, 02 Nov 2020 09:19:25 +0000
Received: by mail-wr1-f67.google.com with SMTP id x7so13679930wrl.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 02 Nov 2020 01:19:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=lJEHmFBd3cbPOId3itPZgdyXvG8tbcQnOFRnmR4UTeM=;
 b=FplHk9O/3Aabvuq0TjN3j50JQhWdJC4NEcRFbKJD2Y129gdpW0LkBRrboK4kB8EMqU
 7CATJTqx6uwzh16XQT+EYIlFQS5Vlxlq27FU41zTXxMDj2Is7t5up4B88gOkNY5Ljk7N
 umYwxyT6zrolEnTdPSD+KDMbFK75DjJxrH7xdAcX7ZBr5sjdrno14/IuuUf5S7MHG6FJ
 +WBCkEddonUskiIhEM0aC2Wlf+HI9OWZ3tXAtFNpxZPqot0aOm8L0o7V8WkqgLlXoO3r
 WwGIKdws5nFZ5Nxq74lthS47tvfZV9fUOKVxxqoyipyNgIDcuvCG0vgmz6V4gGb+aoSf
 1FSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=lJEHmFBd3cbPOId3itPZgdyXvG8tbcQnOFRnmR4UTeM=;
 b=J0wMaQANkljVHHTMaZrsJ9fm0hsoAe4TpB+yW9wdO9IVT9jTx8Jdi3vyYraFOcyOvi
 Q0JkcqrbC1VnVmcRrZOG6ikCPYNoecOjsXfhb5JhaVS7903e6cNeICj4JW9tLHYPPlWn
 o1vuECCFhyu63DTqE6frph+d/Bs/Q6u/4Le5Oci2qTwwGI13cmtT7lbHiejqpl2iQBOO
 krJq9aGQin7veFZwdRmBTLzRtmeHGTqpXxpJVjtKXtIUxTvXoEPEX6EY++4z5hLVx6KS
 e29rAA3c44aP8GZ+Vnk5zt15zJxj/rqNIcYxSP2Jqb3YTQPV3NFaLQ/JoQv2qlcGtq2k
 +Stw==
X-Gm-Message-State: AOAM533XrvrD3Icq8dKllarDSPOe1sywAsCshrnh1d76C0Bt5xOp0AnH
 voU2NKVWC8Ra4sW2lsNG6Xfi1A==
X-Google-Smtp-Source: ABdhPJyT2/vlBNWplhw7RnadVnFPjUWs2R99EVOUZkdoO+TTy4Q7kTWiCScY9h/WA2u/o1tcM8BwOw==
X-Received: by 2002:a05:6000:3:: with SMTP id
 h3mr17931164wrx.215.1604308744638; 
 Mon, 02 Nov 2020 01:19:04 -0800 (PST)
Received: from holly.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id z19sm3725087wmk.12.2020.11.02.01.19.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 01:19:03 -0800 (PST)
Date: Mon, 2 Nov 2020 09:19:01 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Sumit Garg <sumit.garg@linaro.org>
Message-ID: <20201102091901.fkxdp2wyiycdhtjm@holly.lan>
References: <1603983387-8738-1-git-send-email-sumit.garg@linaro.org>
 <1603983387-8738-7-git-send-email-sumit.garg@linaro.org>
 <20201029152106.gj66mjnathsdqtoe@holly.lan>
 <CAFA6WYOcCj=_G67QGN=8McHWvunoggN7tho9_VueH763U9K=_g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFA6WYOcCj=_G67QGN=8McHWvunoggN7tho9_VueH763U9K=_g@mail.gmail.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.67 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.67 listed in list.dnswl.org]
X-Headers-End: 1kZVzi-00G9Eg-89
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

On Mon, Nov 02, 2020 at 11:48:53AM +0530, Sumit Garg wrote:
> On Thu, 29 Oct 2020 at 20:51, Daniel Thompson
> <daniel.thompson@linaro.org> wrote:
> >
> > On Thu, Oct 29, 2020 at 08:26:26PM +0530, Sumit Garg wrote:
> > > Add a new API kgdb_arch_roundup_cpus() for a particular archichecture to
> > > override default kgdb roundup and if it detects at runtime to not support
> > > NMI roundup then it can fallback to default implementation using async
> > > SMP cross-calls.
> > >
> > > Currently such an architecture example is arm64 supporting pseudo NMIs
> > > feature which is only available on platforms which have support for GICv3
> > > or later version.
> > >
> > > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> > > ---
> > >  arch/powerpc/kernel/kgdb.c |  3 ++-
> > >  arch/sparc/kernel/smp_64.c |  3 ++-
> > >  arch/x86/kernel/kgdb.c     |  6 ++++--
> > >  include/linux/kgdb.h       |  5 +++--
> > >  kernel/debug/debug_core.c  | 10 +++++++++-
> > >  5 files changed, 20 insertions(+), 7 deletions(-)
> > >
> > > diff --git a/arch/powerpc/kernel/kgdb.c b/arch/powerpc/kernel/kgdb.c
> > > index 4090802..126575d 100644
> > > --- a/arch/powerpc/kernel/kgdb.c
> > > +++ b/arch/powerpc/kernel/kgdb.c
> > > @@ -125,9 +125,10 @@ static int kgdb_debugger_ipi(struct pt_regs *regs)
> > >  }
> > >
> > >  #ifdef CONFIG_SMP
> > > -void kgdb_roundup_cpus(void)
> > > +bool kgdb_arch_roundup_cpus(void)
> > >  {
> > >       smp_send_debugger_break();
> > > +     return true;
> > >  }
> > >  #endif
> > >
> > > diff --git a/arch/sparc/kernel/smp_64.c b/arch/sparc/kernel/smp_64.c
> > > index e38d8bf..c459c83 100644
> > > --- a/arch/sparc/kernel/smp_64.c
> > > +++ b/arch/sparc/kernel/smp_64.c
> > > @@ -1014,9 +1014,10 @@ void flush_dcache_page_all(struct mm_struct *mm, struct page *page)
> > >  }
> > >
> > >  #ifdef CONFIG_KGDB
> > > -void kgdb_roundup_cpus(void)
> > > +bool kgdb_arch_roundup_cpus(void)
> > >  {
> > >       smp_cross_call(&xcall_kgdb_capture, 0, 0, 0);
> > > +     return true;
> > >  }
> > >  #endif
> > >
> > > diff --git a/arch/x86/kernel/kgdb.c b/arch/x86/kernel/kgdb.c
> > > index ff7878d..1b756d9 100644
> > > --- a/arch/x86/kernel/kgdb.c
> > > +++ b/arch/x86/kernel/kgdb.c
> > > @@ -404,7 +404,8 @@ static void kgdb_disable_hw_debug(struct pt_regs *regs)
> > >
> > >  #ifdef CONFIG_SMP
> > >  /**
> > > - *   kgdb_roundup_cpus - Get other CPUs into a holding pattern
> > > + *   kgdb_arch_roundup_cpus - Get other CPUs into a holding pattern
> > > + *                            in an architectural specific manner
> > >   *
> > >   *   On SMP systems, we need to get the attention of the other CPUs
> > >   *   and get them be in a known state.  This should do what is needed
> > > @@ -414,9 +415,10 @@ static void kgdb_disable_hw_debug(struct pt_regs *regs)
> > >   *
> > >   *   On non-SMP systems, this is not called.
> > >   */
> > > -void kgdb_roundup_cpus(void)
> > > +bool kgdb_arch_roundup_cpus(void)
> > >  {
> > >       apic_send_IPI_allbutself(NMI_VECTOR);
> > > +     return true;
> > >  }
> > >  #endif
> > >
> > > diff --git a/include/linux/kgdb.h b/include/linux/kgdb.h
> > > index 0d6cf64..f9db5b8 100644
> > > --- a/include/linux/kgdb.h
> > > +++ b/include/linux/kgdb.h
> > > @@ -200,7 +200,8 @@ kgdb_arch_handle_qxfer_pkt(char *remcom_in_buffer,
> > >  extern void kgdb_call_nmi_hook(void *ignored);
> > >
> > >  /**
> > > - *   kgdb_roundup_cpus - Get other CPUs into a holding pattern
> > > + *   kgdb_arch_roundup_cpus - Get other CPUs into a holding pattern
> > > + *                            in an architectural specific manner
> > >   *
> > >   *   On SMP systems, we need to get the attention of the other CPUs
> > >   *   and get them into a known state.  This should do what is needed
> > > @@ -210,7 +211,7 @@ extern void kgdb_call_nmi_hook(void *ignored);
> > >   *
> > >   *   On non-SMP systems, this is not called.
> > >   */
> > > -extern void kgdb_roundup_cpus(void);
> > > +extern bool kgdb_arch_roundup_cpus(void);
> > >
> > >  /**
> > >   *   kgdb_arch_set_pc - Generic call back to the program counter
> > > diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
> > > index 1e75a89..27e401c 100644
> > > --- a/kernel/debug/debug_core.c
> > > +++ b/kernel/debug/debug_core.c
> > > @@ -241,13 +241,21 @@ void __weak kgdb_call_nmi_hook(void *ignored)
> > >  }
> > >  NOKPROBE_SYMBOL(kgdb_call_nmi_hook);
> > >
> > > -void __weak kgdb_roundup_cpus(void)
> > > +bool __weak kgdb_arch_roundup_cpus(void)
> > > +{
> > > +     return false;
> >
> > Do we really need to introduce all these boolean return values just to
> > call a bit of library code when one of the architectures wants to
> > fallback to a generic implementation?
> >
> > Why not something more like:
> >
> > void kgdb_smp_call_nmi_hook(void)
> > {
> >     /* original weak version of kgdb_roundup_cpus goes here */
> > }
> >
> > void __weak kgdb_roundup_cpus(void)
> > {
> >     kgdb_smp_call_nmi_hook();
> > }
> >
> > arm64 can now simply call the new library function if a fallback is needed.
> >
> 
> Makes sense, I will use this approach instead.
> 
> > Note that same question applies to the backtrace changes...
> 
> In case of backtrace, there are already multiple APIs wrapping
> arch_trigger_cpumask_backtrace() as follows:
> 
> - trigger_all_cpu_backtrace()
> - trigger_allbutself_cpu_backtrace()
> - trigger_cpumask_backtrace()
> - trigger_single_cpu_backtrace()
> 
> And each of them already return a boolean and have corresponding
> different fallback mechanisms. So we can't have a common fallback API
> from arch specific code and instead need to extend that boolean return
> to arch specific code that is implemented as part of patch #4.

Understood. Thanks.


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
