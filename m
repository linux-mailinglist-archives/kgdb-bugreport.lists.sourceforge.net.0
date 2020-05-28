Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C08B91E5926
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 28 May 2020 09:43:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jeDBw-0002Cm-Ij
	for lists+kgdb-bugreport@lfdr.de; Thu, 28 May 2020 07:43:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1jeDBv-0002Cf-Jb
 for kgdb-bugreport@lists.sourceforge.net; Thu, 28 May 2020 07:43:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZSEppCnMjooqv/+hpmajhkWVfY46SE18er3CWPFn//o=; b=GdQcw4pu3TXLea0g+FJMsXwuo+
 UEgEZ3yzmJYmXTuGqelJt6kdzKKEgfyOMg6+s6vUe3lM+ss5Ii/rrd5ZLte+wsIa+nhiCP9jUlFdL
 RsqaN9AHHunORhdQI+LRORggx2x0uOWy1uKwMBsJwUz/8dn4ICevtwTrGqGqNr6DSTcY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZSEppCnMjooqv/+hpmajhkWVfY46SE18er3CWPFn//o=; b=e9oZoQEykxSS/YMdXZ232TzTGH
 9E0BiLuC/SMLJB+EaGhjRIWpF881zt1LGMMsURt94HTFZwLWGGaXeucqiUigKv5GiNVYqNBl3Cv3q
 Gou/rlIuza6+/SaKe0mRqvS/yINvlWr960daEXXA/HEGSmcySDgWaYUKr/GK6NEpOA2I=;
Received: from mail-lf1-f66.google.com ([209.85.167.66])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jeDBq-00FnlL-RZ
 for kgdb-bugreport@lists.sourceforge.net; Thu, 28 May 2020 07:43:03 +0000
Received: by mail-lf1-f66.google.com with SMTP id w15so15953640lfe.11
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 28 May 2020 00:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZSEppCnMjooqv/+hpmajhkWVfY46SE18er3CWPFn//o=;
 b=hui1DnMSPQC8PalrmA2xNhPN47Qgt0NGSGYl98vRy0j+p5BNUKzW8ao4PnCHdNLZjf
 8YMJvNVzze8CKA1S01XNUb5YZ+3hbOJqlL4hYKbqftLsRFamH3vto3EDzI2EeSgH1L2o
 y/8XLjs8fOKBOHXLFirMZhvzwDKyjiB3/lCHq1hVsAbbiq5WqaY3YfdMizYkdgXoUk64
 omQp38by/IReL9pn3bEj3wXKW6QJEdQAe9VOT7EWenE1dogEOCQj4aiQ34hwaaoO69vx
 zg6gCmLT5Qa7RHGKa28X+dhsr5NLbOapGO5iqNAvitE/VArwygmcTv5Y6PycMvDoQztu
 4sWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZSEppCnMjooqv/+hpmajhkWVfY46SE18er3CWPFn//o=;
 b=e9T7LenIWgzpilzVKPVo4+7lw2jxZD0aZg+Rw0OutPY7CelDHGz0c8gIT6/YvkquJW
 5euTZS5DqtIvgo2zeCp0Pn676f4jIFmkqlSDrXPiHlNDgzlopoTHij6hXYG+y24EUITt
 Yl4sHI1QN69mLAnhceZWWz9LuvBwL81MEiA7eFA1oxSAVVcoh0HVIJCUc6SY0+moZlPr
 d3yiVr9JDZ/B8Vjn5upkhuuOjj5xRi95XjSAKWafJHJGB04L0VUuBi21Sw+nMMJ9X3Yf
 PgXAL2uHH0PhawE4kbft+23gllBZuuLViUuv6lx0SBZ8gRu3gNkvy7TvQ2vC64qXzngG
 XLkg==
X-Gm-Message-State: AOAM532u2yIZbsy0JeMG5GJpzhqfaHJD3d6QaIFmjw4SQAEsus5hObB5
 OMEBSwNcBf4kvENT9GJ0Mwhcn3hss9MlWl+oNvyvag==
X-Google-Smtp-Source: ABdhPJwYhDoQO6Cp5QbjY4T1T1tzuKF/ozZxhlC6wEzxvYQ17TmXwrSXZSVTlT7S0TURw1ma+1cobn5lIjFOjE7gGTY=
X-Received: by 2002:ac2:4293:: with SMTP id m19mr1009321lfh.204.1590651772089; 
 Thu, 28 May 2020 00:42:52 -0700 (PDT)
MIME-Version: 1.0
References: <1590560759-21453-1-git-send-email-sumit.garg@linaro.org>
 <1590560759-21453-4-git-send-email-sumit.garg@linaro.org>
 <20200527142617.t7dzal7ok5i3exra@holly.lan>
In-Reply-To: <20200527142617.t7dzal7ok5i3exra@holly.lan>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Thu, 28 May 2020 13:12:40 +0530
Message-ID: <CAFA6WYNY1tk=Md84tuSHOBgmB330eAAV8yWM1XLT0sDcbWus6A@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.66 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.66 listed in wl.mailspike.net]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jeDBq-00FnlL-RZ
Subject: Re: [Kgdb-bugreport] [PATCH v3 3/4] kdb: Make kdb_printf robust to
 run in NMI context
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

On Wed, 27 May 2020 at 19:56, Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> On Wed, May 27, 2020 at 11:55:58AM +0530, Sumit Garg wrote:
> > While rounding up CPUs via NMIs, its possible that a rounded up CPU
>
> This problem does not just impact NMI roundup (breakpoints,

I guess here via breakpoints you meant if we add a compiled breakpoint
or runtime breakpoint in console handler code while its holding the
spin lock could lead to a deadlock, correct?

> including
> implicit breakpoint-on-oops can have the same effect).
>

Isn't the breakpoint-on-oops case already handled via bust_spinlocks()
usage in panic handler here [1]?

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/kernel/panic.c#n207

>
> > maybe holding a console port lock leading to kgdb master CPU stuck in
> > a deadlock during invocation of console write operations. So in order
> > to avoid such a deadlock, enable oops_in_progress prior to invocation
> > of console handlers.
> >
> > Suggested-by: Petr Mladek <pmladek@suse.com>
> > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> > ---
> >  kernel/debug/kdb/kdb_io.c | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
> > index 349dfcc..f848482 100644
> > --- a/kernel/debug/kdb/kdb_io.c
> > +++ b/kernel/debug/kdb/kdb_io.c
> > @@ -566,7 +566,17 @@ static void kdb_msg_write(char *msg, int msg_len)
> >       for_each_console(c) {
> >               if (!(c->flags & CON_ENABLED))
> >                       continue;
> > +             /*
> > +              * While rounding up CPUs via NMIs, its possible that
>
> Ditto.
>
> > +              * a rounded up CPU maybe holding a console port lock
> > +              * leading to kgdb master CPU stuck in a deadlock during
> > +              * invocation of console write operations. So in order
> > +              * to avoid such a deadlock, enable oops_in_progress
> > +              * prior to invocation of console handlers.
>
> Actually looking at this comment as a whole I think it spends to many
> words on what and not enough on why (e.g. what the tradeoffs are and
> why we are not using bust_spinlocks() which would be a more obvious
> approach).
>
>   Set oops_in_progress to encourage the console drivers to disregard
>   their internal spin locks: in the current calling context
>   the risk of deadlock is a bigger problem than risks due to
>   re-entering the console driver. We operate directly on
>   oops_in_progress rather than using bust_spinlocks() because
>   the calls bust_spinlocks() makes on exit are not appropriate
>   for this calling context.

Sounds reasonable, will use it instead.

-Sumit

>
>
> Daniel.
>
>
> > +              */
> > +             ++oops_in_progress;
> >               c->write(c, msg, msg_len);
> > +             --oops_in_progress;
> >               touch_nmi_watchdog();
> >       }
> >  }
> > --
> > 2.7.4
> >


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
