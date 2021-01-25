Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 614A4302229
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 25 Jan 2021 07:36:03 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1l3vTm-0001Ia-5Z
	for lists+kgdb-bugreport@lfdr.de; Mon, 25 Jan 2021 06:36:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1l3vTk-0001Hz-I2
 for kgdb-bugreport@lists.sourceforge.net; Mon, 25 Jan 2021 06:36:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=G1FaOCMVhBrKvV/kr2ZvUjYEuk47vbJOU/enSL7Dyws=; b=AjVK0K1seVeGQhfoHIY6fsKboE
 XGbA/ZsNr4RMZGoqqNz13+qiPb/A9oW4lbUJxQGjckBCF54CnvHScrtMqf5jCKnsPLnprjUkdck3N
 i+l5IWyc3ggQt+T3eWOaJiY6r71HkZtEqpkuUYwtOF8RB/xVpo7uEx6eAe9rmrmziIV8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=G1FaOCMVhBrKvV/kr2ZvUjYEuk47vbJOU/enSL7Dyws=; b=OWPAumgHDe++lV1BwMnmVwVHO+
 pe9jwt8G3vUwQaTlbuuAFGV+SSIZp1/wx/E5EaBZ3zCt9c4PdRYo4vRU+IpHLUzh5rNu9KG8/35LP
 1jxx+2E/+lMyIxwv0yYjmAz7rEuVKjjpLL9slpz5lmDXZ4DZeuslOfmCwddiSx7rEQ7o=;
Received: from mail-lf1-f50.google.com ([209.85.167.50])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1l3vTa-001ZJS-Dk
 for kgdb-bugreport@lists.sourceforge.net; Mon, 25 Jan 2021 06:36:00 +0000
Received: by mail-lf1-f50.google.com with SMTP id v24so16093947lfr.7
 for <kgdb-bugreport@lists.sourceforge.net>;
 Sun, 24 Jan 2021 22:35:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=G1FaOCMVhBrKvV/kr2ZvUjYEuk47vbJOU/enSL7Dyws=;
 b=vYow9yz+IIBcGRtOdnaNWdXFbeTQAPkd2e+luHTzVDeJGr3mLeTwC1HcrM+nxFw/+N
 j4C24OZq8UCqdi/4q59X6yC/pSoN0y6pVcbifAULmLsFi/3VE+3xghCcdFmzFiaglS0k
 1rM/n7knpwlQL1lpyDYokhC6hfSqI3zUKY/gaMEfVXB+qh47W8uLY952+JoIM5A5El9T
 0tEJZ/Cb1LK64G32jSA1gQLcWUxlsnQz5snhW17iMbq2N4DUWyl6ff6tMxXQCk9m8Vr4
 GUEvjBosqtGbzo+sarQ5vGhZC55fXgkWuuupPdOc+EGxK6SxOQTJQjmiO3808Qar7OkY
 5qrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G1FaOCMVhBrKvV/kr2ZvUjYEuk47vbJOU/enSL7Dyws=;
 b=YHKMaGgFEJ+HS+s1UzKnOywZrOvgGAM7POwnzQuD4LB1KQ/rLKYv1kwhpNAmx2b1km
 TgoX7QyfWPoG+ID1wdLuOAGo6ngV5zrXVQxRVYmRpJuPnLV6mSwz8u4uO2HHwHDmZpOt
 RlYiOCx7n26AwuYbULdhRGS9A55PPsb9XFZzvjBCkqYVBXy8iVzOp/ZRgdP9CYCSQ4he
 t7g/lFvBsoPA5vzsSjnqA3kXz2USt74my13usKkm49XNwEFxXNlCbc1qnh5ttiv5CqUu
 lln0QG9Ie2HkyXjLq/GZV0T9aR8ioZyPZmelOPlsPDX9uFCLgSvkthqixzD9oOCDq6jY
 3/PQ==
X-Gm-Message-State: AOAM530ZxDuIdph95i4Y528POqh2sdXb0HbJMZUg9mtC/HgPajH9tCxN
 7KsmwSUzlCnWPum6jYQBVJfv9HD5aJ04YFNB1hmEbA==
X-Google-Smtp-Source: ABdhPJwaxZsdvdQUqIxLDi2kIO1WJvt9f/SRH5B6Y43PN/8hFKkKd7Znzw+GntDYRRMFc2DBNnPxjnWCM8qdFlRrNqs=
X-Received: by 2002:a19:691b:: with SMTP id e27mr1137208lfc.84.1611556543833; 
 Sun, 24 Jan 2021 22:35:43 -0800 (PST)
MIME-Version: 1.0
References: <1611053418-29283-1-git-send-email-sumit.garg@linaro.org>
 <CAD=FV=Vrf4v0DKfZ7BAjW3ODoYeuwDu8L0S1kOMbbG+=WiVOnQ@mail.gmail.com>
In-Reply-To: <CAD=FV=Vrf4v0DKfZ7BAjW3ODoYeuwDu8L0S1kOMbbG+=WiVOnQ@mail.gmail.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Mon, 25 Jan 2021 12:05:32 +0530
Message-ID: <CAFA6WYNarMQN1coeWBjduDePg_veNdxkN+A7E0unfSdSFCfgfw@mail.gmail.com>
To: Doug Anderson <dianders@chromium.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.50 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.50 listed in list.dnswl.org]
X-Headers-End: 1l3vTa-001ZJS-Dk
Subject: Re: [Kgdb-bugreport] [PATCH] kdb: Simplify kdb commands registration
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
Cc: kgdb-bugreport@lists.sourceforge.net,
 Daniel Thompson <daniel.thompson@linaro.org>,
 LKML <linux-kernel@vger.kernel.org>, Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Thanks Doug for your review.

On Sat, 23 Jan 2021 at 00:12, Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Tue, Jan 19, 2021 at 2:50 AM Sumit Garg <sumit.garg@linaro.org> wrote:
> >
> > Simplify kdb commands registration via using linked list instead of
> > static array for commands storage.
> >
> > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> > ---
> >  kernel/debug/kdb/kdb_main.c    | 78 ++++++++++--------------------------------
> >  kernel/debug/kdb/kdb_private.h |  1 +
> >  2 files changed, 20 insertions(+), 59 deletions(-)
>
> Wow, nice.  It should have been done this way from the start!  ;-)
>
>
> > @@ -1011,7 +1005,7 @@ int kdb_parse(const char *cmdstr)
> >                 ++argv[0];
> >         }
> >
> > -       for_each_kdbcmd(tp, i) {
> > +       list_for_each_entry(tp, &kdb_cmds_head, list_node) {
> >                 if (tp->cmd_name) {
>
> So I think here (and elsewhere in this file) you can remove this "if
> (...->cmd_name)" stuff now, right?  That was all there because the old
> "remove" used to just NULL out the name to handle gaps and that's no
> longer possible.  If you are really paranoid you could error-check
> kdb_register_flags()
>

Agree, will get rid of this check.

>
> > --- a/kernel/debug/kdb/kdb_private.h
> > +++ b/kernel/debug/kdb/kdb_private.h
> > @@ -174,6 +174,7 @@ typedef struct _kdbtab {
> >         short    cmd_minlen;            /* Minimum legal # command
> >                                          * chars required */
> >         kdb_cmdflags_t cmd_flags;       /* Command behaviour flags */
> > +       struct list_head list_node;
>
> nit: every other entry in this struct has a comment but not yours..
>

Will add a comment here.

>
> Other than those small nits I think this is a great improvement, thanks!
>

Thanks,
Sumit

> -Doug


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
