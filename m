Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE371F6311
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 11 Jun 2020 09:58:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jjI6Z-0005kW-7w
	for lists+kgdb-bugreport@lfdr.de; Thu, 11 Jun 2020 07:58:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <pmladek@suse.com>) id 1jjI6Y-0005kP-Le
 for kgdb-bugreport@lists.sourceforge.net; Thu, 11 Jun 2020 07:58:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=J9KeEO9nXTH4wlQRy4lLzmAxeIVSxlpsHbubuSb/JnA=; b=iX76HR2PsWSb/p+qWzbcfC/0aw
 +2RAI9IzoWZnhTxE00wUQjJ8bCpurzLLKttPVCHgkId1GMVAu3+VWRpqFftMSpJIjhWLI0oI5jFli
 E8mbBHXK3XBHuFhDgCo/Pd2xRvpLgInGsJkJbqZVrOwpDgPEqBvuMfXgXL63WmoZiuhg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=J9KeEO9nXTH4wlQRy4lLzmAxeIVSxlpsHbubuSb/JnA=; b=FxFsog/P28t+APHxLZaNw34qPh
 yR+5iEm2vVEVm8cMSrMWEEpsCFCu9+u7DgojZAh1Am9SYqdeCqJ9j6/v6g6wJW2GpgZXe9BB/Xj0s
 SMSmZhhwOo/kppIUl36M1pyxaGVxRPhkrtoP0BAeK3dXf0lQ8HAWUQ8NCz9Olo/zmHLQ=;
Received: from mx2.suse.de ([195.135.220.15])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jjI6X-001ng0-0D
 for kgdb-bugreport@lists.sourceforge.net; Thu, 11 Jun 2020 07:58:30 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D33BBACF9;
 Thu, 11 Jun 2020 07:58:23 +0000 (UTC)
Date: Thu, 11 Jun 2020 09:58:18 +0200
From: Petr Mladek <pmladek@suse.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
Message-ID: <20200611075818.GC6581@linux-b0ei>
References: <1589273314-12060-1-git-send-email-sumit.garg@linaro.org>
 <20200512142533.ta4uejwmq5gchtlx@holly.lan>
 <CAFA6WYOV7oPbYE=9fXueYMacb5wv0r9T6F8tmECt-Eafe-fctw@mail.gmail.com>
 <20200514084230.GO17734@linux-b0ei>
 <CAFA6WYPSsgdAB-wJC0e2YkVkW0XsqQsu5wrn4iB4M-cwvS7z2g@mail.gmail.com>
 <20200515085021.GS17734@linux-b0ei>
 <20200515103308.GD42471@jagdpanzerIV.localdomain>
 <CAFA6WYOBsimP1j8Fwq4OcePEug4MGoaY3wTTTVydHtTphZ-FTw@mail.gmail.com>
 <20200515163638.GI42471@jagdpanzerIV.localdomain>
 <20200610164140.tgzcn5oip2gzgmze@holly.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200610164140.tgzcn5oip2gzgmze@holly.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: lkml.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [195.135.220.15 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jjI6X-001ng0-0D
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
Cc: John Ogness <john.ogness@linutronix.de>, Arnd Bergmann <arnd@arndb.de>,
 Peter Zijlstra <peterz@infradead.org>, kgdb-bugreport@lists.sourceforge.net,
 Steven Rostedt <rostedt@goodmis.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Jason Wessel <jason.wessel@windriver.com>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Wed 2020-06-10 17:41:40, Daniel Thompson wrote:
> On Sat, May 16, 2020 at 01:36:38AM +0900, Sergey Senozhatsky wrote:
> > On (20/05/15 17:32), Sumit Garg wrote:
> > > > Can I please have some context what problem does this solve?
> > > 
> > > You can find the problem description here [1] which leads to this fix.
> > 
> > [..]
> > 
> > > [1] https://lkml.org/lkml/2020/5/12/213
> > 
> > Thanks for the link. I'm slightly surprised it took so many years
> > to notice the addition of printk_nmi/printk_safe :)
> 
> Rather by coincidence (at least I think its a coincidence) the problem
> has recently become much more obvious.
> 
> 0d00449c7a28 ("x86: Replace ist_enter() with nmi_enter()") just brought
> this to the surface by treating debug traps as NMIs. This means the CPU
> that takes a breakpoint, and where almost all of the kdb printk() calls
> take place, will now unconditionally have printk() interception enabled.

Mea culpa. I have marked this patch as proceed by mistake. It has got
enough acks and is ready for 5.8.

I have just commited the patch into printk/linux.git,
branch for-5.8-kdb-nmi.

I am going to push it to Linus when it passes linux-next integration,
hopefully tomorrow.

Thanks a lot for poking me.

Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
