Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E86B325DD6
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 26 Feb 2021 08:02:34 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1lFX8z-0004Kl-2j
	for lists+kgdb-bugreport@lfdr.de; Fri, 26 Feb 2021 07:02:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1lFX8w-0004Kd-Jv
 for kgdb-bugreport@lists.sourceforge.net; Fri, 26 Feb 2021 07:02:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=x49OuNAA7q3ldYJSjcOEu3pJBfD36s7mXciQbRekJb0=; b=IgV1Gp04+1wzpbdCwrzee8Xol9
 TtkXFjNCR5boFgPS5P/Jpv+UJ6mYbamZsjm1Ez3/s3NXXm4sMAvikyusInbomRAvgbTMRhEQ7MZYU
 uFwVx7Nqd3A1D/T7xh25ccs4RVGmhWyCYVRvAceFmX4LLIIJbLUR9kvdySj7g9zIVdUg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=x49OuNAA7q3ldYJSjcOEu3pJBfD36s7mXciQbRekJb0=; b=buIl7a+Dpg6d8Ncj/1J+VD+/H+
 ZvboizWJkQh7PJvMTqLsoK5pHyVtO1i/XL7W+FPOgsQJ5Rkf+6Awjg7nvSjPQUy9eMPE8qqpaTKKs
 Ee6YFBQlerbNmuLIGxSoPLxTlym6uexY5h+TIvlF+PUqJrMhwiEGVOeGxB3c4hXzhub8=;
Received: from mail-lf1-f51.google.com ([209.85.167.51])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1lFX8r-005wbI-63
 for kgdb-bugreport@lists.sourceforge.net; Fri, 26 Feb 2021 07:02:30 +0000
Received: by mail-lf1-f51.google.com with SMTP id a17so11912700lfb.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 25 Feb 2021 23:02:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x49OuNAA7q3ldYJSjcOEu3pJBfD36s7mXciQbRekJb0=;
 b=tMITdCHDdLuCxy3S/32qbXJZ86+VHkC0uFyR4ush6nMHiwC+xi4CKRwZq6S2zpQXM6
 fOwNrbN/hMHOc8r4+Q51MED5+s0jQWAa+UdhKZIzEVCLzfRftEkO4+R8YfqBsBH2D3dr
 yrStgOKlSXeZ86dKL8c3dz9qO0PxJCpMXYdqtqnoGxWVjBjGhkwOWIefZdGk7/A6+pOs
 xMEIuV1xsao2iTJVwUlvMEuq/kkSCPiX307gxmUGlySik8LsTVulgPBFxyod7n9hQOaT
 No5tmxAVrKpvClXxIIbmzuLyTSo/WDFGBEMqorUBwDkRBFp04tDaonVX9R8r8Q6ABZ/J
 /7xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x49OuNAA7q3ldYJSjcOEu3pJBfD36s7mXciQbRekJb0=;
 b=K9/aUmc4MwdG3BA0+t0ulnh4xhwPHsLd0unCKI1Jmt4vz8QXOS3IyXVTyrNq01brjS
 o6CabSsDyB2HxYeWX9r9fnXyQxio4N8xAk5MoAAUk0f/t9hv1QMx1u9cv8ds1jEASduF
 sE3k34z5++tvF2FEsV3MVzq+SHhF5mNMXt6AvrWgxhifW8C+i9x47VQcLLI6bVkwS2+o
 3/IpN6WtYXGi0+RaYLpl74x3ghVoo29Z19Z70iQlQMVw8a7z4DvW+8A4wKh1SXgqQ8VC
 NQ/AkOx/8P52pdhY9ms4PkajzboyvMI3QjtKAGascDoq+mJSXJP8SUI1DU2ydLuNr4Mb
 3/UQ==
X-Gm-Message-State: AOAM530am0emU2Bt3D2qSJrccQdsNDwCsv9JcB7jUnBYS+sgEmEPEw4B
 5ejTVSm+26U7a9rF3lBw6rMtJA2jllPcytdQM0+PgA==
X-Google-Smtp-Source: ABdhPJyFWiSTpK+1nRF6cL4mPPftIJJKu6Qpz/fRdVSz3dAHo0tnGwHqxfIs6AGlHV0PG60Z0ALrbSyX+iSP2Sffn1g=
X-Received: by 2002:ac2:5295:: with SMTP id q21mr947778lfm.108.1614322938536; 
 Thu, 25 Feb 2021 23:02:18 -0800 (PST)
MIME-Version: 1.0
References: <20210224081652.587785-1-sumit.garg@linaro.org>
 <20210225155607.634snzzq3w62kpkn@maple.lan>
In-Reply-To: <20210225155607.634snzzq3w62kpkn@maple.lan>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Fri, 26 Feb 2021 12:32:07 +0530
Message-ID: <CAFA6WYMYDNk2S=7crfYsrbP7XONTA-ytEypoqeo1GTpxf8NhAQ@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.51 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.51 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1lFX8r-005wbI-63
Subject: Re: [Kgdb-bugreport] [PATCH] kgdb: Fix to kill breakpoints on
 initmem after boot
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
Cc: Peter Zijlstra <peterz@infradead.org>, kgdb-bugreport@lists.sourceforge.net,
 Steven Rostedt <rostedt@goodmis.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 qy15sije@cip.cs.fau.de, Masami Hiramatsu <mhiramat@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>, stable <stable@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, stefan.saecherl@fau.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

+ stable ML

On Thu, 25 Feb 2021 at 21:26, Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> On Wed, Feb 24, 2021 at 01:46:52PM +0530, Sumit Garg wrote:
> > Currently breakpoints in kernel .init.text section are not handled
> > correctly while allowing to remove them even after corresponding pages
> > have been freed.
> >
> > Fix it via killing .init.text section breakpoints just prior to initmem
> > pages being freed.
> >
> > Suggested-by: Doug Anderson <dianders@chromium.org>
> > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
>
> I saw Andrew has picked this one up. That's ok for me:
> Acked-by: Daniel Thompson <daniel.thompson@linaro.org>
>
> I already enriched kgdbtest to cover this (and they pass) so I guess
> this is also:
> Tested-by: Daniel Thompson <daniel.thompson@linaro.org>
>

Thanks Daniel.

> BTW this is not Cc:ed to stable and I do wonder if it crosses the
> threshold to be considered a fix rather than a feature. Normally I
> consider adding safety rails for kgdb to be a new feature but, in this
> case, the problem would easily ensnare an inexperienced developer who is
> doing nothing more than debugging their own driver (assuming they
> correctly marked their probe function as .init) so I think this weighs
> in favour of being a fix.
>

Makes sense, Cc:ed stable.

-Sumit

>
> Daniel.
>
>
> > ---
> >  include/linux/kgdb.h      |  2 ++
> >  init/main.c               |  1 +
> >  kernel/debug/debug_core.c | 11 +++++++++++
> >  3 files changed, 14 insertions(+)
> >
> > diff --git a/include/linux/kgdb.h b/include/linux/kgdb.h
> > index 57b8885708e5..3aa503ef06fc 100644
> > --- a/include/linux/kgdb.h
> > +++ b/include/linux/kgdb.h
> > @@ -361,9 +361,11 @@ extern atomic_t                  kgdb_active;
> >  extern bool dbg_is_early;
> >  extern void __init dbg_late_init(void);
> >  extern void kgdb_panic(const char *msg);
> > +extern void kgdb_free_init_mem(void);
> >  #else /* ! CONFIG_KGDB */
> >  #define in_dbg_master() (0)
> >  #define dbg_late_init()
> >  static inline void kgdb_panic(const char *msg) {}
> > +static inline void kgdb_free_init_mem(void) { }
> >  #endif /* ! CONFIG_KGDB */
> >  #endif /* _KGDB_H_ */
> > diff --git a/init/main.c b/init/main.c
> > index c68d784376ca..a446ca3d334e 100644
> > --- a/init/main.c
> > +++ b/init/main.c
> > @@ -1417,6 +1417,7 @@ static int __ref kernel_init(void *unused)
> >       async_synchronize_full();
> >       kprobe_free_init_mem();
> >       ftrace_free_init_mem();
> > +     kgdb_free_init_mem();
> >       free_initmem();
> >       mark_readonly();
> >
> > diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
> > index 229dd119f430..319381e95d1d 100644
> > --- a/kernel/debug/debug_core.c
> > +++ b/kernel/debug/debug_core.c
> > @@ -465,6 +465,17 @@ int dbg_remove_all_break(void)
> >       return 0;
> >  }
> >
> > +void kgdb_free_init_mem(void)
> > +{
> > +     int i;
> > +
> > +     /* Clear init memory breakpoints. */
> > +     for (i = 0; i < KGDB_MAX_BREAKPOINTS; i++) {
> > +             if (init_section_contains((void *)kgdb_break[i].bpt_addr, 0))
> > +                     kgdb_break[i].state = BP_UNDEFINED;
> > +     }
> > +}
> > +
> >  #ifdef CONFIG_KGDB_KDB
> >  void kdb_dump_stack_on_cpu(int cpu)
> >  {
> > --
> > 2.25.1


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
