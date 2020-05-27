Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2E71E3E60
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 27 May 2020 12:01:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jdssO-0002Pq-EM
	for lists+kgdb-bugreport@lfdr.de; Wed, 27 May 2020 10:01:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1jdssN-0002Pj-Hy
 for kgdb-bugreport@lists.sourceforge.net; Wed, 27 May 2020 10:01:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Va7soqusV/pdX9tabvM6g0huhayPHF2tLgZz5g1TrtQ=; b=HWKfj0TXH2BTRJt5SNh7gZaX9H
 4jMBVSAr60kQm68TyS03WenqmJYfzWNVxeJC7b76CpOky/jmKFRasdbAszYMKipEyEegCEUV2v0U/
 ywEK+zjXOPSzp5ZfUPDf1GiQ0xuznHdGxi6Nr2Ly3MJTQ9wRrcQ/85m+9a1go0wVOGPg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Va7soqusV/pdX9tabvM6g0huhayPHF2tLgZz5g1TrtQ=; b=U7o/uHT1PWjG1bcAgCsnSqxOeZ
 nxwtYLCV/n2YxJy+uVfDrdK4pCEqxRTfKc+qfqjSpGCDOB80Ix7S+LBjxSzryGsgPe5nOHtSGoJUM
 cq1GH0V9N/RGVYl6WOq2weQtShTnGhQQjORqOG5ha33KsrBDAMiXyJhbdXIyYEuOKrWg=;
Received: from mail-lf1-f68.google.com ([209.85.167.68])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jdssJ-00932b-Mi
 for kgdb-bugreport@lists.sourceforge.net; Wed, 27 May 2020 10:01:31 +0000
Received: by mail-lf1-f68.google.com with SMTP id u16so12350834lfl.8
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 27 May 2020 03:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Va7soqusV/pdX9tabvM6g0huhayPHF2tLgZz5g1TrtQ=;
 b=er5fM2Hoac4j802txN7dnFe/VMac5Z1uiqpUvVHBZRsItWJGX2nBXXgSCD5xv59IAw
 OIFp5S1meBWMm2jiXgQ4dmt1qVuFoYMoXwa/ql/zSLiAN1koy3KMagzKJXnRqZvEOdFV
 Q/Jr9giSseACvmbhwJohxqTkwsIGnNcJSnq33coGd03Bz4D9ulo9EVpoB52fVQZThMUk
 bztmJYvT8duUTqDKf9mjdzIrefqn4yjrk90JprHQ08BWcuvBI3f2DVFSu3V0VYOsBuIJ
 +ajnTO49uPzK4UJvraEkVbOssPQi9UTAfczQ22CwxF0Y3sLOdp6AtmzUgVKxJuvyHIQP
 HYEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Va7soqusV/pdX9tabvM6g0huhayPHF2tLgZz5g1TrtQ=;
 b=i+WgzX8w/Z1vGsuPi+m21/Iz+qH0fqHSpRLxqAhQUZ0TQIfKzK2CplHcldTFnpltvK
 GT/wyn64yQ5/hcks1YKBN0inz6mg7uKaeEEopYEy3irwNoV6DT/HV1p1HZV09fTjXMDb
 wSOArh4B+V9PqNYmbNR+8cmI0Khu7h3GNSzPG/HM/ZpBxxM40j49Ymnzi0CMtunDjJnm
 KpXTYL6cHHBpcFSdqeGg6vs2VNEAjShXGY79mpapNJxatBYe5lzprE3w9qVNIQzHPSel
 JeP0HUw5FW12cA+kb5TCvCWe4LwpLifsNG6jAUjSfZkieoCGq2Imk4TmBlQYLn4tMCkP
 rT/g==
X-Gm-Message-State: AOAM533zWwzblp8k6wJr8NgSdkzmOI8Q47/YsasocR83rxCiPEKIJ4/U
 /kB+/NJfYmWR178+gjhrFw7ppL0+w5kXSqJ2NZUBeA==
X-Google-Smtp-Source: ABdhPJwJMc/iLATSVKnz6wFO/n1A8JOQkVapY2CtSQNb7jD8SK+z5fyjU/dyFH4YKfFGarV6i66uDukk31I4Xbvmpgw=
X-Received: by 2002:ac2:560f:: with SMTP id v15mr2772568lfd.160.1590573680894; 
 Wed, 27 May 2020 03:01:20 -0700 (PDT)
MIME-Version: 1.0
References: <1590560759-21453-1-git-send-email-sumit.garg@linaro.org>
 <1590560759-21453-2-git-send-email-sumit.garg@linaro.org>
 <20200527082907.wfvdsekmyzbpu3tu@holly.lan>
In-Reply-To: <20200527082907.wfvdsekmyzbpu3tu@holly.lan>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Wed, 27 May 2020 15:31:09 +0530
Message-ID: <CAFA6WYON1c6jA88BkaH_2DBhA9=sCjH=xUi14MU8SOcpPm9GGA@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.68 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.68 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jdssJ-00932b-Mi
Subject: Re: [Kgdb-bugreport] [PATCH v3 1/4] kdb: Re-factor kdb_printf()
 message write code
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

On Wed, 27 May 2020 at 13:59, Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> On Wed, May 27, 2020 at 11:55:56AM +0530, Sumit Garg wrote:
> > Re-factor kdb_printf() message write code in order to avoid duplication
> > of code and thereby increase readability.
> >
> > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> > ---
> >  kernel/debug/kdb/kdb_io.c | 61 +++++++++++++++++++++++++----------------------
> >  1 file changed, 32 insertions(+), 29 deletions(-)
> >
> > diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
> > index 924bc92..f6b4d47 100644
> > --- a/kernel/debug/kdb/kdb_io.c
> > +++ b/kernel/debug/kdb/kdb_io.c
> > @@ -542,6 +542,33 @@ static int kdb_search_string(char *searched, char *searchfor)
> >       return 0;
> >  }
> >
> > +static void kdb_io_write(char *cp, int len, void (*io_put_char)(u8 ch))
>
> Don't use a function pointer here. Just pick it up from dbg_io_ops as
> usual.

My initial intent to use function pointer here was to extend this API
in patch #4 for poll_put_char() as well. But it just came to my mind
after your comment that internally dbg_io_ops->write_char() fallbacks
to tty_drv->ops->poll_put_char() API only. So I don't need to do any
crazy things with function pointers here in order to avoid a duplicate
loop but can simply invoke dbg_io_ops->write_char() here instead.

>
> > +{
> > +     if (len <= 0)
> > +             return;
>
> How can len ever be negative?
>

The only rationale to have this check is for completeness as the type
of variable: "len" being "int". If you don't prefer such checks, then
I can replace it with an "==" check.

>
> > +
> > +     while (len--) {
> > +             io_put_char(*cp);
> > +             cp++;
> > +     }
> > +}
> > +
> > +static void kdb_msg_write(char *msg, int msg_len)
> > +{
> > +     struct console *c;
> > +
> > +     if (msg_len <= 0)
> > +             return;
>
> How can msg_len ever be negative?
>

Same as above.

-Sumit

>
> > +
> > +     if (dbg_io_ops && !dbg_io_ops->is_console)
> > +             kdb_io_write(msg, msg_len, dbg_io_ops->write_char);
> > +
> > +     for_each_console(c) {
> > +             c->write(c, msg, msg_len);
> > +             touch_nmi_watchdog();
> > +     }
> > +}
> > +
> >  int vkdb_printf(enum kdb_msgsrc src, const char *fmt, va_list ap)
> >  {
> >       int diag;
> > @@ -553,7 +580,6 @@ int vkdb_printf(enum kdb_msgsrc src, const char *fmt, va_list ap)
> >       int this_cpu, old_cpu;
> >       char *cp, *cp2, *cphold = NULL, replaced_byte = ' ';
> >       char *moreprompt = "more> ";
> > -     struct console *c;
> >       unsigned long uninitialized_var(flags);
> >
> >       /* Serialize kdb_printf if multiple cpus try to write at once.
> > @@ -687,22 +713,11 @@ int vkdb_printf(enum kdb_msgsrc src, const char *fmt, va_list ap)
> >        */
> >       retlen = strlen(kdb_buffer);
> >       cp = (char *) printk_skip_headers(kdb_buffer);
> > -     if (!dbg_kdb_mode && kgdb_connected) {
> > +     if (!dbg_kdb_mode && kgdb_connected)
> >               gdbstub_msg_write(cp, retlen - (cp - kdb_buffer));
> > -     } else {
> > -             if (dbg_io_ops && !dbg_io_ops->is_console) {
> > -                     len = retlen - (cp - kdb_buffer);
> > -                     cp2 = cp;
> > -                     while (len--) {
> > -                             dbg_io_ops->write_char(*cp2);
> > -                             cp2++;
> > -                     }
> > -             }
> > -             for_each_console(c) {
> > -                     c->write(c, cp, retlen - (cp - kdb_buffer));
> > -                     touch_nmi_watchdog();
> > -             }
> > -     }
> > +     else
> > +             kdb_msg_write(cp, retlen - (cp - kdb_buffer));
> > +
> >       if (logging) {
> >               saved_loglevel = console_loglevel;
> >               console_loglevel = CONSOLE_LOGLEVEL_SILENT;
> > @@ -751,19 +766,7 @@ int vkdb_printf(enum kdb_msgsrc src, const char *fmt, va_list ap)
> >                       moreprompt = "more> ";
> >
> >               kdb_input_flush();
> > -
> > -             if (dbg_io_ops && !dbg_io_ops->is_console) {
> > -                     len = strlen(moreprompt);
> > -                     cp = moreprompt;
> > -                     while (len--) {
> > -                             dbg_io_ops->write_char(*cp);
> > -                             cp++;
> > -                     }
> > -             }
> > -             for_each_console(c) {
> > -                     c->write(c, moreprompt, strlen(moreprompt));
> > -                     touch_nmi_watchdog();
> > -             }
> > +             kdb_msg_write(moreprompt, strlen(moreprompt));
> >
> >               if (logging)
> >                       printk("%s", moreprompt);
> > --
> > 2.7.4
> >


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
