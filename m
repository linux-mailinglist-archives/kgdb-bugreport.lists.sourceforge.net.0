Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 283A31E3BEA
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 27 May 2020 10:29:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jdrRF-0004lH-VE
	for lists+kgdb-bugreport@lfdr.de; Wed, 27 May 2020 08:29:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1jdrRC-0004kV-Ky
 for kgdb-bugreport@lists.sourceforge.net; Wed, 27 May 2020 08:29:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ieXuEPyp84YB4GCGexw/j3cGASehKyzX4KKOE2VbBQw=; b=CVdxuX1BPS64EG3JgTTrobyie4
 zOqV58m1oIqWrQRDQ6lgDj0RrT8lkYIIczgfEEL8VXxtjOMVhTZ6qFAastmmbl8aLO+JN2TdBYkG1
 3aNTthA1foI6/zGucb84sQEJwqipzNHgAJ3qk3eDfk4R+HvTyYNMONHmabqyGVKIAz4I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ieXuEPyp84YB4GCGexw/j3cGASehKyzX4KKOE2VbBQw=; b=fpQCAx3nVWJKzuasO2k2E9sbQi
 fQbrs0LYKwfUDHyn5RnnRHds6725r7NG+Zx7E2eUVEzBhL7Llm5jsOuRq+rfpRZ5aWuNLwPmN1TqJ
 9LM4U2rjcpTIbsYV83zGJOw00Ag8se1l6ZUpYuqiKtrdY5veq5RAlspxFIEH6xb+uJJU=;
Received: from mail-wr1-f65.google.com ([209.85.221.65])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jdrR8-00014m-U9
 for kgdb-bugreport@lists.sourceforge.net; Wed, 27 May 2020 08:29:22 +0000
Received: by mail-wr1-f65.google.com with SMTP id y17so14714085wrn.11
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 27 May 2020 01:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ieXuEPyp84YB4GCGexw/j3cGASehKyzX4KKOE2VbBQw=;
 b=IiOtfTb5HALp4h7n/CPvhJgyDwm8hS5bTwq2E+SrwdVZ72vGOW8yYwTLWfNrzyXILt
 N/XR79Zp+D7888hHIB3T9s7iR+qtCGadav3UPlHMxaDj61jeVDgAn6qUCbjtxvc+0imP
 TuhnHNKszTK3JTFYcyjJ5u7XnYwztI0owFyQUapUBfYkkZPIwzpkcxxVCCUku7MtrtNA
 nSok9J3eqMAOJlK3KuV2OYRJJJnl3gCfcCwXGNxrOAGIQNVy4GNXJ4gD3cldG7OjURVx
 U+AWgtZ3QoclVp2Ed8uqgKWolA2YmmMkcdXH1UQf6jXZ0JkG0xFsTsPdovOXiMh2zST8
 yIFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ieXuEPyp84YB4GCGexw/j3cGASehKyzX4KKOE2VbBQw=;
 b=Clxq3RB6dQqFAYg1z/yU91qVoUTYKbzKFva8qtKtviiPLKXKYu+dI0bE75tRvvABsg
 hEQshD6zRt8+5rbhWHE9AYqQ/o2wnQsJTqoCE3DmeAr/EhzrVde/php/qrVwkVLDoD9A
 v6EDqRzlC7VPXY4RdnZXVTiG88fj2lH+Xw/Px5ahVo7PHwRdeG1I+S59exivosya3mSu
 hnkf5BFzw8HPzTVbKPQZ5tloQmo18cF6zlQd+fqrfbFcSYwoSWcNNBTPOqPPMsOgf78c
 /mAipAU4T+GSuGC0ZDvKQT3a2tIHOot/s+ZoASgPlYFoglY6P/WE/xA2xHXmIQE7G0bD
 Y6dA==
X-Gm-Message-State: AOAM532sUBQjiuk8Ifap8fF6P+8V2+4JXulyY6bAlGBLHoMUZ7oeAfOk
 /mCnQ9/nLS9jr9fiXWaFG2bAng==
X-Google-Smtp-Source: ABdhPJyp6CfVVFZ/i6wR825VQrWhVTTRp7aQCdpTaPVm81g7I1wKh+7Q0Cv9pMyWeYmavyhFa0O9bA==
X-Received: by 2002:adf:dc50:: with SMTP id m16mr23880325wrj.329.1590568152559; 
 Wed, 27 May 2020 01:29:12 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id h7sm2159191wml.24.2020.05.27.01.29.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 May 2020 01:29:11 -0700 (PDT)
Date: Wed, 27 May 2020 09:29:07 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Sumit Garg <sumit.garg@linaro.org>
Message-ID: <20200527082907.wfvdsekmyzbpu3tu@holly.lan>
References: <1590560759-21453-1-git-send-email-sumit.garg@linaro.org>
 <1590560759-21453-2-git-send-email-sumit.garg@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1590560759-21453-2-git-send-email-sumit.garg@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.65 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.65 listed in wl.mailspike.net]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jdrR8-00014m-U9
Subject: Re: [Kgdb-bugreport] [PATCH v3 1/4] kdb: Re-factor kdb_printf()
 message write code
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

On Wed, May 27, 2020 at 11:55:56AM +0530, Sumit Garg wrote:
> Re-factor kdb_printf() message write code in order to avoid duplication
> of code and thereby increase readability.
> 
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> ---
>  kernel/debug/kdb/kdb_io.c | 61 +++++++++++++++++++++++++----------------------
>  1 file changed, 32 insertions(+), 29 deletions(-)
> 
> diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
> index 924bc92..f6b4d47 100644
> --- a/kernel/debug/kdb/kdb_io.c
> +++ b/kernel/debug/kdb/kdb_io.c
> @@ -542,6 +542,33 @@ static int kdb_search_string(char *searched, char *searchfor)
>  	return 0;
>  }
>  
> +static void kdb_io_write(char *cp, int len, void (*io_put_char)(u8 ch))

Don't use a function pointer here. Just pick it up from dbg_io_ops as
usual.


> +{
> +	if (len <= 0)
> +		return;

How can len ever be negative?


> +
> +	while (len--) {
> +		io_put_char(*cp);
> +		cp++;
> +	}
> +}
> +
> +static void kdb_msg_write(char *msg, int msg_len)
> +{
> +	struct console *c;
> +
> +	if (msg_len <= 0)
> +		return;

How can msg_len ever be negative?


> +
> +	if (dbg_io_ops && !dbg_io_ops->is_console)
> +		kdb_io_write(msg, msg_len, dbg_io_ops->write_char);
> +
> +	for_each_console(c) {
> +		c->write(c, msg, msg_len);
> +		touch_nmi_watchdog();
> +	}
> +}
> +
>  int vkdb_printf(enum kdb_msgsrc src, const char *fmt, va_list ap)
>  {
>  	int diag;
> @@ -553,7 +580,6 @@ int vkdb_printf(enum kdb_msgsrc src, const char *fmt, va_list ap)
>  	int this_cpu, old_cpu;
>  	char *cp, *cp2, *cphold = NULL, replaced_byte = ' ';
>  	char *moreprompt = "more> ";
> -	struct console *c;
>  	unsigned long uninitialized_var(flags);
>  
>  	/* Serialize kdb_printf if multiple cpus try to write at once.
> @@ -687,22 +713,11 @@ int vkdb_printf(enum kdb_msgsrc src, const char *fmt, va_list ap)
>  	 */
>  	retlen = strlen(kdb_buffer);
>  	cp = (char *) printk_skip_headers(kdb_buffer);
> -	if (!dbg_kdb_mode && kgdb_connected) {
> +	if (!dbg_kdb_mode && kgdb_connected)
>  		gdbstub_msg_write(cp, retlen - (cp - kdb_buffer));
> -	} else {
> -		if (dbg_io_ops && !dbg_io_ops->is_console) {
> -			len = retlen - (cp - kdb_buffer);
> -			cp2 = cp;
> -			while (len--) {
> -				dbg_io_ops->write_char(*cp2);
> -				cp2++;
> -			}
> -		}
> -		for_each_console(c) {
> -			c->write(c, cp, retlen - (cp - kdb_buffer));
> -			touch_nmi_watchdog();
> -		}
> -	}
> +	else
> +		kdb_msg_write(cp, retlen - (cp - kdb_buffer));
> +
>  	if (logging) {
>  		saved_loglevel = console_loglevel;
>  		console_loglevel = CONSOLE_LOGLEVEL_SILENT;
> @@ -751,19 +766,7 @@ int vkdb_printf(enum kdb_msgsrc src, const char *fmt, va_list ap)
>  			moreprompt = "more> ";
>  
>  		kdb_input_flush();
> -
> -		if (dbg_io_ops && !dbg_io_ops->is_console) {
> -			len = strlen(moreprompt);
> -			cp = moreprompt;
> -			while (len--) {
> -				dbg_io_ops->write_char(*cp);
> -				cp++;
> -			}
> -		}
> -		for_each_console(c) {
> -			c->write(c, moreprompt, strlen(moreprompt));
> -			touch_nmi_watchdog();
> -		}
> +		kdb_msg_write(moreprompt, strlen(moreprompt));
>  
>  		if (logging)
>  			printk("%s", moreprompt);
> -- 
> 2.7.4
> 


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
