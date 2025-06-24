Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DEE9AE6339
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 24 Jun 2025 13:04:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:References:In-Reply-To:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PHXBA1o3sNw46wkIrftqZOANpD/WUUCSpve1H4xdD/U=; b=GkFN/YzcRVqbBjQMd1CJVLVNbA
	ncOsShKHDR0zkGlf57XCjXVbJzOGnZTlYUBN+s7grBw2dCVx6WjC+jtzf+omvYew3TKz9iTMAE9LP
	RKRHsFGslnhjP1PwEpx6PFh0Nq7dAIVSebQoo9KpLbzqbYTTtJ8pvi0yPJATBdRGSE+I=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1uU1S8-0001W4-AG
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 24 Jun 2025 11:04:36 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <john.ogness@linutronix.de>) id 1uU1S5-0001Vx-Oq
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 24 Jun 2025 11:04:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5eEk+aF+pt0MvEUwqDpSXabyNiN3Qdyl9X0CVlT8PCA=; b=SrZgRF8Akg4DBgkoM54+pDHCsp
 fqnxlaQH7Xpsi9YPuLYRPJZFyproYDGPVoQRwRRi/s2jggupPjc48xqeCgWjs68PGGnN22diT7LRm
 i4+Gj4azoyIQKUYiaIfhuakeiO44bJehYnOw1orQ191287Gfyd1g08YVrteShJlofGK4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5eEk+aF+pt0MvEUwqDpSXabyNiN3Qdyl9X0CVlT8PCA=; b=Vul0ZTSXW7HjX2FH/yIweLEDiz
 sLwUXSCSuK9ZvbHcvF5wdQju4iRKxUaSwdrPX/k/PSHg9HVTr+u4aaeOy9/+Mkn4CUi0YJkjwIBXW
 qZ9h1FVd8VOybPB0dMv8hs7D+LVjNbFENoZSezAhNBfwGfTEOwOvYCOXVg/CGLud+s3g=;
Received: from [193.142.43.55] (helo=galois.linutronix.de)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uU1S5-0001HX-9A for kgdb-bugreport@lists.sourceforge.net;
 Tue, 24 Jun 2025 11:04:33 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1750763066;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5eEk+aF+pt0MvEUwqDpSXabyNiN3Qdyl9X0CVlT8PCA=;
 b=QYALeI+wDWqdBcwoiCZT1gW13kZ0aWUTJAiRv5eh24JUe0U9MCzVDV71qbKcJEx8oDqHiL
 OXwAdfdvdF/diXvlbh8URTt5TzWvTQhqVtnQheBVZ9jGaOscKmRkIr5JQ5/aBxmfeXjrgj
 JExpQURBdHLkh1O0cglLYOty2dkpagdb8/D5sSy5v4SvOVCr1n9LAkduV6Lfau4uCW3UcY
 03pvnvXuyhL8EjsMe69F/RQCrvQFaldkgAEfcchAE6GBiu0j284+9FXRSD89SBHuUEusm6
 aSzZLEvID0iLevu9ODhbRcNDdAvhyEDmMYalCMdUVZk3uk1DNXtTFgDkYOCIsQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1750763066;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5eEk+aF+pt0MvEUwqDpSXabyNiN3Qdyl9X0CVlT8PCA=;
 b=b0nCeoNQlxtkF/VATw84CXoUW5gF8S9AJRZCXj3wuKZzjUykZsiuJ6FQYpbQlla9ns5vhy
 D23fvPgwu8aY34AQ==
To: Petr Mladek <pmladek@suse.com>
In-Reply-To: <aFpkQHwNCslbKSP6@pathway.suse.cz>
References: <20250606-printk-cleanup-part2-v1-0-f427c743dda0@suse.com>
 <20250606-printk-cleanup-part2-v1-2-f427c743dda0@suse.com>
 <aExBo-8cVOy6GegR@pathway.suse.cz> <84y0tmiidg.fsf@jogness.linutronix.de>
 <aFpkQHwNCslbKSP6@pathway.suse.cz>
Date: Tue, 24 Jun 2025 13:10:25 +0206
Message-ID: <84wm919z9i.fsf@jogness.linutronix.de>
MIME-Version: 1.0
X-Spam-Score: 1.7 (+)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2025-06-24, Petr Mladek <pmladek@suse.com> wrote: >> >
 Variant C: >> > ========== >> > >> > Remove even @flags parameter from
 console_is_usable()
 and read both >> > values there directly. >> > >> > [...] 
 Content analysis details:   (1.7 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.6 INVALID_DATE_TZ_ABSURD Invalid Date: header (timezone does not exist)
 1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
X-Headers-End: 1uU1S5-0001HX-9A
Subject: Re: [Kgdb-bugreport] [PATCH 2/7] printk: Use consoles_suspended
 flag when suspending/resuming all consoles
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
Cc: Richard Weinberger <richard@nod.at>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Marcos Paulo de Souza <mpdesouza@suse.com>, linux-um@lists.infradead.org,
 Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Daniel Thompson <danielt@kernel.org>, linux-serial@vger.kernel.org,
 Jason Wessel <jason.wessel@windriver.com>,
 kgdb-bugreport@lists.sourceforge.net,
 Johannes Berg <johannes@sipsolutions.net>, Jiri Slaby <jirislaby@kernel.org>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On 2025-06-24, Petr Mladek <pmladek@suse.com> wrote:
>> > Variant C:
>> > ==========
>> >
>> > Remove even @flags parameter from console_is_usable() and read both
>> > values there directly.
>> >
>> > Many callers read @flags only because they call console_is_usable().
>> > The change would simplify the code.
>> >
>> > But there are few exceptions:
>> >
>> >    2. Another exception is __pr_flush() where console_is_usable() is
>> >       called twice with @use_atomic set "true" and "false".
>> >
>> >       We would want to read "con->flags" only once here. A solution
>> >       would be to add a parameter to check both con->write_atomic
>> >       and con->write_thread in a single call.
>> 
>> Or it could become a bitmask of printing types to check:
>> 
>> #define ATOMIC_PRINTING 0x1
>> #define NONATOMIC_PRINTING 0x2
>> 
>> and then __pr_flush() looks like:
>> 
>> if (!console_is_usable(c, flags, ATOMIC_PRINTING|NONATOMIC_PRINTING)
>
> I like this. It will help even in all other cases when one mode is needed.
> I mean that, for example:
>
>    console_is_usable(c, flags, ATOMIC_PRINTING)
>
> is more self-explaining than
>
>    console_is_usable(c, flags, true)

After I wrote that suggestion, I decided that the naming is not
good. There is always confusion about what "atomic printing" means. For
that reason the parameter was changed to "use_atomic". Basically we are
specifying which callback to use and not the purpose. It is a bit tricky
because legacy consoles do not have an atomic callback, i.e. the
parameter only has meaning for nbcon consoles.

Perhaps these macros would be more suitable:

#define NBCON_USE_ATOMIC 0x1
#define NBCON_USE_THREAD 0x2

or

#define NBCON_USE_WRITE_ATOMIC 0x1
#define NBCON_USE_WRITE_THREAD 0x2

or

#define NBCON_ATOMIC_CB 0x1
#define NBCON_THREAD_CB 0x2

or

#define NBCON_ATOMIC_FUNC 0x1
#define NBCON_THREAD_FUNC 0x2

Hopefully that gives Petr enough ideas that he can come up with good
naming. ;-)

John


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
