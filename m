Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D86F3C2B27
	for <lists+kgdb-bugreport@lfdr.de>; Sat, 10 Jul 2021 00:03:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1m1yaP-0002Rb-UC
	for lists+kgdb-bugreport@lfdr.de; Fri, 09 Jul 2021 22:03:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1m1yaO-0002RP-No
 for kgdb-bugreport@lists.sourceforge.net; Fri, 09 Jul 2021 22:03:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qQt5Yxt+QI2V2kEVlQQ4D1EcN/8bc+gnQfWtPBvR4WM=; b=PctuWnRhbw6W9MmgJT/I6L8yXE
 5MW2v08vGKwV5loKzQ5FBdN0VLbt1i3Tb+fOI+urMDgz7nKW/DD7bDeF/+sZTFbUG3NkR/5CsZNNl
 vIxK6+yiC90DI1CEspVXcJ6mR5p9IR82EhqUK9EfMGL8bHXWMlhtRmmTmIZBR0qCjthk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qQt5Yxt+QI2V2kEVlQQ4D1EcN/8bc+gnQfWtPBvR4WM=; b=IDCp9ARPwhaioHxnlvlySZRQLw
 UVK4A6E8MxUITAm5wkeDhbj+jRPPgE4mDFq2ixuxMqAKgWA12jLG067jrUUCc723bwYZQH7NT9bOy
 Dwel4MGJCMVqa2bzXF+vuudgqimd+Xv5sbbGUU+EE6t2SYPfvCTgSrtfjQisp/h1X8cM=;
Received: from mail-qk1-f182.google.com ([209.85.222.182])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1m1yaA-0005KR-RL
 for kgdb-bugreport@lists.sourceforge.net; Fri, 09 Jul 2021 22:03:04 +0000
Received: by mail-qk1-f182.google.com with SMTP id j184so11074007qkd.6
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 09 Jul 2021 15:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qQt5Yxt+QI2V2kEVlQQ4D1EcN/8bc+gnQfWtPBvR4WM=;
 b=Jea4bW6QN83UPadyfw2cVUNHb+dm7/nDCxYbXJPEmsjwxn4BLVMQhbw2Zad75RoxRk
 bfZoNh3BRqjudcYJy61eGRTD9CC7VXIqpOHxtXfQtMfpujBHrw8+K8qaorvoHA3vC4Ps
 ft45m+A0dWWRTPPIgYKUdfq3+MYeL3wipalL8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qQt5Yxt+QI2V2kEVlQQ4D1EcN/8bc+gnQfWtPBvR4WM=;
 b=O/7/Qi6fuQ4Pr8DqSEpwq6Btbt/XmMFkZyGa68bnSCEGUCAn/4tL4RWQe6FN4KFbFU
 9Qowoi2kKi8dcJF67HL3CwNHr3fa1LJpuMNuk45AfJN4ZSTwojUnkX5nObF96AYy8Oie
 ATjvZQTZcfMB3bm9hKhGQhk7solVSc9rW9jPAN0icJ90f/LtxXnnL5AKse2ovfnfDSru
 OYCuqy89TlQ5anP9KfWjYAD6DWnrCv4bzPp1gw5ngr6J0pWpMAE01DaTp+bTwSYhv8nj
 msN812Tc+Do4yYX4fe2fRP0v/1Ju4b2Lfdvfcvi84aLxlYFyPknX5OvUWcfiKfmKKgM3
 LeKQ==
X-Gm-Message-State: AOAM530f9+//aVdjC6+YhfzJNzay6ya62Mn9F6VQ5aPVjU8I/G5Bu1Ht
 ghqBugQFF2JAmi7veNrNfk0U9xWCTmP5wQ==
X-Google-Smtp-Source: ABdhPJwBIWv8+QAzYdWdbxOu4chOh05noTVtaD9GsxDXEAdvQ/RUCbXrv4LHseqj3Bu2j3RLQo0ISg==
X-Received: by 2002:a05:620a:4490:: with SMTP id
 x16mr19516922qkp.153.1625866657497; 
 Fri, 09 Jul 2021 14:37:37 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com.
 [209.85.219.173])
 by smtp.gmail.com with ESMTPSA id v72sm3081635qkb.71.2021.07.09.14.37.36
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jul 2021 14:37:36 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id p22so16666195yba.7
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 09 Jul 2021 14:37:36 -0700 (PDT)
X-Received: by 2002:a25:cc52:: with SMTP id l79mr47923674ybf.476.1625866655796; 
 Fri, 09 Jul 2021 14:37:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210709104320.101568-1-sumit.garg@linaro.org>
 <20210709104320.101568-4-sumit.garg@linaro.org>
In-Reply-To: <20210709104320.101568-4-sumit.garg@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 9 Jul 2021 14:37:24 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XHPCXSAmgf62K7+5LLbrz--BenQk5AyDozscr62qjbJg@mail.gmail.com>
Message-ID: <CAD=FV=XHPCXSAmgf62K7+5LLbrz--BenQk5AyDozscr62qjbJg@mail.gmail.com>
To: Sumit Garg <sumit.garg@linaro.org>
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.182 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.222.182 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1m1yaA-0005KR-RL
Subject: Re: [Kgdb-bugreport] [PATCH v4 3/4] kdb: Simplify kdb_defcmd macro
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

On Fri, Jul 9, 2021 at 3:43 AM Sumit Garg <sumit.garg@linaro.org> wrote:
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
> index 6d9ff4048e7d..371983c03223 100644
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
> +       kdbtab_t cmd;                   /* Macro command */
> +       struct list_head statements;    /* Associated statement list */
>  };
> +
> +struct kdb_macro_statement_t {
> +       char *statement;                /* Statement name */

This is still not really the name. This is the actual statement,
right? Like it might contain "ftdump -1", right? It seems really weird
to call that the "name". You could drop the word "name", or change
this to "Statement text", or just totally drop the comment.

Other than that this looks good to me.

Reviewed-by: Douglas Anderson <dianders@chromium.org>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
