Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B68D2D4A
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 10 Oct 2019 17:07:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1iIa2h-0008DD-E6
	for lists+kgdb-bugreport@lfdr.de; Thu, 10 Oct 2019 15:07:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1iIa2f-0008D6-MU
 for kgdb-bugreport@lists.sourceforge.net; Thu, 10 Oct 2019 15:07:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WUDm5zaFSbVu0zV8h5brUsLKlZDD8nubj8jchHL8uiI=; b=HdIfaVNlgrLBfF9z+E+YZCGybe
 XhsNeD53SIltLEg5lT37KLzSVv9r/YflnMrATTDaLNqY+d7pSiZgRpuRaa8SI+/JYF0WCnSU1cOpj
 XwCLye/cVyWKTfLCiiYshkixlcurZzKtfqO1AiyWcG6XfmAx4UIFxDAtEuRspsUbjYyo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WUDm5zaFSbVu0zV8h5brUsLKlZDD8nubj8jchHL8uiI=; b=lCe6D2U/cgNcXeM5mMW+Q/26hk
 3MEEmKcAIf+KtruOAVqxvFa7S/XO92vSQ3sIBrXI0BlksROZhr0spuU1U6L+lmH0p/atXpkPjeowZ
 m6yiAWygY/v4+uF10NpZ90mrokQ8c96r0qPHF1viGtc/r3W8fq80/gu1ks9behnBRfF4=;
Received: from mail-wr1-f67.google.com ([209.85.221.67])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iIa2a-0058ET-BH
 for kgdb-bugreport@lists.sourceforge.net; Thu, 10 Oct 2019 15:07:49 +0000
Received: by mail-wr1-f67.google.com with SMTP id v8so8347899wrt.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 10 Oct 2019 08:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=WUDm5zaFSbVu0zV8h5brUsLKlZDD8nubj8jchHL8uiI=;
 b=mKQe7WMl7WbrbvrR9sv6El1Eia4u2TAQY8VBeAFdGGjDfvhHf0R6aT+I8nxRN6a6Qz
 /sBhxJ2Uw/jPmSS7NjLHeMz02RkpHKi0celaoAgmtZTfjy8ivNUsiwqcOLoO3Gfo0wKi
 9zI7/ZJnrclP8rovCwS5OQgWl6b6BVTxHdS9Rw4pGKRwqjNU6GMALzSjCXhzY2mqRv4/
 KxjPmbyAOEE+ZIZ195oefa541R8tTGV2GMe6ss/xGadNUcfioI8K7YUYy0fHqMkHJ2rA
 nmu/Vs8ntPSMK4AYNc7GthaaFwD4gwGJ9Y1NRf5yXqqdcnmYRLyJGg+lj9tPU1DGtB50
 eC9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=WUDm5zaFSbVu0zV8h5brUsLKlZDD8nubj8jchHL8uiI=;
 b=KDcArBsq7rbd1mSht4IXpVqF9jV8luEfESMbnROupnzHHlGLVnG76AFlb5Z4VZe9k5
 /ANajkeSjNw6O/zbJh/04WeK9S2r5fMh9yzHP2EC90GAIBJYJjkrNZnq4z2vdIU1DaZM
 +pSsiByNs7g4BOGd7eoaSE5FRfka40Y3oJxOaRkZrbIXfpAL3qWsqhXbvK3OSPp+xYTF
 ixgA1ENOfxZACK9UmS8dhk2WbaG4wdIq7NC0NtCurdN0s1B1VuF4rDKOqiUL4faq22ix
 1lch90Y1ZC+reeo1bJoknl4/dzgo1Q5duDaWqIC7yMMx41yZk+XKjH9YwpKsxXLG9Ds8
 i/Mg==
X-Gm-Message-State: APjAAAWQPFTLaoYeJ9PHcRqxKa8nZB+YJM8OMSEr1J5TPODPW5FDS8He
 hAxUXqMRKhSXfXdY3drjKoyhhg==
X-Google-Smtp-Source: APXvYqy2VkQGbfL4jZPGzf9WRuO/jriBF5av5PQvo0WnR2Qdx8QI3WPmJJsFt0oGa21EtnGX/1Gttg==
X-Received: by 2002:a5d:540e:: with SMTP id g14mr9300842wrv.177.1570720057665; 
 Thu, 10 Oct 2019 08:07:37 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id y186sm10500048wmb.41.2019.10.10.08.07.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2019 08:07:36 -0700 (PDT)
Date: Thu, 10 Oct 2019 16:07:35 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Doug Anderson <dianders@chromium.org>
Message-ID: <20191010150735.dhrj3pbjgmjrdpwr@holly.lan>
References: <20190925200220.157670-1-dianders@chromium.org>
 <20190925125811.v3.3.Id33c06cbd1516b49820faccd80da01c7c4bf15c7@changeid>
 <20191007135459.lj3qc2tqzcv3xcia@holly.lan>
 <CAD=FV=Vqj9JqGCQX_Foij8EkFtSy8r2wB3uoXNae6PECwNV+CQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=FV=Vqj9JqGCQX_Foij8EkFtSy8r2wB3uoXNae6PECwNV+CQ@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.67 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.67 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iIa2a-0058ET-BH
Subject: Re: [Kgdb-bugreport] [PATCH v3 3/4] kdb: Fix "btc <cpu>" crash if
 the CPU didn't round up
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 kgdb-bugreport@lists.sourceforge.net,
 Jason Wessel <jason.wessel@windriver.com>, LKML <linux-kernel@vger.kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Mon, Oct 07, 2019 at 04:34:55PM -0700, Doug Anderson wrote:
> Hi,
> 
> On Mon, Oct 7, 2019 at 6:55 AM Daniel Thompson
> <daniel.thompson@linaro.org> wrote:
> >
> > On Wed, Sep 25, 2019 at 01:02:19PM -0700, Douglas Anderson wrote:
> > >
> > > I noticed that when I did "btc <cpu>" and the CPU I passed in hadn't
> > > rounded up that I'd crash.  I was going to copy the same fix from
> > > commit 162bc7f5afd7 ("kdb: Don't back trace on a cpu that didn't round
> > > up") into the "not all the CPUs" case, but decided it'd be better to
> > > clean things up a little bit.
> > >
> > > This consolidates the two code paths.  It is _slightly_ wasteful in in
> > > that the checks for "cpu" being too small or being offline isn't
> > > really needed when we're iterating over all online CPUs, but that
> > > really shouldn't hurt.  Better to have the same code path.
> > >
> > > While at it, eliminate at least one slightly ugly (and totally
> > > needless) recursive use of kdb_parse().
> > >
> > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > ---
> > >
> > > Changes in v3:
> > > - Patch ("kdb: Fix "btc <cpu>" crash if the CPU...") new for v3.
> > >
> > > Changes in v2: None
> > >
> > >  kernel/debug/kdb/kdb_bt.c | 61 ++++++++++++++++++++++-----------------
> > >  1 file changed, 34 insertions(+), 27 deletions(-)
> > >
> > > diff --git a/kernel/debug/kdb/kdb_bt.c b/kernel/debug/kdb/kdb_bt.c
> > > index 120fc686c919..d9af139f9a31 100644
> > > --- a/kernel/debug/kdb/kdb_bt.c
> > > +++ b/kernel/debug/kdb/kdb_bt.c
> > > @@ -101,6 +101,27 @@ kdb_bt1(struct task_struct *p, unsigned long mask, bool btaprompt)
> > >       return 0;
> > >  }
> > >
> > > +static void
> > > +kdb_bt_cpu(unsigned long cpu)
> > > +{
> > > +     struct task_struct *kdb_tsk;
> > > +
> > > +     if (cpu >= num_possible_cpus() || !cpu_online(cpu)) {
> > > +             kdb_printf("WARNING: no process for cpu %ld\n", cpu);
> > > +             return;
> > > +     }
> > > +
> > > +     /* If a CPU failed to round up we could be here */
> > > +     kdb_tsk = KDB_TSK(cpu);
> > > +     if (!kdb_tsk) {
> > > +             kdb_printf("WARNING: no task for cpu %ld\n", cpu);
> > > +             return;
> > > +     }
> > > +
> > > +     kdb_set_current_task(kdb_tsk);
> > > +     kdb_bt1(kdb_tsk, ~0UL, false);
> > > +}
> > > +
> > >  int
> > >  kdb_bt(int argc, const char **argv)
> > >  {
> > > @@ -161,7 +182,6 @@ kdb_bt(int argc, const char **argv)
> > >       } else if (strcmp(argv[0], "btc") == 0) {
> > >               unsigned long cpu = ~0;
> > >               struct task_struct *save_current_task = kdb_current_task;
> > > -             char buf[80];
> > >               if (argc > 1)
> > >                       return KDB_ARGCOUNT;
> > >               if (argc == 1) {
> > > @@ -169,35 +189,22 @@ kdb_bt(int argc, const char **argv)
> > >                       if (diag)
> > >                               return diag;
> > >               }
> > > -             /* Recursive use of kdb_parse, do not use argv after
> > > -              * this point */
> > > -             argv = NULL;
> > >               if (cpu != ~0) {
> > > -                     if (cpu >= num_possible_cpus() || !cpu_online(cpu)) {
> > > -                             kdb_printf("no process for cpu %ld\n", cpu);
> > > -                             return 0;
> > > -                     }
> > > -                     sprintf(buf, "btt 0x%px\n", KDB_TSK(cpu));
> > > -                     kdb_parse(buf);
> > > -                     return 0;
> > > -             }
> > > -             kdb_printf("btc: cpu status: ");
> > > -             kdb_parse("cpu\n");
> > > -             for_each_online_cpu(cpu) {
> > > -                     void *kdb_tsk = KDB_TSK(cpu);
> > > -
> > > -                     /* If a CPU failed to round up we could be here */
> > > -                     if (!kdb_tsk) {
> > > -                             kdb_printf("WARNING: no task for cpu %ld\n",
> > > -                                        cpu);
> > > -                             continue;
> > > +                     kdb_bt_cpu(cpu);
> > > +             } else {
> > > +                     /*
> > > +                      * Recursive use of kdb_parse, do not use argv after
> > > +                      * this point.
> > > +                      */
> > > +                     argv = NULL;
> > > +                     kdb_printf("btc: cpu status: ");
> > > +                     kdb_parse("cpu\n");
> > > +                     for_each_online_cpu(cpu) {
> > > +                             kdb_bt_cpu(cpu);
> > > +                             touch_nmi_watchdog();
> > >                       }
> > > -
> > > -                     sprintf(buf, "btt 0x%px\n", kdb_tsk);
> > > -                     kdb_parse(buf);
> > > -                     touch_nmi_watchdog();
> > > +                     kdb_set_current_task(save_current_task);
> > >               }
> > > -             kdb_set_current_task(save_current_task);
> >
> > Why does this move out into only one of the conditional branches?
> > Don't both of the above paths modify the current task?
> 
> The old code has a "return 0 in the case that "cpu != ~0", so this
> basically matches the prior behavior in restoring the current task for
> a "btc" but not leaving the current task changed in the case of "btc
> <cpu>".  Thus my patch doesn't actually change the existing behavior,
> but I guess that it does make the control flow simpler so it's easier
> to understand what the behavior is.  ;-)

Point taken. Horrific though it may be ;-) .


> Reading through other control flows of the various backtrace commands,
> it looks like it is intentional to leave the current task changed when
> you explicitly do an action on that task (or a CPU).
> 
> Actually, though, it wasn't clear to me that it ever made sense for
> any of these commands to implicitly leave the current task changed.
> If you agree, I can send a follow-up patch to change this behavior.

Personally I don't like implicit changes of state but I might need a bit
more thinking to agree (or disagree ;-) ).


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
