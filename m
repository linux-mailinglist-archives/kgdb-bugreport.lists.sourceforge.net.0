Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C9EFD1889AC
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 17 Mar 2020 17:01:07 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jEEeP-00077W-KF
	for lists+kgdb-bugreport@lfdr.de; Tue, 17 Mar 2020 16:01:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1jEEeO-00077L-8p
 for kgdb-bugreport@lists.sourceforge.net; Tue, 17 Mar 2020 16:01:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eAhbBL0CBHwTEuoSCE5w0pXR4TY8wKBETG1SIbtR2Sc=; b=C6qg00Y3708PwdTitM38RsLUoP
 /EmjRHYOLsxGgqGy/r/V4zhsMhIMiwiNuq9GIENcPyV/PhxDf2od4MrIMsRko/1iOFDTB0hYQIbwe
 +8MJMrwGSie+7DHX+2PU1q3ijc25TzLP5OtO3n+CguLgHLVI8GdAc2mHVGxjwdj/vPG0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eAhbBL0CBHwTEuoSCE5w0pXR4TY8wKBETG1SIbtR2Sc=; b=Yjm8o85cnd0u40WTGM1aqt91x/
 imP9XNB2YjKFpfw+mAZ866jccpvuNAmpIq+sZC34k38XfN4Puon2FkjdhMjGhBq6ycASxFvoFuXM9
 fm+GX5cVJ9BaGA55SlwIwEKSv3tHl+cYJLBZj4vsoFROJ4wbql6SFF0Ycqgm49ifqqZQ=;
Received: from mail-wr1-f65.google.com ([209.85.221.65])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jEEeI-009ei0-AI
 for kgdb-bugreport@lists.sourceforge.net; Tue, 17 Mar 2020 16:01:04 +0000
Received: by mail-wr1-f65.google.com with SMTP id y2so10909679wrn.11
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 17 Mar 2020 09:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=eAhbBL0CBHwTEuoSCE5w0pXR4TY8wKBETG1SIbtR2Sc=;
 b=UxEcJbE5USWqkkP6abztBR0xn4UoB+3HaAmS+SR+DIlY9cmQmxOjfghKLVcS/MgD93
 B+XCDiVXBXMX9b9CkkhYZ+KpTEXpGyoP/ojxfia8bG7x1+vwExQwKqW6YVXY8Jl7k0R8
 Zcz8Q2+0ypoeyzHSOUXHWPHFeOkWYd99k3dVN4vuJcfzskzemmHst9Nlz+44lyETb4HD
 z9zB2P+Dj6smTjN3gNJDV+rd88DPnrtThNakEXkci3fYxvAMOiO9YcWlwnPmP3HBeMod
 R7d4lgn+WROybjInFFnQo9ov2H+TH0F5SxgcVPpXXcLIdvpZE7GLcIhuGbtOGGLEqZgr
 HATg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=eAhbBL0CBHwTEuoSCE5w0pXR4TY8wKBETG1SIbtR2Sc=;
 b=CMP9nvVX8BhQju/BqQ1aCJR6nhExQ1LvFITEz9nfFF0kGVsM00ccxbp02wEjXcKM50
 x1s0saRNN0pVnoaXiCsPc1Oe++69u/tfFgycIdY2wr4542PBMT9UF/InkC31IGIg0mFf
 0EqqkYmot8Na+ljepzhoGKY88NUgg9g0Tb/FSDeD+BP68W7y0YYUwLFSdD8M2uDodcCw
 odlV+v/2Pz4GT84Jh+g02loSZT5K9O80v6ELts7Hlb/CE8yTcXSm1aqIKhox0CM5Pv4h
 RN/Ck0HlOHfkb7JKamJbZBPJ6V1y9i/YL56w22yvEVQTrEbRglh8tYnrrBzLcY/QM8DF
 HA6Q==
X-Gm-Message-State: ANhLgQ1C6t8f4mHpL3B1ThRwWAOZN0tMi6A/xOvLrdLPnHZdKJGepQgI
 z8Uem+noP6JErctVTYkouz+RZg==
X-Google-Smtp-Source: ADFU+vuSGY1rxMfHc3NrftXxtpVnp2ezWprgxCqud+GfK3PjqX6VcALoQ37M7N3wtgxUqDljjFptUA==
X-Received: by 2002:adf:b245:: with SMTP id y5mr6492408wra.136.1584460851735; 
 Tue, 17 Mar 2020 09:00:51 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id x17sm4434916wmi.28.2020.03.17.09.00.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Mar 2020 09:00:50 -0700 (PDT)
Date: Tue, 17 Mar 2020 16:00:49 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Dmitry Safonov <dima@arista.com>
Message-ID: <20200317160049.b2t52oaqifhmcv23@holly.lan>
References: <20200316143916.195608-1-dima@arista.com>
 <20200316143916.195608-48-dima@arista.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200316143916.195608-48-dima@arista.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.65 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.65 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jEEeI-009ei0-AI
Subject: Re: [Kgdb-bugreport] [PATCHv2 47/50] kdb: Don't play with
 console_loglevel
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
Cc: Petr Mladek <pmladek@suse.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 Dmitry Safonov <0x7f454c46@gmail.com>, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Jiri Slaby <jslaby@suse.com>, kgdb-bugreport@lists.sourceforge.net,
 Andrew Morton <akpm@linux-foundation.org>, Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Mon, Mar 16, 2020 at 02:39:13PM +0000, Dmitry Safonov wrote:
> Print the stack trace with KERN_EMERG - it should be always visible.
> 
> Playing with console_loglevel is a bad idea as there may be more
> messages printed than wanted. Also the stack trace might be not printed
> at all if printk() was deferred and console_loglevel was raised back
> before the trace got flushed.
> 
> Unfortunately, after rebasing on commit 2277b492582d ("kdb: Fix stack
> crawling on 'running' CPUs that aren't the master"), kdb_show_stack()
> uses now kdb_dump_stack_on_cpu(), which for now won't be converted as it
> uses dump_stack() instead of show_stack().
> 
> Convert for now the branch that uses show_stack() and remove
> console_loglevel exercise from that case.
> 
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Jason Wessel <jason.wessel@windriver.com>
> Cc: kgdb-bugreport@lists.sourceforge.net
> Signed-off-by: Dmitry Safonov <dima@arista.com>

Acked-by: Daniel Thompson <daniel.thompson@linaro.org>


> ---
>  kernel/debug/kdb/kdb_bt.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/kernel/debug/kdb/kdb_bt.c b/kernel/debug/kdb/kdb_bt.c
> index 3de0cc780c16..43f5dcd2b9ac 100644
> --- a/kernel/debug/kdb/kdb_bt.c
> +++ b/kernel/debug/kdb/kdb_bt.c
> @@ -21,17 +21,18 @@
>  
>  static void kdb_show_stack(struct task_struct *p, void *addr)
>  {
> -	int old_lvl = console_loglevel;
> -
> -	console_loglevel = CONSOLE_LOGLEVEL_MOTORMOUTH;
>  	kdb_trap_printk++;
>  
> -	if (!addr && kdb_task_has_cpu(p))
> +	if (!addr && kdb_task_has_cpu(p)) {
> +		int old_lvl = console_loglevel;
> +
> +		console_loglevel = CONSOLE_LOGLEVEL_MOTORMOUTH;
>  		kdb_dump_stack_on_cpu(kdb_process_cpu(p));
> -	else
> -		show_stack(p, addr);
> +		console_loglevel = old_lvl;
> +	} else {
> +		show_stack_loglvl(p, addr, KERN_EMERG);
> +	}
>  
> -	console_loglevel = old_lvl;
>  	kdb_trap_printk--;
>  }
>  
> -- 
> 2.25.1
> 


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
