Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A41F3252CE
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 25 Feb 2021 16:56:24 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1lFJ03-0006p2-80
	for lists+kgdb-bugreport@lfdr.de; Thu, 25 Feb 2021 15:56:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1lFJ00-0006oU-RR
 for kgdb-bugreport@lists.sourceforge.net; Thu, 25 Feb 2021 15:56:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IKK5Sk4xYKEQS6he6oFH14uzFoBWOsLEHulMdGPTh3s=; b=JeX0ucsjtZnPn215yNCTi4g8Cw
 +iANMDna0jtAbppProfOBJ9jQfTZMRj5Isos4wrinx05+mc+ZJNJMzX8eIhl0+XkJX4zr9nrXMP0H
 /xUpXtELhpdbuAHMIPtB9/k4moGKJJR6znRJWMrJrq+j2mvuIjAwUabUv9per6SqQg2Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IKK5Sk4xYKEQS6he6oFH14uzFoBWOsLEHulMdGPTh3s=; b=DozOcZpRHmrVvhUmkUtT/VgJpr
 TOaWfx2LKCQ+CE9e8RoplRRhOoyroDUNHj/+OxXW77Z5BMDgFO532MWyHaxZFmJ91P82gzlsk/b9A
 NAqAX6dGYjGkYQTjyfquuSTFriY+A9dssgVe83M2tb6Q7yqiSSUNZxRdlrDypzYkMcRw=;
Received: from mail-wr1-f47.google.com ([209.85.221.47])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1lFIzw-005ANB-18
 for kgdb-bugreport@lists.sourceforge.net; Thu, 25 Feb 2021 15:56:20 +0000
Received: by mail-wr1-f47.google.com with SMTP id h98so5723425wrh.11
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 25 Feb 2021 07:56:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=IKK5Sk4xYKEQS6he6oFH14uzFoBWOsLEHulMdGPTh3s=;
 b=Rf7dYtwjQhhovLSRhQ++Yw2wPK4miSxmPQp+4AVUVIksnPY1j4FrbB90Gkfovz3njH
 Twrir59gr01W9OudUEgazdYm0MHK0yiyAid99ozreQuRf/KE6p2NWw/XfA7jRc01lDdW
 KY6kndFd/BSJQdsPnsmqW/2hDWF2/CpsmBnAN4d/Jf2x28RXxEJ79vBIqpGm4IwrVRrT
 Gw3nvPwZdSa6usNGKf3zlgozi6zfBt19Y/oPzakvwhCUPFt7goKzfLb+wuPMoBD4k1UZ
 LdeWizKmUC8988+3SKp5SR4SRVbK1pE3LNaA82fWqOSY9tXswNtu2Q8x59rLS6Kof26p
 x84w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=IKK5Sk4xYKEQS6he6oFH14uzFoBWOsLEHulMdGPTh3s=;
 b=DFBueMLuDkvYcX5+6oWxNI365BTrtYZuODnu0KphWUMlBAymGdTz9UCN+zKANGi2qK
 LiYNHy8CmZVEvJV1g3sJsoff7PsPvr5ssXDWIvRp0m7cXpZtP3x/zRTJC3pa2Q663SyL
 dCWOHJ4qdjzv1JyavDi9dPdH2zmgRg2o61/3k7Rq7XwXNNRQatxYwH9LnbxXtuwE1CWq
 P9hsbjQaGiSfdgUP/vFeDn5QQVjAs286fsvIMNR4MyK9x2JAyXefNaJmUWl0A962w6m0
 7Sxx1bGCf88XVR0axNYF1Pxi/BKofshVxn/HAogfU5gGY2b+I41w1LLcXazkeTWZkGKr
 9RfQ==
X-Gm-Message-State: AOAM531nuXAzUv1KSZ09cP1ZFDZboXh8rB5ujvFdWmpliuLj6STQYAti
 yNMVa8oBHuyxq9Vi6j2y6IWgSg==
X-Google-Smtp-Source: ABdhPJw+xUtDhcz+Elc3MHEJH7TS3rs1JsepsMJ+0YIIlvr3DGy2rg/ANGnfX5KSvscV5KGb4yGpXQ==
X-Received: by 2002:adf:8104:: with SMTP id 4mr4193667wrm.265.1614268569651;
 Thu, 25 Feb 2021 07:56:09 -0800 (PST)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id x18sm8702512wrs.16.2021.02.25.07.56.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 07:56:09 -0800 (PST)
Date: Thu, 25 Feb 2021 15:56:07 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Sumit Garg <sumit.garg@linaro.org>
Message-ID: <20210225155607.634snzzq3w62kpkn@maple.lan>
References: <20210224081652.587785-1-sumit.garg@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210224081652.587785-1-sumit.garg@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.47 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.47 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1lFIzw-005ANB-18
Subject: Re: [Kgdb-bugreport] [PATCH] kgdb: Fix to kill breakpoints on
 initmem after boot
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
Cc: peterz@infradead.org, kgdb-bugreport@lists.sourceforge.net,
 rostedt@goodmis.org, linux-kernel@vger.kernel.org, qy15sije@cip.cs.fau.de,
 mhiramat@kernel.org, jason.wessel@windriver.com, akpm@linux-foundation.org,
 stefan.saecherl@fau.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Wed, Feb 24, 2021 at 01:46:52PM +0530, Sumit Garg wrote:
> Currently breakpoints in kernel .init.text section are not handled
> correctly while allowing to remove them even after corresponding pages
> have been freed.
> 
> Fix it via killing .init.text section breakpoints just prior to initmem
> pages being freed.
> 
> Suggested-by: Doug Anderson <dianders@chromium.org>
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>

I saw Andrew has picked this one up. That's ok for me:
Acked-by: Daniel Thompson <daniel.thompson@linaro.org>

I already enriched kgdbtest to cover this (and they pass) so I guess
this is also:
Tested-by: Daniel Thompson <daniel.thompson@linaro.org>

BTW this is not Cc:ed to stable and I do wonder if it crosses the
threshold to be considered a fix rather than a feature. Normally I
consider adding safety rails for kgdb to be a new feature but, in this
case, the problem would easily ensnare an inexperienced developer who is
doing nothing more than debugging their own driver (assuming they
correctly marked their probe function as .init) so I think this weighs
in favour of being a fix.


Daniel.


> ---
>  include/linux/kgdb.h      |  2 ++
>  init/main.c               |  1 +
>  kernel/debug/debug_core.c | 11 +++++++++++
>  3 files changed, 14 insertions(+)
> 
> diff --git a/include/linux/kgdb.h b/include/linux/kgdb.h
> index 57b8885708e5..3aa503ef06fc 100644
> --- a/include/linux/kgdb.h
> +++ b/include/linux/kgdb.h
> @@ -361,9 +361,11 @@ extern atomic_t			kgdb_active;
>  extern bool dbg_is_early;
>  extern void __init dbg_late_init(void);
>  extern void kgdb_panic(const char *msg);
> +extern void kgdb_free_init_mem(void);
>  #else /* ! CONFIG_KGDB */
>  #define in_dbg_master() (0)
>  #define dbg_late_init()
>  static inline void kgdb_panic(const char *msg) {}
> +static inline void kgdb_free_init_mem(void) { }
>  #endif /* ! CONFIG_KGDB */
>  #endif /* _KGDB_H_ */
> diff --git a/init/main.c b/init/main.c
> index c68d784376ca..a446ca3d334e 100644
> --- a/init/main.c
> +++ b/init/main.c
> @@ -1417,6 +1417,7 @@ static int __ref kernel_init(void *unused)
>  	async_synchronize_full();
>  	kprobe_free_init_mem();
>  	ftrace_free_init_mem();
> +	kgdb_free_init_mem();
>  	free_initmem();
>  	mark_readonly();
>  
> diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
> index 229dd119f430..319381e95d1d 100644
> --- a/kernel/debug/debug_core.c
> +++ b/kernel/debug/debug_core.c
> @@ -465,6 +465,17 @@ int dbg_remove_all_break(void)
>  	return 0;
>  }
>  
> +void kgdb_free_init_mem(void)
> +{
> +	int i;
> +
> +	/* Clear init memory breakpoints. */
> +	for (i = 0; i < KGDB_MAX_BREAKPOINTS; i++) {
> +		if (init_section_contains((void *)kgdb_break[i].bpt_addr, 0))
> +			kgdb_break[i].state = BP_UNDEFINED;
> +	}
> +}
> +
>  #ifdef CONFIG_KGDB_KDB
>  void kdb_dump_stack_on_cpu(int cpu)
>  {
> -- 
> 2.25.1


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
