Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5285F14F0FF
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 31 Jan 2020 18:01:17 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1ixZfQ-0004FI-4v
	for lists+kgdb-bugreport@lfdr.de; Fri, 31 Jan 2020 17:01:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1ixZfO-0004Ez-PP
 for kgdb-bugreport@lists.sourceforge.net; Fri, 31 Jan 2020 17:01:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AX+Stoo32gMWwyifE5JONfx++iU4SnwDLz4NN+dPlIo=; b=J7YcDnqx+oz3QZGmuHLvxfoeye
 9/G5HW+d1mqvM/0aTQntC3a74M++f1sfHRsiSVHfdISAZyf80MD4egrYa/5WSsdEsegwDre7bDPzT
 fR1VFO1XR7ff3QKm2qgvcaAKgD/Tu+NKuScZGFstQO2VPrr1pTrV3nuAnB6/LdypEW/c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AX+Stoo32gMWwyifE5JONfx++iU4SnwDLz4NN+dPlIo=; b=Zaj0ENKB/A76FrAO3+vLb4zz6K
 jvZaHGBZhXv8jVswZpvFrcp9Rmm+neALwmZmVx2DadtV5geG5DCItu1WQqRYREIIMDnmqOZ7qHtBy
 IcPR7hnmIrjSjMBaUWoQWd/quzDFCZrx7vKKckN+v4X/pgbqG7xaI240PT70papDyMck=;
Received: from mail-wm1-f65.google.com ([209.85.128.65])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1ixZfK-00CHMy-FQ
 for kgdb-bugreport@lists.sourceforge.net; Fri, 31 Jan 2020 17:01:14 +0000
Received: by mail-wm1-f65.google.com with SMTP id p17so9527955wma.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 31 Jan 2020 09:01:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=AX+Stoo32gMWwyifE5JONfx++iU4SnwDLz4NN+dPlIo=;
 b=re5ejHSNML/rK9qA56QTC009nNz/VmKwsOkNkf7FFmN2zit4i3WAJ/XQeCggffr2hY
 yhGvXpY014nBIgPsPBfwowA/oGaTTJ+PFP+YOip8lDxldG8N5ap4pTzSQExDSnNRCMXK
 Al/6UhJlDnVIlI6l3JAegj0qQryDZqCZT3kgRnFUzMtW2UMfozijaXSii3pqZqFhEFDo
 mFRp2HTo/wQEAWZP8JRM4bHc3hqFFSGL3d+ziUwEafagCzz4vI/GIWEq+636EjyNJXyb
 5JomjoB9Vhw8lW91zZxisVbRozh0aX/o3anwiYjvuWKyE+0IqBOXb4vyw92n5ChXHmBZ
 Dv+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=AX+Stoo32gMWwyifE5JONfx++iU4SnwDLz4NN+dPlIo=;
 b=XGc6hrHRwgoGFNdA8gfE4bUZ17U9djnYJKrSidhKISNO5ThHvQ+emEm8DxJ/n5DF3l
 ZPc2nKcdk9UP3goPT2l9KV32L2bLnzr6LJxi0GidPSGdGBhOE+cwckpge8WVerRk+bpf
 3IfeUM5+vlFcFkEZUFkddt98HxUTE8B2WZCK0/bkRMyJOFkeoEzjXRLcAPgwvHN96FX3
 0Pci/VrlcG1CqK0bhzBLoI7j4K8rhnJoazv0ehMu39JoTRGh2OQw6+sEcMFr/OPKZ7qP
 zGAqla6QcFdpNaiDa56CWyNMlQtcEU0KkAgBh7+JBjdzLGj1LUMKzBL9mmRENFkcsVae
 doHw==
X-Gm-Message-State: APjAAAWB/L7l2Pt7o5LAU0auAxdHh7uf3jlimT/RFTQt1gF9/6ZpcBOH
 bPPAIZAbswFk+7ZBqhzKDYzDyw==
X-Google-Smtp-Source: APXvYqy1CAKfYEEhKGiHPcnFfXiufrbyb/HqRVC8rm5R+aHZkPH2rAdRbJ829UdYzYGCm2by9d1AeQ==
X-Received: by 2002:a1c:9c87:: with SMTP id f129mr13602350wme.26.1580490063549; 
 Fri, 31 Jan 2020 09:01:03 -0800 (PST)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id g21sm11587709wmh.17.2020.01.31.09.01.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jan 2020 09:01:02 -0800 (PST)
Date: Fri, 31 Jan 2020 17:01:01 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Message-ID: <20200131170101.zjhu2xilrpm6wotz@holly.lan>
References: <20200124161132.65519-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200124161132.65519-1-andriy.shevchenko@linux.intel.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.65 listed in wl.mailspike.net]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.65 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1ixZfK-00CHMy-FQ
Subject: Re: [Kgdb-bugreport] [PATCH v1] kgdboc: Use for_each_console()
 helper
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
Cc: kgdb-bugreport@lists.sourceforge.net,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-serial@vger.kernel.org,
 Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Fri, Jan 24, 2020 at 06:11:32PM +0200, Andy Shevchenko wrote:
> Replace open coded single-linked list iteration loop with for_each_console()
> helper in use.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Daniel Thompson <daniel.thompson@linaro.org>

> ---
>  drivers/tty/serial/kgdboc.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/tty/serial/kgdboc.c b/drivers/tty/serial/kgdboc.c
> index c7d51b51898f..c9f94fa82be4 100644
> --- a/drivers/tty/serial/kgdboc.c
> +++ b/drivers/tty/serial/kgdboc.c
> @@ -169,15 +169,13 @@ static int configure_kgdboc(void)
>  	if (!p)
>  		goto noconfig;
>  
> -	cons = console_drivers;
> -	while (cons) {
> +	for_each_console(cons) {
>  		int idx;
>  		if (cons->device && cons->device(cons, &idx) == p &&
>  		    idx == tty_line) {
>  			kgdboc_io_ops.is_console = 1;
>  			break;
>  		}
> -		cons = cons->next;
>  	}
>  
>  	kgdb_tty_driver = p;
> -- 
> 2.24.1
> 


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
