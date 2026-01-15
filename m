Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D60AD24650
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 15 Jan 2026 13:13:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rPUj7TtyNZWeCbvdEAiA8Qb7+IwhMXtYSltzbcDybCg=; b=Mi13CtHZhp4tX2sTe+r3ywq96O
	vaJU00C9BRAHJNDzoSeWj5PPXNz3hey/0rGVZQxoFrwJZDMV8JWZvABrA/E5vzOtCR/OF4vCa2VJi
	gD6pzRT5cxCI0iSFJ2NO9smEV4yLvVVCC9VoWvRE+Mb/1qE9+Y5oRX+j9fKfKtYqtRpA=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1vgME4-0002Tl-1Y
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 15 Jan 2026 12:13:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1vgMDx-0002Ta-5M
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 15 Jan 2026 12:13:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tARhp8b6WpUCQdTEvi4pG8l7ncFl190/VBWtO1OWxSE=; b=dcx/lF4GrC7TPvjv+5MLgGas4s
 Hn/7CflcdnSuzXpN1sHsZ+eloxtjXG5IHBfx3Zm0W7jNfBrI/n6C4ZipknpotfPsdbzuztwoMT7Fy
 MUjM56ESXElpTQ8P635ULlqrFcREuLn9hVqrz4nH6CWCoKP2WZI/Oj+9p3SZnPWNU6pM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tARhp8b6WpUCQdTEvi4pG8l7ncFl190/VBWtO1OWxSE=; b=aD9ZBsZEGuRuisnBJtlhCP4QwM
 2WlAFdqHcuB5csjJ56XHacVxMlY1UugFozZiITzSQ0zIklG7LhgrFfA5u34eSZJ+n2vMuV3in3DkS
 UBTYbRGi3Gjphka2qemd3k8lmC1O6I7wqXbgwxDfPIXTFDsaZHR1SIjvvPIkbtQaZ4p0=;
Received: from mail-wm1-f43.google.com ([209.85.128.43])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vgMDw-0003jq-QO for kgdb-bugreport@lists.sourceforge.net;
 Thu, 15 Jan 2026 12:13:13 +0000
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-47ee76e8656so10476955e9.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 15 Jan 2026 04:13:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1768479186; x=1769083986; darn=lists.sourceforge.net; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=tARhp8b6WpUCQdTEvi4pG8l7ncFl190/VBWtO1OWxSE=;
 b=HOl7mfN4wi+J+Myc8Lq6OHd6/AaK5bsyYRd/uiBGIEnYNX4qZiIVsSszFGfVRrVHWZ
 jTu41xH94hBQe3o01efPwmhwjd2KdkMQ2Oa/d8KwchLm2JslCfFAyDSsCTe8EbF5+3mA
 T3wr/VhprAWnAKWob1JnroPuV3n3metLSO4nEUSRSDR7ewiVz3CDjUdZfXQR94Idj7Ej
 Nph3RHJUVpj1+g/SGpZbCkp8TtUzTjdkGnK8KaXgP/uOJrsRAAlhN5GyA3R0WHeLaUmS
 LbdG0CtNB5MS4Lo7iKbZdDu6u5UZdq0TypbNLdiMW7tqM6djVpd21YhIabGL54blZbcB
 1i8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768479186; x=1769083986;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tARhp8b6WpUCQdTEvi4pG8l7ncFl190/VBWtO1OWxSE=;
 b=LAbRqXggEj+FIsrD2hzrhaTBzvb1Q4AKJV0NadxdNMSU+uh1cLeDvjw253upQVEhAI
 xHT6jRst2XLs9B8H1icIWtYxm773tdFvWRX5FhiLHxNJBxMksNr3BWyHP40fZmT10P4M
 MpWN0XHYLRuY85KB6TTo8vVCi0sS90GX0DuDg+36xyo0ChW6G1muBUaSI32rCgcQDRvj
 7zXOn4y41lAUyVd9NMkuwGaSYqfjZpYEU2tp8oyzYkvmuaSu5gSvUDd6y0MDetMXt5ek
 miGYidlbPeCRmD/tBFvKMG5UoUbdsFzKMg/x+xjHv+8nAYBG54pm6T/LUSveScnRVOr8
 rWhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+ERD/Yz4Ozw+ba9WHrWlkZXaXlyWxXEutdfVbT3vvIW2k657d1AWmXrbX3kcbtRxOIEzj86przlb0A8BDcg==@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yw/PeOuHKWP4D7JG9ZJ9sARot64xvHHfqiCrkmN5UOCAxP/modh
 R0h+IU3mf4LifyT8nqTVnyP4bOFf8dIus31GUGuDeifhxBcc475ycHtJA+DNWLntrR4=
X-Gm-Gg: AY/fxX6o25uORdV3CQ+KBkAVCtHPKH1bazNSjVV52NMDBn/iCO7FDmdIE3d810QodIZ
 Ta7dHrzcaWYrvdoGhQ0ijE3eepS48tMb+WLjIn5Y/Nu24OTRxg6K4ksVqA0+qBSeFugTWAEx6GL
 wSZMbKz5veQ4eRKkl3CQ1HFiVlhKoc9N1pwUAtP9ZLEXpWePeIRLPL4/U7vvxbUigD6uiqNmyVW
 JT/7qvREiqMMASAQHx5hbq6AMZ3NB8vxHhYSIPlNwC3yv4FfZAbg62IGQqdKAlT5Djf2gM7RUKX
 JAKUc3npYhw7i/TVgAjcQopnmbYIc8B+8CMOVPXenAJtxkOyc+yeON8tlmMZYiP/Seld50qHjGX
 4rRx6ZO1BEHV5ExrMLVXnWMz0/oUJ6D/+26YOb9k8DCtvmvXECgDizV5d8AWA3PGwuS86++dVAv
 ih85zeTP0IRDnE1w==
X-Received: by 2002:a05:600c:1c20:b0:47e:e712:aa88 with SMTP id
 5b1f17b1804b1-47ee712ac96mr42613125e9.31.1768479186231; 
 Thu, 15 Jan 2026 04:13:06 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4801bc3e57fsm22590935e9.5.2026.01.15.04.13.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 04:13:05 -0800 (PST)
Date: Thu, 15 Jan 2026 13:13:02 +0100
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Message-ID: <aWjZzuY31bg95jiy@pathway.suse.cz>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
 <20251227-printk-cleanup-part3-v1-11-21a291bcf197@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251227-printk-cleanup-part3-v1-11-21a291bcf197@suse.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sat 2025-12-27 09:16:18, Marcos Paulo de Souza wrote: >
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
 [209.85.128.43 listed in wl.mailspike.net]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URI: suse.com]
X-Headers-End: 1vgMDw-0003jq-QO
Subject: Re: [Kgdb-bugreport] [PATCH 11/19] powerpc: kernel: udbg: Migrate
 to register_console_force helper
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

On Sat 2025-12-27 09:16:18, Marcos Paulo de Souza wrote:
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
