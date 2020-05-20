Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D671DAEE8
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 20 May 2020 11:36:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jbL95-0000X9-BW
	for lists+kgdb-bugreport@lfdr.de; Wed, 20 May 2020 09:36:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1jbL93-0000Wx-B2
 for kgdb-bugreport@lists.sourceforge.net; Wed, 20 May 2020 09:36:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bl2Z9rwd9yHv4ZpH+5LCcErhhFtMaEj+8e37h0oPQpc=; b=O/zTXqParLHnYB2riTHThEpj9o
 9JJpG9dNqyuzQ+JbmBf/9o0ETpONQgbwWutIBCavsu1pfZFI47DhS2xO3fOnVhyiT+MToxBOOeT5e
 pWs2ma+z99ijznr+yeX74mWHXYRO6PbTZF/fpOqkbzPCE+3rDWAwFW/o6VkSFZ5eoIvY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bl2Z9rwd9yHv4ZpH+5LCcErhhFtMaEj+8e37h0oPQpc=; b=D+iHofgeWE6ZNATT5JA5YzI3Bn
 XfzbKg+iLlN05eX7iOoAddReJngytqw+hOHT2pplLYP/sQRcqe5lN5Z1owK658zdWeJV7rUoBwR2W
 SwOKp8qtQkvSRYGMwcXuf5P/qKRK98pnaSF+HSmOBvHxqK0nFTn08a5a6Nl4db+pm7WQ=;
Received: from mail-wr1-f67.google.com ([209.85.221.67])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jbL8x-008lap-0D
 for kgdb-bugreport@lists.sourceforge.net; Wed, 20 May 2020 09:36:13 +0000
Received: by mail-wr1-f67.google.com with SMTP id w7so2370053wre.13
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 20 May 2020 02:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=bl2Z9rwd9yHv4ZpH+5LCcErhhFtMaEj+8e37h0oPQpc=;
 b=QuE0WnosJ6J52vDdOA3INb6M2D/urfQeKgVAIc2+q2dNGq0Wq/5IWiFlaj7Slg/BcQ
 UkRNgOmg57DHE5ZkeRPYdeTJmyl792iWRXudp5mLZW7GYT5f6Z75JC2tEh5cP16AK9mM
 9OnhPiI+UzhVdzV372P9zNs8q0kNWC1QBhUm9nyeYgCiUdJM1byYFPmrB323ixUXyigO
 Ms3mLPgYlvOQN/g4/7YyWLcb6IoaHawUgmFpsrT3A4H6ezgCPc6ft59u62qw45qlzcJz
 PBDLrO/odZOjfn9GKDEZ92HbhH6TPhps3ypWSCfeRlzhtDjPzsTKCioPhSukD6/ku64U
 zSvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bl2Z9rwd9yHv4ZpH+5LCcErhhFtMaEj+8e37h0oPQpc=;
 b=Yac7Ql9KpvMQx4D1OTLhs0QghHTzIqMAYnpF3hfynFyFRYDatxGo9tIdkMEPtIOOTI
 kYAhjx+7GX+TKqLufanh70ZgRNkAjJ1rF8LbhDi9eGtV0JqP73LL3zn1DgMc9bpGXMMr
 NHUPsi6zeMxPehG+s1o8piFAHkPxaVp7dd+95hYdArlxMq9+hlyBUq1YJleU7AcJfU7n
 UFKd1vBvUsk1UQ6Y3c3M8SyOHgmVeeVYlxD/uf89KDLRWRrGL0BWALePkkBYlRqLzpME
 g0Q2kdm1cqL9VnGnTZnXgNYpXUBfCgqKJDb15DGGB/1hJuXM8BUiK15nqw7GJBTzjNMK
 D/Yw==
X-Gm-Message-State: AOAM532FFpG8gEBGWA+vNSUgZ6xfbBgG8fruIealtv1UQNI/XsReOBFA
 spoEjnQnTOOWg11t1XoRX/2SSg==
X-Google-Smtp-Source: ABdhPJwwOpwo1mP3WPWm+13T7s8/2dqpT8dfFYb3l/48EJ787rro1deSw2krhQQ+/T4/nODPrdVJYg==
X-Received: by 2002:adf:e752:: with SMTP id c18mr3306165wrn.353.1589967360615; 
 Wed, 20 May 2020 02:36:00 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id g140sm2076523wmg.47.2020.05.20.02.35.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2020 02:35:59 -0700 (PDT)
Date: Wed, 20 May 2020 10:35:57 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Message-ID: <20200520093557.lwwxnhvgmacipdce@holly.lan>
References: <1589273314-12060-1-git-send-email-sumit.garg@linaro.org>
 <20200512142533.ta4uejwmq5gchtlx@holly.lan>
 <CAFA6WYOV7oPbYE=9fXueYMacb5wv0r9T6F8tmECt-Eafe-fctw@mail.gmail.com>
 <20200514084230.GO17734@linux-b0ei>
 <CAFA6WYPSsgdAB-wJC0e2YkVkW0XsqQsu5wrn4iB4M-cwvS7z2g@mail.gmail.com>
 <20200515085021.GS17734@linux-b0ei>
 <20200515103308.GD42471@jagdpanzerIV.localdomain>
 <20200515134806.5cw4xxnxw7k3223l@holly.lan>
 <20200518092139.GK7340@linux-b0ei>
 <20200520042102.GA938@jagdpanzerIV.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200520042102.GA938@jagdpanzerIV.localdomain>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
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
X-Headers-End: 1jbL8x-008lap-0D
Subject: Re: [Kgdb-bugreport] [PATCH] printk/kdb: Redirect printk messages
 into kdb in any context
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
Cc: Petr Mladek <pmladek@suse.com>, John Ogness <john.ogness@linutronix.de>,
 Arnd Bergmann <arnd@arndb.de>, Peter Zijlstra <peterz@infradead.org>,
 kgdb-bugreport@lists.sourceforge.net, Steven Rostedt <rostedt@goodmis.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Wed, May 20, 2020 at 01:21:02PM +0900, Sergey Senozhatsky wrote:
> On (20/05/18 11:21), Petr Mladek wrote:
> [..]
> > > > Is this guaranteed that we never execute this path from NMI?
> > 
> > Good question!
> > 
> > > Absolutely not.
> > > 
> > > The execution context for kdb is pretty much unique... we are running a
> > > debug mode with all CPUs parked in a holding loop with interrupts
> > > disabled. One CPU is at an unknown exception state and the others are
> > > either handling an IRQ or NMI depending on architecture[1].
> > 
> > This is similar to the situation in panic() when other CPUs are
> > stopped. It is more safe when the CPUs are stopped using IRQ.
> > There is higher danger of a deadlock when NMI is used.
> > 
> > bust_spinlock() is used in panic() to increase the chance to go over
> > the deadlock and actually see the messages. It is not enough when
> > more locks are used by the console (VT/TTY is good example). And
> > it is not guaranteed that the console will still work after
> > the hack is disabled by bust_spinlocks(0).
> 
> Good point. It's not guaranteed to help, but bust_spinlocks() does
> help in general, many serial drivers do check oops_in_progress and
> use a deadlock safe approach when locking port lock. I don't see
> bust_spinlocks() being used in kdb, so it probably better start
> doing so (along with general for_each_console() loop improvements,
> like checking if console is enabled/available/etc).

Agree.

I am also interested in whether we can figure out a way to match
consoles and polling drivers. It is better to use the polling
driver rather than the console since the polling drivers "know"
they will execute from all sorts of crazy places. For the most common
use cases this would also result in no console handler ever being
called.

BTW for those asking how this issue an submarine for so long I think
the main factor is that not all architectures implement NMI.

There are exceptions but kdb is typically only useful when either:

1. We have a real (e.g. not USB) serial port, or
2. We have a real (e.g. not USB) keyboard

On x86, where the SMP peers are rounded up using using an NMI, the
above grows increasingly hard to find (although they are certainly
still here). Combined with this very few commonly embedded
architectures round up using an NMI so these problems cannot occur.

This has allowed kdb to fall rather far behind the rest of the kernel
w.r.t. NMI robustness whilst not being entirely useless.

Sumit's recent work to exploit NMIs on arm64 is bringing some of our
debt to the surface... happily I think that will also help us to tackle
it!


> [..]
> > > > If so, can this please be added to the commit message? A more
> > > > detailed commit message will help a lot.
> > 
> > What about?
> > 
> > "KDB has to get messages on consoles even when the system is stopped.
> > It uses kdb_printf() internally and calls console drivers on its own.
> > 
> > It uses a hack to reuse an existing code. It sets "kdb_trap_printk"
> > global variable to redirect even the normal printk() into the
> > kdb_printf() variant.
> > 
> > The variable "kdb_trap_printk" is checked in printk_default() and
> > it is ignored when printk is redirected to printk_safe in NMI context.
> > Solve this by moving the check into printk_func().

Maybe a "Currently" thrown in we switch from general background
information to describing the problem the patch is about to fix helps us
read it:

  Currently the variable "kdb_trap_printk" is checked

But other than that LGTM.


Daniel.

> > 
> > It is obvious that it is not fully safe. But it does not make things
> > worse. The console drivers are already called in this context by
> > kdb_printf() direct calls."
> 
> This looks more informative indeed. Thanks!


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
