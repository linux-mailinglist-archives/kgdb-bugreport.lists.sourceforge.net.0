Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C860325DBF
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 26 Feb 2021 07:56:35 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1lFX3C-0005jq-54
	for lists+kgdb-bugreport@lfdr.de; Fri, 26 Feb 2021 06:56:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1lFX3A-0005jj-6d
 for kgdb-bugreport@lists.sourceforge.net; Fri, 26 Feb 2021 06:56:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UrADPMnBZ4yoBkU/YnqPcC29N2iUEXdcqQ2toRM2mXU=; b=bZaB6edV4Bbh67BMaxXhoXVc//
 J/4A5loMib4VbMYcztOPm7dopKgNYav6V/MQYq2za2/wNMrHhqJsc5bHXjN3ubqH6OxY1LLp+rTkn
 BGDWV74XhIl/gW0Ok3LihHgRVoMUMVw1Gl+6F2ZpJ82b6BKewN9OjyzPOmoiMLch9OUw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UrADPMnBZ4yoBkU/YnqPcC29N2iUEXdcqQ2toRM2mXU=; b=bUJif0MCkyhx9DPpeNGzefyn9B
 qp4KXlWQHksDSeiJB/Aq5UJLIkXMjkr1IsCrzDZvPnU3H/DrlrYuJBA/hlq/Y4R3GAl/DEnbeTxJ9
 wMp2GxK/bklnQCGy7DgyMo89SVQ60ompvYNIPQijxHHMSx19aksBhJEtE6SWPowHerCw=;
Received: from mail-lj1-f174.google.com ([209.85.208.174])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1lFX32-005wJ3-V1
 for kgdb-bugreport@lists.sourceforge.net; Fri, 26 Feb 2021 06:56:32 +0000
Received: by mail-lj1-f174.google.com with SMTP id a17so9444453ljq.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 25 Feb 2021 22:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UrADPMnBZ4yoBkU/YnqPcC29N2iUEXdcqQ2toRM2mXU=;
 b=eFepvFj5vxgAV9mdLShk1pEQuEq/ti8+znapTe0TXp2bOu/L9MPqW+rUfHW7z5MEL8
 91jeUc/yr02bscPCU9WoWz0sIvRVDfY0qzs06fNPag5poabIBqOi21vl4mGUetX5XZUJ
 LwKYTFfW0epb11REZuq5RfzaoGCisr3e16Bz4kJNIJ5ioGH+o4lb71Edu61YLmCAMvm2
 m8IwQT2QsFsJ7oKVrz8rBLMkeOtbmfQmxf9sgg3a1x0PeiCzD2I+IlriQzTzfkQ4zkGz
 boH5TckQAM9zJ+YxSmxM9AUCx1NV9Lt4FNaZ/Otj/enH617IvcOWJG9Ghxr0grMEfcdp
 lSHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UrADPMnBZ4yoBkU/YnqPcC29N2iUEXdcqQ2toRM2mXU=;
 b=Xnz0OLoVTRApHmOwrhKQ1xubjVqtCHUGVd79wgbHubVeA/v+YzCmfjZ9/BRqe4mphB
 prN0v4SxumdRPrpt0QYltOBTm9ycMjXttv6v3qcSlQE8Wzxb+jNw0Gt+dECtQcR3Lkir
 EuCkxFkxfgNTH2QriRoeCql0bzrM1ckAZF2hwUlk7/Ml0/nKqWvDLyZtlQDNYnkE5T3i
 Mi8zth2DPU/nDXX+PweKal3KcRwQo0jAK9jRP0yp3p4xttvPS+Ur4KsRCttLQP+JlypF
 +UQIA1MCcYG/J3W9yK8r82CKUnMTHJVEmLmiuCP93xUhj+ysowVRMFgoYE9ztn3ZGbBv
 Y83w==
X-Gm-Message-State: AOAM530DdNAvpGENxyS2pvqYMM/cJh0iw/so3hS8XV4Ypql8klPVZSbP
 ZLU/1Ke+VQHzlVIktjxCJw8D6w6djVreWg8OiEPwcA==
X-Google-Smtp-Source: ABdhPJxwPpU76NmvTXgY0+vpZCEUd69qX7ujB5TalBs1OGjExSoBkWKC4nlZRGhTWTAkbMG0DD7c0nv+VBR+OhScRJw=
X-Received: by 2002:a2e:9e05:: with SMTP id e5mr840848ljk.152.1614322578322;
 Thu, 25 Feb 2021 22:56:18 -0800 (PST)
MIME-Version: 1.0
References: <20210224081652.587785-1-sumit.garg@linaro.org>
 <CAD=FV=VOdf1TyXWQOyP=y2xaLxY6_c+xm-VSSUkFasJD1Cbgpw@mail.gmail.com>
In-Reply-To: <CAD=FV=VOdf1TyXWQOyP=y2xaLxY6_c+xm-VSSUkFasJD1Cbgpw@mail.gmail.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Fri, 26 Feb 2021 12:26:07 +0530
Message-ID: <CAFA6WYMsphYjjwU0WBtOzo5FXC8OtcHv+3bM48iWjGu_3HkMRQ@mail.gmail.com>
To: Doug Anderson <dianders@chromium.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.174 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.174 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1lFX32-005wJ3-V1
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

On Wed, 24 Feb 2021 at 23:39, Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Wed, Feb 24, 2021 at 12:17 AM Sumit Garg <sumit.garg@linaro.org> wrote:
> >
> > Currently breakpoints in kernel .init.text section are not handled
> > correctly while allowing to remove them even after corresponding pages
> > have been freed.
> >
> > Fix it via killing .init.text section breakpoints just prior to initmem
> > pages being freed.
>
> It might be worth it to mention that HW breakpoints aren't handled by
> this patch but it's probably not such a big deal.
>
>
> > Suggested-by: Doug Anderson <dianders@chromium.org>
> > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
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
> > @@ -361,9 +361,11 @@ extern atomic_t                    kgdb_active;
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
> >         async_synchronize_full();
> >         kprobe_free_init_mem();
> >         ftrace_free_init_mem();
> > +       kgdb_free_init_mem();
> >         free_initmem();
> >         mark_readonly();
> >
> > diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
> > index 229dd119f430..319381e95d1d 100644
> > --- a/kernel/debug/debug_core.c
> > +++ b/kernel/debug/debug_core.c
> > @@ -465,6 +465,17 @@ int dbg_remove_all_break(void)
> >         return 0;
> >  }
> >
> > +void kgdb_free_init_mem(void)
> > +{
> > +       int i;
> > +
> > +       /* Clear init memory breakpoints. */
> > +       for (i = 0; i < KGDB_MAX_BREAKPOINTS; i++) {
> > +               if (init_section_contains((void *)kgdb_break[i].bpt_addr, 0))
>
> A nit, but instead of 0 should this be passing "BREAK_INSTR_SIZE" ?
>
> Also: even if memory is about to get freed it still seems like it'd be
> wise to call this:
>
>   kgdb_arch_remove_breakpoint(&kgdb_break[i]);
>
> It looks like it shouldn't matter today but just in case an
> architecture decides to do something fancy in the future it might not
> hurt to tell it that the breakpoint is going away.
>
>
> Everything here is pretty nitty, though.  This looks good to me now.
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Thanks Doug for your review.

-Sumit


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
