Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F8F1DE49B
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 22 May 2020 12:38:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jc54f-0003el-Hi
	for lists+kgdb-bugreport@lfdr.de; Fri, 22 May 2020 10:38:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1jc54e-0003eZ-9T
 for kgdb-bugreport@lists.sourceforge.net; Fri, 22 May 2020 10:38:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=u5ekOXjdCF2nXbH79Q7LEzQnOc+V4196q80nwEIT7VA=; b=PsKz70W5hIh5rgLkFNIrO/Aebm
 QgrGtt2pcOXhyHrhTX8NhoVu25qpgWxswicbxYvlXJ0VdrHIQdGvDjAQBkAXcwIfuJzj9S4v97b4m
 L+O+LDBd4kKV0lp9hgQMYt2Uh0muSiv9fEhfEL36tlLKbCcrQ7x4LQpOFw65+HDrKsMw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=u5ekOXjdCF2nXbH79Q7LEzQnOc+V4196q80nwEIT7VA=; b=UagNHx8NvJEOZd5FWMJ2oAP/Uk
 sbQjpxeNsBDxEhijLWMaTV1qJK8MhFApYrQaEYSNrwPf/8Zxnd70UVq4vLWfoVmXT1wOSvb5Xjt5L
 llK386jLmDs/aU8n1ih6rjfjkqqdBaoHg3P4Wom3TmmPCLDT91dpD4jcUU5UnEjnvG4s=;
Received: from mail-wr1-f67.google.com ([209.85.221.67])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jc54Z-005CQR-Qc
 for kgdb-bugreport@lists.sourceforge.net; Fri, 22 May 2020 10:38:44 +0000
Received: by mail-wr1-f67.google.com with SMTP id s8so9658790wrt.9
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 22 May 2020 03:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=u5ekOXjdCF2nXbH79Q7LEzQnOc+V4196q80nwEIT7VA=;
 b=jgx8gKPEEC5mEz2yG91WCd5ZuM4Tmq4dCB0P2h5QZSt1i3CBWgJVuVBSKsmNx64ozJ
 K1oMO9EQJpyOkKLDNiu9s7//cbq+ZUMpLZWg8kmH6G9svyi9AV1od3hvbpkpTzak3CMD
 gKwAgBoGpeBx+62gjOx0mLro+cpETGFAk6vlPlPFvYoozfUaS8Tl4zywEMYPHI8gJ5se
 uYeyWTGYuaBHwUaBjXCWFwbJkBdQ5/cLvKCmNArYBjxRjMd3m0my4cULw11OuqSXSK9+
 scdCP/LoGj3Ewn2ssu06CRRZ7oj+T1i8Z2qtT1m22DDCnvF1CuRwZAsxklUTF1mWNew6
 rOHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=u5ekOXjdCF2nXbH79Q7LEzQnOc+V4196q80nwEIT7VA=;
 b=nvJ9TlI6yh1wzooWwfX4yQhGmrjW3Sis9ybLsqKolreIM5/gYbyqXKida37gOu0QCz
 At3iL5ET6b9LJFp62yZHEv+Xy1JlLjsDfDRvQVugKtuCzbp/e0ZUzEDRPh6OTuStjKwC
 +s+j6SXkQUF5lYDOWrxvtzzQ/jhgehZH0I8Ctab31xInblclArfmSlUh+Icnzc00kLlQ
 LXdJ3qtpCaSFfZb/7M9fKq0CTD6UQHQoG/zK4RgisgBZ6EluNXBqzQpJkhfWum/p+saV
 RyIpjfsfkkwGkRBhIlHaET9QPSk0eKrfWeb/3Be8ULL/O42Uvgr1vwOFoAdAFrZizoEe
 zptg==
X-Gm-Message-State: AOAM532yBXG7FNuMaFlevumZ64DzGZLSSHSQ4OTJVWlBJwiPxhYKFXZf
 pL1H1HUnBd7qlQs1gPqa78W15Q==
X-Google-Smtp-Source: ABdhPJyVYVwpd2cGwbI1cwgrnY/FwYgZWa7g1HoGd9SZHh6oeSBCoGRmX2gu4z433mgSugYLpNKZ/A==
X-Received: by 2002:adf:f34f:: with SMTP id e15mr2826884wrp.408.1590143906200; 
 Fri, 22 May 2020 03:38:26 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id s8sm6278286wrg.50.2020.05.22.03.38.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2020 03:38:25 -0700 (PDT)
Date: Fri, 22 May 2020 11:38:23 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Sumit Garg <sumit.garg@linaro.org>
Message-ID: <20200522103823.uwb6jpjwpzhhjwwt@holly.lan>
References: <1590141746-23559-1-git-send-email-sumit.garg@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1590141746-23559-1-git-send-email-sumit.garg@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.67 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.67 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jc54Z-005CQR-Qc
Subject: Re: [Kgdb-bugreport] [PATCH] kdb: Make kdb_printf robust to run in
 NMI context
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

On Fri, May 22, 2020 at 03:32:26PM +0530, Sumit Garg wrote:
> While rounding up CPUs via NMIs, its possible that a rounded up CPU
> maybe holding a console port lock leading to kgdb master CPU stuck in
> a deadlock during invocation of console write operations. So in order
> to avoid such a deadlock, invoke bust_spinlocks() prior to invocation
> of console handlers.
> 
> Also, add a check for console port to be enabled prior to invocation of
> corresponding handler.
> 
> Suggested-by: Petr Mladek <pmladek@suse.com>
> Suggested-by: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> ---
>  kernel/debug/kdb/kdb_io.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
> index 924bc92..e32ece6 100644
> --- a/kernel/debug/kdb/kdb_io.c
> +++ b/kernel/debug/kdb/kdb_io.c
> @@ -699,7 +699,11 @@ int vkdb_printf(enum kdb_msgsrc src, const char *fmt, va_list ap)
>  			}
>  		}
>  		for_each_console(c) {
> +			if (!(c->flags & CON_ENABLED))
> +				continue;
> +			bust_spinlocks(1);
>  			c->write(c, cp, retlen - (cp - kdb_buffer));
> +			bust_spinlocks(0);

I think it might actually be better to directly manipulate oops_in_progress
here.

bust_spinlocks(0) will call unblank_screen() and console_unblank() and
I don't think calling these is worth the risk (and whilst kicking klogd
is safe I think its also not required).


Daniel.



>  			touch_nmi_watchdog();
>  		}
>  	}
> @@ -761,7 +765,11 @@ int vkdb_printf(enum kdb_msgsrc src, const char *fmt, va_list ap)
>  			}
>  		}
>  		for_each_console(c) {
> +			if (!(c->flags & CON_ENABLED))
> +				continue;
> +			bust_spinlocks(1);
>  			c->write(c, moreprompt, strlen(moreprompt));
> +			bust_spinlocks(0);
>  			touch_nmi_watchdog();
>  		}
>  
> -- 
> 2.7.4
> 


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
