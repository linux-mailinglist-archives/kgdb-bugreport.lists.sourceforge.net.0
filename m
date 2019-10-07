Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A21CE52C
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  7 Oct 2019 16:24:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1iHTwS-00013d-7P
	for lists+kgdb-bugreport@lfdr.de; Mon, 07 Oct 2019 14:24:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1iHTwR-00013I-5a
 for kgdb-bugreport@lists.sourceforge.net; Mon, 07 Oct 2019 14:24:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HIwE2HHTxyYipXLKEIdRSNS1N2zOO5yFZjncgRSQ/Cg=; b=SmrnHxOUD/YJNpf4vYNJ8ZVWmh
 QIfxynXe5lIAKUZqNdcgMb2XL9SU4+ceVZBtlKmwF3DV48Y22o533d0D2nUHwg92T2i93foJcxftN
 J9H8gwWbDOS/JZyC+QQNc9jDIuI8NaoZ57xJSa3frLoRARupda+QSakxbyioetPHaqCs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HIwE2HHTxyYipXLKEIdRSNS1N2zOO5yFZjncgRSQ/Cg=; b=Z0qeyqryJjUTIKBxWOTnnsjnoC
 SP1QcWwBMk7LG1zFDRonmBpaHZS6xEC6N4+Cm46dASrIjhdMkD+sl652H/ov1Nkjkwdc4QYgJXjR6
 coXI5TjJjTEWiVX4tJXRTUjLAsvUz3+nACB+duGrIxtcXEd+Uxgyg5h/A6gA037FBfh8=;
Received: from mail-wm1-f65.google.com ([209.85.128.65])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iHTwL-0028aw-ND
 for kgdb-bugreport@lists.sourceforge.net; Mon, 07 Oct 2019 14:24:51 +0000
Received: by mail-wm1-f65.google.com with SMTP id y21so12576484wmi.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 07 Oct 2019 07:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=HIwE2HHTxyYipXLKEIdRSNS1N2zOO5yFZjncgRSQ/Cg=;
 b=vYkaQS7u78p1GsL6JJGBdxcIvh5hek2IrzvnqT2ZXhICOZ/MAjAp0Pv/2ENTHPra+9
 gbVRPP2QdIlUb6QBO0E5iebQOmzeXRXcvVKSFzp75tKK9kmYGfaO6ih+FyihVSridZQE
 cDasd05kgT5xeyOHoLsrzcje1WLpQjxQn3T977FXRyG6UGxqGime9+YYzgxiLOlGpc49
 cfI79M0Tfowen9/T+IyrBYG+uBBy+SABuAuOaPYJhnCQmYPoBRPRzHe1v57XXTdDXI0R
 RX+UQtnMTqEVzglgSBk9l31VFteuTu4NDt6ucS96mvn6ur56tKLPNlmIHqPAPtP8NXxo
 o71Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=HIwE2HHTxyYipXLKEIdRSNS1N2zOO5yFZjncgRSQ/Cg=;
 b=QLDLLOCxiY1JvM59HN+XUR47DIwzaPBAXt1wTy1+Zeff9rzFTT8InPVnlDRhzEs0+4
 6CmKAVbrHqAPgy0QxsGbK11Q0Ra84zDpw1wY2neSy+g3XVHGhjX6Dgi1knxBp98YfqXZ
 RRgWPIZ1W9ctGRPIKFJ8D9TISkB0SfZ0pEs/hsBB/lJoabIZqsEGpl8KBwp46GH2FH9z
 ejFKm1XlqDtx6+vwaK5SjDfKRUMUVeTZ/c3fSUKTg+Glxcn/O7yilqxSHDvCRSP4PeGq
 DJVYgFZsQGSx7RxCXILr/PrrWTceEtB2eiKdD4b/FZ19eHR+9Gtw4RXyXgL1fEPEWdnk
 PvQA==
X-Gm-Message-State: APjAAAUNB769qf4uroOkySmXtrbQQNMacHPzS13+hvShfUatkNQmUPGw
 isNwN93R4SssTgBFyXE3hRMLW0M3NQ4=
X-Google-Smtp-Source: APXvYqznXn6Yn8jWOxAVikMeJSL6gPA5ufBWBMxd28ES2haKHtYLgj1t+x4kxFIRR6f37SF5CoTvHw==
X-Received: by 2002:a7b:c00e:: with SMTP id c14mr21020782wmb.60.1570456501994; 
 Mon, 07 Oct 2019 06:55:01 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id r2sm31671751wma.1.2019.10.07.06.55.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Oct 2019 06:55:01 -0700 (PDT)
Date: Mon, 7 Oct 2019 14:54:59 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Douglas Anderson <dianders@chromium.org>
Message-ID: <20191007135459.lj3qc2tqzcv3xcia@holly.lan>
References: <20190925200220.157670-1-dianders@chromium.org>
 <20190925125811.v3.3.Id33c06cbd1516b49820faccd80da01c7c4bf15c7@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190925125811.v3.3.Id33c06cbd1516b49820faccd80da01c7c4bf15c7@changeid>
User-Agent: NeoMutt/20180716
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.65 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.65 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iHTwL-0028aw-ND
Subject: Re: [Kgdb-bugreport] [PATCH v3 3/4] kdb: Fix "btc <cpu>" crash if
 the CPU didn't round up
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 kgdb-bugreport@lists.sourceforge.net,
 Jason Wessel <jason.wessel@windriver.com>, linux-kernel@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Wed, Sep 25, 2019 at 01:02:19PM -0700, Douglas Anderson wrote:
> 
> I noticed that when I did "btc <cpu>" and the CPU I passed in hadn't
> rounded up that I'd crash.  I was going to copy the same fix from
> commit 162bc7f5afd7 ("kdb: Don't back trace on a cpu that didn't round
> up") into the "not all the CPUs" case, but decided it'd be better to
> clean things up a little bit.
> 
> This consolidates the two code paths.  It is _slightly_ wasteful in in
> that the checks for "cpu" being too small or being offline isn't
> really needed when we're iterating over all online CPUs, but that
> really shouldn't hurt.  Better to have the same code path.
> 
> While at it, eliminate at least one slightly ugly (and totally
> needless) recursive use of kdb_parse().
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
> Changes in v3:
> - Patch ("kdb: Fix "btc <cpu>" crash if the CPU...") new for v3.
> 
> Changes in v2: None
> 
>  kernel/debug/kdb/kdb_bt.c | 61 ++++++++++++++++++++++-----------------
>  1 file changed, 34 insertions(+), 27 deletions(-)
> 
> diff --git a/kernel/debug/kdb/kdb_bt.c b/kernel/debug/kdb/kdb_bt.c
> index 120fc686c919..d9af139f9a31 100644
> --- a/kernel/debug/kdb/kdb_bt.c
> +++ b/kernel/debug/kdb/kdb_bt.c
> @@ -101,6 +101,27 @@ kdb_bt1(struct task_struct *p, unsigned long mask, bool btaprompt)
>  	return 0;
>  }
>  
> +static void
> +kdb_bt_cpu(unsigned long cpu)
> +{
> +	struct task_struct *kdb_tsk;
> +
> +	if (cpu >= num_possible_cpus() || !cpu_online(cpu)) {
> +		kdb_printf("WARNING: no process for cpu %ld\n", cpu);
> +		return;
> +	}
> +
> +	/* If a CPU failed to round up we could be here */
> +	kdb_tsk = KDB_TSK(cpu);
> +	if (!kdb_tsk) {
> +		kdb_printf("WARNING: no task for cpu %ld\n", cpu);
> +		return;
> +	}
> +
> +	kdb_set_current_task(kdb_tsk);
> +	kdb_bt1(kdb_tsk, ~0UL, false);
> +}
> +
>  int
>  kdb_bt(int argc, const char **argv)
>  {
> @@ -161,7 +182,6 @@ kdb_bt(int argc, const char **argv)
>  	} else if (strcmp(argv[0], "btc") == 0) {
>  		unsigned long cpu = ~0;
>  		struct task_struct *save_current_task = kdb_current_task;
> -		char buf[80];
>  		if (argc > 1)
>  			return KDB_ARGCOUNT;
>  		if (argc == 1) {
> @@ -169,35 +189,22 @@ kdb_bt(int argc, const char **argv)
>  			if (diag)
>  				return diag;
>  		}
> -		/* Recursive use of kdb_parse, do not use argv after
> -		 * this point */
> -		argv = NULL;
>  		if (cpu != ~0) {
> -			if (cpu >= num_possible_cpus() || !cpu_online(cpu)) {
> -				kdb_printf("no process for cpu %ld\n", cpu);
> -				return 0;
> -			}
> -			sprintf(buf, "btt 0x%px\n", KDB_TSK(cpu));
> -			kdb_parse(buf);
> -			return 0;
> -		}
> -		kdb_printf("btc: cpu status: ");
> -		kdb_parse("cpu\n");
> -		for_each_online_cpu(cpu) {
> -			void *kdb_tsk = KDB_TSK(cpu);
> -
> -			/* If a CPU failed to round up we could be here */
> -			if (!kdb_tsk) {
> -				kdb_printf("WARNING: no task for cpu %ld\n",
> -					   cpu);
> -				continue;
> +			kdb_bt_cpu(cpu);
> +		} else {
> +			/*
> +			 * Recursive use of kdb_parse, do not use argv after
> +			 * this point.
> +			 */
> +			argv = NULL;
> +			kdb_printf("btc: cpu status: ");
> +			kdb_parse("cpu\n");
> +			for_each_online_cpu(cpu) {
> +				kdb_bt_cpu(cpu);
> +				touch_nmi_watchdog();
>  			}
> -
> -			sprintf(buf, "btt 0x%px\n", kdb_tsk);
> -			kdb_parse(buf);
> -			touch_nmi_watchdog();
> +			kdb_set_current_task(save_current_task);
>  		}
> -		kdb_set_current_task(save_current_task);

Why does this move out into only one of the conditional branches?
Don't both of the above paths modify the current task?


Daniel.


>  		return 0;
>  	} else {
>  		if (argc) {
> -- 
> 2.23.0.351.gc4317032e6-goog
> 


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
