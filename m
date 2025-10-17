Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F2584BE8035
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 17 Oct 2025 12:17:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6aGThh5YV0rovbYalkSDDMfIk6GjsG5onJPzgxDYigc=; b=bjppGvM3wXUGEAjIvMzOt60Tqm
	GspGoTj+IoL1O/cihDSOBBDi4OKWq49cgo4dg8yejz7ImeroBT5Sagy697fgDFV8GfJlCdlvOoXkU
	x3Eg30wRXRmV1G+Jfxzarrjg3jBNkC9cMfmkgTp3f8wqwqg0Fpi2sgBubw7J6YmQgE4U=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1v9hW8-0000gp-8x
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 17 Oct 2025 10:17:00 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1v9hW6-0000gi-OK
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 17 Oct 2025 10:16:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=viS3DvrDA7N5filScWTdQ7ckK4IythNKZ1IY1FtODKE=; b=De5ze1I6b+hFm+sCYU7pfkFGTH
 3V63Y2G75jfOcNFuLA0aPq9EYGmC5jGtXdN4b4cxW5m8/JMPnRRDSfIs9CKJzyU49kN7NrjrRnyd6
 QooUzFSqGENkgVZ2zq+9bd5DunqMvV5tFPmXK56vHePqVh3wAKZJcclnsO7z2H9O8/5c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=viS3DvrDA7N5filScWTdQ7ckK4IythNKZ1IY1FtODKE=; b=VChdC5byNoLa5kdlWj+DfzYHWw
 x5RY0EOYulPNj2HJ3a3scB7xliWk8fHYBVQ6iO2AT4+Oy80ecIgc+xjKfgd1ckxi7YOPwwfMWFUiP
 EY8mmT/+ueVA/FfhH3a9+yPixalCikKYcO6yYZU3gwhywdaBQnM4a8UcNnuCSTb0FvVE=;
Received: from mail-wm1-f46.google.com ([209.85.128.46])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1v9hW6-0006KE-89 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 17 Oct 2025 10:16:58 +0000
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-46e6a689bd0so16217485e9.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 17 Oct 2025 03:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1760696207; x=1761301007; darn=lists.sourceforge.net; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=viS3DvrDA7N5filScWTdQ7ckK4IythNKZ1IY1FtODKE=;
 b=BvtQciOEOPRgR7Gs7heMJG31NA2TlGADMrqrGA4DCfOsV2fczTVa5cdRWB3YTlq7vg
 VhSecISP+2Rpww3PcqOnI4ASdh7OV6TzXHjrrBQBfKHoW6FlAydtuFnmKTEbzcMqmLRk
 vruDdy6T9MbKBt2k2fdk/bgm8UZCHECka250t6feNnoyJFvgtMo7o7rZYli0Lz5I9BPc
 B1ViA9FX6GsvrFLv70z/WrAKG2Yj1hfplzuwW+yw6V/A9c7duMt5NEhn/mVAa4luSTa/
 NJ9QlBqzOl3zIK4msih8sSPXUfjEckArBJq3L0nownNyMYKWKmUl/QhZd/UKp1UfwNvX
 CFmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760696207; x=1761301007;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=viS3DvrDA7N5filScWTdQ7ckK4IythNKZ1IY1FtODKE=;
 b=bMr9s9WUJKOgTBbGHnTcbh5JBrFskLnHVU79eI7HVjGX7P92WYXrSuhai1Rs8u0hiM
 gLxsdHcnSJ6Pi7yxsr9PaMY/MBgYFLGDWCJIR12iRk2ZSTKNMe4sjCQT8ESwL2NABmnj
 3/iQU9XagQ3u2pIltPrB4OsrToAYar4KXeoPdBlHK5AuLZRw93P9u1q2Q9edrxZUJwCs
 JieMH/2rs9iKrrbX6uhOid+1Hisq1OBICxsCNVtEYJdijpnv39Dw713I/8jUGAb9MSF4
 hRlLCK2X2IWPV44laYWHvyDtuZxlzIbXuVafZeR1XVb41xJlBsWw813j6FEq7G1uRY7m
 g5yg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6/xZsE9PLwZsvUulY9LvQIv5WvHBy3zwSbjzabXNhfRpEHnorP5OW4+BZjRonXLfCuTNeif1TyZDbJE9EmQ==@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yyj60zoX7UxaTQUOxauc0UEfpJYBPmPeidkvDc3oHJxiQ0iXRM6
 4HG/I5T/Z7rm9327sw3EdmTvWEo++VNR6BuBZYA1ILz7UVCfARVYaxx18gtDhFf/Ihc=
X-Gm-Gg: ASbGncsFiDUSGCJgm8HBHhs2cXMgS2/AZQltmiHqjGBvItNI9yEvT3QZT0Tr+mzjUe1
 gnNl4dK+v2Gm7HxJMMwf8XvIzkFKwLALXgek++IyTIJ5ovSsvLm0vGHP+peoX2tWoaArlvtv7RD
 42pDdj8DsSdr4Fpp3yRSymqzhEy3v8TDMy/0TTvIKchC081MsUVOHJ2fLfTPH251rTgTLCokvL6
 l6jQSHsBqlpSNYtXpYwvedn8G2YR41+8C9cIttoAC8W3TPkCpzbxu+zC/V696avyfFb8z1f5gJ/
 hypEOJsNGyS7FNC8S2JTdDGjyTthmhtfG8arc/7iQyWl1q82YRgFfA/C3Lo6llA2FOhunAVFy8Q
 Ih+FOWBKLcRVF2qa05PugjHtEoaLbYntpqmgrtYaJITpoRL2ALkeFvBPzN2xK2Kyvv34yh8Vqvj
 Hlai8q34lLZu3N5Jpe8taXREUq
X-Google-Smtp-Source: AGHT+IE7d1EMWBKzTirDjA0j/LBzhttirmBc5/YxJccLDP4Fy1GVRsRF9OdyLro6dqR2+G+508ivXQ==
X-Received: by 2002:a05:600c:310e:b0:471:1645:458d with SMTP id
 5b1f17b1804b1-471179122ccmr20917295e9.20.1760696206670; 
 Fri, 17 Oct 2025 03:16:46 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42704141cc3sm6585051f8f.9.2025.10.17.03.16.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Oct 2025 03:16:46 -0700 (PDT)
Date: Fri, 17 Oct 2025 12:16:44 +0200
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Message-ID: <aPIXjPJmJxW2i6xr@pathway.suse.cz>
References: <20251016-nbcon-kgdboc-v6-0-866aac60a80e@suse.com>
 <20251016-nbcon-kgdboc-v6-2-866aac60a80e@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251016-nbcon-kgdboc-v6-2-866aac60a80e@suse.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu 2025-10-16 11:47:55, Marcos Paulo de Souza wrote: >
 These helpers will be used when calling console->write_atomic on > KDB code
 in the next patch. It's basically the same implementation > as nb [...] 
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
 [209.85.128.46 listed in wl.mailspike.net]
X-Headers-End: 1v9hW6-0006KE-89
Subject: Re: [Kgdb-bugreport] [PATCH v6 2/5] printk: nbcon: Introduce KDB
 helpers
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

On Thu 2025-10-16 11:47:55, Marcos Paulo de Souza wrote:
> These helpers will be used when calling console->write_atomic on
> KDB code in the next patch. It's basically the same implementation
> as nbcon_device_try_acquire, but using NBCON_PRIO_EMERGENCY when
> acquiring the context.
> 
> If the acquire succeeds, the message and message length are assigned to
> nbcon_write_context so ->write_atomic can print the message.
> 
> After release try to flush the console since there may be a backlog of
> messages in the ringbuffer. The kthread console printers do not get a
> chance to run while kdb is active.
> 
> --- a/include/linux/console.h
> +++ b/include/linux/console.h
> @@ -606,6 +606,9 @@ extern bool nbcon_can_proceed(struct nbcon_write_context *wctxt);
>  extern bool nbcon_enter_unsafe(struct nbcon_write_context *wctxt);
>  extern bool nbcon_exit_unsafe(struct nbcon_write_context *wctxt);
>  extern void nbcon_reacquire_nobuf(struct nbcon_write_context *wctxt);
> +extern bool nbcon_kdb_try_acquire(struct console *con,
> +				  struct nbcon_write_context *wctxt);
> +extern void nbcon_kdb_release(struct nbcon_write_context *wctxt);
>  
>  /*
>   * Check if the given console is currently capable and allowed to print
> @@ -655,6 +658,9 @@ static inline bool nbcon_can_proceed(struct nbcon_write_context *wctxt) { return
>  static inline bool nbcon_enter_unsafe(struct nbcon_write_context *wctxt) { return false; }
>  static inline bool nbcon_exit_unsafe(struct nbcon_write_context *wctxt) { return false; }
>  static inline void nbcon_reacquire_nobuf(struct nbcon_write_context *wctxt) { }
> +static inline bool nbcon_kdb_try_acquire(struct console *con,
> +					 struct nbcon_write_context *wctxt) { return false; }
> +static inline void nbcon_kdb_release(struct console *con) { }

A test robot found that this definition is using a wrong type,
see https://lore.kernel.org/all/202510171023.YREXxhMK-lkp@intel.com/

It should be:

static inline void nbcon_kdb_release(struct nbcon_write_context *wctxt) { }

No need for v7. I am going to fix this when committing the patchset.

Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
