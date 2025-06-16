Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 239D9ADB2AD
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 16 Jun 2025 15:57:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LnFfIxgmHllDRPd3yrbCtRBAOJfoY/CL16U6IkhHv9I=; b=Shy2t/vbt1HbupOJsDayB2vkKZ
	AzEM/WVByBqmX63FMdTdCjBPBYrVG79bZtLGJulp8b4R5WwEyWaRDT7Z1ogo4lZiATaqRA0v02t6d
	3TcEki2yc8YacJYxKvJWsRpsBxji59uxSAQRfOC4lOZEm601zfmPGw8V68pr4KpFBGRw=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1uRALB-0007nq-Vv
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 16 Jun 2025 13:57:37 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1uRAL3-0007nd-Rr
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 16 Jun 2025 13:57:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=E5U21iemE/c9Sz0YhEWkD1P9gtyQVcNDFZou5zB9HsA=; b=M2JCFQhM/5+NGMKPl142+VK3wl
 X4QDda1xAtOo5j8JOpZj1uja0D1ztlSXfujemLvSwXsBXl9yKdLl5Nwbl76p/Wa3wtAaiDVWKyT7E
 XxGtzP5zV7Uxtrfi7GGGFDnaMguz50h8ao0Pz3ez/abcuICfTWjm1OrY41bElN5IqIvE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=E5U21iemE/c9Sz0YhEWkD1P9gtyQVcNDFZou5zB9HsA=; b=PzYPV9R6QIozixSRUx7pwDQKkx
 jxCmuefzWwseu5BdKd9jq6ixf4voVAy4Yggiyq4kI1TJ/tQRcdiKtTIYtubu9aGEISKc0uQIQZLtK
 Qpge/040yQHSnlVLqvpey3+TLECNIP236rrrF3uhvKrgddVbbHfbIM17CAtkMOIiB7Ow=;
Received: from mail-wr1-f52.google.com ([209.85.221.52])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uRAL0-0004W5-Vu for kgdb-bugreport@lists.sourceforge.net;
 Mon, 16 Jun 2025 13:57:27 +0000
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-3a52874d593so4464659f8f.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 16 Jun 2025 06:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1750082235; x=1750687035; darn=lists.sourceforge.net; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=E5U21iemE/c9Sz0YhEWkD1P9gtyQVcNDFZou5zB9HsA=;
 b=Pcf4fsDWLu9+bDBerHu21h1cU8VGojGkogxOV0HGln0UYBM/oSSCyAhrDGr35dQ4QH
 0k5Z3WxZjOGpx1kE7TfmL8MkC5JTSVyczZ/RwXZXBHw1z4KI3eB/+tTCXN0TSRrHfPHf
 ck+WStJxa4mm9XmOVvCUblxK0fcCvvVcZlwdZMVd45SG+DOnRNx99VXOsvy2is9QeRFn
 lm4SGfKuSgeVWQSJA0hHXkvu0Mj+7E7vhCMhCvjLG0Ky7vyyW6JHK1Iqy0hLyWkzbVSe
 6KxhWBgcbf0MBIlAtCBK0ysCjSn7lj6uFClqQRcPg+eG9/Yll3gGNW8CjVbQDC0TisiY
 9BkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750082235; x=1750687035;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E5U21iemE/c9Sz0YhEWkD1P9gtyQVcNDFZou5zB9HsA=;
 b=qjFp1+GbmkbTpDkXFe6sgHwG1YqpwWzOrudTu8uA09/xqU/0dc/sztmDx01iIzQS9m
 eWrmMR3XIXCJflUC7gk53a9Fr8kJI/BQO5Hr3chkRJnIds7mnTbMlb3uDx90JQh72uR/
 kfRBTc4vosDPHl4NL4P+/GLehr8My043tMYHCSqqeNEylhGuR3jaypsit/VkcTF8iXsj
 REVn/H/gaMmn2nQVai3uitlW/CatkNQDGPrlvpGQfA9ETv+7QK+XCQCuHjsorHKW/5b5
 JtC8c5INPlKrYohRpKLasGgmmQ9YWs+Uh1Q/M4usWgIK/RbikTNBQ51A5wR/J+sZQBFt
 GMUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKovZc63WnZkxRg5xdrOIl14mZ/HfFFECVX3YRMmLFqcsT2E0MtTYdqeY11F0tbUQzEANwZbWilIAsirrAhA==@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyWwxNdx/HVVHT1i+JbwN8kA1SoukFWKDh8lr3+G91NhjG0TxXV
 HBHwTLG2Xb82ShP5a0WR0JT3kaFhsAePvJTHkjnJsUk5jglEYA13bVu7gNEM1RMyTkI=
X-Gm-Gg: ASbGnctRzpLr/6ItrcI0HTEK1sx29tZ/Ntev1hfevtUaFx0pL50gzk7Ajifr/9D7g2K
 uv39d5FKqFzYuSc7vh9SZzRSXTRNhYn/vf/F+a+NJU3BaHbMrthl/AttS2oHELR+V3fx+g6Ye51
 CG8qQIis8Hv3JM4Qkb6uBuAmGu8Nxvm9Hf+T83FnJqoKIXx9DVKCD/tW7AbFgrh8ZBCaPjK/E9c
 buCqqGhXEIZI+f+Iw8wm2jCdffKSdf8qsZfMkDVlKomLfIckYImuYe3HeTdWXoXm5/o6oHhG0Yb
 g/pSU2n291JSR47A4SZ4R7ciqeoYc/j8JXbiEZ4XCzPk6NdNeko7ITeHE7JD3WgJ
X-Google-Smtp-Source: AGHT+IG5cdNsogAjYlCwwv/Yr99wBxZ5kpKFYKtrzNVTxQPp1q35B4mAJcdg7PMSO6nM0Lz7izNcdg==
X-Received: by 2002:a05:6000:1449:b0:3a4:ed62:c7e1 with SMTP id
 ffacd0b85a97d-3a572367734mr6709880f8f.12.1750082235292; 
 Mon, 16 Jun 2025 06:57:15 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2365dea927asm61349195ad.155.2025.06.16.06.57.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jun 2025 06:57:14 -0700 (PDT)
Date: Mon, 16 Jun 2025 15:56:59 +0200
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Message-ID: <aFAiq3IEic8DuATR@pathway.suse.cz>
References: <20250606-printk-cleanup-part2-v1-0-f427c743dda0@suse.com>
 <20250606-printk-cleanup-part2-v1-6-f427c743dda0@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250606-printk-cleanup-part2-v1-6-f427c743dda0@suse.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri 2025-06-06 23:53:48, Marcos Paulo de Souza wrote: >
 All consoles found on for_each_console_srcu are registered, meaning that
 all of > them are CON_ENABLED. The code tries to find an active cons [...]
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.52 listed in wl.mailspike.net]
X-Headers-End: 1uRAL0-0004W5-Vu
Subject: Re: [Kgdb-bugreport] [PATCH 6/7] debug: kgd_io: Don't check for
 CON_ENABLED
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

On Fri 2025-06-06 23:53:48, Marcos Paulo de Souza wrote:
> All consoles found on for_each_console_srcu are registered, meaning that all of
> them are CON_ENABLED. The code tries to find an active console, so check if the
> console is not suspended instead.
> 
> Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
> ---
>  kernel/debug/kdb/kdb_io.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
> index 9b11b10b120cf07e451a7a4d92ce50f9a6c066b2..cdc1ee81d7332a9a00b967af719939f438f26cef 100644
> --- a/kernel/debug/kdb/kdb_io.c
> +++ b/kernel/debug/kdb/kdb_io.c
> @@ -589,7 +589,7 @@ static void kdb_msg_write(const char *msg, int msg_len)
>  	 */
>  	cookie = console_srcu_read_lock();
>  	for_each_console_srcu(c) {
> -		if (!(console_srcu_read_flags(c) & CON_ENABLED))
> +		if (console_srcu_read_flags(c) & CON_SUSPENDED)
>  			continue;

I think that this is similar to the 5th patch. We should check
here is_console_usable(con, console_srcu_read_flags(c), true)
because it checks more conditions:

     + the global console_suspended flag. The consoles drivers should
       not be used when it is set...

     + whether NBCON console driver has con->write_atomic

and we should also fix kdb_msg_write() to actually use
con->write_atomic() when it is a NBCON console driver.
There is hard-coded con->write() at the moment.

But it might get more complicated. It would be nice to do it correctly
and use con->write_atomit() only when nbcon_context_try_acquire()
succeeds. We probably should use a context with NBCON_PRIO_EMERGENCY.

And this should be fixed at the beginning of the patchset because
it actually fixes the support of the new NBCON console drivers.

Best Regards,
Petr

>  		if (c == dbg_io_ops->cons)
>  			continue;
> 
> -- 
> 2.49.0


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
