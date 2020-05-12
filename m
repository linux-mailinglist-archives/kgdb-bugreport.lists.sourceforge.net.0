Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6EC1CF70D
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 12 May 2020 16:25:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jYVr0-00078j-P5
	for lists+kgdb-bugreport@lfdr.de; Tue, 12 May 2020 14:25:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1jYVqz-00078J-Q4
 for kgdb-bugreport@lists.sourceforge.net; Tue, 12 May 2020 14:25:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Id76DUUx7BnCr5PksX/RIXDmuZEvMLrGK6iNbMFQn+M=; b=ZIVi5vDCgzxDU8LJTp5zKlS+CJ
 TNPAG58S/pIo/uUk34GuK0GgBSOlyLtlIHjmd5QVPiF3tltL/nxjOXxXdhvasvSEJ1c9yH7tjTE1j
 GeunQqqVrcWx2jbZ3NA6sTB+SYP7gHJbUiX+C5b7nNKelhD8YTk7E94w46QAbw4ZQXgA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Id76DUUx7BnCr5PksX/RIXDmuZEvMLrGK6iNbMFQn+M=; b=EiLQmYP/pVtMuTSV+ZdFeUv91N
 nsfb67fWny92I0C+1ZvqP9jpuocaXzLNta3i/Mn4kS6v9xgnyYf6lp6R4dWAsSbYCk4cooGs5N/aH
 8hdKdlcxtZ4DPYDNJ1oiH/nSD8jTL0VjWkoZHBgitRG4+qm7xom/hjsNj1ZF1TV7O2Mw=;
Received: from mail-wm1-f68.google.com ([209.85.128.68])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jYVqw-003ECY-Q5
 for kgdb-bugreport@lists.sourceforge.net; Tue, 12 May 2020 14:25:53 +0000
Received: by mail-wm1-f68.google.com with SMTP id w19so8809982wmc.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 12 May 2020 07:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Id76DUUx7BnCr5PksX/RIXDmuZEvMLrGK6iNbMFQn+M=;
 b=eQDZAPmTTPyiCe56SuT9EzeYjpzxoz1Hky2+xzFEQTSscBQvhvcOxcAiDgZjSfXiqx
 qAcIp1pinbm5IAAhK1KO2kD/zr+ekAOYCav+lfUOBKbFhvv+Q3yP2mGapHhY6QmdbZ7W
 or1/3gFQaJZOpUE4jo65P57NPBl1wO3Y5Tpa2r3CSSZDRHP5tyxNXpIifxop5u5GDUca
 DfMWpC+tBWbhQPsIts+F9FL1ippOzG70eajkhMGpU0Xm7SY/lguQBXTJy0//jcsi0hHH
 gm0SBaIfBEVZARsYTGDCikCjZLTBPo1NEXa5M+EC+p3DLFugr+PToE+XZZmWn/oI9xzo
 Xhmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Id76DUUx7BnCr5PksX/RIXDmuZEvMLrGK6iNbMFQn+M=;
 b=GyMuQw8BtXfMUmmYCXYJjjuP08irdGsYrNdvJviI9p2rKi0iaPBUg2IXJkcOeXufsM
 pK5iRE0VbeTv/+PU6YiWLeeCQnrzWpbYi8Fb7avKqTnMxr7lX1cAdEyA0trX57nqu4/e
 jhVLoaN3TFAEcuiXU92+Tbpd+DJcTa5okq2MwJsgKZsTEtqUOteQlVyKyOHrPJOkv/cN
 OALEz5wpEykT55L4+1I5lZWxmzIQLLL/VEZh9YyKLMnwcYNroSw24KcWOr798duscuNh
 4MUbLs1w3ulrHS0ohvYJ/BYVF5JPydlRjALSEExKsZjzU35AOpoErVBJPqrJJkXQrMQ8
 VRUQ==
X-Gm-Message-State: AGi0PubYmPaKF7EbyyroHDg+YPaLOhMAEJZFiRG4i0ATl9EhU6v4fqx9
 TpRQxwGMCqgt3goGPKUsYIVUTA==
X-Google-Smtp-Source: APiQypKv25eha3G11RcrJWFD7ghsZkSKgRpbG4Esl49WWvuGkAdPYPYmzLGk6Dp9On3WQUNUTsNf6g==
X-Received: by 2002:a7b:c413:: with SMTP id k19mr11635494wmi.124.1589293537286; 
 Tue, 12 May 2020 07:25:37 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id c19sm24088581wrb.89.2020.05.12.07.25.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 07:25:35 -0700 (PDT)
Date: Tue, 12 May 2020 15:25:33 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Sumit Garg <sumit.garg@linaro.org>
Message-ID: <20200512142533.ta4uejwmq5gchtlx@holly.lan>
References: <1589273314-12060-1-git-send-email-sumit.garg@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1589273314-12060-1-git-send-email-sumit.garg@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.68 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.68 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jYVqw-003ECY-Q5
Subject: Re: [Kgdb-bugreport] [PATCH] kgdb: Fix broken handling of printk()
 in NMI context
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
Cc: Petr Mladek <pmladek@suse.com>, arnd@arndb.de,
 Peter Zijlstra <peterz@infradead.org>, kgdb-bugreport@lists.sourceforge.net,
 Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org,
 jason.wessel@windriver.com, akpm@linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Tue, May 12, 2020 at 02:18:34PM +0530, Sumit Garg wrote:
> Since commit 42a0bb3f7138 ("printk/nmi: generic solution for safe printk
> in NMI"), kgdb entry in NMI context defaults to use safe NMI printk()

I didn't see the author on Cc: nor any of the folks whose hands it
passed through. It would definitely be good to involve them in this
discussion.


> which involves CPU specific buffers and deferred printk() until exit from
> NMI context.
> 
> But kgdb being a stop-the-world debugger, we don't want to defer printk()
> especially backtrace on corresponding CPUs. So instead switch to normal
> printk() mode in kgdb_cpu_enter() if entry is in NMI context.

So, firstly I should *definitely* take a mea cupla for not shouting
about this at the time (I was on Cc:... twice). Only thing I can say
confidently is that the test suite didn't yell about this and so I
didn't look at this as closely as I should have done (and that it
didn't yell is mostly because I'm still building out the test suite
coverage).

Anyhow...

This feels a little like we are smearing the printk() interception logic
across the kernel in ways that make things hard to read. If we accepted
this patch we then have, the new NMI interception logic, the old kdb
interception logic and some hacks in the kgdb trap handler to defang the
NMI interception logic and force the kdb logic to kick in.

Wouldn't it be better to migrate kdb interception logic up a couple of
levels so that it continues to function even when we are in nmi printk
mode. That way *all* the printk() interception code would end up in
one place.

Finally some clue description of how to provoke the problem would be
useful... that sort of things helps me to grow the test suite coverage.


Daniel.


> 
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> ---
> 
> Similar change was posted earlier specific to arm64 here [1]. But after
> discussions it emerged out that this broken handling of printk() in NMI
> context should be a common problem that is relevant to other archs as well.
> So fix this handling in kgdb_cpu_enter() as there can be multiple entry
> points to kgdb in NMI context.
> 
> [1] https://lkml.org/lkml/2020/4/24/328
> 
>  kernel/debug/debug_core.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
> index 2b7c9b6..ab2933f 100644
> --- a/kernel/debug/debug_core.c
> +++ b/kernel/debug/debug_core.c
> @@ -567,6 +567,15 @@ static int kgdb_cpu_enter(struct kgdb_state *ks, struct pt_regs *regs,
>  	kgdb_info[ks->cpu].enter_kgdb++;
>  	kgdb_info[ks->cpu].exception_state |= exception_state;
>  
> +	/*
> +	 * kgdb entry in NMI context defaults to use safe NMI printk() which
> +	 * involves CPU specific buffers and deferred printk() until exit from
> +	 * NMI context. But kgdb being a stop-the-world debugger, we don't want
> +	 * to defer printk(). So instead switch to normal printk() mode here.
> +	 */
> +	if (in_nmi())
> +		printk_nmi_exit();
> +
>  	if (exception_state == DCPU_WANT_MASTER)
>  		atomic_inc(&masters_in_kgdb);
>  	else
> @@ -635,6 +644,8 @@ static int kgdb_cpu_enter(struct kgdb_state *ks, struct pt_regs *regs,
>  			atomic_dec(&slaves_in_kgdb);
>  			dbg_touch_watchdogs();
>  			local_irq_restore(flags);
> +			if (in_nmi())
> +				printk_nmi_enter();
>  			return 0;
>  		}
>  		cpu_relax();
> @@ -772,6 +783,8 @@ static int kgdb_cpu_enter(struct kgdb_state *ks, struct pt_regs *regs,
>  	raw_spin_unlock(&dbg_master_lock);
>  	dbg_touch_watchdogs();
>  	local_irq_restore(flags);
> +	if (in_nmi())
> +		printk_nmi_enter();
>  
>  	return kgdb_info[cpu].ret_state;
>  }
> -- 
> 2.7.4
> 


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
