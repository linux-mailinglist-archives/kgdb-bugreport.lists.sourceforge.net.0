Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 804FD1E520C
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 28 May 2020 02:02:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1je60f-0006yo-BT
	for lists+kgdb-bugreport@lfdr.de; Thu, 28 May 2020 00:02:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1je60d-0006yY-My
 for kgdb-bugreport@lists.sourceforge.net; Thu, 28 May 2020 00:02:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=okC+75ZCtKbM15r3x670gRBve7kChxs6sV2debOxPB0=; b=OcVBZhnfwii3w3wFCEWIUbXBpZ
 SrD57Rt5cTeKUkoJpN7E2lFt3I6mXGGLjCijZ0vioKUx7q0vLENaLUdx+mKC06mgLdlSWh8mAs7GQ
 OC3EoRW/uiIJHds49xdxUrrgy/zmAsC4Cap/OYBGx6H8lYNr4w4qGSn3lrheOM2wTGg8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=okC+75ZCtKbM15r3x670gRBve7kChxs6sV2debOxPB0=; b=QHI6hHe5StbCRTdns62p90zVz6
 xALL6RNcIa1E2z6/cPBqXOSvoWKsRCFc1YPmVr8LLtWAEAmMnI9fIRt9lXC4FnXDWSG9dUJfwxnTu
 k9KgwBXdjXARGIvRkl2XUQJFQeB51YqaSMmltNXWGc8Wg/Pv+IJfLxQCF3/1DP+Z7Hyg=;
Received: from mail-ua1-f67.google.com ([209.85.222.67])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1je60b-00A0WL-RN
 for kgdb-bugreport@lists.sourceforge.net; Thu, 28 May 2020 00:02:55 +0000
Received: by mail-ua1-f67.google.com with SMTP id b13so9086990uav.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 27 May 2020 17:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=okC+75ZCtKbM15r3x670gRBve7kChxs6sV2debOxPB0=;
 b=kwQn58I6KeEnpxDEukm9xPGz2qfO5MESqkwTzLFeIX7J+dgM+ZV5QNN+lC+OhzIS6/
 96qBokhRcNk/JSx/rvGCUB4rIcTSWxyujirTeUBc8+5OBTrU8vvBdnCKLujPdEXA1HVh
 nxigoKotEtS8ni6ue0pj3Jeo723HpsQl8aLkQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=okC+75ZCtKbM15r3x670gRBve7kChxs6sV2debOxPB0=;
 b=kTeqxzCm28HksZMXsUwX60H3+aMld6pgHlnkx1Lc3J+TTU0dUQIO6VgrIYe/8baVnW
 M/him1rnuTWfGIBrti2FxcnJcEo3UurJ+1Nd3j0t+llmUlrEaxvVqog7azmN/YNvsEID
 tAmpdDKeyqQWiKxA6LQQIg61mHX2ATwUxs/BKbJtBd8QmEBAgsXkewf+fAcuKvF8zMg8
 54xyi0eOr2Zxrusm2VXSc3XeEFruUNas6C0pJCny7V1miOhidOMH8WzsnoQ78I5a4c4z
 l2j2KxPJFonZnVxhOy+G9ALeD2ZW5Np5NOBbfR/3LUB5QFbfi/BA2aMDORV5TqH/BUQR
 CJuw==
X-Gm-Message-State: AOAM532STzkSz41Vp43wzcDnAwNz0KoxEJGQJpdvzQQHjTv9YCU7tRwH
 bBThiDX7DM5NqlnhEYL9VNKg7+ppo3k=
X-Google-Smtp-Source: ABdhPJzTfqO+9RNf2Urmd99aZp02ZaGmgQEh4w/DdjaM8GviC+SIJd8iaFG/COrBHIz2Gzocm7u8+w==
X-Received: by 2002:ab0:6ed0:: with SMTP id c16mr294258uav.62.1590624160419;
 Wed, 27 May 2020 17:02:40 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com.
 [209.85.222.54])
 by smtp.gmail.com with ESMTPSA id 188sm313267vso.26.2020.05.27.17.02.39
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 May 2020 17:02:39 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id 14so9048024uaq.11
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 27 May 2020 17:02:39 -0700 (PDT)
X-Received: by 2002:ab0:1684:: with SMTP id e4mr240126uaf.22.1590624158874;
 Wed, 27 May 2020 17:02:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200507153444.1.I70e0d4fd46d5ed2aaf0c98a355e8e1b7a5bb7e4e@changeid>
 <20200519104151.6evv3hizm5dbjjq2@holly.lan>
In-Reply-To: <20200519104151.6evv3hizm5dbjjq2@holly.lan>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 27 May 2020 17:02:27 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XCFxgO-s--jw9CTgQUxtQfteoQ4XSL_bbjW4s82Wd3pg@mail.gmail.com>
Message-ID: <CAD=FV=XCFxgO-s--jw9CTgQUxtQfteoQ4XSL_bbjW4s82Wd3pg@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.222.67 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.67 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1je60b-00A0WL-RN
Subject: Re: [Kgdb-bugreport] [PATCH] kgdb: Avoid suspicious RCU usage
 warning
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
Cc: kgdb-bugreport@lists.sourceforge.net, LKML <linux-kernel@vger.kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Tue, May 19, 2020 at 3:41 AM Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> On Thu, May 07, 2020 at 03:53:58PM -0700, Douglas Anderson wrote:
> > At times when I'm using kgdb I see a splat on my console about
> > suspicious RCU usage.  I managed to come up with a case that could
> > reproduce this that looked like this:
> >
> >   WARNING: suspicious RCU usage
> >   5.7.0-rc4+ #609 Not tainted
> >   -----------------------------
> >   kernel/pid.c:395 find_task_by_pid_ns() needs rcu_read_lock() protection!
> >
> >   other info that might help us debug this:
> >
> >     rcu_scheduler_active = 2, debug_locks = 1
> >   3 locks held by swapper/0/1:
> >    #0: ffffff81b6b8e988 (&dev->mutex){....}-{3:3}, at: __device_attach+0x40/0x13c
> >    #1: ffffffd01109e9e8 (dbg_master_lock){....}-{2:2}, at: kgdb_cpu_enter+0x20c/0x7ac
> >    #2: ffffffd01109ea90 (dbg_slave_lock){....}-{2:2}, at: kgdb_cpu_enter+0x3ec/0x7ac
> >
> >   stack backtrace:
> >   CPU: 7 PID: 1 Comm: swapper/0 Not tainted 5.7.0-rc4+ #609
> >   Hardware name: Google Cheza (rev3+) (DT)
> >   Call trace:
> >    dump_backtrace+0x0/0x1b8
> >    show_stack+0x1c/0x24
> >    dump_stack+0xd4/0x134
> >    lockdep_rcu_suspicious+0xf0/0x100
> >    find_task_by_pid_ns+0x5c/0x80
> >    getthread+0x8c/0xb0
> >    gdb_serial_stub+0x9d4/0xd04
> >    kgdb_cpu_enter+0x284/0x7ac
> >    kgdb_handle_exception+0x174/0x20c
> >    kgdb_brk_fn+0x24/0x30
> >    call_break_hook+0x6c/0x7c
> >    brk_handler+0x20/0x5c
> >    do_debug_exception+0x1c8/0x22c
> >    el1_sync_handler+0x3c/0xe4
> >    el1_sync+0x7c/0x100
> >    rpmh_rsc_probe+0x38/0x420
> >    platform_drv_probe+0x94/0xb4
> >    really_probe+0x134/0x300
> >    driver_probe_device+0x68/0x100
> >    __device_attach_driver+0x90/0xa8
> >    bus_for_each_drv+0x84/0xcc
> >    __device_attach+0xb4/0x13c
> >    device_initial_probe+0x18/0x20
> >    bus_probe_device+0x38/0x98
> >    device_add+0x38c/0x420
> >
> > If I understand properly we should just be able to blanket kgdb under
> > one big RCU read lock and the problem should go away.  We'll add it to
> > the beast-of-a-function known as kgdb_cpu_enter().
> >
> > With this I no longer get any splats and things seem to work fine.
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
> In principle this looks OK but I'm curious why we don't cuddle these
> calls up to the local interrupt locking (and also whether we want to
> keep hold of the lock during stepping). If nothing else that would make
> review easier.

It probably wouldn't hurt to keep hold of the lock during single
stepping but I don't think there's any real reason we'd want to.
Specifically the only real reason we're calling rcu_read_lock() is to
avoid the warning.  Since we're a stop-the-world debugger it's not
like something else could be messing with state at the same time.

I'm looking at the whole function though and I don't really understand
all the comments about interrupts being restored by the 'trap return'
code, do you?  Specifically: as far as I can tell we _always_ restore
interrupts when exiting the function.  There are only two return
statements and both have "local_irq_restore(flags);" right before
them.  We never modify the flags directly and the one other usage of
"flags" is effectively the statement "local_irq_restore(flags);
local_irq_save(flags);" which will, I guess, allow any interrupts that
were already pending to take place.  Are you saying that you want me
to match that and do a "rcu_read_unlock(); rcu_read_lock()" there?

If I understand things correctly (and there's maybe a better chance
after I read Wei Li's recent patches) the disabling of IRQs for single
stepping happens in a different way.  It looks like we update the
"struct pt_regs" of the task we're stepping so that when we exit kgdb
and start running the task again that the interrupts are off.  That
seems reasonable to me and this function has nothing to do with it.

...and further confusion on my part: does the whole saving / restoring
of interrupts in kgdb_cpu_enter() make any sense anyway?  Is this
function ever called from a context that's not an interrupt context?
How do we get the pt_regs in that case?  Just for fun, I tried doing
this:

    local_irq_save(flags);
+   if (!arch_irqs_disabled_flags(flags))
+           pr_warn("I was wrong\n");

...and I never saw "I was wrong" on my system.  Maybe it matters for
something not arm64?  ...or, maybe, this is from when kgdb worked in a
completely different way?


In general I made my patch by:
* Calling rcu_read_lock() at the start of the function.
* Calling rcu_read_unlock() right before all 2 of the "return" calls of
  the function.

...I was hoping that would actually make it easier to reason about
even if the function is a beast.


Hopefully the above makes sense.  I wouldn't rule out me just being
utterly confused, but I _think_ I reasoned through it all.  ;-)  If it
all makes sense, I'm inclined to:

1. Leave my patch the way it is.

2. Perhaps remove the whole irq saving / restoring in kgdb_cpu_enter().


-Doug


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
