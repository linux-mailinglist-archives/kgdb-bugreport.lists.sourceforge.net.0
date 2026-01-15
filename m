Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 625E8D25BFC
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 15 Jan 2026 17:29:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iGVM54Fofc01AbHvzdOYUmav7tscV4yJP4RTpUhGDFM=; b=eCZbJhAk0VssBZCVJkiBc4FRKt
	tH34XTliW574qSbLB6K91GLo8FWvCYS6lgp6AMg9b7D2t9Vt1CwVX0ZQz5fIAo1FBSwSlOM36NtD0
	wqjqM0rlyH3Ve256DnhIaKBIgM+OGN/UJYIcGshYV742nT40O2mOjFqX8i7VvZEz4jQ8=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1vgQDW-0007pn-3o
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 15 Jan 2026 16:29:02 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1vgQDU-0007pX-SL
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 15 Jan 2026 16:29:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=URJX5xTHolO9FC46ryjpGruJ5TGEDEyfrbwATuqwgLQ=; b=IulZyV8MCVqnDY86mYivHe1v2i
 20znKOwFNF+PVAPjZTORBo90UsZxrr+JTyq79LDmLkjVBnO2YT7xKan619N2wLhkvJrZz9aMIMPef
 Ij0+tkd4d7Qy7PckIFETCQeyUABCO3m868YJsB2y77QWwgSSYMytt0LcpS4PKI6zoX2A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=URJX5xTHolO9FC46ryjpGruJ5TGEDEyfrbwATuqwgLQ=; b=Dedvpxjce1Dqz/LnWscYhPkLRV
 zQbDA7Lmo/ytvTBea8tWf8dg5XJT4TuW3dVP+2pxLoqQFE0X1OKQEDHs5Pbho0A5pqEqTCngjZDVm
 7oBcbJB1Zoqm8h3OpRIBnnXnwx1F+4bZwglOP2ebZGk6VFNiN1zR/9lp8eggyLaiie9k=;
Received: from mail-wr1-f50.google.com ([209.85.221.50])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vgQDU-0003yD-AN for kgdb-bugreport@lists.sourceforge.net;
 Thu, 15 Jan 2026 16:29:00 +0000
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-432d2c7dd52so967711f8f.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 15 Jan 2026 08:29:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1768494529; x=1769099329; darn=lists.sourceforge.net; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=URJX5xTHolO9FC46ryjpGruJ5TGEDEyfrbwATuqwgLQ=;
 b=duutR/c14Ni0D9BxUX2P0ceD9bHaaWINCwqPIVLJFPYXKUDHnlFoA1aiYZA07Goa8o
 FseDrRVqwoDUZ0KmhEc10+cfmV21Efmok1+KaNbR3lyWZJ9UucerWFeC1IxUxiS9WGaL
 vm8VQ2vemIiP/g0S3bLyRCvF4qAe6KKBXWZmHIOwbSFlb7INPH9jgATGf4FufIoHT6Sa
 EcaIWmRuCICmVoSsgH4GORcp6bXLH8KZlaRhaX0V2/+2u36GgZPmXabTD9XxgrD9zJlG
 U2gZePkMhI/MRjBlwIQe2C97XtuN98Rnjz5otAuDlKw5NOJ5ur1uXfwmLP/duWhlsS6s
 wh+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768494529; x=1769099329;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=URJX5xTHolO9FC46ryjpGruJ5TGEDEyfrbwATuqwgLQ=;
 b=QE4Km8fKqgT7qsU4Q1+fYIkGpxxrBzWN36rLnmvUCzsqS7aO1ZozUI4qZDtu749WhR
 xgM5+vrh5PtpyEgorT4Y+1jJJQTPiHbjcZG3oQMC3viCdac1NXQORzMJ0A68cxvBSNuW
 W7cl0MnbwoAFptdvMlO0SPmLFB1/RYtQ86OpLgHIOWHZE0vMEoGhQwYIOQVNWqxh1Ytv
 DPDfxuNpYLTl9FW6GH6EJlheCghkcL+8PawI/PsR2x+snvjKHxkwVMROnQBlLXyvvWUi
 odcG8BCTMbxdtA8FLpRFeVTWYYPd7ZN+E40I0HMtsLK5wu2/LQkFqPCCVvdpAUru4y+h
 5IYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXK70t9R1oxleMhU+At8o0X1rD3TBGTlHU8S9LmwI2zqaaeStv8cDuqnihJXuBculwNV/QWz0h04YU7ZfzX9g==@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzU2hsGTLeVXq9ypGXvrQKo23QWdA0jHXGPC+H2zAnzvlLj0ooq
 gEazwRfcTiULu+BaSn3R4vMFp4xt7avPmKcx4xMZyRpzdAym43B9JU+F2T5YCpp8f4c=
X-Gm-Gg: AY/fxX4Zttk3JEPGKGXRqSXJQklRQTzH8kZB5bRg05LMkqHtQ4y+kuFK3zHfNlx7Lmx
 OWMGvzFAKjJJRi35PbzOjHcvs5W781U6L6FWkJCmvzfKvsKnGQRgpoN+shXr85YznWK9awUjQps
 PtjsRpLM0vUnhHFa1pqx3cu0Hzt7SFEynBqElI6DPL6SJuZqMfJv7VGaXw1FoCDIysGLoiHj6vK
 D4dMdwT5H0CVpbxqLMLN5qEwTrq0JavcjGSmk9SF022qfPaup0BbhD75Zja2bTcGtPqg6gtJd8v
 j5XWdM6drIJl/ghDTcxHnJ8427UIVOpT41O3i+XqYYfKrWa/LPMV7x4LKWek55f6jQW3ehWTWVh
 3AqyrfE3gB55modj3S4HBZ3YEtzpwtqhDRlxjB69SwPB9OnLi/jgCY1AOm1tn+/99rq8xVCR4ol
 mQK/PV71F2SZSZ0w==
X-Received: by 2002:a5d:64c5:0:b0:430:fd0f:2910 with SMTP id
 ffacd0b85a97d-4342c501a57mr9777353f8f.26.1768494528600; 
 Thu, 15 Jan 2026 08:28:48 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-434af6e148bsm6604069f8f.33.2026.01.15.08.28.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 08:28:47 -0800 (PST)
Date: Thu, 15 Jan 2026 17:28:44 +0100
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Message-ID: <aWkVvCu74HhV7W9s@pathway.suse.cz>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
 <20251227-printk-cleanup-part3-v1-16-21a291bcf197@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251227-printk-cleanup-part3-v1-16-21a291bcf197@suse.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sat 2025-12-27 09:16:23, Marcos Paulo de Souza wrote: >
 The register_console_force function was introduced to register consoles >
 even on the presence of default consoles, replacing the CON_ENABLE [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.50 listed in wl.mailspike.net]
X-Headers-End: 1vgQDU-0003yD-AN
Subject: Re: [Kgdb-bugreport] [PATCH 16/19] drivers: tty: serial:
 ma35d1_serial: Migrate to register_console_force helper
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
 linux-arm-kernel@lists.infradead.org, Tony Luck <tony.luck@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jason Wessel <jason.wessel@windriver.com>, linux-fsdevel@vger.kernel.org,
 Johannes Berg <johannes@sipsolutions.net>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Sat 2025-12-27 09:16:23, Marcos Paulo de Souza wrote:
> The register_console_force function was introduced to register consoles
> even on the presence of default consoles, replacing the CON_ENABLE flag
> that was forcing the same behavior.
> 
> No functional changes.
> 
> Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
> ---
>  drivers/tty/serial/ma35d1_serial.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/tty/serial/ma35d1_serial.c b/drivers/tty/serial/ma35d1_serial.c
> index 285b0fe41a86..d1e03dee5579 100644
> --- a/drivers/tty/serial/ma35d1_serial.c
> +++ b/drivers/tty/serial/ma35d1_serial.c
> @@ -633,7 +633,7 @@ static struct console ma35d1serial_console = {
>  	.write   = ma35d1serial_console_write,
>  	.device  = uart_console_device,
>  	.setup   = ma35d1serial_console_setup,
> -	.flags   = CON_PRINTBUFFER | CON_ENABLED,
> +	.flags   = CON_PRINTBUFFER,
>  	.index   = -1,
>  	.data    = &ma35d1serial_reg,
>  };
> @@ -657,7 +657,7 @@ static void ma35d1serial_console_init_port(void)
>  static int __init ma35d1serial_console_init(void)
>  {
>  	ma35d1serial_console_init_port();
> -	register_console(&ma35d1serial_console);
> +	register_console_force(&ma35d1serial_console);

Sigh, I am afraid that this is not enough.

I double checked how "ma35d1serial_console" was used. I guess
that it could get registered also via the generic uart device
driver code. I see the following:

#ifdef CONFIG_SERIAL_NUVOTON_MA35D1_CONSOLE
[...]
#define MA35D1SERIAL_CONSOLE    (&ma35d1serial_console)
#else
#define MA35D1SERIAL_CONSOLE    NULL
#endif

static struct uart_driver ma35d1serial_reg = {
[...]
	.cons         = MA35D1SERIAL_CONSOLE,
[...]
};

static int __init ma35d1serial_init(void)
{
[...]
	ret = uart_register_driver(&ma35d1serial_reg);
[...]
	ret = platform_driver_register(&ma35d1serial_driver);
[...]
}

And the gneric code:

uart_configure_port(struct uart_driver *drv, struct uart_state *state,
		    struct uart_port *port)
{
[...]
		/*
		 * If this driver supports console, and it hasn't been
		 * successfully registered yet, try to re-register it.
		 * It may be that the port was not available.
		 */
		if (port->cons && !console_is_registered(port->cons))
			register_console(port->cons);

[...]
}

, which can called via from:

  + mux_probe()
    + uart_add_one_port()
      + serial_ctrl_register_port()
	+serial_core_register_port()
	  + serial_core_add_one_port()
	    + uart_configure_port()
	      + register_console()


Honestly, I am not 100% sure. The struct console is assigned to
.cons in struct uart_driver. And uart_configure_port() function
passes port->cons from struct uart_port *port. But I believe
that they can get assigned somewhere in the maze of
the init/probe code.

I would feel more comfortable if we kept the information as
as flag in struct console so that even the generic callbacks
could use it.

Anyway, it makes sense to create a sepate flag for this
purpose, e.g. CON_FORCE or CON_FORCE_ENABLE.

>  	return 0;
>  }
>  console_initcall(ma35d1serial_console_init);

Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
