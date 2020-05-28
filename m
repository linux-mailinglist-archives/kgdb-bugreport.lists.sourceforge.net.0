Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 943B91E5D99
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 28 May 2020 13:01:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jeGIC-00052X-ED
	for lists+kgdb-bugreport@lfdr.de; Thu, 28 May 2020 11:01:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1jeGIA-000525-G8
 for kgdb-bugreport@lists.sourceforge.net; Thu, 28 May 2020 11:01:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8YQeuOJDn06o9Kk2yXAQ8S1S/zWUs7/D7wgGQiHSlDo=; b=hGQsvZlB8tMDggHxqz3OxyW5IM
 ujEV0wKIqi4wFnmWU+P/CDM4nIZ59+e/ekthbztzDznVfiVwrEMC1pDD0qkVveZ59izud96EaQLJm
 KDOrXUWHxkhzhf+Ce1XhM58CgQ77dIgeAtl5Oz4Ifw07f2OhVhacR9mjROTCJyP+1HBY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8YQeuOJDn06o9Kk2yXAQ8S1S/zWUs7/D7wgGQiHSlDo=; b=Wsw4JnjOQwnA/sCBNSAnmgnyCp
 obWaS8re55PKwRTv7EH2ROrajM5ofE7k6JGEG6bTLSAdtgxA24gSda0klQ4CRVYTu86lV7DevhTUz
 6M+sFybwNg3pWGkKMhP+vOXvBf7v/6yYA0VKmitY8TBEVUk5ML8ECdhqFJiLy7VYcEDc=;
Received: from mail-wr1-f67.google.com ([209.85.221.67])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jeGI4-00Fzd7-GM
 for kgdb-bugreport@lists.sourceforge.net; Thu, 28 May 2020 11:01:42 +0000
Received: by mail-wr1-f67.google.com with SMTP id q11so15265959wrp.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 28 May 2020 04:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=8YQeuOJDn06o9Kk2yXAQ8S1S/zWUs7/D7wgGQiHSlDo=;
 b=bYqfqbrkFj1FZHFAzXsoQSlTYLWgrpcMnTB2pBoapXhOlKoLypnBJzKuAQnQ3D8KQ7
 4FlIVcc2ATGO0OVErlukatffDWx/NrW9BSpb5EMCPEyJtiZSDAg9Pyig20jMp/BeBURX
 dFK7oluyit4qnyVmN74vPkDhKJivnHxhcoQiIb5AW4h1v4OrsfbOlse9z/B4JDhXBjHp
 98fSCMNYP2RXclElfro2gyR4I9gan/O/UeGKDfRJgtFGtYZNFouaV1u0Go9zvUPZURln
 /Dsg1bd+sz52nA/2Y0mu+01QgNy2LVh6YAxZFYrYR+2zkxZc2vBwG2a3yWlrzuCz8vG7
 UwNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8YQeuOJDn06o9Kk2yXAQ8S1S/zWUs7/D7wgGQiHSlDo=;
 b=VjJndBpWnCRZLX2isIjC836AbX2iQaZEsiVNqZTpAvPnAwMw3RFOC3K1UuozioHWnG
 MwV5hJ4EZQDwJ6TNE11j5j8V0GyuWFvEwx7HVaH1LwKLmO+yTbavDcZSxfNqo465BvEj
 SPKYZnkqdcPbI75FAPrS42VTeRFlksS1WRlWoxTOBh4kAhDgGeVwAYfFHHsiq32QqQer
 fJjrkPaE13xfOb6ahqydAijCN9ZaSJPdG//HGa9PSp26xmDF7XZjonIOKseOup215GQy
 ooeYbnyPX9FrTZxOFMhXjYPnx3KOmCv3eY4LEAv5pcNyg7dVXF4x842v9uQkcI1w41zx
 IrRQ==
X-Gm-Message-State: AOAM533Zde8Fap1L3QVdflOdb9YVfKr9y/zxuUxYtWfQwKTYyGVq7ilG
 YJhRgV1WT6qW8pU6qt4SQ/mtcQ==
X-Google-Smtp-Source: ABdhPJyRVaunzq/Sm8tZxu1hhg2+vZn1ONdzXQY6iv2kXmcjShIgl9xgdzaFGyxwuiaTc8v3Xcl8wA==
X-Received: by 2002:a05:6000:120b:: with SMTP id
 e11mr3008597wrx.107.1590663677449; 
 Thu, 28 May 2020 04:01:17 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id 190sm6423473wmb.23.2020.05.28.04.01.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2020 04:01:16 -0700 (PDT)
Date: Thu, 28 May 2020 12:01:14 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Wei Li <liwei391@huawei.com>
Message-ID: <20200528110114.54qbkclk5demvsmc@holly.lan>
References: <20200521072125.21103-1-liwei391@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200521072125.21103-1-liwei391@huawei.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.67 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.67 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jeGI4-00Fzd7-GM
Subject: Re: [Kgdb-bugreport] [PATCH v3] kdb: Remove the misfeature
 'KDBFLAGS'
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
 Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org,
 Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Thu, May 21, 2020 at 03:21:25PM +0800, Wei Li wrote:
> Currently, 'KDBFLAGS' is an internal variable of kdb, it is combined
> by 'KDBDEBUG' and state flags. It will be shown only when 'KDBDEBUG'
> is set, and the user can define an environment variable named 'KDBFLAGS'
> too. These are puzzling indeed.
> 
> After communication with Daniel, it seems that 'KDBFLAGS' is a misfeature.
> So let's replace 'KDBFLAGS' with 'KDBDEBUG' to just show the value we
> wrote into. After this modification, we can use `md4c1 kdb_flags` instead,
> to observe the state flags.
> 
> Suggested-by: Daniel Thompson <daniel.thompson@linaro.org>
> Signed-off-by: Wei Li <liwei391@huawei.com>

Applied. Thanks.


Daniel.

> ---
> v2 -> v3:
>  - Change to replace the internal env 'KDBFLAGS' with 'KDBDEBUG'.
> v1 -> v2:
>  - Fix lack of braces.
> 
>  kernel/debug/kdb/kdb_main.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
> index 4fc43fb17127..392029287083 100644
> --- a/kernel/debug/kdb/kdb_main.c
> +++ b/kernel/debug/kdb/kdb_main.c
> @@ -418,8 +418,7 @@ int kdb_set(int argc, const char **argv)
>  				    argv[2]);
>  			return 0;
>  		}
> -		kdb_flags = (kdb_flags &
> -			     ~(KDB_DEBUG_FLAG_MASK << KDB_DEBUG_FLAG_SHIFT))
> +		kdb_flags = (kdb_flags & ~KDB_DEBUG(MASK))
>  			| (debugflags << KDB_DEBUG_FLAG_SHIFT);
>  
>  		return 0;
> @@ -2081,7 +2080,8 @@ static int kdb_env(int argc, const char **argv)
>  	}
>  
>  	if (KDB_DEBUG(MASK))
> -		kdb_printf("KDBFLAGS=0x%x\n", kdb_flags);
> +		kdb_printf("KDBDEBUG=0x%x\n",
> +			(kdb_flags & KDB_DEBUG(MASK)) >> KDB_DEBUG_FLAG_SHIFT);
>  
>  	return 0;
>  }
> -- 
> 2.17.1
> 
> 
> 
> _______________________________________________
> Kgdb-bugreport mailing list
> Kgdb-bugreport@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
