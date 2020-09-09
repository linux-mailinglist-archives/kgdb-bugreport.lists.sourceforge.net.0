Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 06677262F57
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  9 Sep 2020 15:50:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kG0Uf-00081v-QS
	for lists+kgdb-bugreport@lfdr.de; Wed, 09 Sep 2020 13:50:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1kG0Ud-00081m-TA
 for kgdb-bugreport@lists.sourceforge.net; Wed, 09 Sep 2020 13:50:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=05cqLnvwurAG2nT9cn66pd3c6M1ZLUU9TcHpBge76Y0=; b=EZuyVLLDQ08OMRyxkLL1mM6bRY
 djHQ/cHdY4bbN7j9Jp364ql/hiIamcKcokNwRD5Z6fPAoGRa+7tqrUtGJToO8QP4lXDvlUP1c+GUU
 ak75ZL3wvLRzPxUYuaTlOgIioAKBiIIkTx0WV2YmM7sfIGE4bvbGV0p9NN41LpDcCUNA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=05cqLnvwurAG2nT9cn66pd3c6M1ZLUU9TcHpBge76Y0=; b=At0W+EoeqvLzIZy4lmmW3RmTqY
 qWLR3uIIQrD5qHWEhG+1pHh1MUq7VZAiuhK/VawnxQ4E/ICOoeeLTs+7eo56pRDpqL9NAr1KBsb5b
 zdfqUvcK6T08sVaQEPkcd2jGFDQsXwRSs3BEsNmpLG2qsZJT/jZWh54JjdtUTEjTpCFw=;
Received: from mail-ed1-f67.google.com ([209.85.208.67])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kG0UY-000d9k-Su
 for kgdb-bugreport@lists.sourceforge.net; Wed, 09 Sep 2020 13:50:35 +0000
Received: by mail-ed1-f67.google.com with SMTP id i1so2739034edv.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 09 Sep 2020 06:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=05cqLnvwurAG2nT9cn66pd3c6M1ZLUU9TcHpBge76Y0=;
 b=qx/KDtIxcASxVw6BmBwCFkswRfMEmntnHNylhIbTKyXIxmiihdUuq/sjUxVBYLQKWE
 tclmv23Xg6FYqvItYPbv/ZXJ8RHbNh6VssaL0zFUVFiDjHQZlOQ6qI9Qjn6LK/zpx652
 HeDWQzfyNDFxUAVNirHx0uFEGMyxl4O+X6OWeDmD2UJbEhvkbFq0AZzaR7sy0nWhHnp5
 kCbHrjXfVGMw85pls6rTNhXvbwD+XNZCKrV4UFC8+4FAjwBi1aWTn9NDYTZJ11elKI68
 0cnSIioQGtivTzQl3Nv63qH2DGjW5y4gkBmElrTr1aQ2KIiDWmhmMpzg81dLkuPv5DYK
 nGDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=05cqLnvwurAG2nT9cn66pd3c6M1ZLUU9TcHpBge76Y0=;
 b=TxGJJZdRWgJjXoT4tS4PWuNJKqlnv6CoUa+D93z1VkZxLzlBTeXPHjr+wLNVhozXmq
 uRW/4oxonqXubQ8p9KQhfUj+xrFG5LMgr6uOdDBo2+4mbTYtdMjK1wbeXzUPsqXbd13V
 pCkfsh5COEQTpsuOp3olF9Mj8HB5Pe2QYswZtDh5yhxd/nY7+HIUCI+PPVevsF/tLbRs
 hsqSQFi11LQl0KK+jQdjNnCbt9ui3bWAw3ftMyPaCZ4aN+B9dEjBGuUTw+OHQf8yC/Pt
 X0slCn+bm/oc0TIhXEmtaVqPzBZ+sZ5bK9GXawHxeN+kGdcRZ+sqrC+2wBDZW7dgf2tv
 x2Jg==
X-Gm-Message-State: AOAM533XhVhqc2E6sBFFlGgRDsBAm59UTRSdEaaqkwaymSt8nde7eVpX
 RSE8bZKCJiMVemqAIscMc/hpVEkrcWLs+wVS
X-Google-Smtp-Source: ABdhPJwR4yz+lrnFsWPaPfQx5cX9uEgPeV4TBu13brw8jj4FHCrPrszb3SZCmmL/t67uLrzIDirWbw==
X-Received: by 2002:adf:e4c9:: with SMTP id v9mr3809264wrm.375.1599658674956; 
 Wed, 09 Sep 2020 06:37:54 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id w7sm4302641wrm.92.2020.09.09.06.37.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2020 06:37:54 -0700 (PDT)
Date: Wed, 9 Sep 2020 14:37:52 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Davidlohr Bueso <dave@stgolabs.net>
Message-ID: <20200909133752.t7zbnaupd3y22bzd@holly.lan>
References: <20200907134614.guc4tzj3knnihbe4@holly.lan>
 <20200907203206.21293-1-dave@stgolabs.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200907203206.21293-1-dave@stgolabs.net>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: suse.de]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.67 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.67 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kG0UY-000d9k-Su
Subject: Re: [Kgdb-bugreport] [PATCH v2] kdb: Use newer api for tasklist
 scanning
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
Cc: Davidlohr Bueso <dbueso@suse.de>, kgdb-bugreport@lists.sourceforge.net,
 oleg@redhat.com, jason.wessel@windriver.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Mon, Sep 07, 2020 at 01:32:06PM -0700, Davidlohr Bueso wrote:
> This kills using the do_each_thread/while_each_thread combo to
> iterate all threads and uses for_each_process_thread() instead,
> maintaining semantics. while_each_thread() is ultimately racy
> and deprecated;  although in this particular case there is no
> concurrency so it doesn't matter. Still lets trivially get rid
> of two more users.
> 
> Acked-by: Oleg Nesterov <oleg@redhat.com>
> Signed-off-by: Davidlohr Bueso <dbueso@suse.de>

Applied. Thanks!


Daniel.


> ---
>  kernel/debug/gdbstub.c         | 4 ++--
>  kernel/debug/kdb/kdb_bt.c      | 4 ++--
>  kernel/debug/kdb/kdb_main.c    | 8 ++++----
>  kernel/debug/kdb/kdb_private.h | 4 ----
>  4 files changed, 8 insertions(+), 12 deletions(-)
> 
> diff --git a/kernel/debug/gdbstub.c b/kernel/debug/gdbstub.c
> index cc3c43dfec44..b52ebff09ac8 100644
> --- a/kernel/debug/gdbstub.c
> +++ b/kernel/debug/gdbstub.c
> @@ -725,7 +725,7 @@ static void gdb_cmd_query(struct kgdb_state *ks)
>  			}
>  		}
>  
> -		do_each_thread(g, p) {
> +		for_each_process_thread(g, p) {
>  			if (i >= ks->thr_query && !finished) {
>  				int_to_threadref(thref, p->pid);
>  				ptr = pack_threadid(ptr, thref);
> @@ -735,7 +735,7 @@ static void gdb_cmd_query(struct kgdb_state *ks)
>  					finished = 1;
>  			}
>  			i++;
> -		} while_each_thread(g, p);
> +		}
>  
>  		*(--ptr) = '\0';
>  		break;
> diff --git a/kernel/debug/kdb/kdb_bt.c b/kernel/debug/kdb/kdb_bt.c
> index 18e03aba2cfc..1f9f0e47aeda 100644
> --- a/kernel/debug/kdb/kdb_bt.c
> +++ b/kernel/debug/kdb/kdb_bt.c
> @@ -149,14 +149,14 @@ kdb_bt(int argc, const char **argv)
>  				return 0;
>  		}
>  		/* Now the inactive tasks */
> -		kdb_do_each_thread(g, p) {
> +		for_each_process_thread(g, p) {
>  			if (KDB_FLAG(CMD_INTERRUPT))
>  				return 0;
>  			if (task_curr(p))
>  				continue;
>  			if (kdb_bt1(p, mask, btaprompt))
>  				return 0;
> -		} kdb_while_each_thread(g, p);
> +		}
>  	} else if (strcmp(argv[0], "btp") == 0) {
>  		struct task_struct *p;
>  		unsigned long pid;
> diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
> index 5c7949061671..930ac1b25ec7 100644
> --- a/kernel/debug/kdb/kdb_main.c
> +++ b/kernel/debug/kdb/kdb_main.c
> @@ -2299,10 +2299,10 @@ void kdb_ps_suppressed(void)
>  		if (kdb_task_state(p, mask_I))
>  			++idle;
>  	}
> -	kdb_do_each_thread(g, p) {
> +	for_each_process_thread(g, p) {
>  		if (kdb_task_state(p, mask_M))
>  			++daemon;
> -	} kdb_while_each_thread(g, p);
> +	}
>  	if (idle || daemon) {
>  		if (idle)
>  			kdb_printf("%d idle process%s (state I)%s\n",
> @@ -2370,12 +2370,12 @@ static int kdb_ps(int argc, const char **argv)
>  	}
>  	kdb_printf("\n");
>  	/* Now the real tasks */
> -	kdb_do_each_thread(g, p) {
> +	for_each_process_thread(g, p) {
>  		if (KDB_FLAG(CMD_INTERRUPT))
>  			return 0;
>  		if (kdb_task_state(p, mask))
>  			kdb_ps1(p);
> -	} kdb_while_each_thread(g, p);
> +	}
>  
>  	return 0;
>  }
> diff --git a/kernel/debug/kdb/kdb_private.h b/kernel/debug/kdb/kdb_private.h
> index 2e296e4a234c..a4281fb99299 100644
> --- a/kernel/debug/kdb/kdb_private.h
> +++ b/kernel/debug/kdb/kdb_private.h
> @@ -230,10 +230,6 @@ extern struct task_struct *kdb_curr_task(int);
>  
>  #define kdb_task_has_cpu(p) (task_curr(p))
>  
> -/* Simplify coexistence with NPTL */
> -#define	kdb_do_each_thread(g, p) do_each_thread(g, p)
> -#define	kdb_while_each_thread(g, p) while_each_thread(g, p)
> -
>  #define GFP_KDB (in_interrupt() ? GFP_ATOMIC : GFP_KERNEL)
>  
>  extern void *debug_kmalloc(size_t size, gfp_t flags);
> -- 
> 2.26.2


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
