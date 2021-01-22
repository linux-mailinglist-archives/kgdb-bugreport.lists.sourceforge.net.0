Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A3AC62FFF75
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 22 Jan 2021 10:48:33 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1l2t3Q-0002FZ-Ea
	for lists+kgdb-bugreport@lfdr.de; Fri, 22 Jan 2021 09:48:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1l2t3O-0002FP-A6
 for kgdb-bugreport@lists.sourceforge.net; Fri, 22 Jan 2021 09:48:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=STsRtcsh5EZY9rIDA5wX7lDe2Z60MDFpJfKdBbxUPaQ=; b=Qp6xB0NFU15AKlQkzuN5skHHeD
 xj/nXU25G92MSeLdYtzdXtZi9z4T6F/4lS3y2OSiti82z763jNYTGWEwaPBIIIZFEEZVs04YgWV08
 3+fdCbjD3Ul+qGyjPpUGae0vGQ1Y06Owl3VfObGWAe+TzHODAPj/wUeJDDQ8SACWV3Tc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=STsRtcsh5EZY9rIDA5wX7lDe2Z60MDFpJfKdBbxUPaQ=; b=luX7jZ3z0uhaqnK2265HYJOibF
 xaqTq6D5qSjImvimI3coreD/7ddcwXEeE53zAEhPw1TOtJs19Nxvw6wRSw3CGrTOxWIfz5nCsBz3L
 xQ+b9t0SFnRKbzAE/LvCrR12M5T/oL+qn8fceKyEqvhsb+XocnTt/srhRM2crhHdz1aI=;
Received: from mail-wr1-f43.google.com ([209.85.221.43])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1l2t3K-00Fm8c-Fq
 for kgdb-bugreport@lists.sourceforge.net; Fri, 22 Jan 2021 09:48:30 +0000
Received: by mail-wr1-f43.google.com with SMTP id v15so4443845wrx.4
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 22 Jan 2021 01:48:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=STsRtcsh5EZY9rIDA5wX7lDe2Z60MDFpJfKdBbxUPaQ=;
 b=VSI2yvYK00AS6ys7r97tMDnuUsFWaE9s8dqZzJpILB87gbIMU8P2izNPKr+5vx8/is
 phdD3Gg1bIRJeQdtYHAcjt9v8A1gSTEVlxrzNMke7PokhNP7J8oPDlLk/T3xzk/Uq4Mr
 rhgAhst7kyyOhBpYu/wAJfI3UqZybSKe6QFTYbqWtkuVs2XW2bTAC3+Vx4kUxKgEh/hM
 pGNSgmOxauY+IsNdxbALkz7qCFYMsdgiRSIAW11202tKLCN6PQso1qfNRp4+cWzQvxgu
 l7+uJ6yZMKQ/4fnjvSLZSYVC7mol3C3G6M72sI6dnsym1aTTtdqOszjrv5Zm3sQPsfMZ
 Z6tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=STsRtcsh5EZY9rIDA5wX7lDe2Z60MDFpJfKdBbxUPaQ=;
 b=RVFPstYxsq+8QHKFidLp9tfrQC5yUcU+kOYipD/q5CGvaNGYWmOufIdKuOCtsEWZyn
 JJx8e7vvdFOYGtlUZXs5mMdYZ+6wXDgsI+q5KRP8JqDzVY8XtCT3pL/UgcFJ2tfrPgt7
 HWDp6Bhom8F5cb4wFXSqBxBnv/m3xC3RtD8ggsCUVaoUM3iyMHIrdNbLi2xpETYTns+h
 pnhxnXh/fntDblxYwyISty6qgAskWOlolwlfTe5Nq8ZmRdWsNDKA0yhdkFtlvlcXEiDH
 Qx8xeWaOqJ4sXbzPCtKU5x4H1uDFyhT5liIisHutX9dwWWB7Dwm+3y2E+BDHWU+KWSeh
 wrbQ==
X-Gm-Message-State: AOAM531CuFLj2zTs6tnV6ULaVYUW3Ysj1zfTdIOqWzDpGzTSmUhxcrWu
 CoZF2COUjyDX6X1Z4H+KXCrvpQ==
X-Google-Smtp-Source: ABdhPJzfdUU5skgC5NOdL/+mlNzybWwl8Q5QHaldHgp/250cx1oiZTg2l3L0OOCkt/b0yJ8ytz+skA==
X-Received: by 2002:a5d:6351:: with SMTP id b17mr462539wrw.410.1611308892995; 
 Fri, 22 Jan 2021 01:48:12 -0800 (PST)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id n193sm10924529wmb.0.2021.01.22.01.48.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jan 2021 01:48:12 -0800 (PST)
Date: Fri, 22 Jan 2021 09:48:10 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Sumit Garg <sumit.garg@linaro.org>
Message-ID: <20210122094810.6o32gzoqtwgqi5hn@maple.lan>
References: <1611308311-2530-1-git-send-email-sumit.garg@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1611308311-2530-1-git-send-email-sumit.garg@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.43 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.43 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1l2t3K-00Fm8c-Fq
Subject: Re: [Kgdb-bugreport] [PATCH] kdb: Make memory allocations more
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

On Fri, Jan 22, 2021 at 03:08:31PM +0530, Sumit Garg wrote:
> Currently kdb uses in_interrupt() to determine whether it's library
> code has been called from the kgdb trap handler or from a saner calling
> context such as driver init. This approach is broken because
> in_interrupt() alone isn't able to determine kgdb trap handler entry via
> normal task context such as [1].
> 
> We can improve this by adding check for in_dbg_master() which explicitly
> determines if we are running in debugger context. Also, use in_atomic()
> instead of in_interrupt() as the former is more appropriate to know atomic
> context and moreover the later one is deprecated.

Why do we need the in_atomic() here? Or put another way, why isn't
in_dbg_master() sufficient?


Daniel.


> 
> [1] $ echo g > /proc/sysrq-trigger
> 
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> ---
>  kernel/debug/kdb/kdb_private.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/debug/kdb/kdb_private.h b/kernel/debug/kdb/kdb_private.h
> index 7a4a181..7a9ebd9 100644
> --- a/kernel/debug/kdb/kdb_private.h
> +++ b/kernel/debug/kdb/kdb_private.h
> @@ -231,7 +231,7 @@ extern struct task_struct *kdb_curr_task(int);
>  
>  #define kdb_task_has_cpu(p) (task_curr(p))
>  
> -#define GFP_KDB (in_interrupt() ? GFP_ATOMIC : GFP_KERNEL)
> +#define GFP_KDB (in_atomic() || in_dbg_master() ? GFP_ATOMIC : GFP_KERNEL)
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
