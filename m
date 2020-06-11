Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD6D1F6914
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 11 Jun 2020 15:36:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jjNNR-0001pN-KC
	for lists+kgdb-bugreport@lfdr.de; Thu, 11 Jun 2020 13:36:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <mhiramat@kernel.org>) id 1jjMYP-0002xh-Kv
 for kgdb-bugreport@lists.sourceforge.net; Thu, 11 Jun 2020 12:43:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Mime-Version
 :References:In-Reply-To:Message-Id:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JlurbbXF96USHImkuu+jnS4TX7qKLxHys+4ezEIzeCA=; b=irDHAzQd3nXqxZuhOs7n5Vars8
 cu81CLMiQU2w2pPjtte4ux6lofutoWOidvT8lCW8r25Bl55OsGjWDYbU0emD1HjSQ7ppu+wLSLYCi
 LrkO6HrXIlL9ZSxTyyYqpXYZ2+7RpjQQ0SGeb+YPKq0SdLeItXhrgXBi7qXkj5m0L+bQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Mime-Version:References:
 In-Reply-To:Message-Id:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JlurbbXF96USHImkuu+jnS4TX7qKLxHys+4ezEIzeCA=; b=E+ajaX6n2xMdgnLgb6HjkzucZO
 38qPc1EYnP+AQHRVgC3leWpBqqLEePCCzCpOvOB6O+QuX2RBbHw84B+LCU4cPTi94N7TuEh6ntLoh
 R4qMKeiyTDx8Qzx9XFy/F61pjY/Gn4DscgkEm56/Muzte08FWSUG1xpi6NZJXNfyYfXs=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jjMYN-00Gehc-KO
 for kgdb-bugreport@lists.sourceforge.net; Thu, 11 Jun 2020 12:43:33 +0000
Received: from devnote2 (NE2965lan1.rev.em-net.ne.jp [210.141.244.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5EC9720747;
 Thu, 11 Jun 2020 12:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591879399;
 bh=BkjoSv6oE05qU52N5VgK8gWQ6cVw3A6mBU70e+LGnsA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=VpgaOTAQnzmZRYu8wsZ2T6pPSpFRgcnbY24W8x1BRlqmNJztAI2X+ePD64YYHjaX0
 z7Ni8Wp7rQH0RRnF44LSvWPxseGemnmL7Of45iHHpiMsW/3ELbuXxmUkFhNO5Q07fV
 mE1BB6RLWOg1DYMM3ihwtvFIZFLRC1eEx7UEkmv4=
Date: Thu, 11 Jun 2020 21:43:14 +0900
From: Masami Hiramatsu <mhiramat@kernel.org>
To: Daniel Thompson <daniel.thompson@linaro.org>
Message-Id: <20200611214314.bc3ab1fb7000cf50eb037a6f@kernel.org>
In-Reply-To: <20200605132130.1411255-4-daniel.thompson@linaro.org>
References: <20200605132130.1411255-1-daniel.thompson@linaro.org>
 <20200605132130.1411255-4-daniel.thompson@linaro.org>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1jjMYN-00Gehc-KO
X-Mailman-Approved-At: Thu, 11 Jun 2020 13:36:15 +0000
Subject: Re: [Kgdb-bugreport] [RFC PATCH 3/4] kgdb: Add NOKPROBE labels on
 the trap handler functions
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
Cc: pmladek@suse.com, Peter Zijlstra <peterz@infradead.org>,
 kgdb-bugreport@lists.sourceforge.net, patches@linaro.org,
 linux-kernel@vger.kernel.org, sergey.senozhatsky@gmail.com,
 Jason Wessel <jason.wessel@windriver.com>, will@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Fri,  5 Jun 2020 14:21:29 +0100
Daniel Thompson <daniel.thompson@linaro.org> wrote:

> Currently kgdb honours the kprobe blacklist but doesn't place its own
> trap handling code on the list. Add macros to discourage attempting to
> use kgdb to debug itself.
> 
> These changes do not make it impossible to provoke recursive trapping
> since they do not cover all the calls that can be made on kgdb's entry
> logic. However going much further whilst we are sharing the kprobe
> blacklist risks reducing the capabilities of kprobe and this is a bad
> trade off (especially so given kgdb's users are currently conditioned to
> avoid recursive traps).
> 
> Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
> ---
>  kernel/debug/debug_core.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
> index 4a2df4509fe1..21d1d91da4bb 100644
> --- a/kernel/debug/debug_core.c
> +++ b/kernel/debug/debug_core.c
> @@ -184,6 +184,7 @@ int __weak kgdb_arch_remove_breakpoint(struct kgdb_bkpt *bpt)
>  	return probe_kernel_write((char *)bpt->bpt_addr,
>  				  (char *)bpt->saved_instr, BREAK_INSTR_SIZE);
>  }
> +NOKPROBE_SYMBOL(kgdb_arch_remove_breakpoint);
>  
>  int __weak kgdb_validate_break_address(unsigned long addr)
>  {
> @@ -321,6 +322,7 @@ static void kgdb_flush_swbreak_addr(unsigned long addr)
>  	/* Force flush instruction cache if it was outside the mm */
>  	flush_icache_range(addr, addr + BREAK_INSTR_SIZE);
>  }
> +NOKPROBE_SYMBOL(kgdb_flush_swbreak_addr);
>  
>  /*
>   * SW breakpoint management:
> @@ -411,6 +413,7 @@ int dbg_deactivate_sw_breakpoints(void)
>  	}
>  	return ret;
>  }
> +NOKPROBE_SYMBOL(dbg_deactivate_sw_breakpoints);
>  
>  int dbg_remove_sw_break(unsigned long addr)
>  {
> @@ -567,6 +570,7 @@ static int kgdb_reenter_check(struct kgdb_state *ks)
>  
>  	return 1;
>  }
> +NOKPROBE_SYMBOL(kgdb_reenter_check);
>  
>  static void dbg_touch_watchdogs(void)
>  {
> @@ -801,6 +805,7 @@ static int kgdb_cpu_enter(struct kgdb_state *ks, struct pt_regs *regs,
>  
>  	return kgdb_info[cpu].ret_state;
>  }
> +NOKPROBE_SYMBOL(kgdb_cpu_enter);
>  
>  /*
>   * kgdb_handle_exception() - main entry point from a kernel exception
> @@ -845,6 +850,7 @@ kgdb_handle_exception(int evector, int signo, int ecode, struct pt_regs *regs)
>  		arch_kgdb_ops.enable_nmi(1);
>  	return ret;
>  }
> +NOKPROBE_SYMBOL(kgdb_handle_exception);
>  
>  /*
>   * GDB places a breakpoint at this function to know dynamically loaded objects.
> @@ -879,6 +885,7 @@ int kgdb_nmicallback(int cpu, void *regs)
>  #endif
>  	return 1;
>  }
> +NOKPROBE_SYMBOL(kgdb_nmicallback);
>  
>  int kgdb_nmicallin(int cpu, int trapnr, void *regs, int err_code,
>  							atomic_t *send_ready)
> @@ -904,6 +911,7 @@ int kgdb_nmicallin(int cpu, int trapnr, void *regs, int err_code,
>  #endif
>  	return 1;
>  }
> +NOKPROBE_SYMBOL(kgdb_nmicallin);
>  
>  static void kgdb_console_write(struct console *co, const char *s,
>     unsigned count)
> @@ -1204,7 +1212,6 @@ noinline void kgdb_breakpoint(void)
>  	atomic_dec(&kgdb_setting_breakpoint);
>  }
>  EXPORT_SYMBOL_GPL(kgdb_breakpoint);
> -NOKPROBE_SYMBOL(kgdb_breakpoint);

BTW, why did you mark this NOKPROBE in 2/4 and remove it 3/4 again?

Thank you,


-- 
Masami Hiramatsu <mhiramat@kernel.org>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
