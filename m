Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C10B36C66
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 26 Aug 2025 16:56:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:References:In-Reply-To:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1KMvz402H0EZRBSPLIsNDApzqlw08kW6hTQhwRhFRns=; b=I7LGtJuG4R5VVPPJipBT8FIdts
	OS2pt5T2TNdOSUX7PFq8z3+4Yg5xZhMsa4qk3GEm96VbAGVjt3CZzvcSMkl9J2M2y2Eg36oXyoIpj
	Sr/uyh70TC8epGu07b3OLiviKQEKLHdzhfePTiFsA3R0RzHCWtbzAx+ba2agtCQukwt0=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1uqv5g-0006Jy-Pq
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 26 Aug 2025 14:56:04 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <john.ogness@linutronix.de>) id 1uqv5e-0006Jr-QW
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 26 Aug 2025 14:56:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4kY00LpSA1e+7KmQQ5LdYtL9aisEt5i8Y//Pi9j1m38=; b=Hat2TrgIqusivqUqTgL8Rr+pES
 ZVFRlm9ofLgJtbnqHETRKFog7F0dS3JQI4sHTAE0mmE1zGGCMj924ZRsAgVk9aeQFLjyZEp5mPt00
 Z3zzrbi2/U1/Q3aj6Dxw76Q3XLtlujHuncQiAkb3MkGSyn/cYszfQ4i0a/2OCvnw3tVY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4kY00LpSA1e+7KmQQ5LdYtL9aisEt5i8Y//Pi9j1m38=; b=BGYataIhaNeq5TAvjWfgsRCu1X
 kfO75khQgb+GGQ+b8lnZiFqzqCZHWFBUrehV6TGN1xGnLacVIFxukiWRt65IiLwXokCRIBqmp62H1
 WAHza90I5jsiqC12okaeuBsHieh9gzuLLsWRcAkrEiQJdt/X+PBUjkgiruWWHSwsNdHg=;
Received: from galois.linutronix.de ([193.142.43.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uqv5e-0003d7-5T for kgdb-bugreport@lists.sourceforge.net;
 Tue, 26 Aug 2025 14:56:02 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1756218648;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4kY00LpSA1e+7KmQQ5LdYtL9aisEt5i8Y//Pi9j1m38=;
 b=07DdwaqkdqIkCv8/fRjdp9cP0XJ2V+HwR8FueWVYW7BnR+a1tTKT8fopw6BWkiyadgMbF0
 7kXaRjaNUBj8BmjkuLVzhOo16LdKJ9ypDUxslANHJpKbS4K/ob/BX90uezuAsWWvUXZkwW
 0TdFxOhE/LE6d0zMq9U0k5p01WhX2GJleZBIFA/InYKM/G8fEgu7fiTi9g5gvS9LcbHZ7V
 8kmrbPkkpAeU1EcUW1Zrxx/oKAsIE1PAXxps9Tnh/Yz9QiTAHg7blZMkJCZo1QUmJTkC8H
 4Er1wd1Lu52nSe/19t3yhvi2RxVo3GcgTYge9jRleZNFgFzfxfLlnj45gaAAmw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1756218648;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4kY00LpSA1e+7KmQQ5LdYtL9aisEt5i8Y//Pi9j1m38=;
 b=ugVsECJRPzPrArp281QkG6OSB0TzUWsGy2y0Hc0UwLy8h+/Po9bJgNTGIY5o7ErW9RR6K5
 IJqYuzjpVnep7TBA==
To: Marcos Paulo de Souza <mpdesouza@suse.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Petr Mladek <pmladek@suse.com>, Steven
 Rostedt <rostedt@goodmis.org>, Sergey Senozhatsky
 <senozhatsky@chromium.org>, Jason Wessel <jason.wessel@windriver.com>,
 Daniel Thompson <danielt@kernel.org>, Douglas Anderson
 <dianders@chromium.org>
In-Reply-To: <20250811-nbcon-kgdboc-v2-2-c7c72bcdeaf6@suse.com>
References: <20250811-nbcon-kgdboc-v2-0-c7c72bcdeaf6@suse.com>
 <20250811-nbcon-kgdboc-v2-2-c7c72bcdeaf6@suse.com>
Date: Tue, 26 Aug 2025 16:36:47 +0206
Message-ID: <84jz2qkve0.fsf@jogness.linutronix.de>
MIME-Version: 1.0
X-Spam-Score: 0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2025-08-11, Marcos Paulo de Souza <mpdesouza@suse.com>
 wrote: > These helpers will be used when calling console->write_atomic on
 > KDB code in the next patch. It's basically the same implementaion [...] 
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
X-Headers-End: 1uqv5e-0003d7-5T
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
Cc: kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 Marcos Paulo de Souza <mpdesouza@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On 2025-08-11, Marcos Paulo de Souza <mpdesouza@suse.com> wrote:
> These helpers will be used when calling console->write_atomic on
> KDB code in the next patch. It's basically the same implementaion
> as nbcon_device_try_acquire, but using NBCON_PORIO_EMERGENCY when
> acquiring the context.
>
> For release, differently from nbcon_device_release, we don't need to
> flush the console, since all CPUs are stopped when KDB is active.
>
> Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
> ---
>  include/linux/console.h |  6 ++++++
>  kernel/printk/nbcon.c   | 26 ++++++++++++++++++++++++++
>  2 files changed, 32 insertions(+)
>
> diff --git a/include/linux/console.h b/include/linux/console.h
> index 67af483574727c00eea1d5a1eacc994755c92607..b34c5a0b86303e2fb4583fa467d8be43761cf756 100644
> --- a/include/linux/console.h
> +++ b/include/linux/console.h
> @@ -605,6 +605,9 @@ extern bool nbcon_can_proceed(struct nbcon_write_context *wctxt);
>  extern bool nbcon_enter_unsafe(struct nbcon_write_context *wctxt);
>  extern bool nbcon_exit_unsafe(struct nbcon_write_context *wctxt);
>  extern void nbcon_reacquire_nobuf(struct nbcon_write_context *wctxt);
> +extern bool nbcon_kdb_try_acquire(struct console *con,
> +				  struct nbcon_write_context *wctxt);
> +extern void nbcon_kdb_release(struct nbcon_write_context *wctxt);
>  
>  /*
>   * Check if the given console is currently capable and allowed to print
> @@ -654,6 +657,9 @@ static inline bool nbcon_can_proceed(struct nbcon_write_context *wctxt) { return
>  static inline bool nbcon_enter_unsafe(struct nbcon_write_context *wctxt) { return false; }
>  static inline bool nbcon_exit_unsafe(struct nbcon_write_context *wctxt) { return false; }
>  static inline void nbcon_reacquire_nobuf(struct nbcon_write_context *wctxt) { }
> +static inline bool nbcon_kdb_try_acquire(struct console *con,
> +					 struct nbcon_write_context *wctxt) { return false; }
> +static inline void nbcon_kdb_release(struct console *con) { }
>  static inline bool console_is_usable(struct console *con, short flags,
>  				     bool use_atomic) { return false; }
>  #endif
> diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
> index 646801813415f0abe40cabf2f28ca9e30664f028..79d8c7437806119ad9787ddc48382dc2c86c23c3 100644
> --- a/kernel/printk/nbcon.c
> +++ b/kernel/printk/nbcon.c
> @@ -1855,3 +1855,29 @@ void nbcon_device_release(struct console *con)
>  	console_srcu_read_unlock(cookie);
>  }
>  EXPORT_SYMBOL_GPL(nbcon_device_release);
> +
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
> +void nbcon_kdb_release(struct nbcon_write_context *wctxt)
> +{
> +	struct nbcon_context *ctxt = &ACCESS_PRIVATE(wctxt, ctxt);
> +
> +	nbcon_context_exit_unsafe(ctxt);
> +	nbcon_context_release(ctxt);

If nbcon_context_exit_unsafe() fails, the current task is no longer the
owner and thus a release is not needed. I would prefer:

	if (nbcon_context_exit_unsafe(ctxt))
		nbcon_context_release(ctxt);

or

	if (!nbcon_context_exit_unsafe(ctxt))
		return;

	nbcon_context_release(ctxt);

You can find this same pattern in nbcon_device_release().

John


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
