Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2C420CF28
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 29 Jun 2020 16:28:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jpulS-0006Oz-Rv
	for lists+kgdb-bugreport@lfdr.de; Mon, 29 Jun 2020 14:28:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1jpulS-0006Os-6e
 for kgdb-bugreport@lists.sourceforge.net; Mon, 29 Jun 2020 14:28:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WpCx9wlLkUF/9BjY/GSmmZuh83h0/gYp6cSgw55h1ks=; b=iii/VRrQx/CR6lqgo7jyoRz/ul
 c2r7FJFpF+xnYuVIkAGVhvyHl/mUMOFT+z+hDi22R+tbf/9yBLIvtkvyc2Wbs4hq26114BEGcwsmk
 7hkjJQBe0UMVMD6Gw63PMin7THhxSwNDjbbvETrpAIJUnGLb/9Kz2p3wNglfpYYulo4I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WpCx9wlLkUF/9BjY/GSmmZuh83h0/gYp6cSgw55h1ks=; b=dBMMeoFs1bxouGb11xU5pWp06n
 673HWr3z6m08QjlNCrqtsd0yC3UKZ0pfuhU893AKAtnRbUW1eEIxMWGWgEOgtpGkd6f6pWWhOxKVt
 O0mhgnz77dTD3Bt07FKZX9p3FYsBHgN0bSLy+aiEzu7m1kjWR2ncuu0PbxjcOGg0aLh0=;
Received: from mail-wm1-f68.google.com ([209.85.128.68])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jpulM-002834-8P
 for kgdb-bugreport@lists.sourceforge.net; Mon, 29 Jun 2020 14:28:06 +0000
Received: by mail-wm1-f68.google.com with SMTP id f139so16311355wmf.5
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 29 Jun 2020 07:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=WpCx9wlLkUF/9BjY/GSmmZuh83h0/gYp6cSgw55h1ks=;
 b=vuFaCFQbsN0wObGUMWiRJxLtNYxJ0D4oGlZnGvvMS0hv+E+raFBtm15LJ31LILkXy8
 a92fLI0UQlsQkt5DtNXbLVLyO8W1EUTtEDN3zSefvXsRg8oUmsgXBCuy2JBewo5H31di
 xD3EU6HAoKSFEGtuPl3//qrQ4phTVgfQXt9y286djiTzt09Tk0yIEd11VGWCteZyW/Tr
 FjGeED+4Dw345WikbF+FoL+I7OYl9QMOnNPt1Gp4i0iI1pkB1Y55Uus5Ieyn5o+oJsin
 ExEHQS/Sn/FoPcBVfy9XwDns7Wana0wsi5uyJ3gAvhqnvjBXDIVL7fD2IuOvEoSV4K/w
 bMgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WpCx9wlLkUF/9BjY/GSmmZuh83h0/gYp6cSgw55h1ks=;
 b=QEnyLBd/J5WJMiQXGHqeuUb2acRkxRTOC0O9L6UCLmdhJhlsAii9ym3N458vnkOqXs
 /KL4bO/IFBaAtDdygT3+l7vfSb42tk4lxjAOkgbnTlvXD+KG9fQ/ozznGLORQ6hS2Rtg
 uQWcul19PMnEnRmqwMe7HxUHZBW5utdGp8AzboylD8Ik4KQyrstIJvtZC4yii4klNRra
 Qt8sLPDSKrpoVij7LmUACfZj20F+EoIkeNWaAOlAfOi5/FsI/aULpxwAgfXAT6HPZacU
 MIC4x5EKze13CMu7ZcSFrko/aETPKdlV4vE8Y2cXR4xCldIASc52KD5E+b5IyWnBvxDd
 z3eg==
X-Gm-Message-State: AOAM533J+5Vh+lbdWXZstVwdaTamNflI/pP24bYGgSjipP8Yef2/d1Pc
 /UOdPvFXI48G9LGL+uoddO1V0g==
X-Google-Smtp-Source: ABdhPJxtFivGPYcWB67LI7zAbVSDQ6qLN1rJhZmqOsqNq4J+C2829AxMq50IR49aEIqObEXJ7j/hNg==
X-Received: by 2002:a7b:c92e:: with SMTP id h14mr16380764wml.36.1593440873894; 
 Mon, 29 Jun 2020 07:27:53 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id r1sm39557232wrt.73.2020.06.29.07.27.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 07:27:53 -0700 (PDT)
Date: Mon, 29 Jun 2020 15:27:51 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Cengiz Can <cengiz@kernel.wtf>
Message-ID: <20200629142751.qsljmbbj5neoanpc@holly.lan>
References: <20200629135923.14912-1-cengiz@kernel.wtf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200629135923.14912-1-cengiz@kernel.wtf>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.68 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.68 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jpulM-002834-8P
Subject: Re: [Kgdb-bugreport] [PATCH] kdb: prevent possible null deref in
 kdb_msg_write
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
Cc: Petr Mladek <pmladek@suse.com>, kgdb-bugreport@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, Jason Wessel <jason.wessel@windriver.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Mon, Jun 29, 2020 at 04:59:24PM +0300, Cengiz Can wrote:
> `kdb_msg_write` operates on a global `struct kgdb_io *` called
> `dbg_io_ops`.
> 
> Although it is initialized in `debug_core.c`, there's a null check in
> `kdb_msg_write` which implies that it can be null whenever we dereference
> it in this function call.
> 
> Coverity scanner caught this as CID 1465042.
> 
> I have modified the function to bail out if `dbg_io_ops` is not properly
> initialized.

That can't possibly be the right fix!

If dbg_io_ops were NULL in this part of the code then the system
is seriously broken and we would need to panic()... but since we
know that is isn't NULL (as you said, we already checked it before
we entered kdb) then we can just remove the check.


Daniel.

> 
> Signed-off-by: Cengiz Can <cengiz@kernel.wtf>
> ---
>  kernel/debug/kdb/kdb_io.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
> index 683a799618ad..85e579812458 100644
> --- a/kernel/debug/kdb/kdb_io.c
> +++ b/kernel/debug/kdb/kdb_io.c
> @@ -549,14 +549,15 @@ static void kdb_msg_write(const char *msg, int msg_len)
>  	if (msg_len == 0)
>  		return;
>  
> -	if (dbg_io_ops) {
> -		const char *cp = msg;
> -		int len = msg_len;
> +	if (!dbg_io_ops)
> +		return;
>  
> -		while (len--) {
> -			dbg_io_ops->write_char(*cp);
> -			cp++;
> -		}
> +	const char *cp = msg;
> +	int len = msg_len;
> +
> +	while (len--) {
> +		dbg_io_ops->write_char(*cp);
> +		cp++;
>  	}
>  
>  	for_each_console(c) {
> -- 
> 2.27.0
> 


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
