Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 538D81D4F7C
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 15 May 2020 15:48:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jZahe-0002jj-5S
	for lists+kgdb-bugreport@lfdr.de; Fri, 15 May 2020 13:48:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1jZahc-0002jc-Lt
 for kgdb-bugreport@lists.sourceforge.net; Fri, 15 May 2020 13:48:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3qkYfWFETK6zBf4wXa1Hi398hQXeE5GebQwhI+ncIdg=; b=YRR3TDOpNFORA9jcJK3RcN3XH+
 8MyUrGh/7bdCqTKojOg4tRDdIvCGq3YHgNpA7RQ4DbNgmP8bBdvGCd9xsOn1/bvYiTnp9W8xYavEv
 nX90OK9gNO2ovLZXSoe7XsoZEg/vK5YB+I57+8VN/a58dfgrKLWcxm/U6JIBBS0q+BWk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3qkYfWFETK6zBf4wXa1Hi398hQXeE5GebQwhI+ncIdg=; b=T7DAKx2Ecbq5fd5UvwKNP44oF/
 YLQ56EbVAisiMAF6wSU3f3Ystel08naDPjkne2ZctH3rScoMWbprVfzQQOGxLoBJ9Ci+4ENw6rlY4
 pIRr5xZmajU6TIfw+NdErXuFbpMnvZrqnO5+PIuXbHEaNI9vSKSMMR3EUquwQnGinxaI=;
Received: from mail-wm1-f68.google.com ([209.85.128.68])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jZahU-00HUlr-3a
 for kgdb-bugreport@lists.sourceforge.net; Fri, 15 May 2020 13:48:40 +0000
Received: by mail-wm1-f68.google.com with SMTP id z72so2752152wmc.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 15 May 2020 06:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=3qkYfWFETK6zBf4wXa1Hi398hQXeE5GebQwhI+ncIdg=;
 b=eZtjbP6NRTFnwBBzAQ/7vAIDOd0g+tBLTmdd6At7C7aKYpemjjiVaON1bhVUUka4xC
 fdspZ0DuMKB3IXzMrf+3fR3wLygypG8KaN12CdmaGZQ2FmwH8pUXNlPKBbDgCvg+59/j
 zdeM6ghctOvVndEqGsVetE7otExcx/34sd2COmwwEw61Dpsn5VAnv01ICh9OtH7azKr5
 zBESlD1TJsEj1W/APW4a22VPev9cTkzEPtO03frS2BuR/1czA3sk57k9hWopVbsnhyG9
 wqtB3qgQZXTGqNyRM5daJvWnvCqQLbaNTpxQNJZCUtyDUArxuTHxqwaKZ6mT9iu9bYfs
 5B3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3qkYfWFETK6zBf4wXa1Hi398hQXeE5GebQwhI+ncIdg=;
 b=jmTFSrqIyCmKINHLntquRsygqVc8m3T0pC4fgh4jzTsxC/ltzT+gOw31uz4iLMhg5Y
 AOqTlAO3WPOcE4lNAcIz0bHgV5ruLBwQgkIUvdI6ZRu5MHH/NQrUii1QJsZHMddo5hk2
 Z++MlnjyvkyA7cvzMC0jk3GN0ZnDqgJEb9bc0fRPa3q712QqP+Ah0dUWVE582ud/iJhq
 mPEdPDe/BDooWb0dGcnRwFwwmep7Ej+t+661qd5YOjFha6oaQIs91YGlxoGbzFywZ99N
 caB1Ve9PbJfZhCFa+6fjwQkpT4TZYudvt8forCD8VYSox0msYQCkUoMABh1oBI3IV5Ov
 MOkA==
X-Gm-Message-State: AOAM532de4H8+9yZTguxvbbcgBq4JukE70fFsqnLYrzSN1bhEvEGh0eD
 Ko6MsuTi4BH0oICAuodG/Fg9eA==
X-Google-Smtp-Source: ABdhPJzqCP16mihqtDEJGuadqt0+54o3/v4lzS/VEwkSC5lwNA/9e1HsDMpU5KA7xPyOK2gQe0cgwQ==
X-Received: by 2002:a1c:a952:: with SMTP id s79mr4008010wme.153.1589550489338; 
 Fri, 15 May 2020 06:48:09 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id s12sm3556478wmc.7.2020.05.15.06.48.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2020 06:48:08 -0700 (PDT)
Date: Fri, 15 May 2020 14:48:06 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Message-ID: <20200515134806.5cw4xxnxw7k3223l@holly.lan>
References: <1589273314-12060-1-git-send-email-sumit.garg@linaro.org>
 <20200512142533.ta4uejwmq5gchtlx@holly.lan>
 <CAFA6WYOV7oPbYE=9fXueYMacb5wv0r9T6F8tmECt-Eafe-fctw@mail.gmail.com>
 <20200514084230.GO17734@linux-b0ei>
 <CAFA6WYPSsgdAB-wJC0e2YkVkW0XsqQsu5wrn4iB4M-cwvS7z2g@mail.gmail.com>
 <20200515085021.GS17734@linux-b0ei>
 <20200515103308.GD42471@jagdpanzerIV.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200515103308.GD42471@jagdpanzerIV.localdomain>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.68 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.68 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jZahU-00HUlr-3a
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

On Fri, May 15, 2020 at 07:33:08PM +0900, Sergey Senozhatsky wrote:
> On (20/05/15 10:50), Petr Mladek wrote:
> > kdb is able to stop kernel even in NMI context where printk() is redirected
> > to the printk_safe() lockless variant. Move the check and redirect to kdb
> > even in this case.
> 
> Can I please have some context what problem does this solve?
> I can see that vkdb_printf() calls into console drivers:
> 
> 	for_each_console(c) {
> 		c->write(c, cp, retlen - (cp - kdb_buffer));
> 		touch_nmi_watchdog();
> 	}
> 
> Is this guaranteed that we never execute this path from NMI?

Absolutely not.

The execution context for kdb is pretty much unique... we are running a
debug mode with all CPUs parked in a holding loop with interrupts
disabled. One CPU is at an unknown exception state and the others are
either handling an IRQ or NMI depending on architecture[1].

However there are a number of factors that IMHO weigh in favour of
allowing kdb to intercept here.

1. kgdb/kdb are designed to work from NMI, modulo the bugs that are
   undoubtedly present.

2. A synchronous breakpoint (including an implicit breakpoint-on-oops)
   from any code that executes with irqs disabled will exhibit most of
   the same problems as an NMI but without waking up all the NMI logic.

3. kdb_trap_printk is only set for *very* narrow time intervals by the
   debug master (the single CPU in the system that is *not* in a
   holding loop). Thus in all cases the system has already successfully
   executed kdb_printf() several times before we ever call the printk()
   interception code.

   Or put another way, even if we did tickle a bug speculated about in
   #1, it won't be the call to printk() that triggers it; we'd never
   get that far!


> If so, can this please be added to the commit message? A more
> detailed commit message will help a lot.

I suspect Petr might prefer any future flames about kdb_printf() to be
pointed at me rather than him ;-) so if adding anything to the commit
message then I'd suggest it be based on the reasoning in #3 above.


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
