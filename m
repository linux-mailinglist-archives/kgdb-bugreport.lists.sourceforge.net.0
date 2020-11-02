Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF612A2FA0
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  2 Nov 2020 17:21:25 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kZcaC-0005Yj-CP
	for lists+kgdb-bugreport@lfdr.de; Mon, 02 Nov 2020 16:21:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <msys.mizuma@gmail.com>) id 1kZcaA-0005Yb-Sv
 for kgdb-bugreport@lists.sourceforge.net; Mon, 02 Nov 2020 16:21:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2Lpr4CBLha20HQqxlhXNSA8BtMmymsEInJVoKBpe5r0=; b=HNirP8sVo/gx/33eO2HKKfjGgK
 ZSuqHh5ingKM1DwtiAR5xz67H79tTDj9Z09SsrCPa5toC1EfutYKvMOSn3K2qtVsTlQaaA4Fjsy9f
 ZxBDirzC3Ts2ahYq99XdPxuoWga3mSeLVMbFtsHN6QhN0JR4KQyhTz/5FiFUpd8Fm9AQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2Lpr4CBLha20HQqxlhXNSA8BtMmymsEInJVoKBpe5r0=; b=Qh5BQ5C/YAYEXSi3Gda0BwQoPS
 I2WsCmjjkzwSdxNPAzOKACAjo57ZvnC8ys5gvFGVbZiOatBE5rwEr61/REeaV7fPWmmZSqV909vHc
 jZQMn5gxW2YjceGBZWLKZd6BhAUcBhMRA+HsynGQ6J3Y850nkgs6hRkeFQCgoh2FwbZ4=;
Received: from mail-qk1-f196.google.com ([209.85.222.196])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kZca6-00GUzJ-LF
 for kgdb-bugreport@lists.sourceforge.net; Mon, 02 Nov 2020 16:21:22 +0000
Received: by mail-qk1-f196.google.com with SMTP id x20so11976529qkn.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 02 Nov 2020 08:21:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=2Lpr4CBLha20HQqxlhXNSA8BtMmymsEInJVoKBpe5r0=;
 b=jiNIyQ/3PFCSdLX6ugfJegoJfHHnVBTjhaw81/66xW0rZL3RjMbV7RgPF7572ECozM
 u2/cQEMXeCTptr+OQ+oJxCEy63cRiG3E6LfpGQ212ge6VOpQllkh28hXirv+8g34+2us
 bLi0V71XOcL50R2UO/mhjwp+RdwSG0LR5GoTAUdGQQNrvL1Yc/U8Y+s4UUFUD/7WdbiT
 pykwiXMb50V/bbCfK+oRW0FPHJRw8Mui/Iip2JfaXep/9CFqFyVDDrQs2iNJploIkFUK
 pX5iIJp5Kwk8Kk3nOyxVD2s+IApkGSfYp7pIDbDBqWjrM2138/jJjZLZbQTcDRU98K5L
 kBtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2Lpr4CBLha20HQqxlhXNSA8BtMmymsEInJVoKBpe5r0=;
 b=rb9IYn8K46sXy86bYM0bx2Rbm12HV9xCQTr0k6NXGLh44ZGi7bZYG0jBz0VoPdjRQa
 w9zI7GzpaRrLwRrNJEWqZe6X8QfcypqxiJka/L8dtDfVMhP0w8n+D19HsquoyqCaFCaL
 YdQpaFRs/FOzQUGMAZA2vdqDhFDfDslSM7tgVI02Ejo7hybr9ZARMV4xKECL4kEzbSgF
 wRyMNEEeFuQZUc7xEXWVTdLCiD0dsBwTqZfr3S1yAiAIwjh388mRj8ZUK5B8pA2Ev/Te
 voL+KbF/wM5ikfqCNNXHOKp2PFoJiixf5Bfwvkr2LdCiXl1GxTe4K0wTefFsXKL6IEnL
 Sx2g==
X-Gm-Message-State: AOAM531KJq1znKtBgMCjS0X1Rb72bECVe6olzTphWRPR/jxXFJrLHYCJ
 3FoR4liQik4j07xdg82XYw==
X-Google-Smtp-Source: ABdhPJwwOFt8TQzK9DM2mazQemEZvdOg6ct13ts4qWeveZlNnq65HE/KB2TcMcsxEQCiLV9ocByz1w==
X-Received: by 2002:a37:7104:: with SMTP id m4mr15673359qkc.252.1604334072928; 
 Mon, 02 Nov 2020 08:21:12 -0800 (PST)
Received: from gabell
 (209-6-122-159.s2973.c3-0.arl-cbr1.sbo-arl.ma.cable.rcncustomer.com.
 [209.6.122.159])
 by smtp.gmail.com with ESMTPSA id t8sm8466845qtb.97.2020.11.02.08.21.11
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 02 Nov 2020 08:21:12 -0800 (PST)
Date: Mon, 2 Nov 2020 11:21:10 -0500
From: Masayoshi Mizuma <msys.mizuma@gmail.com>
To: Sumit Garg <sumit.garg@linaro.org>
Message-ID: <20201102162110.vmedu2g63yvdwh7m@gabell>
References: <1604317487-14543-1-git-send-email-sumit.garg@linaro.org>
 <1604317487-14543-6-git-send-email-sumit.garg@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1604317487-14543-6-git-send-email-sumit.garg@linaro.org>
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
X-Headers-End: 1kZca6-00GUzJ-LF
Subject: Re: [Kgdb-bugreport] [PATCH v7 5/7] arm64: ipi_nmi: Add support for
 NMI backtrace
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

On Mon, Nov 02, 2020 at 05:14:45PM +0530, Sumit Garg wrote:
> Enable NMI backtrace support on arm64 using IPI turned as an NMI
> leveraging pseudo NMIs support. It is now possible for users to get a
> backtrace of a CPU stuck in hard-lockup using magic SYSRQ.
> 
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> ---
>  arch/arm64/include/asm/irq.h |  6 ++++++
>  arch/arm64/kernel/ipi_nmi.c  | 18 ++++++++++++++++--
>  2 files changed, 22 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/irq.h b/arch/arm64/include/asm/irq.h
> index b2b0c64..ef018a8 100644
> --- a/arch/arm64/include/asm/irq.h
> +++ b/arch/arm64/include/asm/irq.h
> @@ -6,6 +6,12 @@
>  
>  #include <asm-generic/irq.h>
>  
> +#ifdef CONFIG_SMP
> +extern bool arch_trigger_cpumask_backtrace(const cpumask_t *mask,
> +					   bool exclude_self);
> +#define arch_trigger_cpumask_backtrace arch_trigger_cpumask_backtrace
> +#endif
> +
>  struct pt_regs;
>  
>  static inline int nr_legacy_irqs(void)
> diff --git a/arch/arm64/kernel/ipi_nmi.c b/arch/arm64/kernel/ipi_nmi.c
> index a945dcf..597dcf7 100644
> --- a/arch/arm64/kernel/ipi_nmi.c
> +++ b/arch/arm64/kernel/ipi_nmi.c
> @@ -8,6 +8,7 @@
>  
>  #include <linux/interrupt.h>
>  #include <linux/irq.h>
> +#include <linux/nmi.h>
>  #include <linux/smp.h>
>  
>  #include <asm/nmi.h>
> @@ -31,11 +32,24 @@ void arm64_send_nmi(cpumask_t *mask)
>  	__ipi_send_mask(ipi_nmi_desc, mask);
>  }
>  
> +bool arch_trigger_cpumask_backtrace(const cpumask_t *mask, bool exclude_self)
> +{
> +	if (!ipi_nmi_desc)
> +		return false;
> +
> +	nmi_trigger_cpumask_backtrace(mask, exclude_self, arm64_send_nmi);
> +
> +	return true;
> +}
> +
>  static irqreturn_t ipi_nmi_handler(int irq, void *data)
>  {
> -	/* nop, NMI handlers for special features can be added here. */
> +	irqreturn_t ret = IRQ_NONE;
> +
> +	if (nmi_cpu_backtrace(get_irq_regs()))
> +		ret = IRQ_HANDLED;
>  
> -	return IRQ_NONE;
> +	return ret;
>  }
>  
>  void dynamic_ipi_setup(int cpu)
> -- 

It works well with sysrq l trigger.
Please feel free to add:

	Tested-by: Masayoshi Mizuma <m.mizuma@jp.fujitsu.com>

Thanks!
Masa


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
