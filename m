Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 961351E1CA0
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 26 May 2020 09:57:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jdUT9-00033V-DL
	for lists+kgdb-bugreport@lfdr.de; Tue, 26 May 2020 07:57:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1jdUT7-00033G-Ot
 for kgdb-bugreport@lists.sourceforge.net; Tue, 26 May 2020 07:57:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Hls7pMjgRAEJPr8FkQn95q9jMKxanllQ2tD+H93l8Ao=; b=R1eJWaXCiyuZRnIbGyoDIBx0K3
 G4Sr1UFdJD9MMhjqwYXHpl33/ClWgtkiPI9PUwKaiLa69xg3xzL1BSaRq/BpSazbAEFJV2XFiiI47
 rSzxowt2PWQnLjovK/VhEU1wVK5kKpkyRlC5+ycnnLwCITM4j4OwrJC+ls7xB0I6cwC0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Hls7pMjgRAEJPr8FkQn95q9jMKxanllQ2tD+H93l8Ao=; b=eNbELuC4SfWcoS6WYn0YJ7e73+
 LM/Qvp5zP7k2E200psvoHSJEqWy1pPP87Pi0MRltue8roaW5SLdwCqG5tTNMFqqJvl34CK8xUFm97
 8ZcWNi9iGyeW3rUJ9YmQOyt1+SWzNhjCpeiC2b7ImQnjoIqCZz7kkWFZx5Y17Hb3Oix0=;
Received: from mail-lf1-f66.google.com ([209.85.167.66])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jdUT3-007P63-Uu
 for kgdb-bugreport@lists.sourceforge.net; Tue, 26 May 2020 07:57:49 +0000
Received: by mail-lf1-f66.google.com with SMTP id z206so8127102lfc.6
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 26 May 2020 00:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Hls7pMjgRAEJPr8FkQn95q9jMKxanllQ2tD+H93l8Ao=;
 b=kDjv/fMk4zgd/uMy9GdPdkzKw0FjIFNyX/DkJ4TIntG9UIvqr1brnF9lwO3ja/jq/6
 e4PJsah91HXN5L/KlNXp8fdfOHtc8tjtjwf4r26+Wavaw/NVBpFwSmXcilVjDl+HMJD5
 bNV3kMcbws6HVRsXjDGSB752UfhZFX6DlovpnRRUzCRsSNfJdNoATpsAAZM+8LC9LCbx
 xNcEzner0LDPChpzlIY2cZzLOC7EdU/hC+GEeSsHVxEdirao42Wpxo+X0V4pqNrOnUbm
 fgc+Gc5ZvIy2whtYwMU25POFzrlACuxrRehyrXpKGz+RR0BrbBfXyHjyFKVR1xSgtqhb
 bG3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Hls7pMjgRAEJPr8FkQn95q9jMKxanllQ2tD+H93l8Ao=;
 b=lCDM3YZ+yRzI2OgPgKMUAXH8QLm5qXh+CnR3ZJE+Kc+pyRWejQa8roFte+uldAjmNP
 G744FnVdXujC0SMQF3O6/Vh6UyVEwHuR0eC6l+puOmp07KBAWkYxLfkYyFF1SqWib9tA
 49Wi7mRaiPiSNBXa2JonYpPP3sEqIll5YEZP9R989chSO5m2onZ8a9p5qoAAADSJZM/h
 8Le6gjRQOMyi66IdD0C4Ms3+jDCIxnqRWAy4JShORmdXaGAtQnMzXtCoyKTRJON1hgDK
 knC8C61ywiof1ZSl/nWr/nYZuZZhHKj/kZN9Zr80K0hSnknJvuiMs6slbAuDcMMpyNh+
 SCOw==
X-Gm-Message-State: AOAM532iNWE47fu+TGR/olNnhdxAgfpTHYa067ZDgb9aTEfVwON73U/c
 NnurrRKnQ5GKXymVL0HcnptGuRrJwkoLlvvO3PK+0A==
X-Google-Smtp-Source: ABdhPJyComtMgmHneuXnzA8/7vKS/DZQGUDGit10QC5/2EBq1S/xYwm1LkIc+Kz2CI3lMp630d59AlDsbW0jrx4se38=
X-Received: by 2002:ac2:560f:: with SMTP id v15mr16647030lfd.160.1590479859340; 
 Tue, 26 May 2020 00:57:39 -0700 (PDT)
MIME-Version: 1.0
References: <1590158027-15254-1-git-send-email-sumit.garg@linaro.org>
 <20200522163508.e7476dd2vulntppc@holly.lan>
In-Reply-To: <20200522163508.e7476dd2vulntppc@holly.lan>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Tue, 26 May 2020 13:27:28 +0530
Message-ID: <CAFA6WYPNqN-rQmymBkEQV0Cf0QWPNEjNkvVhUFFyi68zErCiiw@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
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
X-Headers-End: 1jdUT3-007P63-Uu
Subject: Re: [Kgdb-bugreport] [PATCH v2] kdb: Make kdb_printf robust to run
 in NMI context
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

On Fri, 22 May 2020 at 22:05, Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> On Fri, May 22, 2020 at 08:03:47PM +0530, Sumit Garg wrote:
> > While rounding up CPUs via NMIs, its possible that a rounded up CPU
> > maybe holding a console port lock leading to kgdb master CPU stuck in
> > a deadlock during invocation of console write operations. So in order
> > to avoid such a deadlock, invoke bust_spinlocks() prior to invocation
> > of console handlers.
> >
> > Also, add a check for console port to be enabled prior to invocation of
> > corresponding handler.
>
> Perhaps this should have been two patches.
>

Okay, will split this patch into two.

> In fact, to be honest, I'd suggest combining all the patches to improve
> kdb console handling (including a fixed version of the RFC) into a
> single patch set.

Yeah it makes sense to have a combined patch set to improve kdb
console handling. But I posted the RFC patch separately as I expected
comments and discussions to come up with an accepted approach.

So let me wait for an agreement on RFC patch after which I can include
that patch in this patch set.

>
>
> > Suggested-by: Petr Mladek <pmladek@suse.com>
> > Suggested-by: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
> > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> > ---
> >
> > Changes in v2:
> > - Use oops_in_progress directly instead of bust_spinlocks().
> >
> >  kernel/debug/kdb/kdb_io.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
> > index 924bc92..3a5a068 100644
> > --- a/kernel/debug/kdb/kdb_io.c
> > +++ b/kernel/debug/kdb/kdb_io.c
> > @@ -699,7 +699,11 @@ int vkdb_printf(enum kdb_msgsrc src, const char *fmt, va_list ap)
> >                       }
> >               }
> >               for_each_console(c) {
> > +                     if (!(c->flags & CON_ENABLED))
> > +                             continue;
> > +                     ++oops_in_progress;
>
> Given the subtly of what is going on I think we need some comments in
> the code on what we are doing and why.

Sure, will add comments.

>
>
> >                       c->write(c, cp, retlen - (cp - kdb_buffer));
> > +                     --oops_in_progress;
> >                       touch_nmi_watchdog();
> >               }
> >       }
> > @@ -761,7 +765,11 @@ int vkdb_printf(enum kdb_msgsrc src, const char *fmt, va_list ap)
> >                       }
> >               }
> >               for_each_console(c) {
> > +                     if (!(c->flags & CON_ENABLED))
> > +                             continue;
> > +                     ++oops_in_progress;
> >                       c->write(c, moreprompt, strlen(moreprompt));
> > +                     --oops_in_progress;
> >                       touch_nmi_watchdog();
>
> As with the other patches maybe the first patch in the set should be
> factoring out the common code before making changes to it.

Sure, will factor out common code as initial patch.

-Sumit

>
>
> Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
