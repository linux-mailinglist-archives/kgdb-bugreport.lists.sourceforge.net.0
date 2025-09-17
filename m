Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 767B2B7F08D
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 17 Sep 2025 15:12:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yaPeYfvRJMhFX+7nbegTdmQx4Iui7ZvU2rgRH2COFEU=; b=UOVopd147W5XfhLyJDyWip0lQn
	01oWF5BzeYTf4vGtAaMJZLBKiiz/7oAn48Iq+FIYxFCWDwwIS0W9x/O15cO6fcPp8P9BCs0xhWmNe
	unMP9ol1EFyNzw+exzvUUE0H2WiLMtscNiW8dgJ5Uo4EMxIzdECzzAlKcxAenPiqI9Vc=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1uyqyu-0002TL-EN
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 17 Sep 2025 12:09:53 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1uyqys-0002T7-W3
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 17 Sep 2025 12:09:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SxZ3+rLWm8Lxy+EHVqksiJdCm4z0sfQ0FHsCPWMh5L0=; b=eYDujVzNYbRYY4dj/gQaYaMUWB
 j8+/JkjCrT/+25zJXLSE7Y2QIHPEkcIb/6zRaXFT5ldiOgQ8g5/PqnjukLX5JX8OPTQhffNPN0gRb
 H77mkuQ/pEGYYs3QxTtUgoPSP3BfLJgVBQh7qAd6N9ezXKwl8rqu5DeszFnWNmj0GN98=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SxZ3+rLWm8Lxy+EHVqksiJdCm4z0sfQ0FHsCPWMh5L0=; b=IJ9d8TpNGqICP7crjhHgeVwpbU
 QPP8ecmZ2cEWStsTidX0II7wSWjzBlsd4AlizVTv+2bajMPXL5leCrtazlhm90cMzbkGvWzkdbuCL
 4WPSLhHdWBANnRZUzQ7uRI3JQrakEx6rT7LDFLWgB9BvYX09VvtnbQnKLbvonylQIMiU=;
Received: from mail-ej1-f66.google.com ([209.85.218.66])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uyqyt-0002DM-90 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 17 Sep 2025 12:09:51 +0000
Received: by mail-ej1-f66.google.com with SMTP id
 a640c23a62f3a-b04ba3de760so820139466b.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 17 Sep 2025 05:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1758110985; x=1758715785; darn=lists.sourceforge.net; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=SxZ3+rLWm8Lxy+EHVqksiJdCm4z0sfQ0FHsCPWMh5L0=;
 b=QHaKakRDc0vjTsYBi4j6q09S+Yrm+amjVyDyJmD6aqdOgv9b5eC2Cn+MFrV/h6yc6r
 tqKa6XWSRTcQWgNQRolCQCuNWX+WELNZLbNAeq+2R+UduyvkeGCsAEEPTL+sYp1jQT8z
 f71+deTvZ/Vnp4LP+dseAk9+uYVCYeDh05AMs66wSviv17eZKtfDrzoRPS9yTv9lLxQB
 5qnqkv3mEBM8UhuTir1+fUyJenR7h2cWLwzIM0EZyTciXB0c9HTgSQO14SiD46WxoTPF
 lSXUlJIG/FItQb6QO4fmhQo9MZWEtmGM4Wt0dPkt9AF77M/fdbavYPzgoqWERnkeJ4Ih
 cQmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758110985; x=1758715785;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SxZ3+rLWm8Lxy+EHVqksiJdCm4z0sfQ0FHsCPWMh5L0=;
 b=p0IDSSOKHHunVjvEy/aQWcNwDWF7O7TPfqTzB8Qm9f/Dka8asIAQiuzry0G+FBLqBu
 ETwOQ6UDsDpgHXgohsqnc/9c8BroIDPelneE9SwQ7xYte3LeFDL557mRSh+IAyH8x/Xm
 6D9DjOZ19yJ+mouUiv1o/knocud7StHI7atHSHKOHcw8rRFBEDFOLFp9WU9ETTnM70iz
 PZd1uw9Fa8y1Mw0so4lVEyqB2s0DKCqoazIdN/L+Xlrv/MLwvchhZKq8jFKifsIWGp+d
 wAt0T/R5uRAZxExDVUBFYwJXLawQgMdNaTXSrnxsnGwtPhTNwjYDWs0A9JQLApudo7kp
 cBxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTNQ+JY4MRoC0hEp4ZvAFksSPBJ/tPWct5i+UQRwoqQWPum0ZKhYKuZr7vpubGkN09i2XMiwHdIcJmK5vWFA==@lists.sourceforge.net
X-Gm-Message-State: AOJu0YycUkcLSOz1rY6mIwtDVg/ZYmNQKyYEWWT0sYpM03pEqRlW3zYZ
 GgGB+eKHiVwvgPHqkUNB+WfhKJuexewnZmUXqtVLznMmmQVrL/RCcYCkug1gjXZ4XNI=
X-Gm-Gg: ASbGnculZNUdffk+6yjaBzIVcmWDmC37edNa1Icndzx8TgzSxmhpry1U9D22TDfmOIv
 mII1dh+mjKiDs3A2LdP9hxjcg/MQ/+OkS5BJ2a1J/TL4Y/j7btKjEjmTO0163/wQi706nbZUWW7
 7oBEWEOTphr0RHvAi9Hc+ytxlzckcoOiITdvBxTz0QU1K/03X17fszKzf3yDx2q/G703KWM8jsh
 i0hegYWPhqUizVvcc7bEf2+iYCJVu14kAGjUt5lf0j3DEFSaVHJmfr8yU8WVclvLQzL4uae3354
 ECmmZk1cs2tRz4sv5ralJyyhtTqdzNFx3itekl7eXIFUUPJsYLV39gFaEJcUnV6q6i5nL6ADiZ4
 FhP9z+n/ww9rkuUrNg9hU5Itvt8RvvSXrb8ypGW3OQ0cS
X-Google-Smtp-Source: AGHT+IEiPsKGkN/Uq1H8HSxXA+gLbV8eTjrBUjU0AsRADHTNUdgsScaxG3DVDMRBuqTKXekvFmA2yg==
X-Received: by 2002:a17:907:7eaa:b0:b0a:333:2f91 with SMTP id
 a640c23a62f3a-b1bb7e35ed1mr229890666b.40.1758110984541; 
 Wed, 17 Sep 2025 05:09:44 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b0906a9640esm904166666b.110.2025.09.17.05.09.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Sep 2025 05:09:44 -0700 (PDT)
Date: Wed, 17 Sep 2025 14:09:42 +0200
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Message-ID: <aMqlBvIBZJTkKD0l@pathway.suse.cz>
References: <20250915-nbcon-kgdboc-v4-0-e2b6753bb566@suse.com>
 <20250915-nbcon-kgdboc-v4-3-e2b6753bb566@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250915-nbcon-kgdboc-v4-3-e2b6753bb566@suse.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon 2025-09-15 08:20:32, Marcos Paulo de Souza wrote: >
 KDB can interrupt any console to execute the "mirrored printing" at any >
 time, so add an exception to nbcon_context_try_acquire_direct to al [...]
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.218.66 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uyqyt-0002DM-90
Subject: Re: [Kgdb-bugreport] [PATCH v4 3/5] printk: nbcon: Allow KDB to
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

On Mon 2025-09-15 08:20:32, Marcos Paulo de Souza wrote:
> KDB can interrupt any console to execute the "mirrored printing" at any
> time, so add an exception to nbcon_context_try_acquire_direct to allow
> to get the context if the current CPU is the same as kdb_printf_cpu.
> 
> This change will be necessary for the next patch, which fixes
> kdb_msg_write to work with NBCON consoles by calling ->write_atomic on
> such consoles. But to print it first needs to acquire the ownership of
> the console, so nbcon_context_try_acquire_direct is fixed here.
> 
> --- a/include/linux/kdb.h
> +++ b/include/linux/kdb.h
> @@ -207,11 +207,17 @@ static inline const char *kdb_walk_kallsyms(loff_t *pos)
>  /* Dynamic kdb shell command registration */
>  extern int kdb_register(kdbtab_t *cmd);
>  extern void kdb_unregister(kdbtab_t *cmd);
> +
> +#define KDB_IS_ACTIVE() (READ_ONCE(kdb_printf_cpu) != raw_smp_processor_id())

The condition looks inverted. It should be true when the CPU ID matches.

I actually think about using similar approach and naming scheme
as for the similar API checking @panic_cpu. There are patches
in -mm tree which consolidated that API, see
https://lore.kernel.org/r/20250825022947.1596226-2-wangjinchao600@gmail.com

In our case, the similar API would be:

/* Return true when KDB has locked for printing a message on this CPU. */
static inline
bool kdb_printf_on_this_cpu(void)
{
	/*
	 * We can use raw_smp_processor_id() here because the task could
	 * not get migrated when KDB has locked for printing on this CPU.
	 */
	return unlikely(READ_ONCE(kdb_printf_cpu) == raw_smp_processor_id());
}

> +
>  #else /* ! CONFIG_KGDB_KDB */
>  static inline __printf(1, 2) int kdb_printf(const char *fmt, ...) { return 0; }
>  static inline void kdb_init(int level) {}
>  static inline int kdb_register(kdbtab_t *cmd) { return 0; }
>  static inline void kdb_unregister(kdbtab_t *cmd) {}
> +
> +#define KDB_IS_ACTIVE() false

and here to match the style above:

static inline bool kdb_printf_on_this_cpu(void) { return false };

> +
>  #endif	/* CONFIG_KGDB_KDB */
>  enum {
>  	KDB_NOT_INITIALIZED,
> diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
> index ff218e95a505fd10521c2c4dfb00ad5ec5773953..8644e019e2391797e623fcc124d37ed4d460ccd9 100644
> --- a/kernel/printk/nbcon.c
> +++ b/kernel/printk/nbcon.c
> @@ -248,13 +249,17 @@ static int nbcon_context_try_acquire_direct(struct nbcon_context *ctxt,
>  		 * since all non-panic CPUs are stopped during panic(), it
>  		 * is safer to have them avoid gaining console ownership.
>  		 *
> -		 * If this acquire is a reacquire (and an unsafe takeover
> +		 * One exception is if kdb is active, which may print
> +		 * from multiple CPUs during a panic.

Also here the "active" is a bit ambiguous term. I would use:

		 * One exception is when kdb has locked for printing on this
		 * CPU.

> +		 *
> +		 * Second exception is a reacquire (and an unsafe takeover
>  		 * has not previously occurred) then it is allowed to attempt
>  		 * a direct acquire in panic. This gives console drivers an
>  		 * opportunity to perform any necessary cleanup if they were
>  		 * interrupted by the panic CPU while printing.
>  		 */
>  		if (other_cpu_in_panic() &&
> +		    !KDB_IS_ACTIVE() &&
>  		    (!is_reacquire || cur->unsafe_takeover)) {
>  			return -EPERM;
>  		}

I am sorry that I did not suggested the better names already when
this new API was discussed in v3.

Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
