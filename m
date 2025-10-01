Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E621BB0BBE
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 01 Oct 2025 16:36:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:References:In-Reply-To:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2IFGBhr/5J5DQmVOWcozNYsinjhA8IyABU9Pj5ANDEk=; b=FedApLn2rfGy68U8RmUrfP1t81
	EEEn26ybSfqRA13CMfDI5NH2p+jws8RjnlRCxjdkfZRKERfTr8JWQ/2+o53Uqfg08C5hr8g4nnIsM
	KCMrIhQHBhGkcoYoSfzUw9X15xBPIHIxRCf5JN10QVf0njjttP8tVyy/hpWpy3sRToLA=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1v3xwn-00072y-BZ
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 01 Oct 2025 14:36:50 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <john.ogness@linutronix.de>) id 1v3xwl-00072j-Oh
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 01 Oct 2025 14:36:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Dgg4ivoQfVgSSd7l4LOE439VKXzUXukLN9Ow8Aqpzrk=; b=Ny6ymrCR780wdcguXFmLeomqLA
 DEGRzT9mITmSpPZNU95J0GFOnXqXeLKquEW++0F6u2T5TWGolqMObQkPeCBoIDrdSTSnZ3FMSsnEu
 lKMtANtnCpWgw9X9QcSqmYhOPSzeNL52yxqoQhBPx5ZgyOdI0ToOGWCN+ugCTbs2Z9wY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Dgg4ivoQfVgSSd7l4LOE439VKXzUXukLN9Ow8Aqpzrk=; b=dhEm7AIe1CqpUvHIAHlhyii8nu
 iwqoySQdLnRVucpLoEq6kOnKjj1fwFbt0/xsTB6Z0IV5GGYu+wNV2Tv6EzX1JUHGhH3NIwVgzPEF8
 EhHlI9A7sA61V0X53JD1MORN9JGf9wOAMMvBtv11ZWSfyS0So0ALgqzCVoMxwqxvy6Og=;
Received: from galois.linutronix.de ([193.142.43.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v3xwl-0003Rg-G0 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 01 Oct 2025 14:36:48 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1759329395;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Dgg4ivoQfVgSSd7l4LOE439VKXzUXukLN9Ow8Aqpzrk=;
 b=iHLPnMZOR7BZPpag7PgxwljWBHTfZ0Q5cHbm9Vob94avMC7PC0nFM3Ql4by/sfD8oAa9+q
 Tku/vs6OhE6pLd1FDrKg8WKMATThWi86ZbswlDnEeiECHU0ny+04M13atVyLTZlqpO8M6N
 KaUdYqVeMn/0vfjZDNwsgb7jN2K0zsMH2C+7U8wm1GWXPKQzHS0ROnf1CPuRZ0E0L2VEw0
 XC8+w06PCb0pLKK5MfypAUFeo4392d3YvMvGpOBr77fTJawo6ZGAXvxDrRhbp0SWPUlQiP
 gJVgGX1olARThgAWjWHWws4D+jAjPJ4aSFpiIhhlSlwdA5vKhePWaRoUaBTddw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1759329395;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Dgg4ivoQfVgSSd7l4LOE439VKXzUXukLN9Ow8Aqpzrk=;
 b=XPh/1YzUinJ9TwioVgOBBTnpKKTVt/lAl9IyGvo1r0Uer8HUUCRBGdYDU4NNw1OylDcqVn
 t9nWm1SHMoiRn5CA==
To: Marcos Paulo de Souza <mpdesouza@suse.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Petr Mladek <pmladek@suse.com>, Steven
 Rostedt <rostedt@goodmis.org>, Sergey Senozhatsky
 <senozhatsky@chromium.org>, Jason Wessel <jason.wessel@windriver.com>,
 Daniel Thompson <danielt@kernel.org>, Douglas Anderson
 <dianders@chromium.org>
In-Reply-To: <20250930-nbcon-kgdboc-v5-1-8125893cfb4f@suse.com>
References: <20250930-nbcon-kgdboc-v5-0-8125893cfb4f@suse.com>
 <20250930-nbcon-kgdboc-v5-1-8125893cfb4f@suse.com>
Date: Wed, 01 Oct 2025 16:42:34 +0206
Message-ID: <84jz1eheod.fsf@jogness.linutronix.de>
MIME-Version: 1.0
X-Spam-Score: 0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2025-09-30, Marcos Paulo de Souza <mpdesouza@suse.com>
 wrote: > The helper will be used on KDB code in the next commits. > >
 Reviewed-by:
 Petr Mladek <pmladek@suse.com> > Signed-off-by: Marcos Paul [...] 
 Content analysis details:   (0.4 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.6 INVALID_DATE_TZ_ABSURD Invalid Date: header (timezone does not exist)
X-Headers-End: 1v3xwl-0003Rg-G0
Subject: Re: [Kgdb-bugreport] [PATCH v5 1/5] printk: nbcon: Export
 console_is_usable
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
> The helper will be used on KDB code in the next commits.
>
> Reviewed-by: Petr Mladek <pmladek@suse.com>
> Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
> ---
>  include/linux/console.h  | 44 ++++++++++++++++++++++++++++++++++++++++++++
>  kernel/printk/internal.h | 44 --------------------------------------------
>  2 files changed, 44 insertions(+), 44 deletions(-)
>
> diff --git a/include/linux/console.h b/include/linux/console.h
> index 8f10d0a85bb4536e4b0dda4e8ccbdf87978bbb4a..67af483574727c00eea1d5a1eacc994755c92607 100644
> --- a/include/linux/console.h
> +++ b/include/linux/console.h
> @@ -605,6 +605,48 @@ extern bool nbcon_can_proceed(struct nbcon_write_context *wctxt);
>  extern bool nbcon_enter_unsafe(struct nbcon_write_context *wctxt);
>  extern bool nbcon_exit_unsafe(struct nbcon_write_context *wctxt);
>  extern void nbcon_reacquire_nobuf(struct nbcon_write_context *wctxt);
> +
> +/*
> + * Check if the given console is currently capable and allowed to print
> + * records. Note that this function does not consider the current context,
> + * which can also play a role in deciding if @con can be used to print
> + * records.
> + */
> +static inline bool console_is_usable(struct console *con, short flags, bool use_atomic)
> +{
> +	if (!(flags & CON_ENABLED))
> +		return false;
> +
> +	if ((flags & CON_SUSPENDED))
> +		return false;
> +
> +	if (flags & CON_NBCON) {
> +		/* The write_atomic() callback is optional. */
> +		if (use_atomic && !con->write_atomic)
> +			return false;
> +
> +		/*
> +		 * For the !use_atomic case, @printk_kthreads_running is not
> +		 * checked because the write_thread() callback is also used
> +		 * via the legacy loop when the printer threads are not
> +		 * available.
> +		 */
> +	} else {
> +		if (!con->write)
> +			return false;
> +	}
> +
> +	/*
> +	 * Console drivers may assume that per-cpu resources have been
> +	 * allocated. So unless they're explicitly marked as being able to
> +	 * cope (CON_ANYTIME) don't call them until this CPU is officially up.
> +	 */
> +	if (!cpu_online(raw_smp_processor_id()) && !(flags & CON_ANYTIME))
> +		return false;
> +
> +	return true;
> +}
> +
>  #else
>  static inline void nbcon_cpu_emergency_enter(void) { }
>  static inline void nbcon_cpu_emergency_exit(void) { }
> @@ -612,6 +654,8 @@ static inline bool nbcon_can_proceed(struct nbcon_write_context *wctxt) { return
>  static inline bool nbcon_enter_unsafe(struct nbcon_write_context *wctxt) { return false; }
>  static inline bool nbcon_exit_unsafe(struct nbcon_write_context *wctxt) { return false; }
>  static inline void nbcon_reacquire_nobuf(struct nbcon_write_context *wctxt) { }
> +static inline bool console_is_usable(struct console *con, short flags,
> +				     bool use_atomic) { return false; }
>  #endif
>  
>  extern int console_set_on_cmdline;
> diff --git a/kernel/printk/internal.h b/kernel/printk/internal.h
> index f72bbfa266d6c9bbc533661c40386aa5f0df6c8f..7238da161ff9814fe8a22e4836624e50ee5b71d3 100644
> --- a/kernel/printk/internal.h
> +++ b/kernel/printk/internal.h
> @@ -112,47 +112,6 @@ bool nbcon_kthread_create(struct console *con);
>  void nbcon_kthread_stop(struct console *con);
>  void nbcon_kthreads_wake(void);
>  
> -/*
> - * Check if the given console is currently capable and allowed to print
> - * records. Note that this function does not consider the current context,
> - * which can also play a role in deciding if @con can be used to print
> - * records.
> - */
> -static inline bool console_is_usable(struct console *con, short flags, bool use_atomic)
> -{
> -	if (!(flags & CON_ENABLED))
> -		return false;
> -
> -	if ((flags & CON_SUSPENDED))
> -		return false;
> -
> -	if (flags & CON_NBCON) {
> -		/* The write_atomic() callback is optional. */
> -		if (use_atomic && !con->write_atomic)
> -			return false;
> -
> -		/*
> -		 * For the !use_atomic case, @printk_kthreads_running is not
> -		 * checked because the write_thread() callback is also used
> -		 * via the legacy loop when the printer threads are not
> -		 * available.
> -		 */
> -	} else {
> -		if (!con->write)
> -			return false;
> -	}
> -
> -	/*
> -	 * Console drivers may assume that per-cpu resources have been
> -	 * allocated. So unless they're explicitly marked as being able to
> -	 * cope (CON_ANYTIME) don't call them until this CPU is officially up.
> -	 */
> -	if (!cpu_online(raw_smp_processor_id()) && !(flags & CON_ANYTIME))
> -		return false;
> -
> -	return true;
> -}
> -
>  /**
>   * nbcon_kthread_wake - Wake up a console printing thread
>   * @con:	Console to operate on
> @@ -204,9 +163,6 @@ static inline bool nbcon_legacy_emit_next_record(struct console *con, bool *hand
>  static inline void nbcon_kthread_wake(struct console *con) { }
>  static inline void nbcon_kthreads_wake(void) { }
>  
> -static inline bool console_is_usable(struct console *con, short flags,
> -				     bool use_atomic) { return false; }
> -
>  #endif /* CONFIG_PRINTK */
>  
>  extern bool have_boot_console;

This also needs the required includes moved over as well. smp.h is
probably more appropriate than the higher level percpu.h:

diff --git a/include/linux/console.h b/include/linux/console.h
index b34c5a0b86303..9406342b27db4 100644
--- a/include/linux/console.h
+++ b/include/linux/console.h
@@ -19,6 +19,7 @@
 #include <linux/irq_work.h>
 #include <linux/rculist.h>
 #include <linux/rcuwait.h>
+#include <linux/smp.h>
 #include <linux/types.h>
 #include <linux/vesa.h>
 
diff --git a/kernel/printk/internal.h b/kernel/printk/internal.h
index 077927ed56c5f..7203b7b969c06 100644
--- a/kernel/printk/internal.h
+++ b/kernel/printk/internal.h
@@ -3,7 +3,6 @@
  * internal.h - printk internal definitions
  */
 #include <linux/console.h>
-#include <linux/percpu.h>
 #include <linux/types.h>
 
 #if defined(CONFIG_PRINTK) && defined(CONFIG_SYSCTL)

On a side note, we are missing <linux/rcuwait.h> in
kernel/printk/internal.h. It currently relies on console.h as a
proxy. But I guess that is out of scope for this series.

John


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
