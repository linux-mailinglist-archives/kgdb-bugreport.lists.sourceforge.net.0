Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EE68C1DE4DC
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 22 May 2020 12:52:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jc5IL-0003fR-PE
	for lists+kgdb-bugreport@lfdr.de; Fri, 22 May 2020 10:52:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1jc5IK-0003f7-VP
 for kgdb-bugreport@lists.sourceforge.net; Fri, 22 May 2020 10:52:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lvdyN6G4YtegRjCLgqlMGLFPk+ZDJ/sCDCmfREQfAYs=; b=RATy1G/eEMgESpQymItfjNtCKp
 k1Xw1vftugQ4jGKPy75eDebjAjVAXT3mK+0I4On0u3moV1RlPE+fvscb6vsUT0+I7OrS7tGVBCBfZ
 XBM1gwC/ONOnedRAejcn7XX7FRA2qTDwreyqMJEBqK0szeZpTa4FynfwRv5BL3kLYqn0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lvdyN6G4YtegRjCLgqlMGLFPk+ZDJ/sCDCmfREQfAYs=; b=i7Fci3BN1ly28EQrqXexv/N8QX
 fC09al9yvh0hinfOe8/b4HUkn2LHVbXVlK2MehZKVKWIL7llHBOwTp/yE4xKbD9R7lBwYf4X+/+8d
 ogLTLIC2IqNOMEfSiwzXQySjpAbUti+/a9jOIm0eaws0fr/iSTjaHtm+CrjKBNGwQ5Lc=;
Received: from mail-lj1-f193.google.com ([209.85.208.193])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jc5IG-002B9w-Qt
 for kgdb-bugreport@lists.sourceforge.net; Fri, 22 May 2020 10:52:52 +0000
Received: by mail-lj1-f193.google.com with SMTP id c11so9915817ljn.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 22 May 2020 03:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lvdyN6G4YtegRjCLgqlMGLFPk+ZDJ/sCDCmfREQfAYs=;
 b=MPxzew+BaJxir4dgUA9o3HVns9qarZ9K7auFqYfINS40vfUiTt5MGzXN89nhppJNYJ
 VXK84TbQdyf9b9ZMY/doS6mNQTxnNFkzKdaJLxwhbg4QtliRkgK1mFk4lbpnGkJee1rM
 z3KtLboDvdRLZmsjPO/CoqfBS0lfkYrih6HoozgVE4yNkryPhKUPZOYm2H+nzdVABzSW
 IHONB44yeoX5H69Mqcba1tKOVZvWspsLvgnJI6wtxjD+qMAhPF7s0x6pAVW2OY2KCds6
 jOZV7sBzFKh0dJE5AOR8RQAGZgIgCuJsnTwipnt2wXrlZK1qJDWEKO6jlr5Bp7r8O+fn
 hn/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lvdyN6G4YtegRjCLgqlMGLFPk+ZDJ/sCDCmfREQfAYs=;
 b=o5QA91SP3lJLgSAJcZwM5EQCTkBzS+goxHnF6qwvmPiifAre9L4UYIcnMdCJAjcUOr
 /u2PWqpCsZxQP0n3eSxn2RyIdoOfx3CkqqSaldQkXen+qLkgm79Z2VLQnGUQ7qsHlxMr
 B8oiQ3JXoygzg5Gp0Ao8MDppFhA5zvGXX2rKLawfWLoW1zN5AgDHQ85q8V3B6OkADgH1
 HgFi3EfHlRSSkveFULvSXmuZxznt4nwNj5K08MzzORmTx67FXrer2Nt3pYOUkZu3T5UP
 Z4NhZXqltb2rh4RL3z/5sG7oacT6+4FGxiWwZI7ZNm9cv54alIFVBgSULIuFInDrgHE/
 GtUg==
X-Gm-Message-State: AOAM532GmpxUwXlG8BoJPAV/Y/2zg+o70rNXrZpq3x8NmhM8QanpLmf+
 e+55y6Ed3I3DNUA0rjDvc/ThdS2iSEVjdZGBWQl7Sg==
X-Google-Smtp-Source: ABdhPJwT+56RE7ncBbnOnI78vRnr+Lpx7mxffN+NN9N0wIt4TPXqlDIkjAKLXCvmPYBpHeZxbYfwhtbKQ3j+WtB0X6U=
X-Received: by 2002:a2e:7504:: with SMTP id q4mr4798745ljc.339.1590144762130; 
 Fri, 22 May 2020 03:52:42 -0700 (PDT)
MIME-Version: 1.0
References: <1590141746-23559-1-git-send-email-sumit.garg@linaro.org>
 <20200522103823.uwb6jpjwpzhhjwwt@holly.lan>
In-Reply-To: <20200522103823.uwb6jpjwpzhhjwwt@holly.lan>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Fri, 22 May 2020 16:22:30 +0530
Message-ID: <CAFA6WYPVY2Jz6YF_tpc80b2LqEnzMa60NaVjQEmBwQEOY3o+2g@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.193 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.193 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jc5IG-002B9w-Qt
Subject: Re: [Kgdb-bugreport] [PATCH] kdb: Make kdb_printf robust to run in
 NMI context
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

On Fri, 22 May 2020 at 16:08, Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> On Fri, May 22, 2020 at 03:32:26PM +0530, Sumit Garg wrote:
> > While rounding up CPUs via NMIs, its possible that a rounded up CPU
> > maybe holding a console port lock leading to kgdb master CPU stuck in
> > a deadlock during invocation of console write operations. So in order
> > to avoid such a deadlock, invoke bust_spinlocks() prior to invocation
> > of console handlers.
> >
> > Also, add a check for console port to be enabled prior to invocation of
> > corresponding handler.
> >
> > Suggested-by: Petr Mladek <pmladek@suse.com>
> > Suggested-by: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
> > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> > ---
> >  kernel/debug/kdb/kdb_io.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
> > index 924bc92..e32ece6 100644
> > --- a/kernel/debug/kdb/kdb_io.c
> > +++ b/kernel/debug/kdb/kdb_io.c
> > @@ -699,7 +699,11 @@ int vkdb_printf(enum kdb_msgsrc src, const char *fmt, va_list ap)
> >                       }
> >               }
> >               for_each_console(c) {
> > +                     if (!(c->flags & CON_ENABLED))
> > +                             continue;
> > +                     bust_spinlocks(1);
> >                       c->write(c, cp, retlen - (cp - kdb_buffer));
> > +                     bust_spinlocks(0);
>
> I think it might actually be better to directly manipulate oops_in_progress
> here.
>

Okay will directly manipulate oops_in_progress here.

> bust_spinlocks(0) will call unblank_screen() and console_unblank() and
> I don't think calling these is worth the risk (and whilst kicking klogd
> is safe I think its also not required).

Makes sense.

-Sumit

>
>
> Daniel.
>
>
>
> >                       touch_nmi_watchdog();
> >               }
> >       }
> > @@ -761,7 +765,11 @@ int vkdb_printf(enum kdb_msgsrc src, const char *fmt, va_list ap)
> >                       }
> >               }
> >               for_each_console(c) {
> > +                     if (!(c->flags & CON_ENABLED))
> > +                             continue;
> > +                     bust_spinlocks(1);
> >                       c->write(c, moreprompt, strlen(moreprompt));
> > +                     bust_spinlocks(0);
> >                       touch_nmi_watchdog();
> >               }
> >
> > --
> > 2.7.4
> >


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
