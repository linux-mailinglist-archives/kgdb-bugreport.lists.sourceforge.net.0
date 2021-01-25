Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 19251302218
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 25 Jan 2021 07:22:17 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1l3vGR-0000FK-Rj
	for lists+kgdb-bugreport@lfdr.de; Mon, 25 Jan 2021 06:22:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1l3vGQ-0000F6-AL
 for kgdb-bugreport@lists.sourceforge.net; Mon, 25 Jan 2021 06:22:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/zaG6O0v8k3VXbwAFUClbwHTRxDGN6NUvBuA7zlt2y8=; b=QU8e00IAIcUL3O1TS6oqnEiAlk
 Feh1DVNMo5U9PMQfkX6BOE91VNlRDbmlMoWdb4uPpjz8SoKTGMA/am0xcr6LRZ8Uscy8TgUmGliib
 C7fd7+3HbtUJRgZ8V4F1QYRw0Wf5mX6B1fmp4A8nGuO0iwVpHnt8sO9ae3Qnrox7h5F4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/zaG6O0v8k3VXbwAFUClbwHTRxDGN6NUvBuA7zlt2y8=; b=VOCePfp93uZoODnt8XDWnumMhe
 QaJ4ADYGG7cUUQRB6oYSM6h+AfhDwWFMXf4ayTmrj0m4fflXS0Q/VOM7bT0hjJJWZsrFsHW4MbsUC
 IXC5mOrvu6O11q29Tav9sTYPK4ZmOxAHL0WNMcAUkyBriKcAlSuup7aCpCZC5lm/Acm0=;
Received: from mail-lf1-f45.google.com ([209.85.167.45])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1l3vGE-005xjJ-Li
 for kgdb-bugreport@lists.sourceforge.net; Mon, 25 Jan 2021 06:22:14 +0000
Received: by mail-lf1-f45.google.com with SMTP id f1so6218124lfu.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Sun, 24 Jan 2021 22:22:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/zaG6O0v8k3VXbwAFUClbwHTRxDGN6NUvBuA7zlt2y8=;
 b=Baoc6XDiAIsHiBtZhPHGxJRsI9B1ko2O4aEdadE4rddBzeeyIo+g44RIKb854Ztsu6
 iusw3mCi9aw203TTlDC44xeCWljlllWqRC+tLT6t45DYIN6dR3Qxgy+uOO5Q3FF7dqlI
 4hL5uek98BeTdJfSbfyODFmXXpHcehE3aZaeGG4hz3Q/HX7O7In8JVlNtOzBQPy2Ds6r
 YG6CzAd7DcbicbR09vhE1bfjN7dZrG4S2VU7q2ivNX4WAjpAgrD/gfPTvGx+AssZnceO
 mNpwgw7FyDDedJ8onTWIynXCsnOR2KFANoBPMtgg20YrRURDKKUCDaccVHCZcpOmIjfW
 FOzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/zaG6O0v8k3VXbwAFUClbwHTRxDGN6NUvBuA7zlt2y8=;
 b=S1wksbJJo7wtq0B9TP6O7G4uCvkN5RNmLTpopw6YYUo+7f43htp25x9seLm+nnWZx5
 aPTvXn0jnl/nQ73+pd0EeuRlNIIAinxAFlfhs/sYgOwUtDuMCPNSSDwNLL7J+4OpfVSO
 lRXJrk/ZVoEf93Yps3Gd0CaDegHFcFf9Q3hMWc3o3eTmb0Ow+XfNlZUDh+Cw9K/mEHEq
 k4gSOGBh9Yqv4Iws2POw4XngktydBVtXWKmUwGr7EB/x2aLHBiL6FL0qD/aXiWgctYMa
 mDgmNmVDyXtm1mfjFluoSvvpPzkrLTEUiHR3ATCM/iYz/i2EmrnGm47C4uSFpTeKhhxr
 Mt4Q==
X-Gm-Message-State: AOAM532dAu8FDHrG5zunC8vhtCIMc02k/a+Gy83K0B5fzjSLuhxEFuaG
 ZjjviSoQn828716xAZLCr/HcYDb+KaOdtng4xGvribLX8zfq1w==
X-Google-Smtp-Source: ABdhPJxU5eBGkVebQnOft5RGEvcNB2PFqwkcMvG25HAd6Fb6AYc+vtOp/pdjxyo5B44kXJXNss7vBBFgDun0A1I0s+k=
X-Received: by 2002:a2e:91d0:: with SMTP id u16mr781133ljg.480.1611555379260; 
 Sun, 24 Jan 2021 22:16:19 -0800 (PST)
MIME-Version: 1.0
References: <1611313556-4004-1-git-send-email-sumit.garg@linaro.org>
 <CAD=FV=V8HwhdhpCoiZx4XbTMWug0CAxhsnPR+5V9rB0W7QXFTQ@mail.gmail.com>
In-Reply-To: <CAD=FV=V8HwhdhpCoiZx4XbTMWug0CAxhsnPR+5V9rB0W7QXFTQ@mail.gmail.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Mon, 25 Jan 2021 11:46:08 +0530
Message-ID: <CAFA6WYNyVhEzVstXCf1SDKkKGcfCdx6+LYpA5VLWtnaGsN=_7w@mail.gmail.com>
To: Doug Anderson <dianders@chromium.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.45 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.45 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1l3vGE-005xjJ-Li
Subject: Re: [Kgdb-bugreport] [PATCH v3] kdb: Make memory allocations more
 robust
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
 LKML <linux-kernel@vger.kernel.org>, "# 4.0+" <stable@vger.kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Thanks Doug for your comments.

On Fri, 22 Jan 2021 at 22:55, Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Fri, Jan 22, 2021 at 3:06 AM Sumit Garg <sumit.garg@linaro.org> wrote:
> >
> > Currently kdb uses in_interrupt() to determine whether its library
> > code has been called from the kgdb trap handler or from a saner calling
> > context such as driver init.  This approach is broken because
> > in_interrupt() alone isn't able to determine kgdb trap handler entry from
> > normal task context. This can happen during normal use of basic features
> > such as breakpoints and can also be trivially reproduced using:
> > echo g > /proc/sysrq-trigger
>
> I guess an alternative to your patch is to fully eliminate GFP_KDB.
> It always strikes me as a sub-optimal design to choose between
> GFP_ATOMIC and GFP_KERNEL like this.  Presumably others must agree
> because otherwise I'd expect that the overall kernel would have
> something like "GFP_AUTOMATIC"?
>
> It doesn't feel like it'd be that hard to do something more explicit.
> From a quick glance:
>
> * I think kdb_defcmd() and kdb_defcmd2() are always called in response
> to a user typing something on the kdb command line.  Those should
> always be GFP_ATOMIC, right?
>
> * The one call that's not in kdb_defcmd() / kdb_defcmd2() is in
> kdb_register_flags().  That can be called either during init time or
> from kdb_defcmd2().  It doesn't seem like it'd be hard to rename
> kdb_register_flags() to _kdb_register_flags() and add a "gfp_t flags"
> to the end.  Then the exported kdb_register_flags() would pass
> GFP_KERNEL and the call from kdb_defcmd2() would pass GFP_ATOMIC:
>

Thanks for your suggestions. I agree with you that it's better to get
rid of GFP_KDB. But I think we need to backport this fix to stable
kernels as well, so IMO a minimal change like this would be better. I
will rather push a seperate code refactoring patch to incorporate your
suggestions.

>
> > We can improve this by adding check for in_dbg_master() instead which
>
> s/adding check/adding a check/
>

Ack. If we don't have any further comments, can this be incorporated
while applying this patch?

>
> > explicitly determines if we are running in debugger context.
> >
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> > ---
> >
> > Changes in v3:
> > - Refined commit description and Cc: stable@vger.kernel.org.
> >
> > Changes in v2:
> > - Get rid of redundant in_atomic() check.
> >
> >  kernel/debug/kdb/kdb_private.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
>
> I would leave it up to Daniel to say whether he agrees that a full
> removal of "GFP_KDB" would be a better solution.  However, your patch
> clearly improves the state of things, so:
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Thanks,
Sumit


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
