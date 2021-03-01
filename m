Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 622DB328BAC
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  1 Mar 2021 19:41:09 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1lGnTg-0004XO-3w
	for lists+kgdb-bugreport@lfdr.de; Mon, 01 Mar 2021 18:41:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1lGnTe-0004XH-HN
 for kgdb-bugreport@lists.sourceforge.net; Mon, 01 Mar 2021 18:41:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gkLZdNbvLFDlwE1SwAhQ+C2mF/JHbfuAJhOZU57wMJ8=; b=UF3MpEj3j1ZUzVZOGZPnkCdXet
 XtSbeHl6LuP9ETZNhfot199PRG2engqSuwyRspGmoesFgdXLMfv/WuOtvyRP/vXRTnSjuvLwnfvD+
 aDyzVxJnjnIKxsRPWbHDU0yb2lF5VPo6IG5m4d2n8aJ87WlKJ90m6uV+2mZTG3m+2qCM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gkLZdNbvLFDlwE1SwAhQ+C2mF/JHbfuAJhOZU57wMJ8=; b=gHd87PqKzeg/w1GI9kE0CldYWH
 4FrbI1uq/I29xzOU/7++2vGYqRsL4jJCTeexg3Qzw8TbzHHcv3fFRawtB6x4gEFBCLAD6tr0vEop1
 KupgtJCYrrWcHg3Z+3VpvQGE5pazIC7NgHWsgcdwZjGAOKDo2tyAAfC0ekHgs+AJdJHw=;
Received: from mail-qk1-f171.google.com ([209.85.222.171])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1lGnTX-00086N-Ja
 for kgdb-bugreport@lists.sourceforge.net; Mon, 01 Mar 2021 18:41:06 +0000
Received: by mail-qk1-f171.google.com with SMTP id q85so17603004qke.8
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 01 Mar 2021 10:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gkLZdNbvLFDlwE1SwAhQ+C2mF/JHbfuAJhOZU57wMJ8=;
 b=TeklHcLCVQd59aWhG3y1h8Ry46VzF/QVz8mHAhk9QIno7HKuUcNcrOnxnA0jwfhEwL
 WL4DYrs3a4eJIIVAUnHHLF9KTQV7/ztyskEV1PELfHyB4Sd8Hm2+QcxHf8olsG+anMG/
 V9SLfZXBwuBRSsDn/BMHyRPogaOjl93GoUKBA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gkLZdNbvLFDlwE1SwAhQ+C2mF/JHbfuAJhOZU57wMJ8=;
 b=Iern8AFHj3KEdRtb1zmalUzj8Feb3mebNwNbLtliIBdxLBla2y7RBQaETeG+nNIDds
 HRrZ/P50gzVC3+x7A1P8TDVr62fHF75LBH/gc4QaoN6dMsJDgoEWXpwBB77aU+ARxcek
 l2LEP8rdYZjknrtrkPmRX1girwi9EBywRXrgVGMVXIezpTV/xBPN84ZmfE6yXvroKDCY
 YNlfvXRkkqIUJkD7H/jgkPV8O7tdLLC1fFaTsTRWCIt3sm5OHTYAR4IhfRmn9T3bo7Pc
 YuPa5pBmvDOKK/giOKqrrKSnROLS1up+abu4mjYRUfGprO5/g8wQH4P8IxbdZ5RVLfYS
 2SZQ==
X-Gm-Message-State: AOAM533ihdklLzhHvFHX6iZ+6UAj58fp0qSERoPMLJ2FPk72fhX8qsGA
 rOHjOSb55psvTc92qdGkZH00Mo/Ceraaog==
X-Google-Smtp-Source: ABdhPJw6ZX6fJSTFDVWq/ytRxNDJEJp8Z4W485S5GrJRQUmdN8s+xfPhGDPhWFCShO7qb2Z5atvgUA==
X-Received: by 2002:a37:ba03:: with SMTP id k3mr9011981qkf.336.1614624053515; 
 Mon, 01 Mar 2021 10:40:53 -0800 (PST)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com.
 [209.85.219.170])
 by smtp.gmail.com with ESMTPSA id j6sm6386544qkm.81.2021.03.01.10.40.52
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Mar 2021 10:40:53 -0800 (PST)
Received: by mail-yb1-f170.google.com with SMTP id p193so18019816yba.4
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 01 Mar 2021 10:40:52 -0800 (PST)
X-Received: by 2002:a25:aa43:: with SMTP id s61mr26388944ybi.32.1614624052460; 
 Mon, 01 Mar 2021 10:40:52 -0800 (PST)
MIME-Version: 1.0
References: <20210224070827.408771-1-sumit.garg@linaro.org>
In-Reply-To: <20210224070827.408771-1-sumit.garg@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 1 Mar 2021 10:40:41 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XQAWoAQ1kkyJ1QzhJgueCj0Lui1m5cxgPQXzThxm1SGw@mail.gmail.com>
Message-ID: <CAD=FV=XQAWoAQ1kkyJ1QzhJgueCj0Lui1m5cxgPQXzThxm1SGw@mail.gmail.com>
To: Sumit Garg <sumit.garg@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.171 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.222.171 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lGnTX-00086N-Ja
Subject: Re: [Kgdb-bugreport] [PATCH v5] kdb: Simplify kdb commands
 registration
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

Hi,

On Tue, Feb 23, 2021 at 11:08 PM Sumit Garg <sumit.garg@linaro.org> wrote:
>
> Simplify kdb commands registration via using linked list instead of
> static array for commands storage.
>
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> ---
>
> Changes in v5:
> - Introduce new method: kdb_register_table() to register static kdb
>   main and breakpoint command tables instead of using statically
>   allocated commands.
>
> Changes in v4:
> - Fix kdb commands memory allocation issue prior to slab being available
>   with an array of statically allocated commands. Now it works fine with
>   kgdbwait.
> - Fix a misc checkpatch warning.
> - I have dropped Doug's review tag as I think this version includes a
>   major fix that should be reviewed again.
>
> Changes in v3:
> - Remove redundant "if" check.
> - Pick up review tag from Doug.
>
> Changes in v2:
> - Remove redundant NULL check for "cmd_name".
> - Incorporate misc. comment.
>
>  kernel/debug/kdb/kdb_bp.c      |  81 ++++--
>  kernel/debug/kdb/kdb_main.c    | 472 ++++++++++++++++++++-------------
>  kernel/debug/kdb/kdb_private.h |   3 +
>  3 files changed, 343 insertions(+), 213 deletions(-)

This looks good to me, thanks!

Random notes:

* We no longer check for "duplicate" commands for any of these
statically allocated ones, but I guess that's fine.

* Presumably nothing outside of kdb/kgdb itself needs the ability to
allocate commands statically.  The only user I see now is ftrace and
it looks like it runs late enough that it should be fine.

Reviewed-by: Douglas Anderson <dianders@chromium.org>


-Doug


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
