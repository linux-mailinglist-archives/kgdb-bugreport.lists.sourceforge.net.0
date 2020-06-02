Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC041EC45D
	for <lists+kgdb-bugreport@lfdr.de>; Tue,  2 Jun 2020 23:32:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jgEWf-0002Vi-3V
	for lists+kgdb-bugreport@lfdr.de; Tue, 02 Jun 2020 21:32:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1jgEWd-0002VN-6E
 for kgdb-bugreport@lists.sourceforge.net; Tue, 02 Jun 2020 21:32:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DpqJtgJSFRDp8mokBqnXanuthBlrx2rMpY1VZAOmix8=; b=P3FZ/9eAB86GOinhnpyjF0ReSx
 e2edq7gvzfjkNeXmBQ7r62zV8O2C795izigl4TM9xvxGVW6gRDushD8HIvGqM/jDNi7TqKa7Zwuvv
 /Xq3hVJtr1ua2PWP8zPriTQXE8dczTQxnRoqW458T5KhupW2zI04+k/U4V2c4Cu3W7Cw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DpqJtgJSFRDp8mokBqnXanuthBlrx2rMpY1VZAOmix8=; b=NTQyqtso9IUL1mtROPD0xkqHWq
 UY0maSrSG3Ndiv5VRFdpapn8WO+MYfloK07Ym2qdlGm4yug2mZlRGe25ihubYgw6tSZEXYhiUI7C1
 G58/BxPFU05+pU1N6Bta32pC2jPTZd7rbWxb5YJP9etBRFgKmnVk8p5n3y/XfQ3uTsTg=;
Received: from mail-ua1-f66.google.com ([209.85.222.66])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jgEWb-0037V4-KR
 for kgdb-bugreport@lists.sourceforge.net; Tue, 02 Jun 2020 21:32:46 +0000
Received: by mail-ua1-f66.google.com with SMTP id w20so130080uaa.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 02 Jun 2020 14:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DpqJtgJSFRDp8mokBqnXanuthBlrx2rMpY1VZAOmix8=;
 b=MSLGlXbyKVLKRJdq44VL52EhA0CqJZM/Q/CGoU/TLgbpjhlranokA8+viVfJqdRaQ/
 Lo8STw/xH1+ahM5+c7UWguyxBS9+rWrNdDXipwRTa0lIo/5FlaRkiIpF5bxFYv9pjWlX
 AtJQMtKDD8U0fbLnYWgGkA7zLz4/v7LoZYw24=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DpqJtgJSFRDp8mokBqnXanuthBlrx2rMpY1VZAOmix8=;
 b=mHS6tgyE0Fq75kfvSUJB3PSqGUfNq1fDPRLyLlG4DJq/dWensYmMWcymJpQPdg/Iyv
 23UiDFUDej8j9DLLhMceXNxRY1MPDXuUxXSbo7mf/iuCuvde3fhlxKDrm3U7lFMInlIy
 /DbEKHfB+lqvTkncWcR3Jzq7EAIODRfCOxYTAjBRSXsLsTDaKFFXJV10U4K0USYRDAqz
 3VCbY4g/9b6AwD9P7GzlGgunU3oXT4J/Y0mg1Kb+nQJPsohgL4QzwJuHdVt0UdXbnQt3
 OaBRlyOrOSn15xY7h5uzQVxm8k5KfBoNPyRB83dmWQAih4TN9IxNXI8vwzsJUfqTDv+p
 7D4g==
X-Gm-Message-State: AOAM531RL/HpP3vtIbb6CHXAJlN8ayI4mDEnkdJHrMNLuEgUjqKF7Tx5
 Slae2S+CNb+ZvqzCmLTmBiWxM5kPKbE=
X-Google-Smtp-Source: ABdhPJwZJQ9LEDK28U0FKzk+CF7VWkg/Jap+xSJtB2zZ7DVXachOq/TPTpCS+bru00eOByzOBdxhFg==
X-Received: by 2002:a9f:22e1:: with SMTP id 88mr14866511uan.19.1591133559612; 
 Tue, 02 Jun 2020 14:32:39 -0700 (PDT)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com.
 [209.85.217.45])
 by smtp.gmail.com with ESMTPSA id p193sm11344vsd.0.2020.06.02.14.32.38
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jun 2020 14:32:39 -0700 (PDT)
Received: by mail-vs1-f45.google.com with SMTP id q2so170165vsr.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 02 Jun 2020 14:32:38 -0700 (PDT)
X-Received: by 2002:a67:1703:: with SMTP id 3mr20338985vsx.169.1591133558298; 
 Tue, 02 Jun 2020 14:32:38 -0700 (PDT)
MIME-Version: 1.0
References: <1590751607-29676-1-git-send-email-sumit.garg@linaro.org>
 <1590751607-29676-4-git-send-email-sumit.garg@linaro.org>
In-Reply-To: <1590751607-29676-4-git-send-email-sumit.garg@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 2 Jun 2020 14:32:27 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xx4VAUMaEvFt+mjDmsricaQXJFLrHMgbk2jMcGEGY6Fw@mail.gmail.com>
Message-ID: <CAD=FV=Xx4VAUMaEvFt+mjDmsricaQXJFLrHMgbk2jMcGEGY6Fw@mail.gmail.com>
To: Sumit Garg <sumit.garg@linaro.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.222.66 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.66 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jgEWb-0037V4-KR
Subject: Re: [Kgdb-bugreport] [PATCH v4 3/4] kdb: Make kdb_printf() console
 handling more robust
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
Cc: Petr Mladek <pmladek@suse.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 kgdb-bugreport@lists.sourceforge.net,
 Jason Wessel <jason.wessel@windriver.com>, LKML <linux-kernel@vger.kernel.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Fri, May 29, 2020 at 4:27 AM Sumit Garg <sumit.garg@linaro.org> wrote:
>
> While rounding up CPUs via NMIs, its possible that a rounded up CPU
> maybe holding a console port lock leading to kgdb master CPU stuck in
> a deadlock during invocation of console write operations. A similar
> deadlock could also be possible while using synchronous breakpoints.
>
> So in order to avoid such a deadlock, set oops_in_progress to encourage
> the console drivers to disregard their internal spin locks: in the
> current calling context the risk of deadlock is a bigger problem than
> risks due to re-entering the console driver. We operate directly on
> oops_in_progress rather than using bust_spinlocks() because the calls
> bust_spinlocks() makes on exit are not appropriate for this calling
> context.
>
> Suggested-by: Petr Mladek <pmladek@suse.com>
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> ---
>  kernel/debug/kdb/kdb_io.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
> index fad38eb..9e5a40d 100644
> --- a/kernel/debug/kdb/kdb_io.c
> +++ b/kernel/debug/kdb/kdb_io.c
> @@ -566,7 +566,18 @@ static void kdb_msg_write(char *msg, int msg_len)
>         for_each_console(c) {
>                 if (!(c->flags & CON_ENABLED))
>                         continue;
> +               /*
> +                * Set oops_in_progress to encourage the console drivers to
> +                * disregard their internal spin locks: in the current calling
> +                * context the risk of deadlock is a bigger problem than risks
> +                * due to re-entering the console driver. We operate directly on
> +                * oops_in_progress rather than using bust_spinlocks() because
> +                * the calls bust_spinlocks() makes on exit are not appropriate
> +                * for this calling context.
> +                */
> +               ++oops_in_progress;
>                 c->write(c, msg, msg_len);
> +               --oops_in_progress;

This seems sane to me, especially when combined with your next patch
that tries really hard not to run this flow.  ;-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
