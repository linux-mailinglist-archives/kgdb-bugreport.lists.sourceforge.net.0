Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B15A1E5E32
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 28 May 2020 13:26:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jeGgO-0004mk-CO
	for lists+kgdb-bugreport@lfdr.de; Thu, 28 May 2020 11:26:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1jeGgM-0004ma-Mu
 for kgdb-bugreport@lists.sourceforge.net; Thu, 28 May 2020 11:26:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QI0uMyRpyUVfiyQ9A21+QmHITWKpvKBb6pl7ZlVnkLU=; b=WEFbpbE7CU3cggZNvPvmzGjhYM
 FaPYXRvjz6/ROhq5WFjx4m1qV8d8+xUQbwVBEHnANyDeQVe9+01nDZ1cOhl+Jc3ei1AeAV4JvZ5C7
 WRgMNgfhXpaVtESkkEWcMai2+e1UOKH3y9v8hh0wAFN3oNlMgyMjYoAM6e7Jx4lqDo1w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QI0uMyRpyUVfiyQ9A21+QmHITWKpvKBb6pl7ZlVnkLU=; b=PVJADvIp4viU/kCarNUM5TXm4B
 oki/qbkibbCU/KGp7J50KLBLFYlbY9Q12CHLi9iaXa49QKmXXo/S5TesdMoilN8P4YOrrtStBMxrs
 V+J07/exf/QP/Iy5mQ94/CIsphv10nFP9NNfMxd1zeaoi4Y9o6EzwN7I8skHDGICbZ1c=;
Received: from mail-wm1-f66.google.com ([209.85.128.66])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jeGgH-00G0o3-9D
 for kgdb-bugreport@lists.sourceforge.net; Thu, 28 May 2020 11:26:42 +0000
Received: by mail-wm1-f66.google.com with SMTP id v19so2756521wmj.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 28 May 2020 04:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=QI0uMyRpyUVfiyQ9A21+QmHITWKpvKBb6pl7ZlVnkLU=;
 b=XuOAqieP0JKPBcrD4JXy7Ahd8AL5ann4RiGJwda152wXgscSvpSEnsGYN0KglRNEGo
 W4V022k6MW0ywFfN2si52bTvMb/hBGQ1Dkz1OMcpdSL1K76IgZpchB7vxNHPNjkgn3L5
 AhbgB3PVX9+5vbPaPudL42VPfSdnDzpb1hvhxQQ+YaL0h5mtnefYNZX2jqT3nhSvMYnA
 ogIz5jCs/F+kU1xx5cWZ3yx6f44OReozWAsU+zBj7vR0DB+ZeRH/Q0PgFKhlXMxTi8Fi
 CQLooY5EWNWH/Q/aO3eHAhNJxEqcbKIDq6u3/weNX/6Wqziw9LjzFPukK9Nwa0wOUIPW
 dqzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QI0uMyRpyUVfiyQ9A21+QmHITWKpvKBb6pl7ZlVnkLU=;
 b=itzzp7ojxnVJo7PkaIpffsNLkdL3844QTByUUDQmiX+K76eSfjojfHc1UvI6cnIJjz
 2gU1O7KPZn9N7iFJKqH2TzTyHxsmNT4YyAJSHCGPWNrHahdiGrQOBIKAnsceRsV6Xrlw
 ZjaG2yZbtlIVZRy8vKZEm0O5YdYfRS68pR8K+1Caw6lh1o7Eo40/fmifKGmuBJYzvdcP
 F0lJ+nEj2PEZGnyLY5GK7EBLDNSl+YUeNNex2X8bVvk+9lRW/zl2gWrZp5acwJwWl22Y
 AHJwE4JKxhyUTHU8f65nrxsDDUImnCBNFtcYTYYgTVUaqJblVwCXVd+x5XBMQIcrjsMS
 tRHQ==
X-Gm-Message-State: AOAM5324tAgIb+8H1rj2LNLiwgIq31a5SmCmOTM9FE7/30TBwP/qXqhM
 JUDTRJhRyNRStPaY4mfhc90uaQ==
X-Google-Smtp-Source: ABdhPJyw1K/UTv9s3mKkITvD/45g7/asPJYuE10f7jwMjiiAQtQEDrlLcheyNvZIzJ3fgjcPaYrnUA==
X-Received: by 2002:a1c:4b02:: with SMTP id y2mr2845308wma.115.1590665183165; 
 Thu, 28 May 2020 04:26:23 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id w10sm5680363wrp.16.2020.05.28.04.26.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2020 04:26:22 -0700 (PDT)
Date: Thu, 28 May 2020 12:26:20 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Sumit Garg <sumit.garg@linaro.org>
Message-ID: <20200528112620.a6zhgnkl2izuggsa@holly.lan>
References: <1590560759-21453-1-git-send-email-sumit.garg@linaro.org>
 <1590560759-21453-5-git-send-email-sumit.garg@linaro.org>
 <20200527133115.x5hqzttsg73saiky@holly.lan>
 <CAFA6WYNeBDRdRqb8dB5HA923ujD3zq7JEQQnV4WJr_fthCc=GQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFA6WYNeBDRdRqb8dB5HA923ujD3zq7JEQQnV4WJr_fthCc=GQ@mail.gmail.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.66 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.66 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jeGgH-00G0o3-9D
Subject: Re: [Kgdb-bugreport] [PATCH v3 4/4] kdb: Switch kdb_msg_write() to
 use safer polling I/O
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

On Thu, May 28, 2020 at 11:48:48AM +0530, Sumit Garg wrote:
> On Wed, 27 May 2020 at 19:01, Daniel Thompson
> <daniel.thompson@linaro.org> wrote:
> >
> > On Wed, May 27, 2020 at 11:55:59AM +0530, Sumit Garg wrote:
> > > In kgdb NMI context, calling console handlers isn't safe due to locks
> > > used in those handlers which could lead to a deadlock. Although, using
> > > oops_in_progress increases the chance to bypass locks in most console
> > > handlers but it might not be sufficient enough in case a console uses
> > > more locks (VT/TTY is good example).
> > >
> > > Currently when a driver provides both polling I/O and a console then kdb
> > > will output using the console. We can increase robustness by using the
> > > currently active polling I/O driver (which should be lockless) instead
> > > of the corresponding console. For several common cases (e.g. an
> > > embedded system with a single serial port that is used both for console
> > > output and debugger I/O) this will result in no console handler being
> > > used.
> >
> > Not sure I would have predicted all those changes to kgdboc.c based on
> > this patch description. I assume this is to help identify which console
> > matches our dbg_io_ops but it would be good to spell this out.
> >
> 
> Okay, will add the corresponding description.
> 
> >
> > > Suggested-by: Daniel Thompson <daniel.thompson@linaro.org>
> > > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> > > ---
> > >  drivers/tty/serial/kgdboc.c | 17 ++++++++---------
> > >  include/linux/kgdb.h        |  2 ++
> > >  kernel/debug/kdb/kdb_io.c   | 46 +++++++++++++++++++++++++++++++--------------
> > >  3 files changed, 42 insertions(+), 23 deletions(-)
> > >
> > > diff --git a/drivers/tty/serial/kgdboc.c b/drivers/tty/serial/kgdboc.c
> > > index c9f94fa..6199fe1 100644
> > > --- a/drivers/tty/serial/kgdboc.c
> > > +++ b/drivers/tty/serial/kgdboc.c
> > > @@ -35,7 +35,6 @@ static struct kparam_string kps = {
> > >  };
> > >
> > >  static int kgdboc_use_kms;  /* 1 if we use kernel mode switching */
> > > -static struct tty_driver     *kgdb_tty_driver;
> > >  static int                   kgdb_tty_line;
> > >
> > >  #ifdef CONFIG_KDB_KEYBOARD
> > > @@ -154,7 +153,7 @@ static int configure_kgdboc(void)
> > >       }
> > >
> > >       kgdboc_io_ops.is_console = 0;
> > > -     kgdb_tty_driver = NULL;
> > > +     kgdboc_io_ops.tty_drv = NULL;
> > >
> > >       kgdboc_use_kms = 0;
> > >       if (strncmp(cptr, "kms,", 4) == 0) {
> > > @@ -178,7 +177,7 @@ static int configure_kgdboc(void)
> > >               }
> > >       }
> > >
> > > -     kgdb_tty_driver = p;
> > > +     kgdboc_io_ops.tty_drv = p;
> > >       kgdb_tty_line = tty_line;
> > >
> > >  do_register:
> > > @@ -216,18 +215,18 @@ static int __init init_kgdboc(void)
> > >
> > >  static int kgdboc_get_char(void)
> > >  {
> > > -     if (!kgdb_tty_driver)
> > > +     if (!kgdboc_io_ops.tty_drv)
> > >               return -1;
> > > -     return kgdb_tty_driver->ops->poll_get_char(kgdb_tty_driver,
> > > -                                             kgdb_tty_line);
> > > +     return kgdboc_io_ops.tty_drv->ops->poll_get_char(kgdboc_io_ops.tty_drv,
> > > +                                                      kgdb_tty_line);
> > >  }
> > >
> > >  static void kgdboc_put_char(u8 chr)
> > >  {
> > > -     if (!kgdb_tty_driver)
> > > +     if (!kgdboc_io_ops.tty_drv)
> > >               return;
> > > -     kgdb_tty_driver->ops->poll_put_char(kgdb_tty_driver,
> > > -                                     kgdb_tty_line, chr);
> > > +     kgdboc_io_ops.tty_drv->ops->poll_put_char(kgdboc_io_ops.tty_drv,
> > > +                                               kgdb_tty_line, chr);
> > >  }
> > >
> > >  static int param_set_kgdboc_var(const char *kmessage,
> > > diff --git a/include/linux/kgdb.h b/include/linux/kgdb.h
> > > index b072aeb..05d165d 100644
> > > --- a/include/linux/kgdb.h
> > > +++ b/include/linux/kgdb.h
> > > @@ -275,6 +275,7 @@ struct kgdb_arch {
> > >   * for the I/O driver.
> > >   * @is_console: 1 if the end device is a console 0 if the I/O device is
> > >   * not a console
> > > + * @tty_drv: Pointer to polling tty driver.
> > >   */
> > >  struct kgdb_io {
> > >       const char              *name;
> > > @@ -285,6 +286,7 @@ struct kgdb_io {
> > >       void                    (*pre_exception) (void);
> > >       void                    (*post_exception) (void);
> > >       int                     is_console;
> > > +     struct tty_driver       *tty_drv;
> >
> > Should this be a struct tty_driver or a struct console?
> >
> > In other words if the lifetime the console structure is the same as the
> > tty_driver then isn't it better to capture the console instead
> > (easier to compare and works with non-tty devices such as the
> > USB debug mode).
> >
> 
> IIUC, you mean to say we can easily replace "is_console" with "struct
> console". This sounds feasible and should be a straightforward
> comparison in order to prefer "dbg_io_ops" over console handlers. So I
> will switch to use "struct console" instead.

My comment contains an if ("if the lifetime of the console structure is
the same") so you need to check that it is true before sharing a patch to
make the change.


Daniel.

> 
> >
> > >  };
> > >
> > >  extern const struct kgdb_arch                arch_kgdb_ops;
> > > diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
> > > index f848482..c2efa52 100644
> > > --- a/kernel/debug/kdb/kdb_io.c
> > > +++ b/kernel/debug/kdb/kdb_io.c
> > > @@ -24,6 +24,7 @@
> > >  #include <linux/kgdb.h>
> > >  #include <linux/kdb.h>
> > >  #include <linux/kallsyms.h>
> > > +#include <linux/tty_driver.h>
> > >  #include "kdb_private.h"
> > >
> > >  #define CMD_BUFLEN 256
> > > @@ -542,13 +543,18 @@ static int kdb_search_string(char *searched, char *searchfor)
> > >       return 0;
> > >  }
> > >
> > > -static void kdb_io_write(char *cp, int len, void (*io_put_char)(u8 ch))
> > > +static void kdb_io_write(char *cp, int len, void (*io_put_char)(u8),
> > > +                      struct tty_driver *p, int line,
> > > +                      void (*poll_put_char)(struct tty_driver *, int, char))
> >
> > Judging from your reply to comment 1 I guess this is already on the list
> > to eliminate ;-).
> >
> 
> Yeah.
> 
> -Sumit
> 
> >
> > Daniel.
> >
> >
> > >  {
> > >       if (len <= 0)
> > >               return;
> > >
> > >       while (len--) {
> > > -             io_put_char(*cp);
> > > +             if (io_put_char)
> > > +                     io_put_char(*cp);
> > > +             if (poll_put_char)
> > > +                     poll_put_char(p, line, *cp);
> > >               cp++;
> > >       }
> > >  }
> > > @@ -561,22 +567,34 @@ static void kdb_msg_write(char *msg, int msg_len)
> > >               return;
> > >
> > >       if (dbg_io_ops && !dbg_io_ops->is_console)
> > > -             kdb_io_write(msg, msg_len, dbg_io_ops->write_char);
> > > +             kdb_io_write(msg, msg_len, dbg_io_ops->write_char,
> > > +                          NULL, 0, NULL);
> > >
> > >       for_each_console(c) {
> > > +             int line;
> > > +             struct tty_driver *p;
> > > +
> > >               if (!(c->flags & CON_ENABLED))
> > >                       continue;
> > > -             /*
> > > -              * While rounding up CPUs via NMIs, its possible that
> > > -              * a rounded up CPU maybe holding a console port lock
> > > -              * leading to kgdb master CPU stuck in a deadlock during
> > > -              * invocation of console write operations. So in order
> > > -              * to avoid such a deadlock, enable oops_in_progress
> > > -              * prior to invocation of console handlers.
> > > -              */
> > > -             ++oops_in_progress;
> > > -             c->write(c, msg, msg_len);
> > > -             --oops_in_progress;
> > > +
> > > +             p = c->device ? c->device(c, &line) : NULL;
> > > +             if (p && dbg_io_ops && p == dbg_io_ops->tty_drv && p->ops &&
> > > +                 p->ops->poll_put_char) {
> > > +                     kdb_io_write(msg, msg_len, NULL, p, line,
> > > +                                  p->ops->poll_put_char);
> > > +             } else {
> > > +                     /*
> > > +                      * While rounding up CPUs via NMIs, its possible that
> > > +                      * a rounded up CPU maybe holding a console port lock
> > > +                      * leading to kgdb master CPU stuck in a deadlock during
> > > +                      * invocation of console write operations. So in order
> > > +                      * to avoid such a deadlock, enable oops_in_progress
> > > +                      * prior to invocation of console handlers.
> > > +                      */
> > > +                     ++oops_in_progress;
> > > +                     c->write(c, msg, msg_len);
> > > +                     --oops_in_progress;
> > > +             }
> > >               touch_nmi_watchdog();
> > >       }
> > >  }
> > > --
> > > 2.7.4
> > >


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
