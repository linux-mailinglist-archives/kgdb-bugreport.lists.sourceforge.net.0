Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C55CD1F64F
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 14 Jan 2026 15:23:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BI8H0IP3HnD9quFMsnOUgJS7g67x25xl5f+i/Bs8ggM=; b=QZCEwky/Oz8bppYv9CQO2KaDI3
	Nwl12xcODoTHadd+lTxtaZ6AH41Pv+yZ9i8zhiJAeyZQbmk7j+LxcYAzd8BY37m7lipO47r3qDiQt
	z8JvmaLa/F0DGfd7uGbx2XcBhuUgd+Kx7msvvNd8djii/ADZcP+neHkZCro1EaPBVraU=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1vg1mB-0007sX-R1
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 14 Jan 2026 14:23:11 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1vg1mA-0007sO-8Z
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 14 Jan 2026 14:23:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rjJ0doliNf6plVmMYQkV7IlLiBwqr6x+viyB7m/anSs=; b=MmMzdrA86VptNlG3nWCnrZ43Ub
 1wg4BUNLR5PYN/+c0hA7jXjl6vXfwD7OVyaIb+C0tQ+c+g8N4B/8QhglW2CvDykxV/POcSBJrzYoi
 6bzBz44C1cE3nmLdW9fYSAQAH8qdhNUYVq6BEF/yoQ9iUo0v/ytD9aRMjvueGDgT3loU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rjJ0doliNf6plVmMYQkV7IlLiBwqr6x+viyB7m/anSs=; b=I0bQHrb/zqa4tmfJrOSnI0aara
 KX3xXVXN+yvv6EhXxZSD71J83wq2C2KOLfzbgEPKAl0y9tS1wxxGMgDdEpUsqciq548DUjPdV+++8
 zGUEjJv5PGmgXVO4nBwvbmbj8JvwD47/yRDXfBbq43nBdgBzM2QVfcYtuF1kJliAw1Z4=;
Received: from mail-wm1-f65.google.com ([209.85.128.65])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vg1m9-00011J-Mw for kgdb-bugreport@lists.sourceforge.net;
 Wed, 14 Jan 2026 14:23:10 +0000
Received: by mail-wm1-f65.google.com with SMTP id
 5b1f17b1804b1-477a2ab455fso80733185e9.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 14 Jan 2026 06:23:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1768400583; x=1769005383; darn=lists.sourceforge.net; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=rjJ0doliNf6plVmMYQkV7IlLiBwqr6x+viyB7m/anSs=;
 b=fKGzno8DCjxhtI4U02ZRRQrIUmK+ueXS7OfIfndhidrlcxYsCiD1FUBymbLiR5NYHj
 xZDxY45oTm8h1FKMCE+hpZ1P0DEsA1ZpsUexiIoaA0Yb1fLplnu8GkZ2RNCFDBYzg3RC
 YY3C1UGW03rDAzEIR8n7u+G/iJAw+a7IVprumiqQ8u9l/u41QjUhCrte0x51r7U4SrPQ
 cTBN9G4CS27bBGBmOk+aA3ANXUlgpIrooqKnnRZQaMn/6qYXJpzbG1P9SYGrcGKtPJz1
 nwbF2U2U2wek/+IIs5u6tptWqQfZEmzlxlNx07y8QEVv5jpX08wSzqzeDaSFGOfFpIep
 E4XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768400583; x=1769005383;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rjJ0doliNf6plVmMYQkV7IlLiBwqr6x+viyB7m/anSs=;
 b=t5TfacUntQfOe6XugNiBfLjtSH+BPG+VXfC9j+eFp+Dw+ZfqxhB2N2O606Ur3MoW9p
 H1EaklFKrGvLN0WlkDEAF4El6CmVrT4zbnc6UV5HxvAzjgT6pnCjbRTfHdQbOHk92Ia1
 iqE+WE9P5mUyhm+ygZ3Cxq7j1wLhYO6V4lkSc0pA6FtUUbkhBrm1F+1jY+KG+JRnrnlP
 /9B6GdvnN+19QcbIItZw36tvmNXDWM4H9YO8PV6QqjgOkx8gvVuxRpLi58R9MmRgEmlK
 o3GB9VKFS4hD5MaG2/K7zZRvIFQZ6964KBZuvBCz8XTIBmPbwgvcYDzFlY5rkFf8Yr7l
 vD6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUw1Ii8RXUpyJHClEEolLQEROXvIFPGwaevYIuQ3mzIFBPZxv/9UqwP4JQUCvyxOg79La2xLubwxouNHVnYKA==@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yw3z4bejyh1qt8ztAMbT7jCwI9YEsXlasSy4VjBiELYeUM1U1Ol
 1cdk6TfjD087arBIpvwOl8UM0FqNCEAlgKkgWDaUsdv8TmjaFPCyl/efgxt5N6PvSUw=
X-Gm-Gg: AY/fxX6QaqoRGFoXMvJiR9RzCUEYUzIDBA0j9OeFmbLJ0XZfPhfjcdnxjDaxA1Hz4X/
 5xf3VOSIZ96C40o2C1BNC3vyJq++60wRdSv0Kh9s3g8IBLU0JzyI81JBi9y7SUj3VPDMOyB+A3D
 bcjGfU2EJ6n3FOViBWXPiW41LY8XIUEEFdLYauuMxle28o6kh6leLA6q+DBl6gZzQEGpiIaOvnX
 wgoql+Gp/mIRv6PsmJ9/UhX9iOUEZb1Rtre5L7eGLmWll+NH4zvZM72+PegfVmsUshGWoCVpox+
 WaJoFiGTN1q6Z46FRwgnMd+VD6U4iI5frU2uXb8OMeBwgeWfNtNBTRokinsSAi3or5azHd2RU2u
 e8mydNsQH5w+frNcr2QkUvmWoUHzbYP8Stv2E5MudlWLRRwdxtGHkafI3pglCRca7gQzgwjQ3pe
 rlr7LtVtBZI/ZOJA==
X-Received: by 2002:a05:6000:3105:b0:431:104:6dd5 with SMTP id
 ffacd0b85a97d-4342c5728e2mr3256518f8f.58.1768400582935; 
 Wed, 14 Jan 2026 06:23:02 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd0dacd1sm49446446f8f.4.2026.01.14.06.23.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jan 2026 06:23:02 -0800 (PST)
Date: Wed, 14 Jan 2026 15:22:59 +0100
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Message-ID: <aWemw2ZCwtAd17I1@pathway.suse.cz>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
 <20251227-printk-cleanup-part3-v1-6-21a291bcf197@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251227-printk-cleanup-part3-v1-6-21a291bcf197@suse.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sat 2025-12-27 09:16:13, Marcos Paulo de Souza wrote: >
 The register_console_force function will register a console even if it >
 wasn't specified on boot. The new function will act like all console [...]
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.65 listed in wl.mailspike.net]
X-Headers-End: 1vg1m9-00011J-Mw
Subject: Re: [Kgdb-bugreport] [PATCH 06/19] printk: Introduce
 register_console_force
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

On Sat 2025-12-27 09:16:13, Marcos Paulo de Souza wrote:
> The register_console_force function will register a console even if it
> wasn't specified on boot. The new function will act like all consoles
> being registered were using the CON_ENABLED flag.

I am a bit confused by the last sentence. It might be bacause I am not
a native speaker. I wonder if the following is more clear:

<proposal>
The register_console_force() function will register a console even if it
wasn't preferred via the command line, SPCR, or device tree. Currently,
certain drivers pre-set the CON_ENABLE flag to achieve this.
</proposal>

> The CON_ENABLED flag will be removed in the following patches and the
> drivers that use it will migrate to register_console_force instead.
> 
> --- a/kernel/printk/printk.c
> +++ b/kernel/printk/printk.c
> @@ -3858,7 +3858,7 @@ static int console_call_setup(struct console *newcon, char *options)
>   * enabled such as netconsole
>   */
>  static int try_enable_preferred_console(struct console *newcon,
> -					bool user_specified)
> +					bool user_specified, bool force)
>  {
>  	struct console_cmdline *c;
>  	int i, err;
> @@ -3896,12 +3896,15 @@ static int try_enable_preferred_console(struct console *newcon,
>  		return 0;
>  	}
>  
> +	if (force)
> +		newcon->flags |= CON_ENABLED;
> +

This makes sense because the pre-enabled CON_ENABLED flag is handled
right below.

>  	/*
>  	 * Some consoles, such as pstore and netconsole, can be enabled even
>  	 * without matching. Accept the pre-enabled consoles only when match()
>  	 * and setup() had a chance to be called.
>  	 */
> -	if (newcon->flags & CON_ENABLED && c->user_specified ==	user_specified)
> +	if (newcon->flags & CON_ENABLED && c->user_specified == user_specified)
>  		return 0;

But this location was not a good idea in the first place. It hides an unexpected
side-effect into this function. It is easy to miss. A good example is
the regression caused by the last patch in this patch set, see
https://lore.kernel.org/all/89409a0f48e6998ff6dd2245691b9954f0e1e435.camel@suse.com/

I actually have a patch removing this side-effect:

From d24cd6b812967669900f9866f6202e8b0b65325a Mon Sep 17 00:00:00 2001
From: Petr Mladek <pmladek@suse.com>
Date: Mon, 24 Nov 2025 17:34:25 +0100
Subject: [PATCH] printk/console: Do not rely on
 try_enable_preferred_console() for pre-enabled consoles

try_enable_preferred_console() has non-obvious side effects. It returns
success for pre-enabled consoles.

Move the check for pre-enabled consoles to register_console(). It makes
the handling of pre-enabled consoles more obvious.

Also it will allow call try_enable_preferred_console() only when there
is an entry in preferred_consoles[] array. But it would need some more
changes.

It is part of the code clean up. It should not change the existing
behavior.

Signed-off-by: Petr Mladek <pmladek@suse.com>
---
 kernel/printk/printk.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index abf1b93de056..d6b1d0a26217 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -3826,14 +3826,6 @@ static int try_enable_preferred_console(struct console *newcon,
 		return 0;
 	}
 
-	/*
-	 * Some consoles, such as pstore and netconsole, can be enabled even
-	 * without matching. Accept the pre-enabled consoles only when match()
-	 * and setup() had a chance to be called.
-	 */
-	if (newcon->flags & CON_ENABLED && pc->user_specified == user_specified)
-		return 0;
-
 	return -ENOENT;
 }
 
@@ -4022,6 +4014,14 @@ void register_console(struct console *newcon)
 	if (err == -ENOENT)
 		err = try_enable_preferred_console(newcon, false);
 
+	/*
+	 * Some consoles, such as pstore and netconsole, can be enabled even
+	 * without matching. Accept them at this stage when they had a chance
+	 * to match() and call setup().
+	 */
+	if (err == -ENOENT && (newcon->flags & CON_ENABLED))
+		err = 0;
+
 	/* printk() messages are not printed to the Braille console. */
 	if (err || newcon->flags & CON_BRL) {
 		if (newcon->flags & CON_NBCON)
-- 
2.52.0


It would be better to do the above change 1st. Then the @force
parameter might be checked in __register_console() directly, like:

	/*
	 * Some consoles, such as pstore and netconsole, can be enabled even
	 * without matching. Accept them at this stage when they had a chance
	 * to match() and call setup().
	 */
	if (err == -ENOENT && (force || newcon->flags & CON_ENABLED))
		err = 0;

You might just remove the check of CON_ENABLED in the last patch.
I think that this should actually fix the regression. It will
handle also the case when the console was enabled by
try_enable_default_console() and try_enable_preferred_console()
returned -ENOENT.

Note: I have some more patches which clean up this mess. But they are
      more complicated because of how the Braille console support
      is wired. They still need some love. Anyway, the above patch should
      be good enough for removing CON_ENABLED flag.

Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
