Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BBFBC31D7E3
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 17 Feb 2021 12:06:57 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1lCKfY-0005N2-It
	for lists+kgdb-bugreport@lfdr.de; Wed, 17 Feb 2021 11:06:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1lCKfX-0005Mf-Ab
 for kgdb-bugreport@lists.sourceforge.net; Wed, 17 Feb 2021 11:06:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MwS831m1n6psR45EVgkCf+b/AQlrJ1Z/xieizsG7Xng=; b=KFXP3xG/kkPjf/C05MJR1V1mzC
 FRNuTQxsameWs33k1TFxAd1eQZJbgsfH/o3v3hbUBE5Eckb1tErAfd+buJmbB5uC5AetVXC1cOA+z
 Tv67Duf1QfAujNwST1wVJyDdZG5woXEcS3ssR8E3/X4xZ5duk7a8y3yLSwDjg7zZWGnE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MwS831m1n6psR45EVgkCf+b/AQlrJ1Z/xieizsG7Xng=; b=Rtc6c/PWc4yvqOOu+Xm0DBcERC
 xK420PhtjUkaUnfOENeHFeRHU67dztI62uNuRu4GXPPwr0L7KZTUASE2087HN7lyaOZvl6u6z8Oks
 i5YpQcyVkxpBebhXmJA/M/sA5d9oj7uGd+a1QkgUK3QTPd05ZKYip6ZtNfMJHzrb/K24=;
Received: from mail-lf1-f46.google.com ([209.85.167.46])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1lCKfM-00C9sd-PL
 for kgdb-bugreport@lists.sourceforge.net; Wed, 17 Feb 2021 11:06:55 +0000
Received: by mail-lf1-f46.google.com with SMTP id z11so20706306lfb.9
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 17 Feb 2021 03:06:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MwS831m1n6psR45EVgkCf+b/AQlrJ1Z/xieizsG7Xng=;
 b=D5fPkxhxdXGPtuBy7fS3LPZqJcgpEXb0+HlnxyRwfgihyLkIW3AJiW8nkodxy7By2I
 0iC6/ta7s16xMKKrgLgRiuw/e6vyzCv8q1RX37YKWQ83G765b1GFj/bhwug6CyiG+O8W
 9hjcKH6U8ndh2fx8R4MG+lPE28TsegzMrI9nKesJ7K38ueYuvMvbpKxmTuybZzX5l9y0
 5je2Vu2M8Jycf2JqlQZuwugcTMRUfm+ZdN6WoC0yKuRiYV5ghfyJaCRWx2ffUIH6CCow
 W+ZhPHkdTq//KhaEJ3QIL44ah6Fww4U8cL6XqyA/P2uDkQgruFOiFg/nrwMcUbSCgCWk
 6ToQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MwS831m1n6psR45EVgkCf+b/AQlrJ1Z/xieizsG7Xng=;
 b=mtNpig76Vcoc7qAMZqvavLwnUzelJoTgNsTFasSofHShXRcYjBzGYNmt2arY92mnEk
 jESINXIJhjcxRNICWBufkwchASrbExdZHL1dcOEnC/umt3UJCWmBbTeIUzYaiGDaRi3I
 yKLzFaMS7gG38i+iA5bXwGwU/lo+p0SPekUmDNMKhyNauCYQsNHQwMtANn0O+L2UlhUC
 y4VUiuB2TqFuO+s/jd+vz8lcTGVqRMG8Bxl+CpDimiD5ZyPb7FV6hNdUSkhlTN1Jib8h
 AKf+R6z/zTs73JwPlVuGVYqarBmjl7KL4Ccyn5bn1Biuywy0UShIkZrsWMl7CMSzWs/T
 Z+xA==
X-Gm-Message-State: AOAM530HHOKsGZWXzGad0Npsd0qYE8mIwrq/P8n7nOvRfxUNsaGbx2Hj
 ty2vjz+mbdcxYY/19ve/FaDvxsJct26aMyrzLCp1ZQ==
X-Google-Smtp-Source: ABdhPJwYy1FY3vO8pRA2SPYpVdqQHjNLkn9EQIvqD1qAzq8OcZlErQvrmfwwh4UCIAlqwTz4YM8VzTKz+vnqYPNbA/8=
X-Received: by 2002:ac2:5222:: with SMTP id i2mr3706138lfl.194.1613559998136; 
 Wed, 17 Feb 2021 03:06:38 -0800 (PST)
MIME-Version: 1.0
References: <20210204150210.3nv734ktyeljsa6c@maple.lan>
In-Reply-To: <20210204150210.3nv734ktyeljsa6c@maple.lan>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Wed, 17 Feb 2021 16:36:26 +0530
Message-ID: <CAFA6WYOdprGAe7d6ryLYpvC657qEGt1nRkpmuErDAk+msdp3DA@mail.gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: infradead.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.46 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.46 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1lCKfM-00C9sd-PL
Subject: Re: [Kgdb-bugreport] [peterz@infradead.org: Re: [PATCH] x86/kgdb:
 Allow removal of early BPs]
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>, alexandre.chartre@oracle.com,
 linux-kernel@i4.cs.fau.de,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, x86@kernel.org,
 adrian.hunter@intel.com, gustavoars@kernel.org, qy15sije@cip.cs.fau.de,
 mingo@redhat.com, bp@alien8.de, hpa@zytor.com,
 kgdb-bugreport@lists.sourceforge.net, Thomas Gleixner <tglx@linutronix.de>,
 ira.weiny@intel.com, rppt@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi Peter,

> On Mon, Dec 14, 2020 at 03:13:12PM +0100, Stefan Saecherl wrote:
>
> > One thing to consider when doing this is that code can go away during boot
> > (e.g. .init.text). Previously kgdb_arch_remove_breakpoint handled this case
> > gracefully by just having copy_to_kernel_nofault fail but if one then calls
> > text_poke_kgdb the system dies due to the BUG_ON we moved out of
> > __text_poke.  To avoid this __text_poke now returns an error in case of a
> > nonpresent code page and the error is handled at call site.
>
> So what if the page is reused and now exists again?
>
> We keep track of the init state, how about you look at that and not poke
> at .init.text after it's freed instead?
>

Makes sense. I'll see if I can patch the debug core to get an
architecture neutral fix for this.

-Sumit


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
