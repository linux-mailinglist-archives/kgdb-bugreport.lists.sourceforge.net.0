Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 38402B36D49
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 26 Aug 2025 17:11:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:References:In-Reply-To:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zImX4KrbAPuYMD/qmsxPBQAz1pvS3kHIJEZpNS2Bv7I=; b=hflUFUGl0wMPGkIfJ0BZDxYn4Z
	PYE4ZGUA9noTbNNpIvlmPJxwYjdfiGrNqqAROmkwpTVZZykm/wO4RSQYWC8Xliv3jCZ6T9B/foqj5
	Z9hMngig0pLmqnmqTcg3Rv3rsvfIWRbxP2ii+CLM/oBKPz7Y88RpXA0z2WrIFiwWUJlA=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1uqvKt-0006mH-3D
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 26 Aug 2025 15:11:47 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <john.ogness@linutronix.de>) id 1uqvKr-0006mB-D1
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 26 Aug 2025 15:11:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=U/yXlfO8Uy4zaE30Fj0arVRS1PTUrfVGm3+QcjZ6aTI=; b=lWutB2+mRwAFhhwvL82OxcOKV7
 004iBT3zlgHxkd3WhUlTxvLNWCCcWPqfsj3IWbtl5A1jagUf72SPXXwXHJX98mH/Kqqf1mQfyWQ8D
 f9t9+Aw6M1ijiIBWlnFKKrGYoq51q6tMppob+hGGDLn11RzdeYZTMDl2PcNfqCOli4F4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=U/yXlfO8Uy4zaE30Fj0arVRS1PTUrfVGm3+QcjZ6aTI=; b=F6aJd0blKiLLFp54OEXHfqvaEf
 8u9a67pq2xbIqgCuvtT1T/TRIVqSatm1DrIv966NILC8i5InvFZUeFFwiI9shA9ddf7KpCn9/eT1J
 csb5fiviFdcXnlELfnaRpup4wwnIuJBLf6+cyHon5bqEBB28C+aMQ4ZtbMWB2AWU4fh4=;
Received: from galois.linutronix.de ([193.142.43.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uqvKq-0005J0-Mr for kgdb-bugreport@lists.sourceforge.net;
 Tue, 26 Aug 2025 15:11:45 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1756221093;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=U/yXlfO8Uy4zaE30Fj0arVRS1PTUrfVGm3+QcjZ6aTI=;
 b=N64Mc9ADHY3q+V4ETWWrYQny5lL4fSh31sdQLk5q+t+zoi0dcD+S4vPK9SNjWYuV2UgsQ2
 U0jtlU7DlPsEdonOp9g8fUee7TVhrvZqxSSNYvpIKNxjVVP5H09OgkzGSg3nEsjO+Z7spb
 p+t7UmHoi0FjlijUs67URnUGuaN4Y5l9oODFOxtQ+IMpg8cE01YA0bQHSt+xaQ5GO9085i
 aAz55tNjJWERbYXuJW93tRWUFWACU4qQOa8azf6ujGYUlAkWenaQ51SrP8yMab76bj4vMs
 Pb4DWXK7sUbgDGlbLxmwjmBOS1r9OGQLyvqNF4cufhcXAJOZPo5kiUl7v50cUA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1756221093;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=U/yXlfO8Uy4zaE30Fj0arVRS1PTUrfVGm3+QcjZ6aTI=;
 b=PTlGNQVFKfrxKIXPM7WJhU5dmv4vSerF7WYt0qPiIe+nPVdFkKjpRPGGYGmUHsCOQAYUXt
 249M/og3SWsmRXCQ==
To: Marcos Paulo de Souza <mpdesouza@suse.com>, Daniel Thompson
 <daniel@riscstar.com>
In-Reply-To: <6035c35f72eb1ac8817396ca08aae71d097ca42c.camel@suse.com>
References: <20250811-nbcon-kgdboc-v2-0-c7c72bcdeaf6@suse.com>
 <20250811-nbcon-kgdboc-v2-3-c7c72bcdeaf6@suse.com>
 <aJoAYD_r7ygH9AdS@aspen.lan>
 <6035c35f72eb1ac8817396ca08aae71d097ca42c.camel@suse.com>
Date: Tue, 26 Aug 2025 17:17:32 +0206
Message-ID: <84h5xukti3.fsf@jogness.linutronix.de>
MIME-Version: 1.0
X-Spam-Score: 0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2025-08-11, Marcos Paulo de Souza <mpdesouza@suse.com>
 wrote: > On Mon, 2025-08-11 at 15:38 +0100, Daniel Thompson wrote: >> On Mon, 
 Aug 11, 2025 at 10:32:47AM -0300, Marcos Paulo de Souza >> wrote [...] 
 Content analysis details:   (0.4 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.6 INVALID_DATE_TZ_ABSURD Invalid Date: header (timezone does not exist)
X-Headers-End: 1uqvKq-0005J0-Mr
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
Cc: Petr Mladek <pmladek@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Daniel Thompson <danielt@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 kgdb-bugreport@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On 2025-08-11, Marcos Paulo de Souza <mpdesouza@suse.com> wrote:
> On Mon, 2025-08-11 at 15:38 +0100, Daniel Thompson wrote:
>> On Mon, Aug 11, 2025 at 10:32:47AM -0300, Marcos Paulo de Souza
>> wrote:
>> > Function kdb_msg_write was calling con->write for any found
>> > console, but it won't work on NBCON ones. In this case we should
>> > acquire the ownership of the console using NBCON_PRIO_EMERGENCY,
>> > since printing kdb messages should only be interrupted by a
>> > panic. This is done by the nbcon_kdb_{acquire,release} functions.
>> 
>> Just wanted to check what it means to be "interrupted by a panic"?
>> 
>> kdb is called from the panic handler but, assuming the serial port is
>> run syncrhonously when "bad things are happening", the serial port
>> should be quiet when we enter kdb meaning we can still acquire
>> ownership of the console?
>
> TBH I haven't thought about that. I talked with Petr Mladek about it,
> and we agreed to have something similar to nbcon_device_try_acquire,
> but with a higher priority, to make sure that we would get the context
> at this point. But, when thinking about it, since KDB runs on the panic
> handler, so we I'm not sure even if we need the _enter_unsafe() call at
> this point, since nobody is going to interrupt either way.

Well, kdb can also run when not in panic. In that case, if a panic
occurs while using kdb, those panic messages should be printed directly
on the consoles.

Also be aware that the kdb interface is using dbg_io_ops->write_char()
for printing and it will ignore a console that matches
dbg_io_ops->cons. So there is no concern about the kdb interface
conflicting with the nbcon console. This is just about the mirrored kdb
output.

> About the try_acquire part, I haven't checked about the state of the
> console devices when the panic happens, if they drop the ownership of
> the console on non-panic CPUs or not, so I'm not sure if this is needed
> or not. I'll wait for Petr and/or maybe John to add some info.

If any context owned the console and is in an unsafe section while being
interrupted by kdb (regardless if panic or not), then
nbcon_kdb_try_acquire() will fail and the mirrored kdb output will not
be visible on that console.

I am not sure how important it is that the output is mirrored in this
case. A hostile takeover is not acceptable. And implementing some sort
of delay so that the current owner has a chance to release the ownership
(similar to what was attempted here [0]) is not only complicated, but
has its own set of problems.

Currently there is no mirrored output for nbcon consoles. With this
series it is at least possible.

BTW, in order for CPU switching during panic to be able to mirror output
on nbcon consoles, an additional exception must be added to
nbcon_context_try_acquire_direct(). It would look like this:

diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
index 79d8c74378061..2c168eaf378ed 100644
--- a/kernel/printk/nbcon.c
+++ b/kernel/printk/nbcon.c
@@ -10,6 +10,7 @@
 #include <linux/export.h>
 #include <linux/init.h>
 #include <linux/irqflags.h>
+#include <linux/kgdb.h>
 #include <linux/kthread.h>
 #include <linux/minmax.h>
 #include <linux/percpu.h>
@@ -247,6 +248,8 @@ static int nbcon_context_try_acquire_direct(struct nbcon_context *ctxt,
 		 * Panic does not imply that the console is owned. However,
 		 * since all non-panic CPUs are stopped during panic(), it
 		 * is safer to have them avoid gaining console ownership.
+		 * The only exception is if kgdb is active, which may print
+		 * from multiple CPUs during a panic.
 		 *
 		 * If this acquire is a reacquire (and an unsafe takeover
 		 * has not previously occurred) then it is allowed to attempt
@@ -255,6 +258,7 @@ static int nbcon_context_try_acquire_direct(struct nbcon_context *ctxt,
 		 * interrupted by the panic CPU while printing.
 		 */
 		if (other_cpu_in_panic() &&
+		    atomic_read(&kgdb_active) == -1 &&
 		    (!is_reacquire || cur->unsafe_takeover)) {
 			return -EPERM;
 		}

>> > @@ -605,7 +616,14 @@ static void kdb_msg_write(const char *msg, int msg_len)
>> > 		 * for this calling context.
>> > 		 */
>> > 		++oops_in_progress;
>> > -		c->write(c, msg, msg_len);
>> > +		if (flags & CON_NBCON) {
>> > +			wctxt.outbuf = (char *)msg;
>> > +			wctxt.len = msg_len;
>> > +			c->write_atomic(c, &wctxt);
>> > +			nbcon_kdb_release(&wctxt);
>> > +		} else {
>> > +			c->write(c, msg, msg_len);
>> > +		}
>> > 		--oops_in_progress;
>> > 		touch_nmi_watchdog();
>> > 	}
>> 
>> Dumb question, but is the oops_in_progress bump still useful with
>> atomic consoles? Will the console have any spinlocks to disregard or
>> will the console ownership code already handled any mutual exclusion
>> issues meaning there should be no spinlocks taking by the atomic
>> write handler?
>
> IIUC, since we can have multiple consoles, and some of them are NB and
> others aren't, I believe that this oops_in_progress is still useful.

Correct, but only for legacy consoles. Please move the @oops_in_progress
increment/decrement to only be around the c->write() call. This makes it
clear that the hack is only "useful" for the legacy consoles.

John

[0] https://lore.kernel.org/lkml/20210803131301.5588-4-john.ogness@linutronix.de


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
