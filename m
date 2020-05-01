Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0B31C1BDA
	for <lists+kgdb-bugreport@lfdr.de>; Fri,  1 May 2020 19:36:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jUZaG-0003iJ-Mv
	for lists+kgdb-bugreport@lfdr.de; Fri, 01 May 2020 17:36:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1jUZaE-0003iC-D1
 for kgdb-bugreport@lists.sourceforge.net; Fri, 01 May 2020 17:36:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JmsK3I+QQ1jUjjKc6FqaRkKw2p+mN6s7yBv1CCt+9NU=; b=PUj6PULYx3AyevMHgn8q2ZMoCw
 EW1nmgPMWPZwT9XtQen1MlLTAb1bHl/vhWGzfvKj5GyXJPmpSzgUlibF1Qwls327y47p5/8cfdT02
 Jwi73Eil6bv2fzNPP3Vwknmx8XmYeuIgCB3mSCYOftOALvqQ26PiyDZUFV/1yqCJVc6k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JmsK3I+QQ1jUjjKc6FqaRkKw2p+mN6s7yBv1CCt+9NU=; b=GQpihZWX/Vy310e3FgK6qaH6Vw
 fxx4R0WRBWOclYXKNT9WdmTnSPmVYCmUiVOfN4OcHLsanqGWhvefng14KddQeCLWIxDGSdxTIJDNT
 fL6duVdlUSjf4t4BxluzKImKqRFGjR8TYrgxmPEpC4bQz/VoeiHS+pYdEZUrc1qDjdRk=;
Received: from mail-ua1-f66.google.com ([209.85.222.66])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jUZaA-004k8d-JJ
 for kgdb-bugreport@lists.sourceforge.net; Fri, 01 May 2020 17:36:18 +0000
Received: by mail-ua1-f66.google.com with SMTP id i5so4009537uaq.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 01 May 2020 10:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JmsK3I+QQ1jUjjKc6FqaRkKw2p+mN6s7yBv1CCt+9NU=;
 b=Pn28gEGGnVNlWhBqU4ctoJJsxbfCxDyVFe4hXI/k5poWhig1Eu5EfctfcqE9tWf2zA
 JixurROYNoCAGTck3Oo/7rv1b4EFjBWfjUmsmMZvfkE1LiDnSNu6y0lMpleDMqgKKT/U
 jtt6OvYZ9b3fp7E+i/grqmPghlKQo0NFfXQZ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JmsK3I+QQ1jUjjKc6FqaRkKw2p+mN6s7yBv1CCt+9NU=;
 b=NJwc96VL3e52H1MsBMEOwTqT6qQ3cshlifDXOX4zPr9dnTUbvO8Y4uwUNHJzAkfM98
 MH96kJQFhqSpK7rTt2PpT2RfBqmwRitKCR+TeaP5TsXTWgXlqgxW5xNydFNPs5Ygt+zN
 3LDfr4ajAk3C7szFZ9rxAOgB9TcFoSR3WqkVujaUIIs83McC8BitnGIOuaLoXbNzJR8X
 SNILZgYE4gEYkARwdLcwX9Tp9Jv4GMhaFiFDx0eC/W46gDfFYejRPL+GXvnc4MLYbtmQ
 w3Qb/275HuFAGh1oFJHz6eAG8zewUzhRy1LTv/2/I2wRfw71/B5F+rk6PAPTWRidNQIt
 hubg==
X-Gm-Message-State: AGi0PuZRxIdDg0ynyV2yksPpyXvPdPH1V+SFFQTkybONvZLEGe1VNefG
 h6b04atDEC4C6WoSY7ZaM33Du8Cs65I=
X-Google-Smtp-Source: APiQypKDZax5NRGh+zfL8sIP+9EGWZc476P74QwZJhiJloEZ1xjCoYcnGcB7PDYp7i5D5CLweJid/A==
X-Received: by 2002:a9f:27ca:: with SMTP id b68mr3830807uab.8.1588354567682;
 Fri, 01 May 2020 10:36:07 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com.
 [209.85.222.48])
 by smtp.gmail.com with ESMTPSA id h16sm960150vkc.44.2020.05.01.10.36.06
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 May 2020 10:36:06 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id s5so3997295uad.4
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 01 May 2020 10:36:06 -0700 (PDT)
X-Received: by 2002:ab0:b13:: with SMTP id b19mr3764969uak.91.1588354566196;
 Fri, 01 May 2020 10:36:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200430095819.1.Id37f71c69eb21747b9d9e2c7c242be130814b362@changeid>
 <20200501114943.ioetuxe24gi27bll@holly.lan>
In-Reply-To: <20200501114943.ioetuxe24gi27bll@holly.lan>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 1 May 2020 10:35:54 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V72b8UaQBst3UHBURXbFne0dmuGgN6vSc2dajELJFNew@mail.gmail.com>
Message-ID: <CAD=FV=V72b8UaQBst3UHBURXbFne0dmuGgN6vSc2dajELJFNew@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.222.66 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.66 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jUZaA-004k8d-JJ
Subject: Re: [Kgdb-bugreport] [PATCH] kgdboc: Be a bit more robust about
 handling earlycon leaving
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 kgdb-bugreport@lists.sourceforge.net,
 Jason Wessel <jason.wessel@windriver.com>, LKML <linux-kernel@vger.kernel.org>,
 linux-serial@vger.kernel.org, Jiri Slaby <jslaby@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Fri, May 1, 2020 at 4:49 AM Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> On Thu, Apr 30, 2020 at 09:59:09AM -0700, Douglas Anderson wrote:
> > The original implementation of kgdboc_earlycon included a comment
> > about how it was impossible to get notified about the boot console
> > going away without making changes to the Linux core.  Since folks
> > often don't want to change the Linux core for kgdb's purposes, the
> > kgdboc_earlycon implementation did a bit of polling to figure out when
> > the boot console went away.
> >
> > It turns out, though, that it is possible to get notified about the
> > boot console going away.  The solution is either clever or a hack
> > depending on your viewpoint.  ...or, perhaps, a clever hack.  All we
> > need to do is head-patch the "exit" routine of the boot console.  We
> > know that "struct console" must be writable because it has a "next"
> > pointer in it, so we can just put our own exit routine in, do our
> > stuff, and then call back to the original.
>
> I think I'm in the hack camp on this one!

LOL.  We can drop it if need be and wait to see if someone actually
ends up in the dead-zone.  Though I gotta earn the name "kernel
hacker" somehow, no?  ;-)


> > This works great to get notified about the boot console going away.
> > The (slight) problem is that in the context of the boot console's exit
> > routine we can't call tty_find_polling_driver().
>
> I presume this is something to do with the tty_mutex?

Actually, no.

trying to acquire lock:
ffffff81b34436a8 (&port->mutex){+.+.}-{3:3}, at: uart_poll_init+0x70/0x164
but task is already holding lock:
ffffff81b34436a8 (&port->mutex){+.+.}-{3:3}, at: uart_add_one_port+0x84/0x49c

Here's the stack (I just put a call to kgdboc_earlycon_exit_work_fn()
straight into kgdboc_earlycon_trap_exit() to reproduce which is why it
still looks like there's a worker:

uart_poll_init+0x70/0x164
tty_find_polling_driver+0x130/0x18c
configure_kgdboc+0x9c/0x164
kgdboc_earlycon_exit_work_fn+0x30/0x5c
kgdboc_earlycon_trap_exit+0x1c/0x4c
unregister_console+0xd4/0x100
register_console+0x374/0x39c
uart_add_one_port+0x418/0x49c
qcom_geni_serial_probe+0x230/0x330

If we continue on this patch I'll add it to the commit message.


> > We solve this by
> > kicking off some work on the system_wq when we get notified and this
> > works pretty well.
>
> There are some problems with the workqueue approach.
>
> Firstly, its runs too early on many systems (esp. those that register
> the console from a console initcall. kgdboc cannot find the tty, I think
> because the console is registered a long time before the corresponding
> tty comes up.

Ah, I see.  So the normal console comes along an inits and kicks the
boot console out but the tty isn't there yet.  :(  I guess my solution
only works if uart_add_one_port() is used and we hit this case in
uart_configure_port():

/*
 * If this driver supports console, and it hasn't been
 * successfully registered yet, try to re-register it.
 * It may be that the port was not available.
 */

...if you've done something to register the console earlier then
you're outta luck.  I'm not sure there's a ton we can do here.  I
don't think we can really transition over to running kgdb on the main
console because, if nothing else, the write() function for those tend
to grab "uport->lock" which doesn't seem like it's always safe.  Then
there'd be the problem of adding read() to all these consoles and
assuming it's non-blocking.

I feel like maybe the best that can be done is, now that earlycon
works as well as it does, to suggest that people _stop_ trying to
register their main console so early.  ;-)

(OK, now that I've read your 2nd message I guess there is something we
can do: keep using the boot console).


In general, though, my patch shouldn't necessarily make anything
_worse_ for you.  When the boot console's exit() routine is called
then you really can't use it any more.  It shouldn't hurt to check if
the TTY is available so we can switch right away.  I guess if your
case is common, though, we'd maybe want to get rid of the
cleanup_earlycon() in kgdboc_earlycon_exit_work_fn() because if you
attached gdb in kgdb_earlycon the debug_core will throw its hissyfit.
We can just cross our fingers and hope the TTY comes along before we
end up in the debugger again.


> Secondly I am seeing warnings related to the tty_mutex where the
> might_sleep() machinery ends up flushing the active workqueue.
>
> [   39.298332] ------------[ cut here ]------------
> [   39.298332] WARNING: CPU: 0 PID: 5 at kernel/workqueue.c:3033 __flush_work+00
> [   39.298332] Modules linked in:
> [   39.298332] CPU: 0 PID: 5 Comm: kworker/0:0 Not tainted 5.7.0-rc3+ #47
> [   39.298332] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS ?-204
> [   39.298332] Workqueue: events kgdboc_earlycon_exit_work_fn
> [   39.298332] RIP: 0010:__flush_work+0x19c/0x1c0
> [   39.298332] Code: 4c 8b 6d 20 e9 06 ff ff ff 41 c6 04 24 00 fb 45 31 f6 eb 8f
> [   39.298332] RSP: 0018:ffff993500033dd0 EFLAGS: 00010246
> [   39.298332] RAX: 0000000000000000 RBX: ffffffffadcd0720 RCX: 0000000000000001
> [   39.298332] RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffffffffadcd0820
> [   39.298332] RBP: ffff8a633ec299c0 R08: 0000000000000000 R09: 0000000000000001
> [   39.298332] R10: 000000000000000a R11: f000000000000000 R12: 00000000ffffffed
> [   39.298332] R13: ffff8a633e408840 R14: 0000000000000000 R15: ffff8a633e408840
> [   39.298332] FS:  0000000000000000(0000) GS:ffff8a633ec00000(0000) knlGS:00000
> [   39.298332] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   39.298332] CR2: ffff8a6333201000 CR3: 0000000032a0a000 CR4: 00000000000006f0
> [   39.298332] Call Trace:
> [   39.298332]  ? _cond_resched+0x10/0x20
> [   39.298332]  ? mutex_lock+0x9/0x30
> [   39.298332]  ? tty_find_polling_driver+0x134/0x1a0
> [   39.298332]  configure_kgdboc+0x12d/0x1c0
> [   39.298332]  kgdboc_earlycon_exit_work_fn+0x1a/0x40
> [   39.298332]  process_one_work+0x1d3/0x380
> [   39.298332]  worker_thread+0x45/0x3c0
> [   39.298332]  kthread+0xf6/0x130
> [   39.298332]  ? process_one_work+0x380/0x380
> [   39.298332]  ? kthread_park+0x80/0x80
> [   39.298332]  ret_from_fork+0x22/0x40
> [   39.298332] ---[ end trace 1190f578d6e11204 ]---
> [   39.298338] KGDB: Unregistered I/O driver kgdboc_earlycon, debugger disabled

This is weird.  Why don't I see this?  Oh, I see.  It's because your
console is replacing the boot console so early so "workqueue_init"
hasn't run yet.  Mine happens much, much later.

...I can try to dig more if we want to continue going down this path,
but in general it should be fine to grab a mutex on a worker, right?
...and the workers shouldn't start running until it's safe to run?  Is
this just a race where we don't set "wq_online = true" early enough
and pending work has run or something?  Maybe if you drop into the
debugger at the time of this warning you'll find that some other task
is running and somewhere midway though workqueue_init()?

-Doug


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
