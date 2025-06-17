Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 37849ADC688
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 17 Jun 2025 11:33:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V5ZKGPDur62m8EBlWDRDZB70NJHQ6Fs3j5SXQX7uMEc=; b=Q+fZxua2IOxobNVnnk66Mm77ZQ
	dyg77D2UJbcm7BXt1Hnb1NbDnoXoFAXj6DwRQTvGPDhi+C8TbhMqI39mBRVFwemUAoOXz3GiMYYuq
	qeP6eu3DtgT+PKmdW5eh0Mobs+n3E66HLGqGsbRRe+iN2KG2WAn4VDUZ2hWHqlTdouoM=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1uRSgd-0002YM-U4
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 17 Jun 2025 09:32:59 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <geert.uytterhoeven@gmail.com>) id 1uRSgb-0002YE-P8
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 17 Jun 2025 09:32:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IpyRO35mdNeXwjpxX8WgCP2jvjoVuRIOBEbtU0BIjNU=; b=Z03K0jGaTdWa+leT669m7jezgI
 2Ch/uV0kGF1z/y51LlfjhyetQYMFb6fX04tsQJY4Lm8J6I0t8doEPnRNNCVlnjLZHr4hx8RxnXxkM
 z55OwosI1woZ3amK3ovqTFauezSx6omDpYPtqGQbDuq6mW63ATwCksGiTAABpcobXLpc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IpyRO35mdNeXwjpxX8WgCP2jvjoVuRIOBEbtU0BIjNU=; b=Fw9iTDCby9gALc1wMyGMSmaqkt
 eR+I/gUp9iO3MXfth6HaQC9v8/CZ0EGx79hNsMjI1bNZOQ7nUhyehgrb4ici5gsrbYtLxH9qdxAqO
 h3OHV2HWNhPZkyKtk64QNm3qHrT7ZAGhxS7hwAsxYwjZfJTYugHz83b3qj3f1RSFxfRg=;
Received: from mail-vk1-f170.google.com ([209.85.221.170])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uRSgb-0001P4-A9 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 17 Jun 2025 09:32:57 +0000
Received: by mail-vk1-f170.google.com with SMTP id
 71dfb90a1353d-5308b451df0so1535527e0c.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 17 Jun 2025 02:32:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750152766; x=1750757566;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IpyRO35mdNeXwjpxX8WgCP2jvjoVuRIOBEbtU0BIjNU=;
 b=AodEk3N5Jvo/5S1FJAHEoROSZK4CT3gIKn15DBQpWOVQsH2swHdIY8egmDWrf2mPKM
 LF66uHpCIKYmI/9/AAGRErvsrxdozCmmA36TFpW7NeCSWoAoeD3yZoJBa0J3meJPNSN2
 iy6AmUMS1XBiaqNzhyHjg3LNto2Am7Dz2Kvhj06l2fFnyiYVqbqC2du2rS2DjfBpaEI8
 g7FSAvMFf5dIgioy+xP9MotF1uIRBtOx5yiaNdPWRyy1KZOtb5QjT/EZ5FLMSWh227pi
 Cnmbkf6LY93T+I/y2GEErJQJ3R4boRq/wNkQkSNtPTryzzj8yCl90wfS2aOqa1Gnm/B1
 NKbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrmKPYozUh//f5HIWQgNC9yrvLKxtBWP/61G8o3sLE/AIkf9CkC+u+HQ6Xm2+KfFuMq410l/dWgnTgJm3FZA==@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxZ/l2OsSrcYbcCvWxWnMVLrNPvuoLveVhpGnEH4YJ38iXwYJ4f
 QfK1Hgy1q4XD/IfCUkiFXj8pisOME1fcb8ac/AlfJSbzpXykE1QOgWGjfTPQzOB0
X-Gm-Gg: ASbGncsH3EsDWHm4X7Dmk/dHTCVrVud5O6kbast49UoywJ9/8ilxzccPGr14rZ4a7Ax
 m4TnYLBu8teTT3Td6d0098uynLqy2f0rvfleoXhG3JZm7Nd32PSiaT35XMoGX7tr6DgWAC/Z41P
 Xq/C6I4zwBtnA8MAyZlqY5j0v7skw8sXEQ9cgbv4uCgyt2z6AJgKXo6xtV6V5vWpP5gYm+mIBty
 9T3ldqTl5WspvdwQ7pVCqnfHityBJsi1kZySEBvrXenPpKWeO4u51RcbATy+rizdnLcao/wRrTT
 hVPo25cTWZQSYEFc+s62QHMQL4VeRs2bRWnTqR/cqdtmUmzi8AlKYAwtx2lL/GklmKnbqEFgNCQ
 PedxRlKmpish/82Pwg4CDaWhPT4/9
X-Google-Smtp-Source: AGHT+IFnqygoF8OZDa9OhX4XpJWFPwY7nl0uOlcgV7GoXHdR40aK9eh14akE5Ny+EaHx64GH/cBRHg==
X-Received: by 2002:a05:6102:2929:b0:4e2:ecd8:a1a with SMTP id
 ada2fe7eead31-4e7f61376ffmr7623912137.4.1750152765989; 
 Tue, 17 Jun 2025 02:32:45 -0700 (PDT)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com.
 [209.85.221.179]) by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-87f0fd936e3sm1543134241.34.2025.06.17.02.32.45
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jun 2025 02:32:45 -0700 (PDT)
Received: by mail-vk1-f179.google.com with SMTP id
 71dfb90a1353d-5316a5e4c6cso519412e0c.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 17 Jun 2025 02:32:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVvZH3NrizNw2/4jVrg+RbGckrLeUTHrC0DXLKX1588MjLpcHxPxkYqHDEWXYdCbyhzNRcg5ainUmc/hKrxOw==@lists.sourceforge.net
X-Received: by 2002:a05:6122:547:b0:529:2644:8c with SMTP id
 71dfb90a1353d-531497d3ee3mr7253853e0c.8.1750152765304; Tue, 17 Jun 2025
 02:32:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250606-printk-cleanup-part2-v1-0-f427c743dda0@suse.com>
 <20250606-printk-cleanup-part2-v1-7-f427c743dda0@suse.com>
 <aFAkD2i0ceH6qYQz@pathway.suse.cz>
In-Reply-To: <aFAkD2i0ceH6qYQz@pathway.suse.cz>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Jun 2025 11:32:32 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXN4Xf1o03cYU3ug_gRdFtBXJC5Nvvt9U6UeP=U2AQTTA@mail.gmail.com>
X-Gm-Features: AX0GCFtvZQSD4F-97UDxOqiDqN4VEggSrDhztYpPcqEOiEQEvpc1f_0ccYJ9a2M
Message-ID: <CAMuHMdXN4Xf1o03cYU3ug_gRdFtBXJC5Nvvt9U6UeP=U2AQTTA@mail.gmail.com>
To: Petr Mladek <pmladek@suse.com>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Petr, On Mon, 16 Jun 2025 at 17:27,
 Petr Mladek <pmladek@suse.com>
 wrote: > On Fri 2025-06-06 23:53:49, Marcos Paulo de Souza wrote: > > All
 consoles found on for_each_console_srcu are registered, meaning t [...] 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.170 listed in wl.mailspike.net]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [geert.uytterhoeven(at)gmail.com]
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 0.0 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and EnvelopeFrom
 freemail headers are different
X-Headers-End: 1uRSgb-0001P4-A9
Subject: Re: [Kgdb-bugreport] [PATCH 7/7] printk: Don't check for
 CON_ENABLED on console_unblank
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
 John Ogness <john.ogness@linutronix.de>,
 Marcos Paulo de Souza <mpdesouza@suse.com>,
 Jason Wessel <jason.wessel@windriver.com>, linux-um@lists.infradead.org,
 Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Daniel Thompson <danielt@kernel.org>, linux-serial@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 kgdb-bugreport@lists.sourceforge.net,
 Johannes Berg <johannes@sipsolutions.net>, Jiri Slaby <jirislaby@kernel.org>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi Petr,

On Mon, 16 Jun 2025 at 17:27, Petr Mladek <pmladek@suse.com> wrote:
> On Fri 2025-06-06 23:53:49, Marcos Paulo de Souza wrote:
> > All consoles found on for_each_console_srcu are registered, meaning that all of
> > them are already CON_ENABLEDed.
> >
> > Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
> > ---
> >  kernel/printk/printk.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
> > index 658acf92aa3d2a3d1e294b7e17e5ee96d8169afe..8074a0f73691cfc5f637361048097ace1545c7c0 100644
> > --- a/kernel/printk/printk.c
> > +++ b/kernel/printk/printk.c
> > @@ -3360,7 +3360,7 @@ void console_unblank(void)
> >               if (flags & CON_SUSPENDED)
> >                       continue;
> >
> > -             if ((flags & CON_ENABLED) && c->unblank) {
> > +             if (c->unblank) {
>
> It might actually make sense to check is_console_usable() here.

My first thought was: one more to convert to a better name!
But the actual function is already called console_is_usable() ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
