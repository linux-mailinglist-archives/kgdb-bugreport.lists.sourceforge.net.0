Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E17001ECC9B
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  3 Jun 2020 11:32:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jgPl4-0004z7-OQ
	for lists+kgdb-bugreport@lfdr.de; Wed, 03 Jun 2020 09:32:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1jgPl3-0004yz-0C
 for kgdb-bugreport@lists.sourceforge.net; Wed, 03 Jun 2020 09:32:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4f1Cyl0YeI3L9KPObQmKLYBSMli65+QxBgDMxC3xLDI=; b=ZfWngGlqsuHlX3sM/DOL9Ixm6T
 QC6hMKKAgN570U9dqoRZx1RLaD5FsXRvdiwhLAQA7IdZzuHntp3iYmlU5KP3MHupcn7Z9nSY5YPwi
 HRrtme0b28GTfwQFROZMYwmemlXjM5a8jrT5tLhuf9wU3Vvp1yiAzV1fcdd4XINpqI9o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4f1Cyl0YeI3L9KPObQmKLYBSMli65+QxBgDMxC3xLDI=; b=eq/ShEMKW+jebgtqxMSD434bHX
 8PExJipih2eqtDsTF7PjqVWQZ5CY1OdxZvX3ww426ywhJaq5+OLp+xq1/ifEjDP5L/u0s1hEBpx83
 0z0QD7ne6f5ZZjnEEzc69U7PvkHsuefj3Joa0HbzrOg+2LvnRJS5c1he/F4m0EIiamx0=;
Received: from mail-lf1-f66.google.com ([209.85.167.66])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jgPkz-00AK90-2E
 for kgdb-bugreport@lists.sourceforge.net; Wed, 03 Jun 2020 09:32:24 +0000
Received: by mail-lf1-f66.google.com with SMTP id u16so870598lfl.8
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 03 Jun 2020 02:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4f1Cyl0YeI3L9KPObQmKLYBSMli65+QxBgDMxC3xLDI=;
 b=WFyguRK5TZF/ig1HlfEo56DPZl6QsdgRHwyzME5BE9Cnyzh2Tin6y4QU1grNXFyGi7
 N+BBHNjCVoSyp0epO1PvM0r3VVWE7M7b3aV4cyAxiVaeYZy4V/JpEMw0p/Vk+ZX/cMsR
 6Pfhxh2sdhOnCKXfTurwp8zJiRYQTtHBFCIwwvWuFCPGTgHDFHJtdlwVC5Qf4zMdhBn+
 KCtZHx9z/kFQYyABvuuX+NuXAWMJ/Bbe32m618ClyK4WM9RDLFndtES3lvMWfl435RkJ
 cozY/g85V6O70ZfWKJYXXrw/Kmi6KNj4Golqm2vioeoIO20wEANgjNEx9INwfPOg6ujn
 91cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4f1Cyl0YeI3L9KPObQmKLYBSMli65+QxBgDMxC3xLDI=;
 b=pTY0Jl1zTIROJ465Ct/PFUwjcuM78lmFRKKrKf5y8P6uxM+jOpOmQTE5miOvZtzl9q
 jUHVu3Od//+z4qCipi9vDTGFLLFWaLQDjBrMJ1GEAYyfoVXy4CJdyuo6GWJCNVr1uWd+
 cIxlow/8EV4BngNWOwJcVIr4Af+/Tfi+G/Xfc5MqehCfpUQw3y2ZWOL4Jb6N95voSeS/
 heh0DusKosEyzW3Xopw94LincLP+64jlfoseo2i31PZcf4lgObbJLcBcHtLm+tIAtJVG
 vLUZXJ7MIHfKhz9TZcd6zh2SG3Yn6pMddOfapKAPfRvhb0YDArlTVqiglFLJX5OIIxUZ
 btwQ==
X-Gm-Message-State: AOAM533Osnl9245yTv4IEGIubEKdwQYpOJzBI0Kv0w5So7HnPn9v7oX0
 OSUWEySxuuMToxwktLzzzieVHYoTQnYoq/WQhetQuQ==
X-Google-Smtp-Source: ABdhPJyMF3bTtwkxfKQ/zGDUE2fed47JYmAtXSJ5vvW8/FnxuQhwtIXWbzmhEspLiTN7/hirZv2g5bsjDGS/iKQTNDY=
X-Received: by 2002:ac2:41d4:: with SMTP id d20mr2002613lfi.204.1591176734387; 
 Wed, 03 Jun 2020 02:32:14 -0700 (PDT)
MIME-Version: 1.0
References: <1591168935-6382-1-git-send-email-sumit.garg@linaro.org>
 <1591168935-6382-5-git-send-email-sumit.garg@linaro.org>
 <20200603082503.GD14855@linux-b0ei>
In-Reply-To: <20200603082503.GD14855@linux-b0ei>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Wed, 3 Jun 2020 15:02:02 +0530
Message-ID: <CAFA6WYMHtXzW-VLJYhC_-7w5+1NgM8PYrNXv=-2g_GKdOO+sNQ@mail.gmail.com>
To: Petr Mladek <pmladek@suse.com>
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
X-Headers-End: 1jgPkz-00AK90-2E
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 kgdb-bugreport@lists.sourceforge.net,
 Jason Wessel <jason.wessel@windriver.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Wed, 3 Jun 2020 at 13:55, Petr Mladek <pmladek@suse.com> wrote:
>
> On Wed 2020-06-03 12:52:15, Sumit Garg wrote:
> > In kgdb context, calling console handlers aren't safe due to locks used
> > in those handlers which could in turn lead to a deadlock. Although, using
> > oops_in_progress increases the chance to bypass locks in most console
> > handlers but it might not be sufficient enough in case a console uses
> > more locks (VT/TTY is good example).
> >
> > Currently when a driver provides both polling I/O and a console then kdb
> > will output using the console. We can increase robustness by using the
> > currently active polling I/O driver (which should be lockless) instead
> > of the corresponding console. For several common cases (e.g. an
> > embedded system with a single serial port that is used both for console
> > output and debugger I/O) this will result in no console handler being
> > used.
> >
> > In order to achieve this we need to reverse the order of preference to
> > use dbg_io_ops (uses polling I/O mode) over console APIs. So we just
> > store "struct console" that represents debugger I/O in dbg_io_ops and
> > while emitting kdb messages, skip console that matches dbg_io_ops
> > console in order to avoid duplicate messages. After this change,
> > "is_console" param becomes redundant and hence removed.
> >
> > diff --git a/drivers/tty/serial/kgdboc.c b/drivers/tty/serial/kgdboc.c
> > index 4139698..6e182aa 100644
> > --- a/drivers/tty/serial/kgdboc.c
> > +++ b/drivers/tty/serial/kgdboc.c
> > @@ -558,6 +557,7 @@ static int __init kgdboc_earlycon_init(char *opt)
> >       }
> >
> >       earlycon = con;
> > +     kgdboc_earlycon_io_ops.cons = con;
> >       pr_info("Going to register kgdb with earlycon '%s'\n", con->name);
> >       if (kgdb_register_io_module(&kgdboc_earlycon_io_ops) != 0) {
> >               earlycon = NULL;
>
> Should we clear kgdboc_earlycon_io_ops.cons here when
> kgdb_register_io_module() failed?
>

AFAIK, kgdboc_earlycon_io_ops won't be used at any later stage in case
registration fails. So IMO, it would be a redundant assignment unless
I missed something.

-Sumit

> > diff --git a/include/linux/kgdb.h b/include/linux/kgdb.h
> > index c62d764..529116b 100644
> > --- a/include/linux/kgdb.h
> > +++ b/include/linux/kgdb.h
> > @@ -276,8 +276,7 @@ struct kgdb_arch {
> >   * the I/O driver.
> >   * @post_exception: Pointer to a function that will do any cleanup work
> >   * for the I/O driver.
> > - * @is_console: 1 if the end device is a console 0 if the I/O device is
> > - * not a console
> > + * @cons: valid if the I/O device is a console; else NULL.
> >   */
> >  struct kgdb_io {
> >       const char              *name;
> > @@ -288,7 +287,7 @@ struct kgdb_io {
> >       void                    (*deinit) (void);
> >       void                    (*pre_exception) (void);
> >       void                    (*post_exception) (void);
> > -     int                     is_console;
> > +     struct console          *cons;
>
> Nit: I would call it "con". The trailing 's' makes me feel that that the
>      variable points to an array or list of consoles.
>
> >  };
> >
>
> Otherwise, it looks pretty straightforward.
>
> Best Regards,
> Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
