Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D1F33EE8C
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 17 Mar 2021 11:45:10 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1lMTfp-0007a2-HG
	for lists+kgdb-bugreport@lfdr.de; Wed, 17 Mar 2021 10:45:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1lMTfn-0007Zn-CM
 for kgdb-bugreport@lists.sourceforge.net; Wed, 17 Mar 2021 10:45:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DaFywpidnCeh4zxx7OmWpLHe6NVtXGuPwtwc5Xq6dkI=; b=VU3wgT6YdK/PQVZWGVDCxsMGjN
 JXTJkwW2Mq4SQJg9CwAPr2kJ8ADOb7UxWDHjT5ptHA0l1YGSeaUb7pJpsZGVlDnm89sj79MPJP4TX
 lys7NgL/CFCZFOmwi+EG9GW+7cz/lcYAenNS1JJAyKVKjnhlcZSfUbll6yIFZLQTpVog=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DaFywpidnCeh4zxx7OmWpLHe6NVtXGuPwtwc5Xq6dkI=; b=OZUnYvf2ZKpIoFqf09z10qUC7/
 UZzVqX+vo0Ru1mL1gypU45igxvZdBY6N5TFwAklzAI5BfyJTGOvWU/c8VXCqyKn6pxU5lOCSGP6HJ
 wtUOQc5QL7CWximCC/WWssaq6koGrlk8ytIDDvYq+jvEBe+lwnfh19NDflpQgcB6VSJw=;
Received: from mail-lj1-f178.google.com ([209.85.208.178])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1lMTfi-00077n-1H
 for kgdb-bugreport@lists.sourceforge.net; Wed, 17 Mar 2021 10:45:07 +0000
Received: by mail-lj1-f178.google.com with SMTP id f16so2556794ljm.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 17 Mar 2021 03:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=DaFywpidnCeh4zxx7OmWpLHe6NVtXGuPwtwc5Xq6dkI=;
 b=St/h20aal60N0VZslFwCKJLMFrjF7wFDi3hxNyw+iIAbqz3oJNNOgH73zIOo+4oxE0
 EvGiBP0BYh+O+1qZ4ZF+gn062fhHPTtU0cKqxkDPKjAxyCpyar/77hO03QqdQOsgg/fd
 3d87b6xINHBwtaMSGl4KQzpPX3QnDzCf2V/1UhYRj/ZGtsVLHT8chU54aJZAO3JOQSds
 HlcUCxIMdUktyTvQuotR1Y4Y5xew3CbTSzELl0Rg9nyl7K90UqYmYG0hjtEGnnQaiipZ
 HtBXdWcxRqDjsPPV7ShN3udFdENa3D3kexeAtIs9v9FzrbRS2uIlx/m8l8WJTeB+s4Gs
 kbHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DaFywpidnCeh4zxx7OmWpLHe6NVtXGuPwtwc5Xq6dkI=;
 b=FBqpgvVpdoYOGVLdzDiGekVoaCMXT/zJqDbBaGT8zzVP9pM657BY7gFyBN6EdBqguU
 gJpqdMv3c/vwbOAC3L9zFbLwzy+3VUWMroyc3eJk8877fbEspazBdTqssSKl4pbJKPX3
 6YSW/XzKPnXb7Hcg92ZsDXKAyhn6uUTgKfS4tyMXHjqSMUAgRPjUoosihWJvM3BpItsj
 5yB2ygKHtMRlN+KFMSp4N+PB7Gq3OXe5qC3uZTlXAWenNKpP+Xo7ty+YW+Xd6KH2gYSx
 nIdmIetTAxhKguW1U/Fk7OX82oMI8yLaDGZcUDCsEzOVVSnWjcKkLS3Qw6sP3Q6nWhUN
 JTAw==
X-Gm-Message-State: AOAM530t+GSgRVZoDfZWI0u/W/suynPPeLc+aDbstGncqZf7YeznOaAT
 XKRIay+B/C9Uogi2r4QLAakRSr9rwKtGXnmC
X-Google-Smtp-Source: ABdhPJzNiUEFO/BpO//rhasAV4B2Hv3Idb2Z3PDPhSRZ3vHuspefsfqRaBmVQREczHqSl4XDALHJeg==
X-Received: by 2002:a17:906:12db:: with SMTP id
 l27mr34065389ejb.500.1615977400829; 
 Wed, 17 Mar 2021 03:36:40 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id f19sm12262260edu.12.2021.03.17.03.36.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 03:36:40 -0700 (PDT)
Date: Wed, 17 Mar 2021 10:36:38 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Bhaskar Chowdhury <unixbhaskar@gmail.com>
Message-ID: <20210317103638.sw4wqq4p4hg7dhco@maple.lan>
References: <20210317091022.347258-1-unixbhaskar@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210317091022.347258-1-unixbhaskar@gmail.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.178 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.178 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1lMTfi-00077n-1H
Subject: Re: [Kgdb-bugreport] [PATCH] kernel: debug: Ordinary typo fixes in
 the file gdbstub.c
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
Cc: kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 jason.wessel@windriver.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Wed, Mar 17, 2021 at 02:40:22PM +0530, Bhaskar Chowdhury wrote:
> 
> s/'O'utput/'Output/
> s/overwitten/overwritten/
> s/procesing/processing/
> 
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
> ---
>  kernel/debug/gdbstub.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/kernel/debug/gdbstub.c b/kernel/debug/gdbstub.c
> index e149a0ac9e9e..5c96590725f1 100644
> --- a/kernel/debug/gdbstub.c
> +++ b/kernel/debug/gdbstub.c
> @@ -204,7 +204,7 @@ void gdbstub_msg_write(const char *s, int len)
>  	if (len == 0)
>  		len = strlen(s);
> 
> -	/* 'O'utput */
> +	/* 'Output */

This is not a typo.

It is showing that the 'O' being writing into the message buffer is a
mnemonic and describing what it expands to.

Other changes look good, please can you resend with this one removed?


Daniel.


>  	gdbmsgbuf[0] = 'O';
> 
>  	/* Fill and send buffers... */
> @@ -321,7 +321,7 @@ int kgdb_hex2long(char **ptr, unsigned long *long_val)
>  /*
>   * Copy the binary array pointed to by buf into mem.  Fix $, #, and
>   * 0x7d escaped with 0x7d. Return -EFAULT on failure or 0 on success.
> - * The input buf is overwitten with the result to write to mem.
> + * The input buf is overwritten with the result to write to mem.
>   */
>  static int kgdb_ebin2mem(char *buf, char *mem, int count)
>  {
> @@ -952,7 +952,7 @@ static int gdb_cmd_exception_pass(struct kgdb_state *ks)
>  }
> 
>  /*
> - * This function performs all gdbserial command procesing
> + * This function performs all gdbserial command processing
>   */
>  int gdb_serial_stub(struct kgdb_state *ks)
>  {
> --
> 2.30.2
> 


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
