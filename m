Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B9514ADB208
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 16 Jun 2025 15:33:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oWCEvtnuAJoefW8uwuy3lp2SR99RWtXxVYJsyYcAhkA=; b=bV1UFQ5um6Vclpb0FQ/AAnCXFG
	pdSCqH6U9UkQPl70VPkibmutpdaNWrhnXlX1YHSg7EN8p6ZJvL8WdXYwQ3RCZ2A21gRyQXec61akw
	XUE0ZR+QK4nIJNaG0Q/nP9iCojMf5qQWTYrgVSsR35kExAQRH5EpJOAwb0ihZdwiHxpc=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1uR9y4-0006ZE-KK
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 16 Jun 2025 13:33:44 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1uR9y3-0006Z6-45
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 16 Jun 2025 13:33:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mDsjdTiosngDCcbjk569uHEPxRmT2Rin/eFUrpVF9Nc=; b=PIq5yTKmaKDYj3PzN705f50KAs
 47GmPpwvSqVEyAvEtdB8rPdw+6g1b9zyEk4Atvn2Ti9VRmfqTj4CIyhwUqPCGzoK0ziABZzi7hgwi
 ojPzHzHBOvL23FBCCX/XZskO1UJBrP1hWoL+bs11ZpiiocLdVfGjbGT/iMaY1RVOd5bY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mDsjdTiosngDCcbjk569uHEPxRmT2Rin/eFUrpVF9Nc=; b=HHxhj1ZspmpG+/hXedMY1mvtZ9
 Ym47bjXxB7UbariqxQykDyhnugqNP3rURN6SITP/voSwkaPu2/Ei+7Gyab5AfWSTUTNd5r9/RWGBV
 ggQEK62nSLMt4Spg9ggGW7A08zi9DcQ11t4/dQGxcrfb1Jnml+YBaFdOkY8RC6W1jqyA=;
Received: from mail-wr1-f45.google.com ([209.85.221.45])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uR9y2-0002sM-MA for kgdb-bugreport@lists.sourceforge.net;
 Mon, 16 Jun 2025 13:33:43 +0000
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-3a528243636so2600463f8f.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 16 Jun 2025 06:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1750080810; x=1750685610; darn=lists.sourceforge.net; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=mDsjdTiosngDCcbjk569uHEPxRmT2Rin/eFUrpVF9Nc=;
 b=P9csvPg1q0CTUyi7eBZYKUK2R7A3WHeh+uQTvji+YTrG0OPSRxh7Paw3qdEdDOROQv
 FsxWroD99gE1FD2LOmlt/K0JLO10rmFzvjWW6KA7Y3enlVi05tEFHTKWFuEValH/LJNX
 Ci1jpqpwKzP2Ah2QMkYMG93kTZQiYka3lzafkUY1bNud3ZN1xbElAhOzOPS9fYIqARNL
 GRLsBUz4uS3yhdT5XbGEF38O8itYCCl+cBH+amnwaaDvFG6l3Io1TququUYW7RUy98LD
 ZmLdcHGkvdhdFlU9ZJHMp5Yl/EAQQE1dc6wQniT9HIXBgfQg4EKTQNCwt+1AzvHETLnc
 PNEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750080810; x=1750685610;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mDsjdTiosngDCcbjk569uHEPxRmT2Rin/eFUrpVF9Nc=;
 b=VrBnCnZ5eQTAQXyTc+8S5xvkLlgOfSQ6URVPbrq/15YZKTC9pxnCNOVRtuZ/CFd1PE
 BYSOEO/y/B4K+ZaZlA3eccP6NQQba9xJUtOsl77dv0CMcFnzS3mDiC7vO19TyDVhgj4H
 4kydD+3c8pTYmJhDoByR3yR5HW167IeYMrOdkkfyfRdw2tvckClRbKLd4G5I10dr4ejU
 gl0g/LUWgwnzRCr2F7afO2NB2rPKnHL/GxkT/FIjZakB3r1qZ3tpcz2AKjjk5aVu8j94
 juIxx4dD90OAzitsK9206PaImyGm6DlbjEIVIbdxTLKtfs6DKwYiR8vE5lYTmpe7Sczx
 QmHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4FSUytHOKXvI6RtZBFNc2URtQk2ccJdVIkK048yz32iFAggavfnUFb3fKiYm1CrgblmGMSPlLTeWzk8EQgQ==@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxJVD9OTyCHeT+/PbTIAmZgwY7xQj8VumoBxjxoHVBWHwh09skZ
 fOuoCMVKaJ7N/iKmV7MfuIsplaQGZbcyIsejdc3TdQYoJLjoBCH4nFDT6ExPINie878=
X-Gm-Gg: ASbGncur6mRK+DEJ9O5sO/Y5cpVBfAEm55Jd6BaGUwvNdbUj73K/kHNmbMa6UV/5Z87
 8yAn5ifr4HydJKM1hYsjRkL6UlT5skHh1NNtZ3O15ND1knobfVqV2J9ibMZDSkO9Z9HijsOAULT
 K0JwdSFyL0P36SPjuZg1VaCwB0WTvBtq78fUYo6T2zSqmhHTlrOsYjiqa1xkqD7sNtODD4pU4yc
 dZLhpUQ2OCJVc53Kou5NaHxMsalEHs4r0f2Yf+k5pDJyJp8VPuNYQgxjSz+5cpI0Bj+ApDxosQx
 UV5cE+8ZzW6zuiI+G8q1MKfMoWbsZjl75Y9pL5v4r3vTYGpy0cOmI+Bzo4d+CPV8
X-Google-Smtp-Source: AGHT+IHsMKMEFnK4iRSKN4yA2G25+VoXuC33JoKTL84hU+3purxVVSbR+gePOjO6tpOk2JJiHzT3Fg==
X-Received: by 2002:a5d:5887:0:b0:3a5:2dae:970c with SMTP id
 ffacd0b85a97d-3a572e82154mr7975991f8f.37.1750080810126; 
 Mon, 16 Jun 2025 06:33:30 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2365de77605sm60637745ad.105.2025.06.16.06.33.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jun 2025 06:33:29 -0700 (PDT)
Date: Mon, 16 Jun 2025 15:33:13 +0200
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Message-ID: <aFAdGas9yGB4zhqc@pathway.suse.cz>
References: <20250606-printk-cleanup-part2-v1-0-f427c743dda0@suse.com>
 <20250606-printk-cleanup-part2-v1-5-f427c743dda0@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250606-printk-cleanup-part2-v1-5-f427c743dda0@suse.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri 2025-06-06 23:53:47, Marcos Paulo de Souza wrote: >
 All consoles found on for_each_console are registered, meaning that all of
 > them are CON_ENABLED. The code tries to find an active console, [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.45 listed in wl.mailspike.net]
X-Headers-End: 1uR9y2-0002sM-MA
Subject: Re: [Kgdb-bugreport] [PATCH 5/7] arch: um: kmsg_dump: Don't check
 for CON_ENABLED
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
Cc: Richard Weinberger <richard@nod.at>,
 John Ogness <john.ogness@linutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-um@lists.infradead.org,
 Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Daniel Thompson <danielt@kernel.org>, linux-serial@vger.kernel.org,
 Jason Wessel <jason.wessel@windriver.com>,
 kgdb-bugreport@lists.sourceforge.net,
 Johannes Berg <johannes@sipsolutions.net>, Jiri Slaby <jirislaby@kernel.org>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Fri 2025-06-06 23:53:47, Marcos Paulo de Souza wrote:
> All consoles found on for_each_console are registered, meaning that all of
> them are CON_ENABLED. The code tries to find an active console, so check if the
> console is not suspended instead.
> 
> Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
> ---
>  arch/um/kernel/kmsg_dump.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/um/kernel/kmsg_dump.c b/arch/um/kernel/kmsg_dump.c
> index 4190211752726593dd2847f66efd9d3a61cea982..f3025b2a813453f479d720618c630bee135d4e08 100644
> --- a/arch/um/kernel/kmsg_dump.c
> +++ b/arch/um/kernel/kmsg_dump.c
> @@ -31,7 +31,7 @@ static void kmsg_dumper_stdout(struct kmsg_dumper *dumper,
>  		 * expected to output the crash information.
>  		 */
>  		if (strcmp(con->name, "ttynull") != 0 &&
> -		    (console_srcu_read_flags(con) & CON_ENABLED)) {
> +		    (console_srcu_read_flags(con) & CON_SUSPENDED) == 0) {
>  			break;

I think that we should actually replace the check of the
CON_ENABLE/CON_SUSPENDED flag with

		is_console_usable(con, console_srcu_read_flags(con), true)

And it should be done at the beginning of the patchset before
changing the semantic of the flags.

Motivation:

There is the following comment at the beginning of the function:

	/*
	 * If no consoles are available to output crash information, dump
	 * the kmsg buffer to stdout.
	 */

The if-condition checks for:

  + "ttynull" because this special console does not show any messages
    by definition

  + disabled/suspended consoles; note that this patchset is replacing
    CON_ENABLED with CON_SUSPENDED flag because it the state is
    changed during suspend.

But it should check also for:

  + whether the console is NBCON_console and does not have con->write_atomic
    because such a console would not be able to show the messages
    in panic().

And it should also check the global "consoles_suspended" flag. Because
consoles won't show anything when it is set.

And all these is already done by "is_console_usable()" except for
the check of "ttynull" which is very special.

How does the sound, please?

Best Regards,
Petr

>  		}
>  	}
> 
> -- 
> 2.49.0


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
