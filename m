Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A8F1D4D51
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 15 May 2020 14:03:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jZZ3g-0004bU-3m
	for lists+kgdb-bugreport@lfdr.de; Fri, 15 May 2020 12:03:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1jZZ3e-0004b2-Tj
 for kgdb-bugreport@lists.sourceforge.net; Fri, 15 May 2020 12:03:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EQ+MSLCM1FfK9aeAp+m5Aux8g42PMTCx+zx8TzWAujU=; b=KFsnCyVfYmiNAWHaOI3/dmmAK8
 pIrbmX7ilR3xI+gD0C6U+Pr14SWSEQEGGPtQfbu2T/aVrJnQyK1DRCJiTWManXoc282WaUM8DSQ1J
 AaskNrFDQ6764NzDPbz8JSckWQ8WXXDQjxYaqdDOGBENUDLzMADnRr0dAez3/Rgerq8w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EQ+MSLCM1FfK9aeAp+m5Aux8g42PMTCx+zx8TzWAujU=; b=DVp6DsWvArYkw8HAZfmWnyTw57
 rATKInlM7efjTsqRkhT9hCWoehiwq1TH+K/6aaF0QMxUfliFwqs6RAoy4juPMnlGu1rrD9MUEkua7
 dLuJpvkPPdiJyl5TYvqYsCGI2mFjHxpLwvXFXrIS+2CMo7UkqPYo78no5dZi5oGFrd84=;
Received: from mail-lf1-f68.google.com ([209.85.167.68])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jZZ3a-00BYyS-Ml
 for kgdb-bugreport@lists.sourceforge.net; Fri, 15 May 2020 12:03:18 +0000
Received: by mail-lf1-f68.google.com with SMTP id 202so1599379lfe.5
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 15 May 2020 05:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EQ+MSLCM1FfK9aeAp+m5Aux8g42PMTCx+zx8TzWAujU=;
 b=xa/ToNKhDgoNnwHQ4aUO++Zmfp93IQTCpctnvYKOZTbKBjg4xMYYskVBTSvr6nAvHB
 nSvIi9FkaPBtSTQ8y4plyLib2B0RhtLzqYFSD23tagBV9eqEGUReK2mo0tGa04bkpH6F
 kx89QudofULMU8FOht++19CTimQ6s1VSdFX6FSM0rppyILJa27wxE0+p5ybtCfqDM9aw
 WTT0vmim8nrF7cL1Gg9TlQ2CGoMYrzR9vp6XWSwcJJ/wkDLgKalGQRbshmbEsLVKmBh9
 9QOFJhDh4wlFTH0i3xmcIe6+CC4xM1YhY6RCVFN9JYlrzO/p9qVwmIDDkTl2PHUAC841
 dkrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EQ+MSLCM1FfK9aeAp+m5Aux8g42PMTCx+zx8TzWAujU=;
 b=aSl9HlxzwBg3x5cT0+kYRwPUaSs/kFwstLWslZSmpeZ1Mxo/iNxq5tGL9K1U+5+1kH
 jypd061Z0/XnDTrSCG+gYoudIaOnE4EOy9ZjJH/JlDqle5y3829y4lBkOiiiItUHERyI
 fJbTLCwVJjRifnS4PfIchD0bl08SVcWQDC2CNgirB1W2ufHxMBmI7SgJUIRD2OV5ncFd
 jGhUwZrzn0BJbU2V7mIJEpTQYxBPdSAL44xfPbcSLDl38JhB7MU/PyrJEefxA8Lc0Z5O
 JHxCIiimaf1B4O2bc3auVm42jWpPu15vACCo5TntfTc1WZ2NYLTncgA2zEdAaWHVHPv7
 h4EQ==
X-Gm-Message-State: AOAM531Y1cnsUVgHN09KaNG3xi3MrN8EWbNSoM3mEQsUCigCUdUWom3J
 N9caTxaHQf7lPyjfYiqBLVQc+hRdAP/cl6tBBUuVwg==
X-Google-Smtp-Source: ABdhPJxhjqyZuPv0g6tGQeX8avCQMuPxQ1puafxoJ2BIH6FH5f31nNyevbuV+JgQFuHftu6ozilQnnji5MzHoFv4e2U=
X-Received: by 2002:ac2:4293:: with SMTP id m19mr2245484lfh.204.1589544187846; 
 Fri, 15 May 2020 05:03:07 -0700 (PDT)
MIME-Version: 1.0
References: <1589273314-12060-1-git-send-email-sumit.garg@linaro.org>
 <20200512142533.ta4uejwmq5gchtlx@holly.lan>
 <CAFA6WYOV7oPbYE=9fXueYMacb5wv0r9T6F8tmECt-Eafe-fctw@mail.gmail.com>
 <20200514084230.GO17734@linux-b0ei>
 <CAFA6WYPSsgdAB-wJC0e2YkVkW0XsqQsu5wrn4iB4M-cwvS7z2g@mail.gmail.com>
 <20200515085021.GS17734@linux-b0ei>
 <20200515103308.GD42471@jagdpanzerIV.localdomain>
In-Reply-To: <20200515103308.GD42471@jagdpanzerIV.localdomain>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Fri, 15 May 2020 17:32:56 +0530
Message-ID: <CAFA6WYOBsimP1j8Fwq4OcePEug4MGoaY3wTTTVydHtTphZ-FTw@mail.gmail.com>
To: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.68 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.68 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jZZ3a-00BYyS-Ml
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
Cc: Petr Mladek <pmladek@suse.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 John Ogness <john.ogness@linutronix.de>, Arnd Bergmann <arnd@arndb.de>,
 Peter Zijlstra <peterz@infradead.org>, kgdb-bugreport@lists.sourceforge.net,
 Steven Rostedt <rostedt@goodmis.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi Sergey,

On Fri, 15 May 2020 at 16:03, Sergey Senozhatsky
<sergey.senozhatsky@gmail.com> wrote:
>
> On (20/05/15 10:50), Petr Mladek wrote:
> > kdb is able to stop kernel even in NMI context where printk() is redirected
> > to the printk_safe() lockless variant. Move the check and redirect to kdb
> > even in this case.
>
> Can I please have some context what problem does this solve?

You can find the problem description here [1] which leads to this fix.

> I can see that vkdb_printf() calls into console drivers:
>
>         for_each_console(c) {
>                 c->write(c, cp, retlen - (cp - kdb_buffer));
>                 touch_nmi_watchdog();
>         }
>
> Is this guaranteed that we never execute this path from NMI?

Yes the above code could run in NMI context but it will only run after
we stop the kernel (drop into debugger) and on a single CPU at a time.
AFAIK, we drop into the debugger either via sysrq or during
oops_in_progress. So I think it should be a lockless entry into the
console driver for write operations.

TBH, it's very much possible that I may miss some aspect. So please
feel free to correct me.

[1] https://lkml.org/lkml/2020/5/12/213

-Sumit

> If so, can this please be added to the commit message? A more
> detailed commit message will help a lot.
>
>         -ss


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
