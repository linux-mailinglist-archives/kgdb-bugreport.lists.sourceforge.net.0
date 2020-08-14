Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CDC4244B7B
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 14 Aug 2020 16:57:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1k6b9Y-00046c-Ui
	for lists+kgdb-bugreport@lfdr.de; Fri, 14 Aug 2020 14:57:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1k6b9X-00046O-S2
 for kgdb-bugreport@lists.sourceforge.net; Fri, 14 Aug 2020 14:57:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sBC0/p4T8EoY7CKdb2bCU3OEh8rNPPlsp98wK1WQACA=; b=VLbABfaRa0/NJyCLuacIEuEgoi
 Yh7LikcxuBRSHcjqj2ZXfPO++VA4kPuT7RXFxwFKZ5HQ1LiIRe7+f9B+wLOylCTxA8bYne8ypwkES
 e7gFzcGpYv5cdwJF/rj3VcEphFiaXOJ2iK4JM7SNqJz3kiylwC7Jc8skOkjsVJqIxU3g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sBC0/p4T8EoY7CKdb2bCU3OEh8rNPPlsp98wK1WQACA=; b=SZ8h15VbW6MsswWccQXO9ba5GK
 b2JXPVk3wi/pwz2r53L+hpvw0ESDJcNTM4L2YGCQVzEG/rh2EKB3EYwFAn1HZVjXp1v4rFEjb8ikF
 NCgd/ZAXZp2zsb2x7wKmsKUnjUKJwNEBWIikRdH0Mi3VdpH+2gJZ47CAXWwp43XXevfE=;
Received: from mail-vk1-f195.google.com ([209.85.221.195])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1k6b9R-007Ccc-FK
 for kgdb-bugreport@lists.sourceforge.net; Fri, 14 Aug 2020 14:57:55 +0000
Received: by mail-vk1-f195.google.com with SMTP id q200so2058659vke.6
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 14 Aug 2020 07:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sBC0/p4T8EoY7CKdb2bCU3OEh8rNPPlsp98wK1WQACA=;
 b=P13il8CYJq8i4/TeSDw0wOSepKL0FMr0DdCglgaHpW88rDQ7NHnFfOuN0VWYQQswOU
 SWpmcrlO3HDu7Olexy8qeV8Sb8kQ72xqNcnU2X6+sTXC6A2JeJwkscwA14n9HK4EwSij
 iurzjwN/p85lr/1GDtE6andH8kFXCBSUUHivs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sBC0/p4T8EoY7CKdb2bCU3OEh8rNPPlsp98wK1WQACA=;
 b=aEDsbH79xS9mGmD++Ig+19ttQkZhh0IYdnYSxaMw9nq9i8SZzSEHN0b4Ec2KjMcH4p
 U9ITLOSC3wts370nEa4MVd0QWw7EXoB3qHOz3AE0R+nDxvrD3Tfl7zGINoPE4jrbWnfH
 LMWvb6YjxiDAxLRoesedlAJ6yq4s/LGRz6VbTELSJZ7lOir0pd9joeWCDGbQcdMzXeRy
 yQo2SM29thO3Uah0COrMmS5Aje77XT/g4ZLPJ6NW3jVKtvu6Xkpo6gOUMyNR1zWyAsN+
 ofyX4/c+6oGWhju2zXCqZFdlqXoAFRxsh579Ms542fsHllJDx2abp/ObBTcSeNDaso6C
 Z7tg==
X-Gm-Message-State: AOAM531fr4Yb3xaAU6yy8RFFIVV2gNsx6oU/IH7eIlZkS0Q9vnaCGVHY
 UxMjyIh7zA0nWrAJ1XXNjEuBXBKP7/G8Rg==
X-Google-Smtp-Source: ABdhPJzxlexEtzxgMH6XTZeSxr4G39WiG9CJUu6hxy5Bq/5XyC8Hewp6Nex6vTDLzxyFF1NozNrKcg==
X-Received: by 2002:a1f:8f52:: with SMTP id r79mr1800616vkd.96.1597417063288; 
 Fri, 14 Aug 2020 07:57:43 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com.
 [209.85.222.45])
 by smtp.gmail.com with ESMTPSA id 22sm1478178vkx.50.2020.08.14.07.57.42
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Aug 2020 07:57:42 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id g20so2736402uan.7
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 14 Aug 2020 07:57:42 -0700 (PDT)
X-Received: by 2002:ab0:623:: with SMTP id f32mr1689957uaf.121.1597417061689; 
 Fri, 14 Aug 2020 07:57:41 -0700 (PDT)
MIME-Version: 1.0
References: <1595333413-30052-1-git-send-email-sumit.garg@linaro.org>
 <1595333413-30052-2-git-send-email-sumit.garg@linaro.org>
 <CAD=FV=Uqi28A=sm5+JhAqBM2OtBM3_XwvvkaKyEDVL9uVEioog@mail.gmail.com>
 <CAFA6WYMy_+RdsPJekm7zmCrFUXHqjsfr3JvyD7L8A2X8+jB8Qw@mail.gmail.com>
In-Reply-To: <CAFA6WYMy_+RdsPJekm7zmCrFUXHqjsfr3JvyD7L8A2X8+jB8Qw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 14 Aug 2020 07:57:29 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WJzdhqnztNtj7p5S365wVPcgs2Kya_4bVwqeDWFojUrQ@mail.gmail.com>
Message-ID: <CAD=FV=WJzdhqnztNtj7p5S365wVPcgs2Kya_4bVwqeDWFojUrQ@mail.gmail.com>
To: Sumit Garg <sumit.garg@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.195 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.195 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1k6b9R-007Ccc-FK
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

Hi,

On Fri, Aug 14, 2020 at 12:24 AM Sumit Garg <sumit.garg@linaro.org> wrote:
>
> + Peter (author of irq_work.c)
>
> On Thu, 13 Aug 2020 at 05:30, Doug Anderson <dianders@chromium.org> wrote:
> >
> > Hi,
> >
> > On Tue, Jul 21, 2020 at 5:10 AM Sumit Garg <sumit.garg@linaro.org> wrote:
> > >
> > > In a future patch we will add support to the serial core to make it
> > > possible to trigger a magic sysrq from an NMI context. Prepare for this
> > > by marking some sysrq actions as NMI safe. Safe actions will be allowed
> > > to run from NMI context whilst that cannot run from an NMI will be queued
> > > as irq_work for later processing.
> > >
> > > A particular sysrq handler is only marked as NMI safe in case the handler
> > > isn't contending for any synchronization primitives as in NMI context
> > > they are expected to cause deadlocks. Note that the debug sysrq do not
> > > contend for any synchronization primitives. It does call kgdb_breakpoint()
> > > to provoke a trap but that trap handler should be NMI safe on
> > > architectures that implement an NMI.
> > >
> > > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> > > ---
> > >  drivers/tty/sysrq.c       | 33 ++++++++++++++++++++++++++++++++-
> > >  include/linux/sysrq.h     |  1 +
> > >  kernel/debug/debug_core.c |  1 +
> > >  3 files changed, 34 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/tty/sysrq.c b/drivers/tty/sysrq.c
> > > index 7c95afa9..8017e33 100644
> > > --- a/drivers/tty/sysrq.c
> > > +++ b/drivers/tty/sysrq.c
> > > @@ -50,6 +50,8 @@
> > >  #include <linux/syscalls.h>
> > >  #include <linux/of.h>
> > >  #include <linux/rcupdate.h>
> > > +#include <linux/irq_work.h>
> > > +#include <linux/kfifo.h>
> > >
> > >  #include <asm/ptrace.h>
> > >  #include <asm/irq_regs.h>
> > > @@ -111,6 +113,7 @@ static const struct sysrq_key_op sysrq_loglevel_op = {
> > >         .help_msg       = "loglevel(0-9)",
> > >         .action_msg     = "Changing Loglevel",
> > >         .enable_mask    = SYSRQ_ENABLE_LOG,
> > > +       .nmi_safe       = true,
> > >  };
> > >
> > >  #ifdef CONFIG_VT
> > > @@ -157,6 +160,7 @@ static const struct sysrq_key_op sysrq_crash_op = {
> > >         .help_msg       = "crash(c)",
> > >         .action_msg     = "Trigger a crash",
> > >         .enable_mask    = SYSRQ_ENABLE_DUMP,
> > > +       .nmi_safe       = true,
> > >  };
> > >
> > >  static void sysrq_handle_reboot(int key)
> > > @@ -170,6 +174,7 @@ static const struct sysrq_key_op sysrq_reboot_op = {
> > >         .help_msg       = "reboot(b)",
> > >         .action_msg     = "Resetting",
> > >         .enable_mask    = SYSRQ_ENABLE_BOOT,
> > > +       .nmi_safe       = true,
> > >  };
> > >
> > >  const struct sysrq_key_op *__sysrq_reboot_op = &sysrq_reboot_op;
> > > @@ -217,6 +222,7 @@ static const struct sysrq_key_op sysrq_showlocks_op = {
> > >         .handler        = sysrq_handle_showlocks,
> > >         .help_msg       = "show-all-locks(d)",
> > >         .action_msg     = "Show Locks Held",
> > > +       .nmi_safe       = true,
> > >  };
> > >  #else
> > >  #define sysrq_showlocks_op (*(const struct sysrq_key_op *)NULL)
> > > @@ -289,6 +295,7 @@ static const struct sysrq_key_op sysrq_showregs_op = {
> > >         .help_msg       = "show-registers(p)",
> > >         .action_msg     = "Show Regs",
> > >         .enable_mask    = SYSRQ_ENABLE_DUMP,
> > > +       .nmi_safe       = true,
> > >  };
> > >
> > >  static void sysrq_handle_showstate(int key)
> > > @@ -326,6 +333,7 @@ static const struct sysrq_key_op sysrq_ftrace_dump_op = {
> > >         .help_msg       = "dump-ftrace-buffer(z)",
> > >         .action_msg     = "Dump ftrace buffer",
> > >         .enable_mask    = SYSRQ_ENABLE_DUMP,
> > > +       .nmi_safe       = true,
> > >  };
> > >  #else
> > >  #define sysrq_ftrace_dump_op (*(const struct sysrq_key_op *)NULL)
> > > @@ -538,6 +546,23 @@ static void __sysrq_put_key_op(int key, const struct sysrq_key_op *op_p)
> > >                  sysrq_key_table[i] = op_p;
> > >  }
> > >
> > > +#define SYSRQ_NMI_FIFO_SIZE    64
> > > +static DEFINE_KFIFO(sysrq_nmi_fifo, int, SYSRQ_NMI_FIFO_SIZE);
> >
> > A 64-entry FIFO seems excessive. Quite honestly even a FIFO seems a
> > bit excessive and it feels like if two sysrqs were received in super
> > quick succession that it would be OK to just process the first one.  I
> > guess if it simplifies the processing to have a FIFO then it shouldn't
> > hurt, but no need for 64 entries.
> >
>
> Okay, would a 2-entry FIFO work here? As here we need a FIFO to pass
> on the key parameter.

...or even a 1-entry FIFO if that makes sense?


> > > +static void sysrq_do_nmi_work(struct irq_work *work)
> > > +{
> > > +       const struct sysrq_key_op *op_p;
> > > +       int key;
> > > +
> > > +       while (kfifo_out(&sysrq_nmi_fifo, &key, 1)) {
> > > +               op_p = __sysrq_get_key_op(key);
> > > +               if (op_p)
> > > +                       op_p->handler(key);
> > > +       }
> >
> > Do you need to manage "suppress_printk" in this function?  Do you need
> > to call rcu_sysrq_start() and rcu_read_lock()?
>
> Ah I missed those. Will add them here instead.
>
> >
> > If so, how do you prevent racing between the mucking we're doing with
> > these things and the mucking that the NMI does with them?
>
> IIUC, here you meant to highlight the race while scheduled sysrq is
> executing in IRQ context and we receive a new sysrq in NMI context,
> correct? If yes, this seems to be a trickier situation. I think the
> appropriate way to handle it would be to deny any further sysrq
> handling until the prior sysrq handling is complete, your views?

The problem is that in some cases you're running NMIs directly at FIQ
time and other cases you're running them at IRQ time.  So you
definitely can't just move it to NMI.

Skipping looking for other SYSRQs until the old one is complete sounds
good to me.  Again my ignorance will make me sound like a fool,
probably, but can you use the kfifo as a form of mutual exclusion?  If
you have a 1-entry kfifo, maybe:

1. First try to add to the "FIFO".  If it fails (out of space) then a
sysrq is in progress.  Ignore this one.
2. Decide if you're NMI-safe or not.
3. If NMI safe, modify "suppress_printk", call rcu functions, then
call the handler.  Restore suppress_printk and then dequeue from FIFO.
4. If not-NMI safe, the irq worker would "peek" into the FIFO, do its
work (wrapped with "suppress_printk" and the like), and not dequeue
until it's done.

In the above you'd use the FIFO as a locking mechanism.  I don't know
if that's a valid use of it or if there is a better NMI-safe mechanism
for this.  I think the kfifo docs talk about only one reader and one
writer and here we have two readers, so maybe it's illegal.  It also
seems weird to have a 1-entry "FIFO" and feels like there's probably a
better data structure for this.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
