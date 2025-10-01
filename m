Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2C5BB0EE7
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 01 Oct 2025 17:05:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:References:In-Reply-To:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B5N9hTGp7hstV4vWC4PVecHMR6gbiOfrUIOmG61iPQE=; b=bgYI2os6zTTeBQWl0x72a857+H
	2endTyV8lw+CF0EzyLOXcVBB1wYI95oGn1vkWirkZCLA8fB9x6jzrOKtugqloA1rRP0v/VrguqWJ+
	ZwBrz9eStdNdZIigHIcYoNrqTq2wlCXwksDYSYWycbHqW5Jck2mVTuuHRp3WDei38Kcs=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1v3yOY-00018b-Fg
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 01 Oct 2025 15:05:31 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <john.ogness@linutronix.de>) id 1v3yOW-000182-Ge
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 01 Oct 2025 15:05:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LYgUmX9oFXqBlVnDhkhcIzkt3iPl24PQrTnT2nPcvZ8=; b=dNcgXaxMoyAXABSzLBGPR/54BG
 z947aVX/fn0rqdLgPGWies7RK6+EzfH4qTKROdW/pwIsV0qdfkQKdkC2WJumXiC0XpwPyroi604eb
 l68fgNE+bB9U4SCZZeAl/6f/Ju2jnqRLyzZlgJyUAocQ7W6DK1Xv6Jiy7gqX7lxSlgo4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LYgUmX9oFXqBlVnDhkhcIzkt3iPl24PQrTnT2nPcvZ8=; b=S/z7gJV5fCtiUjxX5bNU8FAiMG
 0CSiH//zintIDhr/75JNNyt95FzTaYURPGnwSdjtc1o7o5yJNG5rKp4PWrh+UwXPkkt+A2NOG+oRI
 vg5zs+AAxZbNgL24h8B8FjbJNdZbwikEYX7NiYZBc4SM4LmzG8z4hTPhU3JOJuzTQtvU=;
Received: from galois.linutronix.de ([193.142.43.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v3yOS-0005Ja-IX for kgdb-bugreport@lists.sourceforge.net;
 Wed, 01 Oct 2025 15:05:25 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1759331118;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LYgUmX9oFXqBlVnDhkhcIzkt3iPl24PQrTnT2nPcvZ8=;
 b=0ul3tkBkJ34uPGNuGvXkMe0pYMzlNfnO4qXuISckCo/iXfuBbTGt28u3fST3LIewDyDqDP
 YY9/4tRkqhRiokwGoPT/4Z75em5t0FhR9oweHXrrItVc+bO280FYT85f6UrXqo9wXYehU3
 Mk5RXZWzGvhkmxZzrbjHdok+lFUoO9JIBRgDR8YnyaIeBbWed1n/po6q0YAM+DleA3bLJ6
 X8tqvuieP5kZsYPhJlFeEl29PRtKcjstjzRbEgswZnMJsVlvY8YEoTr33JE3/Hegx3t4gA
 Ffdc16DZlfjFH/3ZF9LPNkKiJGzrZ5+SHbs7sfhbFFZZb3MbSlzMZeCPZ6HQaQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1759331118;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LYgUmX9oFXqBlVnDhkhcIzkt3iPl24PQrTnT2nPcvZ8=;
 b=ZDknhNYA3vw3mn9F98cbAYhxhsVpYfkPxsq/XfouNS9zDokzkHiCisCpCQ9MjkyMLon1EW
 5ZVWRJHUu4kAV4Cg==
To: Marcos Paulo de Souza <mpdesouza@suse.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Petr Mladek <pmladek@suse.com>, Steven
 Rostedt <rostedt@goodmis.org>, Sergey Senozhatsky
 <senozhatsky@chromium.org>, Jason Wessel <jason.wessel@windriver.com>,
 Daniel Thompson <danielt@kernel.org>, Douglas Anderson
 <dianders@chromium.org>
In-Reply-To: <20250930-nbcon-kgdboc-v5-3-8125893cfb4f@suse.com>
References: <20250930-nbcon-kgdboc-v5-0-8125893cfb4f@suse.com>
 <20250930-nbcon-kgdboc-v5-3-8125893cfb4f@suse.com>
Date: Wed, 01 Oct 2025 17:11:17 +0206
Message-ID: <84ecrmhdci.fsf@jogness.linutronix.de>
MIME-Version: 1.0
X-Spam-Score: 0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2025-09-30, Marcos Paulo de Souza <mpdesouza@suse.com>
 wrote: > diff --git a/include/linux/kdb.h b/include/linux/kdb.h > index
 ecbf819deeca118f27e98bf71bb37dd27a257ebb..36b46c85733fe1df28cde7760e5c
 [...] Content analysis details:   (0.4 points, 5.0 required)
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
X-Headers-End: 1v3yOS-0005Ja-IX
Subject: Re: [Kgdb-bugreport] [PATCH v5 3/5] printk: nbcon: Allow KDB to
 acquire the NBCON context
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
> diff --git a/include/linux/kdb.h b/include/linux/kdb.h
> index ecbf819deeca118f27e98bf71bb37dd27a257ebb..36b46c85733fe1df28cde7760e5c26e96de40c05 100644
> --- a/include/linux/kdb.h
> +++ b/include/linux/kdb.h
> @@ -207,11 +207,26 @@ static inline const char *kdb_walk_kallsyms(loff_t *pos)
>  /* Dynamic kdb shell command registration */
>  extern int kdb_register(kdbtab_t *cmd);
>  extern void kdb_unregister(kdbtab_t *cmd);
> +
> +/* Return true when KDB as locked for printing a message on this CPU. */
> +static inline
> +bool kdb_printf_on_this_cpu(void)
> +{
> +	/*
> +	 * We can use raw_smp_processor_id() here because the task could
> +	 * not get migrated when KDB has locked for printing on this CPU.
> +	 */
> +	return unlikely(READ_ONCE(kdb_printf_cpu) == raw_smp_processor_id());
> +}
> +
>  #else /* ! CONFIG_KGDB_KDB */
>  static inline __printf(1, 2) int kdb_printf(const char *fmt, ...) { return 0; }
>  static inline void kdb_init(int level) {}
>  static inline int kdb_register(kdbtab_t *cmd) { return 0; }
>  static inline void kdb_unregister(kdbtab_t *cmd) {}
> +
> +static inline bool kdb_printf_on_this_cpu(void) { return false };
> +
>  #endif	/* CONFIG_KGDB_KDB */
>  enum {
>  	KDB_NOT_INITIALIZED,

The include for raw_smp_processor_id() is also needed:

diff --git a/include/linux/kdb.h b/include/linux/kdb.h
index 36b46c85733fe..db9d73b12a1af 100644
--- a/include/linux/kdb.h
+++ b/include/linux/kdb.h
@@ -14,6 +14,7 @@
  */
 
 #include <linux/list.h>
+#include <linux/smp.h>
 
 /* Shifted versions of the command enable bits are be used if the command
  * has no arguments (see kdb_check_flags). This allows commands, such as


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
