Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 83AD31E43B3
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 27 May 2020 15:31:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jdw9b-0003fb-BB
	for lists+kgdb-bugreport@lfdr.de; Wed, 27 May 2020 13:31:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1jdw9a-0003fT-Fa
 for kgdb-bugreport@lists.sourceforge.net; Wed, 27 May 2020 13:31:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8VOMGwKeWb18yJy6AqbiOJrTJsddSTvU5Ozfrp1ZV/E=; b=WKaAjjJg88qjVVgKli3sk1/kyq
 AbgppERYxfJMA+MR1f+C4Cd8rDd82ae8KRnD6iR3Bq//1zIG3pHtzsRXQ/p6eLvIjhY1/n/Wkd2WB
 OMYWY2L3cTQiQ0qichgFFnuSrEw+xN+HwDpxP5I4T7i8e6f1flSN0fNBYO+tgaloT5bM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8VOMGwKeWb18yJy6AqbiOJrTJsddSTvU5Ozfrp1ZV/E=; b=d1P14mfzKgV/ZYoWvV6M2nlQuK
 wqRlkXml6S47ZxDhXzVbzl/pEyCxQ7wh9Nw3ZR/E6XcDzxpE+rguSAJtc7ALcUG7++xROBoNztsGD
 1G0jyaHj9BAz9r5Qkgf6rMVLe6IN3BnB3uwf2BMts2V5e7H2XGtv9W6co+/rT1tRhvMs=;
Received: from mail-wm1-f65.google.com ([209.85.128.65])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jdw9X-00ErIG-6m
 for kgdb-bugreport@lists.sourceforge.net; Wed, 27 May 2020 13:31:30 +0000
Received: by mail-wm1-f65.google.com with SMTP id r9so3064623wmh.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 27 May 2020 06:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=8VOMGwKeWb18yJy6AqbiOJrTJsddSTvU5Ozfrp1ZV/E=;
 b=trZP+/A35rUQ4kCjblhiYs3jDK5gxP1zy9rLpoTtXRQD7Ii9S420UYJ1TgJS9ETj1U
 Y+OHFbtXknQegRe3rxLmQH6chJ9a3hcx2DmOmflp/NkCYkVI5ndYnnXOSWW2/JzwsdW/
 QqfCbaO6rnYamRvnBDDXJcklcyonCSyXzy1qO5VCBs6iPQlWb3hmlfrmVSuDWPJu1v3F
 Uw4kStSLIxmlij4BX5UyJT7v414DF747zSd/RP3CsUYXv5tWE9ZkOFp/cs/ETtWysv+x
 ZDpu+qMt2nETDc8uD1Y6p/nvdXPou/JaaYOSLM07Wi7I335ypk32VVnQwOXjCCRiMgsH
 CH2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8VOMGwKeWb18yJy6AqbiOJrTJsddSTvU5Ozfrp1ZV/E=;
 b=ezJ4a7Vme2X/GMzlg0PNlfv/OTMqph7j8j1LOXAvBAD12n4OcD8z8CBfmpLh5sQ7QY
 51tSqXPc1zs4FrKNZSTwfKax8dGObv28DWu9VXYpM6DAe1l4CKUkcsvgIm9leY9nndY8
 giBGZGxwbctoFseKLRSO3g9xkffmFyyEllVRXeuku66rgnoKw+n26K1KknQyECVJgjzg
 YEYQkudH5NcxjiyCUMMEUHxPyXbmcPknlHyo62xJu/CVsTKn6PUX5J+AxQSijkxRk2qH
 H3lttZfb4v/q/xYaLTxiT8B6ykaAPed+K1h1kY5VytR+m5P54zPHUpIkn9gs0XgAIhnA
 Q+DQ==
X-Gm-Message-State: AOAM533RDecsj8f/doLxSewQoBdElg1Lz5ycj+OWUE3nHbVSyELabo9/
 HToNveT4lYMshuektVuwDKFYlw==
X-Google-Smtp-Source: ABdhPJxS6bZTcBJRZZ7joVe6qjjBOt3/2Zd12k5hGkE0YrYOG/RMuE5BdrZ89ccVCryykcyX5evC3g==
X-Received: by 2002:a1c:a901:: with SMTP id s1mr4590509wme.66.1590586278184;
 Wed, 27 May 2020 06:31:18 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id b185sm4067484wmd.3.2020.05.27.06.31.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 May 2020 06:31:17 -0700 (PDT)
Date: Wed, 27 May 2020 14:31:15 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Sumit Garg <sumit.garg@linaro.org>
Message-ID: <20200527133115.x5hqzttsg73saiky@holly.lan>
References: <1590560759-21453-1-git-send-email-sumit.garg@linaro.org>
 <1590560759-21453-5-git-send-email-sumit.garg@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1590560759-21453-5-git-send-email-sumit.garg@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.65 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.65 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jdw9X-00ErIG-6m
Subject: Re: [Kgdb-bugreport] [PATCH v3 4/4] kdb: Switch kdb_msg_write() to
 use safer polling I/O
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
Cc: pmladek@suse.com, kgdb-bugreport@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, sergey.senozhatsky@gmail.com,
 jason.wessel@windriver.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Wed, May 27, 2020 at 11:55:59AM +0530, Sumit Garg wrote:
> In kgdb NMI context, calling console handlers isn't safe due to locks
> used in those handlers which could lead to a deadlock. Although, using
> oops_in_progress increases the chance to bypass locks in most console
> handlers but it might not be sufficient enough in case a console uses
> more locks (VT/TTY is good example).
> 
> Currently when a driver provides both polling I/O and a console then kdb
> will output using the console. We can increase robustness by using the
> currently active polling I/O driver (which should be lockless) instead
> of the corresponding console. For several common cases (e.g. an
> embedded system with a single serial port that is used both for console
> output and debugger I/O) this will result in no console handler being
> used.

Not sure I would have predicted all those changes to kgdboc.c based on
this patch description. I assume this is to help identify which console
matches our dbg_io_ops but it would be good to spell this out.


> Suggested-by: Daniel Thompson <daniel.thompson@linaro.org>
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> ---
>  drivers/tty/serial/kgdboc.c | 17 ++++++++---------
>  include/linux/kgdb.h        |  2 ++
>  kernel/debug/kdb/kdb_io.c   | 46 +++++++++++++++++++++++++++++++--------------
>  3 files changed, 42 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/tty/serial/kgdboc.c b/drivers/tty/serial/kgdboc.c
> index c9f94fa..6199fe1 100644
> --- a/drivers/tty/serial/kgdboc.c
> +++ b/drivers/tty/serial/kgdboc.c
> @@ -35,7 +35,6 @@ static struct kparam_string kps = {
>  };
>  
>  static int kgdboc_use_kms;  /* 1 if we use kernel mode switching */
> -static struct tty_driver	*kgdb_tty_driver;
>  static int			kgdb_tty_line;
>  
>  #ifdef CONFIG_KDB_KEYBOARD
> @@ -154,7 +153,7 @@ static int configure_kgdboc(void)
>  	}
>  
>  	kgdboc_io_ops.is_console = 0;
> -	kgdb_tty_driver = NULL;
> +	kgdboc_io_ops.tty_drv = NULL;
>  
>  	kgdboc_use_kms = 0;
>  	if (strncmp(cptr, "kms,", 4) == 0) {
> @@ -178,7 +177,7 @@ static int configure_kgdboc(void)
>  		}
>  	}
>  
> -	kgdb_tty_driver = p;
> +	kgdboc_io_ops.tty_drv = p;
>  	kgdb_tty_line = tty_line;
>  
>  do_register:
> @@ -216,18 +215,18 @@ static int __init init_kgdboc(void)
>  
>  static int kgdboc_get_char(void)
>  {
> -	if (!kgdb_tty_driver)
> +	if (!kgdboc_io_ops.tty_drv)
>  		return -1;
> -	return kgdb_tty_driver->ops->poll_get_char(kgdb_tty_driver,
> -						kgdb_tty_line);
> +	return kgdboc_io_ops.tty_drv->ops->poll_get_char(kgdboc_io_ops.tty_drv,
> +							 kgdb_tty_line);
>  }
>  
>  static void kgdboc_put_char(u8 chr)
>  {
> -	if (!kgdb_tty_driver)
> +	if (!kgdboc_io_ops.tty_drv)
>  		return;
> -	kgdb_tty_driver->ops->poll_put_char(kgdb_tty_driver,
> -					kgdb_tty_line, chr);
> +	kgdboc_io_ops.tty_drv->ops->poll_put_char(kgdboc_io_ops.tty_drv,
> +						  kgdb_tty_line, chr);
>  }
>  
>  static int param_set_kgdboc_var(const char *kmessage,
> diff --git a/include/linux/kgdb.h b/include/linux/kgdb.h
> index b072aeb..05d165d 100644
> --- a/include/linux/kgdb.h
> +++ b/include/linux/kgdb.h
> @@ -275,6 +275,7 @@ struct kgdb_arch {
>   * for the I/O driver.
>   * @is_console: 1 if the end device is a console 0 if the I/O device is
>   * not a console
> + * @tty_drv: Pointer to polling tty driver.
>   */
>  struct kgdb_io {
>  	const char		*name;
> @@ -285,6 +286,7 @@ struct kgdb_io {
>  	void			(*pre_exception) (void);
>  	void			(*post_exception) (void);
>  	int			is_console;
> +	struct tty_driver	*tty_drv;

Should this be a struct tty_driver or a struct console?

In other words if the lifetime the console structure is the same as the
tty_driver then isn't it better to capture the console instead
(easier to compare and works with non-tty devices such as the
USB debug mode).


>  };
>  
>  extern const struct kgdb_arch		arch_kgdb_ops;
> diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
> index f848482..c2efa52 100644
> --- a/kernel/debug/kdb/kdb_io.c
> +++ b/kernel/debug/kdb/kdb_io.c
> @@ -24,6 +24,7 @@
>  #include <linux/kgdb.h>
>  #include <linux/kdb.h>
>  #include <linux/kallsyms.h>
> +#include <linux/tty_driver.h>
>  #include "kdb_private.h"
>  
>  #define CMD_BUFLEN 256
> @@ -542,13 +543,18 @@ static int kdb_search_string(char *searched, char *searchfor)
>  	return 0;
>  }
>  
> -static void kdb_io_write(char *cp, int len, void (*io_put_char)(u8 ch))
> +static void kdb_io_write(char *cp, int len, void (*io_put_char)(u8),
> +			 struct tty_driver *p, int line,
> +			 void (*poll_put_char)(struct tty_driver *, int, char))

Judging from your reply to comment 1 I guess this is already on the list
to eliminate ;-).


Daniel.


>  {
>  	if (len <= 0)
>  		return;
>  
>  	while (len--) {
> -		io_put_char(*cp);
> +		if (io_put_char)
> +			io_put_char(*cp);
> +		if (poll_put_char)
> +			poll_put_char(p, line, *cp);
>  		cp++;
>  	}
>  }
> @@ -561,22 +567,34 @@ static void kdb_msg_write(char *msg, int msg_len)
>  		return;
>  
>  	if (dbg_io_ops && !dbg_io_ops->is_console)
> -		kdb_io_write(msg, msg_len, dbg_io_ops->write_char);
> +		kdb_io_write(msg, msg_len, dbg_io_ops->write_char,
> +			     NULL, 0, NULL);
>  
>  	for_each_console(c) {
> +		int line;
> +		struct tty_driver *p;
> +
>  		if (!(c->flags & CON_ENABLED))
>  			continue;
> -		/*
> -		 * While rounding up CPUs via NMIs, its possible that
> -		 * a rounded up CPU maybe holding a console port lock
> -		 * leading to kgdb master CPU stuck in a deadlock during
> -		 * invocation of console write operations. So in order
> -		 * to avoid such a deadlock, enable oops_in_progress
> -		 * prior to invocation of console handlers.
> -		 */
> -		++oops_in_progress;
> -		c->write(c, msg, msg_len);
> -		--oops_in_progress;
> +
> +		p = c->device ? c->device(c, &line) : NULL;
> +		if (p && dbg_io_ops && p == dbg_io_ops->tty_drv && p->ops &&
> +		    p->ops->poll_put_char) {
> +			kdb_io_write(msg, msg_len, NULL, p, line,
> +				     p->ops->poll_put_char);
> +		} else {
> +			/*
> +			 * While rounding up CPUs via NMIs, its possible that
> +			 * a rounded up CPU maybe holding a console port lock
> +			 * leading to kgdb master CPU stuck in a deadlock during
> +			 * invocation of console write operations. So in order
> +			 * to avoid such a deadlock, enable oops_in_progress
> +			 * prior to invocation of console handlers.
> +			 */
> +			++oops_in_progress;
> +			c->write(c, msg, msg_len);
> +			--oops_in_progress;
> +		}
>  		touch_nmi_watchdog();
>  	}
>  }
> -- 
> 2.7.4
> 


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
