Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A4418CEFCC
	for <lists+kgdb-bugreport@lfdr.de>; Tue,  8 Oct 2019 02:04:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1iHcza-0003mZ-BF
	for lists+kgdb-bugreport@lfdr.de; Tue, 08 Oct 2019 00:04:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1iHczY-0003mL-US
 for kgdb-bugreport@lists.sourceforge.net; Tue, 08 Oct 2019 00:04:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4cd5fANmNO/0+yv+k6MZCYY0xb+xh97NDSvs/PRVUuA=; b=SPfCLRhv7tnjcfKmZEA8gzXYmj
 uS0gVepBIqJBbQzJQWr0l05XRLGL0p2PldUiuuZrjGT4hJ2Fg6wpj6z5AW/G0CdPD6VR5zhtjqnMe
 9IZgPXy30bJH/XuDEha7xYYQF/klHVyQHGJWuhtcWUx5ZNDHjBVaCCTkuQv8Yb3FvSHk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4cd5fANmNO/0+yv+k6MZCYY0xb+xh97NDSvs/PRVUuA=; b=lPIaSf3IWX1Ow7AqJJBfG5Cp3+
 7d+Eu9XF6x8+MFGU4ZBWAmvYLaimbIVHgvf27QYEDRRWuurGhkIlk/53ikLeNzCmmIIvxxb1ZMWyn
 Rng4M0BK/OYcTOBFUYHIKjVRlvyh+6+dP6xjRwn8vHGxTlbeN0edlM0rnu7UlAba07Hk=;
Received: from mail-oi1-f193.google.com ([209.85.167.193])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iHczX-009GDS-I4
 for kgdb-bugreport@lists.sourceforge.net; Tue, 08 Oct 2019 00:04:40 +0000
Received: by mail-oi1-f193.google.com with SMTP id w144so13310957oia.6
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 07 Oct 2019 17:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4cd5fANmNO/0+yv+k6MZCYY0xb+xh97NDSvs/PRVUuA=;
 b=YdwWvJbiGSiDm8IZxHceGHTAS9JW3OYfxUTlkKSq1r3cvnhHkHaF7M4ycA0UmFnHqV
 TlZxb1RUyOakVqAsaGGJaZdwnFm2erSeFF289kuoYj+274xdo/AKAjIRq0+3LplZtTbH
 ydvhhkiRz5Yxyc2IIIDIS1tZPH7g/DpbYi7kw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4cd5fANmNO/0+yv+k6MZCYY0xb+xh97NDSvs/PRVUuA=;
 b=mZeWrLiS33rlI+jf4dld6mIiUegmI7gBwzM8wiKJW12Y9ODbICDLNPK2TkCayaXVjS
 oG8tsQQsK24o8liNE+LuPaOZZ+EHoJIk9l79aAwPkSV8eAMmNR9HkC9O6VOj4rPuBNoN
 BtRyCcbGXZNS8MzsDGg3+/SrORBPRoTtGIfHxXO3dUbl86ZNCfO2Uzk4MAwUOpMU3SUI
 O+Swn1ca+49SfUoIn5DdjpHAjrrhgfTWDKUsSXWS7EGJ4ix+NhK8fs9EJsTqixVxX1Yi
 kcUlbhO5O+TYjO8qVcFcwOz9ZzTbRNf0W3ELWnCaYVXyae4TXd2Bv2IwZmsIAUX8g6/l
 YT9A==
X-Gm-Message-State: APjAAAV+Pb4f5sZurr1Tuy3DPnkSnwE8u+KEfDZ6YI/K+jZyFsViXxOq
 PF4BqXtAsO1PP5f39lZwD0sMqtlaRTo=
X-Google-Smtp-Source: APXvYqyEinmiocWf1hveA1fSqp9h3bcWnJ1sFgqLdN65H2KutcsTTP7wWi1cntvd7Scjoonargf63Q==
X-Received: by 2002:a05:6808:2c3:: with SMTP id
 a3mr1522161oid.40.1570491308838; 
 Mon, 07 Oct 2019 16:35:08 -0700 (PDT)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com.
 [209.85.166.44])
 by smtp.gmail.com with ESMTPSA id v75sm5156026oia.6.2019.10.07.16.35.08
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Oct 2019 16:35:08 -0700 (PDT)
Received: by mail-io1-f44.google.com with SMTP id c6so32482753ioo.13
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 07 Oct 2019 16:35:08 -0700 (PDT)
X-Received: by 2002:a92:d7ce:: with SMTP id g14mr17815393ilq.269.1570491307637; 
 Mon, 07 Oct 2019 16:35:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190925200220.157670-1-dianders@chromium.org>
 <20190925125811.v3.3.Id33c06cbd1516b49820faccd80da01c7c4bf15c7@changeid>
 <20191007135459.lj3qc2tqzcv3xcia@holly.lan>
In-Reply-To: <20191007135459.lj3qc2tqzcv3xcia@holly.lan>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 7 Oct 2019 16:34:55 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vqj9JqGCQX_Foij8EkFtSy8r2wB3uoXNae6PECwNV+CQ@mail.gmail.com>
Message-ID: <CAD=FV=Vqj9JqGCQX_Foij8EkFtSy8r2wB3uoXNae6PECwNV+CQ@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.193 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.193 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iHczX-009GDS-I4
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

Hi,

On Mon, Oct 7, 2019 at 6:55 AM Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> On Wed, Sep 25, 2019 at 01:02:19PM -0700, Douglas Anderson wrote:
> >
> > I noticed that when I did "btc <cpu>" and the CPU I passed in hadn't
> > rounded up that I'd crash.  I was going to copy the same fix from
> > commit 162bc7f5afd7 ("kdb: Don't back trace on a cpu that didn't round
> > up") into the "not all the CPUs" case, but decided it'd be better to
> > clean things up a little bit.
> >
> > This consolidates the two code paths.  It is _slightly_ wasteful in in
> > that the checks for "cpu" being too small or being offline isn't
> > really needed when we're iterating over all online CPUs, but that
> > really shouldn't hurt.  Better to have the same code path.
> >
> > While at it, eliminate at least one slightly ugly (and totally
> > needless) recursive use of kdb_parse().
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> >
> > Changes in v3:
> > - Patch ("kdb: Fix "btc <cpu>" crash if the CPU...") new for v3.
> >
> > Changes in v2: None
> >
> >  kernel/debug/kdb/kdb_bt.c | 61 ++++++++++++++++++++++-----------------
> >  1 file changed, 34 insertions(+), 27 deletions(-)
> >
> > diff --git a/kernel/debug/kdb/kdb_bt.c b/kernel/debug/kdb/kdb_bt.c
> > index 120fc686c919..d9af139f9a31 100644
> > --- a/kernel/debug/kdb/kdb_bt.c
> > +++ b/kernel/debug/kdb/kdb_bt.c
> > @@ -101,6 +101,27 @@ kdb_bt1(struct task_struct *p, unsigned long mask, bool btaprompt)
> >       return 0;
> >  }
> >
> > +static void
> > +kdb_bt_cpu(unsigned long cpu)
> > +{
> > +     struct task_struct *kdb_tsk;
> > +
> > +     if (cpu >= num_possible_cpus() || !cpu_online(cpu)) {
> > +             kdb_printf("WARNING: no process for cpu %ld\n", cpu);
> > +             return;
> > +     }
> > +
> > +     /* If a CPU failed to round up we could be here */
> > +     kdb_tsk = KDB_TSK(cpu);
> > +     if (!kdb_tsk) {
> > +             kdb_printf("WARNING: no task for cpu %ld\n", cpu);
> > +             return;
> > +     }
> > +
> > +     kdb_set_current_task(kdb_tsk);
> > +     kdb_bt1(kdb_tsk, ~0UL, false);
> > +}
> > +
> >  int
> >  kdb_bt(int argc, const char **argv)
> >  {
> > @@ -161,7 +182,6 @@ kdb_bt(int argc, const char **argv)
> >       } else if (strcmp(argv[0], "btc") == 0) {
> >               unsigned long cpu = ~0;
> >               struct task_struct *save_current_task = kdb_current_task;
> > -             char buf[80];
> >               if (argc > 1)
> >                       return KDB_ARGCOUNT;
> >               if (argc == 1) {
> > @@ -169,35 +189,22 @@ kdb_bt(int argc, const char **argv)
> >                       if (diag)
> >                               return diag;
> >               }
> > -             /* Recursive use of kdb_parse, do not use argv after
> > -              * this point */
> > -             argv = NULL;
> >               if (cpu != ~0) {
> > -                     if (cpu >= num_possible_cpus() || !cpu_online(cpu)) {
> > -                             kdb_printf("no process for cpu %ld\n", cpu);
> > -                             return 0;
> > -                     }
> > -                     sprintf(buf, "btt 0x%px\n", KDB_TSK(cpu));
> > -                     kdb_parse(buf);
> > -                     return 0;
> > -             }
> > -             kdb_printf("btc: cpu status: ");
> > -             kdb_parse("cpu\n");
> > -             for_each_online_cpu(cpu) {
> > -                     void *kdb_tsk = KDB_TSK(cpu);
> > -
> > -                     /* If a CPU failed to round up we could be here */
> > -                     if (!kdb_tsk) {
> > -                             kdb_printf("WARNING: no task for cpu %ld\n",
> > -                                        cpu);
> > -                             continue;
> > +                     kdb_bt_cpu(cpu);
> > +             } else {
> > +                     /*
> > +                      * Recursive use of kdb_parse, do not use argv after
> > +                      * this point.
> > +                      */
> > +                     argv = NULL;
> > +                     kdb_printf("btc: cpu status: ");
> > +                     kdb_parse("cpu\n");
> > +                     for_each_online_cpu(cpu) {
> > +                             kdb_bt_cpu(cpu);
> > +                             touch_nmi_watchdog();
> >                       }
> > -
> > -                     sprintf(buf, "btt 0x%px\n", kdb_tsk);
> > -                     kdb_parse(buf);
> > -                     touch_nmi_watchdog();
> > +                     kdb_set_current_task(save_current_task);
> >               }
> > -             kdb_set_current_task(save_current_task);
>
> Why does this move out into only one of the conditional branches?
> Don't both of the above paths modify the current task?

The old code has a "return 0 in the case that "cpu != ~0", so this
basically matches the prior behavior in restoring the current task for
a "btc" but not leaving the current task changed in the case of "btc
<cpu>".  Thus my patch doesn't actually change the existing behavior,
but I guess that it does make the control flow simpler so it's easier
to understand what the behavior is.  ;-)

Reading through other control flows of the various backtrace commands,
it looks like it is intentional to leave the current task changed when
you explicitly do an action on that task (or a CPU).

Actually, though, it wasn't clear to me that it ever made sense for
any of these commands to implicitly leave the current task changed.
If you agree, I can send a follow-up patch to change this behavior.

-Doug


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
