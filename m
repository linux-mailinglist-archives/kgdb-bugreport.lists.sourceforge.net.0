Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 907FFB3BC32
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 29 Aug 2025 15:16:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jAftL8INtuG1TKFnnP1rGlr+uVuQbfeqCQnUnaV+nyY=; b=D52PlioGve+s01/i5sTAFfxsA8
	foah0TR+RU4fvTmju12taUaoVmb6CSRpRwSjbK3LHTy17PBQQzjDtm2RyKLZpGmPrxb+r8AWK3eYY
	dgL13M9T+hkCIVH/xKhNY+lnHQFriJsAjE7KOfE/DYzwjKSNqoIqaYFcnU5HHvaNO0kU=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1uryxU-0007TS-NX
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 29 Aug 2025 13:16:00 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1uryxT-0007TK-CZ
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 29 Aug 2025 13:15:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Zoalc8mNo6XyJsEnXMXEpstjIFOUJAFYo+O0q9oPNg0=; b=hnYK0t0GBnS6JaOoEXAUXmRkfM
 l+ex8ah1+vhomj0TsRAFOMslvF0Bv8fDyJz4gdhKX3IY16XbKXPdpVHzlUg/f6o2dZ6dhbuOHz8VB
 qBH/dlgF3eCcuY9YBu4YHOKOORMWS5jPXm7hdn8CD+A4f4NILmD7CRT54dZ5K6WakKDY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Zoalc8mNo6XyJsEnXMXEpstjIFOUJAFYo+O0q9oPNg0=; b=UdDuQZ/8ZuhbMACSrOSO+XZXyi
 HzLCAuRzfl49nHS36RS9/1V0V529XQKMXvSuR9/qE6c5HDClwJUXeefpVSRDaSd7LG2YXbgEqr4Eb
 7Yu3uos8M7fUJydQwNYsiuGDxFHWRKqQKZQbl7o6a9BwurJbAxyrCddOf0wKUUpmMn7s=;
Received: from mail-ed1-f46.google.com ([209.85.208.46])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uryxR-0000yy-PF for kgdb-bugreport@lists.sourceforge.net;
 Fri, 29 Aug 2025 13:15:59 +0000
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-61c7942597fso6283841a12.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 29 Aug 2025 06:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1756473351; x=1757078151; darn=lists.sourceforge.net; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Zoalc8mNo6XyJsEnXMXEpstjIFOUJAFYo+O0q9oPNg0=;
 b=MNjbX13vPnmiWGuE6ekkgMm03cRnso05w8lFW22VkO3HswTDLyj+XB58zsj8dj3K7s
 vZOmD8cputevqwoI5g8S0vzUbWXRd9q3TRibFG9ywkcBTIw8ed2wdhR/6zCPizIechAI
 7LahAPlVRHUhHARGnQQbSqwAlWcCSmEyFtBuTfDh84nfr9Sh3JqrWy0kt00lRyNsXGdS
 pSyXbQOK0zAqV2iaS5rUCEWtQ1ROYUvK9i8HYSHU4hsVMqFj94H6W1Bua5ufwbav1p6V
 XCIszNbaUb9oKqFrVqn5UkyurHYntPh2eB+U+QH38cP0NMo3NznG0O+sbyY/qOZ6dZ2H
 fMDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756473351; x=1757078151;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Zoalc8mNo6XyJsEnXMXEpstjIFOUJAFYo+O0q9oPNg0=;
 b=I2E4uz/MsAHPvTIg/WXCnpMWAhD3vaczOl7F5CGaAuAYvmXJQOXZbO1VQ0pDDBtVLD
 oWVouBQ+JoOgCIYasuvYjbw4MResNPhg9oRN6RHxP2owmkRlUgxOqA6d6+Su9ZacPfdY
 kQzruSgNVFkbMg/2s30VI96wyvEnG4Yg5CuOBaEr9CuAz3WZvTknYcU+I6NRvZSiB87Z
 Oq+LE+KykxR2THoI+Q3td5N2TK4uU5u5aeekccXxdtwZwu6n8yZ+hjTKOnZ9MmdSqsCN
 e9FobuFJbh7tp/txLsJJFZ+8jyeRw3RVVu4P1aYGLZx8Bhr+Uu87+d1voLFa97GHQdj+
 TCkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7cuU1LVRu1wNC1+6LVyl+IBTd2mBU3BY6Cgjdl5JdysermiK99S88Up5ADBYwBaWZ5VA4ijQYJF4pfwkKdQ==@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzZ2Syzu9oH4ZlBr53pnzErYtOdYD2mWoj+8++888rfMeAdsxKz
 DbuQIIhtTaY+dCp/Kmd7q4RH47Jf4JGl4Z23q1pC1OUmaiP4bvTIhwXBf6RXj1RYlNo=
X-Gm-Gg: ASbGncuX7bwjNJKDDqsJnnmdwYknvQfncJSE1jIAFq6GfV8iTmGovOMtNRgsXA0b6ii
 oDa1bvNs8COhQVA6CK3ArrztoZySKQheE4JSGoU8LS5iqUHJurA+phyDMNAj97rPD8pQJCZxMem
 9VK0bUAwtdGDSdit64KlUxOUpgJMhVTWr2/jY+imdd/EicHJt1k9fU7FR8wsrsWnnrfGh9voE+1
 L+p1Kmi09FGF7R96JdRTZ7zd5kiYQ3y+AY622As/GME3OPla2HaRfhCogJUvyYMZVJgWTX2d7Kn
 Ra1F+wcJCERyUL2BWG+sgzEKV6dBHULCJAaG1zE9/zdTpI2/9szQFFW9nx1hnqt/XbSpXLfqYzB
 1M6TmyS244NIfN7hZ00FToIp77ARjB+xCUgeZFZdglltqlAY=
X-Google-Smtp-Source: AGHT+IHs9PBBJd6VjsxGr8k912oIX5StJieFRWHn/DtrBrH0pH1VwJnbNB4issF3+rCOklpglvaNWA==
X-Received: by 2002:a05:6402:90e:b0:61c:931d:ccce with SMTP id
 4fb4d7f45d1cf-61c983b81d2mr10225584a12.13.1756473350955; 
 Fri, 29 Aug 2025 06:15:50 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61cfc5315c7sm1701157a12.46.2025.08.29.06.15.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 06:15:50 -0700 (PDT)
Date: Fri, 29 Aug 2025 15:15:48 +0200
To: John Ogness <john.ogness@linutronix.de>
Message-ID: <aLGoBDapczoLH9-Y@pathway.suse.cz>
References: <20250811-nbcon-kgdboc-v2-0-c7c72bcdeaf6@suse.com>
 <20250811-nbcon-kgdboc-v2-3-c7c72bcdeaf6@suse.com>
 <aJoAYD_r7ygH9AdS@aspen.lan>
 <6035c35f72eb1ac8817396ca08aae71d097ca42c.camel@suse.com>
 <84h5xukti3.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <84h5xukti3.fsf@jogness.linutronix.de>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue 2025-08-26 17:17:32,
 John Ogness wrote: > On 2025-08-11, 
 Marcos Paulo de Souza <mpdesouza@suse.com> wrote: > > On Mon, 2025-08-11
 at 15:38 +0100, Daniel Thompson wrote: > >> On Mon, Aug 11, 202 [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.46 listed in wl.mailspike.net]
X-Headers-End: 1uryxR-0000yy-PF
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

On Tue 2025-08-26 17:17:32, John Ogness wrote:
> On 2025-08-11, Marcos Paulo de Souza <mpdesouza@suse.com> wrote:
> > On Mon, 2025-08-11 at 15:38 +0100, Daniel Thompson wrote:
> >> On Mon, Aug 11, 2025 at 10:32:47AM -0300, Marcos Paulo de Souza
> >> wrote:
> >> > Function kdb_msg_write was calling con->write for any found
> >> > console, but it won't work on NBCON ones. In this case we should
> >> > acquire the ownership of the console using NBCON_PRIO_EMERGENCY,
> >> > since printing kdb messages should only be interrupted by a
> >> > panic. This is done by the nbcon_kdb_{acquire,release} functions.
> >> 
> >> Just wanted to check what it means to be "interrupted by a panic"?
> >> 
> >> kdb is called from the panic handler but, assuming the serial port is
> >> run syncrhonously when "bad things are happening", the serial port
> >> should be quiet when we enter kdb meaning we can still acquire
> >> ownership of the console?
> >
> > TBH I haven't thought about that. I talked with Petr Mladek about it,
> > and we agreed to have something similar to nbcon_device_try_acquire,
> > but with a higher priority, to make sure that we would get the context
> > at this point. But, when thinking about it, since KDB runs on the panic
> > handler, so we I'm not sure even if we need the _enter_unsafe() call at
> > this point, since nobody is going to interrupt either way.
> 
> Well, kdb can also run when not in panic. In that case, if a panic
> occurs while using kdb, those panic messages should be printed directly
> on the consoles.
> 
> Also be aware that the kdb interface is using dbg_io_ops->write_char()
> for printing and it will ignore a console that matches
> dbg_io_ops->cons. So there is no concern about the kdb interface
> conflicting with the nbcon console. This is just about the mirrored kdb
> output.

I was a bit confused by the "mirrored kdb output". It was a new term ;-)
Let me try to summarize how I see it. Take it with a caution because I
am not much familiar with the kdb code.

vkdb_printf() API
-----------------

It serializes calls using a custom recursive CPU lock (kdb_printf_cpu)

It shows/stores the messages using several interfaces:

     a) gdbstub_msg_write() probably shows the message inside
	an attached gdb debugger.

     b) kdb_msg_write() shows the message on the console where kdb
	is attached via dbg_io_ops->write_char()

     c) kdb_msg_write() also writes the message on all other consoles
	registered by printk. I guess that this is what John meant
	by mirroring.

     d) printk()/pr_info() stores the messages into printk log buffer
	and eventually shows them on printk consoles. It is called
	only when @logging is enabled

Note that either gdbstub_msg_write() or kdb_msg_write() is called.
Also I guess that @logging can be enabled only when gdb debugger is
attached. kdbgetintenv() most likely returns KDB_NOTENV when gdb is
not attached.

  => vkdb_printf() shows the message on only once on consoles:

      + via kdb_msg_write() when gdb is not attached

      + via printk() when gdb is attached and logging is enabled
	by setting LOGGING= environment variable


vkdb_printf() context
---------------------

vkdb_printf() is called when entering or being inside kdb code.
I guess that we might end there via:

   + int3 (break point)
   + kgdb_panic() called in panic()
   + NMI ???

I think that it might be called even before kdb synchronizes
all CPUs into some quiescent mode. Otherwise, the custom CPU
synchronization would not be needed.

For example, I guess that the CPUs are not synchronized here:

void kgdb_panic(const char *msg)
{
[...]
	if (dbg_kdb_mode)
		kdb_printf("PANIC: %s\n", msg);


But I might be wrong. Also it seems that kgdb_cpu_enter() makes sure
that all CPUs get synchronized before entering the main loop...


Serialization of vkdb_printf() vs. printk()
===========================================

Let's look at the various interfaces showing the messages:

    a) gdbstub_msg_write() does not conflict with printk()
       at all.

    b) It seems that kdb_msg_write() -> dbg_io_ops->write_char()
       uses some special API which tries to check whether the device
       is in a safe state and eventually waits for the safe state (pooling).

       It seems to be a one way synchronization. It "guarantees" that
       kdb would start write only when safe. But it does not block
       the other side.

       It might be safe when the other side is blocked which likely
       happens in kgdb_cpu_enter().


     c) kdb_msg_write() -> con->write()/con->write_atomic(), where

	  + con->write() is the legacy console callback. It is
	    internally synchronized via some lock, e.g. port->lock.

	    But kdb_msg_write() increments @oops_in_progress so that
	    the internal lock is basically ignored.

	      => It looks like a try-and-hope approach used also by panic().


	  + con->write_atomic() is nbcon console callback. It is going
	    to be synchronized via the new nbcon_kdb_try_acquire()

	       => The output won't be guaranteed because try_acquire()
		  might fail. But it should be safe.


      d) printk()/pr_info() is synchronized against other printk() out
	 of box. It would show the messages on the consoles only when
	 safe.

	 BTW: It might make sense to call printk()/pr_info() inside
	      nbcon_cpu_emergency_enter()/exit() section so that it
	      would try to flush the messages immediately when safe.


> > About the try_acquire part, I haven't checked about the state of the
> > console devices when the panic happens, if they drop the ownership of
> > the console on non-panic CPUs or not, so I'm not sure if this is needed
> > or not. I'll wait for Petr and/or maybe John to add some info.
> 
> If any context owned the console and is in an unsafe section while being
> interrupted by kdb (regardless if panic or not), then
> nbcon_kdb_try_acquire() will fail and the mirrored kdb output will not
> be visible on that console.
> 
> I am not sure how important it is that the output is mirrored in this
> case. A hostile takeover is not acceptable. And implementing some sort
> of delay so that the current owner has a chance to release the ownership
> (similar to what was attempted here [0]) is not only complicated, but
> has its own set of problems.

The solution proposed in this patch (nbcon_kdb_try_acquire()) looks
acceptable to me. The output is not guaranteed. But is should
hopefully work in most situations.

The great thing is that it would be safe in compare with the legacy
consoles where @oops_in_progress causes ignoring the internal locking.


> Currently there is no mirrored output for nbcon consoles. With this
> series it is at least possible.
> 
> BTW, in order for CPU switching during panic to be able to mirror output
> on nbcon consoles, an additional exception must be added to
> nbcon_context_try_acquire_direct(). It would look like this:

Great idea. I am just not sure about the condition, see below.

> diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
> index 79d8c74378061..2c168eaf378ed 100644
> --- a/kernel/printk/nbcon.c
> +++ b/kernel/printk/nbcon.c
> @@ -10,6 +10,7 @@
>  #include <linux/export.h>
>  #include <linux/init.h>
>  #include <linux/irqflags.h>
> +#include <linux/kgdb.h>
>  #include <linux/kthread.h>
>  #include <linux/minmax.h>
>  #include <linux/percpu.h>
> @@ -247,6 +248,8 @@ static int nbcon_context_try_acquire_direct(struct nbcon_context *ctxt,
>  		 * Panic does not imply that the console is owned. However,
>  		 * since all non-panic CPUs are stopped during panic(), it
>  		 * is safer to have them avoid gaining console ownership.
> +		 * The only exception is if kgdb is active, which may print
> +		 * from multiple CPUs during a panic.
>  		 *
>  		 * If this acquire is a reacquire (and an unsafe takeover
>  		 * has not previously occurred) then it is allowed to attempt
> @@ -255,6 +258,7 @@ static int nbcon_context_try_acquire_direct(struct nbcon_context *ctxt,
>  		 * interrupted by the panic CPU while printing.
>  		 */
>  		if (other_cpu_in_panic() &&
> +		    atomic_read(&kgdb_active) == -1 &&

This would likely work for most kgdb_printk() calls. But what about
the one called from kgdb_panic()?

Alternative solution would be to allow it only for the CPU locked
by kdb, something like:

		    READ_ONCE(kdb_printf_cpu) != raw_smp_processor_id() &&

Note that I used READ_ONCE() to guarantee an atomic read. The
condition will fail only when we are inside a code locked by
the kdb_printf_cpu().

An alternative would be smp_load_acquire(&kdb_printf_cpu). But
I think that it is a "too big" hammer and it does not fit here.

> +		    atomic_read(&kgdb_active) == -1 &&
>  		    (!is_reacquire || cur->unsafe_takeover)) {
>  			return -EPERM;
>  		}
> 
> >> > @@ -605,7 +616,14 @@ static void kdb_msg_write(const char *msg, int msg_len)
> >> > 		 * for this calling context.
> >> > 		 */
> >> > 		++oops_in_progress;
> >> > -		c->write(c, msg, msg_len);
> >> > +		if (flags & CON_NBCON) {
> >> > +			wctxt.outbuf = (char *)msg;
> >> > +			wctxt.len = msg_len;
> >> > +			c->write_atomic(c, &wctxt);
> >> > +			nbcon_kdb_release(&wctxt);
> >> > +		} else {
> >> > +			c->write(c, msg, msg_len);
> >> > +		}
> >> > 		--oops_in_progress;
> >> > 		touch_nmi_watchdog();
> >> > 	}
> >> 
> >> Dumb question, but is the oops_in_progress bump still useful with
> >> atomic consoles? Will the console have any spinlocks to disregard or
> >> will the console ownership code already handled any mutual exclusion
> >> issues meaning there should be no spinlocks taking by the atomic
> >> write handler?
> >
> > IIUC, since we can have multiple consoles, and some of them are NB and
> > others aren't, I believe that this oops_in_progress is still useful.
> 
> Correct, but only for legacy consoles. Please move the @oops_in_progress
> increment/decrement to only be around the c->write() call. This makes it
> clear that the hack is only "useful" for the legacy consoles.

I agree.

> John
> 
> [0] https://lore.kernel.org/lkml/20210803131301.5588-4-john.ogness@linutronix.de

Sigh, I have already forgotten that we discussed this in the past.

Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
