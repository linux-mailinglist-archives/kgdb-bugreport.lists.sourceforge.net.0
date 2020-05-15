Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF971D55DD
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 15 May 2020 18:24:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jZd8T-0001qY-7m
	for lists+kgdb-bugreport@lfdr.de; Fri, 15 May 2020 16:24:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sergey.senozhatsky@gmail.com>) id 1jZd8R-0001qO-RX
 for kgdb-bugreport@lists.sourceforge.net; Fri, 15 May 2020 16:24:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:Date:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sBTKLmt+G7HKE9vsnUyZ/pBjQDTz5mLNOHvgITKgWpw=; b=GWDK0m5RkU92U7EkBsYWuoGhHD
 AK0bycX4VRYUrpWaRFZfaTL6efQ+8latrixx/5tPT3fdEf9f/QhidkmIcIByacZgGmzTvn5vtwaR6
 4Ztj3KO4h/Ke1qJN9YbEmF3OpOL8LGQzRubcMKIdB6v4GK2vpEtySKQvbO2zeyp2EIiU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :Date:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sBTKLmt+G7HKE9vsnUyZ/pBjQDTz5mLNOHvgITKgWpw=; b=hc25DbvFtIYgwBqdqINiT5H4cr
 T2nwh0fMy/jBkUhmuq9dTDVXHQHYSs4n8WQZIsLx6qLaa0yV2FrqrckBWwP75JEQDKE3QUcIKkFGx
 WDnoNDoPzhAX4mS5Di+P1G3R5iqzLv1jBK4TqBqmYfFncB4Pr8+IPzLlRmYns1SPR+GY=;
Received: from mail-pj1-f67.google.com ([209.85.216.67])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jZd8N-00BnuT-EJ
 for kgdb-bugreport@lists.sourceforge.net; Fri, 15 May 2020 16:24:31 +0000
Received: by mail-pj1-f67.google.com with SMTP id q9so1126374pjm.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 15 May 2020 09:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=sBTKLmt+G7HKE9vsnUyZ/pBjQDTz5mLNOHvgITKgWpw=;
 b=CLskbifdKA1sxChD1enuaKFOQbnss3tOHCsEiZ4/qCeEzKwZUx4Usa/XUEHGpON8xG
 DOdk4sAV+cPkbiUoibLugT7A/zsnG0evWVJ3xwixa22KFvsYOVmOYJLQBYrNSc4rg2yJ
 ljOmyD/lyrXvqp3w03OFmM0LHzDL52UNftl533zCX2DM5vOiDm9eAfzQXYtk6bW8elbZ
 WiNzbu3bqRryeFFPW35r45fSz+0WlbMHykM9Tni46GHymUCG0N7ZdxrAOiP/4Wu9GOA8
 4lOh0eJqUIcZf602d8tzWwp5+wvYSxsnUcyoFlPr+PkIsfylNVpiy1Fv44Nf3tOP1dSR
 EeCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=sBTKLmt+G7HKE9vsnUyZ/pBjQDTz5mLNOHvgITKgWpw=;
 b=cG31hFomRfX8TKI8R/7IHyUo68l6OHmhdqI7fBugHMz0uu4Vi2bfaiqZo4KH4tBhMl
 vjOzodUI+Zc4cn43BeLB/79SDgIyTeMqw+qs5ePAVfp7BfgsBO1BS+K+9zc2c0qgIjyZ
 8+IyYGMqjI8Fs4a3guLwqEQ0wpvjngREQSUVEZuPHyAgT0gz/Dw79MqTN8DazzzSADsn
 3R5dxYle/CAfLjkbYQFo37sSFS7qbhShLy6qPvkFWubcO7fP63uk7dYj0Aw8wXo0Vj2n
 Pl8hkfcZsLFvv1CDnv0wER1dvNFc49/MhCyXbNC6sHVIjHmWtttkdv95idEHuwHee/bJ
 ZSPg==
X-Gm-Message-State: AOAM5338xhtJCsJbo+psD/p0ZVRULuD4FVt9cY/eZnj0jAcD0o6jojJd
 T6L7122D0JdT3Euwe4ipNbI=
X-Google-Smtp-Source: ABdhPJzx+Wb6AfvgkPn2XQYnDHbXF/JdhBJc3pruDkdEXckBhHQw0i+88iL1U+MzrUekw2Ab0248YA==
X-Received: by 2002:a17:90b:692:: with SMTP id
 m18mr4389199pjz.39.1589559854562; 
 Fri, 15 May 2020 09:24:14 -0700 (PDT)
Received: from localhost ([2409:10:2e40:5100:6e29:95ff:fe2d:8f34])
 by smtp.gmail.com with ESMTPSA id j23sm1914714pjz.13.2020.05.15.09.24.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2020 09:24:13 -0700 (PDT)
From: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
X-Google-Original-From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Date: Sat, 16 May 2020 01:24:11 +0900
To: Daniel Thompson <daniel.thompson@linaro.org>
Message-ID: <20200515162411.GG42471@jagdpanzerIV.localdomain>
References: <1589273314-12060-1-git-send-email-sumit.garg@linaro.org>
 <20200512142533.ta4uejwmq5gchtlx@holly.lan>
 <CAFA6WYOV7oPbYE=9fXueYMacb5wv0r9T6F8tmECt-Eafe-fctw@mail.gmail.com>
 <20200514084230.GO17734@linux-b0ei>
 <CAFA6WYPSsgdAB-wJC0e2YkVkW0XsqQsu5wrn4iB4M-cwvS7z2g@mail.gmail.com>
 <20200515085021.GS17734@linux-b0ei>
 <20200515103308.GD42471@jagdpanzerIV.localdomain>
 <20200515134806.5cw4xxnxw7k3223l@holly.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200515134806.5cw4xxnxw7k3223l@holly.lan>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (sergey.senozhatsky[at]gmail.com)
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.67 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.216.67 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jZd8N-00BnuT-EJ
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
 Petr Mladek <pmladek@suse.com>, Peter Zijlstra <peterz@infradead.org>,
 kgdb-bugreport@lists.sourceforge.net, Steven Rostedt <rostedt@goodmis.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Jason Wessel <jason.wessel@windriver.com>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On (20/05/15 14:48), Daniel Thompson wrote:
> On Fri, May 15, 2020 at 07:33:08PM +0900, Sergey Senozhatsky wrote:
> > On (20/05/15 10:50), Petr Mladek wrote:

[..]

> > Is this guaranteed that we never execute this path from NMI?
> 
> Absolutely not.
> 
> The execution context for kdb is pretty much unique...

OK, that was what I expected.

> we are running a debug mode with all CPUs parked in a holding loop with
> interrupts disabled. One CPU is at an unknown exception state and the
> others are either handling an IRQ or NMI depending on architecture[1].

Can a CPU be parked while holding the console driver port lock?

Hmm, a side note - this also means that we cannot handle it from
poll-ing console drivers and need to switch to direct console writes.

> However there are a number of factors that IMHO weigh in favour of
> allowing kdb to intercept here.
> 
> 1. kgdb/kdb are designed to work from NMI, modulo the bugs that are
>    undoubtedly present.
> 
> 2. A synchronous breakpoint (including an implicit breakpoint-on-oops)
>    from any code that executes with irqs disabled will exhibit most of
>    the same problems as an NMI but without waking up all the NMI logic.
> 
> 3. kdb_trap_printk is only set for *very* narrow time intervals by the
>    debug master (the single CPU in the system that is *not* in a
>    holding loop). Thus in all cases the system has already successfully
>    executed kdb_printf() several times before we ever call the printk()
>    interception code.
> 
>    Or put another way, even if we did tickle a bug speculated about in
>    #1, it won't be the call to printk() that triggers it; we'd never
>    get that far!

OK. I would appreciate a more detailed commit message:
- what do we fix, and what risks do we take. Just for the record.

+ a small nit: looking at for_each_console() loop -- not all consoles
can be invoked at any time and not all consoles are enabled at any time.
You _probably_ might want to do what printk does in call_console_drivers()
loop. printk also had problems with console callbacks being placed in
sections that get discarded, but that's way too niche.

	-ss


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
