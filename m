Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A173D247AA
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 15 Jan 2026 13:29:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nCak3F831QMamoI3DNnKKNuBsJhVLiR69s+hK9RCQRw=; b=lyJqyYyIZ1YGDt0b8VxpnFRKD6
	XWrxRI0ofBfNda2jElBLOPLDFEif13j/H2SpSR1xdWHzORUa8yX9DNIV3f9vmWrbOVxU+qHz5n4G2
	UKS+QtLn5rY5L6y3qqsEDaWSPFzOGrpIhYnP0Z9PMcIklhOnwfrR0tehG/j+/HY2unFc=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1vgMU5-0000N0-5z
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 15 Jan 2026 12:29:54 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1vgMU3-0000Ml-Rt
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 15 Jan 2026 12:29:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ld+As4KXLNBvjLuNePKBkF4h3CZ3gGNkmAsVzP6KebE=; b=T1vk+k7dguOz24c2I3ukH91Omg
 by+gynUYSvJMoVzGVgpi+nh5LOghNJJSQCIKnyt36lBFaGS9ahnB7yYbIx5BQJ+8tbYWf3toDmfDR
 8alvV1x2yscH+dlViz85lyaGtg+s8oVgwS5ItxN1RQ/3FmrCLFDNu5YcM/+g0FVN8zWs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ld+As4KXLNBvjLuNePKBkF4h3CZ3gGNkmAsVzP6KebE=; b=msAH95vwubWloqcosLqvv5cLtV
 a6xKHRjtzBL5gltzOfL+IQFUT127RetvEp4gakq5+T+Iipx1k0MEsBDc6lC0WxZt48F+K92XFrK9J
 nrUj9WVj1cuvoVJ7jGz3gGQ0nwmajSs62kJKtiyo/YgiN58xVwYRl7ps1m3jCYDC0mQA=;
Received: from mail-wr1-f48.google.com ([209.85.221.48])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vgMU4-0004yf-A8 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 15 Jan 2026 12:29:52 +0000
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-43246af170aso453544f8f.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 15 Jan 2026 04:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1768480181; x=1769084981; darn=lists.sourceforge.net; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Ld+As4KXLNBvjLuNePKBkF4h3CZ3gGNkmAsVzP6KebE=;
 b=JKzU43nYU3UOy78XAf/HnBxc2y9V3BNdoSUhURGAH44inGeC95zVQ3sRl2PlEP26wT
 zobWfY+0XbZSxuWUrmcgD5MmjWU6MZFTo4gZAHAeiTobW0nkbPQNXj1Rbpc0hexk8qG1
 77xj49lcSOdj+VTJIRjnSSXVpNw4gC1Qz8TYEpj9pyJeddXz2A5t8YU8ZdFz90e9Wazb
 V7NMju8dnTUEDJYkpI4exxjiRRQA+kJroBDR8Mtsj+IgmGWRis5PDi/swG5KcRrEvkrp
 sC1Tl+V50qfQiXx/cN07kYr1TR8IgDkZvbc3VReGyOXvc4U39TlqnjECSSP8R9DBhOMo
 CzkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768480181; x=1769084981;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ld+As4KXLNBvjLuNePKBkF4h3CZ3gGNkmAsVzP6KebE=;
 b=OT6u4o86gx97YPllEImkSm9nx6psUDVCaMgN7xPAZCgrdHmc04bV5BjAuf9tdX1aEX
 5yTGc7+or5oaK+NvFjcvwcTfFpJOH8CzoucwwlYY99p6hgJi0y3XK/boI6AhzQcAzuDw
 yFv1WB7l7RqZBFsF2wF+ALFyQ3NHQELOepQUI1j8N5cefeJWNcOE9dercHg6J0G9NLbj
 sy+iQ69TrLx2yolc2BAfKct/c79fhWnku7rTwTklbZ/9CiHG5YkP6DOtdCYw6Hp1PY85
 sfBniipQ4BMmZeQEgyUBeZgG6ZSWYXFRVgI6xlKyUDA9Ss6DU7v1LT93ly5EMFqFd+5y
 3Bnw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVO6sMigrbZFJmKONzOrhiytccbFs2x6e/xcl4+noUUJpBA+3w9wa/il6usuah72OUNjddHpx+sfD+7pGEA3g==@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yzk/kI+1icVYoQK0JKfy2GHpADLsYhyKKLdfjZH8kIf2YGk5O0H
 hr4kYGtyQqeoov76FfxV2kcjOfMoEAeWHldutv5/aEWC22I7TkP5HL3Fk9W+D9FvwOo=
X-Gm-Gg: AY/fxX6WDzcBCT1ig9oTNoC5qzSPARsySxpasOcvdP4r8w2gIcXHFTjj4bh3qHP3njB
 cKqDVPvg+meRRchbQ038YY29kfp1lmmWh/HD7VGSONUQcgcXUOg0+WfndtTNA96+lUb22obJjyE
 IbclPeLmmi8zzOhCWzBkgDn3oU8EeCOBUpA8d07YpwRE6BHk52IEqZBViYj3anSO01XVaMfSmKU
 m2SV60NQ6nA1t5J5fj1BdAZwR5LkA/3PztyLt3DqYfOX73yHOEF8jaspidp8ekBuro7loXkPVfT
 zN0F8HUWrd+6ORVz5b/wjMSiRv3XK4QDiFs3Tcl8OE8qVaBnczlFY8ujtA4s6Sbj5Sg9qeRx0Eu
 XpiBQEHNU8FjNh//fRJ/XHXPJH5ZpnnDo6j8fSzwQPBDKT2p7QbCSac+OlJAszcCG+xNxAtM3w4
 bddwKj3I6r8ZBHeQ==
X-Received: by 2002:a05:6000:420a:b0:42f:f627:3a88 with SMTP id
 ffacd0b85a97d-434ce7324b4mr3823468f8f.4.1768480180633; 
 Thu, 15 Jan 2026 04:29:40 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-434af653576sm5965022f8f.17.2026.01.15.04.29.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 04:29:40 -0800 (PST)
Date: Thu, 15 Jan 2026 13:29:37 +0100
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Message-ID: <aWjdsbYev_5zfKEC@pathway.suse.cz>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
 <20251227-printk-cleanup-part3-v1-14-21a291bcf197@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251227-printk-cleanup-part3-v1-14-21a291bcf197@suse.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sat 2025-12-27 09:16:21, Marcos Paulo de Souza wrote: >
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
 [209.85.221.48 listed in wl.mailspike.net]
X-Headers-End: 1vgMU4-0004yf-A8
Subject: Re: [Kgdb-bugreport] [PATCH 14/19] drivers: hwtracing: stm:
 console.c: Migrate to register_console_force helper
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

On Sat 2025-12-27 09:16:21, Marcos Paulo de Souza wrote:
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
