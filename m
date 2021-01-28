Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C48306CB0
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 28 Jan 2021 06:19:06 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1l4zhx-0006Bo-JL
	for lists+kgdb-bugreport@lfdr.de; Thu, 28 Jan 2021 05:19:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1l4zhb-0006Av-HG
 for kgdb-bugreport@lists.sourceforge.net; Thu, 28 Jan 2021 05:18:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lRMblRuvpgkCUXMjL7udQPNGPedNtxUO5H5aUcWux1Q=; b=AoNieaPJjgByXKiJbvdQFtgVwB
 somkYyVWlkf1m6r1AYDc8wtUghHF3C0su7rSV9CjtDqPHaY2W7HTRw1f7dKsiboijYu7ujkUUhwD3
 rsZxn7NxQ07Q05elK7WH5aiJIyd/1hqysA9p27LUPVNn7SdtcZCPIU+9GgIWGapBvNuI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lRMblRuvpgkCUXMjL7udQPNGPedNtxUO5H5aUcWux1Q=; b=UpJK7BVwsfexbJ0P66QahzPDA5
 mA70u9BdeW4dP8by8A9a3hSi0++N602NiOdjhcPYMAOYggabYUXIttb2PltJu7xWN13d3H6e5Aqn1
 IxKN+5zb5LSh2wBWlpIylFnoWW5qzIzyN3/vsJxgZtMJ7Qx5Nst0aPV/ZJnu56LLbQAk=;
Received: from mail-lf1-f42.google.com ([209.85.167.42])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1l4zhJ-00D7mN-1t
 for kgdb-bugreport@lists.sourceforge.net; Thu, 28 Jan 2021 05:18:43 +0000
Received: by mail-lf1-f42.google.com with SMTP id e2so2332294lfj.13
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 27 Jan 2021 21:18:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lRMblRuvpgkCUXMjL7udQPNGPedNtxUO5H5aUcWux1Q=;
 b=AtNdQdTHkF9Ap0SSwUyv2YMmZdL/X5B5VbMwjvqHojkAVgmOyPyVCnv52MoKnGDtEg
 9utj+xgMaDdIYmyNg+FFfFnbZawleq/tioIAgMnpcYNGpxAnBhc938kVBojphQ+4VaT5
 MR/7u42BWqwR3lwVk5CBIiOpJMo/gphyuZDhWdKChx9/P7yZj6F+ySS0pCbVhMKa6E5U
 aQJVDaclLX+42VHIQtNiRyZCovG3H69k0lFVo+JfETcQur4k+0DG91ShgOvOl3OBHJpQ
 CBb6VedAZ3MGZKOdQVwRayORbTZRu7ItyULxBr1HAuFzGv6qcSmq7T56FnRQAYOgbUTP
 SHvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lRMblRuvpgkCUXMjL7udQPNGPedNtxUO5H5aUcWux1Q=;
 b=C6C5sNwR9tgNRLPYGc8ljXko8x2IShd1Us9Ne+t9BHt4vRKZ2TwgKdgNqTEIh1ESRL
 PM+fErdet96YZL3Peg7pT+7NeX3k6NSYk1Yl2XfQQR+6t/i30qkqKTiy/sdl5GRe90mL
 RtnbDat17w92fmxsA5/vnC60ORHn6RywhKD2Lz5KUVS43Nx5blP/QVHZkAmCiobmPISM
 9J/FAUYVPS3RdvMIfqy57sYqDxuKS8SKzYwAZnnZ9Zt+CG/KSs9GiS41UPnSmlYAPK4Q
 jsrNabKEhLvYWKSqULnHEQY/a0loV/hKqr9t8Gy71OzDZ3BY/YXAbro8CrKft6PKXt95
 9SIw==
X-Gm-Message-State: AOAM531eYVTGnTWWpXdyyOh4BaZSBYF4x8pjSq9VoubE8hdoRl0bViQK
 3QOXtMpYJTnajiFJJnhRNYEltCWfLEBUWcF2bExoueP6UCQ=
X-Google-Smtp-Source: ABdhPJyQdom+qaZmHu7lxZgdJ8DQriX1J3vN4N4VrXthyy3Jk2Xt8QQmliKNeAzd+HZT3MMK6OULRIT9ICyZHtgvc2w=
X-Received: by 2002:a2e:9b57:: with SMTP id o23mr7729720ljj.314.1611810750523; 
 Wed, 27 Jan 2021 21:12:30 -0800 (PST)
MIME-Version: 1.0
References: <1611558371-14414-1-git-send-email-sumit.garg@linaro.org>
 <CAD=FV=X-rA6F_dS-f7f5WO2SZbVYrrg5A5dOrXe_6FrE=ZhqQg@mail.gmail.com>
In-Reply-To: <CAD=FV=X-rA6F_dS-f7f5WO2SZbVYrrg5A5dOrXe_6FrE=ZhqQg@mail.gmail.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Thu, 28 Jan 2021 10:42:18 +0530
Message-ID: <CAFA6WYMZEU3Sme0GH16i+QHv3uhzSevjpEMzfY8trKvT_gV_Hw@mail.gmail.com>
To: Doug Anderson <dianders@chromium.org>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.42 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.42 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 TIME_LIMIT_EXCEEDED    Exceeded time limit / deadline
X-Headers-End: 1l4zhJ-00D7mN-1t
Subject: Re: [Kgdb-bugreport] [PATCH v2] kdb: Simplify kdb commands
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

On Mon, 25 Jan 2021 at 21:32, Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Sun, Jan 24, 2021 at 11:06 PM Sumit Garg <sumit.garg@linaro.org> wrote:
> >
> > Simplify kdb commands registration via using linked list instead of
> > static array for commands storage.
> >
> > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> > ---
> >
> > Changes in v2:
> > - Remove redundant NULL check for "cmd_name".
> > - Incorporate misc. comment.
> >
> >  kernel/debug/kdb/kdb_main.c    | 119 ++++++++++++-----------------------------
> >  kernel/debug/kdb/kdb_private.h |   1 +
> >  2 files changed, 34 insertions(+), 86 deletions(-)
> >
> > diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
> > index 930ac1b..a0989a0 100644
> > --- a/kernel/debug/kdb/kdb_main.c
> > +++ b/kernel/debug/kdb/kdb_main.c
> > @@ -33,6 +33,7 @@
> >  #include <linux/kallsyms.h>
> >  #include <linux/kgdb.h>
> >  #include <linux/kdb.h>
> > +#include <linux/list.h>
> >  #include <linux/notifier.h>
> >  #include <linux/interrupt.h>
> >  #include <linux/delay.h>
> > @@ -84,15 +85,8 @@ static unsigned int kdb_continue_catastrophic =
> >  static unsigned int kdb_continue_catastrophic;
> >  #endif
> >
> > -/* kdb_commands describes the available commands. */
> > -static kdbtab_t *kdb_commands;
> > -#define KDB_BASE_CMD_MAX 50
> > -static int kdb_max_commands = KDB_BASE_CMD_MAX;
> > -static kdbtab_t kdb_base_commands[KDB_BASE_CMD_MAX];
> > -#define for_each_kdbcmd(cmd, num)                                      \
> > -       for ((cmd) = kdb_base_commands, (num) = 0;                      \
> > -            num < kdb_max_commands;                                    \
> > -            num++, num == KDB_BASE_CMD_MAX ? cmd = kdb_commands : cmd++)
> > +/* kdb_cmds_head describes the available commands. */
> > +static LIST_HEAD(kdb_cmds_head);
> >
> >  typedef struct _kdbmsg {
> >         int     km_diag;        /* kdb diagnostic */
> > @@ -921,7 +915,7 @@ int kdb_parse(const char *cmdstr)
> >         char *cp;
> >         char *cpp, quoted;
> >         kdbtab_t *tp;
> > -       int i, escaped, ignore_errors = 0, check_grep = 0;
> > +       int escaped, ignore_errors = 0, check_grep = 0;
> >
> >         /*
> >          * First tokenize the command string.
> > @@ -1011,25 +1005,18 @@ int kdb_parse(const char *cmdstr)
> >                 ++argv[0];
> >         }
> >
> > -       for_each_kdbcmd(tp, i) {
> > -               if (tp->cmd_name) {
> > -                       /*
> > -                        * If this command is allowed to be abbreviated,
> > -                        * check to see if this is it.
> > -                        */
> > -
> > -                       if (tp->cmd_minlen
> > -                        && (strlen(argv[0]) <= tp->cmd_minlen)) {
> > -                               if (strncmp(argv[0],
> > -                                           tp->cmd_name,
> > -                                           tp->cmd_minlen) == 0) {
> > -                                       break;
> > -                               }
> > -                       }
> > -
> > -                       if (strcmp(argv[0], tp->cmd_name) == 0)
> > +       list_for_each_entry(tp, &kdb_cmds_head, list_node) {
> > +               /*
> > +                * If this command is allowed to be abbreviated,
> > +                * check to see if this is it.
> > +                */
> > +               if (tp->cmd_minlen && (strlen(argv[0]) <= tp->cmd_minlen)) {
> > +                       if (strncmp(argv[0], tp->cmd_name, tp->cmd_minlen) == 0)
> >                                 break;
> >                 }
>
> The old code had the same problem, but since you're touching it you could fix?
>
> if (a) {
>   if (b)
>     break;
> }
>
> ...is the same as:
>
> if (a && b)
>   break;
>

Sure, I will fix it in the next version.

> In any case, this looks like quite a nice cleanup, so:
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Thanks,
Sumit


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
