Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 933FDA399C
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 30 Aug 2019 16:52:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1i3iGh-00028Q-Ck
	for lists+kgdb-bugreport@lfdr.de; Fri, 30 Aug 2019 14:52:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1i3iGg-000285-0q
 for kgdb-bugreport@lists.sourceforge.net; Fri, 30 Aug 2019 14:52:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WnDh4GYxLlPevTo2ZCuvO0gFHsJHAxBrMo8QB7NPLOg=; b=kxCEFLn4VP9Fbo/lXfmtFOrC66
 ZvsGzn4t8V0gILemwd6bvBeoCpAHzg0EblGbA6qkpZjyZ2b7GKTRhBTIaifF3JjTHICYMm2NhTsup
 gKEVU5oQqNWEHVY1cUyAx8RXaZzi5dGj3ssbvOy/11g+FHvA+I5wP2gmT+5qoPSuf1bQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WnDh4GYxLlPevTo2ZCuvO0gFHsJHAxBrMo8QB7NPLOg=; b=L/ZgRTDx5UfJI6RzIntntVpOo8
 vlhlaFgJn8S7zZkdoiCcfBibVWMZifE2yrXy0+oameQ2A9zG/VvaUzxpmc9TOO+1j/ZYXG7asPZ7P
 iLV1eSz7Pl5Qc848oy3t4hUK1iH8Bs2rjEDwws5U/vQQAXX8WUxcc9tv96CPww9gVGjY=;
Received: from mail-wm1-f66.google.com ([209.85.128.66])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1i3iGd-003VbJ-3X
 for kgdb-bugreport@lists.sourceforge.net; Fri, 30 Aug 2019 14:52:49 +0000
Received: by mail-wm1-f66.google.com with SMTP id p13so7784222wmh.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 30 Aug 2019 07:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=WnDh4GYxLlPevTo2ZCuvO0gFHsJHAxBrMo8QB7NPLOg=;
 b=B2nPxphuhmRbpfjOjq1ETlDwNHTTkV1OSNfVdXXFU0801mI1gAUWhW/stSwsZWdkC8
 7jEGLO38sP5coHGBjjj1DzIU+9szQG0MALl8J0ttoGrYoVnyvZtLhX8fl9LFSZuXoAXe
 jlO/LTb/A9jou/QOxSED0jnoPcpyBpJrLu5SXALTCm359y7RFAEj51hKV6l06VARF3b/
 ApBCWiDwr1OhNPBSzZNaqj8d63cf4YJdbPr2LTkUDiU+PJQb5UcyaBllrLboMpX7X8QV
 gEzZJ7+/J4URfW9l2KjE5Vf50qJ9HLe00IUXoQV7HBfY35fsfbvoMUdcyoGMbxgEwpr2
 Fv0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=WnDh4GYxLlPevTo2ZCuvO0gFHsJHAxBrMo8QB7NPLOg=;
 b=pL3VUZgscQVQr/5oWf8S2UeGWhCzcsfoeACpF213sMP8f8I4nCwguSkheIy4ODHXGe
 sGs9zCAx5p/rtjYNCPWqB00U7s6hxxlg5WZ7lnOZcWWGX8VC+6bQSS4Xtj9k3sT/Uty6
 rRiQIxlaP4y5we2lstxZIgimLOeKPySWwHK/3jN8nPxpcNsHA7gpwZIq7I2PD/kWuaAa
 CKRX652pHmdd+xkQ7YgU7kHunB7PbZ4DgdKENWD7AfBp0PTOwAMx35UttziP01mb+tUQ
 lNdb5ETE07XcM9sbTkwjUj52ILYPnKVBN3o4ON0WSRQZrNN4KWeqqJB3U1NYUwzFhQWA
 JwIQ==
X-Gm-Message-State: APjAAAVpTd0fLNK127yhmCpDtkPpoxbLAjBnaX1eyHHvSnlXUwDth/qu
 TL9WG4242ZkZ9yIfdbWorvJ/ZQ==
X-Google-Smtp-Source: APXvYqzsxo/zQBDlvDqG7aghvQ2Ie4zikD8vWk5e0BDdMzsCgy9wqNdVOXe0wOqe+hZ/+mLk9cQHcA==
X-Received: by 2002:a1c:a7c6:: with SMTP id q189mr5678117wme.22.1567176760441; 
 Fri, 30 Aug 2019 07:52:40 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id w5sm11200334wrc.82.2019.08.30.07.52.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Aug 2019 07:52:39 -0700 (PDT)
Date: Fri, 30 Aug 2019 15:52:37 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Douglas Anderson <dianders@chromium.org>
Message-ID: <20190830145237.aoysubwetqe3eggj@holly.lan>
References: <20190731183732.178134-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190731183732.178134-1-dianders@chromium.org>
User-Agent: NeoMutt/20180716
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.66 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1i3iGd-003VbJ-3X
Subject: Re: [Kgdb-bugreport] [PATCH v2] kdb: Fix stack crawling on
 'running' CPUs that aren't the master
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

On Wed, Jul 31, 2019 at 11:37:32AM -0700, Douglas Anderson wrote:
> In kdb when you do 'btc' (back trace on CPU) it doesn't necessarily
> give you the right info.  Specifically on many architectures
> (including arm64, where I tested) you can't dump the stack of a
> "running" process that isn't the process running on the current CPU.
> This can be seen by this:
> 
>  echo SOFTLOCKUP > /sys/kernel/debug/provoke-crash/DIRECT
>  # wait 2 seconds
>  <sysrq>g
> 
> Here's what I see now on rk3399-gru-kevin.  I see the stack crawl for
> the CPU that handled the sysrq but everything else just shows me stuck
> in __switch_to() which is bogus:
> 
> ======
> 
> [0]kdb> btc
> btc: cpu status: Currently on cpu 0
> Available cpus: 0, 1-3(I), 4, 5(I)
> Stack traceback for pid 0
> 0xffffff801101a9c0        0        0  1    0   R  0xffffff801101b3b0 *swapper/0
> Call trace:
>  dump_backtrace+0x0/0x138
>  ...
>  kgdb_compiled_brk_fn+0x34/0x44
>  ...
>  sysrq_handle_dbg+0x34/0x5c
> Stack traceback for pid 0
> 0xffffffc0f175a040        0        0  1    1   I  0xffffffc0f175aa30  swapper/1
> Call trace:
>  __switch_to+0x1e4/0x240
>  0xffffffc0f65616c0
> Stack traceback for pid 0
> 0xffffffc0f175d040        0        0  1    2   I  0xffffffc0f175da30  swapper/2
> Call trace:
>  __switch_to+0x1e4/0x240
>  0xffffffc0f65806c0
> Stack traceback for pid 0
> 0xffffffc0f175b040        0        0  1    3   I  0xffffffc0f175ba30  swapper/3
> Call trace:
>  __switch_to+0x1e4/0x240
>  0xffffffc0f659f6c0
> Stack traceback for pid 1474
> 0xffffffc0dde8b040     1474      727  1    4   R  0xffffffc0dde8ba30  bash
> Call trace:
>  __switch_to+0x1e4/0x240
>  __schedule+0x464/0x618
>  0xffffffc0dde8b040
> Stack traceback for pid 0
> 0xffffffc0f17b0040        0        0  1    5   I  0xffffffc0f17b0a30  swapper/5
> Call trace:
>  __switch_to+0x1e4/0x240
>  0xffffffc0f65dd6c0
> 
> ===
> 
> The problem is that 'btc' eventually boils down to
>   show_stack(task_struct, NULL);
> 
> ...and show_stack() doesn't work for "running" CPUs because their
> registers haven't been stashed.
> 
> On x86 things might work better (I haven't tested) because kdb has a
> special case for x86 in kdb_show_stack() where it passes the stack
> pointer to show_stack().  This wouldn't work on arm64 where the stack
> crawling function seems needs the "fp" and "pc", not the "sp" which is
> presumably why arm64's show_stack() function totally ignores the "sp"
> parameter.
> 
> NOTE: we _can_ get a good stack dump for all the cpus if we manually
> switch each one to the kdb master and do a back trace.  AKA:
>   cpu 4
>   bt
> ...will give the expected trace.  That's because now arm64's
> dump_backtrace will now see that "tsk == current" and go through a
> different path.
> 
> In this patch I fix the problems by catching a request to stack crawl
> a task that's running on a CPU and then I ask that CPU to do the stack
> crawl.
> 
> NOTE: this will (presumably) change what stack crawls are printed for
> x86 machines.  Now kdb functions will show up in the stack crawl.
> Presumably this is OK but if it's not we can go back and add a special
> case for x86 again.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

I think this approach can be made work but there are problems as things
exist today, see below.


> ---
> 
> Changes in v2:
> - Totally new approach; now arch agnostic.
> 
>  kernel/debug/debug_core.c |  5 +++++
>  kernel/debug/debug_core.h |  1 +
>  kernel/debug/kdb/kdb_bt.c | 44 ++++++++++++++++++++++++++++++---------
>  3 files changed, 40 insertions(+), 10 deletions(-)
> 
> diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
> index 5cc608de6883..a89c72714fe6 100644
> --- a/kernel/debug/debug_core.c
> +++ b/kernel/debug/debug_core.c
> @@ -92,6 +92,8 @@ static int kgdb_use_con;
>  bool dbg_is_early = true;
>  /* Next cpu to become the master debug core */
>  int dbg_switch_cpu;
> +/* cpu number of slave we request a stack crawl of */
> +int dbg_slave_dumpstack_cpu = -1;
>  
>  /* Use kdb or gdbserver mode */
>  int dbg_kdb_mode = 1;
> @@ -580,6 +582,9 @@ static int kgdb_cpu_enter(struct kgdb_state *ks, struct pt_regs *regs,
>  				atomic_xchg(&kgdb_active, cpu);
>  				break;
>  			}
> +		} else if (dbg_slave_dumpstack_cpu == cpu) {

Couldn't this be encoded in the exception state?


> +			dump_stack();
> +			dbg_slave_dumpstack_cpu = -1;

>  		} else if (kgdb_info[cpu].exception_state & DCPU_IS_SLAVE) {
>  			if (!raw_spin_is_locked(&dbg_slave_lock))
>  				goto return_normal;
> diff --git a/kernel/debug/debug_core.h b/kernel/debug/debug_core.h
> index b4a7c326d546..dca74d5caef2 100644
> --- a/kernel/debug/debug_core.h
> +++ b/kernel/debug/debug_core.h
> @@ -62,6 +62,7 @@ extern int dbg_io_get_char(void);
>  /* Switch from one cpu to another */
>  #define DBG_SWITCH_CPU_EVENT -123456
>  extern int dbg_switch_cpu;
> +extern int dbg_slave_dumpstack_cpu;
>  
>  /* gdbstub interface functions */
>  extern int gdb_serial_stub(struct kgdb_state *ks);
> diff --git a/kernel/debug/kdb/kdb_bt.c b/kernel/debug/kdb/kdb_bt.c
> index 7e2379aa0a1e..10095ae05826 100644
> --- a/kernel/debug/kdb/kdb_bt.c
> +++ b/kernel/debug/kdb/kdb_bt.c
> @@ -10,6 +10,7 @@
>   */
>  
>  #include <linux/ctype.h>
> +#include <linux/delay.h>
>  #include <linux/string.h>
>  #include <linux/kernel.h>
>  #include <linux/sched/signal.h>
> @@ -22,20 +23,43 @@
>  static void kdb_show_stack(struct task_struct *p, void *addr)
>  {
>  	int old_lvl = console_loglevel;
> +	int time_left;
> +	int cpu;
> +
>  	console_loglevel = CONSOLE_LOGLEVEL_MOTORMOUTH;
>  	kdb_trap_printk++;
> -	kdb_set_current_task(p);
> -	if (addr) {
> -		show_stack((struct task_struct *)p, addr);
> -	} else if (kdb_current_regs) {
> -#ifdef CONFIG_X86
> -		show_stack(p, &kdb_current_regs->sp);
> -#else
> -		show_stack(p, NULL);
> -#endif
> +
> +	if (!addr && kdb_task_has_cpu(p)) {
> +		cpu = kdb_process_cpu(p);
> +
> +		if (cpu == raw_smp_processor_id()) {
> +			dump_stack();
> +			goto exit;

This goto is not for error recovery but looks like it is. Why can't we
use normal control flow here (extracting the remote stack dump logic
into a seperate function if the right margin is getting too close)?

In fact to be honest a function call would be useful anyway since I'd
rather have all the resulting horror in a single file (debug_core.c).


> +		}
> +
> +		/*
> +		 * In general architectures don't support dumping the stack
> +		 * of a "running" process that's not the current one so if
> +		 * we want to dump the stack of a running process that's not
> +		 * the master then we'll set a global letting the slave
> +		 * (which should be looping) know to dump its own stack.
> +		 */
> +		dbg_slave_dumpstack_cpu = cpu;
> +		for (time_left = MSEC_PER_SEC; time_left; time_left--) {
> +			udelay(1000);
> +			if (dbg_slave_dumpstack_cpu == -1)
> +				break;
> +		}

This timeout does not interact correctly with the pager (the timer does
not get reset when we sit in the pager loop waiting for user to tell us
to continue).


> +		if (dbg_slave_dumpstack_cpu != -1) {
> +			kdb_printf("ERROR: Timeout dumping CPU %d stack\n",
> +				   cpu);
> +			dbg_slave_dumpstack_cpu = -1;
> +		}
>  	} else {
> -		show_stack(p, NULL);
> +		show_stack(p, addr);
>  	}
> +
> +exit:
>  	console_loglevel = old_lvl;
>  	kdb_trap_printk--;
>  }
> -- 
> 2.22.0.770.g0f2c4a37fd-goog


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
