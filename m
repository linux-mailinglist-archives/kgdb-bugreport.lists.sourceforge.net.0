Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA673222DB
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 23 Feb 2021 00:58:33 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1lEL60-0006fP-Ol
	for lists+kgdb-bugreport@lfdr.de; Mon, 22 Feb 2021 23:58:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1lEL60-0006fF-4I
 for kgdb-bugreport@lists.sourceforge.net; Mon, 22 Feb 2021 23:58:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tqB6zjqAy2RrQCNQKVBo9coXh/LjEZ0bIel8hnnVASw=; b=Wg5fSB6yFV1LgMLjVliwC8rBrO
 gHUwuP7Z7tKKeEPHUOhX23JR/+5CRBw8gb74JHnBdJR9Lq+wNKPTRMv6pRwHUtk6eBEgVx8iIYJfP
 qmQZWUQ+B4anEKfBGXJcLihaiLqRo6md/b8zGEJoU8qbnWfaggLlUUIV9wylqPyI7H2s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tqB6zjqAy2RrQCNQKVBo9coXh/LjEZ0bIel8hnnVASw=; b=C5tApfzTliz/4ezi+bwi01Jm0e
 4bk3M76JL/PwU+VwFPXmFwssOACeXb3epvLoSfAUTisvWWaeijz8lEG8xs+D2hmsRd4Fn/CRS+5bs
 svuG6mO1F2F5n7SwouMMo9hFzVZOmk0yuDpFyJ8C/MKqNCJ1SwrN81Z4VbVG+xiw5qy4=;
Received: from mail-qt1-f176.google.com ([209.85.160.176])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1lEL5q-001puz-7d
 for kgdb-bugreport@lists.sourceforge.net; Mon, 22 Feb 2021 23:58:32 +0000
Received: by mail-qt1-f176.google.com with SMTP id r24so1791847qtt.8
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 22 Feb 2021 15:58:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tqB6zjqAy2RrQCNQKVBo9coXh/LjEZ0bIel8hnnVASw=;
 b=J8IAiCXlzUD6MCNysWcSKYY4NZhG0kPUOcT0WqfNU16JuDf0Mrz6FEvHY9EFTqWokR
 n6oMLkXl9nxRDWrTiW+SpQhgNDkRz8TkFzTfWSFpQHz+uhvS7UHRhlj9vTijY/yjlGqg
 snxVQGV883FWcIPB+dQb35ccrkxZWi1MeYqdY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tqB6zjqAy2RrQCNQKVBo9coXh/LjEZ0bIel8hnnVASw=;
 b=stlWbOeBmddoGgG9+H1flpaw2FivxTQOyOhEDGf9HYZsRxSnYaPmbiJDOb347JCZUa
 xy3EeFYlQ1gt7jIJpK250n+WO16N8/o207y10pkmT3IHuOkZxk8BXYIh8WYXLe5bF6Rm
 mz7j7MAiWxZ1I+mil9/LpeAMf3jqgsTuXo3345gIGGjWwPoXMt4eS1F3LRy4b3qaT97V
 VWe+kDLNZmLW34uX9kuvqzqC0QcKuXCm2WX4SL6swBF0sf0tSFqsz7s0KzinVT9m+LPC
 mf8u32jn2g0D2Iv9+ucaQ2OC06mNUVXWXzigwo+QTWWUX8mHCFGVjatlhM8jWF1ZCfF9
 4Lng==
X-Gm-Message-State: AOAM533JsqgjWWCTKEd9xw4uQSee++4aPLgL6s9//bT0q/bqJTvIYFzr
 KYXmTBMlaOjab2VJVFNHJ1OBlyxRhL0AkA==
X-Google-Smtp-Source: ABdhPJylI+8vjMr6rc3AG7j3Y/mjDGOBn+p025S/51v2mFDOsAyGdAfQVHSI8iym5CyaDn8z1kCPkg==
X-Received: by 2002:a05:622a:8:: with SMTP id
 x8mr22668453qtw.359.1614038296030; 
 Mon, 22 Feb 2021 15:58:16 -0800 (PST)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com.
 [209.85.219.179])
 by smtp.gmail.com with ESMTPSA id d20sm6059674qkb.88.2021.02.22.15.58.15
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Feb 2021 15:58:15 -0800 (PST)
Received: by mail-yb1-f179.google.com with SMTP id p193so14734216yba.4
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 22 Feb 2021 15:58:15 -0800 (PST)
X-Received: by 2002:a25:d3c5:: with SMTP id
 e188mr37775337ybf.345.1614038295152; 
 Mon, 22 Feb 2021 15:58:15 -0800 (PST)
MIME-Version: 1.0
References: <1613721694-16418-1-git-send-email-sumit.garg@linaro.org>
In-Reply-To: <1613721694-16418-1-git-send-email-sumit.garg@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 22 Feb 2021 15:58:04 -0800
X-Gmail-Original-Message-ID: <CAD=FV=X1hsFf08J5JNifzFGw=1ikmXj2mp6K=KMOAzCYDWKZUw@mail.gmail.com>
Message-ID: <CAD=FV=X1hsFf08J5JNifzFGw=1ikmXj2mp6K=KMOAzCYDWKZUw@mail.gmail.com>
To: Sumit Garg <sumit.garg@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.160.176 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.160.176 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lEL5q-001puz-7d
Subject: Re: [Kgdb-bugreport] [PATCH] kernel: debug: Handle breakpoints in
 kernel .init.text section
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Peter Zijlstra <peterz@infradead.org>, kgdb-bugreport@lists.sourceforge.net,
 LKML <linux-kernel@vger.kernel.org>, qy15sije@cip.cs.fau.de,
 Jason Wessel <jason.wessel@windriver.com>, stefan.saecherl@fau.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Fri, Feb 19, 2021 at 12:03 AM Sumit Garg <sumit.garg@linaro.org> wrote:
>
> Currently breakpoints in kernel .init.text section are not handled
> correctly while allowing to remove them even after corresponding pages
> have been freed.
>
> In order to keep track of .init.text section breakpoints, add another
> breakpoint state as BP_ACTIVE_INIT and don't try to free these
> breakpoints once the system is in running state.
>
> To be clear there is still a very small window between call to
> free_initmem() and system_state = SYSTEM_RUNNING which can lead to
> removal of freed .init.text section breakpoints but I think we can live
> with that.

I know kdb / kgdb tries to keep out of the way of the rest of the
system and so there's a bias to just try to infer the state of the
rest of the system, but this feels like a halfway solution when really
a cleaner solution really wouldn't intrude much on the main kernel.
It seems like it's at least worth asking if we can just add a call
like kgdb_drop_init_breakpoints() into main.c.  Then we don't have to
try to guess the state...


> Suggested-by: Peter Zijlstra <peterz@infradead.org>
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> ---
>  include/linux/kgdb.h      |  3 ++-
>  kernel/debug/debug_core.c | 17 +++++++++++++----
>  2 files changed, 15 insertions(+), 5 deletions(-)
>
> diff --git a/include/linux/kgdb.h b/include/linux/kgdb.h
> index 0d6cf64..57b8885 100644
> --- a/include/linux/kgdb.h
> +++ b/include/linux/kgdb.h
> @@ -71,7 +71,8 @@ enum kgdb_bpstate {
>         BP_UNDEFINED = 0,
>         BP_REMOVED,
>         BP_SET,
> -       BP_ACTIVE
> +       BP_ACTIVE_INIT,
> +       BP_ACTIVE,
>  };
>
>  struct kgdb_bkpt {
> diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
> index af6e8b4f..229dd11 100644
> --- a/kernel/debug/debug_core.c
> +++ b/kernel/debug/debug_core.c
> @@ -324,7 +324,11 @@ int dbg_activate_sw_breakpoints(void)
>                 }
>
>                 kgdb_flush_swbreak_addr(kgdb_break[i].bpt_addr);
> -               kgdb_break[i].state = BP_ACTIVE;
> +               if (system_state >= SYSTEM_RUNNING ||
> +                   !init_section_contains((void *)kgdb_break[i].bpt_addr, 0))

I haven't searched through all the code, but is there any chance that
this could trigger incorrectly?  After we free the init memory could
it be re-allocated to something that would contain code that would
execute in kernel context and now we'd be unable to set breakpoints in
that area?


> +                       kgdb_break[i].state = BP_ACTIVE;
> +               else
> +                       kgdb_break[i].state = BP_ACTIVE_INIT;

I don't really see what the "BP_ACTIVE_INIT" state gets you.  Why not
just leave it as "BP_ACTIVE" and put all the logic fully in
dbg_deactivate_sw_breakpoints()?

...or, if we can inject a call in main.c we can do a one time delete
of all "init" breakpoints and get rid of all this logic?  Heck, even
if we can't get called by "main.c", we still only need to do a
one-time drop of all init breakpoints the first time we drop into the
debugger after they are freed, right?

Oh shoot.  I just realized another problem.  What about hardware
breakpoints?  You still need to call "remove" on them once after init
memory is freed, right?

-Doug


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
