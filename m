Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9141A302408
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 25 Jan 2021 12:03:42 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1l3zen-0006ny-9v
	for lists+kgdb-bugreport@lfdr.de; Mon, 25 Jan 2021 11:03:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1l3zem-0006nm-PT
 for kgdb-bugreport@lists.sourceforge.net; Mon, 25 Jan 2021 11:03:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5N3+ddZ+UprxFCv5SFv09Xet+R2UhwSGKGhfnHT8k88=; b=WMDh+fp0BJQUuTUd2PQ3dl935F
 g45RZtGtmfr0I/ddcVPBQx4n2sAhl7xRvbQEx/QLqgMFW3dqMYM59b/jpG2GdM+EwDq9h89V5wzWo
 UbiSUvQvcr1z78rjMskSHU8dAX9oNVuhULU1cjGU9Wj/eRimKNnM3KPK1/npdWhITI8w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5N3+ddZ+UprxFCv5SFv09Xet+R2UhwSGKGhfnHT8k88=; b=ZL8VbJj8/UVp6dvCd4VlQanIBI
 aWBXAxR/qGEbCTRtvdi3LwJtbzVndaBLXC0VMAsCW03g0qrgh3WJfVFMcmV6OamKOFhwIcFUILsbd
 nLTvmmhyT/Oha7R9zwFH7QTLoHfNOWqUywLaEm6Iq8mzm2g8sDgOMUztDYzZwiDiX1gk=;
Received: from mail-wr1-f49.google.com ([209.85.221.49])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1l3zeZ-006VLw-Mr
 for kgdb-bugreport@lists.sourceforge.net; Mon, 25 Jan 2021 11:03:40 +0000
Received: by mail-wr1-f49.google.com with SMTP id v15so11839723wrx.4
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 25 Jan 2021 03:03:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=5N3+ddZ+UprxFCv5SFv09Xet+R2UhwSGKGhfnHT8k88=;
 b=oNjWfI52xwCta/21UEjtxGJae3VHH5Lx8WGtrM54mHMHg1P6pFuFOaoFvmzXy44aBF
 Ofp9tVM3HnfZrr8rYgsvffl9Gq2Y9D5lCx1WNXbH1aIvMaD5qcAU+0q9b1dWfb4q/G6r
 Eblfhk4nDEfEMfBllM6Uooq04sHoD2mLNUZQhL86Y4gCg8cyEvJgLk7xkQCCujiGgM6m
 m7pQEPIaWNU/f5T93mb0BXX7feS/Nu5c4JlrNwauNTb6K4FHSHedfqsfX5NmYG3xyhnE
 HyNN4qEnIRQQN0XazwQRehcXe6mXsjaZAL1siO84rw5r5lSvsR/4oerdAnpoT0QOkfGm
 MCTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5N3+ddZ+UprxFCv5SFv09Xet+R2UhwSGKGhfnHT8k88=;
 b=Kc6k4o+LEpO+rGXe+7SyI75D4Cxtd2+FDWqx5wpe8mcEUi77uDPEsYgTKdy4pLjGMp
 X81g1vkSQm1VOSg1XtgCPyKcnoWoWus4E6Qww4G4OOV8SPL97F0qjCFNgk1cZlX9oodM
 ggiFhqNlVF/TndOk12zbrEoz5OyV/gKltpGL8mQHK/avIx4w79b6QJN2JwP8TAvqWjrU
 sUZ14tyiBTqxq/rhptU2etrkaQ5BqSqBT1g7+bygweydIZFbkNpq5jH2jpSNeGb/zzCE
 shDrdYLZr0nZw1TmJpxhWshBfSAygG/Dg8f1oLB1zlQzsniN75plAG0MFXryoq5RVd6Q
 0akw==
X-Gm-Message-State: AOAM532otTR+q4InhrAdRDUlNZV6ZIMJ7ZfHy6xOsFHzdSVR9ooVSCFf
 CXLQg5rKQBb+knYdz4M2VjPO8pYngHlIMQ==
X-Google-Smtp-Source: ABdhPJwDr2YD7GGrjCIrhOnJUkrCd7lT1tjnHOw/JYV8oNb54ZWWO7PSkbN63E7dMdh0oKM1VwtarA==
X-Received: by 2002:adf:dd0d:: with SMTP id a13mr266235wrm.143.1611572594151; 
 Mon, 25 Jan 2021 03:03:14 -0800 (PST)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id d26sm1212479wrb.47.2021.01.25.03.03.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jan 2021 03:03:13 -0800 (PST)
Date: Mon, 25 Jan 2021 11:03:11 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Emil Renner Berthing <kernel@esmil.dk>
Message-ID: <20210125110311.pmqddpkh2c247tmx@maple.lan>
References: <20210123184237.6970-1-kernel@esmil.dk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210123184237.6970-1-kernel@esmil.dk>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.49 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.49 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1l3zeZ-006VLw-Mr
Subject: Re: [Kgdb-bugreport] [PATCH] kgdb: use new API for breakpoint
 tasklet
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
Cc: kgdb-bugreport@lists.sourceforge.net, Davidlohr Bueso <dbueso@suse.de>,
 linux-kernel@vger.kernel.org, Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Sat, Jan 23, 2021 at 07:42:37PM +0100, Emil Renner Berthing wrote:
> This converts the kgdb_tasklet_breakpoint to use the new API in
> commit 12cc923f1ccc ("tasklet: Introduce new initialization API")
> 
> The new API changes the argument passed to the callback function, but
> fortunately the argument isn't used so it is straight forward to use
> DECLARE_TASKLET() rather than DECLARE_TASKLET_OLD().

This patch overlaps with a more ambitious patch from Davidlohr.
Perhaps you can join in with the other thread since the discussion
there is unresolved. See:
https://lkml.org/lkml/2021/1/14/1320


Daniel.


> 
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> ---
>  kernel/debug/debug_core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
> index af6e8b4fb359..98d44c2bb0a4 100644
> --- a/kernel/debug/debug_core.c
> +++ b/kernel/debug/debug_core.c
> @@ -1090,13 +1090,13 @@ static void kgdb_unregister_callbacks(void)
>   * such as is the case with kgdboe, where calling a breakpoint in the
>   * I/O driver itself would be fatal.
>   */
> -static void kgdb_tasklet_bpt(unsigned long ing)
> +static void kgdb_tasklet_bpt(struct tasklet_struct *unused)
>  {
>  	kgdb_breakpoint();
>  	atomic_set(&kgdb_break_tasklet_var, 0);
>  }
>  
> -static DECLARE_TASKLET_OLD(kgdb_tasklet_breakpoint, kgdb_tasklet_bpt);
> +static DECLARE_TASKLET(kgdb_tasklet_breakpoint, kgdb_tasklet_bpt);
>  
>  void kgdb_schedule_breakpoint(void)
>  {
> -- 
> 2.30.0
> 


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
