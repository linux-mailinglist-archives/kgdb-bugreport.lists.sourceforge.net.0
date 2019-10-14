Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 66EDBD674E
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 14 Oct 2019 18:29:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1iK3DU-0006n7-7Q
	for lists+kgdb-bugreport@lfdr.de; Mon, 14 Oct 2019 16:29:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1iK3DS-0006mx-Ib
 for kgdb-bugreport@lists.sourceforge.net; Mon, 14 Oct 2019 16:29:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rR4HHt9sUcCAtG9vjl4zLc6ifKuatlbyyZBo1ocXxP8=; b=ScaQPNwslZDH7SuewcOVvLgBfS
 Cr8GPCfZW6k8erB9vIIA0LcxI/u9oxElnnSJpGIsk5e6mvOgJ4EZlA6gQhVSLEUESzyciPKIjpqUP
 byobOVbQNrGtVo+ssZsnXURydkMeAYppAZPnwhxittPBc0/w7fXT2cNWLXhxx/WswUds=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rR4HHt9sUcCAtG9vjl4zLc6ifKuatlbyyZBo1ocXxP8=; b=bxXm38bn55hyKTmuseLqyVLCLY
 Mw+3pIvGj0ufSR3RzDkY5rqoPZ0+tWseb6hEKeqd/5niYWIk3ZAWScT2cXyHGUw8PPkn7NV/tWH5h
 cgxK/TBFjBPixudS8n2w5x0QctHFPGz91/p1q/QU+eLgkCmwOrZXmrvqfe2apSZ/jcvY=;
Received: from mail-wm1-f67.google.com ([209.85.128.67])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iK3DM-000gr1-Kk
 for kgdb-bugreport@lists.sourceforge.net; Mon, 14 Oct 2019 16:29:02 +0000
Received: by mail-wm1-f67.google.com with SMTP id 3so17383898wmi.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 14 Oct 2019 09:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=rR4HHt9sUcCAtG9vjl4zLc6ifKuatlbyyZBo1ocXxP8=;
 b=GSoVeTWOXMaWnHP1MS2tl1J4MneC+RHaKf1ZXRIFJFBAu/PSKG6LKdD4T46Iuerd9s
 qfAG9Fp7et6D7dU+Web0FQJam1ass/TdkYGu44TJ7GgF08BL5BIgrdoW/0nKy2pGobkE
 a9xSKETW18UFUoG/Pzl7DWF+WD1VS+K75LnUSnnlR1ybDlO5ZGSKiyqwSRa8uROAXUfV
 XPumTgp0sjcocgmB/dISROI52ps6sMYj9iT6OTWJUGtDOrGTyVGKvjIWKOu8weQTwNre
 4hGFwLjxSrKTOYWD0JEzIElPaLJxLdt7nGHRPeJR0DiiS0KN5G7qnGFIif1lywQbHc/y
 dBSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=rR4HHt9sUcCAtG9vjl4zLc6ifKuatlbyyZBo1ocXxP8=;
 b=R9HlByw+M+XC25ayGqQgWcZaJnCIwJdPYSJgGB2r6+XJAbu6lhYvhc9hYMxghC4wZZ
 DsMs40a1ZrVjFvH01zOpHjVSTh6toxAhp+nRuRnf91BhGpY6zCibwtxs7SFPuhb5OVhf
 IxpSP8w5OQQM5O677F9d5R97MdZadbwOg6xBzLxsdBpGJveyCPED76zOhJKd2PQ6AIAZ
 zhcO2iBkZ7wvP2rNgQyUiz2FifobgcwQ+cKnJOoVCOnmrDkY7WYHvXoEWaSvXOxXISVG
 azYIkFjQtLllk65LOEYx0XSZkbcIfTYqg+wpzH4C5CzYUnCR5poX0n0WqeZ6ZBInDgJb
 CdJg==
X-Gm-Message-State: APjAAAVHMbvaLgJZserljMDe/HE6O5A+dCs2Ng1k6895GXuo0/7oFiwG
 EBYamqZD8yL02uzUhwATBU1ZYw==
X-Google-Smtp-Source: APXvYqwyqujMWffkPiPAQfBJGd2YLo5bKm8byYy+9RVKQ7jWMRFKN/SVhY6dr7Zj0uk2exqQPnaY7g==
X-Received: by 2002:a7b:cc07:: with SMTP id f7mr15077392wmh.56.1571070530048; 
 Mon, 14 Oct 2019 09:28:50 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id h18sm7073619wrr.78.2019.10.14.09.28.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2019 09:28:49 -0700 (PDT)
Date: Mon, 14 Oct 2019 17:28:47 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Douglas Anderson <dianders@chromium.org>
Message-ID: <20191014162847.kshvdwcahyjbtweo@holly.lan>
References: <201910110030.gUpQOCmR%lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <201910110030.gUpQOCmR%lkp@intel.com>
User-Agent: NeoMutt/20180716
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: intel.com]
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
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iK3DM-000gr1-Kk
Subject: Re: [Kgdb-bugreport] [danielt-linux:kgdb/for-next 4/4]
 kernel/debug/debug_core.c:452:17: warning: array subscript is outside array
 bounds
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
 Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi Doug

On Fri, Oct 11, 2019 at 12:41:31AM +0800, kbuild test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/danielt/linux.git kgdb/for-next
> head:   2277b492582d5525244519f60da6f9daea5ef41a
> commit: 2277b492582d5525244519f60da6f9daea5ef41a [4/4] kdb: Fix stack crawling on 'running' CPUs that aren't the master
> config: sh-allyesconfig (attached as .config)
> compiler: sh4-linux-gcc (GCC) 7.4.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout 2277b492582d5525244519f60da6f9daea5ef41a
>         # save the attached .config to linux build tree
>         GCC_VERSION=7.4.0 make.cross ARCH=sh 
> 
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
> 
> Note: it may well be a FALSE warning. FWIW you are at least aware of it now.
> 
> All warnings (new ones prefixed by >>):
> 
>    kernel/debug/debug_core.c: In function 'kdb_dump_stack_on_cpu':
> >> kernel/debug/debug_core.c:452:17: warning: array subscript is outside array bounds [-Warray-bounds]
>      if (!(kgdb_info[cpu].exception_state & DCPU_IS_SLAVE)) {
>            ~~~~~~~~~^~~~~
>    kernel/debug/debug_core.c:469:33: warning: array subscript is outside array bounds [-Warray-bounds]
>      kgdb_info[cpu].exception_state |= DCPU_WANT_BT;
>    kernel/debug/debug_core.c:470:18: warning: array subscript is outside array bounds [-Warray-bounds]
>      while (kgdb_info[cpu].exception_state & DCPU_WANT_BT)
>             ~~~~~~~~~^~~~~

Thoughts on the following?

From 9e0114bc9ae504c3a7e837c977d64f84b2010d8e Mon Sep 17 00:00:00 2001
From: Daniel Thompson <daniel.thompson@linaro.org>
Date: Fri, 11 Oct 2019 08:49:29 +0100
Subject: [PATCH] kdb: Avoid array subscript warnings on non-SMP builds

Recent versions of gcc (reported on gcc-7.4) issue array subscript
warnings for builds where SMP is not enabled.

There is no bug here but there is scope to improve the code
generation for non-SMP systems (whilst also silencing the warning).

Reported-by: kbuild test robot <lkp@intel.com>
Fixes: 2277b492582d ("kdb: Fix stack crawling on 'running' CPUs that aren't the master")
Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 kernel/debug/debug_core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
index 70e86b4b4932..eccb7298a0b5 100644
--- a/kernel/debug/debug_core.c
+++ b/kernel/debug/debug_core.c
@@ -449,7 +449,8 @@ void kdb_dump_stack_on_cpu(int cpu)
 		return;
 	}
 
-	if (!(kgdb_info[cpu].exception_state & DCPU_IS_SLAVE)) {
+	if (!IS_ENABLED(CONFIG_SMP) ||
+	    !(kgdb_info[cpu].exception_state & DCPU_IS_SLAVE)) {
 		kdb_printf("ERROR: Task on cpu %d didn't stop in the debugger\n",
 			   cpu);
 		return;
-- 
2.21.0



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
