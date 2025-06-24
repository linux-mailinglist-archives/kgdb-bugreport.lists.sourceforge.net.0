Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 966CDAE5FA3
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 24 Jun 2025 10:41:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yZsPmZadDQNU8JP6MIpxISMQZIVhe6CQb4di2uq89Kk=; b=gfWCqQEfUDD0b7w7MFAyI+26Er
	VtWhpKB6wahqYxZi0ddZHZEdldPlNqI+GMaCGeAAxiobO7/KHPz27e6VitIAGHGKK/o0pMZs020Qp
	MfaVdD482fSTx95kR21uHiHoP/Ovc6uCi9HFpopEr2c0/+j+jXM79IZ7RXzyYJlgrIKc=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1uTzDP-00006V-GX
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 24 Jun 2025 08:41:15 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1uTzDO-00006P-Q0
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 24 Jun 2025 08:41:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=42Y2N6ebar+wiBFiVwZ+1np3R1M+VYIv1aIQkqIKk40=; b=BdBUjYfzmZHbFkYvSZfI3bFq2I
 NxnkmF3l2FKfsZItgrr4k4DtyVc6dElNeoXTyzMsGANU2swgsM5/TIVoeEftHhHrJbOiaQ95ngqtP
 V75B4LfNwEK/cxsgr2FP8286026RQj3MRKvO8e+BtItl/eDGJY6behoFChxcQl/hN1Xc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=42Y2N6ebar+wiBFiVwZ+1np3R1M+VYIv1aIQkqIKk40=; b=iYGiUslCA7c9hHxQ340+5BzerV
 ueRPXiF4d/UwA7WN3UGibZu6rJli5mWnic+0KQMrfl46+Bsgn3h4R/hX3vC21wliggmVK6C1sfa+S
 b4l3jpqVbTh263cTX8YpmThiej8WssiNS18a6IzuzGKotzMO7Wa0qp5vj7/0flouBIMk=;
Received: from mail-wr1-f53.google.com ([209.85.221.53])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uTzDO-0007Oz-By for kgdb-bugreport@lists.sourceforge.net;
 Tue, 24 Jun 2025 08:41:14 +0000
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-3a503d9ef59so3439939f8f.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 24 Jun 2025 01:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1750754463; x=1751359263; darn=lists.sourceforge.net; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=42Y2N6ebar+wiBFiVwZ+1np3R1M+VYIv1aIQkqIKk40=;
 b=J4I0lRckMZjAlSQv3AUyqVLKr9FD61tH4792ygHJlszXQlCe63XpnFx/qfkF7+BhlZ
 N32M6W+JDyDKw9TAp7djO7GXKl9TE1RKZEfTrIDYgqgxXktsLa2QQLdhGoA6AINGZE24
 VrtLIrmwrcJjJ+FyblLWmB8r0sHi+eh078utMX3BWYmC6GWURm04R7TgY2nkMvNU7Od4
 nAplXDgaKNJsM5ohwyTc7FlfdNM3GkuQaoWey17GrP4Hia170smhmPXia4gjzONLNPsB
 Lq56Rtqy+39V93pAoNtfJSx8DR7+JhjEnkF8/V3GtUfmk6uIlYeCOJXYD/byR1+CcAM0
 MJQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750754463; x=1751359263;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=42Y2N6ebar+wiBFiVwZ+1np3R1M+VYIv1aIQkqIKk40=;
 b=YzCa78AFpzsxqPUK2LsMpcRud5Yidi3j1ZkCXqc31G6KF+Gtr8OYTwsSS4niCC3Qre
 fb6smPWPHI1vcxWpRepJUT+43+bFAfzoJMfpgEFeg4JFMqse5kjHIcVhlkXXSfOsxsQK
 qKX21JftEPbWshtmYFcyTL1R1jzir6ozxa5CWSJi5T+EkmhkZwD9XXv1EuxWysEqA+B6
 531rcZbGILp7vXdGzg18vSL6Awapp8Woli1vaUIxdjQeHT7ZPPwGheM+Y7QR69M2D+Aj
 QF6TtlFKlzVEiCrXkbJ5t4lG/uoUx8qNmMss938zLg2OldL0QITNOD+xHaDJr+c4oSO1
 x26g==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8kbDLrfT0EuHVmpAzL0ZQemLXJF8Gk/F472gzo2zmTT7qwjhbIxHbITD2tiVBeqxdck1x6zBai25FTVuOPA==@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yx/CnI2cY7Ok/KOR4uDm5OJ0x0iFMUNSkKkAytiKN+UAQ9JibDO
 fbCNPUXLIOKBpMn0P+fKjbbUsh+XL5Gr4a5Gze6/KYXWTowg+hMHZplAC7Kp7WzjggjR1SQHqz7
 DfEwO
X-Gm-Gg: ASbGncsaWa227/HGb3n1kAVNfm+tCEybpMRvCgv6KYdTdLP/x48y49u6gRWTFl9VEYa
 nD7Bb8WiFqef3HvsoxDBlqN2Y6bIuQZjNQl2Ay5KjQEc6hKJsYjHuVOObw53ZXvH5w1ZEj5zfVH
 wGAW6fL1ZLwswn993UCiLlEyxOou592hn7YfNLcQc8u2n1MaP/gwy3gYGwGjLhL+rPZWNtP7QRx
 ieeTi5uDdgwHOCizeGX6Nrs8fIzI6L1+6pFY+yFEVWFVelae81bnSlEEhI2TqzU5PjF0MeO2MVR
 z+ji7WjdKXKDEqEEfNEcZHUW4ydNGGnPErn1kSuYEdV+Npzs0CSZhgPrqKqEsSi1
X-Google-Smtp-Source: AGHT+IHSGyDwoYjnGgDbPlFSLTlqgEue3oGk1SeNKtOch4nBjPOzzj8KWkuWYgkah6BLwc+G22XXxA==
X-Received: by 2002:a05:6000:3111:b0:3a1:fcd6:1e6b with SMTP id
 ffacd0b85a97d-3a6d1334011mr11624969f8f.57.1750754462679; 
 Tue, 24 Jun 2025 01:41:02 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-749b5e08e52sm1231044b3a.9.2025.06.24.01.40.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jun 2025 01:41:02 -0700 (PDT)
Date: Tue, 24 Jun 2025 10:40:46 +0200
To: John Ogness <john.ogness@linutronix.de>
Message-ID: <aFpkQHwNCslbKSP6@pathway.suse.cz>
References: <20250606-printk-cleanup-part2-v1-0-f427c743dda0@suse.com>
 <20250606-printk-cleanup-part2-v1-2-f427c743dda0@suse.com>
 <aExBo-8cVOy6GegR@pathway.suse.cz>
 <84y0tmiidg.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <84y0tmiidg.fsf@jogness.linutronix.de>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri 2025-06-20 16:49:07,
 John Ogness wrote: > On 2025-06-13, 
 Petr Mladek <pmladek@suse.com> wrote: > >> diff --git a/kernel/printk/nbcon.c
 b/kernel/printk/nbcon.c > >> index fd12efcc4aeda8883773d98 [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.53 listed in wl.mailspike.net]
X-Headers-End: 1uTzDO-0007Oz-By
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
From: Petr Mladek via Kgdb-bugreport <kgdb-bugreport@lists.sourceforge.net>
Reply-To: Petr Mladek <pmladek@suse.com>
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

On Fri 2025-06-20 16:49:07, John Ogness wrote:
> On 2025-06-13, Petr Mladek <pmladek@suse.com> wrote:
> >> diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
> >> index fd12efcc4aeda8883773d9807bc215f6e5cdf71a..72de12396e6f1bc5234acfdf6dcc393acf88d216 100644
> >> --- a/kernel/printk/nbcon.c
> >> +++ b/kernel/printk/nbcon.c
> >> @@ -1147,7 +1147,7 @@ static bool nbcon_kthread_should_wakeup(struct console *con, struct nbcon_contex
> >>  	cookie = console_srcu_read_lock();
> >>  
> >>  	flags = console_srcu_read_flags(con);
> >> -	if (console_is_usable(con, flags, false)) {
> >> +	if (console_is_usable(con, flags, false, consoles_suspended)) {
> >
> > The new global console_suspended value has the be synchronized the
> > same way as the current CON_SUSPENDED per-console flag.
> > It means that the value must be:
> >
> >   + updated only under console_list_lock together with
> >     synchronize_rcu().
> >
> >   + read using READ_ONCE() under console_srcu_read_lock()
> 
> Yes.
> 
> > I am going to propose more solutions because no one is obviously
> > the best one.
> 
> [...]
> 
> > Variant C:
> > ==========
> >
> > Remove even @flags parameter from console_is_usable() and read both
> > values there directly.
> >
> > Many callers read @flags only because they call console_is_usable().
> > The change would simplify the code.
> >
> > But there are few exceptions:
> >
> >    2. Another exception is __pr_flush() where console_is_usable() is
> >       called twice with @use_atomic set "true" and "false".
> >
> >       We would want to read "con->flags" only once here. A solution
> >       would be to add a parameter to check both con->write_atomic
> >       and con->write_thread in a single call.
> 
> Or it could become a bitmask of printing types to check:
> 
> #define ATOMIC_PRINTING 0x1
> #define NONATOMIC_PRINTING 0x2
> 
> and then __pr_flush() looks like:
> 
> if (!console_is_usable(c, flags, ATOMIC_PRINTING|NONATOMIC_PRINTING)

I like this. It will help even in all other cases when one mode is needed.
I mean that, for example:

   console_is_usable(c, flags, ATOMIC_PRINTING)

is more self-explaining than

   console_is_usable(c, flags, true)

Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
