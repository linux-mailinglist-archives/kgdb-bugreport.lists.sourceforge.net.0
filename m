Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8B05E9DBA
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 26 Sep 2022 11:34:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1ockV8-0006H6-Hc
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 26 Sep 2022 09:34:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <atomlin@redhat.com>) id 1ockUm-0006GZ-Tm
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 26 Sep 2022 09:33:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=H9yo7nQ7X6csLZdzPbIjxBnehSyTfz7orjW0yNtRxTE=; b=WlIwDormwNV8NY4TGbdnN7QnaD
 j9U2kho6kzFuH7BFeDhxJBgvw96RYN7wYNQY8F3sNn52HXk4/vJ5ntVU1JEqwtbNzAciSkshC0xN8
 uzji+YxFynaPsMK6g8uqR20MozxdaVGAcuEWAUuR5/q21phy1I+PVdnAcJ6v6W76uy/o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=H9yo7nQ7X6csLZdzPbIjxBnehSyTfz7orjW0yNtRxTE=; b=EcnBskbSs47OwAUC8Irf0hdFjy
 WGujL/47sgMPrFgu40v66hnWsykJNMCXj8gMescWpCApFIfattCJiZrHxfNhWxS6o2xyZCG6rhtra
 uH4CvkjndgZSsBM9BEomI3/1GbkFGTm+tvCz+ttpcQzK2ACAA56JXn7Lk0kzA0XU7Kvg=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ockUk-003F6Q-Dh for kgdb-bugreport@lists.sourceforge.net;
 Mon, 26 Sep 2022 09:33:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664184820;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=H9yo7nQ7X6csLZdzPbIjxBnehSyTfz7orjW0yNtRxTE=;
 b=bKhWn1gWvhj7Bh7ttKpKwKlqOFN66DmQSbPvWvu0bsF545aV78flz5bDrHJDoi4BXwo8uP
 ec27cMPuwWRK22Kdt+zjkofKZCGrPNVaDRdx7Akwcf9R/Gj2G3OaAME7WbZxbf8dCQRhOE
 92QbhWn/feB3srhZJwuLNkKdaH3cnTg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-131-Mv2HFWEIPOqwQrYTqmglUg-1; Mon, 26 Sep 2022 05:33:39 -0400
X-MC-Unique: Mv2HFWEIPOqwQrYTqmglUg-1
Received: by mail-wr1-f72.google.com with SMTP id
 v22-20020adf8b56000000b0022af189148bso975997wra.22
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 26 Sep 2022 02:33:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=H9yo7nQ7X6csLZdzPbIjxBnehSyTfz7orjW0yNtRxTE=;
 b=VTJtIxcSypnUeBsNe3RGxAK71ju+/FRY08hRDLjqrjdIMI4DU1SnjHs00xfoqd4U7S
 UWmawAMUpRFPeyIQ7VL8XSm/PIdc40T1o5nCM4nafiYBRgXYG3Vn4yVBppNf4E5Mcq2J
 EuHIFQlGHQESOh6lLkJLCXvfHxCyTcqS5vsgng2yg+ReAoaGAfzYx20WqDwuK0PAqm+Y
 2ZFd1obLbTCk9nkulP3GyjisTb/gg2U0y42Atto2ApQDbz85+rdaL05Y3elcogNq5qrj
 D4DWRiybgpi5zUhkuotArU82bOxLjaeBBLZOe+64tWyGPI9qmLBbFw6Y6rQ88+2c3tpM
 s2Uw==
X-Gm-Message-State: ACrzQf0Kuk1DFxnWUby7ibg4vN0G+BHJWO2kL4x0ZeDzVaWAS2M0lS9A
 l6i+37x91PupfXH3vE1EQSOMqItL41ygK+93Bc+hjluSR4L7iszVglsGZGzI0nDoDq2EuUZyziu
 HGRHhko90ViskRz3ZdxHgfvAKNyAunMXfkw==
X-Received: by 2002:a05:600c:114f:b0:3b4:9a0a:6204 with SMTP id
 z15-20020a05600c114f00b003b49a0a6204mr14264171wmz.132.1664184818141; 
 Mon, 26 Sep 2022 02:33:38 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4pQqUHviODc3cofcz3alTrEOSQs7Ng28XfxFeTiv0/6sR/oQsIefxECuC6NG0anOiJGp5dpQ==
X-Received: by 2002:a05:600c:114f:b0:3b4:9a0a:6204 with SMTP id
 z15-20020a05600c114f00b003b49a0a6204mr14264155wmz.132.1664184817894; 
 Mon, 26 Sep 2022 02:33:37 -0700 (PDT)
Received: from localhost (cpc111743-lutn13-2-0-cust979.9-3.cable.virginm.net.
 [82.17.115.212]) by smtp.gmail.com with ESMTPSA id
 n32-20020a05600c502000b003a531c7aa66sm10720950wmr.1.2022.09.26.02.33.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Sep 2022 02:33:36 -0700 (PDT)
Date: Mon, 26 Sep 2022 10:33:35 +0100
From: Aaron Tomlin <atomlin@redhat.com>
To: John Ogness <john.ogness@linutronix.de>
Message-ID: <20220926093335.exvrpwp5khlwqxhp@ava.usersys.com>
X-PGP-Key: http://pgp.mit.edu/pks/lookup?search=atomlin%40redhat.com
X-PGP-Fingerprint: 7906 84EB FA8A 9638 8D1E  6E9B E2DE 9658 19CC 77D6
References: <20220924000454.3319186-1-john.ogness@linutronix.de>
 <20220924000454.3319186-11-john.ogness@linutronix.de>
MIME-Version: 1.0
In-Reply-To: <20220924000454.3319186-11-john.ogness@linutronix.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -1.6 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sat 2022-09-24 02:10 +0206, John Ogness wrote: > From:
 Thomas Gleixner <tglx@linutronix.de> > > Provide a special list iterator macro
 for KGDB to allow unprotected list > walks and add a few commen [...] 
 Content analysis details:   (-1.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
 low trust [170.10.129.124 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ockUk-003F6Q-Dh
Subject: Re: [Kgdb-bugreport] [PATCH printk 10/18] kgbd: Pretend that
 console list walk is safe
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
Cc: Petr Mladek <pmladek@suse.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Luis Chamberlain <mcgrof@kernel.org>, linux-serial@vger.kernel.org,
 Jason Wessel <jason.wessel@windriver.com>,
 kgdb-bugreport@lists.sourceforge.net, Thomas Gleixner <tglx@linutronix.de>,
 Jiri Slaby <jirislaby@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Sat 2022-09-24 02:10 +0206, John Ogness wrote:
> From: Thomas Gleixner <tglx@linutronix.de>
> 
> Provide a special list iterator macro for KGDB to allow unprotected list
> walks and add a few comments to explain the hope based approach.
> 
> Preperatory change for changing the console list to hlist and adding
> lockdep asserts to regular list walks.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: John Ogness <john.ogness@linutronix.de>
> Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> ---
>  drivers/tty/serial/kgdboc.c |  5 ++++-
>  include/linux/console.h     | 10 ++++++++++
>  kernel/debug/kdb/kdb_io.c   |  7 ++++++-
>  3 files changed, 20 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/tty/serial/kgdboc.c b/drivers/tty/serial/kgdboc.c
> index af2aa76bae15..57a5fd27dffe 100644
> --- a/drivers/tty/serial/kgdboc.c
> +++ b/drivers/tty/serial/kgdboc.c
> @@ -462,10 +462,13 @@ static void kgdboc_earlycon_pre_exp_handler(void)
>  	 * we have no other choice so we keep using it.  Since not all
>  	 * serial drivers might be OK with this, print a warning once per
>  	 * boot if we detect this case.
> +	 *
> +	 * Pretend that walking the console list is safe...
>  	 */
> -	for_each_console(con)
> +	for_each_console_kgdb(con) {
>  		if (con == kgdboc_earlycon_io_ops.cons)
>  			return;
> +	}
>  
>  	already_warned = true;
>  	pr_warn("kgdboc_earlycon is still using bootconsole\n");
> diff --git a/include/linux/console.h b/include/linux/console.h
> index 24344f9b0bc1..86a6125512b9 100644
> --- a/include/linux/console.h
> +++ b/include/linux/console.h
> @@ -187,6 +187,16 @@ extern void console_list_unlock(void) __releases(console_mutex);
>  #define for_each_console(con)						\
>  	for (con = console_drivers; con != NULL; con = con->next)
>  
> +/**
> + * for_each_console_kgdb() - Iterator over registered consoles for KGDB
> + * @con:	struct console pointer used as loop cursor
> + *
> + * Has no serialization requirements and KGDB pretends that this is safe.
> + * Don't use outside of the KGDB fairy tale land!
> + */
> +#define for_each_console_kgdb(con)					\
> +	for (con = console_drivers; con != NULL; con = con->next)
> +
>  extern int console_set_on_cmdline;
>  extern struct console *early_console;
>  
> diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
> index 67d3c48a1522..fb3775e61a3b 100644
> --- a/kernel/debug/kdb/kdb_io.c
> +++ b/kernel/debug/kdb/kdb_io.c
> @@ -558,7 +558,12 @@ static void kdb_msg_write(const char *msg, int msg_len)
>  		cp++;
>  	}
>  
> -	for_each_console(c) {
> +	/*
> +	 * This is a completely unprotected list walk designed by the
> +	 * wishful thinking department. See the oops_in_progress comment
> +	 * below - especially the encourage section...
> +	 */
> +	for_each_console_kgdb(c) {
>  		if (!(c->flags & CON_ENABLED))
>  			continue;
>  		if (c == dbg_io_ops->cons)
> -- 
> 2.30.2
> 

Reviewed-by: Aaron Tomlin <atomlin@redhat.com>

-- 
Aaron Tomlin



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
