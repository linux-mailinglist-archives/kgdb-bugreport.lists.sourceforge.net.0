Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6347F896E23
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  3 Apr 2024 13:23:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1rryii-0006yc-SQ
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 03 Apr 2024 11:23:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daniel.thompson@linaro.org>) id 1rryig-0006yT-Sb
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 03 Apr 2024 11:23:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=c6hgwRkGrrS3Oweenekzl9fFYfPnVmMeLqWDsvPrY+Q=; b=D+CeJK0lb6GN8sFhCNWEOsTkRb
 9D9GLsFz8L7bxU12J7FYaoYZyHhSRlUIhUtSYvZGbHXmRUUsytfkzxuE3ruuooPXE0J/whfRuE6iV
 AkyCkPk/A5ESvfJWLe5U+TJGUr2DpBfjKf1F6haneIltWa+yvxUTlzHw+r/+CrhkG6+o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=c6hgwRkGrrS3Oweenekzl9fFYfPnVmMeLqWDsvPrY+Q=; b=nFOU0I7OcpN1Dl+4KtwzI+8h4x
 HRjQGBsMKtgl6QFdfT0ot+RSKU9QQsse0tbiOgqCFbTh4x8cfssecb5yfxGtjNaBIklNsMnVaqJq6
 7iIOE+z9B80II5g80C1FjXq8w1r2MOXi0v/AfG3q2Kf+CYo8SWk++4rhhXich9rqvg9k=;
Received: from mail-wr1-f44.google.com ([209.85.221.44])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rryic-0001mw-Ij for kgdb-bugreport@lists.sourceforge.net;
 Wed, 03 Apr 2024 11:23:55 +0000
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-343a5b667a8so86818f8f.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 03 Apr 2024 04:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712143419; x=1712748219; darn=lists.sourceforge.net;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=c6hgwRkGrrS3Oweenekzl9fFYfPnVmMeLqWDsvPrY+Q=;
 b=mqJjDQJiJxZ77cqda4usq98Vks6vCzxmLBVfH/82OqYYQJggoE7jkc9jxkZKNZKVWc
 lVPd7UsMMwJJL0YjVyHntn1uvtmtwU09/gsMsujzQQInZmqr6tlxzVetfKeO1ip+w8dQ
 jJhnqyvLygvEwLqmxeHOl69d6OZVigK7hlq7VjcC7pSm6GsnlZjcYlL0GdSsbRmEUpit
 J5g9nuQSeaZue01NCklpUep0kxjdItXG8mkfFC8Hf7cQqJpe75+JsFNs109vBH/pHWOl
 FpxcS4wuqpXpn4TEUzWQZlYfi1xZInSfxxwKBQGq/5mo6+42QujLwLNBCVlDTn9c16MH
 HT1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712143419; x=1712748219;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c6hgwRkGrrS3Oweenekzl9fFYfPnVmMeLqWDsvPrY+Q=;
 b=G3lkLHI4sRD1mlm0a+CzOlTHos0HByPq6khtSIMzc4MOBHT3R5NRzWGZTJqAlGGxUE
 Uq5UGWaGd2M9Q4wN5OkJkcRkesnkxQkRrD9plIHnz1ZdFPkqSo2eLKrL48TJhpmyCcf8
 sniKN+EsGa3Le0BclsyoADkKxx8+QQog6u3TpdHMI6IUti+qqLobWaads1Ltys4cfoCz
 nyHRQDlXZ2wZ2usJbtJDn5apCAxKHZQcpFN0MCKWqfrjCF4KD1m3tiAy1UUCUxaXW5x7
 0yT/vlqsq9YjKJ8+d4A0DZa+AukH6V6qyjgr0JvsQJG4K18UAGlDooQIz5nlE6ANaZg+
 hUsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/pdGqdMuaF3jJgjywpsKAkxIsyJndHuRlRrtZGQWoVly9b3KS0Z6Jbqa9np1DtR6ctdSr1zlg22/3BKTgAXq4JHjjRgmeFSD3Nx45BmjAF0kVacs=
X-Gm-Message-State: AOJu0Yyav5sXmscTvrzksDMpYZ7813BiwojU0xc5sjxJJkCnyy7WaMvD
 8Zr1pVdrNbFUqkhQObqH+LD5+fw0D3IlK399posW5jR5peEOBzT159igIHOOCCR87YG8qiyS8GM
 M
X-Google-Smtp-Source: AGHT+IHFWDpW0FUgymW8ITy3D3BYi7HZ6Y+HFH0zEcYWOyQNBbE0az1s+xAWdV24ThLFPPOYx/db0g==
X-Received: by 2002:a5d:678d:0:b0:343:2d43:2b00 with SMTP id
 v13-20020a5d678d000000b003432d432b00mr9887182wru.62.1712143419223; 
 Wed, 03 Apr 2024 04:23:39 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 o18-20020adfca12000000b0033ec81ec4aesm17057586wrh.78.2024.04.03.04.23.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Apr 2024 04:23:38 -0700 (PDT)
Date: Wed, 3 Apr 2024 12:23:36 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Justin Stitt <justinstitt@google.com>
Message-ID: <20240403112336.GD25200@aspen.lan>
References: <20240403-strncpy-kernel-debug-kdb-kdb_io-c-v1-1-7f78a08e9ff4@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240403-strncpy-kernel-debug-kdb-kdb_io-c-v1-1-7f78a08e9ff4@google.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Apr 03, 2024 at 12:52:36AM +0000, Justin Stitt wrote:
 > All the other cases in this big switch statement use memcpy or other >
 methods for copying string data. Since the lengths are handled ma [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.44 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.221.44 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1rryic-0001mw-Ij
Subject: Re: [Kgdb-bugreport] [PATCH] kdb: replace deprecated strncpy
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
Cc: kgdb-bugreport@lists.sourceforge.net, linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Wed, Apr 03, 2024 at 12:52:36AM +0000, Justin Stitt wrote:
> All the other cases in this big switch statement use memcpy or other
> methods for copying string data. Since the lengths are handled manually
> and carefully, using strncpy() is may be misleading. It doesn't
> guarantee any sort of NUL-termination on its destination buffer. At any
> rate, it's deprecated [1] and we want to remove all its uses [2].
>
> Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings [1]
> Link: https://github.com/KSPP/linux/issues/90 [2]
> Cc: linux-hardening@vger.kernel.org
> Signed-off-by: Justin Stitt <justinstitt@google.com>
> ---
> Note: build-tested only.
>
> Found with: $ rg "strncpy\("
> ---
>  kernel/debug/kdb/kdb_io.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
> index 9443bc63c5a2..8bba77b4a39c 100644
> --- a/kernel/debug/kdb/kdb_io.c
> +++ b/kernel/debug/kdb/kdb_io.c
> @@ -368,9 +368,9 @@ static char *kdb_read(char *buffer, size_t bufsize)
>  			kdb_printf("%s", buffer);
>  		} else if (tab != 2 && count > 0) {
>  			len_tmp = strlen(p_tmp);
> -			strncpy(p_tmp+len_tmp, cp, lastchar-cp+1);
> +			memcpy(p_tmp+len_tmp, cp, lastchar-cp+1);

The strncpy() here is obviously wrong because it passes the size of the
source not the destination.

For that reason I'm not clear that memcpy() is the correct approach
here. It's probably not more wrong than what was there before but,
as mentioned, what was there before is already obviously wrong that
should provoke a bit of code review ;-) .

In particular are you sure lastchar-cp+1 can never larger than
buf_size-len_tmp (which is what I think is the remaining space
at p_tmp+len_tmp)?


>  			len_tmp = strlen(p_tmp);
> -			strncpy(cp, p_tmp+len, len_tmp-len + 1);
> +			memcpy(cp, p_tmp+len, len_tmp-len + 1);

Roughly the same question here. The original coded is obviously wrong
so trusting it did the boundary checks properly seems unwise.

Are you sure it is OK to make this copy with checking against bufend?


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
