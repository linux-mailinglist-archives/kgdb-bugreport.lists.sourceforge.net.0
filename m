Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0720120DD14
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 29 Jun 2020 23:17:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jq19A-0006iw-QV
	for lists+kgdb-bugreport@lfdr.de; Mon, 29 Jun 2020 21:17:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1jq19A-0006io-33
 for kgdb-bugreport@lists.sourceforge.net; Mon, 29 Jun 2020 21:17:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Glv9KPcU1i2kTi/iXapQFW9l12MhBnrThVYjifxz8EM=; b=bVelLo8x4PrS93YTEWHc3NPapC
 rY+eYKujK+9/xtnGAjSRsjs39hVs5xBa5y7fmKWfi8UFbzPtBh4WYI5uSz97hEb/Gu+0m65ye2NvS
 vBsU044NzbVBqclRTZdvJfDCMRtIbM55RINKqOMWZ8k3aOpMd7RUmGuTibRuIzujIGCY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Glv9KPcU1i2kTi/iXapQFW9l12MhBnrThVYjifxz8EM=; b=iy9K/26K0n6i2W1w4CFFY6/lcu
 qfOvwqXI4SP52serlM8iSvVbZVjgeum80suYpl703qYAgbORRElBK92JkK5vtWSiJf5vZjdtPXmt7
 uPPrAAeKBvMm01DKRxpV2xJDVulQVryd3fIpN3ofus7aFDCr3Q2HCRnIt0HwVG32zyMk=;
Received: from mail-vs1-f68.google.com ([209.85.217.68])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jq198-005OXb-Qv
 for kgdb-bugreport@lists.sourceforge.net; Mon, 29 Jun 2020 21:17:00 +0000
Received: by mail-vs1-f68.google.com with SMTP id v1so10030279vsb.10
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 29 Jun 2020 14:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Glv9KPcU1i2kTi/iXapQFW9l12MhBnrThVYjifxz8EM=;
 b=iQSpfw6Tm/KPuTk+bUTfK5sUy4UnMTGDe2HrdR0LJ5iy/NBxQZbLKaAMr5P8IsFaKS
 jlx65KlHQsr6onY+QHMDKYDN0o/+INkFidVgT0E/5uY2DgBuPiWIVZPfHlo/wnPJUZ6E
 9jTXUZ6lxK0iNtd4wO6o08CCwbn+1DdmLYhvg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Glv9KPcU1i2kTi/iXapQFW9l12MhBnrThVYjifxz8EM=;
 b=FpTalrPZXeztvSVUiWky0SrIXRNlSFuG/Upo4B8sLqq5e+PEkCVuvgCYyK7V2pLUj1
 BfATYnxhD0SHwP9pJyUiUWtLU+tKw5HyqFPQ1FWRhvybfmQymvgkfDIxzEksE3gYUGOH
 QvRmnp3taQ3U/pJ38FWeQGByIQ8Qu28YZQvg+JS6cLGn89dA7sBwfwz0/xC784IpD1dg
 R729I6aUB1Y8f7niTNOFEeB2kgDcvpoDg5xX2k/7ewIbeKI0TcYHFXymJWWWeJda8/K0
 wdZq58dWTs7EgS/o6wziMG1N7fXTw/TD+zOLsyITJnl0X2cCLlRLQkdWdMYf2pKq/udv
 QRpw==
X-Gm-Message-State: AOAM532oReJnqRH1mf6S9txBbJOmhea5CFJp8GJkzgdX8DIEhY8cji04
 lRe3Ppb+u+v2gjMFGZ1sOCvwCpmpoDk=
X-Google-Smtp-Source: ABdhPJxBiWoYeydvcm01kyEBIuwllyaUdeyEJkFcWgmKoayDCG7bRTAD5GROCCK943li4CS1/HY5Jg==
X-Received: by 2002:a05:6102:14d:: with SMTP id
 a13mr12592284vsr.142.1593465412644; 
 Mon, 29 Jun 2020 14:16:52 -0700 (PDT)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com.
 [209.85.222.50])
 by smtp.gmail.com with ESMTPSA id n70sm143315vkn.49.2020.06.29.14.16.51
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jun 2020 14:16:51 -0700 (PDT)
Received: by mail-ua1-f50.google.com with SMTP id g14so5794006ual.11
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 29 Jun 2020 14:16:51 -0700 (PDT)
X-Received: by 2002:ab0:29c1:: with SMTP id i1mr12275723uaq.120.1593465411383; 
 Mon, 29 Jun 2020 14:16:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200629153756.cxg74nec3repa4lu@holly.lan>
 <20200629205012.3263-1-cengiz@kernel.wtf>
In-Reply-To: <20200629205012.3263-1-cengiz@kernel.wtf>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 29 Jun 2020 14:16:39 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XWYKqHEMDt-0PYHty_syJ9MO6Oz8DVBbacNZS5zGXk9A@mail.gmail.com>
Message-ID: <CAD=FV=XWYKqHEMDt-0PYHty_syJ9MO6Oz8DVBbacNZS5zGXk9A@mail.gmail.com>
To: Cengiz Can <cengiz@kernel.wtf>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.217.68 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.217.68 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1jq198-005OXb-Qv
Subject: Re: [Kgdb-bugreport] [PATCH v2] kdb: remove unnecessary null check
 of dbg_io_ops
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
 kgdb-bugreport@lists.sourceforge.net, LKML <linux-kernel@vger.kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Mon, Jun 29, 2020 at 1:50 PM Cengiz Can <cengiz@kernel.wtf> wrote:
>
> `kdb_msg_write` operates on a global `struct kgdb_io *` called
> `dbg_io_ops`.
>
> It's initialized in `debug_core.c` and checked throughout the debug
> flow.
>
> There's a null check in `kdb_msg_write` which triggers static analyzers
> and gives the (almost entirely wrong) impression that it can be null.
>
> Coverity scanner caught this as CID 1465042.
>
> I have removed the unnecessary null check and eliminated false-positive
> forward null dereference warning.
>
> Signed-off-by: Cengiz Can <cengiz@kernel.wtf>
> ---
>  kernel/debug/kdb/kdb_io.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
>
> diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
> index 683a799618ad..4ac59a4fbeec 100644
> --- a/kernel/debug/kdb/kdb_io.c
> +++ b/kernel/debug/kdb/kdb_io.c
> @@ -549,14 +549,12 @@ static void kdb_msg_write(const char *msg, int msg_len)
>         if (msg_len == 0)
>                 return;
>
> -       if (dbg_io_ops) {
> -               const char *cp = msg;
> -               int len = msg_len;
> +       const char *cp = msg;
> +       int len = msg_len;

kernel/debug/kdb/kdb_io.c:552:14:
warning: ISO C90 forbids mixing declarations and code
[-Wdeclaration-after-statement]

-Doug


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
