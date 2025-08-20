Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C4DAEB2E02F
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 20 Aug 2025 17:03:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9fdyj6iwLNArQ3VlL+K+rib8p7a3hH9xvmrVnJSno/Y=; b=i7jvPLbl5RlqlMmsb5U+J3JEU7
	+wy879n1vf3BZb8e4vrQ8vGKjT38gkhSr8ZubNQygNXEQKlCIgeDBlTQW7w7L1Edn/t9s4pC7qLNt
	YRmUtBAP2mzV4gp3NgHbfFU5UZCYOINQKvJM3moq3hIewo5pH4qpuJwmh8a+FYeta3Q8=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1uokLj-0002yG-Li
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 20 Aug 2025 15:03:39 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1uokLi-0002yA-Pk
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 20 Aug 2025 15:03:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Fdxbwdm478L0zqoazN7KpullU/D4AnCbXZQkeiEdPmc=; b=L4w8ozb/yKEBehBNMWtRhmI8+e
 szB8QN9JEvI29EsDCYUMskss13vb4kPFcw3B+lQYeTw+HF0b2EA0mFs9JmNmax8sOhB/MPOeo1riB
 k1zXtcrEoFLJo9Cwtm6UzojN2L7rxVCJTiMxoii8GHauNd0u8PokUZ2fXn3CM2+KawEI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Fdxbwdm478L0zqoazN7KpullU/D4AnCbXZQkeiEdPmc=; b=EUUtdDzhxA5EoiQ2dUfufeNbPn
 2e7O+LEiWcMDWQu7lUAI+dzNcxAkzLUB/on+uQw8rqySNnNLr+0w0UEeJ27Jd87AaNkCTKj4iyL1k
 Z2dc0BVY1wgUgvEHRpyEo0McZSz5K7Fv6BlWoMyJK2RinQhq8zlEpflb6WiiKkoq1uBA=;
Received: from mail-ed1-f46.google.com ([209.85.208.46])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uokLi-0003w6-Dy for kgdb-bugreport@lists.sourceforge.net;
 Wed, 20 Aug 2025 15:03:38 +0000
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-6188b5ae1e8so9573a12.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 20 Aug 2025 08:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1755702207; x=1756307007; darn=lists.sourceforge.net; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Fdxbwdm478L0zqoazN7KpullU/D4AnCbXZQkeiEdPmc=;
 b=dtoaPJBB8Lq2wrPIFOsbOsEO3szIpxlQ9j8JjBDS+3A55eTCfybgbqtnxvo/GbJKAJ
 MEHOIi1HK4LTSKiSFx3a6zhY3QpDvimXj5avAAGnPchUPjVXwnibzWcquFCv3o1vaZVE
 Iv6rTHeIOdWciAu2AoayElbSrROm6Y8StPJ0wLdp0gGqbEtBd8svMM50KmOfy+OBTBmg
 fTowVcKyGtvtokR0zS0ChrQbzrrP6AFyErsWuoJst8aye1C2VxEXzgE0SUA3kMMqVvXo
 /GEzuN6pbMPgTS3stxioJAyCv8x8R9uRz3pMAXPhfBmb5SreUrJYqfdATHNbsQvvCjuI
 PdfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755702207; x=1756307007;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Fdxbwdm478L0zqoazN7KpullU/D4AnCbXZQkeiEdPmc=;
 b=nh1c6FvMcMi8PKU35tLSEZMaupHI36MA/9SMuf5MiTgl/GGyxpCgD5WRlWT9DdEkIH
 Z2Kt3XTGgSFc6SFYWdC0flWvRzsSwEBaK63lhC/Oe5FIwwRqa0dKpSfJVD5hX4dJuyXp
 KSsgqkeGyOI8yfIFQJgB/jRXN5GhJaxi9kmbrHWU6QZo+S0HFH3UyVyGHBWv8LTYb2nZ
 p4uPaR4fUK28/u5UkZPmJy+gsoT6UPXOPAREPI3Oz9jVWrrlY09bLZWK4zTyVLwxP+Ns
 1HMeloyMX/EE33x8KslVREi6NcBC8DUluZ8shYoaugfUMoBhGnWDe2CA67k8aGGiXI+l
 ER5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEN0XNPlOTREWUAMp18DR5AdFDHVKgki2ZnCTedGG6fTJaivIl5iPJZ5J+araMZYYqiP36mJJm0zZ3IK5iwA==@lists.sourceforge.net
X-Gm-Message-State: AOJu0YylJg/vy/utg01E0KhTc54o1pYO7X2cd+GUZwMyeGw6Wob3HgB6
 LRsr5z3o7uflWuXyiEC2hXuTxXB42zyHR/0/UgapwkZwpq2zwbJguxOf77EzOivji9U=
X-Gm-Gg: ASbGncuHZ3a1im7Lq2YBfLE4ebCAuKq4OfOkfLlrJZWIivkiGZYt4k3woi/z13cvmLd
 ZNwmXzJBwxioFjt0nFx7yee14SYqXcwuOS7ZhMpn94lUMgddx0x/h+H7Y3FgNk1c+HdNzXezTwz
 ZpDu2xsg3b+SB36q8Am0nhDYbJFrwroPyZlUX2L8b9mMTykZCSHnh2716fkUWlO0+TpEgwfwE3o
 jYQgcK7G4PQBnrSfxhQDP6LHjZZCNoY1WzYfTx4WUpZ/ePqM3+9vHARVm/eh72yr0YoSYgUXF1V
 GAtiOChNTtLC9+MqtgSEya5S0ukf99MhYf3SBAqBiVwqnABG+I4vpFc/z6UtIOLGKBiJzBkS1D0
 S4NtGrGshtfkisdLV8NY/f4EYYQ==
X-Google-Smtp-Source: AGHT+IERfCeojuiZGaaBeud++WOySgMRV/LbfgcXF7j062uDmGhunKjky7xHcyj74+ty+at1+JCgYQ==
X-Received: by 2002:a05:6402:4405:b0:609:9115:60f1 with SMTP id
 4fb4d7f45d1cf-61a9759a18bmr3333840a12.16.1755702206715; 
 Wed, 20 Aug 2025 08:03:26 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61a75777beesm3589743a12.26.2025.08.20.08.03.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 08:03:25 -0700 (PDT)
Date: Wed, 20 Aug 2025 17:03:23 +0200
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Message-ID: <aKXju6tnHAjp1I5F@pathway.suse.cz>
References: <20250811-nbcon-kgdboc-v2-0-c7c72bcdeaf6@suse.com>
 <20250811-nbcon-kgdboc-v2-1-c7c72bcdeaf6@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250811-nbcon-kgdboc-v2-1-c7c72bcdeaf6@suse.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon 2025-08-11 10:32:45, Marcos Paulo de Souza wrote: >
 The helper will be used on KDB code in the next commits. > > Signed-off-by:
 Marcos Paulo de Souza <mpdesouza@suse.com> > --- > include/linux/ [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.46 listed in wl.mailspike.net]
X-Headers-End: 1uokLi-0003w6-Dy
Subject: Re: [Kgdb-bugreport] [PATCH v2 1/3] printk: nbcon: Export
 console_is_usable
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
Cc: John Ogness <john.ogness@linutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Daniel Thompson <danielt@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 kgdb-bugreport@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Mon 2025-08-11 10:32:45, Marcos Paulo de Souza wrote:
> The helper will be used on KDB code in the next commits.
> 
> Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
> ---
>  include/linux/console.h  | 44 ++++++++++++++++++++++++++++++++++++++++++++
>  kernel/printk/internal.h | 41 -----------------------------------------
>  2 files changed, 44 insertions(+), 41 deletions(-)
> 
> diff --git a/include/linux/console.h b/include/linux/console.h
> index 8f10d0a85bb4536e4b0dda4e8ccbdf87978bbb4a..67af483574727c00eea1d5a1eacc994755c92607 100644
> --- a/include/linux/console.h
> +++ b/include/linux/console.h
> @@ -612,6 +654,8 @@ static inline bool nbcon_can_proceed(struct nbcon_write_context *wctxt) { return
>  static inline bool nbcon_enter_unsafe(struct nbcon_write_context *wctxt) { return false; }
>  static inline bool nbcon_exit_unsafe(struct nbcon_write_context *wctxt) { return false; }
>  static inline void nbcon_reacquire_nobuf(struct nbcon_write_context *wctxt) { }
> +static inline bool console_is_usable(struct console *con, short flags,
> +				     bool use_atomic) { return false; }

The patch should also remove the duplicated definition in
kernel/printk/internal.h.

>  #endif
>  
>  extern int console_set_on_cmdline;

Otherwise, it looks good.

Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
