Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BB39FB3EC07
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  1 Sep 2025 18:14:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QL5livCueOAHsyqJGAjBdVCkbJYaiG8JKYRWo8EypQQ=; b=L/0dIJfpuiTkzwW3flaFgUnNqm
	GoJBT3yn6QCqwSr1iF89FYWrAZYXp2AeCafeECIW8b47oPGKynyoW9mP7yOdmDilrtDlHaa33yBEf
	mIa/DRSKjwefA5b9dvZULZLIBBem8t6HgbZVhiWo5P2Ina9ttNO6U0EudEyU4Ge8ftlE=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1ut7Ae-0002v5-Pf
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 01 Sep 2025 16:14:17 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1ut7Ac-0002uq-U2
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 01 Sep 2025 16:14:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Si7cvIm4kT7iUcAsCjZQKkX2sBc3X7IbtKb4obfzTV0=; b=Jdrg+fj4Hoc6tlOe688TAVwA3r
 BEoDWRGFVilQgb8ohU9BK0aiMUEFbOb7qeBI8dys/NfLMr1ZIhPEJ52CosPL4y1j5rbJdQLOfSrxl
 HG127t5rlVB4ba3E9Qb1+cqsYsNpamBUOo7OhzJFcOiCQgj7xfjMvvZnUSm0UYpPV6Lg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Si7cvIm4kT7iUcAsCjZQKkX2sBc3X7IbtKb4obfzTV0=; b=C092Nod1fg2Iz1rpG5aGp1xFXe
 qKhgLkpWvWLIs6bKYiA07qevuNet//136qGK+Nbk+rbQwPR/rtN1c7Xwte1+AOn34AqZw4qKC8HDo
 4M2s8XxQHHsd1WzvWC6ZzULbq4oH9Jqujb0zoueqp47VLgn4YVYyCrqCn+palBC37f6E=;
Received: from mail-lj1-f172.google.com ([209.85.208.172])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1ut7Ac-0005sr-T3 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 01 Sep 2025 16:14:15 +0000
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-336ce4a8bfcso13503641fa.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 01 Sep 2025 09:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1756743242; x=1757348042; darn=lists.sourceforge.net; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Si7cvIm4kT7iUcAsCjZQKkX2sBc3X7IbtKb4obfzTV0=;
 b=fVDdg4mG6hrOxgS3POav+EaJWKEmANsfN7fAykkVmJ+DcfZwJbt9oBz4R8m8hoE9od
 s3NRQSxyXLIMTCzLb/9MsPKi4/XXu1elA4VCsnqOFzbC9rjZQvM7NBpyzyFzYYmifGHW
 2XFN2DwL+DolUHKiq2JHMBpTePKXuKa2HmEoFtiIvC1U5TMfNIQF7rLBqqF/m0kTo5sb
 vGl8OWpWuwjgIEzcXf9yJkNi4CbDYOJtrlzr7WRorCK2JZL140YHdtD51Wf2T4aWO55G
 lEyE0iB7bWaBVI9nubJzT516xsQz5RIc68qiXWfwtkjS58vI2mJ2DPNLwKPk0dmZoL3/
 1Eag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756743242; x=1757348042;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Si7cvIm4kT7iUcAsCjZQKkX2sBc3X7IbtKb4obfzTV0=;
 b=Pe9Q4abKiK1XmwNsY5dXPxkIQNLgJDeWlmCVQ3arTpgThT1A0DXTvEmAVuLJh4o25p
 GuhGPkMJFhCCIfoJ14PxfpOaNfutjGrQvI87Z5Pkcc5M+8X6LFAdF3NRJ+XK8ZZqamiM
 ZQXGq74KYPy6xXbHxNOEOlxaM7ZksCkdPeZ369e1xgCWsjtqa3sMPGAJZkoinyfSXCZg
 YNoLIdsf8ZjfYajKT2CNxSD8gjjRCN87LK+eznDR1RYJw1d7itN3RE++GwlAGYYOMGh/
 6ZMqoParP1bNgH0rfzlExfR+5UxzGuoJyucPhWuXGBye5uTzluRxa4btlJWqySDiLvsi
 vGpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvP1bFZgAFSKok5Yr+rVx9un/W98XP3qlMOTYGhcRYqgNxABtK7KDQ1gqHVvhilpVDcesXjrPYyZPOL2QHkg==@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyEbC/hZPBtkBQUvXGfhRwz3IE8UiWdrxgf5WFe6+nb6PzjXXy1
 JJXPyoO/fW7f7R/0THEF6gdKOyAhI6Q5mRQmo9NPt1hWnLk0sZ6VFoEt2HFUn5ofEeR6ueaOuv9
 DhRgv
X-Gm-Gg: ASbGnctUR7zMA0L7noZaO65P/5YgjvHRAl+pWe0MW/psFYC7Efro7vni7+EZIQ9+JCn
 Tr9xd7QW4uMc7b23dsb/tQiu5qVhbXyju3++XMPxN1W+blwLvLdrdnX3VUwWjQm4+/7xYhUZS+v
 L02sMb5LK5pHWwQwUnpEh1oSdnq6nQs4f7fNqS45StnrN7fiUiQ/LiQBQhSAArpGr4ML0Q+s66n
 SvsqoA5gr4iD6UycVZc9sKHPxgFh7S7pvU3Aicadu0L1JNuupnHSpQMFbRshVlvcWjimO0rck0W
 MJQfTewFyWPV8URHKpVpI0N17JHzDoN5TQHn7u3TqNOZzvJNkg4hsqucftEz7HcJU8an8CkiMLH
 a7qqq5Qz/fuVNT5muHeHKiwHfYqZsUFhgfh9C
X-Google-Smtp-Source: AGHT+IHbKzQmItE4cLHCWx13xdJv9du020t16y4zprr2xxZrTa+24IeCY7LXgw7MT9KP4RXiD72KDQ==
X-Received: by 2002:a17:907:3daa:b0:afe:6648:a24c with SMTP id
 a640c23a62f3a-b01d9774b47mr737349166b.52.1756727196486; 
 Mon, 01 Sep 2025 04:46:36 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aff0681aefdsm784277166b.8.2025.09.01.04.46.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 04:46:35 -0700 (PDT)
Date: Mon, 1 Sep 2025 13:46:33 +0200
To: John Ogness <john.ogness@linutronix.de>
Message-ID: <aLWHmY9_I4rbV0wG@pathway.suse.cz>
References: <20250811-nbcon-kgdboc-v2-0-c7c72bcdeaf6@suse.com>
 <20250811-nbcon-kgdboc-v2-3-c7c72bcdeaf6@suse.com>
 <aJoAYD_r7ygH9AdS@aspen.lan>
 <6035c35f72eb1ac8817396ca08aae71d097ca42c.camel@suse.com>
 <84h5xukti3.fsf@jogness.linutronix.de>
 <aLGoBDapczoLH9-Y@pathway.suse.cz>
 <84v7m6gqsz.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <84v7m6gqsz.fsf@jogness.linutronix.de>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri 2025-08-29 16:18:28,
 John Ogness wrote: > On 2025-08-29, 
 Petr Mladek <pmladek@suse.com> wrote: > > c) kdb_msg_write() also writes
 the message on all other consoles > > registered by printk. I g [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.172 listed in wl.mailspike.net]
X-Headers-End: 1ut7Ac-0005sr-T3
Subject: Re: [Kgdb-bugreport] [PATCH v2 3/3] kdb: Adapt kdb_msg_write to
 work with NBCON consoles
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
From: Petr Mladek via Kgdb-bugreport <kgdb-bugreport@lists.sourceforge.net>
Reply-To: Petr Mladek <pmladek@suse.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Marcos Paulo de Souza <mpdesouza@suse.com>,
 Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org,
 Daniel Thompson <daniel@riscstar.com>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Daniel Thompson <danielt@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 kgdb-bugreport@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Fri 2025-08-29 16:18:28, John Ogness wrote:
> On 2025-08-29, Petr Mladek <pmladek@suse.com> wrote:
> >      c) kdb_msg_write() also writes the message on all other consoles
> > 	registered by printk. I guess that this is what John meant
> > 	by mirroring.
> 
> Yes.
> 
> >> diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
> >> index 79d8c74378061..2c168eaf378ed 100644
> >> --- a/kernel/printk/nbcon.c
> >> +++ b/kernel/printk/nbcon.c
> >> @@ -10,6 +10,7 @@
> >>  #include <linux/export.h>
> >>  #include <linux/init.h>
> >>  #include <linux/irqflags.h>
> >> +#include <linux/kgdb.h>
> >>  #include <linux/kthread.h>
> >>  #include <linux/minmax.h>
> >>  #include <linux/percpu.h>
> >> @@ -247,6 +248,8 @@ static int nbcon_context_try_acquire_direct(struct nbcon_context *ctxt,
> >>  		 * Panic does not imply that the console is owned. However,
> >>  		 * since all non-panic CPUs are stopped during panic(), it
> >>  		 * is safer to have them avoid gaining console ownership.
> >> +		 * The only exception is if kgdb is active, which may print
> >> +		 * from multiple CPUs during a panic.
> >>  		 *
> >>  		 * If this acquire is a reacquire (and an unsafe takeover
> >>  		 * has not previously occurred) then it is allowed to attempt
> >> @@ -255,6 +258,7 @@ static int nbcon_context_try_acquire_direct(struct nbcon_context *ctxt,
> >>  		 * interrupted by the panic CPU while printing.
> >>  		 */
> >>  		if (other_cpu_in_panic() &&
> >> +		    atomic_read(&kgdb_active) == -1 &&
> >
> > This would likely work for most kgdb_printk() calls. But what about
> > the one called from kgdb_panic()?
> 
> Nice catch.
> 
> > Alternative solution would be to allow it only for the CPU locked
> > by kdb, something like:
> >
> > 		    READ_ONCE(kdb_printf_cpu) != raw_smp_processor_id() &&
> 
> Yes, I like this.
>
> > Note that I used READ_ONCE() to guarantee an atomic read. The
> > condition will fail only when we are inside a code locked by
> > the kdb_printf_cpu().
> 
> Neither the READ_ONCE() nor any memory barriers are needed because the
> only interesting case is when the CPU sees that it is the one stored in
> @kdb_printf_cpu. In which case it was the one that did the storing and
> the value is always correctly loaded.

Let me play the devil advocate for a bit.
What about the following race?

kdb_printf_cpu = -1  (0xffffffff)

CPU 0xff				CPU 0x1

					panic()

printk()
  nbcon_atomic_flush_pending()
     nbcon_context_try_acquire_direct()
	# load low byte of kdb_printf_cpu
	val = 0xff

					vkdb_printf()
					  cmpxchg(&kdb_printf_cpu, ...)
					  kdb_printf_cpu == 0x1

	# load higher byte of kdb_printf_cpu
	val = 0xff

Result: CPU 0xff would be allowed to acquire the nbcon context
	because it thinks that vkdb_printf() got locked on this CPU.

	It is not fully artificial, see
	https://lwn.net/Articles/793253/#Load%20Tearing

The above race is not critical. CPU 0x1 still could wait for CPU 0xff
and acquire the nbcon context later.

But it is something unexpected. I would feel more comfortable if
we used the READ_ONCE() and be on the safe side.

> >> [0] https://lore.kernel.org/lkml/20210803131301.5588-4-john.ogness@linutronix.de
> >
> > Sigh, I have already forgotten that we discussed this in the past.
> 
> After so many years, I do not think there is a printk scenario we have
> not discussed. ;-)

;-)

Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
