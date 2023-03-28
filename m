Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 242CA6CC10A
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 28 Mar 2023 15:34:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1ph9Sf-0003SM-JZ
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 28 Mar 2023 13:34:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1ph9Se-0003SG-M3
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 28 Mar 2023 13:34:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3BoN+48VeBrXOxliIGKwWmQ5Q5D6Gju28AqzttPr2pQ=; b=hQrPts52DA9PKGa5QKHaMpBAdf
 GpAR+9txKU0yxQrB9zzPipfDPhcPBM6q59sMWh8zK05Jpoz7UKSMNxoM/tyWKKXMy5hnVgWAWZ6Zy
 DtYUNqlJJv0WPdTIt0ki6On1WcDLQJ3kafoEdukh6naNOFp0EgKRcAaLy4tUYbciLvdc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3BoN+48VeBrXOxliIGKwWmQ5Q5D6Gju28AqzttPr2pQ=; b=g4pSlokmE5pQAqNfXgjUyfANdH
 Fcjp/6q8mGTfnyT8NsTCP00Cs7yEcDP6U+T9WpDSEG4BZXKiT1biBBR3bKlAEDDlN8r0MTJX4SrU+
 Vna2+N2TB90KeCMyvah6/yRUAKXAp5lfXlyWBYe+iDNZk0IVEXKnRhmd1uFiNdC3XZc0=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1ph9Sa-000839-GK for kgdb-bugreport@lists.sourceforge.net;
 Tue, 28 Mar 2023 13:34:04 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id EF8E71FD68;
 Tue, 28 Mar 2023 13:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1680010430; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3BoN+48VeBrXOxliIGKwWmQ5Q5D6Gju28AqzttPr2pQ=;
 b=NDBPOWONkO/XyopTbjq7QQi+LbxwWvkVhmZUlpn1UEodXmVBKItnP5UxQj+Ez4GFFrckhx
 HxqxIgvG9W+FK23aN5uy1xUt/vFy5zg/u2OsZdE2oW3ygPdQhq72roeGMSeIYiIjy6D5IZ
 022BVxN4ShNQMFBkS/jUDs8jxMcmUoM=
Received: from suse.cz (unknown [10.100.201.202])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id E706B2C141;
 Tue, 28 Mar 2023 13:33:46 +0000 (UTC)
Date: Tue, 28 Mar 2023 15:33:46 +0200
To: John Ogness <john.ogness@linutronix.de>
Message-ID: <ZCLsuln0nHr7S9a5@alley>
References: <20230302195618.156940-1-john.ogness@linutronix.de>
 <87wn3zsz5x.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87wn3zsz5x.fsf@jogness.linutronix.de>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu 2023-03-02 21:04:50, John Ogness wrote: > Implement
 the necessary callbacks to allow the 8250 console driver > to perform as
 a non-BKL console. Remove the implementation for the > legacy consol [...]
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.29 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1ph9Sa-000839-GK
Subject: [Kgdb-bugreport] locking API: was: [PATCH printk v1 00/18] serial:
 8250: implement non-BKL console
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
Cc: kgdb-bugreport@lists.sourceforge.net,
 Lai Jiangshan <jiangshanlai@gmail.com>,
 Joel Fernandes <joel@joelfernandes.org>, Tiezhu Yang <yangtiezhu@loongson.cn>,
 Neeraj Upadhyay <quic_neeraju@quicinc.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Aaron Tomlin <atomlin@redhat.com>, "Paul E. McKenney" <paulmck@kernel.org>,
 Frederic Weisbecker <frederic@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 Josh Triplett <josh@joshtriplett.org>, Steven Rostedt <rostedt@goodmis.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 David Gow <davidgow@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 rcu@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, Sergey Senozhatsky <senozhatsky@chromium.org>,
 Luis Chamberlain <mcgrof@kernel.org>, tangmeng <tangmeng@uniontech.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Thu 2023-03-02 21:04:50, John Ogness wrote:
> Implement the necessary callbacks to allow the 8250 console driver
> to perform as a non-BKL console. Remove the implementation for the
> legacy console callback (write) and add implementations for the
> non-BKL consoles (write_atomic, write_thread, port_lock) and add
> CON_NO_BKL to the initial flags.
> 
> This is an all-in-one commit meant only for testing the new printk
> non-BKL infrastructure. It is not meant to be included mainline in
> this form. In particular, it includes mainline driver fixes that
> need to be submitted individually.
> 
> Although non-BKL consoles can coexist with legacy consoles, you
> will only receive all the benefits of the non-BKL consoles, if
> this console driver is the only console. That means no netconsole,
> no tty1, no earlyprintk, no earlycon. Just the uart8250.
> 
> For example: console=ttyS0,115200
> 
> --- a/drivers/tty/serial/8250/8250_port.c
> +++ b/drivers/tty/serial/8250/8250_port.c
> +static void atomic_console_reacquire(struct cons_write_context *wctxt,
> +				     struct cons_write_context *wctxt_init)
> +{
> +	memcpy(wctxt, wctxt_init, sizeof(*wctxt));
> +	while (!console_try_acquire(wctxt)) {
> +		cpu_relax();
> +		memcpy(wctxt, wctxt_init, sizeof(*wctxt));
> +	}
> +}
> +
>  /*
> - * Print a string to the serial port using the device FIFO
> - *
> - * It sends fifosize bytes and then waits for the fifo
> - * to get empty.
> + * It should be possible to support a hostile takeover in an unsafe
> + * section if it is write_atomic() that is being taken over. But where
> + * to put this policy?
>   */
> -static void serial8250_console_fifo_write(struct uart_8250_port *up,
> -					  const char *s, unsigned int count)
> +bool serial8250_console_write_atomic(struct uart_8250_port *up,
> +				     struct cons_write_context *wctxt)
>  {
> -	int i;
> -	const char *end = s + count;
> -	unsigned int fifosize = up->tx_loadsz;
> -	bool cr_sent = false;
> -
> -	while (s != end) {
> -		wait_for_lsr(up, UART_LSR_THRE);
> -
> -		for (i = 0; i < fifosize && s != end; ++i) {
> -			if (*s == '\n' && !cr_sent) {
> -				serial_out(up, UART_TX, '\r');
> -				cr_sent = true;
> -			} else {
> -				serial_out(up, UART_TX, *s++);
> -				cr_sent = false;
> -			}
> +	struct cons_write_context wctxt_init = {};
> +	struct cons_context *ctxt_init = &ACCESS_PRIVATE(&wctxt_init, ctxt);
> +	struct cons_context *ctxt = &ACCESS_PRIVATE(wctxt, ctxt);
> +	bool can_print = true;
> +	unsigned int ier;
> +
> +	/* With write_atomic, another context may hold the port->lock. */
> +
> +	ctxt_init->console = ctxt->console;
> +	ctxt_init->prio = ctxt->prio;
> +	ctxt_init->thread = ctxt->thread;
> +
> +	touch_nmi_watchdog();
> +
> +	/*
> +	 * Enter unsafe in order to disable interrupts. If the console is
> +	 * lost before the interrupts are disabled, bail out because another
> +	 * context took over the printing. If the console is lost after the
> +	 * interrutps are disabled, the console must be reacquired in order
> +	 * to re-enable the interrupts. However in that case no printing is
> +	 * allowed because another context took over the printing.
> +	 */
> +
> +	if (!console_enter_unsafe(wctxt))
> +		return false;
> +
> +	if (!__serial8250_clear_IER(up, wctxt, &ier))
> +		return false;
> +
> +	if (console_exit_unsafe(wctxt)) {
> +		can_print = atomic_print_line(up, wctxt);
> +		if (!can_print)
> +			atomic_console_reacquire(wctxt, &wctxt_init);

I am trying to review the 9th patch adding console_can_proceed(),
console_enter_unsafe(), console_exit_unsafe() API. And I wanted
to see how the struct cons_write_context was actually used.

I am confused now. I do not understand the motivation for the extra
@wctxt_init copy and atomic_console_reacquire().

Why do we need a copy? And why we need to reacquire it?

My feeling is that it is needed only to call
console_exit_unsafe(wctxt) later. Or do I miss anything?

> +
> +		if (can_print) {
> +			can_print = console_can_proceed(wctxt);
> +			if (can_print)
> +				wait_for_xmitr(up, UART_LSR_BOTH_EMPTY);
> +			else
> +				atomic_console_reacquire(wctxt, &wctxt_init);
> +		}
> +	} else {
> +		atomic_console_reacquire(wctxt, &wctxt_init);
> +	}
> +
> +	/*
> +	 * Enter unsafe in order to enable interrupts. If the console is
> +	 * lost before the interrupts are enabled, the console must be
> +	 * reacquired in order to re-enable the interrupts.
> +	 */
> +
> +	for (;;) {
> +		if (console_enter_unsafe(wctxt) &&
> +		    __serial8250_set_IER(up, wctxt, ier)) {
> +			break;
>  		}
> +
> +		/* HW-IRQs still disabled. Reacquire to enable them. */
> +		atomic_console_reacquire(wctxt, &wctxt_init);
>  	}
> +
> +	console_exit_unsafe(wctxt);
> +
> +	return can_print;
>  }

Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
