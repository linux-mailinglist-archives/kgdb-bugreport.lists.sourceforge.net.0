Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E68DFB3BD36
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 29 Aug 2025 16:12:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:References:In-Reply-To:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KsKmSkhQypFfOE3DsGXxHD5Y9tvSfZULO06oFwXpFrs=; b=RztnhoRmtXxQFQQbrCyhc/vngx
	2cUPYDJZtIQz2HHIfYx00d9VmwU3I85yzPdzfypYDNq3YxfIxBy9wttEYn6feQFvWogzjcD30iIFO
	LUjns+0GFwnF87o2WPmeTQAQt93HUYQ7VWoDkKJNjXdwx4PQzMKWSdk9tDOOyfykiWqk=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1urzqI-0003cX-L5
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 29 Aug 2025 14:12:38 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <john.ogness@linutronix.de>) id 1urzqG-0003cR-Qj
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 29 Aug 2025 14:12:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LQnz+vrS9Wnn35wJiQxDvUxQEOtZwuQ9bHN8SozSAqM=; b=Xh056YFl4vGtBEwcE4PzP8G6Tq
 8yd1RRridxnO1XQXiZY32qtu+91+qxgKW8DKUwcGFO8ZfGT72ASG40UZzJwy2J8D5oh6UfCiwIjxy
 N1nvj4bde4YtL8Ug3tkVaQ5+ZXYYyuuvnm/ZOapAvRvIgPmjhWaXLr+4TdphGV2Q3u+s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LQnz+vrS9Wnn35wJiQxDvUxQEOtZwuQ9bHN8SozSAqM=; b=DozETTsHYsb6tSATVCvKZN/9Kc
 mCazHUUmM0RVOvynXklbD5n3qYa5cn9Hs/JfqRO0o+Xl4RIxEIjkfNvrg+SveraqvjMTIXL/b0huR
 k4L7dWZDUTA90+mPNtlJ6TkItoZwNhO7sanght7VdM8S4VAoNjZNMAF8WsrMV+iMDxp4=;
Received: from galois.linutronix.de ([193.142.43.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1urzqG-0007Oo-2u for kgdb-bugreport@lists.sourceforge.net;
 Fri, 29 Aug 2025 14:12:36 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1756476749;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LQnz+vrS9Wnn35wJiQxDvUxQEOtZwuQ9bHN8SozSAqM=;
 b=B/GNABanHeICru7VvdYWGEjYhfF8CAaJAJ/6sxByPEUiclWBJLvX8vSyp1lGdsx6GkKFoA
 2hLVYIt54hCC8hfDCr0lsXwxg31MNv+cdO8pXudlsXfGeBrb/x54xy3FZ5KlCgXWyta7Z4
 UacL/aqnDiZEwEBX3MCH3kkJnWRRZUsHonsYkjuqLr1ZZ3BkVVu6WGoYH2dqWhlaTht0kg
 R066inH2FwzZcuMuXjL6Ny6V/oAv58Tv6imOn3uoE2OYAMkabMK9nw3SaWzr6iVEDl0JF7
 JiqiWI8epJIhEhpKwUw7Lg0Ho/vacYE9YT1UmoWDcho/x67f3fsN1oqvs+01lA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1756476749;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LQnz+vrS9Wnn35wJiQxDvUxQEOtZwuQ9bHN8SozSAqM=;
 b=qwMSUN/7sbTNlPTYFgR0c0m3xsI7jUJ6qZRorNy370/KCHsI0smxbsPg/Ps9pHo0RDDHpy
 +iXQvdb0uLJb2QBw==
To: Petr Mladek <pmladek@suse.com>
In-Reply-To: <aLGoBDapczoLH9-Y@pathway.suse.cz>
References: <20250811-nbcon-kgdboc-v2-0-c7c72bcdeaf6@suse.com>
 <20250811-nbcon-kgdboc-v2-3-c7c72bcdeaf6@suse.com>
 <aJoAYD_r7ygH9AdS@aspen.lan>
 <6035c35f72eb1ac8817396ca08aae71d097ca42c.camel@suse.com>
 <84h5xukti3.fsf@jogness.linutronix.de> <aLGoBDapczoLH9-Y@pathway.suse.cz>
Date: Fri, 29 Aug 2025 16:18:28 +0206
Message-ID: <84v7m6gqsz.fsf@jogness.linutronix.de>
MIME-Version: 1.0
X-Spam-Score: 0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2025-08-29, Petr Mladek <pmladek@suse.com> wrote: > c)
 kdb_msg_write() also writes the message on all other consoles > registered
 by printk. I guess that this is what John meant > by mirroring. Yes. 
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
X-Headers-End: 1urzqG-0007Oo-2u
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

On 2025-08-29, Petr Mladek <pmladek@suse.com> wrote:
>      c) kdb_msg_write() also writes the message on all other consoles
> 	registered by printk. I guess that this is what John meant
> 	by mirroring.

Yes.

>> diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
>> index 79d8c74378061..2c168eaf378ed 100644
>> --- a/kernel/printk/nbcon.c
>> +++ b/kernel/printk/nbcon.c
>> @@ -10,6 +10,7 @@
>>  #include <linux/export.h>
>>  #include <linux/init.h>
>>  #include <linux/irqflags.h>
>> +#include <linux/kgdb.h>
>>  #include <linux/kthread.h>
>>  #include <linux/minmax.h>
>>  #include <linux/percpu.h>
>> @@ -247,6 +248,8 @@ static int nbcon_context_try_acquire_direct(struct nbcon_context *ctxt,
>>  		 * Panic does not imply that the console is owned. However,
>>  		 * since all non-panic CPUs are stopped during panic(), it
>>  		 * is safer to have them avoid gaining console ownership.
>> +		 * The only exception is if kgdb is active, which may print
>> +		 * from multiple CPUs during a panic.
>>  		 *
>>  		 * If this acquire is a reacquire (and an unsafe takeover
>>  		 * has not previously occurred) then it is allowed to attempt
>> @@ -255,6 +258,7 @@ static int nbcon_context_try_acquire_direct(struct nbcon_context *ctxt,
>>  		 * interrupted by the panic CPU while printing.
>>  		 */
>>  		if (other_cpu_in_panic() &&
>> +		    atomic_read(&kgdb_active) == -1 &&
>
> This would likely work for most kgdb_printk() calls. But what about
> the one called from kgdb_panic()?

Nice catch.

> Alternative solution would be to allow it only for the CPU locked
> by kdb, something like:
>
> 		    READ_ONCE(kdb_printf_cpu) != raw_smp_processor_id() &&

Yes, I like this.

> Note that I used READ_ONCE() to guarantee an atomic read. The
> condition will fail only when we are inside a code locked by
> the kdb_printf_cpu().

Neither the READ_ONCE() nor any memory barriers are needed because the
only interesting case is when the CPU sees that it is the one stored in
@kdb_printf_cpu. In which case it was the one that did the storing and
the value is always correctly loaded.

>> [0] https://lore.kernel.org/lkml/20210803131301.5588-4-john.ogness@linutronix.de
>
> Sigh, I have already forgotten that we discussed this in the past.

After so many years, I do not think there is a printk scenario we have
not discussed. ;-)

John


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
