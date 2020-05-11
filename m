Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1491CDAC7
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 11 May 2020 15:09:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jY8BF-0002Ab-Az
	for lists+kgdb-bugreport@lfdr.de; Mon, 11 May 2020 13:09:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1jY8BD-0002AU-Jl
 for kgdb-bugreport@lists.sourceforge.net; Mon, 11 May 2020 13:09:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Dvv6tJzVeSp90KNaJF9Iza45Xb9aV8/SHy0QZUnd5+U=; b=DwuxZL8HbDJ/dFpjVp3rg29hUk
 Lxz1ye6cQ/Rq54I9nFsB3vS3vIC4oRmny6S8HHj90kx9GHPTXYuSBvCJnFOK53slVZKjSneSe4JVQ
 MfIvuJ7NzTq5CSrneyv0WTuptwrAIUPmopk2VvwSUnohXME7PJsUosuD9jCijaGA73f4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Dvv6tJzVeSp90KNaJF9Iza45Xb9aV8/SHy0QZUnd5+U=; b=ebXd/Od1VOQILAIajolCkPbeGL
 LfVlLn5qEJ3ZVa8VOJgXtlirEX/wgtYXN1Q8LDxM0DjgrCVEVFDeB/4lyOY8FDotPLCzlVuh02ebJ
 6FcsyrW3dU6Cs8ZNkii+l/aHbYos2aLKjK7LJ1psSNtEsID35bH9ehQCEsgGV1FGhngY=;
Received: from mail-wr1-f65.google.com ([209.85.221.65])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jY8B9-004Asn-Tk
 for kgdb-bugreport@lists.sourceforge.net; Mon, 11 May 2020 13:09:11 +0000
Received: by mail-wr1-f65.google.com with SMTP id y16so3706018wrs.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 11 May 2020 06:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Dvv6tJzVeSp90KNaJF9Iza45Xb9aV8/SHy0QZUnd5+U=;
 b=q44kjiiaaYaBbDkBcrfJCt7AWGhDC8EznfPHDU4j48RSdJmdY9PpTBBunwUCdjbUOR
 AzVWkWagGb/SMOCOMruhWmrtrfWmHVo9/iMRA/VkX/c1SJhRIm1EbY1g0sCxps4ybA3x
 NUselnnn4UfbaxQdcCcoq1bofN9xIOb0tcW3kBLrKAxmwa/geFItZ0kAfd8LVaEsIhgj
 Cvxy9v2Gz9loj8C6GUlIWCe7SrbCkskcqFR9JtBntGjKu/N8LAhvLZBm4vhP1/D7njQg
 mVpISTXAMNnC+DmGBotieInbAh/at6M5GpBVcVloauw1vp9BRc8m5V9P2z26G4IQcX+w
 Kniw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Dvv6tJzVeSp90KNaJF9Iza45Xb9aV8/SHy0QZUnd5+U=;
 b=oJh2st38P9tGQCFRVFnvmNSZPNZzz+tkm3/U7RbYB1NnwuCTnVRsSbzIYizzzxCLA1
 0WlLodD19BstXpJaBHymcRMX1t96tv0seaYqdvJjb19pe6Dhh/Z7k5UpjR4+tuHRNL3h
 2jL72ulxyJfr2OU73bYlalCJ2Blj3yH03yz114r6qwhZLWoRabVEWDCKITAVUyiQpSIt
 vGXmoPm6E9O2kkFfYYh+shH066mql8UNOIM5xxfxk2z/X0Gwtq2hJHuAFZkKjCoA1ovE
 uWPFmY/dOb5GFB3NizKHnMyeWhVaj3BORWOKETv2jUUOzTwmhJ25kQGj6VHREAsjNwhx
 tPqA==
X-Gm-Message-State: AGi0PuZs/jXXU3vbqGWGft8HL7FMQoKmHM8NCJ1nqetuZ1nV8ewIjmw4
 6uTTqUtwDtpG2TO1thzRlxi+BQ==
X-Google-Smtp-Source: APiQypJZ02WbEw5weH5Ix8Han9Dgv/v1PknkgFFgnmn2QEm8/t3C94crXZ+rubgdhhXDGPF2IADvdA==
X-Received: by 2002:a5d:66c9:: with SMTP id k9mr16929992wrw.307.1589202541411; 
 Mon, 11 May 2020 06:09:01 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id f123sm13589695wmf.44.2020.05.11.06.09.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 06:09:00 -0700 (PDT)
Date: Mon, 11 May 2020 14:08:59 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Jason Yan <yanaijie@huawei.com>
Message-ID: <20200511130859.hfbxuc2y54ih4kjf@holly.lan>
References: <20200507110649.37426-1-yanaijie@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200507110649.37426-1-yanaijie@huawei.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.65 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.65 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jY8B9-004Asn-Tk
Subject: Re: [Kgdb-bugreport] [PATCH] kgdb: Return true in
 kgdb_nmi_poll_knock()
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
Cc: kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 jason.wessel@windriver.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Thu, May 07, 2020 at 07:06:49PM +0800, Jason Yan wrote:
> Fix the following coccicheck warning:
> 
> include/linux/kgdb.h:301:54-55: WARNING: return of 0/1 in function
> 'kgdb_nmi_poll_knock' with return type bool
> 
> Signed-off-by: Jason Yan <yanaijie@huawei.com>

Applied, thanks.


> ---
>  include/linux/kgdb.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/kgdb.h b/include/linux/kgdb.h
> index b072aeb1fd78..042828aeb73d 100644
> --- a/include/linux/kgdb.h
> +++ b/include/linux/kgdb.h
> @@ -298,7 +298,7 @@ extern bool kgdb_nmi_poll_knock(void);
>  #else
>  static inline int kgdb_register_nmi_console(void) { return 0; }
>  static inline int kgdb_unregister_nmi_console(void) { return 0; }
> -static inline bool kgdb_nmi_poll_knock(void) { return 1; }
> +static inline bool kgdb_nmi_poll_knock(void) { return true; }
>  #endif
>  
>  extern int kgdb_register_io_module(struct kgdb_io *local_kgdb_io_ops);
> -- 
> 2.21.1
> 


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
