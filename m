Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C57B28E9B2
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 15 Oct 2020 03:16:56 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kSrt1-0000Bp-9C
	for lists+kgdb-bugreport@lfdr.de; Thu, 15 Oct 2020 01:16:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <msys.mizuma@gmail.com>) id 1kSrsz-0000Bh-7Z
 for kgdb-bugreport@lists.sourceforge.net; Thu, 15 Oct 2020 01:16:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=f+VQm+GCd77gKfnBI0U0A6ACRKwOlvYFJHxUn4tNp/4=; b=GA/POyn0LFzmUplm37b1/YGXCd
 neCU6gSlgu3nGg6y2gl30q2Tb5D8qLQUeXsa2M2TWGuid3mkE+FV0yqYWXMohUP5XZ4xPOFw+G0N5
 QpUxkGAiHRUq5j5lgywIiVjFQnkVqUJIW9dPAg89AL1xC5VPuEBOWXF+YaPDfnOAbTcI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=f+VQm+GCd77gKfnBI0U0A6ACRKwOlvYFJHxUn4tNp/4=; b=Tq3qHZdPZsDbW4Wkw2I3DNwrvU
 CRiS2NYy7KIQVCUd5wg+wtVZ4J1EafV3ViRduv4Xm+yjxe9AGpptSoo8P0nyEzNXad27lFVQLrhe7
 EyczdzV706i3CFxGZkl6dK+ZBagNkVQuNs6CpgXVxoChk/PhRQLPbSbSTtd+xV2LAzoo=;
Received: from mail-il1-f193.google.com ([209.85.166.193])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kSrss-00G0VF-Tt
 for kgdb-bugreport@lists.sourceforge.net; Thu, 15 Oct 2020 01:16:53 +0000
Received: by mail-il1-f193.google.com with SMTP id j8so2272795ilk.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 14 Oct 2020 18:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=f+VQm+GCd77gKfnBI0U0A6ACRKwOlvYFJHxUn4tNp/4=;
 b=P9ulBwKRoZlgh0HWFIhUvODejuLfpzxhsEIQzmYOFGtAxJJ4Ux85/rE9uWQNAtDXsA
 /+PKDXt/tdp3KUU7NvURom0vbscyaZgfGd5GjWTfDxW3hD5wjFiKmFhDs79+qU0H1EpA
 IEALnopRBia8fscwf2YDtcf1BxEIidP8sWtYEns/ZPafDXuZRGIunQ3f0uJgrpsCKl7g
 YOyWtHXVm9suoFAoUNzJWcZhRp5k0sl0rvdRWzlbx0cqriecFsho6CQjCrwNyUtu3iRY
 by3FUBjV9qnpRUJBpZd0jkglfKnZUpmCH8d/0NZsa699HI9GdH4l/qgN1haCjDP4ufRx
 QgHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=f+VQm+GCd77gKfnBI0U0A6ACRKwOlvYFJHxUn4tNp/4=;
 b=rJeZlQ0XYtISBSFsfs43TQ8uuglrdkNdVE2m+Oeqmgy4Z4b6P6wAXPdojKLdXmMLb6
 x5BjMiQf6YrjkkBE4HPAVfDr8LTeqxDAF4ulJvNOy+TrpIdG3LCtAGLEX/PvjYad4vIS
 9ZvaPwcEGAxPAF3hA3Sc4ZemnXQZM0DAVz7MYU8r/Ak9Z9y4sZwwI5kIPacwohNigNNc
 tiTXtRYkdIQb/25/15WvEGF2BDQdN0qjt5iv/5QVwnHQc3EMzioQ1DFniewVHlES0/o7
 e2bSn7xkr1Vz6wtWzok6dRumKGS0451ayKv9BfApjENV3LiaPT+Ujgy/Hay/8bKLwI8c
 VvPA==
X-Gm-Message-State: AOAM5335oklk+LIp/670aUerrEzAnCR482eTLU8zHWk3gvd8O35msvST
 UcGmFwlG4ky2cuB+Kiq1Xw==
X-Google-Smtp-Source: ABdhPJyrkoYD5xp/FDUz6oQftni3lYBv91fg4w/zk0ULRzN1QsQsl2aY6epo9iDiUgJNopfjmHkkzg==
X-Received: by 2002:a05:6e02:1073:: with SMTP id
 q19mr1411357ilj.55.1602724601411; 
 Wed, 14 Oct 2020 18:16:41 -0700 (PDT)
Received: from gabell
 (209-6-122-159.s2973.c3-0.arl-cbr1.sbo-arl.ma.cable.rcncustomer.com.
 [209.6.122.159])
 by smtp.gmail.com with ESMTPSA id v18sm1079595ilj.12.2020.10.14.18.16.36
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 14 Oct 2020 18:16:37 -0700 (PDT)
Date: Wed, 14 Oct 2020 21:16:34 -0400
From: Masayoshi Mizuma <msys.mizuma@gmail.com>
To: Sumit Garg <sumit.garg@linaro.org>
Message-ID: <20201015011634.zz2tnbc7yvhzxddc@gabell>
References: <1602673931-28782-1-git-send-email-sumit.garg@linaro.org>
 <1602673931-28782-4-git-send-email-sumit.garg@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1602673931-28782-4-git-send-email-sumit.garg@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (msys.mizuma[at]gmail.com)
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.166.193 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.193 listed in wl.mailspike.net]
X-Headers-End: 1kSrss-00G0VF-Tt
Subject: Re: [Kgdb-bugreport] [PATCH v5 3/5] arm64: smp: Allocate and setup
 IPI as NMI
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
Cc: mark.rutland@arm.com, daniel.thompson@linaro.org, ito-yuichi@fujitsu.com,
 jason@lakedaemon.net, maz@kernel.org, jason.wessel@windriver.com,
 linux-kernel@vger.kernel.org, julien.thierry.kdev@gmail.com,
 catalin.marinas@arm.com, kgdb-bugreport@lists.sourceforge.net,
 tglx@linutronix.de, will@kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Wed, Oct 14, 2020 at 04:42:09PM +0530, Sumit Garg wrote:
> Allocate an unused IPI that can be turned as NMI using ipi_nmi framework.
> Also, invoke corresponding NMI setup/teardown APIs.
> 
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> ---
>  arch/arm64/kernel/smp.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
> index 82e75fc..129ebfb 100644
> --- a/arch/arm64/kernel/smp.c
> +++ b/arch/arm64/kernel/smp.c
> @@ -43,6 +43,7 @@
>  #include <asm/daifflags.h>
>  #include <asm/kvm_mmu.h>
>  #include <asm/mmu_context.h>
> +#include <asm/nmi.h>
>  #include <asm/numa.h>
>  #include <asm/processor.h>
>  #include <asm/smp_plat.h>
> @@ -962,6 +963,8 @@ static void ipi_setup(int cpu)
>  
>  	for (i = 0; i < nr_ipi; i++)
>  		enable_percpu_irq(ipi_irq_base + i, 0);
> +
> +	ipi_nmi_setup(cpu);
>  }
>  
>  #ifdef CONFIG_HOTPLUG_CPU
> @@ -974,6 +977,8 @@ static void ipi_teardown(int cpu)
>  
>  	for (i = 0; i < nr_ipi; i++)
>  		disable_percpu_irq(ipi_irq_base + i);
> +
> +	ipi_nmi_teardown(cpu);
>  }
>  #endif
>  
> @@ -995,6 +1000,9 @@ void __init set_smp_ipi_range(int ipi_base, int n)
>  		irq_set_status_flags(ipi_base + i, IRQ_HIDDEN);
>  	}
>  
> +	if (n > nr_ipi)
> +		set_smp_ipi_nmi(ipi_base + nr_ipi);
> +
>  	ipi_irq_base = ipi_base;
>  
>  	/* Setup the boot CPU immediately */
> -- 

Looks good to me. Please feel free to add:

        Reviewed-by: Masayoshi Mizuma <m.mizuma@jp.fujitsu.com>

Thanks!
Masa



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
