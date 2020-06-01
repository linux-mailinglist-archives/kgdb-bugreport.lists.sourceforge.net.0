Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A3A1EA556
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  1 Jun 2020 15:53:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jfks7-0003i1-17
	for lists+kgdb-bugreport@lfdr.de; Mon, 01 Jun 2020 13:52:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1jfks5-0003hu-Oj
 for kgdb-bugreport@lists.sourceforge.net; Mon, 01 Jun 2020 13:52:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=F1iw9Hpuck8AM8pRE4CycfNLHeehYd1Uv2fKCoA7nVo=; b=fys5XTYahZxmKcgy+BmVr1JCfo
 LB6JODGmgxcM9LgAvuvBZa+7nijVv6V0T7kAsZQSSH0j+vd+Vu8qvcm1cAxUgx3f/FjDoGnh47rOJ
 6YL83uHY3SjKTxmnY380vyIc3yf302fRPdiuVHklfxOqaUAUZrWlufTUaSz6bXPPxow8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=F1iw9Hpuck8AM8pRE4CycfNLHeehYd1Uv2fKCoA7nVo=; b=b0ipiz69ug1gW+QSEICmWtPpNd
 vi1XG8zENvXeCOrSYwS4W5CwHqhTfT5KI6IOEYwYHzS27TdY6oWMYqwcxxzHAYleNkFGn3dbxovcj
 cJFgIxIQmxFRC22Vn9EtO3KTmXlwYUsyk5B+DpgXSIlS8CgyjyiF7HH+wwg8nT4xlJ5Y=;
Received: from mail-wm1-f66.google.com ([209.85.128.66])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jfks1-003qAz-BP
 for kgdb-bugreport@lists.sourceforge.net; Mon, 01 Jun 2020 13:52:57 +0000
Received: by mail-wm1-f66.google.com with SMTP id g10so3143508wmh.4
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 01 Jun 2020 06:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=F1iw9Hpuck8AM8pRE4CycfNLHeehYd1Uv2fKCoA7nVo=;
 b=TSIId/1ncWMqN+hGQdSVvMkwitQDP6VHScTb8Az3eCuxj4f3lZoIe88wlMIWn1JHlj
 2xlFTZ8z198hworkDJ2HnxqChv8tpVESrk8IcWVgt02p2ih4u7YCInsdviZ7N1a0I/wO
 0ty+3fMSgMBqhP1IhckAjSKmRNwge5I/b32gOZcUE5OixkI8TLpHxbG3OhPw0oDWFhVd
 1esVIf2OgydLZxW37XotF7n/mNDE8/q7/6uvjcily6AvU68l/ukAYE5YTPuM/i5svOUg
 dcoR7SafHASJo/wbQfaxT/VMENu6SfkZu/aDRwSGato+dmBhRho1ffoUTIqZDUOcKg8j
 jtWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=F1iw9Hpuck8AM8pRE4CycfNLHeehYd1Uv2fKCoA7nVo=;
 b=FaUUJIWBI2snRN+qLdMAG6isFK+N43s33EzL6kiZy2Fsg3Ez2pt1yA0HWaOGlIuOYE
 S874eVg2LVwJ80AMlMnzUN3tOfhdj18IwxpmAcC2JwR6eHn0CGUSwmdpFK48yiOFVGs1
 DMQ5b/hEqnugaOXkIedPa7qJsiAM5KsJoqIZcDp7P2oQSL9INNBOVcVKO4fNRy9XGiXu
 ot7dT5Rx8s7nMwcD5244Q2TvaGQdsYiDO0W72iIaoFVmvMdSfI2wbDPidlZA0/kebaDR
 LnJCTe08T4bKZQ7jFkBmwD4fs6KYkV6MdEe+lajnWzsYMW+64EmRiOma0idaCJFh8rxu
 cxFA==
X-Gm-Message-State: AOAM530HwCJ62KzJs9bViJH8N3r8KK4s2ZzIL/fPjtql0wUl/SoKxw/y
 jmd4QmC1tg2ri0p23QlZm2eWvQ==
X-Google-Smtp-Source: ABdhPJwK0wSNqyh9HH7lkQBQTDnu5WXcRVpX2yRw14fQmdb6zMGEXGXjfFVoUe52g2sy30zpADSMEw==
X-Received: by 2002:a7b:c764:: with SMTP id x4mr15221133wmk.94.1591019566888; 
 Mon, 01 Jun 2020 06:52:46 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id p10sm22190936wra.78.2020.06.01.06.52.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2020 06:52:46 -0700 (PDT)
Date: Mon, 1 Jun 2020 14:52:44 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Douglas Anderson <dianders@chromium.org>
Message-ID: <20200601135244.al7rtetn6o4bolgs@holly.lan>
References: <20200526142001.1.I523dc33f96589cb9956f5679976d402c8cda36fa@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200526142001.1.I523dc33f96589cb9956f5679976d402c8cda36fa@changeid>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.66 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.66 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jfks1-003qAz-BP
Subject: Re: [Kgdb-bugreport] [PATCH] kgdb: Don't call the deinit under
 spinlock
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
Cc: kgdb-bugreport@lists.sourceforge.net,
 Jason Wessel <jason.wessel@windriver.com>, linux-kernel@vger.kernel.org,
 akashast@codeaurora.org, mka@chromium.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Tue, May 26, 2020 at 02:20:06PM -0700, Douglas Anderson wrote:
> When I combined kgdboc_earlycon with an inflight patch titled ("soc:
> qcom-geni-se: Add interconnect support to fix earlycon crash") [1]
> things went boom.  Specifically I got a crash during the transition
> between kgdboc_earlycon and the main kgdboc that looked like this:
> 
> Call trace:
>  <snip>
>  ...
> 
> The problem was that we were holding the "kgdb_registration_lock"
> while calling into code that didn't expect to be called in spinlock
> context.
> 
> Let's slightly defer when we call the deinit code so that it's not
> done under spinlock.
> 
> NOTE: this does mean that the "deinit" call of the old kgdb IO module
> is now made _after_ the init of the new IO module, but presumably
> that's OK.
> 
> [1] https://lkml.kernel.org/r/1588919619-21355-3-git-send-email-akashast@codeaurora.org
> 
> Fixes: 220995622da5 ("kgdboc: Add kgdboc_earlycon to support early kgdb using boot consoles")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Just found this in my inbox... which suggested I forgot to post an
"Applied" last week when I pushed it for linux-next.

Expect the kgdb PR for this cycle shortly!


Daniel.


> ---
> 
>  kernel/debug/debug_core.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
> index 4d59aa907fdc..ef94e906f05a 100644
> --- a/kernel/debug/debug_core.c
> +++ b/kernel/debug/debug_core.c
> @@ -1089,7 +1089,6 @@ int kgdb_register_io_module(struct kgdb_io *new_dbg_io_ops)
>  		}
>  		pr_info("Replacing I/O driver %s with %s\n",
>  			old_dbg_io_ops->name, new_dbg_io_ops->name);
> -		old_dbg_io_ops->deinit();
>  	}
>  
>  	if (new_dbg_io_ops->init) {
> @@ -1104,8 +1103,10 @@ int kgdb_register_io_module(struct kgdb_io *new_dbg_io_ops)
>  
>  	spin_unlock(&kgdb_registration_lock);
>  
> -	if (old_dbg_io_ops)
> +	if (old_dbg_io_ops) {
> +		old_dbg_io_ops->deinit();
>  		return 0;
> +	}
>  
>  	pr_info("Registered I/O driver %s\n", new_dbg_io_ops->name);
>  
> -- 
> 2.27.0.rc0.183.gde8f92d652-goog
> 


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
