Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DF9DD3E189C
	for <lists+kgdb-bugreport@lfdr.de>; Thu,  5 Aug 2021 17:47:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fk0IZgtsNFGbj74qbOwH75W3xfKXv+Mjpe5lDs8mKAw=; b=BV7yuwwna57xT5D2kbTFSyOTe
	hf20b5vB99o/jvo5ilWSaXq4l7cdgkUFInbCyCT6vdnFNLZNxM3zbJuVM4nwwzODC9GW+Ha1iffVF
	1P7+yl/XPGPl21Am/U5XogwkY5Vqtl9mmBujIa/NNJvL12RrEmDU+UAlgeX2xpxMQVoVk=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1mBfam-0001IL-NZ
	for lists+kgdb-bugreport@lfdr.de; Thu, 05 Aug 2021 15:47:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <pmladek@suse.com>) id 1mBfal-0001Hy-80
 for kgdb-bugreport@lists.sourceforge.net; Thu, 05 Aug 2021 15:47:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xjyShzouPrJcHBbruWtTQutmAQhza4mB7qEDF4um5Mg=; b=Bda0WvkwUqvQXRIHuF43AMJ0lf
 kX1iXoZLhS2mIVoC4ifrMHijRxMaIjfHSAhdcZQgugln3yCVR2sZ+ERKe/Y+d2DLFz7AAejYIMxg6
 JFyW6tHrJeaB4jFymAN1oPT9/7HM4oXtpw/j/X3rIRgMfzw5JheRnDSPhbpyrkz3dDXY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xjyShzouPrJcHBbruWtTQutmAQhza4mB7qEDF4um5Mg=; b=ADZQEQt7EqGl36ickEVanlQoEd
 Wp5Z7tzv9uJGPX//nusA/UZd/fCNm2YCM2UIgA1XS+tE3cenWgsBiq9Y91p7I6MAsAWQJIDMs3pYc
 Afef0a7DLli6Ih44RwQDi87GhxLQKmj5M4HRUESonANlsiZFaGRDh/dRkElI4DArySvk=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1mBfaj-00063Q-LW
 for kgdb-bugreport@lists.sourceforge.net; Thu, 05 Aug 2021 15:47:31 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 05803223C9;
 Thu,  5 Aug 2021 15:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1628178443; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xjyShzouPrJcHBbruWtTQutmAQhza4mB7qEDF4um5Mg=;
 b=HFFKv1lODf3gm58MqBGWAh8qSB3SjD0CWH1FfzIS9Ttb2ITfRIGZdfCH1BtAnoyP4ESIec
 etQbWzYl+6ASAoafzEiq37hiOIvpPGQL0Maxr2rIGqwGWJypE77o36bBPH1bIEeFynFgxE
 JPgwV+WeWHfe1PUy2fE9+HyrOT/gvco=
Received: from suse.cz (pmladek.udp.ovpn1.prg.suse.de [10.100.224.162])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 9259EA3EC0;
 Thu,  5 Aug 2021 15:47:22 +0000 (UTC)
Date: Thu, 5 Aug 2021 17:47:22 +0200
To: John Ogness <john.ogness@linutronix.de>
Message-ID: <YQwHwT2wYM1dJfVk@alley>
References: <20210803131301.5588-1-john.ogness@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210803131301.5588-1-john.ogness@linutronix.de>
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
X-Headers-End: 1mBfaj-00063Q-LW
Subject: Re: [Kgdb-bugreport] [PATCH printk v1 00/10] printk: introduce
 atomic consoles and sync mode
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
From: Petr Mladek via Kgdb-bugreport <kgdb-bugreport@lists.sourceforge.net>
Reply-To: Petr Mladek <pmladek@suse.com>
Cc: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Jiri Slaby <jirislaby@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Al Cooper <alcooperx@gmail.com>, Paul Cercueil <paul@crapouillou.net>,
 Matthias Brugger <matthias.bgg@gmail.com>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Cengiz Can <cengiz@kernel.wtf>,
 Chengyang Fan <cy.fan@huawei.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Eddie Huang <eddie.huang@mediatek.com>,
 Bhaskar Chowdhury <unixbhaskar@gmail.com>, Changbin Du <changbin.du@intel.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Masahiro Yamada <masahiroy@kernel.org>,
 x86@kernel.org, linux-mediatek@lists.infradead.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Ingo Molnar <mingo@redhat.com>, linux-serial@vger.kernel.org,
 kgdb-bugreport@lists.sourceforge.net, linux-mips@vger.kernel.org,
 Wang Qing <wangqing@vivo.com>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 "Paul E. McKenney" <paulmck@kernel.org>, Johan Hovold <johan@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Borislav Petkov <bp@alien8.de>,
 Nicholas Piggin <npiggin@gmail.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Sedat Dilek <sedat.dilek@gmail.com>, Claire Chang <tientzu@chromium.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Andrij Abyzov <aabyzov@slb.com>, linux-arm-kernel@lists.infradead.org,
 kuldip dwivedi <kuldip.dwivedi@puresoftware.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Zhang Qilong <zhangqilong3@huawei.com>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Guenter Roeck <linux@roeck-us.net>, Jason Wessel <jason.wessel@windriver.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Maciej W. Rozycki" <macro@orcam.me.uk>, linuxppc-dev@lists.ozlabs.org,
 Vitor Massaru Iha <vitor@massaru.org>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Tue 2021-08-03 15:18:51, John Ogness wrote:
> Hi,
> 
> This is the next part of our printk-rework effort (points 3 and
> 4 of the LPC 2019 summary [0]).
> 
> Here the concept of "atomic consoles" is introduced through  a
> new (optional) write_atomic() callback for console drivers. This
> callback must be implemented as an NMI-safe variant of the
> write() callback, meaning that it can function from any context
> without relying on questionable tactics such as ignoring locking
> and also without relying on the synchronization of console
> semaphore.
> 
> As an example of how such an atomic console can look like, this
> series implements write_atomic() for the 8250 UART driver.
> 
> This series also introduces a new console printing mode called
> "sync mode" that is only activated when the kernel is about to
> end (such as panic, oops, shutdown, reboot). Sync mode can only
> be activated if atomic consoles are available. A system without
> registered atomic consoles will be unaffected by this series.
>
> When in sync mode, the console printing behavior becomes:
> 
> - only consoles implementing write_atomic() will be called
> 
> - printing occurs within vprintk_store() instead of
>   console_unlock(), since the console semaphore is irrelevant
>   for atomic consoles

I am fine with the new behavior at this stage. It is a quite clear
win when (only) the atomic console is used. And it does not make any
difference when atomic consoles are disabled.

But I am not sure about the proposed terms and implementation.
I want to be sure that we are on the right way for introducing
console kthreads.

Let me try to compare the behavior:

1. before this patchset():

	/* printk: store immediately; try all consoles immediately */
	int printk(...)
	{
		vprintk_store();
		if (console_try_lock()) {
			/* flush pending messages to the consoles */
			console_unlock();
		}
	}

	/* panic: try hard to flush messages to the consoles and avoid deadlock */
	void panic()
	{
		/* Ignore locks in console drivers */
		bust_spinlocks(1);

		printk("Kernel panic ...);
		dump_stack();

		smp_send_stop();
		/* ignore console lock */
		console_flush_on_panic();
	}


2. after this patchset():

   + same as before in normal mode or when there is no atomic console

   + in panic with atomic console; it modifies the behavior:

	/*
	 * printk: store immediately; immediately flush atomic consoles;
	 *         unsafe consoles are not used anymore;
	 */
	int printk(...)
	{
		vprintk_store();
		flush_atomic_consoles();
	}

	/* panic: no hacks; only atomic consoles are used */
	void panic()
	{
		printk("Kernel panic ...);
		dump_stack();
	}


3. After introducing console kthread(s):

	int printk(...)
	{
		vprintk_store();
		wake_consoles_via_irqwork();
	}

	+ in panic:

	    + with atomic console like after this patchset?
	    + without atomic consoles?

	+ during early boot?


I guess that we will need another sync mode for the early boot,
panic, suspend, kexec, etc.. It must be posible to debug these states
even wihtout atomic console and working kthreads.

Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
