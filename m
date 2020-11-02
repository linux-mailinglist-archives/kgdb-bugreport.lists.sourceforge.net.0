Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E37872A2F8B
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  2 Nov 2020 17:19:32 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kZcYN-0003CC-N4
	for lists+kgdb-bugreport@lfdr.de; Mon, 02 Nov 2020 16:19:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <msys.mizuma@gmail.com>) id 1kZcYM-0003C5-0Y
 for kgdb-bugreport@lists.sourceforge.net; Mon, 02 Nov 2020 16:19:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0pEoN6nA2G5BwCWY5vt/4u6N5GAY+FHaERnVlmnWlFc=; b=f/d5+yLDxKtSjz+vz1yJO0lJLN
 K6bMMi5lNq8IWQt4x0L9jZKyblu22ULtOiKro2h2Dh73oq60DhPLdtO8i55gh+tNW/gTT32PatF9x
 LVUET3oMl61uvSyrwmKJcTjC46u8txgIyUHUiwQlMwM9yzW2QCeZhO6jcYVkyMLEgeps=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0pEoN6nA2G5BwCWY5vt/4u6N5GAY+FHaERnVlmnWlFc=; b=bBiBVyc1fk54nuHKu6pVvprkhV
 onMl+0SxRbBIjLM2tWt19lf1iKg+RPtHchDCw4ChGpjehbUcI/SFhnscyJCB2QXBFdVY984Rx9MJH
 R9Qq30esNx/uw2xDFSZuaLxABkTnHQAyVT7S0iqazMb+sdRhfbncdoBcB3RxYUDlGFl4=;
Received: from mail-qk1-f196.google.com ([209.85.222.196])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kZcY9-00GUsj-FZ
 for kgdb-bugreport@lists.sourceforge.net; Mon, 02 Nov 2020 16:19:29 +0000
Received: by mail-qk1-f196.google.com with SMTP id 12so8044375qkl.8
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 02 Nov 2020 08:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=0pEoN6nA2G5BwCWY5vt/4u6N5GAY+FHaERnVlmnWlFc=;
 b=ids55hsOUjO+6VoaZMpKbVpzBQuFZC5w5OP9fvCm26FtQUSlg1oYAQn422GCTSEuEz
 k8kDHldTdzq9aQ2bVpClvpY66jgz5jY1pmlieeryNEOSlEW3VPi5Kx1lSJGqKm2FAHP6
 GRAS04E0lisWteoPc9/HqspO+Z1Zq8hp6donW4pPpuSuEZJ7hSPRkKE+yhum9I0Cowmu
 U+zVWfYdkANcgFGNrrZIT1rcbbAsiLAyb7wGJpdPF/xy5PkagbT1VNoU+/xrPUBiM/Rm
 uV0WXNsuDmQvowgnMIl5xFbJQRwhIzdrzVO2cFxad7/+Gu57osydu5/NR9P1nP7dmhfw
 3efw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0pEoN6nA2G5BwCWY5vt/4u6N5GAY+FHaERnVlmnWlFc=;
 b=hczgXT2ZmjJiYw1WzSVBoldkcrXuss9MifQw9bVhRyzH61n3++50ip/hxutvouqhAT
 mExV6HHCXWo5gc3q4YOk8iVsRqVzDZKzhBB5OarI3USEXzzp0BRiz72Mu8osLfdkfBYw
 Wv2cqI4GvMaGM2Tj9bPP95oHKFXEFdpQRHLhCgKgOnpXyMcv4JdMHnnbYs+ssfv9zcQO
 jsiPU/Cj+WODcomFvgUFg/1JEmFQQr/C4lMe2SpdpEx/0fnISPKvNjbfa7zXylweAIXv
 H/Gx5D0Xg49bj8E/8jbv0y4vLYuRcFFfP8/eRRR08eqtqnLcGOz5k1YrIEaFQeLCrq4L
 PH/Q==
X-Gm-Message-State: AOAM5317kPWrDjOHNuMaeX66R9184QasncRJMLBM+qmNGL9hHUPN/1xU
 MELWcmx8Ml3sgyZ1YB37wA==
X-Google-Smtp-Source: ABdhPJw3/h/FxAUapjnE6hrGy28Ybn8PhKKPWyeveHzA/4XbaQbjZSNBF3IMSL5R1XYdsJoz3PG1wA==
X-Received: by 2002:a37:7f03:: with SMTP id a3mr15397645qkd.72.1604333951668; 
 Mon, 02 Nov 2020 08:19:11 -0800 (PST)
Received: from gabell
 (209-6-122-159.s2973.c3-0.arl-cbr1.sbo-arl.ma.cable.rcncustomer.com.
 [209.6.122.159])
 by smtp.gmail.com with ESMTPSA id r14sm5203206qtu.25.2020.11.02.08.19.10
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 02 Nov 2020 08:19:11 -0800 (PST)
Date: Mon, 2 Nov 2020 11:19:08 -0500
From: Masayoshi Mizuma <msys.mizuma@gmail.com>
To: Sumit Garg <sumit.garg@linaro.org>
Message-ID: <20201102161908.ayn7vff7tyduzlj2@gabell>
References: <1604317487-14543-1-git-send-email-sumit.garg@linaro.org>
 <1604317487-14543-4-git-send-email-sumit.garg@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1604317487-14543-4-git-send-email-sumit.garg@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.222.196 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (msys.mizuma[at]gmail.com)
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.196 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kZcY9-00GUsj-FZ
Subject: Re: [Kgdb-bugreport] [PATCH v7 3/7] arm64: smp: Assign and setup an
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
Cc: mark.rutland@arm.com, daniel.thompson@linaro.org, tsbogend@alpha.franken.de,
 linux-kernel@vger.kernel.org, jason@lakedaemon.net, ito-yuichi@fujitsu.com,
 maz@kernel.org, x86@kernel.org, linux@armlinux.org.uk,
 jason.wessel@windriver.com, mingo@redhat.com, bp@alien8.de, mpe@ellerman.id.au,
 catalin.marinas@arm.com, kgdb-bugreport@lists.sourceforge.net,
 tglx@linutronix.de, julien.thierry.kdev@gmail.com, will@kernel.org,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Mon, Nov 02, 2020 at 05:14:43PM +0530, Sumit Garg wrote:
> Assign an unused IPI which can be turned as NMI using ipi_nmi framework.
> Also, invoke corresponding dynamic IPI setup/teardown APIs.
> 
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> ---
>  arch/arm64/kernel/smp.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
> index 82e75fc..2e118e2 100644
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
> +	dynamic_ipi_setup(cpu);
>  }
>  
>  #ifdef CONFIG_HOTPLUG_CPU
> @@ -974,6 +977,8 @@ static void ipi_teardown(int cpu)
>  
>  	for (i = 0; i < nr_ipi; i++)
>  		disable_percpu_irq(ipi_irq_base + i);
> +
> +	dynamic_ipi_teardown(cpu);
>  }
>  #endif
>  
> @@ -995,6 +1000,9 @@ void __init set_smp_ipi_range(int ipi_base, int n)
>  		irq_set_status_flags(ipi_base + i, IRQ_HIDDEN);
>  	}
>  
> +	if (n > nr_ipi)
> +		set_smp_dynamic_ipi(ipi_base + nr_ipi);
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
