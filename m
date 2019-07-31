Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5CD7F5EF
	for <lists+kgdb-bugreport@lfdr.de>; Fri,  2 Aug 2019 13:23:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1htVf6-0006sc-Nn
	for lists+kgdb-bugreport@lfdr.de; Fri, 02 Aug 2019 11:23:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <will@kernel.org>) id 1hsoAt-0003Bi-34
 for kgdb-bugreport@lists.sourceforge.net; Wed, 31 Jul 2019 12:57:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hJ4NU7MIFeMBAE35d/G10aUc/d5Qp9/8whn1UaYw9Og=; b=BdyKb/rqT14RCdlwj9i1N7CaLq
 1sXPHQ+HTWsZUle0B6aSSXjlFXJuMHjdszV8AnIXALCMcLcZJbCHn818dyG17Wd5x15FHVye37r2Q
 pahEZKtfBEMeR1leCVGr5AjBW8mQLdK7T+TaKLtWKjxB3jiCcFDsv626bw1iok2GaVcw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hJ4NU7MIFeMBAE35d/G10aUc/d5Qp9/8whn1UaYw9Og=; b=hLTSE8HEG34jjJORpYZ8go3lnO
 z9YLfbatmPM8LFoeducq0tQpfoe6YwHf7dRlFf7FaKsKY8gkeAq9f4mAtbsESG376DnT8iHf1/2Mj
 nxR0b7hHxf+r/CRZ0M0J92oe1OgpizE2zI0N9DuD7DzgbCNc0/WELVsQHuzeu6vfv4bo=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hsoAq-003DvK-Lo
 for kgdb-bugreport@lists.sourceforge.net; Wed, 31 Jul 2019 12:57:46 +0000
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 34DE2206B8;
 Wed, 31 Jul 2019 12:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564577859;
 bh=okXF5i5vaeExDoO318U4IQz1NUTULDtYpMjX5VybXa8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=0gNz/z2N2FVKJSq5nKsfxQ6jkM5bXwbk5ejbg/oueGFf+66HxtP1VObGp+PPHvXcT
 FCqoVb+UTvs3fMs+tQ9QtSOVfexkt+fZ9rSzwg53vqD9CtvotI1ILU8g0mcNCNOeBK
 w8h++X9My6pAOdZdbUIMywBPN0q2a84InCI2zQ6U=
Date: Wed, 31 Jul 2019 13:57:33 +0100
From: Will Deacon <will@kernel.org>
To: Douglas Anderson <dianders@chromium.org>
Message-ID: <20190731125733.op3y5j5psuj6pet3@willie-the-truck>
References: <20190730221800.28326-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190730221800.28326-1-dianders@chromium.org>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1hsoAq-003DvK-Lo
X-Mailman-Approved-At: Fri, 02 Aug 2019 11:23:51 +0000
Subject: Re: [Kgdb-bugreport] [PATCH] arm64: debug: Make 'btc' and similar
 work in kdb
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
 Mark Rutland <mark.rutland@arm.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 kgdb-bugreport@lists.sourceforge.net,
 Jason Wessel <jason.wessel@windriver.com>, linux-kernel@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi Doug,

On Tue, Jul 30, 2019 at 03:18:00PM -0700, Douglas Anderson wrote:
> diff --git a/arch/arm64/kernel/kgdb.c b/arch/arm64/kernel/kgdb.c
> index 43119922341f..b666210fbc75 100644
> --- a/arch/arm64/kernel/kgdb.c
> +++ b/arch/arm64/kernel/kgdb.c
> @@ -148,6 +148,45 @@ sleeping_thread_to_gdb_regs(unsigned long *gdb_regs, struct task_struct *task)
>  	gdb_regs[32] = cpu_context->pc;
>  }
>  
> +void kgdb_call_nmi_hook(void *ignored)
> +{
> +	struct pt_regs *regs;
> +
> +	/*
> +	 * NOTE: get_irq_regs() is supposed to get the registers from
> +	 * before the IPI interrupt happened and so is supposed to
> +	 * show where the processor was.  In some situations it's
> +	 * possible we might be called without an IPI, so it might be
> +	 * safer to figure out how to make kgdb_breakpoint() work
> +	 * properly here.
> +	 */
> +	regs = get_irq_regs();
> +
> +	/*
> +	 * Some commands (like 'btc') assume that they can find info about
> +	 * a task in the 'cpu_context'.  Unfortunately that's only valid
> +	 * for sleeping tasks.  ...but let's make it work anyway by just
> +	 * writing the registers to the right place.  This is safe because
> +	 * nobody else is using the 'cpu_context' for a running task.
> +	 */
> +	current->thread.cpu_context.x19 = regs->regs[19];
> +	current->thread.cpu_context.x20 = regs->regs[20];
> +	current->thread.cpu_context.x21 = regs->regs[21];
> +	current->thread.cpu_context.x22 = regs->regs[22];
> +	current->thread.cpu_context.x23 = regs->regs[23];
> +	current->thread.cpu_context.x24 = regs->regs[24];
> +	current->thread.cpu_context.x25 = regs->regs[25];
> +	current->thread.cpu_context.x26 = regs->regs[26];
> +	current->thread.cpu_context.x27 = regs->regs[27];
> +	current->thread.cpu_context.x28 = regs->regs[28];
> +	current->thread.cpu_context.fp = regs->regs[29];
> +
> +	current->thread.cpu_context.sp = regs->sp;
> +	current->thread.cpu_context.pc = regs->pc;
> +
> +	kgdb_nmicallback(raw_smp_processor_id(), regs);
> +}

This is really gross... :/

Can you IPI the other CPUs instead and have them backtrace locally, like we
do for things like magic sysrq (sysrq_handle_showallcpus())?

Will


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
