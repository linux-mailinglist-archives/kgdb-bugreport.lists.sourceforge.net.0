Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FE3D1A376
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 13 Jan 2026 17:26:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wj+oF/v2J45CFS4yEThNqa0dfOAA5m8C1bbDrNxSC2c=; b=Bp9q9D23+T6Zrpou+CLLI1iFlL
	5HFNviwtNvZPD8A/bZ3+jsXiV9p5iFUeqVuK22acJxg6pDZl17Lsv2gDzVoR+OdGYipGFWJNrjrxH
	P8vqZNDUEd8Zk8pTW1QIkaZAowe0RHm9AQ57rThYBJnEvSdvNloZkNApQP72dIDGoYac=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1vfhDd-0006x9-B1
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 13 Jan 2026 16:26:09 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1vfhDc-0006x3-EW
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 13 Jan 2026 16:26:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=y9kSWtn88k+QkPqpOG7NN6Fxk/gRH5gvJVVHZoYjlVA=; b=iyq9FUGhxWdSBkk357d8kyew1N
 xEtRwaDRk4+pg30g73hwfyzIKofjOYOCp8dadukwv3a/Pb+f0SJon9Zd4jjWcLvaQUb55tSG8aUz+
 2Bw6qr++CwP1pQzhLfOEoOYWWAzHH6XSEqKedlYiCEUzXVzqkUSxqKcgp/jbOafVQRVg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=y9kSWtn88k+QkPqpOG7NN6Fxk/gRH5gvJVVHZoYjlVA=; b=Klx2H+W02dX4xden14LGainu/T
 ohclDaKR74rcfvKEAcrVdCOB48QdjZOW0iiPLYoB42Gg6SnhAXYwDcaXBv7u6tx3W1TIxPTAifFSS
 gfc44UbA8YXz1se1WobuusPlivI3VBdCkGzgovIrlEbMFHjzER4W5TvSIAZ0NBimDpQ8=;
Received: from mail-wm1-f45.google.com ([209.85.128.45])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vfhDb-00054l-TF for kgdb-bugreport@lists.sourceforge.net;
 Tue, 13 Jan 2026 16:26:08 +0000
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-47ed987d51aso8637355e9.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 13 Jan 2026 08:26:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1768321556; x=1768926356; darn=lists.sourceforge.net; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=y9kSWtn88k+QkPqpOG7NN6Fxk/gRH5gvJVVHZoYjlVA=;
 b=gtCTsiwN8nmwtyjSQUuyNL4KP7hp3M7nKTisbuRuvo+iy94AdsVLoG1M3oYJ83+XMD
 jLsg3+mAVRNVXHBk06zMJ7ikHgE99yWSFLAZqSHtYyoJfEHUru/X+wqidUaoihJ72Fsv
 KxS4QQ6WRWAK0D5Amta/opkbm7SL6ZgHrXW3/N+7ODMbwEWk1fCenl6GL/ZWCWvu/SoA
 CrzZ1Edx2ug1wLkqvMHj/6BJbdcETyeg3ijhMJBJ8SvnvRYuFXYIqrPW8bNCrWxYggtK
 juyje+V/2AVp8QHrBA7saxQywdOyQ1cV3Kx0LjyMEufCcDgB7qiv+FuOB6UQ3ReA26CG
 bEXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768321556; x=1768926356;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y9kSWtn88k+QkPqpOG7NN6Fxk/gRH5gvJVVHZoYjlVA=;
 b=nhRn80mVwY1a+T+WJpOpQLpajjvfZY8cB5mu8SgJqyZPOfa1bDMPDp7Er5jQUE26U2
 Q6R7O0psbX9KdXP8ZQOr5kmLkWZd0n/l9wsRgF8k76cfd1xADI1Eb0YNq7Wuvkf6/dTK
 xs3qZeyQc3NdsSARphXt+mdmbfcpqgYH7V8YHSq9MSRKzLIXalQ4udQYo7guK8e92qg1
 R5sPjhK1MIpAwuYJIGzEFiBRMl1Y9yBlACAM6J2s+uLxRZK6K/TEFpuVoBl9wUI9lMv7
 DbtBhL/5kcIA2P+cIX8u338//bA3hkF//VUInr29BidLsh1aJU9wn9aBLxLGEwGbQ1gQ
 1DNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuVvFUlc+HJ+dZIKK8+mNChigPcTdwq/Vrdf+9gCLwAC695QZzW6fMCm1tfUxs/ycgkwHHAS33sXPsPURPDQ==@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yz98aohwrRZm32pIPgeDjLHVVniWcUzGvtliygcG0MN4/Dk01cm
 dtvZb2nR0LHxyqfTzOswI+0RMXsN7JRJAMFxtZPDVIdpFCw9qkLUvfzNqVjs41DIz5Q=
X-Gm-Gg: AY/fxX7t3VULVJnM6JBfBDC5QgxWIM0WrTUwKe6+1XVCQEIseWKRg76jjDt5iXXKk+5
 VqtEHMyZB5vGsNdy/uLtLFC9qNv+O3ZwURbUokG/VnNIsPcM2gbUn9WYqg4Xx+A+hUTXPEJtcWv
 4rf08P2SN2nJbtB8ihTbWQkyQHhG1AAYdMtKGO0/iFGa6eCi8UpeC+zpgUCYWsz0NXb4OE/+fJk
 mOghzRXBErL6sCQQzyfkYr05wToQMqKQEWesGMJZwbz10hLr+xs8ecSxpdJqdnem4d9rTdWuarz
 C6tmqWCtLjjCA7ONjY+dXhczbRIku7nD/Hc2MX1sb6MAcfh4Qy5GgpBlT+kOckHSIZvEMEDwxqs
 1HLKwfn4CUmLp8ATAADDvPi+MRwrWuPmQqX8oQNKUpVFfauiTcpuqp4PBR13AMtT9zbfcx53iLE
 W5V0GhLWIssMtoc3+akL6QFznK
X-Google-Smtp-Source: AGHT+IG4o2sMRbjal/wNqE1AyBhrQEhgOmuQP9i1Wb50Y85ZgDNaJvwCCbv/cl0e10bMkrsnwOfPLQ==
X-Received: by 2002:a05:600c:1e1c:b0:477:58af:a91d with SMTP id
 5b1f17b1804b1-47d84b0aa4bmr229523325e9.5.1768321556267; 
 Tue, 13 Jan 2026 08:25:56 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd0dad8bsm45637605f8f.8.2026.01.13.08.25.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 08:25:55 -0800 (PST)
Date: Tue, 13 Jan 2026 17:25:52 +0100
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Message-ID: <aWZyEHsOJFLRLRKT@pathway.suse.cz>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
 <20251227-printk-cleanup-part3-v1-1-21a291bcf197@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251227-printk-cleanup-part3-v1-1-21a291bcf197@suse.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sat 2025-12-27 09:16:08, Marcos Paulo de Souza wrote: >
 The current usage of console_is_usable() is clumsy. The parameter >
 @use_atomic
 is boolean and thus not self-explanatory. The function is > c [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.45 listed in wl.mailspike.net]
X-Headers-End: 1vfhDb-00054l-TF
Subject: Re: [Kgdb-bugreport] [PATCH 01/19] printk/nbcon: Use an enum to
 specify the required callback in console_is_usable()
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

On Sat 2025-12-27 09:16:08, Marcos Paulo de Souza wrote:
> The current usage of console_is_usable() is clumsy. The parameter
> @use_atomic is boolean and thus not self-explanatory. The function is
> called twice in situations when there are no-strict requirements.
> 
> Replace it with enum nbcon_write_cb which provides a more descriptive
> values for all 3 situations: atomic, thread or any.
> 
> Note that console_is_usable() checks only NBCON_USE_ATOMIC because
> .write_thread() callback is mandatory. But the other two values still
> make sense because they describe the intention of the caller.
> 
> --- a/include/linux/console.h
> +++ b/include/linux/console.h
> @@ -202,6 +202,19 @@ enum cons_flags {
>  	CON_NBCON_ATOMIC_UNSAFE	= BIT(9),
>  };
>  
> +/**
> + * enum nbcon_write_cb - Defines which nbcon write() callback must be used based
> + *                       on the caller context.
> + * @NBCON_USE_ATOMIC: Use con->write_atomic().
> + * @NBCON_USE_THREAD: Use con->write_thread().
> + * @NBCON_USE_ANY:    The caller does not have any strict requirements.
> + */
> +enum nbcon_write_cb {
> +	NBCON_USE_ATOMIC,
> +	NBCON_USE_THREAD,
> +	NBCON_USE_ANY,

AFAIK, this would define NBCON_USE_ATOMIC as zero. See below.

> +};
> +
>  /**
>   * struct nbcon_state - console state for nbcon consoles
>   * @atom:	Compound of the state fields for atomic operations
> @@ -622,7 +635,8 @@ extern void nbcon_kdb_release(struct nbcon_write_context *wctxt);
>   * which can also play a role in deciding if @con can be used to print
>   * records.
>   */
> -static inline bool console_is_usable(struct console *con, short flags, bool use_atomic)
> +static inline bool console_is_usable(struct console *con, short flags,
> +				     enum nbcon_write_cb nwc)
>  {
>  	if (!(flags & CON_ENABLED))
>  		return false;
> @@ -631,7 +645,7 @@ static inline bool console_is_usable(struct console *con, short flags, bool use_
>  		return false;
>  
>  	if (flags & CON_NBCON) {
> -		if (use_atomic) {
> +		if (nwc & NBCON_USE_ATOMIC) {

This will always be false because NBCON_USE_ATOMIC is zero.
I think that it was defined as "0x1" in the original proposal.

Let's keep it defined by as zero and use here:

		if (nwc == NBCON_USE_ATOMIC) {

Note that we do _not_ want to return "false" for "NBCON_USE_ANY"
when con->write_atomic does not exist.

>  			/* The write_atomic() callback is optional. */
>  			if (!con->write_atomic)
>  				return false;


Otherwise, it looks good to me.

Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
