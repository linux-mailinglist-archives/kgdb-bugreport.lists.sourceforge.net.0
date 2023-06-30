Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 939F3743EEE
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 30 Jun 2023 17:32:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1qFG6g-0005Vo-D5
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 30 Jun 2023 15:32:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daniel.thompson@linaro.org>) id 1qFG6f-0005Vi-QI
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 30 Jun 2023 15:32:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=txeggcAXbRmMDpa24OQ4hQFnGXTegi/WFNEbs/267Mk=; b=NR67qZ6WnZRKmkKXDUBXODDSiu
 nWbGzOMfywSGIfof604vdSsd8lBCY1CQ3NI2eRFvSXWlqLZow4yaOxS4SLHLstfiWhNMLwXOTs6Ro
 CSMqe+QYi+GSL6nSt+b0Np1qIhSibKXfFwA9L7DapcihLeJTgowfaptCHqIkeVV58zYk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=txeggcAXbRmMDpa24OQ4hQFnGXTegi/WFNEbs/267Mk=; b=ZCmHx2IlI1G1xxI2Gj1UIPFrQv
 hcUunaKdCP1zsHKIlPRDDqoiF02IHpbipKGxm23g8vUoRwQk+alTmwbGfPNM8lvOFd+7a3Jgjcml1
 V44P7fhvDiRTn8z+djqmrgZQM/yatY5CLX0XurHRjLKjLptXXulqTH/2QZZVR4cuxEhk=;
Received: from mail-ej1-f49.google.com ([209.85.218.49])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qFG6Z-0004lO-WF for kgdb-bugreport@lists.sourceforge.net;
 Fri, 30 Jun 2023 15:32:21 +0000
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-992ca792065so155093366b.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 30 Jun 2023 08:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688139129; x=1690731129;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=txeggcAXbRmMDpa24OQ4hQFnGXTegi/WFNEbs/267Mk=;
 b=hE4RmmwV5lg7S6mBCKl/43rOeOqnxpDow2ILPtTrmKmHCa8QtuO7hBevRaknB8xIHV
 iyfeAHreR5bZCEo+HP48UtMOre+pB0i+/JRI48fgcFyrloxt1Dwm9TMo3Ka3iahCT9De
 r5vjk5eSp9YCn8lt5313vuR+/5UdnXI/VFueYLxC9G9uyNoNV65A080nNdJkjl3W/W1I
 4gDaqQ5P1QiAJUtJHbLbN4zqtKI/SMRGVH2aFp7EeJHESELanyKxTSANtIKBi18mc1Es
 /Mz+AmllCFzKzqYJBNTN3C3RCBr7CMphXDYVN85C/Sx+2FYISHxNN6K8yH7Z9ip7Ww+B
 y1dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688139129; x=1690731129;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=txeggcAXbRmMDpa24OQ4hQFnGXTegi/WFNEbs/267Mk=;
 b=DwTy/lJKas1cJdazT8Ah+BiHE9MfIbXe9ktv4Z8I6NEbJVjAl58QEofDbDpCpcDjln
 V3rkYj+dvpYlQx7e8SqCUW99v19PSS8075dylTaMjRQCOunl/OWlbdzY/y9Xo6no40dq
 u6duVb3aPDrYgMjmZlU+9Z7kz3Iu6DMvFhIR9KVALLiZbFL+emPWYowFRoRP47IPS91m
 1F6aNcx5YF2ADw35mgntpL1tyE6HDOdga+KDGX//2NeDFqmgz6aCv0UOWk4pWC8Fi9Fi
 ySdqZfm+6CWbq5CmDNpiPJnyFfQKjxEOI94/ps+Ban9GtzKXUTwTRoD6v2+WwcrQ4T2+
 IdzA==
X-Gm-Message-State: ABy/qLZH1hUJhzYMKLwMJzn2T6Y1CjWINu1rfOCPPow9dYvmSidryLyy
 BOrP7J3wSPomn+bftE141q9B+np8uJVmamjzK9S/gA==
X-Google-Smtp-Source: APBJJlFJPfsgrb4tFvXFPv9Ql8tUEzNhxmocRvXDbrIXKHjxgGW/kXmSw/ls3sv5mndZZvUUnNTV0A==
X-Received: by 2002:a05:6512:2815:b0:4fb:893e:8ffc with SMTP id
 cf21-20020a056512281500b004fb893e8ffcmr2950126lfb.17.1688138681214; 
 Fri, 30 Jun 2023 08:24:41 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 m13-20020a7bcb8d000000b003fba97b1252sm9313936wmi.1.2023.06.30.08.24.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jun 2023 08:24:40 -0700 (PDT)
Date: Fri, 30 Jun 2023 16:24:39 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Arnd Bergmann <arnd@kernel.org>
Message-ID: <20230630152439.GA2900969@aspen.lan>
References: <20230517125423.930967-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230517125423.930967-1-arnd@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, May 17, 2023 at 02:54:09PM +0200,
 Arnd Bergmann wrote:
 > From: Arnd Bergmann <arnd@arndb.de> > > kdb_send_sig() is defined in the
 signal code and called from kdb, > but the declaration is part [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.218.49 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.218.49 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1qFG6Z-0004lO-WF
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
Cc: Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 Peter Zijlstra <peterz@infradead.org>, kgdb-bugreport@lists.sourceforge.net,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-kernel@vger.kernel.org,
 Jason Wessel <jason.wessel@windriver.com>, Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Wed, May 17, 2023 at 02:54:09PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> kdb_send_sig() is defined in the signal code and called from kdb,
> but the declaration is part of the kdb internal code.
> Include this from signal.c as well to avoid the warning:
>
> kernel/signal.c:4789:6: error: no previous prototype for 'kdb_send_sig' [-Werror=missing-prototypes]
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Sorry to be so late with this feedback! I got as far as queuing this up
for merge before the penny dropped...

> ---
>  kernel/signal.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/kernel/signal.c b/kernel/signal.c
> index 8f6330f0e9ca..d38df14f71ac 100644
> --- a/kernel/signal.c
> +++ b/kernel/signal.c
> @@ -4780,6 +4780,8 @@ void __init signals_init(void)
>
>  #ifdef CONFIG_KGDB_KDB
>  #include <linux/kdb.h>
> +#include "debug/kdb/kdb_private.h"
> +

Isn't is better to move the prototype for kdb_send_sig() into
linux/kdb.h instead?

That's what other kdb helpers spread across the kernel do
(kdb_walk_kallsyms() for example).


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
