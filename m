Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 059751784BA
	for <lists+kgdb-bugreport@lfdr.de>; Tue,  3 Mar 2020 22:17:18 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1j9Eui-0001qc-Ph
	for lists+kgdb-bugreport@lfdr.de; Tue, 03 Mar 2020 21:17:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1j9Euh-0001qV-UV
 for kgdb-bugreport@lists.sourceforge.net; Tue, 03 Mar 2020 21:17:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ySvw2VElOoI+GxWwdqvLapZW7S1uwrffgeO7svUy80k=; b=KYxVZXv+MAps90AzsAnBqOU/2/
 JFgu2LS+kskwS78WaJLjUFZ3jWKXqOjCv6ypzIr8MyMFLBIdXgyg4EFrGBaqPVLDTCn+GuvNEjFv+
 x7ByCUKWCz//xBpAGXLKI9JyV0DlroMSaPKs8eofmr78nC+rKVAMsreoE00cMZyqUBok=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ySvw2VElOoI+GxWwdqvLapZW7S1uwrffgeO7svUy80k=; b=ZcPsQV4MQfPiL7aj+6TNPz3wg6
 3ItOtsrMmaId5U4J6FJuhZ0xpQtfcxi5Fj1TP/3XEKGCyDPFG/+NIW0sLBWgpWxPjIBNA86pzjaVj
 yo3HpFVXXa8aiWCdmI2tWtXvXSu5p3BwINtqzmoSb1CBeAgEcHNSYt6tB1NQEO70eug0=;
Received: from mail-vs1-f67.google.com ([209.85.217.67])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1j9Eue-00CJVF-2g
 for kgdb-bugreport@lists.sourceforge.net; Tue, 03 Mar 2020 21:17:15 +0000
Received: by mail-vs1-f67.google.com with SMTP id n6so944604vsc.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 03 Mar 2020 13:17:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ySvw2VElOoI+GxWwdqvLapZW7S1uwrffgeO7svUy80k=;
 b=DIVZ+3pWVbzuKToHdSMqua+XDKFW685uSgRxSDqtN80EEn2THAGD+9qpxgcE6WaJ/0
 3fnHp8XrClvfRUtbSF1+afo1PciMZrjHCqs3+HZ+GgchXzD1hpI50Qp/kmsr1mFijGIy
 C9v5UnGj+C5SWlCdZRBMAFMoNGDxLr8CbzbGk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ySvw2VElOoI+GxWwdqvLapZW7S1uwrffgeO7svUy80k=;
 b=b3Kdy1bckNmhsmuAFbOLcDi8gvFVdEPiKUyZdxU5f9Y6I16QPw70ZFAqB5fbtQlilE
 o8ikGfLJSLF1z3SVVEsMz8r2RAclrEGEBEuTMs0yuKOyfZnQKkVUypUIT5CbeLpE24nw
 GxCcIZ6GjxZR/K0zcWfPYEXefsRJidYFFxgl8mKVDLNy2q15oL7P1sAKJ0Zp3b9nyZ9m
 lSKvuQmwZLcxpbpNDvarhbDh6cUKXtijACivKhN7pRR8hHLqfgmCpcXYqmMor7hGqj/V
 nHDtvnxRRKQMZBWXD8T2hsRMTLj9fNCmPr50yY6nutlTwcB0JJk1RkhefsNgTaElAtU0
 +18w==
X-Gm-Message-State: ANhLgQ1T5/5wVCNkHTa36rrs3cNt64lUIHihBuZ5Lo3z+KXMQwcWZU8g
 7rj8zho3zs+wNF6NM/J8MQSPwOWhjJc=
X-Google-Smtp-Source: ADFU+vsnTo5daXHP9DSu7O7DHNLD5R3qBBuvR+d438lqAP5eLA+1/4S5g1R2802M3MypSDBq++ThNw==
X-Received: by 2002:a67:60c4:: with SMTP id u187mr3568933vsb.74.1583268776830; 
 Tue, 03 Mar 2020 12:52:56 -0800 (PST)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com.
 [209.85.217.41])
 by smtp.gmail.com with ESMTPSA id i66sm6761783vkh.28.2020.03.03.12.52.56
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Mar 2020 12:52:56 -0800 (PST)
Received: by mail-vs1-f41.google.com with SMTP id h5so3379656vsc.4
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 03 Mar 2020 12:52:56 -0800 (PST)
X-Received: by 2002:a67:e98e:: with SMTP id b14mr1311097vso.106.1583268775719; 
 Tue, 03 Mar 2020 12:52:55 -0800 (PST)
MIME-Version: 1.0
References: <20200213150553.313596-1-daniel.thompson@linaro.org>
In-Reply-To: <20200213150553.313596-1-daniel.thompson@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 3 Mar 2020 12:52:44 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Uqgjgf+hL7=tpBixyxiDhXA_k5kfZ1RUtk6f+CVgUikg@mail.gmail.com>
Message-ID: <CAD=FV=Uqgjgf+hL7=tpBixyxiDhXA_k5kfZ1RUtk6f+CVgUikg@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -1.6 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.217.67 listed in list.dnswl.org]
 -1.5 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.217.67 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1j9Eue-00CJVF-2g
Subject: Re: [Kgdb-bugreport] [PATCH] kdb: Eliminate strncpy() warnings by
 replacing with strscpy()
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
Cc: kgdb-bugreport@lists.sourceforge.net, Patch Tracking <patches@linaro.org>,
 LKML <linux-kernel@vger.kernel.org>, Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Thu, Feb 13, 2020 at 7:06 AM Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> Currently the code to manage the kdb history buffer uses strncpy() to
> copy strings to/and from the history and exhibits the classic "but
> nobody ever told me that strncpy() doesn't always terminate strings"
> bug. Modern gcc compilers recognise this bug and issue a warning.
>
> In reality these calls will only abridge the copied string if kdb_read()
> has *already* overflowed the command buffer. Thus the use of counted
> copies here is only used to reduce the secondary effects of a bug
> elsewhere in the code.
>
> Therefore transitioning these calls into strscpy() (without checking
> the return code) is appropriate.
>
> Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
> ---
>  kernel/debug/kdb/kdb_main.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
> index ba12e9f4661e..a4641be4123c 100644
> --- a/kernel/debug/kdb/kdb_main.c
> +++ b/kernel/debug/kdb/kdb_main.c
> @@ -1102,12 +1102,12 @@ static int handle_ctrl_cmd(char *cmd)
>         case CTRL_P:
>                 if (cmdptr != cmd_tail)
>                         cmdptr = (cmdptr-1) % KDB_CMD_HISTORY_COUNT;

The above line (not touched by your patch) is slightly worrying to me.
I always have it in mind that "%" of numbers that might be negative
isn't an amazingly good idea.  Some searches say that this must be
true:

a == (a / b * b) + a % b

...which makes it feel like this is totally broken because "cmdptr"
will end up as -1.  Huh?

OK, after much digging and some printouts, I figured this out.  cmdptr
is _unsigned_ and KDB_CMD_HISTORY_COUNT is a power of 2 (it's 32)
which makes this work.  AKA if you start out at 0 and subtract 1, you
get 0xffffffff and then that "% 32" is 31 which is the answer that was
desired.  Totally non-obvious.

I guess a future change should make the above:

cmdptr = (cmdptr + KDB_CMD_HISTORY_COUNT - 1) %
  KDB_CMD_HISTORY_COUNT;



> -               strncpy(cmd_cur, cmd_hist[cmdptr], CMD_BUFLEN);
> +               strscpy(cmd_cur, cmd_hist[cmdptr], CMD_BUFLEN);
>                 return 1;
>         case CTRL_N:
>                 if (cmdptr != cmd_head)
>                         cmdptr = (cmdptr+1) % KDB_CMD_HISTORY_COUNT;
> -               strncpy(cmd_cur, cmd_hist[cmdptr], CMD_BUFLEN);
> +               strscpy(cmd_cur, cmd_hist[cmdptr], CMD_BUFLEN);
>                 return 1;
>         }
>         return 0;
> @@ -1314,7 +1314,7 @@ static int kdb_local(kdb_reason_t reason, int error, struct pt_regs *regs,
>                 if (*cmdbuf != '\n') {
>                         if (*cmdbuf < 32) {
>                                 if (cmdptr == cmd_head) {
> -                                       strncpy(cmd_hist[cmd_head], cmd_cur,
> +                                       strscpy(cmd_hist[cmd_head], cmd_cur,
>                                                 CMD_BUFLEN);
>                                         *(cmd_hist[cmd_head] +
>                                           strlen(cmd_hist[cmd_head])-1) = '\0';

At first I thought the line after the strscpy() could now be removed,
but then I realized that it was stripping yet one character back.
It's a bit twisted that this relies on kdb_getstr() happening to leave
the buffer in a specific way (zero-terminated and with one extra
character at the end) when kdb_getstr() returns it's special control
characters, but not part of your change.  I guess maybe a future
cleanup could try to make this saner...

One thing that could be done to at least make it slightly cleaner
(aside from adding a comment) would be to take advantage of the return
value of strscpy() to avoid the strlen().


As with all things kgdb, there are plenty of things to fix but your
change moves us in the right direction.  Thus:

Reviewed-by: Douglas Anderson <dianders@chromium.org>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
