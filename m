Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 019B3B493C1
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  8 Sep 2025 17:39:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/7vBRnUUQb8KePzjHMaUpoBMMMd2aorIoJAULQkj/fU=; b=JkfzlzcEGCVOtjaf7MUhie0B85
	3QdbMPh9hSP3wyeShHAZ9jqL1H/moqZBW3AkDRbYhLE2YAmBIwlaM+KRLr3wyQsd36U9QLmmcL/9b
	CDyvQ4xhWUAOJfA4XQY/uOIvXcDVloqN9CNysX1goxQwYdm7hjyLbuE7lgU8f50tlNtc=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1uvdy0-0007wG-SB
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 08 Sep 2025 15:39:40 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1uvdxz-0007w9-CF
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 08 Sep 2025 15:39:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TRCW4NqpepDigQEXQoO+OG2/MkkrwFo1ppttPylNoUI=; b=lnfcRvCctQUfsF9iq5zPP+35Eq
 QXDVpKKoV08Q1nVOCdFqzth44Q1VAgTOn8rK1mZ5HFQDGoYfGd05C2CqUek8UjXhFIir8Wh17qg5K
 TRr02OuTq/HXgrI6BQ3yIfVcNp7+GFp7mAJ1A+7tvQBhrNuQJwaRc4hjb+Hkp1BX0DNc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TRCW4NqpepDigQEXQoO+OG2/MkkrwFo1ppttPylNoUI=; b=KscF3xr/hms1VwIJoCkuMhi4fw
 xxeFPq27uluJkhssr2jm0IXbbII824/gfYQZXrshNgi4x4vn4M6V7/59cE+sUeELr5isOF6Wo3uUy
 DrC0j+xRDreSo0rmYSV5Tf1xoOFDyiHSOgeguJNgzxqS0c+7nox6OPGojZyBXM6t06QQ=;
Received: from mail-lf1-f53.google.com ([209.85.167.53])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uvdxy-0008Ch-6p for kgdb-bugreport@lists.sourceforge.net;
 Mon, 08 Sep 2025 15:39:39 +0000
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-55f6186cc17so4161782e87.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 08 Sep 2025 08:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1757345971; x=1757950771; darn=lists.sourceforge.net; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=TRCW4NqpepDigQEXQoO+OG2/MkkrwFo1ppttPylNoUI=;
 b=f6nDyQkSdtJeHtAzG/b6emwQcctEUVkARCTfEz6heDHfOMor8Ki3TxaDFfgkUhqtCc
 OeOnSphMc525uOjINfI9TC4Yq4ADESELNdfX5ZHuWm7FGOdlRlQQo7FKfZ3UPxywSqXG
 zPa5UJnCDUzJjwf99+EIONK+NEP+5OmQsaOTvWRr07cIJM2RrP+RfGe9/bjQcuOtFU8b
 wD5TjmbY+aGKY+AEv/NyhBf+xPcgzqJ6vgJFXzsNmnBOlJSQTurL9fvczSjwg97Q9Bda
 U7qXOpsru82JeLqrtK/UifpyZSaEwr8U2bH0K3gVEmyTUa80OwPO6v5D5cXXZ0njZPyZ
 vNlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757345971; x=1757950771;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TRCW4NqpepDigQEXQoO+OG2/MkkrwFo1ppttPylNoUI=;
 b=tYtVqSDfaSYVOP0Fw5L8oyXx9NTud/HiBcMTVh1LFNxCA1BcQG7SDZd2Q5kHmL6lpu
 3Gpp9mbJLNZnX76YpzYGcpBwKp87LCAjOXo0iZLJBjAa3hMFlGL5RAuYqFUbc0FuQ0GS
 NfaJ+efQ9PyaiNxFOjV9XyzyVUusb1KEcPGuO3LC5KHoNDSsz3L0TlExqWg920IHqukU
 r7xd33561vSe+wATklnmMpE5FbmV0oJioU4yqbWa2j73Lr404w3nqL1xX9rbvJU+45oE
 QRFio3PDiMO9kqSF+Eg6g/k1r5c9GuWFCSfE9i9b17OMvjOKJJYzvWLP3t4BMAk9NeMY
 cGew==
X-Forwarded-Encrypted: i=1;
 AJvYcCXeYCyRrOFsgLFEm8fvh9qzdtFBcOiEb2hjSqBUWJ44ZKWQ4BMeTPwbrunj9emqlEPajnn96/6X8Q1/HNzABQ==@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yz/hDnZB4P8sbijIZtVOeoF9FmVVfPNDmowaAc1SaIADyg1Iehf
 WnZYNmj/thSHPi4Iz6OFnNuVDVOXpYA4qoQ2GgTsM8Y7KBVPt/iiaI3FSFgTGg5Ohg5BdrGgC3F
 YYf9CS68=
X-Gm-Gg: ASbGncs4whvY0FZ7DnQSgd1IKSYpLQsEJxddyRKsycR5Ni7mFdzQN+s3ssuSQTcdN6o
 kFVRjwMafaeImUrAE1i62HfxaaMtG7w1BfrBfGmP0UUfZQXadyFIbQgps9IXV9oi81kBJ4zgloH
 5n1vaD99KSXETeUT5+EbChWaCyuMAyomc4A2gwXO5oBF80kILB8VqqjB2qOb2FYVvF37IA1J6RI
 6R+esyCN/B0PT99XQXkonei7YyrkbdsVhhtiQZ0nxkRGVwR8MJezB0fACK4aKcL+5D0p0Xzz6Cu
 16rwQRY06Zzi9eSOQ/HX80uyt5eX2Gao+La0j80Nr2j44QZYQD8BN0MjshfcGIVXTY3PT+Bbbve
 M3l3j8ifqDSF8ZwrGnQfXVTkPPg==
X-Google-Smtp-Source: AGHT+IGVY1NjNi8h7a6B1deCGJ6XFfknVkp7JGXqbMs851BsmoIGKYTWDbfGdfHefIqZacmhh6EzZQ==
X-Received: by 2002:a17:906:4fd2:b0:b04:2727:1658 with SMTP id
 a640c23a62f3a-b04b1766368mr852685966b.58.1757344470380; 
 Mon, 08 Sep 2025 08:14:30 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b0471c7a163sm1239937566b.47.2025.09.08.08.14.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Sep 2025 08:14:30 -0700 (PDT)
Date: Mon, 8 Sep 2025 17:14:28 +0200
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Message-ID: <aL7y1AvuAAsOSJ4q@pathway.suse.cz>
References: <20250902-nbcon-kgdboc-v3-0-cd30a8106f1c@suse.com>
 <20250902-nbcon-kgdboc-v3-3-cd30a8106f1c@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250902-nbcon-kgdboc-v3-3-cd30a8106f1c@suse.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue 2025-09-02 15:33:54, Marcos Paulo de Souza wrote: >
 KDB can interrupt any console to execute the "mirrored printing" at any >
 time, so add an exception to nbcon_context_try_acquire_direct to al [...]
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
 [209.85.167.53 listed in wl.mailspike.net]
X-Headers-End: 1uvdxy-0008Ch-6p
Subject: Re: [Kgdb-bugreport] [PATCH v3 3/4] printk: nbcon: Allow KDB to
 acquire the NBCON context
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

On Tue 2025-09-02 15:33:54, Marcos Paulo de Souza wrote:
> KDB can interrupt any console to execute the "mirrored printing" at any
> time, so add an exception to nbcon_context_try_acquire_direct to allow
> to get the context if the current CPU is the same as kdb_printf_cpu.
> 
> This change will be necessary for the next patch, which fixes
> kdb_msg_write to work with NBCON consoles by calling ->write_atomic on
> such consoles. But to print it first needs to acquire the ownership of
> the console, so nbcon_context_try_acquire_direct is fixed here.
> 
> --- a/kernel/printk/nbcon.c
> +++ b/kernel/printk/nbcon.c
> @@ -247,6 +248,8 @@ static int nbcon_context_try_acquire_direct(struct nbcon_context *ctxt,
>  		 * Panic does not imply that the console is owned. However,
>  		 * since all non-panic CPUs are stopped during panic(), it
>  		 * is safer to have them avoid gaining console ownership.
> +		 * The only exception is if kdb is active, which may print
> +		 * from multiple CPUs during a panic.

Strictly speaking this is not the only exception. The reacquire is
another one. I would put this into a separate paragraph and write:

		 * One exception is when kdb is active, which may print
		 * from multiple CPUs during a panic.

>  		 * If this acquire is a reacquire (and an unsafe takeover

And here start the paragrah with

		 * Second exception is a reacquire (and an usafe ...

>  		 * has not previously occurred) then it is allowed to attempt

Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
