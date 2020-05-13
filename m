Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 408F41D157D
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 13 May 2020 15:35:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jYrXf-0002ck-1C
	for lists+kgdb-bugreport@lfdr.de; Wed, 13 May 2020 13:35:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1jYrXd-0002cU-4M
 for kgdb-bugreport@lists.sourceforge.net; Wed, 13 May 2020 13:35:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AbLaM0zuS8RSNZ5KCHHZ6Ac152Q0ScrgI1ljQOu9aJE=; b=JJheh9xkFoD+8vWp0AnqedzMdl
 6PRa5amOHp3t6v9XzsQi2NS4xi2Jss6LqoJS/66idcicpGUeesnHny2KbOk/79+n+V0LGU3IOHCs7
 fo2xksXMupZ0OX9D6JZErb9dRDvBuFORxoyLQ3uiDvtXy0PsZ1Wwy24n+LutyGSxDftI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AbLaM0zuS8RSNZ5KCHHZ6Ac152Q0ScrgI1ljQOu9aJE=; b=aoZkkRVHD0+agcnldUu7bDK4ix
 A86Ar3Rvkq+0sEAiaJcN5b6xXeeWu57dDZzLbu8ZyY86oXz90OJar3XudLVkKbKBHmarGgH3krQEE
 +Y/Vd2EpjexL5OKaOJi0VPVTwT0l0lxZpAQjY76Kq87S03zgf7n+ialZSItwKD/FY7yM=;
Received: from mail-lf1-f68.google.com ([209.85.167.68])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jYrXW-0080w5-TU
 for kgdb-bugreport@lists.sourceforge.net; Wed, 13 May 2020 13:35:21 +0000
Received: by mail-lf1-f68.google.com with SMTP id s9so13640332lfp.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 13 May 2020 06:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AbLaM0zuS8RSNZ5KCHHZ6Ac152Q0ScrgI1ljQOu9aJE=;
 b=Z3zy8N5e/5EgnatAgskbT9OXirHcNqQ7fTlo/YKqHV1m5BM1RVkKBpuiIyRaEQWi7A
 zO6YxV0ROpQ6WIuWP9zXO7fqir2p3ilOa6tRn/Sk3FLWOMVdmfVet/OBGYLotV2ovWuF
 Hrds8StM+QFbwfMZbrm1xouLulRg/WzYRi305dZ8QDIuF/vaH+uB/GZm6iSOVPqxl/g3
 Xlxwd39klDGBj45LEzSyGeKLdICjpN+To1D5o2xAS1FchGZ5tPXjAikGdum/gp+y23Bh
 llqYknMfCUZRZGmHkN0z7/eyytGU+4k9LSObmyuXIWY/uqRHd9fMpbBZn5eap5HGsqxn
 9wdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AbLaM0zuS8RSNZ5KCHHZ6Ac152Q0ScrgI1ljQOu9aJE=;
 b=KdyEQO6EZpBIrLVuiCuaRlxUwN8vggLE7btVjxtoPYbsMlhltGCFoPwyyIJpPZUSda
 M5wJ9X8gTBNa0OBaRE9AiFT0HKi7WNSk+qqdmO2/jYswR+7j1MFRegcLwpV4fDRSMi/G
 nn2iKW81SZpFRJvyfML5y62rKZMtipNsGPfu3ey+9anNDkcB/DMgTm8ZfDhTdnnXzITI
 sejBVsbv4In4JftdoRe9wqdP8/B3v/XrJsOjmNoloIG8KTbOgIxsnZWOT49vdqcY6vWa
 c8qMNrGpPGmcOO4BML/Bmv+NlH2z5p7tOjK4+3l7y6YtXw20943YQ2CzP/7dU4t30x7V
 GssQ==
X-Gm-Message-State: AOAM5339bMvje9568pVEm9c14l8r8FBRBGxt+bUJU1xa2gDMZj9CSLzI
 jHUjSwQI1FUo3m/Tmij0H2qQD4FsVNT8igk5EQ8NdA==
X-Google-Smtp-Source: ABdhPJwfDPLhZmMoBn1O6IHENozAHHXWYdX6zwDLq85eaDYbcafk51r8oY0LcH3KbleB+lci1jFw6H8KtWuXpRg1hpU=
X-Received: by 2002:ac2:4293:: with SMTP id m19mr8978614lfh.204.1589376899941; 
 Wed, 13 May 2020 06:34:59 -0700 (PDT)
MIME-Version: 1.0
References: <1589273314-12060-1-git-send-email-sumit.garg@linaro.org>
 <20200512142533.ta4uejwmq5gchtlx@holly.lan>
In-Reply-To: <20200512142533.ta4uejwmq5gchtlx@holly.lan>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Wed, 13 May 2020 19:04:48 +0530
Message-ID: <CAFA6WYOV7oPbYE=9fXueYMacb5wv0r9T6F8tmECt-Eafe-fctw@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.68 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.68 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jYrXW-0080w5-TU
Subject: Re: [Kgdb-bugreport] [PATCH] kgdb: Fix broken handling of printk()
 in NMI context
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
Cc: Petr Mladek <pmladek@suse.com>, Arnd Bergmann <arnd@arndb.de>,
 Peter Zijlstra <peterz@infradead.org>, kgdb-bugreport@lists.sourceforge.net,
 Steven Rostedt <rostedt@goodmis.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Tue, 12 May 2020 at 19:55, Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> On Tue, May 12, 2020 at 02:18:34PM +0530, Sumit Garg wrote:
> > Since commit 42a0bb3f7138 ("printk/nmi: generic solution for safe printk
> > in NMI"), kgdb entry in NMI context defaults to use safe NMI printk()
>
> I didn't see the author on Cc: nor any of the folks whose hands it
> passed through. It would definitely be good to involve them in this
> discussion.
>

Thanks for updating the Cc: list.

>
> > which involves CPU specific buffers and deferred printk() until exit from
> > NMI context.
> >
> > But kgdb being a stop-the-world debugger, we don't want to defer printk()
> > especially backtrace on corresponding CPUs. So instead switch to normal
> > printk() mode in kgdb_cpu_enter() if entry is in NMI context.
>
> So, firstly I should *definitely* take a mea cupla for not shouting
> about this at the time (I was on Cc:... twice). Only thing I can say
> confidently is that the test suite didn't yell about this and so I
> didn't look at this as closely as I should have done (and that it
> didn't yell is mostly because I'm still building out the test suite
> coverage).
>
> Anyhow...
>
> This feels a little like we are smearing the printk() interception logic
> across the kernel in ways that make things hard to read. If we accepted
> this patch we then have, the new NMI interception logic, the old kdb
> interception logic and some hacks in the kgdb trap handler to defang the
> NMI interception logic and force the kdb logic to kick in.
>
> Wouldn't it be better to migrate kdb interception logic up a couple of
> levels so that it continues to function even when we are in nmi printk
> mode. That way *all* the printk() interception code would end up in
> one place.
>

Yes it would be better to have all printk() interception code at one
place. Let me see if I can come up with an integrated logic.

> Finally some clue description of how to provoke the problem would be
> useful... that sort of things helps me to grow the test suite coverage.
>

Sure I will update the description. BTW, this issue can be easily
reproduced via issuing a backtrace (kdb command: "bt or btc") on a CPU
which entered kgdb in NMI context.

-Sumit

>
> Daniel.
>
>
> >
> > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> > ---
> >
> > Similar change was posted earlier specific to arm64 here [1]. But after
> > discussions it emerged out that this broken handling of printk() in NMI
> > context should be a common problem that is relevant to other archs as well.
> > So fix this handling in kgdb_cpu_enter() as there can be multiple entry
> > points to kgdb in NMI context.
> >
> > [1] https://lkml.org/lkml/2020/4/24/328
> >
> >  kernel/debug/debug_core.c | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> >
> > diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
> > index 2b7c9b6..ab2933f 100644
> > --- a/kernel/debug/debug_core.c
> > +++ b/kernel/debug/debug_core.c
> > @@ -567,6 +567,15 @@ static int kgdb_cpu_enter(struct kgdb_state *ks, struct pt_regs *regs,
> >       kgdb_info[ks->cpu].enter_kgdb++;
> >       kgdb_info[ks->cpu].exception_state |= exception_state;
> >
> > +     /*
> > +      * kgdb entry in NMI context defaults to use safe NMI printk() which
> > +      * involves CPU specific buffers and deferred printk() until exit from
> > +      * NMI context. But kgdb being a stop-the-world debugger, we don't want
> > +      * to defer printk(). So instead switch to normal printk() mode here.
> > +      */
> > +     if (in_nmi())
> > +             printk_nmi_exit();
> > +
> >       if (exception_state == DCPU_WANT_MASTER)
> >               atomic_inc(&masters_in_kgdb);
> >       else
> > @@ -635,6 +644,8 @@ static int kgdb_cpu_enter(struct kgdb_state *ks, struct pt_regs *regs,
> >                       atomic_dec(&slaves_in_kgdb);
> >                       dbg_touch_watchdogs();
> >                       local_irq_restore(flags);
> > +                     if (in_nmi())
> > +                             printk_nmi_enter();
> >                       return 0;
> >               }
> >               cpu_relax();
> > @@ -772,6 +783,8 @@ static int kgdb_cpu_enter(struct kgdb_state *ks, struct pt_regs *regs,
> >       raw_spin_unlock(&dbg_master_lock);
> >       dbg_touch_watchdogs();
> >       local_irq_restore(flags);
> > +     if (in_nmi())
> > +             printk_nmi_enter();
> >
> >       return kgdb_info[cpu].ret_state;
> >  }
> > --
> > 2.7.4
> >


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
