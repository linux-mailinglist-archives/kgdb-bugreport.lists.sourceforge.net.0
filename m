Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D00E7628B34
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 14 Nov 2022 22:17:07 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1ougpF-0006B7-Tw
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 14 Nov 2022 21:17:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <atomlin@redhat.com>) id 1ougpE-0006B0-6K
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 14 Nov 2022 21:17:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bGtwzGs5+vKjZsZZeDpnHu2imq3A7FwvovVBxOyg6ug=; b=GtQIYJsxu7n8bEmWIkEUXeIueA
 lrQahrJ8/sXiH4AlXV+OvkQGNRCybFSDPf13BZD6Iu+/ck29b0KCk6VmRLvAWZz6SXhrC7cxZO2m3
 USF/w6k3UR2FfP6raTrsT69ElfUNqavLaC17b3vlUiUS8R9klx4hy7e+VRiPAKUNahKA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bGtwzGs5+vKjZsZZeDpnHu2imq3A7FwvovVBxOyg6ug=; b=YfX1pA1lOTzIjThele1qPdQrYn
 b0wpdtknEMTzGvkSdTsdJI69+PuR9Ao6t6cCVNRex7JdVgXJL1kEDS5RSnNy5Llk1hZEgqv7XErRz
 8p17RjNehkqTBoR8mrpEGzWQs5GR01cs1YylLzGmUjcFGbHf9r65tnr+ZqtqUTm9gYhs=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ougp9-00039N-KQ for kgdb-bugreport@lists.sourceforge.net;
 Mon, 14 Nov 2022 21:17:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668460613;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bGtwzGs5+vKjZsZZeDpnHu2imq3A7FwvovVBxOyg6ug=;
 b=SmUeyitR14V0HJr2xtXITzTzhUUHQaZcD0WF51XJ0I3EPHdob9sH7t/wOphpFuMAWGom0t
 m+6+acqLetQmuOvlxFS7ebkxtbQR0/LJg9Y+pAGE4MlYv0R+6+1ePAH3yrxV9XptwOiJiS
 OtsfLG/EMa9gA/bm1vY4BCSkoEMZsbc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-288-yEL98FL1N76YZBmJl8vgtQ-1; Mon, 14 Nov 2022 16:16:49 -0500
X-MC-Unique: yEL98FL1N76YZBmJl8vgtQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 ay40-20020a05600c1e2800b003cf8aa16377so7298412wmb.7
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 14 Nov 2022 13:16:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bGtwzGs5+vKjZsZZeDpnHu2imq3A7FwvovVBxOyg6ug=;
 b=HlMwDkHz++W5ew6+A+5o1B+0uatOLGC2LpZ7+LcLf+CtprcL9Q1FYxzSqqLt9vr0ti
 uN+px0+i9WQsrfb2hD1otyxSfm9pn+RVbmzcekDCOj3xUSOIt2b+EMz1c5A3bm1OxOlB
 d/DnV4p7qvGmtl0UikAInjvDxxixw6YnIFPfi0E3yv5ljCGzP46lukr5iBhv9fYrhRsu
 8CC998kD5NAALQxl8ossDKcTWxjsNCez9jQ8u0/X8AofWrrWWCiih+cyO17I8brVgU+C
 UyNqwNbmvXN92lgEV8XEDFu1vnHqxcS1VKV7aP0hZL7wHOMwDwZ3gEHADFyHigAnjRXt
 Cr9w==
X-Gm-Message-State: ANoB5pmT9ro39Kl3AEghUtTN+c3ewcCwA22lXbezZFpMxiYl64LHHeF6
 nbCAKF0Ei0ijrvzX5r72jxpux8snnAr5IqWQ01hVZ0iO4a+B+OW347PFMMVk3ogIq2ByoOGl4s9
 aSS9CzCnIletvv5Slj7QYkO/Okl3slR+6qQ==
X-Received: by 2002:adf:f882:0:b0:236:8dd7:1919 with SMTP id
 u2-20020adff882000000b002368dd71919mr8333984wrp.242.1668460608714; 
 Mon, 14 Nov 2022 13:16:48 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4g8xYEX2mCujXPvEtL6fos+VBp5ojZ9OHH6fn2CbdiYywpt2bmlIuAt40LVRxsa6UQhIn/GA==
X-Received: by 2002:adf:f882:0:b0:236:8dd7:1919 with SMTP id
 u2-20020adff882000000b002368dd71919mr8333975wrp.242.1668460608495; 
 Mon, 14 Nov 2022 13:16:48 -0800 (PST)
Received: from localhost (cpc111743-lutn13-2-0-cust979.9-3.cable.virginm.net.
 [82.17.115.212]) by smtp.gmail.com with ESMTPSA id
 b15-20020adff24f000000b002345cb2723esm10465292wrp.17.2022.11.14.13.16.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Nov 2022 13:16:48 -0800 (PST)
Date: Mon, 14 Nov 2022 21:16:47 +0000
From: Aaron Tomlin <atomlin@redhat.com>
To: John Ogness <john.ogness@linutronix.de>
Message-ID: <20221114211647.bml74abrsatcnmda@ava.usersys.com>
X-PGP-Key: http://pgp.mit.edu/pks/lookup?search=atomlin%40redhat.com
X-PGP-Fingerprint: 7906 84EB FA8A 9638 8D1E  6E9B E2DE 9658 19CC 77D6
References: <20221114162932.141883-1-john.ogness@linutronix.de>
 <20221114162932.141883-14-john.ogness@linutronix.de>
MIME-Version: 1.0
In-Reply-To: <20221114162932.141883-14-john.ogness@linutronix.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon 2022-11-14 17:35 +0106, John Ogness wrote: > Guarantee
 safe iteration of the console list by using SRCU. > > Signed-off-by: John
 Ogness <john.ogness@linutronix.de> > Reviewed-by: Petr Mladek <p [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.133.124 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [170.10.133.124 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ougp9-00039N-KQ
Subject: Re: [Kgdb-bugreport] [PATCH printk v4 13/39] kdb: use srcu console
 list iterator
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
Cc: Petr Mladek <pmladek@suse.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Luis Chamberlain <mcgrof@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Mon 2022-11-14 17:35 +0106, John Ogness wrote:
> Guarantee safe iteration of the console list by using SRCU.
> 
> Signed-off-by: John Ogness <john.ogness@linutronix.de>
> Reviewed-by: Petr Mladek <pmladek@suse.com>
> ---
>  kernel/debug/kdb/kdb_io.c | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
> index 67d3c48a1522..5c7e9ba7cd6b 100644
> --- a/kernel/debug/kdb/kdb_io.c
> +++ b/kernel/debug/kdb/kdb_io.c
> @@ -545,6 +545,7 @@ static void kdb_msg_write(const char *msg, int msg_len)
>  {
>  	struct console *c;
>  	const char *cp;
> +	int cookie;
>  	int len;
>  
>  	if (msg_len == 0)
> @@ -558,8 +559,20 @@ static void kdb_msg_write(const char *msg, int msg_len)
>  		cp++;
>  	}
>  
> -	for_each_console(c) {
> -		if (!(c->flags & CON_ENABLED))
> +	/*
> +	 * The console_srcu_read_lock() only provides safe console list
> +	 * traversal. The use of the ->write() callback relies on all other
> +	 * CPUs being stopped at the moment and console drivers being able to
> +	 * handle reentrance when @oops_in_progress is set.
> +	 *
> +	 * There is no guarantee that every console driver can handle
> +	 * reentrance in this way; the developer deploying the debugger
> +	 * is responsible for ensuring that the console drivers they
> +	 * have selected handle reentrance appropriately.
> +	 */
> +	cookie = console_srcu_read_lock();
> +	for_each_console_srcu(c) {
> +		if (!(console_srcu_read_flags(c) & CON_ENABLED))
>  			continue;
>  		if (c == dbg_io_ops->cons)
>  			continue;
> @@ -577,6 +590,7 @@ static void kdb_msg_write(const char *msg, int msg_len)
>  		--oops_in_progress;
>  		touch_nmi_watchdog();
>  	}
> +	console_srcu_read_unlock(cookie);
>  }
>  
>  int vkdb_printf(enum kdb_msgsrc src, const char *fmt, va_list ap)
> -- 
> 2.30.2
> 

Reviewed-by: Aaron Tomlin <atomlin@atomlin.com>

-- 
Aaron Tomlin



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
