Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F742F7686
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 15 Jan 2021 11:21:39 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1l0MEc-0005R7-KF
	for lists+kgdb-bugreport@lfdr.de; Fri, 15 Jan 2021 10:21:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1l0MEa-0005QR-K7
 for kgdb-bugreport@lists.sourceforge.net; Fri, 15 Jan 2021 10:21:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2V/bZEZDEb3V/fhFz7mUvhwT4BoeshuJFwVGruvza08=; b=Mn8pauQuICYMi5klMlLGF2tKCL
 IlJnO2sbPV4lD4ymz3iun2myih+RU52gnaz30Heh8u4C5BKgsGjJMKwMKNk9v5mZ1SBN6izQVqvVC
 2qIzRddKdSeaGAeVEGSSygZUFJgop5wS+9UmNKarxrPd3wleP0tYcLqc37tW+hZ6R+Qo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2V/bZEZDEb3V/fhFz7mUvhwT4BoeshuJFwVGruvza08=; b=VK099XUf+Ecop0uLehJwRTtBTX
 2HXz5XJICIyzhn/iOvRk4jZPsvQ8GiFmSJxQBiiANwbHsP3nf9mRbjcgI/FLogNcDU/JDnGCcdM/f
 BlQyk5RhhGyQPpjj7tCktPlYh5uLSBUB8ICfdLbcARSQQ8pKFn2k+DBDVtN6fH6qiXqM=;
Received: from mail-wr1-f42.google.com ([209.85.221.42])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1l0MEV-004JaH-7U
 for kgdb-bugreport@lists.sourceforge.net; Fri, 15 Jan 2021 10:21:36 +0000
Received: by mail-wr1-f42.google.com with SMTP id 6so1398506wri.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 15 Jan 2021 02:21:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=2V/bZEZDEb3V/fhFz7mUvhwT4BoeshuJFwVGruvza08=;
 b=aYjLFPlRopkC8U+z0eeACcdHQr5l3mA5gCPJGb7hvxxDKTu77jLMB36mJ9NcXLPXe9
 DN0RymKSRhrU8jSS/Dewg6Y281s+HKwVt325kb508PUn+bn0FrWwiU8L2EC4KT90r+vY
 +cRvk7ZkOh9a8IXv140J5YgXsZM9fnQcWQmKA9nRSMUdb82slzKK2N1WewCRChtQEgkj
 v4ZP6fwXlv23OfWd+byqBPULGtjjn7PR/KwMmgwroXNqXWK2tXUB+xSAaC9EElgp3EJC
 hUNBOFcfKV554D9fzkBhUqYZT8UCJmznSPHsscChw15ZbNp/KxOkMtky8bypYbAGGCaK
 LuFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2V/bZEZDEb3V/fhFz7mUvhwT4BoeshuJFwVGruvza08=;
 b=jYSxOLl/JQLzWHhkTNXJ1PedTX4diCLfscrsx1Tuu2K9RmHhDkkbIqrwYwkiuJDogm
 cA9MF0I4zqRrV2IOmLnpfsBCK2FiM3LVcCN1QHHziF14ir+zPqB01xIRPzyhNi4GQxcu
 r34YZP75Uk3q+mGn67vorYyI4rL2WJ+INPzgXqkndnrODXtFs0qVafEdfqNvmoY46JJg
 odj0xBJajZYTOGIPO93xRM6d7WGlysZ9PTPlkkHDzaaV0W1py+PuGy388xvcx9EzRhdP
 3b86Ga5bMK/AjCXIrRUTn5XkxxwiQCY1I1dS3c+4ig54cZgnz0mToXxDenkSw8I1TIaq
 PdKw==
X-Gm-Message-State: AOAM5317OgUEmv++28aJcJ2/EE3DHbU4Vm3aoKT4HsQ6bjc6KB6ywpP7
 hhNDALEcf2JbxEwtRdTDqXahPw==
X-Google-Smtp-Source: ABdhPJwakoU+7BSQGbhR1JfvHegL+hWVJpGp1oN3cDW5tg3nshzdGm4R96q2lqQmaHmjIqHM8lN3Gg==
X-Received: by 2002:adf:e410:: with SMTP id g16mr12476278wrm.364.1610706077647; 
 Fri, 15 Jan 2021 02:21:17 -0800 (PST)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id o20sm1876407wmm.24.2021.01.15.02.21.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 02:21:17 -0800 (PST)
Date: Fri, 15 Jan 2021 10:21:15 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Davidlohr Bueso <dave@stgolabs.net>
Message-ID: <20210115102115.twv3oy3pmnhdejij@maple.lan>
References: <20210115001344.117108-1-dave@stgolabs.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210115001344.117108-1-dave@stgolabs.net>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.42 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: suse.de]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.42 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1l0MEV-004JaH-7U
Subject: Re: [Kgdb-bugreport] [PATCH] kgdb: Schedule breakpoints via
 workqueue
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
 linux-kernel@vger.kernel.org, jason.wessel@windriver.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Thu, Jan 14, 2021 at 04:13:44PM -0800, Davidlohr Bueso wrote:
> The original functionality was added back in:
> 
>     1cee5e35f15 (kgdb: Add the ability to schedule a breakpoint via a tasklet)
> 
> However tasklets have long been deprecated as being too heavy on
> the system by running in irq context - and this is not a performance
> critical path. If a higher priority process wants to run, it must
> wait for the tasklet to finish before doing so. Instead, generate
> the breakpoint exception in process context.

I don't agree that "this is not a performance critical path".

kgdb is a stop-the-world debugger: if the developer trying to understand
the system behaviour has commanded the system to halt then that is what
it should be doing. It should not be scheduling tasks that are not
necessary to bring the system a halt.

In other words this code is using tasklets *specifically* to benefit
from their weird calling context.

However I am aware the way the wind is blowing w.r.t. tasklets
and...

> Signed-off-by: Davidlohr Bueso <dbueso@suse.de>
> ---
> Compile-tested only.

... this code can only ever be compile tested since AFAIK it has no
in-kernel callers.

There is a (still maintained) out-of-tree user that provides
kgdb-over-ethernet using the netpoll API. It must defer the stop to a
tasklet to avoid problems with netpoll running alongside the RX handler.

Whilst I have some sympathy, that code has been out-of-tree for more
than 10 years and I don't recall any serious attempt to upstream it at
any point in the last five.

So unless someone yells (convincingly) perhaps it's time to rip this
out and help prepare for a tasklet-free future?


Daniel.


> 
>  kernel/debug/debug_core.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
> index af6e8b4fb359..e1ff974c6b6f 100644
> --- a/kernel/debug/debug_core.c
> +++ b/kernel/debug/debug_core.c
> @@ -119,7 +119,7 @@ static DEFINE_RAW_SPINLOCK(dbg_slave_lock);
>   */
>  static atomic_t			masters_in_kgdb;
>  static atomic_t			slaves_in_kgdb;
> -static atomic_t			kgdb_break_tasklet_var;
> +static atomic_t			kgdb_break_work_var;
>  atomic_t			kgdb_setting_breakpoint;
>  
>  struct task_struct		*kgdb_usethread;
> @@ -1085,27 +1085,27 @@ static void kgdb_unregister_callbacks(void)
>  }
>  
>  /*
> - * There are times a tasklet needs to be used vs a compiled in
> + * There are times a workqueue needs to be used vs a compiled in
>   * break point so as to cause an exception outside a kgdb I/O module,
>   * such as is the case with kgdboe, where calling a breakpoint in the
>   * I/O driver itself would be fatal.
>   */
> -static void kgdb_tasklet_bpt(unsigned long ing)
> +static void kgdb_work_bpt(struct work_struct *unused)
>  {
>  	kgdb_breakpoint();
> -	atomic_set(&kgdb_break_tasklet_var, 0);
> +	atomic_set(&kgdb_break_work_var, 0);
>  }
>  
> -static DECLARE_TASKLET_OLD(kgdb_tasklet_breakpoint, kgdb_tasklet_bpt);
> +static DECLARE_WORK(kgdb_async_breakpoint, kgdb_work_bpt);
>  
>  void kgdb_schedule_breakpoint(void)
>  {
> -	if (atomic_read(&kgdb_break_tasklet_var) ||
> +	if (atomic_read(&kgdb_break_work_var) ||
>  		atomic_read(&kgdb_active) != -1 ||
>  		atomic_read(&kgdb_setting_breakpoint))
>  		return;
> -	atomic_inc(&kgdb_break_tasklet_var);
> -	tasklet_schedule(&kgdb_tasklet_breakpoint);
> +	atomic_inc(&kgdb_break_work_var);
> +	schedule_work(&kgdb_async_breakpoint);
>  }
>  EXPORT_SYMBOL_GPL(kgdb_schedule_breakpoint);
>  
> -- 
> 2.26.2
> 


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
