Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 934D9ADB2DE
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 16 Jun 2025 16:03:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cx6LrkYUJ9Eup5RN9V6hHHy3jdO+s1GcpjTfpRr0+54=; b=dkkpMrZOKQ/lkusODXcXK2aw0j
	ixc9YEJpE83V9toqcNx7SjszdeT0xpWvwZ1PehcCSXp9vUFh1Zd2ec4ULzSv32IlcQAh8r9E3qI1r
	cfxJRRGVkNt64G2Rxq2UOzI9bWbUlCVGE8vWTLLmJAVHzb15EgOsv+cGHLFlXKbcAMf4=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1uRAQZ-0007Gz-Ek
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 16 Jun 2025 14:03:11 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1uRAQY-0007Gr-AT
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 16 Jun 2025 14:03:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NezTSsyMagu8zLGwg6DhObhL/nAKADWh56tKSWG5+zE=; b=klZ0sHfvHli4CCF6kdn6VDCsWy
 ZVNdcLyc13vcvvyGZdY9nmnznX+tJLe5qgv8DEK9zFhN3xMcfFD09xXM7HM828xHxTKwd99QffipR
 7SO1uZUkBr7oFb+0AQYYqUgVLaf7ji5xXVct3DSRt7ZO1g2432T1LAWHgM0kkWhTKnhU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NezTSsyMagu8zLGwg6DhObhL/nAKADWh56tKSWG5+zE=; b=Suzf2HsHcfZRhYcJXZL8zGkEAD
 nTAEsG6tNCFsau8jALoeYSqAPsVXiTFvr+pBQLF7bZ3/M7Mzyhc6iZpMKhBYGeHS0YeRDfMFPzTzA
 5GIvtZsBjUmrIe1iMHvKMl2oRbkKW/PL6sDFSPIJjwdpdlWBoQyFpSWFyG0F0Nql16fc=;
Received: from mail-ej1-f52.google.com ([209.85.218.52])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uRAQX-00057S-Rf for kgdb-bugreport@lists.sourceforge.net;
 Mon, 16 Jun 2025 14:03:10 +0000
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-ade58ef47c0so948854666b.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 16 Jun 2025 07:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1750082578; x=1750687378; darn=lists.sourceforge.net; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=NezTSsyMagu8zLGwg6DhObhL/nAKADWh56tKSWG5+zE=;
 b=JU7IyJj9jKkkga0Uq1Mya0IjHmhrMDf8wFp/GMokxL+HYpWdRS+7zanU2ybLPSwtcL
 vKQ1rZeC1Gn1R+yT0Uno8kX3BdUvh3vUwoEDxCkrB8c57Ca51GPnvEXQyCHC8+nIn022
 TeID2Mv+dq1mvKPiC4V8XH0JrQhMD4v904oLwQoybGSjypGMYr3XABJqekf0FLD3fmTz
 eGqWt233T1ojcDgN8E/fcKzbLSmBhJB3hf0weoWpHBAH1k42hnYQVUgyHAS6xpgKZaga
 7YraJB9nJ43jm/07VVSWEIitdi4f8SN5rNEQW8y4YN1G6vYluhWXgVeEWjv+ZQVFqZMj
 7Lcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750082578; x=1750687378;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NezTSsyMagu8zLGwg6DhObhL/nAKADWh56tKSWG5+zE=;
 b=vbTEvGmSUyejPo1QUlm7xnhr3I/9Wzxgy+olg1y4eBWgI4CXe2Lp8q0v9Fe97C7gq2
 q16ODcUX1sfVNBl7cV616KzG9ndnNg5eQZahd8UprWTFWp9wD12Dtgij1KLlrNclKY2X
 u2IVJkAgbaEHXce3Uz0PaP5WhCAAE2R7XLcoI+zOQeRic9EjWT3/tNJLtDM8IYKqlH/0
 nlsyL7DYKaU5MaY1xY3LhpYKaqQBGBBY6OGNxamc2I7qOQP0hVYJV5NxCRR+IJ2guSni
 P3DoHMQD8eSZO4e3R8fV6YH4ZNdPgY0XRc4RZB8C59hSKGkSYOZbY98TffF86qTIZ3ma
 YVgQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdI6Y2FAMjSzra6+NuZByUnUqabAwP4EtcFm9JfLqD/l1+VlXneYBZBlZWvK61Wo9umEBPtAe53BKekg9tug==@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwImLxi17FymempzwtHoP5inexpehs4YNXIi9P7doTwNtd63Imh
 kkAGaDuuSF2mXB35ODthCCyMrNREs5/DKsVEE1SlmurajpPk6xfC1bIK6qWOw2BqQRc=
X-Gm-Gg: ASbGncsfgzpXBdbUTaJE2VKhLvJc+XEkPZkmcjrvG9yc/ah0WpwMyuZ8MDGmeRBSxkG
 Ct9ZfsHofNRPkMXxT0AX06E+W22M5bxqMWcFza5dmtdzJKhR5wXJPFoWxQOnEfZWUHKl+sZqWZ/
 qlOMLLZFH4hNvu03wRWQ0w0SJvPRuATWwXapKN5qWDSBmbjJBsLD72r+fow0zh+nSPYn1MMhSVx
 BbhBLm0sCx8EAP14xUsohv2uqEZ+dTmfr8SnSy0XhDZf8hB/Lf0NXPh5f3rCrqlcQguOCxZhAIL
 8bUmYXSaUvLbKbrlgEA4FRlPT84NvWfwV5j9ar5uV0Sa+/i1ViqZKbck7FYEF3V2
X-Google-Smtp-Source: AGHT+IGQKt/OCARGss+vM72Zy1ByQz9dfh+HKXz/EINJ++KGru6AYFAdN86jIyZYD5v+8Ya81pTKAg==
X-Received: by 2002:a17:907:3f97:b0:ade:3a1b:88b2 with SMTP id
 a640c23a62f3a-adf4fa9117fmr1057658266b.29.1750082577978; 
 Mon, 16 Jun 2025 07:02:57 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-adec81b8e38sm674489766b.50.2025.06.16.07.02.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jun 2025 07:02:57 -0700 (PDT)
Date: Mon, 16 Jun 2025 16:02:55 +0200
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Message-ID: <aFAkD2i0ceH6qYQz@pathway.suse.cz>
References: <20250606-printk-cleanup-part2-v1-0-f427c743dda0@suse.com>
 <20250606-printk-cleanup-part2-v1-7-f427c743dda0@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250606-printk-cleanup-part2-v1-7-f427c743dda0@suse.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri 2025-06-06 23:53:49, Marcos Paulo de Souza wrote: >
 All consoles found on for_each_console_srcu are registered, meaning that
 all of > them are already CON_ENABLEDed. > > Signed-off-by: Marcos P [...]
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
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.218.52 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uRAQX-00057S-Rf
Subject: Re: [Kgdb-bugreport] [PATCH 7/7] printk: Don't check for
 CON_ENABLED on console_unblank
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

On Fri 2025-06-06 23:53:49, Marcos Paulo de Souza wrote:
> All consoles found on for_each_console_srcu are registered, meaning that all of
> them are already CON_ENABLEDed.
> 
> Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
> ---
>  kernel/printk/printk.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
> index 658acf92aa3d2a3d1e294b7e17e5ee96d8169afe..8074a0f73691cfc5f637361048097ace1545c7c0 100644
> --- a/kernel/printk/printk.c
> +++ b/kernel/printk/printk.c
> @@ -3360,7 +3360,7 @@ void console_unblank(void)
>  		if (flags & CON_SUSPENDED)
>  			continue;
>  
> -		if ((flags & CON_ENABLED) && c->unblank) {
> +		if (c->unblank) {

It might actually make sense to check is_console_usable() here.
The reason is similar as for the 5th and 6th patch, see
https://lore.kernel.org/r/aFAdGas9yGB4zhqc@pathway.suse.cz
https://lore.kernel.org/r/aFAiq3IEic8DuATR@pathway.suse.cz


>  			found_unblank = true;
>  			break;
>  		}
> @@ -3402,7 +3402,7 @@ void console_unblank(void)
>  		if (flags & CON_SUSPENDED)
>  			continue;
>  
> -		if ((flags & CON_ENABLED) && c->unblank)
> +		if (c->unblank)
>  			c->unblank();

Same here.

>  	}
>  	console_srcu_read_unlock(cookie);
> 
> -- 
> 2.49.0


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
