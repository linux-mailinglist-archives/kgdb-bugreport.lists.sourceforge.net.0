Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 15DAD19D4F8
	for <lists+kgdb-bugreport@lfdr.de>; Fri,  3 Apr 2020 12:22:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jKJSn-00068Z-TD
	for lists+kgdb-bugreport@lfdr.de; Fri, 03 Apr 2020 10:22:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1jKJSm-00068D-MD
 for kgdb-bugreport@lists.sourceforge.net; Fri, 03 Apr 2020 10:22:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SJNt42CfsZfbktzQWlyuv/BNnhlZfiPggeX/EX84Fx0=; b=jaYt1Fj0E3RADxfou1seT16+7a
 5B1WtzNVL0lcTT3ulysJUp6J0lpuDEKSX86ue8uafX6rXeR4P8rJOcMhMvyHaBANMUmUWMCYLdY0U
 HvqzrS+/+bEJ8U4ClUuKe8/NTiMHz2vnd1wJDYcgbS5Y8mAjob5lZO/MgonEHsASlwXI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SJNt42CfsZfbktzQWlyuv/BNnhlZfiPggeX/EX84Fx0=; b=TeV8Psgx8Hr7P13ZohaCMutR+H
 AvEETQrKs92ocO0nwEw2rsHZtoOQOeF9OGn4eMGDL2e6uRm23qGjhYY5Xfs2LGf0ZNFnQSN9LYjaw
 qgsdB8dt0Ag3S39iu7KLHpBumY6RwsEkGprVTeo7Uyw0e5yjFEckrwrHlsJklpmrqY04=;
Received: from mail-wr1-f65.google.com ([209.85.221.65])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jKJSi-002DHW-SR
 for kgdb-bugreport@lists.sourceforge.net; Fri, 03 Apr 2020 10:22:12 +0000
Received: by mail-wr1-f65.google.com with SMTP id g3so5565674wrx.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 03 Apr 2020 03:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=SJNt42CfsZfbktzQWlyuv/BNnhlZfiPggeX/EX84Fx0=;
 b=Uo3AEcIhtQ1yrlT+2wvMkL8dO3YNkwihb398/S12SDQdRUIlUt2FNLvD8Hk1Kh6hNs
 lGXm6lHwDsTZyuj3v1/Tyz0fDYJjtGwnkVS+2pLkAq96Azic5ywkC2qVnc5PSprosbDc
 Oe0RgAUva/IJP3Pa2mAV90l/cF2GwdUoPaeRpvyfxrtzXA28mgSgsbT2YN+u8SUfUccS
 RlHbUIXRDIU54HZWfxxTAqT0DIHkKJ2TN3EeJnjlvDD/qRD6IrIjDi0/kxnngZfHWIOv
 ONl1Iob8SXcoW7R93Gc8S2nPv+4keuzWoRqsOmvlpFWnMWh2IbRk9HahCJTAz7wB2GUw
 lCZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=SJNt42CfsZfbktzQWlyuv/BNnhlZfiPggeX/EX84Fx0=;
 b=OK1BKintfTqCa0sOaknjUYyAbvlC7kydVDLW/9+jz3GnRppT3S1sq5zyhRGoYbCMrQ
 +bar7KGCzi8kLsn22OhY2Ktd2DgRTEx+Te4vs9gggFqfzKTIAjfDD5JtS/QEbwobvkBk
 1HxzEBRzBqloxAIGkKveedBQc4xdRYHEnOSTmf4mq6vBSFlFECM7M19RQliuHVMFIUSv
 apEfjkrUblsUXjlEzJVzPyeWQxe9h52VEU1jnfs5Ddppvz6t99dfa9cOiAwjeS4jWjQC
 nyoItrAg3fWIcHf9Az1E8XXR44Gf2aJqnFxsaAiyT5IfuurYCd96H/oXp87uRcsOsJOi
 AP3A==
X-Gm-Message-State: AGi0PuZtILSkqnh67xp6w2FGQ2s4rU6vbKnf3771VgQqDV1UQtVe1Fms
 w53AtC9nL3BPtBAmrfommaa3Ug==
X-Google-Smtp-Source: APiQypJr6hcoO3o83/34kzUQba4K3ZIXDGFSw8EWqo43odX2M1L53tJIlkBNUswjkWNs8hRGGTI++g==
X-Received: by 2002:a5d:54c8:: with SMTP id x8mr8633049wrv.357.1585909322364; 
 Fri, 03 Apr 2020 03:22:02 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id 91sm5508347wrf.79.2020.04.03.03.22.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2020 03:22:01 -0700 (PDT)
Date: Fri, 3 Apr 2020 11:22:00 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Vincent Chen <vincent.chen@sifive.com>
Message-ID: <20200403102200.kx34epzjlfoy54ay@holly.lan>
References: <1585668191-16287-1-git-send-email-vincent.chen@sifive.com>
 <1585668191-16287-2-git-send-email-vincent.chen@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1585668191-16287-2-git-send-email-vincent.chen@sifive.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
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
X-Headers-End: 1jKJSi-002DHW-SR
Subject: Re: [Kgdb-bugreport] [PATCH v2 1/5] kgdb: Add kgdb_has_hit_break
 function
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
Cc: kgdb-bugreport@lists.sourceforge.net, jason.wessel@windriver.com,
 palmer@dabbelt.com, paul.walmsley@sifive.com, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Tue, Mar 31, 2020 at 11:23:07PM +0800, Vincent Chen wrote:
> The break instruction in RISC-V does not have an immediate value field, so
> the kernel cannot identify the purpose of each trap exception through the
> opcode. This makes the existing identification schemes in other
> architecture unsuitable for the RISC-V kernel. To solve this problem, this
> patch adds kgdb_has_hit_break(), which can help RISC-V kernel identify
> the KGDB trap exception.

I was just reflecting on this again.

The approach is fine from a kgdb point of view (where breakpoints are
expensive heavy weight operations) but it might be wise to share
how much implementing kgdb in this manner slows down kprobe tracing
since these are normally pretty light weight.

If the benchmarks do look bad I'd certainly entertain patches to
optimize kgdb_has_hit_break(). For example by tracking the highest
currently allocated breakpoint number would make a big difference
(since it would normally be zero or close to).


Daniel.

> 
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
> Acked-by: Daniel Thompson <daniel.thompson@linaro.org>
> ---
>  kernel/debug/debug_core.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
> index 2b7c9b67931d..01bc3eea3d4d 100644
> --- a/kernel/debug/debug_core.c
> +++ b/kernel/debug/debug_core.c
> @@ -417,6 +417,18 @@ int kgdb_isremovedbreak(unsigned long addr)
>  	return 0;
>  }
>  
> +int kgdb_has_hit_break(unsigned long addr)
> +{
> +	int i;
> +
> +	for (i = 0; i < KGDB_MAX_BREAKPOINTS; i++) {
> +		if (kgdb_break[i].state == BP_ACTIVE &&
> +		    kgdb_break[i].bpt_addr == addr)
> +			return 1;
> +	}
> +	return 0;
> +}
> +
>  int dbg_remove_all_break(void)
>  {
>  	int error;
> -- 
> 2.7.4
> 


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
