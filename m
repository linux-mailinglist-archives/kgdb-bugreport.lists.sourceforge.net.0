Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E10B3A481
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 28 Aug 2025 17:32:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g3VurFp+iGBs++3yKmA0ak/zez+9oLEZtadvAibJpKc=; b=mSdwm34RWP9R0JRFoNHPTRk5Us
	KMXKXtMKzONfU5o5k1dMWh/zzUe36FCYzlUm2VRtAuzJDT2hL9JsYE7ipCXF9UNKB6FvlBNGcQ9zD
	potv1v+Qa6pBHNkSfLvMDOrOsTx3au956gvQuB8L4MQEvrBgADn3frqfMixGIz53qLVA=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1urec1-0003ox-Ql
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 28 Aug 2025 15:32:29 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1urebz-0003op-KM
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 28 Aug 2025 15:32:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=K5c+soFxj1JAcKaj+Wa0WnFtoE0EOupVzeg9P7UdtkM=; b=fwy5vzFAaf5YTqkLmYH6uQez44
 aLEB0Rv5gr9rZpAxVabVR4oUoE8ZykP741mBV3DAtDhw5qzmdwGbsUYXVSBF7E0UUpwWmT0yu7LJd
 aSvG9iK1NZXOSTN68XdEkQ/I4B5Ps/FhJo9moBvQDtigbyhnd3te/dSVG+4xfgALhgDY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=K5c+soFxj1JAcKaj+Wa0WnFtoE0EOupVzeg9P7UdtkM=; b=l14cLM8mELvLfj/j1AxcCyJOrQ
 FIzZbPPKCsYIYX6H0HyjMkLZED4sPgDwjgf4brt3dcVI9OvDh+xZtLBt+fNJ3uCtwdj1D03QibKzh
 CFM0kvu22Nwu1EDrARQkD6lJ2B2E1SNNBymNNBOkvLglYgiCPZChaXY78c6ovlf63k14=;
Received: from mail-ed1-f45.google.com ([209.85.208.45])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1urebz-0006Ni-2M for kgdb-bugreport@lists.sourceforge.net;
 Thu, 28 Aug 2025 15:32:27 +0000
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-6188b5ad681so1302805a12.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 28 Aug 2025 08:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1756395135; x=1756999935; darn=lists.sourceforge.net; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=K5c+soFxj1JAcKaj+Wa0WnFtoE0EOupVzeg9P7UdtkM=;
 b=H6pzf7EaK0+yVJER9NG7GlIrMlX5jk5AYPGnQWTP+1jD7UZTGRJVI4cuI2opaWjOH5
 ZdbqVk1/pMAu6802BIi6kgb/IoRhi3oXsXYjjjmDx791Yxji8nGg3fvL9YRVOyQjqaFE
 WDxaZGd7zSQtBBuGjwKX2aNHYOC+szlhaVwUOEbQsAFKTMMRky4oXiHs5Mcy/+zdltwn
 mJ3OLxWJRz0Xs23T1Y8MyGGiTyH9QBoOj072bk9+ro+h/KIkx0RAa3vxuU2VArrT/eYJ
 h4UMB/EpHqExcPdyZ3Zy24yO6FnnXbMJXOAbHGvQ+ylhpJjQsDC5MHm4tTk/5aoWBeSt
 uqqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756395135; x=1756999935;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K5c+soFxj1JAcKaj+Wa0WnFtoE0EOupVzeg9P7UdtkM=;
 b=TUpreuWq/ezq09YZk5+TqdFdZPKumEu6YsQ4DTY36aJs3fTBdslPoJ7zZd9ruWDQv8
 pfssKqV9N4QGHd4/6WJhCFz/NRGBfCiTS2TLhim7V9Mg2qbn6QGjWOvopfpWt0snqVoJ
 lMZwmou9/j0+W/HfqFKiDdoR+9l3xxs1l60koVrzu9R6+D6hkmJjiS9OQgZvEg0hgFBe
 Pw1tmfBI8ffzNiKUWpiLsVSX8Mnudz1SM5uRoW9ht0+IHWrjfk2ueY1wGQ8HGnHUiAZ1
 x1u2i34P0kovE0EEB3QgtmmExqbg97BojgzpKqtS9rslJPVXcqTbkFYfiYrjF5yCrSAL
 K6JQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4O28QkX8jcv19/v1rsDtD8bczFRy7iTYmWiaESStnqcnDVyVRXYfBiiORFJ4TZ1sqgWrcoDnfvFFqAt8rOQ==@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxUzJfjNYPbfXcnY7nHuZnIFnmCkBh3V+8VVr5Cqn/MYZfphF1h
 fNoolOtFXrheySsQFxkd7uYT/eBlCNBZqYKRdueXh4lAd+iNjwdm+xX2FNkUMi/rMYjjOFClDSm
 R/kCR
X-Gm-Gg: ASbGncs+91wCJePhZLRlxphkw4GdWezPiu+mrNl32OMF+4Rsv5el1AQkSEo8mEWkkG/
 c525BSNtWNj/36w0WIPQ0/uuYerSf3sqYKLyZvbh7eyB68Y8CN8a3t/Nwc8PckUu8D2FCEkOe/p
 c3p+cDL2rz6Xv+eMLjOm9PO02i1SiGa8XFyBSrh1ulA/nrUbtK1bp1hzv7h1UkE/8MpZgQsWf5e
 v4Qo6NyT4J6aozrk2eAlt6SefY1XHJFOgRBVxSkK1A5bMbvMnQzl9ja9EY8opmxkdfBtPa5uhxZ
 P0SrrErWBJFz5B6w1hXwtZqDsCrYbCJZDwxmUNkHfx/1BXRrQykLU6Iox5BiHPLajQE7SQtpGBl
 kZ24PtJzsxFnlivHTObqCzoyqgoIeX4EUkTbX
X-Google-Smtp-Source: AGHT+IHrJdfc/hnzkWws47dv4FvLrZ7eywma5iHdwN+sbK/iexQLUf7HcDQJGJ4d3y0a7koYmFPZPA==
X-Received: by 2002:a17:906:c10d:b0:afe:c2e7:36f1 with SMTP id
 a640c23a62f3a-afec2e7424emr550890266b.0.1756394774829; 
 Thu, 28 Aug 2025 08:26:14 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afeae4ca4bdsm601522666b.5.2025.08.28.08.26.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Aug 2025 08:26:14 -0700 (PDT)
Date: Thu, 28 Aug 2025 17:26:12 +0200
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Message-ID: <aLB1FCc-IJNxjgIy@pathway.suse.cz>
References: <20250811-nbcon-kgdboc-v2-0-c7c72bcdeaf6@suse.com>
 <20250811-nbcon-kgdboc-v2-2-c7c72bcdeaf6@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250811-nbcon-kgdboc-v2-2-c7c72bcdeaf6@suse.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon 2025-08-11 10:32:46, Marcos Paulo de Souza wrote: >
 These helpers will be used when calling console->write_atomic on > KDB code
 in the next patch. It's basically the same implementaion > as nbc [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.45 listed in wl.mailspike.net]
X-Headers-End: 1urebz-0006Ni-2M
Subject: Re: [Kgdb-bugreport] [PATCH v2 2/3] printk: nbcon: Introduce KDB
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
From: Petr Mladek via Kgdb-bugreport <kgdb-bugreport@lists.sourceforge.net>
Reply-To: Petr Mladek <pmladek@suse.com>
Cc: John Ogness <john.ogness@linutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Daniel Thompson <danielt@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 kgdb-bugreport@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Mon 2025-08-11 10:32:46, Marcos Paulo de Souza wrote:
> These helpers will be used when calling console->write_atomic on
> KDB code in the next patch. It's basically the same implementaion
> as nbcon_device_try_acquire, but using NBCON_PORIO_EMERGENCY when
> acquiring the context.
> 
> For release, differently from nbcon_device_release, we don't need to
> flush the console, since all CPUs are stopped when KDB is active.

I thought this when we were discussion the code, especially the
comment in

static void kdb_msg_write(const char *msg, int msg_len)
{
[...]

	/*
	 * The console_srcu_read_lock() only provides safe console list
	 * traversal. The use of the ->write() callback relies on all other
	 * CPUs being stopped at the moment and console drivers being able to
	 * handle reentrance when @oops_in_progress is set.


But I see that kdb_msg_write() is called from vkdb_printf() and
there is the following synchronization:

int vkdb_printf(enum kdb_msgsrc src, const char *fmt, va_list ap)
{
[...]

	/* Serialize kdb_printf if multiple cpus try to write at once.
	 * But if any cpu goes recursive in kdb, just print the output,
	 * even if it is interleaved with any other text.
	 */
	local_irq_save(flags);
	this_cpu = smp_processor_id();
	for (;;) {
		old_cpu = cmpxchg(&kdb_printf_cpu, -1, this_cpu);
		if (old_cpu == -1 || old_cpu == this_cpu)
			break;

		cpu_relax();
	}

It suggests that the code might be used when other CPUs are still
running.

And for example, kgdb_panic(buf) is called in vpanic() before
the other CPUs are stopped.


My opinion:

It might make sense to flush the console after all. But probably
only the particular console, see below.

> --- a/kernel/printk/nbcon.c
> +++ b/kernel/printk/nbcon.c
> @@ -1855,3 +1855,29 @@ void nbcon_device_release(struct console *con)
>  	console_srcu_read_unlock(cookie);
>  }
>  EXPORT_SYMBOL_GPL(nbcon_device_release);
> +

The function must be called only in the very specific kdb
context, so it would deserve a comment. Inspired by
nbcon_device_try_acquire():

/**
 * nbcon_kdb_try_acquire - Try to acquire nbcon console, enter unsafe
 *				section, and initialized nbcon write context
 * @con:	The nbcon console to acquire
 * @wctxt:	The nbcon write context to be used on success
 *
 * Context:	Under console_srcu_read_lock() for emiting a single kdb message
 *		using the given con->write_atomic() callback. Can be called
 *		only when the console is usable at the moment.
 *
 * Return:	True if the console was acquired. False otherwise.
 *
 * kdb emits messages on consoles registered for printk() without
 * storing them into the ring buffer. It has to acquire the console
 * ownerhip so that is could call con->write_atomic() callback a safe way.
 *
 * This function acquires the nbcon console using priority NBCON_PRIO_EMERGENCY
 * and marks it unsafe for handover/takeover.
 */

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

It deserves a comment as well, see below:

> +void nbcon_kdb_release(struct nbcon_write_context *wctxt)
> +{
> +	struct nbcon_context *ctxt = &ACCESS_PRIVATE(wctxt, ctxt);
> +
> +	nbcon_context_exit_unsafe(ctxt);
> +	nbcon_context_release(ctxt);

I agree with John that the _release() should be called only when
exit_unsafe() succeeded.

Also it might make sense to flush the console. I would do something
like:


/**
 * nbcon_kdb_release - Exit unsafe section and release the nbcon console
 *
 * @wctxt:	The nbcon write context intialized by a succesful
 *	nbcon_kdb_try_acquire()
 *
 * Context:	Under console_srcu_read_lock() for emiting a single kdb message
 *		using the given con->write_atomic() callback. Can be called
 *		only when the console is usable at the moment.
 */
void nbcon_kdb_release(struct nbcon_write_context *wctxt)
{
	struct nbcon_context *ctxt = &ACCESS_PRIVATE(wctxt, ctxt);

	nbcon_context_exit_unsafe(ctxt);
	nbcon_context_release(ctxt);

	if (!nbcon_context_exit_unsafe(ctxt))
		return;

	nbcon_context_release(ctxt);

	/*
	 * Flush any new printk() messages added when the console was blocked.
	 * Only the console used by the given write context was	blocked.
	 * The console was locked only when the write_atomic() callback
	 * was usable.
	 */
	__nbcon_atomic_flush_pending_con(ctxt->console, prb_next_reserve_seq(prb), false);


Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
