Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A84732D148
	for <lists+kgdb-bugreport@lfdr.de>; Thu,  4 Mar 2021 11:59:23 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1lHlhP-00057E-Uj
	for lists+kgdb-bugreport@lfdr.de; Thu, 04 Mar 2021 10:59:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1lHlhO-00056t-74
 for kgdb-bugreport@lists.sourceforge.net; Thu, 04 Mar 2021 10:59:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vj7crQv0RBsiX1DUBa7jbsdhS16ZuGDUR9megRQZGoM=; b=XoxwgFTc59n5cPdH60TTgBRd3K
 ONbr7Y0By/DI0UBQLoCVG7I9fB0Q+pMD+3VUs/pwnygPw61Lk25py+16Q7JSmVGUf2wL/7NuGvxsM
 ohWg/djfQHNVlxkxF9oa3BaIv3uz1w199a2zkbTBwjB2HuKbdzSAOx1Q4e6Zgz1jJW0M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vj7crQv0RBsiX1DUBa7jbsdhS16ZuGDUR9megRQZGoM=; b=lqt0BDLysVMVxv5FXXtSlNM265
 PAZyJl74b1h8gMukArmzKKjMpPbRjBnHu7lRfuNWEZmvabpwxvpco7WZqUAXebGDR5oEdIRnh9IXD
 NTO/Ai2/pDeBvUU1mW2EqYsIfnFX0kPydxL3OWxyvnwtj87czQYY8AkEFHBQxovIBE/E=;
Received: from mail-lf1-f54.google.com ([209.85.167.54])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1lHlhC-0003Bz-TS
 for kgdb-bugreport@lists.sourceforge.net; Thu, 04 Mar 2021 10:59:18 +0000
Received: by mail-lf1-f54.google.com with SMTP id q25so22229057lfc.8
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 04 Mar 2021 02:59:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vj7crQv0RBsiX1DUBa7jbsdhS16ZuGDUR9megRQZGoM=;
 b=w2oE41WXVFCbvUlqrjhtMX4NdYb/PFCtelM1C2k7uR2Udy/zt8bsV0rHcfy+kIcU2G
 lB43OWqmPv8KG9C/LljFhZ/C5RMEkY5VRlmp0fwLSwkVdN5B/hMs/KMaKuKMIKjWWpQi
 OF3FwBZ+0gxJf7V96KnH7t5iKJ21mtWYrNwJK6v0cgg85MpcLcjH2rURuZdP9NxameRf
 QrktBeg7pGgG9zXwGwWF4T87imCTpca+Zqn2DEneBXwPCfONiEiNQL+jkdvpTonIjQPF
 IieTtVeBdUK+5VLNLLqFiYgFq/99KXtnFlOUNSv1O0mEBztHtGyREGI1uTbvQgecgP6i
 AzmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vj7crQv0RBsiX1DUBa7jbsdhS16ZuGDUR9megRQZGoM=;
 b=QnA0KV3xzJ5nooSQHUG5cH7xIPsK1h1gbZgCBmW0vMpp8VjZFfRjuWX2UnQuCCpmOE
 6K43fu2/BMZvZyeoZjeJf1+PKTM8X7+FD79oYbZw+QU8q7lxVlXp1Mo2ca6xB4RMUaFM
 LI+sSt5d2Igs9NsUt4xP+1vKGMBcSjaMEUBBqpJKv20/eq1rne76fngWvHGcUYfl23vV
 Iyd6BBR6gSautEnBdZcpu52uq7G2OH+fJanocsJWK5URwBQaH/CkNU7Xj21gDJUqR4o2
 yuAhAhXAL81katYO9OecfCNl5+hQX4nEvCdWyX+ZT4pLu3c1ZDWn5tXL1iwrTysmUbtr
 dDNQ==
X-Gm-Message-State: AOAM531uX2gu51+LyaJ9uVStgK7o5XxLuEq7xY1wiOTgFY67p15XOPaw
 /N8KLaFsTGza41EhEr4y4ElLV2zXkhYIrhAYSm0JKQ==
X-Google-Smtp-Source: ABdhPJyWqGiUuxPFvOFcxzQxzI3A6i2dpoPZD0hl0hSbpORcm/OPWK5ClqUWDBuKcL9Nqu78hAv989j0+dqYxoh+9JU=
X-Received: by 2002:ac2:46db:: with SMTP id p27mr1953927lfo.396.1614855540297; 
 Thu, 04 Mar 2021 02:59:00 -0800 (PST)
MIME-Version: 1.0
References: <20210224070827.408771-1-sumit.garg@linaro.org>
 <CAD=FV=XQAWoAQ1kkyJ1QzhJgueCj0Lui1m5cxgPQXzThxm1SGw@mail.gmail.com>
In-Reply-To: <CAD=FV=XQAWoAQ1kkyJ1QzhJgueCj0Lui1m5cxgPQXzThxm1SGw@mail.gmail.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Thu, 4 Mar 2021 16:28:49 +0530
Message-ID: <CAFA6WYPBka8B7WSD_v_UAHgRzDnK3V-OY91-M6SNKi=PpuK4Og@mail.gmail.com>
To: Doug Anderson <dianders@chromium.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.54 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.54 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1lHlhC-0003Bz-TS
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

Hi Doug,

On Tue, 2 Mar 2021 at 00:10, Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Tue, Feb 23, 2021 at 11:08 PM Sumit Garg <sumit.garg@linaro.org> wrote:
> >
> > Simplify kdb commands registration via using linked list instead of
> > static array for commands storage.
> >
> > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> > ---
> >
> > Changes in v5:
> > - Introduce new method: kdb_register_table() to register static kdb
> >   main and breakpoint command tables instead of using statically
> >   allocated commands.
> >
> > Changes in v4:
> > - Fix kdb commands memory allocation issue prior to slab being available
> >   with an array of statically allocated commands. Now it works fine with
> >   kgdbwait.
> > - Fix a misc checkpatch warning.
> > - I have dropped Doug's review tag as I think this version includes a
> >   major fix that should be reviewed again.
> >
> > Changes in v3:
> > - Remove redundant "if" check.
> > - Pick up review tag from Doug.
> >
> > Changes in v2:
> > - Remove redundant NULL check for "cmd_name".
> > - Incorporate misc. comment.
> >
> >  kernel/debug/kdb/kdb_bp.c      |  81 ++++--
> >  kernel/debug/kdb/kdb_main.c    | 472 ++++++++++++++++++++-------------
> >  kernel/debug/kdb/kdb_private.h |   3 +
> >  3 files changed, 343 insertions(+), 213 deletions(-)
>
> This looks good to me, thanks!
>
> Random notes:
>
> * We no longer check for "duplicate" commands for any of these
> statically allocated ones, but I guess that's fine.

Yeah, I think that check is redundant for static ones.

>
> * Presumably nothing outside of kdb/kgdb itself needs the ability to
> allocate commands statically.  The only user I see now is ftrace and
> it looks like it runs late enough that it should be fine.

Agree.

>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>

Thanks,
-Sumit

>
> -Doug


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
