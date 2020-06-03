Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB881ED07B
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  3 Jun 2020 15:06:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jgT5k-0006rO-7p
	for lists+kgdb-bugreport@lfdr.de; Wed, 03 Jun 2020 13:06:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1jgT5j-0006rH-9z
 for kgdb-bugreport@lists.sourceforge.net; Wed, 03 Jun 2020 13:05:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wvpZigEQhzvGX1wtVixE7CC7e2aN9bo5yvyFaTFkM/Y=; b=HMZoQJW75gX9K8wrhdNPy5zh9b
 bamf61VS7gy7wAgkOu6xS3t0bYEVzLrhdJnP4hM1/bN2keD9mp5zvWxCWFYFTXBy9scMcvEbf4PoO
 nKGfgMCURddnOXSHqX5LY1SaEWb/LK45kchmZF19dw3GCNpYHicebQ0vxGEC1tpWjPRs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wvpZigEQhzvGX1wtVixE7CC7e2aN9bo5yvyFaTFkM/Y=; b=TM0KSwxKOcsINvsHrhQTC7pS7p
 WWHKjdz2YShEi8cUtbRIMx4HB8qV9IeOnb5wFLq4euSnzZhwSJ2jxyWXKsQ/USDv9J9FvqB0Y3g4H
 mD7rmzGtNJthaY+xeujfDPi1ZgsI1Rd1+JiptHQeAy78129FbRdFiwD/cdqBKwSKqF2k=;
Received: from mail-lf1-f66.google.com ([209.85.167.66])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jgT5e-007Sbh-2B
 for kgdb-bugreport@lists.sourceforge.net; Wed, 03 Jun 2020 13:05:59 +0000
Received: by mail-lf1-f66.google.com with SMTP id 82so1277075lfh.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 03 Jun 2020 06:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wvpZigEQhzvGX1wtVixE7CC7e2aN9bo5yvyFaTFkM/Y=;
 b=KnMB87tpBGmffea+n49g6WxXpNYaovSPXxUbSJqdIT04+p0j5dX8lWbCm02J1PQHTK
 lrcxiU9R5/Of7OvRPJhojI6wud/eHYtFFCaIsIvngA4+d8d5uVul6BmVIBHwClWrzX1T
 rsCb8PYQ5Slk9YZy3Qmyzeim7jPoieXOJTTmIv3TZZ6x7Kobvgs1nXESpLQ0aACyGXJT
 pJQVexNJQmHOoE4mq14L3YLkseNBHNtK3LuHqev3ZnIbwMM1aCXIStSTPgEUPosBKZ/X
 1MtMXV5hOJ35y8y8JxLKvuRUvbPEkWDP9B5BDvdwkG0IIGA16MnsCw/Oto5lerYQu03H
 eg3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wvpZigEQhzvGX1wtVixE7CC7e2aN9bo5yvyFaTFkM/Y=;
 b=QA2tTn2DWMcgrv6x2brWIcG4mpL4hauGd3qIRmOnV8SZELbW+y8QeO3BaVMPGHTX4T
 4DIUhynfiKYxZWQ0ntTe5TwPw8GTNbMTKSRk7HWvqBkdeP06QGSqrOfI5yhrlzSYzGH2
 n3wpF17bpM2VB5XTtJeEX2b6juSpCMx+imsITs94vUYnBFoRjD3jBDjHCkTCNSj2olDr
 Hqs6iH8WE0e15VHpdbbp/r+E+sJ7JBq08N/bj2QSyMYqbidz0Dwdo53LmIeYYZnCwU0+
 rV16s0DHWKRdpJVBdyDJmOd3uO5b/TJR7c1bfYRSqffNe3bmthVMVqJr/w1jJiUocF93
 m0bQ==
X-Gm-Message-State: AOAM5320rUnjEjlpw+hZOaJOeUugxFz8uIXqXX68H4xKMzPin3ozdSiU
 WhJ7ifri2kcb1S0qJg0PGSfVzC+xjEoIbZEMUHdF6A==
X-Google-Smtp-Source: ABdhPJzSEKBux1k4uv+CzmbEtAHouEvQhIC4i8M6gS9ACULZNzAL1vkf0qJFl0Z522VDzmqj9GH9UjAATvoQezkNB8g=
X-Received: by 2002:ac2:41d4:: with SMTP id d20mr2458517lfi.204.1591189540320; 
 Wed, 03 Jun 2020 06:05:40 -0700 (PDT)
MIME-Version: 1.0
References: <1591168935-6382-1-git-send-email-sumit.garg@linaro.org>
 <1591168935-6382-5-git-send-email-sumit.garg@linaro.org>
 <20200603082503.GD14855@linux-b0ei>
 <CAFA6WYMHtXzW-VLJYhC_-7w5+1NgM8PYrNXv=-2g_GKdOO+sNQ@mail.gmail.com>
 <20200603114242.khv5yi5yweq3e2jz@holly.lan>
In-Reply-To: <20200603114242.khv5yi5yweq3e2jz@holly.lan>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Wed, 3 Jun 2020 18:35:29 +0530
Message-ID: <CAFA6WYOqJ-7Ctr46ATqvH2zRz+9biehmL85cuE+tbHRgxxpZkg@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.66 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.66 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jgT5e-007Sbh-2B
Subject: Re: [Kgdb-bugreport] [PATCH v5 4/4] kdb: Switch to use safer
 dbg_io_ops over console APIs
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Jason Wessel <jason.wessel@windriver.com>,
 kgdb-bugreport@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Wed, 3 Jun 2020 at 17:12, Daniel Thompson <daniel.thompson@linaro.org> wrote:
>
> On Wed, Jun 03, 2020 at 03:02:02PM +0530, Sumit Garg wrote:
> > On Wed, 3 Jun 2020 at 13:55, Petr Mladek <pmladek@suse.com> wrote:
> > >
> > > On Wed 2020-06-03 12:52:15, Sumit Garg wrote:
> > > > In kgdb context, calling console handlers aren't safe due to locks used
> > > > in those handlers which could in turn lead to a deadlock. Although, using
> > > > oops_in_progress increases the chance to bypass locks in most console
> > > > handlers but it might not be sufficient enough in case a console uses
> > > > more locks (VT/TTY is good example).
> > > >
> > > > Currently when a driver provides both polling I/O and a console then kdb
> > > > will output using the console. We can increase robustness by using the
> > > > currently active polling I/O driver (which should be lockless) instead
> > > > of the corresponding console. For several common cases (e.g. an
> > > > embedded system with a single serial port that is used both for console
> > > > output and debugger I/O) this will result in no console handler being
> > > > used.
> > > >
> > > > In order to achieve this we need to reverse the order of preference to
> > > > use dbg_io_ops (uses polling I/O mode) over console APIs. So we just
> > > > store "struct console" that represents debugger I/O in dbg_io_ops and
> > > > while emitting kdb messages, skip console that matches dbg_io_ops
> > > > console in order to avoid duplicate messages. After this change,
> > > > "is_console" param becomes redundant and hence removed.
> > > >
> > > > diff --git a/drivers/tty/serial/kgdboc.c b/drivers/tty/serial/kgdboc.c
> > > > index 4139698..6e182aa 100644
> > > > --- a/drivers/tty/serial/kgdboc.c
> > > > +++ b/drivers/tty/serial/kgdboc.c
> > > > @@ -558,6 +557,7 @@ static int __init kgdboc_earlycon_init(char *opt)
> > > >       }
> > > >
> > > >       earlycon = con;
> > > > +     kgdboc_earlycon_io_ops.cons = con;
> > > >       pr_info("Going to register kgdb with earlycon '%s'\n", con->name);
> > > >       if (kgdb_register_io_module(&kgdboc_earlycon_io_ops) != 0) {
> > > >               earlycon = NULL;
> > >
> > > Should we clear kgdboc_earlycon_io_ops.cons here when
> > > kgdb_register_io_module() failed?
> > >
> >
> > AFAIK, kgdboc_earlycon_io_ops won't be used at any later stage in case
> > registration fails. So IMO, it would be a redundant assignment unless
> > I missed something.
>
> Or, putting it another way, earlycon is a redundant (albeit better
> maintained) copy of kgdboc_earlycon_io_ops.cons. So I think the best
> thing to do is entirely replace earlycon with
> kgdboc_earlycon_io_ops.cons and then properly set it to NULL!
>

Sounds reasonable, will replace earlycon instead.

-Sumit

>
> Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
