Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD11BE7A09
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 17 Oct 2025 11:23:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6gu+oM2vv+48uVyvHXsObXk808iygdXeMBGKkZlxwlE=; b=ehRx6gEPP/vMbZ6emeVPIkcbs0
	dnwIzmlc1p4a6u2ud+v4DWe4s2V3wo2xvjnWNpb5vA1kL68R1FhBlg6nMCj9vsnHT7wn9EEML3/fu
	PHR8XY8LSueaugZudpmG283k5RXcNS95VGsSSQcMveN6MIObhOI3ZkVjgkxGEzItcqGI=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1v9gg3-0007sa-7p
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 17 Oct 2025 09:23:11 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1v9gg1-0007sT-ET
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 17 Oct 2025 09:23:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=x8eKIZZDBFPnFWMgL/iPK3gecISpT2qwaYqhfjFtVtc=; b=RIovR/AXMV/J1zjpOunbvMYiwQ
 9EQsse/WmAdDNAU3H+R8irTxo77AD9EwTAqAawFtAAt3CtX1YfT1Bv5npFAdsJKQCzXm/rFXFLuDm
 VNizwyxSDNRB86YwDI+4GQ0TgCPCzhw813OdE0zMKnZi+/0il+zlH9bKqkAeuajQ7mVI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=x8eKIZZDBFPnFWMgL/iPK3gecISpT2qwaYqhfjFtVtc=; b=jM50c5s7gX+qc40qdia3fXvTrz
 UYED/xiho+InTv4kXz3B1nZj/URt+xpnJwUwNcT21FlfhHe3pKw7SfMWuRZ3rpKBbxAW06UfUbffE
 DFIh4xDTyb62pUd7r+svrq0Fh91GxFUkb34Gcr9zwmB0ozyxQJ99uDxlYln7nyqnC5r0=;
Received: from mail-wr1-f46.google.com ([209.85.221.46])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1v9gg0-0002On-QJ for kgdb-bugreport@lists.sourceforge.net;
 Fri, 17 Oct 2025 09:23:09 +0000
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-426ff694c1fso1126944f8f.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 17 Oct 2025 02:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1760692982; x=1761297782; darn=lists.sourceforge.net; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=x8eKIZZDBFPnFWMgL/iPK3gecISpT2qwaYqhfjFtVtc=;
 b=I+1jVTUNIQP6h7vG+3NZiFR6vOUK1L8ophiOjFtNoXPhspxdDDuN6e+vufOmlQ/hfl
 +aZceWvqVy9CUE1sPtCdrjiSiQaklH7q6TjcVfXKxD/mkFU5PpOpJ52pEDazb5GtPJ0F
 0fLkxgBVPb08vsblIHJVnOSOW7MtHG/PCMEp/eib1ZkOlhMFDikdPDSIxqEV4XZqr4nc
 PKGx35lh89FJ2kukV6w8tgPrcSeUI1Zaai56ioD0Q1Lp7UUR//kAK1XzsiD87qsElMdf
 ds1LH2LqafXiiVE141PZhAEqn8ec+49pgR+GMSXSP+gFoxKrPg+S18HMe2Nfr+gZiCcs
 wrzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760692982; x=1761297782;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x8eKIZZDBFPnFWMgL/iPK3gecISpT2qwaYqhfjFtVtc=;
 b=n0VqGt5McZiakeIhvyi4gOn6+ggMJXD+MiHlUKFmtIWLygrqcQ+cQLy2zV2stU31GO
 aCVUcF7xWxx0oHr4oj5ceLGRzx6jW9swzeFLXXF6fS7W9niGWSdrN7ypMhVsqtYaQM2S
 1i053XZlMzymFjpt10Y7LlMcHY0JcW/1dY6SqtZxslMZAx6rz/Kt1rT5q8bA52/WUskn
 UJoYYVcrtmWeTH5XTXVDbTZrmmDVFwTWpWL9ltAZZKGm2BwPMTYWsoyD/HaUlgGdmxfI
 SfCAoqinH5avjbnrHIbdSYEfZp8D1+3GqNDXNkYvb6TgcfsPNaQXaIOqtHzoeKSzGo2Z
 ADZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUO/bcnb+oNSIKmsBFDoQRDvR5jFxgCyTDsuycQcCyNZCyAIp7vLFkQ7pjqL9dIwBIMZRiIdXhUlr0/25+qIA==@lists.sourceforge.net
X-Gm-Message-State: AOJu0Ywf5ed5aqIioTVEFf7otFk2BAD9Ao5irkXaGS0qMfnq4qriX6LM
 Ec7evkLv3NLNDErCPYEDcp4cu15w0wSKY9jZ3EuD7flVPuhhm17ssknvIbVXmuKQ/d4=
X-Gm-Gg: ASbGncsbo0rSt5syuzmvudZfMZy928F28WmVX+lhgfRtTe5yMaloMgA7vLgnC3ewE+i
 kx55GuJI+Z1YedokjASSlN8iP6OduAMvW4jLyCFeKYvLFv4H0T0SC36OvwMXks/GFZMfJ8Mmc3F
 2L37nAYKlKBwwt3tmnoi6DXBtKX1lH0ukiqq9GxGy8zXhgN9KmvWZSzi0Xxc+zOJkG0XcWjDFK5
 hSu4RtWJ0TZs/dN2sQI0YGu6d6BVMYmqryl38zGlG7HIlMan90iYj6QFREK58BMNIKxtNdpgNep
 LEZiEBzbPlpPCVUce5xbQ9GPaKPnrAyB6NqA8fjPSZxFLs0iHvUEtEjUcNutMUPTI1j/Ha65PLg
 u8zdRAAIvRp1yqxdYcs3BBRTVEPT9rk33oLkk9DABXjL6y4bqpfUjH+wlPVsqnb3fTOiIl5nchQ
 2vt/Y=
X-Google-Smtp-Source: AGHT+IFBvM0yq0FAMRFQ5AUMtzJSBiUFOQlgXN4zTl2zbqeWXMV25+z9lNm5vk3i62WDfH3CKzQnvQ==
X-Received: by 2002:a05:6000:2f83:b0:424:211a:4141 with SMTP id
 ffacd0b85a97d-42704d92e5bmr2250835f8f.27.1760692982135; 
 Fri, 17 Oct 2025 02:23:02 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce57ccb1sm38878789f8f.8.2025.10.17.02.23.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Oct 2025 02:23:01 -0700 (PDT)
Date: Fri, 17 Oct 2025 11:22:59 +0200
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Message-ID: <aPIK89sCve-evf7y@pathway.suse.cz>
References: <20251016-nbcon-kgdboc-v6-0-866aac60a80e@suse.com>
 <20251016-nbcon-kgdboc-v6-3-866aac60a80e@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251016-nbcon-kgdboc-v6-3-866aac60a80e@suse.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu 2025-10-16 11:47:56, Marcos Paulo de Souza wrote: >
 KDB can interrupt any console to execute the "mirrored printing" at any >
 time, so add an exception to nbcon_context_try_acquire_direct to al [...]
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.46 listed in wl.mailspike.net]
X-Headers-End: 1v9gg0-0002On-QJ
Subject: Re: [Kgdb-bugreport] [PATCH v6 3/5] printk: nbcon: Allow KDB to
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

On Thu 2025-10-16 11:47:56, Marcos Paulo de Souza wrote:
> KDB can interrupt any console to execute the "mirrored printing" at any
> time, so add an exception to nbcon_context_try_acquire_direct to allow
> to get the context if the current CPU is the same as kdb_printf_cpu.
> 
> This change will be necessary for the next patch, which fixes
> kdb_msg_write to work with NBCON consoles by calling ->write_atomic on
> such consoles. But to print it first needs to acquire the ownership of
> the console, so nbcon_context_try_acquire_direct is fixed here.
> 
> @@ -207,11 +208,26 @@ static inline const char *kdb_walk_kallsyms(loff_t *pos)
>  /* Dynamic kdb shell command registration */
>  extern int kdb_register(kdbtab_t *cmd);
>  extern void kdb_unregister(kdbtab_t *cmd);
> +
> +/* Return true when KDB as locked for printing a message on this CPU. */
> +static inline
> +bool kdb_printf_on_this_cpu(void)
> +{
> +	/*
> +	 * We can use raw_smp_processor_id() here because the task could
> +	 * not get migrated when KDB has locked for printing on this CPU.
> +	 */
> +	return unlikely(READ_ONCE(kdb_printf_cpu) == raw_smp_processor_id());
> +}
> +
>  #else /* ! CONFIG_KGDB_KDB */
>  static inline __printf(1, 2) int kdb_printf(const char *fmt, ...) { return 0; }
>  static inline void kdb_init(int level) {}
>  static inline int kdb_register(kdbtab_t *cmd) { return 0; }
>  static inline void kdb_unregister(kdbtab_t *cmd) {}
> +
> +static inline bool kdb_printf_on_this_cpu(void) { return false };

As the robot pointed out, this should be:

   static inline bool kdb_printf_on_this_cpu(void) { return false; }

> +
>  #endif	/* CONFIG_KGDB_KDB */
>  enum {
>  	KDB_NOT_INITIALIZED,

The rest looks good. With the above change:

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
