Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 889E44C6C75
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 28 Feb 2022 13:28:31 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1nOf8h-0002w1-JI
	for lists+kgdb-bugreport@lfdr.de; Mon, 28 Feb 2022 12:28:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <peterz@infradead.org>) id 1nOf8f-0002ue-H4
 for kgdb-bugreport@lists.sourceforge.net; Mon, 28 Feb 2022 12:28:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=F3eTU03pb76E1ORP3hb/KpZsjDGhzZCbE56yzxqP8q4=; b=JJInm05zk5YRVQj+4q27HwiYzb
 AbAEx31q76OdgJRq/0g0LwZ+O/IHx3wEmyxcF+oKjwHjxggvaxypt8nnqma9/i37g6ICNsiu+MWeY
 ZeOMpgEa1RVbQ8tBAdDsjgNtkqLPnF1ObqWESwxLHoE8g8QxM+kEBr+xODXfwnHqdtfk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=F3eTU03pb76E1ORP3hb/KpZsjDGhzZCbE56yzxqP8q4=; b=Pz2Fc+as7WR68Ge5x52sCwWXV/
 CCDY/PsebIPsXShfgFoY4D535V1GCuqiPLsjzicXvb88UN/MuIyHsYUFpHE8RMBZEl6BrzHSdnvtV
 br8HjLWjOa4ciaPBuCViZ/YGaWZbx5jz1X4ACad+9T7JuikXU6q2acLOhndMt74xVW+w=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nOf8c-0003XI-7e
 for kgdb-bugreport@lists.sourceforge.net; Mon, 28 Feb 2022 12:28:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=F3eTU03pb76E1ORP3hb/KpZsjDGhzZCbE56yzxqP8q4=; b=JN3jrRBpX2T88x6YqGvSH9chlW
 JQ1HApPsnmw/Z2eJORa/9yH42lJoXMCBTKkO0oL61dOUXdUBOx93wTr8bN9LBxACbVjHEvcVbD3De
 /HQZyf6z7tUvM3j1BbTuYk1R9GNNE2WdsqvR76prGUV6PQdDjPbGhgeMQF2CMIAy3tTPqHKfZWm0L
 PfKRF8M3qLXVsRB+4nqws9Lx4YavRanPh1K7pT64rPJ2zA9P80Ku6kcamz003Gd54ixZicmQ02a2P
 BTRJSXx+t7Y14NljhBdlf8Ydu3jx0i8AQdMIkiJ573RlE4EsTIiEb1oU9G8/t5ROuP2Cokh9ejbTm
 fh7HIm2g==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOeoQ-008U6Q-1m; Mon, 28 Feb 2022 12:07:34 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 6B716300390;
 Mon, 28 Feb 2022 13:07:30 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 5575120244B2C; Mon, 28 Feb 2022 13:07:30 +0100 (CET)
Date: Mon, 28 Feb 2022 13:07:30 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Sumit Garg <sumit.garg@linaro.org>
Message-ID: <Yhy7AnwEMqbcKsEg@hirez.programming.kicks-ass.net>
References: <20220228075351.1412452-1-sumit.garg@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220228075351.1412452-1-sumit.garg@linaro.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Feb 28, 2022 at 01:23:51PM +0530, Sumit Garg wrote:
 > Allow a magic sysrq to be triggered from an NMI context. This is done *why*
 though? > +#define SYSRQ_NMI_FIFO_SIZE 2 > +static DEFINE_KFIFO(sysrq_nmi_fifo,
 int, SYSRQ_NMI_FIFO_SIZE); > + > +static void sysrq_do_nmi_work(struct irq_work
 *work) Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nOf8c-0003XI-7e
Subject: Re: [Kgdb-bugreport] [RFT v2] tty/sysrq: Make sysrq handler NMI
 aware
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
Cc: hasegawa-hitomi@fujitsu.com, daniel.thompson@linaro.org, arnd@arndb.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, jason.wessel@windriver.com,
 kgdb-bugreport@lists.sourceforge.net, jirislaby@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Mon, Feb 28, 2022 at 01:23:51PM +0530, Sumit Garg wrote:
> Allow a magic sysrq to be triggered from an NMI context. This is done

*why* though?


> +#define SYSRQ_NMI_FIFO_SIZE	2
> +static DEFINE_KFIFO(sysrq_nmi_fifo, int, SYSRQ_NMI_FIFO_SIZE);
> +
> +static void sysrq_do_nmi_work(struct irq_work *work)

That naming don't make sense, it does the !NMI work, from IRQ context.

> +{
> +	const struct sysrq_key_op *op_p;
> +	int orig_suppress_printk;
> +	int key;
> +
> +	orig_suppress_printk = suppress_printk;
> +	suppress_printk = 0;
> +
> +	rcu_sysrq_start();
> +	rcu_read_lock();
> +
> +	if (kfifo_peek(&sysrq_nmi_fifo, &key)) {
> +		op_p = __sysrq_get_key_op(key);
> +		if (op_p)
> +			op_p->handler(key);
> +	}
> +
> +	rcu_read_unlock();
> +	rcu_sysrq_end();
> +
> +	suppress_printk = orig_suppress_printk;
> +
> +	kfifo_reset_out(&sysrq_nmi_fifo);
> +}
> +
> +static DEFINE_IRQ_WORK(sysrq_nmi_work, sysrq_do_nmi_work);
> +
>  void __handle_sysrq(int key, bool check_mask)
>  {
>  	const struct sysrq_key_op *op_p;
> @@ -573,6 +612,10 @@ void __handle_sysrq(int key, bool check_mask)
>  	int orig_suppress_printk;
>  	int i;
>  
> +	/* Skip sysrq handling if one already in progress */
> +	if (!kfifo_is_empty(&sysrq_nmi_fifo))
> +		return;
> +
>  	orig_suppress_printk = suppress_printk;
>  	suppress_printk = 0;
>  
> @@ -596,7 +639,13 @@ void __handle_sysrq(int key, bool check_mask)
>  		if (!check_mask || sysrq_on_mask(op_p->enable_mask)) {
>  			pr_info("%s\n", op_p->action_msg);
>  			console_loglevel = orig_log_level;
> -			op_p->handler(key);
> +
> +			if (in_nmi() && !op_p->nmi_safe) {
> +				kfifo_put(&sysrq_nmi_fifo, key);
> +				irq_work_queue(&sysrq_nmi_work);
> +			} else {
> +				op_p->handler(key);
> +			}
>  		} else {
>  			pr_info("This sysrq operation is disabled.\n");
>  			console_loglevel = orig_log_level;

I'm missing the point of that kfifo stuff; afaict it only ever buffers
_1_ key, might as well use a simple variable, no?


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
