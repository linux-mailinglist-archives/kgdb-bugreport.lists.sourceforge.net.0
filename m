Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9F78A959B
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 18 Apr 2024 11:06:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1rxNil-0003pU-Bx
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 18 Apr 2024 09:06:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daniel.thompson@linaro.org>) id 1rxNii-0003p8-JE
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 18 Apr 2024 09:06:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=euB3vcyNRkqSsujp1rBWtIUz95ZDQeOsD0X15ArXVN8=; b=nUF/lAPxNkrd5VJHTJTtj/xsz7
 OkaYi2Kw0lXFpoDud81+cWl20tc2uH6Y4Q7XWSov1OE00Viq5/C3Knlgny+qxvxIe4zDL1iPaf3CG
 fSA36v00KYUBChO1wdhYMosMgHFATlFJov9sIeT2duVKz40pBKY8BCgPaLFaGokjixik=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=euB3vcyNRkqSsujp1rBWtIUz95ZDQeOsD0X15ArXVN8=; b=VrztpTHRHasLdDXkKJMYow8vUj
 Hu69tsGVndYi+EXBxwPmAbSHIwOgzuJDA09+EyA0tQPS/qnAIDNr66Ci8NnGu7ywljCBnC5CMCeNI
 SEzGTRxvgmgnCiPQ+GlUzOB/VM6cFkwXsXKIqLIBeSg6omxjtv9xjO8gCXXD62Gs/Cbs=;
Received: from mail-wm1-f47.google.com ([209.85.128.47])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rxNiP-0000Qy-Sm for kgdb-bugreport@lists.sourceforge.net;
 Thu, 18 Apr 2024 09:06:03 +0000
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4167fce0a41so10074385e9.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 18 Apr 2024 02:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713431141; x=1714035941; darn=lists.sourceforge.net;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=euB3vcyNRkqSsujp1rBWtIUz95ZDQeOsD0X15ArXVN8=;
 b=JibbOc9pgd8TeRZNWEmRS7zCTWRVkGraNX1w4rmvzbI9wyGeIQCVgCqcEuS7i3C7x6
 g+vfHOJNpMa1xfldo9tjO5HwIf2Honsbkt9yZGG8cqZlt39rtW4WO/9VCemiqEAy89u3
 i5I2wXmaU0Ew3WhO0SrxDpDCoUMArr/da5EfRwAkjkAPKhDQxfPBlfdbEYAve2ahBms2
 Ka5H54AFbybggeNPxXp/6QxVV/ts9i3Sdzsg9QCgScN4Zxi7rLuazPh3pHBokGPsxgDU
 XvrxRcwRofzILnc6Qm34aHX2wuuXKV7DEJdLU8uy+XMJ//ss7AJ12qri6mROLyCWLQUO
 2bGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713431141; x=1714035941;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=euB3vcyNRkqSsujp1rBWtIUz95ZDQeOsD0X15ArXVN8=;
 b=Z7GzVKMaEKLIF64rj/uFHSEuZGyw820M66Okp6ZoCtplUh5ghKxcAxX52hyh+BDOYQ
 2tPGmWAQ5SqXkh++vIjCE/dpc6ZwJXC2yTB0NqZYsKtkGLnMkYlxol6CwdbYm7fVPfLj
 ta2IU4SbpgnOn4bpNKKBCBAvEST/xh6igAe9dtkSSMEER8JAq5V0lg/fL8ne7gcrFPKS
 Vz0oNzwO7JHH590BEy00j4gMk4r9VgfZUXo/aFYPEqPDNPFwndH4FQqV2Do547AYCrJ1
 kGdtg59PVxkjdO83G28we9Mqqad+4oir/L0EFWltPLjva0DYN4P8DrR8YK8x4QulK4qk
 PrXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXNCNxQJbXQYzK0s/sacGN63SiJaPPUovd79NR2s6OWTHjjce9rWo+ydwUjFRDnFnZL1vAA/GFJIoaJsU1ltQKPLcZYubc5FGxB/TzR44ow+CBff/0=
X-Gm-Message-State: AOJu0YxAzruhrz6y4wI6ZdlI62iVDfs1yOMj3Eri9WPh0w7+yrzrfDbA
 UVuETAFv5rXHWKupkkInLQw/X0IIssBXBbUtyHiNnpPe6IMgLURfoec+9zQlyEU=
X-Google-Smtp-Source: AGHT+IG5HhSMVcn1nLDLtOfxsytHEqcveQ4MV1aOv60X6+6dklq/C+iAIIstaQcJbkGV6ywa6bgoKQ==
X-Received: by 2002:a05:600c:3554:b0:418:3ad0:742 with SMTP id
 i20-20020a05600c355400b004183ad00742mr1223954wmq.4.1713431141344; 
 Thu, 18 Apr 2024 02:05:41 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 bi11-20020a05600c3d8b00b00418effbc4f7sm557536wmb.38.2024.04.18.02.05.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Apr 2024 02:05:40 -0700 (PDT)
Date: Thu, 18 Apr 2024 10:05:43 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Liuye <liu.yeC@h3c.com>
Message-ID: <20240418090543.GC162404@aspen.lan>
References: <186cdeea58094d06b351b07eefa2189d@h3c.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <186cdeea58094d06b351b07eefa2189d@h3c.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Apr 17, 2024 at 11:01:56AM +0000, Liuye wrote: > >---
 > >V10 -> V11: Revert to V9 > >V9 -> V10 : Add Signed-off-by of Greg KH and
 Andy Shevchenko, Acked > > by of Daniel Thompson > >V8 -> V9: [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.47 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1rxNiP-0000Qy-Sm
Subject: Re: [Kgdb-bugreport] 
 =?utf-8?b?UmXvvJpbUEFUQ0ggVjExXSBrZGI6IEZpeCB0?=
 =?utf-8?q?he_deadlock_issue_in_KDB_debugging=2E?=
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
Cc: "kgdb-bugreport@lists.sourceforge.net"
 <kgdb-bugreport@lists.sourceforge.net>,
 "jason.wessel@windriver.com" <jason.wessel@windriver.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>,
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
 Greg KH <gregkh@linuxfoundation.org>,
 "jirislaby@kernel.org" <jirislaby@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Wed, Apr 17, 2024 at 11:01:56AM +0000, Liuye wrote:
> >---
> >V10 -> V11: Revert to V9
> >V9 -> V10 : Add Signed-off-by of Greg KH and Andy Shevchenko, Acked
> >            by of Daniel Thompson
> >V8 -> V9: Modify call trace format and move irq_work.h before module.h
> >V7 -> V8: Update the description information and comments in the code.
> >	   : Submit this patch based on version linux-6.9-rc2.
> >V6 -> V7: Add comments in the code.
> >V5 -> V6: Replace with a more professional and accurate answer.
> >V4 -> V5: Answer why schedule another work in the irq_work and not do
> >          the job directly.
> >V3 -> V4: Add changelogs
> >V2 -> V3: Add description information
> >V1 -> V2: using irq_work to solve this properly.
> >---
>
> What is the current status of PATCH V11? Are there any additional
> modifications needed?

I understood that is blocked pending outcome of the legal matters
raised by v10...  and that this is why you were asked not to post
v11 until they had been resolved.

To be honest given that [I wrote all of the C code][1] for the most
recent version of the patch and that I'd like to see the bug fixed,
then I will probably have to give up on co-authorship. Instead I can
post my code with a new comment and patch description and credit you
with a Reported-by:. That should take the pressure off in terms of
landing this bug fix.

However, the legal issues do still need to be resolved or there is a
risk that other upstream contributions from your company will be
delayed.


Daniel.


[1]: https://lore.kernel.org/all/20240314130916.GE202685@aspen.lan/


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
