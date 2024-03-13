Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD2887A95B
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 13 Mar 2024 15:18:11 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1rkPQn-0001V0-Iz
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 13 Mar 2024 14:18:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daniel.thompson@linaro.org>) id 1rkPQl-0001Ur-Cj
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 13 Mar 2024 14:18:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DI5UQKmJ6ci320U8du68tPIQjhz0EADiePzyf3FHvw4=; b=ioAXnAGbzGMVLDz+s9Z74ZfyHL
 gvXiG26tuRxBTKPzNc8KyHjXLNBsdf4FSyMexP9pIAMDNbzJdjcP0JGrped1ivVSPdw6QnWTZzpIg
 fJ0nNTEPtQ4EZi6o1MpCdsx7huetxKLWVs+wR6LLd7aNChjQezfOL4M6q8whZNOHCRDc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DI5UQKmJ6ci320U8du68tPIQjhz0EADiePzyf3FHvw4=; b=JgSH+V/I8bY+CtEifkC/ao4StD
 UfgYnEwuJUueRBfuM+FOuEvLoF+6YlPEV+qnjMxIACs7zBhjz7xfQr2SW61Q76DQjObDDx6sZcdwz
 XMaMkhO5ExUChYlPey1sR+1MhCuwCXdENG8qwPIk4siv1y0nHEKkXEf50t1U6GACFRHA=;
Received: from mail-lf1-f45.google.com ([209.85.167.45])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rkPQX-0007Ce-Ji for kgdb-bugreport@lists.sourceforge.net;
 Wed, 13 Mar 2024 14:18:07 +0000
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-512bde3d197so5777267e87.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 13 Mar 2024 07:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710339468; x=1710944268; darn=lists.sourceforge.net;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=DI5UQKmJ6ci320U8du68tPIQjhz0EADiePzyf3FHvw4=;
 b=iDjWw6idY97gw8tXFYtPXOvT5TIGcAJox/ZbqdNcrMIlOTcsz25sQD1XQztADtUk5b
 fBo00G8QsFdUIXoreDYX/+zEnsgbU6HqSFTUYZnI/mEMnjnOaaKPodpnE8VLsqMutBRX
 gut/Mya9Z38ZDxjzpljuCHUgk9wCDA770Th3yICyDSyysUf5z8RMy6ZKBkBSEtpUiBv+
 JA2rfV5oL1RRc52PedCOkZWwX2AeDPYE/2kexN3yZ67ozjv+9W2dAAKl1kEtanMDL7wJ
 jhSpvBYwQxcSG/9lD8UoUGUgySqwZgU68R4qDruEgz18rHik4/TGEYu3XvdZoHrSoqc6
 fgVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710339468; x=1710944268;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DI5UQKmJ6ci320U8du68tPIQjhz0EADiePzyf3FHvw4=;
 b=vEH+EE23/5CP8+RJ+Hh2h2pYEwb7ALUq4EQ/ApC3ILLM6IB4AkPsc9Jchb8qN+X0wK
 aQ6sKVbDh4DyyYw3LIug7GZYhY4c/VJT3JuOFV3gMjgr9DdoKLtEB/a7XTEBKsmzDA70
 QIpGAlAEF5loiAHcFsnfTgSEZIU44QcoKlhIp7RrmMPs2Mi8rGkHu++Cius7PG6RSofn
 vaLdaFeszPps77flUHn+m2MOchGi/5Q5lNjiARbblNzXQefcO8R8YLNV/lEYa1OZbK7r
 hsVb8AX/24KLtWxEQlIe/J3/KFe/4E9IoIp/0JoBqRuITpKP6nsCnBhAIAqZG5mzJcHc
 xXPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfey48ph2UL7OtcBhvYjF+L+dVWjplJaCwSLuZ8E0zsCVaY8jqP1Y1UgI/krOZhnwRtYI+hQWnwlVKxfuZdc5jY9Xx4f89W86kKsPI7WzOZ2tt7nw=
X-Gm-Message-State: AOJu0YwKFAlNrLQulLoJryku7RvpW4sCJRbUqnRvTQhAxG+37s3QTa51
 K4J6ZEKhryXMMu6BGIqSF3jVY5FPXopER0Jy5ugme6bKRwN0+43GhrSPErOzHqQ=
X-Google-Smtp-Source: AGHT+IFx+Ru8HLmNgnvlGtS2WaPtuNHppwpho5k+Bj3WbKN3ZgQ4vuHCgkqhvKsxNRYrcFFpxU5muw==
X-Received: by 2002:a05:6512:3baa:b0:513:b102:7d93 with SMTP id
 g42-20020a0565123baa00b00513b1027d93mr7524047lfv.24.1710339467939; 
 Wed, 13 Mar 2024 07:17:47 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 v11-20020a05600c444b00b00412f016a151sm2492507wmn.9.2024.03.13.07.17.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Mar 2024 07:17:47 -0700 (PDT)
Date: Wed, 13 Mar 2024 14:17:45 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Liuye <liu.yeC@h3c.com>
Message-ID: <20240313141745.GD202685@aspen.lan>
References: <20240228025602.3087748-1-liu.yeC@h3c.com>
 <20240228120516.GA22898@aspen.lan>
 <8b41d34adaef4ddcacde2dd00d4e3541@h3c.com>
 <20240301105931.GB5795@aspen.lan>
 <2ea381e7407a49aaa0b08fa7d4ff62d3@h3c.com>
 <20240312095756.GB202685@aspen.lan>
 <06cfa3459ed848cf8f228997b983cf53@h3c.com>
 <20240312102419.GC202685@aspen.lan>
 <410a443612e8441cb729c640a0d606c6@h3c.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <410a443612e8441cb729c640a0d606c6@h3c.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Mar 13, 2024 at 01:22:17AM +0000, Liuye wrote: > >On
 Tue, Mar 12, 2024 at 10:04:54AM +0000, Liuye wrote: > >> >On Tue, Mar 12,
 2024 at 08:37:11AM +0000, Liuye wrote: > >> >> I know that you sa [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.45 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.167.45 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rkPQX-0007Ce-Ji
Subject: Re: [Kgdb-bugreport] 
 =?utf-8?b?562U5aSNOiDnrZTlpI06IOetlOWkjTog562U?=
 =?utf-8?q?=E5=A4=8D=3A_=5BPATCH=5D_kdb=3A_Fix_the_deadlock_issue_in_KDB_d?=
 =?utf-8?q?ebugging=2E?=
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

On Wed, Mar 13, 2024 at 01:22:17AM +0000, Liuye wrote:
> >On Tue, Mar 12, 2024 at 10:04:54AM +0000, Liuye wrote:
> >> >On Tue, Mar 12, 2024 at 08:37:11AM +0000, Liuye wrote:
> >> >> I know that you said schedule_work is not NMI save, which is the
> >> >> first issue. Perhaps it can be fixed using irq_work_queue. But
> >> >> even if irq_work_queue is used to implement it, there will still
> >> >> be a deadlock problem because slave cpu1 still has not released
> >> >> the running queue lock of master CPU0.
> >> >
> >> >This doesn't sound right to me. Why do you think CPU1 won't
> >> >release the run queue lock?
> >>
> >> In this example, CPU1 is waiting for CPU0 to release
> >> dbg_slave_lock.
> >
> >That shouldn't be a problem. CPU0 will have released that lock by the
> >time the irq work is dispatched.
>
> Release dbg_slave_lock in CPU0. Before that, shcedule_work needs to be
> handled, and we are back to the previous issue.

Sorry but I still don't understand what problem you think can happen
here. What is wrong with calling schedule_work() from the IRQ work
handler?

Both irq_work_queue() and schedule_work() are calls to queue deferred
work. It does not matter when the work is queued (providing we are lock
safe). What matters is when the work is actually executed.

Please can you describe the problem you think exists based on when the
work is executed.


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
