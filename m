Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E3EE562D717
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 17 Nov 2022 10:32:51 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1ovbGM-0000Y6-ME
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 17 Nov 2022 09:32:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <john.ogness@linutronix.de>) id 1ovbFs-0000Xj-QK
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 17 Nov 2022 09:32:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iFIVJDRzYLM8JlLFrtE2EgsFESyY1Nn5OMC4RLGV2yY=; b=GycQUx94kF8QO7H+LLVjE+DXUf
 IlwLL1Npp7OGHuBmUzyyadwfqCVeiBOmSu2qOVpHtQBf+5wfaLLdO2PhXo//iKGX/3BtPQQm/Ltij
 lWjPIbPvAX6YfZ7bUYuGzP8gUJN34c1rAe2sajTZXgNv+3JBqrg8qycxc2d+kgMV0ids=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iFIVJDRzYLM8JlLFrtE2EgsFESyY1Nn5OMC4RLGV2yY=; b=KFQgXCEJTJ16ae6DaKkX1j2EnO
 LGj1OyyI+MfAqdbDn9wj/yLpBP3a8higVSmdg2MmOpRFXPoMyFRxRlaRBWTuBS5GcuFpF84aZbT4v
 gL5KtPuurrPL0Bk+0++Fjv8NWdVoi2HSVeGBdWag7APf6G51kxn8HLayEX42Ph/0L9sw=;
Received: from galois.linutronix.de ([193.142.43.55])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ovbFr-00BEVM-PL for kgdb-bugreport@lists.sourceforge.net;
 Thu, 17 Nov 2022 09:32:20 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1668677530;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iFIVJDRzYLM8JlLFrtE2EgsFESyY1Nn5OMC4RLGV2yY=;
 b=iO+tJagEFHt9sg3fABlDdYAV9ylNd2aGmxyQcShKySENThGFArqJQ8hgUGOE+R4GBPMfkg
 ImEl/eK0b6L/3MgkJEM2JaXlERewhhZemcHyk+o6A9rQxWGx4iKCWDl0X+Z/OVHiZNoYMx
 3nrH9Qr5h6bw8fCufJv+zAYIZkMqQXDiIeyRpTCPIrphe5LW29+Bd5T18kmjvyN4K1DovK
 vjQlkpgXI0+6G+E7K92dwR7/eoDunyq4Lu1Ual/ioE57tvDkwgVEuvKBlDtXSm/VNLTI50
 FkVxBD8AANMCAw3eKLoEOYgAiY8DDLzoaZGqiO2uz+SlM6Di6wkpUm3d0aN9VQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1668677530;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iFIVJDRzYLM8JlLFrtE2EgsFESyY1Nn5OMC4RLGV2yY=;
 b=4rm3sbLF/dC1nwbgx05ZOnnr6IRULStcUsiZpVrNglmTpyFibpYbmeCw1oeyHc8QZtkC1B
 XEAeOafHqjKRM1Bw==
To: Doug Anderson <dianders@chromium.org>
In-Reply-To: <CAD=FV=WHEjpL1VYnLRp9Vy300Xd3Tu=u3MOo_rvHCABDTsQFPA@mail.gmail.com>
References: <20221116162152.193147-1-john.ogness@linutronix.de>
 <20221116162152.193147-36-john.ogness@linutronix.de>
 <CAD=FV=WHEjpL1VYnLRp9Vy300Xd3Tu=u3MOo_rvHCABDTsQFPA@mail.gmail.com>
Date: Thu, 17 Nov 2022 10:38:07 +0106
Message-ID: <87tu2yncyw.fsf@jogness.linutronix.de>
MIME-Version: 1.0
X-Spam-Score: -1.9 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Doug, On 2022-11-16, Doug Anderson <dianders@chromium.org>
 wrote: >> @@ -463, 9 +464,
 14 @@ static void kgdboc_earlycon_pre_exp_handler(void)
 >> * serial drivers might be OK with this, print a warning once pe [...] 
 Content analysis details:   (-1.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.6 INVALID_DATE_TZ_ABSURD Invalid Date: header (timezone does not
 exist)
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: lwn.net]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [193.142.43.55 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1ovbFr-00BEVM-PL
Subject: Re: [Kgdb-bugreport] [PATCH printk v5 35/40] tty: serial: kgdboc:
 use srcu console list iterator
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
 Daniel Thompson <daniel.thompson@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, linux-serial@vger.kernel.org,
 Jason Wessel <jason.wessel@windriver.com>,
 kgdb-bugreport@lists.sourceforge.net, Thomas Gleixner <tglx@linutronix.de>,
 Jiri Slaby <jirislaby@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi Doug,

On 2022-11-16, Doug Anderson <dianders@chromium.org> wrote:
>> @@ -463,9 +464,14 @@ static void kgdboc_earlycon_pre_exp_handler(void)
>>          * serial drivers might be OK with this, print a warning once per
>>          * boot if we detect this case.
>>          */
>> -       for_each_console(con)
>> +       cookie = console_srcu_read_lock();
>> +       for_each_console_srcu(con) {
>>                 if (con == kgdboc_earlycon_io_ops.cons)
>> -                       return;
>> +                       break;
>> +       }
>> +       console_srcu_read_unlock(cookie);
>> +       if (con)
>> +               return;
>
> Is there truly any guarantee that "con" will be NULL if
> for_each_console_srcu() finishes naturally (AKA without a "break"
> being executed)?

Right now it is true because @con becoming NULL is the exit criteria for
the loop.

> It looks as if currently this will be true but nothing in the comments
> of for_each_console_srcu() nor hlist_for_each_entry_srcu() (which it
> calls) guarantees this, right? It would be nice if that was
> documented, but I guess it's not a huge deal.

Yes, if it is frowned upon that the iterator is used outside the loop,
it would be nice if the for_each macros explicitly provided some hints
in their documentation.

> Also: wasn't there just some big issue about people using loop
> iteration variables after the loop finished?
>
> https://lwn.net/Articles/885941/

Thanks for referencing that article! Indeed if the macros are changed so
that the iterator is defined in the loop, then code like this will
break. But I would expect that making such macro changes will also
require updating the call sites to avoid unused variables outside the
loops. And then this code could receive the appropriate fixup.

I feel like if I add extra code to guarantee a NULL without relying on
the macro implementation, I'll get more resistance due to unnecessarily
adding code and variables. But I may be wrong.

> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Thanks.

John


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
