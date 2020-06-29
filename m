Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E08C620CFBA
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 29 Jun 2020 17:38:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jpvrG-00084P-O5
	for lists+kgdb-bugreport@lfdr.de; Mon, 29 Jun 2020 15:38:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1jpvrF-00084C-8C
 for kgdb-bugreport@lists.sourceforge.net; Mon, 29 Jun 2020 15:38:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ShhE7g5SJz1A2LdeoWPLePC7l35fgsx0zx/wDQfKJTI=; b=LvROQi8BR9yLKaKOzxEAYbg1oM
 OWvfJQlesjRdVwCAtGpyjLKFmaE1PPDqhsFwl8WivCsxr96EOwVSfvwKBIkyleAumMWZ1V4zv5GnR
 eXJsiv1CpfPdVF5AbXjSLNERILjJYNVGZccHnPhYQffcwVK90f9Ws3xyQqZmfs0hgqBQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ShhE7g5SJz1A2LdeoWPLePC7l35fgsx0zx/wDQfKJTI=; b=jBSGf0DW2Re3TbvMoCEb7mdfeA
 YGFX7229KAM09liCRzP3Dd1KuFg3MAW1TWZ5j62jKhZbfebQGVvW6y6tKGYdSynFCaO/HwH2MVr9+
 6ogyEju12QJ8m8lGCWO4XBtlyciSOdv6MIXn7SsO1Q0yNJEt1msf7DnL5w7lDrBkzg6Q=;
Received: from mail-wr1-f65.google.com ([209.85.221.65])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jpvrB-002BAr-2C
 for kgdb-bugreport@lists.sourceforge.net; Mon, 29 Jun 2020 15:38:09 +0000
Received: by mail-wr1-f65.google.com with SMTP id f7so14002774wrw.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 29 Jun 2020 08:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ShhE7g5SJz1A2LdeoWPLePC7l35fgsx0zx/wDQfKJTI=;
 b=xabakTlTYmtpEyDxEa7yDPe7DMOMxN6AqQMck23F6MmQi9YTgUxfraCYFu3KPQ6uEA
 Nzx5KBfZrhmF1SeYQT4keNVs3KIGJgsAO1wgjGE1ivCJ5Zk4OLRKDiv3SFXo716cfv/c
 ijch2hqp6P7/zzg06QYa5s+GF+US5RChmsNGKhdxI6sXjB3DL5SEtIX08aSAsOHEfAph
 Qf5L18elCCk1rY2JVhBJ3DCM9GYN/WWvTApmKdlO88JWK6SRzXr0nmP0/opCQPi0EUKg
 MVydtly7U8O3gokNeY3QDC1FhZj9TCINr5JntGlRrd8mc9X5Ym2p17ZeQuVSl8xRmDol
 L32w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ShhE7g5SJz1A2LdeoWPLePC7l35fgsx0zx/wDQfKJTI=;
 b=kvEAuNmE409DT09uFepbgZg/67Ydry7rgWVcNwkoJWAqEaXgJnefTXQcMWHImXQ733
 Qm1RhKlfyxBIuUY5Q4jj1AhzfTuSz5oT+VZ0iUN544L+jmnGUZ2QC/nvBOGF7atdzgEv
 8t23N2feHct+Ua9fx+4jWm0J8kbjaWgIm9qn6okxGhWRuZB6UanzLDZhi4z6RkaPVbXw
 RGGwm3t5LyMxJ4P8RF843ZrBsI5gusudv/h+vMmdKVCeiRpkhHumM8JHfnndQQrSNcsP
 QktlgKvVVt0ZKHiGgyvLb+FSN599oWEpnaWnah0pdMRtRl1WyGL/whtX/s5fL5myWu2v
 lVfQ==
X-Gm-Message-State: AOAM532fhm6naGnlMLTSyT+AbyHVVsg6MaEcGiRXjRPmh+3vWD+aMmrj
 uwIwsePONSfQPNp8fAE2aWQh5w==
X-Google-Smtp-Source: ABdhPJzWB6poC4LpTU3NkcmJJ1oY9B/oljvOMDKa4t38dBstjpwMNtrI5BzUy3wr3kxD0q7Ug0kRnw==
X-Received: by 2002:a5d:4051:: with SMTP id w17mr16754914wrp.183.1593445078758; 
 Mon, 29 Jun 2020 08:37:58 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id v18sm105056wrv.49.2020.06.29.08.37.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 08:37:58 -0700 (PDT)
Date: Mon, 29 Jun 2020 16:37:56 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Petr Mladek <pmladek@suse.com>
Message-ID: <20200629153756.cxg74nec3repa4lu@holly.lan>
References: <20200629135923.14912-1-cengiz@kernel.wtf>
 <20200629145020.GL6156@alley>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200629145020.GL6156@alley>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.65 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.65 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jpvrB-002BAr-2C
Subject: Re: [Kgdb-bugreport] [PATCH] kdb: prevent possible null deref in
 kdb_msg_write
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
Cc: kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 Jason Wessel <jason.wessel@windriver.com>, Cengiz Can <cengiz@kernel.wtf>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Mon, Jun 29, 2020 at 04:50:20PM +0200, Petr Mladek wrote:
> On Mon 2020-06-29 16:59:24, Cengiz Can wrote:
> > `kdb_msg_write` operates on a global `struct kgdb_io *` called
> > `dbg_io_ops`.
> > 
> > Although it is initialized in `debug_core.c`, there's a null check in
> > `kdb_msg_write` which implies that it can be null whenever we dereference
> > it in this function call.
> > 
> > Coverity scanner caught this as CID 1465042.
> > 
> > I have modified the function to bail out if `dbg_io_ops` is not properly
> > initialized.
> > 
> > Signed-off-by: Cengiz Can <cengiz@kernel.wtf>
> > ---
> >  kernel/debug/kdb/kdb_io.c | 15 ++++++++-------
> >  1 file changed, 8 insertions(+), 7 deletions(-)
> > 
> > diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
> > index 683a799618ad..85e579812458 100644
> > --- a/kernel/debug/kdb/kdb_io.c
> > +++ b/kernel/debug/kdb/kdb_io.c
> > @@ -549,14 +549,15 @@ static void kdb_msg_write(const char *msg, int msg_len)
> >  	if (msg_len == 0)
> >  		return;
> >  
> > -	if (dbg_io_ops) {
> > -		const char *cp = msg;
> > -		int len = msg_len;
> > +	if (!dbg_io_ops)
> > +		return;
> 
> This looks wrong. The message should be printed to the consoles
> even when dbg_io_ops is NULL. I mean that the for_each_console(c)
> cycle should always get called.
> 
> Well, the code really looks racy. dbg_io_ops is set under
> kgdb_registration_lock. IMHO, it should also get accessed under this lock.
> 
> It seems that the race is possible. kdb_msg_write() is called from
> vkdb_printf(). This function is serialized on more CPUs using
> kdb_printf_cpu lock. But it is not serialized with
> kgdb_register_io_module() and kgdb_unregister_io_module() calls.

We can't take the lock from the trap handler itself since we cannot
have spinlocks contended between regular threads and the debug trap
(which could be an NMI).

Instead, the call to kgdb_unregister_callbacks() at the beginning
of kgdb_unregister_io_module() should render kdb_msg_write()
unreachable prior to dbg_io_ops becoming NULL.

As it happens I am starting to believe there is a race in this area but
the race is between register/unregister calls rather than against the
trap handler (if there were register/unregister races then the trap
handler is be a potential victim of the race though).


> But I might miss something. dbg_io_ops is dereferenced on many other
> locations without any check.

There is already a paranoid "just in case there are bugs" check in
kgdb_io_ready() so in any case I think the check in kdb_msg_write() can
simply be removed.

As I said in my other post, if dbg_io_ops were ever NULL then the
system is completely hosed anyway: we can never receive the keystroke
needed to leave the debugger... and may not be able to tell anybody
why.


> >  
> > -		while (len--) {
> > -			dbg_io_ops->write_char(*cp);
> > -			cp++;
> > -		}
> > +	const char *cp = msg;
> > +	int len = msg_len;
> > +
> > +	while (len--) {
> > +		dbg_io_ops->write_char(*cp);
> > +		cp++;
> >  	}
> >  
> >  	for_each_console(c) {
> 
> You probably got confused by this new code:
> 
> 		if (c == dbg_io_ops->cons)
> 			continue;
> 
> It dereferences dbg_io_ops without NULL check. It should probably
> get replaced by:
> 
> 		if (dbg_io_ops && c == dbg_io_ops->cons)
> 			continue;
> 
> Daniel, Sumit, could you please put some light on this?

As above, I think the NULL check that confuses coverity can simply be
removed.


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
