Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA90248611
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 18 Aug 2020 15:30:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1k81h5-0003gR-1y
	for lists+kgdb-bugreport@lfdr.de; Tue, 18 Aug 2020 13:30:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1k81h3-0003gK-VD
 for kgdb-bugreport@lists.sourceforge.net; Tue, 18 Aug 2020 13:30:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bZpTS9W2Tj0BCPy5FUvFO2v5lsnUdQqoig+TorNIN+k=; b=I6xWtK+R2aRijtGEeEoLSv/lGm
 IIVCtiDqZNrorKQa34Q6mCK1YryxhLueQ8wn8uBbgI2NyhCv64+on36IttfR1t4ykyZTp5by4hGIh
 KGNus843vTjl2GFnipbrXVKq1R2q6Zr5jGqQQ/RzDZD4V4QeKZAP5MIkMV/RrrsB8dNs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bZpTS9W2Tj0BCPy5FUvFO2v5lsnUdQqoig+TorNIN+k=; b=R4q31TwouX5Nxwb/eHodzCWEFV
 HaEFyBN66tEvvsErxDZhg3TxddPUATdY5H1uCnpgH0A5UrTtvz5moRKe5okbyE6GeVodJ2G06fg5V
 JsLMl5mHmT1RzxKvchHxiztyVDdWJrYH0f/Asj1f97eITP/M1Jy5YvvLKHesnEVRkqqY=;
Received: from mail-lf1-f67.google.com ([209.85.167.67])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1k81gz-00FHRk-SA
 for kgdb-bugreport@lists.sourceforge.net; Tue, 18 Aug 2020 13:30:25 +0000
Received: by mail-lf1-f67.google.com with SMTP id v15so10201419lfg.6
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 18 Aug 2020 06:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bZpTS9W2Tj0BCPy5FUvFO2v5lsnUdQqoig+TorNIN+k=;
 b=ycZDsBBURN6YpilUKWmamnOiDl+K4rfYy9Zn1niqLcidB5oEwNUbM3u80/lqYSWoag
 b6z0i5OcPk89CpDa0DgWkktBqYKnKrAZTSeFlbL2+aHBOJer3CQ9g/ULmfHHisuxuzTg
 ICEqfDxevfhjEWgxtm07oXzgddknJklHD1hl/xbGVbOMs7pqOYkg6G367xMESip5RW1O
 rbZCnIG2vkUgDzkg64/aFK3matupn/jeFPtRHAvZNAY08yfHYgmVJhw8a2/W0pL3Y4+0
 2rfeGS7oXaKmAS+OzyDlpj6gbGZbx+nD/LrgGAFAMEH4STgEV1JqPbDlSeYJDF3iHSOG
 oOCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bZpTS9W2Tj0BCPy5FUvFO2v5lsnUdQqoig+TorNIN+k=;
 b=DVWiAOcYDm/CFi2n/A8SsWDyJzSoQqri6dhwfK6aVZNHe5mfmtQ3NvQhQL5+EBRihi
 RCExLPghD6tPmfPupbfH9sECp5BzBq/iIPKChW33ekENpsKoOdARE52skUZxPQMJDtBw
 2UhqSVw9CgdmiBwIXvV6cmd/oWvJLw2W5V2cPU7aiwo0CbJthKCT9NieWtUXSIU9el1D
 h93iH+lytZ5QHctkbgOhB6Bo5GMxJN2ifCXHvezpO2EACl/E6Qyu8Vdc0brqVRfu2vS4
 3ibwgyc9gWUi4Rz0lUfcmeGaT62UNh7pgmILaKGDCBRT9kpy5MQlQM+WWiUNsGdtKNDR
 sRKQ==
X-Gm-Message-State: AOAM532tgpsRrwtEeHJBxCAnV6F/3ak7+U/EZvNeNCb71euvDfRGBtS2
 BJddQjwcDJzMWlQlKX+mFTs8P6IFoza9WElKB5cVs1p/1N5ACw==
X-Google-Smtp-Source: ABdhPJyX0XqAGUuxi9Yu9fywhFd8MN+cXEIeU+Q9XOmIISGe+VbX91uHARkBD/JI++iYQMLx761M2nGTXEj7+eguPws=
X-Received: by 2002:a19:86c3:: with SMTP id i186mr10076262lfd.59.1597757415073; 
 Tue, 18 Aug 2020 06:30:15 -0700 (PDT)
MIME-Version: 1.0
References: <1595333413-30052-1-git-send-email-sumit.garg@linaro.org>
 <1595333413-30052-2-git-send-email-sumit.garg@linaro.org>
 <CAD=FV=Uqi28A=sm5+JhAqBM2OtBM3_XwvvkaKyEDVL9uVEioog@mail.gmail.com>
 <CAFA6WYMy_+RdsPJekm7zmCrFUXHqjsfr3JvyD7L8A2X8+jB8Qw@mail.gmail.com>
 <CAD=FV=WJzdhqnztNtj7p5S365wVPcgs2Kya_4bVwqeDWFojUrQ@mail.gmail.com>
 <CAFA6WYPG1dApPhAL252nJJyi99qHFS+jMUP_mV9g0EqXBZTWWQ@mail.gmail.com>
 <CAD=FV=U8d86CPUfeA-S_Hd726otEMQpv6sz=c72PoLKgtHiW2w@mail.gmail.com>
In-Reply-To: <CAD=FV=U8d86CPUfeA-S_Hd726otEMQpv6sz=c72PoLKgtHiW2w@mail.gmail.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Tue, 18 Aug 2020 19:00:03 +0530
Message-ID: <CAFA6WYNiCed25eJiiae31gskfr2pZ8Uz8YXp7c-gA=_fXNwzNg@mail.gmail.com>
To: Doug Anderson <dianders@chromium.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.67 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.67 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1k81gz-00FHRk-SA
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
 Peter Zijlstra <peterz@infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 LKML <linux-kernel@vger.kernel.org>, linux-serial@vger.kernel.org,
 Jiri Slaby <jslaby@suse.com>, kgdb-bugreport@lists.sourceforge.net,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Mon, 17 Aug 2020 at 22:49, Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Mon, Aug 17, 2020 at 7:08 AM Sumit Garg <sumit.garg@linaro.org> wrote:
> >
> > On Fri, 14 Aug 2020 at 20:27, Doug Anderson <dianders@chromium.org> wrote:
> > >
> > > Hi,
> > >
> > > On Fri, Aug 14, 2020 at 12:24 AM Sumit Garg <sumit.garg@linaro.org> wrote:
> > > >
> > > > + Peter (author of irq_work.c)
> > > >
> > > > On Thu, 13 Aug 2020 at 05:30, Doug Anderson <dianders@chromium.org> wrote:
> > > > >
> > > > > Hi,
> > > > >
> > > > > On Tue, Jul 21, 2020 at 5:10 AM Sumit Garg <sumit.garg@linaro.org> wrote:
> > > > > >
> > > > > > In a future patch we will add support to the serial core to make it
> > > > > > possible to trigger a magic sysrq from an NMI context. Prepare for this
> > > > > > by marking some sysrq actions as NMI safe. Safe actions will be allowed
> > > > > > to run from NMI context whilst that cannot run from an NMI will be queued
> > > > > > as irq_work for later processing.
> > > > > >
> > > > > > A particular sysrq handler is only marked as NMI safe in case the handler
> > > > > > isn't contending for any synchronization primitives as in NMI context
> > > > > > they are expected to cause deadlocks. Note that the debug sysrq do not
> > > > > > contend for any synchronization primitives. It does call kgdb_breakpoint()
> > > > > > to provoke a trap but that trap handler should be NMI safe on
> > > > > > architectures that implement an NMI.
> > > > > >
> > > > > > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> > > > > > ---
> > > > > >  drivers/tty/sysrq.c       | 33 ++++++++++++++++++++++++++++++++-
> > > > > >  include/linux/sysrq.h     |  1 +
> > > > > >  kernel/debug/debug_core.c |  1 +
> > > > > >  3 files changed, 34 insertions(+), 1 deletion(-)
> > > > > >
> > > > > > diff --git a/drivers/tty/sysrq.c b/drivers/tty/sysrq.c
> > > > > > index 7c95afa9..8017e33 100644
> > > > > > --- a/drivers/tty/sysrq.c
> > > > > > +++ b/drivers/tty/sysrq.c
> > > > > > @@ -50,6 +50,8 @@
> > > > > >  #include <linux/syscalls.h>
> > > > > >  #include <linux/of.h>
> > > > > >  #include <linux/rcupdate.h>
> > > > > > +#include <linux/irq_work.h>
> > > > > > +#include <linux/kfifo.h>
> > > > > >
> > > > > >  #include <asm/ptrace.h>
> > > > > >  #include <asm/irq_regs.h>
> > > > > > @@ -111,6 +113,7 @@ static const struct sysrq_key_op sysrq_loglevel_op = {
> > > > > >         .help_msg       = "loglevel(0-9)",
> > > > > >         .action_msg     = "Changing Loglevel",
> > > > > >         .enable_mask    = SYSRQ_ENABLE_LOG,
> > > > > > +       .nmi_safe       = true,
> > > > > >  };
> > > > > >
> > > > > >  #ifdef CONFIG_VT
> > > > > > @@ -157,6 +160,7 @@ static const struct sysrq_key_op sysrq_crash_op = {
> > > > > >         .help_msg       = "crash(c)",
> > > > > >         .action_msg     = "Trigger a crash",
> > > > > >         .enable_mask    = SYSRQ_ENABLE_DUMP,
> > > > > > +       .nmi_safe       = true,
> > > > > >  };
> > > > > >
> > > > > >  static void sysrq_handle_reboot(int key)
> > > > > > @@ -170,6 +174,7 @@ static const struct sysrq_key_op sysrq_reboot_op = {
> > > > > >         .help_msg       = "reboot(b)",
> > > > > >         .action_msg     = "Resetting",
> > > > > >         .enable_mask    = SYSRQ_ENABLE_BOOT,
> > > > > > +       .nmi_safe       = true,
> > > > > >  };
> > > > > >
> > > > > >  const struct sysrq_key_op *__sysrq_reboot_op = &sysrq_reboot_op;
> > > > > > @@ -217,6 +222,7 @@ static const struct sysrq_key_op sysrq_showlocks_op = {
> > > > > >         .handler        = sysrq_handle_showlocks,
> > > > > >         .help_msg       = "show-all-locks(d)",
> > > > > >         .action_msg     = "Show Locks Held",
> > > > > > +       .nmi_safe       = true,
> > > > > >  };
> > > > > >  #else
> > > > > >  #define sysrq_showlocks_op (*(const struct sysrq_key_op *)NULL)
> > > > > > @@ -289,6 +295,7 @@ static const struct sysrq_key_op sysrq_showregs_op = {
> > > > > >         .help_msg       = "show-registers(p)",
> > > > > >         .action_msg     = "Show Regs",
> > > > > >         .enable_mask    = SYSRQ_ENABLE_DUMP,
> > > > > > +       .nmi_safe       = true,
> > > > > >  };
> > > > > >
> > > > > >  static void sysrq_handle_showstate(int key)
> > > > > > @@ -326,6 +333,7 @@ static const struct sysrq_key_op sysrq_ftrace_dump_op = {
> > > > > >         .help_msg       = "dump-ftrace-buffer(z)",
> > > > > >         .action_msg     = "Dump ftrace buffer",
> > > > > >         .enable_mask    = SYSRQ_ENABLE_DUMP,
> > > > > > +       .nmi_safe       = true,
> > > > > >  };
> > > > > >  #else
> > > > > >  #define sysrq_ftrace_dump_op (*(const struct sysrq_key_op *)NULL)
> > > > > > @@ -538,6 +546,23 @@ static void __sysrq_put_key_op(int key, const struct sysrq_key_op *op_p)
> > > > > >                  sysrq_key_table[i] = op_p;
> > > > > >  }
> > > > > >
> > > > > > +#define SYSRQ_NMI_FIFO_SIZE    64
> > > > > > +static DEFINE_KFIFO(sysrq_nmi_fifo, int, SYSRQ_NMI_FIFO_SIZE);
> > > > >
> > > > > A 64-entry FIFO seems excessive. Quite honestly even a FIFO seems a
> > > > > bit excessive and it feels like if two sysrqs were received in super
> > > > > quick succession that it would be OK to just process the first one.  I
> > > > > guess if it simplifies the processing to have a FIFO then it shouldn't
> > > > > hurt, but no need for 64 entries.
> > > > >
> > > >
> > > > Okay, would a 2-entry FIFO work here? As here we need a FIFO to pass
> > > > on the key parameter.
> > >
> > > ...or even a 1-entry FIFO if that makes sense?
> > >
> >
> > Yes it would make sense but unfortunately not supported by kfifo
> > (size: power of 2).
>
> Typically 1 is considered to be a power of 2 since 2^0 = 1.
>
> ...ah, but it appears that size < 2 is not allowed.  Oh well.
>
>
> > > > > > +static void sysrq_do_nmi_work(struct irq_work *work)
> > > > > > +{
> > > > > > +       const struct sysrq_key_op *op_p;
> > > > > > +       int key;
> > > > > > +
> > > > > > +       while (kfifo_out(&sysrq_nmi_fifo, &key, 1)) {
> > > > > > +               op_p = __sysrq_get_key_op(key);
> > > > > > +               if (op_p)
> > > > > > +                       op_p->handler(key);
> > > > > > +       }
> > > > >
> > > > > Do you need to manage "suppress_printk" in this function?  Do you need
> > > > > to call rcu_sysrq_start() and rcu_read_lock()?
> > > >
> > > > Ah I missed those. Will add them here instead.
> > > >
> > > > >
> > > > > If so, how do you prevent racing between the mucking we're doing with
> > > > > these things and the mucking that the NMI does with them?
> > > >
> > > > IIUC, here you meant to highlight the race while scheduled sysrq is
> > > > executing in IRQ context and we receive a new sysrq in NMI context,
> > > > correct? If yes, this seems to be a trickier situation. I think the
> > > > appropriate way to handle it would be to deny any further sysrq
> > > > handling until the prior sysrq handling is complete, your views?
> > >
> > > The problem is that in some cases you're running NMIs directly at FIQ
> > > time and other cases you're running them at IRQ time.  So you
> > > definitely can't just move it to NMI.
> > >
> > > Skipping looking for other SYSRQs until the old one is complete sounds
> > > good to me.  Again my ignorance will make me sound like a fool,
> > > probably, but can you use the kfifo as a form of mutual exclusion?  If
> > > you have a 1-entry kfifo, maybe:
> > >
> > > 1. First try to add to the "FIFO".  If it fails (out of space) then a
> > > sysrq is in progress.  Ignore this one.
> > > 2. Decide if you're NMI-safe or not.
> > > 3. If NMI safe, modify "suppress_printk", call rcu functions, then
> > > call the handler.  Restore suppress_printk and then dequeue from FIFO.
> > > 4. If not-NMI safe, the irq worker would "peek" into the FIFO, do its
> > > work (wrapped with "suppress_printk" and the like), and not dequeue
> > > until it's done.
> > >
> > > In the above you'd use the FIFO as a locking mechanism.  I don't know
> > > if that's a valid use of it or if there is a better NMI-safe mechanism
> > > for this.  I think the kfifo docs talk about only one reader and one
> > > writer and here we have two readers, so maybe it's illegal.  It also
> > > seems weird to have a 1-entry "FIFO" and feels like there's probably a
> > > better data structure for this.
> >
> > Thanks for your suggestions. Have a look at below implementation, I
> > have used 2-entry fifo but only single entry used for locking
> > mechanism:
> >
> > @@ -538,6 +546,39 @@ static void __sysrq_put_key_op(int key, const
> > struct sysrq_key_op *op_p)
> >                  sysrq_key_table[i] = op_p;
> >  }
> >
> > +#define SYSRQ_NMI_FIFO_SIZE    2
> > +static DEFINE_KFIFO(sysrq_nmi_fifo, int, SYSRQ_NMI_FIFO_SIZE);
> > +
> > +static void sysrq_do_nmi_work(struct irq_work *work)
> > +{
> > +       const struct sysrq_key_op *op_p;
> > +       int orig_suppress_printk;
> > +       int key;
> > +
> > +       orig_suppress_printk = suppress_printk;
> > +       suppress_printk = 0;
> > +
> > +       rcu_sysrq_start();
> > +       rcu_read_lock();
> > +
> > +       if (kfifo_peek(&sysrq_nmi_fifo, &key)) {
> > +               op_p = __sysrq_get_key_op(key);
> > +               if (op_p)
> > +                       op_p->handler(key);
> > +       }
> > +
> > +       rcu_read_unlock();
> > +       rcu_sysrq_end();
> > +
> > +       suppress_printk = orig_suppress_printk;
> > +
> > +       /* Pop contents from fifo if any */
> > +       while (kfifo_get(&sysrq_nmi_fifo, &key))
> > +               ;
>
> I think you can use kfifo_reset_out().
>

Okay, it sounds safe as well when used concurrently with
kfifo_is_empty(). Will use it instead.

>
> > +}
> > +
> > +static DEFINE_IRQ_WORK(sysrq_nmi_work, sysrq_do_nmi_work);
> > +
> >  void __handle_sysrq(int key, bool check_mask)
> >  {
> >         const struct sysrq_key_op *op_p;
> > +}
> > +
> > +static DEFINE_IRQ_WORK(sysrq_nmi_work, sysrq_do_nmi_work);
> > +
> >  void __handle_sysrq(int key, bool check_mask)
> >  {
> >         const struct sysrq_key_op *op_p;
> > @@ -545,6 +586,10 @@ void __handle_sysrq(int key, bool check_mask)
> >         int orig_suppress_printk;
> >         int i;
> >
> > +       /* Skip sysrq handling if one already in progress */
> > +       if (!kfifo_is_empty(&sysrq_nmi_fifo))
> > +               return;
>
> This _seems_ OK to me since I'd imagine kfifo_is_empty() is as safe
> for the writer to do as kfifo_is_full() is and kfifo_is_full() is part
> of kfifo_put().
>
> I guess there's no better synchronism mechanism that we can use?
>

Yeah, unless someone else has a better idea.

-Sumit

>
> > +
> >         orig_suppress_printk = suppress_printk;
> >         suppress_printk = 0;
> >
> > @@ -568,7 +613,13 @@ void __handle_sysrq(int key, bool check_mask)
> >                 if (!check_mask || sysrq_on_mask(op_p->enable_mask)) {
> >                         pr_info("%s\n", op_p->action_msg);
> >                         console_loglevel = orig_log_level;
> > -                       op_p->handler(key);
> > +
> > +                       if (in_nmi() && !op_p->nmi_safe) {
> > +                               kfifo_put(&sysrq_nmi_fifo, key);
> > +                               irq_work_queue(&sysrq_nmi_work);
> > +                       } else {
> > +                               op_p->handler(key);
> > +                       }
> >                 } else {
> >                         pr_info("This sysrq operation is disabled.\n");
> >                         console_loglevel = orig_log_level;
> >
> > -Sumit


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
