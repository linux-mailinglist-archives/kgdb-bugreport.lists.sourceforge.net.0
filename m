Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 573A33027F7
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 25 Jan 2021 17:35:23 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1l44pl-0001ym-8y
	for lists+kgdb-bugreport@lfdr.de; Mon, 25 Jan 2021 16:35:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1l44pj-0001ye-MB
 for kgdb-bugreport@lists.sourceforge.net; Mon, 25 Jan 2021 16:35:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=C/v4OJUMnI2Hi06JUgt13GRLw3pm4pkZR5SedogE/Jw=; b=bD0+zzMgUlkIK/VpMHDL12zS/L
 vN1XQdsanMnkefN3kdHTobC4GJ7Vnte5uViu3YaiDfs1AmwvuauTcsM8ya184DnZn84r1YO6ekmWz
 DWXeRPgE7V/vANP3I2eWdoLjyd4u3qUbQCWUJbZgNc54nOYVgt+WDoGGxP79ZSvro+sA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=C/v4OJUMnI2Hi06JUgt13GRLw3pm4pkZR5SedogE/Jw=; b=JDgFaTQR4LaB+J29Oq6bqB7lHm
 Mc+XGGVPCgoxCj4GHmrfLi0yTDdFEN7vYKOHcKvccekr0VhRJULeSAxvHhzr6I+IDKN25o9I+Ci9W
 z+0R8NHMeKU8B4DLL6wb8PQerVOzgY8E53oD5s/q67pK3yb6lbOZ0ylvSeExfHS1W1CI=;
Received: from mail-ua1-f44.google.com ([209.85.222.44])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1l44pX-0071wc-DO
 for kgdb-bugreport@lists.sourceforge.net; Mon, 25 Jan 2021 16:35:19 +0000
Received: by mail-ua1-f44.google.com with SMTP id g13so4630438uaw.5
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 25 Jan 2021 08:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=C/v4OJUMnI2Hi06JUgt13GRLw3pm4pkZR5SedogE/Jw=;
 b=PWHcK7+QLWqXN2BKaHfQlpwTEcM43EJGv/cRbgk+jH9jDlXanZdbnxgoV9LjNqVOQ/
 OJV1i/yQ+qnaUSwe6nWNCpStNQMMiBBeYYgUIGX/uH8eCTAA8xL9FL0mv/PN2cMfjen0
 dgJrXXkSlE6fsbtlxGYRda/UWG11WCp1Pfhf0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=C/v4OJUMnI2Hi06JUgt13GRLw3pm4pkZR5SedogE/Jw=;
 b=MNkvlebsu11zS7YCJKAtPbutGRBERwGMwE2E+uZ/Sp9tQDPU6XjNGWhqH2lgEnbhYb
 EutfDwqJ5y7BM/4Y9dlj8StOdVh4SBAacfrQyIuLGE+ohT5RHvRYN7R61XdFr26U8vvm
 F6jTHEcQUXGDydoUcb/WJtkIYpv279eL1kw4Lva9KsOr8k/qamI8bG5pvq6eh8X6h8Fz
 OKuWWsbV9XRiE5wXebfoc8KBcam028gZuC2xGTqrjhQz8dBWjYdOSFq+tfYxUwpS9SCM
 1uVamwrls4KkxTMosfYNvhiihnfSP6LvPBby8j9BSLfrFm7l6otdjarACvLYodqGKNms
 zaCQ==
X-Gm-Message-State: AOAM530bNbGxr4VPln1gqJECtcutrwQ8R3TJfcosIH5DGoh5ALseiXiN
 3MqpGxFVo9uTj7Ncf7EEDwTC4bjR/XZxRA==
X-Google-Smtp-Source: ABdhPJw9r3vQg9RxoUeqrBjT/bmqJrjoFbYR7Gpn/jfDHItdZkP8WgbmQJL5bdyrajlFUolLoK+Njw==
X-Received: by 2002:ab0:5fcc:: with SMTP id g12mr915999uaj.119.1611590516302; 
 Mon, 25 Jan 2021 08:01:56 -0800 (PST)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com.
 [209.85.221.176])
 by smtp.gmail.com with ESMTPSA id y2sm2335096vkg.47.2021.01.25.08.01.52
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jan 2021 08:01:53 -0800 (PST)
Received: by mail-vk1-f176.google.com with SMTP id y8so1223867vky.4
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 25 Jan 2021 08:01:52 -0800 (PST)
X-Received: by 2002:ac5:c318:: with SMTP id j24mr1121336vkk.21.1611590512183; 
 Mon, 25 Jan 2021 08:01:52 -0800 (PST)
MIME-Version: 1.0
References: <1611558371-14414-1-git-send-email-sumit.garg@linaro.org>
In-Reply-To: <1611558371-14414-1-git-send-email-sumit.garg@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 25 Jan 2021 08:01:40 -0800
X-Gmail-Original-Message-ID: <CAD=FV=X-rA6F_dS-f7f5WO2SZbVYrrg5A5dOrXe_6FrE=ZhqQg@mail.gmail.com>
Message-ID: <CAD=FV=X-rA6F_dS-f7f5WO2SZbVYrrg5A5dOrXe_6FrE=ZhqQg@mail.gmail.com>
To: Sumit Garg <sumit.garg@linaro.org>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.222.44 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.44 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1l44pX-0071wc-DO
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

Hi,

On Sun, Jan 24, 2021 at 11:06 PM Sumit Garg <sumit.garg@linaro.org> wrote:
>
> Simplify kdb commands registration via using linked list instead of
> static array for commands storage.
>
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> ---
>
> Changes in v2:
> - Remove redundant NULL check for "cmd_name".
> - Incorporate misc. comment.
>
>  kernel/debug/kdb/kdb_main.c    | 119 ++++++++++++-----------------------------
>  kernel/debug/kdb/kdb_private.h |   1 +
>  2 files changed, 34 insertions(+), 86 deletions(-)
>
> diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
> index 930ac1b..a0989a0 100644
> --- a/kernel/debug/kdb/kdb_main.c
> +++ b/kernel/debug/kdb/kdb_main.c
> @@ -33,6 +33,7 @@
>  #include <linux/kallsyms.h>
>  #include <linux/kgdb.h>
>  #include <linux/kdb.h>
> +#include <linux/list.h>
>  #include <linux/notifier.h>
>  #include <linux/interrupt.h>
>  #include <linux/delay.h>
> @@ -84,15 +85,8 @@ static unsigned int kdb_continue_catastrophic =
>  static unsigned int kdb_continue_catastrophic;
>  #endif
>
> -/* kdb_commands describes the available commands. */
> -static kdbtab_t *kdb_commands;
> -#define KDB_BASE_CMD_MAX 50
> -static int kdb_max_commands = KDB_BASE_CMD_MAX;
> -static kdbtab_t kdb_base_commands[KDB_BASE_CMD_MAX];
> -#define for_each_kdbcmd(cmd, num)                                      \
> -       for ((cmd) = kdb_base_commands, (num) = 0;                      \
> -            num < kdb_max_commands;                                    \
> -            num++, num == KDB_BASE_CMD_MAX ? cmd = kdb_commands : cmd++)
> +/* kdb_cmds_head describes the available commands. */
> +static LIST_HEAD(kdb_cmds_head);
>
>  typedef struct _kdbmsg {
>         int     km_diag;        /* kdb diagnostic */
> @@ -921,7 +915,7 @@ int kdb_parse(const char *cmdstr)
>         char *cp;
>         char *cpp, quoted;
>         kdbtab_t *tp;
> -       int i, escaped, ignore_errors = 0, check_grep = 0;
> +       int escaped, ignore_errors = 0, check_grep = 0;
>
>         /*
>          * First tokenize the command string.
> @@ -1011,25 +1005,18 @@ int kdb_parse(const char *cmdstr)
>                 ++argv[0];
>         }
>
> -       for_each_kdbcmd(tp, i) {
> -               if (tp->cmd_name) {
> -                       /*
> -                        * If this command is allowed to be abbreviated,
> -                        * check to see if this is it.
> -                        */
> -
> -                       if (tp->cmd_minlen
> -                        && (strlen(argv[0]) <= tp->cmd_minlen)) {
> -                               if (strncmp(argv[0],
> -                                           tp->cmd_name,
> -                                           tp->cmd_minlen) == 0) {
> -                                       break;
> -                               }
> -                       }
> -
> -                       if (strcmp(argv[0], tp->cmd_name) == 0)
> +       list_for_each_entry(tp, &kdb_cmds_head, list_node) {
> +               /*
> +                * If this command is allowed to be abbreviated,
> +                * check to see if this is it.
> +                */
> +               if (tp->cmd_minlen && (strlen(argv[0]) <= tp->cmd_minlen)) {
> +                       if (strncmp(argv[0], tp->cmd_name, tp->cmd_minlen) == 0)
>                                 break;
>                 }

The old code had the same problem, but since you're touching it you could fix?

if (a) {
  if (b)
    break;
}

...is the same as:

if (a && b)
  break;

In any case, this looks like quite a nice cleanup, so:

Reviewed-by: Douglas Anderson <dianders@chromium.org>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
