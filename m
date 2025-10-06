Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC10BBE422
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 06 Oct 2025 15:59:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NRUwRN0FjLu/m5C/i+jL10ff4AA+E0UpA+qS01Bhqrk=; b=cNQLAKuXg3hTDE+de03SmkWwm3
	JeeMeOI5z/Xc8xsBfqDbefJ+dvVtTB3/nplk/AlAYHmhE02jsk7YmUivO4XQQNWAq1Kj9sgNh6ckg
	xIqQTCkbkEhk7D1L67anPWoh3JO6yptP/QT1e/cIaofxoA1Hnnno/dVhOWS3QHzbV7rw=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1v5lkK-0006GE-OU
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 06 Oct 2025 13:59:24 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1v5ljs-0006FQ-Ii
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 06 Oct 2025 13:58:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=t7FyJ6ZNCpZC3ZZiSi8rs4q34qq1Mtarm5I9fCpvcYs=; b=mGWYRDhhn9eFohExHln1LYOKYm
 Bi9KH+gubHaGUfrk9Lwkw3wqdZVbA8rPUYk+KE0mYCeY7M/rUb0P0msp4JRle+PU2q77gqdcYGOnP
 J9Hclqhe9+ItmBPl7vUldsjvMS/33rEXoMgiasyY1XjrBN6lrrZbulqAaPRF3M6MMKJQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=t7FyJ6ZNCpZC3ZZiSi8rs4q34qq1Mtarm5I9fCpvcYs=; b=SVWb/Mj4ZP0HM0JLpdLvgFVcfW
 O2eAISfrBIyPRablKSm87LXdqvAeuTlMtlLB7N9X5K8hkGCoRR4tT3TmsOGpRo5fJFNWQcURmoLSg
 zKPE/F1QrB7vVQJVcwL4k0bgAyZnS8Qsu25DPxwZ4QL5QjFERvD2o9iOVcRTl8bJOS68=;
Received: from mail-ed1-f46.google.com ([209.85.208.46])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1v5ljY-0004Q9-G1 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 06 Oct 2025 13:58:37 +0000
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-6349e3578adso8912072a12.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 06 Oct 2025 06:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1759759105; x=1760363905; darn=lists.sourceforge.net; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=t7FyJ6ZNCpZC3ZZiSi8rs4q34qq1Mtarm5I9fCpvcYs=;
 b=Dz5UChC5pXD1H7o/gBMQ1nBNlRgwYJdAcLNIANQBTdvslh+IlWVyM8K75CgrOgUEJF
 2tfA+VlH6aEc29JzuQM+Jznl5wAfC38WI4qDSulzqsvzLuo+l2+qTXQkLZZwLfSwNgvc
 oVzxydGBP943wGOaFUs4kSn6EKJiGKqiXcc1sqmspcWnl3CZy+WKIYGxvA747wePI53n
 CKodniNO5vQcT7laTXkAgpveacnV7U2EbuabELdgKjDdAVvTn2Iuv0oFTpH5m6ZfeM5u
 rJw/0pnxWZLAm3Fht8RR+tKvnMVCSM9NzcPVLnDZhDC5lEyHemjL+E/Lcjo1j1NOHqei
 a5Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759759105; x=1760363905;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t7FyJ6ZNCpZC3ZZiSi8rs4q34qq1Mtarm5I9fCpvcYs=;
 b=jvWcNlOSJjb+HjwUOyb54ux24evVILjd5lYOB2KulZtfwCu00IPBV6sejNTW7wNy9g
 fm49+H+8kP4YQtfnS+YQ4qbLTv3YkBSyCYD0OUyM5YeTjH74yWnFbnpVHayS/L/N7q3o
 X2IYPLqJI5NZDgTYq3K+36joTw0DtLuN/kvyBdEvO3epyA7lC4l69illaXBBTAawqCjZ
 DATkpzSJe+OjVbKL8B++tSQZCbfYmYFcFgywglv+Xxq0VbUTDGitIvIHzC+7Kk+h+0QA
 TPes42Bc0bneLONZG7JJoafA9nVmLRUXQkagNlxbWaBQwb4kX7Lx+BlIIkDdarWibza+
 Tm9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrjrcwkt23gGeeWBNiHehINHYFN8o99+julnTPNlPBacKTKg6yEk96jIAQpcNR3jdtlMCEjXHMd6eXNYw9IQ==@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxB91xU4HwWdhQto7Eocw1gbtSNqRG13COwTAtvLur1k4yHCpj1
 HuRpY+2MC3XQg0lu3S0ESda1nnG34eUMrAx8ChSwhpWEKbyOmKqFpfM9Pb7iZ9yJbCg=
X-Gm-Gg: ASbGnctvxuLYNQ5/HTGvyTk5BKdC8HLqQ1KLMXYx6nPMNQSOwFSEXfkhi393kLGEQQQ
 TlErow3DQzCJ6RtuWLWTRD3Rfe9uYXpYxx18Kbvpz0AnRB+AtzZ8NHRTVeKD2iuTHWJ1hEvNalK
 E+/UH+tbx3m5sDeoRyp3oH7X+xQiAuo5wQGmCXIYiDWIpkhTwEHy69ShQJ0QIi0f+0/IcmcpmLz
 2CA5KpbqDQKCEOPtiHfsFg4aQdj3PEFsuscxXJTOH2N2EgqjXWUHt7/484wwqIEp5gMldQJKli2
 vzq7selPM2sOV0hNtNb/OxLKmbg8wnMOmOoveJqA3RSSyNdbnEkDCZfNTTCDciuAU6a8G5op890
 xbgKWChXpV0q7ayzN3pfUwRUuiYFTXhCXdzX5cXyfHoGwY6OJkfec5MctrPsN
X-Google-Smtp-Source: AGHT+IFV2SJ4kzBGN402SmNw/Wkg3HuCOd29mUk2xP3fAhXRSYMPNwRBZ0YPC6/b3KAmvr60S4ff+Q==
X-Received: by 2002:a17:907:3d42:b0:b41:2fd0:2dd4 with SMTP id
 a640c23a62f3a-b49c449a697mr1576655566b.61.1759759104873; 
 Mon, 06 Oct 2025 06:58:24 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b48652aa040sm1145209266b.20.2025.10.06.06.58.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Oct 2025 06:58:24 -0700 (PDT)
Date: Mon, 6 Oct 2025 15:58:22 +0200
To: John Ogness <john.ogness@linutronix.de>
Message-ID: <aOPK_jgFJwM0TWTY@pathway.suse.cz>
References: <20250930-nbcon-kgdboc-v5-0-8125893cfb4f@suse.com>
 <20250930-nbcon-kgdboc-v5-2-8125893cfb4f@suse.com>
 <84h5wihdqu.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <84h5wihdqu.fsf@jogness.linutronix.de>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed 2025-10-01 17:02:41,
 John Ogness wrote: > On 2025-09-30, 
 Marcos Paulo de Souza <mpdesouza@suse.com> wrote: > > diff --git
 a/kernel/printk/nbcon.c
 b/kernel/printk/nbcon.c > > index 558ef31779760 [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.46 listed in wl.mailspike.net]
X-Headers-End: 1v5ljY-0004Q9-G1
Subject: Re: [Kgdb-bugreport] [PATCH v5 2/5] printk: nbcon: Introduce KDB
 helpers
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Wed 2025-10-01 17:02:41, John Ogness wrote:
> On 2025-09-30, Marcos Paulo de Souza <mpdesouza@suse.com> wrote:
> > diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
> > index 558ef31779760340ce42608294d91d5401239f1d..c23abed5933527cb7c6bcc42057fadbb44a43446 100644
> > --- a/kernel/printk/nbcon.c
> > +++ b/kernel/printk/nbcon.c
> > +/**
> > + * nbcon_kdb_release - Exit unsafe section and release the nbcon console
> > + *
> > + * @wctxt:	The nbcon write context initialized by a successful
> > + *		nbcon_kdb_try_acquire()
> > + *
> > + * Context:	Under console_srcu_read_lock() for emiting a single kdb message
> 
>                                        emitting ---^^^^^^^
> 
> > + *		using the given con->write_atomic() callback. Can be called
> > + *		only when the console is usable at the moment.
> 
> I do not think the "Context" is relevant. It must be called if
> a previous call to nbcon_kdb_try_acquire() was successful.

Makes sense. I am fine with removing the "Context:" secion completely
from nbcon_kdb_release().

Just to be sure. I think that we do not need to mention that it can
be called only when nbcon_kdb_try_acquire() succeeded. It is kind
of obvious.

Best Regards,
Petr

> > + */
> > +void nbcon_kdb_release(struct nbcon_write_context *wctxt)
> > +{
> > +	struct nbcon_context *ctxt = &ACCESS_PRIVATE(wctxt, ctxt);
> > +
> > +	if (!nbcon_context_exit_unsafe(ctxt))
> > +		return;
> > +
> > +	nbcon_context_release(ctxt);
> > +
> > +	/*
> > +	 * Flush any new printk() messages added when the console was blocked.
> > +	 * Only the console used by the given write context was	blocked.
> > +	 * The console was locked only when the write_atomic() callback
> > +	 * was usable.
> > +	 */
> > +	__nbcon_atomic_flush_pending_con(ctxt->console,
> > +					 prb_next_reserve_seq(prb), false);
> 
> This can all be one line. 100 characters is the official limit for code.
> 
> > +}


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
