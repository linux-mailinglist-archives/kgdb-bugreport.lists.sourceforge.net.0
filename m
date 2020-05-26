Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CEF81E26A9
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 26 May 2020 18:16:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jdcFn-0005o0-K7
	for lists+kgdb-bugreport@lfdr.de; Tue, 26 May 2020 16:16:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1jdcFm-0005nt-DB
 for kgdb-bugreport@lists.sourceforge.net; Tue, 26 May 2020 16:16:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QAvGGfTFG25ElrhD3qboczTVRvpcoz4/MxDPrOFLyQc=; b=VX/0NwiPrMRoHHYx3BvgeFwVyG
 rabwX31YeyJL8Pnf4IADrRdoTHKiOp5Hd1JcOD0r7B0VSYbB4/2objgIYSbEw8YDIjF7YtbE22bpP
 7f7q6rJZ4gsc7xYFYrOQZmj1rNwBXIfUov11OJcI4iuuxQ5CHGwVn2LdlKQ3uARjgNEo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QAvGGfTFG25ElrhD3qboczTVRvpcoz4/MxDPrOFLyQc=; b=SHd5xmxqAkzDfN8DtsT2pQ8R9n
 ho8iVwaFkbu6u3OAABInQtGgdewASP68DpF/zgHKOs7021MuUB2aNP5IhqAlkQqWNY0w5mqBb+sSM
 lBvTRgAlFDlWZG8KYHUmpeBK5Gn+OEm/e2pyu0oNnSe/qYYzFy0Pj0T3kWjmfQrVe8Sc=;
Received: from mail-wr1-f42.google.com ([209.85.221.42])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jdcFi-007vyg-1d
 for kgdb-bugreport@lists.sourceforge.net; Tue, 26 May 2020 16:16:34 +0000
Received: by mail-wr1-f42.google.com with SMTP id q11so8841092wrp.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 26 May 2020 09:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=QAvGGfTFG25ElrhD3qboczTVRvpcoz4/MxDPrOFLyQc=;
 b=jUQs/+XrgKVA+BxYtYwJ9+JuBcKfqE7sTotIk1cJwTjNDdph4q8//KIKCWFWJXjuqF
 bNvHT1mXU4vgLFZtgKfBQQ9XcnIDBptu/akIqUTWHm0cOtz2BEJS1ruk4/MNa1eH4klt
 ZuFTkQLr8+q2ITQVc1NPo2IdaUCyWjFec4BlJyZFu2utsBGt4sDUF8vR2Fhu2Czulcg3
 05T0h5z1DCFPvdQ5za1lUYlAooFdl+a+ZXRSnTlenUopOjd9D60o6A+qkKmbBYHacvu7
 pAgh6ITLIy49AYE+6r1dZg7eAuTHLpX0avsd1ygJ2UgVJBrR1haYqXWV9/vSq/g2zOtc
 35YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QAvGGfTFG25ElrhD3qboczTVRvpcoz4/MxDPrOFLyQc=;
 b=Jlq5OzWB/GhUJirtpj9Mc1qhQ7gdBFuf0uCkDXR+pHNdpm1a19hx6HLoYB6qtV9fnd
 tXZhuTG5iXAtW7aeTsIJx3JGmLD9ru6xz908AhWqVGXjDavQ1VwS6pDQeAtlnkL5j3JY
 /EJA96XLanHhVxzn8QUktuXV2VXpxqXT1cN7jjiqh1aMM+ighhErEmlutC0MJcpeMPxo
 E+KY7gks4vuEoSlqrL/e/pBoGYXKSZxkDTWyf1GiG+aVW2ZgBUy5zZaPAIHS3z1dXL5f
 K6sRDiGSWiNmbVLVTJDQVRPmiWyuFQL0LSEI/jQ3aCxHbujdklUMwMGAafw1xLNlO8rQ
 UC/g==
X-Gm-Message-State: AOAM533Hur22JoYBBw++DAhSwmYqR3KLMYwNHUawgtCX+jnjPUHp8hjw
 GkQbW9xh1gx+Kk/s37StVIGjjQ==
X-Google-Smtp-Source: ABdhPJw+Wg0GW1oC/oNFNRUHFRzDIfJRTiTYdwrWZ2pGrP6gCaf6ehHa7I8kx27W+5CJXurje+VdMQ==
X-Received: by 2002:a5d:5585:: with SMTP id i5mr17353654wrv.112.1590509783661; 
 Tue, 26 May 2020 09:16:23 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id q13sm268377wrn.84.2020.05.26.09.16.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2020 09:16:22 -0700 (PDT)
Date: Tue, 26 May 2020 17:16:21 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Peter Zijlstra <peterz@infradead.org>
Message-ID: <20200526161621.7ucj5jn6rm5yednb@holly.lan>
References: <20200525083605.GB317569@hirez.programming.kicks-ass.net>
 <20200525091832.GE325303@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200525091832.GE325303@hirez.programming.kicks-ass.net>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.42 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.42 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jdcFi-007vyg-1d
Subject: Re: [Kgdb-bugreport] x86/entry vs kgdb
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
Cc: pmladek@suse.com, kgdb-bugreport@lists.sourceforge.net, x86@kernel.org,
 linux-kernel@vger.kernel.org, sergey.senozhatsky@gmail.com,
 jason.wessel@windriver.com, will@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Mon, May 25, 2020 at 11:18:32AM +0200, Peter Zijlstra wrote:
> On Mon, May 25, 2020 at 10:36:05AM +0200, Peter Zijlstra wrote:
> > Hi!
> > 
> > Since you seem to care about kgdb, I figured you might want to fix this
> > before I mark it broken on x86 (we've been considering doing that for a
> > while).
> > 
> > AFAICT the whole debugreg usage of kgdb-x86_64 is completely hosed; it
> > doesn't respsect the normal exclusion zones as per arch_build_bp_info().
> > 
> > That is, breakpoints must never be in:
> > 
> >   - in the cpu_entry_area
> >   - in .entry.text
> >   - in .noinstr.text
> >   - in anything else marked NOKPROBE
> > 
> > by not respecting these constraints it is trivial to completely and
> > utterly hose the machine. The entry rework that is current underway will
> > explicitly not deal with #DB triggering in any of those places.
> 
> This also very much includes single stepping those bits.  Which KGDB
> obviously also does not respects.

For breakpoints there's already a pre-poke validation hook that
architectures can override if they want to. I can modify the default
implementation to include checking the nokprobe list.

Stepping is a bit more complex. There are hooks for some of the
underlying work but not pre-step validation hook. I'll see if we can add
one.


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
