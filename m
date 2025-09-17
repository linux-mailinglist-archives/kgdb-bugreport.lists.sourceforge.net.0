Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 07FFEB8131C
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 17 Sep 2025 19:35:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=80jaEqrbkQuroxhOkbuuc1X1dwbYuFuT+fup00Pccr4=; b=POuiayNcFmiNBmj3fUWGPm1VyC
	AWu9SuHFzqh6Kf0tNO/81YrtpgoFWN619NyfQa0yKdlTEZhrhlrPyHz46eprKgOCXzCNvNhZ/k60q
	q0qcaqfkIBOTnvG+2DrjdeWpnZaDrzYu27378NfcieHfIVj1ORxFdMqevnzc5CdOcr04=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1uys3J-0004uZ-7j
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 17 Sep 2025 13:18:29 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1uys3H-0004uR-D8
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 17 Sep 2025 13:18:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Zloa2homgRV657c0j4xRp8GX48u4v3lknY23Klde2kM=; b=LxTFyQdx/U5vS8dCESB72z5OkZ
 ygY14ooPbMi+RN1OUjvOVs9i4XIUjeWeyVH7DUoYHO1Z+IpRwg570TtbDaGch6FvQ0NqrYvPlR+9a
 q7cWgK/nfB+vDFG0C4M5tfyNWz2iJEvfhVvodcZgIhnaQ3whPoTOL2Omu4edm1Q4tUQQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Zloa2homgRV657c0j4xRp8GX48u4v3lknY23Klde2kM=; b=bn8wRZ9hZTK0AFzmtNRPGfsg6/
 llIK20OE1PLI41CBvEMkP1M9IIBn6YY7KJ9WkFP4+KrMZPD5o9G9FbZHWA0IkwGV4YXBFbIPMs/YA
 nwO7JXF86uLk0A/Hn6KQIQQ1D1FAFgOKwg5xjpkWpf7FqVEHNj02kO7YknaVjsf+5YTM=;
Received: from mail-ed1-f43.google.com ([209.85.208.43])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uys3G-00066U-VY for kgdb-bugreport@lists.sourceforge.net;
 Wed, 17 Sep 2025 13:18:27 +0000
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-62ee43b5e5bso9400023a12.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 17 Sep 2025 06:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1758115100; x=1758719900; darn=lists.sourceforge.net; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Zloa2homgRV657c0j4xRp8GX48u4v3lknY23Klde2kM=;
 b=YNuuLbyjz6ixKk3SnrtDeW51tnLHug3cDyUNQPL/I0XBuVXD7rhh+WURlOz9FsUMMz
 RiQvl2xl3mnVxOSNZy9b/sLAGWbKk7XehgeY7r3zoapBI8HIkipQ9updAS+lWEfTIl3Z
 uWKGqkc6RS8Vvouhb+R+Ha6L3WMy55wNVM7GVC6rLEYyzmpUweMgtFPEQvLphbxAXJo8
 zBcOQ5H6peSGy/1c3ri2KQF6ApT2oDakdzQN0FkAF2n+oyTbvvDRccd4O+Wugy/GBdES
 pBrt6Dc7AvrsZEA4bNaw7OcxFkRT7mN2kPR66TMV0+Oy23k0z0Y8uRwrAPn47wDqrCS4
 fQWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758115100; x=1758719900;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Zloa2homgRV657c0j4xRp8GX48u4v3lknY23Klde2kM=;
 b=MvDmag65dtb+qbtIDlyFeE1JLzbaowMI4gwP6+HTRtoWOUDBT3V+L0nzZonN5JTSPB
 WomlAhXx/W31pMTjHsi6wctnZYC7YK+5QPGu/aghpiuL6P3DBDlbdBuq08SEhejWlVon
 mQ2yOlSWJR+R++6fFo8iuXOMuA9zNWHJTnUwARrAoAHjQ4X+7zGwv694ODLZNpm4DJbk
 I9SHDuHhWJ1Ig7ExTQ/+2aTy+8PVceamjRFAIet+nvw8jXQjQhFTtqWd9TG649I51ZZY
 pe1Q1yjzoTrJWuDxk/HNolOMxJM4GZpevGjX2Td0gBBis3VCgJvZ49nbR+DOqqPFvvvK
 ta3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkihl6xv+lqZnAWHTIV92dNtxIlf0m1TFWHpx6uj+RVbIdThEz9d+8W43rGoNkk4aKYGrazHsaB/+eBXmYvA==@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yx7SCNXD/Zs6ScgC0BcilflrSwxfAxwB4kqevTfx4GrPPA73DGz
 O8D10KxJOy287ilqfHrZB9pR8OJoieuIvBKYzvqyRUBBBSzLQ9qkrrWGKx1DKfYLoKY=
X-Gm-Gg: ASbGncvHhlXku+cTDPUX1t0HNMVZYQDQtAwbEW/SVV6m2KNrnGMtH48w7wUzPdBRUG3
 1wuP9JXVKBDF+qjYY1ogiaupHZnRy4hjxL3lKeTc9rt2ULe1npwKrj4e4Dy/UzCWBxqPCsPrU6v
 WzcCYZHDp6OCtvoY78Y+NA7ggTQatSAYBf5VfvI3dr7AEVI6cqidD17ecAj+eTOEsO5nfN/DFfQ
 tKErAiQwC+I2Vs2e2Ir2fn+5oC94kXrD5GC5wOsuBAkzHiuP4KbPPstM+44BR+wk+CKbOAyxbV3
 oZYzBCsEJrWCRghvKfLu+eRFk4E5N4b/81uzZZPCzp/yV6jslQnZuo8JAwp3IM1YmMaMb0JCpq9
 TQRWln6jENXjCFj1E1N4tggPiMQ==
X-Google-Smtp-Source: AGHT+IHF1X14bCj5/Sms8/MnGd40XMtcc6YIyaDEEhL+NqAfUXiukJj85FQd9PZ56yWVzc0VEDZBmQ==
X-Received: by 2002:a05:6402:42ce:b0:62f:345e:45df with SMTP id
 4fb4d7f45d1cf-62f84213d35mr2450752a12.1.1758115099588; 
 Wed, 17 Sep 2025 06:18:19 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-62f5c248742sm4269138a12.8.2025.09.17.06.18.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Sep 2025 06:18:19 -0700 (PDT)
Date: Wed, 17 Sep 2025 15:18:17 +0200
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Message-ID: <aMq1GRHwo6xnsPBG@pathway.suse.cz>
References: <20250915-nbcon-kgdboc-v4-0-e2b6753bb566@suse.com>
 <20250915-nbcon-kgdboc-v4-5-e2b6753bb566@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250915-nbcon-kgdboc-v4-5-e2b6753bb566@suse.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon 2025-09-15 08:20:34, Marcos Paulo de Souza wrote: >
 Function kdb_msg_write was calling con->write for any found console, > but
 it won't work on NBCON consoles. In this case we should acquire th [...] 
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
 [209.85.208.43 listed in wl.mailspike.net]
X-Headers-End: 1uys3G-00066U-VY
Subject: Re: [Kgdb-bugreport] [PATCH v4 5/5] kdb: Adapt kdb_msg_write to
 work with NBCON consoles
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

On Mon 2025-09-15 08:20:34, Marcos Paulo de Souza wrote:
> Function kdb_msg_write was calling con->write for any found console,
> but it won't work on NBCON consoles. In this case we should acquire the
> ownership of the console using NBCON_PRIO_EMERGENCY, since printing
> kdb messages should only be interrupted by a panic.
> 
> At this point, the console is required to use the atomic callback. The
> console is skipped if the write_atomic callback is not set or if the
> context could not be acquired. The validation of NBCON is done by the
> console_is_usable helper. The context is released right after
> write_atomic finishes.
> 
> The oops_in_progress handling is only needed in the legacy consoles,
> so it was moved around the con->write callback.
> 
> Suggested-by: Petr Mladek <pmladek@suse.com>
> Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>

It looks good to me:

Reviewed-by: Petr Mladek <pmladek@suse.com>

See one note below.

> --- a/kernel/debug/kdb/kdb_io.c
> +++ b/kernel/debug/kdb/kdb_io.c
> @@ -589,24 +589,41 @@ static void kdb_msg_write(const char *msg, int msg_len)
>  	 */
>  	cookie = console_srcu_read_lock();
>  	for_each_console_srcu(c) {
> -		if (!(console_srcu_read_flags(c) & CON_ENABLED))
> +		short flags = console_srcu_read_flags(c);
> +
> +		if (!console_is_usable(c, flags, true))
>  			continue;
>  		if (c == dbg_io_ops->cons)
>  			continue;
> -		if (!c->write)
> -			continue;
> -		/*
> -		 * Set oops_in_progress to encourage the console drivers to
> -		 * disregard their internal spin locks: in the current calling
> -		 * context the risk of deadlock is a bigger problem than risks
> -		 * due to re-entering the console driver. We operate directly on
> -		 * oops_in_progress rather than using bust_spinlocks() because
> -		 * the calls bust_spinlocks() makes on exit are not appropriate
> -		 * for this calling context.
> -		 */
> -		++oops_in_progress;
> -		c->write(c, msg, msg_len);
> -		--oops_in_progress;
> +
> +		if (flags & CON_NBCON) {
> +			struct nbcon_write_context wctxt = { };
> +
> +			/*
> +			 * Do not continue if the console is NBCON and the context
> +			 * can't be acquired.
> +			 */
> +			if (!nbcon_kdb_try_acquire(c, &wctxt))
> +				continue;
> +
> +			nbcon_write_context_set_buf(&wctxt, (char *)msg, msg_len);

I have overlooked the (char *) cast in the earlier versions of the
patchset. It would be nice to fix the nbcon API so that the parameter
could be passed as (const char *). It looks that the API using
struct nbcon_write_context never modifies the given buffer so
it would be the right thing.

But it is beyond the scope of this patchset. It would be material
for a separate code clean up ;-)

Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
