Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC901B11C9
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 20 Apr 2020 18:40:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jQZSq-0008Me-Cs
	for lists+kgdb-bugreport@lfdr.de; Mon, 20 Apr 2020 16:40:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1jQZSp-0008MM-5n
 for kgdb-bugreport@lists.sourceforge.net; Mon, 20 Apr 2020 16:40:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MDsCJhRvyD2HDZUyUqMUbXbbPSm+BqJbdjnCx+/3isk=; b=G66JIdo7eDkGEXriKavjULX0Xc
 vZysAxj32ziPPGyxbsCoRCJWzaR2gbdX+V2xmwo4+zb+hOwYOn+97SyN8EWwVgu7FVNbaPZjxaYNt
 Y4PDdBtw0qPU8KHZr8B9kgxFip0gov3aulAsrgGgChosGb8MTxPX2rbYdM1Xabc2oC5E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MDsCJhRvyD2HDZUyUqMUbXbbPSm+BqJbdjnCx+/3isk=; b=iNYf8nSUQ5TevMX8Ior/wlxTD1
 dcmN6kl54Ypyd9dcxn09iFYYTXP9k/2OIimKLmyxeXQ/9QYtLpf09aMa0Fd9+eZni6brUgpeNf4i9
 tC3i9283EkOzbn3raAO2/ws4sXO5Mb7u4+ENRsZduffsvCf+/wISzrKPPpmhv+xYspPU=;
Received: from mail-wr1-f65.google.com ([209.85.221.65])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jQZSj-007QIq-8U
 for kgdb-bugreport@lists.sourceforge.net; Mon, 20 Apr 2020 16:40:07 +0000
Received: by mail-wr1-f65.google.com with SMTP id i10so12983107wrv.10
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 20 Apr 2020 09:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=MDsCJhRvyD2HDZUyUqMUbXbbPSm+BqJbdjnCx+/3isk=;
 b=Mio6G/d+plzDhSx5s+S0EpXMBflvr+80zWrK5CtvFNNZc4GQ0QrMPAP/vS5+6O/wcC
 zjvXrNZrcqrSsQSl7KgSLTdMbClq7dMeEDQWp18ltxbjAjY3bmFkwK4NT0un5DeEX/rh
 QIcCcmPFcWiofIrphs/OcAnflXbF6ZIP4N8iBbPbybExKn0X27t99Nqr64T2X4DgDlCZ
 2y9SeRRLFO1Oy0Kmf3MpSUH53ZguvbiA0JVvoDumHOUhyYXzU//knZG6lJv/qIB+98xj
 d4qRBwhBCnVpVHXpW3wHQjKHWxhKzlavRA0d4wuHTJ0mctXRQZpIGLX5jPPuKI0HiqVH
 KaKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=MDsCJhRvyD2HDZUyUqMUbXbbPSm+BqJbdjnCx+/3isk=;
 b=n8fh2M7+j24cK2QfNvI8ziGwKZAAQyzd9m0RS4Z+396N9sUNTTnRtmFYNJgR9r/qy8
 ug921SzO72SqTe9n4pwV+QSrCXC4XKhWtHcFG+JE9TAZzsYskxhGxW/rS4VPlV6jWrc6
 09SXbq2TsTakVKri0Mlrw9PLUdHy4LI+41v5xRyzDRA2QHBvv3nh7/pX5MER2sAidGyR
 DySs08moplXN/Upj3lg/L59cKOOpwvmNjQL3G2A+EUrBB+zb/i7Ctf4RwBwosCpF0xgH
 RwOtkRg1XpGxi8WFet0A+mKYyUHNGlA1uQJbLRYlPbv0RqM2hjGnhwPoL47t4F61bZX+
 BW+g==
X-Gm-Message-State: AGi0PuY25KQkesihagfs6qOqeWOobAxrHkCZqBNjAgVP9Ji37lxQ7849
 I5wmopjshVfRVqin6/GxM9dyjg==
X-Google-Smtp-Source: APiQypKS2iYpFCrXexj92Okt66EqZQ4BwgR5+LhedcaJQDZNlGA6Q27zuZ4ZUspB/z8YQT/sAn/eBw==
X-Received: by 2002:adf:ea44:: with SMTP id j4mr21185191wrn.38.1587400794742; 
 Mon, 20 Apr 2020 09:39:54 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id w12sm40508wrk.56.2020.04.20.09.39.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2020 09:39:54 -0700 (PDT)
Date: Mon, 20 Apr 2020 17:39:52 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Vincent Chen <vincent.chen@sifive.com>
Message-ID: <20200420163952.yuqaemcdbrw7ewwe@holly.lan>
References: <1587004688-19788-1-git-send-email-vincent.chen@sifive.com>
 <1587004688-19788-4-git-send-email-vincent.chen@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1587004688-19788-4-git-send-email-vincent.chen@sifive.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: sifive.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.65 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.65 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jQZSj-007QIq-8U
Subject: Re: [Kgdb-bugreport] [PATCH v4 3/5] kgdb: enable arch to support
 XML packet support.
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
Cc: kgdb-bugreport@lists.sourceforge.net, linux-riscv@lists.infradead.org,
 palmer@dabbelt.com, paul.walmsley@sifive.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Thu, Apr 16, 2020 at 10:38:06AM +0800, Vincent Chen wrote:
> The XML packet could be supported by required architecture if the
> architecture defines CONFIG_HAVE_ARCH_KGDB_QXFER_PKT and implement its own
> kgdb_arch_handle_qxfer_pkt(). Except for the kgdb_arch_handle_qxfer_pkt(),
> the architecture also needs to record the feature supported by gdb stub
> into the kgdb_arch_gdb_stub_feature, and these features will be reported
> to host gdb when gdb stub receives the qSupported packet.
> 
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>

Acked-by: Daniel Thompson <daniel.thompson@linaro.org>


> ---
>  include/linux/kgdb.h   | 11 +++++++++++
>  kernel/debug/gdbstub.c | 13 +++++++++++++
>  lib/Kconfig.kgdb       |  5 +++++
>  3 files changed, 29 insertions(+)
> 
> diff --git a/include/linux/kgdb.h b/include/linux/kgdb.h
> index b072aeb1fd78..414bef20a8f3 100644
> --- a/include/linux/kgdb.h
> +++ b/include/linux/kgdb.h
> @@ -177,6 +177,17 @@ kgdb_arch_handle_exception(int vector, int signo, int err_code,
>  			   struct pt_regs *regs);
>  
>  /**
> + *	kgdb_arch_handle_qxfer_pkt - Handle architecture specific GDB XML
> + *				     packets.
> + *	@remcom_in_buffer: The buffer of the packet we have read.
> + *	@remcom_out_buffer: The buffer of %BUFMAX bytes to write a packet into.
> + */
> +
> +extern void
> +kgdb_arch_handle_qxfer_pkt(char *remcom_in_buffer,
> +			   char *remcom_out_buffer);
> +
> +/**
>   *	kgdb_call_nmi_hook - Call kgdb_nmicallback() on the current CPU
>   *	@ignored: This parameter is only here to match the prototype.
>   *
> diff --git a/kernel/debug/gdbstub.c b/kernel/debug/gdbstub.c
> index 4b280fc7dd67..a0617c883029 100644
> --- a/kernel/debug/gdbstub.c
> +++ b/kernel/debug/gdbstub.c
> @@ -792,6 +792,19 @@ static void gdb_cmd_query(struct kgdb_state *ks)
>  		}
>  		break;
>  #endif
> +#ifdef CONFIG_HAVE_ARCH_KGDB_QXFER_PKT
> +	case 'S':
> +		if (!strncmp(remcom_in_buffer, "qSupported:", 11))
> +			strcpy(remcom_out_buffer, kgdb_arch_gdb_stub_feature);
> +		break;
> +	case 'X':
> +		if (!strncmp(remcom_in_buffer, "qXfer:", 6))
> +			kgdb_arch_handle_qxfer_pkt(remcom_in_buffer,
> +						   remcom_out_buffer);
> +		break;
> +#endif
> +	default:
> +		break;
>  	}
>  }
>  
> diff --git a/lib/Kconfig.kgdb b/lib/Kconfig.kgdb
> index 933680b59e2d..d7f70335efaf 100644
> --- a/lib/Kconfig.kgdb
> +++ b/lib/Kconfig.kgdb
> @@ -3,6 +3,11 @@
>  config HAVE_ARCH_KGDB
>  	bool
>  
> +# set if architecture has the its kgdb_arch_handle_qxfer_pkt
> +# function to enable gdb stub to address XML packet sent from GDB.
> +config HAVE_ARCH_KGDB_QXFER_PKT
> +	bool
> +
>  menuconfig KGDB
>  	bool "KGDB: kernel debugger"
>  	depends on HAVE_ARCH_KGDB
> -- 
> 2.7.4
> 


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
