Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9962060C014
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 25 Oct 2022 02:49:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1on88j-0004v7-Da
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 25 Oct 2022 00:49:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1on88i-0004v0-2L
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 25 Oct 2022 00:49:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/J+E57FepHa+VPoHH/vCuYiisEoXCo25k1eOwk+X83Q=; b=QT4ksUplT1I7VaYnx6m5Nd4Xle
 imq8yjvEqRLVsJdJ9wD97yluiC5mSJqqGoBuU2DUgW6Qjox/pAicj3hBV893p01pl80haokQDk7Dk
 Ftgd6dGUVx4eyI0yr4lX+CVUM/qJRNucXF87VsvtngGbB/Nxf5dVchCnhqKgKC1N281w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/J+E57FepHa+VPoHH/vCuYiisEoXCo25k1eOwk+X83Q=; b=m/aqlVyROpa6x4sYmF5Hsg9Hq1
 7MTUBidJ5x6+OuxP/KvnJeY+uDnW8Ft1A9+olTX19GzNugTlae9Mysc+qFQ7U5rkQs/E90rwEae8r
 9A2TZyqjGlOduoScAaDxxwkgQxoKx/INhGBNJh0MtDFkorMnJrDyBsE/Ts6lqpZJPXm4=;
Received: from mail-ej1-f44.google.com ([209.85.218.44])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1on88h-00GEeO-9f for kgdb-bugreport@lists.sourceforge.net;
 Tue, 25 Oct 2022 00:49:55 +0000
Received: by mail-ej1-f44.google.com with SMTP id q9so9009472ejd.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 24 Oct 2022 17:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/J+E57FepHa+VPoHH/vCuYiisEoXCo25k1eOwk+X83Q=;
 b=LT4xjotEAQR+rhahuuC7tR5xBqJe9l3UB1hAIpYccMggPOooSk4KhuAaRudbslGZ9O
 q+Bi3Z/UsVAZ7vS4NyzfUydTnIt6ntqcgJ9O3pk2xZkcp1u2mriPc4Eb+65LxBjyVP4W
 kbUnb6o6ie3vaTcKX+BW3LO94wVzl2CJ7Z8j8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/J+E57FepHa+VPoHH/vCuYiisEoXCo25k1eOwk+X83Q=;
 b=rI2SumpQYY4Svn7hZ+WmALHGYGaTNXiSKkHDWAPl/FLZ/ZA4kvHwCgtO9zF4sBjLxs
 Lsn3dAK+wiVchB+C3BLxoNxAhwjCS/K6caaIpxQXtFD75UfFhxpzmhbdCwQI6foi+hZy
 cW9ysHsAkD7bpTCOJaKyJGX4VATUZ/kOFmyEjmMF6GFsKzqoHiwejp7rT7a5mO6q0HfU
 4ec/D/4S1m4qR1loLw2R5ULYILEEYp+/CjklKSk7BeednZIJx5yiy46HxbtpgHxyPEhl
 aeGH0GgRCiXXJaV5fm8t7Vc/qIweo53TUfgKUx1QPGrmqnXJk7QarKwkF60V7EgrfQxx
 m2Cg==
X-Gm-Message-State: ACrzQf3Fvom9GxQmSsj0ExIBmHELGdNx+5mF4sjKbMYRrU8qNjysJF3u
 srN01coMU0z9njvKmHhXNpkYDwRwt3WPAQNX
X-Google-Smtp-Source: AMsMyM4SVHEe26rPfp+Q9iTpd0lBPpO4i1lNta4lhpav/MLIKVKefKvDomMKjgNcYugSfCvhE0QeMA==
X-Received: by 2002:a17:907:628f:b0:72f:58fc:3815 with SMTP id
 nd15-20020a170907628f00b0072f58fc3815mr30257901ejc.719.1666658988089; 
 Mon, 24 Oct 2022 17:49:48 -0700 (PDT)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com.
 [209.85.221.42]) by smtp.gmail.com with ESMTPSA id
 2-20020a170906200200b007812ba2a360sm556162ejo.149.2022.10.24.17.49.46
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Oct 2022 17:49:46 -0700 (PDT)
Received: by mail-wr1-f42.google.com with SMTP id j15so7969429wrq.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 24 Oct 2022 17:49:46 -0700 (PDT)
X-Received: by 2002:adf:f641:0:b0:236:737f:8e00 with SMTP id
 x1-20020adff641000000b00236737f8e00mr4396527wrp.659.1666658985935; Mon, 24
 Oct 2022 17:49:45 -0700 (PDT)
MIME-Version: 1.0
References: <20221019145600.1282823-1-john.ogness@linutronix.de>
 <20221019145600.1282823-13-john.ogness@linutronix.de>
 <CAD=FV=VFxKL=sOMdhyHrgy2JOtzKJdOe4euwZRRAK7P-rNVjuQ@mail.gmail.com>
In-Reply-To: <CAD=FV=VFxKL=sOMdhyHrgy2JOtzKJdOe4euwZRRAK7P-rNVjuQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 24 Oct 2022 17:49:34 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WF2S9wQ6uR+VKU4EfDTVd0JnKkuU3Wyfo6P8E_FouebQ@mail.gmail.com>
Message-ID: <CAD=FV=WF2S9wQ6uR+VKU4EfDTVd0JnKkuU3Wyfo6P8E_FouebQ@mail.gmail.com>
To: John Ogness <john.ogness@linutronix.de>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, On Mon, Oct 24,
 2022 at 3:46 PM Doug Anderson <dianders@chromium.org>
 wrote: > > Hi, > > On Wed, Oct 19,
 2022 at 7:56 AM John Ogness <john.ogness@linutronix.de>
 wrote: > > > > Replace (console->flags [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.218.44 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.218.44 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1on88h-00GEeO-9f
Subject: Re: [Kgdb-bugreport] [PATCH printk v2 12/38] tty: serial: kgdboc:
 use console_is_enabled()
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

Hi,

On Mon, Oct 24, 2022 at 3:46 PM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Wed, Oct 19, 2022 at 7:56 AM John Ogness <john.ogness@linutronix.de> wrote:
> >
> > Replace (console->flags & CON_ENABLED) usage with console_is_enabled().
> >
> > Signed-off-by: John Ogness <john.ogness@linutronix.de>
> > ---
> >  drivers/tty/serial/kgdboc.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/tty/serial/kgdboc.c b/drivers/tty/serial/kgdboc.c
> > index e76f0186c335..b17aa7e49894 100644
> > --- a/drivers/tty/serial/kgdboc.c
> > +++ b/drivers/tty/serial/kgdboc.c
> > @@ -533,7 +533,7 @@ static int __init kgdboc_earlycon_init(char *opt)
> >         console_lock();
> >         for_each_console(con) {
> >                 if (con->write && con->read &&
> > -                   (con->flags & (CON_BOOT | CON_ENABLED)) &&
> > +                   (console_is_enabled(con) || (con->flags & CON_BOOT)) &&
>
> <shrug>. I guess this is OK, but it feels a little pointless. If we're
> still directly looking at the CON_BOOT bit in con->flags it seems
> weird to be accessing CON_ENABLED through a special wrapper that's
> marked as a `data_race`. In our case it's _not_ a data race, right,
> since this function continues to hold the console_lock() even at the
> end of the series? I personally would drop this patch but if you
> really want it I won't object.

I realized that my statement isn't quite true. It actually only holds
console_list_lock() even at the end of the series. Still, it seems
weird that we're declaring the `data_race` on CON_ENABLED but not
CON_BOOT ?


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
