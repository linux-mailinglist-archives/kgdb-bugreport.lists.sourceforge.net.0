Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BAC432276A
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 23 Feb 2021 10:04:36 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1lETcR-0000Ke-6M
	for lists+kgdb-bugreport@lfdr.de; Tue, 23 Feb 2021 09:04:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1lETcB-0000I5-AK
 for kgdb-bugreport@lists.sourceforge.net; Tue, 23 Feb 2021 09:04:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CHTmR3tSf8v8P4uL8P5xVqexmawMTZdSHdkZEaf+zfs=; b=Zo1HS+qvvXwj2thuQEJGRGINEv
 fm/wthOFaOBjb3j8McvqGx5v9T5baYr7HsYi9aJwHCGr1cp5/vm+1fj1QNjj81VLBA9YqYg9Ka5JE
 +zyR9LtrPCgfUc9qeIzqcgNKC35lYPkday0ZmjQqKEnSEMcRiSvjloSOYHUhCzqY0sTE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CHTmR3tSf8v8P4uL8P5xVqexmawMTZdSHdkZEaf+zfs=; b=kRbxsnzUqCB+FSpOzrijpU0N3B
 7CZmzhtBHeMg7VhX7ogEduDyq2hs+TXek0fxou28vemzDFFmgWbgkIy4SW9Kia9vEVIEP9+oTtwG2
 DD6nnsmODYuLQiJ0DtPNVCtV/X/jUKFDRhUClqJaUoRGCqfsW4LCGhkiOyu4tC8TJIus=;
Received: from mail-lf1-f53.google.com ([209.85.167.53])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1lETc0-0004DB-JU
 for kgdb-bugreport@lists.sourceforge.net; Tue, 23 Feb 2021 09:04:19 +0000
Received: by mail-lf1-f53.google.com with SMTP id d3so9996181lfg.10
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 23 Feb 2021 01:04:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CHTmR3tSf8v8P4uL8P5xVqexmawMTZdSHdkZEaf+zfs=;
 b=jsB6t0kC9UJaX6coJ3UvErpPglnTzmghnYZYkACFa0Z9ZPM+4EZzzU5NUGCMEi6S/B
 yhbUsJtjWJIRh+R2K/MzkmhabH5etvWeSH75ix+3K8vPgcQyc2o03EwMTAzWTx9TPuRK
 x4KnhGWljimP1OWRnFWRU48pbP7YUYkUJc2v2wGUDtutzAwC4VC0Zp/FPEuzyL/dLhmj
 M2QnLcGSP2bJnEEoj9PaSYaazqiAzadstityGpxVKC3/2sRW/NjJwM5hMjZn9qY4Ap/h
 fRAXKpXdahXWn74+hCYH/km8/X6d+eCWAsmMn5f0jiJQdh9/6NpE0BJra+odewnvY9ZE
 3+Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CHTmR3tSf8v8P4uL8P5xVqexmawMTZdSHdkZEaf+zfs=;
 b=JPAcX39vWObtNlezy4sqvOhndLB1xNCqmK4UsmXucoFTpGsOQe+IP2Bd+vVKHe93tk
 oz2UhgUAdwbwDXEDVlBmfx14E0V7UjDpjMZ52K4O6k7yEfY0RjACyhVLbPrJkzAqUVQR
 O0cDwDRfJCBrm83YRqQSLxO+5bIyMgaNZhvb/HszUjGZTuldB6YomTfXzFZh4nK7IaE2
 Annlm0hk9Yai3GIbgYbOIoD4o9kHXgAXfqbASPOGnppUXasm7PxsBIVa4tdcbxMiLLGv
 zsTtitTJDZUfL7E5xJ9OhHCYTbyOEiQmZkpT9U/FIIRmBSk3vKtCwQZf7DJPCnVDF+kO
 rrZw==
X-Gm-Message-State: AOAM531mmFQaueMlmKF7sTQhpD1MDYgW3TADiadZFdcgbe9Y8HgEJDNT
 wq4dOby5B2aSlCzZsXhuzAo8M1Vqzhfph7CkwU9ZJA==
X-Google-Smtp-Source: ABdhPJySu6oBR88IcQr86tp9TZacyz+Ppy0CtsDn0Q+ApynryzIzNziyhc+dLPVxmSIjX2H9qpoEwWox9LyktihTHUI=
X-Received: by 2002:ac2:41d9:: with SMTP id d25mr8268727lfi.194.1614071041954; 
 Tue, 23 Feb 2021 01:04:01 -0800 (PST)
MIME-Version: 1.0
References: <1613721694-16418-1-git-send-email-sumit.garg@linaro.org>
 <CAD=FV=X1hsFf08J5JNifzFGw=1ikmXj2mp6K=KMOAzCYDWKZUw@mail.gmail.com>
In-Reply-To: <CAD=FV=X1hsFf08J5JNifzFGw=1ikmXj2mp6K=KMOAzCYDWKZUw@mail.gmail.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Tue, 23 Feb 2021 14:33:50 +0530
Message-ID: <CAFA6WYO0PkbpXUJp9jayb71LsydpnHfLFyc21bHotC1dLJ7Dhg@mail.gmail.com>
To: Doug Anderson <dianders@chromium.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: infradead.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.53 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.53 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1lETc0-0004DB-JU
Subject: Re: [Kgdb-bugreport] [PATCH] kernel: debug: Handle breakpoints in
 kernel .init.text section
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
 LKML <linux-kernel@vger.kernel.org>, qy15sije@cip.cs.fau.de,
 Jason Wessel <jason.wessel@windriver.com>, stefan.saecherl@fau.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Thanks Doug for your comments.

On Tue, 23 Feb 2021 at 05:28, Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Fri, Feb 19, 2021 at 12:03 AM Sumit Garg <sumit.garg@linaro.org> wrote:
> >
> > Currently breakpoints in kernel .init.text section are not handled
> > correctly while allowing to remove them even after corresponding pages
> > have been freed.
> >
> > In order to keep track of .init.text section breakpoints, add another
> > breakpoint state as BP_ACTIVE_INIT and don't try to free these
> > breakpoints once the system is in running state.
> >
> > To be clear there is still a very small window between call to
> > free_initmem() and system_state = SYSTEM_RUNNING which can lead to
> > removal of freed .init.text section breakpoints but I think we can live
> > with that.
>
> I know kdb / kgdb tries to keep out of the way of the rest of the
> system and so there's a bias to just try to infer the state of the
> rest of the system, but this feels like a halfway solution when really
> a cleaner solution really wouldn't intrude much on the main kernel.
> It seems like it's at least worth asking if we can just add a call
> like kgdb_drop_init_breakpoints() into main.c.  Then we don't have to
> try to guess the state...
>

Sounds reasonable, will post RFC for this. I think we should call such
function as kgdb_free_init_mem() in similar way as:
- kprobe_free_init_mem()
- ftrace_free_init_mem()

>
> > Suggested-by: Peter Zijlstra <peterz@infradead.org>
> > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> > ---
> >  include/linux/kgdb.h      |  3 ++-
> >  kernel/debug/debug_core.c | 17 +++++++++++++----
> >  2 files changed, 15 insertions(+), 5 deletions(-)
> >
> > diff --git a/include/linux/kgdb.h b/include/linux/kgdb.h
> > index 0d6cf64..57b8885 100644
> > --- a/include/linux/kgdb.h
> > +++ b/include/linux/kgdb.h
> > @@ -71,7 +71,8 @@ enum kgdb_bpstate {
> >         BP_UNDEFINED = 0,
> >         BP_REMOVED,
> >         BP_SET,
> > -       BP_ACTIVE
> > +       BP_ACTIVE_INIT,
> > +       BP_ACTIVE,
> >  };
> >
> >  struct kgdb_bkpt {
> > diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
> > index af6e8b4f..229dd11 100644
> > --- a/kernel/debug/debug_core.c
> > +++ b/kernel/debug/debug_core.c
> > @@ -324,7 +324,11 @@ int dbg_activate_sw_breakpoints(void)
> >                 }
> >
> >                 kgdb_flush_swbreak_addr(kgdb_break[i].bpt_addr);
> > -               kgdb_break[i].state = BP_ACTIVE;
> > +               if (system_state >= SYSTEM_RUNNING ||
> > +                   !init_section_contains((void *)kgdb_break[i].bpt_addr, 0))
>
> I haven't searched through all the code, but is there any chance that
> this could trigger incorrectly?  After we free the init memory could
> it be re-allocated to something that would contain code that would
> execute in kernel context and now we'd be unable to set breakpoints in
> that area?
>

"BP_ACTIVE_INIT" state is added specifically to handle this scenario
as to keep track of breakpoints that actually belong to the .init.text
section. And we should be able to again set breakpoints after free
since below change in this patch would mark them as "BP_UNDEFINED":

@@ -378,8 +382,13 @@ int dbg_deactivate_sw_breakpoints(void)
        int i;

        for (i = 0; i < KGDB_MAX_BREAKPOINTS; i++) {
-               if (kgdb_break[i].state != BP_ACTIVE)
+               if (kgdb_break[i].state < BP_ACTIVE_INIT)
+                       continue;
+               if (system_state >= SYSTEM_RUNNING &&
+                   kgdb_break[i].state == BP_ACTIVE_INIT) {
+                       kgdb_break[i].state = BP_UNDEFINED;
                        continue;
+               }
                error = kgdb_arch_remove_breakpoint(&kgdb_break[i]);
                if (error) {
                        pr_info("BP remove failed: %lx\n",

>
> > +                       kgdb_break[i].state = BP_ACTIVE;
> > +               else
> > +                       kgdb_break[i].state = BP_ACTIVE_INIT;
>
> I don't really see what the "BP_ACTIVE_INIT" state gets you.  Why not
> just leave it as "BP_ACTIVE" and put all the logic fully in
> dbg_deactivate_sw_breakpoints()?

Please see my response above.

>
> ...or, if we can inject a call in main.c we can do a one time delete
> of all "init" breakpoints and get rid of all this logic? Heck, even
> if we can't get called by "main.c", we still only need to do a
> one-time drop of all init breakpoints the first time we drop into the
> debugger after they are freed, right?

Yes and this is what we are trying to achieve via changes to
dbg_deactivate_sw_breakpoints() that will drop all the init
breakpoints the first time we drop into the debugger after they are
freed.

>
> Oh shoot.  I just realized another problem.  What about hardware
> breakpoints?  You still need to call "remove" on them once after init
> memory is freed, right?

Since the hw breakpoints are implemented in an arch specific manner,
so I would expect following arch specific callbacks to correctly
handle .init.text section hw breakpoints:
- arch_kgdb_ops.disable_hw_break()
- arch_kgdb_ops.correct_hw_break()

in a similar manner as this patch does for sw breakpoints. And since
they are only implemented for x86 currently for which I don't have a
development machine, so I will leave that for others to fix.

-Sumit

>
> -Doug


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
