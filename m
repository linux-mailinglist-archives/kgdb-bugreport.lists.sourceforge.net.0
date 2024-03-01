Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8093286E0C3
	for <lists+kgdb-bugreport@lfdr.de>; Fri,  1 Mar 2024 12:56:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1rg1V5-0006Fv-Dq
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 01 Mar 2024 11:56:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daniel.thompson@linaro.org>) id 1rg1V4-0006Fm-A7
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 01 Mar 2024 11:56:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=heDjbeIBikVTGhhOlss+48ysC6wtU2DLudUIpsZswWE=; b=HvuAEGcO3MRIKW2cPWAH3fQE5e
 nqe3rKJeGskL6PUNiyd5Jcc90MG+y138DxZMq6s7CwFO/Qum/bBXSNPfSUa7/1p0RZe+S//15N/vg
 9kosbBC4ZqH4Sp4OtcATYm6pxg1IMWmQ8c1j68DWeIpTcxscD1obxfC3Rtx3ZDgZMcRQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=heDjbeIBikVTGhhOlss+48ysC6wtU2DLudUIpsZswWE=; b=m8xH03Zw+jKnO7eQJotPoZiBqJ
 qObYPlWW0HTH4zQP0exhQLDt4S9MNiGavAcmZevWRh8ZbcuIyS3TsNocvpd2WQnkmkIAzKJJPg68C
 uMUW58kkNW03mGlq/1Ku/d/8N+uzKzPxGbO8JxR2/bG9O1mC/VIrvYKB3UBmDSocGxjQ=;
Received: from mail-pl1-f182.google.com ([209.85.214.182])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rg1V3-0007vu-GL for kgdb-bugreport@lists.sourceforge.net;
 Fri, 01 Mar 2024 11:56:26 +0000
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-1d94b222a3aso21056005ad.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 01 Mar 2024 03:56:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709294175; x=1709898975; darn=lists.sourceforge.net;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=heDjbeIBikVTGhhOlss+48ysC6wtU2DLudUIpsZswWE=;
 b=St7gYi/FXhFXhR6g0pEGgZW7J7ngevWgnVhdNbgEd5ossbPGkSloNMQ6KLo6w3A/4r
 /a/P87AmU7FciwLdCbjWcOWwEm3fTwo5Faj/3oYSsNUu2xk0gHJhy0aTj4VJ7FOQl/Xs
 0gEYiJxRmD3pJK7YPITcgJcFEEw5apQYMDVFS42AhhqI3ZCzT0NGe5wY6i28XqRfcb3a
 LLZbQsunQy4KXxOlkHKTJYucOTqw4WfodZm5jQVgPhnHBSvpLh1amHteMAw4G9VY7YWt
 w/ZQI3i1G4k6EMJn5gWwT8I13M6G0AJv0pUxv2e5ZkgWOa7IeRMeJjB9TYtZbMyOGu/v
 hAbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709294175; x=1709898975;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=heDjbeIBikVTGhhOlss+48ysC6wtU2DLudUIpsZswWE=;
 b=PbD6D22QelN4sAo3Yrr0dheRsuTktHT6+NhO+W8ekLEFZvcyCeNutQ7ERsAvR/Hnjc
 sh8soEz2S8a0RqC3SkGWHvAwqqJyhWojKBaH4YtG58+WO/m/U1QJmgiz7jaMjqYVTzNB
 CnIQIT5S9xoL21xsBWtxuBprENcM+bxfnaGvOjIzq5X6o4l5my1aqZtcWXmtz6jRPZcx
 JmrMNKUZr/ileJrsJayUkiIJL1X0PrAjNm8XtMuVXZOycTSV8tTxx30quDYQ76FQrFkM
 xWUzb3cCunsTvt469IDpTo9sEHvwJPIjKuON1E5TF7M/HeagIVs9FF25NJtukThQL/Pd
 bIfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqt8+wD4MPkbfQRDnTKnd+nA1CbaUEnhaxRPhy2hkqL+rxwdkZoo96GA1wjckaNYxiX7ec7PZoxuKajyKoN8IOTFY9LzJo8P0qySALCKSpS0LLsSg=
X-Gm-Message-State: AOJu0YwiUrMhNJ2u6I7jcJxMvaPoO+977lgw+PRyMZIusrRlLAUyg1/M
 pi6xHxWExrl2Tbp2jGFb1/3+v+ZY4KYwQn56mKnJL+dxaAnY7lrQJuWm59rbtrdRHVw5b7kQHj4
 LLbg=
X-Google-Smtp-Source: AGHT+IHN3RFUf4xIhE9BdFUrbXg7sIULyHbJcthR9TCMfAkix2nb9xh72THwDt/a538zlyKC5tWoUg==
X-Received: by 2002:a0c:fdec:0:b0:68f:3f98:f695 with SMTP id
 m12-20020a0cfdec000000b0068f3f98f695mr1269673qvu.39.1709290776130; 
 Fri, 01 Mar 2024 02:59:36 -0800 (PST)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 qm14-20020a056214568e00b0068f92234e2fsm1710852qvb.109.2024.03.01.02.59.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Mar 2024 02:59:35 -0800 (PST)
Date: Fri, 1 Mar 2024 10:59:31 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Liuye <liu.yeC@h3c.com>
Message-ID: <20240301105931.GB5795@aspen.lan>
References: <20240228025602.3087748-1-liu.yeC@h3c.com>
 <20240228120516.GA22898@aspen.lan>
 <8b41d34adaef4ddcacde2dd00d4e3541@h3c.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8b41d34adaef4ddcacde2dd00d4e3541@h3c.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Mar 01, 2024 at 03:30:25AM +0000, Liuye wrote: > >On
 Wed, Feb 28, 2024 at 10:56:02AM +0800, LiuYe wrote: > >> master cpu : After
 executing the go command, a deadlock occurs. > >> slave cpu: ma [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.182 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.182 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1rg1V3-0007vu-GL
Subject: Re: [Kgdb-bugreport] 
 =?utf-8?b?562U5aSNOiBbUEFUQ0hdIGtkYjogRml4IHRo?=
 =?utf-8?q?e_deadlock_issue_in_KDB_debugging=2E?=
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
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "jirislaby@kernel.org" <jirislaby@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Fri, Mar 01, 2024 at 03:30:25AM +0000, Liuye wrote:
> >On Wed, Feb 28, 2024 at 10:56:02AM +0800, LiuYe wrote:
> >> master cpu : After executing the go command, a deadlock occurs.
> >> slave cpu: may be performing thread migration, acquiring the
> >> running queue lock of master CPU.  Then it was interrupted by kdb
> >> NMI and entered the nmi_handler process.  (nmi_handle->
> >> kgdb_nmicallback-> kgdb_cpu_enter while(1){ touch wathcdog}.)
> >
> >I think this description is a little short and doesn't clearly
> >explain the cause. How about:
> >
> >Currently, if kgdboc includes 'kdb', then kgdboc will attempt to use
> >schedule_work() to provoke a keyboard reset when transitioning out of
> >the debugger and back to normal operation. This can cause deadlock
> >because schedule_work() is not NMI-safe.
> >
> >The stack trace below shows an example of the problem. In this case
> >the master cpu is not running from NMI but it has parked the slace
> >CPUs using an NMI and the parked CPUs is holding spinlocks needed by
> >schedule_work().
>
> Due to the brevity of the description, there may be some
> misunderstanding, so a detailed description is provided as follows:

So, there is a small mistake in the example description I provided.
After double checking the code it should start slightly differently:
  "Currently, if CONFIG_KDB_KEYBOARD is enabled, then kgdboc will
  attempt to use schedule_work() ...".

However other than that I think it is correct.

The important bit of feedback here is that the patch description should
commence with a description of the bug rather than a description of the
symptom. In this case the bug is kgdboc calls a function that is not
safe to call from this calling context.

It is really useful to describe the symptom as part of the patch
description. However if we focus on the symptom without additional
code review then we can end up with the wrong fix. That is what
happened here. It is unsafe to call schedule_work() and checking
the runqueue locks is insufficient to make it safe because we are
still calling a function from an inappropriate calling context..


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
