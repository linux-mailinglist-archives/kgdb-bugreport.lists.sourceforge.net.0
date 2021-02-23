Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E4F322ADA
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 23 Feb 2021 13:55:07 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1lEXDW-00058u-16
	for lists+kgdb-bugreport@lfdr.de; Tue, 23 Feb 2021 12:55:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1lEXDV-00058n-0P
 for kgdb-bugreport@lists.sourceforge.net; Tue, 23 Feb 2021 12:55:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vbdKltIhts0axs04YJ9CyEwqeT/nW8/5+MCqaVe0TFs=; b=Ad4IjaM+seQZHLHISses3D+Xp1
 7+2poOq7D2p1OcF96xB3Eu8n+O9XJqYh3SPuM0vv23v2E5TVIGg3ALVMjy1DbS39Hs3OwU9TyzKmS
 Cangz3mLToLEwiO8ZPETROCwFjKGktyALUSasm4WSNczhcZOr678MoSwyDuZ5y5CU/S4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vbdKltIhts0axs04YJ9CyEwqeT/nW8/5+MCqaVe0TFs=; b=mcZmgTI5c/D5/R0iTkw/SP/zl8
 4KknYjmXQHwpvjtM1grC2WoV1L+8ccIRrJNalowiwHEf4w9rtZYbima3QuC39a2I16sNjPcvGAKRq
 WMv00UA37d5XEOAmca9QFjUyrArat09JNk9YkAJwUT9mTTx1ECS62Q6oCFOSRZp1ZrKc=;
Received: from mail-wr1-f52.google.com ([209.85.221.52])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1lEXDM-002Swt-Po
 for kgdb-bugreport@lists.sourceforge.net; Tue, 23 Feb 2021 12:55:04 +0000
Received: by mail-wr1-f52.google.com with SMTP id l12so22468658wry.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 23 Feb 2021 04:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=vbdKltIhts0axs04YJ9CyEwqeT/nW8/5+MCqaVe0TFs=;
 b=hi2QVr3GmBlp8a2HbGiRh3SUPtZz5nr6+oD8MZzDNjFHEfWayB7cxB0mlc1jD+wj5V
 3v4cO1xGluyMynbmjLCUSZBvsmeNG5yBZGJZOTWVs8iG+gydyCS9Ge6d1U95q/y7qKOw
 F0BYpY6lpM114H/vDqCKhJWMn6lBVX492HJ/HYvnN9S65dIW0GW1Zyv6oqmXC5QP28fr
 btx8vqeNm9RtXSYJzKkuseVk03ZM7lIq8bxs1A+UtKnYOA6tdErmpcFvhLorJfI6blNh
 uNfhp8lJN/WPTOMMmJJDxHc/lTx0NvQxkGcOXKte5gJy7x4dmy/hTBkplKtNEhJdPB+6
 mqEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vbdKltIhts0axs04YJ9CyEwqeT/nW8/5+MCqaVe0TFs=;
 b=rX4zfKSLQYAimrnTNbYcc9uG1kkrUtV9Cz/x8zD3vkQ8f0ZbweN2lfv23a8sojmVW3
 ORMClWn/35Aav005kZfPzJfqyfpP88OE/cplAvyk3llcWwzHXc+9klBkb6QhZPwPBEl/
 twBOblk6N1fQxaz7jmg+L4A9uWHDcOL0TQOferqWTvDzvjNHQhDjF44j0toj34s1Atrr
 BFOjjMUt4cvI1d41uP3UVb/xCjEDtMW4wz3I3ZoStUgvrJTlH2/77ohzwurB3UolbgxZ
 aHN8KlVNqsQ9ayhhjUxFNepUtBQV/kGjBgNRIm1OsXHCGVzIa/mjxXL0gPdPvSn2/WLc
 MAYQ==
X-Gm-Message-State: AOAM531bAXglPkkoDOKu5FoID4Pq97XZc90IKNr7KDPFEoBkp6vyE5hX
 jL755ao+9/o0FYvDEFYrLZ+60Q==
X-Google-Smtp-Source: ABdhPJxzRPhgsCy8jymXBxDG1BSUYj/hDljC3z3J2iMGk8hfjX1fNqcWgIKlNn6pHngZYhVcLE0+GQ==
X-Received: by 2002:a5d:4842:: with SMTP id n2mr14699171wrs.181.1614084890338; 
 Tue, 23 Feb 2021 04:54:50 -0800 (PST)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id k1sm31919995wrx.77.2021.02.23.04.54.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Feb 2021 04:54:49 -0800 (PST)
Date: Tue, 23 Feb 2021 12:54:47 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Sumit Garg <sumit.garg@linaro.org>
Message-ID: <20210223125447.7penkj42hd6ito4i@maple.lan>
References: <1613721694-16418-1-git-send-email-sumit.garg@linaro.org>
 <CAD=FV=X1hsFf08J5JNifzFGw=1ikmXj2mp6K=KMOAzCYDWKZUw@mail.gmail.com>
 <CAFA6WYO0PkbpXUJp9jayb71LsydpnHfLFyc21bHotC1dLJ7Dhg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFA6WYO0PkbpXUJp9jayb71LsydpnHfLFyc21bHotC1dLJ7Dhg@mail.gmail.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.52 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.52 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1lEXDM-002Swt-Po
Subject: Re: [Kgdb-bugreport] [PATCH] kernel: debug: Handle breakpoints in
 kernel .init.text section
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
Cc: Peter Zijlstra <peterz@infradead.org>, kgdb-bugreport@lists.sourceforge.net,
 LKML <linux-kernel@vger.kernel.org>, qy15sije@cip.cs.fau.de,
 Jason Wessel <jason.wessel@windriver.com>, stefan.saecherl@fau.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Tue, Feb 23, 2021 at 02:33:50PM +0530, Sumit Garg wrote:
> Thanks Doug for your comments.
> 
> On Tue, 23 Feb 2021 at 05:28, Doug Anderson <dianders@chromium.org> wrote:
> > > To be clear there is still a very small window between call to
> > > free_initmem() and system_state = SYSTEM_RUNNING which can lead to
> > > removal of freed .init.text section breakpoints but I think we can live
> > > with that.
> >
> > I know kdb / kgdb tries to keep out of the way of the rest of the
> > system and so there's a bias to just try to infer the state of the
> > rest of the system, but this feels like a halfway solution when really
> > a cleaner solution really wouldn't intrude much on the main kernel.
> > It seems like it's at least worth asking if we can just add a call
> > like kgdb_drop_init_breakpoints() into main.c.  Then we don't have to
> > try to guess the state...

Just for the record, +1. This would be a better approach.


> Sounds reasonable, will post RFC for this. I think we should call such
> function as kgdb_free_init_mem() in similar way as:
> - kprobe_free_init_mem()
> - ftrace_free_init_mem()

As is matching the names...


> @@ -378,8 +382,13 @@ int dbg_deactivate_sw_breakpoints(void)
>         int i;
> 
>         for (i = 0; i < KGDB_MAX_BREAKPOINTS; i++) {
> -               if (kgdb_break[i].state != BP_ACTIVE)
> +               if (kgdb_break[i].state < BP_ACTIVE_INIT)
> +                       continue;
> +               if (system_state >= SYSTEM_RUNNING &&
> +                   kgdb_break[i].state == BP_ACTIVE_INIT) {
> +                       kgdb_break[i].state = BP_UNDEFINED;
>                         continue;
> +               }
>                 error = kgdb_arch_remove_breakpoint(&kgdb_break[i]);
>                 if (error) {
>                         pr_info("BP remove failed: %lx\n",
> 
> >
> > > +                       kgdb_break[i].state = BP_ACTIVE;
> > > +               else
> > > +                       kgdb_break[i].state = BP_ACTIVE_INIT;
> >
> > I don't really see what the "BP_ACTIVE_INIT" state gets you.  Why not
> > just leave it as "BP_ACTIVE" and put all the logic fully in
> > dbg_deactivate_sw_breakpoints()?
> 
> Please see my response above.
>
> [which was]
> > "BP_ACTIVE_INIT" state is added specifically to handle this scenario
> > as to keep track of breakpoints that actually belong to the .init.text
> > section. And we should be able to again set breakpoints after free
> > since below change in this patch would mark them as "BP_UNDEFINED":

This answer does not say whether the BP_ACTIVE_INIT state needs to be
per-breakpoint state or whether we can infer it from the global state.

Changing the state of breakpoints in .init is a one-shot activity
whether it is triggered explicitly (e.g. kgdb_free_init_mem) or implicitly
(run the first time dbg_deactivate_sw_breakpoints is called with the system
state >= running).

As Doug has suggested it is quite possible to unify all the logic to
handle .init within a single function by running that function when the
state changes globally.


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
