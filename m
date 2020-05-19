Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E666E1D9570
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 19 May 2020 13:40:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jb0bl-0007gi-Ng
	for lists+kgdb-bugreport@lfdr.de; Tue, 19 May 2020 11:40:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1jb0bk-0007ga-8l
 for kgdb-bugreport@lists.sourceforge.net; Tue, 19 May 2020 11:40:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cTKYH+mp/bhcR85XQxkJ8OwwsY1zKVWgOX9zGZznoL0=; b=ACJORwRXeqMzxi6mCDKs9Jr/7u
 iP+FHNNrspOCGMW/9d1MLNDo2piCMaC4HLT9lnBAheY1+J31849/0T+roM0armrf3lnqxKMGua5/p
 8yvCj2cRceHkiCaqQi4k13iY/UBSqbR87rz16A+wkVBg25yXoB/el+fiaLsmA/elV5Dg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cTKYH+mp/bhcR85XQxkJ8OwwsY1zKVWgOX9zGZznoL0=; b=Us2faIHeynGTxRGK5hoNx8dQ2z
 h+w7drXXMczfe3km+/37LpEqEB2rcUZH+lYCuX22MPzqw2UAHNcOWM7m5os1xZQLYRx4E8PTTypm3
 L8YyKP35vYxGoW/VUW2UJdaHiYei+7lgZvaHw1jcTYQTHLkZoKw7m4feUUCHzmcbikuo=;
Received: from mail-wm1-f66.google.com ([209.85.128.66])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jb0bg-00FCQJ-DK
 for kgdb-bugreport@lists.sourceforge.net; Tue, 19 May 2020 11:40:28 +0000
Received: by mail-wm1-f66.google.com with SMTP id n18so3134953wmj.5
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 19 May 2020 04:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=cTKYH+mp/bhcR85XQxkJ8OwwsY1zKVWgOX9zGZznoL0=;
 b=MZHUB2ZXTdwLAmgOpCVyQjfyasKoo+pyNdYM9+FPR+5DIBal6yroxOGSNKZH6XWnWH
 c6Ms4Byxq3yTfxeqNJ3eAG0k0EraIU/71QMv0I60UuvNYIhmMGIwOlie06z/m2jAkp1s
 E0zXBbjFMSmJeKWFWdTYTRkL+NYJVwBQnfV0j+tSmNee3UxX65pAQ1T7BXERUCAo31or
 povr55CG1IJBMb+wfWoNt1VgsdfOJSGB18eLoEl98yykvN46WfwqX9PLEDyXc1TdcyUk
 Gt/jX2G23Vkir+HGDDstNmbBBBRVoRvTzclBwBacRPYxdobkL4RY5CQCSftE9g/R9/Fq
 vtfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=cTKYH+mp/bhcR85XQxkJ8OwwsY1zKVWgOX9zGZznoL0=;
 b=rA0ZY0hq5jBGE7K6G01gZRKUE4LO8y3t+Cpr7sSiwvOLCfwZ3bEj9OKyfOzKpHssEc
 sL8/sSEcFu81kaMGdRUKKgYGm/4mAUqEH9mC93cKIqcRQiRatHIMai7/I5FxGkhwAPJw
 JXY6TBFpmXqkAxjozK1aypdfOCiwi1qfHJ0KK6xoCGbJSpsXF5SPRaCw0V7KHISo4k4r
 paXcjiAz4yKFdxYJCPmkqiVcqarJQdGHd4Z/fR6wnsv4lQ8UVE6RH719QRxcdJz+87u0
 nacfROgD/3nF29yyKF4/Y+5BVBZ8+/lxGyJ4QwqmUIovumiqh5+cNkWTbX4wHZrJYekZ
 v1kQ==
X-Gm-Message-State: AOAM53160WxTad3lQS4Q6OPK352XebrpnaDVd0qVjnVo/syLtPJbtaHh
 DpDCNOWd//EP9PTM0gU+Qtyh2w==
X-Google-Smtp-Source: ABdhPJxkzXzSGi0I3tTgZ6x7A+f5Zr0659258Yl+tQWXZmWMobtDKKKEHVlFcps7BOvzvTpauYfFuA==
X-Received: by 2002:a7b:c939:: with SMTP id h25mr5036964wml.9.1589888410760;
 Tue, 19 May 2020 04:40:10 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id 89sm21569339wrj.37.2020.05.19.04.40.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 May 2020 04:40:10 -0700 (PDT)
Date: Tue, 19 May 2020 12:40:08 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Wei Li <liwei391@huawei.com>
Message-ID: <20200519114008.lmdf44zmgcmnf27c@holly.lan>
References: <20200516092606.41576-1-liwei391@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200516092606.41576-1-liwei391@huawei.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.66 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.66 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jb0bg-00FCQJ-DK
Subject: Re: [Kgdb-bugreport] [PATCH v2] kdb: Make the internal env
 'KDBFLAGS' undefinable
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
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 LKML <linux-kernel@vger.kernel.org>, Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Sat, May 16, 2020 at 05:26:06PM +0800, Wei Li wrote:
> 'KDBFLAGS' is an internal variable of kdb, it is combined by 'KDBDEBUG'
> and state flags. But the user can define an environment variable named
> 'KDBFLAGS' too, so let's make it undefinable to avoid confusion.
> 
> Signed-off-by: Wei Li <liwei391@huawei.com>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

I took a quick look at this and find myself thinking of KDBFLAGS as
something of a misfeature.

I think I'd rather get kdb_env to show the value we wrote into
KDBDEBUG.

Sure this means we cannot use KDBDEBUG to look at the least significant
16-bits but I think anyone who is debugging kdb itself should know
enough to use `md4c1 kdb_flags` to read those anyway.


Daniel.



> ---
> v1 -> v2:
>  - Fix lack of braces.
> 
>  kernel/debug/kdb/kdb_main.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
> index 4fc43fb17127..75b798340300 100644
> --- a/kernel/debug/kdb/kdb_main.c
> +++ b/kernel/debug/kdb/kdb_main.c
> @@ -423,6 +423,8 @@ int kdb_set(int argc, const char **argv)
>  			| (debugflags << KDB_DEBUG_FLAG_SHIFT);
>  
>  		return 0;
> +	} else if (strcmp(argv[1], "KDBFLAGS") == 0) {
> +		return KDB_NOPERM;
>  	}
>  
>  	/*
> -- 
> 2.17.1
> 


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
