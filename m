Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE41BE608
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 25 Sep 2019 22:03:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1iDDVT-0007am-Dy
	for lists+kgdb-bugreport@lfdr.de; Wed, 25 Sep 2019 20:03:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1iDDVS-0007ag-NI
 for kgdb-bugreport@lists.sourceforge.net; Wed, 25 Sep 2019 20:03:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=h/RTPptMzVlxWY6kHXdS0P3xSNWevs200xt+aATskwU=; b=e+zYwa5I+RAPnXEt+PHo44Ty6b
 9XJiCeu8HK5DMGkHRa1CFJFVnqIJEcJPmfhc3S4nrjdhlQgU1XFxlmouIVk4+rFXziJWC4wKFJm/P
 lolW90Ikfme3uDvUO/PIIQaG/EbjusW0H6BB5nrWLB4eA/yAJfLkUkXMV+C1mZhPuUhE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=h/RTPptMzVlxWY6kHXdS0P3xSNWevs200xt+aATskwU=; b=Tx2ggjuT5tq21VN0QzTEwvlzh+
 S709gjUiB9CCvnSI0gCrxqmxkYdveXew/rkw0DuwKisNNg1UZEPpwF3AkfqaNkvAHht3iyLMT4sg+
 AhZFOlOfal1WJp1OFvSR+cNYGlGCpH0IFxSEYWD/VoWleC7FvLB2hqMr54rSaNABkYM0=;
Received: from mail-io1-f66.google.com ([209.85.166.66])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iDDVQ-008t7k-Sn
 for kgdb-bugreport@lists.sourceforge.net; Wed, 25 Sep 2019 20:03:22 +0000
Received: by mail-io1-f66.google.com with SMTP id h144so154698iof.7
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 25 Sep 2019 13:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h/RTPptMzVlxWY6kHXdS0P3xSNWevs200xt+aATskwU=;
 b=erg1HrlJng3dStEDefsrPZCNWQSvBlUR8Da1WM8mj7tT7syQA+1jnrAgrs+oaKM63S
 tXi4rvN+XMuX+yHICWCEYgS15KCtl0iFfVyl6EdEfEmkMNMZB4hgQzGbJU39gy9jR/F5
 Y8zQ11MMPrhJuWEd7d/t/OcE/0fNbzNthWUm0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h/RTPptMzVlxWY6kHXdS0P3xSNWevs200xt+aATskwU=;
 b=WGbH9BlDS8oQWlJb7SifxHXsOSo2157mzU0I4Dd1f8H42LjCFSbSLlK6LranfnNNj6
 vxRC7A2oJXZcbhHTiYpKRUA6tyMJTsw0CMBA1zDfw3vduF3b1sPzhHItfdREuGg71CY2
 lc39qneZLZwUY9OdOAw1ewAWN/iARi8FBXkyiTOCkucKaj2WxceDBs4KLMI7sHIe6WYX
 SnqrrnDYjeidOpiJE++xlWHrJGWdy3rbtBgOg2jxc4QXQ39Irbqfn1sNnddBacvYnS9+
 5IugHmDAT0kNjuwjKtRGW7ilaoNkUaEiPHORQTMxJA6Pt1Zg4Z8CW0ZzQU+s/TVYjk8I
 JCvA==
X-Gm-Message-State: APjAAAXIpBlzpE6EDLdgrjqXX1gaGj41OhgSSrnnoXNU2zz7LgTIzboJ
 B0gLrTK918WMslR4CnJt4oKegG6fK4Y=
X-Google-Smtp-Source: APXvYqxef41+4aLv1ai+zbmf7OUPUflqN2Yy5+fmYAA3w729RjJzhQo8T2uM6V2Cz9p4ZCGPqI9yeA==
X-Received: by 2002:a92:9e5c:: with SMTP id q89mr1589861ili.247.1569441794332; 
 Wed, 25 Sep 2019 13:03:14 -0700 (PDT)
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com.
 [209.85.166.52])
 by smtp.gmail.com with ESMTPSA id b7sm410274iod.42.2019.09.25.13.03.13
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Sep 2019 13:03:13 -0700 (PDT)
Received: by mail-io1-f52.google.com with SMTP id n197so119520iod.9
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 25 Sep 2019 13:03:13 -0700 (PDT)
X-Received: by 2002:a92:4a11:: with SMTP id m17mr1653859ilf.142.1569441793167; 
 Wed, 25 Sep 2019 13:03:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190731183732.178134-1-dianders@chromium.org>
 <20190830145237.aoysubwetqe3eggj@holly.lan>
In-Reply-To: <20190830145237.aoysubwetqe3eggj@holly.lan>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 25 Sep 2019 13:03:02 -0700
X-Gmail-Original-Message-ID: <CAD=FV=URLYwLZ0R0zzrH5xKdRWD52X7Qn_MaLdXjvWYv8vF+6Q@mail.gmail.com>
Message-ID: <CAD=FV=URLYwLZ0R0zzrH5xKdRWD52X7Qn_MaLdXjvWYv8vF+6Q@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.66 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.166.66 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1iDDVQ-008t7k-Sn
Subject: Re: [Kgdb-bugreport] [PATCH v2] kdb: Fix stack crawling on
 'running' CPUs that aren't the master
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

On Fri, Aug 30, 2019 at 7:52 AM Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> On Wed, Jul 31, 2019 at 11:37:32AM -0700, Douglas Anderson wrote:
> > In kdb when you do 'btc' (back trace on CPU) it doesn't necessarily
> > give you the right info.  Specifically on many architectures
> > (including arm64, where I tested) you can't dump the stack of a
> > "running" process that isn't the process running on the current CPU.
> > This can be seen by this:
> >
> >  echo SOFTLOCKUP > /sys/kernel/debug/provoke-crash/DIRECT
> >  # wait 2 seconds
> >  <sysrq>g
> >
> > Here's what I see now on rk3399-gru-kevin.  I see the stack crawl for
> > the CPU that handled the sysrq but everything else just shows me stuck
> > in __switch_to() which is bogus:
> >
> > ======
> >
> > [0]kdb> btc
> > btc: cpu status: Currently on cpu 0
> > Available cpus: 0, 1-3(I), 4, 5(I)
> > Stack traceback for pid 0
> > 0xffffff801101a9c0        0        0  1    0   R  0xffffff801101b3b0 *swapper/0
> > Call trace:
> >  dump_backtrace+0x0/0x138
> >  ...
> >  kgdb_compiled_brk_fn+0x34/0x44
> >  ...
> >  sysrq_handle_dbg+0x34/0x5c
> > Stack traceback for pid 0
> > 0xffffffc0f175a040        0        0  1    1   I  0xffffffc0f175aa30  swapper/1
> > Call trace:
> >  __switch_to+0x1e4/0x240
> >  0xffffffc0f65616c0
> > Stack traceback for pid 0
> > 0xffffffc0f175d040        0        0  1    2   I  0xffffffc0f175da30  swapper/2
> > Call trace:
> >  __switch_to+0x1e4/0x240
> >  0xffffffc0f65806c0
> > Stack traceback for pid 0
> > 0xffffffc0f175b040        0        0  1    3   I  0xffffffc0f175ba30  swapper/3
> > Call trace:
> >  __switch_to+0x1e4/0x240
> >  0xffffffc0f659f6c0
> > Stack traceback for pid 1474
> > 0xffffffc0dde8b040     1474      727  1    4   R  0xffffffc0dde8ba30  bash
> > Call trace:
> >  __switch_to+0x1e4/0x240
> >  __schedule+0x464/0x618
> >  0xffffffc0dde8b040
> > Stack traceback for pid 0
> > 0xffffffc0f17b0040        0        0  1    5   I  0xffffffc0f17b0a30  swapper/5
> > Call trace:
> >  __switch_to+0x1e4/0x240
> >  0xffffffc0f65dd6c0
> >
> > ===
> >
> > The problem is that 'btc' eventually boils down to
> >   show_stack(task_struct, NULL);
> >
> > ...and show_stack() doesn't work for "running" CPUs because their
> > registers haven't been stashed.
> >
> > On x86 things might work better (I haven't tested) because kdb has a
> > special case for x86 in kdb_show_stack() where it passes the stack
> > pointer to show_stack().  This wouldn't work on arm64 where the stack
> > crawling function seems needs the "fp" and "pc", not the "sp" which is
> > presumably why arm64's show_stack() function totally ignores the "sp"
> > parameter.
> >
> > NOTE: we _can_ get a good stack dump for all the cpus if we manually
> > switch each one to the kdb master and do a back trace.  AKA:
> >   cpu 4
> >   bt
> > ...will give the expected trace.  That's because now arm64's
> > dump_backtrace will now see that "tsk == current" and go through a
> > different path.
> >
> > In this patch I fix the problems by catching a request to stack crawl
> > a task that's running on a CPU and then I ask that CPU to do the stack
> > crawl.
> >
> > NOTE: this will (presumably) change what stack crawls are printed for
> > x86 machines.  Now kdb functions will show up in the stack crawl.
> > Presumably this is OK but if it's not we can go back and add a special
> > case for x86 again.
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
> I think this approach can be made work but there are problems as things
> exist today, see below.
>
>
> > ---
> >
> > Changes in v2:
> > - Totally new approach; now arch agnostic.
> >
> >  kernel/debug/debug_core.c |  5 +++++
> >  kernel/debug/debug_core.h |  1 +
> >  kernel/debug/kdb/kdb_bt.c | 44 ++++++++++++++++++++++++++++++---------
> >  3 files changed, 40 insertions(+), 10 deletions(-)
> >
> > diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
> > index 5cc608de6883..a89c72714fe6 100644
> > --- a/kernel/debug/debug_core.c
> > +++ b/kernel/debug/debug_core.c
> > @@ -92,6 +92,8 @@ static int kgdb_use_con;
> >  bool dbg_is_early = true;
> >  /* Next cpu to become the master debug core */
> >  int dbg_switch_cpu;
> > +/* cpu number of slave we request a stack crawl of */
> > +int dbg_slave_dumpstack_cpu = -1;
> >
> >  /* Use kdb or gdbserver mode */
> >  int dbg_kdb_mode = 1;
> > @@ -580,6 +582,9 @@ static int kgdb_cpu_enter(struct kgdb_state *ks, struct pt_regs *regs,
> >                               atomic_xchg(&kgdb_active, cpu);
> >                               break;
> >                       }
> > +             } else if (dbg_slave_dumpstack_cpu == cpu) {
>
> Couldn't this be encoded in the exception state?

Yup, but it requires exporting the exception state from debug_core.c
(or exporting a function that sets this).  Ah, but below you said you
wanted the whole stack crawling on a CPU moved to debug_core.c, so
done.


> > +                     dump_stack();
> > +                     dbg_slave_dumpstack_cpu = -1;
>
> >               } else if (kgdb_info[cpu].exception_state & DCPU_IS_SLAVE) {
> >                       if (!raw_spin_is_locked(&dbg_slave_lock))
> >                               goto return_normal;
> > diff --git a/kernel/debug/debug_core.h b/kernel/debug/debug_core.h
> > index b4a7c326d546..dca74d5caef2 100644
> > --- a/kernel/debug/debug_core.h
> > +++ b/kernel/debug/debug_core.h
> > @@ -62,6 +62,7 @@ extern int dbg_io_get_char(void);
> >  /* Switch from one cpu to another */
> >  #define DBG_SWITCH_CPU_EVENT -123456
> >  extern int dbg_switch_cpu;
> > +extern int dbg_slave_dumpstack_cpu;
> >
> >  /* gdbstub interface functions */
> >  extern int gdb_serial_stub(struct kgdb_state *ks);
> > diff --git a/kernel/debug/kdb/kdb_bt.c b/kernel/debug/kdb/kdb_bt.c
> > index 7e2379aa0a1e..10095ae05826 100644
> > --- a/kernel/debug/kdb/kdb_bt.c
> > +++ b/kernel/debug/kdb/kdb_bt.c
> > @@ -10,6 +10,7 @@
> >   */
> >
> >  #include <linux/ctype.h>
> > +#include <linux/delay.h>
> >  #include <linux/string.h>
> >  #include <linux/kernel.h>
> >  #include <linux/sched/signal.h>
> > @@ -22,20 +23,43 @@
> >  static void kdb_show_stack(struct task_struct *p, void *addr)
> >  {
> >       int old_lvl = console_loglevel;
> > +     int time_left;
> > +     int cpu;
> > +
> >       console_loglevel = CONSOLE_LOGLEVEL_MOTORMOUTH;
> >       kdb_trap_printk++;
> > -     kdb_set_current_task(p);
> > -     if (addr) {
> > -             show_stack((struct task_struct *)p, addr);
> > -     } else if (kdb_current_regs) {
> > -#ifdef CONFIG_X86
> > -             show_stack(p, &kdb_current_regs->sp);
> > -#else
> > -             show_stack(p, NULL);
> > -#endif
> > +
> > +     if (!addr && kdb_task_has_cpu(p)) {
> > +             cpu = kdb_process_cpu(p);
> > +
> > +             if (cpu == raw_smp_processor_id()) {
> > +                     dump_stack();
> > +                     goto exit;
>
> This goto is not for error recovery but looks like it is. Why can't we
> use normal control flow here (extracting the remote stack dump logic
> into a seperate function if the right margin is getting too close)?
>
> In fact to be honest a function call would be useful anyway since I'd
> rather have all the resulting horror in a single file (debug_core.c).

Sure.  Done.


> > +             }
> > +
> > +             /*
> > +              * In general architectures don't support dumping the stack
> > +              * of a "running" process that's not the current one so if
> > +              * we want to dump the stack of a running process that's not
> > +              * the master then we'll set a global letting the slave
> > +              * (which should be looping) know to dump its own stack.
> > +              */
> > +             dbg_slave_dumpstack_cpu = cpu;
> > +             for (time_left = MSEC_PER_SEC; time_left; time_left--) {
> > +                     udelay(1000);
> > +                     if (dbg_slave_dumpstack_cpu == -1)
> > +                             break;
> > +             }
>
> This timeout does not interact correctly with the pager (the timer does
> not get reset when we sit in the pager loop waiting for user to tell us
> to continue).

Nice catch, thanks.  Probably the easiest thing to do is to get rid of
this timeout but put in a check to make sure that the CPU has the
"IN_SLAVE" flag set.  This was important since you otherwise could get
into this code path by doing "ps" to see what process was running on a
non-rounded-up CPU and then "btp <pid>".  v3 should handle this
without the timeout.


-Doug


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
