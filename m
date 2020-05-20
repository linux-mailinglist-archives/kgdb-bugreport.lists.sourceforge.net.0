Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE991DA906
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 20 May 2020 06:21:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jbGED-0007S9-7c
	for lists+kgdb-bugreport@lfdr.de; Wed, 20 May 2020 04:21:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sergey.senozhatsky@gmail.com>) id 1jbGEB-0007Rd-Uq
 for kgdb-bugreport@lists.sourceforge.net; Wed, 20 May 2020 04:21:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:Date:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wLtepNIIFtYJeYE+BCKW9s6RSwXADFckBZfwuNyokFI=; b=jR2LyPFtz779EO6RHw5dXqQC/M
 6Fp49FLFwLMO3XyEYXeoyBzWwNv11w5C9er6JKS0Mi0Au2l/zvt0vseg9bEX+IygGn3ZI8G8Q5DTB
 dYF7E/mvw3zMjFtI5hGz7nBKCm1/4SM7FrCIPNKHDfiddYtgoUxVhl3b5pcliZ0WyrRw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :Date:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wLtepNIIFtYJeYE+BCKW9s6RSwXADFckBZfwuNyokFI=; b=GK7jR4auz0U4UPao2R1hUB8sot
 o91bGSmZOv91UvecW30gQuZkaPSzEj0plgW/jgdq3wBWalD+6UM2fD/lDkD2UC1ulSjrxNAu/79Kt
 vSTXVqfgdpvHwv+xcA7uNnmipu//Y7Q8TllMr/ytlTCWo4b1WV5kAbUadGJeIMmRP9IM=;
Received: from mail-pj1-f68.google.com ([209.85.216.68])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jbGEA-00G8gr-Ph
 for kgdb-bugreport@lists.sourceforge.net; Wed, 20 May 2020 04:21:11 +0000
Received: by mail-pj1-f68.google.com with SMTP id z15so1898616pjb.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 19 May 2020 21:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=wLtepNIIFtYJeYE+BCKW9s6RSwXADFckBZfwuNyokFI=;
 b=Lnio8froYfGjhcDR8Oi4V/zbk2yJKl56gLzvoSzlT7BVfoF8DlqX2jBG5i8AiHHOB/
 xZ+q9j9M++RPnht2msBmEJIwIZywFCYVY0lfOkwGW/Yc2StACazmKT0tl1s2yfxuEhOA
 +l2rMXpxit2HfCkDqm953gSguskXH/UOpd43cQjZ9cJYpl2Em6J6iw5o9jhnqmAaNSr4
 PP+4c4qoi2mGZPJd+wpo11evo6JIFpGXBFaKc8viSXvi1YUZ2/AgROj0EoMVD3aS484W
 pFVU5LwL3WEEu8wnYBeslmWBMvNhYMXY0ZclBohCJYYlwUH1JecgAElKOSgnuHEHH7Or
 5cVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wLtepNIIFtYJeYE+BCKW9s6RSwXADFckBZfwuNyokFI=;
 b=ceWih/tN3hfy2mwPHHkunPRD3XAoouqa+p4b4RPhIK00o5NAQWJxVi1wdKtsejBrPs
 S8fHB24KrZrauQyKJbrwHwRLIl4Mag6pJilyaMbDoK+nyJiiuqmHEneajQKHJsrLl4fN
 y3krH9nQY/N0+AYtOtBDd+KTh7+XFW9341LGetK2x9o5vJ5HrHssvKqb/ssHCX3R9jsm
 KoMPUCBOa9kYbC5kMHTPLaK463P5C19fxxH+c5hMeS7eha38WRhcr30ZG78ANvVpB0Jd
 TepmJTF9/z2fJXTIxC83vfDOTJb+MNIizzdKPhDzo/rd1V/cr4/aHI8xvOgB+rcPDR8L
 lcRA==
X-Gm-Message-State: AOAM531mI1BVLE7rl/RYuL32ZH3lnGSvMNhfoSYkukU22KHt/A6BAbPz
 ydl2NtHN3q4o+oWnsGDQzx4=
X-Google-Smtp-Source: ABdhPJxKbZMNf3t5yOIP8N0BQUkbDFdAgNMKzKbxa4wLi/hHpoppOI6egVC0nBkgeQds8zhsxFEoPQ==
X-Received: by 2002:a17:902:8f8e:: with SMTP id
 z14mr2577787plo.230.1589948465026; 
 Tue, 19 May 2020 21:21:05 -0700 (PDT)
Received: from localhost ([2409:10:2e40:5100:6e29:95ff:fe2d:8f34])
 by smtp.gmail.com with ESMTPSA id 141sm832943pfz.171.2020.05.19.21.21.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 May 2020 21:21:04 -0700 (PDT)
From: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
X-Google-Original-From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Date: Wed, 20 May 2020 13:21:02 +0900
To: Petr Mladek <pmladek@suse.com>
Message-ID: <20200520042102.GA938@jagdpanzerIV.localdomain>
References: <1589273314-12060-1-git-send-email-sumit.garg@linaro.org>
 <20200512142533.ta4uejwmq5gchtlx@holly.lan>
 <CAFA6WYOV7oPbYE=9fXueYMacb5wv0r9T6F8tmECt-Eafe-fctw@mail.gmail.com>
 <20200514084230.GO17734@linux-b0ei>
 <CAFA6WYPSsgdAB-wJC0e2YkVkW0XsqQsu5wrn4iB4M-cwvS7z2g@mail.gmail.com>
 <20200515085021.GS17734@linux-b0ei>
 <20200515103308.GD42471@jagdpanzerIV.localdomain>
 <20200515134806.5cw4xxnxw7k3223l@holly.lan>
 <20200518092139.GK7340@linux-b0ei>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200518092139.GK7340@linux-b0ei>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (sergey.senozhatsky[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.216.68 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.68 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1jbGEA-00G8gr-Ph
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 John Ogness <john.ogness@linutronix.de>, Arnd Bergmann <arnd@arndb.de>,
 Peter Zijlstra <peterz@infradead.org>, kgdb-bugreport@lists.sourceforge.net,
 Steven Rostedt <rostedt@goodmis.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Jason Wessel <jason.wessel@windriver.com>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On (20/05/18 11:21), Petr Mladek wrote:
[..]
> > > Is this guaranteed that we never execute this path from NMI?
> 
> Good question!
> 
> > Absolutely not.
> > 
> > The execution context for kdb is pretty much unique... we are running a
> > debug mode with all CPUs parked in a holding loop with interrupts
> > disabled. One CPU is at an unknown exception state and the others are
> > either handling an IRQ or NMI depending on architecture[1].
> 
> This is similar to the situation in panic() when other CPUs are
> stopped. It is more safe when the CPUs are stopped using IRQ.
> There is higher danger of a deadlock when NMI is used.
> 
> bust_spinlock() is used in panic() to increase the chance to go over
> the deadlock and actually see the messages. It is not enough when
> more locks are used by the console (VT/TTY is good example). And
> it is not guaranteed that the console will still work after
> the hack is disabled by bust_spinlocks(0).

Good point. It's not guaranteed to help, but bust_spinlocks() does
help in general, many serial drivers do check oops_in_progress and
use a deadlock safe approach when locking port lock. I don't see
bust_spinlocks() being used in kdb, so it probably better start
doing so (along with general for_each_console() loop improvements,
like checking if console is enabled/available/etc).

[..]
> > > If so, can this please be added to the commit message? A more
> > > detailed commit message will help a lot.
> 
> What about?
> 
> "KDB has to get messages on consoles even when the system is stopped.
> It uses kdb_printf() internally and calls console drivers on its own.
> 
> It uses a hack to reuse an existing code. It sets "kdb_trap_printk"
> global variable to redirect even the normal printk() into the
> kdb_printf() variant.
> 
> The variable "kdb_trap_printk" is checked in printk_default() and
> it is ignored when printk is redirected to printk_safe in NMI context.
> Solve this by moving the check into printk_func().
> 
> It is obvious that it is not fully safe. But it does not make things
> worse. The console drivers are already called in this context by
> kdb_printf() direct calls."

This looks more informative indeed. Thanks!

	-ss


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
