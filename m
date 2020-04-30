Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D52B91C0304
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 30 Apr 2020 18:47:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jUCLm-0006Ts-MQ
	for lists+kgdb-bugreport@lfdr.de; Thu, 30 Apr 2020 16:47:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1jUCLl-0006Tl-57
 for kgdb-bugreport@lists.sourceforge.net; Thu, 30 Apr 2020 16:47:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hBtVi/B4LPd4rRf9CEmZJjnlyoXbvXsuWtCUKyK+qR8=; b=RRxxNBp083MrvcfKwF5ZJSmVgY
 NbTQZGYGUiiXEIka5lL8m9t2tVZg/MrmV9Ohebmq4WYOoJnEi+c9qarn3NwFcbET5/uL1IjlQySMS
 5zzxA68qvdjS4T8d8Kh4gFGQTLaVunMmtZGBdwJXRyCDk/y1Q4RlZMx0JpEEtMufDpuw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hBtVi/B4LPd4rRf9CEmZJjnlyoXbvXsuWtCUKyK+qR8=; b=AzmAQYoatPyYmTOKXXipcyhhfV
 gtQNHpPQTDXB146+YjMZzmhyuJHq1hPkOxJXzTRNaOuUC/HYTWJl+gdjPe10C5sn8Vz6nWSCQbTxk
 L0yrJkQ6xJ5gw1FY2KLB/isvXgvFJhOSXY8KZsYPUNeNSweTGB+jBukcRXyjg4gI+4cw=;
Received: from mail-io1-f66.google.com ([209.85.166.66])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jUCLj-003WTO-Nu
 for kgdb-bugreport@lists.sourceforge.net; Thu, 30 Apr 2020 16:47:49 +0000
Received: by mail-io1-f66.google.com with SMTP id k6so2194349iob.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 30 Apr 2020 09:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hBtVi/B4LPd4rRf9CEmZJjnlyoXbvXsuWtCUKyK+qR8=;
 b=DR4GRE1TTJdVdqqNkzD9HvSJO3aKd8slDhb6oW+zf4W3fg6ciNocMNd0uAmOp9/LgQ
 cdAfiNZUtnc15ebRDnToxFcEed9hDv0mdi28ZFPnEVxiEfo+BQszuWQgZRn65MiJoAyJ
 jn97XH/UG5N4WBMhhQ3jQLMtEX4MQqOPntizs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hBtVi/B4LPd4rRf9CEmZJjnlyoXbvXsuWtCUKyK+qR8=;
 b=NPVaVkx/ctpK/2xFMJ1RQ5CeCFpaFrykZgOkyBYxepagrg5Sx1sOKWvT8Lq7CjTeXi
 1S/6Jxa3zkgHdO+1/gY9egdu8agg1r/zod01w3KkBrcXS03VF0PBqZVvJIPnTwGDOdWd
 bDJiLF52Vt6l4hzYJOPQHmL5VrvcEN8tetRzYbIg94x6NqeMRmrqwUOfKoM5Ho130OGC
 l9eiuH9emGf7xw+kK6UzBPAV/TVhnzTI7TjTp/f3mljaukLL8G+JeiYyZk6y8w975n64
 1sTe3lSg3FmmF7C15AJRMSJEYGtCvuLNuqk63pt/eVu5TfWh+D2zCGP6EGIipw8j/4gQ
 UULA==
X-Gm-Message-State: AGi0PuZ16tl+K4v8FUVWgkp4E2au71V97+qdJDFYdgOlIiPuXtKZMcOZ
 cBl4ttkBmTosoatomtoi4lj/V0d0eEo=
X-Google-Smtp-Source: APiQypK2htxEFdtdr1e+4RQaWRSdhdwBg4KTN+cWNiizN7J6S9AbcXkK2DkZFgT5gSUVmFwaPjxxHA==
X-Received: by 2002:a6b:c910:: with SMTP id z16mr2773824iof.164.1588265261203; 
 Thu, 30 Apr 2020 09:47:41 -0700 (PDT)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com.
 [209.85.166.47])
 by smtp.gmail.com with ESMTPSA id z86sm115821ilk.79.2020.04.30.09.47.40
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Apr 2020 09:47:41 -0700 (PDT)
Received: by mail-io1-f47.google.com with SMTP id c2so2187676iow.7
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 30 Apr 2020 09:47:40 -0700 (PDT)
X-Received: by 2002:a5d:87cd:: with SMTP id q13mr2758350ios.61.1588265259570; 
 Thu, 30 Apr 2020 09:47:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200429170804.880720-1-daniel.thompson@linaro.org>
 <20200430161741.1832050-1-daniel.thompson@linaro.org>
In-Reply-To: <20200430161741.1832050-1-daniel.thompson@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 30 Apr 2020 09:47:27 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U64XLRFkTyTi1qDZjTYQKJ9WVBf3OoULpw6yncOQURTg@mail.gmail.com>
Message-ID: <CAD=FV=U64XLRFkTyTi1qDZjTYQKJ9WVBf3OoULpw6yncOQURTg@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.166.66 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.66 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jUCLj-003WTO-Nu
Subject: Re: [Kgdb-bugreport] [PATCH v2] serial: kgdboc: Allow earlycon
 initialization to be deferred
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
Cc: Patch Tracking <patches@linaro.org>, kgdb-bugreport@lists.sourceforge.net,
 LKML <linux-kernel@vger.kernel.org>, linux-serial@vger.kernel.org,
 Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Thu, Apr 30, 2020 at 9:18 AM Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> Currently there is no guarantee that an earlycon will be initialized
> before kgdboc tries to adopt it. Almost the opposite: on systems
> with ACPI then if earlycon has no arguments then it is guaranteed that
> earlycon will not be initialized.
>
> This patch mitigates the problem by giving kgdboc_earlycon a second
> chance during console_init(). This isn't quite as good as stopping during
> early parameter parsing but it is still early in the kernel boot.
>
> Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
> ---
>
> Notes:
>     v2: Simplified, more robust, runs earlier, still has Doug's
>         recent patchset as a prerequisite. What's not to like?
>
>     More specifically, based on feedback from Doug Anderson, I
>     have replaced the initial hacky implementation with a console
>     initcall.
>
>     I also made it defer more aggressively after realizing that both
>     earlycon and kgdboc_earlycon are handled as early parameters
>     (meaning I think the current approach relies on the ordering
>     of drivers/tty/serial/Makefile to ensure the earlycon is enabled
>     before kgdboc tries to adopt it).
>
>     Finally, my apologies to Jason and kgdb ML folks, who are seeing
>     this patch for the first time. I copied the original circulation
>     list from a patch that wasn't kgdb related and forgot to update.
>
>  drivers/tty/serial/kgdboc.c | 41 +++++++++++++++++++++++++++++++++++--
>  1 file changed, 39 insertions(+), 2 deletions(-)

Thanks, this looks great!

Reviewed-by: Douglas Anderson <dianders@chromium.org>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
