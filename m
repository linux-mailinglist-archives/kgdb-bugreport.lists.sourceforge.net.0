Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E35397A9C
	for <lists+kgdb-bugreport@lfdr.de>; Tue,  1 Jun 2021 21:20:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1lo9wP-0001II-LU
	for lists+kgdb-bugreport@lfdr.de; Tue, 01 Jun 2021 19:20:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <keescook@chromium.org>) id 1lo9wO-0001I3-91
 for kgdb-bugreport@lists.sourceforge.net; Tue, 01 Jun 2021 19:20:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wNSZ6PEDj3I1kXtwa13X25gdAklt5nxT1YtwBzGa2YQ=; b=H3eCIysmzulyi1vdM/QBz34Djq
 AOEzTjlZF9lhsSwUiyybCK58YwIsXBELsgMf6cX87e53s3G+tu4R+IOUCwpbwiMRTgwi5Oxht2AeY
 niTvxFI0CuP1uhuyUqNjOb0nvsAhC6vtAROCPejgdEgUjqTF2mgxjF0F6bakZhEGciFU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wNSZ6PEDj3I1kXtwa13X25gdAklt5nxT1YtwBzGa2YQ=; b=jgdIjLLXSKPlarNI5+O0YaYI0C
 TdsTrG1STqO29kDJ3rQAG4RYuaUTTHuJUKHZHHXHRQeos9iZgkGrjJmPnGmt7jy2Fa/GD28KY4sgX
 QP5YVxEvxP4T1qVTgTbGa6FDDCRNUHE9Nel8PnDRYhAgcHCtm0MgnMjTdR9/oLskhr4A=;
Received: from mail-pf1-f182.google.com ([209.85.210.182])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1lo9wI-006CYM-NI
 for kgdb-bugreport@lists.sourceforge.net; Tue, 01 Jun 2021 19:20:41 +0000
Received: by mail-pf1-f182.google.com with SMTP id g6so296242pfq.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 01 Jun 2021 12:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=wNSZ6PEDj3I1kXtwa13X25gdAklt5nxT1YtwBzGa2YQ=;
 b=NhHRA4kT8tiQuiZykTXa40SjjGmLaMqpdUobJPj+9UB6O9VPanYx2GXGoNNW2idVtb
 tSOeuNxywX6WbCQ1hiCrgr3uDWI8i/vEtmIa5SoynKtda2lGyxsFkYlhhnQHp9VFuyVV
 phF+MPvJKH71mbm93+BxK1iJZVF3Uu19OmnwE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wNSZ6PEDj3I1kXtwa13X25gdAklt5nxT1YtwBzGa2YQ=;
 b=J9l5+mI5bAoKsKRYZGPt1UThNIQMJRRYtTKA0kHMl6x2X9A300D3CuGF4nK4tewgmB
 KxI138AjMc4OhxEczOMsI7Sq98sVZPd8QpK+vJIY7uMIePbVjkGoRE1f5/ZaInS7+4+E
 wxUirGBcSJUjE7oB6whxYp3pkcajiTQgipEQUDUREfoRKJxp6ythEFb/NdhBgT7u5wkQ
 y3Tds2yY7gPzcDD2XZmWezJGfNmNLfS+plU9Xis220bK47Qos309ZmV3Hqsr6x+2pSRZ
 FYV4hsr0Fc+c4dW7Ja1fXNFV9Ghy+R9DVbDbX69qx8JKaymg+CQlxwTz1ZaqyIWXgghG
 VaXQ==
X-Gm-Message-State: AOAM531ZHpCcUNGyzHGCFXKbJ+HIrjKq8643uCGrbsDYVG53ofu0KgV/
 4IlQ5EhbD9Mo4pf/k/7+9wYzvw==
X-Google-Smtp-Source: ABdhPJxgSwrzgiPoAYHk8fJ2FP/69zlFDckk7KeQjqUvaP9nnygyCFBz7Yg0bGTSdlJmazXgdvvoPg==
X-Received: by 2002:aa7:8f3a:0:b029:2e9:c63a:312e with SMTP id
 y26-20020aa78f3a0000b02902e9c63a312emr14024994pfr.73.1622575229181; 
 Tue, 01 Jun 2021 12:20:29 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id mi11sm2712312pjb.29.2021.06.01.12.20.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 12:20:28 -0700 (PDT)
Date: Tue, 1 Jun 2021 12:20:27 -0700
From: Kees Cook <keescook@chromium.org>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Message-ID: <202106011220.AA0C1482@keescook>
References: <20210528200222.GA39201@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210528200222.GA39201@embeddedor>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.182 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.182 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lo9wI-006CYM-NI
Subject: Re: [Kgdb-bugreport] [PATCH][next] kgdb: Fix fall-through warning
 for Clang
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
 kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org, Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Fri, May 28, 2021 at 03:02:22PM -0500, Gustavo A. R. Silva wrote:
> In preparation to enable -Wimplicit-fallthrough for Clang, fix a
> fall-through warning by explicitly adding a goto statement instead
> of letting the code fall through to the next case.
> 
> Link: https://github.com/KSPP/linux/issues/115
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> ---
> JFYI: We had thousands of these sorts of warnings and now we are down
>       to just 25 in linux-next. This is one of those last remaining
>       warnings.

So close! :)

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

> 
>  kernel/debug/debug_core.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
> index 4708aec492df..431749dd9ab6 100644
> --- a/kernel/debug/debug_core.c
> +++ b/kernel/debug/debug_core.c
> @@ -1038,6 +1038,7 @@ dbg_notify_reboot(struct notifier_block *this, unsigned long code, void *x)
>  	switch (kgdbreboot) {
>  	case 1:
>  		kgdb_breakpoint();
> +		goto done;
>  	case -1:
>  		goto done;
>  	}
> -- 
> 2.27.0
> 

-- 
Kees Cook


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
