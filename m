Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F91B4FDF3
	for <lists+kgdb-bugreport@lfdr.de>; Tue,  9 Sep 2025 15:48:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LY86ywkgAgvvrOyscJQl62b8kXHryLN+xD4wxjogmyw=; b=M0pfOQbxS/YBF0CwK6VHcQsMaZ
	UlXA/mE53/J0PrnKMOvPuIGB3W9T66N2ui7nDpY9LTUYLwOEvsGohspS6bz3JEoHjvQZUw/m29BfT
	686ctJrIWwI1Ntlbl60L1zgAXJBqKLbB4i8Xyu+VkQSWNBy+RUIwsjpvuAmf4UqXWNcQ=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1uvyiJ-00039v-IM
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 09 Sep 2025 13:48:51 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1uvyiH-00039n-Pt
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 09 Sep 2025 13:48:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wzdJUr2aAZ317oMLdDooM8ha31xvzXYVNa8DDq4GgnM=; b=bt6IrAhnspwq7rKzs391wJUueX
 /Lyo76UkSaFh28pubtmPq8wGMDXyhhaUErqtL5TSWV8S0qpMcSDU2Y9x7VVbM9X1JnSOWC3RfO3q8
 S0nYtyYYjjJbOrGoKGHIZ9UMn9XIqfQOjEXMsMomlleIZe5WMijpxAEQJIQayGlcbSMA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wzdJUr2aAZ317oMLdDooM8ha31xvzXYVNa8DDq4GgnM=; b=UBifL3cpgefMY+HXNKLLTxXOCz
 vvbZ/hNu2kVOWGTpGrJygK+gn2gyJBZgIKbaGF/lPhjTH8HAfmnKgucBHKwFGQ+1iwT0TvxWN+AYM
 kHjAiARXgnBNh8WXuKj0VNPJTL7BXXvPgcsJ6RTYHdAKcNsSAcGWImtM4064Qnz2bcSs=;
Received: from mail-ej1-f66.google.com ([209.85.218.66])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uvyiH-0001D0-AY for kgdb-bugreport@lists.sourceforge.net;
 Tue, 09 Sep 2025 13:48:49 +0000
Received: by mail-ej1-f66.google.com with SMTP id
 a640c23a62f3a-b00a9989633so184785666b.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 09 Sep 2025 06:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1757425718; x=1758030518; darn=lists.sourceforge.net; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=wzdJUr2aAZ317oMLdDooM8ha31xvzXYVNa8DDq4GgnM=;
 b=gLI1mHOsdJqqoWRWp5WnsiQdgRX3bC556yq2GcM4mDy1huCh4fgLcao2hs76KS/ofm
 VTUxjWKFY27yMrmUzYUEq6gA/u7gfH/z+AoqVe8wXkyz51mabru6nK5Fx7MkMDvNcLVT
 mmjOfX9EPRhR2y94Y38Urts2ljduteZ57SHl1OyQp6xNG8CeZt6QFIhb6isvr1DUfdtk
 6byF6Oj8/H/IA0MgBMrPJSHsP4950JwU5j8oHP1Dul2VRy/CBQDXkRrid+7aVg2NpbQs
 +k3hObGda+pfmQ3oSNcC9uUeYTFhgvM/UuYFVov1etPsM3hSIOLfLgYvLC5O97T2T54H
 z3Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757425718; x=1758030518;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wzdJUr2aAZ317oMLdDooM8ha31xvzXYVNa8DDq4GgnM=;
 b=P2FabnyiB3egSiwVA2Y3H4L8v/V4RX3xW7jDMLdKa5GCFI50IlLIniMQg8z5NvINqw
 qEJsG2YCjzr0fuAngqj+7vnyO1ae+CKdrKsmxdYKnY+6i2pNUkBCZCPbhYOZxO4LIsO2
 wG9xNdsdVHZEhDumo8vPRuWKm2cabuZly3ihXPb3eGtGdPW/NVbAEcrNolTxTkYDzSsc
 vvG/jIFbDzhflmhhh3VrqtJVlh4zZa1nppVqy3NFYiHSfZrKOGhYF4xiIF0MZTsBRb4S
 LLphVZ7ZgqsWgTWDcDfEvo30JocLh/Zjb+/MCj5BbkWG+wPnqZKtJJ093EzybWHKbcDP
 AyWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXs5PEwxLpHjMUP9pj0dobFtFDmtkYVimdhnjyhbyFw6AdxODivY8p9daXHovsx/GXaeSYmoRfTFigoFOzr3w==@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yxf6d0AuYrwdHKVYA1A2xqVLNX9GEWporqtWpk2HPigFfnDB/fQ
 2aZOtlPagfQUFjPWQOjW37eGnQ3F0h1WrnrddIQ7rZC+bUh49iM+nTiAnzw+NmfuPEc=
X-Gm-Gg: ASbGnctK6shxwru6L80HP+uc6tFC/LP0YRjS26PigZzeG6OvTdRQkDiQ0YWSWIBe6eo
 zGoZxiXu6HanTWBce2+p1sptlA7bMWBFltlWzC3en+UbiZpNsQLfpDdv1rqy4CDbP1kPwXUHHxp
 VdMaauPzr/ORFP8DHbE1rLLqTpvGfE5KN14eH+6Rek8VB4Z4bmh1y000tOM/E9QU4eBfJdKhgeQ
 daS56bZEgf26D8ARGrUN+9ANzbBTt1VhwkbfAeWBuuibHjxl2BAdNRe1QegWoRXREQlXOZjRDbU
 UHyDwcx0IaLUZub+i0pSKmvYBGdmp3NW9YcB8BQ2I/5PcIaJ27mTr48LFooKRB0rxdKWJb1nkXb
 sMDiKU5SZR1QXpI9p2Jm3x7EEdA==
X-Google-Smtp-Source: AGHT+IHgk5tFhwF30rudU5mtYNqfAuQeHF11cAlAbcY+uYtRgicaAE41/MCIBs7pCIURzp5gb19rEw==
X-Received: by 2002:a17:907:3e09:b0:afe:6648:a243 with SMTP id
 a640c23a62f3a-b049307ef09mr1831123266b.3.1757425717645; 
 Tue, 09 Sep 2025 06:48:37 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b046af12536sm1492637866b.100.2025.09.09.06.48.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Sep 2025 06:48:37 -0700 (PDT)
Date: Tue, 9 Sep 2025 15:48:35 +0200
To: John Ogness <john.ogness@linutronix.de>
Message-ID: <aMAwMz4vWC5u9OpN@pathway.suse.cz>
References: <20250902-nbcon-kgdboc-v3-0-cd30a8106f1c@suse.com>
 <20250902-nbcon-kgdboc-v3-4-cd30a8106f1c@suse.com>
 <aL77aq4gZBsn4epT@pathway.suse.cz>
 <d73e8cc0259c140a0a49f670c6c165bb662281ed.camel@suse.com>
 <84segwjbxq.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <84segwjbxq.fsf@jogness.linutronix.de>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue 2025-09-09 10:03:05,
 John Ogness wrote: > On 2025-09-08, 
 Marcos Paulo de Souza <mpdesouza@suse.com> wrote: > >> > ---
 a/kernel/debug/kdb/kdb_io.c
 > >> > +++ b/kernel/debug/kdb/kdb_io.c > >> > @ [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.218.66 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uvyiH-0001D0-AY
Subject: Re: [Kgdb-bugreport] [PATCH v3 4/4] kdb: Adapt kdb_msg_write to
 work with NBCON consoles
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Marcos Paulo de Souza <mpdesouza@suse.com>,
 Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Daniel Thompson <danielt@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 kgdb-bugreport@lists.sourceforge.net
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Tue 2025-09-09 10:03:05, John Ogness wrote:
> On 2025-09-08, Marcos Paulo de Souza <mpdesouza@suse.com> wrote:
> >> > --- a/kernel/debug/kdb/kdb_io.c
> >> > +++ b/kernel/debug/kdb/kdb_io.c
> >> > @@ -589,24 +589,40 @@ static void kdb_msg_write(const char *msg,
> >> > int msg_len)
> >> > =A0	 */
> >> > =A0	cookie =3D console_srcu_read_lock();
> >> > =A0	for_each_console_srcu(c) {
> >> > -		if (!(console_srcu_read_flags(c) & CON_ENABLED))
> >> > +		struct nbcon_write_context wctxt =3D { };
> >> > +		short flags =3D console_srcu_read_flags(c);
> >> > +
> >> > +		if (!console_is_usable(c, flags, true))
> >> > =A0			continue;
> >> > =A0		if (c =3D=3D dbg_io_ops->cons)
> >> > =A0			continue;
> >> > -		if (!c->write)
> >> > -			continue;
> >> > -		/*
> >> > -		 * Set oops_in_progress to encourage the console
> >> > drivers to
> >> > -		 * disregard their internal spin locks: in the
> >> > current calling
> >> > -		 * context the risk of deadlock is a bigger
> >> > problem than risks
> >> > -		 * due to re-entering the console driver. We
> >> > operate directly on
> >> > -		 * oops_in_progress rather than using
> >> > bust_spinlocks() because
> >> > -		 * the calls bust_spinlocks() makes on exit are
> >> > not appropriate
> >> > -		 * for this calling context.
> >> > -		 */
> >> > -		++oops_in_progress;
> >> > -		c->write(c, msg, msg_len);
> >> > -		--oops_in_progress;
> >> > +
> >> > +		if (flags & CON_NBCON) {
> >> > +			/*
> >> > +			 * Do not continue if the console is NBCON
> >> > and the context
> >> > +			 * can't be acquired.
> >> > +			 */
> >> > +			if (!nbcon_kdb_try_acquire(c, &wctxt))
> >> > +				continue;
> >> > +
> >> > +			wctxt.outbuf =3D (char *)msg;
> >> > +			wctxt.len =3D msg_len;
> >> =

> >> I double checked whether we initialized all members of the structure
> >> correctly. And I found that we didn't. We should call here:
> >> =

> >> 			nbcon_write_context_set_buf(&wctxt,
> >> 						=A0=A0=A0 &pmsg.pbufs-
> >> >outbuf[0],
> >> 						=A0=A0=A0
> >> pmsg.outbuf_len);
> =

> Nice catch.
> =

> >> Sigh, this is easy to miss. I remember that I was not super happy
> >> about this design.

I looked for details. I described my concerns at
https://lore.kernel.org/lkml/ZNY5gPNyyw9RTo4X@alley/#t

> >> But the original code initialized the structure
> >> on a single place...
> > =

> > Ok, so I'll need to also export nbcon_write_context_set_buf, since it's
> > currently static inside kernel/printk/nbcon.c. I'll do it for the next
> > version.
> =

> How about modifying nbcon_kdb_try_acquire() to also take @msg and
> @msg_len. Then, on success, @wctxt is already prepared. I do not like
> the idea of external code fiddling with the fields.

I was thinking about another solution, e.g. an nbcon_wctxt_init()
function. The problem is that wctxt->unsafe_takeover would need
to get updated after acquiring the context. And might be reused
for different consoles, ...

But wait. I do not see any code using wctxt->unsafe_takeover.

It seems that the motivation was that console drivers might
do something else when there was an unsafe_takeover in the past,
see https://lore.kernel.org/lkml/87cyz6ro62.fsf@jogness.linutronix.de/
But it seems that no console driver is using it.

So, I would prefer to remove the "unsafe_takeover" field from
struct nbcon_write_context and keep this kdb code as it is now.

We could always add it back when really needed.
Alternatively, we could create an API which could read this information
from struct wctxt.ctxt.con. But I would create this API only when
there is an user.

Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
