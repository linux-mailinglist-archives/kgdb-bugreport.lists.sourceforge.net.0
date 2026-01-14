Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FD9D1F0A2
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 14 Jan 2026 14:20:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1/ue1vD20UJmKuvkTHpHpCwUEIKNvyxrf5QPlLJc9C8=; b=VEbI1HRUntnMd/h072n4KNc2+U
	1AEPOsVL02j0d4tzVOlhd9ih7R9MlFGzmN1MWduWv8ceEF4dDkf7yBuOtGNqvMBkZr+ADuNZQDz8m
	1RmNQ4Dc81aahIGp2sqlwoR7+jL2eZqPhGiVTibqrfz10s1OWIwzxOXRvZs+//X5cI1w=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1vg0nW-000635-Ld
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 14 Jan 2026 13:20:31 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1vg0nP-00062P-Ns
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 14 Jan 2026 13:20:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sWiGwjTB0ZEpbDkwRFO+MVJzM9uZpDrSFPQIlzRZfsU=; b=c4cY7mRGaSD8P91x1Nzdt3c6DN
 GmCjmjK+h2A/xWkb1pwKGdh+0a09Osm7/mwNPXi0+lEnOJuVE0PaFuS8wUBfDlbD2UCcLOfJIDR/Q
 WLbRNDIk3kppB0CbQi0UzGJAdpCnOM3t1Isdk5Q4w5LharLU4FwrXBLb5OwV9ZAbxSfI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sWiGwjTB0ZEpbDkwRFO+MVJzM9uZpDrSFPQIlzRZfsU=; b=gef5Kdi0pKtfvxIW2OnMfLfVx1
 4uz7ZEsuyCV+gPSasslV1pLNYFgyMruJo5Fur7HrSV6DL6SXmovJhEvZoWeTvXt447GucIXldEdOu
 O0hl7ML2XhK5PZsS79nlqwPg5NvYsW2kg57wbwHKC7J4mODgjgD2cWQordMYz+SuG/90=;
Received: from mail-wr1-f51.google.com ([209.85.221.51])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vg0nQ-0006Kb-4W for kgdb-bugreport@lists.sourceforge.net;
 Wed, 14 Jan 2026 13:20:24 +0000
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-42fbc305882so4735617f8f.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 14 Jan 2026 05:20:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1768396817; x=1769001617; darn=lists.sourceforge.net; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=sWiGwjTB0ZEpbDkwRFO+MVJzM9uZpDrSFPQIlzRZfsU=;
 b=WBHZgoU/0iTT97KvhJT7T7qPPhnfYkdn1mKlwvUESo4FjO0k1UV0yl0+QmVdq0LTm7
 rPTfppJK4wWbRu8/D1hrfZCGzJDSUWpJ98GgVujPLfc8iINPz4cL2v9+w53j4eCCxq8u
 7oJSs9ktnP0K46hRJKRxIcZLUKEMKYm67fM94HZuYEg8B9zrqcZDGL9Z/0ngiflHqT0p
 jqrxmhnYb/rluwYHVrxHOzIJ/5VGhYK+If7yP3X214u1xeBgYti4TmygPWagYGl0EimP
 XVRr4KuuBjGPrwWWUD2foWZj0xpnFpDKMyo4AKq7+ZvHBYRWk3nrV4u9WF9un8gcMvsC
 oJLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768396817; x=1769001617;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sWiGwjTB0ZEpbDkwRFO+MVJzM9uZpDrSFPQIlzRZfsU=;
 b=fOH2T4DIgMNSyweZLTgDBvEh+FwvwG+FbptiIkpenQTBqiIWj71Umt7VaoZEsJvuBZ
 dICiZxb7A6SwMHNAb14anCvwyodIGF6vPkkJvgPoELXcD7yXWGSgBjMkcez2LC3xJxQB
 nEV+7JBqzzwQHGXbOYfSswFUQMkxu94J2Fr1StEMdVsn3f+SkFFQaNKRJVzPbsOYHfpd
 2JuAEgJ38zll2yzYqzuX/u+t11je/n2MfFvpNKVyZmnKM9QnLJu2SEN+POV7K66ijk5u
 mstW2OuRNUzWq/eB5PbzK5NypZCa59VDgkHaDOp314IzvfeE48JYzg9ySHA/va2ZjLRK
 MvTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXszf1vmfBqgo6gO2hjvRkZoN0vZt3L/ja4hj4zuAiwOEZspYsn+o8bItOE67OtoJKxqFjDu83i8EdcKWZQjQ==@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyKji66fBJNFYWf0YmyCkHyAHCojhhi4BdIaq55nyfifE3lsPwY
 tvxkVTmzHr3KBNj7fCiAa7KsjeWVkfXt7xHGp9QxWRBqx3yuWIYsuMIQnTpdmcMmebU=
X-Gm-Gg: AY/fxX7C4P+fuFVFz2Zv/021CzSs3oOvHdnA73yJfzwZ4pHQkLy/jAbOUYVPBxyZVLn
 Hh26ZZplbcnJssw5K7v/onVnFjV7ZKcgP5XZ7JEiZ/qAZ5cHZOiYRAVxAfo6aLYVvnow/Zx2Yr/
 Mh60qLqLZP09qwJwD2JNcZzhK6eYJzdHwaYtleNQVEY55P2FdmTYhExuVdlNNO9DX6Jsriq0fBg
 0Lvv4TA5Xuh7XJwv3FC+Ky5aCZLJPLNtZpZ1Ez0zUnpj4h7DrQ/iNWwCWzgMGeyJ5GweY4emBxl
 A8eu0vJe34Zi186xvI9VHC2dmokwN5E19qhiZtwCBzWmaLZS4BA1pg1GJrApRMRibagF0tZmVHv
 /5tA1qE5LFANLe7d/6dwGV4QtlJCb1OHUE0qD9Ln9QPkxzVbSjIzmQg6le5Sre3+dzxDCPSBRwh
 xISkLU4Re2f/b92Q==
X-Received: by 2002:a05:6000:2511:b0:431:9b2:61c0 with SMTP id
 ffacd0b85a97d-4342d5b2ab9mr2581603f8f.24.1768396817421; 
 Wed, 14 Jan 2026 05:20:17 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd0dacd1sm49153435f8f.4.2026.01.14.05.20.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jan 2026 05:20:16 -0800 (PST)
Date: Wed, 14 Jan 2026 14:20:14 +0100
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Message-ID: <aWeYDoMsdBNkJEqO@pathway.suse.cz>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
 <20251227-printk-cleanup-part3-v1-5-21a291bcf197@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251227-printk-cleanup-part3-v1-5-21a291bcf197@suse.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sat 2025-12-27 09:16:12, Marcos Paulo de Souza wrote: >
 The new comments clarifies from where the functions are supposed to be >
 called. > > Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com [...]
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
 [209.85.221.51 listed in wl.mailspike.net]
X-Headers-End: 1vg0nQ-0006Kb-4W
Subject: Re: [Kgdb-bugreport] [PATCH 05/19] printk: Add more context to
 suspend/resume functions
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

On Sat 2025-12-27 09:16:12, Marcos Paulo de Souza wrote:
> The new comments clarifies from where the functions are supposed to be
> called.
> 
> Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>

The improved comments would have helped to understand the previous patch.
I would either merge it into the previous patch or switch the
ordering.

If this stays as a separate patch, feel free to use:

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
