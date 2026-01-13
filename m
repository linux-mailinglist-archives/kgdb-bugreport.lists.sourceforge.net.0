Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CC201D1AAC0
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 13 Jan 2026 18:37:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0l4pMR98h7cK/lZejvyGBSJoQIjFaDeQZ4PuUPd5Ako=; b=PJgKVz8EIn1JA1iN3HqIMP5Y/h
	Sgkwdw3OqMmlRCxQdrHOxsVd4zazz4l3ryVVCNxRZI6hTQP3EqbKXcrYkVLkVaHk7mLlvlrgewbmp
	Kc/XQtWN0rZfQIFSX2fZyCkxFdhy7kdoGAZpUM9QCb8YU7k49BMtJ9H+fOm94YB2Q/X8=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1vfiKl-0000AE-H7
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 13 Jan 2026 17:37:35 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1vfiKk-0000A0-3z
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 13 Jan 2026 17:37:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/CVOy4tPw1zWY0e6rYcKRwtfrfRvUlKFzd8YTNoGp5w=; b=Nu63kEoq+7KrvhYo7EhJmqhBQu
 M+fyQ5P5WszjzyI9tI8AY07V86W0GML2LPq6WKjPV/qjyArsz2cVg19Pqy/5HPqg5PMAvz/wJu23q
 WmiJcfBPhAicPs1xRsbeHlt5Or6wD58d8NDKv+WU/zXlFb3vRqQC+EmIaeqUEcLfJcoA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/CVOy4tPw1zWY0e6rYcKRwtfrfRvUlKFzd8YTNoGp5w=; b=mFPZcLmU2oOLtRYI9nelKrHIzb
 K/b1IiE59f5RsQawOmPyEZRKtqmLQqa65I6BnS8M+7Vj09w6xu1Uz9PQCmNYh1UPFEsONQY6g1Dux
 65Po4fv5A79OsLRinIc4DYF+kVIEYAMXdrOO47Ren4HN1bUuXA4kFwIggbjhSY3aPzUA=;
Received: from mail-wr1-f47.google.com ([209.85.221.47])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vfiKh-00015G-Ub for kgdb-bugreport@lists.sourceforge.net;
 Tue, 13 Jan 2026 17:37:33 +0000
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-430f57cd471so3943957f8f.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 13 Jan 2026 09:37:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1768325840; x=1768930640; darn=lists.sourceforge.net; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=/CVOy4tPw1zWY0e6rYcKRwtfrfRvUlKFzd8YTNoGp5w=;
 b=FIkp44jL3Lii/7c/m/xlKh3P6b37JSUgELAWgqUpoNUzA/T42cBNLLIGScD1I6pbRw
 gNw+JlBYZusSPNeREbQb3gCv+t7mXWYFr/Qia6RUWMw8cd+TQkLkJwMKio+bPDFYp31d
 5z01LdjQ5QqILrm38V6WVMcaSg7WkKva8LxqPGkLhBA0sOzCKM35998RG7BHHJ2+q0oY
 Hr1+mHI56X0h6N4sZC+1SHVblFDeuxVzGA56ZPBedrwSKHQxqNihVfC0jGFNXsxjH7ze
 Beo3yrKz3k6E4RuEWPZ8e3v6a551lC4ZSeK/y58RZDEFVuVFawpVVaRu5PK953fI3n+E
 unCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768325840; x=1768930640;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/CVOy4tPw1zWY0e6rYcKRwtfrfRvUlKFzd8YTNoGp5w=;
 b=I52PwakMhsXSue14ZKfKK/QhpO4tTiwdR3ui8AV0O2Hw5oO4y34cm7YE+zAD5j6NWR
 nspH1WaFJMXntyax54imcrTOjsZKcvS2A3k4TE6nSKOwOfu2rATumi3ZxMO38raX5/rV
 PJMVnDrkU51zX/dbyOL9Sb61ASFmxbdVCqkb2d/qpN+36YfyCG7UMhJDlShcEwIPtXJj
 WEdCX5uUJYsQxNI1tP1c+Re4BR8hE6PujuqC3h8+2hQADkvgGmRx6b1IypxvpN+RRDLo
 RAW4vkxaW0iG/v9/VymzA/4bzhGVotIqbyzYYic+bg8C1tYKWG+oqJh7Q62+RkhQ892p
 kCUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXcyzzn5rookBJX7bZ1KHaPtZVEoXIgS4j+9v8ZY/ye35Puo6F25zyJZx4yWaDxmVf92FppmhfiLTALWGjSw==@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyJjfOkxqAPatx8FxKwY8A5tqvymKA4uKYqCwScEUBlaBYtDV0A
 lWkfUT69ppGIeFC+crgzJl9NLoEmWtl04cgU1OdTCOj15fT32LvDgvRu6/WRCrkJ3cc=
X-Gm-Gg: AY/fxX7YdEKeGk0i8u+Nzh5/iduv5XoCngOtJstU1kaPBBbyzkAnypQB8MSpjgOxsYx
 rJtpIBktc4PDsBrScDMgrYgFep+YR11sZRxDLLfB9ikm9orpZCgei2pblDnFc+ciJ77vtYyWKYa
 CY1SUNYyotultv93zlB+mXqajlsmxHK9noG4oeILhO4YR7M70gEkcrcD39j9KH5bQJTMVkWNwRq
 TAmOKfhowkT1A/HCD9ckTopnHqldbQEua/WCIq7vncYkr6rwFfHHDYtYFLDWjU9G66oPKNtthU0
 RyqJwqC2g7w2SN5FSrk8tVxn17dU8qnpqdb54G/uCwnGthc7numLD4Hv+qkvFQnTI8ddoGgDIkN
 4jpz1uZOP7GukyXybjjKQKIVz/CZBhOoruGGIOmS4V4lrfndFpA7FWfWQi1lNZjpwAZD6fMKJ63
 +usz3NIboJbADoKQ==
X-Google-Smtp-Source: AGHT+IHUReQqvVgC0db5F0/UgqAPwHgCcpq2ZD0lhm0g7XnDeEa3Phlj1/GEitKl8zvqkUFbSZC6XA==
X-Received: by 2002:a05:6000:2dc9:b0:430:fced:902 with SMTP id
 ffacd0b85a97d-432c36436fbmr29258778f8f.26.1768325840268; 
 Tue, 13 Jan 2026 09:37:20 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432d9610671sm28342147f8f.34.2026.01.13.09.37.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 09:37:19 -0800 (PST)
Date: Tue, 13 Jan 2026 18:37:17 +0100
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Message-ID: <aWaCzZ8_UuyAa6xp@pathway.suse.cz>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
 <20251227-printk-cleanup-part3-v1-2-21a291bcf197@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251227-printk-cleanup-part3-v1-2-21a291bcf197@suse.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sat 2025-12-27 09:16:09, Marcos Paulo de Souza wrote: >
 Besides checking if the current console is NBCON or not, console->flags >
 is also being read in order to serve as argument of the console_is_ [...]
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.47 listed in wl.mailspike.net]
X-Headers-End: 1vfiKh-00015G-Ub
Subject: Re: [Kgdb-bugreport] [PATCH 02/19] printk: Introduce
 console_is_nbcon
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
Cc: Andreas Larsson <andreas@gaisler.com>, Kees Cook <kees@kernel.org>,
 kgdb-bugreport@lists.sourceforge.net,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-kernel@vger.kernel.org,
 Shan-Chun Hung <schung@nuvoton.com>, Eric Dumazet <edumazet@google.com>,
 netdev@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 Breno Leitao <leitao@debian.org>, Jiri Slaby <jirislaby@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, sparclinux@vger.kernel.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Richard Weinberger <richard@nod.at>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-serial@vger.kernel.org,
 Daniel Thompson <danielt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Jacky Huang <ychuang3@nuvoton.com>, John Ogness <john.ogness@linutronix.de>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, linux-um@lists.infradead.org,
 Steven Rostedt <rostedt@goodmis.org>, linux-m68k@lists.linux-m68k.org,
 Nicholas Piggin <npiggin@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Laurentiu Tudor <laurentiu.tudor@nxp.com>, Tony Luck <tony.luck@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jason Wessel <jason.wessel@windriver.com>, linux-fsdevel@vger.kernel.org,
 Johannes Berg <johannes@sipsolutions.net>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Sat 2025-12-27 09:16:09, Marcos Paulo de Souza wrote:
> Besides checking if the current console is NBCON or not, console->flags
> is also being read in order to serve as argument of the console_is_usable
> function.
> 
> But CON_NBCON flag is unique: it's set just once in the console
> registration and never cleared. In this case it can be possible to read
> the flag when console_srcu_lock is held (which is the case when using
> for_each_console).
> 
> This change makes possible to remove the flags argument from
> console_is_usable in the next patches.
> 
> Signed-off-by: Petr Mladek <pmladek@suse.com>
> Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
> ---
>  include/linux/console.h   | 27 +++++++++++++++++++++++++++
>  kernel/debug/kdb/kdb_io.c |  2 +-
>  kernel/printk/nbcon.c     |  2 +-
>  kernel/printk/printk.c    | 15 ++++++---------
>  4 files changed, 35 insertions(+), 11 deletions(-)
> 
> diff --git a/include/linux/console.h b/include/linux/console.h
> index 35c03fc4ed51..dd4ec7a5bff9 100644
> --- a/include/linux/console.h
> +++ b/include/linux/console.h
> @@ -561,6 +561,33 @@ static inline void console_srcu_write_flags(struct console *con, short flags)
>  	WRITE_ONCE(con->flags, flags);
>  }
>  
> +/**
> + * console_srcu_is_nbcon - Locklessly check whether the console is nbcon

There is _srcu in the function name, see below.

> + * @con:	struct console pointer of console to check
> + *
> + * Requires console_srcu_read_lock to be held, which implies that @con might
> + * be a registered console. The purpose of holding console_srcu_read_lock is
> + * to guarantee that no exit/cleanup routines will run if the console
> + * is currently undergoing unregistration.
> + *
> + * If the caller is holding the console_list_lock or it is _certain_ that
> + * @con is not and will not become registered, the caller may read
> + * @con->flags directly instead.
> + *
> + * Context: Any context.
> + * Return: True when CON_NBCON flag is set.
> + */
> +static inline bool console_is_nbcon(const struct console *con)

And here it is without _srcu.

I would prefer the variant with _srcu to make it clear that it
can be called only under _srcu. Similar to console_srcu_read_flags(con).

> +{
> +	WARN_ON_ONCE(!console_srcu_read_lock_is_held());
> +
> +	/*
> +	 * The CON_NBCON flag is statically initialized and is never
> +	 * set or cleared at runtime.
> +	 */
> +	return data_race(con->flags & CON_NBCON);
> +}
> +
>  /* Variant of console_is_registered() when the console_list_lock is held. */
>  static inline bool console_is_registered_locked(const struct console *con)
>  {

Otherwise, it looks good to me.

With a consistent name, feel free to use:

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
