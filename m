Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE3F1E1C78
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 26 May 2020 09:46:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jdUIL-0000HS-Pq
	for lists+kgdb-bugreport@lfdr.de; Tue, 26 May 2020 07:46:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1jdUIK-0000HD-JI
 for kgdb-bugreport@lists.sourceforge.net; Tue, 26 May 2020 07:46:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vQ87BRHcrbqQygTpbGAEYk24csbidXVhewCA+tV163o=; b=HLzSF3+fquPOdsjmVjtNMPmLya
 NL/FufhOLFiiurExmXsk1kofvyGZbL45BQ2c63EhnIiYNkgPdBX2oOYk6Erg9FXhO2FDtqxiqEgUz
 VyWh77lpk3OJecz9JIJ62CzEClLmtpD+wLag/ATwhIUeGiMEHkmumVLcaapIKVjOxGx8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vQ87BRHcrbqQygTpbGAEYk24csbidXVhewCA+tV163o=; b=B7w11FvPiv8/ghP4f5FG0VrXLV
 YSYLB9XEB9LZvfKZbvLD/o1dhF7ShFZKKLx19AxPImtQl4IV/hW4J1tzq1+TDp3xngTF6RxidBEH5
 ioOK5+fZUEF2Npbo1IjGQX6aD63NggkXWQ3i8VlXHTmbwRNYAK7pbqntRMG3HJbw1tRQ=;
Received: from mail-lj1-f195.google.com ([209.85.208.195])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jdUIF-00DJJM-EV
 for kgdb-bugreport@lists.sourceforge.net; Tue, 26 May 2020 07:46:40 +0000
Received: by mail-lj1-f195.google.com with SMTP id z6so23250832ljm.13
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 26 May 2020 00:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vQ87BRHcrbqQygTpbGAEYk24csbidXVhewCA+tV163o=;
 b=pT0dqlfYxNrmxZdJ7WcBG4vZvY0NSYhHnfTgOqxbzTgplNWrJvfxj2dwhgG/ZYJ+d2
 K+qSDuDx2TIaYLEHN/5AhVNqf2paivkjNzq8qsUwOCW+oYXLut0oPOFgkL0SK4pZJ7Tf
 MdsveoS22AHeRiuF+n5JfJ92kQHFs74x1/InPAnwc3pD7tK66aYEiMxm/Doxseo3Ewu+
 Ll9IxV6NfRNUOr+JV/pNljARCa8v5goHEUePN4aSQ8GVQgRVSGS5Yf+eCuCjm4KWAPz3
 DSXkrVVMKfXnPOfBFu574U+SmKIKsOoPJf/vkXAaq3WZ9TWxReJXujA47v2tTuprGdUd
 s/mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vQ87BRHcrbqQygTpbGAEYk24csbidXVhewCA+tV163o=;
 b=rJjh7NnaKxUh2fZh5eZqdxoVWStwGN6Y0TeUiCn6GM/4M4TkZXxfvb/ZmwU9c/Q9Il
 jl1yC2m8MtZhJu2HFggOPnF/G8Ij8iE3/3Yr40Fu1obJ1axQuh8UD9EXkgUr3zZosqJ8
 yC8tUou9fh75PvWrUqbV9+Wq3b4EJjrSSDTOAo3hkYDD8rugCCZJ44O5HnTKNp7Bkilg
 GdgpPW59F/PvM3/jZmDol/y1W4sele2PaQAA2Dm7qXbevRygYWSHe0CbpYKBpOjARn5o
 tUDzSLZ2tGWYYEfOpHA3Dx5hbwzZv+OT2NnW3HwOAucfwj7HE175wclhIwOq+zH7lrpK
 Garw==
X-Gm-Message-State: AOAM532y+hSSWKR4MFkKf/JNbUkAQy8spc9rG0zstlXpv9FRrUdcCP8T
 gUQGjNV5CjSJkb5YsPI6kHAO9rAvwBlzpWoMQyUxuw==
X-Google-Smtp-Source: ABdhPJyrR0ZnDKgzWGnWJfcKQzfDfE5kOqq6TuQGhpDG/FxS6lpzsuhsxTuhxNGYNouSj0csLuiPjgvGwKcVgeMt/Fk=
X-Received: by 2002:a2e:2204:: with SMTP id i4mr1157007lji.110.1590479188783; 
 Tue, 26 May 2020 00:46:28 -0700 (PDT)
MIME-Version: 1.0
References: <1590158071-15325-1-git-send-email-sumit.garg@linaro.org>
 <20200522160258.yq63iigp74u3ngtn@holly.lan>
In-Reply-To: <20200522160258.yq63iigp74u3ngtn@holly.lan>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Tue, 26 May 2020 13:16:17 +0530
Message-ID: <CAFA6WYPrB1m1YDf54-OFNWmmTOv+8T5ZyTx14fxqZ-Jvx6fQQQ@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: lkml.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.195 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.195 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jdUIF-00DJJM-EV
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

On Fri, 22 May 2020 at 21:33, Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> On Fri, May 22, 2020 at 08:04:31PM +0530, Sumit Garg wrote:
> > In kgdb NMI context, polling driver APIs are more safer to use instead
> > of console APIs since the polling drivers know they will execute from
> > all sorts of crazy places. And for the most common use cases this would
> > also result in no console handler ever being called. So switch to use
> > polling driver APIs in case a particular console supports polling mode.
>
> This comment seems rather half hearted, not least because it doesn't
> explain what the current problem is nor why using the polling API is
> safer.
>

TBH, some sentences in the above comment were borrowed from your
suggestion here [1]. But I agree that it doesn't portray the complete
picture. So how about:

====
In kgdb NMI context, calling console handlers isn't safe due to locks
used in those handlers which could lead to a deadlock. Although, using
oops_in_progress increases the chance to bypass locks in most console
handlers but it might not be sufficient enough in case a console uses
more locks (VT/TTY is good example).

So instead switch to use lockless polling driver APIs in case a
particular console supports polling mode which is common for most kdb
use-cases and would result in no console handler ever being called.
====

[1] https://lkml.org/lkml/2020/5/20/356

> Compare the above against the advice in
> https://www.kernel.org/doc/html/latest/process/submitting-patches.html#describe-your-changes
> and I think it comes up short. Perhaps also consider Ingo Molnar's much
> more concise suggestion on describing changes:
>
> : Please use the customary changelog style we use in the kernel:
> :   " Current code does (A), this has a problem when (B).
> :   We can improve this doing (C), because (D)."
> -- http://lkml.iu.edu/hypermail//linux/kernel/1311.1/01157.html

Thanks for the pointers.

>
>
> > Suggested-by: Daniel Thompson <daniel.thompson@linaro.org>
> > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> > ---
> >  kernel/debug/kdb/kdb_io.c | 39 +++++++++++++++++++++++++++++++++------
> >  1 file changed, 33 insertions(+), 6 deletions(-)
> >
> > diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
> > index 3a5a068..8e0d581 100644
> > --- a/kernel/debug/kdb/kdb_io.c
> > +++ b/kernel/debug/kdb/kdb_io.c
> > @@ -24,6 +24,7 @@
> >  #include <linux/kgdb.h>
> >  #include <linux/kdb.h>
> >  #include <linux/kallsyms.h>
> > +#include <linux/tty_driver.h>
> >  #include "kdb_private.h"
> >
> >  #define CMD_BUFLEN 256
> > @@ -699,11 +700,24 @@ int vkdb_printf(enum kdb_msgsrc src, const char *fmt, va_list ap)
> >                       }
> >               }
> >               for_each_console(c) {
> > +                     int line;
> > +                     struct tty_driver *p;
> > +
> >                       if (!(c->flags & CON_ENABLED))
> >                               continue;
> > -                     ++oops_in_progress;
> > -                     c->write(c, cp, retlen - (cp - kdb_buffer));
> > -                     --oops_in_progress;
> > +                     p = c->device ? c->device(c, &line) : NULL;
> > +                     if (p && p->ops && p->ops->poll_put_char) {
>
> What prevents this logic from matching an active console that hasn't
> been selected as the polling driver?

Yes you are correct and it could lead to invoking poll_put_char()
without poll_init(). And we couldn't invoke poll_init() here as that
still comes with locks and could sleep. So one way to overcome this
would be to pass selected polling driver via dbg_io_ops and use
polling APIs only if the underlying console driver matches that
polling driver.

>
>
> > +                             len = retlen - (cp - kdb_buffer);
> > +                             cp2 = cp;
> > +                             while (len--) {
> > +                                     p->ops->poll_put_char(p, line, *cp2);
> > +                                     cp2++;
> > +                             }
>
> Assuming it is possible to identify the console that matches the
> currently selected polling driver can't we just drop the
> is_console test and get rid of this branch entirely.

Have a look at my suggested approach above.

>
> The only reason for the is_console test is to avoid issuing messages
> twice so if we are able to suppress the c->write() for the same UART
> then is_console check becomes pointless and can go.

I did consider removing is_console check but it looks like it's not
only limited to polling drivers but also used at other places (see [1]
[2]) as well.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/usb/early/ehci-dbgp.c#n1061
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/tty/serial/kgdb_nmi.c#n48

>
>
> > +                     } else {
> > +                             ++oops_in_progress;
> > +                             c->write(c, cp, retlen - (cp - kdb_buffer));
> > +                             --oops_in_progress;
> > +                     }
> >                       touch_nmi_watchdog();
> >               }
> >       }
> > @@ -765,11 +779,24 @@ int vkdb_printf(enum kdb_msgsrc src, const char *fmt, va_list ap)
> >                       }
> >               }
> >               for_each_console(c) {
> > +                     int line;
> > +                     struct tty_driver *p;
> > +
> >                       if (!(c->flags & CON_ENABLED))
> >                               continue;
> > -                     ++oops_in_progress;
> > -                     c->write(c, moreprompt, strlen(moreprompt));
> > -                     --oops_in_progress;
> > +                     p = c->device ? c->device(c, &line) : NULL;
> > +                     if (p && p->ops && p->ops->poll_put_char) {
> > +                             len = strlen(moreprompt);
> > +                             cp = moreprompt;
> > +                             while (len--) {
> > +                                     p->ops->poll_put_char(p, line, *cp);
> > +                                     cp++;
> > +                             }
> > +                     } else {
> > +                             ++oops_in_progress;
> > +                             c->write(c, moreprompt, strlen(moreprompt));
> > +                             --oops_in_progress;
> > +                     }
>
> Maybe also consider pulling the string emit to a separate function.
>

Okay.

-Sumit

>
> Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
