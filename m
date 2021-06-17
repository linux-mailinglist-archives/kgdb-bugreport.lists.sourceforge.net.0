Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2C43AB27E
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 17 Jun 2021 13:25:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1ltq9a-0006j1-Ev
	for lists+kgdb-bugreport@lfdr.de; Thu, 17 Jun 2021 11:25:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1ltq9Y-0006ia-Mr
 for kgdb-bugreport@lists.sourceforge.net; Thu, 17 Jun 2021 11:25:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RqZOZEx9ohzvxxSvooROcyGAfz7QcNShdxHDZLPPObs=; b=cE2nCwslM37Rg0p9fEw/4TulfW
 lncAZBlLb5/Sjg1wSXTuDxaZqFiEXMy6l9vLejZxwEaFjRsclZ8+znsEqZVnm4xrXOaF9yb02dbz+
 nMy00IfQSdsyNNNhqwkgvFJnyJneNLwMgB9mOfLIH7cipmXtZJq6s52BGaF+TdogVC1c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RqZOZEx9ohzvxxSvooROcyGAfz7QcNShdxHDZLPPObs=; b=SiZRb3XmX/5jv+BRGP4RR2z5E9
 CUZw70Krnwn/DAhu2OK6dX9KYzem+GtqhH3tp/fjULY4pLAydDHT0CnMK/98pQvM+UFBCBSl4yrO2
 V0wuvbetZvxkZFVX256GFFJa/t7mgA6hAQQ4Mu4DRzMtyGYiXZkidmG4eTLr7iYM5AnY=;
Received: from mail-wr1-f45.google.com ([209.85.221.45])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1ltq9P-0001ft-1b
 for kgdb-bugreport@lists.sourceforge.net; Thu, 17 Jun 2021 11:25:44 +0000
Received: by mail-wr1-f45.google.com with SMTP id n7so6371940wri.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 17 Jun 2021 04:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=RqZOZEx9ohzvxxSvooROcyGAfz7QcNShdxHDZLPPObs=;
 b=Fmz34h62pHHxwCk3ZJB95Psj4oXy9lcfVRSPJtmj2HCccLO3Wt6wEBzCQMF52Oz9+6
 6yuzxHWar6la+ZGbvMI3PAMfY7Fq34yDrEdppBnxyoLmtYM0zEP7PcXMMEdi7W7F2qgF
 SyDSEUKWbcZAIn/weFvutOjMEBPPf1Mj2X45VAPG0xGEU7Zjg8X+h1npdMHYwiJB80Da
 JAUU+PCDvVbsvDFOKMX2Oa697o9r5+Y57aE6E+A+gBt9W8ePUwpDlIeB0hbr52vZkX6S
 J9xKl73zP6IRpqu04A3gSFJiW/9Jw/7Uz81cQnykokhwlYtN5u8Uz/eOYiabJ4+G5EUW
 iR5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RqZOZEx9ohzvxxSvooROcyGAfz7QcNShdxHDZLPPObs=;
 b=bZxttqUav33xKTvU0r9tzNnUrSZi/9dGfzHnKECZ4NmhABzEbHJutGZsZHVQwd2j9V
 BTgFDo+ErHYFMPKNDM2KKeleBRHagWPIlMKuPgc4raSlxsWYjmys7+FWUwB6buYgL5eC
 HheiFYDhEy0xtlazNLGfuHiplpdmiOFx81wUwC/LnjLn27384c9/9V5NelxCPqvIz8GB
 iGM2pgjMtF5aeNNgKPye19ArRvOekapJeZTXoUSMs5dU7cD8/58tHZcy0dom268GbUqJ
 ZYhh39vUgHr8BhdcSIjT1eBfPD7d1rLdxFBT3Vdty1XlzssS8oKqHf+o8SDshIbP+S1Y
 ownw==
X-Gm-Message-State: AOAM532cttT6tjMn86KI6UQbBTrDzE/NVZzwNtEjCV/U+UmyOPWx9W2e
 W0AnzI/Ywa10c8yZQkjw83oH9A==
X-Google-Smtp-Source: ABdhPJyk3bgNi5ESzoE0WY2r8FczOf8sdFPg2oBONcIxRTfNyPYwxlF3aZ5HyaXK+0ryeiP5fpSmQg==
X-Received: by 2002:adf:fa48:: with SMTP id y8mr5103547wrr.387.1623929129921; 
 Thu, 17 Jun 2021 04:25:29 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id o11sm4348654wmq.1.2021.06.17.04.25.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 04:25:29 -0700 (PDT)
Date: Thu, 17 Jun 2021 12:25:27 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Sumit Garg <sumit.garg@linaro.org>
Message-ID: <20210617112527.nganuruifprwhv3h@maple.lan>
References: <20210323065519.821062-1-sumit.garg@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210323065519.821062-1-sumit.garg@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.45 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.45 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1ltq9P-0001ft-1b
Subject: Re: [Kgdb-bugreport] [PATCH v2] kdb: Get rid of custom debug heap
 allocator
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

On Tue, Mar 23, 2021 at 12:25:19PM +0530, Sumit Garg wrote:
> Currently the only user for debug heap is kdbnearsym() which can be
> modified to rather use statically allocated buffer for symbol name as
> per it's current usage. So do that and hence remove custom debug heap
> allocator.
> 
> Note that this change puts a restriction on kdbnearsym() callers to
> carefully use shared namebuf such that a caller should consume the symbol
> returned immediately prior to another call to fetch a different symbol.
> 
> This change has been tested using kgdbtest on arm64 which doesn't show
> any regressions.
> 
> Suggested-by: Daniel Thompson <daniel.thompson@linaro.org>
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>

I'm afraid the passage of time (mostly due to my dropping the ball)
means this no longer applies cleanly to latest kernel and `git am
-3way` tells me that "sha1 information is lacking or useless".
Please can you rebase this on v5.13-rc4 and repost?

Also...


> diff --git a/kernel/debug/kdb/kdb_private.h b/kernel/debug/kdb/kdb_private.h
> index b857a84de3b5..ec91d7e02334 100644
> diff --git a/kernel/debug/kdb/kdb_support.c b/kernel/debug/kdb/kdb_support.c
> index b59aad1f0b55..e131d74abb8d 100644
> --- a/kernel/debug/kdb/kdb_support.c
> +++ b/kernel/debug/kdb/kdb_support.c
> @@ -57,35 +57,26 @@ int kdbgetsymval(const char *symname, kdb_symtab_t *symtab)
>  }
>  EXPORT_SYMBOL(kdbgetsymval);
>  
> -static char *kdb_name_table[100];	/* arbitrary size */
> -
>  /*
> - * kdbnearsym -	Return the name of the symbol with the nearest address
> - *	less than 'addr'.
> + * kdbnearsym() - Return the name of the symbol with the nearest address
> + *                less than @addr.
> + * @addr: Address to check for near symbol
> + * @symtab: Structure to receive results
>   *
> - * Parameters:
> - *	addr	Address to check for symbol near
> - *	symtab  Structure to receive results
> - * Returns:
> - *	0	No sections contain this address, symtab zero filled
> - *	1	Address mapped to module/symbol/section, data in symtab
> - * Remarks:
> - *	2.6 kallsyms has a "feature" where it unpacks the name into a
> - *	string.  If that string is reused before the caller expects it
> - *	then the caller sees its string change without warning.  To
> - *	avoid cluttering up the main kdb code with lots of kdb_strdup,
> - *	tests and kfree calls, kdbnearsym maintains an LRU list of the
> - *	last few unique strings.  The list is sized large enough to
> - *	hold active strings, no kdb caller of kdbnearsym makes more
> - *	than ~20 later calls before using a saved value.
> + * Note here that only single statically allocated namebuf is used for every
> + * symbol, so the caller should consume it immediately prior to another call
> + * to fetch a different symbol.

This still looks like it will confused experienced kernel devs who
aren't aware of kdb's calling context. Nor does it help future kdb
developers understand some of the subtlty of interactions here.

Can you enlarge this to the following (editing anything below that you
don't want git to blame you for ;-) ):

~~~
WARNING: This function may return a pointer to a single statically
allocated buffer (namebuf). kdb's unusual calling context (single
threaded, all other CPUs halted) provides us sufficient locking for
this to be safe. The only constraint imposed by the static buffer is
that the caller must consume any previous reply prior to another call
to lookup a new symbol.

Note that, strictly speaking, some architectures may re-enter the kdb
trap if the system turns out to be very badly damaged and this breaks
the single-threaded assumption above. In these circumstances successful
continuation and exit from the inner trap is unlikely to work and any
user attempting this receives a prominent warning before being allowed
to progress. In these circumstances we remain memory safe because
namebuf[KSYM_NAME_LEN-1] will never change from '\0' although we do
tolerate the possibility of garbled symbol display from the outer kdb
trap.
~~~

Thanks


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
