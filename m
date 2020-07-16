Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 49BBF222BCB
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 16 Jul 2020 21:22:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jw9Sj-0001Yw-43
	for lists+kgdb-bugreport@lfdr.de; Thu, 16 Jul 2020 19:22:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <keescook@chromium.org>) id 1jw9Sh-0001Yi-B2
 for kgdb-bugreport@lists.sourceforge.net; Thu, 16 Jul 2020 19:22:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JkQIL6u1DfVeBakkxVv5TexNPiL0IlLMXUBOxPWyZ5M=; b=Rb21GWp+yaWsmfPaCjW1PriaRM
 sLRl1hhJ9Gs67Gnhm4dvZYU4feguD9rrmCjK28OVM8y6F7tRIhgicW8+hm8J9HFMKlDYVZEIk5GUE
 bRy/775rUFdfmGWAyJLR7WX3ftudZivnxsTxssgjwypcNcjZGa3qb+cqS14tJwSsYoxU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JkQIL6u1DfVeBakkxVv5TexNPiL0IlLMXUBOxPWyZ5M=; b=ZK/qBlWuUBZDE8Bkurm2LJBbRZ
 Rbud79P5hxZrb4CoBFT3WIKR+pZMhgHN60v/w4cnNi0mFvhGTbJl6pVf8L40beiZGOTj5VY0udAzQ
 ghYErkRTLuiwAk6JfjlILi9QgSVpSszN/kjX/TLK8kCOsQqUce/LIXzsY5yxxFzmCEcA=;
Received: from mail-pl1-f193.google.com ([209.85.214.193])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jw9Sb-00AxJq-01
 for kgdb-bugreport@lists.sourceforge.net; Thu, 16 Jul 2020 19:22:31 +0000
Received: by mail-pl1-f193.google.com with SMTP id x8so4283838plm.10
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 16 Jul 2020 12:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=JkQIL6u1DfVeBakkxVv5TexNPiL0IlLMXUBOxPWyZ5M=;
 b=IdV9MqF3NgA5zvwc0WHh4MUmPJhoVdGBqF7mZzHR1z6W9+79kwebX37Odvx1RFYyD5
 TIcAItmVFebIbr0UGDR1VqZORhkkWg5GO3jP9SrAYBb/J9j1gAl6NCCYq5DxGfdZceJ5
 eJbQvOJJgIUB/uLUSvyqfC/7mWDvVcN1kqTj8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JkQIL6u1DfVeBakkxVv5TexNPiL0IlLMXUBOxPWyZ5M=;
 b=hRSCSsILv2Au1nhqhgWGC+OFOuD2Pg3VOZ9N3KSxZrkso+hrEF3K4pkP0xeodqsmlZ
 WZqj6H5LBtEKwVfurRAdG+Np/eekQV4CY3XGFZ5s8pL5N6J2P0+9te9lCEikrbeoQ7Qx
 6W4jdxqKXIBPVq3Keq7tUtEF5KTWqOsBhmHuHzduAorqET5LdbUcVWqMiVyLwhYFIw7K
 VjogqhwwZknquvC8zQYlZfo5+w+JKhX62Ig/lpq7wiUB2NIeuS2+5J5AaUnkb3mtAwu7
 u/twQc7v4eVTqRBnbIIgdWiyDai+OgnRxpPoHF88LhNKF/J0lXvzM1temgg6wghOBZe4
 1u7A==
X-Gm-Message-State: AOAM533PlQH3MPi0K49nnwEt6UVfFKX8qBZRvU0Z1+MRwVOjcDLAX13Z
 e8zTUphYE5rQLC0KvT5sbOKpdw==
X-Google-Smtp-Source: ABdhPJxnO0DLJTMuJCiKhGS2H/q0Dgh7D9XNeLpL7v+ETZT1fO0LQZze/EzzJLe1PvzD9lREJpkfEA==
X-Received: by 2002:a17:90a:1901:: with SMTP id
 1mr6710009pjg.199.1594927339413; 
 Thu, 16 Jul 2020 12:22:19 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id q24sm5641236pfg.95.2020.07.16.12.22.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2020 12:22:18 -0700 (PDT)
Date: Thu, 16 Jul 2020 12:22:17 -0700
From: Kees Cook <keescook@chromium.org>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <202007161216.9C9784FEBE@keescook>
References: <20200716030847.1564131-1-keescook@chromium.org>
 <20200716030847.1564131-4-keescook@chromium.org>
 <20200716153704.GM12769@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200716153704.GM12769@casper.infradead.org>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.193 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jw9Sb-00AxJq-01
Subject: Re: [Kgdb-bugreport] [PATCH 3/3] tasklet: Introduce new
 initialization API
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
Cc: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Oscar Carter <oscar.carter@gmx.com>, Mitchell Blank Jr <mitch@sfgoth.com>,
 kernel-hardening@lists.openwall.com, Peter Zijlstra <peterz@infradead.org>,
 kgdb-bugreport@lists.sourceforge.net,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, alsa-devel@alsa-project.org,
 Allen Pais <allen.lkml@gmail.com>, netdev@vger.kernel.org,
 Christian Gromm <christian.gromm@microchip.com>, Will Deacon <will@kernel.org>,
 devel@driverdev.osuosl.org, Jonathan Corbet <corbet@lwn.net>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 "David S. Miller" <davem@davemloft.net>,
 Masahiro Yamada <masahiroy@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Julian Wiedmann <jwi@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Nishka Dasgupta <nishkadg.linux@gmail.com>, Jiri Slaby <jslaby@suse.com>,
 Jakub Kicinski <kuba@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 Wambui Karuga <wambui.karugax@gmail.com>, Vasily Gorbik <gor@linux.ibm.com>,
 linux-s390@vger.kernel.org, linux-kernel@vger.kernel.org,
 Heiko Carstens <hca@linux.ibm.com>, linux-input@vger.kernel.org,
 Ursula Braun <ubraun@linux.ibm.com>, Stephen Boyd <swboyd@chromium.org>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Jaroslav Kysela <perex@perex.cz>,
 Felipe Balbi <balbi@kernel.org>, Kyungtae Kim <kt0755@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Kevin Curtis <kevin.curtis@farsite.co.uk>, linux-usb@vger.kernel.org,
 Jason Wessel <jason.wessel@windriver.com>,
 Romain Perier <romain.perier@gmail.com>, Karsten Graul <kgraul@linux.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Thu, Jul 16, 2020 at 04:37:04PM +0100, Matthew Wilcox wrote:
> On Wed, Jul 15, 2020 at 08:08:47PM -0700, Kees Cook wrote:
> > +#define DECLARE_TASKLET(name, _callback)		\
> > +struct tasklet_struct name = {				\
> > +	.count = ATOMIC_INIT(0),			\
> > +	.callback = _callback,				\
> > +	.use_callback = true,				\
> > +}
> > +
> > +#define DECLARE_TASKLET_DISABLED(name, _callback)	\
> > +struct tasklet_struct name = {				\
> > +	.count = ATOMIC_INIT(1),			\
> > +	.callback = _callback,				\
> > +}
> 
> You forgot to set use_callback here.

Eek; thank you.

> > @@ -547,7 +547,10 @@ static void tasklet_action_common(struct softirq_action *a,
> >  				if (!test_and_clear_bit(TASKLET_STATE_SCHED,
> >  							&t->state))
> >  					BUG();
> > -				t->func(t->data);
> > +				if (t->use_callback)
> > +					t->callback(t);
> > +				else
> > +					t->func(t->data);
> 
> I think this is the wrong way to do the conversion.  Start out by setting
> t->data to (unsigned long)t in the new initialisers.  Then convert the
> drivers (all 350 of them) to the new API.  Then you can get rid of 'data'
> from the tasklet_struct.

That's what I did when I converted timer_struct, and it ended up creating
a mess for Control Flow Integrity checking. (The problem isn't actually
casting .data, but rather in how the callsite calls the callback --
casting the callback assignments doesn't fix the mismatch between the
caller and the callback's expectation about the function prototype
under CFI.) I got lucky with timer_struct (in v4.14) in that not much
had been converted, and I was able to do the entire conversion in the
next kernel release.

So, this time, I'm trying to avoid the prototype mismatch mess by
providing a selector to determine which prototype the callback should
be called through, and I was happy to discover I could do it without
growing the tasklet structure. Obviously the memory corruption safety
improvement won't be realized until both .data, .use_callback, and .func
are removed, but that was true even with the earlier style of conversion.

-- 
Kees Cook


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
