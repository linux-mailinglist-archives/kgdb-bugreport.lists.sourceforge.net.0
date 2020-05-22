Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 262D61DED5B
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 22 May 2020 18:35:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jcAdl-0006aS-Um
	for lists+kgdb-bugreport@lfdr.de; Fri, 22 May 2020 16:35:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1jcAdl-0006aL-5T
 for kgdb-bugreport@lists.sourceforge.net; Fri, 22 May 2020 16:35:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aJwZ3Ckwgo1m0H1dH17N6VKfpW1UDHWvmlrmQBPFQ0Y=; b=gazjFd86JnO7hh3pUFSDOiHn1I
 QXjDTLxpaEqp28Rw0obBossk38y1DTL/aVxtwO8o0iWNwxSPUN32w6lzDdCaj9z/fKnN01HJpn1kL
 HiAtZmKkmV0SF9XPayhlUJp3+i7Bzi7J2vEr1swV3Y8vRCROQ654pMFmIVNljjZmxVlA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aJwZ3Ckwgo1m0H1dH17N6VKfpW1UDHWvmlrmQBPFQ0Y=; b=GQ+n8TMd2zA0CW6XpV+7ZcVpWU
 KrKsCsq1EaEYtNyxLXsxncoG9srGV7GnE2qHtZtKrPDMx0gdmE+A3nyYvOUk+ng99Z8zgTjPBkrJA
 BH4/7+s2oo/Li6XIIR0wdzPNPSP0ABre19kmTxMMdfWQEk/3N/71j3qby3r4eTw9JGuI=;
Received: from mail-wr1-f67.google.com ([209.85.221.67])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jcAdh-005Z18-G2
 for kgdb-bugreport@lists.sourceforge.net; Fri, 22 May 2020 16:35:21 +0000
Received: by mail-wr1-f67.google.com with SMTP id e16so10746348wra.7
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 22 May 2020 09:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=aJwZ3Ckwgo1m0H1dH17N6VKfpW1UDHWvmlrmQBPFQ0Y=;
 b=eoBQcU/hPq3Tho3ql0eupAFwWPYksaNn6M2AuoyE02KKzBjkGj4EkJUbuiCDBACi8S
 VehjIN4LHqNY7n6zJoEB5evLeJSLObftp8ANDCZn/KRJaNZvDkb7usMJF2Rs3VEreeM8
 u7vZiGnBXD/FNIETzkdaKLfPi8NQTvQNIpqWrtvFt/DBDIlRm6zc1rZpqu1da1Bkm3ti
 TNjn4IAPotifhxTXaOUcj5QCH+Q0BqDvHQdZuKcCG4HuE8KuhuRpuY3USOtRrLDnt2JS
 kg+ZF3b1ac4jdtQ40LZzTCvRrKGz6G/Uymr4+sFH6n3X4t1RgNCKPPAgkGCuz2jXjYuy
 sDww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=aJwZ3Ckwgo1m0H1dH17N6VKfpW1UDHWvmlrmQBPFQ0Y=;
 b=ZnPusVyZO2SK4VbzChE2lSavfju4hRgEAcZkyjiNqfJx75s3SzGDiH/1yv0ZchbJXw
 KcgwMYS5Hs6golp5i/iX6cnLkgVaTZy2p6KqAWkpxna+asA5xyoCHDLMnkOdmf8KOp8Z
 KMHEf52bKQ33K7EDyAGY3+hk7sWi9d9bheosMlMpoLDDJ5fU99gMus2jyVdLpd37o1i3
 d7ExBHOe30gl2uWwaOKkTpc3Zmra+1FypACj5cLg+ucknDOrk/1ajoaMVRHkj9lGlkeh
 GEkj4H/TdSzEEWzxTXbXsJjDepsOEfd5uelm6CEywcHdpyRNUxC2oGUhtOWDJIL4PPrr
 tWgw==
X-Gm-Message-State: AOAM532zUW5+lipF7AHpt2cFV4G6XqrI7O9jTb0cRWwuBNpiGPkYdYU+
 YyAuYLPp635U6razSJlLt5lUvQ==
X-Google-Smtp-Source: ABdhPJw0guDo/MfMaCq0B2Q9JalhSQNRqc3cjYJ1Pvcldrh+o3y5FDpBv0a/tek2Yd0Zf6CDaY/Cng==
X-Received: by 2002:a05:6000:1107:: with SMTP id
 z7mr3908152wrw.93.1590165311120; 
 Fri, 22 May 2020 09:35:11 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id p9sm9916855wrj.29.2020.05.22.09.35.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2020 09:35:10 -0700 (PDT)
Date: Fri, 22 May 2020 17:35:08 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Sumit Garg <sumit.garg@linaro.org>
Message-ID: <20200522163508.e7476dd2vulntppc@holly.lan>
References: <1590158027-15254-1-git-send-email-sumit.garg@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1590158027-15254-1-git-send-email-sumit.garg@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.67 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.67 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jcAdh-005Z18-G2
Subject: Re: [Kgdb-bugreport] [PATCH v2] kdb: Make kdb_printf robust to run
 in NMI context
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

On Fri, May 22, 2020 at 08:03:47PM +0530, Sumit Garg wrote:
> While rounding up CPUs via NMIs, its possible that a rounded up CPU
> maybe holding a console port lock leading to kgdb master CPU stuck in
> a deadlock during invocation of console write operations. So in order
> to avoid such a deadlock, invoke bust_spinlocks() prior to invocation
> of console handlers.
> 
> Also, add a check for console port to be enabled prior to invocation of
> corresponding handler.

Perhaps this should have been two patches.

In fact, to be honest, I'd suggest combining all the patches to improve
kdb console handling (including a fixed version of the RFC) into a
single patch set.


> Suggested-by: Petr Mladek <pmladek@suse.com>
> Suggested-by: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> ---
> 
> Changes in v2:
> - Use oops_in_progress directly instead of bust_spinlocks().
> 
>  kernel/debug/kdb/kdb_io.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
> index 924bc92..3a5a068 100644
> --- a/kernel/debug/kdb/kdb_io.c
> +++ b/kernel/debug/kdb/kdb_io.c
> @@ -699,7 +699,11 @@ int vkdb_printf(enum kdb_msgsrc src, const char *fmt, va_list ap)
>  			}
>  		}
>  		for_each_console(c) {
> +			if (!(c->flags & CON_ENABLED))
> +				continue;
> +			++oops_in_progress;

Given the subtly of what is going on I think we need some comments in
the code on what we are doing and why.


>  			c->write(c, cp, retlen - (cp - kdb_buffer));
> +			--oops_in_progress;
>  			touch_nmi_watchdog();
>  		}
>  	}
> @@ -761,7 +765,11 @@ int vkdb_printf(enum kdb_msgsrc src, const char *fmt, va_list ap)
>  			}
>  		}
>  		for_each_console(c) {
> +			if (!(c->flags & CON_ENABLED))
> +				continue;
> +			++oops_in_progress;
>  			c->write(c, moreprompt, strlen(moreprompt));
> +			--oops_in_progress;
>  			touch_nmi_watchdog();

As with the other patches maybe the first patch in the set should be
factoring out the common code before making changes to it.


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
