Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 004F8D240FD
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 15 Jan 2026 12:06:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DzwUCL/8T4hCBY19CX5hsfbbAM7tOIZ1VhZWSOIGbSA=; b=IwQpEqDMP/9l+fMXVUW3eozWuA
	s3WFMxnd2+abvLQ0GSRj7bKoWYP7qt1VW5+2XehDNk4Hm7qPZyi+Sx3urWeF+AHtWsmGu68rBc6l0
	1ZnUXRxJNg+gu+72sPhswVWZZ1bM3AQEkE1Ut2E6pFVZmcKmvlPuPVUGvBMC12vpJ/f0=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1vgLB2-0001Am-K4
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 15 Jan 2026 11:06:08 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1vgLB1-0001Af-F8
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 15 Jan 2026 11:06:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AuZzUvIQYamq4W1YoLrzX7y0En5/TpcBTyFE7gx3A0A=; b=OVbQDVN0Pt+gvbx0Kt6b1jCeE0
 AAkRkEdcaJFuC4y9dNjLG1P+db7JiW0DRSqt8a7f2gz+LaCcM4heB4M+BpimGFdeIIhfP0fk2I4+k
 FcdDg+cUMCa/ZT5/kciy+aJT0YaD0d+958nEj16QOX2vzDAAs33S2vIhO19Hof1+RlPY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AuZzUvIQYamq4W1YoLrzX7y0En5/TpcBTyFE7gx3A0A=; b=iNfgVcTt81+7Wtjdn0JGrjOG83
 W6GkBYMk4E5p4QQe6S8NZP7NmAx7rYB5yBB8mCyWhFQ9U+R5Yr+/OMbN9sPfdjzPGeKej8sR66wOY
 KOi++0InhNrI6WBGiqYUgFKnJOaHF8o3UXbENI9Ronw8kUqvSVX0PBEtgS5ANl8THl3Y=;
Received: from mail-wr1-f66.google.com ([209.85.221.66])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vgLB0-0007BO-8k for kgdb-bugreport@lists.sourceforge.net;
 Thu, 15 Jan 2026 11:06:07 +0000
Received: by mail-wr1-f66.google.com with SMTP id
 ffacd0b85a97d-432d2670932so671734f8f.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 15 Jan 2026 03:06:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1768475155; x=1769079955; darn=lists.sourceforge.net; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=AuZzUvIQYamq4W1YoLrzX7y0En5/TpcBTyFE7gx3A0A=;
 b=BKQseDq/MaAysisaaPaxJabNiYZqgEJtdqHM8rnpS4kfspTsKmb0yWDlhuEXpPk1sZ
 kLkzfolJlP+jbpDxZTcGnJwHwvmG+fi/mk+yE2djL+L1+EHyvsVDQvf27TjKbhCYsm9I
 YZhdAA0l4CfqKMDDA+Be8UnJhfwHdc1Bw34r+iPsu5vU8cnBt78utXDAZWcM2ylUF8Qt
 Trb6aA+nhArdVtczV7zO7kjPha7RaT+7sDYwru0S8+5EYmmf1RJcwlEOSE65ruYilk02
 bePKiTHFikyj9FdUxRa685q6GTmQ8LX6TLjPaSGCdne/cPGtYvsResDVvYLaXszaf9fZ
 W2Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768475155; x=1769079955;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AuZzUvIQYamq4W1YoLrzX7y0En5/TpcBTyFE7gx3A0A=;
 b=HfutIu56HVxcgbCl5f/et4cLGG8itoQEW48tbPpe55mmahWd2UkqE0R+V4VRpNwsRl
 vH045zn5uwyK8gLPIA+LI/okeCR4BjrhpSh/NChLG0QTWuuBJBTUsB1FM0/plR31PmXa
 8P9B4M18E+BRdDrFO/UNSw+Id6el0fzrcYZXpnBIqBJK1SSs+h5Pe13uRGDcygF3qnhP
 JYwlwFJiIN5LzmyvmztDg5ipOmDSYrLj24NaUit1f1KuSwHWdc7v1JfBzubI/usxyTgc
 nS0NtpdAKC167v1LQHnrcnQvPoYnNejFyyYcgj1LoapUN3Yp2Cmb6JDbIiUudilVmGs2
 Qdgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzrhbri9gXIQnsoYRJaM0MQCszteegEfZovoqHwUHeljXcEzndmi4puG2U6QxBdUzz7ImEk96FpUX2Uwe4jA==@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzEXRuHi2tL+miAofCCPMRdxhCPiD+ZWs6e3rwDXgzeWu4Yfb+4
 rDhUpV94dJ19RGT0s21SQuD9coLUMLgMQbyd0nxz8xhOVm/Pd9gSEpAa7uGGzMzbbKU=
X-Gm-Gg: AY/fxX6Wt9kgPWybiZe7aYuCA6xzbWtB7SsElO7eSO8jFR2eHxW5bFk8o9Xzi6429pi
 KZlP6ghSiJkDly5NAsEA8hgfuwENQ9em6oKVkDgygR8Qm3bpsjr/721PT7ItbqZayOshxZPFdOv
 9GAJ3bUwHU6AT/Y/KfqL1hFqADgcJ1M21AQqDrE9XZFQg4qL9o/7Cjd7dzviwu8Rxn70fGd9rHO
 5x7JwSCAREjEt/TxKtBNbBbt0qg+bwDibzyk+HrR8QvJXMBIrihcoHau84XQKTHe0i1pMYQd5VA
 eQuoLGbT3RTeTBDFH7x5R34WWS5l+z98GLlcFd8VL5o0nhE8fXrLaqt/0/Fz1pNVy0Mk1Veyxde
 Xmxv8L7j9fHeZ2ZM47U4J/ReVY69JoLN3J4O8T1+s704kbTAP8aluPeubuenHCzlrCz8Vec7iL/
 c0rmTe/T4aY3YAzQ==
X-Received: by 2002:a05:6000:2f84:b0:430:fa9a:74d with SMTP id
 ffacd0b85a97d-4342d3912bcmr7103110f8f.24.1768475154515; 
 Thu, 15 Jan 2026 03:05:54 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-434af6d909fsm5297949f8f.31.2026.01.15.03.05.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 03:05:53 -0800 (PST)
Date: Thu, 15 Jan 2026 12:05:51 +0100
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Message-ID: <aWjKD4jv8CySV0Rj@pathway.suse.cz>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
 <20251227-printk-cleanup-part3-v1-10-21a291bcf197@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251227-printk-cleanup-part3-v1-10-21a291bcf197@suse.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sat 2025-12-27 09:16:17, Marcos Paulo de Souza wrote: >
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
 [209.85.221.66 listed in wl.mailspike.net]
X-Headers-End: 1vgLB0-0007BO-8k
Subject: Re: [Kgdb-bugreport] [PATCH 10/19] fs: pstore: platform: Migrate to
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

On Sat 2025-12-27 09:16:17, Marcos Paulo de Souza wrote:
> The register_console_force function was introduced to register consoles
> even on the presence of default consoles, replacing the CON_ENABLE flag
> that was forcing the same behavior.
> 
> No functional changes.

> --- a/fs/pstore/platform.c
> +++ b/fs/pstore/platform.c
> @@ -418,10 +418,10 @@ static void pstore_register_console(void)
>  		sizeof(pstore_console.name));
>  	/*
>  	 * Always initialize flags here since prior unregister_console()
> -	 * calls may have changed settings (specifically CON_ENABLED).
> +	 * calls may have changed settings.
>  	 */
> -	pstore_console.flags = CON_PRINTBUFFER | CON_ENABLED | CON_ANYTIME;
> -	register_console(&pstore_console);
> +	pstore_console.flags = CON_PRINTBUFFER | CON_ANYTIME;

As the original comment suggests, this was done primary because
of CON_ENABLED flag. Otherwise, the console was not registered again.

register_console() might remove CON_PRINTBUFFER when there was
a boot console and the newly registered console will get associated
with /dev/console. But I consider this a corner case. Other console
drivers ignore this scenario.

I suggest to define the two flags statically in
struct console pstore_console definition as it is done by
other console drivers. Remove this explicit dynamic assigment.
And add the following into the commit message:

<proposal>
Define the remaining console flags statically in the structure definition
as it is done by other console drivers.

The flags were re-defined primary because of the CON_ENABLED flag.
Otherwise, the re-registration failed.

The CON_PRINTBUFFER might get cleared when a boot console was registered
and the pstrore console got associated with /dev/console. In this
case, the pstore console would not re-play the entire ring buffer
on re-registration. But it is a corner case. And it actually might
be a desired behavior.
</proposal>

Otherwise, the next generations of kernel developers might think that
the re-assigment was there because of CON_PRINTBUFFER flag.
And it might cause non-necessary headaches ;-)


> +	register_console_force(&pstore_console);
>  }
>  
>  static void pstore_unregister_console(void)

Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
