Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C1761D2468F
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 15 Jan 2026 13:14:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B7/2TCYaH4ui4e3PMBGqyrk9ZrsuJDkRkJYDdcZcfaE=; b=bgNH5Nb8WY7RkarP9mF4EfqXLU
	NEq3edHSijNUyOjXqcN4C/m5QUAYbvZkCsKwKgUZbzJI65f0Ihsc6SS8KgHVDwi+KWSmCsnIAVggi
	jQjhNktPdKQjvDq0fI6aF2oqBzC3vUppSGYknAGiVYZbtfWBU19CdtJmEaLgWQSnAMiM=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1vgMFa-0006HB-G8
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 15 Jan 2026 12:14:54 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1vgMFZ-0006H3-CV
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 15 Jan 2026 12:14:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zx4s5ogULMWiwAg3H50k8gmoVyZOh2DwfMGC+/dY5Co=; b=LGDTaZcv+7cvaHI4K5bUSQdPHe
 raQtfAhhTXxGfILKxK8JyGHQryAaPs5M8hNiC/43jfuz2zpmdBeuJchFP8fezs0gU2BBzLePesqIh
 gbIIJIffr/cyH0MUh78o+1eawG+I+gmUjz0Cerp9lmrYZBlvhun6zh6joFTK/HnUYOSo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zx4s5ogULMWiwAg3H50k8gmoVyZOh2DwfMGC+/dY5Co=; b=UkPl/XRHDrwefx31nErD8S0wn3
 FSSiYdJwV+9sUWOf3S1ROYdtx7ajDVziiYKKYXWLKluvOnRFr5YmiRy5uVmsIpFZ/oDoPd4/pOdwb
 KmoNPZhv+mVdjtQsBCUqSk5B+hYh8UD0zXRmQaRHAvADXqrBYPx1tEKvxAqbnM6bTRnU=;
Received: from mail-wr1-f52.google.com ([209.85.221.52])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vgMFZ-0003rg-26 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 15 Jan 2026 12:14:53 +0000
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-432d2c7a8b9so743671f8f.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 15 Jan 2026 04:14:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1768479281; x=1769084081; darn=lists.sourceforge.net; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=zx4s5ogULMWiwAg3H50k8gmoVyZOh2DwfMGC+/dY5Co=;
 b=gQkPiWzvZA1PF4SqUtRKGi/eX/dPmpkCHxPS7mWudmx7YV/lrhTisSX/zILgLJQmTx
 N1+MvaSNJ77OsecRmbszwTzEA7x/paRwduVOIFDpP/8EeAdV3luAwQVS56zQYpXIyU77
 tWomqlnJW3UaAyvpDKXEtAbEk6e9XKqCC21gJ6RiF16Onl065x6j4F3Ugu3uoyBP/Bhg
 EUsyzUuMMfFgLemcK9wzAvoprS0IEyyd2+R582KZG+KRzLhe7u/Mev/42xMnRZG7vj4N
 F83jLZj9VyRximUH+BUweFnKU9Al3qtaMozA1xdF3fd/PKwTsLlMkH96NsqESTKsJ6Fp
 +Yqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768479281; x=1769084081;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zx4s5ogULMWiwAg3H50k8gmoVyZOh2DwfMGC+/dY5Co=;
 b=DMYFeSKExTPaYcAruyp4+Vl4tEMcgZ4LmNioiEoQBm8b7w5iE0vleT4ovmlPtq9ynW
 pxEMJR4DQirx+MCROCjEniDegjHWjf1RstYeLUah5gk4JcIG+78usKJYt5Cd5XO19TXL
 NApW30cARDPzeTOfHBqaMBWVi0viaLUSHUSwt5/8vuHK2RpCzWJuVSR8kp4cA9dLeFkK
 kTUU63K/ISOrcFfZNk2zr3LJx+bLXwYnrNgibFhtg7lkRZBqhmFKjuc9C/D+qs3Ujy+R
 UEX6PaVpWOjulJ1sJtN1Ex/0Fob4dJNlEGg03A/cDQR6oDOXuAerPgBvjRkuL/JO/bdD
 dMxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrLJRaAty/m8BeZWotLdbAYuVRJDmGQBCgtAwVONJoeVzr40ijalFXlLGtQq/xpFG/cetgCDxKeAUEX5/qdg==@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwvQNye2F7s+Vjc7H5U/PmyJjZ6uN1k4XCGcL+K2zy7+/8rcqvi
 Vp7UrQSlQoKmIadVhYziRAgyCpU+ak6Pagkj94xGZ0aAEyH8EyJ5srBN2xC+J804Ht0=
X-Gm-Gg: AY/fxX4JuB5U1XnfcuesmT5U0A9nXfz/hL0lT2XiqAhI5yPJJhxmNqN2W/N4Yzh29AE
 CeqbRcK86eDMoGhfW9U+3k1VBkdtLK9u9onv9fe5bY87SJRiKv+JFQ6n3KQx01YzV7QMsDbTit6
 Xw7DoZ+B/DFnf+dQ8yQV2C/w+Duuln7Axb1Ay/AQ0YdZTaw7UmySFBMW5VmR7wc4JFY1pVMPlR2
 GEVhG6fZK5oJlzaPF8GID/w/TEAEs2KxNhob6XmmCxfF9G3NB2/2pMqblEsbQgIOMWcshjTYufQ
 uJujLgGIrFBgZJF48S8jO8vEvcxMPsuD59+hiPeQZFx8e6nQ9yo8jRMko+n1OdvZT9CSOusr3ON
 /pyyGJbLQxkaXvQVKA8tLybiEUEC2gnCjijL6moWnztDx4ryWDv/wh7HfpPLFv7Lf3/gwUAJk+5
 uXnEvsqDj9qT3oHw==
X-Received: by 2002:a05:6000:3101:b0:431:abb:942f with SMTP id
 ffacd0b85a97d-4342c557b93mr7715812f8f.54.1768479281353; 
 Thu, 15 Jan 2026 04:14:41 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-434af64a778sm5591185f8f.3.2026.01.15.04.14.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 04:14:40 -0800 (PST)
Date: Thu, 15 Jan 2026 13:14:38 +0100
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Message-ID: <aWjaLhzRoTLalIrM@pathway.suse.cz>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
 <20251227-printk-cleanup-part3-v1-12-21a291bcf197@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251227-printk-cleanup-part3-v1-12-21a291bcf197@suse.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sat 2025-12-27 09:16:19, Marcos Paulo de Souza wrote: >
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
 [209.85.221.52 listed in wl.mailspike.net]
X-Headers-End: 1vgMFZ-0003rg-26
Subject: Re: [Kgdb-bugreport] [PATCH 12/19] sparc: kernel: btext: Migrate to
 register_console_force helper
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

On Sat 2025-12-27 09:16:19, Marcos Paulo de Souza wrote:
> The register_console_force function was introduced to register consoles
> even on the presence of default consoles, replacing the CON_ENABLE flag
> that was forcing the same behavior.
> 
> No functional changes.
> 
> Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>

LGTM, nice cleanup!

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
