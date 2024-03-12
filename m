Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE2E8791E3
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 12 Mar 2024 11:24:40 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1rjzJH-0005VW-8r
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 12 Mar 2024 10:24:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daniel.thompson@linaro.org>) id 1rjzJF-0005VM-Hs
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 12 Mar 2024 10:24:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pWToFqxwxMP42zLNN1JswkakPz03dZF3hN1TWqvA7VY=; b=HUTniojua2cmtcI86uTudhHMAR
 zK30DS/hbomrf1bd+eKUfTNpkb0qJ7ULVft3aKnp4E9vBxE48GCUFCob5sisMd4JYdQKxlPFAuWRH
 ZoDZJo+ohTuVGaOEa5yLRqltdRbGl7lFvo/jFaE8orN8xU9VlEwrvs2j1k4ICbWGUeQs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pWToFqxwxMP42zLNN1JswkakPz03dZF3hN1TWqvA7VY=; b=jjGJMkl6bJwo9Hi2eGfWRPsW9f
 MF8KAkLUiTDpwAHR1Llrx60bDCW5+IlDHPaACd9Reiumwva3VSb7eM46EsBXgaKX7Zp2usYNYjFSv
 chotPhKFKQA44dmPTu4g/t/IfPIDt/bMgKhXgcM+FYCJFl89vrCqzugoXYqLiekxk9K0=;
Received: from mail-wr1-f46.google.com ([209.85.221.46])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rjzJ5-0004cN-89 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 12 Mar 2024 10:24:37 +0000
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-33e899ce9e3so2097959f8f.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 12 Mar 2024 03:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710239062; x=1710843862; darn=lists.sourceforge.net;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=pWToFqxwxMP42zLNN1JswkakPz03dZF3hN1TWqvA7VY=;
 b=IzSYpaoY2ZeEuYBKM4onteejcW2MljVxv6HBNaWQ2gwz2MuyK71w8BrU7cJKFwCCH5
 JWQ1/xQ96nk4K0UadbZhLtb753ZgdQ8EXG6Y8YAFUC1/xJgTVbj3UxzhSb6jwYwlVI92
 oPvVcLQ/Q2LOzoN1xUhVmrFDpOTeuHB8w+oXZeZq+6Uhjm0e8o1G4g1SLYAByqC5V3m2
 1DX4wnPm80gO3M2WNcppFctGlCjp5UkshwiOnfIifWlMlngq20cf/HrHqb+isNSpRakY
 um8nIE6yvR4Micsse5FlXBEDnJbn5+EdJq0VI9kGXVlIF+ugl+DCUyYDnPJjUtjRBEmq
 0wcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710239062; x=1710843862;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pWToFqxwxMP42zLNN1JswkakPz03dZF3hN1TWqvA7VY=;
 b=ruCJJ7dKHHoUEIO+n5c+jLBTWE9WHr2OtRVCpp2XjcZt6476/xFgMXr3mYpdf+1la2
 9M1Ui0DtbWagAh3DqySY0JuwpYPkX95Ktvpum3qc9oi8yPzwveARSNZ/Gu69r2m9eB+H
 XYzptl+qsV4S3VIds6TmrsbUGnZ7kV6ylJoCBus9gzvNHaNQM2CDd9AykHwEbi0by7hZ
 Xf8R3JmsDClQQsg0fVtGcHPl31CG0D8fzihwaWXCOBtVt0mSPy5ILjQ4zAynI8ac7P1a
 RXmSiBttlCoiCwOMp08aieSg2h+cdcgZ7sU5PctFc9qEJ3q6KkdHqCmwfw91IUSZw+JC
 g/+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/WSOCh6lyoMSr2vLits7NJ0w+wIv6/8YTzR/1ZnSvPDlhP71Jg8lOVZo7wjnLWkosl3aeKZyHtpGYCuP7H+lXRw3HFTmvoIDsrGsb2x/j/fMol98=
X-Gm-Message-State: AOJu0YwCsWx6DsJsAulNGYyGaJ9KIYCAh/dYsV4ro7H1NyIBPTpVQ14T
 tu7Hspw8dUKOE0GvSqzKnSKeKf1c9r8zem3/PdQ3cfWz6cLGFHMz/1eHwa378iY=
X-Google-Smtp-Source: AGHT+IEtPsZ31O/nfjwsFgmU1AR9CggAYhpn6AzzX6lCg3bxmADP9OSMaPt2DsKWyzfXRygCg/rVqA==
X-Received: by 2002:a5d:6882:0:b0:33e:767a:c39f with SMTP id
 h2-20020a5d6882000000b0033e767ac39fmr6499492wru.15.1710239061776; 
 Tue, 12 Mar 2024 03:24:21 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 n2-20020a5d4002000000b0033de2f2a88dsm8586219wrp.103.2024.03.12.03.24.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Mar 2024 03:24:21 -0700 (PDT)
Date: Tue, 12 Mar 2024 10:24:19 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Liuye <liu.yeC@h3c.com>
Message-ID: <20240312102419.GC202685@aspen.lan>
References: <20240228025602.3087748-1-liu.yeC@h3c.com>
 <20240228120516.GA22898@aspen.lan>
 <8b41d34adaef4ddcacde2dd00d4e3541@h3c.com>
 <20240301105931.GB5795@aspen.lan>
 <2ea381e7407a49aaa0b08fa7d4ff62d3@h3c.com>
 <20240312095756.GB202685@aspen.lan>
 <06cfa3459ed848cf8f228997b983cf53@h3c.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <06cfa3459ed848cf8f228997b983cf53@h3c.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Mar 12, 2024 at 10:04:54AM +0000, Liuye wrote: > >On
 Tue, Mar 12, 2024 at 08:37:11AM +0000, Liuye wrote: > >> I know that you
 said schedule_work is not NMI save, which is the first > >> issue. [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.221.46 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.46 listed in wl.mailspike.net]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rjzJ5-0004cN-89
Subject: Re: [Kgdb-bugreport] 
 =?utf-8?b?562U5aSNOiDnrZTlpI06IOetlOWkjTogIFtQ?=
 =?utf-8?q?ATCH=5D_kdb=3A_Fix_the_deadlock_issue_in_KDB_debugging=2E?=
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

On Tue, Mar 12, 2024 at 10:04:54AM +0000, Liuye wrote:
> >On Tue, Mar 12, 2024 at 08:37:11AM +0000, Liuye wrote:
> >> I know that you said schedule_work is not NMI save, which is the first
> >> issue. Perhaps it can be fixed using irq_work_queue. But even if
> >> irq_work_queue is used to implement it, there will still be a deadlock
> >> problem because slave cpu1 still has not released the running queue
> >> lock of master CPU0.
> >
> >This doesn't sound right to me. Why do you think CPU1 won't release
> >the run queue lock?
>
> In this example, CPU1 is waiting for CPU0 to release dbg_slave_lock.

That shouldn't be a problem. CPU0 will have released that lock by
the time the irq work is dispatched.


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
