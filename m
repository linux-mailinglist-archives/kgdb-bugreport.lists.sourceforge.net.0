Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E9C743F0C
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 30 Jun 2023 17:39:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1qFGDV-0002rI-CR
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 30 Jun 2023 15:39:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daniel.thompson@linaro.org>) id 1qFGDT-0002rC-C6
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 30 Jun 2023 15:39:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7yi29T2vIRc/Jr/dhBuRnalltZFUrcB3TL1AHhUs3Ac=; b=iafTFwRVNBix6DdwhmsdORRA+m
 IHWI5ImHyFKFGYd54sZiZDX3k7cxbXvajNOvN0AM5wKLWMUuCui/o7PMj/1pYAOqRngZeTeGHzOCk
 z6pBiMPaGJ0D5F+8e7MzniPzLJ6OyFz9PmDYmh8jAdvrRK4ODqqcu/ZG4qKqOYU6rx94=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7yi29T2vIRc/Jr/dhBuRnalltZFUrcB3TL1AHhUs3Ac=; b=gTYCMMqz4MxMI2nOmBAa8zBmpJ
 b3yKUAKgcLB+1HYZzAUqLVe8R30OZoGE2ZVPpglX/97ZcjNiLrlUlQsk8k2Itz5Hzzx9NcDlHiLc2
 kxgSHIVihkWG7X4D4UMvQvlOpAhXbC4GP93B37sEmLmXC04lToIdkaiynaBb55hPAYO0=;
Received: from mail-wm1-f46.google.com ([209.85.128.46])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qFGDO-002G8J-SZ for kgdb-bugreport@lists.sourceforge.net;
 Fri, 30 Jun 2023 15:39:24 +0000
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-3fbab0d0b88so17806065e9.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 30 Jun 2023 08:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688139552; x=1690731552;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=7yi29T2vIRc/Jr/dhBuRnalltZFUrcB3TL1AHhUs3Ac=;
 b=porJS4cNiq0PjO2bJCZpC9PtrP/jBSNRNCHCMms0COrdpb24HZ9mQOG0UvxYsi7giN
 CHo1u9lWrjX1U1G1TTptJiIwBETa2urzNXGVDdgm4sNJkqwIedPzNcAaxVPGx7B9G2ii
 IKmHmDLuOGIdlaube7+7onpPwRNFsLiAKFO6TbjzNcnwZmt8QWVpkJnhl1I2PsVLqNXU
 lHbfBtL43wR3SYGXcqOpNURLa+bh73QiaNkC8ELOQGhK0pDAUBOgrLLROMVdcWR5h1Lc
 T4jnf5ILyLXKUgAYpwEhN4aOww6pIEuYRmC9eV/KKsf9HrRBQdJtd3Ilw4/8Ea9Zs0Xt
 QEBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688139552; x=1690731552;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7yi29T2vIRc/Jr/dhBuRnalltZFUrcB3TL1AHhUs3Ac=;
 b=ZpsPT7B289BAuASsnTJD8JuCtQADOJPb+2YbFvz2MoLPG+rMjcRpAqCj1Rli8ggnLE
 Chho2v6vH34ix53Ud3z1iqdQ2zr0ENAvzt4B11uYGREJePKnsvJW6vrE0HwzUIAEdxVB
 PBrILtvpnTT5bUn2jmVZ7XF+KKRSv5Z3e2BmoqnsuVDfsE+bRsPIkyrwGYeAw7qvE4Hv
 hKS5FTGJo0s5Zeo/+wsE2FC7nRaojRr4+U0IBiWPY6fTh5gC/aVBJecL9AZDwWqUGdDL
 IBQXwg1WNyCQ9MvDhJucIHipD40LLOtjieHM6J03RXJFejzZSZwY2+5enD8TDtmM0jBv
 3JhQ==
X-Gm-Message-State: AC+VfDzHVvlGtGA0dcDCLxpr6lxVzdIa0lZwCAWm5gAPqNWCjj3PuXrI
 nBPxQ7MYGo3hIN2ouhzdE4UCTA==
X-Google-Smtp-Source: ACHHUZ6Q1gem7hiGijIceHRXD1Cr6EYxU0juZvCFx3zCNdKI/eDhA53E3sR0qwGk9NjDMx3c8TEhjw==
X-Received: by 2002:a7b:c40d:0:b0:3f7:c92:57a0 with SMTP id
 k13-20020a7bc40d000000b003f70c9257a0mr3152415wmi.14.1688139552383; 
 Fri, 30 Jun 2023 08:39:12 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 x2-20020a5d54c2000000b003142439c7bcsm1546354wrv.80.2023.06.30.08.39.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jun 2023 08:39:12 -0700 (PDT)
Date: Fri, 30 Jun 2023 16:39:10 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <20230630153910.GA2901579@aspen.lan>
References: <20230517125423.930967-1-arnd@kernel.org>
 <20230630152439.GA2900969@aspen.lan>
 <51b8b3c2-f4ac-454c-acde-e1d136139109@app.fastmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <51b8b3c2-f4ac-454c-acde-e1d136139109@app.fastmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Jun 30, 2023 at 05:31:01PM +0200,
 Arnd Bergmann wrote:
 > On Fri, Jun 30, 2023, at 17:24, Daniel Thompson wrote: > > On Wed, May
 17, 2023 at 02:54:09PM +0200, Arnd Bergmann wrote: > >> diff --g [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.128.46 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.46 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1qFGDO-002G8J-SZ
Subject: Re: [Kgdb-bugreport] [PATCH] kdb: include header in signal handling
 code
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
Cc: Arnd Bergmann <arnd@kernel.org>, Kees Cook <keescook@chromium.org>,
 Peter Zijlstra <peterz@infradead.org>, kgdb-bugreport@lists.sourceforge.net,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-kernel@vger.kernel.org,
 Jason Wessel <jason.wessel@windriver.com>, Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Fri, Jun 30, 2023 at 05:31:01PM +0200, Arnd Bergmann wrote:
> On Fri, Jun 30, 2023, at 17:24, Daniel Thompson wrote:
> > On Wed, May 17, 2023 at 02:54:09PM +0200, Arnd Bergmann wrote:
> >> diff --git a/kernel/signal.c b/kernel/signal.c
> >> index 8f6330f0e9ca..d38df14f71ac 100644
> >> --- a/kernel/signal.c
> >> +++ b/kernel/signal.c
> >> @@ -4780,6 +4780,8 @@ void __init signals_init(void)
> >>
> >>  #ifdef CONFIG_KGDB_KDB
> >>  #include <linux/kdb.h>
> >> +#include "debug/kdb/kdb_private.h"
> >> +
> >
> > Isn't is better to move the prototype for kdb_send_sig() into
> > linux/kdb.h instead?
> >
> > That's what other kdb helpers spread across the kernel do
> > (kdb_walk_kallsyms() for example).
>
> Right, that is probably better here. Not sure if it's worth
> reworking the branch if you already merged it, the difference
> seems rather minor.

I figure it will take me as long to rework the branch as it will to
write the covering letter on the pull-request to explain why kgdb/kdb
is messing around in kernel/signal.c ;-) .


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
