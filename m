Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2E763851
	for <lists+kgdb-bugreport@lfdr.de>; Tue,  9 Jul 2019 16:59:56 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1hkrb1-0001O8-Ne
	for lists+kgdb-bugreport@lfdr.de; Tue, 09 Jul 2019 14:59:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1hkrb0-0001O1-Ky
 for kgdb-bugreport@lists.sourceforge.net; Tue, 09 Jul 2019 14:59:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=N67Qa6q9CITh5hKRJQifXm/LEYOhI8c6TcpZdYd27zA=; b=K54Q2J7JnG6TbfHNlK822OW2Rj
 cWEWouzk8VJ/WZfVwmvSB96U4LltS2/25+50ByreT0OFkJsD5RHET30vzJ0mNR64dYaJHEzZnzYVQ
 K6Y9ulScYuow+PWkghQPlAQSsOPDhDc9tSjRhR2LrDMM+YkZz4q+PqDKvL5MvRDmTrnY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=N67Qa6q9CITh5hKRJQifXm/LEYOhI8c6TcpZdYd27zA=; b=cQeLb1CXp+71E0wggOGaS/ZTKK
 mFefIUh6zYm7K6eE9q5b8zz4BrH7JpeV+O9hqJ1T0CMKupUAK9RqBBupb1vF06cF87gl+eXn3M6lW
 Xex6P5T8F/+McmkuuhWXZguiAxi0vTbPFHdwsX7IfFMIiCdLetNeQpRzpYdEol1ywl4g=;
Received: from mail-wm1-f67.google.com ([209.85.128.67])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hkray-00D2PU-VN
 for kgdb-bugreport@lists.sourceforge.net; Tue, 09 Jul 2019 14:59:54 +0000
Received: by mail-wm1-f67.google.com with SMTP id l2so3606298wmg.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 09 Jul 2019 07:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=N67Qa6q9CITh5hKRJQifXm/LEYOhI8c6TcpZdYd27zA=;
 b=I5PzqdSHsvp5rRiQg3IHSmXPUNbpfzjZCJWETQgBq0gGsY2dpSwITCpqwfNyNu4SQu
 Nwlk8JtsMvbxgY9Km67zmwGKh+YHkPSZytNXGX7RVmoGPcnIfOJkQrFpCK/MmlaTt9X7
 Bb3qZba9bfRr0/BAyZzIsVaZaBTGifOpOdr8mgjoXqZiYnXkZ/bEzzlnN9hgvRd0OSKY
 OjcCPcO6DyEFUUq5gh6YIEcj9ZOv26RKmAEUBnsXv5kleW+sQfik2d2Q1fnj6V5VomEd
 CnJfkLzQzLxjCdd1w4u6UhmFu70ZwXTcYNBqe3mWXw3aHXJpp2PNK0GixoX9+JT9sZrp
 ydkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=N67Qa6q9CITh5hKRJQifXm/LEYOhI8c6TcpZdYd27zA=;
 b=lReffHDMDw0iORAtb7r8QbDrsjS4+mFHR73pr/INh1IeN6/Qqay1aC7Oe5pOiBGo3i
 grSLdaWsrLAhWSBJByMaCueC0Duwc5xU6YRFGxSsmMWX4M2y76BYGiJIgPLGNPjeikV0
 1+mtRBg0IYUuefMcR4njADS6kXv7UEYc8urCd6qIC1HgtK1T/0leIFCbBl3FVwykHqMF
 Bo6nc+NEWfC7oz9kcT2vi4MTYd903FH3y77cNk1+tC3+Bjk06bV/A77W1UuGy8Ehi/4D
 XZrpxhtBNT9UrAPzcmRr4Mtp4GenRzL0UPipc9RMaGlNWmkXDCa2wLkTfTrqa2G2MQAT
 u9pw==
X-Gm-Message-State: APjAAAV2sC64ZPIn73ZRbgjI7VByI7chaKqs8h1Lr3G+vkGboSfFdN02
 zBqrJQq6fWD05g26wE8KBEyKMA==
X-Google-Smtp-Source: APXvYqzNFbm8ko779athQfkca7KYeM7dPD+SSU+3KMi9EyHqgswDqcv64VrseTODuZghVuVmRqSeQA==
X-Received: by 2002:a05:600c:da:: with SMTP id
 u26mr390611wmm.108.1562684386373; 
 Tue, 09 Jul 2019 07:59:46 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id v4sm2986480wmg.22.2019.07.09.07.59.45
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 09 Jul 2019 07:59:45 -0700 (PDT)
Date: Tue, 9 Jul 2019 15:59:43 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Douglas Anderson <dianders@chromium.org>
Message-ID: <20190709145943.zfwvs7inlngtxwfe@holly.lan>
References: <20190703170354.217312-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190703170354.217312-1-dianders@chromium.org>
User-Agent: NeoMutt/20180716
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.67 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.67 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 1.3 PDS_NO_HELO_DNS        High profile HELO but no A record
 -1.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hkray-00D2PU-VN
Subject: Re: [Kgdb-bugreport] [PATCH] kgdb: Don't use a notifier to enter
 kgdb at panic; call directly
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
Cc: Feng Tang <feng.tang@intel.com>, Kees Cook <keescook@chromium.org>,
 kgdb-bugreport@lists.sourceforge.net, YueHaibing <yuehaibing@huawei.com>,
 linux-kernel@vger.kernel.org,
 "Steven Rostedt \(VMware\)" <rostedt@goodmis.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 Martin Schwidefsky <schwidefsky@de.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, Borislav Petkov <bp@suse.de>,
 Thomas Gleixner <tglx@linutronix.de>,
 Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Wed, Jul 03, 2019 at 10:03:54AM -0700, Douglas Anderson wrote:
> Right now kgdb/kdb hooks up to debug panics by registering for the
> panic notifier.  This works OK except that it means that kgdb/kdb gets
> called _after_ the CPUs in the system are taken offline.  That means
> that if anything important was happening on those CPUs (like something
> that might have contributed to the panic) you can't debug them.
> 
> Specifically I ran into a case where I got a panic because a task was
> "blocked for more than 120 seconds" which was detected on CPU 2.  I
> nicely got shown stack traces in the kernel log for all CPUs including
> CPU 0, which was running 'PID: 111 Comm: kworker/0:1H' and was in the
> middle of __mmc_switch().
> 
> I then ended up at the kdb prompt where switched over to kgdb to try
> to look at local variables of the process on CPU 0.  I found that I
> couldn't.  Digging more, I found that I had no info on any tasks
> running on CPUs other than CPU 2 and that asking kdb for help showed
> me "Error: no saved data for this cpu".  This was because all the CPUs
> were offline.
> 
> Let's move the entry of kdb/kgdb to a direct call from panic() and
> stop using the generic notifier.  Putting a direct call in allows us
> to order things more properly and it also doesn't seem like we're
> breaking any abstractions by calling into the debugger from the panic
> function.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

This patch changes the way kdump and kgdb interact with each other.
However it would seem rather odd to have both tools simultaneously
armed and, even if they were, the user still has the option to
use panic_timeout to force a kdump to happen. Thus I think the
change of order is acceptable:

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.


> diff --git a/kernel/panic.c b/kernel/panic.c
> index 4d9f55bf7d38..e2971168b059 100644
> --- a/kernel/panic.c
> +++ b/kernel/panic.c
> @@ -12,6 +12,7 @@
>  #include <linux/debug_locks.h>
>  #include <linux/sched/debug.h>
>  #include <linux/interrupt.h>
> +#include <linux/kgdb.h>
>  #include <linux/kmsg_dump.h>
>  #include <linux/kallsyms.h>
>  #include <linux/notifier.h>
> @@ -219,6 +220,13 @@ void panic(const char *fmt, ...)
>  		dump_stack();
>  #endif
>  
> +	/*
> +	 * If kgdb is enabled, give it a chance to run before we stop all
> +	 * the other CPUs or else we won't be able to debug processes left
> +	 * running on them.
> +	 */
> +	kgdb_panic(buf);
> +
>  	/*
>  	 * If we have crashed and we have a crash kernel loaded let it handle
>  	 * everything else.
> -- 
> 2.22.0.410.gd8fdbe21b5-goog
> 


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
