Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF6938B5D0
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 20 May 2021 20:15:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1ljnCS-0007Uy-NG
	for lists+kgdb-bugreport@lfdr.de; Thu, 20 May 2021 18:15:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1ljnCS-0007Uo-2o
 for kgdb-bugreport@lists.sourceforge.net; Thu, 20 May 2021 18:15:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dIsGSms3zUeXZTUYxcIlfsJLSeoxkaCz0E4COH66hi8=; b=JJ+zLrBiqfusjYtsR6lIW+xMal
 VqvnYUsvC63M5z436MBY/dWhtOS/Uqj+BF95ANf0eDeYU8ObUnC0bQ/1LEKNHPDJkrjMnY74X9UrR
 irRpUNKJ2SRgwuzlLEnFlPjEoqCZcETW86+ifqCdwDWJgUw+eH6qpuKTTJcf+n+iWym0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dIsGSms3zUeXZTUYxcIlfsJLSeoxkaCz0E4COH66hi8=; b=WQXMBa0LwRcwIbpDDtSjJuTgZV
 IsDgvo4eHhHWwKpF98y3qx693m3s+z1Z60dkCukxdrTfQkuKyOBZwr9VGDKbiwQ039TqNex5PFO+k
 3N6LGGrqJgbVOl6FlKXOTMWlsYnbW6vgkDqMhPFR1hKLOvwNHNMAQI7g0q6cMYFVtmb4=;
Received: from mail-io1-f52.google.com ([209.85.166.52])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1ljnCK-0006xD-HJ
 for kgdb-bugreport@lists.sourceforge.net; Thu, 20 May 2021 18:15:11 +0000
Received: by mail-io1-f52.google.com with SMTP id d25so5763014ioe.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 20 May 2021 11:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dIsGSms3zUeXZTUYxcIlfsJLSeoxkaCz0E4COH66hi8=;
 b=OkcRWQZ7jQ2GDNnyAoUAPqJjsNQsqfyYhIHHCiGXeNTiWJwpKpLCFXG9t7om3a0n14
 iW9plRvFzPqjpf11YaIEjARLzGlvn3kGc6brJ6VWez7WfP4AmuE3Jl9j3dqdsnBvHlk1
 W3xFbCxU0TTRku8NeG4xVtdiQw42Pa5XZqCs0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dIsGSms3zUeXZTUYxcIlfsJLSeoxkaCz0E4COH66hi8=;
 b=h12f2cSZETwSupp/H0P+/R71Knzv0veZiNtM6/ufyRAEyfDalceROdIsiGha9yoyjf
 zEy02YqmusEJ8CEguxSVZaIupAFKM8aI8hpoW4dyo62nUqRo7JSH4q7Tljq18Yf/nlUp
 PApt1I5yWb07qwC5a40aB5RAkFDzq3220upbDT2/GrJPo+DHkxaBjBlVp9GNrjzr108n
 suRGpNUuya8JHARPafwrIJ8FT6QRf9R1zGzdOd3LQH1hsztxH5tgP0/HL5at+x5IOM4n
 +Y6TKOIFV0Fg+dG05115VS8iKBTZOQb37IeMzd0/9+CSqcgtjB6ugBHSH/11tGEYoAjc
 g0Ow==
X-Gm-Message-State: AOAM533oMfuipwuYktvDZAKJAW6xzF5n7puRWxScGOVuiZ0n9wMf4fsM
 YKxp+zeeVCdXTKKnL5ev36mQq4OvNZxrkA==
X-Google-Smtp-Source: ABdhPJwQYsFz+Wl7oLUBhDbRL2WgDdTLXyIftSy5QANDVuYEYeJ6wBcVWYwIC/8B085PaJPMGc1Ejg==
X-Received: by 2002:ae9:e41a:: with SMTP id q26mr6559174qkc.78.1621531283947; 
 Thu, 20 May 2021 10:21:23 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com.
 [209.85.219.181])
 by smtp.gmail.com with ESMTPSA id d11sm2573882qkk.110.2021.05.20.10.21.23
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 May 2021 10:21:23 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id n83so12978653ybg.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 20 May 2021 10:21:23 -0700 (PDT)
X-Received: by 2002:a5b:54a:: with SMTP id r10mr8778240ybp.476.1621531282709; 
 Thu, 20 May 2021 10:21:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210513112842.707103-1-sumit.garg@linaro.org>
 <20210513112842.707103-3-sumit.garg@linaro.org>
In-Reply-To: <20210513112842.707103-3-sumit.garg@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 20 May 2021 10:21:11 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W6gnqDoOCMsDTvP4_yS_szEa2g3_rhDG82ZpDTv6e5MA@mail.gmail.com>
Message-ID: <CAD=FV=W6gnqDoOCMsDTvP4_yS_szEa2g3_rhDG82ZpDTv6e5MA@mail.gmail.com>
To: Sumit Garg <sumit.garg@linaro.org>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
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
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.166.52 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.52 listed in wl.mailspike.net]
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ljnCK-0006xD-HJ
Subject: Re: [Kgdb-bugreport] [PATCH v3 2/2] kdb: Simplify kdb_defcmd macro
 logic
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
 kgdb-bugreport@lists.sourceforge.net, LKML <linux-kernel@vger.kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>,
 Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Thu, May 13, 2021 at 4:29 AM Sumit Garg <sumit.garg@linaro.org> wrote:
>
> Switch to use a linked list instead of dynamic array which makes
> allocation of kdb macro and traversing the kdb macro commands list
> simpler.
>
> Suggested-by: Daniel Thompson <daniel.thompson@linaro.org>
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> ---
>  kernel/debug/kdb/kdb_main.c | 107 +++++++++++++++++++-----------------
>  1 file changed, 58 insertions(+), 49 deletions(-)
>
> diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
> index de685b2a8ce7..ce7f4c71992d 100644
> --- a/kernel/debug/kdb/kdb_main.c
> +++ b/kernel/debug/kdb/kdb_main.c
> @@ -654,13 +654,16 @@ static void kdb_cmderror(int diag)
>   *     zero for success, a kdb diagnostic if error
>   */
>  struct kdb_macro_t {
> -       int count;
> -       bool usable;
> -       kdbtab_t cmd;
> -       char **command;
> +       kdbtab_t cmd;                   /* Macro command name */

It's more than just the name, right?


> +       struct list_head commands;      /* Associated command list */

I get confused between the two different usages of "command". Can we
call the individual entries of a macro "statements". So this would be:

struct list_head statements; /* Associated statement list */

...and the structure below would get renamed as well.

>  };
> +
> +struct kdb_macro_cmd_t {
> +       char *cmd;                      /* Command name */

This isn't the "name" of the command, is it? It's the actual statement
that the user entered?


Other than that, this looks like a nice patch to me.


-Doug


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
