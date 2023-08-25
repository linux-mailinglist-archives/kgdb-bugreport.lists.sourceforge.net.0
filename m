Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A76788448
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 25 Aug 2023 12:09:10 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1qZTkZ-0002J8-Bh
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 25 Aug 2023 10:09:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daniel.thompson@linaro.org>) id 1qZTkY-0002J2-LF
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 25 Aug 2023 10:09:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=X39hjYGQZiphQhJuSEMSrg3Fd7NFZIUBYgDNPheRLwc=; b=QcsNX6lgcVSy5SBfS/61jHXHC/
 /xuElyhBApk5/niSG2y8YBe2TDhXgdNePfEs4WcxIeb7gMbHQIYYeN5bh83MfGKlkWSepNZmlrtp4
 w1R1HcCIpK2fZvYCvnXfD3RVK7UcBHZz0/5qlDaDIGL/9HcrgFvCvKyCLzDbf/v/mHCc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=X39hjYGQZiphQhJuSEMSrg3Fd7NFZIUBYgDNPheRLwc=; b=KUfgot5dcbyb+Tbs/DTbn5OxW0
 28Kf6RwPDnotF9kiExAIuZmuwfonAimqyWLoOmwTk8LR/2i0MgOiwxLII+dRRgtoN/GTMkk3Ep/Lx
 9YiwzuLK7ra4luZcCr6qrVuS109/qpc+ZGJmhz7ZuTpXloqZ8EuNl8loW3bPeaU68tG0=;
Received: from mail-wm1-f49.google.com ([209.85.128.49])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qZTkV-0007kx-KB for kgdb-bugreport@lists.sourceforge.net;
 Fri, 25 Aug 2023 10:09:07 +0000
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-3fef56f7222so6523265e9.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 25 Aug 2023 03:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692958137; x=1693562937;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=X39hjYGQZiphQhJuSEMSrg3Fd7NFZIUBYgDNPheRLwc=;
 b=bA86dZHg6cFCB1+hH960h9uNuGqB/X9HFaVR8ljDLDll88vfl/QbA/IVt2Lrh4R5uT
 LkCAJHbuAHmfrnc46u3vboqnC67+K80E+o2y1wSEeQCv0Eo4kQ6N/d7XsPDMPZwvDS18
 mNwvfR/3PgQ5JN60phdOd9bZcKlctw2RxectvSmagqLzfODXGlVHtdBy+IdvpbxShO+O
 2YezZbr+ecGVH32ehu4Jw41gr5wiO++1KZ2PR2KbIYl1p87c6XsYLJTAKHMOplq1px88
 loRLHAzKYQ27RNKqxcQ3MNjeOHBMcedz7l2eued6FTl1LltZjq+brx/UleO2fQq3YXnV
 NSrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692958137; x=1693562937;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X39hjYGQZiphQhJuSEMSrg3Fd7NFZIUBYgDNPheRLwc=;
 b=CrBMWJkXZftbjsZIBKk2BSPfL0WMFDvSb/ttmlmI7Ujm8BrwhFYjZiLBoa/MRK3YcC
 UaxwyctLcp58FpN9qJXRGelAzxVZQhrJsX819vdNkIkbw1FVLUH2Aa/0LgtDl7+43XiF
 4TRzw1YBaMP58LBPq6KsVgED9wsazs0rXNpYwABhiWP3d314hLFL33aWVpZ1wShxGiHc
 lwvWGruw/QgGkPhreNEp13H4xodl4PHpvJE3LpYsD0yIbbDsxLoRiM3qeVcWV5i262FB
 LQSY2xgvFCoAAxU0HkdkDtAa4axdLy7o2zstpxzI5x/hcKC5Nb2r5Rzup/VovuVFVyhY
 zqEQ==
X-Gm-Message-State: AOJu0Yz50PcawmRFIfm9xOMEIzCyNNF2b8P+6q6l+rVezZyUuEnGkNsQ
 6WmulVGAJXdeXXSpnmT3qWvxIV1MEK5PNSQDfc8=
X-Google-Smtp-Source: AGHT+IGXyrKogolarLlNUu27kYfQR3pxPgmDC0X6xU00Qt8KV3p5L3wTg/5Vj+6jFFBEtGBA3XJ6tQ==
X-Received: by 2002:a05:600c:2141:b0:400:57d1:4914 with SMTP id
 v1-20020a05600c214100b0040057d14914mr5030406wml.5.1692958136844; 
 Fri, 25 Aug 2023 03:08:56 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 p24-20020a1c7418000000b003fef60005b5sm1760204wmc.9.2023.08.25.03.08.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Aug 2023 03:08:56 -0700 (PDT)
Date: Fri, 25 Aug 2023 11:08:54 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Douglas Anderson <dianders@chromium.org>
Message-ID: <20230825100854.GC270740@aspen.lan>
References: <20230822131945.1.I5b460ae8f954e4c4f628a373d6e74713c06dd26f@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230822131945.1.I5b460ae8f954e4c4f628a373d6e74713c06dd26f@changeid>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Aug 22, 2023 at 01:19:46PM -0700, Douglas Anderson
 wrote: > When entering kdb/kgdb on a kernel panic, it was be observed that
 the > console isn't flushed before the `kdb` prompt came up. Speci [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.128.49 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.49 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1qZTkV-0007kx-KB
Subject: Re: [Kgdb-bugreport] [PATCH] kgdb: Flush console before entering
 kgdb on panic
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
Cc: kgdb-bugreport@lists.sourceforge.net, Petr Mladek <pmladek@suse.com>,
 linux-kernel@vger.kernel.org, Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Tue, Aug 22, 2023 at 01:19:46PM -0700, Douglas Anderson wrote:
> When entering kdb/kgdb on a kernel panic, it was be observed that the
> console isn't flushed before the `kdb` prompt came up. Specifically,
> when using the buddy lockup detector on arm64 and running:
>   echo HARDLOCKUP > /sys/kernel/debug/provoke-crash/DIRECT
>
> I could see:
>   [   26.161099] lkdtm: Performing direct entry HARDLOCKUP
>   [   32.499881] watchdog: Watchdog detected hard LOCKUP on cpu 6
>   [   32.552865] Sending NMI from CPU 5 to CPUs 6:
>   [   32.557359] NMI backtrace for cpu 6
>   ... [backtrace for cpu 6] ...
>   [   32.558353] NMI backtrace for cpu 5
>   ... [backtrace for cpu 5] ...
>   [   32.867471] Sending NMI from CPU 5 to CPUs 0-4,7:
>   [   32.872321] NMI backtrace forP cpuANC: Hard LOCKUP
>
>   Entering kdb (current=..., pid 0) on processor 5 due to Keyboard Entry
>   [5]kdb>
>
> As you can see, backtraces for the other CPUs start printing and get
> interleaved with the kdb PANIC print.
>
> Let's replicate the commands to flush the console in the kdb panic
> entry point to avoid this.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
>  kernel/debug/debug_core.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
> index d5e9ccde3ab8..3a904d8697c8 100644
> --- a/kernel/debug/debug_core.c
> +++ b/kernel/debug/debug_core.c
> @@ -1006,6 +1006,9 @@ void kgdb_panic(const char *msg)
>  	if (panic_timeout)
>  		return;
>
> +	debug_locks_off();
> +	console_flush_on_panic(CONSOLE_FLUSH_PENDING);
> +
>  	if (dbg_kdb_mode)
>  		kdb_printf("PANIC: %s\n", msg);

I'm somewhat included to say *this* (calling kdb_printf() when not
actually in the debugger) is the cause of the problem. kdb_printf()
does some pretty horid things to the console and isn't intended to
run while the system is active.

I'd therefore be more tempted to defer the print to the b.p. trap
handler itself and make this part of kgdb_panic() look more like:

	kgdb_panic_msg = msg;
	kgdb_breakpoint();
	kgdb_panic_msg = NULL;


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
