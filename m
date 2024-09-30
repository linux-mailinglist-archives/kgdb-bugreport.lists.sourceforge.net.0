Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CCCA989EF4
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 30 Sep 2024 11:58:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1svDB2-0005zf-4F
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 30 Sep 2024 09:58:48 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daniel.thompson@linaro.org>) id 1svDB0-0005zT-Mu
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 30 Sep 2024 09:58:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WrSgKLXv963s8mVz9r3Q+1HNhsVnqhk2fQcNtk3Cxfo=; b=CFW3z+mpBxd/q15+ziBDOaYp+B
 lx/sc+Sd5kOZ5ySd/qv6QdMp38mMPdLRrQB8PXs03Hv7BQivothuH2GmFgog6tGWQoVr99FPjFhNO
 HglJaNJCmegN11a8CuXVB2Wl2+YKTAG1oo5ALddLg1Ct1xMdgujalm3xff/E3euPOP1M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WrSgKLXv963s8mVz9r3Q+1HNhsVnqhk2fQcNtk3Cxfo=; b=Y4ssTKtMz/flESwrHfvyEmcCEF
 IyRaKTafW51ZNDScL2NhYQIcH7iqDQR5O0Mz2F8teD1ezFYfjoQtJGpH+7sth0SJ1As734o5wZznf
 YKwa6r50d/PMNsmi9FfLJoFUHwQXe+7TCEhVU7xsxAzDMc1dDfp/0XtHWW5HQVzPgykU=;
Received: from mail-ej1-f50.google.com ([209.85.218.50])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1svDB0-0003s6-0j for kgdb-bugreport@lists.sourceforge.net;
 Mon, 30 Sep 2024 09:58:46 +0000
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-a8ce5db8668so741276566b.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 30 Sep 2024 02:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727690314; x=1728295114; darn=lists.sourceforge.net;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=WrSgKLXv963s8mVz9r3Q+1HNhsVnqhk2fQcNtk3Cxfo=;
 b=QGQn3Jn68/iziX0CJRzMeDOqlEHbR9C46UBU0qNqpbkg9/jK1jBKRR4c/k+bJMb8dK
 0HfAToAlmdcvpGFUpF4TO/+yIRtt2q3Up49r9Tx8utB0bdRd9ayF+YF+oBkmggJXuSua
 wCcBd489XkoHgf68R95dryVJ8qnUq6StfnsjGwoimOKNTmQZxyT1XULsJfsDvqt+xHeS
 +JuBcOZeyq5Isqmee/AQmQ0CxJm4+9RdSspxGlP+3rwbVXwCwooE1Eb8ui5KNUZU657G
 HO9q2m0bVXWCcJ2Y+v6cUz+B0T6Vslm0mklc5y3vWB5xm3DKRYy3ouMnKzWQcgMk78w7
 b8GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727690314; x=1728295114;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WrSgKLXv963s8mVz9r3Q+1HNhsVnqhk2fQcNtk3Cxfo=;
 b=xU68mDeKWZ7ghBYxKo6eZiliVHhXVRTQVPQggebbpjig4/z0AJlrQRYBxR4GYygnpc
 zgbr1gL+fgTrUBL4HlD2jrEuqL9VakLvc/FPjcWnUIvUtA8iIVNm7XucbmOBvEJIKdDP
 09ej6SciXITT9JSZi+XEvHJtibCbMrxqUzwpt0jLt2nptx5NA+83+4VhpEX7JL7E93C9
 voNGTINiRD7/xXu/a6Dyu5EvnIfN9ntc7f2LD6EXdky8xeTWnrgoOtgMCPIIAaC1OD3g
 HhD8WnHkoQLt2cc0DJk89O2gQmkIwjWR8eFNSt+BBvlF5moDci+0CKrQS5mJyv8ekx9c
 sRJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvwMsHPEbl1cHchmhCV0PESUF3MdwyPPHZlftAyYsuO703gwRK3tvY0jqEuZoBniwEB4/TqU7MoPt7dEaEnA==@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwauSV653YJ+hdZfo79Jz5WueKaBOc0O7ixTCIgsowUwIPbPHOL
 IQym+XBQjHMxcwtKXAJr1wBS9d+9LQPFbXpsvsJQeE3PKGnSYEI9+HvACA+rFPS5Hf5zHWNDriB
 uutc=
X-Google-Smtp-Source: AGHT+IEkKrPJsUlHoyTMQaqjzeMWolJl4XDm5NPQqsWGGZyTSTe4MBnX5SWsdMBYeKWeft0bEIk64Q==
X-Received: by 2002:a17:906:f59e:b0:a86:79a2:ab12 with SMTP id
 a640c23a62f3a-a93c492a75amr1205266666b.38.1727688549160; 
 Mon, 30 Sep 2024 02:29:09 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c2997d41sm501776866b.194.2024.09.30.02.29.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Sep 2024 02:29:08 -0700 (PDT)
Date: Mon, 30 Sep 2024 10:29:07 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Message-ID: <20240930092907.GD5584@aspen.lan>
References: <20240925100742.1730576-1-changhuang.liang@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240925100742.1730576-1-changhuang.liang@starfivetech.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Sep 25, 2024 at 03:07:42AM -0700, Changhuang Liang
 wrote: > Module kgdb had been converted to debug_core since commit
 c433820971ff
 > ("Move kernel/kgdb.c to kernel/debug/debug_core.c") be adde [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.218.50 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.218.50 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1svDB0-0003s6-0j
Subject: Re: [Kgdb-bugreport] [PATCH v3] Documentation: kgdb: Correct
 parameter error
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
Cc: Jonathan Corbet <corbet@lwn.net>, kgdb-bugreport@lists.sourceforge.net,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jason Wessel <jason.wessel@windriver.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Wed, Sep 25, 2024 at 03:07:42AM -0700, Changhuang Liang wrote:
> Module kgdb had been converted to debug_core since commit c433820971ff
> ("Move kernel/kgdb.c to kernel/debug/debug_core.c") be added, so let's
> correct the module parameter path.
>
> Fixes: c433820971ff ("Move kernel/kgdb.c to kernel/debug/debug_core.c")
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>

@Jon: Do you want me to hoover this up or will you take it? If you are
happy to grab it then feel free to treat my Rb: as an Acked-by: too!


Daniel.


> ---
>
> Hi,
>
> v3: I wrote a error change log in v2. Now fix it.
>
>  Documentation/dev-tools/kgdb.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/dev-tools/kgdb.rst b/Documentation/dev-tools/kgdb.rst
> index f83ba2601e55..a87a58e6509a 100644
> --- a/Documentation/dev-tools/kgdb.rst
> +++ b/Documentation/dev-tools/kgdb.rst
> @@ -329,7 +329,7 @@ ways to activate this feature.
>
>  2. Use sysfs before configuring an I/O driver::
>
> -	echo 1 > /sys/module/kgdb/parameters/kgdb_use_con
> +	echo 1 > /sys/module/debug_core/parameters/kgdb_use_con
>
>  .. note::
>
> --
> 2.25.1


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
