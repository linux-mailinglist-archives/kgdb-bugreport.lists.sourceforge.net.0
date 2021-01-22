Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0086F300058
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 22 Jan 2021 11:34:14 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1l2tlc-0004L8-Pl
	for lists+kgdb-bugreport@lfdr.de; Fri, 22 Jan 2021 10:34:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1l2tla-0004Kz-Fe
 for kgdb-bugreport@lists.sourceforge.net; Fri, 22 Jan 2021 10:34:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qsVmGWHN+aWas1ndy6vVi8X4aWqjPl6LXWdXgXgZ6hE=; b=K88W6UHVk2HEPX+URXvgJ7GX58
 09REG2S1r8htBf6M7oShJMz95uQBVFObk3TZqVhP4rZfrUrKUrCVfSQ0SD3W7J9Y7aPGaZfcvDDgI
 jYBVo6QuexK5q10lB20YpCQuCSiZG6xwghRxdVmYaD2IlaJmK6QJyBquVnJQASQJBR+0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qsVmGWHN+aWas1ndy6vVi8X4aWqjPl6LXWdXgXgZ6hE=; b=GMkhC5Zm8htZ2Faedm/gfObkeX
 wr5SKOP9vDf2U3DiZ3fMfaUqzl6U83fNOw7ucF8xytAqyOs/xowOL3rrlzjTQ7xp8nk0Q7Dbv4jho
 d3Fzu43p31aTywrtifuOKWbPqbeyThvfxYw7QPABrV/RLfj24gP5OMXusv7sJXFMxL5E=;
Received: from mail-wr1-f53.google.com ([209.85.221.53])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1l2tlV-009gT8-Ee
 for kgdb-bugreport@lists.sourceforge.net; Fri, 22 Jan 2021 10:34:10 +0000
Received: by mail-wr1-f53.google.com with SMTP id q7so4557932wre.13
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 22 Jan 2021 02:34:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=qsVmGWHN+aWas1ndy6vVi8X4aWqjPl6LXWdXgXgZ6hE=;
 b=AmidOvt0BWeDL5UDH6nolVCvRaYhkLdwRsroCNnOcsARgZY2yplFFZyMriHytFx25N
 XTyrNFCAY3e19+ch/izUUxar0Q0sYEi/FFXqmUK2ERpkzK7pnjuUBu/tfO14vwteRKUY
 luJTD9sd9md+mQdoNUY7R2NGXfgxY9Mie6G6RdbR7j8Ta486lODqifuvquuG6Fpd79aw
 xVFubvHxBlLe9cxPXKzzZ8j/AzuzOhAQBeJJriPKKkw1hNU/N41+mTa6mMAcPGPT7/5L
 uJMAzUc3KmcmrHjR8/FJwWlo6Ej9ZV8i90vTkZpaLPXOD+BjrMQiIWTBMvTfC0R5FJvD
 7Dkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qsVmGWHN+aWas1ndy6vVi8X4aWqjPl6LXWdXgXgZ6hE=;
 b=JW10vXEdfwHZpVBCzGeFPDSCEEVwdey//PjGCUBhchX6duJp+OzQhdywahEtJhwdSa
 YCGX8MldUO3RqmiWVHXfwsTNDobZLx/5BmlUUIjkSRZyclFswNhcwelclG0M8Rj6UTCz
 KHlVtzDOsTR27T4ygdyxmlhjLln7HDOcdFx/3xzQJFKYMTIFuKTFZXioVpzIxNpoOehC
 M+vQEGAnNpYg1jOAejvRGPT+ALyeBKxCpXhtuKi3JnXDKs/635wH9arKn6K96i31EZcl
 QTrtZU8H6I0RnT2xAalU/hRD8gzhnt4G3lFHMcKwltuvPX9ROqcEwgg2aDEhOAhiuJ6A
 HW4g==
X-Gm-Message-State: AOAM530aCj5VlYYEQbDNdt1S1eHBRiHnVsTWzumDvWVTRxQA5LDc26OX
 TF1cZw7PH5sdvhvT1e+t0ZNY+A==
X-Google-Smtp-Source: ABdhPJyIDmWFqA4gaAO68QLMD1nAkxDh4PtWNNL8FlfQVE7BnDTlQrS9lz0Zj1rHBJ6hXiT1eYaobw==
X-Received: by 2002:a5d:4e8a:: with SMTP id e10mr3890550wru.0.1611311638694;
 Fri, 22 Jan 2021 02:33:58 -0800 (PST)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id q63sm11090728wma.43.2021.01.22.02.33.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jan 2021 02:33:57 -0800 (PST)
Date: Fri, 22 Jan 2021 10:33:56 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Sumit Garg <sumit.garg@linaro.org>
Message-ID: <20210122103356.pekf7wx3smknyotl@maple.lan>
References: <1611310850-3339-1-git-send-email-sumit.garg@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1611310850-3339-1-git-send-email-sumit.garg@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.53 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.53 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1l2tlV-009gT8-Ee
Subject: Re: [Kgdb-bugreport] [PATCH v2] kdb: Make memory allocations more
 robust
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
Cc: kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 jason.wessel@windriver.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Fri, Jan 22, 2021 at 03:50:50PM +0530, Sumit Garg wrote:
> Currently kdb uses in_interrupt() to determine whether it's library

Looks like a good change just a few nitpicks with the description:

s/it's/its/

> code has been called from the kgdb trap handler or from a saner calling
> context such as driver init. This approach is broken because
> in_interrupt() alone isn't able to determine kgdb trap handler entry via
> normal task context such as [1].

Why footnote this and aren't breakpoints a far more natural reason to
enter the debugger?

The following will be clearer for backporting, etc:

... detmermine kgdb trap handler entry from normal task context. This
can happen during normal use of basic features such as breakpoints
and can also be trivially reproduced using: echo g > /proc/sysrq-trigger



> 
> We can improve this by adding check for in_dbg_master() instead which
> explicitly determines if we are running in debugger context.
> 
> [1] $ echo g > /proc/sysrq-trigger
> 

Cc: stable@ ?


> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>


Daniel.



> ---
> 
> Changes in v2:
> - Get rid of redundant in_atomic() check.
> 
>  kernel/debug/kdb/kdb_private.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/debug/kdb/kdb_private.h b/kernel/debug/kdb/kdb_private.h
> index 7a4a181..344eb0d 100644
> --- a/kernel/debug/kdb/kdb_private.h
> +++ b/kernel/debug/kdb/kdb_private.h
> @@ -231,7 +231,7 @@ extern struct task_struct *kdb_curr_task(int);
>  
>  #define kdb_task_has_cpu(p) (task_curr(p))
>  
> -#define GFP_KDB (in_interrupt() ? GFP_ATOMIC : GFP_KERNEL)
> +#define GFP_KDB (in_dbg_master() ? GFP_ATOMIC : GFP_KERNEL)
>  
>  extern void *debug_kmalloc(size_t size, gfp_t flags);
>  extern void debug_kfree(void *);
> -- 
> 2.7.4
> 


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
