Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8922AFC4AF
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 14 Nov 2019 11:51:42 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1iVCiz-0004NU-Bb
	for lists+kgdb-bugreport@lfdr.de; Thu, 14 Nov 2019 10:51:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1iVCix-0004NN-Tn
 for kgdb-bugreport@lists.sourceforge.net; Thu, 14 Nov 2019 10:51:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Em/ldcBTiCkH89iKxfabm8RKdGIliRRbSNYWY3rbkD4=; b=LIgwsqsgGSE1aP0TBM2QYaCTXa
 jSJVeTkPfkaR/RrR2nsH12RcJl6uK8vZazUMUAu0C7ta/X99CLbWT9+OmR1PQysOcI9RhUfeNpQjr
 zZdZOoJt8Xa4hh9T+sESvvFoa4XoT0hdqGJEN3nCuI6y5XOO0SMg0H9C4p2aSlR+RyWg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Em/ldcBTiCkH89iKxfabm8RKdGIliRRbSNYWY3rbkD4=; b=JJ0YxBF0b7ZYL5r58WqXIhjC7R
 6b8hLxwkchTkqGDPbGsrGC2a+8N6wmQwAmKRKorA3C/GlOSjz2rgBMMAWx58FgAQFbuxYlvwks3AF
 O8H1SDtu2f8ji1k+6cyc2dmEr5e1iy8JrIlNGuKBFMJwtWh6zOs3A9lTVjBIOPv4XRx8=;
Received: from mail-wr1-f67.google.com ([209.85.221.67])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iVCit-00GQX9-BE
 for kgdb-bugreport@lists.sourceforge.net; Thu, 14 Nov 2019 10:51:39 +0000
Received: by mail-wr1-f67.google.com with SMTP id s5so5919762wrw.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 14 Nov 2019 02:51:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Em/ldcBTiCkH89iKxfabm8RKdGIliRRbSNYWY3rbkD4=;
 b=M8nTD+rJCM8aJ5Gr+BGRla3e74JOsongzpE3NPb9CW5En3sYtp6dkkCANBdmu4Jz2s
 3OovYM867yc+76ka0oIsnRZejqkVigTGWm/uX95LvJ9x/pfP7Ix456YKay2EgrcHPD7A
 r9X7n5J9D009fVndtxJF4c+IIwCeUq2zUdrH+nIp1EvedN9F9mGioF+zdNxdEqdxrPUi
 Qqr1SAFoGmSsxqs7etJR+8ZT+CjFyyrD0+ZkN9nH26YDuPtCvrmPheCA+N9ZpnjeddS4
 e8mkvd7L7Re3XqcJxui7bEIxMOhn+iMBKr0rJR+nBxluy05X8FHUEGA5gZbei/8UixgF
 1mVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Em/ldcBTiCkH89iKxfabm8RKdGIliRRbSNYWY3rbkD4=;
 b=e4VHlw7NP+/u6AbMCzC0YNYjSQyizNYFwLaGlJZ3Z9x2tAR7W/T6qsfmDYQZvU7hfA
 2IMjLmqan65htVE4opkphmSgj135eYI097traeb+0vfLZoCeB5k72vwZe8COYw7OB4il
 IokwowmkU1PDZOAFzUQUGwiS3udRY6+DLK7VwAnjwJCIZF6QmlVzAut7IUCRWEzItl7Q
 tSzIhj5b4+97z0+GfGtIU8BXCH5vND4RGGD16KLbv9tUbi1gaMIOkrrYPpDxLPKxAmNW
 XsAAKx/HujuAOuwNXS2OJUzskQdrSCl6ndTJCzN4mzWiNj3gRg2Vm12rMFirBSvUuA+y
 v3yQ==
X-Gm-Message-State: APjAAAWbJkhhMSAqt1rQe4bQe+RRzPtrq9Iei0ZDB/QYVWzuX+020vR6
 fJUR8F3TBcG9QTy2+QRFh1tu/Q==
X-Google-Smtp-Source: APXvYqxaypmv9+7GkWChObVbu7wiDzQPNbv9TlnsTgRI+u9RhlgUkWuJB4t1Q8ZmN11y6dU12rOr2Q==
X-Received: by 2002:a5d:4608:: with SMTP id t8mr7789448wrq.91.1573728688622;
 Thu, 14 Nov 2019 02:51:28 -0800 (PST)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id k14sm7236681wrw.46.2019.11.14.02.51.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Nov 2019 02:51:27 -0800 (PST)
Date: Thu, 14 Nov 2019 10:51:25 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Douglas Anderson <dianders@chromium.org>
Message-ID: <20191114105125.t3jma3ghwj2wtv6w@holly.lan>
References: <20191109191644.191766-1-dianders@chromium.org>
 <20191109111623.1.I30a0cac4d9880040c8d41495bd9a567fe3e24989@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191109111623.1.I30a0cac4d9880040c8d41495bd9a567fe3e24989@changeid>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
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
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iVCit-00GQX9-BE
Subject: Re: [Kgdb-bugreport] [PATCH 1/5] MIPS: kdb: Remove old workaround
 for backtracing on other CPUs
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
Cc: qiaochong@loongson.cn, kgdb-bugreport@lists.sourceforge.net,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-kernel@vger.kernel.org, ralf@linux-mips.org,
 Mike Rapoport <rppt@linux.ibm.com>, Paul Burton <paul.burton@mips.com>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Jason Wessel <jason.wessel@windriver.com>, James Hogan <jhogan@kernel.org>,
 Serge Semin <fancer.lancer@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mips@vger.kernel.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Sat, Nov 09, 2019 at 11:16:40AM -0800, Douglas Anderson wrote:
> As of commit 2277b492582d ("kdb: Fix stack crawling on 'running' CPUs
> that aren't the master") we no longer need any special case for doing
> stack dumps on CPUs that are not the kdb master.  Let's remove.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> I have no way to test this personally, so hopefully someone who uses
> kdb/kgdb on MIPS can.

I took this as a hint to add mips support to kgdbtest ;-)

Support is added and working well. Unfortunately lack of familiarity
with mips means I have not yet figured out which mips defconfig gives
us working SMP (and what the corresponding qemu invocation should be).

I think that means I still can't (quite) exercise this code fully.
The most appropriate test is bta on an SMP system, right?


> Ideally this patch should be Acked by MIPS folks and then land through
> the kdb/kgdb tree since the next patch in the series, ("kdb:
> kdb_current_regs should be private") depends on it.

An Acked-by from a MIPS maintainer would be very welcome. Perhaps
with a bit of extra work on the above I might be able to provide
a Tested-by:.

I didn't see anything that particularly bothered me in the patches but
given we're already at -rc7 I'm inclined to target this patchset for 5.6
rather than 5.5.


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
