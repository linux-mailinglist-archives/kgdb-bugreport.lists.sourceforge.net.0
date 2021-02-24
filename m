Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C9032438D
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 24 Feb 2021 19:09:53 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1lEybg-0006fh-MN
	for lists+kgdb-bugreport@lfdr.de; Wed, 24 Feb 2021 18:09:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1lEybf-0006fO-F4
 for kgdb-bugreport@lists.sourceforge.net; Wed, 24 Feb 2021 18:09:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FZy6N7GCZgUynsIdqwnAeC4Go7jwGa2J7ycwTmlSsCU=; b=Iyc945hc5XKeGnyEEnjp+uglpH
 r/3P7BMaN46FK6dgNKly3l692FTmcIHbT3ejUrgm2uYF+Bft8vVpviObj9cNMeKg8OPRIWuYH+L46
 +AKWAFvNooo5OooJEr6BJvgFQ9fP1VsSWKmxUOvXbtXwmaMc2b8/2t8+0HNSEBFz6b+4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FZy6N7GCZgUynsIdqwnAeC4Go7jwGa2J7ycwTmlSsCU=; b=RACz+kJ2XUAJmhTdJ5dXIHjH7z
 vJ3RAkehRduykf0y6g7YByzCy+EaL7UJKbXOdNiOgVSzWz0EUED/hUQkZ6IC9G1BgqClHsokmFeAq
 0Oe/kdnPDkPj0E2OYOkvsX0sXn5duRDHyIyhkyeF3aK6y+BfoHP3KC+VdjidzfmKgptw=;
Received: from mail-qv1-f50.google.com ([209.85.219.50])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1lEybZ-003wGW-PK
 for kgdb-bugreport@lists.sourceforge.net; Wed, 24 Feb 2021 18:09:51 +0000
Received: by mail-qv1-f50.google.com with SMTP id 15so1409813qvp.13
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 24 Feb 2021 10:09:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FZy6N7GCZgUynsIdqwnAeC4Go7jwGa2J7ycwTmlSsCU=;
 b=MDfl56YmwjZfSTl9u6eM0IrenqYoRdsWbFtd2gmx5jDq0IvGCbPQZQcr35FlKSozlQ
 Cf4txMmDM2GI+aEj5CAQ3PIZGj9KjCns0lU70Hs506h4Or/eJZDaXxtx2m4yNvOl/RRQ
 7KdqQR5LFX2qKtaHAupwrH6ET9cduFMHecJCk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FZy6N7GCZgUynsIdqwnAeC4Go7jwGa2J7ycwTmlSsCU=;
 b=i3EtkIBIImRa0m1m6eWFm8h/833CIgbfcy3noKyeNERmFOE0lzt7MZpTTKvwjg5k0v
 WDvYr9ixlPBzTYCI7XLenCyXCz+IgNHg0k0esQduMq4pMJe3gD+5hJXbAdu4h5C9eQJ+
 N5yac+fgz/i3nIM6DuJPJ5A4xaZ9kw5AsTANj6Rmg3eETAie9pA9yeY1pv+P24/18l+v
 4HZbV2cjgYn+boW1+c5Oldh3Iwu+n1HXj7IgbSMGT2nh/eHI7B/6dVz+ks7RN3Ue6spf
 Tmz6XdRs6VaSUFrSF2IPYr7G/CGI7dW1Lut8FLqLLBZ7O65P7tppDxjF0LimGHejR04g
 PxOQ==
X-Gm-Message-State: AOAM530Y9PoYANxvfi0husi8dfVDj+KqQJFu8EvEjj0NYMbJciL7JDA7
 QGScSn8n45eWE43XfqylmhlTCdLIz49w1A==
X-Google-Smtp-Source: ABdhPJz65JlzRuzWAF9jz5moq/aeG4/lDcqqwvB6xnXTKaeuQgqS6zoB2ArCC4WgBweOi5yMx1qffg==
X-Received: by 2002:a05:6214:268c:: with SMTP id
 gm12mr30762317qvb.36.1614190178424; 
 Wed, 24 Feb 2021 10:09:38 -0800 (PST)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com.
 [209.85.219.176])
 by smtp.gmail.com with ESMTPSA id n35sm1774877qte.19.2021.02.24.10.09.37
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Feb 2021 10:09:37 -0800 (PST)
Received: by mail-yb1-f176.google.com with SMTP id m188so2707581yba.13
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 24 Feb 2021 10:09:37 -0800 (PST)
X-Received: by 2002:a25:b74d:: with SMTP id e13mr49407214ybm.405.1614190176767; 
 Wed, 24 Feb 2021 10:09:36 -0800 (PST)
MIME-Version: 1.0
References: <20210224081652.587785-1-sumit.garg@linaro.org>
In-Reply-To: <20210224081652.587785-1-sumit.garg@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 24 Feb 2021 10:09:25 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VOdf1TyXWQOyP=y2xaLxY6_c+xm-VSSUkFasJD1Cbgpw@mail.gmail.com>
Message-ID: <CAD=FV=VOdf1TyXWQOyP=y2xaLxY6_c+xm-VSSUkFasJD1Cbgpw@mail.gmail.com>
To: Sumit Garg <sumit.garg@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.219.50 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.50 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lEybZ-003wGW-PK
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Peter Zijlstra <peterz@infradead.org>, kgdb-bugreport@lists.sourceforge.net,
 LKML <linux-kernel@vger.kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 qy15sije@cip.cs.fau.de, Masami Hiramatsu <mhiramat@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 Andrew Morton <akpm@linux-foundation.org>, stefan.saecherl@fau.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Wed, Feb 24, 2021 at 12:17 AM Sumit Garg <sumit.garg@linaro.org> wrote:
>
> Currently breakpoints in kernel .init.text section are not handled
> correctly while allowing to remove them even after corresponding pages
> have been freed.
>
> Fix it via killing .init.text section breakpoints just prior to initmem
> pages being freed.

It might be worth it to mention that HW breakpoints aren't handled by
this patch but it's probably not such a big deal.


> Suggested-by: Doug Anderson <dianders@chromium.org>
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> ---
>  include/linux/kgdb.h      |  2 ++
>  init/main.c               |  1 +
>  kernel/debug/debug_core.c | 11 +++++++++++
>  3 files changed, 14 insertions(+)
>
> diff --git a/include/linux/kgdb.h b/include/linux/kgdb.h
> index 57b8885708e5..3aa503ef06fc 100644
> --- a/include/linux/kgdb.h
> +++ b/include/linux/kgdb.h
> @@ -361,9 +361,11 @@ extern atomic_t                    kgdb_active;
>  extern bool dbg_is_early;
>  extern void __init dbg_late_init(void);
>  extern void kgdb_panic(const char *msg);
> +extern void kgdb_free_init_mem(void);
>  #else /* ! CONFIG_KGDB */
>  #define in_dbg_master() (0)
>  #define dbg_late_init()
>  static inline void kgdb_panic(const char *msg) {}
> +static inline void kgdb_free_init_mem(void) { }
>  #endif /* ! CONFIG_KGDB */
>  #endif /* _KGDB_H_ */
> diff --git a/init/main.c b/init/main.c
> index c68d784376ca..a446ca3d334e 100644
> --- a/init/main.c
> +++ b/init/main.c
> @@ -1417,6 +1417,7 @@ static int __ref kernel_init(void *unused)
>         async_synchronize_full();
>         kprobe_free_init_mem();
>         ftrace_free_init_mem();
> +       kgdb_free_init_mem();
>         free_initmem();
>         mark_readonly();
>
> diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
> index 229dd119f430..319381e95d1d 100644
> --- a/kernel/debug/debug_core.c
> +++ b/kernel/debug/debug_core.c
> @@ -465,6 +465,17 @@ int dbg_remove_all_break(void)
>         return 0;
>  }
>
> +void kgdb_free_init_mem(void)
> +{
> +       int i;
> +
> +       /* Clear init memory breakpoints. */
> +       for (i = 0; i < KGDB_MAX_BREAKPOINTS; i++) {
> +               if (init_section_contains((void *)kgdb_break[i].bpt_addr, 0))

A nit, but instead of 0 should this be passing "BREAK_INSTR_SIZE" ?

Also: even if memory is about to get freed it still seems like it'd be
wise to call this:

  kgdb_arch_remove_breakpoint(&kgdb_break[i]);

It looks like it shouldn't matter today but just in case an
architecture decides to do something fancy in the future it might not
hurt to tell it that the breakpoint is going away.


Everything here is pretty nitty, though.  This looks good to me now.

Reviewed-by: Douglas Anderson <dianders@chromium.org>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
