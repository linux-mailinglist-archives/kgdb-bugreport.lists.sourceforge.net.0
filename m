Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7B428E9C4
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 15 Oct 2020 03:17:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kSrtx-0006iu-11
	for lists+kgdb-bugreport@lfdr.de; Thu, 15 Oct 2020 01:17:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <msys.mizuma@gmail.com>) id 1kSrtt-0006iP-Mu
 for kgdb-bugreport@lists.sourceforge.net; Thu, 15 Oct 2020 01:17:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gRUP5okLmkN2g8HT3wDw7jtbqT5ZCqE5twgUzt6/004=; b=WbJaUbt6tqrh0dRxU61HkjW4vB
 4lNXUrvO8C9YPOUAUry5OVWxxcziOVf/E73+QGfbbbiLtMcCh4G5XJdia/r9g1CIA8GtO9vK4cxp1
 G93O4B3+u1MIJA7AH+9HyilV/WEgof3ZzNj579ryoBQthr5+n29sK8uEuypCGsKR7Ngc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gRUP5okLmkN2g8HT3wDw7jtbqT5ZCqE5twgUzt6/004=; b=ZiTzok3GuqYF5XjnYI9Pds6YAD
 +sBdEySmHyuG6rS+3n0+vHHQ/GhNKbqIsTpqERItz4ctjWcYjvfPtIz6PSX1zG/DPsJFnJh6L0TaB
 pAnZgAoZ4/R1v4FxETWUxOvAH18WNJFeyCeUDfs6u24jZ3Mf6FpaE2d+yILwC5JeZtoI=;
Received: from mail-il1-f195.google.com ([209.85.166.195])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kSrtn-00AyWo-6d
 for kgdb-bugreport@lists.sourceforge.net; Thu, 15 Oct 2020 01:17:49 +0000
Received: by mail-il1-f195.google.com with SMTP id l16so2206025ilj.9
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 14 Oct 2020 18:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=gRUP5okLmkN2g8HT3wDw7jtbqT5ZCqE5twgUzt6/004=;
 b=Axt5o00Pp6mgZRePuxQ5jTc1tIKAoWXVLza1VeaVWSk6EHkD9m3LvdYCBhVdhLLgoB
 EQRKLb094zduDRN9Wgbho3j6WZQDmrKDR7znzAacxGZQxfgFDC0HAzPe8hwst1K0uiLT
 MJVf9n3dWZ0RalrPKjJj/UZkTZ+8406R/J3fLX5ybJUNt+xLfuyN1t4YZe3JntgAuiB2
 FipSBtW0NeTqwAgrpMsn3HBEbu47epCFqA+lT0fkyRsFFdEC2PtJIWJRjEb1va8tDGCK
 AwQUbhWsIw9nEef0g5BPYmAf6qPLpwcG91sq19Erz9RfJL6FcUJpH+0DHCFGq6vGs2re
 nwew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=gRUP5okLmkN2g8HT3wDw7jtbqT5ZCqE5twgUzt6/004=;
 b=cnUexOn8dx2gk4pPcIKHli+WbXS0/+wEaiTBv+9vOmvlAltbUnhr7W/eNPFMCb+Po2
 EeH641kN6lln3EoWI97NLKRmV98PEtpCXvpyaHeqgFv4wzIkscm1ACdSYENE6NejNCG/
 e7//edCEhYr2+scyoIv5DjkdIQ3CNt1CpWzCXbXKt9IGzuvdKvM8/wA4DDhdT+4V4PMc
 vyW/gXE5QOYNRjTQozm8DihofsOTk5xBitEuHSlt584oUKuszfC7YazKFaOHL7a8iNhM
 PoEGewcCcAdM2+9icWUnjXEB9dfQMT6ui4urp3Uaz4VLm64Rn1PxoYpkkUhDaupyBMVf
 wsHA==
X-Gm-Message-State: AOAM532Z6pWaOjbV18hrXVk0Iso8QWwlmiQAWcG/NpDkkYVQx+mtwu6e
 p2wvWKDHa3To8Jmtq5u+qg==
X-Google-Smtp-Source: ABdhPJwmPHN+xkaMEX00WKdHeJam3q4KuADGTGUWoOIWFo6TRZqa0MG79tQKSWB3WJHYAYtmTO/owA==
X-Received: by 2002:a92:ca92:: with SMTP id t18mr1413551ilo.287.1602724657601; 
 Wed, 14 Oct 2020 18:17:37 -0700 (PDT)
Received: from gabell
 (209-6-122-159.s2973.c3-0.arl-cbr1.sbo-arl.ma.cable.rcncustomer.com.
 [209.6.122.159])
 by smtp.gmail.com with ESMTPSA id o17sm1148985ila.47.2020.10.14.18.17.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 14 Oct 2020 18:17:33 -0700 (PDT)
Date: Wed, 14 Oct 2020 21:17:30 -0400
From: Masayoshi Mizuma <msys.mizuma@gmail.com>
To: Sumit Garg <sumit.garg@linaro.org>
Message-ID: <20201015011730.mbhbxr2zgjfe2zen@gabell>
References: <1602673931-28782-1-git-send-email-sumit.garg@linaro.org>
 <1602673931-28782-6-git-send-email-sumit.garg@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1602673931-28782-6-git-send-email-sumit.garg@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.166.195 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (msys.mizuma[at]gmail.com)
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.195 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kSrtn-00AyWo-6d
Subject: Re: [Kgdb-bugreport] [PATCH v5 5/5] arm64: ipi_nmi: Add support for
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
Cc: mark.rutland@arm.com, daniel.thompson@linaro.org, ito-yuichi@fujitsu.com,
 jason@lakedaemon.net, maz@kernel.org, jason.wessel@windriver.com,
 linux-kernel@vger.kernel.org, julien.thierry.kdev@gmail.com,
 catalin.marinas@arm.com, kgdb-bugreport@lists.sourceforge.net,
 tglx@linutronix.de, will@kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Wed, Oct 14, 2020 at 04:42:11PM +0530, Sumit Garg wrote:
> Enable NMI backtrace support on arm64 using IPI turned as an NMI
> leveraging pseudo NMIs support. It is now possible for users to get a
> backtrace of a CPU stuck in hard-lockup using magic SYSRQ.
> 
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> ---
>  arch/arm64/include/asm/irq.h |  6 ++++++
>  arch/arm64/kernel/ipi_nmi.c  | 12 +++++++++++-
>  2 files changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/irq.h b/arch/arm64/include/asm/irq.h
> index b2b0c64..e840bf1 100644
> --- a/arch/arm64/include/asm/irq.h
> +++ b/arch/arm64/include/asm/irq.h
> @@ -6,6 +6,12 @@
>  
>  #include <asm-generic/irq.h>
>  
> +#ifdef CONFIG_SMP
> +extern void arch_trigger_cpumask_backtrace(const cpumask_t *mask,
> +					   bool exclude_self);
> +#define arch_trigger_cpumask_backtrace arch_trigger_cpumask_backtrace
> +#endif
> +
>  struct pt_regs;
>  
>  static inline int nr_legacy_irqs(void)
> diff --git a/arch/arm64/kernel/ipi_nmi.c b/arch/arm64/kernel/ipi_nmi.c
> index e0a9e03..e1dc19d 100644
> --- a/arch/arm64/kernel/ipi_nmi.c
> +++ b/arch/arm64/kernel/ipi_nmi.c
> @@ -9,6 +9,7 @@
>  #include <linux/interrupt.h>
>  #include <linux/irq.h>
>  #include <linux/kgdb.h>
> +#include <linux/nmi.h>
>  #include <linux/smp.h>
>  
>  #include <asm/nmi.h>
> @@ -25,12 +26,21 @@ void arch_send_call_nmi_func_ipi_mask(cpumask_t *mask)
>  	__ipi_send_mask(ipi_desc, mask);
>  }
>  
> +void arch_trigger_cpumask_backtrace(const cpumask_t *mask, bool exclude_self)
> +{
> +	nmi_trigger_cpumask_backtrace(mask, exclude_self,
> +				      arch_send_call_nmi_func_ipi_mask);
> +}
> +
>  static irqreturn_t ipi_nmi_handler(int irq, void *data)
>  {
>  	unsigned int cpu = smp_processor_id();
>  
> -	ipi_kgdb_nmicallback(cpu, get_irq_regs());
> +	if (nmi_cpu_backtrace(get_irq_regs()))
> +		goto out;
>  
> +	ipi_kgdb_nmicallback(cpu, get_irq_regs());
> +out:
>  	return IRQ_HANDLED;
>  }
>  
> -- 

It works well. Please feel free to add:

        Tested-by: Masayoshi Mizuma <m.mizuma@jp.fujitsu.com>

Thanks!
Masa


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
