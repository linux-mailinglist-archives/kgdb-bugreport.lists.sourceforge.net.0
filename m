Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A781774B35
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 25 Jul 2019 12:09:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1hqagM-0003JX-Dy
	for lists+kgdb-bugreport@lfdr.de; Thu, 25 Jul 2019 10:09:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1hqagK-0003JP-St
 for kgdb-bugreport@lists.sourceforge.net; Thu, 25 Jul 2019 10:09:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Jg/seej8t7Hj4NeZ1aWrNwKSLHK+vbcUqiF0yt0H8jE=; b=Tl0lSWzY4tYn6WQv/H3EgL0+Ff
 yOfmcGTOC90dE5bq+M4nkAfw7XIlvDC5lUtssDhZNgtlr5V6VTtl2SlHiWctNffFg6ZbljdyxGP3C
 RBmr4ALTEhHsVHfvv7xhscOuB47lNoE3x1WpDVoFIJqmTaNZRCfie1o4irpPQgigQDcQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Jg/seej8t7Hj4NeZ1aWrNwKSLHK+vbcUqiF0yt0H8jE=; b=hoSwf5CZyip1QO4gqgiOz7Vt+0
 YIXg4Uvd3ZYEcUjxeRMPNF00IsrFDbMQOxi6focTStcU+0QhZX1LoNBeCXcYmVf8Msygdpn9M2r78
 PnxWF6oVAIWXm1cra2N8Cr9q0Wbntjr2dTvWiIgCHt+5aIar54T8x+5Ds0eIXYwg00x8=;
Received: from mail-wr1-f68.google.com ([209.85.221.68])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hqagI-00FPGp-0K
 for kgdb-bugreport@lists.sourceforge.net; Thu, 25 Jul 2019 10:09:04 +0000
Received: by mail-wr1-f68.google.com with SMTP id z1so50085318wru.13
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 25 Jul 2019 03:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Jg/seej8t7Hj4NeZ1aWrNwKSLHK+vbcUqiF0yt0H8jE=;
 b=RxXN+dCFECESVo4l9MP6ts4vhswy0vbN3Yxl9wG6s22GjYzwM8B147X7eF+ev24cUm
 Q80xWa79JmoRCI+xSd/TWI4P2liL+25C+yCE9c6WozMEpANdVzPfDK9140Sx+p5O8JXg
 cP2AZAtOB2kGWECEsFWKxiIiP8Ehq/cYDdm+qL94flgH4onXuZjuT9p3D+0ZtpFLFptw
 Vos9y0A1ylDzkP+3QwdJSUnDKzmEBcDqCFgfyMqRl8/WCZfxflBJsz8QHgEEWLZp1eZT
 EGf/byPEKUuGdgxWmhddImX0EalEn1twdgjzezvs83MqZGuuHn7GkTx1/HfFf3Pt6rnO
 SGdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Jg/seej8t7Hj4NeZ1aWrNwKSLHK+vbcUqiF0yt0H8jE=;
 b=lE+rbp607Uejn2t9MlfPTe+5DRfpoomR9TeNL11zL9p2pChxI/DmOh5/9dWhinjUzi
 O8chfv38FHr+2ctA75h9cv5TEPrEvEnpirG+qWLW5xXCLLaPUf4y2cjVwxAzFPnh7QR7
 Ocb9Jrv1OCwMowrRFAFQvVsMXcfz0xyRWi0bNDUSVbOf7WW1LhLjUaMJL/63PxpXK7aA
 NfirT9h/654mvqyN5XG/lR5d1Qvs+nuk+95dvkVQLqKbHo4aHPxBb+VTzOGDc4Cn/Tmq
 WXaLHDYhqLzRPMfRFDQoiNeLGa7iq5Vfxv62LFh9vxtg9UtE2LgPx7sI8TsEgdkzr7Tk
 pkSA==
X-Gm-Message-State: APjAAAWcBfWMXKXSx05iE6FUYj2CK/frPOB94Ig8aKJHhG/tCN8NvOi4
 CD6PXJj+JMWYp322fZW/Udw87Y//vvMa0Q==
X-Google-Smtp-Source: APXvYqy+yscGR0taxzZMWqJySKH2/JRv40ZuWAjX5J8TnRlUbC5vmUjs5CU483PRvh6HcOrxBaJWyg==
X-Received: by 2002:a5d:66c5:: with SMTP id k5mr96836410wrw.304.1564047843544; 
 Thu, 25 Jul 2019 02:44:03 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id b186sm36416037wmb.3.2019.07.25.02.44.02
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 25 Jul 2019 02:44:02 -0700 (PDT)
Date: Thu, 25 Jul 2019 10:44:01 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Wang Xiayang <xywang.sjtu@sjtu.edu.cn>
Message-ID: <20190725094401.zve4urozmdxtxulx@holly.lan>
References: <20190725053345.5888-1-xywang.sjtu@sjtu.edu.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190725053345.5888-1-xywang.sjtu@sjtu.edu.cn>
User-Agent: NeoMutt/20180716
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.68 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: sjtu.edu.cn]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.68 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hqagI-00FPGp-0K
Subject: Re: [Kgdb-bugreport] [PATCH] kdb: replace snprintf with strscpy
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
Cc: kgdb-bugreport@lists.sourceforge.net, jason.wessel@windriver.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Thu, Jul 25, 2019 at 01:33:45PM +0800, Wang Xiayang wrote:
> As commit a86028f8e3ee ("staging: most: sound: replace snprintf
> with strscpy") suggested, using snprintf without a format
> specifier is potentially risky if the PROMPT environment
> variable contains any format specifier. The variable can be set
> via kdb_set() though by default it contains no format specifier.
> 
> Using strscpy is conservatively safe for any mistakenly
> environment variable setting that leads to crash.

This will result in a broken prompt on SMP machines. The default
prompt on an SMP machine includes the CPU number of the core that
is currently being debugged.


Daniel.

> 
> Signed-off-by: Wang Xiayang <xywang.sjtu@sjtu.edu.cn>
> ---
>  kernel/debug/kdb/kdb_main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
> index 9ecfa37c7fbf..4514c70fae09 100644
> --- a/kernel/debug/kdb/kdb_main.c
> +++ b/kernel/debug/kdb/kdb_main.c
> @@ -1303,7 +1303,7 @@ static int kdb_local(kdb_reason_t reason, int error, struct pt_regs *regs,
>  		snprintf(kdb_prompt_str, CMD_BUFLEN, kdbgetenv("PROMPT"),
>  			 raw_smp_processor_id());
>  #else
> -		snprintf(kdb_prompt_str, CMD_BUFLEN, kdbgetenv("PROMPT"));
> +		strscpy(kdb_prompt_str, kdbgetenv("PROMPT"), CMD_BUFLEN);
>  #endif
>  		if (defcmd_in_progress)
>  			strncat(kdb_prompt_str, "[defcmd]", CMD_BUFLEN);
> -- 
> 2.11.0
> 


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
