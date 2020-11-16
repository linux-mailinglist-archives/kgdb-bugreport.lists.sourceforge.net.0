Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E70532B4028
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 16 Nov 2020 10:48:03 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1keb7C-0002eK-MP
	for lists+kgdb-bugreport@lfdr.de; Mon, 16 Nov 2020 09:48:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1keb7A-0002d2-NL
 for kgdb-bugreport@lists.sourceforge.net; Mon, 16 Nov 2020 09:48:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+si8LH3jhi9EyKVGhLQbwPSv91L15i1+9Oq4Ed8hni4=; b=b0+V0xkdHAvcGvkXCMLbWo2K/2
 ZxHbtWVAIWykWb8KxipFETan8IbQysw86F5BenmLzV1zd+j2Ke0wuqpZEME4lHbL72/l+YELs2Dz5
 7NoNKlatpihm2GlvMDywKaunnr2U/ZvRO+NdJmjtg9z74hQPUGsBgnBrDcvOX8K1rgdE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+si8LH3jhi9EyKVGhLQbwPSv91L15i1+9Oq4Ed8hni4=; b=WskXX3xsjLHO4khcIzH1YMfsIn
 YHWfAije//66fOvANn9A02NeMTKf8dObN3jxZzIQMBt0DxaSELu1Jk07z64HH2F1O/N0P4LlnK7ud
 Q0EXGYNrHu9x7uHSjZYnofTHzL1b6cK8ZbaRGLRisIn93gjJDApKohijXtvGwkU4cIH4=;
Received: from mail-wr1-f68.google.com ([209.85.221.68])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1keb6v-006Ndp-8e
 for kgdb-bugreport@lists.sourceforge.net; Mon, 16 Nov 2020 09:47:59 +0000
Received: by mail-wr1-f68.google.com with SMTP id p1so17903793wrf.12
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 16 Nov 2020 01:47:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=+si8LH3jhi9EyKVGhLQbwPSv91L15i1+9Oq4Ed8hni4=;
 b=nqdN4uRj5voyOinQdTs1MOSCoiyOPfj8u3NnVEqnwsh89YfCT6AgozfIcjPTqpXfGM
 lBTAsB/8ReuT9cWudKtSXV6Xx6Cu1e9GXcTbBqR1IybviVR9utneYkZK07dnnd2r5fmU
 VjSpPGF3TP6yCGp1bFPcfJeEDazghUqDzEIAeHTMCz4+wDsWLtkUfvGl5yxM2LA4vTkT
 oTCM+tvMjLtGCGwZyEuxP91A5mCccTGGiYO8m6VdU2c7bhQeHi4RE0iuqY0NjzK1QlC9
 wpFZrvXQ9YK0dwFMJzJMKD4kZ42TTfZJ+4hxMdW5ja9gPk9S//eN2Zpx0npfMgnQLBI1
 FCMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+si8LH3jhi9EyKVGhLQbwPSv91L15i1+9Oq4Ed8hni4=;
 b=rPP0d1n2PmpPpk2qM3RNEj4AQTGo1aOol8bXJWSGryZfcJSMgQNoJldPnBYbzXmiFJ
 nL0jQhNV3VS8hY+Sb3OaUlCZXy8Srf1jcPwv4d5NheV240E78wdG1tS/3POa1yKgRLZR
 +9MNLvG6IYUNqHfn4Xu8RQtfEjArSF/GHCWDDejVdzWoGxW/K0MESjARopja3XBAP+OJ
 uaB3jD/qC8flCDIPTOaRP9xskn+XWIfcTH+1sLHoh0NXO9y73jGXX7CKHeUmnft1j7Np
 BJU+sLm6yUbgFJB4VCG3dFu5ouvsRFgpFDvdDRaOUZx8P7vZ0FbeqpOpKivHVc+L7nPF
 1GBw==
X-Gm-Message-State: AOAM531VGXtlc3ZWwMmKsfIuCkBC/QdvOmLh6fwvSU2TqOT8ZMJYrZ5F
 ulitGW93uM5d368hUwHY2DGPG3Z6EKXItg==
X-Google-Smtp-Source: ABdhPJxTb/57HfJkOZ7cB/V/z4dTk0Fhk5LOW+nej7IimYiur/RP+toGkLtmhrPKf82iiC+Ou9db0w==
X-Received: by 2002:a05:6000:1088:: with SMTP id
 y8mr19995697wrw.207.1605520058932; 
 Mon, 16 Nov 2020 01:47:38 -0800 (PST)
Received: from holly.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id m21sm29402766wmi.3.2020.11.16.01.47.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 01:47:38 -0800 (PST)
Date: Mon, 16 Nov 2020 09:47:36 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <20201116094736.hmqnyl3xezeupzyb@holly.lan>
References: <1605519767-25502-1-git-send-email-yangtiezhu@loongson.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1605519767-25502-1-git-send-email-yangtiezhu@loongson.cn>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.68 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.68 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1keb6v-006Ndp-8e
Subject: Re: [Kgdb-bugreport] [PATCH] Documentation: kgdb: Fix a typo
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
Cc: Jonathan Corbet <corbet@lwn.net>, kgdb-bugreport@lists.sourceforge.net,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Sergei Shtylyov <sergei.shtylyov@gmail.com>,
 Jason Wessel <jason.wessel@windriver.com>, Xuefeng Li <lixuefeng@loongson.cn>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Mon, Nov 16, 2020 at 05:42:47PM +0800, Tiezhu Yang wrote:
> "to into" -> "into"
> 
> Reported-by: Sergei Shtylyov <sergei.shtylyov@gmail.com>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>

Acked-by: Daniel Thompson <daniel.thompson@linaro.org>


> ---
>  Documentation/dev-tools/kgdb.rst | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/dev-tools/kgdb.rst b/Documentation/dev-tools/kgdb.rst
> index 77b688e..4345624 100644
> --- a/Documentation/dev-tools/kgdb.rst
> +++ b/Documentation/dev-tools/kgdb.rst
> @@ -63,10 +63,9 @@ will want to turn on ``CONFIG_DEBUG_INFO`` which is called
>  It is advised, but not required, that you turn on the
>  ``CONFIG_FRAME_POINTER`` kernel option which is called :menuselection:`Compile
>  the kernel with frame pointers` in the config menu. This option inserts code
> -to into the compiled executable which saves the frame information in
> -registers or on the stack at different points which allows a debugger
> -such as gdb to more accurately construct stack back traces while
> -debugging the kernel.
> +into the compiled executable which saves the frame information in registers
> +or on the stack at different points which allows a debugger such as gdb to
> +more accurately construct stack back traces while debugging the kernel.
>  
>  If the architecture that you are using supports the kernel option
>  ``CONFIG_STRICT_KERNEL_RWX``, you should consider turning it off. This
> -- 
> 2.1.0
> 


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
