Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F65D1E21A5
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 26 May 2020 14:09:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jdYOP-0004QH-7d
	for lists+kgdb-bugreport@lfdr.de; Tue, 26 May 2020 12:09:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1jdYON-0004Pn-MW
 for kgdb-bugreport@lists.sourceforge.net; Tue, 26 May 2020 12:09:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kulYH3lmmnPKwAS9+Zs0TnGDE8yYdLKMfltc9Vjgfe0=; b=cbJkw2AxZ2tQehQkt9aOE5O7e/
 62AnoMICqvaBM5HRDD1s3zlKv83fCxSPqUwKsg+mMMCJ3BDkcYxAZxwA4hh8/RRGmrVvx+Rx/PGUS
 KxM/W099tYa8CDmLJd+PiKygh5w9kzBofsjBVjMk72qqChutu3WMkGxr6y1/EPCio+0k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kulYH3lmmnPKwAS9+Zs0TnGDE8yYdLKMfltc9Vjgfe0=; b=ABtE+StNNGutpqnTcm6HFfU/aD
 10jlo5oU1H6dwKHIHmYChkbxLNHrsNfiomO6dTHNUdjeOGiDTxTFNnTn+/7t4uBqPH5GDfEVBujdb
 Ba0/zGqYbea5yrTxa5LugU9OpzTSP2wL2T4OyelF0ihWmONtyHUcR8lcV2Ybuybc9Y2Y=;
Received: from mail-lf1-f65.google.com ([209.85.167.65])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jdYOJ-00GZaM-Oj
 for kgdb-bugreport@lists.sourceforge.net; Tue, 26 May 2020 12:09:11 +0000
Received: by mail-lf1-f65.google.com with SMTP id 82so12167272lfh.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 26 May 2020 05:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kulYH3lmmnPKwAS9+Zs0TnGDE8yYdLKMfltc9Vjgfe0=;
 b=OWLNLeHWpYS7i/mjtJQHfLmxjDJmeg6ICAaWI/gjdUNUqCB6IuyVTO3eP7+6UaC9ov
 AFjSHUDGNDJ1F0y6zoLxRQkI+u+GCITEap29n+N7q/KNHktDRarjizn+r2g8uaYGc/mm
 iiVuQ20JoEyWLI+XWZqkaCO6zAQNhRuJiIhTIo/E+HfOLxCilnr932+hDAQsTtHUTKtD
 s4XAXhljFRdvW6SEOkVELKzX2jEqdEFA3eIRpFlBtdw2ak8F1+Fi057vTVdyIip0jhTI
 Hq6HdPM1KYBA9lgf40mvhYM5b39Dau58MnQvxieRNn3qGidz5S49im0uzna4N0PPInUS
 lvow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kulYH3lmmnPKwAS9+Zs0TnGDE8yYdLKMfltc9Vjgfe0=;
 b=lz3TubhJg3B7HMmMDuMZq9ofmpI9A+QyODFmW+HHfZKeiMjlOb21x32JuxKmyBc2GJ
 ZUKL3uCfsDJhR0f3l+O+tqLLkWfVGCo16kmsBZf78Sag4YTgspaLu3bqnC4D7JNrEqqC
 ajCALly3QIxFR41YTCh03XsOmz5eXLWhioNLyU5nVuhSEx5zHEeR6jWpCsF0uq7+uFpw
 I/afoAts4COTbusdLNLEHNgpamEf4UkdA/7KYqTwOQ3CRfY39ce1TIecqgzHcUH8Knqk
 FxOqhDjEmCc/A6DxLFnmzSszDV7fHbYE3FwCkNcmMHSljlY3RPX8mGIXgVeGro3vgg9u
 6MMw==
X-Gm-Message-State: AOAM531lLgGuJnf0e8UUFoU9IU77ppzv45HHZFnokoieL0RFFt2EIQWw
 mEQ198upy6QuQbWBm5tdM/NGc3DKv451bowJ6MUZaW1m
X-Google-Smtp-Source: ABdhPJxnUrjRwYL1PCx9h/92qPSRPfBbMYlzq9PSv1CkoagdOL2NPMTdT2aIY/vV/6tokloW2gHDWvIe512j8u603Vg=
X-Received: by 2002:a05:6512:2027:: with SMTP id
 s7mr378257lfs.15.1590494940286; 
 Tue, 26 May 2020 05:09:00 -0700 (PDT)
MIME-Version: 1.0
References: <1590158071-15325-1-git-send-email-sumit.garg@linaro.org>
 <20200522160258.yq63iigp74u3ngtn@holly.lan>
 <CAFA6WYPrB1m1YDf54-OFNWmmTOv+8T5ZyTx14fxqZ-Jvx6fQQQ@mail.gmail.com>
 <20200526111050.qfvdlw3jp2gokktg@holly.lan>
In-Reply-To: <20200526111050.qfvdlw3jp2gokktg@holly.lan>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Tue, 26 May 2020 17:38:48 +0530
Message-ID: <CAFA6WYPhf5WEp7K7++J5Qisy=H2UF8tmShmad=Xzr23ctkOuAA@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.65 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.65 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jdYOJ-00GZaM-Oj
Subject: Re: [Kgdb-bugreport] [RFC] kdb: Switch kdb_printf to use safer
 console poll APIs
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
Cc: Petr Mladek <pmladek@suse.com>, kgdb-bugreport@lists.sourceforge.net,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Tue, 26 May 2020 at 16:40, Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> On Tue, May 26, 2020 at 01:16:17PM +0530, Sumit Garg wrote:
> > On Fri, 22 May 2020 at 21:33, Daniel Thompson
> > <daniel.thompson@linaro.org> wrote:
> > >
> > > On Fri, May 22, 2020 at 08:04:31PM +0530, Sumit Garg wrote:
> > > > In kgdb NMI context, polling driver APIs are more safer to use instead
> > > > of console APIs since the polling drivers know they will execute from
> > > > all sorts of crazy places. And for the most common use cases this would
> > > > also result in no console handler ever being called. So switch to use
> > > > polling driver APIs in case a particular console supports polling mode.
> > >
> > > This comment seems rather half hearted, not least because it doesn't
> > > explain what the current problem is nor why using the polling API is
> > > safer.
> > >
> >
> > TBH, some sentences in the above comment were borrowed from your
> > suggestion here [1]. But I agree that it doesn't portray the complete
> > picture. So how about:
> >
> > ====
> > In kgdb NMI context, calling console handlers isn't safe due to locks
> > used in those handlers which could lead to a deadlock. Although, using
> > oops_in_progress increases the chance to bypass locks in most console
> > handlers but it might not be sufficient enough in case a console uses
> > more locks (VT/TTY is good example).
> >
> > So instead switch to use lockless polling driver APIs in case a
> > particular console supports polling mode which is common for most kdb
> > use-cases and would result in no console handler ever being called.
> > ====
>
> Better, although the later paragraph still seems rather vague to me.
> Compare to:
>
> Currently when a driver provides both polling I/O and a console then kdb
> will output using the console. We can increase robustness by using the
> currently active polling I/O driver (which should be lockless) instead
> of the corresponding console. For several common cases (e.g. an
> embedded system with a single serial port that is used both for console
> output and debugger I/O) this will result in no console handler being
> used.
>

Looks good, will use it instead.

>
> > [1] https://lkml.org/lkml/2020/5/20/356
> >
> > > Compare the above against the advice in
> > > https://www.kernel.org/doc/html/latest/process/submitting-patches.html#describe-your-changes
> > > and I think it comes up short. Perhaps also consider Ingo Molnar's much
> > > more concise suggestion on describing changes:
> > >
> > > : Please use the customary changelog style we use in the kernel:
> > > :   " Current code does (A), this has a problem when (B).
> > > :   We can improve this doing (C), because (D)."
> > > -- http://lkml.iu.edu/hypermail//linux/kernel/1311.1/01157.html
> >
> > Thanks for the pointers.
> >
> > >
> > >
> > > > Suggested-by: Daniel Thompson <daniel.thompson@linaro.org>
> > > > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> > > > ---
> > > >  kernel/debug/kdb/kdb_io.c | 39 +++++++++++++++++++++++++++++++++------
> > > >  1 file changed, 33 insertions(+), 6 deletions(-)
> > > >
> > > > diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
> > > > index 3a5a068..8e0d581 100644
> > > > --- a/kernel/debug/kdb/kdb_io.c
> > > > +++ b/kernel/debug/kdb/kdb_io.c
> > > > @@ -24,6 +24,7 @@
> > > >  #include <linux/kgdb.h>
> > > >  #include <linux/kdb.h>
> > > >  #include <linux/kallsyms.h>
> > > > +#include <linux/tty_driver.h>
> > > >  #include "kdb_private.h"
> > > >
> > > >  #define CMD_BUFLEN 256
> > > > @@ -699,11 +700,24 @@ int vkdb_printf(enum kdb_msgsrc src, const char *fmt, va_list ap)
> > > >                       }
> > > >               }
> > > >               for_each_console(c) {
> > > > +                     int line;
> > > > +                     struct tty_driver *p;
> > > > +
> > > >                       if (!(c->flags & CON_ENABLED))
> > > >                               continue;
> > > > -                     ++oops_in_progress;
> > > > -                     c->write(c, cp, retlen - (cp - kdb_buffer));
> > > > -                     --oops_in_progress;
> > > > +                     p = c->device ? c->device(c, &line) : NULL;
> > > > +                     if (p && p->ops && p->ops->poll_put_char) {
> > >
> > > What prevents this logic from matching an active console that hasn't
> > > been selected as the polling driver?
> >
> > Yes you are correct and it could lead to invoking poll_put_char()
> > without poll_init(). And we couldn't invoke poll_init() here as that
> > still comes with locks and could sleep. So one way to overcome this
> > would be to pass selected polling driver via dbg_io_ops and use
> > polling APIs only if the underlying console driver matches that
> > polling driver.
>
> Agree.
>
> Note that this is all I ever expected to look at when I commented about
> before.

Okay.

>
>
> > > > +                             len = retlen - (cp - kdb_buffer);
> > > > +                             cp2 = cp;
> > > > +                             while (len--) {
> > > > +                                     p->ops->poll_put_char(p, line, *cp2);
> > > > +                                     cp2++;
> > > > +                             }
> > >
> > > Assuming it is possible to identify the console that matches the
> > > currently selected polling driver can't we just drop the
> > > is_console test and get rid of this branch entirely.
> >
> > Have a look at my suggested approach above.
> >
> > >
> > > The only reason for the is_console test is to avoid issuing messages
> > > twice so if we are able to suppress the c->write() for the same UART
> > > then is_console check becomes pointless and can go.
> >
> > I did consider removing is_console check but it looks like it's not
> > only limited to polling drivers but also used at other places (see [1]
> > [2]) as well.
> >
> > [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/usb/early/ehci-dbgp.c#n1061
> > [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/tty/serial/kgdb_nmi.c#n48
>
> IIUC you mean that the logic to match devices only works for tty drivers
> and there examples are not tty drivers.
>
> This could probably be solved but no need to get too tied in knots. It's
> fine to keep the is_console check for now.
>

Okay.

> However rather than replicate the polled I/O write code a third and
> fourth time lets get the I/O logic pulled out into proper functions.
>

Sure, will do the refactoring.

-Sumit

>
>
> Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
