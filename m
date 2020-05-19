Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE9B1D9488
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 19 May 2020 12:42:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jazhD-0006xM-7n
	for lists+kgdb-bugreport@lfdr.de; Tue, 19 May 2020 10:42:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1jazhC-0006wu-4P
 for kgdb-bugreport@lists.sourceforge.net; Tue, 19 May 2020 10:42:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GXxkCen/zIzWAVYZRGp0Kup7dkI0f7XaE2jW9ck8KnI=; b=EepgpU1CWNM9pT9aG7HicNahJC
 XD3YTmLIUb/SUNJmUhQeTJEzk+wpcCpNBUOOuw8CbrWg4/CKwMskF0AfcYyhlDZO4Qx+yXg81q6Em
 TJRbNgRWRfzN/GCvlXpBrPy4n3VrJ/yIn0TMVo8F6FkbrCPz6ei1PyHqpgBVlABWelE4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GXxkCen/zIzWAVYZRGp0Kup7dkI0f7XaE2jW9ck8KnI=; b=k8cIXPeT6YxNac33LsjdJHcy7V
 HqTXw4vlfrwjVnuzZbu3h0bqfyC/80IILyn1DtCqUwBJYF1QQjtOrEW+1bwiZV1QzmmbuVGbhTu86
 qc5q/+v6M06w6aohDjdnC3ApRVE6bkoKpRQGmoXSmRzZiR2l2dMh2DjASKYe7LlD5CwQ=;
Received: from mail-wr1-f65.google.com ([209.85.221.65])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jazh9-007E0F-UJ
 for kgdb-bugreport@lists.sourceforge.net; Tue, 19 May 2020 10:42:02 +0000
Received: by mail-wr1-f65.google.com with SMTP id s8so15317025wrt.9
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 19 May 2020 03:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=GXxkCen/zIzWAVYZRGp0Kup7dkI0f7XaE2jW9ck8KnI=;
 b=JHkOp+M/CjqaKJTgNHhegxOFjABee6pxv/RQmCGH8DsqeIZPYJ3K4FZKqZulAy0HnL
 UXdYoQlgHmGcqnMOpwSqMmkMRtdJXNhwNaIjk5/eUJkilqDDu0dGrtbG3l4FZpIfCqxD
 P+jVEn2HnPKwGjZBTr8ffsIG1sP3UcN9yfyI5vSkFkC8SspwYBv45WxrRWZN42OUkYQM
 28pqdUQv4bT1JiQnHMd0ceYyvUXYeOZUKAC/w0vNnhsr16prafI0vcIxBREhNB7/PuAw
 wTLrbpFptATBG3z7qz8tTOCsA7ZySrJE8fqrcpeUaF7WntcARbhTbm8tE/de06BIksGj
 bjKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=GXxkCen/zIzWAVYZRGp0Kup7dkI0f7XaE2jW9ck8KnI=;
 b=ePY+YGaT4L7RUdlWcif5J1g6PnMGHRJc1xj4EvwT5vc6V6OWS2E/pYfJOXH4deJnQk
 HYs+RoZLhzG/lnsUPCPZhkgHeH56+driHuo5YHMxKUft4C4LUHzbzICnUc++wzUVcKTh
 aPCvHW6plBTZIaCb+kyWg7PxRF2J9mSVGokl9i0L+STInMxMCeTg3rzwNwAIq1Wb0JkF
 G5T852DVfpuafnI5KbmR4QidOZAg4jMjSKnzaOTQBWhD4+JV3McBKBVY23UtGl0aO6NH
 hUcRZU3ysldlSFfPh5BSalAj4IkUnixx4BoRc8Y3l/rXOqHiKI5VU5Za2aFMwrYBZbw1
 T5eQ==
X-Gm-Message-State: AOAM533N3yoGG7AGBt/n+u+syJLiG68o6k8cNrLVQm6qLApTht/lMaRO
 xz8AYDvhjFZgk1+/oVaMpPLBlw==
X-Google-Smtp-Source: ABdhPJxI9hHAtjBprvirEkNxdsK9H7V1Yykq/ZJEdnUyCFW3JFUs2vMu+RhotxOD5DsAjFlPFptI7g==
X-Received: by 2002:a5d:6803:: with SMTP id w3mr25138459wru.151.1589884913554; 
 Tue, 19 May 2020 03:41:53 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id g187sm3368484wmf.30.2020.05.19.03.41.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 May 2020 03:41:52 -0700 (PDT)
Date: Tue, 19 May 2020 11:41:51 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Douglas Anderson <dianders@chromium.org>
Message-ID: <20200519104151.6evv3hizm5dbjjq2@holly.lan>
References: <20200507153444.1.I70e0d4fd46d5ed2aaf0c98a355e8e1b7a5bb7e4e@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200507153444.1.I70e0d4fd46d5ed2aaf0c98a355e8e1b7a5bb7e4e@changeid>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.65 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.65 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jazh9-007E0F-UJ
Subject: Re: [Kgdb-bugreport] [PATCH] kgdb: Avoid suspicious RCU usage
 warning
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
 Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Thu, May 07, 2020 at 03:53:58PM -0700, Douglas Anderson wrote:
> At times when I'm using kgdb I see a splat on my console about
> suspicious RCU usage.  I managed to come up with a case that could
> reproduce this that looked like this:
> 
>   WARNING: suspicious RCU usage
>   5.7.0-rc4+ #609 Not tainted
>   -----------------------------
>   kernel/pid.c:395 find_task_by_pid_ns() needs rcu_read_lock() protection!
> 
>   other info that might help us debug this:
> 
>     rcu_scheduler_active = 2, debug_locks = 1
>   3 locks held by swapper/0/1:
>    #0: ffffff81b6b8e988 (&dev->mutex){....}-{3:3}, at: __device_attach+0x40/0x13c
>    #1: ffffffd01109e9e8 (dbg_master_lock){....}-{2:2}, at: kgdb_cpu_enter+0x20c/0x7ac
>    #2: ffffffd01109ea90 (dbg_slave_lock){....}-{2:2}, at: kgdb_cpu_enter+0x3ec/0x7ac
> 
>   stack backtrace:
>   CPU: 7 PID: 1 Comm: swapper/0 Not tainted 5.7.0-rc4+ #609
>   Hardware name: Google Cheza (rev3+) (DT)
>   Call trace:
>    dump_backtrace+0x0/0x1b8
>    show_stack+0x1c/0x24
>    dump_stack+0xd4/0x134
>    lockdep_rcu_suspicious+0xf0/0x100
>    find_task_by_pid_ns+0x5c/0x80
>    getthread+0x8c/0xb0
>    gdb_serial_stub+0x9d4/0xd04
>    kgdb_cpu_enter+0x284/0x7ac
>    kgdb_handle_exception+0x174/0x20c
>    kgdb_brk_fn+0x24/0x30
>    call_break_hook+0x6c/0x7c
>    brk_handler+0x20/0x5c
>    do_debug_exception+0x1c8/0x22c
>    el1_sync_handler+0x3c/0xe4
>    el1_sync+0x7c/0x100
>    rpmh_rsc_probe+0x38/0x420
>    platform_drv_probe+0x94/0xb4
>    really_probe+0x134/0x300
>    driver_probe_device+0x68/0x100
>    __device_attach_driver+0x90/0xa8
>    bus_for_each_drv+0x84/0xcc
>    __device_attach+0xb4/0x13c
>    device_initial_probe+0x18/0x20
>    bus_probe_device+0x38/0x98
>    device_add+0x38c/0x420
> 
> If I understand properly we should just be able to blanket kgdb under
> one big RCU read lock and the problem should go away.  We'll add it to
> the beast-of-a-function known as kgdb_cpu_enter().
> 
> With this I no longer get any splats and things seem to work fine.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

In principle this looks OK but I'm curious why we don't cuddle these
calls up to the local interrupt locking (and also whether we want to
keep hold of the lock during stepping). If nothing else that would make
review easier.


Daniel.


> ---
> 
>  kernel/debug/debug_core.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
> index 2b7c9b67931d..5155cf06731b 100644
> --- a/kernel/debug/debug_core.c
> +++ b/kernel/debug/debug_core.c
> @@ -564,6 +564,8 @@ static int kgdb_cpu_enter(struct kgdb_state *ks, struct pt_regs *regs,
>  	int online_cpus = num_online_cpus();
>  	u64 time_left;
>  
> +	rcu_read_lock();
> +
>  	kgdb_info[ks->cpu].enter_kgdb++;
>  	kgdb_info[ks->cpu].exception_state |= exception_state;
>  
> @@ -635,6 +637,7 @@ static int kgdb_cpu_enter(struct kgdb_state *ks, struct pt_regs *regs,
>  			atomic_dec(&slaves_in_kgdb);
>  			dbg_touch_watchdogs();
>  			local_irq_restore(flags);
> +			rcu_read_unlock();
>  			return 0;
>  		}
>  		cpu_relax();
> @@ -773,6 +776,8 @@ static int kgdb_cpu_enter(struct kgdb_state *ks, struct pt_regs *regs,
>  	dbg_touch_watchdogs();
>  	local_irq_restore(flags);
>  
> +	rcu_read_unlock();
> +
>  	return kgdb_info[cpu].ret_state;
>  }
>  
> -- 
> 2.26.2.645.ge9eca65c58-goog
> 


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
