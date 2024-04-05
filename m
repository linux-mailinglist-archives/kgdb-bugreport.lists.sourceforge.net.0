Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 888498999DD
	for <lists+kgdb-bugreport@lfdr.de>; Fri,  5 Apr 2024 11:52:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1rsgEu-0005Fh-IK
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 05 Apr 2024 09:52:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daniel.thompson@linaro.org>) id 1rsgEq-0005Ey-N5
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 05 Apr 2024 09:52:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XznLbi2Z1SKvx8bRj0+Hw75ngrOt6iwbmtsVcIRJxZA=; b=OjVivDVceGN3I3ESyLCQ09B/46
 N/3vkQfIPGEl/bBGZHXFUxbqpUwEyypoYfEC+nPuGNdMv2J0yu/e+iG8hMe2eZd8GNuy93Rw9bMZB
 If5YgpbbqwitHGJy4fm3W8Hp4daCSyy31ExTzVchAqfEznvma+veC4U4a8jFAiDUrDIc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XznLbi2Z1SKvx8bRj0+Hw75ngrOt6iwbmtsVcIRJxZA=; b=X6gPKDTAwZagLNoGDKYalQqkwz
 1EAP+mAZlvjHJnnDudxEdXu467FBXed9GXshlZZOkAQ3jf2s8H/SZB60+A7WzQfjotX/9zI7Jp31h
 j9yMJ9hjRvny1Os5GKqS3alhjuCe7MvU2/6sskcqUwTS0nJhzTqp1tjKHDTIO7kDYyj0=;
Received: from mail-lf1-f52.google.com ([209.85.167.52])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rsgEo-0003lV-9i for kgdb-bugreport@lists.sourceforge.net;
 Fri, 05 Apr 2024 09:51:59 +0000
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-516d0c004b1so1741163e87.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 05 Apr 2024 02:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712310707; x=1712915507; darn=lists.sourceforge.net;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=XznLbi2Z1SKvx8bRj0+Hw75ngrOt6iwbmtsVcIRJxZA=;
 b=dZhlwGB52T1KtYS6VIy0AVB8gT/Qkvh9A6/M0AFfu/lTTaskNTmXx4R6DWdMxxTp9n
 QSM/51kvSil6dJj/ZgX16O6WEk7j1HK+aFwZbjGwfpZFuuTkYEIACvfPzIrW6p3yPwen
 1yjXIkd8k254SMIIll/vMPndHNaxd8vLIqyB8HQixNQ5c1hHi5qOQeYMRonUEgRgF2WU
 1E3h4Bjf419uN7jYMnl3jpq+0xYw72tcb+Z4h7uFGbA5SpqdpCA3HanpowbocwNe7Eoh
 4Ah3iwjw5gZPiOCnvGWxMmqyfN89+w4IEhksMQUZUZlr37I4gvfK0tzxH5voRlKwVT1H
 9N4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712310707; x=1712915507;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XznLbi2Z1SKvx8bRj0+Hw75ngrOt6iwbmtsVcIRJxZA=;
 b=mkyUn03Q6uuqkeaN2rektwc8UPlqeVuv8541wFgd6sSNf3Og+mIogoHMFI5quMenti
 bQcRQK72InoFlqfw4Qq2F8fTh0Nlc03dPqY7VwIjUQjDXLHqra8LMdK3IxyijzKkybQa
 dqrVsSxD96HKGNthzgRXiRhaNf+kWQBWKmlEQLKSCRt5AxclLF1KXUUHxohi7FzcAyTN
 hAE+8W0hts8h7y0rmT2UyvXKSIlVzgz3oUu0uu3QoFtyRQ7ZH38ZiVrlPfKYwQvZYGgd
 e0BfL66/bWb7m08RGYWsTuibfwgYLJVdUgAcwDLjm8pZ+rJm5HvlKWgQb2NpQdf4+857
 i+6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWiNsuLoZDq7Jh+DSfGyAyaHM4INd9/1Vn5xMqMcC5BeaqugJpaf0fXZj/qSbBceRVOm+KMAtdrMHptEX1zSmTZ4QTALTZIqMx8wzmXiC2GPhMSfCM=
X-Gm-Message-State: AOJu0Yx2VjATVfKo6U7Uf6S7ktaS73IVLabRwlPq8TThPvQTy71d/Wpk
 Om2Tl625TL2NE8LCSR1ehd1TxyJuarcoH6GZUHbiLbBiQ9lAigwSwDH2VAwATcc=
X-Google-Smtp-Source: AGHT+IFuRBcasfkE1HoHSCQ7OdWv+EtlpW9OQz09tguqfMAKrRd1NUyHNpjIOZuZmN0l9ZISYTgUFw==
X-Received: by 2002:ac2:5ddb:0:b0:516:d2eb:6edd with SMTP id
 x27-20020ac25ddb000000b00516d2eb6eddmr735020lfq.26.1712310706830; 
 Fri, 05 Apr 2024 02:51:46 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 e28-20020adfa45c000000b00343e1c3298asm1428854wra.0.2024.04.05.02.51.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Apr 2024 02:51:46 -0700 (PDT)
Date: Fri, 5 Apr 2024 10:51:44 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Justin Stitt <justinstitt@google.com>
Message-ID: <20240405095144.GB2890893@aspen.lan>
References: <20240405-strncpy-kernel-debug-kdb-kdb_io-c-v2-1-d0bf595ab301@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240405-strncpy-kernel-debug-kdb-kdb_io-c-v2-1-d0bf595ab301@google.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Apr 05, 2024 at 02:33:58AM +0000, Justin Stitt wrote:
 > We should move away from using strncpy because it is deprecated [1]. >
 > Since these buffers want to be NUL-terminated, let's use strscp [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.167.52 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.52 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1rsgEo-0003lV-9i
Subject: Re: [Kgdb-bugreport] [PATCH v2] kdb: replace deprecated strncpy
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

On Fri, Apr 05, 2024 at 02:33:58AM +0000, Justin Stitt wrote:
> We should move away from using strncpy because it is deprecated [1].
>
> Since these buffers want to be NUL-terminated, let's use strscpy() which
> guarantees this behavior.
>
> The code in question enables the visual autocomplete when using kdb tab
> completion. After pressing tab a couple times when sitting on a partial
> symbol it will attempt to fill it in.

FWIW the code that this patch changes is only executed when tab is
pressed once.


> In my testing, strscpy() provides
> the exact same autocomplete behavior that strncpy() provides here (i.e:
> it fills in the same number of characters for the user).
>
> You can confirm this by enabling kdb [3] and booting up the kernel. I
> performed my tests with qemu with this incantation (wow these get long):
>
> $ /usr/bin/qemu-system-x86_64 -display none -nodefaults -cpu Nehalem
> -append 'console=ttyS0,115200 earlycon=uart8250,io,0x3f8 rdinit=/bin/sh
> kgdboc=ttyS0,115200 nokaslr' -kernel $BUILD_DIR/arch/x86/boot/bzImage
> -initrd $REPOS/boot-utils/images/x86_64/rootfs.cpio -m 512m -serial
> mon:stdio
>
> ... then you can type some symbols and see that autocomplete still kicks
> in and performs exactly the same.
>
> For example:
> tes <tab><tab> gives you "test",
> then "test_ap" <tab><tab> gives you "test_aperfmperf"
>
> Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings [1]
> Link: https://github.com/KSPP/linux/issues/90 [2]
> Link: https://www.kernel.org/doc/html/v5.0/dev-tools/kgdb.html#using-kdb [3]
> Cc: linux-hardening@vger.kernel.org
> Signed-off-by: Justin Stitt <justinstitt@google.com>
> ---
> Changes in v2:
> - use strscpy over memcpy (thanks Daniel T.)
> - Link to v1: https://lore.kernel.org/r/20240403-strncpy-kernel-debug-kdb-kdb_io-c-v1-1-7f78a08e9ff4@google.com
> ---
> ---
>  kernel/debug/kdb/kdb_io.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
> index 9443bc63c5a2..60be22132020 100644
> --- a/kernel/debug/kdb/kdb_io.c
> +++ b/kernel/debug/kdb/kdb_io.c
> @@ -368,9 +368,9 @@ static char *kdb_read(char *buffer, size_t bufsize)
>  			kdb_printf("%s", buffer);
>  		} else if (tab != 2 && count > 0) {
>  			len_tmp = strlen(p_tmp);
> -			strncpy(p_tmp+len_tmp, cp, lastchar-cp+1);
> +			strscpy(p_tmp+len_tmp, cp, lastchar-cp+1);

This still looks like it is reproducing the obvious[1] error in
the original strncpy() call. The third argument does *not* provide the
number of characters in the destination buffer.

Just to be really clear, I think this patch and your original memcpy()
conversion is mechanically correct, in that the new code is equivalent
to the original strncpy(). The problem is that neither patch acts
on the warning signs that the original code is broken.


[1] I know that this code is hard to read so "obvious" is a relative
    term. However just looking at one line tells us that the source
    pointer is part of a two pointer calculation that purports to
    give the length of the destination string! Such code is almost
    always going to be wrong.


>  			len_tmp = strlen(p_tmp);
> -			strncpy(cp, p_tmp+len, len_tmp-len + 1);
> +			strscpy(cp, p_tmp+len, len_tmp-len + 1);

Again, I really don't think the third argument provides the number of
characters in the destination buffer.


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
