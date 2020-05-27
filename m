Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 58EB11E45D0
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 27 May 2020 16:27:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jdx1M-0003LY-6I
	for lists+kgdb-bugreport@lfdr.de; Wed, 27 May 2020 14:27:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1jdx1K-0003L4-Qb
 for kgdb-bugreport@lists.sourceforge.net; Wed, 27 May 2020 14:27:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=34HLjmK1c/0lja18IFDaAvizeeni+8A0+yLrcuOnt6s=; b=TfAY0xklXbxj2bzDmP0ZApXpz5
 x3Guo1AU3BqplmeVWOJKF+dVPUsfB6ff2CmWzqsrmQSl/CcEYicSPG7sUWjH1BnzcKQjuFPVMmjYp
 Ts59lezf29wpLBNjQ++n36Rq1lfaEQa/xA8KLmtcwIEgPdYYEcDVv+wsPCALjJTrYFEg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=34HLjmK1c/0lja18IFDaAvizeeni+8A0+yLrcuOnt6s=; b=WP1B1IZXce13D3L1GSFpnaJ0Wy
 7YY0PyDtfGD4zttBO9n2k7EbuZMNJDTYVf+AICKLAEWvhjjl8yLSYZY9j9oUHDyFf33s5dQMnURoG
 sxlGwElEKBGSEzSAKk1VvOAupsEO0LF7gHfVaWNPGYwZ4DhvLJtogSFiiVlNBx12U7Wk=;
Received: from mail-wr1-f66.google.com ([209.85.221.66])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jdx1G-000MAB-Bi
 for kgdb-bugreport@lists.sourceforge.net; Wed, 27 May 2020 14:27:02 +0000
Received: by mail-wr1-f66.google.com with SMTP id s8so24147670wrt.9
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 27 May 2020 07:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=34HLjmK1c/0lja18IFDaAvizeeni+8A0+yLrcuOnt6s=;
 b=SOduy4lkCkwjmI0QeG65K/wrRqpjJZA/vXAizxeSh0GB1X8T15UW2rQCpNPvZgrKfZ
 O91e+QYG9T2eKn58qnQRjF5eEBbiQfXs2puDFq3m0jTb52GKancfabRHa8DrG2THbNE+
 Hi2jgORhG/V5iVIuSLPTlRiHz9c4kHi9UT4cbBt+WI7+pyU+NHFUjhQMrSFGo7rtGb8e
 zeFvPgPAMaqpygmZGccY2Yt/MDKdxOjyDXZKK0tHqj1CcJRf9QXC9jeR/HQZxCZYfroa
 rOD9nOv2x+sUwCVjog7sroyYWZezkHh0+lMbl5x2HvE9vZLQh7sCI1ENH0K7ed+I0MfN
 4F/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=34HLjmK1c/0lja18IFDaAvizeeni+8A0+yLrcuOnt6s=;
 b=TOvs8z5nLKmYzVpr8cVIMaDweuJbg3cepeKIdEOTxgHxJ/bjN4S+2kRQclNUMqgu0a
 NvV00EcuRSpF1friNyEz3t+4rrucmgipqWGr3QcbAOJtY7686ie7ec2oXyuBWi3AT4/S
 JBE185pv71MggO0QpfhJ3Z0WL2bWdzbzK/K4JimFGLOAaxvcwog7Eg2y41XgcAOJr9Ka
 Ly8Hmp2S+bWrXpqEFQCfPdNDy/s93DqkFcJXRb8mO/TuJDn01YvhfBEMg0yHlDY86oZz
 Z1tEHKFGYHXm46HoGdT1gd1xnb8Daa2lSge1zK0FD21lG0m39vCGhiFmbkQQW0qF2gvw
 dSvg==
X-Gm-Message-State: AOAM531psahcVg19dsd7KQgHPNhpMOsS0BTWjDQI44k/PO9NAww1u1ww
 O3TocnFycHFBfALOE/MKPNFu8Q==
X-Google-Smtp-Source: ABdhPJzwIDHcPXyeTxEti9Ruu7DNpDNyxtg30jFdfYqrdsdmnDgGXlaE7BHx5Dtsw5qH3gme0lumxQ==
X-Received: by 2002:adf:f601:: with SMTP id t1mr15339842wrp.244.1590589612081; 
 Wed, 27 May 2020 07:26:52 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id h5sm2998033wrw.85.2020.05.27.07.26.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 May 2020 07:26:51 -0700 (PDT)
Date: Wed, 27 May 2020 15:26:49 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Sumit Garg <sumit.garg@linaro.org>
Message-ID: <20200527142649.aa3kgqvo2n4q4kyx@holly.lan>
References: <1590560759-21453-1-git-send-email-sumit.garg@linaro.org>
 <1590560759-21453-3-git-send-email-sumit.garg@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1590560759-21453-3-git-send-email-sumit.garg@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.66 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.66 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jdx1G-000MAB-Bi
Subject: Re: [Kgdb-bugreport] [PATCH v3 2/4] kdb: Check status of console
 prior to invoking handlers
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
Cc: pmladek@suse.com, kgdb-bugreport@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, sergey.senozhatsky@gmail.com,
 jason.wessel@windriver.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Wed, May 27, 2020 at 11:55:57AM +0530, Sumit Garg wrote:
> Check if a console is enabled prior to invoking corresponding write
> handler.
> 
> Suggested-by: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


> ---
>  kernel/debug/kdb/kdb_io.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
> index f6b4d47..349dfcc 100644
> --- a/kernel/debug/kdb/kdb_io.c
> +++ b/kernel/debug/kdb/kdb_io.c
> @@ -564,6 +564,8 @@ static void kdb_msg_write(char *msg, int msg_len)
>  		kdb_io_write(msg, msg_len, dbg_io_ops->write_char);
>  
>  	for_each_console(c) {
> +		if (!(c->flags & CON_ENABLED))
> +			continue;
>  		c->write(c, msg, msg_len);
>  		touch_nmi_watchdog();
>  	}
> -- 
> 2.7.4
> 


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
