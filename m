Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 96AF1B032EC
	for <lists+kgdb-bugreport@lfdr.de>; Sun, 13 Jul 2025 22:36:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:References:In-Reply-To:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=21I1X5Fxz4ihLEES50vPHKwBjoqPU1gKVN0kXGz50B4=; b=mrngRNS0jtUP2mUL+2NHgfkmEz
	H8iVzw5RAfoQM8FniNMgtGteY5UrbDGzGpPAXpNVHpbSieVXUgpdCbt5Z5LiGK1QiuZ4YyQ17SxLs
	LCOHzUGa/DmfQcq+pzkEpLEW7XYldhVw/NfxoVfV/I1QtyMNDljNZ1KInz+WUvLKWlas=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1ub3R1-00024L-Fv
	for lists+kgdb-bugreport@lfdr.de;
	Sun, 13 Jul 2025 20:36:31 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <john.ogness@linutronix.de>) id 1ub3R0-00024E-6E
 for kgdb-bugreport@lists.sourceforge.net;
 Sun, 13 Jul 2025 20:36:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UJ5zhQJGb7kOJ6QCoOgQhr3q1mLVIu5/uEbNE7bwy98=; b=FWEXq16GSq7nUH2IdW8VLTUomF
 7O2sAN5vxFCfZhFjCIuOayNJ0UFmPqRIibQRbf8FaPcEyqjwI9gx5N3ZZXMnnKKxRln5j401vZAou
 Pxu2dyKDRZ2RQ9+qVhIcQ14vur/2JFCmIf81tCWp2BWUUGCq+ogFo+I5k053yzSgKkc8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UJ5zhQJGb7kOJ6QCoOgQhr3q1mLVIu5/uEbNE7bwy98=; b=DVSjkcU16G68SfOSMfUY2F9TNc
 Gi4SzZ7qMsVdlU6hy/VCFfhRLo7UBxL15KXcEaVGRQmNivQK4DSJrSIJl7gew8oeeD69EP4wRmUEq
 XGoEgPLKMjZqXzHChnohXURe8kk/VojY06M1v11ipQgytgTzd90nfiAr2Xn0vMpkBCmU=;
Received: from galois.linutronix.de ([193.142.43.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ub3Qz-0003v4-Kw for kgdb-bugreport@lists.sourceforge.net;
 Sun, 13 Jul 2025 20:36:30 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1752438978;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UJ5zhQJGb7kOJ6QCoOgQhr3q1mLVIu5/uEbNE7bwy98=;
 b=cydsYNcjtaf4IhedRED+BXjoK/j006BHzhW6EiEYNV6BVWEikEcF6C+hykZqEXn7hZSXkP
 WB1GtU2TebQ4qZ+7Fj1YcOvVWoUxj6SZJzxjCa4IFXR+USpf6yQwXTPY3y2+QTYvX38nA4
 uH3QfY6e9s1I88BKvl5FDpRDr83Clw8sKWMebF46r5p5p1kwMez7SkJhtAMDaD92vzj1bK
 mk4OWy/TdgPrz5xtxVC+TcLZVjEuXo1u09+aOHoVv6UwTBFsO0Pv5xSvymvsm8d5UdbSmK
 P/SEceqxklIbstdAp8o6PRMGZbtlT3pr7zoHvNptswLHvfWzQNW6tuB/7SmOhA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1752438978;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UJ5zhQJGb7kOJ6QCoOgQhr3q1mLVIu5/uEbNE7bwy98=;
 b=3rhC55JJ1QdMczS65PGWJCqo94ktb0DXxK70kliM9GPi6sKoMmv3aw3F+ZTE2zKRlVRskX
 Jx50btrlTMXTmgAg==
To: Marcos Paulo de Souza <mpdesouza@suse.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Petr Mladek <pmladek@suse.com>, Steven
 Rostedt <rostedt@goodmis.org>, Sergey Senozhatsky
 <senozhatsky@chromium.org>, Jason Wessel <jason.wessel@windriver.com>,
 Daniel Thompson <danielt@kernel.org>, Douglas Anderson
 <dianders@chromium.org>
In-Reply-To: <20250713-nbcon-kgdboc-v1-2-51eccd9247a8@suse.com>
References: <20250713-nbcon-kgdboc-v1-0-51eccd9247a8@suse.com>
 <20250713-nbcon-kgdboc-v1-2-51eccd9247a8@suse.com>
Date: Sun, 13 Jul 2025 22:42:17 +0206
Message-ID: <84ldorx1z2.fsf@jogness.linutronix.de>
MIME-Version: 1.0
X-Spam-Score: 0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2025-07-13, Marcos Paulo de Souza <mpdesouza@suse.com>
 wrote: > diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
 > index 9b11b10b120cf07e451a7a4d92ce50f9a6c066b2..3b7365c11d06b01d [...] 
 Content analysis details:   (0.4 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.6 INVALID_DATE_TZ_ABSURD Invalid Date: header (timezone does not exist)
X-Headers-End: 1ub3Qz-0003v4-Kw
Subject: Re: [Kgdb-bugreport] [PATCH 2/2] kdb: Adapt kdb_msg_write to work
 with NBCON consoles
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

On 2025-07-13, Marcos Paulo de Souza <mpdesouza@suse.com> wrote:
> diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
> index 9b11b10b120cf07e451a7a4d92ce50f9a6c066b2..3b7365c11d06b01d487767fd89f1081da10dd2ed 100644
> --- a/kernel/debug/kdb/kdb_io.c
> +++ b/kernel/debug/kdb/kdb_io.c
> @@ -558,6 +558,25 @@ static int kdb_search_string(char *searched, char *searchfor)
>  	return 0;
>  }
>  
> +static struct nbcon_context *nbcon_acquire_ctxt(struct console *con,
> +					struct nbcon_write_context *wctxt,
> +					char *msg, int msg_len)
> +{
> +	struct nbcon_context *ctxt = &ACCESS_PRIVATE(wctxt, ctxt);
> +
> +	ctxt->console		    = con;
> +	ctxt->spinwait_max_us	    = 0;
> +	ctxt->prio		    = NBCON_PRIO_EMERGENCY;
> +	ctxt->allow_unsafe_takeover = false;
> +	wctxt->outbuf		    = msg;
> +	wctxt->len		    = msg_len;
> +
> +	if (!nbcon_context_try_acquire(ctxt))
> +		return NULL;
> +
> +	return ctxt;

This function is grabbing a reference to a private member and returning
it, thus exposing internals. Can we instead create a proper API in
kernel/printk/nbcon.c for kdb?

For example, take a look at:

nbcon_device_try_acquire() and nbcon_device_release()

We could have something similar for kdb, such as:

bool *nbcon_kdb_try_acquire(struct nbcon_write_context *wctxt,
			    struct console *con, char *msg, int msg_len);

void nbcon_kdb_release(struct nbcon_write_context *wctxt);

> +}
> +
>  static void kdb_msg_write(const char *msg, int msg_len)
>  {
>  	struct console *c;
> @@ -589,12 +608,26 @@ static void kdb_msg_write(const char *msg, int msg_len)
>  	 */
>  	cookie = console_srcu_read_lock();
>  	for_each_console_srcu(c) {
> -		if (!(console_srcu_read_flags(c) & CON_ENABLED))
> +		struct nbcon_write_context wctxt = { };
> +		struct nbcon_context *ctxt;

With the above suggestion we do not need @ctxt.

> +		short flags = console_srcu_read_flags(c);
> +
> +		if (!console_is_usable(c, flags, true))
>  			continue;
>  		if (c == dbg_io_ops->cons)
>  			continue;
> -		if (!c->write)
> -			continue;
> +
> +		/*
> +		 * Do not continue if the console is NBCON and the context
> +		 * can't be acquired.
> +		 */
> +		if (flags & CON_NBCON) {
> +			ctxt = nbcon_acquire_ctxt(c, &wctxt, (char *)msg,
> +						  msg_len);
> +			if (!ctxt)
> +				continue;

And this becomes:

			if (!nbcon_kdb_try_acquire(&wctxt, c, (char *)msg, msg_len))
				continue;
> +		}
> +
>  		/*
>  		 * Set oops_in_progress to encourage the console drivers to
>  		 * disregard their internal spin locks: in the current calling
> @@ -605,7 +638,12 @@ static void kdb_msg_write(const char *msg, int msg_len)
>  		 * for this calling context.
>  		 */
>  		++oops_in_progress;
> -		c->write(c, msg, msg_len);
> +		if (flags & CON_NBCON) {
> +			c->write_atomic(c, &wctxt);
> +			nbcon_context_release(ctxt);

And this becomes:

			nbcon_kdb_release(&wctxt);

> +		} else {
> +			c->write(c, msg, msg_len);
> +		}
>  		--oops_in_progress;
>  		touch_nmi_watchdog();
>  	}

John Ogness


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
