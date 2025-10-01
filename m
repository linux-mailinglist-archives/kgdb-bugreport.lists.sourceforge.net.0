Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 71DDDBB0E2C
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 01 Oct 2025 16:56:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:References:In-Reply-To:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I5J/vhpe0/FboQljbpJWOtI6l+jrMQYXSKZJ27wREe8=; b=dFAk99SsUMpLPn/GvsG3nuK/3x
	MwUKGreFz+/+vONJBC0K9qafsrUFaBft9wER8R68D93lOaiRmUTC5Aax/O620LIkRITNvOMu5paZq
	LJrIQTQ1lG52SCP3Z9wfryC59XLdslWNwQFPRgawusl+yOo/mfPXH6QNMMky+LmXCxiU=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1v3yGB-0004Z7-I2
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 01 Oct 2025 14:56:51 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <john.ogness@linutronix.de>) id 1v3yG9-0004Z0-6n
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 01 Oct 2025 14:56:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=k86pFraRxRk/kzNe91Jwqta9P8GQT0RrkwicCsr3eUY=; b=ag0tvbOtv8PTBCW/0O9mpP0ARa
 NwmeTj17C5hBbR6kvTKm57AoYXqB153QpMFPg/Jydb+me3mi/AVzwOH9DNAcHxXItTjNKphgZ8F/Y
 Rs76EUUgaWp2CKbkZ2klrf75uBEh9QdaKKWvflEvccuvpYbiDVbOySXJneS0KftFy2po=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=k86pFraRxRk/kzNe91Jwqta9P8GQT0RrkwicCsr3eUY=; b=DQHBMPDzw3rRsw1Ke3oExoe+7y
 0iRBo9NXtWtK38ZIcpMRVmQ1kMVxvQBhkCOG3DseEeexQpr+FHPPC7rSrtsERBa75AXlqrRluhoJr
 2YQJ+QqJm0KHbEcf1+LdtqQlC2NRnZwjjkp0ViQg0ON8c8n2tGQazd7bxC9aSVxSSyZI=;
Received: from galois.linutronix.de ([193.142.43.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v3yG8-0004mP-Ie for kgdb-bugreport@lists.sourceforge.net;
 Wed, 01 Oct 2025 14:56:49 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1759330602;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=k86pFraRxRk/kzNe91Jwqta9P8GQT0RrkwicCsr3eUY=;
 b=eg8yIOYWKZNzT94N6xkS8Y+Zxo9EZunWrk6gYJO0wlB0n1F1mVO94GwVWbCoOC+tCEg+12
 ODfSLnsh9iLH8EK2Qqe+eACgLtK6HiECzppcIM1nuHw/f/ARCavhA1ZjvjOCEXGZHD2Fo0
 uU0/gjTXe8NGjhhOccQQqFruOHV2KQqGikLUF+vYHp9OmLWCA3rKa3xNOhKwK/yz6p/MHK
 VUMVXEiXF5H+/RaXjozHDSGk5gGNOjYG04rIquVDDZV0GzRKIKHjowFK3f/q4+J+ma0+66
 QwpteoyDwrnNqyWpzhqVUDAyVhgXcfwhL37IuHHESAXD+7Eds8ewSKrcUvtm2w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1759330602;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=k86pFraRxRk/kzNe91Jwqta9P8GQT0RrkwicCsr3eUY=;
 b=1TzFs0ci1RxD5UfBHpHSCYCm8oF4zFcHZ2k4Bs/L4C4Z1/wYl9wKgwKnjm0u7phqQMAWiU
 52TXXSlM68WZwrCw==
To: Marcos Paulo de Souza <mpdesouza@suse.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Petr Mladek <pmladek@suse.com>, Steven
 Rostedt <rostedt@goodmis.org>, Sergey Senozhatsky
 <senozhatsky@chromium.org>, Jason Wessel <jason.wessel@windriver.com>,
 Daniel Thompson <danielt@kernel.org>, Douglas Anderson
 <dianders@chromium.org>
In-Reply-To: <20250930-nbcon-kgdboc-v5-2-8125893cfb4f@suse.com>
References: <20250930-nbcon-kgdboc-v5-0-8125893cfb4f@suse.com>
 <20250930-nbcon-kgdboc-v5-2-8125893cfb4f@suse.com>
Date: Wed, 01 Oct 2025 17:02:41 +0206
Message-ID: <84h5wihdqu.fsf@jogness.linutronix.de>
MIME-Version: 1.0
X-Spam-Score: 0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2025-09-30, Marcos Paulo de Souza <mpdesouza@suse.com>
 wrote: > diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c > index
 558ef31779760340ce42608294d91d5401239f1d..c23abed5933527cb7c6bcc42 [...] 
 Content analysis details:   (0.4 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.6 INVALID_DATE_TZ_ABSURD Invalid Date: header (timezone does not exist)
X-Headers-End: 1v3yG8-0004mP-Ie
Subject: Re: [Kgdb-bugreport] [PATCH v5 2/5] printk: nbcon: Introduce KDB
 helpers
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
 Marcos Paulo de Souza <mpdesouza@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On 2025-09-30, Marcos Paulo de Souza <mpdesouza@suse.com> wrote:
> diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
> index 558ef31779760340ce42608294d91d5401239f1d..c23abed5933527cb7c6bcc42057fadbb44a43446 100644
> --- a/kernel/printk/nbcon.c
> +++ b/kernel/printk/nbcon.c
> @@ -1855,3 +1855,69 @@ void nbcon_device_release(struct console *con)
>  	console_srcu_read_unlock(cookie);
>  }
>  EXPORT_SYMBOL_GPL(nbcon_device_release);
> +
> +/**
> + * nbcon_kdb_try_acquire - Try to acquire nbcon console, enter unsafe
> + *				section, and initialized nbcon write context

                               initialize ---^^^^^^^^^^^

And technically it is not initializing the write context, just the
console ownership context. I'm not sure it is really necessary to
mention that.

> + * @con:	The nbcon console to acquire
> + * @wctxt:	The nbcon write context to be used on success
> + *
> + * Context:	Under console_srcu_read_lock() for emiting a single kdb message

                                       emitting ---^^^^^^^

"./scripts/checkpatch.pl --codespell" is your friend. ;-)

> + *		using the given con->write_atomic() callback. Can be called
> + *		only when the console is usable at the moment.
> + *
> + * Return:	True if the console was acquired. False otherwise.
> + *
> + * kdb emits messages on consoles registered for printk() without
> + * storing them into the ring buffer. It has to acquire the console
> + * ownerhip so that it could call con->write_atomic() callback a safe way.
> + *
> + * This function acquires the nbcon console using priority NBCON_PRIO_EMERGENCY
> + * and marks it unsafe for handover/takeover.
> + */
> +bool nbcon_kdb_try_acquire(struct console *con,
> +			   struct nbcon_write_context *wctxt)
> +{
> +	struct nbcon_context *ctxt = &ACCESS_PRIVATE(wctxt, ctxt);
> +
> +	memset(ctxt, 0, sizeof(*ctxt));
> +	ctxt->console = con;
> +	ctxt->prio    = NBCON_PRIO_EMERGENCY;
> +
> +	if (!nbcon_context_try_acquire(ctxt, false))
> +		return false;
> +
> +	if (!nbcon_context_enter_unsafe(ctxt))
> +		return false;
> +
> +	return true;
> +}
> +
> +/**
> + * nbcon_kdb_release - Exit unsafe section and release the nbcon console
> + *
> + * @wctxt:	The nbcon write context initialized by a successful
> + *		nbcon_kdb_try_acquire()
> + *
> + * Context:	Under console_srcu_read_lock() for emiting a single kdb message

                                       emitting ---^^^^^^^

> + *		using the given con->write_atomic() callback. Can be called
> + *		only when the console is usable at the moment.

I do not think the "Context" is relevant. It must be called if
a previous call to nbcon_kdb_try_acquire() was successful.

> + */
> +void nbcon_kdb_release(struct nbcon_write_context *wctxt)
> +{
> +	struct nbcon_context *ctxt = &ACCESS_PRIVATE(wctxt, ctxt);
> +
> +	if (!nbcon_context_exit_unsafe(ctxt))
> +		return;
> +
> +	nbcon_context_release(ctxt);
> +
> +	/*
> +	 * Flush any new printk() messages added when the console was blocked.
> +	 * Only the console used by the given write context was	blocked.
> +	 * The console was locked only when the write_atomic() callback
> +	 * was usable.
> +	 */
> +	__nbcon_atomic_flush_pending_con(ctxt->console,
> +					 prb_next_reserve_seq(prb), false);

This can all be one line. 100 characters is the official limit for code.

> +}


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
