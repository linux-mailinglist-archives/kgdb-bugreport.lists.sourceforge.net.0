Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E852445CF
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 14 Aug 2020 09:25:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1k6U5F-0005d1-0D
	for lists+kgdb-bugreport@lfdr.de; Fri, 14 Aug 2020 07:25:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1k6U5C-0005ct-Pf
 for kgdb-bugreport@lists.sourceforge.net; Fri, 14 Aug 2020 07:24:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4fPs0JDtfGboYKwrCWztqbdTj5WJ03dHcVbV7Wd/c5s=; b=Q2xONG5g/e1eCuD+VQM6lRRKFY
 5MTjz9EpejBmsd79xSlJ7OmNxk1zpeYX27urMNd7W8y+P/bAxoy88YE0bVAATOT4wZiOE3gljlUSO
 1//y/ccJfCrwOw3CuQqbggA3z6+WbBKIxzzOr5uJHWBc6Cx/V8uXsHNtZ3SkaJpw4KOA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4fPs0JDtfGboYKwrCWztqbdTj5WJ03dHcVbV7Wd/c5s=; b=lAnIKbjdD+wgjRMKUElOpnuenn
 jviYT6CsWvjpPec5HO+CtH23csSlPN+goHsAkRjnplIafxDiHhtLSbppUXeWUoErKEO4xhymHaCIW
 yahG70Hdnk3RhYbYCpaRtw+sOUSCmHzfia3hVwZ7GLNj7lElU9/wc8kK4y4BR5mDzSoM=;
Received: from mail-lj1-f193.google.com ([209.85.208.193])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1k6U57-00E3QR-IW
 for kgdb-bugreport@lists.sourceforge.net; Fri, 14 Aug 2020 07:24:58 +0000
Received: by mail-lj1-f193.google.com with SMTP id t23so8940011ljc.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 14 Aug 2020 00:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4fPs0JDtfGboYKwrCWztqbdTj5WJ03dHcVbV7Wd/c5s=;
 b=NgjWmY2FdzolwiHelbqczqVP1Dzk6b2a8gAHTL9y7oqv3vU1781Zy84P473xdCsaKD
 l8whA5FioTs41uuk/TgAImUqOVUnTVJtYNxF19dRT5rALy3lY+fv0gg8raUnbwXb42Or
 omtHOg+lbiujjdW5BmRdVE4N7H0NfAdJsrPDGDyCY4Le8CYTe2hauCtOlnvpEF8s6ege
 VqzDkllVROgr5o574nGBLTmExHXkXybOgEYXlp4Su6S15GCuYZoGXIVTO0K5hRXHppb2
 7J0uSad3EZPbkkguB+6Xc7W7KQ5qot7VK53RB9+TD1UloCZOKezI2UpAb90W5y/D8JFT
 qM1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4fPs0JDtfGboYKwrCWztqbdTj5WJ03dHcVbV7Wd/c5s=;
 b=bBuL1H6yyjD72RytccnULmMfPSOxW0NWcQaG1neoFZqL1z6ra50hL+mllrU3+upa6J
 YHG9GmM3NOilMVQQE5Hqr6Darxce2Xvs75c2yzevMDoXVPkur2PXaiUtrKQB4tAIwSYy
 IaxadU/wygXBkBVehJgTzDO2Kj6Mmk6eZmL+Fj/ZiI7GG9abc4faU1oKoeEUfHXs9cae
 Gq7ss5TPBou6Y9ZdZW2+VZ21dCeD0m5NdtuFJapiJlSzt8oA4g0XooMPrSektdmMtFN4
 ddDgK+6F9tpUyeYQKxIDbKcuUTf65ew7TOh1sjnImd0QCL5Jtbbmzm9V2BFbNGibn0uU
 /h7A==
X-Gm-Message-State: AOAM530DjtPYp+AGRuOBwxrotie2NdFKiR8uMpKUBmUHBuNtCcRJOygh
 xfGR0OjlXK5IgtGyPicGPHypYs29Stfo4/hFnzIddYO8XJo5PQ==
X-Google-Smtp-Source: ABdhPJzElsv/zvY8T4wAXIBLHFjWpscPRVO7i4tqAWxJX5DyzNokuOSsE5BVD6hzq7tqVzBx/7IBLxIqXf2M2wsBKKw=
X-Received: by 2002:a2e:b4f4:: with SMTP id s20mr651759ljm.339.1597389886799; 
 Fri, 14 Aug 2020 00:24:46 -0700 (PDT)
MIME-Version: 1.0
References: <1595333413-30052-1-git-send-email-sumit.garg@linaro.org>
 <1595333413-30052-2-git-send-email-sumit.garg@linaro.org>
 <CAD=FV=Uqi28A=sm5+JhAqBM2OtBM3_XwvvkaKyEDVL9uVEioog@mail.gmail.com>
In-Reply-To: <CAD=FV=Uqi28A=sm5+JhAqBM2OtBM3_XwvvkaKyEDVL9uVEioog@mail.gmail.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Fri, 14 Aug 2020 12:54:35 +0530
Message-ID: <CAFA6WYMy_+RdsPJekm7zmCrFUXHqjsfr3JvyD7L8A2X8+jB8Qw@mail.gmail.com>
To: Doug Anderson <dianders@chromium.org>,
 Peter Zijlstra <peterz@infradead.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.193 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.193 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1k6U57-00E3QR-IW
Subject: Re: [Kgdb-bugreport] [RFC 1/5] tty/sysrq: Make sysrq handler NMI
 aware
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 LKML <linux-kernel@vger.kernel.org>, linux-serial@vger.kernel.org,
 Jiri Slaby <jslaby@suse.com>, kgdb-bugreport@lists.sourceforge.net,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

+ Peter (author of irq_work.c)

On Thu, 13 Aug 2020 at 05:30, Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Tue, Jul 21, 2020 at 5:10 AM Sumit Garg <sumit.garg@linaro.org> wrote:
> >
> > In a future patch we will add support to the serial core to make it
> > possible to trigger a magic sysrq from an NMI context. Prepare for this
> > by marking some sysrq actions as NMI safe. Safe actions will be allowed
> > to run from NMI context whilst that cannot run from an NMI will be queued
> > as irq_work for later processing.
> >
> > A particular sysrq handler is only marked as NMI safe in case the handler
> > isn't contending for any synchronization primitives as in NMI context
> > they are expected to cause deadlocks. Note that the debug sysrq do not
> > contend for any synchronization primitives. It does call kgdb_breakpoint()
> > to provoke a trap but that trap handler should be NMI safe on
> > architectures that implement an NMI.
> >
> > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> > ---
> >  drivers/tty/sysrq.c       | 33 ++++++++++++++++++++++++++++++++-
> >  include/linux/sysrq.h     |  1 +
> >  kernel/debug/debug_core.c |  1 +
> >  3 files changed, 34 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/tty/sysrq.c b/drivers/tty/sysrq.c
> > index 7c95afa9..8017e33 100644
> > --- a/drivers/tty/sysrq.c
> > +++ b/drivers/tty/sysrq.c
> > @@ -50,6 +50,8 @@
> >  #include <linux/syscalls.h>
> >  #include <linux/of.h>
> >  #include <linux/rcupdate.h>
> > +#include <linux/irq_work.h>
> > +#include <linux/kfifo.h>
> >
> >  #include <asm/ptrace.h>
> >  #include <asm/irq_regs.h>
> > @@ -111,6 +113,7 @@ static const struct sysrq_key_op sysrq_loglevel_op = {
> >         .help_msg       = "loglevel(0-9)",
> >         .action_msg     = "Changing Loglevel",
> >         .enable_mask    = SYSRQ_ENABLE_LOG,
> > +       .nmi_safe       = true,
> >  };
> >
> >  #ifdef CONFIG_VT
> > @@ -157,6 +160,7 @@ static const struct sysrq_key_op sysrq_crash_op = {
> >         .help_msg       = "crash(c)",
> >         .action_msg     = "Trigger a crash",
> >         .enable_mask    = SYSRQ_ENABLE_DUMP,
> > +       .nmi_safe       = true,
> >  };
> >
> >  static void sysrq_handle_reboot(int key)
> > @@ -170,6 +174,7 @@ static const struct sysrq_key_op sysrq_reboot_op = {
> >         .help_msg       = "reboot(b)",
> >         .action_msg     = "Resetting",
> >         .enable_mask    = SYSRQ_ENABLE_BOOT,
> > +       .nmi_safe       = true,
> >  };
> >
> >  const struct sysrq_key_op *__sysrq_reboot_op = &sysrq_reboot_op;
> > @@ -217,6 +222,7 @@ static const struct sysrq_key_op sysrq_showlocks_op = {
> >         .handler        = sysrq_handle_showlocks,
> >         .help_msg       = "show-all-locks(d)",
> >         .action_msg     = "Show Locks Held",
> > +       .nmi_safe       = true,
> >  };
> >  #else
> >  #define sysrq_showlocks_op (*(const struct sysrq_key_op *)NULL)
> > @@ -289,6 +295,7 @@ static const struct sysrq_key_op sysrq_showregs_op = {
> >         .help_msg       = "show-registers(p)",
> >         .action_msg     = "Show Regs",
> >         .enable_mask    = SYSRQ_ENABLE_DUMP,
> > +       .nmi_safe       = true,
> >  };
> >
> >  static void sysrq_handle_showstate(int key)
> > @@ -326,6 +333,7 @@ static const struct sysrq_key_op sysrq_ftrace_dump_op = {
> >         .help_msg       = "dump-ftrace-buffer(z)",
> >         .action_msg     = "Dump ftrace buffer",
> >         .enable_mask    = SYSRQ_ENABLE_DUMP,
> > +       .nmi_safe       = true,
> >  };
> >  #else
> >  #define sysrq_ftrace_dump_op (*(const struct sysrq_key_op *)NULL)
> > @@ -538,6 +546,23 @@ static void __sysrq_put_key_op(int key, const struct sysrq_key_op *op_p)
> >                  sysrq_key_table[i] = op_p;
> >  }
> >
> > +#define SYSRQ_NMI_FIFO_SIZE    64
> > +static DEFINE_KFIFO(sysrq_nmi_fifo, int, SYSRQ_NMI_FIFO_SIZE);
>
> A 64-entry FIFO seems excessive. Quite honestly even a FIFO seems a
> bit excessive and it feels like if two sysrqs were received in super
> quick succession that it would be OK to just process the first one.  I
> guess if it simplifies the processing to have a FIFO then it shouldn't
> hurt, but no need for 64 entries.
>

Okay, would a 2-entry FIFO work here? As here we need a FIFO to pass
on the key parameter.

>
> > +static void sysrq_do_nmi_work(struct irq_work *work)
> > +{
> > +       const struct sysrq_key_op *op_p;
> > +       int key;
> > +
> > +       while (kfifo_out(&sysrq_nmi_fifo, &key, 1)) {
> > +               op_p = __sysrq_get_key_op(key);
> > +               if (op_p)
> > +                       op_p->handler(key);
> > +       }
>
> Do you need to manage "suppress_printk" in this function?  Do you need
> to call rcu_sysrq_start() and rcu_read_lock()?

Ah I missed those. Will add them here instead.

>
> If so, how do you prevent racing between the mucking we're doing with
> these things and the mucking that the NMI does with them?

IIUC, here you meant to highlight the race while scheduled sysrq is
executing in IRQ context and we receive a new sysrq in NMI context,
correct? If yes, this seems to be a trickier situation. I think the
appropriate way to handle it would be to deny any further sysrq
handling until the prior sysrq handling is complete, your views?

>
>
> > +}
> > +
> > +static DEFINE_IRQ_WORK(sysrq_nmi_work, sysrq_do_nmi_work);
> > +
> >  void __handle_sysrq(int key, bool check_mask)
> >  {
> >         const struct sysrq_key_op *op_p;
> > @@ -568,7 +593,13 @@ void __handle_sysrq(int key, bool check_mask)
> >                 if (!check_mask || sysrq_on_mask(op_p->enable_mask)) {
> >                         pr_info("%s\n", op_p->action_msg);
> >                         console_loglevel = orig_log_level;
> > -                       op_p->handler(key);
> > +
> > +                       if (in_nmi() && !op_p->nmi_safe) {
> > +                               kfifo_in(&sysrq_nmi_fifo, &key, 1);
>
> Rather than kfifo_in() and kfifo_out(), I think you can use
> kfifo_put() and kfifo_get().  As I understand it those just get/put
> one element which is what you want.

Okay, will use kfifo_put() and kfifo_get() here instead.

>
>
> > +                               irq_work_queue(&sysrq_nmi_work);
>
> Wishful thinking, but (as far as I can tell) irq_work_queue() only
> queues work on the CPU running the NMI.  I don't have lots of NMI
> experience, but any chance there is a variant that will queue work on
> any CPU?  Then sysrq handlers that aren't NMI aware will be more
> likely to work.
>

Unfortunately, queuing work on other CPUs isn't safe in NMI context,
see this warning [1]. The comment mentions:

/* Arch remote IPI send/receive backend aren't NMI safe */

Peter,

Can you throw some light here as to why it isn't considered NMI-safe
to send remote IPI in NMI context? Is it an arch specific limitation?

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/kernel/irq_work.c#n103

-Sumit

>
>
>
> > +                       } else {
> > +                               op_p->handler(key);
> > +                       }
> >                 } else {
> >                         pr_info("This sysrq operation is disabled.\n");
> >                         console_loglevel = orig_log_level;
> > diff --git a/include/linux/sysrq.h b/include/linux/sysrq.h
> > index 3a582ec..630b5b9 100644
> > --- a/include/linux/sysrq.h
> > +++ b/include/linux/sysrq.h
> > @@ -34,6 +34,7 @@ struct sysrq_key_op {
> >         const char * const help_msg;
> >         const char * const action_msg;
> >         const int enable_mask;
> > +       const bool nmi_safe;
> >  };
> >
> >  #ifdef CONFIG_MAGIC_SYSRQ
> > diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
> > index 9e59347..2b51173 100644
> > --- a/kernel/debug/debug_core.c
> > +++ b/kernel/debug/debug_core.c
> > @@ -943,6 +943,7 @@ static const struct sysrq_key_op sysrq_dbg_op = {
> >         .handler        = sysrq_handle_dbg,
> >         .help_msg       = "debug(g)",
> >         .action_msg     = "DEBUG",
> > +       .nmi_safe       = true,
> >  };
> >  #endif
> >
> > --
> > 2.7.4
> >


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
