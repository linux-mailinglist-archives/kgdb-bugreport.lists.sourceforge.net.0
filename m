Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 753B139447A
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 28 May 2021 16:50:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1lmdoL-0006Yw-Tz
	for lists+kgdb-bugreport@lfdr.de; Fri, 28 May 2021 14:50:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1lmdoL-0006Yj-1o
 for kgdb-bugreport@lists.sourceforge.net; Fri, 28 May 2021 14:50:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=k4/Q9LKJZ/p6Cfz4YScBzLWuD3IoHybG41Fusz0viNw=; b=RLsTsnKPwyPbcny3/2vny0isKx
 gBz1c4CN2mb8kioJ3u3vdUfqJZ2Tx9D11auv9j+vmwYJDBJMtAz+siJOSSKBKWPt+7OkOprlTp0WQ
 Yrk5IY4VbLJRet6kiXBMSZTPPVMY90ygMKIVn9IJZDvr2Xroxea8UYR1ybPQ3bjwcwvg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=k4/Q9LKJZ/p6Cfz4YScBzLWuD3IoHybG41Fusz0viNw=; b=dw19Rt50S2QzyRVlXBDdxKG5za
 YTZQNZzpI7I78fFxtf3I26ia9KGd1gi6a/6UKn1tEC24qnuMchKJb+fXocOADSN9Q8tcxrSD+3k+m
 V9w5IejxzLZv7S405LktzrSgBoekryl2knOHq4W8NXpGTiRs2b6wGCslPM6MLQ6GCQN0=;
Received: from mail-wm1-f52.google.com ([209.85.128.52])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1lmdoH-0002gI-UQ
 for kgdb-bugreport@lists.sourceforge.net; Fri, 28 May 2021 14:50:05 +0000
Received: by mail-wm1-f52.google.com with SMTP id
 l11-20020a05600c4f0bb029017a7cd488f5so2582012wmq.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 28 May 2021 07:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=k4/Q9LKJZ/p6Cfz4YScBzLWuD3IoHybG41Fusz0viNw=;
 b=DjqQFgPMrmgF8ovO8dwMR4Nfxhev3NPadgHxm1SDIFyXXyUwa8KmTLbkwDNXfKAM6e
 p05dlo8Ik9Z8QMaHhPW1N5Oe4p9jKMSXbXNkE0YHyqhab5nMGz9AmG6mAq7uk54J6BjS
 kmciIFCM3oFeFeTLJ+IT+unKBzlbwZEGmxWeDVjebizU/pNUQq9O+pnNYuWQ0FbdhdKG
 dF35OtPqiweR5FY3x5MOdr7B29DeWnJIsgmupQWchKK+87/hl/DVpIkMgg209sAEKl2h
 LhnnyS0/RpjKfC0Ld9Ac7lTUv+b9pWkogobWVDsVuFiQI9S/OxP1+Ot266WSPUznzsKL
 p1Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=k4/Q9LKJZ/p6Cfz4YScBzLWuD3IoHybG41Fusz0viNw=;
 b=PrBFS+eQ/NUS3zJ2FYeKJk1KMl1qwKq4/Q/XnJFKgSeNe6WphEVceAe3L9n5r+NslM
 UsxqhNZMYAs1BI5jE5Fu6nil7SXV8C5FIt7opPeGiYJN099nLZSAmuDr5qOUY2Netqza
 xJrbNVqocF6FT/j7+3a0ENporT/eIkZ2tRoKAF2FzE11JIRp+GHg5TsS66exm3MDoDim
 B7TRXevlNP8kiJFUI8tpucMZ5r0iXFmt1LRy7y8odaymcZe6zCiIHCPeOrQ8zTUlEkAg
 YnnYwCcWXCdE3OK2cVlTmXPKmsp4OOySaPk+xp3h+ETxEz1v1QozL6GZdVPeK11lYCvZ
 SRpA==
X-Gm-Message-State: AOAM530LS96MyY0ZPGre2rFI9KBlTXuftHeHtayNG5jqMEj6ENi1fVu8
 jObdCFB+hvPY8xJJjcw0gEPrMQ==
X-Google-Smtp-Source: ABdhPJxIiUPehbrKrAqkbtQEM9myk7dxHYdKgdQo+sg6gS7VxEodQks76xQP1JHtyeUljY3gF6MedQ==
X-Received: by 2002:a7b:c084:: with SMTP id r4mr8733938wmh.102.1622213395995; 
 Fri, 28 May 2021 07:49:55 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id 89sm626826wrq.14.2021.05.28.07.49.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 May 2021 07:49:55 -0700 (PDT)
Date: Fri, 28 May 2021 15:49:53 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Zhen Lei <thunder.leizhen@huawei.com>
Message-ID: <20210528144953.akwuf5nwky4kt3to@maple.lan>
References: <20210526035345.9113-1-thunder.leizhen@huawei.com>
 <20210526035345.9113-2-thunder.leizhen@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210526035345.9113-2-thunder.leizhen@huawei.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.52 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.52 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1lmdoH-0002gI-UQ
Subject: Re: [Kgdb-bugreport] [PATCH 1/1] kernel: fix numerous spelling
 mistakes
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 kgdb-bugreport <kgdb-bugreport@lists.sourceforge.net>,
 Balbir Singh <bsingharora@gmail.com>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Steffen Klassert <steffen.klassert@secunet.com>,
 Davidlohr Bueso <dave@stgolabs.net>,
 Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>,
 Daniel Jordan <daniel.m.jordan@oracle.com>, Ingo Molnar <mingo@redhat.com>,
 "Naveen N . Rao" <naveen.n.rao@linux.ibm.com>,
 Darren Hart <dvhart@infradead.org>, Eric Biederman <ebiederm@xmission.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Jason Wessel <jason.wessel@windriver.com>,
 linux-crypto <linux-crypto@vger.kernel.org>,
 John Stultz <john.stultz@linaro.org>, Thomas Gleixner <tglx@linutronix.de>,
 Barry Song <song.bao.hua@hisilicon.com>, Stephen Boyd <sboyd@kernel.org>,
 kexec <kexec@lists.infradead.org>, Oleg Nesterov <oleg@redhat.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>,
 Jessica Yu <jeyu@kernel.org>, Tejun Heo <tj@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, "David S . Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Wed, May 26, 2021 at 11:53:45AM +0800, Zhen Lei wrote:
> Fix some spelling mistakes in comments:
> suspeneded ==> suspended
> occuring ==> occurring
> wont ==> won't
> detatch ==> detach
> represntation ==> representation
> hexidecimal ==> hexadecimal
> delimeter ==> delimiter
> architecure ==> architecture
> accumalator ==> accumulator
> evertything ==> everything
> contingous ==> contiguous
> useable ==> usable
> musn't ==> mustn't
> alloed ==> allowed
> immmediately ==> immediately
> Allocted ==> Allocated
> noone ==> no one
> unparseable ==> unparsable
> dependend ==> dependent
> callled ==> called
> alreay ==> already
> childs ==> children
> implemention ==> implementation
> situration ==> situation
> overriden ==> overridden
> asynchonous ==> asynchronous
> accumalate ==> accumulate
> syncrhonized ==> synchronized
> therefor ==> therefore
> ther ==> their
> capabilites ==> capabilities
> lentgh ==> length
> watchog ==> watchdog
> assing ==> assign
> Retun ==> Return
> 
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
> ---
>  kernel/acct.c                  | 2 +-
>  kernel/context_tracking.c      | 2 +-
>  kernel/cpu.c                   | 2 +-
>  kernel/debug/debug_core.c      | 2 +-
>  kernel/debug/kdb/kdb_main.c    | 8 ++++----
>  kernel/debug/kdb/kdb_private.h | 2 +-

For these three files:

Acked-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
