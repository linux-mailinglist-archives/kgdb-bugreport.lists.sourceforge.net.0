Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 311151F5946
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 10 Jun 2020 18:41:56 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jj3nW-0002P4-WF
	for lists+kgdb-bugreport@lfdr.de; Wed, 10 Jun 2020 16:41:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1jj3nV-0002Op-Lk
 for kgdb-bugreport@lists.sourceforge.net; Wed, 10 Jun 2020 16:41:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TTc2Z9TJYfIzIFDGvsmvK6hVBSuHubFwRjTEnMfWZaM=; b=FoRQfiMp7r4pJdNw+lhXN5gkVQ
 FN6wo6Q3KVTs4HWhRF/C2DRSMdkpklg2t98Witf7+8xRv8GcBoDDaIIOaRuXp3ZxtiCCW1Qd+MtrE
 T+0z2XV+59FWBGq5/+jbpw8NbflYcZsZQeRlYva6QoC9AWhhGe7gX4ji74o+PH/0F40I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TTc2Z9TJYfIzIFDGvsmvK6hVBSuHubFwRjTEnMfWZaM=; b=R/IUZO9wegLoZ9L9EMbEO5Z8p1
 ybT6D8HQH1pss7pKpS0CWztKAa+atanKwGpFGBN3CqQnj1PzaFTn+F95dpjvvNQJXeT50oowZdjju
 ayV+SZsjOI7QvvgJta9qqQhKDtmZlFpws6WNLx1XyTyBPaVrV+98qvnNCLvWOdQQwyIQ=;
Received: from mail-wr1-f68.google.com ([209.85.221.68])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jj3nQ-00FnvW-UX
 for kgdb-bugreport@lists.sourceforge.net; Wed, 10 Jun 2020 16:41:53 +0000
Received: by mail-wr1-f68.google.com with SMTP id y17so3016280wrn.11
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 10 Jun 2020 09:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=TTc2Z9TJYfIzIFDGvsmvK6hVBSuHubFwRjTEnMfWZaM=;
 b=pph10uOEtVWjam0MSkFgGo4Ze7vfIPcKk6odG7zs9j3ckHtV6dSrZFvYRngFfziebB
 cxtk0NjObGiRy8wN9SmGHL49Kb7DzYcFhk5pHUB+JP6OKS1yZWGoI/dtIUYQsYDjoYX3
 VtRX2Rq2ddo0yrCHXBKA2PAujQ+mlS0axatU7a8MW1luLVOvTLnicnydMnOdC29MyM3s
 CIN4gEkyUn27E8YFfqVFZEqreJiXU9L6p/Hx2fnkGfksDNB10UgdClKdhgVqhq+XRPi3
 ydlK1J/898SkUYvP/hks3chUW+1loAhJs2PDjGWqtEn44D5BRUhd3pp5PIJFQckisksl
 PKCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=TTc2Z9TJYfIzIFDGvsmvK6hVBSuHubFwRjTEnMfWZaM=;
 b=gBxEfS3qgtVucCQb7MBOs50rrE4/Q1HaV55NZ5NrflJxMXjsSre1ab7M5QaboyBzw7
 LHWmt8odJJggiwWNbPvSWIcbUa8B+7XJRYumh2DO5nuIz9KcqUvcQ9n2miRYeJNdTExO
 4PymEvEPqs6ZMn330Mndyp0hk5Y3tGtKe3udyJxHvjwnO6Ew5Wu7yKVcwaFcqBzj9QNP
 cw2vWTWstsGZlAoX/1z1Et290qDcXtwnyJsgJaT9gAgxCAF2SHyiJ31Y+rNzzAfEjj6Q
 xcZILuuwysHrTPeUewirLswDHY379fWcM3a1gVYA0bUGBC5CZaOfTU1zvvlm/Mj5QE45
 Be2g==
X-Gm-Message-State: AOAM531SsGLbp2Efd/cxpdHNKWjL84kC0ZQU8h2Tj271geaq7NcFml0E
 dOxE+Sh3H0h7mze+eCZpbZFY5A==
X-Google-Smtp-Source: ABdhPJxSf03bcpYaW3bAJP347AmwFWa9hdgNrsHL4ylKCDUHlWLAvqSnNQSIgfujGyXZdFxFgFmM0w==
X-Received: by 2002:a5d:500d:: with SMTP id e13mr5001060wrt.150.1591807302549; 
 Wed, 10 Jun 2020 09:41:42 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id o15sm308644wmm.31.2020.06.10.09.41.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jun 2020 09:41:41 -0700 (PDT)
Date: Wed, 10 Jun 2020 17:41:40 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Message-ID: <20200610164140.tgzcn5oip2gzgmze@holly.lan>
References: <1589273314-12060-1-git-send-email-sumit.garg@linaro.org>
 <20200512142533.ta4uejwmq5gchtlx@holly.lan>
 <CAFA6WYOV7oPbYE=9fXueYMacb5wv0r9T6F8tmECt-Eafe-fctw@mail.gmail.com>
 <20200514084230.GO17734@linux-b0ei>
 <CAFA6WYPSsgdAB-wJC0e2YkVkW0XsqQsu5wrn4iB4M-cwvS7z2g@mail.gmail.com>
 <20200515085021.GS17734@linux-b0ei>
 <20200515103308.GD42471@jagdpanzerIV.localdomain>
 <CAFA6WYOBsimP1j8Fwq4OcePEug4MGoaY3wTTTVydHtTphZ-FTw@mail.gmail.com>
 <20200515163638.GI42471@jagdpanzerIV.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200515163638.GI42471@jagdpanzerIV.localdomain>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.68 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.68 listed in wl.mailspike.net]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: lkml.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jj3nQ-00FnvW-UX
Subject: Re: [Kgdb-bugreport] [PATCH] printk/kdb: Redirect printk messages
 into kdb in any context
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
Cc: John Ogness <john.ogness@linutronix.de>, Arnd Bergmann <arnd@arndb.de>,
 Petr Mladek <pmladek@suse.com>, Peter Zijlstra <peterz@infradead.org>,
 kgdb-bugreport@lists.sourceforge.net, Steven Rostedt <rostedt@goodmis.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Sat, May 16, 2020 at 01:36:38AM +0900, Sergey Senozhatsky wrote:
> On (20/05/15 17:32), Sumit Garg wrote:
> > > Can I please have some context what problem does this solve?
> > 
> > You can find the problem description here [1] which leads to this fix.
> 
> [..]
> 
> > [1] https://lkml.org/lkml/2020/5/12/213
> 
> Thanks for the link. I'm slightly surprised it took so many years
> to notice the addition of printk_nmi/printk_safe :)

Rather by coincidence (at least I think its a coincidence) the problem
has recently become much more obvious.

0d00449c7a28 ("x86: Replace ist_enter() with nmi_enter()") just brought
this to the surface by treating debug traps as NMIs. This means the CPU
that takes a breakpoint, and where almost all of the kdb printk() calls
take place, will now unconditionally have printk() interception enabled.


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
