Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6526D3261A0
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 26 Feb 2021 11:59:58 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1lFaqj-0006M1-94
	for lists+kgdb-bugreport@lfdr.de; Fri, 26 Feb 2021 10:59:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1lFaqd-0006LK-97
 for kgdb-bugreport@lists.sourceforge.net; Fri, 26 Feb 2021 10:59:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Fo8kxQ4qJJM2hMS9tJdOXhE6q1LoinqW4MyTVHjxcOw=; b=CLHgpxxjJYDOkkwfeeXr3UWZy8
 YgygNqkr8I/98CvTg27ZHKJTJE/xeF5xcgzcDlpcKQvKC6XMJqWGTQufmMBX6Rj7/RRCqkvDOEufA
 /rQyYpNY4KMzEecrESbSHcFjltMzLU7aDA/2eclvtzjdDKYRBiqLGkWbm3OrIqCheLYc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Fo8kxQ4qJJM2hMS9tJdOXhE6q1LoinqW4MyTVHjxcOw=; b=FRvwlMUgWPHfy4Bche0SBafiPI
 9IhUGyDRoZFexuPsYzm3adNqPbhOIbakq8n8pKHBmac5siUGpvrPkkbIL6r0HgNui6Rp4obvHrVLe
 CZxrOdO8UDZ4ZyoiumIumYK9k/Ui2rTPCYyolKNo6LEdMgnItv948Hh1zZ+rP8M19mww=;
Received: from mail-wm1-f47.google.com ([209.85.128.47])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1lFaqV-006AP3-IB
 for kgdb-bugreport@lists.sourceforge.net; Fri, 26 Feb 2021 10:59:51 +0000
Received: by mail-wm1-f47.google.com with SMTP id o16so7410635wmh.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 26 Feb 2021 02:59:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Fo8kxQ4qJJM2hMS9tJdOXhE6q1LoinqW4MyTVHjxcOw=;
 b=fy3n8m8JuruG8diPmtODUBtZ9jgV5geGqIpBAnjyravc3vlzUzvKO+U+ziDxxYhoWp
 8qdEBObBKdD5itNFFzmrmGG3+i73ZkMEZrvgSLxRttM1rXRoHm+nbE5GuyMNqzNdwELy
 10rDXm2uuX3rc8G7p5iGvc/7Z4zAqxsOPKC5bc3+AZCL/PQgEHrmwvyA6YQR1HRSa3aA
 cHijBp75rLRcqH06EkcyR4P6t0ZMhIHOSDRRYfmqMSCBlINdbPoYF1OErRHe85sLImbR
 zofsY5586afBxyVd+dY1DpI1HOf+k7HA0EMLxb87r89Xs8GeLL8YhIrCeDy/BMMZ78Yb
 pfhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Fo8kxQ4qJJM2hMS9tJdOXhE6q1LoinqW4MyTVHjxcOw=;
 b=Y0v/+noe/ADS9bkBm6l3S29DN3zFOELcfZ44uwIeGS7n4DNq4zlueUvL27bhHy8DkB
 XDKYUP+HHndtMoI/GwkWaln4CHr9Ng/OzuowHFby+0EiFe+Tz5mZ6I0j+Bwma2Ux+IiR
 vMkKMc6tUPVOhLiQMafoqx1+A+s1qctlvjlJbv8DxIt9DYWdBI4y0+eacKcdFLwoCJsj
 frzUpRw3R0rpxjCHZkUiQ57qR2ZAm5r/uSz8Sqe1I7pvDbiRMutDzFgs7UUCImQ84Yqk
 02tNDs1hgL2JkAedVe7/Gt7wpGSBYqVCsELqwnbQ2Do3YV/XAAL7WXEc9MgdpW3U+yb7
 OV3Q==
X-Gm-Message-State: AOAM530WFGZBoZpmE3jsUT6V6+znMuKQoAcp1+q9pBbl4u2YjH+JGmYv
 eEnpk7d1yRoTGXfmiklgMvPIeQ==
X-Google-Smtp-Source: ABdhPJwIOJ6fFvVSJ5kBYtd2psAXOTCzGWFDo3o2VutegQrMaZI2qchJbhUSDGWDUWFvNSRlxhhfyg==
X-Received: by 2002:a1c:4342:: with SMTP id q63mr2231079wma.112.1614337177200; 
 Fri, 26 Feb 2021 02:59:37 -0800 (PST)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id c2sm13067929wrx.70.2021.02.26.02.59.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 02:59:36 -0800 (PST)
Date: Fri, 26 Feb 2021 10:59:34 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Sumit Garg <sumit.garg@linaro.org>
Message-ID: <20210226105934.gmppt6kubfadv4uf@maple.lan>
References: <20210226095306.1236539-1-sumit.garg@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210226095306.1236539-1-sumit.garg@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.47 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.47 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1lFaqV-006AP3-IB
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

On Fri, Feb 26, 2021 at 03:23:06PM +0530, Sumit Garg wrote:
> Currently the only user for debug heap is kdbnearsym() which can be
> modified to rather ask the caller to supply a buffer for symbol name.
> So do that and modify kdbnearsym() callers to pass a symbol name buffer
> allocated statically and hence remove custom debug heap allocator.

Why make the callers do this?

The LRU buffers were managed inside kdbnearsym() why does switching to
an approach with a single buffer require us to push that buffer out to
the callers?


> diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
> index 9d69169582c6..6efe9ec53906 100644
> --- a/kernel/debug/kdb/kdb_main.c
> +++ b/kernel/debug/kdb/kdb_main.c
> @@ -526,6 +526,7 @@ int kdbgetaddrarg(int argc, const char **argv, int *nextarg,

The documentation comment for this function has not been updated to
describe the new contract on callers of this function (e.g. if they
consume the symbol name they must do so before calling kdbgetaddrarg()
(and maybe kdbnearsym() again).


>  	char symbol = '\0';
>  	char *cp;
>  	kdb_symtab_t symtab;
> +	static char namebuf[KSYM_NAME_LEN];
>  
>  	/*
>  	 * If the enable flags prohibit both arbitrary memory access
> diff --git a/kernel/debug/kdb/kdb_support.c b/kernel/debug/kdb/kdb_support.c
> index b59aad1f0b55..9b907a84f2db 100644
> --- a/kernel/debug/kdb/kdb_support.c
> +++ b/kernel/debug/kdb/kdb_support.c
> @@ -57,8 +57,6 @@ int kdbgetsymval(const char *symname, kdb_symtab_t *symtab)
>  }
>  EXPORT_SYMBOL(kdbgetsymval);
>  
> -static char *kdb_name_table[100];	/* arbitrary size */
> -
>  /*
>   * kdbnearsym -	Return the name of the symbol with the nearest address
>   *	less than 'addr'.

Again the documentation comment has not been updated and, in this case,
is now misleading.

If we move the static buffer here then the remarks section on this
function is a really good place to describe what the callers must do to
manage the static buffer safely as well as a convenient place to mention
that we tolerate the reuse of the static buffer if kdb is re-entered
becase a) kdb is broken if that happens and b) we are crash resilient
if if does.


> @@ -79,13 +77,11 @@ static char *kdb_name_table[100];	/* arbitrary size */
>   *	hold active strings, no kdb caller of kdbnearsym makes more
>   *	than ~20 later calls before using a saved value.
>   */
> -int kdbnearsym(unsigned long addr, kdb_symtab_t *symtab)
> +int kdbnearsym(unsigned long addr, kdb_symtab_t *symtab, char *namebuf)

As above, I don't understand why we need to add namebuf here. I think
the prototype can remain the same.

Think of it simple that we have reduce the cache from having 100 entries
to having just 1 ;-) .


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
