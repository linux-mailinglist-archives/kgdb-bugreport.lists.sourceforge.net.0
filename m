Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F72D1E45CB
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 27 May 2020 16:26:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jdx0q-0003F3-2h
	for lists+kgdb-bugreport@lfdr.de; Wed, 27 May 2020 14:26:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1jdx0o-0003Ee-6l
 for kgdb-bugreport@lists.sourceforge.net; Wed, 27 May 2020 14:26:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Mly88rOWldb2hn6ZUpBbudlq0QPli1OI+xak074b4r4=; b=Be+Rx5gzWCFG1qANGxZ5YNB4H5
 y9Z3bJDE4EKyVYyUlf4SUnE2f3Eh0p0lHfNXPXyJrGerqiweeOLA87YKABJX3mkSexVnbAPfZqKQL
 EQVUNT+sYCll+gQk4gtNmrOqVpeVAJP0oE6QVlTlMrLNzBJbiJz9MpQsQRkBl/NaQ4G4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Mly88rOWldb2hn6ZUpBbudlq0QPli1OI+xak074b4r4=; b=Bbsxwzk9ZyOUvJUVI+pwD6cCed
 Eh7xtPUKL895J12BgfO3KFbYSIqGuOrDUHcDw9iwtTt3ghKJULgP7ni4ava3Ye74J5iG+D1P0/dP4
 H8viA9NJw1PpLsM7sl483tvgzvNXFtB5cQmqXt1rqq2jmJkvESPlNofZj3qABjKSda2Y=;
Received: from mail-wm1-f67.google.com ([209.85.128.67])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jdx0k-00Eup0-Kt
 for kgdb-bugreport@lists.sourceforge.net; Wed, 27 May 2020 14:26:30 +0000
Received: by mail-wm1-f67.google.com with SMTP id u26so2396664wmn.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 27 May 2020 07:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Mly88rOWldb2hn6ZUpBbudlq0QPli1OI+xak074b4r4=;
 b=lAj3+1b/p3m/ElrnylWgfn/5vAM5qlt1rTY6GYJMqKlpy+5swWInxuNIz8ay89ysVX
 hc8Pzyf7c0E+jRldyVyLLE8rScc7piJOSxcjE8PLU1GH0bXHL0rfcGhfwDFAVn7FKZ94
 f3HVHC9HU1SoQHT7yZOoYKcHdZWZL70//b9+xYaGv5rwmkxCyLnRWFHLChSXU3dsBxNV
 tPNC8prFGFq+u/6YnTni0cBmAkN2MQc5sSCySaBzuOkCenirCZgX4UP9Q0EoxKOd5nzv
 keB2wPsIVLoFf0Y5FLqgvswggZtbokmEZQP7V5VJJTCJ0soabWSO4axKZgomC8qEW/T1
 /lMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Mly88rOWldb2hn6ZUpBbudlq0QPli1OI+xak074b4r4=;
 b=O3CnvHp8oGHpAZa7cKOefY31xyHOgrbytXeRQThylI+wbCjSh4NZY5vuLzT3BD24x7
 jJc5loX8GtvTlENlobbmQav5Ky7HrNQtUoZPY8KDG5QKxsguazKrV8HpbHz0QFiDsH9r
 0UC+r5K44bWIGPA2PxdSJBMAikRFkAN24ZkMmhS7LSJXM8NfbYCgQ3BQRpc3uy1IU8+F
 okbTw33J4EgdYDJnbrxiZb7KSeCYIPWJCLwm9daBAYe3oE5YdaJuXdvzOVgd+hUlvaBY
 g8xXj5rTjP3qxdqwJBUJAmvWObrU2HPoqsHrUnf6lQfbdrG4Z1iaJ4k6YlDHu+j8uepY
 NVOA==
X-Gm-Message-State: AOAM532+pP9Qj2ePMm59pZBPV7t/z2xtrlPM2ZCsfSzS9/zQVqaCPjDS
 LtV/1f1cL8PIZCEH2hI/TDvCn8agDQw=
X-Google-Smtp-Source: ABdhPJwSEI2N+Z0JrEzzTe6BWOigRZOSAIjRwq1zxP+KiTxFgPixzdvK7ac/pvk3MQ7iCOeGdGApOQ==
X-Received: by 2002:a1c:f315:: with SMTP id q21mr4299691wmq.114.1590589580237; 
 Wed, 27 May 2020 07:26:20 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id s2sm2777668wmh.11.2020.05.27.07.26.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 May 2020 07:26:19 -0700 (PDT)
Date: Wed, 27 May 2020 15:26:17 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Sumit Garg <sumit.garg@linaro.org>
Message-ID: <20200527142617.t7dzal7ok5i3exra@holly.lan>
References: <1590560759-21453-1-git-send-email-sumit.garg@linaro.org>
 <1590560759-21453-4-git-send-email-sumit.garg@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1590560759-21453-4-git-send-email-sumit.garg@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.67 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: suse.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.67 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jdx0k-00Eup0-Kt
Subject: Re: [Kgdb-bugreport] [PATCH v3 3/4] kdb: Make kdb_printf robust to
 run in NMI context
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

On Wed, May 27, 2020 at 11:55:58AM +0530, Sumit Garg wrote:
> While rounding up CPUs via NMIs, its possible that a rounded up CPU

This problem does not just impact NMI roundup (breakpoints, including
implicit breakpoint-on-oops can have the same effect).


> maybe holding a console port lock leading to kgdb master CPU stuck in
> a deadlock during invocation of console write operations. So in order
> to avoid such a deadlock, enable oops_in_progress prior to invocation
> of console handlers.
> 
> Suggested-by: Petr Mladek <pmladek@suse.com>
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> ---
>  kernel/debug/kdb/kdb_io.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
> index 349dfcc..f848482 100644
> --- a/kernel/debug/kdb/kdb_io.c
> +++ b/kernel/debug/kdb/kdb_io.c
> @@ -566,7 +566,17 @@ static void kdb_msg_write(char *msg, int msg_len)
>  	for_each_console(c) {
>  		if (!(c->flags & CON_ENABLED))
>  			continue;
> +		/*
> +		 * While rounding up CPUs via NMIs, its possible that

Ditto.

> +		 * a rounded up CPU maybe holding a console port lock
> +		 * leading to kgdb master CPU stuck in a deadlock during
> +		 * invocation of console write operations. So in order
> +		 * to avoid such a deadlock, enable oops_in_progress
> +		 * prior to invocation of console handlers.

Actually looking at this comment as a whole I think it spends to many
words on what and not enough on why (e.g. what the tradeoffs are and
why we are not using bust_spinlocks() which would be a more obvious
approach).

  Set oops_in_progress to encourage the console drivers to disregard
  their internal spin locks: in the current calling context
  the risk of deadlock is a bigger problem than risks due to
  re-entering the console driver. We operate directly on
  oops_in_progress rather than using bust_spinlocks() because
  the calls bust_spinlocks() makes on exit are not appropriate
  for this calling context.


Daniel.


> +		 */
> +		++oops_in_progress;
>  		c->write(c, msg, msg_len);
> +		--oops_in_progress;
>  		touch_nmi_watchdog();
>  	}
>  }
> -- 
> 2.7.4
> 


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
