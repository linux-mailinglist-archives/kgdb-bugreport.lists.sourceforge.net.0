Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ACEED24726
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 15 Jan 2026 13:25:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LVRPQvTjjMm/AFvFsbwAat9oCegMy9zCVL+suNSSPSg=; b=X4jwzJaG9ACykq9CHLGfLp12Wo
	Yg2w3rKootdffQDOWNA107HMSdU8VbjFyT+QUXYpBRpQepmZ4B67qNYlbdXZ8unHW7FhoTX4FNcvV
	ABQA6tp0JzDUCktb9hQ3EY1xrZLsDdRzaPwifyUOHZucMiYIXscKeyCZYW9RdeWINfYc=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1vgMPS-0006Zh-UX
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 15 Jan 2026 12:25:06 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1vgMPH-0006YZ-Lx
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 15 Jan 2026 12:24:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jS491F7pY/6VV44vwrzsFaAyA9RjAqjEAkamZCNInAE=; b=P6UybG3KF6Wro2XxKcMZsOJlpk
 FFd6qYm2c6g58Vm2Ddks/8QxIZF2qSiR8PqpxsWe5Hz0P3sciC1SlAupW3EPt5lYTCOcCjDonyV0A
 0SuMozVUb6AmaFvUq7TIw8EWA4/jbNVVnrny/eToR1pIy1ioGDGju3JIk0yP+eok6MxQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jS491F7pY/6VV44vwrzsFaAyA9RjAqjEAkamZCNInAE=; b=XVCscTkao0GcmjY6gff4epEZ+j
 bblGEqwJoMtX1inIfzpEEmPMU3bnBdORQmOmSsA5uLFW8ks+bn8UbJYr2UjoD1I5DGC1nd4DJjlys
 c56INH9PYvc3yDZOu+p4Qcj/T0wsVPpXQTHPgPyYtZTBm98tepMj61qRXABdLhSyPN1k=;
Received: from mail-wr1-f50.google.com ([209.85.221.50])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vgMPG-0004ee-FV for kgdb-bugreport@lists.sourceforge.net;
 Thu, 15 Jan 2026 12:24:54 +0000
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-430f5ecaa08so435791f8f.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 15 Jan 2026 04:24:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1768479883; x=1769084683; darn=lists.sourceforge.net; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=jS491F7pY/6VV44vwrzsFaAyA9RjAqjEAkamZCNInAE=;
 b=LvPOMI7XkHagIurSpLe93FyRCys/qVLRIHwijc5izhysc9lVFKTmbp2jXjOy3rwSRR
 DPExehJVRPHwihpVcTpgbA2JCGQwokCUF+WP1OxURUyTToVNR0KocEC8F9GX51SOdQ+/
 kWpY48C67bvzCF3dSfJ2OnzV0Ywcb6DJvetDDzJT0fpwHZkZZt/2ShwHUW1efl82Fmjf
 Ol7QGTXGs29hiWGANwIMJsiSOGXFkDCcoSwGcWx/BeuA4JDvay4dglwzpPOnfKw86Oam
 USxA2BLVf4CULC7RdVYxhmWUBR0s0+ZYdSwZtGOIL1lak5+FaumH7jtMlSeUDFdWjt8k
 MUbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768479883; x=1769084683;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jS491F7pY/6VV44vwrzsFaAyA9RjAqjEAkamZCNInAE=;
 b=g9c1Vb4K5B+4uyw6eFDIqCg4Xl8BaJXPAKIMI53UqquZyhdKL5CMHotUZLHm+RIaVO
 VNDiE4ooit22MZr21eivzlwmmT93NrfwODgZwZFOkxKPq3ITIjcw1pbsEHOfLJoAY6lM
 7i9zoT1E3dRm1pe0pq97nZI/JLvpdrqE5HHHJBeLROxlctsPy3DwiofwoyZUl5yhB0J5
 KjzMRvU/mb0YgrPta6KtF1mXK9gSBu4EldVrz1Rso3KInPqPxp1IiLv+j8w7po1QpgzG
 KnOkTznLBlDh4TS7RAfqL3RSCNDPM5Kykd7eFmSKvAnflUjuVpROS/t1KVCfcPB3cfWg
 1yPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJApvBv5aWaaPfCP85ZFmQciEuFAVeRVOq8FMZ/k8J7UZB0/nAo5oH1GUpPDf2QbjJIqPwLUNtz+jV/C7wSw==@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yyaaen8Sftj5V3DuJs+riWcEpGxfwjCytvzEBU8gAVYbU5zZ0k1
 tQwDG6gZ2nPLGM3+tAUZ1sdcOwLRLi/P0LD9iDi3MsSlQTFiC7tXwP/Z0b2zxHZWG9Q=
X-Gm-Gg: AY/fxX7DwiGGZOg1joi16SddHFnTOJdENP5BO7IDiRQX3sguPgijTngcWSA5IX8natb
 Sv2r1HibaEjLTeWDkOfUPOXmgtuM7TObFTEC3v6JpK6PI/ExHlOnfwvMNjuivU+Jn6msUFYEYP+
 h7uSP2emp2w4jHJeoLi/tyHdRp6EtRxJ2qggqX6WmkqKuz1sYpv8aaqrKnZMBUJAWyhSvgE/Qxz
 so0QqS+SRW6jZsfQgs+yOwYJhcNhMWWf8AWxGWDPK6CvrudpeRTXI8oh98szS84kJQpeRfGM5g2
 QHv9gMbW1w4Ov5GP1DKKhYOJqyMDPhCftfMN4MqrSv/f2qjxLl9LvX6rMpQO+r6M792maHIaB9v
 N5JQOEWAXJNyLGlmzN+WFtrF1i291Cpdks9CWiYDUElq29K2pr3hGDTkRuZy9iiBa+xBxGBHqHL
 B5BrPgTzExIIxneg==
X-Received: by 2002:a05:6000:1789:b0:432:5c43:64 with SMTP id
 ffacd0b85a97d-4342c547aa9mr7495008f8f.41.1768479882771; 
 Thu, 15 Jan 2026 04:24:42 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-434af64a650sm5653238f8f.4.2026.01.15.04.24.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 04:24:42 -0800 (PST)
Date: Thu, 15 Jan 2026 13:24:39 +0100
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Message-ID: <aWjch-EcYm7tkF0t@pathway.suse.cz>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
 <20251227-printk-cleanup-part3-v1-13-21a291bcf197@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251227-printk-cleanup-part3-v1-13-21a291bcf197@suse.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sat 2025-12-27 09:16:20, Marcos Paulo de Souza wrote: >
 The register_console_force function was introduced to register consoles >
 even on the presence of default consoles, replacing the CON_ENABLE [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.50 listed in wl.mailspike.net]
X-Headers-End: 1vgMPG-0004ee-FV
Subject: Re: [Kgdb-bugreport] [PATCH 13/19] um: drivers: mconsole_kern.c:
 Migrate to register_console_force helper
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

On Sat 2025-12-27 09:16:20, Marcos Paulo de Souza wrote:
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
