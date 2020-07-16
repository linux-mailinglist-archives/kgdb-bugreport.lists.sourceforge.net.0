Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 02DCB223820
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 17 Jul 2020 11:20:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jwMXp-0003AS-0o
	for lists+kgdb-bugreport@lfdr.de; Fri, 17 Jul 2020 09:20:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1jw5xx-00087e-O9
 for kgdb-bugreport@lists.sourceforge.net; Thu, 16 Jul 2020 15:38:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=o6oHT2rpgf0cErqSO7RynM1ahrdcZBKx58Lp4xYSPqk=; b=A2oGVw4mESqGhxBQ//v4RmxE8q
 fCmzMsm7TvKLz+EmuerccTxsWmfjpc/6X18MeIBrYY+zzNQmHNcH7TapLOdj5SUR6czPZ5lZ7MB5I
 gmLjxMwZSxoWVHj3FxEtGyyR7fAqWXZ2LpRrI1C8oekNOH02hxLC6kcnHRQfoQCQDt1k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=o6oHT2rpgf0cErqSO7RynM1ahrdcZBKx58Lp4xYSPqk=; b=AMjAFdq6paxfGY4Y+wfOG/jb/N
 0I+rnv2FmQ7jTinplvuAn3zu4VeO6TJTALKmsArnyHSJ5VjGJkzhQtYdBWm2ueo34tfyuzuiQQsZl
 SdHkngByE1r8Muw5RIGiVbbpp4zmPFOQBwA9kQzCUfReTnx953ig0jv2MlzcHYifR7dc=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jw5xv-0066xB-Gt
 for kgdb-bugreport@lists.sourceforge.net; Thu, 16 Jul 2020 15:38:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=o6oHT2rpgf0cErqSO7RynM1ahrdcZBKx58Lp4xYSPqk=; b=blVXROz0kqPs9WT7AReAWRXnaN
 giDr3C3VPp7qAB5MirGN6Ghar0/xZ6skZ2oTHZrIQnlWV0t6l172otR7fmoceWN/3Omnm1QChvIMq
 v24J9raPRCn37XZp1iaolfjuwtv7Xbf1SjhRG2+phHG2UAzWRhI9WhvuDp7GGNLuphLQb40yeLPn3
 CQvkTsWNMP4QZfiCDKNmVfer2n52y/giQdVBQQgnlCxKQCaxItNDXKZ4xi8RomDl1v2I45h76ddYe
 874YANmm/lqvFG5LUaTOLCBGOMdHl/R06HcEWCdFmgnxvTEFvwNCpVE7mt6U4f8u6oQtVOhd7dG0R
 /sE940zQ==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jw5wW-0004De-Tg; Thu, 16 Jul 2020 15:37:05 +0000
Date: Thu, 16 Jul 2020 16:37:04 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Kees Cook <keescook@chromium.org>
Message-ID: <20200716153704.GM12769@casper.infradead.org>
References: <20200716030847.1564131-1-keescook@chromium.org>
 <20200716030847.1564131-4-keescook@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200716030847.1564131-4-keescook@chromium.org>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jw5xv-0066xB-Gt
X-Mailman-Approved-At: Fri, 17 Jul 2020 09:20:33 +0000
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

On Wed, Jul 15, 2020 at 08:08:47PM -0700, Kees Cook wrote:
> +#define DECLARE_TASKLET(name, _callback)		\
> +struct tasklet_struct name = {				\
> +	.count = ATOMIC_INIT(0),			\
> +	.callback = _callback,				\
> +	.use_callback = true,				\
> +}
> +
> +#define DECLARE_TASKLET_DISABLED(name, _callback)	\
> +struct tasklet_struct name = {				\
> +	.count = ATOMIC_INIT(1),			\
> +	.callback = _callback,				\
> +}

You forgot to set use_callback here.

> @@ -547,7 +547,10 @@ static void tasklet_action_common(struct softirq_action *a,
>  				if (!test_and_clear_bit(TASKLET_STATE_SCHED,
>  							&t->state))
>  					BUG();
> -				t->func(t->data);
> +				if (t->use_callback)
> +					t->callback(t);
> +				else
> +					t->func(t->data);

I think this is the wrong way to do the conversion.  Start out by setting
t->data to (unsigned long)t in the new initialisers.  Then convert the
drivers (all 350 of them) to the new API.  Then you can get rid of 'data'
from the tasklet_struct.



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
